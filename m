Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C513A6C9539
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:32:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232469AbjCZOcv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:32:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232377AbjCZOch (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:37 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D0A859DB
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:34 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ8-0007tF-79; Sun, 26 Mar 2023 16:32:32 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ7-006raf-J7; Sun, 26 Mar 2023 16:32:31 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ6-0088VP-Us; Sun, 26 Mar 2023 16:32:30 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 025/117] media: marvell: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:30:52 +0200
Message-Id: <20230326143224.572654-28-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1711; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=WkwjvPNQqZqMwM8NkSjutUkfQT+Q0krYMsrTvqspSm8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFakvmd0VNDia30dbil7NHX0yoXlNsh04rFEE a/e5sdBM0iJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBWpAAKCRCPgPtYfRL+ TpZPB/44x3gDnaufDqR9s4Wn+JRte77LQFfMUUTj/3UvYWHsDPWx9lJ0zXALwcbNsgmOAtUPUZg GctRrY2McjtSP0RAycDUxOzO64Ae9HLABaP5AyMXsU70Me48NOOTITbNFPZtGDwssp8L1wr44WP 489TUUxNLbSOIanT+husQhHs+AhdbZlAItt4VMsfy4lrDmgu00o7Jg/72ZA0jJUX6CR3kgTrd2h yJcE212G6H4Cc0smGLdgCyFKWrud/3dSI/+6GLQM3TdyFc7Vk0EcVZHLsq94wuK5goWR/winzco efQWzAEwdj06YeBoB/eATcGovCNq3wF97+7wOATcxPPt4+o9
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
 drivers/media/platform/marvell/mmp-driver.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/marvell/mmp-driver.c b/drivers/media/platform/marvell/mmp-driver.c
index 964c55eacd89..e93feefb447b 100644
--- a/drivers/media/platform/marvell/mmp-driver.c
+++ b/drivers/media/platform/marvell/mmp-driver.c
@@ -287,14 +287,13 @@ static int mmpcam_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mmpcam_remove(struct platform_device *pdev)
+static void mmpcam_remove(struct platform_device *pdev)
 {
 	struct mmp_camera *cam = platform_get_drvdata(pdev);
 	struct mcam_camera *mcam = &cam->mcam;
 
 	mccic_shutdown(mcam);
 	pm_runtime_force_suspend(mcam->dev);
-	return 0;
 }
 
 /*
@@ -360,7 +359,7 @@ MODULE_DEVICE_TABLE(of, mmpcam_of_match);
 
 static struct platform_driver mmpcam_driver = {
 	.probe		= mmpcam_probe,
-	.remove		= mmpcam_remove,
+	.remove_new	= mmpcam_remove,
 	.driver = {
 		.name	= "mmp-camera",
 		.of_match_table = of_match_ptr(mmpcam_of_match),
-- 
2.39.2

