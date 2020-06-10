Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CDD11F5A48
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2020 19:26:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726408AbgFJR0c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jun 2020 13:26:32 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:55764 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726095AbgFJR0b (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jun 2020 13:26:31 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05AHMO7o089411;
        Wed, 10 Jun 2020 17:26:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=ijYAQnfitZ0djMaR0rpx+C3/Bd2mhPossi+K/mI0VoI=;
 b=kI75ydh9ZL5mQPBTpohY4GT9bQrOliTsUsmcseh1HpRMR2Ay8CP7R+wsB+gSaOfFPRsj
 YG2pSAxlBuTvDEF2tBzkisr9OnnhhEseZsjYL02tI2JqAHEpeBdY3EENXe8xiVcZbosm
 gzUqQoEdddo7iduvSkWWi9G7rPRlR13pONPQqymkg7lCiSqlOj8XSd00f6GLklYpDGl2
 ewF6x5hwQaNuT3IGU7c2Y1dqXjIS/2Qq6z6TvOorHt0Y2ZkakW9qg12h4DVnRkjZB3mF
 RrsEDTyollatoZRiE979GlzYW7M6sQ5ouR8pEevQppKT9DUb7G68nU/JaN114NLDIV2G tw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2130.oracle.com with ESMTP id 31g2jrbp85-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 10 Jun 2020 17:26:24 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05AHNjRL099650;
        Wed, 10 Jun 2020 17:26:24 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3030.oracle.com with ESMTP id 31gn2yts7u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 10 Jun 2020 17:26:24 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 05AHQN5v000591;
        Wed, 10 Jun 2020 17:26:23 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 10 Jun 2020 10:26:22 -0700
Date:   Wed, 10 Jun 2020 20:26:15 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Robert Jarzmik <robert.jarzmik@free.fr>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Chuhong Yuan <hslester96@gmail.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] media: pxa_camera: remove an impossible condition
Message-ID: <20200610172615.GD90634@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9648 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 malwarescore=0
 bulkscore=0 adultscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006100133
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9648 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 impostorscore=0
 cotscore=-2147483648 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0
 phishscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006100133
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It's not possible for "pcdev->mclk" to be zero because we check for
that earlier and set it to 20000000 in that situation.  If it were
possible, that would be a problem because it could have lead to an Oops
in the error handling when we call v4l2_clk_unregister(pcdev->mclk_clk);

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/media/platform/pxa_camera.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/pxa_camera.c b/drivers/media/platform/pxa_camera.c
index 3c5fe737d36f7..8e5613c1fe067 100644
--- a/drivers/media/platform/pxa_camera.c
+++ b/drivers/media/platform/pxa_camera.c
@@ -2504,17 +2504,14 @@ static int pxa_camera_probe(struct platform_device *pdev)
 	if (err)
 		goto exit_notifier_cleanup;
 
-	if (pcdev->mclk) {
-		v4l2_clk_name_i2c(clk_name, sizeof(clk_name),
-				  pcdev->asd.match.i2c.adapter_id,
-				  pcdev->asd.match.i2c.address);
-
-		pcdev->mclk_clk = v4l2_clk_register(&pxa_camera_mclk_ops,
-						    clk_name, NULL);
-		if (IS_ERR(pcdev->mclk_clk)) {
-			err = PTR_ERR(pcdev->mclk_clk);
-			goto exit_notifier_cleanup;
-		}
+	v4l2_clk_name_i2c(clk_name, sizeof(clk_name),
+			  pcdev->asd.match.i2c.adapter_id,
+			  pcdev->asd.match.i2c.address);
+
+	pcdev->mclk_clk = v4l2_clk_register(&pxa_camera_mclk_ops, clk_name, NULL);
+	if (IS_ERR(pcdev->mclk_clk)) {
+		err = PTR_ERR(pcdev->mclk_clk);
+		goto exit_notifier_cleanup;
 	}
 
 	err = v4l2_async_notifier_register(&pcdev->v4l2_dev, &pcdev->notifier);
-- 
2.26.2

