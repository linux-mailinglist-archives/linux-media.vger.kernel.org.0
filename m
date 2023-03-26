Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93AFD6C95A9
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:34:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232524AbjCZOea (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:34:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232546AbjCZOdF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:33:05 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 794266593
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:58 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQS-0000UE-1O; Sun, 26 Mar 2023 16:32:52 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQQ-006rhN-4K; Sun, 26 Mar 2023 16:32:50 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQO-0088ai-Qv; Sun, 26 Mar 2023 16:32:48 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, kernel@pengutronix.de
Subject: [PATCH 107/117] media: meson-ir: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:32:14 +0200
Message-Id: <20230326143224.572654-110-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1811; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=wYp5LkcV04MNjqVKDISGMwVDxC08wU2j1G438UbXmc8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFc8B6ECdtaukjrMUlW1e4Am7PV23oSJwTSf7 OW/cQKXajuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBXPAAKCRCPgPtYfRL+ TjD8B/9ityswRX4rXG8YFgpVAK+DucWXEhqR7mgWOi4xafFoXQHOz1DViHXR2fqT4og3dIxxdu7 PEGwuvFcnFXLKqLrUZJjAvw2FbwFxZoIVGKATTAljND2DFkHNewqzg2oNwoPTy6lsnrMKuH2lr8 yqG5fnuSuZzCOzfGjsDx0QwQjyMb9Fo6f6KXCU0Ubb7agkNLhofwlos+0WEIjKBRSQCX17aDY+j 3fozbtMGts5Cmg2cJD8HzYzWli2I1Qw0oZFjjSXcVGKQ5zIj6FMQ/ig+Ymu31dH2t5rJvNKD3PW Y5Xufu+bEPutpRRx4q9VpqDh4mAP2h/E1t5hTHHNdUHAw7Vn
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
 drivers/media/rc/meson-ir.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/rc/meson-ir.c b/drivers/media/rc/meson-ir.c
index 4b769111f78e..49aa309d1a8c 100644
--- a/drivers/media/rc/meson-ir.c
+++ b/drivers/media/rc/meson-ir.c
@@ -177,7 +177,7 @@ static int meson_ir_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int meson_ir_remove(struct platform_device *pdev)
+static void meson_ir_remove(struct platform_device *pdev)
 {
 	struct meson_ir *ir = platform_get_drvdata(pdev);
 	unsigned long flags;
@@ -186,8 +186,6 @@ static int meson_ir_remove(struct platform_device *pdev)
 	spin_lock_irqsave(&ir->lock, flags);
 	meson_ir_set_mask(ir, IR_DEC_REG1, REG1_ENABLE, 0);
 	spin_unlock_irqrestore(&ir->lock, flags);
-
-	return 0;
 }
 
 static void meson_ir_shutdown(struct platform_device *pdev)
@@ -226,7 +224,7 @@ MODULE_DEVICE_TABLE(of, meson_ir_match);
 
 static struct platform_driver meson_ir_driver = {
 	.probe		= meson_ir_probe,
-	.remove		= meson_ir_remove,
+	.remove_new	= meson_ir_remove,
 	.shutdown	= meson_ir_shutdown,
 	.driver = {
 		.name		= DRIVER_NAME,
-- 
2.39.2

