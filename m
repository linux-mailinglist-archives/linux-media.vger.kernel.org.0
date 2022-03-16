Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71D1E4DB53A
	for <lists+linux-media@lfdr.de>; Wed, 16 Mar 2022 16:47:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357359AbiCPPsZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Mar 2022 11:48:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357354AbiCPPsY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Mar 2022 11:48:24 -0400
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [IPv6:2001:4b98:dc4:8::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97D6F6D39B;
        Wed, 16 Mar 2022 08:47:09 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id A8B86240012;
        Wed, 16 Mar 2022 15:47:06 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     niklas.soderlund@ragnatech.se, laurent.pinchart@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        tomi.valkeinen@ideasonboard.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 08/10] media: rcar-csi2: Config by using the remote frame_desc
Date:   Wed, 16 Mar 2022 16:46:39 +0100
Message-Id: <20220316154641.511667-9-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220316154641.511667-1-jacopo+renesas@jmondi.org>
References: <20220316154641.511667-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Configure the CSI-2 receiver by inspecting the remote subdev frame_desc.

Configure the link clock rate, field handling and CSI-2 Virtual Channel
and DT filtering using the frame descriptor retrieved from the
transmitter.

This change also makes mandatory for any subdevice that operates with
the R-Car CSI-2 receiver to implement the .get_frame_desc() operation.

[based on a patch from]
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
[rework based on lates multistream support]
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/platform/rcar-vin/rcar-csi2.c | 138 +++++++++++++++-----
 1 file changed, 105 insertions(+), 33 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index b06af1080b04..39545e631e42 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -70,10 +70,7 @@ struct rcar_csi2;
 #define FLD_REG				0x1c
 #define FLD_FLD_NUM(n)			(((n) & 0xff) << 16)
 #define FLD_DET_SEL(n)			(((n) & 0x3) << 4)
-#define FLD_FLD_EN4			BIT(3)
-#define FLD_FLD_EN3			BIT(2)
-#define FLD_FLD_EN2			BIT(1)
-#define FLD_FLD_EN			BIT(0)
+#define FLD_FLD_EN(n)			BIT((n) & 0xf)
 
 /* Automatic Standby Control */
 #define ASTBY_REG			0x20
@@ -471,6 +468,17 @@ static const struct rcar_csi2_format *rcsi2_code_to_fmt(unsigned int code)
 	return NULL;
 }
 
