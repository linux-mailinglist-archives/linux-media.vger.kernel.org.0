Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A31B4B0BE9
	for <lists+linux-media@lfdr.de>; Thu, 10 Feb 2022 12:10:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240613AbiBJLKB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Feb 2022 06:10:01 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240602AbiBJLKA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Feb 2022 06:10:00 -0500
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [IPv6:2001:4b98:dc4:8::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6872128
        for <linux-media@vger.kernel.org>; Thu, 10 Feb 2022 03:10:01 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id ED261240013;
        Thu, 10 Feb 2022 11:09:56 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     slongerbeam@gmail.com
Cc:     laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        eugen.hristev@microchip.com, jbrunet@baylibre.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v2 22/23] media: ov5640: Restrict sizes to mbus code
Date:   Thu, 10 Feb 2022 12:10:43 +0100
Message-Id: <20220210111044.152904-3-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220210110458.152494-1-jacopo@jmondi.org>
References: <20220210110458.152494-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ov5640 driver supports different sizes for different mbus_codes.
In particular:

- 8bpp modes: high resolution sizes (>= 1280x720)
- 16bpp modes: all sizes
- 24bpp modes: low resolutions sizes (< 1280x720)

Restrict the frame sizes enumerations to the above constraints.

While at it, make sure the fse->mbus_code parameter is valid, and return
-EINVAL if it's not.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5640.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index f894570ac53c..81bf547a923e 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -3315,14 +3315,28 @@ static int ov5640_enum_frame_size(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
+	u32 bpp = ov5640_code_to_bpp(fse->code);
+	unsigned int index = fse->index;
+
 	if (fse->pad != 0)
 		return -EINVAL;
-	if (fse->index >= OV5640_NUM_MODES)
+	if (!bpp)
+		return -EINVAL;
+
+	/* Only low-resolution modes are supported for 24bpp modes. */
+	if (bpp == 24 && index >= OV5640_MODE_720P_1280_720)
+		return -EINVAL;
+
+	/* Only high-resolutions modes are supported for 8bpp formats. */
+	if (bpp == 8)
+		index += OV5640_MODE_720P_1280_720;
+
+	if (index >= OV5640_NUM_MODES)
 		return -EINVAL;
 
-	fse->min_width = ov5640_mode_data[fse->index].crop.width;
+	fse->min_width = ov5640_mode_data[index].crop.width;
 	fse->max_width = fse->min_width;
-	fse->min_height = ov5640_mode_data[fse->index].crop.height;
+	fse->min_height = ov5640_mode_data[index].crop.height;
 	fse->max_height = fse->min_height;
 
 	return 0;
-- 
2.35.0

