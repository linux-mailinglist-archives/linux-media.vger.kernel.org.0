Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B6646C954C
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:33:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232531AbjCZOdA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:33:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232389AbjCZOci (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:38 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88B82769A
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:37 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ7-0007s9-Ff; Sun, 26 Mar 2023 16:32:31 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ6-006raN-Qm; Sun, 26 Mar 2023 16:32:30 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ5-0088Uz-KW; Sun, 26 Mar 2023 16:32:29 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Maxime Ripard <mripard@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 019/117] media: cdns-csi2rx: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:30:46 +0200
Message-Id: <20230326143224.572654-22-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1687; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=xU65GjEXyj0opPkHlCIE1FNxFCt+HXo7iw5YGT1jyYA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFad5W20jJL1Oi5qOiE7anvJtnHEKiCfjSxmd vWfwn9PU1aJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBWnQAKCRCPgPtYfRL+ TsENB/wMGri/ANuQ1nmlCcb42kSiTHeIcYjejVlZ6ytt/FslQjhcsE7qFZLmBAAPLne+DfY2Cj4 OoV2HPPqWVGgvwiTtZSYcccyR7McPfF4Wj569PMdVQXs0/FV3kDZ8lNcQ9ZI0CZFo//zx/KZamb VxaSX//rqZ27oGQhWcE3NADwrQLStEIeQ1ZVrx1J/w7qwmEIJUs5sfWx8q4xespvCnvqz4vkcjb qngtXBpAr6cXUwveTffdXBkVR1djrg04Qk4xdBr17kgNTeJyzO2dnjSgDJ0I7nbdMmKCFP5gn77 x9i6YrTrfl2R/1ttriIbUk0/LFnex54QMKado831KUrcSXTO
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
 drivers/media/platform/cadence/cdns-csi2rx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index cc3ebb0d96f6..9755d1c8ceb9 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -473,14 +473,12 @@ static int csi2rx_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int csi2rx_remove(struct platform_device *pdev)
+static void csi2rx_remove(struct platform_device *pdev)
 {
 	struct csi2rx_priv *csi2rx = platform_get_drvdata(pdev);
 
 	v4l2_async_unregister_subdev(&csi2rx->subdev);
 	kfree(csi2rx);
-
-	return 0;
 }
 
 static const struct of_device_id csi2rx_of_table[] = {
@@ -491,7 +489,7 @@ MODULE_DEVICE_TABLE(of, csi2rx_of_table);
 
 static struct platform_driver csi2rx_driver = {
 	.probe	= csi2rx_probe,
-	.remove	= csi2rx_remove,
+	.remove_new = csi2rx_remove,
 
 	.driver	= {
 		.name		= "cdns-csi2rx",
-- 
2.39.2

