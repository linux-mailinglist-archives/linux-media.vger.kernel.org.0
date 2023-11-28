Return-Path: <linux-media+bounces-1236-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 756047FB75F
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 11:25:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D9885B220E7
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 10:25:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E83774F207;
	Tue, 28 Nov 2023 10:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qO/PYLx6"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA1F4E1CA;
	Tue, 28 Nov 2023 10:25:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C1BAC433C8;
	Tue, 28 Nov 2023 10:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701167120;
	bh=LLddbmHSvxdtVFD4DSsUQGFVmljidRBrnrLcM5U8K3U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qO/PYLx6/dZZeJz5E3X4eb/t4l2dVwFcUYoN5ZBPQfw7NnJblEn97BBKpbHUx6xIS
	 F2JfiNwlFe5aCzNwFMoZ+HnaGm5AY/d1e+OcZ0f08XGC1JtX00urWQmMj8PQiac2Bo
	 o/jBkCrFT/4vGY2UZLOeppXg7M0Vlo23jMmVdh2lSLa2qihhq6tTsYDah0a5ikhsZo
	 6yvl7xyn+2kFvFOTF8BSPijk3FzPRWm0mr8TgmnrHQ9WN91tl43B2S6588+H3Zv+JO
	 58r9PmkH1TiK+AkeyuASH02fg9jzqDYwJR8PuCq3Bfzp56T7ZUVy3v2sRWUG/XULuZ
	 1wQp+dCL5jNXQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 28 Nov 2023 11:24:31 +0100
Subject: [PATCH v4 20/45] drm/vc4: hdmi: Switch to HDMI connector
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231128-kms-hdmi-connector-state-v4-20-c7602158306e@kernel.org>
References: <20231128-kms-hdmi-connector-state-v4-0-c7602158306e@kernel.org>
In-Reply-To: <20231128-kms-hdmi-connector-state-v4-0-c7602158306e@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, 
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=37722; i=mripard@kernel.org;
 h=from:subject:message-id; bh=LLddbmHSvxdtVFD4DSsUQGFVmljidRBrnrLcM5U8K3U=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmp+y99nzR9e7KD4A7bvhTD0NIlosued6z/6al4fmtsc
 vWp9P0bO0pZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjCRhC5Ghqm3Zjo9vLlHcp9V
 1GLJQAnWrdN8Zjf33XVc+DSzO6l9nS0jw7Ebxf7OR/p896zSXzS96/l731OR6zsDFta2eco2LN6
 jxQwA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The new HDMI connector infrastructure allows us to remove a lot of
boilerplate, so let's switch to it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c     | 636 +++++--------------------------------
 drivers/gpu/drm/vc4/vc4_hdmi.h     |  44 +--
 drivers/gpu/drm/vc4/vc4_hdmi_phy.c |   6 +-
 3 files changed, 84 insertions(+), 602 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index f05e2c95a60d..1c2258c0e0e7 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -109,25 +109,6 @@
 
 #define HDMI_14_MAX_TMDS_CLK   (340 * 1000 * 1000)
 
-static const char * const output_format_str[] = {
-	[VC4_HDMI_OUTPUT_RGB]		= "RGB",
-	[VC4_HDMI_OUTPUT_YUV420]	= "YUV 4:2:0",
-	[VC4_HDMI_OUTPUT_YUV422]	= "YUV 4:2:2",
-	[VC4_HDMI_OUTPUT_YUV444]	= "YUV 4:4:4",
-};
-
-static const char *vc4_hdmi_output_fmt_str(enum vc4_hdmi_output_format fmt)
-{
-	if (fmt >= ARRAY_SIZE(output_format_str))
-		return "invalid";
-
-	return output_format_str[fmt];
-}
-
-static unsigned long long
-vc4_hdmi_encoder_compute_mode_clock(const struct drm_display_mode *mode,
-				    unsigned int bpc, enum vc4_hdmi_output_format fmt);
-
 static bool vc4_hdmi_supports_scrambling(struct vc4_hdmi *vc4_hdmi)
 {
 	struct drm_display_info *display = &vc4_hdmi->connector.display_info;
@@ -146,28 +127,13 @@ static bool vc4_hdmi_supports_scrambling(struct vc4_hdmi *vc4_hdmi)
 
 static bool vc4_hdmi_mode_needs_scrambling(const struct drm_display_mode *mode,
 					   unsigned int bpc,
-					   enum vc4_hdmi_output_format fmt)
+					   enum hdmi_colorspace fmt)
 {
-	unsigned long long clock = vc4_hdmi_encoder_compute_mode_clock(mode, bpc, fmt);
+	unsigned long long clock = drm_connector_hdmi_compute_mode_clock(mode, bpc, fmt);
 
 	return clock > HDMI_14_MAX_TMDS_CLK;
 }
 
