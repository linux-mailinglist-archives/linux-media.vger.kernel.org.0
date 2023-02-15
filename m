Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C42A96987DC
	for <lists+linux-media@lfdr.de>; Wed, 15 Feb 2023 23:30:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229758AbjBOWaW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Feb 2023 17:30:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbjBOWaV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Feb 2023 17:30:21 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F20837B6D
        for <linux-media@vger.kernel.org>; Wed, 15 Feb 2023 14:30:20 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D5D554D4;
        Wed, 15 Feb 2023 23:30:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676500219;
        bh=hoXcNfdPI4OdXSe2zHGhnJmVqMvmyUrM82FRnL12ZlI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=s1PJZHhqczJKSH3l3NhiyvwFcs6yGw3oUjdBO1CZnNMhF7ZP3omoDJgTIennf+T3J
         OWhrlbc6BTuMBgnIO0eNseEQywmvPwjr+rSpK3bRrNArXkzD1vY9Mmzmf+zEYxo/YI
         6l5TdGBkLUGN4bfltf4p+XlTF0v0EjpsR0XmAkck=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH v3 07/15] media: i2c: imx290: Support 60fps in 2 lane operation
Date:   Thu, 16 Feb 2023 00:29:55 +0200
Message-Id: <20230215223003.30170-8-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230215223003.30170-1-laurent.pinchart@ideasonboard.com>
References: <20230215223003.30170-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

Commit "97589ad61c73 media: i2c: imx290: Add support for 2 data lanes"
added support for running in two lane mode (instead of 4), but
without changing the link frequency that resulted in a max of 30fps.

Commit "98e0500eadb7 media: i2c: imx290: Add configurable link frequency
and pixel rate" then doubled the link frequency when in 2 lane mode,
but didn't undo the correction for running at only 30fps, just extending
horizontal blanking instead.

Remove the 30fps limit on 2 lane by correcting the register config
in accordance with the datasheet for 60fps operation over 2 lanes.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v2:

- Fix rebase conflict
---
 drivers/media/i2c/imx290.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index c0b37afd2fbe..b83918ac4cc3 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -382,7 +382,7 @@ static const struct imx290_mode imx290_modes_2lanes[] = {
 	{
 		.width = 1920,
 		.height = 1080,
-		.hmax = 4400,
+		.hmax = 2200,
 		.link_freq_index = FREQ_INDEX_1080P,
 		.data = imx290_1080p_settings,
 		.data_size = ARRAY_SIZE(imx290_1080p_settings),
@@ -390,7 +390,7 @@ static const struct imx290_mode imx290_modes_2lanes[] = {
 	{
 		.width = 1280,
 		.height = 720,
-		.hmax = 6600,
+		.hmax = 3300,
 		.link_freq_index = FREQ_INDEX_720P,
 		.data = imx290_720p_settings,
 		.data_size = ARRAY_SIZE(imx290_720p_settings),
@@ -539,21 +539,10 @@ static int imx290_set_register_array(struct imx290 *imx290,
 static int imx290_set_data_lanes(struct imx290 *imx290)
 {
 	int ret = 0;
-	u32 frsel;
-
-	switch (imx290->nlanes) {
-	case 2:
-	default:
-		frsel = 0x02;
-		break;
-	case 4:
-		frsel = 0x01;
-		break;
-	}
 
 	imx290_write(imx290, IMX290_PHY_LANE_NUM, imx290->nlanes - 1, &ret);
 	imx290_write(imx290, IMX290_CSI_LANE_MODE, imx290->nlanes - 1, &ret);
-	imx290_write(imx290, IMX290_FR_FDG_SEL, frsel, &ret);
+	imx290_write(imx290, IMX290_FR_FDG_SEL, 0x01, &ret);
 
 	return ret;
 }
-- 
Regards,

Laurent Pinchart

