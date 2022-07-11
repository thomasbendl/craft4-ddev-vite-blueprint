import barba from "@barba/core";

import confetti from "canvas-confetti/src/confetti";

import { gsap } from "gsap";

import "../sass/main.scss";

barba.init({
	debug: true,
	transitions: [
		{
			name: "default-transition",
			once() {},
			leave(data) {},
			enter(data) {},
		},
		{
			name: "to-ready",
			to: {
				namespace: ["ready"],
			},

			leave: (data) => {
				return new Promise((resolve) => {
					gsap.to(data.current.container, {
						xPercent: -100,
						duration: 0.3,
						force3D: true,
						ease: "power2.out",
						onComplete: () => {
							resolve();
						},
					});
				});
			},

			enter: (data) => {
				return new Promise((resolve) => {
					gsap.set(data.next.container, { xPercent: 100 });
					gsap.to(data.next.container, {
						xPercent: 0,
						duration: 0.3,
						ease: "power2.out",
						force3D: true,
						onComplete: () => {
							resolve();
						},
					});
				});
			},
		},

		{
			name: "to-home",
			to: {},
			leave: (data) => {
				return new Promise((resolve) => {
					gsap.to(data.current.container, {
						xPercent: 100,
						duration: 0.3,
						force3D: true,
						ease: "power2.out",
						onComplete: () => {
							resolve();
						},
					});
				});
			},

			enter: (data) => {
				return new Promise((resolve) => {
					gsap.set(data.next.container, { xPercent: -100 });
					gsap.to(data.next.container, {
						xPercent: 0,
						duration: 0.3,
						ease: "power2.out",
						force3D: true,
						onComplete: () => {
							resolve();
						},
					});
				});
			},
		},
	],
});

barba.hooks.once((data) => {
	console.log(data.next.namespace);
	if (data.next.namespace == "home") {
		initConfetti();
	}
	gsap.set(".animate", {
		scale: 2.6,
		opacity: 0,
		force3D: false,
	});
	gsap.to(".animate", {
		opacity: 1,
		delay: 0.5,
		duration: 0.7,
		scale: 1,
		force3D: false,
		ease: "bounce.out",
	});
});

barba.hooks.enter((data) => {});

function initConfetti() {
	setTimeout(() => {
		var duration = 15 * 1000;
		var animationEnd = Date.now() + duration;
		var defaults = { startVelocity: 30, spread: 360, ticks: 60, zIndex: 0 };

		function randomInRange(min, max) {
			return Math.random() * (max - min) + min;
		}

		var interval = setInterval(function () {
			var timeLeft = animationEnd - Date.now();

			if (timeLeft <= 0) {
				return clearInterval(interval);
			}

			var particleCount = 50 * (timeLeft / duration);
			// since particles fall down, start a bit higher than random
			confetti(
				Object.assign({}, defaults, {
					particleCount,
					origin: {
						x: randomInRange(0.1, 0.3),
						y: Math.random() - 0.2,
					},
				})
			);
			confetti(
				Object.assign({}, defaults, {
					particleCount,
					origin: {
						x: randomInRange(0.7, 0.9),
						y: Math.random() - 0.2,
					},
				})
			);
		}, 250);
	}, 1000);
}
