Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D22E6C9582
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:33:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229959AbjCZOdu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:33:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232449AbjCZOcy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:54 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EF857DB0
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:52 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQK-0008Vl-Pu; Sun, 26 Mar 2023 16:32:44 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQH-006reG-Va; Sun, 26 Mar 2023 16:32:41 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQH-0088YX-BA; Sun, 26 Mar 2023 16:32:41 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Patrice Chotard <patrice.chotard@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 073/117] media: c8sectpfe-core: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:31:40 +0200
Message-Id: <20230326143224.572654-76-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1859; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=H7nHpQzjHc2P2nAVdyZEagsXwm5a4h2lLK7N8YxEAqc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFbdZqhYr563DtnBDGjjmqMp9STd11DCyou+A wu8xS6K0diJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBW3QAKCRCPgPtYfRL+ TtW/B/9fn10iHM3G+gmvdye0gnp0ukGjhLibCuxvyfyb2mXfQF1SbaTSlavvXW3aHbarTg10tmC U7zxHPVbTly+FCsXSqnZJTe7Pe2lau/u09Ui+F4KexHCRgcE+gyB7kjaECESPowYvotfBVXkbCT cd6WR6b2Kepz94SSmDV0YaqDGM8uVu3QqaoRjftaYEtaSGRdlOL0GoPJGK5ORrx6Im6GVesSL5r LpBQ+eNXODjXo3JK4EJXfF/m0xtxIUNkmFZcr5jGyR5cjNYBcJn8vzu7W0/EnTw52yJQGhy+b0P e0hENoar1l6XV2D7KDtWyx9qz/xjw4Q8JLzG07JYExK5ja5J
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
 drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
index c38b62d4f1ae..45ade7210d26 100644
--- a/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
+++ b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
@@ -878,7 +878,7 @@ static int c8sectpfe_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int c8sectpfe_remove(struct platform_device *pdev)
+static void c8sectpfe_remove(struct platform_device *pdev)
 {
 	struct c8sectpfei *fei = platform_get_drvdata(pdev);
 	struct channel_info *channel;
@@ -910,8 +910,6 @@ static int c8sectpfe_remove(struct platform_device *pdev)
 		writel(0, fei->io + SYS_OTHER_CLKEN);
 
 	clk_disable_unprepare(fei->c8sectpfeclk);
-
-	return 0;
 }
 
 
@@ -1178,7 +1176,7 @@ static struct platform_driver c8sectpfe_driver = {
 		.of_match_table = of_match_ptr(c8sectpfe_match),
 	},
 	.probe	= c8sectpfe_probe,
-	.remove	= c8sectpfe_remove,
+	.remove_new = c8sectpfe_remove,
 };
 
 module_platform_driver(c8sectpfe_driver);
-- 
2.39.2

