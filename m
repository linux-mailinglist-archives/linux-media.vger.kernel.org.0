Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F05626C9562
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:33:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232569AbjCZOdR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:33:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232354AbjCZOcp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:45 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EB4B7ABE
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:44 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQF-0008Hp-SW; Sun, 26 Mar 2023 16:32:39 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQD-006rcb-F0; Sun, 26 Mar 2023 16:32:37 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQB-0088Wn-PH; Sun, 26 Mar 2023 16:32:35 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 047/117] media: rcar-fcp: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:31:14 +0200
Message-Id: <20230326143224.572654-50-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1809; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=HOnp3fnDdiAtu7mHXeRwe9TTiGOr9s+ukY2fTy4ZTHQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFa/vEI9nBE95QuR5cH6f2HZre7YZAMERty65 1pd7vHi6LuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBWvwAKCRCPgPtYfRL+ TiguB/4yBR0TtvQip2NJtIemL1cL+qLnjmfJqNI4o19veEIdOkNqVIWw1qlJ4KzZwUN5SQC3CBX 681lfq3cr2F1/dl1Q9/J5d1A/uGPEohkjSfGKIwkpNkCQeTjIGBhD5FwgDoqe6YbdR4pMJJyRnB WJD1hPakjGmgB00oIKYz8vnFBmdE77lak1/Nhmc1B3J8k+pz/WavsYZJXtImnNlKIzVs8xxdPbd 18Ita8YSdtxFU39yJlKnwn0a0hn+ZhlWvBNufy+RFW2tq+K40lF5J6o25GIengM/eu1fL6B4Axq FaN9iAodcVck+LrCNf64YIz1Xp1RrSFjWxYU2D9pcGJ1rYSk
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
 drivers/media/platform/renesas/rcar-fcp.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-fcp.c b/drivers/media/platform/renesas/rcar-fcp.c
index eb59a3ba6d0f..bcef7b87da7c 100644
--- a/drivers/media/platform/renesas/rcar-fcp.c
+++ b/drivers/media/platform/renesas/rcar-fcp.c
@@ -144,7 +144,7 @@ static int rcar_fcp_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int rcar_fcp_remove(struct platform_device *pdev)
+static void rcar_fcp_remove(struct platform_device *pdev)
 {
 	struct rcar_fcp_device *fcp = platform_get_drvdata(pdev);
 
@@ -153,8 +153,6 @@ static int rcar_fcp_remove(struct platform_device *pdev)
 	mutex_unlock(&fcp_lock);
 
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static const struct of_device_id rcar_fcp_of_match[] = {
@@ -166,7 +164,7 @@ MODULE_DEVICE_TABLE(of, rcar_fcp_of_match);
 
 static struct platform_driver rcar_fcp_platform_driver = {
 	.probe		= rcar_fcp_probe,
-	.remove		= rcar_fcp_remove,
+	.remove_new	= rcar_fcp_remove,
 	.driver		= {
 		.name	= "rcar-fcp",
 		.of_match_table = rcar_fcp_of_match,
-- 
2.39.2

