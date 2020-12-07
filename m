Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60DC82D1144
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 14:02:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725842AbgLGNB0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 08:01:26 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:35042 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbgLGNBZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Dec 2020 08:01:25 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B7CxS0a095922;
        Mon, 7 Dec 2020 13:00:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=pxdGBrVVE7UaCWf88p+ugmGqm0nWkYG542hsay/Mr5M=;
 b=0GZH868dGaahH4ioo5Swhb6k+v2ZCC5NSq4h4CztMFGTP+1rlv7BDCyyLz3MEg944WqN
 zwhpLz7BAccVUqtkbxYLk4M61fHwCJVf+P24kpER+txzkDABsiysNEKr2nRqSUpAbLI7
 AFXnC5j6tPqGbvgUyxrIL/Cljw5eLwkspv3ITMs+A+UJ1I70kdUV2W4q09vS5oJvdZyh
 EewAD6Zw0wBkUyBvYDtP0wKkkf41NTLwm8lmqoFtfHqc87DMvmc7RRwxLqwCof9wVvW7
 2DioGil+21pF078P5xoNn56Ab1gvbW2/605J9YFm/CJe6nZzexT6sB9iKMY7/A2WXBD4 oQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2130.oracle.com with ESMTP id 357yqbn9ax-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 07 Dec 2020 13:00:39 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B7CsaXU130494;
        Mon, 7 Dec 2020 13:00:39 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3020.oracle.com with ESMTP id 358kyr6scn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Dec 2020 13:00:39 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0B7D0bIm028559;
        Mon, 7 Dec 2020 13:00:37 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 07 Dec 2020 05:00:36 -0800
Date:   Mon, 7 Dec 2020 16:00:29 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] media: i2c: ov02a10: fix an uninitialized return
Message-ID: <X84nbdgv0a/ak2ef@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9827 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012070082
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9827 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 clxscore=1011 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012070082
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The "ret" variable isn't set on the no-op path where we are setting to
on/off and it's in the on or off state already.

Fixes: 91807efbe8ec ("media: i2c: add OV02A10 image sensor driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/media/i2c/ov02a10.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov02a10.c b/drivers/media/i2c/ov02a10.c
index 391718136ade..cf40e207ea21 100644
--- a/drivers/media/i2c/ov02a10.c
+++ b/drivers/media/i2c/ov02a10.c
@@ -530,7 +530,7 @@ static int ov02a10_s_stream(struct v4l2_subdev *sd, int on)
 {
 	struct ov02a10 *ov02a10 = to_ov02a10(sd);
 	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
-	int ret;
+	int ret = 0;
 
 	mutex_lock(&ov02a10->mutex);
 
-- 
2.29.2

