Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5FFF4C1617
	for <lists+linux-media@lfdr.de>; Wed, 23 Feb 2022 16:03:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241888AbiBWPEO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Feb 2022 10:04:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241883AbiBWPEN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Feb 2022 10:04:13 -0500
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F80D90CC4
        for <linux-media@vger.kernel.org>; Wed, 23 Feb 2022 07:03:45 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 1B722E0018;
        Wed, 23 Feb 2022 15:03:39 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        Eugen.Hristev@microchip.com, jbrunet@baylibre.com,
        paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH v4 25/27] media: ov5640: Adjust format to bpp in s_fmt
Date:   Wed, 23 Feb 2022 15:56:01 +0100
Message-Id: <20220223145603.121603-26-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220223145603.121603-1-jacopo@jmondi.org>
References: <20220223145603.121603-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
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

Adjust the image sizes according to the above constraints.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov5640.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index d29613b746f0..683f5795132f 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -2689,6 +2689,7 @@ static int ov5640_try_fmt_internal(struct v4l2_subdev *sd,
 				   enum ov5640_frame_rate fr,
 				   const struct ov5640_mode_info **new_mode)
 {
+	unsigned int bpp = ov5640_code_to_bpp(fmt->code);
 	struct ov5640_dev *sensor = to_ov5640_dev(sd);
 	const struct ov5640_mode_info *mode;
 	int i;
@@ -2696,6 +2697,17 @@ static int ov5640_try_fmt_internal(struct v4l2_subdev *sd,
 	mode = ov5640_find_mode(sensor, fr, fmt->width, fmt->height, true);
 	if (!mode)
 		return -EINVAL;
+
+	/*
+	 * Adjust mode according to bpp:
+	 * - 8bpp modes work for resolution >= 1280x720
+	 * - 24bpp modes work resolution < 1280x720
+	 */
+	if (bpp == 8 && mode->width < 1280)
+		mode = &ov5640_mode_data[OV5640_MODE_720P_1280_720];
+	else if (bpp == 24 && mode->width > 1024)
+		mode = &ov5640_mode_data[OV5640_MODE_XGA_1024_768];
+
 	fmt->width = mode->width;
 	fmt->height = mode->height;
 
-- 
2.35.0

