Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 818676C95B6
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:34:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232614AbjCZOeo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:34:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232547AbjCZOdN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:33:13 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D38A77D99
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:33:02 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQS-0000Ji-BJ; Sun, 26 Mar 2023 16:32:52 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQN-006rgW-MV; Sun, 26 Mar 2023 16:32:47 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQN-0088aD-0S; Sun, 26 Mar 2023 16:32:47 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        ye xingchen <ye.xingchen@zte.com.cn>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 099/117] media: radio-si476x: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:32:06 +0200
Message-Id: <20230326143224.572654-102-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1812; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=2aklwToCXXRcjaigeHXKipepUnrBG+3zgugohz+5bWU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFcKoU41xTLAaY+LpBeprbrGWgQIyFEcBIOf2 /O5DQd0gReJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBXCgAKCRCPgPtYfRL+ TmCBB/0TpQ5NlybANWiRB8yvOnQyuYaWieYBXkJo+OyGFhXaJ4pp48uG2jRtjjLLjgYdA8uQM5I 0Zt92agnadmDd2vW8lFC08RfyT9fabGcHhBGEJAF6Olet3N9CJU/tvj92HuYEVZFv6OoK8WrkSh leVOFrwfP8yASWHCazhTITmLjv0QwIXAESSV7MRLEEkvaTqa4Sl5ewHuCqeuS70xy/hh1DUWFEl F7iwfaiKG/JGY/0qioX17ez9HhC7eS5ME5kZaBveeVWGLOAe/JFmr8QYuT/GgU9vTv8X+ICBkdI v014p9+DKlThQdv/jR+5yDZ6dUxh/wm/wP4/bG2XpwCFLeXR
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
 drivers/media/radio/radio-si476x.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/radio/radio-si476x.c b/drivers/media/radio/radio-si476x.c
index 171f9cc9ee5e..6061506159f1 100644
--- a/drivers/media/radio/radio-si476x.c
+++ b/drivers/media/radio/radio-si476x.c
@@ -1498,7 +1498,7 @@ static int si476x_radio_probe(struct platform_device *pdev)
 	return rval;
 }
 
-static int si476x_radio_remove(struct platform_device *pdev)
+static void si476x_radio_remove(struct platform_device *pdev)
 {
 	struct si476x_radio *radio = platform_get_drvdata(pdev);
 
@@ -1506,8 +1506,6 @@ static int si476x_radio_remove(struct platform_device *pdev)
 	video_unregister_device(&radio->videodev);
 	v4l2_device_unregister(&radio->v4l2dev);
 	debugfs_remove_recursive(radio->debugfs);
-
-	return 0;
 }
 
 MODULE_ALIAS("platform:si476x-radio");
@@ -1517,7 +1515,7 @@ static struct platform_driver si476x_radio_driver = {
 		.name	= DRIVER_NAME,
 	},
 	.probe		= si476x_radio_probe,
-	.remove		= si476x_radio_remove,
+	.remove_new	= si476x_radio_remove,
 };
 module_platform_driver(si476x_radio_driver);
 
-- 
2.39.2

