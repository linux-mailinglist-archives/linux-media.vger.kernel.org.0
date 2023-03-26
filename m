Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B26C6C9568
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:33:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232570AbjCZOdX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:33:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232438AbjCZOcr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:47 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F0017DA1
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:45 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQC-00083z-Oz; Sun, 26 Mar 2023 16:32:36 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQA-006rbZ-EU; Sun, 26 Mar 2023 16:32:34 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ9-0088W9-Hw; Sun, 26 Mar 2023 16:32:33 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Mirela Rabulea <mirela.rabulea@nxp.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>
Cc:     NXP Linux Team <linux-imx@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@pengutronix.de
Subject: [PATCH 037/117] media: mxc-jpeg: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:31:04 +0200
Message-Id: <20230326143224.572654-40-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1857; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=he/DS5KxYHpU6tXKKwvBsO17OKmtbjtQ3f2TV/xs1jg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFazsqIWM1CxZL1FRbfxXtH+SlGMFWFNtycYA GLe3UUvhbGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBWswAKCRCPgPtYfRL+ TpcMB/0XNfc6SXV0I+lvFu+DCee6vfUhHM4Kzzv7ABmQJKLaSK8poHKU9AiSJ1qUsV4G9cJL0Z1 ltJylCOGJ6K205hE47qXoM7btvLrkpZhsxAYdEtfUEUnFsMmynqPT2k+08zijk++7ynn12/1qxQ ovQI8egdLEVokRaafJdcdTISKu8mdwxG2Ai0AEfw/gBSH04J+1KPTyFPe+hXGtnHcNUwsMfGCfb FiQUdKe0ZVoR52pvqWvX3vuP0rsCd3PmVyQA+ZGFmu/txTA+DoOanIszyeOSV/BEfFT7WXoXGpK MGHmBehFyqgTKZZ/ko+O2Ie9poX0QeVD7usPVziMYhF/DuAg
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
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index f085f14d676a..4dd404d69c4e 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -2622,7 +2622,7 @@ static const struct dev_pm_ops	mxc_jpeg_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(mxc_jpeg_suspend, mxc_jpeg_resume)
 };
 
-static int mxc_jpeg_remove(struct platform_device *pdev)
+static void mxc_jpeg_remove(struct platform_device *pdev)
 {
 	unsigned int slot;
 	struct mxc_jpeg_dev *jpeg = platform_get_drvdata(pdev);
@@ -2635,15 +2635,13 @@ static int mxc_jpeg_remove(struct platform_device *pdev)
 	v4l2_m2m_release(jpeg->m2m_dev);
 	v4l2_device_unregister(&jpeg->v4l2_dev);
 	mxc_jpeg_detach_pm_domains(jpeg);
-
-	return 0;
 }
 
 MODULE_DEVICE_TABLE(of, mxc_jpeg_match);
 
 static struct platform_driver mxc_jpeg_driver = {
 	.probe = mxc_jpeg_probe,
-	.remove = mxc_jpeg_remove,
+	.remove_new = mxc_jpeg_remove,
 	.driver = {
 		.name = "mxc-jpeg",
 		.of_match_table = mxc_jpeg_match,
-- 
2.39.2

