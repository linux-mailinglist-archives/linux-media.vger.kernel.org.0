Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBABC51A484
	for <lists+linux-media@lfdr.de>; Wed,  4 May 2022 17:52:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352806AbiEDP4J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 May 2022 11:56:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352652AbiEDP4I (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 May 2022 11:56:08 -0400
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C88F45ADE
        for <linux-media@vger.kernel.org>; Wed,  4 May 2022 08:52:31 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 064E61BF20A;
        Wed,  4 May 2022 15:52:26 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        Eugen.Hristev@microchip.com, jbrunet@baylibre.com,
        paul.elder@ideasonboard.com, eddy.khan@vergesense.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH v6 05/28] media: ov5640: Add LINK_FREQ control
Date:   Wed,  4 May 2022 17:51:34 +0200
Message-Id: <20220504155157.184047-6-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220504155157.184047-1-jacopo@jmondi.org>
References: <20220504155157.184047-1-jacopo@jmondi.org>
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

Add the V4L2_CID_LINK_FREQ control to the ov5640 driver.
Make the control read-only for the moment.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov5640.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 1b2c7623fb14..f9763edf2422 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -141,6 +141,24 @@ static const u32 ov5640_pixel_rates[] = {
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
+/* Link freq for default mode: UYVY 16 bpp, 2 data lanes. */
+#define OV5640_DEFAULT_LINK_FREQ	13
+
 enum ov5640_format_mux {
 	OV5640_FMT_MUX_YUV422 = 0,
 	OV5640_FMT_MUX_RGB,
@@ -270,6 +288,7 @@ struct ov5640_mode_info {
 struct ov5640_ctrls {
 	struct v4l2_ctrl_handler handler;
 	struct v4l2_ctrl *pixel_rate;
+	struct v4l2_ctrl *link_freq;
 	struct {
 		struct v4l2_ctrl *auto_exp;
 		struct v4l2_ctrl *exposure;
@@ -2867,6 +2886,12 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
 			      ov5640_pixel_rates[0], 1,
 			      ov5640_pixel_rates[mode->pixel_rate]);
 
+	ctrls->link_freq = v4l2_ctrl_new_int_menu(hdl, ops,
+					V4L2_CID_LINK_FREQ,
+					ARRAY_SIZE(ov5640_csi2_link_freqs) - 1,
+					OV5640_DEFAULT_LINK_FREQ,
+					ov5640_csi2_link_freqs);
+
 	/* Auto/manual white balance */
 	ctrls->auto_wb = v4l2_ctrl_new_std(hdl, ops,
 					   V4L2_CID_AUTO_WHITE_BALANCE,
@@ -2915,6 +2940,7 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
 	}
 
 	ctrls->pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	ctrls->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 	ctrls->gain->flags |= V4L2_CTRL_FLAG_VOLATILE;
 	ctrls->exposure->flags |= V4L2_CTRL_FLAG_VOLATILE;
 
-- 
2.35.1

