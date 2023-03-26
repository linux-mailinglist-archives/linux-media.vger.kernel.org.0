Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63E5B6C955E
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:33:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232559AbjCZOdN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:33:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232420AbjCZOco (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:44 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32F056594
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:43 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQA-0007qV-Bf; Sun, 26 Mar 2023 16:32:34 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ6-006ra2-6n; Sun, 26 Mar 2023 16:32:30 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ5-0088Uw-DV; Sun, 26 Mar 2023 16:32:29 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Eugen Hristev <eugen.hristev@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Cc:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@pengutronix.de
Subject: [PATCH 018/117] media: atmel-isi: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:30:45 +0200
Message-Id: <20230326143224.572654-21-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1790; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=OyX9jxWmd9TDLXV+fieICgqwCoyba6GM9yyt29ZPi6E=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFac7ad1LpFyPQNJC8wnhSzLOG+CMdj+T1f0l N+BuNEyOW+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBWnAAKCRCPgPtYfRL+ TjjQB/0SkQ8CZag8EIFbpLjAq8MXbDjOeOBHJszlZaEOrcNCLzeGFS075jL+aHXMYKo2epVAzIC GF+ND/bI8C7icQ40wiUOZRPAEbbNGd7BBTaset14zyfUdAixzh35tS6mEpGy83xoNVUmKiWhcmT NoPGBr3LnYMA3phkXJ39qdSEUAmXXM6GvC1TFaSa0bS2qR1GGaDlyq0DcToofSeo87b1XTXcly1 v2tsYmixr3YuDajsM6T1thN3E9Hu/NHCqWenZBfWI3sgKiuUFF8DDAFjf/t02bZiLNNqp6h3nGZ Is6wAMVOyNWu0vVo+aOvghzuvEgZMi4+VyVdeg7WObI5zShi
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
 drivers/media/platform/atmel/atmel-isi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/atmel/atmel-isi.c b/drivers/media/platform/atmel/atmel-isi.c
index 4d15814e4481..b063f980f9e0 100644
--- a/drivers/media/platform/atmel/atmel-isi.c
+++ b/drivers/media/platform/atmel/atmel-isi.c
@@ -1317,7 +1317,7 @@ static int atmel_isi_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int atmel_isi_remove(struct platform_device *pdev)
+static void atmel_isi_remove(struct platform_device *pdev)
 {
 	struct atmel_isi *isi = platform_get_drvdata(pdev);
 
@@ -1329,8 +1329,6 @@ static int atmel_isi_remove(struct platform_device *pdev)
 	v4l2_async_nf_unregister(&isi->notifier);
 	v4l2_async_nf_cleanup(&isi->notifier);
 	v4l2_device_unregister(&isi->v4l2_dev);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM
@@ -1368,7 +1366,7 @@ static struct platform_driver atmel_isi_driver = {
 		.pm	= &atmel_isi_dev_pm_ops,
 	},
 	.probe		= atmel_isi_probe,
-	.remove		= atmel_isi_remove,
+	.remove_new	= atmel_isi_remove,
 };
 
 module_platform_driver(atmel_isi_driver);
-- 
2.39.2

