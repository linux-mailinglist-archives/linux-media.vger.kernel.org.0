Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4578314DAF
	for <lists+linux-media@lfdr.de>; Tue,  9 Feb 2021 11:59:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231891AbhBIK6K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Feb 2021 05:58:10 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:42968 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230253AbhBIKzu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Feb 2021 05:55:50 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 119AsCt8095823;
        Tue, 9 Feb 2021 10:55:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=xtYogTAfql/Tqk+4+VAYBRVj913mJOXSN7dD/2+g+i4=;
 b=aFQOZaE/MoU2249QEx1oKT36iKvznbnl6OmiTCukijOHgq6kZtmbwosQr+t6Jf3SiweH
 LfMOcYbMySTBT1Dp6AmSSJH4Ys87TgEi42ICVtG/yapnVf05iNC0tw1NRJOgqlBSWM9U
 VYykbG0GepZXG8Q0F0OB+V1AFKYDTRc1FpTZB6gelIGUb0kcg7YRYqxBacwVhRQr9cgC
 uMsvPFN/riRDbRoqWzA7NJr98AyswKYON8CejnQUOjEQlcp5mYajG9fVMlOEJvVa3+Jk
 f9SdR8EX8wh/Vis+O/pSLCtUZpJbz4x+Qj8o5MPQR7G/+DVbMfyinZYNotwoHHAW04B9 AA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 36hkrmy0jw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 09 Feb 2021 10:55:04 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 119AnsKc010388;
        Tue, 9 Feb 2021 10:54:55 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 36j4pnhynp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 09 Feb 2021 10:54:55 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 119AssNl002725;
        Tue, 9 Feb 2021 10:54:54 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 09 Feb 2021 02:54:53 -0800
Date:   Tue, 9 Feb 2021 13:54:48 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     martinax.krasteva@intel.com
Cc:     linux-media@vger.kernel.org
Subject: [bug report] media: i2c: Add imx334 camera sensor driver
Message-ID: <YCJp+LrFNtVWAmr7@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9889 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102090056
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9889 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 clxscore=1011
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102090056
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Martina Krasteva,

The patch 9746b11715c3: "media: i2c: Add imx334 camera sensor driver"
from Feb 3, 2021, leads to the following static checker warning:

	drivers/media/i2c/imx334.c:721 imx334_set_stream()
	warn: pm_runtime_get_sync() also returns 1 on success

drivers/media/i2c/imx334.c
   707  static int imx334_set_stream(struct v4l2_subdev *sd, int enable)
   708  {
   709          struct imx334 *imx334 = to_imx334(sd);
   710          int ret;
   711  
   712          mutex_lock(&imx334->mutex);
   713  
   714          if (imx334->streaming == enable) {
   715                  mutex_unlock(&imx334->mutex);
   716                  return 0;
   717          }
   718  
   719          if (enable) {
   720                  ret = pm_runtime_get_sync(imx334->dev);
   721                  if (ret)

This needs to be: "if (ret < 0)"

   722                          goto error_power_off;
   723  
   724                  ret = imx334_start_streaming(imx334);
   725                  if (ret)
   726                          goto error_power_off;
   727          } else {
   728                  imx334_stop_streaming(imx334);
   729                  pm_runtime_put(imx334->dev);
   730          }
   731  
   732          imx334->streaming = enable;
   733  
   734          mutex_unlock(&imx334->mutex);
   735  
   736          return 0;
   737  
   738  error_power_off:
   739          pm_runtime_put(imx334->dev);
   740          mutex_unlock(&imx334->mutex);
   741  
   742          return ret;
   743  }

regards,
dan carpenter
