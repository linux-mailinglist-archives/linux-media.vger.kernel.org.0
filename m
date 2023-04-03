Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE5CE6D4C27
	for <lists+linux-media@lfdr.de>; Mon,  3 Apr 2023 17:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232964AbjDCPke (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Apr 2023 11:40:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232921AbjDCPkb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Apr 2023 11:40:31 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECC2D26AF
        for <linux-media@vger.kernel.org>; Mon,  3 Apr 2023 08:40:29 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pjMI9-0004fz-IM; Mon, 03 Apr 2023 17:40:21 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pjMI8-008ibS-Ko; Mon, 03 Apr 2023 17:40:20 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pjMI6-00AHx5-RU; Mon, 03 Apr 2023 17:40:18 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>
Cc:     Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Subject: [PATCH 10/24] staging: media: imx6-mipi-csi2: Convert to platform remove callback returning void
Date:   Mon,  3 Apr 2023 17:40:00 +0200
Message-Id: <20230403154014.2564054-11-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230403154014.2564054-1-u.kleine-koenig@pengutronix.de>
References: <20230403154014.2564054-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1806; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=VesGfwY/ab0E1llkf0F+Vslp4R6aXn1eFkcaZUb2W4Q=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKvNACvBqADPgwr9lh28+4Lhr5AMNZU5h8/1to pxo6FjU3KeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCrzQAAKCRCPgPtYfRL+ TufhCAChTeHFINMnRjLTCpO32W6HiMcXL5Sxx2hNavwpVrNk84jzdUB4NFBkJe1uLyGlV/V2tQC CFAyUmV4wNi+1D4mW3EaI1vqOTF10psjCNG2Fl6CzG9xiEKwNlM3otzSds5HHxLbi8Qw03YXuTY rJMk8begR7/6IlN9KZSjEMux7HUz3j+Kp3WgfcJ1lbcRr48oTwSxGCK7ZwnjJFECeoiSEUpiZuH SCrQ+4o1kSgMc6yzZJx5llt0V4H5lvkIoLN8lHjI+kNxfYYhxpF2kE1pYnTAx6drRzBFAMVEU2U XmykB4tdmpKvBgA5HpCo89iP26B17CnEz8qMqphcYUDHKUj3
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
 drivers/staging/media/imx/imx6-mipi-csi2.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index c4cb558a85c6..c07994ea6e96 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -765,7 +765,7 @@ static int csi2_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int csi2_remove(struct platform_device *pdev)
+static void csi2_remove(struct platform_device *pdev)
 {
 	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
 	struct csi2_dev *csi2 = sd_to_dev(sd);
@@ -777,8 +777,6 @@ static int csi2_remove(struct platform_device *pdev)
 	clk_disable_unprepare(csi2->pllref_clk);
 	mutex_destroy(&csi2->lock);
 	media_entity_cleanup(&sd->entity);
-
-	return 0;
 }
 
 static const struct of_device_id csi2_dt_ids[] = {
@@ -793,7 +791,7 @@ static struct platform_driver csi2_driver = {
 		.of_match_table = csi2_dt_ids,
 	},
 	.probe = csi2_probe,
-	.remove = csi2_remove,
+	.remove_new = csi2_remove,
 };
 
 module_platform_driver(csi2_driver);
-- 
2.39.2

