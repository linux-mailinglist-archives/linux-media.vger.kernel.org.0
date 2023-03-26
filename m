Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BDE96C956C
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:33:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232435AbjCZOd1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:33:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232406AbjCZOcr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:47 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEC527ABF
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:45 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQD-000852-3S; Sun, 26 Mar 2023 16:32:37 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQA-006rbi-Ml; Sun, 26 Mar 2023 16:32:34 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ9-0088WC-Oi; Sun, 26 Mar 2023 16:32:33 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>
Cc:     Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@pengutronix.de
Subject: [PATCH 038/117] media: imx-mipi-csis: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:31:05 +0200
Message-Id: <20230326143224.572654-41-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1943; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=g9vpE9AZ9skiilxNFIWrdmlq9kjJ2H01iBx38QX6sjM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFa0ZmH/OORjShWZ6729b1/os/FQJ7mcBVvHa TixsF4hCD+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBWtAAKCRCPgPtYfRL+ TqI/B/9sOhnR0PJ8q+h1kKuiOTesOhoJzFkzg2yMAVElAtctGh5I3d3Crgu9Hu3dAIcLhKtrT3H DRSBa5kXyKKLMkCKmPre23JpE4zHLvNS3GCaT2c4JXMsj1gPe0ku/y1iSo0ptobDmv8XRsEvlS7 IX+Po4xY56NPmGfyUSxh0x3Mwr7mq5C2DM/Ii/gqjNvxtihGAWjN/XXNOqSkK60Owp6Z1QNyc3A gD7S4VG2vuyJNYaCtAHj1s5G/4jLVrGfeQfhmXpQ50k3i2sPJYnvRfxInZjTgSk8LFqBogulQrs LUnz/74mHB5YbWXJTJ+ZblpQCyPCqQ3sHmfK+hIVn3IEs9ap
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
 drivers/media/platform/nxp/imx-mipi-csis.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index be2768a47995..05d52762e792 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -1503,7 +1503,7 @@ static int mipi_csis_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mipi_csis_remove(struct platform_device *pdev)
+static void mipi_csis_remove(struct platform_device *pdev)
 {
 	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
 	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
@@ -1520,8 +1520,6 @@ static int mipi_csis_remove(struct platform_device *pdev)
 	media_entity_cleanup(&csis->sd.entity);
 	fwnode_handle_put(csis->sd.fwnode);
 	pm_runtime_set_suspended(&pdev->dev);
-
-	return 0;
 }
 
 static const struct of_device_id mipi_csis_of_match[] = {
@@ -1544,7 +1542,7 @@ MODULE_DEVICE_TABLE(of, mipi_csis_of_match);
 
 static struct platform_driver mipi_csis_driver = {
 	.probe		= mipi_csis_probe,
-	.remove		= mipi_csis_remove,
+	.remove_new	= mipi_csis_remove,
 	.driver		= {
 		.of_match_table = mipi_csis_of_match,
 		.name		= CSIS_DRIVER_NAME,
-- 
2.39.2

