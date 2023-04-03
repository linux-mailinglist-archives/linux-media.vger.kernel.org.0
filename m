Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 551656D4C25
	for <lists+linux-media@lfdr.de>; Mon,  3 Apr 2023 17:40:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232957AbjDCPkd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Apr 2023 11:40:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230090AbjDCPk3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Apr 2023 11:40:29 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B941B272C
        for <linux-media@vger.kernel.org>; Mon,  3 Apr 2023 08:40:28 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pjMI8-0004bd-A2; Mon, 03 Apr 2023 17:40:20 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pjMI7-008iaq-4L; Mon, 03 Apr 2023 17:40:19 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pjMI6-00AHwq-HE; Mon, 03 Apr 2023 17:40:18 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>
Cc:     Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Subject: [PATCH 08/24] staging: media: imx-media-csi: Convert to platform remove callback returning void
Date:   Mon,  3 Apr 2023 17:39:58 +0200
Message-Id: <20230403154014.2564054-9-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230403154014.2564054-1-u.kleine-koenig@pengutronix.de>
References: <20230403154014.2564054-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1875; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=/TgJlWqh3E9BEiNSqoilb4b5PZadfxSh2GHf60q4XpY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKvM+qqUplz861HdJ2wRrV6oCtko8eses/2DWN jkrZC4Kk9yJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCrzPgAKCRCPgPtYfRL+ TjufCACMa0Vd/1PVq1lmXPLJr+WxD4KOvyaUd7o+ljm+kjacOqifklFTV1/IGe9ORfHyKMCfpfR KFSioMkfg5PFNPM4nXE2o+7uO3wvPRsM3NdHWtxfOUcOqV+47G2TnT+/ODcTN5Ky22u9x/+tLjb D3T/i2lpDuQTrLDTzt8AviIomvaJbXvPq8FL5QMP2J5ATYsGQC/aPy2hiLfVz3XeisWE0Qm/504 1yrifrpJ3ZB/NJMA04/m+Q6n3DuWjaXP98Bf9T4b/V8sed6wUyOmYGGbo6+y/w8f7pahQPR+sd5 sY6PEizqNO2hXw0Oh9ZwcedLioDOjHdSbNdbhWpMBHMO9ni7
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/staging/media/imx/imx-media-csi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index 44d87fe30d52..097171bb930d 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -2041,7 +2041,7 @@ static int imx_csi_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int imx_csi_remove(struct platform_device *pdev)
+static void imx_csi_remove(struct platform_device *pdev)
 {
 	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
 	struct csi_priv *priv = sd_to_dev(sd);
@@ -2052,8 +2052,6 @@ static int imx_csi_remove(struct platform_device *pdev)
 	v4l2_async_nf_cleanup(&priv->notifier);
 	v4l2_async_unregister_subdev(sd);
 	media_entity_cleanup(&sd->entity);
-
-	return 0;
 }
 
 static const struct platform_device_id imx_csi_ids[] = {
@@ -2064,7 +2062,7 @@ MODULE_DEVICE_TABLE(platform, imx_csi_ids);
 
 static struct platform_driver imx_csi_driver = {
 	.probe = imx_csi_probe,
-	.remove = imx_csi_remove,
+	.remove_new = imx_csi_remove,
 	.id_table = imx_csi_ids,
 	.driver = {
 		.name = "imx-ipuv3-csi",
-- 
2.39.2

