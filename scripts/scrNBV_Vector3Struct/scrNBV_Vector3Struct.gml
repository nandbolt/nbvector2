/// @func   Vector3(x, y, z);
/// @param {Real} x
/// @param {Real} y
/// @param {Real} z
/// @desc A 3-dimensional vector.
function Vector3(_x=0, _y=0, _z=0) : Vector2(_x, _y) constructor
{
    z = _z;
    
    #region Setters
    
    /// @func   set(x, y, z);
    /// @param {Real} x
    /// @param {Real} y
    /// @param {Real} z
    /// @desc Sets the vector's coordinates.
    static set = function(_x, _y, _z)
    {
        x = _x;
        y = _y;
        z = _z;
    }

    /// @func   set_vector(v);
    /// @param {Struct.Vector3} v
    /// @desc Sets the vector's coordinates.
    static set_vector = function(_v)
    {
        x = _v.x;
        y = _v.y;
        z = _v.z;
    }
    
    /// @func   set_scaled(x, y, z, factor);
    /// @param {Real} x
    /// @param {Real} y
    /// @param {Real} z
    /// @param {Real} factor
    /// @desc Sets and scales the vector.
    static set_scaled = function(_x, _y, _z, _factor=1)
    {
        x = _x * _factor;
        y = _y * _factor;
        z = _z * _factor;
    }

    /// @func   set_scaled_vector(v, factor);
    /// @param {Struct.Vector3} v
    /// @param {Real} factor
    /// @desc Sets and scales the vector.
    static set_scaled_vector = function(_v, _factor=1)
    {
        x = _v.x * _factor;
        y = _v.y * _factor;
        z = _v.z * _factor;
    }
    
    /// @func   set_from_lerp(x1, y1, z1, x2, y2, z2, amount);
    /// @param {Real} x1
    /// @param {Real} y1
    /// @param {Real} z1
    /// @param {Real} x2
    /// @param {Real} y2
    /// @param {Real} z2
    /// @param {Real} amount
    /// @desc Sets the vector based on a lerp between two given vectors.
    static set_from_lerp = function(_x1, _y1, _z1, _x2, _y2, _z2, _amount)
    {
        x = lerp(_x1, _x2, _amount);
        y = lerp(_y1, _y2, _amount);
        z = lerp(_z1, _z2, _amount);
    }

    /// @func   set_from_lerp_vector(v1, v2, amount);
    /// @param {Struct.Vector3} v1
    /// @param {Struct.Vector3} v2
    /// @param {Real} amount
    /// @desc Sets the vector based on a lerp between two given vectors.
    static set_from_lerp_vector = function(_v1, _v2, _amount)
    {
        x = lerp(_v1.x, _v2.x, _amount);
        y = lerp(_v1.y, _v2.y, _amount);
        z = lerp(_v1.z, _v2.z, _amount);
    }
    
    #endregion
    
    #region Properties
    
    // Returns properties of the vector that need to be calculated.
    
    /// @func   magnitude();
    /// @desc Returns the length of the vector.
    static magnitude = function()
    {
        return sqrt(x * x + y * y + z * z);
    }
    
    /// @func   magnitude_squared();
    /// @desc Returns the squared length of the vector.
    static magnitude_squared = function()
    {
        return x * x + y * y + z * z;
    }
    
    /// @func   is_zero();
    /// @desc Returns if its a zero vector.
    static is_zero = function()
    {
        return x == 0 && y == 0 && z == 0;
    }
    
    /// @func   is_unit();
    /// @desc Returns if its a unit vector.
    static is_unit = function()
    {
        return magnitude() == 1;
    }
    
    /// @func   equals(x, y, z);
    /// @param {Real} x
    /// @param {Real} y
    /// @param {Real} z
    /// @desc Returns if the vectors are equal.
    static equals = function(_x, _y, _z)
    {
        return x == _x && y == _y && z == _z;
    }

    /// @func   equals_vector(v);
    /// @param {Struct.Vector3} v
    /// @desc Returns if the vectors are equal.
    static equals_vector = function(_v)
    {
        return x == _v.x && y == _v.y && z == _v.z;
    }

    /// @func   copy();
    /// @desc Returns a copy of the vector.
    static copy = function()
    {
        return new Vector3(x, y, z);
    }

    /// @func   toString();
    /// @desc Returns the string representation.
    static toString = function()
    {
        return $"({x},{y},{z})";
    }
    
    #endregion
    
    #region Applied Operations
    
    // Applies operations to the vector
    
    /// @func   invert();
    /// @desc Flips the vector.
    static invert = function()
    {
        x = -x;
        y = -y;
        z = -z;
    }
    
    /// @func   scale(factor);
    /// @param {Real} factor
    /// @desc Grows or shrinks the vector.
    static scale = function(_factor)
    {
        x *= _factor;
        y *= _factor;
        z *= _factor;
    }
    
    /// @func   normalize();
    /// @desc Sets the vector's length to one, or keeps it zero.
    static normalize = function()
    {
        var _len = magnitude();
        if (_len > 0)
        {
            scale(1 / _len);
        }
    }
    
    /// @func   add(x, y, z);
    /// @param {Real} x
    /// @param {Real} y
    /// @param {Real} z
    /// @desc Adds to the vector.
    static add = function(_x, _y, _z)
    {
        x += _x;
        y += _y;
        z += _z;
    }

    /// @func   add_vector(v);
    /// @param {Struct.Vector3} v
    /// @desc Adds to the vector.
    static add_vector = function(_v)
    {
        x += _v.x;
        y += _v.y;
        z += _v.z;
    }
    
    /// @func   add_scaled(x, y, z, factor);
    /// @param {Real} x
    /// @param {Real} y
    /// @param {Real} z
    /// @param {Real} factor
    /// @desc Adds to the vector, but scales the input first.
    static add_scaled = function(_x, _y, _z, _factor=1)
    {
        x += _x * _factor;
        y += _y * _factor;
        z += _z * _factor;
    }

    /// @func   add_scaled_vector(v, factor);
    /// @param {Struct.Vector3} v
    /// @param {Real} factor
    /// @desc Adds to the vector, but scales the input first.
    static add_scaled_vector = function(_v, _factor=1)
    {
        x += _v.x * _factor;
        y += _v.y * _factor;
        z += _v.z * _factor;
    }
    
    /// @func   multiply_components(x, y, z);
    /// @param {Real} x
    /// @param {Real} y
    /// @param {Real} z
    /// @desc Multiplies the vector's components by the inputs.
    static multiply_components = function(_x, _y, _z)
    {
        x *= _x;
        y *= _y;
        z *= _z;
    }

    /// @func   multiply_components_vector(v);
    /// @param {Struct.Vector3} v
    /// @desc Multiplies the vector's components by the inputs.
    static multiply_components_vector = function(_v)
    {
        x *= _v.x;
        y *= _v.y;
        z *= _v.z;
    }
    
    /// @func   lerp_to(x, y, z, amount);
    /// @param {Real} x
    /// @param {Real} y
    /// @param {Real} z
    /// @param {Real} amount
    /// @desc Lerps to the other vector.
    static lerp_to = function(_x, _y, _z, _amount)
    {
        x = lerp(x, _x, _amount);
        y = lerp(y, _y, _amount);
        z = lerp(z, _z, _amount);
    }

    /// @func   set_from_lerp_vector(v, amount);
    /// @param {Struct.Vector3} v
    /// @param {Real} amount
    /// @desc Lerps to the other vector.
    static lerp_to_vector = function(_v, _amount)
    {
        x = lerp(x, _v.x, _amount);
        y = lerp(y, _v.y, _amount);
        z = lerp(z, _v.z, _amount);
    }
    
    #endregion
    
    #region Output Operations
    
    // Returns a value after the operation and usually doesn't affect the vector.
    
    /// @func   get_component_product(x, y, z);
    /// @param {Real} x
    /// @param {Real} y
    /// @param {Real} z
    /// @desc Returns a vector that is the component multiplication between the vectors.
    static get_component_product = function(_x, _y, _z)
    {
        return new Vector3(x * _x, y * _y, z * _z);
    }
    
    /// @func   get_component_product_vector(v);
    /// @param {Struct.Vector3} v
    /// @desc Returns a vector that is the component multiplication between the vectors.
    static get_component_product_vector = function(_v)
    {
        return new Vector3(x * _v.x, y * _v.y, z * _v.z);
    }
    
    /// @func   get_dot_product(x, y);
    /// @param {Real} x
    /// @param {Real} y
    /// @desc Returns the dot product between two vectors.
    static get_dot_product = function(_x, _y, _z)
    {
        return dot_product_3d(x, y, z, _x, _y, _z);
    }
    
    /// @func   get_dot_product_vector(v);
    /// @param {Struct.Vector3} v
    /// @desc Returns the dot product between two vectors.
    static get_dot_product_vector = function(_v)
    {
        return dot_product_3d(x, y, z, _v.x, _v.y, _v.z);
    }
    
    /// @func   get_scaled(factor);
    /// @param {Real} factor
    /// @desc Returns a scaled version of the vector.
    static get_scaled = function(_factor)
    {
        return new Vector3(x * _factor, y * _factor, z * _factor);
    }
    
    /// @func   get_sum(x, y, z);
    /// @param {Real} x
    /// @param {Real} y
    /// @param {Real} z
    /// @desc Returns a summation vector.
    static get_sum = function(_x, _y, _z)
    {
        return new Vector3(x + _x, y + _y, z + _z);
    }
    
    /// @func   get_sum_vector(v);
    /// @param {Struct.Vector3} v
    /// @desc Returns a summation vector.
    static get_sum_vector = function(_v)
    {
        return new Vector3(x + _v.x, y + _v.y, z + _v.z);
    }
    
    /// @func   get_is_perpendicular(x, y, z);
    /// @param {Real} x
    /// @param {Real} y
    /// @param {Real} z
    /// @desc Returns if the vectors are perpendicular.
    static get_is_perpendicular = function(_x, _y, _z)
    {
        return get_dot_product(_x, _y, _z) == 0;
    }
    
    /// @func   get_is_perpendicular_vector(v);
    /// @param {Struct.Vector3} v
    /// @desc Returns if the vectors are perpendicular.
    static get_is_perpendicular_vector = function(_v)
    {
        return get_dot_product(_v.x, _v.y, _v.z) == 0;
    }
    
    /// @func   get_is_acute(x, y, z);
    /// @param {Real} x
    /// @param {Real} y
    /// @param {Real} z
    /// @desc Returns if the vectors are acute.
    static get_is_acute = function(_x, _y, _z)
    {
        return get_dot_product(_x, _y, _z) > 0;
    }
    
    /// @func   get_is_acute_vector(v);
    /// @param {Struct.Vector3} v
    /// @desc Returns if the vectors are acute.
    static get_is_acute_vector = function(_v)
    {
        return get_dot_product(_v.x, _v.y, _v.z) > 0;
    }
    
    /// @func   get_is_obtuse(x, y, z);
    /// @param {Real} x
    /// @param {Real} y
    /// @param {Real} z
    /// @desc Returns if the vectors are obtuse.
    static get_is_obtuse = function(_x, _y, _z)
    {
        return get_dot_product(_x, _y, _z) < 0;
    }
    
    /// @func   get_is_obtuse_vector(v);
    /// @param {Struct.Vector3} v
    /// @desc Returns if the vectors are obtuse.
    static get_is_obtuse_vector = function(_v)
    {
        return get_dot_product(_v.x, _v.y, _v.z) < 0;
    }
    
    #endregion
}