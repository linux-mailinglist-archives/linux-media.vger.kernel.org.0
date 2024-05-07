Return-Path: <linux-media+bounces-10989-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 555878BE382
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 15:19:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BBC0C1F220C6
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 13:19:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39E6B15EFA7;
	Tue,  7 May 2024 13:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QQQr7lb9"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3B415ECF4;
	Tue,  7 May 2024 13:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715087875; cv=none; b=I9IopNHzLQGhfC1nJ5AJNMFfAPWrJm7fNBk/YEkxyfuKs664jNLEV8QQftlvFuKfIo9G23/9Nvp+ewU1otTaSivX9VCCfnCsFPXGq3+B53GL9U8THopgskhiNmWZa6R7lA4nRB3/w6LDg+p8gwxHM4ucz9Bxfqdhn2CdgeqqYSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715087875; c=relaxed/simple;
	bh=ZxPNHVmZZvp6DhYb1bewrikyiz/zTJuIlSDKJ6zcGWQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UIlR7oTvTMx8+iCCxx+Fd+r1zdEQrSm3u9HCrzjy9eh5HuFNpxpJTs6BJGlJCC5AH4m+gzjwF/VLyx1HzwbEc2DgDrpDMkZS3V4Zbfkb/a1xyKmcu2vzscb3aO8XzoJxyVPJljER5dgdU4UW1BUCmDHR6M+AOu3nYt4iybXU4gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QQQr7lb9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D35DC4DDE2;
	Tue,  7 May 2024 13:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715087875;
	bh=ZxPNHVmZZvp6DhYb1bewrikyiz/zTJuIlSDKJ6zcGWQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QQQr7lb9+9pjIEC+yhJrLszRuvSfDgr3FfOlDZTytA6GxlWbQ084ypTVQzAFymX+4
	 XjJhSv/RRb2ZfVY9MqWoHHtQ6FIG2OtWuqn2chXcUGmTLiFYlXWsX3yJCs9DJaPImr
	 qSKY8svnIg3W+bpPzO/kzvvjwleqZDR5sJHDXWR4LheScred+t/PV2PdrKDstPQj1m
	 fgLsoQCHzSrPg/FsI1h8K98s590ndE0T9jp0Csg3cYsnQmW7zgmB7/mGyr4yIuOMl1
	 tmPqE29Hlqol7+/BqP3v4K7er6jMdsVE52bxTe+8PXhW/HWRApOyTYQBTi0c3Jcr5/
	 Tc6NJUXH5JU4w==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 07 May 2024 15:17:22 +0200
Subject: [PATCH v13 04/28] drm/connector: hdmi: Create an HDMI sub-state
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240507-kms-hdmi-connector-state-v13-4-8fafc5efe8be@kernel.org>
References: <20240507-kms-hdmi-connector-state-v13-0-8fafc5efe8be@kernel.org>
In-Reply-To: <20240507-kms-hdmi-connector-state-v13-0-8fafc5efe8be@kernel.org>
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
 Sui Jingfeng <sui.jingfeng@linux.dev>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5176; i=mripard@kernel.org;
 h=from:subject:message-id; bh=ZxPNHVmZZvp6DhYb1bewrikyiz/zTJuIlSDKJ6zcGWQ=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGlWmi8YX4Zmt5dmsN39/WPPltCN/v91FT0v9jCUrTO6/
 bY9Tehvx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZgI73zGhoU+q/Oyp2mLbrq8
 1r+yYtGHXRvrZ+jKh9lY+bV6vWLbtz/vxtSfKd3nvgQ2r2rfFLNWgLHh17Z3WX+e/F5zYLX1B6W
 6vFWXlvS0WS6zf+aw+9xLyQ1PDd91M9R+21H1Li77XZhW2bpAAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The next features we will need to share across drivers will need to
store some parameters for drivers to use, such as the selected output
format.

Let's create a new connector sub-state dedicated to HDMI controllers,
that will eventually store everything we need.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Sui Jingfeng <sui.jingfeng@linux.dev>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/display/Kconfig                 |  7 +++++
 drivers/gpu/drm/display/Makefile                |  2 ++
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 41 +++++++++++++++++++++++++
 include/drm/display/drm_hdmi_state_helper.h     | 16 ++++++++++
 include/drm/drm_connector.h                     |  7 +++++
 5 files changed, 73 insertions(+)

diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index 864a6488bfdf..14114b597ef4 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -68,5 +68,12 @@ config DRM_DISPLAY_HDCP_HELPER
 config DRM_DISPLAY_HDMI_HELPER
 	bool
 	depends on DRM_DISPLAY_HELPER
 	help
 	  DRM display helpers for HDMI.
