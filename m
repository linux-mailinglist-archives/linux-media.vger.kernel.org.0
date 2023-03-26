Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EB046C9589
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:34:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232460AbjCZOd7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:33:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232489AbjCZOcy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:54 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B63757AAB
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:52 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQJ-0008UY-Vx; Sun, 26 Mar 2023 16:32:44 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQH-006re6-7G; Sun, 26 Mar 2023 16:32:41 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQG-0088YD-EA; Sun, 26 Mar 2023 16:32:40 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     =?utf-8?q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 069/117] media: g2d: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:31:36 +0200
Message-Id: <20230326143224.572654-72-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1755; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=Pjp63zOLNnq1816vUxN+0dBZPM6OKh7jFCklpMDKqZ8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFbYdqkJMOcgGfQZHo+nlYPWSslTdvXzowB/t nJw1uCHufWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBW2AAKCRCPgPtYfRL+ TksrB/9Xte0wAuJ3tjgEtEX3iOLqW8H8HjxhncIH8pbg5HQSFRHWIleTjvJemiKOYkBY5AQAq7e NnAYM9zzsJmbuJjiRuoERyTN2QATMRgCSc0N7oLJGQD8MlXXx/Pei4+/aALhvR1vKs+3DGQ0Gni Z/kMESK3jS0jNnZ4xc6lfE8FH8c5sVLb4T3MZIMlFa/D5xStPWIwkOeV2jpzWY/h50GWgUk6/rn PJaOqeOX9PWK1CgeT0kLF8jTxG5lbmqGFaWbVCBRHz+75MBWQPpWaAA9bfztTAd1xljExhIe+B2 3lG36JHISKCFuawLXmxj74gZfOPc23h49iaS+QrO/DTQzduZ
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
 drivers/media/platform/samsung/s5p-g2d/g2d.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/samsung/s5p-g2d/g2d.c b/drivers/media/platform/samsung/s5p-g2d/g2d.c
index dd8864779a7c..89aeba47ed07 100644
--- a/drivers/media/platform/samsung/s5p-g2d/g2d.c
+++ b/drivers/media/platform/samsung/s5p-g2d/g2d.c
@@ -740,7 +740,7 @@ static int g2d_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int g2d_remove(struct platform_device *pdev)
+static void g2d_remove(struct platform_device *pdev)
 {
 	struct g2d_dev *dev = platform_get_drvdata(pdev);
 
@@ -753,7 +753,6 @@ static int g2d_remove(struct platform_device *pdev)
 	clk_put(dev->gate);
 	clk_unprepare(dev->clk);
 	clk_put(dev->clk);
-	return 0;
 }
 
 static struct g2d_variant g2d_drvdata_v3x = {
@@ -778,7 +777,7 @@ MODULE_DEVICE_TABLE(of, exynos_g2d_match);
 
 static struct platform_driver g2d_pdrv = {
 	.probe		= g2d_probe,
-	.remove		= g2d_remove,
+	.remove_new	= g2d_remove,
 	.driver		= {
 		.name = G2D_NAME,
 		.of_match_table = exynos_g2d_match,
-- 
2.39.2

