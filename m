Return-Path: <linux-media+bounces-11681-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 123638CABD8
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2024 12:17:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 84ECC1F22BF8
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2024 10:17:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8EBA7D06E;
	Tue, 21 May 2024 10:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QuF9a1j7"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1534E7C089;
	Tue, 21 May 2024 10:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716286464; cv=none; b=DI8EsqS52/Piq8cJX2h97xnh/JSxF0wX2VedIT83NyG7uqsAUHMXcPXzHqbI3BACi/8VMA40MP/QBQPH1YEp7utMZCUXLvq7jqbjK1phqqjx5QZp+DT985DDMf3nsaVj9VdLpEXCtUTeGl1pCqiLCIxW6VxB5YMIQNIZ55WSwgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716286464; c=relaxed/simple;
	bh=6UrkHeOkLdRsP7WmUBf8nPF7wHJAC2Ss/adKlg8oLp0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bqlHMik7Xj/lZLXo03rQbJMw0lKInFKrqHDu0hDhSK+lmi4X5p4AnGB+nSKnu9RmS2/iCu1rU7ZxELf5hmAXsEWop8FEiVRyP8hav3C7XIaxel8rO/0gxQV7abfaiCwOWaHZI7G5asMDTH4InFKGE0ybnoaWpKTWH5pIVZ2raeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QuF9a1j7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FB7CC2BD11;
	Tue, 21 May 2024 10:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716286463;
	bh=6UrkHeOkLdRsP7WmUBf8nPF7wHJAC2Ss/adKlg8oLp0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QuF9a1j7bXeB+h6STYx7GAakrBblW33uMScByuHVSmKVi0cIOLmeauzuXSfXRr12A
	 lHZTqIvkOUAu3ZPW7rozME/FZ3ytQgEeyD0fViusyfndOzCRU12W/FItG0aG0FtgYT
	 5B9sB3cKBrqLv8dSzOuyVlApTegBAEs28czhjzru55qiDG9c1c+S7ojaAWS2j4X2ZF
	 vJqi/wNyd7z/ATbvxRJufmHrzY1FwrjUUIWrLDUPR/FyO/UQilvjk8CeD/898qwQHb
	 tiObLtm/R1c25ERtzyStFyhxjWiTo5flIU2EHqKyzXU3xmsMclsCJ6VXbA7okEW0jI
	 IAyDzNGv82wFg==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 21 May 2024 12:13:44 +0200
Subject: [PATCH v14 11/28] drm/connector: hdmi: Calculate TMDS character
 rate
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240521-kms-hdmi-connector-state-v14-11-51950db4fedb@kernel.org>
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
 linux-sunxi@lists.linux.dev, Maxime Ripard <mripard@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6362; i=mripard@kernel.org;
 h=from:subject:message-id; bh=6UrkHeOkLdRsP7WmUBf8nPF7wHJAC2Ss/adKlg8oLp0=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGk+xVf1DjzLklA9mapV/sf51tr0dT3yf7KZ3rZ//nb+W
 aDAw76ujqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCRA9KMdaaxrMEbs54VLrjS
 VX/A5++J/eJLKuItXa/czOr8xTn3j1/+N02RaIYmtYrPWglHi+SEGRuO3+DnPfvp+bRZvcXd72w
 uRl1JvLbW+/0qt8PNAlqXjq9vyXq/pDHALXfbvKCutbP2yL4BAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Most HDMI drivers have some code to calculate the TMDS character rate,
usually to adjust an internal clock to match what the mode requires.

Since the TMDS character rates mostly depends on the resolution, whether
we need to repeat pixels or not, the bpc count and the format, we can
now derive it from the HDMI connector state that stores all those infos
and remove the duplication from drivers.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    | 67 ++++++++++++++++++++++
 drivers/gpu/drm/drm_atomic.c                       |  1 +
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |  3 +
 include/drm/drm_connector.h                        |  5 ++
 4 files changed, 76 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index f6cd0612ea2c..08630561d864 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -1,10 +1,11 @@
 // SPDX-License-Identifier: MIT
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_connector.h>
 
