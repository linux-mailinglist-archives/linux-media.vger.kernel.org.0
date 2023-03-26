Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66B9B6C9559
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:33:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232560AbjCZOdK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:33:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232411AbjCZOco (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:44 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A2AF7A8D
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:42 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQC-00081j-5s; Sun, 26 Mar 2023 16:32:36 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQA-006rbN-01; Sun, 26 Mar 2023 16:32:34 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ9-0088W1-4g; Sun, 26 Mar 2023 16:32:33 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dmitry Osipenko <digetx@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 035/117] media: vde: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:31:02 +0200
Message-Id: <20230326143224.572654-38-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1896; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=DwvC+rbFxTPbMN3MsoLH2dmtGYionTkUjlSwJHUAVv4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFaxEqz1BUsSzfeMNzBe48IMR2VpMvzt6Qin4 S6GyPlp+R+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBWsQAKCRCPgPtYfRL+ TkY0B/4/aM5qKHWLnx5AyelmAxDLgZjU4AwgkO8xIxD++qUNTPEykPbW1EuESF0UdxdDMOwVog+ y+Pw9sT516FzfehgAG3CCo5/8QJNb3owvegECw7XFN8jCYSZnOCRXOBpsQSCDQgbMwdTEAr17KP JlYc/RtQ2j6UHE3tvo6sc0mGNskiIAuyDqCDey9NlTGPEBkaEZFv83tVM2jyqVGXAWtpZAXs9BO ZKFB9cGSVWBo1Kxa9gJYJ3mAGEyY0Qy5t7P9rXcD8dOvdL8gQ8+O0gIdidIH2RgsmzVrbJV6QS7 vzkSrxN5i/7H9aTs9HkQblkQ47qKqPC0wn05k3u4mZ2XNL0a
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
 drivers/media/platform/nvidia/tegra-vde/vde.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-vde/vde.c b/drivers/media/platform/nvidia/tegra-vde/vde.c
index f3e863a94c5a..7157734a1550 100644
--- a/drivers/media/platform/nvidia/tegra-vde/vde.c
+++ b/drivers/media/platform/nvidia/tegra-vde/vde.c
@@ -378,7 +378,7 @@ static int tegra_vde_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int tegra_vde_remove(struct platform_device *pdev)
+static void tegra_vde_remove(struct platform_device *pdev)
 {
 	struct tegra_vde *vde = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
@@ -407,8 +407,6 @@ static int tegra_vde_remove(struct platform_device *pdev)
 
 	gen_pool_free(vde->iram_pool, (unsigned long)vde->iram,
 		      gen_pool_size(vde->iram_pool));
-
-	return 0;
 }
 
 static void tegra_vde_shutdown(struct platform_device *pdev)
@@ -536,7 +534,7 @@ MODULE_DEVICE_TABLE(of, tegra_vde_of_match);
 
 static struct platform_driver tegra_vde_driver = {
 	.probe		= tegra_vde_probe,
-	.remove		= tegra_vde_remove,
+	.remove_new	= tegra_vde_remove,
 	.shutdown	= tegra_vde_shutdown,
 	.driver		= {
 		.name		= "tegra-vde",
-- 
2.39.2

