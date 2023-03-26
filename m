Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD1766C9596
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:34:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232503AbjCZOeN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:34:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232515AbjCZOc6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:58 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFF187A8F
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:54 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQO-0000DX-Cd; Sun, 26 Mar 2023 16:32:48 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQL-006rfZ-Nv; Sun, 26 Mar 2023 16:32:45 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQJ-0088ZG-Vg; Sun, 26 Mar 2023 16:32:43 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Benoit Parrot <bparrot@ti.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 085/117] media: cal: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:31:52 +0200
Message-Id: <20230326143224.572654-88-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1749; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=dsE/y8UiNMwNKo0iLAt+eCV1RoNcHHbald1EhTMkBiI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFbr7yUSmw1kaY5bkc1laIGJ/wRaehBBlHJYy SXiAVakIieJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBW6wAKCRCPgPtYfRL+ TsQqCAC5mLV1njvzMB3DYN5FTc8U2JpmmggpLEOhWPRF+C6+e0fklUZvKtb9uSpQiGeaASntE3N UVehKxivPq+4GvZxAAOJHZ/kYNNfEEGnQQ0LTu1roNMQv13/mvaY+y5iJzIb0WlzFbEhejkDHpg JNLMNgnJqvLHfL9+gPspUpu1rTbPYwjajaWJ5/PJaCnSoelxaZJ0JsZfznzJJIoW/TDeO61zF7U 3O2SlwyZEkIe8u52akKnL0iCEog7NHzba7ZmcRH+dTWKvlvT5jg/VqL6nx4K0U+GwLRfvHTwsWB l89NG3YLzhQpFR2LduPTydgajvonn2fMX06hAQU8MPZWUoz+
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
 drivers/media/platform/ti/cal/cal.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/ti/cal/cal.c b/drivers/media/platform/ti/cal/cal.c
index 1236215ec70e..9c5105223d6b 100644
--- a/drivers/media/platform/ti/cal/cal.c
+++ b/drivers/media/platform/ti/cal/cal.c
@@ -1293,7 +1293,7 @@ static int cal_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int cal_remove(struct platform_device *pdev)
+static void cal_remove(struct platform_device *pdev)
 {
 	struct cal_dev *cal = platform_get_drvdata(pdev);
 	unsigned int i;
@@ -1319,8 +1319,6 @@ static int cal_remove(struct platform_device *pdev)
 	if (ret >= 0)
 		pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static int cal_runtime_resume(struct device *dev)
@@ -1364,7 +1362,7 @@ static const struct dev_pm_ops cal_pm_ops = {
 
 static struct platform_driver cal_pdrv = {
 	.probe		= cal_probe,
-	.remove		= cal_remove,
+	.remove_new	= cal_remove,
 	.driver		= {
 		.name	= CAL_MODULE_NAME,
 		.pm	= &cal_pm_ops,
-- 
2.39.2

