Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A1D76C9590
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:34:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232499AbjCZOeH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:34:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232259AbjCZOc4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:56 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 047437D84
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:53 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQJ-0008Te-Ho; Sun, 26 Mar 2023 16:32:43 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQG-006rds-Kc; Sun, 26 Mar 2023 16:32:40 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQF-0088Xv-I5; Sun, 26 Mar 2023 16:32:39 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 065/117] media: fimc-lite: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:31:32 +0200
Message-Id: <20230326143224.572654-68-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1909; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=0uTItUIXkJCcUJYvgXMkvGjLYPdx5nocsdSdg4jWtgM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFbU1UKsF/Rg/nCtZNSPCovev4z3jgC0qdYgp gq16TJd04yJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBW1AAKCRCPgPtYfRL+ TrngB/9ZNdWqKHaggV70vY7by3ZFUjstBhusa4RkF/7A014pqcK4cJR9k49TFrGqenACY2HjKF2 MjSuMPLhaWbk2I9nJhA6MbvAfNmpubvB/g9IPxVqTDVMbdOSc3Zj1rfTbfE5v0xqNCABFhSoV+U Qnr56j8xs9IWKOKfgw21GK0Q8VXOZbut4USgUfN/WtyNsBp55TiuBKwy8i4vuoZmnMsCQKkUwaO BqCsOveuoxMfzwjolnFeM3BiFMRkCJ2aE5ij60PtguqGDX2LLvxlJ4gVlvpt9lhHx1RlC29qUoA 6O4aXV2q4Dp/xuXVL66LYoGTppaUA70r5iGYiRV1PkP8akZv
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
 drivers/media/platform/samsung/exynos4-is/fimc-lite.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-lite.c b/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
index e185a40305a8..2fadb18560d7 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
@@ -1595,7 +1595,7 @@ static int fimc_lite_suspend(struct device *dev)
 }
 #endif /* CONFIG_PM_SLEEP */
 
-static int fimc_lite_remove(struct platform_device *pdev)
+static void fimc_lite_remove(struct platform_device *pdev)
 {
 	struct fimc_lite *fimc = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
@@ -1610,7 +1610,6 @@ static int fimc_lite_remove(struct platform_device *pdev)
 	fimc_lite_clk_put(fimc);
 
 	dev_info(dev, "Driver unloaded\n");
-	return 0;
 }
 
 static const struct dev_pm_ops fimc_lite_pm_ops = {
@@ -1656,7 +1655,7 @@ MODULE_DEVICE_TABLE(of, flite_of_match);
 
 static struct platform_driver fimc_lite_driver = {
 	.probe		= fimc_lite_probe,
-	.remove		= fimc_lite_remove,
+	.remove_new	= fimc_lite_remove,
 	.driver = {
 		.of_match_table = flite_of_match,
 		.name		= FIMC_LITE_DRV_NAME,
-- 
2.39.2

