Return-Path: <linux-media+bounces-11691-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BE78CABF7
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2024 12:20:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D680B22EBD
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2024 10:20:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DA0681AA7;
	Tue, 21 May 2024 10:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iNBBrX9v"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07BE8174E;
	Tue, 21 May 2024 10:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716286491; cv=none; b=eth/iV3+fXWo6Gs/bLNZbvY6nsj5Q8zciyGOYc5R0JMU/94KgtXmLvx5trFofbHn4BulTgmwDyQcvw+KUt2aHP1n0MD/OfgQyo1FeZ6ij03nysV1XbcxnMSc+xE/hdq+RJUZ+vPqoLYve73Y3l4b49dlg7Ho21WonOTwXDVOoB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716286491; c=relaxed/simple;
	bh=mumCGd8w8IlYWAhWaUTqhdzdsGfdXBacTdNb8/d2fss=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FpCxPASkFDtvl4KEzFXjElTTZ12kRuWmy4fGx7yTlSphsxwO6bhwbObWZp2Px7lLBByydVb9gIY5xdyHes9xrW8FylHAiwIpUfFDj+hYuqEROOze9yOmyeOj4uLQE3WkYixmCU0RkLyI1cN1ZiIxPh9hIvKV5y+QvgO+uPOUzmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iNBBrX9v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43043C4AF07;
	Tue, 21 May 2024 10:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716286490;
	bh=mumCGd8w8IlYWAhWaUTqhdzdsGfdXBacTdNb8/d2fss=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iNBBrX9v+6gAePUyNXL06qQpKpXGFICI5ZB6DveMcKcF1+2syeslsnx45E26ZCi80
	 dUc/OhbPmbjwLXQqkjtXoMvWfohTwvs5fH6AUUI0cmp8y3bxhtUmGJvhU+qOKofzxQ
	 JaJW4AwwQeC5Pff6m5dNt9SpU/Mtp2F8V8U7PFj9XxlfcpeC8Ca5il7tWOzdymn101
	 Xm58109wgW0/N2aBs0O5ewemSrRffcmHFeuvXKWAexBAT0/D42/UKW3XORVSlbAE+s
	 4HQgI6OopdGvOK+q9hVyC/wbhiAubfbH7mxNa+OmMnlwWQuF2SMzZl4zN9AmB90StD
	 hvXvAuaP02N3Q==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 21 May 2024 12:13:54 +0200
Subject: [PATCH v14 21/28] drm/connector: hdmi: Add Infoframes generation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240521-kms-hdmi-connector-state-v14-21-51950db4fedb@kernel.org>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Andy Yan <andy.yan@rock-chips.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, 
 Sebastian Wick <sebastian.wick@redhat.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=26962; i=mripard@kernel.org;
 h=from:subject:message-id; bh=mumCGd8w8IlYWAhWaUTqhdzdsGfdXBacTdNb8/d2fss=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGk+xTeXs/14v9aBLcIhUnN5fc3SUw9UorYui1mjciPsR
 6mVesaMjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCRDRaM9Q5TeVS32PFdWfl3
 lrWT+La1V4N6rlw5cOLAYoF+tUKGgBkxJ6bkHP11885VHeFpbemsexirWd/7ZPQFLNCbXx1sN2P
 yND275JVai31LcsMFGuc8VMi+YfO540go916JMs79b/6cV8gGAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Infoframes in KMS is usually handled by a bunch of low-level helpers
that require quite some boilerplate for drivers. This leads to
discrepancies with how drivers generate them, and which are actually
sent.

Now that we have everything needed to generate them in the HDMI
connector state, we can generate them in our common logic so that
drivers can simply reuse what we precomputed.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    | 336 +++++++++++++++++++++
 drivers/gpu/drm/drm_connector.c                    |  14 +
 drivers/gpu/drm/tests/drm_connector_test.c         |  12 +
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |   1 +
 include/drm/display/drm_hdmi_state_helper.h        |   7 +
 include/drm/drm_connector.h                        | 111 ++++++-
 6 files changed, 480 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 6d30c47fca65..f6e68b7447fa 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -319,10 +319,148 @@ hdmi_compute_config(const struct drm_connector *connector,
 	}
 
 	return -EINVAL;
 }
 
