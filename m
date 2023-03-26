Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF11B6C958D
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:34:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232479AbjCZOeD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:34:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232500AbjCZOcz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:55 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D464E7AB0
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:53 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQJ-0008TT-Dp; Sun, 26 Mar 2023 16:32:43 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQG-006rdn-HA; Sun, 26 Mar 2023 16:32:40 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQF-0088Y0-Or; Sun, 26 Mar 2023 16:32:39 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 066/117] media: media-dev: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:31:33 +0200
Message-Id: <20230326143224.572654-69-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2075; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=fR+7i0Q7VbhWWGpxbF+Or52vl4QTHp55EWAHRayMtsU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFbV3gGUC0NrekqDM5AUKULJFCGOs7suvsmPj cDwQMcppZyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBW1QAKCRCPgPtYfRL+ TtYNB/9moN33etmJ1WhTaL/TZZlnRdoZBEgv3KSIC2tje1scrWqkirUOHf43V5AWsQqMAYf2Qan oqhtsIQeb5IiiKS1gGvPyv6bAwqIrGzKQkOvXZljiWmy1m/L+9aSanjU1wBoFmLE+UaMuLly2wh PZiXt1cLED/yKhbp0YBNN9VtnMOrf5j1APjV6uGIXpnIlieXaHBHW7aBMW3yGnOo02xZy5TdCps hT4TuNZDrQmMZvmzx9STXyzDljeZLB8kmd2rEpfzRRCEGVa4MQgKnlhzX1SQ5e+eXPYNpQaUq4H QTOzMkGAqMi6u8A6dz4P1XM/Lw8DSapqhjVkJOWae907+R2R
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
 drivers/media/platform/samsung/exynos4-is/media-dev.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/media-dev.c b/drivers/media/platform/samsung/exynos4-is/media-dev.c
index 98a60f01129d..5ca78fee7804 100644
--- a/drivers/media/platform/samsung/exynos4-is/media-dev.c
+++ b/drivers/media/platform/samsung/exynos4-is/media-dev.c
@@ -1530,12 +1530,12 @@ static int fimc_md_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int fimc_md_remove(struct platform_device *pdev)
+static void fimc_md_remove(struct platform_device *pdev)
 {
 	struct fimc_md *fmd = platform_get_drvdata(pdev);
 
 	if (!fmd)
-		return 0;
+		return;
 
 	fimc_md_unregister_clk_provider(fmd);
 	v4l2_async_nf_unregister(&fmd->subdev_notifier);
@@ -1548,8 +1548,6 @@ static int fimc_md_remove(struct platform_device *pdev)
 	media_device_unregister(&fmd->media_dev);
 	media_device_cleanup(&fmd->media_dev);
 	fimc_md_put_clocks(fmd);
-
-	return 0;
 }
 
 static const struct platform_device_id fimc_driver_ids[] __always_unused = {
@@ -1566,7 +1564,7 @@ MODULE_DEVICE_TABLE(of, fimc_md_of_match);
 
 static struct platform_driver fimc_md_driver = {
 	.probe		= fimc_md_probe,
-	.remove		= fimc_md_remove,
+	.remove_new	= fimc_md_remove,
 	.driver = {
 		.of_match_table = of_match_ptr(fimc_md_of_match),
 		.name		= "s5p-fimc-md",
-- 
2.39.2

