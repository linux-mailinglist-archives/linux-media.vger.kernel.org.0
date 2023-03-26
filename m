Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFB766C9565
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:33:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232557AbjCZOdU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:33:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232432AbjCZOcq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:46 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC6BB7A80
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:44 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQF-0008HU-Qh; Sun, 26 Mar 2023 16:32:39 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQD-006rcU-BR; Sun, 26 Mar 2023 16:32:37 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQB-0088Wr-VA; Sun, 26 Mar 2023 16:32:35 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 048/117] media: rcar-isp: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:31:15 +0200
Message-Id: <20230326143224.572654-51-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1727; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=H9Xij91+DKvF0GTkIvcfnoR7RIAl5lpT4bjYw1+Gjos=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFbAX2oI45PUtkLYtVUOoiHXyCd+iOyR7uw6+ ewMsqY0CamJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBWwAAKCRCPgPtYfRL+ TtWhB/4oYTKCPZNvN/lgdaue4UPzzDUOjxMt3d4N6SW967pr66irUwiKHHrSVd76YQjKl30CEJq KFaShNOMfUtNEX+GA6pi7V3KK3Gpek0IMStW5BZVnXGCT2Xx14frztX8GdGn0+f5AkezqWh37Hd TUcCRGCBeSS22UXkFuDfsWjFvt6n4GrcNSflBRhH36XP4qt7IdMS2k6UlGdzxMBRY2beEFj9aDy NsdhapSuMhUmEg1fUNrvZ8qskfIMd1sUVYCmWzaZzZT3/EQFBVUrAlRF9fD6QOMyO0FFlUUZLUA LoSZI2O2M+vGg9UzkFz5+X2Yqa7KgiHsv0lKa7Pi+/Z66IC3
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
 drivers/media/platform/renesas/rcar-isp.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-isp.c b/drivers/media/platform/renesas/rcar-isp.c
index 10b3474f93a4..27fe71931a04 100644
--- a/drivers/media/platform/renesas/rcar-isp.c
+++ b/drivers/media/platform/renesas/rcar-isp.c
@@ -503,7 +503,7 @@ static int risp_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int risp_remove(struct platform_device *pdev)
+static void risp_remove(struct platform_device *pdev)
 {
 	struct rcar_isp *isp = platform_get_drvdata(pdev);
 
@@ -515,8 +515,6 @@ static int risp_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 
 	mutex_destroy(&isp->lock);
-
-	return 0;
 }
 
 static struct platform_driver rcar_isp_driver = {
@@ -525,7 +523,7 @@ static struct platform_driver rcar_isp_driver = {
 		.of_match_table = risp_of_id_table,
 	},
 	.probe = risp_probe,
-	.remove = risp_remove,
+	.remove_new = risp_remove,
 };
 
 module_platform_driver(rcar_isp_driver);
-- 
2.39.2

