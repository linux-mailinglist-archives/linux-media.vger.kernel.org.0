Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D72E36C9588
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:33:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232449AbjCZOd5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:33:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232380AbjCZOcz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:55 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 757D4659D
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:53 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQJ-0008TS-2D; Sun, 26 Mar 2023 16:32:43 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQG-006rdm-H0; Sun, 26 Mar 2023 16:32:40 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQE-0088Xj-TH; Sun, 26 Mar 2023 16:32:38 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 062/117] media: fimc-core: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:31:29 +0200
Message-Id: <20230326143224.572654-65-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1811; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=/gDAR1WFxT/u1905dx4UD+u34Zk0RMlD2WklQfEDbLo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFbQBClHyYs1RkuSAjmGh5nHyF+BlFnLftIh5 Bfb9lq1o9WJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBW0AAKCRCPgPtYfRL+ ToYzB/9PhprinAEP2a6NE/p3ZLk9AKr1ROKjrPbWJ5s84Fyn8wsyV06m5YRYexA+pfPDdpIiyKU ayWr1KTlQcJrjoVp0SL2Edu4Jm7mPWjPImNWH7diNSt4OJxsCyj8YWUbjFfGU143vAOR5qoGqY0 dWCUU1LfW03fhfJW3ZCoGucwhNc1St54axxmgB4llWoigbe3YqkTpl/nuXeAMD6IMoskYWd4oJh C79rA6cyXWx9+98FRvwllEHi9oHZdmRnpfWdQIOt3NTyfU9UuQuz6kh7lGrUP2Z8JQDXwkwVL4j 13nQfHiQehjA2NOyDa6AD3llDlW1OcoYfKzdYciQyPRi+SCr
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
 drivers/media/platform/samsung/exynos4-is/fimc-core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-core.c b/drivers/media/platform/samsung/exynos4-is/fimc-core.c
index 1791100b6935..a2034ade8b9e 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-core.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-core.c
@@ -1092,7 +1092,7 @@ static int fimc_suspend(struct device *dev)
 }
 #endif /* CONFIG_PM_SLEEP */
 
-static int fimc_remove(struct platform_device *pdev)
+static void fimc_remove(struct platform_device *pdev)
 {
 	struct fimc_dev *fimc = platform_get_drvdata(pdev);
 
@@ -1108,7 +1108,6 @@ static int fimc_remove(struct platform_device *pdev)
 	fimc_clk_put(fimc);
 
 	dev_info(&pdev->dev, "driver unloaded\n");
-	return 0;
 }
 
 /* S5PV210, S5PC110 */
@@ -1160,7 +1159,7 @@ static const struct dev_pm_ops fimc_pm_ops = {
 
 static struct platform_driver fimc_driver = {
 	.probe		= fimc_probe,
-	.remove		= fimc_remove,
+	.remove_new	= fimc_remove,
 	.driver = {
 		.of_match_table = fimc_of_match,
 		.name		= FIMC_DRIVER_NAME,
-- 
2.39.2

