Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 332D86C959E
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:34:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232599AbjCZOeU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:34:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232506AbjCZOdB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:33:01 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B1D030E8
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:55 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQR-0000Pb-0a; Sun, 26 Mar 2023 16:32:51 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQP-006rh1-4S; Sun, 26 Mar 2023 16:32:49 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQO-0088aX-58; Sun, 26 Mar 2023 16:32:48 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 104/117] media: img-ir-core: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:32:11 +0200
Message-Id: <20230326143224.572654-107-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1768; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=FdPbm/+UkY5FDBnASIREqYQAQDnzqtJogRXQYqD9aAM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFckmkC7sIz5o6kW4kmp3VjseL8y5jOILNUDV yxZFBVhRxGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBXJAAKCRCPgPtYfRL+ TomGB/9OhPI8It4ZqkLvTVfnsaXYcl14zj2akyVC+oVEiC+zy9urokN0yZT4/EySfIFXVeZ85Ww D/INK4f8gIXGqpDmj9tBflYL0O6qip+Z5rq9p0b+LYsdVJuR8Y7L1KZGUjaDhHTyn/BiPav74Ec UM/GB16LbOEf73jIiIK+InAk0KE2L6LpPskmDtFkE04DviP5bOeQ+7dStozF+Kq8znfK9fdUFa0 vLYn36jwiwH7byjAHOylMhUVZeznn2UuCzlvpeh4AdsD5JQAZ8sl5mXA46KPKxNvoHcujBus2p9 QX+Z871JWG9dcUYTCwgfFquFWjKpiV9CqcaNohJQY+zBlwnf
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
 drivers/media/rc/img-ir/img-ir-core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/rc/img-ir/img-ir-core.c b/drivers/media/rc/img-ir/img-ir-core.c
index 6f8464872033..d87d8e14c556 100644
--- a/drivers/media/rc/img-ir/img-ir-core.c
+++ b/drivers/media/rc/img-ir/img-ir-core.c
@@ -152,7 +152,7 @@ static int img_ir_probe(struct platform_device *pdev)
 	return error;
 }
 
-static int img_ir_remove(struct platform_device *pdev)
+static void img_ir_remove(struct platform_device *pdev)
 {
 	struct img_ir_priv *priv = platform_get_drvdata(pdev);
 
@@ -164,7 +164,6 @@ static int img_ir_remove(struct platform_device *pdev)
 		clk_disable_unprepare(priv->clk);
 	if (!IS_ERR(priv->sys_clk))
 		clk_disable_unprepare(priv->sys_clk);
-	return 0;
 }
 
 static SIMPLE_DEV_PM_OPS(img_ir_pmops, img_ir_suspend, img_ir_resume);
@@ -182,7 +181,7 @@ static struct platform_driver img_ir_driver = {
 		.pm = &img_ir_pmops,
 	},
 	.probe = img_ir_probe,
-	.remove = img_ir_remove,
+	.remove_new = img_ir_remove,
 };
 
 module_platform_driver(img_ir_driver);
-- 
2.39.2

