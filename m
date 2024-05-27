Return-Path: <linux-media+bounces-11955-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5DE8D0267
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 15:59:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D39041C20CD8
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 13:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6B1415FA73;
	Mon, 27 May 2024 13:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GV9MYTmT"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1829015FA61;
	Mon, 27 May 2024 13:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716818297; cv=none; b=K48aH7SF1FZZa4/20Oi/Faf8NkZmYuc6Q4reGPDbPzj483LpZLQTRHcb9n/cIrZZYX93sSt89NpdTERfvFiG3SQDuBIw3zBlnQ9uPABiewSiDrsPkFwIkXrubZ3lWIYw5BxlDGmThNb1wgbQeISYIotkwCg7dpbUm+EqeMVwsZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716818297; c=relaxed/simple;
	bh=yFSA4w+ARQ3QxiRHadSdscbu33xQm71NKpYfvHru96g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F1hH+XeEWp2dAwN8ET5ngdw+5kDbVqHPDbhAPNZ69iB//38yRGwFD57qvcDlByFce21dV4Xon1t236Q093yf8wZIfLMDrE7VjGyryPMSjUUEcAKnbBUctwPrTOTTX6Db6nsBFmddfTgRPqwKKKyXVuZtuyHWOCXPHExl/2LMPU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GV9MYTmT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7067FC4AF09;
	Mon, 27 May 2024 13:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716818297;
	bh=yFSA4w+ARQ3QxiRHadSdscbu33xQm71NKpYfvHru96g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GV9MYTmTwngBdCcXfzHETJ8Wbcgt3aKov2LNZ2uH4lGVYolSIKHUTUQn0/lBfz43G
	 lA6l74M2PsSMkeO2vAQiaoSQANNEOe1EKSIDLPIn//dlg1TMr2o+pDfrgeGHvofvUw
	 RiEtLljY52Gxd+YrG06WUK8A+IxkckEFW9+3D3QjOS7fN6AmyQFh1ANWM1Cmu+BYpv
	 L+dASaKGiEHxMvOAl9ev7uiF1VN5fCIiNrOP+DY18AgI/GUB7bVCny9VlGfcF95Xau
	 Vt2Vgqzgu2NdN41JQ9Vf/Fr4AxCp2iC0Hr/AG849jX1idgixX+xlLtZB9TvlK4KDhz
	 fdTwjDAa2Q1WA==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 27 May 2024 15:57:52 +0200
Subject: [PATCH v15 03/29] drm/connector: hdmi: Create an HDMI sub-state
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-kms-hdmi-connector-state-v15-3-c5af16c3aae2@kernel.org>
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
 Sui Jingfeng <sui.jingfeng@linux.dev>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5237; i=mripard@kernel.org;
 h=from:subject:message-id; bh=yFSA4w+ARQ3QxiRHadSdscbu33xQm71NKpYfvHru96g=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGkhExOjrrW5br3RsM4p4k9SbEVKxC/fplOGBpfFCtJXb
 T1ZzcvQMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACYS/oixYev59ic1Gt3HT9+9
 ukK0bffZML9DXPlFPMsY2a5ceypmnP3f7ICu+0uBpU7GSe/TrvxpZ6wz/XVn82cDKVenGTwqcn4
 Bz8K4qu7Jssi8k774+tHppbrJzfcEV610jOqJ5Fh0aP/kBaYA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The next features we will need to share across drivers will need to
store some parameters for drivers to use, such as the selected output
format.

Let's create a new connector sub-state dedicated to HDMI controllers,
that will eventually store everything we need.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Sui Jingfeng <sui.jingfeng@linux.dev>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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