+#include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 
 /**
  * __drm_atomic_helper_connector_hdmi_reset() - Initializes all HDMI @drm_connector_state resources
  * @connector: DRM connector
@@ -23,10 +24,67 @@ void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
 	new_conn_state->max_bpc = max_bpc;
 	new_conn_state->max_requested_bpc = max_bpc;
 }
 EXPORT_SYMBOL(__drm_atomic_helper_connector_hdmi_reset);
 
+static const struct drm_display_mode *
+connector_state_get_mode(const struct drm_connector_state *conn_state)
+{
+	struct drm_atomic_state *state;
+	struct drm_crtc_state *crtc_state;
+	struct drm_crtc *crtc;
+
+	state = conn_state->state;
+	if (!state)
+		return NULL;
+
+	crtc = conn_state->crtc;
+	if (!crtc)
+		return NULL;
+
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	if (!crtc_state)
+		return NULL;
+
+	return &crtc_state->mode;
+}
+
+static enum drm_mode_status
+hdmi_clock_valid(const struct drm_connector *connector,
+		 const struct drm_display_mode *mode,
+		 unsigned long long clock)
+{
+	const struct drm_display_info *info = &connector->display_info;
+
+	if (info->max_tmds_clock && clock > info->max_tmds_clock * 1000)
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
+}
+
+static int
+hdmi_compute_clock(const struct drm_connector *connector,
+		   struct drm_connector_state *conn_state,
+		   const struct drm_display_mode *mode,
+		   unsigned int bpc, enum hdmi_colorspace fmt)
+{
+	enum drm_mode_status status;
+	unsigned long long clock;
+
+	clock = drm_hdmi_compute_mode_clock(mode, bpc, fmt);
+	if (!clock)
+		return -EINVAL;
+
+	status = hdmi_clock_valid(connector, mode, clock);
+	if (status != MODE_OK)
+		return -EINVAL;
+
+	conn_state->hdmi.tmds_char_rate = clock;
+
+	return 0;
+}
+
 /**
  * drm_atomic_helper_connector_hdmi_check() - Helper to check HDMI connector atomic state
  * @connector: DRM Connector
  * @state: the DRM State object
  *
@@ -42,10 +100,19 @@ int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
 {
 	struct drm_connector_state *old_conn_state =
 		drm_atomic_get_old_connector_state(state, connector);
 	struct drm_connector_state *new_conn_state =
 		drm_atomic_get_new_connector_state(state, connector);
+	const struct drm_display_mode *mode =
+		connector_state_get_mode(new_conn_state);
+	int ret;
+
+	ret = hdmi_compute_clock(connector, new_conn_state, mode,
+				 new_conn_state->hdmi.output_bpc,
+				 new_conn_state->hdmi.output_format);
+	if (ret)
+		return ret;
 
 	if (old_conn_state->hdmi.output_bpc != new_conn_state->hdmi.output_bpc ||
 	    old_conn_state->hdmi.output_format != new_conn_state->hdmi.output_format) {
 		struct drm_crtc *crtc = new_conn_state->crtc;
 		struct drm_crtc_state *crtc_state;
diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 8730137baa86..26f9e525c0a0 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1146,10 +1146,11 @@ static void drm_atomic_connector_print_state(struct drm_printer *p,
 	if (connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
 	    connector->connector_type == DRM_MODE_CONNECTOR_HDMIB) {
 		drm_printf(p, "\toutput_bpc=%u\n", state->hdmi.output_bpc);
 		drm_printf(p, "\toutput_format=%s\n",
 			   drm_hdmi_connector_get_output_format_name(state->hdmi.output_format));
+		drm_printf(p, "\ttmds_char_rate=%llu\n", state->hdmi.tmds_char_rate);
 	}
 
 	if (connector->connector_type == DRM_MODE_CONNECTOR_WRITEBACK)
 		if (state->writeback_job && state->writeback_job->fb)
 			drm_printf(p, "\tfb=%d\n", state->writeback_job->fb->base.id);
diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 8bc1f9b0b12b..4f46a70a5017 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -70,10 +70,13 @@ static int light_up_connector(struct kunit *test,
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
 	conn_state = drm_atomic_get_connector_state(state, connector);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
 
+	conn_state->hdmi.output_bpc = connector->max_bpc;
+	conn_state->hdmi.output_format = HDMI_COLORSPACE_RGB;
+
 	ret = drm_atomic_set_crtc_for_connector(conn_state, crtc);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	crtc_state = drm_atomic_get_crtc_state(state, crtc);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 29883e6f8e50..54899c030031 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1047,10 +1047,15 @@ struct drm_connector_state {
 
 		/**
 		 * @output_format: Pixel format to output in.
 		 */
 		enum hdmi_colorspace output_format;
+
+		/**
+		 * @tmds_char_rate: TMDS Character Rate, in Hz.
+		 */
+		unsigned long long tmds_char_rate;
 	} hdmi;
 };
 
 /**
  * struct drm_connector_funcs - control connectors on a given device

-- 
2.45.0


