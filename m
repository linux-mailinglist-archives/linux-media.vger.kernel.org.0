Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C9104C285D
	for <lists+linux-media@lfdr.de>; Thu, 24 Feb 2022 10:44:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232185AbiBXJoJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Feb 2022 04:44:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232873AbiBXJoI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Feb 2022 04:44:08 -0500
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [IPv6:2001:4b98:dc4:8::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 706B027DF19
        for <linux-media@vger.kernel.org>; Thu, 24 Feb 2022 01:43:39 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id A0975240003;
        Thu, 24 Feb 2022 09:43:34 +0000 (UTC)
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
Subject: [PATCH v5 03/27] media: ov5640: Add ov5640_is_csi2() function
Date:   Thu, 24 Feb 2022 10:42:49 +0100
Message-Id: <20220224094313.233347-4-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220224094313.233347-1-jacopo@jmondi.org>
References: <20220224094313.233347-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Checking if the sensor is used in DVP or MIPI CSI-2 mode is a repeated
pattern which is about to be repeated more often.

Provide an inline function to shortcut that.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov5640.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 1f3cb84c284e..0697c9bf03ed 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -294,6 +294,11 @@ static inline struct v4l2_subdev *ctrl_to_sd(struct v4l2_ctrl *ctrl)
 			     ctrls.handler)->sd;
 }
 
+static inline bool ov5640_is_csi2(const struct ov5640_dev *sensor)
+{
+	return sensor->ep.bus_type == V4L2_MBUS_CSI2_DPHY;
+}
+
 /*
  * FIXME: all of these register tables are likely filled with
  * entries that set the register to their power-on default values,
@@ -1208,7 +1213,7 @@ static int ov5640_load_regs(struct ov5640_dev *sensor,
 		/* remain in power down mode for DVP */
 		if (regs->reg_addr == OV5640_REG_SYS_CTRL0 &&
 		    val == OV5640_REG_SYS_CTRL0_SW_PWUP &&
-		    sensor->ep.bus_type != V4L2_MBUS_CSI2_DPHY)
+		    !ov5640_is_csi2(sensor))
 			continue;
 
 		if (mask)
@@ -1843,7 +1848,7 @@ static int ov5640_set_mode(struct ov5640_dev *sensor)
 	 * the same rate than YUV, so we can just use 16 bpp all the time.
 	 */
 	rate = ov5640_calc_pixel_rate(sensor) * 16;
-	if (sensor->ep.bus_type == V4L2_MBUS_CSI2_DPHY) {
+	if (ov5640_is_csi2(sensor)) {
 		rate = rate / sensor->ep.bus.mipi_csi2.num_data_lanes;
 		ret = ov5640_set_mipi_pclk(sensor, rate);
 	} else {
@@ -3020,7 +3025,7 @@ static int ov5640_s_stream(struct v4l2_subdev *sd, int enable)
 			sensor->pending_fmt_change = false;
 		}
 
-		if (sensor->ep.bus_type == V4L2_MBUS_CSI2_DPHY)
+		if (ov5640_is_csi2(sensor))
 			ret = ov5640_set_stream_mipi(sensor, enable);
 		else
 			ret = ov5640_set_stream_dvp(sensor, enable);
-- 
2.35.0