-static bool vc4_hdmi_is_full_range(struct vc4_hdmi *vc4_hdmi,
-				   struct vc4_hdmi_connector_state *vc4_state)
-{
-	const struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
-	struct drm_display_info *display = &vc4_hdmi->connector.display_info;
-
-	if (vc4_state->broadcast_rgb == VC4_HDMI_BROADCAST_RGB_LIMITED)
-		return false;
-	else if (vc4_state->broadcast_rgb == VC4_HDMI_BROADCAST_RGB_FULL)
-		return true;
-
-	return !display->is_hdmi ||
-		drm_default_rgb_quant_range(mode) == HDMI_QUANTIZATION_RANGE_FULL;
-}
-
 static int vc4_hdmi_debugfs_regs(struct seq_file *m, void *unused)
 {
 	struct drm_debugfs_entry *entry = m->private;
@@ -519,7 +485,7 @@ static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 		const struct drm_display_mode *mode;
 
 		list_for_each_entry(mode, &connector->probed_modes, head) {
-			if (vc4_hdmi_mode_needs_scrambling(mode, 8, VC4_HDMI_OUTPUT_RGB)) {
+			if (vc4_hdmi_mode_needs_scrambling(mode, 8, HDMI_COLORSPACE_RGB)) {
 				drm_warn_once(drm, "The core clock cannot reach frequencies high enough to support 4k @ 60Hz.");
 				drm_warn_once(drm, "Please change your config.txt file to add hdmi_enable_4kp60.");
 			}
@@ -534,12 +500,8 @@ static int vc4_hdmi_connector_atomic_check(struct drm_connector *connector,
 {
 	struct drm_connector_state *old_state =
 		drm_atomic_get_old_connector_state(state, connector);
-	struct vc4_hdmi_connector_state *old_vc4_state =
-		conn_state_to_vc4_hdmi_conn_state(old_state);
 	struct drm_connector_state *new_state =
 		drm_atomic_get_new_connector_state(state, connector);
-	struct vc4_hdmi_connector_state *new_vc4_state =
-		conn_state_to_vc4_hdmi_conn_state(new_state);
 	struct drm_crtc *crtc = new_state->crtc;
 
 	if (!crtc)
@@ -571,9 +533,7 @@ static int vc4_hdmi_connector_atomic_check(struct drm_connector *connector,
 			return ret;
 	}
 
-	if (old_state->colorspace != new_state->colorspace ||
-	    old_vc4_state->broadcast_rgb != new_vc4_state->broadcast_rgb ||
-	    !drm_connector_atomic_hdr_metadata_equal(old_state, new_state)) {
+	if (old_state->colorspace != new_state->colorspace) {
 		struct drm_crtc_state *crtc_state;
 
 		crtc_state = drm_atomic_get_crtc_state(state, crtc);
@@ -583,112 +543,21 @@ static int vc4_hdmi_connector_atomic_check(struct drm_connector *connector,
 		crtc_state->mode_changed = true;
 	}
 
-	return 0;
-}
-
-static int vc4_hdmi_connector_get_property(struct drm_connector *connector,
-					   const struct drm_connector_state *state,
-					   struct drm_property *property,
-					   uint64_t *val)
-{
-	struct drm_device *drm = connector->dev;
-	struct vc4_hdmi *vc4_hdmi =
-		connector_to_vc4_hdmi(connector);
-	const struct vc4_hdmi_connector_state *vc4_conn_state =
-		conn_state_to_vc4_hdmi_conn_state(state);
-
-	if (property == vc4_hdmi->broadcast_rgb_property) {
-		*val = vc4_conn_state->broadcast_rgb;
-	} else {
-		drm_dbg(drm, "Unknown property [PROP:%d:%s]\n",
-			property->base.id, property->name);
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-static int vc4_hdmi_connector_set_property(struct drm_connector *connector,
-					   struct drm_connector_state *state,
-					   struct drm_property *property,
-					   uint64_t val)
-{
-	struct drm_device *drm = connector->dev;
-	struct vc4_hdmi *vc4_hdmi =
-		connector_to_vc4_hdmi(connector);
-	struct vc4_hdmi_connector_state *vc4_conn_state =
-		conn_state_to_vc4_hdmi_conn_state(state);
-
-	if (property == vc4_hdmi->broadcast_rgb_property) {
-		vc4_conn_state->broadcast_rgb = val;
-		return 0;
-	}
-
-	drm_dbg(drm, "Unknown property [PROP:%d:%s]\n",
-		property->base.id, property->name);
-	return -EINVAL;
+	return drm_atomic_helper_connector_hdmi_check(connector, state);
 }
 
 static void vc4_hdmi_connector_reset(struct drm_connector *connector)
 {
-	struct vc4_hdmi_connector_state *old_state =
-		conn_state_to_vc4_hdmi_conn_state(connector->state);
-	struct vc4_hdmi_connector_state *new_state =
-		kzalloc(sizeof(*new_state), GFP_KERNEL);
-
-	if (connector->state)
-		__drm_atomic_helper_connector_destroy_state(connector->state);
-
-	kfree(old_state);
-	__drm_atomic_helper_connector_reset(connector, &new_state->base);
-
-	if (!new_state)
-		return;
-
-	new_state->base.max_bpc = 8;
-	new_state->base.max_requested_bpc = 8;
-	new_state->output_format = VC4_HDMI_OUTPUT_RGB;
-	new_state->broadcast_rgb = VC4_HDMI_BROADCAST_RGB_AUTO;
+	drm_atomic_helper_connector_reset(connector);
+	__drm_atomic_helper_connector_hdmi_reset(connector, connector->state);
 	drm_atomic_helper_connector_tv_margins_reset(connector);
 }
 
-static struct drm_connector_state *
-vc4_hdmi_connector_duplicate_state(struct drm_connector *connector)
-{
-	struct drm_connector_state *conn_state = connector->state;
-	struct vc4_hdmi_connector_state *vc4_state = conn_state_to_vc4_hdmi_conn_state(conn_state);
-	struct vc4_hdmi_connector_state *new_state;
-
-	new_state = kzalloc(sizeof(*new_state), GFP_KERNEL);
-	if (!new_state)
-		return NULL;
-
-	new_state->tmds_char_rate = vc4_state->tmds_char_rate;
-	new_state->output_bpc = vc4_state->output_bpc;
-	new_state->output_format = vc4_state->output_format;
-	new_state->broadcast_rgb = vc4_state->broadcast_rgb;
-	__drm_atomic_helper_connector_duplicate_state(connector, &new_state->base);
-
-	return &new_state->base;
-}
-
-static void vc4_hdmi_connector_destroy_state(struct drm_connector *connector,
-					     struct drm_connector_state *state)
-{
-	struct vc4_hdmi_connector_state *vc4_state =
-		conn_state_to_vc4_hdmi_conn_state(state);
-
-	__drm_atomic_helper_connector_destroy_state(state);
-	kfree(vc4_state);
-}
-
 static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.reset = vc4_hdmi_connector_reset,
-	.atomic_duplicate_state = vc4_hdmi_connector_duplicate_state,
-	.atomic_destroy_state = vc4_hdmi_connector_destroy_state,
-	.atomic_get_property = vc4_hdmi_connector_get_property,
-	.atomic_set_property = vc4_hdmi_connector_set_property,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
 static const struct drm_connector_helper_funcs vc4_hdmi_connector_helper_funcs = {
@@ -697,32 +566,7 @@ static const struct drm_connector_helper_funcs vc4_hdmi_connector_helper_funcs =
 	.atomic_check = vc4_hdmi_connector_atomic_check,
 };
 
-static const struct drm_prop_enum_list broadcast_rgb_names[] = {
-	{ VC4_HDMI_BROADCAST_RGB_AUTO, "Automatic" },
-	{ VC4_HDMI_BROADCAST_RGB_FULL, "Full" },
-	{ VC4_HDMI_BROADCAST_RGB_LIMITED, "Limited 16:235" },
-};
-
-static void
-vc4_hdmi_attach_broadcast_rgb_property(struct drm_device *dev,
-				       struct vc4_hdmi *vc4_hdmi)
-{
-	struct drm_property *prop = vc4_hdmi->broadcast_rgb_property;
-
-	if (!prop) {
-		prop = drm_property_create_enum(dev, DRM_MODE_PROP_ENUM,
-						"Broadcast RGB",
-						broadcast_rgb_names,
-						ARRAY_SIZE(broadcast_rgb_names));
-		if (!prop)
-			return;
-
-		vc4_hdmi->broadcast_rgb_property = prop;
-	}
-
-	drm_object_attach_property(&vc4_hdmi->connector.base, prop,
-				   VC4_HDMI_BROADCAST_RGB_AUTO);
-}
+static const struct drm_connector_hdmi_funcs vc4_hdmi_hdmi_connector_funcs;
 
 static int vc4_hdmi_connector_init(struct drm_device *dev,
 				   struct vc4_hdmi *vc4_hdmi)
@@ -731,10 +575,16 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
 	struct drm_encoder *encoder = &vc4_hdmi->encoder.base;
 	int ret;
 
-	ret = drmm_connector_init(dev, connector,
-				  &vc4_hdmi_connector_funcs,
-				  DRM_MODE_CONNECTOR_HDMIA,
-				  vc4_hdmi->ddc);
+	ret = drmm_connector_hdmi_init(dev, connector,
+				       "Broadcom", "Videocore",
+				       &vc4_hdmi_connector_funcs,
+				       &vc4_hdmi_hdmi_connector_funcs,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       vc4_hdmi->ddc,
+				       BIT(HDMI_COLORSPACE_RGB) |
+				       BIT(HDMI_COLORSPACE_YUV422) |
+				       BIT(HDMI_COLORSPACE_YUV444),
+				       12);
 	if (ret)
 		return ret;
 
@@ -758,7 +608,6 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
 
 	drm_connector_attach_colorspace_property(connector);
 	drm_connector_attach_tv_margin_properties(connector);
-	drm_connector_attach_max_bpc_property(connector, 8, 12);
 
 	connector->polled = (DRM_CONNECTOR_POLL_CONNECT |
 			     DRM_CONNECTOR_POLL_DISCONNECT);
@@ -767,21 +616,19 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
 	connector->doublescan_allowed = 0;
 	connector->stereo_allowed = 1;
 
-	if (vc4_hdmi->variant->supports_hdr)
-		drm_connector_attach_hdr_output_metadata_property(connector);
-
-	vc4_hdmi_attach_broadcast_rgb_property(dev, vc4_hdmi);
+	ret = drm_connector_attach_broadcast_rgb_property(connector);
+	if (ret)
+		return ret;
 
 	drm_connector_attach_encoder(connector, encoder);
 
 	return 0;
 }
 
-static int vc4_hdmi_stop_packet(struct drm_encoder *encoder,
+static int vc4_hdmi_stop_packet(struct vc4_hdmi *vc4_hdmi,
 				enum hdmi_infoframe_type type,
 				bool poll)
 {
-	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	struct drm_device *drm = vc4_hdmi->connector.dev;
 	u32 packet_id = type - 0x80;
 	unsigned long flags;
@@ -805,12 +652,13 @@ static int vc4_hdmi_stop_packet(struct drm_encoder *encoder,
 	return ret;
 }
 
-static void vc4_hdmi_write_infoframe(struct drm_encoder *encoder,
-				     union hdmi_infoframe *frame)
+static int vc4_hdmi_write_infoframe(struct drm_connector *connector,
+				    enum hdmi_infoframe_type type,
+				    const u8 *infoframe, size_t len)
 {
-	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	struct drm_device *drm = vc4_hdmi->connector.dev;
-	u32 packet_id = frame->any.type - 0x80;
+	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
+	struct drm_device *drm = connector->dev;
+	u32 packet_id = type - 0x80;
 	const struct vc4_hdmi_register *ram_packet_start =
 		&vc4_hdmi->variant->registers[HDMI_RAM_PACKET_START];
 	u32 packet_reg = ram_packet_start->offset + VC4_HDMI_PACKET_STRIDE * packet_id;
@@ -820,22 +668,23 @@ static void vc4_hdmi_write_infoframe(struct drm_encoder *encoder,
 						       ram_packet_start->reg);
 	uint8_t buffer[VC4_HDMI_PACKET_STRIDE] = {};
 	unsigned long flags;
-	ssize_t len, i;
+	ssize_t i;
 	int ret;
 	int idx;
 
 	if (!drm_dev_enter(drm, &idx))
-		return;
+		return 0;
+
+	if (len > sizeof(buffer))
+		goto out;
+
+	memcpy(buffer, infoframe, len);
 
 	WARN_ONCE(!(HDMI_READ(HDMI_RAM_PACKET_CONFIG) &
 		    VC4_HDMI_RAM_PACKET_ENABLE),
 		  "Packet RAM has to be on to store the packet.");
 
-	len = hdmi_infoframe_pack(frame, buffer, sizeof(buffer));
-	if (len < 0)
-		goto out;
-
-	ret = vc4_hdmi_stop_packet(encoder, frame->any.type, true);
+	ret = vc4_hdmi_stop_packet(vc4_hdmi, type, true);
 	if (ret) {
 		DRM_ERROR("Failed to wait for infoframe to go idle: %d\n", ret);
 		goto out;
@@ -877,130 +726,7 @@ static void vc4_hdmi_write_infoframe(struct drm_encoder *encoder,
 
 out:
 	drm_dev_exit(idx);
-}
-
-static void vc4_hdmi_avi_infoframe_colorspace(struct hdmi_avi_infoframe *frame,
-					      enum vc4_hdmi_output_format fmt)
-{
-	switch (fmt) {
-	case VC4_HDMI_OUTPUT_RGB:
-		frame->colorspace = HDMI_COLORSPACE_RGB;
-		break;
-
-	case VC4_HDMI_OUTPUT_YUV420:
-		frame->colorspace = HDMI_COLORSPACE_YUV420;
-		break;
-
-	case VC4_HDMI_OUTPUT_YUV422:
-		frame->colorspace = HDMI_COLORSPACE_YUV422;
-		break;
-
-	case VC4_HDMI_OUTPUT_YUV444:
-		frame->colorspace = HDMI_COLORSPACE_YUV444;
-		break;
-
-	default:
-		break;
-	}
-}
-
-static void vc4_hdmi_set_avi_infoframe(struct drm_encoder *encoder)
-{
-	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	struct drm_connector *connector = &vc4_hdmi->connector;
-	struct drm_connector_state *cstate = connector->state;
-	struct vc4_hdmi_connector_state *vc4_state =
-		conn_state_to_vc4_hdmi_conn_state(cstate);
-	const struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
-	union hdmi_infoframe frame;
-	int ret;
-
-	lockdep_assert_held(&vc4_hdmi->mutex);
-
-	ret = drm_hdmi_avi_infoframe_from_display_mode(&frame.avi,
-						       connector, mode);
-	if (ret < 0) {
-		DRM_ERROR("couldn't fill AVI infoframe\n");
-		return;
-	}
-
-	drm_hdmi_avi_infoframe_quant_range(&frame.avi,
-					   connector, mode,
-					   vc4_hdmi_is_full_range(vc4_hdmi, vc4_state) ?
-					   HDMI_QUANTIZATION_RANGE_FULL :
-					   HDMI_QUANTIZATION_RANGE_LIMITED);
-	drm_hdmi_avi_infoframe_colorimetry(&frame.avi, cstate);
-	vc4_hdmi_avi_infoframe_colorspace(&frame.avi, vc4_state->output_format);
-	drm_hdmi_avi_infoframe_bars(&frame.avi, cstate);
-
-	vc4_hdmi_write_infoframe(encoder, &frame);
-}
-
-static void vc4_hdmi_set_spd_infoframe(struct drm_encoder *encoder)
-{
-	union hdmi_infoframe frame;
-	int ret;
-
-	ret = hdmi_spd_infoframe_init(&frame.spd, "Broadcom", "Videocore");
-	if (ret < 0) {
-		DRM_ERROR("couldn't fill SPD infoframe\n");
-		return;
-	}
-
-	frame.spd.sdi = HDMI_SPD_SDI_PC;
-
-	vc4_hdmi_write_infoframe(encoder, &frame);
-}
-
-static void vc4_hdmi_set_audio_infoframe(struct drm_encoder *encoder)
-{
-	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	struct hdmi_audio_infoframe *audio = &vc4_hdmi->audio.infoframe;
-	union hdmi_infoframe frame;
-
-	memcpy(&frame.audio, audio, sizeof(*audio));
-
-	if (vc4_hdmi->packet_ram_enabled)
-		vc4_hdmi_write_infoframe(encoder, &frame);
-}
-
-static void vc4_hdmi_set_hdr_infoframe(struct drm_encoder *encoder)
-{
-	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	struct drm_connector *connector = &vc4_hdmi->connector;
-	struct drm_connector_state *conn_state = connector->state;
-	union hdmi_infoframe frame;
-
-	lockdep_assert_held(&vc4_hdmi->mutex);
-
-	if (!vc4_hdmi->variant->supports_hdr)
-		return;
-
-	if (!conn_state->hdr_output_metadata)
-		return;
-
-	if (drm_hdmi_infoframe_set_hdr_metadata(&frame.drm, conn_state))
-		return;
-
-	vc4_hdmi_write_infoframe(encoder, &frame);
-}
-
-static void vc4_hdmi_set_infoframes(struct drm_encoder *encoder)
-{
-	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-
-	lockdep_assert_held(&vc4_hdmi->mutex);
-
-	vc4_hdmi_set_avi_infoframe(encoder);
-	vc4_hdmi_set_spd_infoframe(encoder);
-	/*
-	 * If audio was streaming, then we need to reenabled the audio
-	 * infoframe here during encoder_enable.
-	 */
-	if (vc4_hdmi->audio.streaming)
-		vc4_hdmi_set_audio_infoframe(encoder);
-
-	vc4_hdmi_set_hdr_infoframe(encoder);
+	return ret;
 }
 
 #define SCRAMBLING_POLLING_DELAY_MS	1000
@@ -1169,9 +895,8 @@ static void vc4_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 			       struct drm_connector_state *state,
 			       const struct drm_display_mode *mode)
 {
-	struct vc4_hdmi_connector_state *vc4_state =
-		conn_state_to_vc4_hdmi_conn_state(state);
 	struct drm_device *drm = vc4_hdmi->connector.dev;
+	bool is_lim_range = !state->hdmi.is_full_range;
 	unsigned long flags;
 	u32 csc_ctl;
 	int idx;
@@ -1184,7 +909,7 @@ static void vc4_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 	csc_ctl = VC4_SET_FIELD(VC4_HD_CSC_CTL_ORDER_BGR,
 				VC4_HD_CSC_CTL_ORDER);
 
-	if (!vc4_hdmi_is_full_range(vc4_hdmi, vc4_state)) {
+	if (is_lim_range) {
 		/* CEA VICs other than #1 requre limited range RGB
 		 * output unless overridden by an AVI infoframe.
 		 * Apply a colorspace conversion to squash 0-255 down
@@ -1407,9 +1132,7 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 			       const struct drm_display_mode *mode)
 {
 	struct drm_device *drm = vc4_hdmi->connector.dev;
-	struct vc4_hdmi_connector_state *vc4_state =
-		conn_state_to_vc4_hdmi_conn_state(state);
-	unsigned int lim_range = vc4_hdmi_is_full_range(vc4_hdmi, vc4_state) ? 0 : 1;
+	unsigned int lim_range = state->hdmi.is_full_range ? 0 : 1;
 	unsigned long flags;
 	const u16 (*csc)[4];
 	u32 if_cfg = 0;
@@ -1424,14 +1147,14 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 
-	switch (vc4_state->output_format) {
-	case VC4_HDMI_OUTPUT_YUV444:
+	switch (state->hdmi.output_format) {
+	case HDMI_COLORSPACE_YUV444:
 		csc = vc5_hdmi_find_yuv_csc_coeffs(vc4_hdmi, state->colorspace, !!lim_range);
 
 		vc5_hdmi_set_csc_coeffs_swap(vc4_hdmi, csc);
 		break;
 
-	case VC4_HDMI_OUTPUT_YUV422:
+	case HDMI_COLORSPACE_YUV422:
 		csc = vc5_hdmi_find_yuv_csc_coeffs(vc4_hdmi, state->colorspace, !!lim_range);
 
 		csc_ctl |= VC4_SET_FIELD(VC5_MT_CP_CSC_CTL_FILTER_MODE_444_TO_422_STANDARD,
@@ -1448,7 +1171,7 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 		vc5_hdmi_set_csc_coeffs(vc4_hdmi, csc);
 		break;
 
-	case VC4_HDMI_OUTPUT_RGB:
+	case HDMI_COLORSPACE_RGB:
 		if_xbar = 0x354021;
 
 		vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_to_rgb[lim_range]);
@@ -1537,8 +1260,6 @@ static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 				 const struct drm_display_mode *mode)
 {
 	struct drm_device *drm = vc4_hdmi->connector.dev;
-	const struct vc4_hdmi_connector_state *vc4_state =
-		conn_state_to_vc4_hdmi_conn_state(state);
 	bool hsync_pos = mode->flags & DRM_MODE_FLAG_PHSYNC;
 	bool vsync_pos = mode->flags & DRM_MODE_FLAG_PVSYNC;
 	bool interlaced = mode->flags & DRM_MODE_FLAG_INTERLACE;
@@ -1590,7 +1311,7 @@ static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 	HDMI_WRITE(HDMI_VERTB0, vertb_even);
 	HDMI_WRITE(HDMI_VERTB1, vertb);
 
-	switch (vc4_state->output_bpc) {
+	switch (state->hdmi.output_bpc) {
 	case 12:
 		gcp = 6;
 		break;
@@ -1607,7 +1328,7 @@ static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 	 * YCC422 is always 36-bit and not considered deep colour so
 	 * doesn't signal in GCP.
 	 */
-	if (vc4_state->output_format == VC4_HDMI_OUTPUT_YUV422) {
+	if (state->hdmi.output_format == HDMI_COLORSPACE_YUV422) {
 		gcp = 0;
 	}
 
@@ -1691,10 +1412,8 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 	struct drm_connector *connector = &vc4_hdmi->connector;
 	struct drm_connector_state *conn_state =
 		drm_atomic_get_new_connector_state(state, connector);
-	struct vc4_hdmi_connector_state *vc4_conn_state =
-		conn_state_to_vc4_hdmi_conn_state(conn_state);
 	const struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
-	unsigned long tmds_char_rate = vc4_conn_state->tmds_char_rate;
+	unsigned long tmds_char_rate = conn_state->hdmi.tmds_char_rate;
 	unsigned long bvb_rate, hsm_rate;
 	unsigned long flags;
 	int ret;
@@ -1771,7 +1490,7 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 	}
 
 	if (vc4_hdmi->variant->phy_init)
-		vc4_hdmi->variant->phy_init(vc4_hdmi, vc4_conn_state);
+		vc4_hdmi->variant->phy_init(vc4_hdmi, conn_state);
 
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 
@@ -1836,7 +1555,8 @@ static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
 					      struct drm_atomic_state *state)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	struct drm_device *drm = vc4_hdmi->connector.dev;
+	struct drm_connector *connector = &vc4_hdmi->connector;
+	struct drm_device *drm = connector->dev;
 	const struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
 	struct drm_display_info *display = &vc4_hdmi->connector.display_info;
 	bool hsync_pos = mode->flags & DRM_MODE_FLAG_PHSYNC;
@@ -1902,7 +1622,7 @@ static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
 		spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 		vc4_hdmi->packet_ram_enabled = true;
 
-		vc4_hdmi_set_infoframes(encoder);
+		drm_atomic_helper_connector_hdmi_update_infoframes(connector, state);
 	}
 
 	vc4_hdmi_recenter_fifo(vc4_hdmi);
@@ -1919,108 +1639,21 @@ static void vc4_hdmi_encoder_atomic_mode_set(struct drm_encoder *encoder,
 					     struct drm_connector_state *conn_state)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	struct vc4_hdmi_connector_state *vc4_state =
-		conn_state_to_vc4_hdmi_conn_state(conn_state);
 
 	mutex_lock(&vc4_hdmi->mutex);
 	drm_mode_copy(&vc4_hdmi->saved_adjusted_mode,
 		      &crtc_state->adjusted_mode);
-	vc4_hdmi->output_bpc = vc4_state->output_bpc;
-	vc4_hdmi->output_format = vc4_state->output_format;
+	vc4_hdmi->output_bpc = conn_state->hdmi.output_bpc;
+	vc4_hdmi->output_format = conn_state->hdmi.output_format;
 	mutex_unlock(&vc4_hdmi->mutex);
 }
 
-static bool
-vc4_hdmi_sink_supports_format_bpc(const struct vc4_hdmi *vc4_hdmi,
-				  const struct drm_display_info *info,
-				  const struct drm_display_mode *mode,
-				  unsigned int format, unsigned int bpc)
-{
-	struct drm_device *dev = vc4_hdmi->connector.dev;
-	u8 vic = drm_match_cea_mode(mode);
-
-	if (vic == 1 && bpc != 8) {
-		drm_dbg(dev, "VIC1 requires a bpc of 8, got %u\n", bpc);
-		return false;
-	}
-
-	if (!info->is_hdmi &&
-	    (format != VC4_HDMI_OUTPUT_RGB || bpc != 8)) {
-		drm_dbg(dev, "DVI Monitors require an RGB output at 8 bpc\n");
-		return false;
-	}
-
-	switch (format) {
-	case VC4_HDMI_OUTPUT_RGB:
-		drm_dbg(dev, "RGB Format, checking the constraints.\n");
-
-		if (!(info->color_formats & DRM_COLOR_FORMAT_RGB444))
-			return false;
-
-		if (bpc == 10 && !(info->edid_hdmi_rgb444_dc_modes & DRM_EDID_HDMI_DC_30)) {
-			drm_dbg(dev, "10 BPC but sink doesn't support Deep Color 30.\n");
-			return false;
-		}
-
-		if (bpc == 12 && !(info->edid_hdmi_rgb444_dc_modes & DRM_EDID_HDMI_DC_36)) {
-			drm_dbg(dev, "12 BPC but sink doesn't support Deep Color 36.\n");
-			return false;
-		}
-
-		drm_dbg(dev, "RGB format supported in that configuration.\n");
-
-		return true;
-
-	case VC4_HDMI_OUTPUT_YUV422:
-		drm_dbg(dev, "YUV422 format, checking the constraints.\n");
-
-		if (!(info->color_formats & DRM_COLOR_FORMAT_YCBCR422)) {
-			drm_dbg(dev, "Sink doesn't support YUV422.\n");
-			return false;
-		}
-
-		if (bpc != 12) {
-			drm_dbg(dev, "YUV422 only supports 12 bpc.\n");
-			return false;
-		}
-
-		drm_dbg(dev, "YUV422 format supported in that configuration.\n");
-
-		return true;
-
-	case VC4_HDMI_OUTPUT_YUV444:
-		drm_dbg(dev, "YUV444 format, checking the constraints.\n");
-
-		if (!(info->color_formats & DRM_COLOR_FORMAT_YCBCR444)) {
-			drm_dbg(dev, "Sink doesn't support YUV444.\n");
-			return false;
-		}
-
-		if (bpc == 10 && !(info->edid_hdmi_ycbcr444_dc_modes & DRM_EDID_HDMI_DC_30)) {
-			drm_dbg(dev, "10 BPC but sink doesn't support Deep Color 30.\n");
-			return false;
-		}
-
-		if (bpc == 12 && !(info->edid_hdmi_ycbcr444_dc_modes & DRM_EDID_HDMI_DC_36)) {
-			drm_dbg(dev, "12 BPC but sink doesn't support Deep Color 36.\n");
-			return false;
-		}
-
-		drm_dbg(dev, "YUV444 format supported in that configuration.\n");
-
-		return true;
-	}
-
-	return false;
-}
-
 static enum drm_mode_status
-vc4_hdmi_encoder_clock_valid(const struct vc4_hdmi *vc4_hdmi,
-			     const struct drm_display_mode *mode,
-			     unsigned long long clock)
+vc4_hdmi_connector_clock_valid(const struct drm_connector *connector,
+			       const struct drm_display_mode *mode,
+			       unsigned long long clock)
 {
-	const struct drm_connector *connector = &vc4_hdmi->connector;
-	const struct drm_display_info *info = &connector->display_info;
+	const struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
 	struct vc4_dev *vc4 = to_vc4_dev(connector->dev);
 
 	if (clock > vc4_hdmi->variant->max_pixel_clock)
@@ -2035,125 +1668,13 @@ vc4_hdmi_encoder_clock_valid(const struct vc4_hdmi *vc4_hdmi,
 	    drm_mode_vrefresh(mode) >= 50)
 		return MODE_CLOCK_HIGH;
 
-	if (info->max_tmds_clock && clock > (info->max_tmds_clock * 1000))
-		return MODE_CLOCK_HIGH;
-
 	return MODE_OK;
 }
 
-static unsigned long long
-vc4_hdmi_encoder_compute_mode_clock(const struct drm_display_mode *mode,
-				    unsigned int bpc,
-				    enum vc4_hdmi_output_format fmt)
-{
-	unsigned long long clock = mode->clock * 1000ULL;
-
-	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
-		clock = clock * 2;
-
-	if (fmt == VC4_HDMI_OUTPUT_YUV422)
-		bpc = 8;
-
-	clock = clock * bpc;
-	do_div(clock, 8);
-
-	return clock;
-}
-
-static int
-vc4_hdmi_encoder_compute_clock(const struct vc4_hdmi *vc4_hdmi,
-			       struct vc4_hdmi_connector_state *vc4_state,
-			       const struct drm_display_mode *mode,
-			       unsigned int bpc, unsigned int fmt)
-{
-	unsigned long long clock;
-
-	clock = vc4_hdmi_encoder_compute_mode_clock(mode, bpc, fmt);
-	if (vc4_hdmi_encoder_clock_valid(vc4_hdmi, mode, clock) != MODE_OK)
-		return -EINVAL;
-
-	vc4_state->tmds_char_rate = clock;
-
-	return 0;
-}
-
-static int
-vc4_hdmi_encoder_compute_format(const struct vc4_hdmi *vc4_hdmi,
-				struct vc4_hdmi_connector_state *vc4_state,
-				const struct drm_display_mode *mode,
-				unsigned int bpc)
-{
-	struct drm_device *dev = vc4_hdmi->connector.dev;
-	const struct drm_connector *connector = &vc4_hdmi->connector;
-	const struct drm_display_info *info = &connector->display_info;
-	unsigned int format;
-
-	drm_dbg(dev, "Trying with an RGB output\n");
-
-	format = VC4_HDMI_OUTPUT_RGB;
-	if (vc4_hdmi_sink_supports_format_bpc(vc4_hdmi, info, mode, format, bpc)) {
-		int ret;
-
-		ret = vc4_hdmi_encoder_compute_clock(vc4_hdmi, vc4_state,
-						     mode, bpc, format);
-		if (!ret) {
-			vc4_state->output_format = format;
-			return 0;
-		}
-	}
-
-	drm_dbg(dev, "Failed, Trying with an YUV422 output\n");
-
-	format = VC4_HDMI_OUTPUT_YUV422;
-	if (vc4_hdmi_sink_supports_format_bpc(vc4_hdmi, info, mode, format, bpc)) {
-		int ret;
-
-		ret = vc4_hdmi_encoder_compute_clock(vc4_hdmi, vc4_state,
-						     mode, bpc, format);
-		if (!ret) {
-			vc4_state->output_format = format;
-			return 0;
-		}
-	}
-
-	drm_dbg(dev, "Failed. No Format Supported for that bpc count.\n");
-
-	return -EINVAL;
-}
-
-static int
-vc4_hdmi_encoder_compute_config(const struct vc4_hdmi *vc4_hdmi,
-				struct vc4_hdmi_connector_state *vc4_state,
-				const struct drm_display_mode *mode)
-{
-	struct drm_device *dev = vc4_hdmi->connector.dev;
-	struct drm_connector_state *conn_state = &vc4_state->base;
-	unsigned int max_bpc = clamp_t(unsigned int, conn_state->max_bpc, 8, 12);
-	unsigned int bpc;
-	int ret;
-
-	for (bpc = max_bpc; bpc >= 8; bpc -= 2) {
-		drm_dbg(dev, "Trying with a %d bpc output\n", bpc);
-
-		ret = vc4_hdmi_encoder_compute_format(vc4_hdmi, vc4_state,
-						      mode, bpc);
-		if (ret)
-			continue;
-
-		vc4_state->output_bpc = bpc;
-
-		drm_dbg(dev,
-			"Mode %ux%u @ %uHz: Found configuration: bpc: %u, fmt: %s, clock: %llu\n",
-			mode->hdisplay, mode->vdisplay, drm_mode_vrefresh(mode),
-			vc4_state->output_bpc,
-			vc4_hdmi_output_fmt_str(vc4_state->output_format),
-			vc4_state->tmds_char_rate);
-
-		break;
-	}
-
-	return ret;
-}
+static const struct drm_connector_hdmi_funcs vc4_hdmi_hdmi_connector_funcs = {
+	.tmds_char_rate_valid	= vc4_hdmi_connector_clock_valid,
+	.write_infoframe	= vc4_hdmi_write_infoframe,
+};
 
 #define WIFI_2_4GHz_CH1_MIN_FREQ	2400000000ULL
 #define WIFI_2_4GHz_CH1_MAX_FREQ	2422000000ULL
@@ -2163,16 +1684,9 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 					 struct drm_connector_state *conn_state)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	struct drm_connector *connector = &vc4_hdmi->connector;
-	struct drm_connector_state *old_conn_state =
-		drm_atomic_get_old_connector_state(conn_state->state, connector);
-	struct vc4_hdmi_connector_state *old_vc4_state =
-		conn_state_to_vc4_hdmi_conn_state(old_conn_state);
-	struct vc4_hdmi_connector_state *vc4_state = conn_state_to_vc4_hdmi_conn_state(conn_state);
 	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 	unsigned long long tmds_char_rate = mode->clock * 1000;
 	unsigned long long tmds_bit_rate;
-	int ret;
 
 	if (vc4_hdmi->variant->unsupported_odd_h_timings) {
 		if (mode->flags & DRM_MODE_FLAG_DBLCLK) {
@@ -2208,15 +1722,6 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 		tmds_char_rate = mode->clock * 1000;
 	}
 
-	ret = vc4_hdmi_encoder_compute_config(vc4_hdmi, vc4_state, mode);
-	if (ret)
-		return ret;
-
-	/* vc4_hdmi_encoder_compute_config may have changed output_bpc and/or output_format */
-	if (vc4_state->output_bpc != old_vc4_state->output_bpc ||
-	    vc4_state->output_format != old_vc4_state->output_format)
-		crtc_state->mode_changed = true;
-
 	return 0;
 }
 
@@ -2225,6 +1730,7 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
 			    const struct drm_display_mode *mode)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+	unsigned long long rate;
 
 	if (vc4_hdmi->variant->unsupported_odd_h_timings &&
 	    !(mode->flags & DRM_MODE_FLAG_DBLCLK) &&
@@ -2232,7 +1738,8 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
 	     (mode->hsync_end % 2) || (mode->htotal % 2)))
 		return MODE_H_ILLEGAL;
 
-	return vc4_hdmi_encoder_clock_valid(vc4_hdmi, mode, mode->clock * 1000);
+	rate = drm_connector_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
+	return vc4_hdmi_connector_clock_valid(&vc4_hdmi->connector, mode, rate);
 }
 
 static const struct drm_encoder_helper_funcs vc4_hdmi_encoder_helper_funcs = {
@@ -2424,7 +1931,6 @@ static int vc4_hdmi_audio_startup(struct device *dev, void *data)
 
 static void vc4_hdmi_audio_reset(struct vc4_hdmi *vc4_hdmi)
 {
-	struct drm_encoder *encoder = &vc4_hdmi->encoder.base;
 	struct device *dev = &vc4_hdmi->pdev->dev;
 	unsigned long flags;
 	int ret;
@@ -2432,7 +1938,7 @@ static void vc4_hdmi_audio_reset(struct vc4_hdmi *vc4_hdmi)
 	lockdep_assert_held(&vc4_hdmi->mutex);
 
 	vc4_hdmi->audio.streaming = false;
-	ret = vc4_hdmi_stop_packet(encoder, HDMI_INFOFRAME_TYPE_AUDIO, false);
+	ret = vc4_hdmi_stop_packet(vc4_hdmi, HDMI_INFOFRAME_TYPE_AUDIO, false);
 	if (ret)
 		dev_err(dev, "Failed to stop audio infoframe: %d\n", ret);
 
@@ -2523,7 +2029,7 @@ static int vc4_hdmi_audio_prepare(struct device *dev, void *data,
 {
 	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
 	struct drm_device *drm = vc4_hdmi->connector.dev;
-	struct drm_encoder *encoder = &vc4_hdmi->encoder.base;
+	struct drm_connector *connector = &vc4_hdmi->connector;
 	unsigned int sample_rate = params->sample_rate;
 	unsigned int channels = params->channels;
 	unsigned long flags;
@@ -2600,8 +2106,10 @@ static int vc4_hdmi_audio_prepare(struct device *dev, void *data,
 
 	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 
-	memcpy(&vc4_hdmi->audio.infoframe, &params->cea, sizeof(params->cea));
-	vc4_hdmi_set_audio_infoframe(encoder);
+	ret = drm_atomic_helper_connector_hdmi_update_audio_infoframe(connector,
+								      &params->cea);
+	if (ret)
+		goto out_dev_exit;
 
 out_dev_exit:
 	drm_dev_exit(idx);
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 934d5d61485a..b37f1d2c3fe5 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -10,7 +10,6 @@
 
 struct vc4_hdmi;
 struct vc4_hdmi_register;
-struct vc4_hdmi_connector_state;
 
 enum vc4_hdmi_phy_channel {
 	PHY_LANE_0 = 0,
@@ -76,7 +75,7 @@ struct vc4_hdmi_variant {
 
 	/* Callback to initialize the PHY according to the connector state */
 	void (*phy_init)(struct vc4_hdmi *vc4_hdmi,
-			 struct vc4_hdmi_connector_state *vc4_conn_state);
+			 struct drm_connector_state *conn_state);
 
 	/* Callback to disable the PHY */
 	void (*phy_disable)(struct vc4_hdmi *vc4_hdmi);
@@ -110,19 +109,6 @@ struct vc4_hdmi_audio {
 	bool streaming;
 };
 
-enum vc4_hdmi_output_format {
-	VC4_HDMI_OUTPUT_RGB,
-	VC4_HDMI_OUTPUT_YUV422,
-	VC4_HDMI_OUTPUT_YUV444,
-	VC4_HDMI_OUTPUT_YUV420,
-};
-
-enum vc4_hdmi_broadcast_rgb {
-	VC4_HDMI_BROADCAST_RGB_AUTO,
-	VC4_HDMI_BROADCAST_RGB_FULL,
-	VC4_HDMI_BROADCAST_RGB_LIMITED,
-};
-
 /* General HDMI hardware state. */
 struct vc4_hdmi {
 	struct vc4_hdmi_audio audio;
@@ -135,8 +121,6 @@ struct vc4_hdmi {
 
 	struct delayed_work scrambling_work;
 
-	struct drm_property *broadcast_rgb_property;
-
 	struct i2c_adapter *ddc;
 	void __iomem *hdmicore_regs;
 	void __iomem *hd_regs;
@@ -218,16 +202,17 @@ struct vc4_hdmi {
 	bool scdc_enabled;
 
 	/**
-	 * @output_bpc: Copy of @vc4_connector_state.output_bpc for use
-	 * outside of KMS hooks. Protected by @mutex.
+	 * @output_bpc: Copy of @drm_connector_state.hdmi.output_bpc for
+	 * use outside of KMS hooks. Protected by @mutex.
 	 */
 	unsigned int output_bpc;
 
 	/**
-	 * @output_format: Copy of @vc4_connector_state.output_format
-	 * for use outside of KMS hooks. Protected by @mutex.
+	 * @output_format: Copy of
+	 * @drm_connector_state.hdmi.output_format for use outside of
+	 * KMS hooks. Protected by @mutex.
 	 */
-	enum vc4_hdmi_output_format output_format;
+	enum hdmi_colorspace output_format;
 };
 
 #define connector_to_vc4_hdmi(_connector)				\
@@ -240,25 +225,14 @@ encoder_to_vc4_hdmi(struct drm_encoder *encoder)
 	return container_of_const(_encoder, struct vc4_hdmi, encoder);
 }
 
-struct vc4_hdmi_connector_state {
-	struct drm_connector_state	base;
-	unsigned long long		tmds_char_rate;
-	unsigned int 			output_bpc;
-	enum vc4_hdmi_output_format	output_format;
-	enum vc4_hdmi_broadcast_rgb	broadcast_rgb;
-};
-
-#define conn_state_to_vc4_hdmi_conn_state(_state)			\
-	container_of_const(_state, struct vc4_hdmi_connector_state, base)
-
 void vc4_hdmi_phy_init(struct vc4_hdmi *vc4_hdmi,
-		       struct vc4_hdmi_connector_state *vc4_conn_state);
+		       struct drm_connector_state *conn_state);
 void vc4_hdmi_phy_disable(struct vc4_hdmi *vc4_hdmi);
 void vc4_hdmi_phy_rng_enable(struct vc4_hdmi *vc4_hdmi);
 void vc4_hdmi_phy_rng_disable(struct vc4_hdmi *vc4_hdmi);
 
 void vc5_hdmi_phy_init(struct vc4_hdmi *vc4_hdmi,
-		       struct vc4_hdmi_connector_state *vc4_conn_state);
+		       struct drm_connector_state *conn_state);
 void vc5_hdmi_phy_disable(struct vc4_hdmi *vc4_hdmi);
 void vc5_hdmi_phy_rng_enable(struct vc4_hdmi *vc4_hdmi);
 void vc5_hdmi_phy_rng_disable(struct vc4_hdmi *vc4_hdmi);
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi_phy.c b/drivers/gpu/drm/vc4/vc4_hdmi_phy.c
index ec24999bf96d..1f5507fc7a03 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi_phy.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi_phy.c
@@ -128,7 +128,7 @@
 #define OSCILLATOR_FREQUENCY	54000000
 
 void vc4_hdmi_phy_init(struct vc4_hdmi *vc4_hdmi,
-		       struct vc4_hdmi_connector_state *conn_state)
+		       struct drm_connector_state *conn_state)
 {
 	unsigned long flags;
 
@@ -361,11 +361,11 @@ static void vc5_hdmi_reset_phy(struct vc4_hdmi *vc4_hdmi)
 }
 
 void vc5_hdmi_phy_init(struct vc4_hdmi *vc4_hdmi,
-		       struct vc4_hdmi_connector_state *conn_state)
+		       struct drm_connector_state *conn_state)
 {
 	const struct phy_lane_settings *chan0_settings, *chan1_settings, *chan2_settings, *clock_settings;
 	const struct vc4_hdmi_variant *variant = vc4_hdmi->variant;
-	unsigned long long pixel_freq = conn_state->tmds_char_rate;
+	unsigned long long pixel_freq = conn_state->hdmi.tmds_char_rate;
 	unsigned long long vco_freq;
 	unsigned char word_sel;
 	unsigned long flags;

-- 
2.41.0


