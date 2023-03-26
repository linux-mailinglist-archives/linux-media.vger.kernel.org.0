Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F053F6C95B3
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:34:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232609AbjCZOel (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:34:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232556AbjCZOdN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:33:13 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D9002736
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:33:02 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQP-0000BQ-Le; Sun, 26 Mar 2023 16:32:49 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQK-006rfF-EA; Sun, 26 Mar 2023 16:32:44 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQI-0088Ys-LW; Sun, 26 Mar 2023 16:32:42 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Yong Deng <yong.deng@magewell.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>
Cc:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, kernel@pengutronix.de
Subject: [PATCH 079/117] media: sun6i_csi: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:31:46 +0200
Message-Id: <20230326143224.572654-82-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1917; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=m26ezAxR2j/uofLPwLu9oTyNCHcyZJXVezn3mhl4bTE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFbkbHga1UdZY6Plazsm9trXoSYX5XbkTjkjc VlFytw3HraJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBW5AAKCRCPgPtYfRL+ TvU4B/49HiWoVfnNhS8IavAhrMM2H/LRanOpQ5U8vux671LG1pdZU5We5MHRDCXcB7C41yorhSh U8hw4/3mGMcvFj5WDfqkhlNB4Jo3Y/Fr7Jq7jN02myyyJUGbvmknkN9Kki+o0lnod5WJDR+cDl3 Rl4d6SGJEOnYK+Z7gTBIu7vABpVN1Kvkp0T6fXvhC8AvDf1fK8eYYq8MZkXmX9McbMAGOS//6I4 FPWhZ84GmXR5nTFYHK5kOpIDtN1Unaz/hh72zWXhMZInkTjWEXMjQAjCrcuXb670ZS3euMluJrL hw4lpcAfj4Uih0w8E45MQ+InvpOyWRVJ5EUQXBN3GJnmyS0E
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
 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
index e3e6650181c8..e2723cfa4515 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
@@ -375,7 +375,7 @@ static int sun6i_csi_probe(struct platform_device *platform_dev)
 	return ret;
 }
 
-static int sun6i_csi_remove(struct platform_device *pdev)
+static void sun6i_csi_remove(struct platform_device *pdev)
 {
 	struct sun6i_csi_device *csi_dev = platform_get_drvdata(pdev);
 
@@ -386,8 +386,6 @@ static int sun6i_csi_remove(struct platform_device *pdev)
 		sun6i_csi_v4l2_cleanup(csi_dev);
 
 	sun6i_csi_resources_cleanup(csi_dev);
-
-	return 0;
 }
 
 static const struct sun6i_csi_variant sun6i_a31_csi_variant = {
@@ -426,7 +424,7 @@ MODULE_DEVICE_TABLE(of, sun6i_csi_of_match);
 
 static struct platform_driver sun6i_csi_platform_driver = {
 	.probe	= sun6i_csi_probe,
-	.remove	= sun6i_csi_remove,
+	.remove_new = sun6i_csi_remove,
 	.driver	= {
 		.name		= SUN6I_CSI_NAME,
 		.of_match_table	= of_match_ptr(sun6i_csi_of_match),
-- 
2.39.2

