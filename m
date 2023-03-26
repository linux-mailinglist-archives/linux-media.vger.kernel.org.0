Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A1A16C9550
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:33:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231808AbjCZOdD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:33:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231821AbjCZOck (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:40 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D78E769A
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:39 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQB-00080x-MR; Sun, 26 Mar 2023 16:32:35 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ9-006rbJ-RW; Sun, 26 Mar 2023 16:32:33 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ8-0088Vy-Ug; Sun, 26 Mar 2023 16:32:32 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Eugen Hristev <eugen.hristev@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 034/117] media: microchip-sama7g5-isc: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:31:01 +0200
Message-Id: <20230326143224.572654-37-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1957; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=aZ6EOxtvIZ9tqJoBhbJ70uVfp2VxwkuxUqxOkYcYfD8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFavjdWydg6gvCNKO9vYNIVb7gpoN3Q6BIsFL WtC64WWL6WJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBWrwAKCRCPgPtYfRL+ TgyiB/95gyxi3i81+rXc7N8DS/CdOGQw3t8e7Zu4jf+ElCLvKSyNObTJEUXnE/BsVcwiv58Ryr6 VB6uwaafLts2tQH/u6Slwrggk6QNQltu8Nf7Y9xE7Yidmg0UY8o1NNNVJIJPfm0ThcylRdbV3N0 F7IZTnD7h/6nnxdeTw7QKCRrVgxtbf5nhkjqsYJfKjNNDaqtDZhmFXLPRm62e6hs7PFHu4T43Bl eb8WeGVUxBi52gVo5tNQ6bsy/ImZj7PnqwUTKS/3U7XKVoJIYiY16TnjThYEKaT7xfccVADKaux OOxUBWpGqNXc+7qGUcJyKOsq7E5ESxkpJ4knR7mF1SsG64lY
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
 drivers/media/platform/microchip/microchip-sama7g5-isc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/microchip/microchip-sama7g5-isc.c b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
index d583eafe5cc1..79ae696764d0 100644
--- a/drivers/media/platform/microchip/microchip-sama7g5-isc.c
+++ b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
@@ -577,7 +577,7 @@ static int microchip_xisc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int microchip_xisc_remove(struct platform_device *pdev)
+static void microchip_xisc_remove(struct platform_device *pdev)
 {
 	struct isc_device *isc = platform_get_drvdata(pdev);
 
@@ -592,8 +592,6 @@ static int microchip_xisc_remove(struct platform_device *pdev)
 	clk_disable_unprepare(isc->hclock);
 
 	microchip_isc_clk_cleanup(isc);
-
-	return 0;
 }
 
 static int __maybe_unused xisc_runtime_suspend(struct device *dev)
@@ -631,7 +629,7 @@ MODULE_DEVICE_TABLE(of, microchip_xisc_of_match);
 
 static struct platform_driver microchip_xisc_driver = {
 	.probe	= microchip_xisc_probe,
-	.remove	= microchip_xisc_remove,
+	.remove_new = microchip_xisc_remove,
 	.driver	= {
 		.name		= "microchip-sama7g5-xisc",
 		.pm		= &microchip_xisc_dev_pm_ops,
-- 
2.39.2

