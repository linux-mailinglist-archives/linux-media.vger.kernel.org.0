Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42C526C958B
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:34:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232489AbjCZOeC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:34:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232459AbjCZOcz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:55 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E8317EDB
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:53 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQJ-0008TA-7P; Sun, 26 Mar 2023 16:32:43 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQG-006rdf-Bt; Sun, 26 Mar 2023 16:32:40 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQF-0088Xq-C4; Sun, 26 Mar 2023 16:32:39 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 064/117] media: fimc-is: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:31:31 +0200
Message-Id: <20230326143224.572654-67-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1910; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=YoQhZHlKBWG3AsLKqLOSSczqOknOqCR/k6LMBg0SGGA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFbT3jVoeYt9UEn3O4P1tY69DK+FCDa5okK2Y KCo1VaGbd6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBW0wAKCRCPgPtYfRL+ TlfEB/0RmiaPfSi7/Id07Mc3czBQtlK/Ppgyf/m2bHrpHFeCvm6YnFfiCH807E42bCxgYJAaqBE zMAIn+Olsji48KVxXrPLUAZik93EOLufRPEesy7zhf60FT44zKoT0OhFqXaNX+ZDBIYV/ou5CRu OrWCW9DJPYBx50iEGp9u3u+e1LYVT//iGJdARFaxLuF7nD+8WqRmH6LuGgg0CvyNhOyAGZdIntZ Rd4rxs4uDopXdAVbEbWLoGF1KkzQ1pzpuHsMwTe21gL9V+06ueWMtprTHzUMiHxFocHCtnXaqJR eucJHGeDhYKlEImTTlyUkKXoaSOZPOQs2SPOVSuijEeCrRF5
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
 drivers/media/platform/samsung/exynos4-is/fimc-is.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-is.c b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
index a7704ff069d6..530a148fe4d3 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-is.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
@@ -915,7 +915,7 @@ static int fimc_is_suspend(struct device *dev)
 }
 #endif /* CONFIG_PM_SLEEP */
 
-static int fimc_is_remove(struct platform_device *pdev)
+static void fimc_is_remove(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct fimc_is *is = dev_get_drvdata(dev);
@@ -932,8 +932,6 @@ static int fimc_is_remove(struct platform_device *pdev)
 	fimc_is_debugfs_remove(is);
 	release_firmware(is->fw.f_w);
 	fimc_is_free_cpu_memory(is);
-
-	return 0;
 }
 
 static const struct of_device_id fimc_is_of_match[] = {
@@ -950,7 +948,7 @@ static const struct dev_pm_ops fimc_is_pm_ops = {
 
 static struct platform_driver fimc_is_driver = {
 	.probe		= fimc_is_probe,
-	.remove		= fimc_is_remove,
+	.remove_new	= fimc_is_remove,
 	.driver = {
 		.of_match_table	= fimc_is_of_match,
 		.name		= FIMC_IS_DRV_NAME,
-- 
2.39.2

