Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A2036987E5
	for <lists+linux-media@lfdr.de>; Wed, 15 Feb 2023 23:30:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229588AbjBOWaj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Feb 2023 17:30:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229765AbjBOWah (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Feb 2023 17:30:37 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AD4234C07
        for <linux-media@vger.kernel.org>; Wed, 15 Feb 2023 14:30:35 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1C0A257E;
        Wed, 15 Feb 2023 23:30:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676500234;
        bh=+Gu3tygyhRz89j5Lt2pgJ9m3yOiebDD9zcHHpzfXUSs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=scKY8/T/nuxQqLwZjbbW6K1hjeM9/deTJJv6eMkaHRRIjA69ZqGK753HW8mBAkiLb
         BrpDGuU8zhgoMXg0E+rm+6ol8vqYzBYIaDqQJixyBbXYioaoiIb62MW0y9uzJ3KfRf
         Gsd1QCQE6AcQDEoVgJr9ggC53wAseDpwuyIoKmAg=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH v3 15/15] media: i2c: imx290: Add the error code to logs in start_streaming
Date:   Thu, 16 Feb 2023 00:30:03 +0200
Message-Id: <20230215223003.30170-16-laurent.pinchart@ideasonboard.com>
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

imx290_start_streaming logs what failed, but not the error
code from that function. Add it into the log message.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx290.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index ec380bb7533f..1911fa9bc2b3 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -1007,20 +1007,20 @@ static int imx290_start_streaming(struct imx290 *imx290,
 	/* Set clock parameters based on mode and xclk */
 	ret = imx290_set_clock(imx290);
 	if (ret < 0) {
-		dev_err(imx290->dev, "Could not set clocks\n");
+		dev_err(imx290->dev, "Could not set clocks - %d\n", ret);
 		return ret;
 	}
 
 	/* Set data lane count */
 	ret = imx290_set_data_lanes(imx290);
 	if (ret < 0) {
-		dev_err(imx290->dev, "Could not set data lanes\n");
+		dev_err(imx290->dev, "Could not set data lanes - %d\n", ret);
 		return ret;
 	}
 
 	ret = imx290_set_csi_config(imx290);
 	if (ret < 0) {
-		dev_err(imx290->dev, "Could not set csi cfg\n");
+		dev_err(imx290->dev, "Could not set csi cfg - %d\n", ret);
 		return ret;
 	}
 
@@ -1028,7 +1028,7 @@ static int imx290_start_streaming(struct imx290 *imx290,
 	format = v4l2_subdev_get_pad_format(&imx290->sd, state, 0);
 	ret = imx290_setup_format(imx290, format);
 	if (ret < 0) {
-		dev_err(imx290->dev, "Could not set frame format\n");
+		dev_err(imx290->dev, "Could not set frame format - %d\n", ret);
 		return ret;
 	}
 
@@ -1036,14 +1036,14 @@ static int imx290_start_streaming(struct imx290 *imx290,
 	ret = imx290_set_register_array(imx290, imx290->current_mode->data,
 					imx290->current_mode->data_size);
 	if (ret < 0) {
-		dev_err(imx290->dev, "Could not set current mode\n");
+		dev_err(imx290->dev, "Could not set current mode - %d\n", ret);
 		return ret;
 	}
 
 	/* Apply customized values from user */
 	ret = __v4l2_ctrl_handler_setup(imx290->sd.ctrl_handler);
 	if (ret) {
-		dev_err(imx290->dev, "Could not sync v4l2 controls\n");
+		dev_err(imx290->dev, "Could not sync v4l2 controls - %d\n", ret);
 		return ret;
 	}
 
-- 
Regards,

Laurent Pinchart