+
+config DRM_DISPLAY_HDMI_STATE_HELPER
+	bool
+	depends on DRM_DISPLAY_HELPER
+	depends on DRM_DISPLAY_HDMI_HELPER
+	help
+	  DRM KMS state helpers for HDMI.
diff --git a/drivers/gpu/drm/display/Makefile b/drivers/gpu/drm/display/Makefile
index 17d2cc73ff56..629df2f4d322 100644
--- a/drivers/gpu/drm/display/Makefile
+++ b/drivers/gpu/drm/display/Makefile
@@ -12,9 +12,11 @@ drm_display_helper-$(CONFIG_DRM_DISPLAY_DP_TUNNEL) += \
 	drm_dp_tunnel.o
 drm_display_helper-$(CONFIG_DRM_DISPLAY_HDCP_HELPER) += drm_hdcp_helper.o
 drm_display_helper-$(CONFIG_DRM_DISPLAY_HDMI_HELPER) += \
 	drm_hdmi_helper.o \
 	drm_scdc_helper.o
+drm_display_helper-$(CONFIG_DRM_DISPLAY_HDMI_STATE_HELPER) += \
+	drm_hdmi_state_helper.o
 drm_display_helper-$(CONFIG_DRM_DISPLAY_DP_AUX_CHARDEV) += drm_dp_aux_dev.o
 drm_display_helper-$(CONFIG_DRM_DISPLAY_DP_AUX_CEC) += drm_dp_cec.o
 
 obj-$(CONFIG_DRM_DISPLAY_HELPER) += drm_display_helper.o
diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
new file mode 100644
index 000000000000..1e92c1108d23
--- /dev/null
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -0,0 +1,41 @@
+// SPDX-License-Identifier: MIT
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_connector.h>
+
+#include <drm/display/drm_hdmi_state_helper.h>
+
+/**
+ * __drm_atomic_helper_connector_hdmi_reset() - Initializes all HDMI @drm_connector_state resources
+ * @connector: DRM connector
+ * @new_conn_state: connector state to reset
+ *
+ * Initializes all HDMI resources from a @drm_connector_state without
+ * actually allocating it. This is useful for HDMI drivers, in
+ * combination with __drm_atomic_helper_connector_reset() or
+ * drm_atomic_helper_connector_reset().
+ */
+void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
+					      struct drm_connector_state *new_conn_state)
+{
+}
+EXPORT_SYMBOL(__drm_atomic_helper_connector_hdmi_reset);
+
+/**
+ * drm_atomic_helper_connector_hdmi_check() - Helper to check HDMI connector atomic state
+ * @connector: DRM Connector
+ * @state: the DRM State object
+ *
+ * Provides a default connector state check handler for HDMI connectors.
+ * Checks that a desired connector update is valid, and updates various
+ * fields of derived state.
+ *
+ * RETURNS:
+ * Zero on success, or an errno code otherwise.
+ */
+int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
+					   struct drm_atomic_state *state)
+{
+	return 0;
+}
+EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_check);
diff --git a/include/drm/display/drm_hdmi_state_helper.h b/include/drm/display/drm_hdmi_state_helper.h
new file mode 100644
index 000000000000..6021983e2602
--- /dev/null
+++ b/include/drm/display/drm_hdmi_state_helper.h
@@ -0,0 +1,16 @@
+#/* SPDX-License-Identifier: MIT */
+
+#ifndef DRM_HDMI_STATE_HELPER_H_
+#define DRM_HDMI_STATE_HELPER_H_
+
+struct drm_atomic_state;
+struct drm_connector;
+struct drm_connector_state;
+
+void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
+					      struct drm_connector_state *new_conn_state);
+
+int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
+					   struct drm_atomic_state *state);
+
+#endif // DRM_HDMI_STATE_HELPER_H_
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 4491c4c2fb6e..000a2a156619 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1029,10 +1029,17 @@ struct drm_connector_state {
 	/**
 	 * @hdr_output_metadata:
 	 * DRM blob property for HDR output metadata
 	 */
 	struct drm_property_blob *hdr_output_metadata;
+
+	/**
+	 * @hdmi: HDMI-related variable and properties. Filled by
+	 * @drm_atomic_helper_connector_hdmi_check().
+	 */
+	struct {
+	} hdmi;
 };
 
 /**
  * struct drm_connector_funcs - control connectors on a given device
  *

-- 
2.45.0


