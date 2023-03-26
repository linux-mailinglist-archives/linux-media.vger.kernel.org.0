Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FA816C95A3
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:34:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232500AbjCZOeZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:34:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232394AbjCZOdC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:33:02 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB76B5FD7
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:57 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQT-0000Z5-7L; Sun, 26 Mar 2023 16:32:53 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQR-006rhq-9z; Sun, 26 Mar 2023 16:32:51 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQQ-0088bA-BZ; Sun, 26 Mar 2023 16:32:50 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 114/117] media: vimc-core: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:32:21 +0200
Message-Id: <20230326143224.572654-117-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1790; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=noigLH5FPu00eRydnUiSIs9qodhVusSLw+vfqx9NHoE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFdT+0A2BTjP/WFcRjPwax+WfrS+Zy3mOWy2v vtcDR7VmVaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBXUwAKCRCPgPtYfRL+ TmqNB/0cG4AI97rl+lefkFeSUJczvI9xQcV1NLWsNxl3hVOIH4hfpYptIQZLvdeF/FVmVakC8g9 Zl2zwnmG6v9VNQLW1DKlApOTmBawvhd4Z9tGto5BVqCkL+j15feMuFnLWflkV7ISrZj6IrY8STf np8x4DFSGBL5XwX6x+VN1OW28ypypfHJWSP0bVLgpHqDGj4LeI1J9q4KcS/qOn0wVQL/H1uPl69 s1kLBY4z++EYBERCMTj7D2wmZTXW/z/JSYuem0CWyE5TLB/WKZLWjwG5vu3ahZdITXOdRka5Ct6 RwT2rkvfQ9m9n4aQTjO1u7MLsHpQfcCKk2s6QThnBWQJrD9v
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
 drivers/media/test-drivers/vimc/vimc-core.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/test-drivers/vimc/vimc-core.c b/drivers/media/test-drivers/vimc/vimc-core.c
index e82cfa5ffbf4..af127476e920 100644
--- a/drivers/media/test-drivers/vimc/vimc-core.c
+++ b/drivers/media/test-drivers/vimc/vimc-core.c
@@ -387,7 +387,7 @@ static int vimc_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int vimc_remove(struct platform_device *pdev)
+static void vimc_remove(struct platform_device *pdev)
 {
 	struct vimc_device *vimc = platform_get_drvdata(pdev);
 
@@ -397,8 +397,6 @@ static int vimc_remove(struct platform_device *pdev)
 	media_device_unregister(&vimc->mdev);
 	v4l2_device_unregister(&vimc->v4l2_dev);
 	v4l2_device_put(&vimc->v4l2_dev);
-
-	return 0;
 }
 
 static void vimc_dev_release(struct device *dev)
@@ -412,7 +410,7 @@ static struct platform_device vimc_pdev = {
 
 static struct platform_driver vimc_pdrv = {
 	.probe		= vimc_probe,
-	.remove		= vimc_remove,
+	.remove_new	= vimc_remove,
 	.driver		= {
 		.name	= VIMC_PDEV_NAME,
 	},
-- 
2.39.2

