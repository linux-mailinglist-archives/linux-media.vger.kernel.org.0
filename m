Return-Path: <linux-media+bounces-11674-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0028E8CABB3
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2024 12:15:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 692331F21178
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2024 10:15:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D6E9757FC;
	Tue, 21 May 2024 10:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MMnapase"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C735374E0A;
	Tue, 21 May 2024 10:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716286443; cv=none; b=OidGO+Gl7noFD51fy+TS4J7TOjVcbAk7ByHyNhbrraCE3sCL1wSDBKws6IwZZMYonEi8MK1rcY46Axh34uU3Y2X74dD1ir0r4iBW+txfS8prAvyNLbG7s7HDVJVNrN8aOr0Lr8L8siq9DPRZRGk4ZrkC1fuFa0AR7M9uE62YqsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716286443; c=relaxed/simple;
	bh=ZxPNHVmZZvp6DhYb1bewrikyiz/zTJuIlSDKJ6zcGWQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UT2DI9N8qRu+H25n3QxamXyoglh+FO1PvM3E0xUl8cjHY3taGz2E2VZK15RYp7aYkLC+ccLh5Gt3Pblmv1/gs78mK7tuG5Sy8bzgf3TK4AyOzlMrypEHg7C8mwhm3Zn5Iy04KzXV5rJ3j9dD6Fv0eBg8uOFgUnNvo6RwcloMv/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MMnapase; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50A4BC4AF09;
	Tue, 21 May 2024 10:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716286443;
	bh=ZxPNHVmZZvp6DhYb1bewrikyiz/zTJuIlSDKJ6zcGWQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MMnapaseLFpD314Otxm3BfG3VHbI4flbt9FmTQw9kOjW1Nq0rPwfFmvHrPq/cb3kE
	 nh3PBI/ybYdP2hsmzoVXK0bPAC42/1tD4fVj47UYNvY/UXFVz9Qh3BElF+1WPvuPP6
	 q+2AnKZV6d6t5FIif3c+gFk7Zug8ZAutrqJHo6b+lP4PIzzqw/CvBowDB2n3fjSXxZ
	 ntQJEUSxw1Uh7eyRQmdiGYBS1ZKcABg55u/eNqdoSEmCFk5eb7xBYI+tg88ao58Ku0
	 p69plKZCgUhkwsODnIRUX3SbOp+I/xRnMwnArva75RWrv7zRSBtaopg3wrlawjKKac
	 Zy742JGqAHryQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 21 May 2024 12:13:37 +0200
Subject: [PATCH v14 04/28] drm/connector: hdmi: Create an HDMI sub-state
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240521-kms-hdmi-connector-state-v14-4-51950db4fedb@kernel.org>
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Sui Jingfeng <sui.jingfeng@linux.dev>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5176; i=mripard@kernel.org;
 h=from:subject:message-id; bh=ZxPNHVmZZvp6DhYb1bewrikyiz/zTJuIlSDKJ6zcGWQ=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGk+xZf6KrM42/qeivAU9kf/S9h+Ui8gbdWumqeOKxeFq
 pS85VbtmMLCIMzJICumyPJEJuz08vbFVQ72K3/AzGFlAhnCwMUpABO5kclY8VxvoeXP8MlNt1d7
 X0lT0zl6OZdvFvv10wGbfqVdcdnuMdVY5u+UYxyTxb9bqQo5sQkwNmydyrho4o1nMQ/v/E9xbON
 Y2LffiOHpcl833ueTEzWe7Nua8Dw1ivt4tMSyg5WtqiUrVQE=
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


