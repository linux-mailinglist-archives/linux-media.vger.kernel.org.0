Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 055DB6C9569
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:33:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232566AbjCZOdY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:33:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232435AbjCZOcq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:46 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FD717AB1
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:45 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQB-0007yF-0u; Sun, 26 Mar 2023 16:32:35 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ9-006rbB-E1; Sun, 26 Mar 2023 16:32:33 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ8-0088Vj-0T; Sun, 26 Mar 2023 16:32:32 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-media@vger.kernel.org, kernel@pengutronix.de,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH 030/117] media: mtk_vcodec_enc_drv: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:30:57 +0200
Message-Id: <20230326143224.572654-33-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1904; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=iWZQWni5H+Z+BEh9nLVGdQ7KridiLmts8udqla8jAqE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFarZ2Tvj6+2UCxNTYlxWwzIXahGDoc2x8SpM QxSpw33l6yJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBWqwAKCRCPgPtYfRL+ Tk3SB/4iM2L2a0F42ERFVuzNvi9MbRs/YSxe0/SmKJMLjJ7qf9uAbuQqOmOwq8IXUZp9mYXT+Au JJ1rtkxh9JEvX/1ZOAbuM+9+Txn/q6Gr4E8sUaHQ95I9ai0nXKmAJV36oboKqxsjlMZwU6gqHwZ ihvXgnKCeP1IJEIPkvMcXcym6yvfQf+sXr2usGHmOHH1YynvZXA8c3+vur63y3RgclWUe4iIohn yu55dnrJLFQY52srRK/nC+s6p5nm6QQq9sRStI6FjgLhRTMpR0ryrx7NpHI9xmieAv3+9xrKnmG nx3wz4OqYuWyzueoHADdA5vthEXfmswE9gHcw5qrejLVdI/J
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
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c
index 9095186d5495..cd0d5da8195a 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c
@@ -451,7 +451,7 @@ static const struct of_device_id mtk_vcodec_enc_match[] = {
 };
 MODULE_DEVICE_TABLE(of, mtk_vcodec_enc_match);
 
-static int mtk_vcodec_enc_remove(struct platform_device *pdev)
+static void mtk_vcodec_enc_remove(struct platform_device *pdev)
 {
 	struct mtk_vcodec_dev *dev = platform_get_drvdata(pdev);
 
@@ -466,12 +466,11 @@ static int mtk_vcodec_enc_remove(struct platform_device *pdev)
 	v4l2_device_unregister(&dev->v4l2_dev);
 	pm_runtime_disable(dev->pm.dev);
 	mtk_vcodec_fw_release(dev->fw_handler);
-	return 0;
 }
 
 static struct platform_driver mtk_vcodec_enc_driver = {
 	.probe	= mtk_vcodec_probe,
-	.remove	= mtk_vcodec_enc_remove,
+	.remove_new = mtk_vcodec_enc_remove,
 	.driver	= {
 		.name	= MTK_VCODEC_ENC_NAME,
 		.of_match_table = mtk_vcodec_enc_match,
-- 
2.39.2