+static int hdmi_generate_avi_infoframe(const struct drm_connector *connector,
+				       struct drm_connector_state *conn_state)
+{
+	const struct drm_display_mode *mode =
+		connector_state_get_mode(conn_state);
+	struct drm_connector_hdmi_infoframe *infoframe =
+		&conn_state->hdmi.infoframes.avi;
+	struct hdmi_avi_infoframe *frame =
+		&infoframe->data.avi;
+	bool is_limited_range = conn_state->hdmi.is_limited_range;
+	enum hdmi_quantization_range rgb_quant_range =
+		is_limited_range ? HDMI_QUANTIZATION_RANGE_LIMITED : HDMI_QUANTIZATION_RANGE_FULL;
+	int ret;
+
+	ret = drm_hdmi_avi_infoframe_from_display_mode(frame, connector, mode);
+	if (ret)
+		return ret;
+
+	frame->colorspace = conn_state->hdmi.output_format;
+
+	/*
+	 * FIXME: drm_hdmi_avi_infoframe_quant_range() doesn't handle
+	 * YUV formats at all at the moment, so if we ever support YUV
+	 * formats this needs to be revised.
+	 */
+	drm_hdmi_avi_infoframe_quant_range(frame, connector, mode, rgb_quant_range);
+	drm_hdmi_avi_infoframe_colorimetry(frame, conn_state);
+	drm_hdmi_avi_infoframe_bars(frame, conn_state);
+
+	infoframe->set = true;
+
+	return 0;
+}
+
+static int hdmi_generate_spd_infoframe(const struct drm_connector *connector,
+				       struct drm_connector_state *conn_state)
+{
+	struct drm_connector_hdmi_infoframe *infoframe =
+		&conn_state->hdmi.infoframes.spd;
+	struct hdmi_spd_infoframe *frame =
+		&infoframe->data.spd;
+	int ret;
+
+	ret = hdmi_spd_infoframe_init(frame,
+				      connector->hdmi.vendor,
+				      connector->hdmi.product);
+	if (ret)
+		return ret;
+
+	frame->sdi = HDMI_SPD_SDI_PC;
+
+	infoframe->set = true;
+
+	return 0;
+}
+
+static int hdmi_generate_hdr_infoframe(const struct drm_connector *connector,
+				       struct drm_connector_state *conn_state)
+{
+	struct drm_connector_hdmi_infoframe *infoframe =
+		&conn_state->hdmi.infoframes.hdr_drm;
+	struct hdmi_drm_infoframe *frame =
+		&infoframe->data.drm;
+	int ret;
+
+	if (connector->max_bpc < 10)
+		return 0;
+
+	if (!conn_state->hdr_output_metadata)
+		return 0;
+
+	ret = drm_hdmi_infoframe_set_hdr_metadata(frame, conn_state);
+	if (ret)
+		return ret;
+
+	infoframe->set = true;
+
+	return 0;
+}
+
+static int hdmi_generate_hdmi_vendor_infoframe(const struct drm_connector *connector,
+					       struct drm_connector_state *conn_state)
+{
+	const struct drm_display_info *info = &connector->display_info;
+	const struct drm_display_mode *mode =
+		connector_state_get_mode(conn_state);
+	struct drm_connector_hdmi_infoframe *infoframe =
+		&conn_state->hdmi.infoframes.hdmi;
+	struct hdmi_vendor_infoframe *frame =
+		&infoframe->data.vendor.hdmi;
+	int ret;
+
+	if (!info->has_hdmi_infoframe)
+		return 0;
+
+	ret = drm_hdmi_vendor_infoframe_from_display_mode(frame, connector, mode);
+	if (ret)
+		return ret;
+
+	infoframe->set = true;
+
+	return 0;
+}
+
+static int
+hdmi_generate_infoframes(const struct drm_connector *connector,
+			 struct drm_connector_state *conn_state)
+{
+	const struct drm_display_info *info = &connector->display_info;
+	int ret;
+
+	if (!info->is_hdmi)
+		return 0;
+
+	ret = hdmi_generate_avi_infoframe(connector, conn_state);
+	if (ret)
+		return ret;
+
+	ret = hdmi_generate_spd_infoframe(connector, conn_state);
+	if (ret)
+		return ret;
+
+	/*
+	 * Audio Infoframes will be generated by ALSA, and updated by
+	 * drm_atomic_helper_connector_hdmi_update_audio_infoframe().
+	 */
+
+	ret = hdmi_generate_hdr_infoframe(connector, conn_state);
+	if (ret)
+		return ret;
+
+	ret = hdmi_generate_hdmi_vendor_infoframe(connector, conn_state);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 /**
  * drm_atomic_helper_connector_hdmi_check() - Helper to check HDMI connector atomic state
  * @connector: DRM Connector
  * @state: the DRM State object
  *
@@ -348,10 +486,14 @@ int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
 
 	ret = hdmi_compute_config(connector, new_conn_state, mode);
 	if (ret)
 		return ret;
 
+	ret = hdmi_generate_infoframes(connector, new_conn_state);
+	if (ret)
+		return ret;
+
 	if (old_conn_state->hdmi.broadcast_rgb != new_conn_state->hdmi.broadcast_rgb ||
 	    old_conn_state->hdmi.output_bpc != new_conn_state->hdmi.output_bpc ||
 	    old_conn_state->hdmi.output_format != new_conn_state->hdmi.output_format) {
 		struct drm_crtc *crtc = new_conn_state->crtc;
 		struct drm_crtc_state *crtc_state;
@@ -364,5 +506,199 @@ int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
 	}
 
 	return 0;
 }
 EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_check);
+
+#define HDMI_MAX_INFOFRAME_SIZE		29
+
+static int clear_device_infoframe(struct drm_connector *connector,
+				  enum hdmi_infoframe_type type)
+{
+	const struct drm_connector_hdmi_funcs *funcs = connector->hdmi.funcs;
+	struct drm_device *dev = connector->dev;
+	int ret;
+
+	drm_dbg_kms(dev, "Clearing infoframe type 0x%x\n", type);
+
+	if (!funcs || !funcs->clear_infoframe) {
+		drm_dbg_kms(dev, "Function not implemented, bailing.\n");
+		return 0;
+	}
+
+	ret = funcs->clear_infoframe(connector, type);
+	if (ret) {
+		drm_dbg_kms(dev, "Call failed: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int clear_infoframe(struct drm_connector *connector,
+			   struct drm_connector_hdmi_infoframe *old_frame)
+{
+	int ret;
+
+	ret = clear_device_infoframe(connector, old_frame->data.any.type);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int write_device_infoframe(struct drm_connector *connector,
+				  union hdmi_infoframe *frame)
+{
+	const struct drm_connector_hdmi_funcs *funcs = connector->hdmi.funcs;
+	struct drm_device *dev = connector->dev;
+	u8 buffer[HDMI_MAX_INFOFRAME_SIZE];
+	int ret;
+	int len;
+
+	drm_dbg_kms(dev, "Writing infoframe type %x\n", frame->any.type);
+
+	if (!funcs || !funcs->write_infoframe) {
+		drm_dbg_kms(dev, "Function not implemented, bailing.\n");
+		return -ENOSYS;
+	}
+
+	len = hdmi_infoframe_pack(frame, buffer, sizeof(buffer));
+	if (len < 0)
+		return len;
+
+	ret = funcs->write_infoframe(connector, frame->any.type, buffer, len);
+	if (ret) {
+		drm_dbg_kms(dev, "Call failed: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int write_infoframe(struct drm_connector *connector,
+			   struct drm_connector_hdmi_infoframe *new_frame)
+{
+	int ret;
+
+	ret = write_device_infoframe(connector, &new_frame->data);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int write_or_clear_infoframe(struct drm_connector *connector,
+				    struct drm_connector_hdmi_infoframe *old_frame,
+				    struct drm_connector_hdmi_infoframe *new_frame)
+{
+	if (new_frame->set)
+		return write_infoframe(connector, new_frame);
+
+	if (old_frame->set && !new_frame->set)
+		return clear_infoframe(connector, old_frame);
+
+	return 0;
+}
+
+/**
+ * drm_atomic_helper_connector_hdmi_update_infoframes - Update the Infoframes
+ * @connector: A pointer to the HDMI connector
+ * @state: The HDMI connector state to generate the infoframe from
+ *
+ * This function is meant for HDMI connector drivers to write their
+ * infoframes. It will typically be used in a
+ * @drm_connector_helper_funcs.atomic_enable implementation.
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int drm_atomic_helper_connector_hdmi_update_infoframes(struct drm_connector *connector,
+						       struct drm_atomic_state *state)
+{
+	struct drm_connector_state *old_conn_state =
+		drm_atomic_get_old_connector_state(state, connector);
+	struct drm_connector_state *new_conn_state =
+		drm_atomic_get_new_connector_state(state, connector);
+	struct drm_display_info *info = &connector->display_info;
+	int ret;
+
+	if (!info->is_hdmi)
+		return 0;
+
+	mutex_lock(&connector->hdmi.infoframes.lock);
+
+	ret = write_or_clear_infoframe(connector,
+				       &old_conn_state->hdmi.infoframes.avi,
+				       &new_conn_state->hdmi.infoframes.avi);
+	if (ret)
+		goto out;
+
+	if (connector->hdmi.infoframes.audio.set) {
+		ret = write_infoframe(connector,
+				      &connector->hdmi.infoframes.audio);
+		if (ret)
+			goto out;
+	}
+
+	ret = write_or_clear_infoframe(connector,
+				       &old_conn_state->hdmi.infoframes.hdr_drm,
+				       &new_conn_state->hdmi.infoframes.hdr_drm);
+	if (ret)
+		goto out;
+
+	ret = write_or_clear_infoframe(connector,
+				       &old_conn_state->hdmi.infoframes.spd,
+				       &new_conn_state->hdmi.infoframes.spd);
+	if (ret)
+		goto out;
+
+	if (info->has_hdmi_infoframe) {
+		ret = write_or_clear_infoframe(connector,
+					       &old_conn_state->hdmi.infoframes.hdmi,
+					       &new_conn_state->hdmi.infoframes.hdmi);
+		if (ret)
+			goto out;
+	}
+
+out:
+	mutex_unlock(&connector->hdmi.infoframes.lock);
+	return ret;
+}
+EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_update_infoframes);
+
+/**
+ * drm_atomic_helper_connector_hdmi_update_audio_infoframe - Update the Audio Infoframe
+ * @connector: A pointer to the HDMI connector
+ * @frame: A pointer to the audio infoframe to write
+ *
+ * This function is meant for HDMI connector drivers to update their
+ * audio infoframe. It will typically be used in one of the ALSA hooks
+ * (most likely prepare).
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int
+drm_atomic_helper_connector_hdmi_update_audio_infoframe(struct drm_connector *connector,
+							struct hdmi_audio_infoframe *frame)
+{
+	struct drm_connector_hdmi_infoframe *infoframe =
+		&connector->hdmi.infoframes.audio;
+	struct drm_display_info *info = &connector->display_info;
+	int ret;
+
+	if (!info->is_hdmi)
+		return 0;
+
+	mutex_lock(&connector->hdmi.infoframes.lock);
+
+	memcpy(&infoframe->data, frame, sizeof(infoframe->data));
+	infoframe->set = true;
+
+	ret = write_infoframe(connector, infoframe);
+
+	mutex_unlock(&connector->hdmi.infoframes.lock);
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_update_audio_infoframe);
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index bdd3361ccc73..7237e8cf8c58 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -276,10 +276,11 @@ static int __drm_connector_init(struct drm_device *dev,
 	INIT_LIST_HEAD(&connector->global_connector_list_entry);
 	INIT_LIST_HEAD(&connector->probed_modes);
 	INIT_LIST_HEAD(&connector->modes);
 	mutex_init(&connector->mutex);
 	mutex_init(&connector->edid_override_mutex);
+	mutex_init(&connector->hdmi.infoframes.lock);
 	connector->edid_blob_ptr = NULL;
 	connector->epoch_counter = 0;
 	connector->tile_blob_ptr = NULL;
 	connector->status = connector_status_unknown;
 	connector->display_info.panel_orientation =
@@ -454,10 +455,12 @@ EXPORT_SYMBOL(drmm_connector_init);
 
 /**
  * drmm_connector_hdmi_init - Init a preallocated HDMI connector
  * @dev: DRM device
  * @connector: A pointer to the HDMI connector to init
+ * @vendor: HDMI Controller Vendor name
+ * @product: HDMI Controller Product name
  * @funcs: callbacks for this connector
  * @hdmi_funcs: HDMI-related callbacks for this connector
  * @connector_type: user visible type of the connector
  * @ddc: optional pointer to the associated ddc adapter
  * @supported_formats: Bitmask of @hdmi_colorspace listing supported output formats
@@ -474,19 +477,27 @@ EXPORT_SYMBOL(drmm_connector_init);
  * Returns:
  * Zero on success, error code on failure.
  */
 int drmm_connector_hdmi_init(struct drm_device *dev,
 			     struct drm_connector *connector,
+			     const char *vendor, const char *product,
 			     const struct drm_connector_funcs *funcs,
 			     const struct drm_connector_hdmi_funcs *hdmi_funcs,
 			     int connector_type,
 			     struct i2c_adapter *ddc,
 			     unsigned long supported_formats,
 			     unsigned int max_bpc)
 {
 	int ret;
 
+	if (!vendor || !product)
+		return -EINVAL;
+
+	if ((strlen(vendor) > DRM_CONNECTOR_HDMI_VENDOR_LEN) ||
+	    (strlen(product) > DRM_CONNECTOR_HDMI_PRODUCT_LEN))
+		return -EINVAL;
+
 	if (!(connector_type == DRM_MODE_CONNECTOR_HDMIA ||
 	      connector_type == DRM_MODE_CONNECTOR_HDMIB))
 		return -EINVAL;
 
 	if (!supported_formats || !(supported_formats & BIT(HDMI_COLORSPACE_RGB)))
@@ -498,10 +509,12 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	ret = drmm_connector_init(dev, connector, funcs, connector_type, ddc);
 	if (ret)
 		return ret;
 
 	connector->hdmi.supported_formats = supported_formats;
+	strtomem_pad(connector->hdmi.vendor, vendor, 0);
+	strtomem_pad(connector->hdmi.product, product, 0);
 
 	/*
 	 * drm_connector_attach_max_bpc_property() requires the
 	 * connector to have a state.
 	 */
@@ -650,10 +663,11 @@ void drm_connector_cleanup(struct drm_connector *connector)
 	WARN_ON(connector->state && !connector->funcs->atomic_destroy_state);
 	if (connector->state && connector->funcs->atomic_destroy_state)
 		connector->funcs->atomic_destroy_state(connector,
 						       connector->state);
 
+	mutex_destroy(&connector->hdmi.infoframes.lock);
 	mutex_destroy(&connector->mutex);
 
 	memset(connector, 0, sizeof(*connector));
 
 	if (dev->registered)
diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
index 672b74bc9e23..4e3c2c7dfaf2 100644
--- a/drivers/gpu/drm/tests/drm_connector_test.c
+++ b/drivers/gpu/drm/tests/drm_connector_test.c
@@ -189,10 +189,11 @@ static void drm_test_connector_hdmi_init_valid(struct kunit *test)
 {
 	struct drm_connector_init_priv *priv = test->priv;
 	int ret;
 
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       "Vendor", "Product",
 				       &dummy_funcs,
 				       &dummy_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
 				       BIT(HDMI_COLORSPACE_RGB),
@@ -208,10 +209,11 @@ static void drm_test_connector_hdmi_init_null_ddc(struct kunit *test)
 {
 	struct drm_connector_init_priv *priv = test->priv;
 	int ret;
 
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       "Vendor", "Product",
 				       &dummy_funcs,
 				       &dummy_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       NULL,
 				       BIT(HDMI_COLORSPACE_RGB),
@@ -227,10 +229,11 @@ static void drm_test_connector_hdmi_init_bpc_invalid(struct kunit *test)
 {
 	struct drm_connector_init_priv *priv = test->priv;
 	int ret;
 
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       "Vendor", "Product",
 				       &dummy_funcs,
 				       &dummy_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
 				       BIT(HDMI_COLORSPACE_RGB),
@@ -246,10 +249,11 @@ static void drm_test_connector_hdmi_init_bpc_null(struct kunit *test)
 {
 	struct drm_connector_init_priv *priv = test->priv;
 	int ret;
 
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       "Vendor", "Product",
 				       &dummy_funcs,
 				       &dummy_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
 				       BIT(HDMI_COLORSPACE_RGB),
@@ -269,10 +273,11 @@ static void drm_test_connector_hdmi_init_bpc_8(struct kunit *test)
 	struct drm_property *prop;
 	uint64_t val;
 	int ret;
 
 	ret = drmm_connector_hdmi_init(&priv->drm, connector,
+				       "Vendor", "Product",
 				       &dummy_funcs,
 				       &dummy_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
 				       BIT(HDMI_COLORSPACE_RGB),
@@ -304,10 +309,11 @@ static void drm_test_connector_hdmi_init_bpc_10(struct kunit *test)
 	struct drm_property *prop;
 	uint64_t val;
 	int ret;
 
 	ret = drmm_connector_hdmi_init(&priv->drm, connector,
+				       "Vendor", "Product",
 				       &dummy_funcs,
 				       &dummy_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
 				       BIT(HDMI_COLORSPACE_RGB),
@@ -339,10 +345,11 @@ static void drm_test_connector_hdmi_init_bpc_12(struct kunit *test)
 	struct drm_property *prop;
 	uint64_t val;
 	int ret;
 
 	ret = drmm_connector_hdmi_init(&priv->drm, connector,
+				       "Vendor", "Product",
 				       &dummy_funcs,
 				       &dummy_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
 				       BIT(HDMI_COLORSPACE_RGB),
@@ -370,10 +377,11 @@ static void drm_test_connector_hdmi_init_formats_empty(struct kunit *test)
 {
 	struct drm_connector_init_priv *priv = test->priv;
 	int ret;
 
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       "Vendor", "Product",
 				       &dummy_funcs,
 				       &dummy_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
 				       0,
@@ -389,10 +397,11 @@ static void drm_test_connector_hdmi_init_formats_no_rgb(struct kunit *test)
 {
 	struct drm_connector_init_priv *priv = test->priv;
 	int ret;
 
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       "Vendor", "Product",
 				       &dummy_funcs,
 				       &dummy_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
 				       BIT(HDMI_COLORSPACE_YUV422),
@@ -409,10 +418,11 @@ static void drm_test_connector_hdmi_init_type_valid(struct kunit *test)
 	struct drm_connector_init_priv *priv = test->priv;
 	unsigned int connector_type = *(unsigned int *)test->param_value;
 	int ret;
 
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       "Vendor", "Product",
 				       &dummy_funcs,
 				       &dummy_hdmi_funcs,
 				       connector_type,
 				       &priv->ddc,
 				       BIT(HDMI_COLORSPACE_RGB),
@@ -443,10 +453,11 @@ static void drm_test_connector_hdmi_init_type_invalid(struct kunit *test)
 	struct drm_connector_init_priv *priv = test->priv;
 	unsigned int connector_type = *(unsigned int *)test->param_value;
 	int ret;
 
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       "Vendor", "Product",
 				       &dummy_funcs,
 				       &dummy_hdmi_funcs,
 				       connector_type,
 				       &priv->ddc,
 				       BIT(HDMI_COLORSPACE_RGB),
@@ -708,10 +719,11 @@ static void drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector(
 	struct drm_connector *connector = &priv->connector;
 	struct drm_property *prop;
 	int ret;
 
 	ret = drmm_connector_hdmi_init(&priv->drm, connector,
+				       "Vendor", "Product",
 				       &dummy_funcs,
 				       &dummy_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
 				       BIT(HDMI_COLORSPACE_RGB),
diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index da5c3d9a80bb..e0bbe672642e 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -204,10 +204,11 @@ drm_atomic_helper_connector_hdmi_init(struct kunit *test,
 
 	enc->possible_crtcs = drm_crtc_mask(priv->crtc);
 
 	conn = &priv->connector;
 	ret = drmm_connector_hdmi_init(drm, conn,
+				       "Vendor", "Product",
 				       &dummy_connector_funcs,
 				       &dummy_connector_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       NULL,
 				       formats,
diff --git a/include/drm/display/drm_hdmi_state_helper.h b/include/drm/display/drm_hdmi_state_helper.h
index 6021983e2602..fbf86ff9cdfb 100644
--- a/include/drm/display/drm_hdmi_state_helper.h
+++ b/include/drm/display/drm_hdmi_state_helper.h
@@ -4,13 +4,20 @@
 #define DRM_HDMI_STATE_HELPER_H_
 
 struct drm_atomic_state;
 struct drm_connector;
 struct drm_connector_state;
+struct hdmi_audio_infoframe;
 
 void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
 					      struct drm_connector_state *new_conn_state);
 
 int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
 					   struct drm_atomic_state *state);
 
+int drm_atomic_helper_connector_hdmi_update_audio_infoframe(struct drm_connector *connector,
+							    struct hdmi_audio_infoframe *frame);
+int drm_atomic_helper_connector_hdmi_update_infoframes(struct drm_connector *connector,
+						       struct drm_atomic_state *state);
+
+
 #endif // DRM_HDMI_STATE_HELPER_H_
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 1fca26d51218..450c5605d145 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -912,10 +912,25 @@ struct drm_tv_connector_state {
 	unsigned int overscan;
 	unsigned int saturation;
 	unsigned int hue;
 };
 
+/**
+ * struct drm_connector_hdmi_infoframe - HDMI Infoframe container
+ */
+struct drm_connector_hdmi_infoframe {
+	/**
+	 * @data: HDMI Infoframe structure
+	 */
+	union hdmi_infoframe data;
+
+	/**
+	 * @set: Is the content of @data valid?
+	 */
+	bool set;
+};
+
 /**
  * struct drm_connector_state - mutable connector state
  */
 struct drm_connector_state {
 	/** @connector: backpointer to the connector */
@@ -1069,11 +1084,40 @@ struct drm_connector_state {
 		 * Broadcast RGB selection value.
 		 */
 		enum drm_hdmi_broadcast_rgb broadcast_rgb;
 
 		/**
-		 * @is_full_range: Is the output supposed to use a full
+		 * @infoframes: HDMI Infoframes matching that state
+		 */
+		struct {
+			/**
+			 * @avi: AVI Infoframes structure matching our
+			 * state.
+			 */
+			struct drm_connector_hdmi_infoframe avi;
+
+			/**
+			 * @hdr_drm: DRM (Dynamic Range and Mastering)
+			 * Infoframes structure matching our state.
+			 */
+			struct drm_connector_hdmi_infoframe hdr_drm;
+
+			/**
+			 * @spd: SPD Infoframes structure matching our
+			 * state.
+			 */
+			struct drm_connector_hdmi_infoframe spd;
+
+			/**
+			 * @vendor: HDMI Vendor Infoframes structure
+			 * matching our state.
+			 */
+			struct drm_connector_hdmi_infoframe hdmi;
+		} infoframes;
+
+		/**
+		 * @is_limited_range: Is the output supposed to use a limited
 		 * RGB Quantization Range or not?
 		 */
 		bool is_limited_range;
 
 		/**
@@ -1113,10 +1157,45 @@ struct drm_connector_hdmi_funcs {
 	 */
 	enum drm_mode_status
 	(*tmds_char_rate_valid)(const struct drm_connector *connector,
 				const struct drm_display_mode *mode,
 				unsigned long long tmds_rate);
+
+	/**
+	 * @clear_infoframe:
+	 *
+	 * This callback is invoked through
+	 * @drm_atomic_helper_connector_hdmi_update_infoframes during a
+	 * commit to clear the infoframes into the hardware. It will be
+	 * called multiple times, once for every disabled infoframe
+	 * type.
+	 *
+	 * The @clear_infoframe callback is optional.
+	 *
+	 * Returns:
+	 * 0 on success, a negative error code otherwise
+	 */
+	int (*clear_infoframe)(struct drm_connector *connector,
+			       enum hdmi_infoframe_type type);
+
+	/**
+	 * @write_infoframe:
+	 *
+	 * This callback is invoked through
+	 * @drm_atomic_helper_connector_hdmi_update_infoframes during a
+	 * commit to program the infoframes into the hardware. It will
+	 * be called multiple times, once for every updated infoframe
+	 * type.
+	 *
+	 * The @write_infoframe callback is mandatory.
+	 *
+	 * Returns:
+	 * 0 on success, a negative error code otherwise
+	 */
+	int (*write_infoframe)(struct drm_connector *connector,
+			       enum hdmi_infoframe_type type,
+			       const u8 *buffer, size_t len);
 };
 
 /**
  * struct drm_connector_funcs - control connectors on a given device
  *
@@ -1984,20 +2063,49 @@ struct drm_connector {
 
 	/**
 	 * @hdmi: HDMI-related variable and properties.
 	 */
 	struct {
+#define DRM_CONNECTOR_HDMI_VENDOR_LEN	8
+		/**
+		 * @vendor: HDMI Controller Vendor Name
+		 */
+		unsigned char vendor[DRM_CONNECTOR_HDMI_VENDOR_LEN] __nonstring;
+
+#define DRM_CONNECTOR_HDMI_PRODUCT_LEN	16
+		/**
+		 * @product: HDMI Controller Product Name
+		 */
+		unsigned char product[DRM_CONNECTOR_HDMI_PRODUCT_LEN] __nonstring;
+
 		/**
 		 * @supported_formats: Bitmask of @hdmi_colorspace
 		 * supported by the controller.
 		 */
 		unsigned long supported_formats;
 
 		/**
 		 * @funcs: HDMI connector Control Functions
 		 */
 		const struct drm_connector_hdmi_funcs *funcs;
+
+		/**
+		 * @infoframes: Current Infoframes output by the connector
+		 */
+		struct {
+			/**
+			 * @lock: Mutex protecting against concurrent access to
+			 * the infoframes, most notably between KMS and ALSA.
+			 */
+			struct mutex lock;
+
+			/**
+			 * @audio: Current Audio Infoframes structure. Protected
+			 * by @lock.
+			 */
+			struct drm_connector_hdmi_infoframe audio;
+		} infoframes;
 	} hdmi;
 };
 
 #define obj_to_connector(x) container_of(x, struct drm_connector, base)
 
@@ -2015,10 +2123,11 @@ int drmm_connector_init(struct drm_device *dev,
 			const struct drm_connector_funcs *funcs,
 			int connector_type,
 			struct i2c_adapter *ddc);
 int drmm_connector_hdmi_init(struct drm_device *dev,
 			     struct drm_connector *connector,
+			     const char *vendor, const char *product,
 			     const struct drm_connector_funcs *funcs,
 			     const struct drm_connector_hdmi_funcs *hdmi_funcs,
 			     int connector_type,
 			     struct i2c_adapter *ddc,
 			     unsigned long supported_formats,

-- 
2.45.0


