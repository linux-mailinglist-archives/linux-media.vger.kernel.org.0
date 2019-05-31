Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3741A31008
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2019 16:21:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726566AbfEaOVT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 May 2019 10:21:19 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:56130 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726550AbfEaOVT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 May 2019 10:21:19 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4VEJ74A111648;
        Fri, 31 May 2019 14:21:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=0ZcHm9/e7e5zol3c0mWMZbM/iVqdEi8mJK2w61VFTRg=;
 b=mz4Xq42VfjzY/IZy8y87XJON4+zI1uEcaP9UcD2jcWVmamUrleVvzwE+xF4xFyg8wc3Q
 blgsEjlZ7fBs1I1OyW36IVj8uLpMw+LDaXqWtiZn7uKmyoqVsL8pI6Whlw89o1/VRYWr
 JD5iu4MkSHK4NtG9hzHPKXBpQ+YpEUW3pImPJLQT+kRgnbhibCXSgDmjx+poNpfUfzBR
 aiG8k39rzTZ0RV0VXl89K2KtADMfwp4aT++3gRmOWxRFW0tfgluPDk+T3JzYw5oVt80/
 9fggfrg5/4XSP/X87CIzfi6PbzMZKwWrfxA3p7ZG9tk/KqLd3QWiPKrb4dKvqGkg2Vpw 1Q== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2130.oracle.com with ESMTP id 2spu7dxt8n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 31 May 2019 14:21:02 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4VEKU8i075470;
        Fri, 31 May 2019 14:21:01 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 2sqh74wdgd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 31 May 2019 14:21:01 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x4VEKwWZ002973;
        Fri, 31 May 2019 14:20:58 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 31 May 2019 07:20:58 -0700
Date:   Fri, 31 May 2019 17:20:49 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] media: staging/imx: fix two NULL vs IS_ERR() bugs
Message-ID: <20190531142048.GA383@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9273 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905310091
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9273 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905310091
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The imx_media_pipeline_pad() function return NULL pointers on error, it
never returns error pointers.

Fixes: 3ef46bc97ca2 ("media: staging/imx: Improve pipeline searching")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/media/imx/imx-media-csi.c  | 4 ++--
 drivers/staging/media/imx/imx7-media-csi.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index d2f880938af9..0eeb0db6d83f 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -193,8 +193,8 @@ static int csi_get_upstream_endpoint(struct csi_priv *priv,
 
 	/* get source pad of entity directly upstream from src */
 	pad = imx_media_pipeline_pad(src, 0, 0, true);
-	if (IS_ERR(pad))
-		return PTR_ERR(pad);
+	if (!pad)
+		return -ENODEV;
 
 	sd = media_entity_to_v4l2_subdev(pad->entity);
 
diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index b1af8694899e..882690561357 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -439,8 +439,8 @@ static int imx7_csi_get_upstream_endpoint(struct imx7_csi *csi,
 skip_video_mux:
 	/* get source pad of entity directly upstream from src */
 	pad = imx_media_pipeline_pad(src, 0, 0, true);
-	if (IS_ERR(pad))
-		return PTR_ERR(pad);
+	if (!pad)
+		return -ENODEV;
 
 	sd = media_entity_to_v4l2_subdev(pad->entity);
 
-- 
2.20.1

