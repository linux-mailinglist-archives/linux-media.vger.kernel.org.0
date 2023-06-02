Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4F0671FB43
	for <lists+linux-media@lfdr.de>; Fri,  2 Jun 2023 09:42:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234259AbjFBHlp convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 2 Jun 2023 03:41:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234445AbjFBHlS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jun 2023 03:41:18 -0400
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36E2119A;
        Fri,  2 Jun 2023 00:40:56 -0700 (PDT)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
        (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
        by ex01.ufhost.com (Postfix) with ESMTP id D47CF24E27E;
        Fri,  2 Jun 2023 15:40:49 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 2 Jun
 2023 15:40:49 +0800
Received: from xiaofei.localdomain (180.164.60.184) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 2 Jun
 2023 15:40:49 +0800
From:   Keith Zhao <keith.zhao@starfivetech.com>
To:     <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>
CC:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        "Rob Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Emil Renner Berthing" <kernel@esmil.dk>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        <christian.koenig@amd.com>, Bjorn Andersson <andersson@kernel.org>,
        "Heiko Stuebner" <heiko@sntech.de>,
        Shawn Guo <shawnguo@kernel.org>, Jagan Teki <jagan@edgeble.ai>,
        Chris Morgan <macromorgan@hotmail.com>,
        Keith Zhao <keith.zhao@starfivetech.com>,
        Jack Zhu <jack.zhu@starfivetech.com>,
        Shengyang Chen <shengyang.chen@starfivetech.com>,
        Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH 7/9] drm/verisilicon: Add drm plane funcs
Date:   Fri, 2 Jun 2023 15:40:41 +0800
Message-ID: <20230602074043.33872-8-keith.zhao@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230602074043.33872-1-keith.zhao@starfivetech.com>
References: <20230602074043.33872-1-keith.zhao@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement plane functions for the DRM driver.

Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
---
 drivers/gpu/drm/verisilicon/Makefile   |   3 +-
 drivers/gpu/drm/verisilicon/vs_plane.c | 440 +++++++++++++++++++++++++
 drivers/gpu/drm/verisilicon/vs_plane.h |  74 +++++
 3 files changed, 516 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.h

diff --git a/drivers/gpu/drm/verisilicon/Makefile b/drivers/gpu/drm/verisilicon/Makefile
index bae5fbab9bbb..d96ad9399fc7 100644
--- a/drivers/gpu/drm/verisilicon/Makefile
+++ b/drivers/gpu/drm/verisilicon/Makefile
@@ -3,7 +3,8 @@
 vs_drm-objs := vs_drv.o \
 		vs_crtc.o \
 		vs_fb.o \
-		vs_gem.o
+		vs_gem.o \
+		vs_plane.o
 
 obj-$(CONFIG_DRM_VERISILICON) += vs_drm.o
 
