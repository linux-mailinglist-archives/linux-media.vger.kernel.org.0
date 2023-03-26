Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B4986C95A4
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:34:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232537AbjCZOe0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:34:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232159AbjCZOdC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:33:02 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9C1F49EA
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:56 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQN-0000BK-9q; Sun, 26 Mar 2023 16:32:47 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQK-006rfB-Bf; Sun, 26 Mar 2023 16:32:44 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQJ-0088Z3-Bc; Sun, 26 Mar 2023 16:32:43 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jernej Skrabec <jernej.skrabec@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>
Cc:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, kernel@pengutronix.de
Subject: [PATCH 082/117] media: sun8i-di: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:31:49 +0200
Message-Id: <20230326143224.572654-85-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1908; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=yLXUqUylUuobWYFHwj53KPR92uDluuNNDDMLeKSv0Y8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFborjt211qSXlAPZaLGhpiA3qT74FVsKGNxP vMQ62HSn8CJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBW6AAKCRCPgPtYfRL+ TqQvCACgKXheyLOpoz/d94swUM3JoIL3HCywHIu572DbA1fXGj/dQWFUV8z15sL35Ds47ZGupMs /gixu48XtktWQTzaGsX0K8xCyhA+8HnJAPXEhBu9GoJVufEgFtmyHS2AIhPVg175ikfyRZoSy/M E2X086PHpAyX6cT74H0V7qyUuWV5xDR226IiZHVAXSDW/Fa8VVCZxiWBeod7VyIz55unrN7BGA3 Es5TGMT5e39o/GyqmXCBb8mBWy2unpMjtb7+pIsJ6OoOIU3AECq7WqFY8hcOgPz6VSN6WGU3gY6 Bs7J91ie4TetABVQkd0PmhfXMKblxVp5A2wDfyilxDDV0pYk
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
 drivers/media/platform/sunxi/sun8i-di/sun8i-di.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
index aa65d70b6270..e4b0fd793f55 100644
--- a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
+++ b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
@@ -906,7 +906,7 @@ static int deinterlace_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int deinterlace_remove(struct platform_device *pdev)
+static void deinterlace_remove(struct platform_device *pdev)
 {
 	struct deinterlace_dev *dev = platform_get_drvdata(pdev);
 
@@ -915,8 +915,6 @@ static int deinterlace_remove(struct platform_device *pdev)
 	v4l2_device_unregister(&dev->v4l2_dev);
 
 	pm_runtime_force_suspend(&pdev->dev);
-
-	return 0;
 }
 
 static int deinterlace_runtime_resume(struct device *device)
@@ -1002,7 +1000,7 @@ static const struct dev_pm_ops deinterlace_pm_ops = {
 
 static struct platform_driver deinterlace_driver = {
 	.probe		= deinterlace_probe,
-	.remove		= deinterlace_remove,
+	.remove_new	= deinterlace_remove,
 	.driver		= {
 		.name		= DEINTERLACE_NAME,
 		.of_match_table	= deinterlace_dt_match,
-- 
2.39.2

