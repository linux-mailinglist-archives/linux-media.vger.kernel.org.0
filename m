Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B48636C9563
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:33:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232525AbjCZOdS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:33:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232431AbjCZOcq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:46 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD6597ABB
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:44 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQG-0008Kg-5n; Sun, 26 Mar 2023 16:32:40 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQD-006rck-Uv; Sun, 26 Mar 2023 16:32:37 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQC-0088X7-Oi; Sun, 26 Mar 2023 16:32:36 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 052/117] media: rcar_fdp1: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:31:19 +0200
Message-Id: <20230326143224.572654-55-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1828; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=ep66JiQpFd5B636ftLdcfjXYfarPiHk1fH4HK7o52wk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFbFxHZo/YFxsqg6Y4hXlUqd6K7dWubV5/PkH sdNQo6+aEqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBWxQAKCRCPgPtYfRL+ TqaWB/4hyb5B5K0WPDi9mQwEtmg0ckboPZCjuTO4Zyp5B+KEhDkv70k/wDuy0kv/7cNl8tQLjum USYJ1p+yQi6lqUyCjX/VwshMVy27bRh9fAF60oWUk/+pf/6uWVT3Y7VWCcn421E81U6OScOSMAc TQeHRZU3EZxrk4qUR8lypz63FD48hGQpJ0F96jHWzurnQB0bq5LaixG1S2i7FqLxhfXqKLWziOw QfZ5J5r8xCh7fdK0Tg2jafxocOE7riUN2unrhqNpfKLGWARYZMMyTCRguzCqgXfPnBOT0byepDK g78vo+6OdhoXSho91zU1q9G8byF9+kME9c86PS+ixQRhfm+v
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
 drivers/media/platform/renesas/rcar_fdp1.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar_fdp1.c b/drivers/media/platform/renesas/rcar_fdp1.c
index 37ecf489d112..d80b3214dfae 100644
--- a/drivers/media/platform/renesas/rcar_fdp1.c
+++ b/drivers/media/platform/renesas/rcar_fdp1.c
@@ -2396,7 +2396,7 @@ static int fdp1_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int fdp1_remove(struct platform_device *pdev)
+static void fdp1_remove(struct platform_device *pdev)
 {
 	struct fdp1_dev *fdp1 = platform_get_drvdata(pdev);
 
@@ -2404,8 +2404,6 @@ static int fdp1_remove(struct platform_device *pdev)
 	video_unregister_device(&fdp1->vfd);
 	v4l2_device_unregister(&fdp1->v4l2_dev);
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static int __maybe_unused fdp1_pm_runtime_suspend(struct device *dev)
@@ -2441,7 +2439,7 @@ MODULE_DEVICE_TABLE(of, fdp1_dt_ids);
 
 static struct platform_driver fdp1_pdrv = {
 	.probe		= fdp1_probe,
-	.remove		= fdp1_remove,
+	.remove_new	= fdp1_remove,
 	.driver		= {
 		.name	= DRIVER_NAME,
 		.of_match_table = fdp1_dt_ids,
-- 
2.39.2

