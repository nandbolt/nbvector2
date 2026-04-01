/// @func   Matrix2x2();
/// @desc A 2x2 matrix, containing two column vectors.
function Matrix2x2() constructor
{
    // The matrix (starts off as the identity matrix)
    // [a b] => [a, b, c, d] => [1 0]
    // [c d]                    [0 1]
    data = [1, 0, 0, 1];
    
    #region Setters
    
    /// @func   set_data(a11, a12, a21, a22);
    /// @param {Real} a11 1st column, 1st row
    /// @param {Real} a12 1st column, 2nd row
    /// @param {Real} a21 2nd column, 1st row
    /// @param {Real} a22 2nd column, 2nd row
    /// @desc Sets the matrix's data.
    static set_data = function(_a11=1, _a12=0, _a21=0, _a22=1)
    {
        data[0] = _a11;
        data[1] = _a21;
        data[2] = _a12;
        data[3] = _a22;
    }
    
    /// @func   set_data_vector(v1, v2);
    /// @param {Struct.Vector2} v1 1st column vector
    /// @param {Struct.Vector2} v2 2nd column vector
    /// @desc Sets the matrix's data.
    static set_data_vector = function(_v1, _v2)
    {
        data[0] = _v1.x;
        data[1] = _v1.y;
        data[2] = _v2.x;
        data[3] = _v2.y;
    }
    
    /// @func   set_data_matrix(mat);
    /// @param {Struct.Matrix2x2} mat
    /// @desc Sets the matrix's data.
    static set_data_matrix = function(_mat)
    {
        data[0] = _mat.data[0];
        data[1] = _mat.data[1];
        data[2] = _mat.data[2];
        data[3] = _mat.data[3];
    }
    
    /// @func   set_to_rotation_degrees(angle);
    /// @param {Real} angle
    /// @desc Sets to a rotation matrix based on the angle.
    static set_to_rotation_degrees = function(_angle)
    {
        data[0] = dcos(_angle);
        data[2] = dsin(_angle);
        data[1] = -data[2];
        data[3] = data[0];
    }
    
    #endregion
    
    #region Properties
    
    /// @func   get_by_index(i, j);
    /// @param {Int} i The i-th column (1 or 2)
    /// @param {Int} j The j-th row (1 or 2)
    /// @desc Returns the value at the given indices of the matrix (using index notation).
    static get_by_index = function(_i, _j)
    {
        return data[_i - 1 + (_j - 1) * 2];
    }
    
    /// @func   copy();
    /// @desc Returns a copy of the matrix.
    static copy = function()
    {
        var _mat = new Matrix2x2();
        _mat.set_data_matrix(self);
        return _mat;
    }
    
    /// @func   copy_data();
    /// @desc Returns a copy of the matrix's data.
    static copy_data = function()
    {
        return [data[0], data[1], data[2], data[3]];
    }
    
    /// @func   copy_data();
    /// @desc Returns a copy of the matrix's data.
    static toString = function()
    {
        return $"[{data[0]} {data[1]}]\n[{data[2]} {data[3]}]";
    }
    
    #endregion
    
    #region Events
    
    /// @func   cleanup();
    /// @desc Cleans up any memory before getting deleted.
    static cleanup = function()
    {
        data = -1;
    }
    
    #endregion
}