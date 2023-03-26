Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B6136C9587
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:33:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232458AbjCZOd4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:33:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232464AbjCZOcy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:54 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F08BC7ED3
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:52 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQO-0000FQ-Qx; Sun, 26 Mar 2023 16:32:48 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQM-006rfr-GB; Sun, 26 Mar 2023 16:32:46 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQK-0088ZT-JA; Sun, 26 Mar 2023 16:32:44 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 088/117] media: vpif_display: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:31:55 +0200
Message-Id: <20230326143224.572654-91-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1772; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=5z/UCYi7pnVTwBpUoBR38shL1sqEGMgf8UyTOszeQ1M=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFbvLC73IX76nybiayNjhMhJgp8x2vYKfBY2F E6R2JjpVYyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBW7wAKCRCPgPtYfRL+ Tuh0B/sF7oL6VX9Pz5jq/uTqN8GHNFdUIv/fkfKN7Iooq9sNXYLvtGJ/18zjZDEhZsQWXEheKxJ E+c9hKjm/COZMS2VC5nsxE7A6tnIcuQPKZCRvwoO7k23QZR3Vjvs3NFFc+JduoUHwwIl7+LDjyD eEmKpcA5BmwNoYJoGcnrbv2L5tdpfXc8Y5k2/HN53Tur9kyXRd4oM9EGTP+rREcBlGXA9xFfR49 WPYGxdxWJTBMbXqyh59afAWH8hGVPbeYLQ2Qs7/S2yxc7q29YBBEJsOmjPSdW+KY1iyGZ5JZhb0 NEj915v6Rxm+Heo8LY/+6UorvXf9Nqg4cC3KL/4Wj5LQfN8P
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
 drivers/media/platform/ti/davinci/vpif_display.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/ti/davinci/vpif_display.c b/drivers/media/platform/ti/davinci/vpif_display.c
index b2df81603f62..f8ec2991c667 100644
--- a/drivers/media/platform/ti/davinci/vpif_display.c
+++ b/drivers/media/platform/ti/davinci/vpif_display.c
@@ -1305,7 +1305,7 @@ static __init int vpif_probe(struct platform_device *pdev)
 /*
  * vpif_remove: It un-register channels from V4L2 driver
  */
-static int vpif_remove(struct platform_device *device)
+static void vpif_remove(struct platform_device *device)
 {
 	struct channel_obj *ch;
 	int i;
@@ -1321,8 +1321,6 @@ static int vpif_remove(struct platform_device *device)
 		video_unregister_device(&ch->video_dev);
 	}
 	free_vpif_objs();
-
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -1399,7 +1397,7 @@ static __refdata struct platform_driver vpif_driver = {
 			.pm	= &vpif_pm_ops,
 	},
 	.probe	= vpif_probe,
-	.remove	= vpif_remove,
+	.remove_new = vpif_remove,
 };
 
 module_platform_driver(vpif_driver);
-- 
2.39.2

