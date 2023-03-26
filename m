Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 777E06C95AB
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:34:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232597AbjCZOed (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:34:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232544AbjCZOdI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:33:08 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0C2776AF
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:58 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQL-00006X-KL; Sun, 26 Mar 2023 16:32:45 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQI-006reW-RP; Sun, 26 Mar 2023 16:32:42 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQI-0088Yh-0m; Sun, 26 Mar 2023 16:32:42 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     linux-media@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Subject: [PATCH 076/117] media: dma2d: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:31:43 +0200
Message-Id: <20230326143224.572654-79-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1826; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=Hf03W6FCnuJBdvXuTFOZXNHudlzADbBrZKtBOEpjYlM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFbhWjaNCRTr78svok4/G/qcUfXFkbJZeABAx T+Yc7umm8eJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBW4QAKCRCPgPtYfRL+ TnPRB/9CMzAkMtzX9t2MUc+yuKmxmHlomkr7f1IZZ919Gdvmp3sWBbFKhor+nE/SbadRaj46216 mFmKZG0eYEnHfvWK/Pvqbj/E5urzyoFTywinaXnKS9jDLFlyz6zSvYosKqQEQNZNzkENDc/MWgp IlT3G5+SvbtX0gNJJ1/fqpZ3lbJWdTHbJ6sk0LIo5o08FNPoQtM8A4UL/aAm81R5Jkl15iyxDeR C0KQE1Dox+swebOdqRUvBar9uRN1Ir4smQEDZhz3fK3xjom0HLGFOF3MWyhGtn2gAKtpKmuc7Za mVzNVmXqG5ZifvWHKntrUJivwDcj7NUQfGk7fF/gVClnMl94
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
 drivers/media/platform/st/stm32/dma2d/dma2d.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/st/stm32/dma2d/dma2d.c b/drivers/media/platform/st/stm32/dma2d/dma2d.c
index 9706aa41b5d2..be56d2b5fae9 100644
--- a/drivers/media/platform/st/stm32/dma2d/dma2d.c
+++ b/drivers/media/platform/st/stm32/dma2d/dma2d.c
@@ -696,7 +696,7 @@ static int dma2d_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int dma2d_remove(struct platform_device *pdev)
+static void dma2d_remove(struct platform_device *pdev)
 {
 	struct dma2d_dev *dev = platform_get_drvdata(pdev);
 
@@ -707,8 +707,6 @@ static int dma2d_remove(struct platform_device *pdev)
 	vb2_dma_contig_clear_max_seg_size(&pdev->dev);
 	clk_unprepare(dev->gate);
 	clk_put(dev->gate);
-
-	return 0;
 }
 
 static const struct of_device_id stm32_dma2d_match[] = {
@@ -722,7 +720,7 @@ MODULE_DEVICE_TABLE(of, stm32_dma2d_match);
 
 static struct platform_driver dma2d_pdrv = {
 	.probe		= dma2d_probe,
-	.remove		= dma2d_remove,
+	.remove_new	= dma2d_remove,
 	.driver		= {
 		.name = DMA2D_NAME,
 		.of_match_table = stm32_dma2d_match,
-- 
2.39.2

