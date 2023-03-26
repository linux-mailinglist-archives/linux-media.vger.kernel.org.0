Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5557C6C9595
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:34:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232468AbjCZOeM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:34:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232513AbjCZOc6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:58 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C01147EC5
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:54 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQJ-0008TG-FG; Sun, 26 Mar 2023 16:32:43 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQG-006rdi-EY; Sun, 26 Mar 2023 16:32:40 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQE-0088Xf-LM; Sun, 26 Mar 2023 16:32:38 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Colin Ian King <colin.i.king@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 061/117] media: gsc-core: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:31:28 +0200
Message-Id: <20230326143224.572654-64-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1804; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=eCSifVDAXW1X9cqwaaO+CIz3Ffo9A6DmGqCvAijEceE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFbPr3FL7OeCsFMG8fuH3lucwcXA/JAft3Z+O qnuaKUrJFKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBWzwAKCRCPgPtYfRL+ To6mB/0b1uRTMan64x+JAXAbjBLCzuNlTD0aJ1JMcGvaw+HooBDUHxkZcBGqZjOXYNh9JX7fzl/ +2rowxWYNLnHCr8MUHenj1HqA1ZncCV5VbOp7yfbxP5ZZocsRrD/w8bkWFiFfpRq5PhwLmGes0P rSdZZwLEfSto6Hn9dC2D9gE3zfVEydSwcAstdD7aSp3Hcgcsn9Jfot61Qx3xWnKHXA29W5t2BuA UnhBg2/5zUbbgTUPFSGkDsEVcGOWzchrapyd77nC+/pXrOfbIeW9yTXtY0xWrZV8H/6pwmWRgj4 yWzbKvRkT6iE7TEPef8MsoFq7j0VyZKUqw5Zrg0mP5ej8ogf
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
 drivers/media/platform/samsung/exynos-gsc/gsc-core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos-gsc/gsc-core.c b/drivers/media/platform/samsung/exynos-gsc/gsc-core.c
index b147c645ae0b..1fb34de70649 100644
--- a/drivers/media/platform/samsung/exynos-gsc/gsc-core.c
+++ b/drivers/media/platform/samsung/exynos-gsc/gsc-core.c
@@ -1201,7 +1201,7 @@ static int gsc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int gsc_remove(struct platform_device *pdev)
+static void gsc_remove(struct platform_device *pdev)
 {
 	struct gsc_dev *gsc = platform_get_drvdata(pdev);
 	int i;
@@ -1220,7 +1220,6 @@ static int gsc_remove(struct platform_device *pdev)
 	pm_runtime_set_suspended(&pdev->dev);
 
 	dev_dbg(&pdev->dev, "%s driver unloaded\n", pdev->name);
-	return 0;
 }
 
 #ifdef CONFIG_PM
@@ -1311,7 +1310,7 @@ static const struct dev_pm_ops gsc_pm_ops = {
 
 static struct platform_driver gsc_driver = {
 	.probe		= gsc_probe,
-	.remove		= gsc_remove,
+	.remove_new	= gsc_remove,
 	.driver = {
 		.name	= GSC_MODULE_NAME,
 		.pm	= &gsc_pm_ops,
-- 
2.39.2

