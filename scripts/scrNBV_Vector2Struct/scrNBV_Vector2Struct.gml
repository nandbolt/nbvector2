/// @func   Vector2(x, y);
/// @param {Real} x
/// @param {Real} y
/// @desc A 2-dimensional vector.
function Vector2(_x=0, _y=0) constructor
{
    x = _x;
    y = _y;
    
    #region Setters
    
    /// @func   set(x, y);
    /// @param {Real} x
    /// @param {Real} y
    /// @desc Sets the vector's coordinates.
    static set = function(_x, _y)
    {
        x = _x;
        y = _y;
    }

    /// @func   set_vector(v);
    /// @param {Struct.Vector2} v
    /// @desc Sets the vector's coordinates.
    static set_vector = function(_v)
    {
        x = _v.x;
        y = _v.y;
    }
    
    /// @func   set_scaled(x, y, factor);
    /// @param {Real} x
    /// @param {Real} y
    /// @param {Real} factor
    /// @desc Sets and scales the vector.
    static set_scaled = function(_x, _y, _factor=1)
    {
        x = _x * _factor;
        y = _y * _factor;
    }

    /// @func   set_scaled_vector(v, factor);
    /// @param {Struct.Vector2} v
    /// @param {Real} factor
    /// @desc Sets and scales the vector.
    static set_scaled_vector = function(_v, _factor=1)
    {
        x = _v.x * _factor;
        y = _v.y * _factor;
    }
    
    /// @func   set_angle_degrees(angle);
    /// @param {Real} angle The angle (degrees)
    /// @desc Sets the vector based on the angle. It becomes a unit vector if previously a zero vector.
    static set_angle_degrees = function(_angle)
    {
        var _len = magnitude();
        if (_len == 0)
        {
            _len = 1;
        }
        
        x = lengthdir_x(_len, _angle);
        y = lengthdir_y(_len, _angle);
    }
    
    /// @func   set_from_lerp(x1, y1, x2, y2, amount);
    /// @param {Real} x1
    /// @param {Real} y1
    /// @param {Real} x2
    /// @param {Real} y2
    /// @param {Real} amount
    /// @desc Sets the vector based on a lerp between two given vectors.
    static set_from_lerp = function(_x1, _y1, _x2, _y2, _amount)
    {
        x = lerp(_x1, _x2, _amount);
        y = lerp(_y1, _y2, _amount);
    }

    /// @func   set_from_lerp_vector(v1, v2, amount);
    /// @param {Struct.Vector2} v1
    /// @param {Struct.Vector2} v2
    /// @param {Real} amount
    /// @desc Sets the vector based on a lerp between two given vectors.
    static set_from_lerp_vector = function(_v1, _v2, _amount)
    {
        x = lerp(_v1.x, _v2.x, _amount);
        y = lerp(_v1.y, _v2.y, _amount);
    }
    
    #endregion
    
    #region Properties
    
    // Returns properties of the vector that need to be calculated.
    
    /// @func   magnitude();
    /// @desc Returns the length of the vector.
    static magnitude = function()
    {
        return sqrt(x * x + y * y);
    }
    
    /// @func   magnitude_squared();
    /// @desc Returns the squared length of the vector.
    static magnitude_squared = function()
    {
        return x * x + y * y;
    }
    
    /// @func   is_zero();
    /// @desc Returns if its a zero vector.
    static is_zero = function()
    {
        return x == 0 && y == 0;
    }
    
    /// @func   is_unit();
    /// @desc Returns if its a unit vector.
    static is_unit = function()
    {
        return magnitude() == 1;
    }
    
    /// @func   equals(x, y);
    /// @param {Real} x
    /// @param {Real} y
    /// @desc Returns if the vectors are equal.
    static equals = function(_x, _y)
    {
        return x == _x && y == _y;
    }

    /// @func   equals_vector(v);
    /// @param {Struct.Vector2} v
    /// @desc Returns if the vectors are equal.
    static equals_vector = function(_v)
    {
        return x == _v.x && y == _v.y;
    }

    /// @func   copy();
    /// @desc Returns a copy of the vector.
    static copy = function()
    {
        return new Vector2(x, y);
    }

    /// @func   toString();
    /// @desc Returns the string representation.
    static toString = function()
    {
        return $"({x},{y})";
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
    }
    
    /// @func   scale(factor);
    /// @param {Real} factor
    /// @desc Grows or shrinks the vector.
    static scale = function(_factor)
    {
        x *= _factor;
        y *= _factor;
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
    
    /// @func   add(x, y);
    /// @param {Real} x
    /// @param {Real} y
    /// @desc Adds to the vector.
    static add = function(_x, _y)
    {
        x += _x;
        y += _y;
    }

    /// @func   add_vector(v);
    /// @param {Struct.Vector2} v
    /// @desc Adds to the vector.
    static add_vector = function(_v)
    {
        x += _v.x;
        y += _v.y;
    }
    
    /// @func   add_scaled(x, y, factor);
    /// @param {Real} x
    /// @param {Real} y
    /// @param {Real} factor
    /// @desc Adds to the vector, but scales the input first.
    static add_scaled = function(_x, _y, _factor=1)
    {
        x += _x * _factor;
        y += _y * _factor;
    }

    /// @func   add_scaled_vector(v, factor);
    /// @param {Struct.Vector2} v
    /// @param {Real} factor
    /// @desc Adds to the vector, but scales the input first.
    static add_scaled_vector = function(_v, _factor=1)
    {
        x += _v.x * _factor;
        y += _v.y * _factor;
    }
    
    /// @func   multiply_components(x, y);
    /// @param {Real} x
    /// @param {Real} y
    /// @desc Multiplies the vector's components by the inputs.
    static multiply_components = function(_x, _y)
    {
        x *= _x;
        y *= _y;
    }

    /// @func   multiply_components_vector(v);
    /// @param {Struct.Vector2} v
    /// @desc Multiplies the vector's components by the inputs.
    static multiply_components_vector = function(_v)
    {
        x *= _v.x;
        y *= _v.y;
    }
    
    /// @func   lerp_to(x, y, amount);
    /// @param {Real} x
    /// @param {Real} y
    /// @param {Real} amount
    /// @desc Lerps to the other vector.
    static lerp_to = function(_x, _y, _amount)
    {
        x = lerp(x, _x, _amount);
        y = lerp(y, _y, _amount);
    }

    /// @func   set_from_lerp_vector(v, amount);
    /// @param {Struct.Vector2} v
    /// @param {Real} amount
    /// @desc Lerps to the other vector.
    static lerp_to_vector = function(_v, _amount)
    {
        x = lerp(x, _v.x, _amount);
        y = lerp(y, _v.y, _amount);
    }
    
    /// @func   multiply_matrix2x2(mat);
    /// @param {Struct.Matrix2x2} mat
    /// @desc Multiplies the vector by the matrix.
    static multiply_matrix2x2 = function(_mat)
    {
        set(x * _mat.data[0] + y * _mat.data[1], x * _mat.data[2] + y * _mat.data[3]);
    }
    
    /// @func   multiply_inverse_matrix2x2(mat);
    /// @param {Struct.Matrix2x2} mat
    /// @desc Multiplies the vector by the matrix, but inverts it first.
    static multiply_inverse_matrix2x2 = function(_mat)
    {
        set(x * _mat.data[0] + y * _mat.data[2], x * _mat.data[1] + y * _mat.data[3]);
    }
    
    #endregion
    
    #region Output Operations
    
    // Returns a value after the operation and usually doesn't affect the vector.
    
    /// @func   get_component_product(x, y);
    /// @param {Real} x
    /// @param {Real} y
    /// @desc Returns a vector that is the component multiplication between the vectors.
    static get_component_product = function(_x, _y)
    {
        return new Vector2(x * _x, y * _y);
    }
    
    /// @func   get_component_product_vector(v);
    /// @param {Struct.Vector2} v
    /// @desc Returns a vector that is the component multiplication between the vectors.
    static get_component_product_vector = function(_v)
    {
        return new Vector2(x * _v.x, y * _v.y);
    }
    
    /// @func   get_dot_product(x, y);
    /// @param {Real} x
    /// @param {Real} y
    /// @desc Returns the dot product between two vectors.
    static get_dot_product = function(_x, _y)
    {
        return dot_product(x, y, _x, _y);
    }
    
    /// @func   get_dot_product_vector(v);
    /// @param {Struct.Vector2} v
    /// @desc Returns the dot product between two vectors.
    static get_dot_product_vector = function(_v)
    {
        return dot_product(x, y, _v.x, _v.y);
    }
    
        
    /// @func   get_scaled(factor);
    /// @param {Real} factor
    /// @desc Returns a scaled version of the vector.
    static get_scaled = function(_factor)
    {
        return new Vector2(x * _factor, y * _factor);
    }
    
    /// @func   get_sum(x, y);
    /// @param {Real} x
    /// @param {Real} y
    /// @desc Returns a summation vector.
    static get_sum = function(_x, _y)
    {
        return new Vector2(x + _x, y + _y);
    }
    
    /// @func   get_sum_vector(v);
    /// @param {Struct.Vector2} v
    /// @desc Returns a summation vector.
    static get_sum_vector = function(_v)
    {
        return new Vector2(x + _v.x, y + _v.y);
    }
    
    /// @func   get_is_perpendicular(x, y);
    /// @param {Real} x
    /// @param {Real} y
    /// @desc Returns if the vectors are perpendicular.
    static get_is_perpendicular = function(_x, _y)
    {
        return get_dot_product(_x, _y) == 0;
    }
    
    /// @func   get_is_perpendicular_vector(v);
    /// @param {Struct.Vector2} v
    /// @desc Returns if the vectors are perpendicular.
    static get_is_perpendicular_vector = function(_v)
    {
        return get_dot_product(_v.x, _v.y) == 0;
    }
    
    /// @func   get_is_acute(x, y);
    /// @param {Real} x
    /// @param {Real} y
    /// @desc Returns if the vectors are acute.
    static get_is_acute = function(_x, _y)
    {
        return get_dot_product(_x, _y) > 0;
    }
    
    /// @func   get_is_acute_vector(v);
    /// @param {Struct.Vector2} v
    /// @desc Returns if the vectors are acute.
    static get_is_acute_vector = function(_v)
    {
        return get_dot_product(_v.x, _v.y) > 0;
    }
    
    /// @func   get_is_obtuse(x, y);
    /// @param {Real} x
    /// @param {Real} y
    /// @desc Returns if the vectors are obtuse.
    static get_is_obtuse = function(_x, _y)
    {
        return get_dot_product(_x, _y) < 0;
    }
    
    /// @func   get_is_obtuse_vector(v);
    /// @param {Struct.Vector2} v
    /// @desc Returns if the vectors are obtuse.
    static get_is_obtuse_vector = function(_v)
    {
        return get_dot_product(_v.x, _v.y) < 0;
    }
    
    #endregion
}