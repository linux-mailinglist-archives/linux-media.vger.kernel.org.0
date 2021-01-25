Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9D9430325F
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 04:03:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728152AbhAYNOY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Jan 2021 08:14:24 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:59472 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728678AbhAYNOC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 08:14:02 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10P8iTaT171912;
        Mon, 25 Jan 2021 08:48:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=pSuQ6+zFIOAaRAOPaTbRFPTUs8YM615/VcVUuMuizOI=;
 b=YG4rajvThpUpN9nEkZfyESkOH72I/fJvR+SenZKckmZwRGUtBGP9UqRnlLh23eccvEvi
 wVLLZIL3WYiStBjMrH9qX3csoncsconBoJPuHFStaAxGNVWm9aE6TjdfveK4LtbVSTFc
 t6LRe/DQzt/mH7ZTxHe68slBmrz+NJKEWjwD55D0B8rz1vVqht9K817b3YGvKI/SNdjP
 Lqu82B8hA1UieQPlLCM2A1e2oVro//hV5HbHGlwZBZPJ1KWt2wEduE+9MmWTrG9E+tqo
 nn7aLT98FtNEK3fzIIVq2UGb6os1w+2JAAdJ3Gk1iTgMF46h5wykaZ/BMftwA2JChiFN RQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 368brkc44n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 25 Jan 2021 08:48:14 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10P8k3V2018946;
        Mon, 25 Jan 2021 08:46:11 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3030.oracle.com with ESMTP id 368wqunn0t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 25 Jan 2021 08:46:11 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 10P8k9oG024058;
        Mon, 25 Jan 2021 08:46:09 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 25 Jan 2021 00:46:09 -0800
Date:   Mon, 25 Jan 2021 11:46:03 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] media: i2c: ov5648: remove unnecessary NULL check
Message-ID: <YA6FSxjBGVtRgT+Z@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9874 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101250052
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9874 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101250052
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The "mode_index == ARRAY_SIZE(ov5648_modes)" check ensures that we
exited the loop via a break statement so we know that "mode" must
be valid.  Delete this unnecessary NULL check.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/media/i2c/ov5648.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5648.c b/drivers/media/i2c/ov5648.c
index 609aa67b54ce..b3864be33df2 100644
--- a/drivers/media/i2c/ov5648.c
+++ b/drivers/media/i2c/ov5648.c
@@ -2337,7 +2337,7 @@ static int ov5648_enum_frame_interval(struct v4l2_subdev *subdev,
 		}
 	}
 
-	if (mode_index == ARRAY_SIZE(ov5648_modes) || !mode)
+	if (mode_index == ARRAY_SIZE(ov5648_modes))
 		return -EINVAL;
 
 	switch (interval_enum->code) {
-- 
2.29.2

