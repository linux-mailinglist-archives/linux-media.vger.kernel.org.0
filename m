Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 860246C9594
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:34:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232498AbjCZOeL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:34:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232492AbjCZOc6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:58 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFFBE7EC1
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:54 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQR-0000Qz-99; Sun, 26 Mar 2023 16:32:51 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQP-006rh6-BP; Sun, 26 Mar 2023 16:32:49 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQO-0088aa-Cs; Sun, 26 Mar 2023 16:32:48 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 105/117] media: ir-hix5hd2: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:32:12 +0200
Message-Id: <20230326143224.572654-108-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1614; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=mtLbrou9SKVEkBABSUi2K4pwMdvqkp4GLG45TFkXHfQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFclyew6POx775Yj7c1pAel2Knwh87FkbkTU0 uKx802OhQqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBXJQAKCRCPgPtYfRL+ Tk4aCACT8Ww3jBqVXChppHGZu5CZDttduJP688Y0KByN11AMvwm1NBgW/XplIV7S27VstWmDvdO HR77HE9dMzKb/zH9DjjAaX5uLWjzIhqRkW6Oa0aI5SSMtGhoWDnEcW6jduKa3BKvocpdnb6tzIo 6HhMi0htf7J4JOELRXNWOOHcqsm6TdAXHogfji5lHoLNAqjWjtKjO63HSz2anZwF6sHzlQt9SvH me1tqS5XBpbiJTNGjl+NJuOQPa64zpyZVZnzb/fmxOG55XU60oEvdQf/Z/Rhtw0i/k2PcKpUkAk +Kl+5aIvQ3JGkQ0bUv72WEasPNkRauGjku5CAjjyKJKDcgUd
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
 drivers/media/rc/ir-hix5hd2.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/rc/ir-hix5hd2.c b/drivers/media/rc/ir-hix5hd2.c
index 4ff954b11dc7..0034f615b466 100644
--- a/drivers/media/rc/ir-hix5hd2.c
+++ b/drivers/media/rc/ir-hix5hd2.c
@@ -340,13 +340,12 @@ static int hix5hd2_ir_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int hix5hd2_ir_remove(struct platform_device *pdev)
+static void hix5hd2_ir_remove(struct platform_device *pdev)
 {
 	struct hix5hd2_ir_priv *priv = platform_get_drvdata(pdev);
 
 	clk_disable_unprepare(priv->clock);
 	rc_unregister_device(priv->rdev);
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -395,7 +394,7 @@ static struct platform_driver hix5hd2_ir_driver = {
 		.pm     = &hix5hd2_ir_pm_ops,
 	},
 	.probe = hix5hd2_ir_probe,
-	.remove = hix5hd2_ir_remove,
+	.remove_new = hix5hd2_ir_remove,
 };
 
 module_platform_driver(hix5hd2_ir_driver);
-- 
2.39.2

