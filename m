Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0B096C9592
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:34:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232374AbjCZOeK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:34:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232507AbjCZOc4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:56 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72CE17A80
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:54 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQQ-0000OB-O7; Sun, 26 Mar 2023 16:32:50 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQO-006rgs-Q8; Sun, 26 Mar 2023 16:32:48 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQN-0088aT-Tl; Sun, 26 Mar 2023 16:32:47 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 103/117] media: gpio-ir-recv: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:32:10 +0200
Message-Id: <20230326143224.572654-106-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1843; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=QvTjRXH1Ge8Nj0NvbEA9hePV5pbkEDLl8Hpexb8vbZ4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFceT0E6MiCO45vSDr7pg0BJpGnuN25bGhoKe WBzc4mG5tuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBXHgAKCRCPgPtYfRL+ TrACB/9Jd+qyE1bi1HzQQk5OOoXmLG8PM9mGhBChyT5JeYVymuK7MZl1OJT6NuGo/A+f0EVOunP vGDCa5RCgl+8l1UbTJEWE5Ih1+aj/GTweIc8LXB0etWe1lkUsHFLDHYvy5bX5XK842nGJyUXLNT jmwkygBJbtzGXvv4bF57POG0fU5erJAl1/JKcswdAP/ztHcl8yMIb9ZNWrE0WWxPVIe62OGA8Bs ng+kqzjpCGZ3/0WjZZwHElsWhn0IstqGNP9Mfy6QT+GiNqYC8IxvIDt4u9jW9se3qOlb8XDVJst KGwb6wM/0m5Fz4S9SW5xA9yrxLrTvGpCNv4gyX5bV+/p8Swo
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
 drivers/media/rc/gpio-ir-recv.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/rc/gpio-ir-recv.c b/drivers/media/rc/gpio-ir-recv.c
index 8dbe780dae4e..fb037788ec10 100644
--- a/drivers/media/rc/gpio-ir-recv.c
+++ b/drivers/media/rc/gpio-ir-recv.c
@@ -126,7 +126,7 @@ static int gpio_ir_recv_probe(struct platform_device *pdev)
 				"gpio-ir-recv-irq", gpio_dev);
 }
 
-static int gpio_ir_recv_remove(struct platform_device *pdev)
+static void gpio_ir_recv_remove(struct platform_device *pdev)
 {
 	struct gpio_rc_dev *gpio_dev = platform_get_drvdata(pdev);
 	struct device *pmdev = gpio_dev->pmdev;
@@ -139,8 +139,6 @@ static int gpio_ir_recv_remove(struct platform_device *pdev)
 		pm_runtime_put_noidle(pmdev);
 		pm_runtime_set_suspended(pmdev);
 	}
-
-	return 0;
 }
 
 #ifdef CONFIG_PM
@@ -202,7 +200,7 @@ MODULE_DEVICE_TABLE(of, gpio_ir_recv_of_match);
 
 static struct platform_driver gpio_ir_recv_driver = {
 	.probe  = gpio_ir_recv_probe,
-	.remove = gpio_ir_recv_remove,
+	.remove_new = gpio_ir_recv_remove,
 	.driver = {
 		.name   = KBUILD_MODNAME,
 		.of_match_table = of_match_ptr(gpio_ir_recv_of_match),
-- 
2.39.2

