using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Obj : MonoBehaviour
{
    #region components



    #endregion

    #region inspector



    #endregion

    #region variables

    Vector3 ogPos;
    [SerializeField] float amount;

    #endregion

    private void Awake()
    {
        ogPos = transform.position;
    }

    private void Update()
    {
        float t = Mathf.Sin(Time.time * 10 / amount) * 0.5f + 0.5f;
        transform.position = ogPos + new Vector3(0, t * amount, 0);
    }
}
