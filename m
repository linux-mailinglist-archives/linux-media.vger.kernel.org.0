Return-Path: <linux-media+bounces-6846-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D87878276
	for <lists+linux-media@lfdr.de>; Mon, 11 Mar 2024 15:57:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 72695B2124F
	for <lists+linux-media@lfdr.de>; Mon, 11 Mar 2024 14:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6513758ACE;
	Mon, 11 Mar 2024 14:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qu9svqPN"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B655158AC0;
	Mon, 11 Mar 2024 14:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710168666; cv=none; b=FrztM4WYC/E7QOjkyOGrIM8DR5l8tMRX0xgbItpGjNORE09WPWocIydORxxCU8m/uHItryh1j/nBCXUQL7KawXWVMdK0ZhI8hYdMkrGtcWgoGiltDpb202jxn6Hnj+fPZtvahB1ofTeYLBqrJ8ttgbuNYdEdGmV2mX+kIfD07Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710168666; c=relaxed/simple;
	bh=v3yx9ONGkMObmgCTmfOc6SwbMwyae5YqWJXvVoOZ0Xc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JfAWgCjrkqveMqzU4/mbciIulvaF58gAh7bJnx9XVAsGCBjV/+RxXCMYqo9lIvcUyccCb+vExe+7/7Pc+6fV2fiweEO/UiEoSU7+KBMOiWqFRvw1E4U9P2Poh18S8NWAbf9aBZATfLYOXV1jgDyBdAbjrrdOQeNE3a0y4H7bdLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qu9svqPN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B33DC433B1;
	Mon, 11 Mar 2024 14:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710168666;
	bh=v3yx9ONGkMObmgCTmfOc6SwbMwyae5YqWJXvVoOZ0Xc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qu9svqPNZGDydtqGObbpbm2rCgJmvay/NDs33yO8j/r8H/Q6y7E8VSL/GaQlF5xIi
	 gVz1mGlyaoK2PcveLeDqsh9ASc+cwjIhnu8zVRY9fd9eno+diSPkuy6EtNB8Io9z0s
	 /t9knVLRjrbKJQCA3blMaswshxewZf9uBtuUXVydL/RTuWpo79ELiVl4xJNMb7/irJ
	 yrx8zfuxsUKoURBBz5y6prFNxf+DmnVrWQOe3BzJOmrU1liriKFaXpiBQSoZKSQLQ0
	 NmHceSZkykHJCRj4jAaWaPs2D3Z7lLq1lDJC/sFzPmVS0tWY1J11sGL5W/1AwpvKuY
	 izNsglEzCZY9w==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 11 Mar 2024 15:49:51 +0100
Subject: [PATCH v9 23/27] drm/vc4: hdmi: Switch to HDMI connector
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240311-kms-hdmi-connector-state-v9-23-d45890323344@kernel.org>
References: <20240311-kms-hdmi-connector-state-v9-0-d45890323344@kernel.org>
In-Reply-To: <20240311-kms-hdmi-connector-state-v9-0-d45890323344@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, 
 Sebastian Wick <sebastian.wick@redhat.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=41761; i=mripard@kernel.org;
 h=from:subject:message-id; bh=v3yx9ONGkMObmgCTmfOc6SwbMwyae5YqWJXvVoOZ0Xc=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKnvpYRXntw1dVvdTafgLP6Qp3uqwwreXGN21Czp3HVEW
 3p77wmJjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEzk7mqGPzwPD7XwXLzks7gu
 2/C/hd2XXJ5HUy923hXPYlH+OOvK09mMDE0SfU8ljf51ljJP+t/NHnKv/FBCS1TcjIqe281Vh8T
 ecQAA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The new HDMI connector infrastructure allows us to remove a lot of
boilerplate, so let's switch to it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c     | 638 +++++--------------------------------
 drivers/gpu/drm/vc4/vc4_hdmi.h     |  44 +--
 drivers/gpu/drm/vc4/vc4_hdmi_phy.c |   6 +-
 3 files changed, 86 insertions(+), 602 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 34f807ed1c31..1f489cbe0c90 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -108,29 +108,10 @@
 #define HSM_MIN_CLOCK_FREQ	120000000
 #define CEC_CLOCK_FREQ 40000
 
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
 
 	lockdep_assert_held(&vc4_hdmi->mutex);