+static const struct rcar_csi2_format *rcsi2_datatype_to_fmt(unsigned int dt)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(rcar_csi2_formats); i++)
+		if (rcar_csi2_formats[i].datatype == dt)
+			return &rcar_csi2_formats[i];
+
+	return NULL;
+}
+
 enum rcar_csi2_pads {
 	RCAR_CSI2_SINK,
 	RCAR_CSI2_SOURCE_VC0,
@@ -506,7 +514,6 @@ struct rcar_csi2 {
 	int channel_vc[4];
 
 	struct mutex lock; /* Protects mf and stream_count. */
-	struct v4l2_mbus_framefmt mf;
 	int stream_count;
 
 	unsigned short lanes;
@@ -555,6 +562,32 @@ static int rcsi2_exit_standby(struct rcar_csi2 *priv)
 	return 0;
 }
 
+static int rcsi2_get_remote_frame_desc(struct rcar_csi2 *priv,
+				       struct v4l2_mbus_frame_desc *fd)
+{
+	struct media_pad *pad;
+	int ret;
+
+	if (!priv->remote)
+		return -ENODEV;
+
+	pad = media_entity_remote_pad(&priv->pads[RCAR_CSI2_SINK]);
+	if (!pad)
+		return -ENODEV;
+
+	ret = v4l2_subdev_call(priv->remote, pad, get_frame_desc,
+			       pad->index, fd);
+	if (ret)
+		return ret;
+
+	if (fd->type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
+		dev_err(priv->dev, "Frame desc do not describe CSI-2 link");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int rcsi2_wait_phy_start(struct rcar_csi2 *priv,
 				unsigned int lanes)
 {
@@ -605,11 +638,14 @@ static int rcsi2_set_phypll(struct rcar_csi2 *priv, unsigned int mbps)
 	return 0;
 }
 
-static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp,
-			   unsigned int lanes)
+static int rcsi2_calc_mbps(struct rcar_csi2 *priv,
+			   struct v4l2_mbus_frame_desc *fd, unsigned int lanes)
 {
+	const struct v4l2_mbus_frame_desc_entry_csi2 *csi2_desc;
+	const struct rcar_csi2_format *format;
 	struct v4l2_subdev *source;
 	struct v4l2_ctrl *ctrl;
+	unsigned int i;
 	u64 mbps;
 
 	if (!priv->remote)
@@ -625,12 +661,30 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp,
 		return -EINVAL;
 	}
 
+	/* Verify that all remote streams send the same datatype. */
+	csi2_desc = NULL;
+	for (i = 0; i < fd->num_entries; i++) {
+		struct v4l2_mbus_frame_desc_entry_csi2 *stream_desc;
+
+		stream_desc = &fd->entry[i].bus.csi2;
+		if (!csi2_desc)
+			csi2_desc = stream_desc;
+
+		if (csi2_desc->dt != stream_desc->dt) {
+			dev_err(priv->dev,
+				"Remote streams with different DT: %u - %u\n",
+				csi2_desc->dt, stream_desc->dt);
+			return -EINVAL;
+		}
+	}
+	format = rcsi2_datatype_to_fmt(csi2_desc->dt);
+
 	/*
 	 * Calculate the phypll in mbps.
 	 * link_freq = (pixel_rate * bits_per_sample) / (2 * nr_of_lanes)
 	 * bps = link_freq * 2
 	 */
-	mbps = v4l2_ctrl_g_ctrl_int64(ctrl) * bpp;
+	mbps = v4l2_ctrl_g_ctrl_int64(ctrl) * format->bpp;
 	do_div(mbps, lanes * 1000000);
 
 	return mbps;
@@ -676,54 +730,65 @@ static int rcsi2_get_active_lanes(struct rcar_csi2 *priv,
 
 static int rcsi2_start_receiver(struct rcar_csi2 *priv)
 {
-	const struct rcar_csi2_format *format;
+	const struct v4l2_subdev_stream_configs *configs;
 	u32 phycnt, vcdt = 0, vcdt2 = 0, fld = 0;
+	struct v4l2_subdev_state *state;
+	struct v4l2_mbus_frame_desc fd;
 	unsigned int lanes;
 	unsigned int i;
 	int mbps, ret;
 
-	dev_dbg(priv->dev, "Input size (%ux%u%c)\n",
-		priv->mf.width, priv->mf.height,
-		priv->mf.field == V4L2_FIELD_NONE ? 'p' : 'i');
-
-	/* Code is validated in set_fmt. */
-	format = rcsi2_code_to_fmt(priv->mf.code);
-	if (!format)
-		return -EINVAL;
+	/* Get information about multiplexed link. */
+	ret = rcsi2_get_remote_frame_desc(priv, &fd);
+	if (ret)
+		return ret;
 
-	/*
-	 * Enable all supported CSI-2 channels with virtual channel and
-	 * data type matching.
-	 *
-	 * NOTE: It's not possible to get individual datatype for each
-	 *       source virtual channel. Once this is possible in V4L2
-	 *       it should be used here.
-	 */
-	for (i = 0; i < priv->info->num_channels; i++) {
+	for (i = 0; i < fd.num_entries; i++) {
+		struct v4l2_mbus_frame_desc_entry *entry = &fd.entry[i];
 		u32 vcdt_part;
 
 		if (priv->channel_vc[i] < 0)
 			continue;
 
-		vcdt_part = VCDT_SEL_VC(priv->channel_vc[i]) | VCDT_VCDTN_EN |
-			VCDT_SEL_DTN_ON | VCDT_SEL_DT(format->datatype);
+		vcdt_part = VCDT_SEL_VC(priv->channel_vc[i]) |
+			    VCDT_VCDTN_EN | VCDT_SEL_DTN_ON |
+			    VCDT_SEL_DT(entry->bus.csi2.dt);
 
 		/* Store in correct reg and offset. */
 		if (i < 2)
 			vcdt |= vcdt_part << ((i % 2) * 16);
 		else
 			vcdt2 |= vcdt_part << ((i % 2) * 16);
+
+		dev_dbg(priv->dev, "channel %u: VC = %d, datatype = 0x%x\n",
+			i, priv->channel_vc[i], entry->bus.csi2.dt);
 	}
 
-	if (priv->mf.field == V4L2_FIELD_ALTERNATE) {
-		fld = FLD_DET_SEL(1) | FLD_FLD_EN4 | FLD_FLD_EN3 | FLD_FLD_EN2
-			| FLD_FLD_EN;
+	/*
+	 * Configure field handling inspecting the formats of the
+	 * sink pad streams.
+	 */
+	state = v4l2_subdev_lock_and_get_active_state(&priv->subdev);
+	configs = &state->stream_configs;
+	for (i = 0; i < configs->num_configs; ++i) {
+		const struct v4l2_subdev_stream_config *config = configs->configs;
 
-		if (priv->mf.height == 240)
+		if (config->pad != RCAR_CSI2_SINK)
+			continue;
+
+		if (config->fmt.field != V4L2_FIELD_ALTERNATE)
+			continue;
+
+		fld |= FLD_DET_SEL(1);
+		fld |= FLD_FLD_EN(config->stream);
+
+		/* PAL vs NTSC. */
+		if (config->fmt.height == 240)
 			fld |= FLD_FLD_NUM(0);
 		else
 			fld |= FLD_FLD_NUM(1);
 	}
+	v4l2_subdev_unlock_state(state);
 
 	/*
 	 * Get the number of active data lanes inspecting the remote mbus
@@ -736,7 +801,7 @@ static int rcsi2_start_receiver(struct rcar_csi2 *priv)
 	phycnt = PHYCNT_ENABLECLK;
 	phycnt |= (1 << lanes) - 1;
 
-	mbps = rcsi2_calc_mbps(priv, format->bpp, lanes);
+	mbps = rcsi2_calc_mbps(priv, &fd, lanes);
 	if (mbps < 0)
 		return mbps;
 
@@ -1019,6 +1084,13 @@ static int rcsi2_notify_bound(struct v4l2_async_notifier *notifier,
 	struct rcar_csi2 *priv = notifier_to_csi2(notifier);
 	int pad;
 
+	if (!v4l2_subdev_has_op(subdev, pad, get_frame_desc)) {
+		dev_err(priv->dev,
+			"Subdev %s bound failed: missing get_frame_desc()\n",
+			subdev->name);
+		return -EINVAL;
+	}
+
 	pad = media_entity_get_fwnode_pad(&subdev->entity, asd->match.fwnode,
 					  MEDIA_PAD_FL_SOURCE);
 	if (pad < 0) {
-- 
2.35.1

