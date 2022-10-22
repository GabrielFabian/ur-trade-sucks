(function webpackUniversalModuleDefinition(root, factory) {
	if(typeof exports === 'object' && typeof module === 'object')
		module.exports = factory();
	else if(typeof define === 'function' && define.amd)
		define([], factory);
	else {
		var a = factory();
		for(var i in a) (typeof exports === 'object' ? exports : root)[i] = a[i];
	}
})(global, () => {
return /******/ (() => { // webpackBootstrap
/******/ 	"use strict";
var __webpack_exports__ = {};
// This entry need to be wrapped in an IIFE because it uses a non-standard name for the exports (exports).
(() => {
var exports = __webpack_exports__;

Object.defineProperty(exports, "__esModule", ({ value: true }));
exports.fooHandler = void 0;
const fooHandler = (event) => {
    if ('Records' in event) {
        const records = event.Records;
    }
    else {
        const { id, version, region, source } = event;
    }
};
exports.fooHandler = fooHandler;

})();

/******/ 	return __webpack_exports__;
/******/ })()
;
});