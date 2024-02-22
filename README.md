<div align="center">
<img src="https://github.com/ChifiSource/image_dump/blob/main/rollingarrays/rollingarrays.png"></img>
  <h6>Set length dropping arrays for julia.</h6>
</div>

---
`RollingArrays` provides Julia with declarative set-length array types. These are a wrapper for a regular one-dimensional `Vector` which drops the first index once it reaches a maximum length. This type of `Array` has numerous applications when it comes to aggregating data; an example use-case would be storing a certain number of values on the clipboard in an application.
