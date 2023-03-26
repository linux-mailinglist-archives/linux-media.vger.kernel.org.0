Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD2B06C95B7
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:34:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232623AbjCZOep (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:34:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232535AbjCZOdO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:33:14 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BBE34EE1
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:33:03 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQN-0000Ao-H7; Sun, 26 Mar 2023 16:32:47 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQK-006rf7-6S; Sun, 26 Mar 2023 16:32:44 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQJ-0088Z0-52; Sun, 26 Mar 2023 16:32:43 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, kernel@pengutronix.de
Subject: [PATCH 081/117] media: sun8i_a83t_mipi_csi2: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:31:48 +0200
Message-Id: <20230326143224.572654-84-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2114; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=k9x8HzVlyO7nqBiHyTmH/ywca9Pw/7RppQDC+gh421I=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFbmAbo3t/O7sXR98QYLqTmcRer9F9ZO1B245 G0ILVvnNlWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBW5gAKCRCPgPtYfRL+ Tl2jB/9BovhRmpZKHAU3NPpips1+iUG8LVAqyxsVRkanp+lGCOsrmCb9HFCEWuNFNzK+np/o+Tj rTxNTSg3yOLwjohHDTgTq8qhNVOX+j+QP8rB4tAu13wldgnfy5e/rZcZSrzzvj38qLi/low4452 gPfFPO9NIMAOBFHvyBbT+g40ib6zlqwenGkEGSmTQN49i+lqRUPRINUEetLC0+fLbIFuhljIs3t vn7HwQc3uCMRCioSaD4Ee8HPZ47PEkULKjFaBqVRSdvtJwK3Xiya/0LbqSTa0+OTGrNLfL1t+Ic CorzysVmLole6sZsFuAqD3S6I4K4g38P4Bss8SpHB16mmh3N
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
 .../sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c       | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
index cd2e92ae2293..23d32e198aaa 100644
--- a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
+++ b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
@@ -804,15 +804,13 @@ static int sun8i_a83t_mipi_csi2_probe(struct platform_device *platform_dev)
 	return ret;
 }
 
-static int sun8i_a83t_mipi_csi2_remove(struct platform_device *platform_dev)
+static void sun8i_a83t_mipi_csi2_remove(struct platform_device *platform_dev)
 {
 	struct sun8i_a83t_mipi_csi2_device *csi2_dev =
 		platform_get_drvdata(platform_dev);
 
 	sun8i_a83t_mipi_csi2_bridge_cleanup(csi2_dev);
 	sun8i_a83t_mipi_csi2_resources_cleanup(csi2_dev);
-
-	return 0;
 }
 
 static const struct of_device_id sun8i_a83t_mipi_csi2_of_match[] = {
@@ -823,7 +821,7 @@ MODULE_DEVICE_TABLE(of, sun8i_a83t_mipi_csi2_of_match);
 
 static struct platform_driver sun8i_a83t_mipi_csi2_platform_driver = {
 	.probe	= sun8i_a83t_mipi_csi2_probe,
-	.remove	= sun8i_a83t_mipi_csi2_remove,
+	.remove_new = sun8i_a83t_mipi_csi2_remove,
 	.driver	= {
 		.name		= SUN8I_A83T_MIPI_CSI2_NAME,
 		.of_match_table	= of_match_ptr(sun8i_a83t_mipi_csi2_of_match),
-- 
2.39.2

