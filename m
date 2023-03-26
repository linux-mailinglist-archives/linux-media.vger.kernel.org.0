Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62BFB6C9566
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:33:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232432AbjCZOdV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:33:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232425AbjCZOcq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:46 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2742F65AC
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:45 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQG-0008L7-Nu; Sun, 26 Mar 2023 16:32:40 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQE-006rcm-1N; Sun, 26 Mar 2023 16:32:38 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQC-0088Wx-BZ; Sun, 26 Mar 2023 16:32:36 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 050/117] media: rcar-csi2: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:31:17 +0200
Message-Id: <20230326143224.572654-53-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1664; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=rzzlIfWXqPfQU48/T+BYrThE5NalpaIZnC0ld3lBsWA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFbCWdtnUZl+ZiAtPZ1QpSW5IVlI1DgRmbxAD VeqTmBvtQOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBWwgAKCRCPgPtYfRL+ TiNeB/9Fxn4R0AAaRllcZFfQdvxhpCUHV8JuvXgYX5C7yjr6Qn59zpKIZeQcTApPBQ21WnGBiFh 47Z+uNGixCd4hVfmgB0ndDj8hDPTeGYfjQP76bFbBz52eAEgD9vEd7bSRAL00nOqjMCCxl4HvgH PbKoSzoHbQp4Catf6TpDSGfF0nneWq3r6dWKIbXI8bPdUwqbAkKzlRxXjMYQ4VClFr48iZBzcg6 giYRe+tQH9P3KfLevKDDRU1JKqax5F2QwmWnhti0ZPlW7sHxeR2vVa6tnE8YNSHZHUJt58WzFY4 /yWYOigmLVAjbDcsCrmcH3MfZMjGmF0wB078FUYEmDzUN+9+
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
 drivers/media/platform/renesas/rcar-vin/rcar-csi2.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c b/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c
index 174aa6176f54..1632c9a53ac4 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c
@@ -1574,7 +1574,7 @@ static int rcsi2_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int rcsi2_remove(struct platform_device *pdev)
+static void rcsi2_remove(struct platform_device *pdev)
 {
 	struct rcar_csi2 *priv = platform_get_drvdata(pdev);
 
@@ -1585,12 +1585,10 @@ static int rcsi2_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 
 	mutex_destroy(&priv->lock);
-
-	return 0;
 }
 
 static struct platform_driver rcar_csi2_pdrv = {
-	.remove	= rcsi2_remove,
+	.remove_new = rcsi2_remove,
 	.probe	= rcsi2_probe,
 	.driver	= {
 		.name	= "rcar-csi2",
-- 
2.39.2

