Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BE7B4B0BB6
	for <lists+linux-media@lfdr.de>; Thu, 10 Feb 2022 12:04:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240482AbiBJLER (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Feb 2022 06:04:17 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:39586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240489AbiBJLEO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Feb 2022 06:04:14 -0500
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11E6D100B
        for <linux-media@vger.kernel.org>; Thu, 10 Feb 2022 03:04:15 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id C8684200010;
        Thu, 10 Feb 2022 11:04:10 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        Eugen.Hristev@microchip.com, jbrunet@baylibre.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH v2 05/23] media: ov5640: Add LINK_FREQ control
Date:   Thu, 10 Feb 2022 12:04:40 +0100
Message-Id: <20220210110458.152494-6-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220210110458.152494-1-jacopo@jmondi.org>
References: <20220210110458.152494-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the V4L2_CID_LINK_FREQ control to the ov5640 driver.
Make the control read-only for the moment.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5640.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 71404d064045..4c3a1fd41095 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -141,6 +141,21 @@ static const u32 ov5640_pixel_rates[] = {
 	[OV5640_PIXEL_RATE_48M] = 48000000,
 };
 
+/*
+ * MIPI CSI-2 link frequencies.
+ *
+ * Derived from the above defined pixel rate for bpp = (8, 16, 24) and
+ * data_lanes = (1, 2)
+ *
+ * link_freq = (pixel_rate * bpp) / (2 * data_lanes)
+ */
+static const s64 ov5640_csi2_link_freqs[] = {
+	992000000, 888000000, 768000000, 744000000, 672000000, 672000000,
+	592000000, 592000000, 576000000, 576000000, 496000000, 496000000,
+	384000000, 384000000, 384000000, 336000000, 296000000, 288000000,
+	248000000, 192000000, 192000000, 192000000, 96000000,
+};
+
 enum ov5640_format_mux {
 	OV5640_FMT_MUX_YUV422 = 0,
 	OV5640_FMT_MUX_RGB,
@@ -270,6 +285,7 @@ struct ov5640_mode_info {
 struct ov5640_ctrls {
 	struct v4l2_ctrl_handler handler;
 	struct v4l2_ctrl *pixel_rate;
+	struct v4l2_ctrl *link_freq;
 	struct {
 		struct v4l2_ctrl *auto_exp;
 		struct v4l2_ctrl *exposure;
@@ -2867,6 +2883,11 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
 				      ov5640_pixel_rates[0], 1,
 				      ov5640_pixel_rates[mode->pixel_rate]);
 
+	ctrls->link_freq = v4l2_ctrl_new_int_menu(hdl, ops,
+					V4L2_CID_LINK_FREQ,
+					ARRAY_SIZE(ov5640_csi2_link_freqs) - 1,
+					4, ov5640_csi2_link_freqs);
+
 	/* Auto/manual white balance */
 	ctrls->auto_wb = v4l2_ctrl_new_std(hdl, ops,
 					   V4L2_CID_AUTO_WHITE_BALANCE,
@@ -2915,6 +2936,7 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
 	}
 
 	ctrls->pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	ctrls->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 	ctrls->gain->flags |= V4L2_CTRL_FLAG_VOLATILE;
 	ctrls->exposure->flags |= V4L2_CTRL_FLAG_VOLATILE;
 
-- 
2.35.0

