Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51BB56C95B1
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:34:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232605AbjCZOej (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:34:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232564AbjCZOdL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:33:11 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AD977AB1
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:33:00 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQN-00009B-9o; Sun, 26 Mar 2023 16:32:47 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQJ-006ren-Ki; Sun, 26 Mar 2023 16:32:43 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQI-0088Yp-Dz; Sun, 26 Mar 2023 16:32:42 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Maxime Ripard <mripard@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>
Cc:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, kernel@pengutronix.de
Subject: [PATCH 078/117] media: sun4i_csi: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:31:45 +0200
Message-Id: <20230326143224.572654-81-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1908; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=92f+/LQb/H6f1ORxRx6eRZYglN/JIjU1cdoQA/Fu7uU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFbjj4OPXL2XVpzi/Nj0dmAgJvKqDyZkMFnTr hw1BsChwWiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBW4wAKCRCPgPtYfRL+ Tk/uB/95Csm+2fLfFB/qcZ7rs82AZiz/VIPmV4wv7JtBRl7913WpkszO6OjoTe12jmTt9DuUl9M Me9tqYJqwqLprsXxZstU4wdf8765sPnMUQMNugx5QXcmh0rJTAKqzWhlJANpr8vRQjwYMnNlMwA dFJoSN+v7RwJxkinGUDtXKUpc6u+fVY4wIv430fKQJH7Z7lctNC/hirIN13EEO3jfViZwHDqKpL UOr0Wd1TaGqY0TcWSqLK9+lRwAAyGBcFXkKaCnAPgdlq3KIqB6Tg9OI5Mp3+rnQk3nJ32Yn5G2P ykbYtKeAdZrkAGrnm/rT/AOC/i/Z4o3rAw5Hi4iuTu+4vNAQ
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
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
index 86c5235a0c7a..d6e7d1b36083 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
@@ -260,7 +260,7 @@ static int sun4i_csi_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int sun4i_csi_remove(struct platform_device *pdev)
+static void sun4i_csi_remove(struct platform_device *pdev)
 {
 	struct sun4i_csi *csi = platform_get_drvdata(pdev);
 
@@ -271,8 +271,6 @@ static int sun4i_csi_remove(struct platform_device *pdev)
 	media_device_unregister(&csi->mdev);
 	sun4i_csi_dma_unregister(csi);
 	media_device_cleanup(&csi->mdev);
-
-	return 0;
 }
 
 static const struct sun4i_csi_traits sun4i_a10_csi1_traits = {
@@ -330,7 +328,7 @@ static const struct dev_pm_ops sun4i_csi_pm_ops = {
 
 static struct platform_driver sun4i_csi_driver = {
 	.probe	= sun4i_csi_probe,
-	.remove	= sun4i_csi_remove,
+	.remove_new = sun4i_csi_remove,
 	.driver	= {
 		.name		= "sun4i-csi",
 		.of_match_table	= sun4i_csi_of_match,
-- 
2.39.2

