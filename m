Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 478AE6C95B0
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:34:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232604AbjCZOei (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:34:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232562AbjCZOdK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:33:10 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E9AB7AB9
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:33:00 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQR-0000Tv-Tk; Sun, 26 Mar 2023 16:32:51 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQQ-006rhK-1n; Sun, 26 Mar 2023 16:32:50 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQP-0088am-0k; Sun, 26 Mar 2023 16:32:49 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Sean Wang <sean.wang@mediatek.com>, Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-media@vger.kernel.org, kernel@pengutronix.de,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH 108/117] media: mtk-cir: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:32:15 +0200
Message-Id: <20230326143224.572654-111-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1596; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=lU1RdDgCVLlCsb/5z6KnJIo7xN0yoS8qGARlY6xon2g=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFdC1rNVy7Bq53g9nT0u1IGm+3MdTtjUTG0+n Z+iKKpJ7juJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBXQgAKCRCPgPtYfRL+ TvzaB/4x1CsgN+jw2vmR6VOIzhF0VtklHVsaM1mCVhFAlsAOc87OR8/ajkgPnGDiBPX9qTQ7VDZ GIQ+53bVnoRnoJLQrt1kOAfU1f3MYcUSCiEiPfsVmSFEdlwHR7D9IbNtbKWgHWUeEBv+tJUJR3e LkNcpwoy61kC17sOZVYetG5wM1PJTcZfKtsrkKj2lKjePHhJ6AKCuWxgtN8/oEwtKyyCbjIjgsb krZp86LJdODjWBHVPe+rZAkKU1JsatDjjWKUAnivIwb526wSAgtbSvV46LAiHco4CSYvwCfuvXK N6+cOXITCHF8gcXkaJOC78YeS7EPMdGddKy8f96zDQOo9ukl
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
 drivers/media/rc/mtk-cir.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/rc/mtk-cir.c b/drivers/media/rc/mtk-cir.c
index 27b7412d02a5..df9349330a93 100644
--- a/drivers/media/rc/mtk-cir.c
+++ b/drivers/media/rc/mtk-cir.c
@@ -420,7 +420,7 @@ static int mtk_ir_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mtk_ir_remove(struct platform_device *pdev)
+static void mtk_ir_remove(struct platform_device *pdev)
 {
 	struct mtk_ir *ir = platform_get_drvdata(pdev);
 
@@ -434,13 +434,11 @@ static int mtk_ir_remove(struct platform_device *pdev)
 
 	clk_disable_unprepare(ir->bus);
 	clk_disable_unprepare(ir->clk);
-
-	return 0;
 }
 
 static struct platform_driver mtk_ir_driver = {
 	.probe          = mtk_ir_probe,
-	.remove         = mtk_ir_remove,
+	.remove_new     = mtk_ir_remove,
 	.driver = {
 		.name = MTK_IR_DEV,
 		.of_match_table = mtk_ir_match,
-- 
2.39.2

