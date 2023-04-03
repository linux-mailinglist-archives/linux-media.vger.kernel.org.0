Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFAD46D4C28
	for <lists+linux-media@lfdr.de>; Mon,  3 Apr 2023 17:40:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232958AbjDCPkf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Apr 2023 11:40:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232954AbjDCPkb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Apr 2023 11:40:31 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACB3E2703
        for <linux-media@vger.kernel.org>; Mon,  3 Apr 2023 08:40:30 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pjMI8-0004c5-Cd; Mon, 03 Apr 2023 17:40:20 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pjMI7-008ib3-LZ; Mon, 03 Apr 2023 17:40:19 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pjMI6-00AHx1-MH; Mon, 03 Apr 2023 17:40:18 +0200
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
Subject: [PATCH 09/24] staging: media: imx-media-dev: Convert to platform remove callback returning void
Date:   Mon,  3 Apr 2023 17:39:59 +0200
Message-Id: <20230403154014.2564054-10-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230403154014.2564054-1-u.kleine-koenig@pengutronix.de>
References: <20230403154014.2564054-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1887; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=NfhFuPcQjvCDS+hPh2b2lfedYrohw4g+Wp/gtONhiGU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKvM/opFPgRJzRAhQ0djBHR+kH4ijtoQZPxQSH vRqdlr0X0OJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCrzPwAKCRCPgPtYfRL+ TqPrB/9lhe/gnMCeqND74AwxIS0CZ3tnSl3XYP4sBB4SzKl5yi/apYC5nuVR4nyttzMCh/U8YcB M2eGZJ9NSsA+GeU8NlBYLVr61c92He+T8fZQvcXwszDnmse8145ZtYfc0ek0fLnQSARM9jtpTJN ZrBz+68WjU+W3GJAnCfQl+/8lpKvrML3CD2Ex4uHYgUerRQxERxjelNJXphrB9QJB3DMbOerG3t D2i+09jtILM/XMTy9dn9QtvR4V4cZtngP9Zu9ziYzJzmV+GLgSiLpxyl70XfXxKEPc6OKtpRIQB mP6NdUb0C5YCppdg5Li38YiTkyPp10G3sSZ7T3r6uIkUBBS0
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
 drivers/staging/media/imx/imx-media-dev.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-dev.c b/drivers/staging/media/imx/imx-media-dev.c
index f85462214e22..c80113905069 100644
--- a/drivers/staging/media/imx/imx-media-dev.c
+++ b/drivers/staging/media/imx/imx-media-dev.c
@@ -101,7 +101,7 @@ static int imx_media_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int imx_media_remove(struct platform_device *pdev)
+static void imx_media_remove(struct platform_device *pdev)
 {
 	struct imx_media_dev *imxmd =
 		(struct imx_media_dev *)platform_get_drvdata(pdev);
@@ -119,8 +119,6 @@ static int imx_media_remove(struct platform_device *pdev)
 	media_device_unregister(&imxmd->md);
 	v4l2_device_unregister(&imxmd->v4l2_dev);
 	media_device_cleanup(&imxmd->md);
-
-	return 0;
 }
 
 static const struct of_device_id imx_media_dt_ids[] = {
@@ -131,7 +129,7 @@ MODULE_DEVICE_TABLE(of, imx_media_dt_ids);
 
 static struct platform_driver imx_media_pdrv = {
 	.probe		= imx_media_probe,
-	.remove		= imx_media_remove,
+	.remove_new	= imx_media_remove,
 	.driver		= {
 		.name	= "imx-media",
 		.of_match_table	= imx_media_dt_ids,
-- 
2.39.2

