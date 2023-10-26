Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E69A37D8081
	for <lists+linux-media@lfdr.de>; Thu, 26 Oct 2023 12:18:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230330AbjJZKSj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Oct 2023 06:18:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbjJZKSg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Oct 2023 06:18:36 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4E9919D
        for <linux-media@vger.kernel.org>; Thu, 26 Oct 2023 03:18:33 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qvxRc-0002ng-Gp; Thu, 26 Oct 2023 12:18:28 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qvxRc-004O1x-2n; Thu, 26 Oct 2023 12:18:28 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qvxRb-006XU2-Pq; Thu, 26 Oct 2023 12:18:27 +0200
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
Subject: [PATCH 2/3] media: meson-ir-tx: Simplify and improve using dev_err_probe()
Date:   Thu, 26 Oct 2023 12:18:19 +0200
Message-ID: <20231026101816.2460464-7-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231026101816.2460464-5-u.kleine-koenig@pengutronix.de>
References: <20231026101816.2460464-5-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1611; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=xP/HXyC7f9rnqXpYHkc5zFosg3Ou9P4+kgR9nBBBZqc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlOjzrZOzRNoBEbh0+ts8giNj+oBxAwnhW3Xlhs b/TvKU1hnCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZTo86wAKCRCPgPtYfRL+ Tr9wB/0Xr5LPgszjKEwgg3Eitd3x3TtWYxK/WCYKYhW6e2BCGfscdXowyievh3k5RKQxJxuZqoD HKqlVrMTSBYs6QKHgylNpfAdBD7hFYnGU5l6B9DXZJRUApiG2YyttKZ+kt/2V2f6jZD4fydC90B j5ql1oX55cMx1aphJ5Y2ooJX+QBiyikdkpdOFgRDr1PXzesCDVeN7rUgCVxGOaCExmjgumkMZEo c1PxcUhnNQuCT48r8yskGSW1j0GoTa5YJ079kIX9Wam0id9euK/fTLL+8A9Caw19iZb2N9MTPX3 q3bBrkTVooI0rKlGuj/zK4fTDDeAclJvcQv0Dd5pklRb9rNi
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

With dev_err_probe() the error paths can be implemented in a more
condensed way with the added benefit that the error code is added to the
error messages by name.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/media/rc/meson-ir-tx.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/media/rc/meson-ir-tx.c b/drivers/media/rc/meson-ir-tx.c
index dab548dc6302..bd85361d561f 100644
--- a/drivers/media/rc/meson-ir-tx.c
+++ b/drivers/media/rc/meson-ir-tx.c
@@ -333,20 +333,17 @@ static int __init meson_irtx_probe(struct platform_device *pdev)
 	spin_lock_init(&ir->lock);
 
 	ret = meson_irtx_mod_clock_probe(ir, &clk_nr);
-	if (ret) {
-		dev_err(dev, "modulator clock setup failed\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "modulator clock setup failed\n");
+
 	meson_irtx_setup(ir, clk_nr);
 
 	ret = devm_request_irq(dev, irq,
 			       meson_irtx_irqhandler,
 			       IRQF_TRIGGER_RISING,
 			       DRIVER_NAME, ir);
-	if (ret) {
-		dev_err(dev, "irq request failed\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "irq request failed\n");
 
 	rc = rc_allocate_device(RC_DRIVER_IR_RAW_TX);
 	if (!rc)
@@ -362,9 +359,8 @@ static int __init meson_irtx_probe(struct platform_device *pdev)
 
 	ret = devm_rc_register_device(dev, rc);
 	if (ret < 0) {
-		dev_err(dev, "rc_dev registration failed\n");
 		rc_free_device(rc);
-		return ret;
+		return dev_err_probe(dev, ret, "rc_dev registration failed\n");
 	}
 
 	return 0;
-- 
2.42.0

