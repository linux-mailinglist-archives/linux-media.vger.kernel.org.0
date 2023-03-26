Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4DA76C9564
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:33:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232418AbjCZOdT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:33:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232405AbjCZOcp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:45 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F3437D8C
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:44 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQF-0008HV-O5; Sun, 26 Mar 2023 16:32:39 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQD-006rcW-Cb; Sun, 26 Mar 2023 16:32:37 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQC-0088Wu-5A; Sun, 26 Mar 2023 16:32:36 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 049/117] media: rcar-core: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:31:16 +0200
Message-Id: <20230326143224.572654-52-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1821; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=95eFlYcFS5rE4SExkOimIwf5tFvBzgFzhyqxLBhy9Is=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFbBootwkPzYp0dHDwnmM9s0TK9ambTS6fbVT hrfQtVEAdqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBWwQAKCRCPgPtYfRL+ TgkLCACYFPdUV7Ap/CvPFrD8z760nwgR3D2L+LvXZNMGzegLv32zNlO9WyFvfWhKBQG2afZ0JO9 Tz+J57MkWsmBTkE6wca4F7C0/QD42QOgxgas5x2kEmqHEJN3w7SXh36MqhpmjBPMLX7gMJBI0sw eat1X53sN3E/ij0SB1Tqc29QGFNXC8Dup9lxDxQxAM2BxlxjsxAVfOls2+GUZRxDjZBM1i1QptU w7/yZBARxmEHX/ElLEdlkOuJnsHVuyUHNeTr8g4g47Wlk7mxeG3sbCRNeAJ9o+0NKO+uLQqD2w9 JnnOSp1sqoKhF8Pqk8KW4fGPh4ae7QX/Y78K/9+JxZBppvGd
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
 drivers/media/platform/renesas/rcar-vin/rcar-core.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index 5e53d6b7036c..1398f147e5c2 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -1442,7 +1442,7 @@ static int rcar_vin_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int rcar_vin_remove(struct platform_device *pdev)
+static void rcar_vin_remove(struct platform_device *pdev)
 {
 	struct rvin_dev *vin = platform_get_drvdata(pdev);
 
@@ -1458,8 +1458,6 @@ static int rcar_vin_remove(struct platform_device *pdev)
 		rvin_parallel_cleanup(vin);
 
 	rvin_dma_unregister(vin);
-
-	return 0;
 }
 
 static SIMPLE_DEV_PM_OPS(rvin_pm_ops, rvin_suspend, rvin_resume);
@@ -1472,7 +1470,7 @@ static struct platform_driver rcar_vin_driver = {
 		.of_match_table = rvin_of_id_table,
 	},
 	.probe = rcar_vin_probe,
-	.remove = rcar_vin_remove,
+	.remove_new = rcar_vin_remove,
 };
 
 module_platform_driver(rcar_vin_driver);
-- 
2.39.2

