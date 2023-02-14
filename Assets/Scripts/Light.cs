using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Light : MonoBehaviour
{
    #region components



    #endregion

    #region inspector



    #endregion

    #region variables



    #endregion

    private void Update()
    {
        transform.rotation *= Quaternion.Euler(0, Time.deltaTime * 10, Time.deltaTime * 10);
    }
}
