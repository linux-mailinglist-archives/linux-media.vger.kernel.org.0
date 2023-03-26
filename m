Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3A6D6C952C
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:32:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232417AbjCZOco (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:32:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232356AbjCZOcf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:35 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 925A072B2
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:33 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ7-0007sS-NR; Sun, 26 Mar 2023 16:32:31 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ7-006raU-41; Sun, 26 Mar 2023 16:32:31 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ6-0088VG-FQ; Sun, 26 Mar 2023 16:32:30 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 023/117] media: m2m-deinterlace: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:30:50 +0200
Message-Id: <20230326143224.572654-26-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1724; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=+x/PkrS1Tyr7WQYINVcetSeb0sHyTBNcxeB7s1QaK1k=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFaisoF7UoJ+hz/n65RKRA7tT7Mcdrihjb9Hs vvJ83uVAEGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBWogAKCRCPgPtYfRL+ TrvoB/4kcAmXRkAFInEKf16jZIXtyBsqXvnZTj+B2HEBqMEJv4lNT1QgGw/9P1GAtaHksEBLXzc TqTydptPG5BEwKu/TTe2HlYpo75zNxTDGR6jDTapk7I9Xmi4vZUqEnoFU0U9SVaml/m643uskxJ LikTfj85SZmcs7wwRT8SH4iLye8gysqDCq2MYFGLoQsVCCKQ2y87RASJ106jH7j53w4358cnm6Q h+GWyvmFvlpzPSkRrCIadiGPL+ZmTF50NJXXgse54S8RzTX8o4mEfqfAGM6wfByLsHZ+pOXfHI7 gsif6R8A7lL0pM0SroRzb3mWF64TjjFOylHH7GZNToUbHWPz
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
 drivers/media/platform/m2m-deinterlace.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/m2m-deinterlace.c b/drivers/media/platform/m2m-deinterlace.c
index 1f89e71cdccf..96b35a5d6174 100644
--- a/drivers/media/platform/m2m-deinterlace.c
+++ b/drivers/media/platform/m2m-deinterlace.c
@@ -984,7 +984,7 @@ static int deinterlace_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int deinterlace_remove(struct platform_device *pdev)
+static void deinterlace_remove(struct platform_device *pdev)
 {
 	struct deinterlace_dev *pcdev = platform_get_drvdata(pdev);
 
@@ -993,13 +993,11 @@ static int deinterlace_remove(struct platform_device *pdev)
 	video_unregister_device(&pcdev->vfd);
 	v4l2_device_unregister(&pcdev->v4l2_dev);
 	dma_release_channel(pcdev->dma_chan);
-
-	return 0;
 }
 
 static struct platform_driver deinterlace_pdrv = {
 	.probe		= deinterlace_probe,
-	.remove		= deinterlace_remove,
+	.remove_new	= deinterlace_remove,
 	.driver		= {
 		.name	= MEM2MEM_NAME,
 	},
-- 
2.39.2

