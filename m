Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEF0B6C959D
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:34:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232596AbjCZOeT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:34:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232474AbjCZOdB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:33:01 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DBFF35A0
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:55 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQQ-0000NV-HX; Sun, 26 Mar 2023 16:32:50 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQO-006rgo-JM; Sun, 26 Mar 2023 16:32:48 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQN-0088aO-LG; Sun, 26 Mar 2023 16:32:47 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Eduardo Valentin <edubezval@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 102/117] media: radio-platform-si4713: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:32:09 +0200
Message-Id: <20230326143224.572654-105-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2081; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=latyRcX3Cuz+KrS8QqhhZjtxZX/vMr10c1SA0hWivvs=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFcdFik6RuJGFqKxtuaCXsUOpA+2AqQXC5moZ wP1y+NUcLaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBXHQAKCRCPgPtYfRL+ Tmy4B/4wm9m7UvS6kZiEzZ+XgydNqY7dpv2rRMYoxsuaEMoG8zU7f8iuWcbsK1W73+nqR3EAOj/ qQAYFpALz4onrsMaMYwAWEmK8f8HUQBq2xBBjdECL5+eQXCwfFL6QR75dXGQuACx2Gk0fFpUM6V YxGuVe5UBB95gbUKLNqjgHp8/TTTfGLatHxB9K6MeeUjEhu2Ri7gY8+AanSR5AyosYW/F59b6/V XTfZn/N8qrP/OUrh+MJduae2OduqirCBU4jDU0KGjxsRC4KLoxK0JcWopiZ+1D9yXFAUiFw4iSS umdeeb5toUOxnh6GGM6tUYlOKc6N1kfksg3ubfDyqGvc4cq4
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
 drivers/media/radio/si4713/radio-platform-si4713.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/radio/si4713/radio-platform-si4713.c b/drivers/media/radio/si4713/radio-platform-si4713.c
index 433f9642786d..9fdaed68a962 100644
--- a/drivers/media/radio/si4713/radio-platform-si4713.c
+++ b/drivers/media/radio/si4713/radio-platform-si4713.c
@@ -190,7 +190,7 @@ static int radio_si4713_pdriver_probe(struct platform_device *pdev)
 }
 
 /* radio_si4713_pdriver_remove - remove the device */
-static int radio_si4713_pdriver_remove(struct platform_device *pdev)
+static void radio_si4713_pdriver_remove(struct platform_device *pdev)
 {
 	struct v4l2_device *v4l2_dev = platform_get_drvdata(pdev);
 	struct radio_si4713_device *rsdev;
@@ -198,8 +198,6 @@ static int radio_si4713_pdriver_remove(struct platform_device *pdev)
 	rsdev = container_of(v4l2_dev, struct radio_si4713_device, v4l2_dev);
 	video_unregister_device(&rsdev->radio_dev);
 	v4l2_device_unregister(&rsdev->v4l2_dev);
-
-	return 0;
 }
 
 static struct platform_driver radio_si4713_pdriver = {
@@ -207,7 +205,7 @@ static struct platform_driver radio_si4713_pdriver = {
 		.name	= "radio-si4713",
 	},
 	.probe		= radio_si4713_pdriver_probe,
-	.remove         = radio_si4713_pdriver_remove,
+	.remove_new     = radio_si4713_pdriver_remove,
 };
 
 module_platform_driver(radio_si4713_pdriver);
-- 
2.39.2

