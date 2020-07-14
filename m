Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABEFE21EE80
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2020 12:58:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727869AbgGNK5l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jul 2020 06:57:41 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:45056 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726252AbgGNK5l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jul 2020 06:57:41 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06EAqIgS036809;
        Tue, 14 Jul 2020 10:57:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=OG8hS9cwfSnDOpvANl6+TVQVo1bridrWw7iRZgx0ChM=;
 b=lQ6y9kLpgvVKhYc3GUG5w0lpq7kGlRxuggRWpwtJ/nF/bTWjiXY0NJY6LIuiqld/Yg1t
 svOfA3GLXc6hkInjsiZUtagO4OuC62RQkAExR3vHo52zADdLFu7KSGr6BXq1uV4GlOFm
 qR3SPWjg0HZSdqmn8Kp/3QZGE5Bt74NZ9ciFyyjJ3Lc1Kpcvz7HNFXBVc7VO7oFYvd83
 W/7KegvTJu4rrjOjQmY3n8N9T9iUrTimgxiuZac/D4Kpf7ycpubXsS3FWgHgjgu00lh9
 NgMql5tfsNv7puYORnjgLRLX+/Abdr/Olx28Hk9+x+2a2Rpz7oR62CA3hmPW2HdA6Uda 4Q== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 3274ur4q9f-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 14 Jul 2020 10:57:37 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06EArY9S049145;
        Tue, 14 Jul 2020 10:55:36 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3020.oracle.com with ESMTP id 327qb3nsk8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 14 Jul 2020 10:55:36 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 06EAtZN7012720;
        Tue, 14 Jul 2020 10:55:35 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 14 Jul 2020 03:55:35 -0700
Date:   Tue, 14 Jul 2020 13:55:29 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] media: atomisp: Fix error code in ov5693_probe()
Message-ID: <20200714105529.GA294318@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9681 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 spamscore=0 phishscore=0 suspectscore=2 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007140083
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9681 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 impostorscore=0
 suspectscore=2 phishscore=0 spamscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007140083
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If gmin_camera_platform_data() returns NULL then we should return a
negative error instead of success.

Fixes: 90ebe55ab886 ("media: staging: atomisp: Add driver prefix to Kconfig option and module names")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c b/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c
index 97ab10bc45ca..e698b63d6cb7 100644
--- a/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c
+++ b/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c
@@ -1899,7 +1899,7 @@ static int ov5693_probe(struct i2c_client *client)
 {
 	struct ov5693_device *dev;
 	int i2c;
-	int ret = 0;
+	int ret;
 	void *pdata;
 	unsigned int i;
 
@@ -1929,8 +1929,10 @@ static int ov5693_probe(struct i2c_client *client)
 	pdata = gmin_camera_platform_data(&dev->sd,
 					  ATOMISP_INPUT_FORMAT_RAW_10,
 					  atomisp_bayer_order_bggr);
-	if (!pdata)
+	if (!pdata) {
+		ret = -EINVAL;
 		goto out_free;
+	}
 
 	ret = ov5693_s_config(&dev->sd, client->irq, pdata);
 	if (ret)
-- 
2.27.0

