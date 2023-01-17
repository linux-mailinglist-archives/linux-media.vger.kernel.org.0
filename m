Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4087C66DA93
	for <lists+linux-media@lfdr.de>; Tue, 17 Jan 2023 11:06:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236200AbjAQKGX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Jan 2023 05:06:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236168AbjAQKGT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Jan 2023 05:06:19 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B05603C1D
        for <linux-media@vger.kernel.org>; Tue, 17 Jan 2023 02:06:18 -0800 (PST)
Received: from uno.LocalDomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EC0E04DA;
        Tue, 17 Jan 2023 11:06:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673949976;
        bh=cfkzyLcKhj/ywgrgeqLB3xESZbwTqbC7fzhNfn9xhwI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=shPdm8DpnkkF6CWTYHCDfbkpFi1FrKIxFNOcTKIKveSJzboKhQ6lmX7uuAR7EYk70
         gWarYW2A04V5c68XGNEu+R0cEnpqZPMUn8crhw1JTi7MZpS2wQ+VolEsz5K3J/EBCi
         EffoJv4c7NFyqFsv8r3eRSCRuFnF6nJSm9GBDm48=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Robert Mader <robert.mader@collabora.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linux-media@vger.kernel.org
Subject: [PATCH 2/3] media: imx258: Register H/V flip controls
Date:   Tue, 17 Jan 2023 11:06:02 +0100
Message-Id: <20230117100603.51631-3-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230117100603.51631-1-jacopo.mondi@ideasonboard.com>
References: <20230117100603.51631-1-jacopo.mondi@ideasonboard.com>
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

Register controls for V4L2_CID_HFLIP and V4L2_CID_VFLIP.

The controls are registered as read-only and enabled by default, as the
driver embeds a 180 degrees rotation in its programming sequences and
only supports that mode of operations.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/imx258.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index 3b560865b657..2e0a4ea76589 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -1151,6 +1151,7 @@ static int imx258_init_controls(struct imx258 *imx258)
 	struct i2c_client *client = v4l2_get_subdevdata(&imx258->sd);
 	struct v4l2_fwnode_device_properties props;
 	struct v4l2_ctrl_handler *ctrl_hdlr;
+	struct v4l2_ctrl *vflip, *hflip;
 	s64 vblank_def;
 	s64 vblank_min;
 	s64 pixel_rate_min;
@@ -1158,7 +1159,7 @@ static int imx258_init_controls(struct imx258 *imx258)
 	int ret;
 
 	ctrl_hdlr = &imx258->ctrl_handler;
-	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 11);
+	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 13);
 	if (ret)
 		return ret;
 
@@ -1174,6 +1175,17 @@ static int imx258_init_controls(struct imx258 *imx258)
 	if (imx258->link_freq)
 		imx258->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
+	/* The driver only supports one bayer order and flips by default. */
+	hflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx258_ctrl_ops,
+				  V4L2_CID_HFLIP, 1, 1, 1, 1);
+	if (hflip)
+		hflip->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	vflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx258_ctrl_ops,
+				  V4L2_CID_VFLIP, 1, 1, 1, 1);
+	if (vflip)
+		vflip->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
 	pixel_rate_max = link_freq_to_pixel_rate(link_freq_menu_items[0]);
 	pixel_rate_min = link_freq_to_pixel_rate(link_freq_menu_items[1]);
 	/* By default, PIXEL_RATE is read only */
-- 
2.39.0

