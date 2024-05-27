Return-Path: <linux-media+bounces-11972-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3C48D02A3
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 16:04:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90F551C20777
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 14:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4A1A16D4D3;
	Mon, 27 May 2024 13:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p6B+bCEl"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461F016D9B8;
	Mon, 27 May 2024 13:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716818344; cv=none; b=cVE3JsVrNjNdTaFKlshZwTim3CvxeEm3X8EI9GPz0HlkubJnY+mBXYZgdBpEkPmPw54XUc9iNK5OhakC6Bz3JVV6o7Ej4BeD+AjtEJWjPdxgJHCMrgDeC6JKIigvjgjqZIJ/WXdbXirHhD/jLndlYQtqzYZWKu5eDKgqn6W37MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716818344; c=relaxed/simple;
	bh=UpH8jpECjgQvgSwNp+mVa+fgJ+awA1gYcQr4Ls9pDbg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h8jtQhfBM87hXHrpebmMvCpqA8VaY5jNy/hE6Lslr+HyRWZpOP251DdgqDvG9vRndBx3ux8LUhmErK33XYbAK/g1vkY1KfvNja0/FrgDwJHsDjMMP/sWKNgAczH31buMy7BkDYvXCPqBjvH477E7MiAU0eWTWORTZ2cPx82ItEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p6B+bCEl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BEF7C2BBFC;
	Mon, 27 May 2024 13:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716818343;
	bh=UpH8jpECjgQvgSwNp+mVa+fgJ+awA1gYcQr4Ls9pDbg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=p6B+bCEllwpcfP1jyTfhfnDz9WD4V8BqaD+zSEPYxpw5An+uVuY/c5lrZVQDcoDkF
	 XXonuFvQl6KWGColqrKL47xgQOGMy7nr8/yDvgA9kZB8vEIVM92UVbfBiQtKKznZjS
	 nabVlasj9Meq4KuSouw0cXqlJF5dMCGhObUjIodf+k1zaWn5X+HRyBHt8tXtnVMK3S
	 7D+9U5VKfupqu9zuKBc/DT6H2CSVDiFl2RqK29v1Xcp+PVKtmRRlZXDXsWNxgyNbgJ
	 QtcijMx3AybADM0pUwb9nHgXF0Y69fJRz1jQXIRKv4IWy1puYpDUv1zuNTgKAlVrQM
	 H8ZeNVsxRlAqg==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 27 May 2024 15:58:09 +0200
Subject: [PATCH v15 20/29] drm/connector: hdmi: Add RGB Quantization Range
 to the connector state
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-kms-hdmi-connector-state-v15-20-c5af16c3aae2@kernel.org>
References: <20240527-kms-hdmi-connector-state-v15-0-c5af16c3aae2@kernel.org>
In-Reply-To: <20240527-kms-hdmi-connector-state-v15-0-c5af16c3aae2@kernel.org>
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
 linux-sunxi@lists.linux.dev, Maxime Ripard <mripard@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4161; i=mripard@kernel.org;
 h=from:subject:message-id; bh=UpH8jpECjgQvgSwNp+mVa+fgJ+awA1gYcQr4Ls9pDbg=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGkhEzO/TpsoFTjJd8JJITl293UqSRbf27IsnsUv6FJ4f
 OpPYv7DjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCR1M+MDdNYHPXCNykYKCfM
 d//8VGFNvrWLr7zY+6vCvasjI01f7Zx8l+vcl0A9+f8T1smGF1alM9bw2qYpnZC/vl3A6eP2DpM
 dG1I66nQWb+BrXX61Lsv4i1Vu+3Ed5guahRsFT6l3y5t+0AIA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

HDMI controller drivers will need to figure out the RGB range they need
to configure based on a mode and property values. Let's expose that in
the HDMI connector state so drivers can just use that value.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 29 +++++++++++++++++++++++++
 drivers/gpu/drm/drm_atomic.c                    |  1 +
 include/drm/drm_connector.h                     |  6 +++++
 3 files changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 57c66beec5bc..f18020cfe4ea 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -49,10 +49,37 @@ connector_state_get_mode(const struct drm_connector_state *conn_state)
 		return NULL;
 
 	return &crtc_state->mode;
 }
 
+static bool hdmi_is_limited_range(const struct drm_connector *connector,
+				  const struct drm_connector_state *conn_state)
+{
+	const struct drm_display_info *info = &connector->display_info;
+	const struct drm_display_mode *mode =
+		connector_state_get_mode(conn_state);
+
+	/*
+	 * The Broadcast RGB property only applies to RGB format, and
+	 * i915 just assumes limited range for YCbCr output, so let's
+	 * just do the same.
+	 */
+	if (conn_state->hdmi.output_format != HDMI_COLORSPACE_RGB)
+		return true;
+
+	if (conn_state->hdmi.broadcast_rgb == DRM_HDMI_BROADCAST_RGB_FULL)
+		return false;
+
+	if (conn_state->hdmi.broadcast_rgb == DRM_HDMI_BROADCAST_RGB_LIMITED)
+		return true;
+
+	if (!info->is_hdmi)
+		return false;
+
+	return drm_default_rgb_quant_range(mode) == HDMI_QUANTIZATION_RANGE_LIMITED;
+}
+
 static bool
 sink_supports_format_bpc(const struct drm_connector *connector,
 			 const struct drm_display_info *info,
 			 const struct drm_display_mode *mode,
 			 unsigned int format, unsigned int bpc)
@@ -327,10 +354,12 @@ int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
 		drm_atomic_get_new_connector_state(state, connector);
 	const struct drm_display_mode *mode =
 		connector_state_get_mode(new_conn_state);
 	int ret;
 
+	new_conn_state->hdmi.is_limited_range = hdmi_is_limited_range(connector, new_conn_state);
+
 	ret = hdmi_compute_config(connector, new_conn_state, mode);
 	if (ret)
 		return ret;
 
 	if (old_conn_state->hdmi.broadcast_rgb != new_conn_state->hdmi.broadcast_rgb ||
diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 3e57d98d8418..07b4b394e3bf 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1145,10 +1145,11 @@ static void drm_atomic_connector_print_state(struct drm_printer *p,
 
 	if (connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
 	    connector->connector_type == DRM_MODE_CONNECTOR_HDMIB) {
 		drm_printf(p, "\tbroadcast_rgb=%s\n",
 			   drm_hdmi_connector_get_broadcast_rgb_name(state->hdmi.broadcast_rgb));
+		drm_printf(p, "\tis_limited_range=%c\n", state->hdmi.is_limited_range ? 'y' : 'n');
 		drm_printf(p, "\toutput_bpc=%u\n", state->hdmi.output_bpc);
 		drm_printf(p, "\toutput_format=%s\n",
 			   drm_hdmi_connector_get_output_format_name(state->hdmi.output_format));
 		drm_printf(p, "\ttmds_char_rate=%llu\n", state->hdmi.tmds_char_rate);
 	}
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index a40eaf3a8ce4..1fca26d51218 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1068,10 +1068,16 @@ struct drm_connector_state {
 		 * @broadcast_rgb: Connector property to pass the
 		 * Broadcast RGB selection value.
 		 */
 		enum drm_hdmi_broadcast_rgb broadcast_rgb;
 
+		/**
+		 * @is_full_range: Is the output supposed to use a full
+		 * RGB Quantization Range or not?
+		 */
+		bool is_limited_range;
+
 		/**
 		 * @output_bpc: Bits per color channel to output.
 		 */
 		unsigned int output_bpc;
 

-- 
2.45.0


