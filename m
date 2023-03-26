Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C5456C959C
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:34:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232527AbjCZOeS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:34:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232528AbjCZOdA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:33:00 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6D1410F5
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:55 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQM-0008Vn-2h; Sun, 26 Mar 2023 16:32:46 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQI-006reH-0h; Sun, 26 Mar 2023 16:32:42 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQG-0088YP-Tu; Sun, 26 Mar 2023 16:32:40 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 071/117] media: s5p_mfc: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:31:38 +0200
Message-Id: <20230326143224.572654-74-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1818; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=POKZFpij1G0A5FGdAey8RIk/pX8gSv8910ObNKDVQZI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFbbRUsksmB82lUWVdPtKzggqQbQ8MLkyWDW9 htTyQx9q3CJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBW2wAKCRCPgPtYfRL+ Tre8B/939ec9m4A8vt1/3afsJDBbytHUmyex/kph9TTBE38+OGfiQqS5sX1Y5BCsdbUU/SqWFDb /APHGPPENxRt/4gG1Y3jF8b2P9OxQ5+5N1JQW+l4L6jnNJGHCsUDdc4j6puVD0YUKitTQnB/XdB KNAoFbawf8O5cXLpuFULS3vab9ft8Dd4l/Tb+K0MGzcjIErKSVQWwk4RBsHDVk7DD8VOTuugV1C fFLbk0xlw8xRkbEZsM3377FjCocdzvfSztGfRReA6u1qek44WWjIcD/10uHr7Kck9jWgO0Xy7kK Epgo1j+wDi8jCtQPVHubvNRzpic9qeVNCedUrAt1wEo55x9N
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
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
index 9d2cce124a34..e30e54935d79 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
@@ -1431,7 +1431,7 @@ static int s5p_mfc_probe(struct platform_device *pdev)
 }
 
 /* Remove the driver */
-static int s5p_mfc_remove(struct platform_device *pdev)
+static void s5p_mfc_remove(struct platform_device *pdev)
 {
 	struct s5p_mfc_dev *dev = platform_get_drvdata(pdev);
 	struct s5p_mfc_ctx *ctx;
@@ -1463,7 +1463,6 @@ static int s5p_mfc_remove(struct platform_device *pdev)
 	s5p_mfc_unconfigure_dma_memory(dev);
 
 	s5p_mfc_final_pm(dev);
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -1690,7 +1689,7 @@ MODULE_DEVICE_TABLE(of, exynos_mfc_match);
 
 static struct platform_driver s5p_mfc_driver = {
 	.probe		= s5p_mfc_probe,
-	.remove		= s5p_mfc_remove,
+	.remove_new	= s5p_mfc_remove,
 	.driver	= {
 		.name	= S5P_MFC_NAME,
 		.pm	= &s5p_mfc_pm_ops,
-- 
2.39.2