diff --git a/drivers/gpu/drm/verisilicon/vs_plane.c b/drivers/gpu/drm/verisilicon/vs_plane.c
new file mode 100644
index 000000000000..7b0dcef232ae
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_plane.c
@@ -0,0 +1,440 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
+ */
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_blend.h>
+#include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_plane_helper.h>
+
+#include <drm/vs_drm.h>
+
+#include "vs_crtc.h"
+#include "vs_fb.h"
+#include "vs_gem.h"
+#include "vs_plane.h"
+#include "vs_type.h"
+
+void vs_plane_destory(struct drm_plane *plane)
+{
+	struct vs_plane *vs_plane = to_vs_plane(plane);
+
+	drm_plane_cleanup(plane);
+	kfree(vs_plane);
+}
+
+static void vs_plane_reset(struct drm_plane *plane)
+{
+	struct vs_plane_state *state;
+	struct vs_plane *vs_plane = to_vs_plane(plane);
+
+	if (plane->state) {
+		__drm_atomic_helper_plane_destroy_state(plane->state);
+
+		state = to_vs_plane_state(plane->state);
+		kfree(state);
+		plane->state = NULL;
+	}
+
+	state = kzalloc(sizeof(*state), GFP_KERNEL);
+	if (!state)
+		return;
+
+	__drm_atomic_helper_plane_reset(plane, &state->base);
+
+	state->degamma = VS_DEGAMMA_DISABLE;
+	state->degamma_changed = false;
+	state->base.zpos = vs_plane->id;
+
+	memset(&state->status, 0, sizeof(state->status));
+}
+
+static void _vs_plane_duplicate_blob(struct vs_plane_state *state,
+				     struct vs_plane_state *ori_state)
+{
+	state->watermark = ori_state->watermark;
+	state->color_mgmt = ori_state->color_mgmt;
+	state->roi = ori_state->roi;
+
+	if (state->watermark)
+		drm_property_blob_get(state->watermark);
+	if (state->color_mgmt)
+		drm_property_blob_get(state->color_mgmt);
+	if (state->roi)
+		drm_property_blob_get(state->roi);
+}
+
+static int
+_vs_plane_set_property_blob_from_id(struct drm_device *dev,
+				    struct drm_property_blob **blob,
+				    u64 blob_id,
+				    size_t expected_size)
+{
+	struct drm_property_blob *new_blob = NULL;
+
+	if (blob_id) {
+		new_blob = drm_property_lookup_blob(dev, blob_id);
+		if (!new_blob)
+			return -EINVAL;
+
+		if (new_blob->length != expected_size) {
+			drm_property_blob_put(new_blob);
+			return -EINVAL;
+		}
+	}
+
+	drm_property_replace_blob(blob, new_blob);
+	drm_property_blob_put(new_blob);
+
+	return 0;
+}
+
+static struct drm_plane_state *
+vs_plane_atomic_duplicate_state(struct drm_plane *plane)
+{
+	struct vs_plane_state *ori_state;
+	struct vs_plane_state *state;
+
+	if (WARN_ON(!plane->state))
+		return NULL;
+
+	ori_state = to_vs_plane_state(plane->state);
+	state = kzalloc(sizeof(*state), GFP_KERNEL);
+	if (!state)
+		return NULL;
+
+	__drm_atomic_helper_plane_duplicate_state(plane, &state->base);
+
+	state->degamma = ori_state->degamma;
+	state->degamma_changed = ori_state->degamma_changed;
+
+	_vs_plane_duplicate_blob(state, ori_state);
+	memcpy(&state->status, &ori_state->status, sizeof(ori_state->status));
+
+	return &state->base;
+}
+
+static void vs_plane_atomic_destroy_state(struct drm_plane *plane,
+					  struct drm_plane_state *state)
+{
+	struct vs_plane_state *vs_plane_state = to_vs_plane_state(state);
+
+	__drm_atomic_helper_plane_destroy_state(state);
+
+	drm_property_blob_put(vs_plane_state->watermark);
+	drm_property_blob_put(vs_plane_state->color_mgmt);
+	drm_property_blob_put(vs_plane_state->roi);
+	kfree(vs_plane_state);
+}
+
+static int vs_plane_atomic_set_property(struct drm_plane *plane,
+					struct drm_plane_state *state,
+					struct drm_property *property,
+					uint64_t val)
+{
+	struct drm_device *dev = plane->dev;
+	struct vs_plane *vs_plane = to_vs_plane(plane);
+	struct vs_plane_state *vs_plane_state = to_vs_plane_state(state);
+	int ret = 0;
+
+	if (property == vs_plane->degamma_mode) {
+		if (vs_plane_state->degamma != val) {
+			vs_plane_state->degamma = val;
+			vs_plane_state->degamma_changed = true;
+		} else {
+			vs_plane_state->degamma_changed = false;
+		}
+	} else if (property == vs_plane->watermark_prop) {
+		ret = _vs_plane_set_property_blob_from_id(dev,
+							  &vs_plane_state->watermark,
+							  val,
+							  sizeof(struct drm_vs_watermark));
+		return ret;
+	} else if (property == vs_plane->color_mgmt_prop) {
+		ret = _vs_plane_set_property_blob_from_id(dev,
+							  &vs_plane_state->color_mgmt,
+							  val,
+							  sizeof(struct drm_vs_color_mgmt));
+		return ret;
+	} else if (property == vs_plane->roi_prop) {
+		ret = _vs_plane_set_property_blob_from_id(dev,
+							  &vs_plane_state->roi,
+							  val,
+							  sizeof(struct drm_vs_roi));
+		return ret;
+	} else {
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int vs_plane_atomic_get_property(struct drm_plane *plane,
+					const struct drm_plane_state *state,
+					struct drm_property *property,
+					uint64_t *val)
+{
+	struct vs_plane *vs_plane = to_vs_plane(plane);
+	const struct vs_plane_state *vs_plane_state =
+		container_of(state, const struct vs_plane_state, base);
+
+	if (property == vs_plane->degamma_mode)
+		*val = vs_plane_state->degamma;
+	else if (property == vs_plane->watermark_prop)
+		*val = (vs_plane_state->watermark) ?
+					vs_plane_state->watermark->base.id : 0;
+	else if (property == vs_plane->color_mgmt_prop)
+		*val = (vs_plane_state->color_mgmt) ?
+					vs_plane_state->color_mgmt->base.id : 0;
+	else if (property == vs_plane->roi_prop)
+		*val = (vs_plane_state->roi) ?
+					vs_plane_state->roi->base.id : 0;
+	else
+		return -EINVAL;
+
+	return 0;
+}
+
+static bool vs_format_mod_supported(struct drm_plane *plane,
+				    u32 format,
+				    u64 modifier)
+{
+	int i;
+
+       /* We always have to allow these modifiers:
+	* 1. Core DRM checks for LINEAR support if userspace does not provide modifiers.
+	* 2. Not passing any modifiers is the same as explicitly passing INVALID.
+	*/
+	if (modifier == DRM_FORMAT_MOD_LINEAR)
+		return true;
+
+	/* Check that the modifier is on the list of the plane's supported modifiers. */
+	for (i = 0; i < plane->modifier_count; i++) {
+		if (modifier == plane->modifiers[i])
+			break;
+	}
+
+	if (i == plane->modifier_count)
+		return false;
+
+	return true;
+}
+
+const struct drm_plane_funcs vs_plane_funcs = {
+	.update_plane		= drm_atomic_helper_update_plane,
+	.disable_plane		= drm_atomic_helper_disable_plane,
+	.destroy		= vs_plane_destory,
+	.reset			= vs_plane_reset,
+	.atomic_duplicate_state = vs_plane_atomic_duplicate_state,
+	.atomic_destroy_state	= vs_plane_atomic_destroy_state,
+	.atomic_set_property	= vs_plane_atomic_set_property,
+	.atomic_get_property	= vs_plane_atomic_get_property,
+	.format_mod_supported	= vs_format_mod_supported,
+};
+
+static unsigned char vs_get_plane_number(struct drm_framebuffer *fb)
+{
+	const struct drm_format_info *info;
+
+	if (!fb)
+		return 0;
+
+	info = drm_format_info(fb->format->format);
+	if (!info || info->num_planes > MAX_NUM_PLANES)
+		return 0;
+
+	return info->num_planes;
+}
+
+static int vs_plane_atomic_check(struct drm_plane *plane,
+				 struct drm_atomic_state *state)
+{
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 plane);
+	struct vs_plane *vs_plane = to_vs_plane(plane);
+	struct drm_framebuffer *fb = new_plane_state->fb;
+	struct drm_crtc *crtc = new_plane_state->crtc;
+	struct vs_crtc *vs_crtc = to_vs_crtc(crtc);
+
+	if (!crtc || !fb)
+		return 0;
+
+	//return vs_plane->funcs->check(vs_crtc->dev, vs_plane, new_plane_state);
+	return vs_plane->funcs->check(vs_crtc->dev, plane, state);
+}
+
+static void vs_plane_atomic_update(struct drm_plane *plane,
+				   struct drm_atomic_state *state)
+{
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
+									   plane);
+	unsigned char i, num_planes;
+	struct drm_framebuffer *fb;
+	struct vs_plane *vs_plane = to_vs_plane(plane);
+	//struct drm_plane_state *state = plane->state;
+	struct vs_crtc *vs_crtc = to_vs_crtc(new_state->crtc);
+	struct vs_plane_state *plane_state = to_vs_plane_state(new_state);
+	//struct drm_format_name_buf *name = &plane_state->status.format_name;
+
+	if (!new_state->fb || !new_state->crtc)
+		return;
+
+	fb = new_state->fb;
+
+	num_planes = vs_get_plane_number(fb);
+
+	for (i = 0; i < num_planes; i++) {
+		struct vs_gem_object *vs_obj;
+
+		vs_obj = vs_fb_get_gem_obj(fb, i);
+		vs_plane->dma_addr[i] = vs_obj->iova + fb->offsets[i];
+	}
+
+	plane_state->status.src = drm_plane_state_src(new_state);
+	plane_state->status.dest = drm_plane_state_dest(new_state);
+
+	vs_plane->funcs->update(vs_crtc->dev, vs_plane, plane, state);
+}
+
+static void vs_plane_atomic_disable(struct drm_plane *plane,
+				    struct drm_atomic_state *state)
+{
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
+										   plane);
+	struct vs_plane *vs_plane = to_vs_plane(plane);
+	struct vs_crtc *vs_crtc = to_vs_crtc(old_state->crtc);
+
+	vs_plane->funcs->disable(vs_crtc->dev, vs_plane, old_state);
+}
+
+const struct drm_plane_helper_funcs vs_plane_helper_funcs = {
+	.atomic_check	= vs_plane_atomic_check,
+	.atomic_update	= vs_plane_atomic_update,
+	.atomic_disable = vs_plane_atomic_disable,
+};
+
+static const struct drm_prop_enum_list vs_degamma_mode_enum_list[] = {
+	{ VS_DEGAMMA_DISABLE,	"disabled" },
+	{ VS_DEGAMMA_BT709, "preset degamma for BT709" },
+	{ VS_DEGAMMA_BT2020,	"preset degamma for BT2020" },
+};
+
+struct vs_plane *vs_plane_create(struct drm_device *drm_dev,
+				 struct vs_plane_info *info,
+				 unsigned int layer_num,
+				 unsigned int possible_crtcs)
+{
+	struct vs_plane *plane;
+	int ret;
+
+	if (!info)
+		return NULL;
+
+	plane = kzalloc(sizeof(*plane), GFP_KERNEL);
+	if (!plane)
+		return NULL;
+
+	ret = drm_universal_plane_init(drm_dev, &plane->base, possible_crtcs,
+				       &vs_plane_funcs, info->formats,
+				       info->num_formats, info->modifiers, info->type,
+				       info->name ? info->name : NULL);
+	if (ret)
+		goto err_free_plane;
+
+	drm_plane_helper_add(&plane->base, &vs_plane_helper_funcs);
+
+	/* Set up the plane properties */
+	if (info->degamma_size) {
+		plane->degamma_mode =
+		drm_property_create_enum(drm_dev, 0,
+					 "DEGAMMA_MODE",
+					 vs_degamma_mode_enum_list,
+					 ARRAY_SIZE(vs_degamma_mode_enum_list));
+
+		if (!plane->degamma_mode)
+			goto error_cleanup_plane;
+
+		drm_object_attach_property(&plane->base.base,
+					   plane->degamma_mode,
+					   VS_DEGAMMA_DISABLE);
+	}
+
+	if (info->rotation) {
+		ret = drm_plane_create_rotation_property(&plane->base,
+							 DRM_MODE_ROTATE_0,
+							 info->rotation);
+		if (ret)
+			goto error_cleanup_plane;
+	}
+
+	if (info->blend_mode) {
+		ret = drm_plane_create_blend_mode_property(&plane->base,
+							   info->blend_mode);
+		if (ret)
+			goto error_cleanup_plane;
+		ret = drm_plane_create_alpha_property(&plane->base);
+		if (ret)
+			goto error_cleanup_plane;
+	}
+
+	if (info->color_encoding) {
+		ret = drm_plane_create_color_properties(&plane->base,
+							info->color_encoding,
+							BIT(DRM_COLOR_YCBCR_LIMITED_RANGE),
+							DRM_COLOR_YCBCR_BT709,
+							DRM_COLOR_YCBCR_LIMITED_RANGE);
+		if (ret)
+			goto error_cleanup_plane;
+	}
+
+	if (info->zpos != 255) {
+		ret = drm_plane_create_zpos_property(&plane->base, info->zpos, 0,
+						     layer_num - 1);
+		if (ret)
+			goto error_cleanup_plane;
+	} else {
+		ret = drm_plane_create_zpos_immutable_property(&plane->base,
+							       info->zpos);
+		if (ret)
+			goto error_cleanup_plane;
+	}
+
+	if (info->watermark) {
+		plane->watermark_prop = drm_property_create(drm_dev, DRM_MODE_PROP_BLOB,
+							    "WATERMARK", 0);
+		if (!plane->watermark_prop)
+			goto error_cleanup_plane;
+
+		drm_object_attach_property(&plane->base.base, plane->watermark_prop, 0);
+	}
+
+	if (info->color_mgmt) {
+		plane->color_mgmt_prop = drm_property_create(drm_dev, DRM_MODE_PROP_BLOB,
+							     "COLOR_CONFIG", 0);
+		if (!plane->color_mgmt_prop)
+			goto error_cleanup_plane;
+
+		drm_object_attach_property(&plane->base.base, plane->color_mgmt_prop, 0);
+	}
+
+	if (info->roi) {
+		plane->roi_prop = drm_property_create(drm_dev, DRM_MODE_PROP_BLOB,
+						      "ROI", 0);
+		if (!plane->roi_prop)
+			goto error_cleanup_plane;
+
+		drm_object_attach_property(&plane->base.base, plane->roi_prop, 0);
+	}
+
+	return plane;
+
+error_cleanup_plane:
+	drm_plane_cleanup(&plane->base);
+err_free_plane:
+	kfree(plane);
+	return NULL;
+}
diff --git a/drivers/gpu/drm/verisilicon/vs_plane.h b/drivers/gpu/drm/verisilicon/vs_plane.h
new file mode 100644
index 000000000000..76ef3c3de045
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_plane.h
@@ -0,0 +1,74 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
+ */
+
+#ifndef __VS_PLANE_H__
+#define __VS_PLANE_H__
+
+#include <drm/drm_fourcc.h>
+#include <drm/drm_plane_helper.h>
+
+#include "vs_fb.h"
+#include "vs_type.h"
+
+struct vs_plane;
+
+struct vs_plane_funcs {
+	void (*update)(struct device *dev, struct vs_plane *plane, struct drm_plane *drm_plane,
+		       struct drm_atomic_state *state);
+	void (*disable)(struct device *dev, struct vs_plane *plane,
+			struct drm_plane_state *old_state);
+	int (*check)(struct device *dev, struct drm_plane *plane,
+		     struct drm_atomic_state *state);
+};
+
+struct vs_plane_status {
+	u32 tile_mode;
+	struct drm_rect src;
+	struct drm_rect dest;
+};
+
+struct vs_plane_state {
+	struct drm_plane_state base;
+	struct vs_plane_status status; /* for debugfs */
+
+	struct drm_property_blob *watermark;
+	struct drm_property_blob *color_mgmt;
+	struct drm_property_blob *roi;
+
+	u32 degamma;
+	bool degamma_changed;
+};
+
+struct vs_plane {
+	struct drm_plane base;
+	u8 id;
+	dma_addr_t dma_addr[MAX_NUM_PLANES];
+
+	struct drm_property *degamma_mode;
+	struct drm_property *watermark_prop;
+	struct drm_property *color_mgmt_prop;
+	struct drm_property *roi_prop;
+
+	const struct vs_plane_funcs *funcs;
+};
+
+void vs_plane_destory(struct drm_plane *plane);
+
+struct vs_plane *vs_plane_create(struct drm_device *drm_dev,
+				 struct vs_plane_info *info,
+				 unsigned int layer_num,
+				 unsigned int possible_crtcs);
+
+static inline struct vs_plane *to_vs_plane(struct drm_plane *plane)
+{
+	return container_of(plane, struct vs_plane, base);
+}
+
+static inline struct vs_plane_state *
+to_vs_plane_state(struct drm_plane_state *state)
+{
+	return container_of(state, struct vs_plane_state, base);
+}
+#endif /* __VS_PLANE_H__ */
-- 
2.34.1

