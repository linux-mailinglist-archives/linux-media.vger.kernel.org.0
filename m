Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A1C26C95B2
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:34:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232608AbjCZOek (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:34:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232550AbjCZOdL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:33:11 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E92D7AB6
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:33:00 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQS-0000Ui-2y; Sun, 26 Mar 2023 16:32:52 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQQ-006rhT-8e; Sun, 26 Mar 2023 16:32:50 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQP-0088au-Ez; Sun, 26 Mar 2023 16:32:49 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>
Cc:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, kernel@pengutronix.de
Subject: [PATCH 110/117] media: sunxi-cir: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:32:17 +0200
Message-Id: <20230326143224.572654-113-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1672; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=7hyD2BqMB/NdPUXZusMT/OdZctbrC0UG18HQRt8dIBM=; b=owGbwMvMwMXY3/A7olbonx/jabUkhhSFcK/2ZXb/E63WR2zw13Cb9OL8wq6rpzdVft4Q7aVU9 /JC1oQdnYzGLAyMXAyyYoos9o1rMq2q5CI71/67DDOIlQlkCgMXpwBMJFWK/Z9VTplo3hWN2Iv/ /VK2PktNdCpJ7Vir5R+6usfm85PqxarnpOdFTtwolJYsJ5UlkXvaxCJO7OE7wfxG1vKd6+qTTpp M2deR/Fc6lP3G/Psry7LTssJVRWr5l22J9uX13VPLeEq6exXH/0qpfSG5darC4iZM3p9b02I69j 2o/jVBwlUpTf3lyjhe18uH1u1eHCLP2LiTOz3/+TyB1H0f7b+vmCqsWXR+q6D9wYInE0OXlaazP 791pH3Roxghl7upG9T2vGiYdM5h1nFnr/9SmzZXb9raJ7vX/+iJaZY6UUYJp4KTxWq4RX9cnLRP Wk76ZJJ7089MzoV7m1blbPvR/PiAfKh6Tur1O8GHA53rAA==
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
 drivers/media/rc/sunxi-cir.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
index b631a81e58bb..75b7aed1579c 100644
--- a/drivers/media/rc/sunxi-cir.c
+++ b/drivers/media/rc/sunxi-cir.c
@@ -364,14 +364,12 @@ static int sunxi_ir_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int sunxi_ir_remove(struct platform_device *pdev)
+static void sunxi_ir_remove(struct platform_device *pdev)
 {
 	struct sunxi_ir *ir = platform_get_drvdata(pdev);
 
 	rc_unregister_device(ir->rc);
 	sunxi_ir_hw_exit(&pdev->dev);
-
-	return 0;
 }
 
 static void sunxi_ir_shutdown(struct platform_device *pdev)
@@ -413,7 +411,7 @@ MODULE_DEVICE_TABLE(of, sunxi_ir_match);
 
 static struct platform_driver sunxi_ir_driver = {
 	.probe          = sunxi_ir_probe,
-	.remove         = sunxi_ir_remove,
+	.remove_new     = sunxi_ir_remove,
 	.shutdown       = sunxi_ir_shutdown,
 	.driver = {
 		.name = SUNXI_IR_DEV,
-- 
2.39.2