@@ -145,32 +126,17 @@ static bool vc4_hdmi_supports_scrambling(struct vc4_hdmi *vc4_hdmi)
 	return true;
 }
 
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
 	struct vc4_hdmi *vc4_hdmi = entry->file.data;
 	struct drm_device *drm = vc4_hdmi->connector.dev;
@@ -518,11 +484,11 @@ static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 	if (!vc4->hvs->vc5_hdmi_enable_hdmi_20) {
 		struct drm_device *drm = connector->dev;
 		const struct drm_display_mode *mode;
 
 		list_for_each_entry(mode, &connector->probed_modes, head) {
-			if (vc4_hdmi_mode_needs_scrambling(mode, 8, VC4_HDMI_OUTPUT_RGB)) {
+			if (vc4_hdmi_mode_needs_scrambling(mode, 8, HDMI_COLORSPACE_RGB)) {
 				drm_warn_once(drm, "The core clock cannot reach frequencies high enough to support 4k @ 60Hz.");
 				drm_warn_once(drm, "Please change your config.txt file to add hdmi_enable_4kp60.");
 			}
 		}
 	}
@@ -533,16 +499,12 @@ static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 static int vc4_hdmi_connector_atomic_check(struct drm_connector *connector,
 					   struct drm_atomic_state *state)
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
 		return 0;
 
@@ -570,174 +532,62 @@ static int vc4_hdmi_connector_atomic_check(struct drm_connector *connector,
 		ret = drm_atomic_add_affected_planes(state, crtc);
 		if (ret)
 			return ret;
 	}
 
-	if (old_state->colorspace != new_state->colorspace ||
-	    old_vc4_state->broadcast_rgb != new_vc4_state->broadcast_rgb ||
-	    !drm_connector_atomic_hdr_metadata_equal(old_state, new_state)) {
+	if (old_state->colorspace != new_state->colorspace) {
 		struct drm_crtc_state *crtc_state;
 
 		crtc_state = drm_atomic_get_crtc_state(state, crtc);
 		if (IS_ERR(crtc_state))
 			return PTR_ERR(crtc_state);
 
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
 	.detect_ctx = vc4_hdmi_connector_detect_ctx,
 	.get_modes = vc4_hdmi_connector_get_modes,
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
 {
 	struct drm_connector *connector = &vc4_hdmi->connector;
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
 
 	drm_connector_helper_add(connector, &vc4_hdmi_connector_helper_funcs);
 
@@ -757,34 +607,31 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
 	if (ret)
 		return ret;
 
 	drm_connector_attach_colorspace_property(connector);
 	drm_connector_attach_tv_margin_properties(connector);
-	drm_connector_attach_max_bpc_property(connector, 8, 12);
 
 	connector->polled = (DRM_CONNECTOR_POLL_CONNECT |
 			     DRM_CONNECTOR_POLL_DISCONNECT);
 
 	connector->interlace_allowed = 1;
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
 	int ret = 0;
 	int idx;
@@ -804,41 +651,45 @@ static int vc4_hdmi_stop_packet(struct drm_encoder *encoder,
 
 	drm_dev_exit(idx);
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
 	u32 packet_reg_next = ram_packet_start->offset +
 		VC4_HDMI_PACKET_STRIDE * (packet_id + 1);
 	void __iomem *base = __vc4_hdmi_get_field_base(vc4_hdmi,
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
+	if (len > sizeof(buffer)) {
+		ret = -ENOMEM;
+		goto out;
+	}
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
 	}
 
@@ -876,134 +727,11 @@ static void vc4_hdmi_write_infoframe(struct drm_encoder *encoder,
 	if (ret)
 		DRM_ERROR("Failed to wait for infoframe to start: %d\n", ret);
 
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
 
 static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
@@ -1168,13 +896,12 @@ static void vc4_hdmi_encoder_post_crtc_powerdown(struct drm_encoder *encoder,
 
 static void vc4_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
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
 
 	if (!drm_dev_enter(drm, &idx))
@@ -1183,11 +910,11 @@ static void vc4_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 
 	csc_ctl = VC4_SET_FIELD(VC4_HD_CSC_CTL_ORDER_BGR,
 				VC4_HD_CSC_CTL_ORDER);
 
-	if (!vc4_hdmi_is_full_range(vc4_hdmi, vc4_state)) {
+	if (is_lim_range) {
 		/* CEA VICs other than #1 requre limited range RGB
 		 * output unless overridden by an AVI infoframe.
 		 * Apply a colorspace conversion to squash 0-255 down
 		 * to 16-235.  The matrix here is:
 		 *
@@ -1406,13 +1133,11 @@ static const u16
 static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 			       struct drm_connector_state *state,
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
 	u32 if_xbar = 0x543210;
 	u32 csc_chan_ctl = 0;
@@ -1423,18 +1148,18 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 	if (!drm_dev_enter(drm, &idx))
 		return;
 
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
 					 VC5_MT_CP_CSC_CTL_FILTER_MODE_444_TO_422) |
 			VC5_MT_CP_CSC_CTL_USE_444_TO_422 |
@@ -1447,11 +1172,11 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 					VC5_DVP_HT_VEC_INTERFACE_CFG_SEL_422);
 
 		vc5_hdmi_set_csc_coeffs(vc4_hdmi, csc);
 		break;
 
-	case VC4_HDMI_OUTPUT_RGB:
+	case HDMI_COLORSPACE_RGB:
 		if_xbar = 0x354021;
 
 		vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_to_rgb[lim_range]);
 		break;
 
@@ -1536,12 +1261,10 @@ static void vc4_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 				 struct drm_connector_state *state,
 				 const struct drm_display_mode *mode)
 {
 	struct drm_device *drm = vc4_hdmi->connector.dev;
-	const struct vc4_hdmi_connector_state *vc4_state =
-		conn_state_to_vc4_hdmi_conn_state(state);
 	bool hsync_pos = mode->flags & DRM_MODE_FLAG_PHSYNC;
 	bool vsync_pos = mode->flags & DRM_MODE_FLAG_PVSYNC;
 	bool interlaced = mode->flags & DRM_MODE_FLAG_INTERLACE;
 	u32 pixel_rep = (mode->flags & DRM_MODE_FLAG_DBLCLK) ? 2 : 1;
 	u32 verta = (VC4_SET_FIELD(mode->crtc_vsync_end - mode->crtc_vsync_start,
@@ -1589,11 +1312,11 @@ static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 	HDMI_WRITE(HDMI_VERTA1, verta);
 
 	HDMI_WRITE(HDMI_VERTB0, vertb_even);
 	HDMI_WRITE(HDMI_VERTB1, vertb);
 
-	switch (vc4_state->output_bpc) {
+	switch (state->hdmi.output_bpc) {
 	case 12:
 		gcp = 6;
 		break;
 	case 10:
 		gcp = 5;
@@ -1606,11 +1329,11 @@ static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 
 	/*
 	 * YCC422 is always 36-bit and not considered deep colour so
 	 * doesn't signal in GCP.
 	 */
-	if (vc4_state->output_format == VC4_HDMI_OUTPUT_YUV422) {
+	if (state->hdmi.output_format == HDMI_COLORSPACE_YUV422) {
 		gcp = 0;
 	}
 
 	reg = HDMI_READ(HDMI_DEEP_COLOR_CONFIG_1);
 	reg &= ~(VC5_HDMI_DEEP_COLOR_CONFIG_1_INIT_PACK_PHASE_MASK |
@@ -1690,14 +1413,12 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	struct drm_device *drm = vc4_hdmi->connector.dev;
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
 	int idx;
 
@@ -1770,11 +1491,11 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 		DRM_ERROR("Failed to turn on pixel bvb clock: %d\n", ret);
 		goto err_disable_pixel_clock;
 	}
 
 	if (vc4_hdmi->variant->phy_init)
-		vc4_hdmi->variant->phy_init(vc4_hdmi, vc4_conn_state);
+		vc4_hdmi->variant->phy_init(vc4_hdmi, conn_state);
 
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 
 	HDMI_WRITE(HDMI_SCHEDULER_CONTROL,
 		   HDMI_READ(HDMI_SCHEDULER_CONTROL) |
@@ -1835,11 +1556,12 @@ static void vc4_hdmi_encoder_pre_crtc_enable(struct drm_encoder *encoder,
 
 static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
 					      struct drm_atomic_state *state)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	struct drm_device *drm = vc4_hdmi->connector.dev;
+	struct drm_connector *connector = &vc4_hdmi->connector;
+	struct drm_device *drm = connector->dev;
 	const struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
 	struct drm_display_info *display = &vc4_hdmi->connector.display_info;
 	bool hsync_pos = mode->flags & DRM_MODE_FLAG_PHSYNC;
 	bool vsync_pos = mode->flags & DRM_MODE_FLAG_PVSYNC;
 	unsigned long flags;
@@ -1901,11 +1623,11 @@ static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
 			   VC4_HDMI_RAM_PACKET_ENABLE);
 
 		spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 		vc4_hdmi->packet_ram_enabled = true;
 
-		vc4_hdmi_set_infoframes(encoder);
+		drm_atomic_helper_connector_hdmi_update_infoframes(connector, state);
 	}
 
 	vc4_hdmi_recenter_fifo(vc4_hdmi);
 	vc4_hdmi_enable_scrambling(encoder);
 
@@ -1918,112 +1640,25 @@ static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
 static void vc4_hdmi_encoder_atomic_mode_set(struct drm_encoder *encoder,
 					     struct drm_crtc_state *crtc_state,
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
 		return MODE_CLOCK_HIGH;
 
@@ -2034,148 +1669,29 @@ vc4_hdmi_encoder_clock_valid(const struct vc4_hdmi *vc4_hdmi,
 	if (!vc4->hvs->vc5_hdmi_enable_4096by2160 &&
 	    mode->hdisplay > 3840 && mode->vdisplay >= 2160 &&
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
 
 static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 					 struct drm_crtc_state *crtc_state,
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
 			/* Only try to fixup DBLCLK modes to get 480i and 576i
 			 * working.
@@ -2207,35 +1723,28 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 	     tmds_bit_rate <= WIFI_2_4GHz_CH1_MAX_FREQ)) {
 		mode->clock = 238560;
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
 
 static enum drm_mode_status
 vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
 			    const struct drm_display_mode *mode)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+	unsigned long long rate;
 
 	if (vc4_hdmi->variant->unsupported_odd_h_timings &&
 	    !(mode->flags & DRM_MODE_FLAG_DBLCLK) &&
 	    ((mode->hdisplay % 2) || (mode->hsync_start % 2) ||
 	     (mode->hsync_end % 2) || (mode->htotal % 2)))
 		return MODE_H_ILLEGAL;
 
-	return vc4_hdmi_encoder_clock_valid(vc4_hdmi, mode, mode->clock * 1000);
+	rate = drm_connector_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
+	return vc4_hdmi_connector_clock_valid(&vc4_hdmi->connector, mode, rate);
 }
 
 static const struct drm_encoder_helper_funcs vc4_hdmi_encoder_helper_funcs = {
 	.atomic_check = vc4_hdmi_encoder_atomic_check,
 	.atomic_mode_set = vc4_hdmi_encoder_atomic_mode_set,
@@ -2423,19 +1932,18 @@ static int vc4_hdmi_audio_startup(struct device *dev, void *data)
 	return ret;
 }
 
 static void vc4_hdmi_audio_reset(struct vc4_hdmi *vc4_hdmi)
 {
-	struct drm_encoder *encoder = &vc4_hdmi->encoder.base;
 	struct device *dev = &vc4_hdmi->pdev->dev;
 	unsigned long flags;
 	int ret;
 
 	lockdep_assert_held(&vc4_hdmi->mutex);
 
 	vc4_hdmi->audio.streaming = false;
-	ret = vc4_hdmi_stop_packet(encoder, HDMI_INFOFRAME_TYPE_AUDIO, false);
+	ret = vc4_hdmi_stop_packet(vc4_hdmi, HDMI_INFOFRAME_TYPE_AUDIO, false);
 	if (ret)
 		dev_err(dev, "Failed to stop audio infoframe: %d\n", ret);
 
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 
@@ -2522,11 +2030,11 @@ static int vc4_hdmi_audio_prepare(struct device *dev, void *data,
 				  struct hdmi_codec_daifmt *daifmt,
 				  struct hdmi_codec_params *params)
 {
 	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
 	struct drm_device *drm = vc4_hdmi->connector.dev;
-	struct drm_encoder *encoder = &vc4_hdmi->encoder.base;
+	struct drm_connector *connector = &vc4_hdmi->connector;
 	unsigned int sample_rate = params->sample_rate;
 	unsigned int channels = params->channels;
 	unsigned long flags;
 	u32 audio_packet_config, channel_mask;
 	u32 channel_map;
@@ -2599,12 +2107,14 @@ static int vc4_hdmi_audio_prepare(struct device *dev, void *data,
 
 	vc4_hdmi_set_n_cts(vc4_hdmi, sample_rate);
 
 	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 
-	memcpy(&vc4_hdmi->audio.infoframe, &params->cea, sizeof(params->cea));
-	vc4_hdmi_set_audio_infoframe(encoder);
+	ret = drm_atomic_helper_connector_hdmi_update_audio_infoframe(connector,
+								      &params->cea);
+	if (ret)
+		goto out_dev_exit;
 
 out_dev_exit:
 	drm_dev_exit(idx);
 out:
 	mutex_unlock(&vc4_hdmi->mutex);
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 934d5d61485a..b37f1d2c3fe5 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -8,11 +8,10 @@
 
 #include "vc4_drv.h"
 
 struct vc4_hdmi;
 struct vc4_hdmi_register;
-struct vc4_hdmi_connector_state;
 
 enum vc4_hdmi_phy_channel {
 	PHY_LANE_0 = 0,
 	PHY_LANE_1,
 	PHY_LANE_2,
@@ -74,11 +73,11 @@ struct vc4_hdmi_variant {
 			    struct drm_connector_state *state,
 			    const struct drm_display_mode *mode);
 
 	/* Callback to initialize the PHY according to the connector state */
 	void (*phy_init)(struct vc4_hdmi *vc4_hdmi,
-			 struct vc4_hdmi_connector_state *vc4_conn_state);
+			 struct drm_connector_state *conn_state);
 
 	/* Callback to disable the PHY */
 	void (*phy_disable)(struct vc4_hdmi *vc4_hdmi);
 
 	/* Callback to enable the RNG in the PHY */
@@ -108,23 +107,10 @@ struct vc4_hdmi_audio {
 	struct hdmi_audio_infoframe infoframe;
 	struct platform_device *codec_pdev;
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
 
 	struct platform_device *pdev;
@@ -133,12 +119,10 @@ struct vc4_hdmi {
 	struct vc4_encoder encoder;
 	struct drm_connector connector;
 
 	struct delayed_work scrambling_work;
 
-	struct drm_property *broadcast_rgb_property;
-
 	struct i2c_adapter *ddc;
 	void __iomem *hdmicore_regs;
 	void __iomem *hd_regs;
 
 	/* VC5 Only */
@@ -216,20 +200,21 @@ struct vc4_hdmi {
 	 * the scrambler on? Protected by @mutex.
 	 */
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
 	container_of_const(_connector, struct vc4_hdmi, connector)
 
@@ -238,29 +223,18 @@ encoder_to_vc4_hdmi(struct drm_encoder *encoder)
 {
 	struct vc4_encoder *_encoder = to_vc4_encoder(encoder);
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
 
 #endif /* _VC4_HDMI_H_ */
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi_phy.c b/drivers/gpu/drm/vc4/vc4_hdmi_phy.c
index ec24999bf96d..1f5507fc7a03 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi_phy.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi_phy.c
@@ -126,11 +126,11 @@
 #define VC4_HDMI_RM_FORMAT_SHIFT_MASK			VC4_MASK(25, 24)
 
 #define OSCILLATOR_FREQUENCY	54000000
 
 void vc4_hdmi_phy_init(struct vc4_hdmi *vc4_hdmi,
-		       struct vc4_hdmi_connector_state *conn_state)
+		       struct drm_connector_state *conn_state)
 {
 	unsigned long flags;
 
 	/* PHY should be in reset, like
 	 * vc4_hdmi_encoder_disable() does.
@@ -359,15 +359,15 @@ static void vc5_hdmi_reset_phy(struct vc4_hdmi *vc4_hdmi)
 	HDMI_WRITE(HDMI_TX_PHY_RESET_CTL, 0x0f);
 	HDMI_WRITE(HDMI_TX_PHY_POWERDOWN_CTL, BIT(10));
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
 	u8 vco_sel, vco_div;
 

-- 
2.43.2


