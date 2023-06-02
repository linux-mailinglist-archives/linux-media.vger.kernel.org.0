Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A11A171FB3D
	for <lists+linux-media@lfdr.de>; Fri,  2 Jun 2023 09:42:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234507AbjFBHlt convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 2 Jun 2023 03:41:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234453AbjFBHlS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jun 2023 03:41:18 -0400
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1C761B1;
        Fri,  2 Jun 2023 00:40:59 -0700 (PDT)
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
        (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
        by ex01.ufhost.com (Postfix) with ESMTP id 6144B24E295;
        Fri,  2 Jun 2023 15:40:50 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 2 Jun
 2023 15:40:50 +0800
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
Subject: [PATCH 8/9] drm/verisilicon: Add verisilicon dc controller driver
Date:   Fri, 2 Jun 2023 15:40:42 +0800
Message-ID: <20230602074043.33872-9-keith.zhao@starfivetech.com>
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

Add DC8200 display controller driver for StarFive JH7110 SoC.

Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
---
 drivers/gpu/drm/verisilicon/Makefile   |    4 +-
 drivers/gpu/drm/verisilicon/vs_dc.c    | 1040 ++++++++++++
 drivers/gpu/drm/verisilicon/vs_dc.h    |   62 +
 drivers/gpu/drm/verisilicon/vs_dc_hw.c | 2008 ++++++++++++++++++++++++
 drivers/gpu/drm/verisilicon/vs_dc_hw.h |  496 ++++++
 drivers/gpu/drm/verisilicon/vs_drv.c   |    2 +
 6 files changed, 3611 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc_hw.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc_hw.h

diff --git a/drivers/gpu/drm/verisilicon/Makefile b/drivers/gpu/drm/verisilicon/Makefile
index d96ad9399fc7..0ed25b5e3062 100644
--- a/drivers/gpu/drm/verisilicon/Makefile
+++ b/drivers/gpu/drm/verisilicon/Makefile
@@ -1,7 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
 
-vs_drm-objs := vs_drv.o \
+vs_drm-objs := vs_dc_hw.o \
+		vs_dc.o \
 		vs_crtc.o \
+		vs_drv.o \
 		vs_fb.o \
 		vs_gem.o \
 		vs_plane.o
diff --git a/drivers/gpu/drm/verisilicon/vs_dc.c b/drivers/gpu/drm/verisilicon/vs_dc.c
new file mode 100644
index 000000000000..a512aaa57f2f
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_dc.c
@@ -0,0 +1,1040 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
+ */
+
+#include <linux/component.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/media-bus-format.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_blend.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_vblank.h>
+#include <drm/vs_drm.h>
+
+#include "vs_crtc.h"
+#include "vs_dc_hw.h"
+#include "vs_dc.h"
+#include "vs_drv.h"
+#include "vs_type.h"
+
+static const char * const vout_clocks[] = {
+	"clk_vout_noc_disp",
+	"clk_vout_pix0",
+	"clk_vout_pix1",
+	"clk_vout_axi",
+	"clk_vout_core",
+	"clk_vout_vout_ahb",
+	"hdmitx0_pixel",
+	"clk_vout_dc8200",
+
+};
+
+static const char * const vout_resets[] = {
+	"rst_vout_axi",
+	"rst_vout_ahb",
+	"rst_vout_core",
+};
+
+static inline void update_format(u32 format, u64 mod, struct dc_hw_fb *fb)
+{
+	u8 f = FORMAT_A8R8G8B8;
+
+	switch (format) {
+	case DRM_FORMAT_XRGB4444:
+	case DRM_FORMAT_RGBX4444:
+	case DRM_FORMAT_XBGR4444:
+	case DRM_FORMAT_BGRX4444:
+		f = FORMAT_X4R4G4B4;
+		break;
+	case DRM_FORMAT_ARGB4444:
+	case DRM_FORMAT_RGBA4444:
+	case DRM_FORMAT_ABGR4444:
+	case DRM_FORMAT_BGRA4444:
+		f = FORMAT_A4R4G4B4;
+		break;
+	case DRM_FORMAT_XRGB1555:
+	case DRM_FORMAT_RGBX5551:
+	case DRM_FORMAT_XBGR1555:
+	case DRM_FORMAT_BGRX5551:
+		f = FORMAT_X1R5G5B5;
+		break;
+	case DRM_FORMAT_ARGB1555:
+	case DRM_FORMAT_RGBA5551:
+	case DRM_FORMAT_ABGR1555:
+	case DRM_FORMAT_BGRA5551:
+		f = FORMAT_A1R5G5B5;
+		break;
+	case DRM_FORMAT_RGB565:
+	case DRM_FORMAT_BGR565:
+		f = FORMAT_R5G6B5;
+		break;
+	case DRM_FORMAT_XRGB8888:
+	case DRM_FORMAT_RGBX8888:
+	case DRM_FORMAT_XBGR8888:
+	case DRM_FORMAT_BGRX8888:
+		f = FORMAT_X8R8G8B8;
+		break;
+	case DRM_FORMAT_ARGB8888:
+	case DRM_FORMAT_RGBA8888:
+	case DRM_FORMAT_ABGR8888:
+	case DRM_FORMAT_BGRA8888:
+		f = FORMAT_A8R8G8B8;
+		break;
+	case DRM_FORMAT_YUYV:
+	case DRM_FORMAT_YVYU:
+		f = FORMAT_YUY2;
+		break;
+	case DRM_FORMAT_UYVY:
+	case DRM_FORMAT_VYUY:
+		f = FORMAT_UYVY;
+		break;
+	case DRM_FORMAT_YUV420:
+	case DRM_FORMAT_YVU420:
+		f = FORMAT_YV12;
+		break;
+	case DRM_FORMAT_NV21:
+		f = FORMAT_NV12;
+		break;
+	case DRM_FORMAT_NV16:
+	case DRM_FORMAT_NV61:
+		f = FORMAT_NV16;
+		break;
+	case DRM_FORMAT_P010:
+		f = FORMAT_P010;
+		break;
+	case DRM_FORMAT_ARGB2101010:
+	case DRM_FORMAT_RGBA1010102:
+	case DRM_FORMAT_ABGR2101010:
+	case DRM_FORMAT_BGRA1010102:
+		f = FORMAT_A2R10G10B10;
+		break;
+	case DRM_FORMAT_NV12:
+		if (fourcc_mod_vs_get_type(mod) ==
+			DRM_FORMAT_MOD_VS_TYPE_CUSTOM_10BIT)
+			f = FORMAT_NV12_10BIT;
+		else
+			f = FORMAT_NV12;
+		break;
+	case DRM_FORMAT_YUV444:
+		if (fourcc_mod_vs_get_type(mod) ==
+			DRM_FORMAT_MOD_VS_TYPE_CUSTOM_10BIT)
+			f = FORMAT_YUV444_10BIT;
+		else
+			f = FORMAT_YUV444;
+		break;
+	default:
+		break;
+	}
+
+	fb->format = f;
+}
+
+static inline void update_swizzle(u32 format, struct dc_hw_fb *fb)
+{
+	fb->swizzle = SWIZZLE_ARGB;
+	fb->uv_swizzle = 0;
+
+	switch (format) {
+	case DRM_FORMAT_RGBX4444:
+	case DRM_FORMAT_RGBA4444:
+	case DRM_FORMAT_RGBX5551:
+	case DRM_FORMAT_RGBA5551:
+	case DRM_FORMAT_RGBX8888:
+	case DRM_FORMAT_RGBA8888:
+	case DRM_FORMAT_RGBA1010102:
+		fb->swizzle = SWIZZLE_RGBA;
+		break;
+	case DRM_FORMAT_XBGR4444:
+	case DRM_FORMAT_ABGR4444:
+	case DRM_FORMAT_XBGR1555:
+	case DRM_FORMAT_ABGR1555:
+	case DRM_FORMAT_BGR565:
+	case DRM_FORMAT_XBGR8888:
+	case DRM_FORMAT_ABGR8888:
+	case DRM_FORMAT_ABGR2101010:
+		fb->swizzle = SWIZZLE_ABGR;
+		break;
+	case DRM_FORMAT_BGRX4444:
+	case DRM_FORMAT_BGRA4444:
+	case DRM_FORMAT_BGRX5551:
+	case DRM_FORMAT_BGRA5551:
+	case DRM_FORMAT_BGRX8888:
+	case DRM_FORMAT_BGRA8888:
+	case DRM_FORMAT_BGRA1010102:
+		fb->swizzle = SWIZZLE_BGRA;
+		break;
+	case DRM_FORMAT_YVYU:
+	case DRM_FORMAT_VYUY:
+	case DRM_FORMAT_NV21:
+	case DRM_FORMAT_NV61:
+		fb->uv_swizzle = 1;
+		break;
+	default:
+		break;
+	}
+}
+
+static inline void update_watermark(struct drm_property_blob *watermark,
+				    struct dc_hw_fb *fb)
+{
+	struct drm_vs_watermark *data;
+
+	fb->water_mark = 0;
+
+	if (watermark) {
+		data = watermark->data;
+		fb->water_mark = data->watermark & 0xFFFFF;
+	}
+}
+
+static inline u8 to_vs_rotation(unsigned int rotation)
+{
+	u8 rot;
+
+	switch (rotation & DRM_MODE_REFLECT_MASK) {
+	case DRM_MODE_REFLECT_X:
+		rot = FLIP_X;
+		return rot;
+	case DRM_MODE_REFLECT_Y:
+		rot = FLIP_Y;
+		return rot;
+	case DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y:
+		rot = FLIP_XY;
+		return rot;
+	default:
+		break;
+	}
+
+	switch (rotation & DRM_MODE_ROTATE_MASK) {
+	case DRM_MODE_ROTATE_0:
+		rot = ROT_0;
+		break;
+	case DRM_MODE_ROTATE_90:
+		rot = ROT_90;
+		break;
+	case DRM_MODE_ROTATE_180:
+		rot = ROT_180;
+		break;
+	case DRM_MODE_ROTATE_270:
+		rot = ROT_270;
+		break;
+	default:
+		rot = ROT_0;
+		break;
+	}
+
+	return rot;
+}
+
+static inline u8 to_vs_yuv_color_space(u32 color_space)
+{
+	u8 cs;
+
+	switch (color_space) {
+	case DRM_COLOR_YCBCR_BT601:
+		cs = COLOR_SPACE_601;
+		break;
+	case DRM_COLOR_YCBCR_BT709:
+		cs = COLOR_SPACE_709;
+		break;
+	case DRM_COLOR_YCBCR_BT2020:
+		cs = COLOR_SPACE_2020;
+		break;
+	default:
+		cs = COLOR_SPACE_601;
+		break;
+	}
+
+	return cs;
+}
+
+static inline u8 to_vs_tile_mode(u64 modifier)
+{
+	return (u8)(modifier & DRM_FORMAT_MOD_VS_NORM_MODE_MASK);
+}
+
+static inline u8 to_vs_display_id(struct vs_dc *dc, struct drm_crtc *crtc)
+{
+	u8 panel_num = dc->hw.info->panel_num;
+	u32 index = drm_crtc_index(crtc);
+	int i;
+
+	for (i = 0; i < panel_num; i++) {
+		if (index == dc->crtc[i]->base.index)
+			return i;
+	}
+
+	return 0;
+}
+
+static int plda_clk_rst_init(struct device *dev)
+{
+	int ret = 0;
+	struct vs_dc *dc = dev_get_drvdata(dev);
+
+	ret = clk_bulk_prepare_enable(dc->nclks, dc->clk_vout);
+	if (ret) {
+		dev_err(dev, "failed to enable clocks\n");
+		return ret;
+	}
+
+	ret = reset_control_bulk_deassert(dc->nrsts, dc->rst_vout);
+	return ret;
+}
+
+static void plda_clk_rst_deinit(struct device *dev)
+{
+	struct vs_dc *dc = dev_get_drvdata(dev);
+
+	reset_control_bulk_assert(dc->nrsts, dc->rst_vout);
+	clk_bulk_disable_unprepare(dc->nclks, dc->clk_vout);
+}
+
+static void dc_deinit(struct device *dev)
+{
+	struct vs_dc *dc = dev_get_drvdata(dev);
+
+	dc_hw_enable_interrupt(&dc->hw, 0);
+	dc_hw_deinit(&dc->hw);
+	plda_clk_rst_deinit(dev);
+}
+
+static int dc_init(struct device *dev)
+{
+	struct vs_dc *dc = dev_get_drvdata(dev);
+	int ret;
+
+	dc->first_frame = true;
+
+	ret = plda_clk_rst_init(dev);
+	if (ret < 0) {
+		dev_err(dev, "failed to init dc clk reset: %d\n", ret);
+		return ret;
+	}
+
+	ret = dc_hw_init(&dc->hw);
+	if (ret) {
+		dev_err(dev, "failed to init DC HW\n");
+		return ret;
+	}
+	return 0;
+}
+
+static void vs_dc_enable(struct device *dev, struct drm_crtc *crtc)
+{
+	struct vs_dc *dc = dev_get_drvdata(dev);
+	struct vs_crtc_state *crtc_state = to_vs_crtc_state(crtc->state);
+	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
+	struct dc_hw_display display;
+
+	display.bus_format = crtc_state->output_fmt;
+	display.h_active = mode->hdisplay;
+	display.h_total = mode->htotal;
+	display.h_sync_start = mode->hsync_start;
+	display.h_sync_end = mode->hsync_end;
+	if (mode->flags & DRM_MODE_FLAG_PHSYNC)
+		display.h_sync_polarity = true;
+	else
+		display.h_sync_polarity = false;
+
+	display.v_active = mode->vdisplay;
+	display.v_total = mode->vtotal;
+	display.v_sync_start = mode->vsync_start;
+	display.v_sync_end = mode->vsync_end;
+
+	if (mode->flags & DRM_MODE_FLAG_PVSYNC)
+		display.v_sync_polarity = true;
+	else
+		display.v_sync_polarity = false;
+
+	display.sync_mode = crtc_state->sync_mode;
+	display.bg_color = crtc_state->bg_color;
+
+	display.id = to_vs_display_id(dc, crtc);
+	display.sync_enable = crtc_state->sync_enable;
+	display.dither_enable = crtc_state->dither_enable;
+
+	display.enable = true;
+
+	if (crtc_state->encoder_type == DRM_MODE_ENCODER_DSI) {
+		dc_hw_set_out(&dc->hw, OUT_DPI, display.id);
+		clk_set_rate(dc->clk_vout[CLK_VOUT_SOC_PIX].clk, mode->clock * 1000);
+		clk_set_parent(dc->clk_vout[CLK_VOUT_PIX1].clk,
+			       dc->clk_vout[CLK_VOUT_SOC_PIX].clk);
+	} else {
+		dc_hw_set_out(&dc->hw, OUT_DP, display.id);
+		clk_set_parent(dc->clk_vout[CLK_VOUT_PIX0].clk,
+			       dc->clk_vout[CLK_VOUT_HDMI_PIX].clk);
+	}
+
+	dc_hw_setup_display(&dc->hw, &display);
+}
+
+static void vs_dc_disable(struct device *dev, struct drm_crtc *crtc)
+{
+	struct vs_dc *dc = dev_get_drvdata(dev);
+	struct dc_hw_display display;
+
+	display.id = to_vs_display_id(dc, crtc);
+	display.enable = false;
+
+	dc_hw_setup_display(&dc->hw, &display);
+}
+
+static bool vs_dc_mode_fixup(struct device *dev,
+			     const struct drm_display_mode *mode,
+			     struct drm_display_mode *adjusted_mode)
+{
+	return true;
+}
+
+static void vs_dc_set_gamma(struct device *dev, struct drm_crtc *crtc,
+			    struct drm_color_lut *lut, unsigned int size)
+{
+	struct vs_dc *dc = dev_get_drvdata(dev);
+	u16 i, r, g, b;
+	u8 bits, id;
+
+	if (size != dc->hw.info->gamma_size) {
+		dev_err(dev, "gamma size does not match!\n");
+		return;
+	}
+
+	id = to_vs_display_id(dc, crtc);
+
+	bits = dc->hw.info->gamma_bits;
+	for (i = 0; i < size; i++) {
+		r = drm_color_lut_extract(lut[i].red, bits);
+		g = drm_color_lut_extract(lut[i].green, bits);
+		b = drm_color_lut_extract(lut[i].blue, bits);
+		dc_hw_update_gamma(&dc->hw, id, i, r, g, b);
+	}
+}
+
+static void vs_dc_enable_gamma(struct device *dev, struct drm_crtc *crtc,
+			       bool enable)
+{
+	struct vs_dc *dc = dev_get_drvdata(dev);
+	u8 id;
+
+	id = to_vs_display_id(dc, crtc);
+	dc_hw_enable_gamma(&dc->hw, id, enable);
+}
+
+static void vs_dc_enable_vblank(struct device *dev, bool enable)
+{
+	struct vs_dc *dc = dev_get_drvdata(dev);
+
+	dc_hw_enable_interrupt(&dc->hw, enable);
+}
+
+static u32 calc_factor(u32 src, u32 dest)
+{
+	u32 factor = 1 << 16;
+
+	if (src > 1 && dest > 1)
+		factor = ((src - 1) << 16) / (dest - 1);
+
+	return factor;
+}
+
+static void update_scale(struct drm_plane_state *state, struct dc_hw_roi *roi,
+			 struct dc_hw_scale *scale)
+{
+	int dst_w = drm_rect_width(&state->dst);
+	int dst_h = drm_rect_height(&state->dst);
+	int src_w, src_h, temp;
+
+	scale->enable = false;
+
+	if (roi->enable) {
+		src_w = roi->width;
+		src_h = roi->height;
+	} else {
+		src_w = drm_rect_width(&state->src) >> 16;
+		src_h = drm_rect_height(&state->src) >> 16;
+	}
+
+	if (drm_rotation_90_or_270(state->rotation)) {
+		temp = src_w;
+		src_w = src_h;
+		src_h = temp;
+	}
+
+	if (src_w != dst_w) {
+		scale->scale_factor_x = calc_factor(src_w, dst_w);
+		scale->enable = true;
+	} else {
+		scale->scale_factor_x = 1 << 16;
+	}
+	if (src_h != dst_h) {
+		scale->scale_factor_y = calc_factor(src_h, dst_h);
+		scale->enable = true;
+	} else {
+		scale->scale_factor_y = 1 << 16;
+	}
+}
+
+static void update_fb(struct vs_plane *plane, u8 display_id,
+		      struct dc_hw_fb *fb, struct drm_plane_state *state)
+{
+	struct vs_plane_state *plane_state = to_vs_plane_state(state);
+	struct drm_framebuffer *drm_fb = state->fb;
+	struct drm_rect *src = &state->src;
+
+	fb->display_id = display_id;
+	fb->y_address = plane->dma_addr[0];
+	fb->y_stride = drm_fb->pitches[0];
+	if (drm_fb->format->format == DRM_FORMAT_YVU420) {
+		fb->u_address = plane->dma_addr[2];
+		fb->v_address = plane->dma_addr[1];
+		fb->u_stride = drm_fb->pitches[2];
+		fb->v_stride = drm_fb->pitches[1];
+	} else {
+		fb->u_address = plane->dma_addr[1];
+		fb->v_address = plane->dma_addr[2];
+		fb->u_stride = drm_fb->pitches[1];
+		fb->v_stride = drm_fb->pitches[2];
+	}
+	fb->width = drm_rect_width(src) >> 16;
+	fb->height = drm_rect_height(src) >> 16;
+	fb->tile_mode = to_vs_tile_mode(drm_fb->modifier);
+	fb->rotation = to_vs_rotation(state->rotation);
+	fb->yuv_color_space = to_vs_yuv_color_space(state->color_encoding);
+	fb->zpos = state->zpos;
+	fb->enable = state->visible;
+	update_format(drm_fb->format->format, drm_fb->modifier, fb);
+	update_swizzle(drm_fb->format->format, fb);
+	update_watermark(plane_state->watermark, fb);
+	plane_state->status.tile_mode = fb->tile_mode;
+}
+
+static void update_degamma(struct vs_dc *dc, struct vs_plane *plane,
+			   struct vs_plane_state *plane_state)
+{
+	dc_hw_update_degamma(&dc->hw, plane->id, plane_state->degamma);
+	plane_state->degamma_changed = false;
+}
+
+static void update_roi(struct vs_dc *dc, u8 id,
+		       struct vs_plane_state *plane_state,
+		       struct dc_hw_roi *roi,
+		       struct drm_plane_state *state)
+{
+	struct drm_vs_roi *data;
+	struct drm_rect *src = &state->src;
+	u16 src_w = drm_rect_width(src) >> 16;
+	u16 src_h = drm_rect_height(src) >> 16;
+
+	if (plane_state->roi) {
+		data = plane_state->roi->data;
+
+		if (data->enable) {
+			roi->x = data->roi_x;
+			roi->y = data->roi_y;
+			roi->width = (data->roi_x + data->roi_w > src_w) ?
+						 (src_w - data->roi_x) : data->roi_w;
+			roi->height = (data->roi_y + data->roi_h > src_h) ?
+						  (src_h - data->roi_y) : data->roi_h;
+			roi->enable = true;
+		} else {
+			roi->enable = false;
+		}
+
+		dc_hw_update_roi(&dc->hw, id, roi);
+	} else {
+		roi->enable = false;
+	}
+}
+
+static void update_color_mgmt(struct vs_dc *dc, u8 id,
+			      struct dc_hw_fb *fb,
+			      struct vs_plane_state *plane_state)
+{
+	struct drm_vs_color_mgmt *data;
+	struct dc_hw_colorkey colorkey;
+
+	if (plane_state->color_mgmt) {
+		data = plane_state->color_mgmt->data;
+
+		fb->clear_enable = data->clear_enable;
+		fb->clear_value = data->clear_value;
+
+		if (data->colorkey > data->colorkey_high)
+			data->colorkey = data->colorkey_high;
+
+		colorkey.colorkey = data->colorkey;
+		colorkey.colorkey_high = data->colorkey_high;
+		colorkey.transparency = (data->transparency) ?
+				DC_TRANSPARENCY_KEY : DC_TRANSPARENCY_OPAQUE;
+		dc_hw_update_colorkey(&dc->hw, id, &colorkey);
+	}
+}
+
+static void update_plane(struct vs_dc *dc, struct vs_plane *plane,
+			 struct drm_plane *drm_plane,
+			 struct drm_atomic_state *drm_state)
+{
+	struct dc_hw_fb fb = {0};
+	struct dc_hw_scale scale;
+	struct dc_hw_position pos;
+	struct dc_hw_blend blend;
+	struct dc_hw_roi roi;
+	struct drm_plane_state *state = drm_atomic_get_new_plane_state(drm_state,
+									   drm_plane);
+	struct vs_plane_state *plane_state = to_vs_plane_state(state);
+	struct drm_rect *dest = &state->dst;
+	bool dec_enable = false;
+	u8 display_id = 0;
+
+	display_id = to_vs_display_id(dc, state->crtc);
+	update_fb(plane, display_id, &fb, state);
+	fb.dec_enable = dec_enable;
+
+	update_roi(dc, plane->id, plane_state, &roi, state);
+
+	update_scale(state, &roi, &scale);
+
+	if (plane_state->degamma_changed)
+		update_degamma(dc, plane, plane_state);
+
+	pos.start_x = dest->x1;
+	pos.start_y = dest->y1;
+	pos.end_x = dest->x2;
+	pos.end_y = dest->y2;
+
+	blend.alpha = (u8)(state->alpha >> 8);
+	blend.blend_mode = (u8)(state->pixel_blend_mode);
+
+	update_color_mgmt(dc, plane->id, &fb, plane_state);
+
+	dc_hw_update_plane(&dc->hw, plane->id, &fb, &scale, &pos, &blend);
+}
+
+static void update_qos(struct vs_dc *dc, struct vs_plane *plane,
+		       struct drm_plane *drm_plane,
+		       struct drm_atomic_state *drm_state)
+{
+	struct drm_plane_state *state = drm_atomic_get_new_plane_state(drm_state,
+									   drm_plane);
+	struct vs_plane_state *plane_state = to_vs_plane_state(state);
+	struct drm_vs_watermark *data;
+	struct dc_hw_qos qos;
+
+	if (plane_state->watermark) {
+		data = plane_state->watermark->data;
+
+		if (data->qos_high) {
+			if (data->qos_low > data->qos_high)
+				data->qos_low = data->qos_high;
+
+			qos.low_value = data->qos_low & 0x0F;
+			qos.high_value = data->qos_high & 0x0F;
+			dc_hw_update_qos(&dc->hw, &qos);
+		}
+	}
+}
+
+static void update_cursor_size(struct drm_plane_state *state, struct dc_hw_cursor *cursor)
+{
+	u8 size_type;
+
+	switch (state->crtc_w) {
+	case 32:
+		size_type = CURSOR_SIZE_32X32;
+		break;
+	case 64:
+		size_type = CURSOR_SIZE_64X64;
+		break;
+	default:
+		size_type = CURSOR_SIZE_32X32;
+		break;
+	}
+
+	cursor->size = size_type;
+}
+
+static void update_cursor_plane(struct vs_dc *dc, struct vs_plane *plane,
+				struct drm_plane *drm_plane,
+				struct drm_atomic_state *drm_state)
+{
+	struct drm_plane_state *state = drm_atomic_get_new_plane_state(drm_state,
+								       drm_plane);
+	struct drm_framebuffer *drm_fb = state->fb;
+	struct dc_hw_cursor cursor;
+
+	cursor.address = plane->dma_addr[0];
+	cursor.x = state->crtc_x;
+	cursor.y = state->crtc_y;
+	cursor.hot_x = drm_fb->hot_x;
+	cursor.hot_y = drm_fb->hot_y;
+	cursor.display_id = to_vs_display_id(dc, state->crtc);
+	update_cursor_size(state, &cursor);
+	cursor.enable = true;
+
+	dc_hw_update_cursor(&dc->hw, cursor.display_id, &cursor);
+}
+
+static void vs_dc_update_plane(struct device *dev, struct vs_plane *plane,
+			       struct drm_plane *drm_plane,
+			       struct drm_atomic_state *drm_state)
+{
+	struct vs_dc *dc = dev_get_drvdata(dev);
+	enum drm_plane_type type = plane->base.type;
+
+	switch (type) {
+	case DRM_PLANE_TYPE_PRIMARY:
+	case DRM_PLANE_TYPE_OVERLAY:
+		update_plane(dc, plane, drm_plane, drm_state);
+		update_qos(dc, plane, drm_plane, drm_state);
+		break;
+	case DRM_PLANE_TYPE_CURSOR:
+		update_cursor_plane(dc, plane, drm_plane, drm_state);
+		break;
+	default:
+		break;
+	}
+}
+
+static void vs_dc_disable_plane(struct device *dev, struct vs_plane *plane,
+				struct drm_plane_state *old_state)
+{
+	struct vs_dc *dc = dev_get_drvdata(dev);
+	enum drm_plane_type type = plane->base.type;
+	struct dc_hw_fb fb = {0};
+	struct dc_hw_cursor cursor = {0};
+
+	switch (type) {
+	case DRM_PLANE_TYPE_PRIMARY:
+	case DRM_PLANE_TYPE_OVERLAY:
+		fb.enable = false;
+		dc_hw_update_plane(&dc->hw, plane->id, &fb, NULL, NULL, NULL);
+		break;
+
+	case DRM_PLANE_TYPE_CURSOR:
+		cursor.enable = false;
+		cursor.display_id = to_vs_display_id(dc, old_state->crtc);
+		dc_hw_update_cursor(&dc->hw, cursor.display_id, &cursor);
+		break;
+	default:
+		break;
+	}
+}
+
+static bool vs_dc_mod_supported(const struct vs_plane_info *plane_info,
+				u64 modifier)
+{
+	const u64 *mods;
+
+	if (!plane_info->modifiers)
+		return false;
+
+	for (mods = plane_info->modifiers; *mods != DRM_FORMAT_MOD_INVALID; mods++) {
+		if (*mods == modifier)
+			return true;
+	}
+
+	return false;
+}
+
+static int vs_dc_check_plane(struct device *dev, struct drm_plane *plane,
+			     struct drm_atomic_state *state)
+{
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 plane);
+	struct vs_dc *dc = dev_get_drvdata(dev);
+	struct drm_framebuffer *fb = new_plane_state->fb;
+	const struct vs_plane_info *plane_info;
+	struct drm_crtc *crtc = new_plane_state->crtc;
+	struct drm_crtc_state *crtc_state;
+	struct vs_plane *vs_plane = to_vs_plane(plane);
+
+	plane_info = &dc->hw.info->planes[vs_plane->id];
+	if (!plane_info)
+		return -EINVAL;
+
+	if (fb->width < plane_info->min_width ||
+	    fb->width > plane_info->max_width ||
+	    fb->height < plane_info->min_height ||
+	    fb->height > plane_info->max_height)
+		dev_err_once(dev, "buffer size may not support on plane%d.\n",
+			     vs_plane->id);
+
+	if (vs_plane->base.type != DRM_PLANE_TYPE_CURSOR &&
+	    (!vs_dc_mod_supported(plane_info, fb->modifier))) {
+		dev_err(dev, "unsupported modifier on plane%d.\n", vs_plane->id);
+		return -EINVAL;
+	}
+
+	crtc_state = drm_atomic_get_existing_crtc_state(state, crtc);
+	if (IS_ERR(crtc_state))
+		return -EINVAL;
+
+	return drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
+						  plane_info->min_scale,
+						  plane_info->max_scale,
+						  true, true);
+}
+
+static irqreturn_t dc_isr(int irq, void *data)
+{
+	struct vs_dc *dc = data;
+	struct vs_dc_info *dc_info = dc->hw.info;
+	u32 i, ret;
+
+	ret = dc_hw_get_interrupt(&dc->hw);
+
+	for (i = 0; i < dc_info->panel_num; i++)
+		vs_crtc_handle_vblank(&dc->crtc[i]->base, dc_hw_check_underflow(&dc->hw));
+
+	return IRQ_HANDLED;
+}
+
+static void vs_dc_commit(struct device *dev)
+{
+	struct vs_dc *dc = dev_get_drvdata(dev);
+
+	dc_hw_enable_shadow_register(&dc->hw, false);
+
+	dc_hw_commit(&dc->hw);
+
+	if (dc->first_frame)
+		dc->first_frame = false;
+
+	dc_hw_enable_shadow_register(&dc->hw, true);
+}
+
+static const struct vs_crtc_funcs dc_crtc_funcs = {
+	.enable			= vs_dc_enable,
+	.disable		= vs_dc_disable,
+	.mode_fixup		= vs_dc_mode_fixup,
+	.set_gamma		= vs_dc_set_gamma,
+	.enable_gamma	= vs_dc_enable_gamma,
+	.enable_vblank	= vs_dc_enable_vblank,
+	.commit			= vs_dc_commit,
+};
+
+static const struct vs_plane_funcs dc_plane_funcs = {
+	.update			= vs_dc_update_plane,
+	.disable		= vs_dc_disable_plane,
+	.check			= vs_dc_check_plane,
+};
+
+static int dc_bind(struct device *dev, struct device *master, void *data)
+{
+	struct drm_device *drm_dev = data;
+	struct vs_dc *dc = dev_get_drvdata(dev);
+	struct device_node *port;
+	struct vs_crtc *crtc;
+	struct drm_crtc *drm_crtc;
+	struct vs_dc_info *dc_info;
+	struct vs_plane *plane;
+	struct drm_plane *drm_plane, *tmp;
+	struct vs_plane_info *plane_info;
+	int i, ret;
+	u32 ctrc_mask = 0;
+
+	if (!drm_dev || !dc) {
+		dev_err(dev, "devices are not created.\n");
+		return -ENODEV;
+	}
+
+	ret = dc_init(dev);
+	if (ret < 0) {
+		dev_err(dev, "Failed to initialize DC hardware.\n");
+		return ret;
+	}
+
+	port = of_get_child_by_name(dev->of_node, "port");
+	if (!port) {
+		dev_err(dev, "no port node found\n");
+		return -ENODEV;
+	}
+	of_node_put(port);
+
+	dc_info = dc->hw.info;
+
+	for (i = 0; i < dc_info->panel_num; i++) {
+		crtc = vs_crtc_create(drm_dev, dc_info);
+		if (!crtc) {
+			dev_err(dev, "Failed to create CRTC.\n");
+			ret = -ENOMEM;
+			return ret;
+		}
+
+		crtc->base.port = port;
+		crtc->dev = dev;
+		crtc->funcs = &dc_crtc_funcs;
+		dc->crtc[i] = crtc;
+		ctrc_mask |= drm_crtc_mask(&crtc->base);
+	}
+
+	for (i = 0; i < dc_info->plane_num; i++) {
+		plane_info = (struct vs_plane_info *)&dc_info->planes[i];
+
+		if (!strcmp(plane_info->name, "Primary") || !strcmp(plane_info->name, "Cursor")) {
+			plane = vs_plane_create(drm_dev, plane_info, dc_info->layer_num,
+						drm_crtc_mask(&dc->crtc[0]->base));
+		} else if (!strcmp(plane_info->name, "Primary_1") ||
+				   !strcmp(plane_info->name, "Cursor_1")) {
+			plane = vs_plane_create(drm_dev, plane_info, dc_info->layer_num,
+						drm_crtc_mask(&dc->crtc[1]->base));
+		} else {
+			plane = vs_plane_create(drm_dev, plane_info,
+						dc_info->layer_num, ctrc_mask);
+		}
+
+		if (!plane)
+			goto err_cleanup_planes;
+
+		plane->id = i;
+		dc->planes[i].id = plane_info->id;
+
+		plane->funcs = &dc_plane_funcs;
+
+		if (plane_info->type == DRM_PLANE_TYPE_PRIMARY) {
+			if (!strcmp(plane_info->name, "Primary"))
+				dc->crtc[0]->base.primary = &plane->base;
+			else
+				dc->crtc[1]->base.primary = &plane->base;
+			drm_dev->mode_config.min_width = plane_info->min_width;
+			drm_dev->mode_config.min_height =
+							plane_info->min_height;
+			drm_dev->mode_config.max_width = plane_info->max_width;
+			drm_dev->mode_config.max_height =
+							plane_info->max_height;
+		}
+
+		if (plane_info->type == DRM_PLANE_TYPE_CURSOR) {
+			if (!strcmp(plane_info->name, "Cursor"))
+				dc->crtc[0]->base.cursor = &plane->base;
+			else
+				dc->crtc[1]->base.cursor = &plane->base;
+			drm_dev->mode_config.cursor_width =
+							plane_info->max_width;
+			drm_dev->mode_config.cursor_height =
+							plane_info->max_height;
+		}
+	}
+
+	vs_drm_update_pitch_alignment(drm_dev, dc_info->pitch_alignment);
+
+	return 0;
+
+err_cleanup_planes:
+	list_for_each_entry_safe(drm_plane, tmp,
+				 &drm_dev->mode_config.plane_list, head)
+		if (drm_plane->possible_crtcs & ctrc_mask)
+			vs_plane_destory(drm_plane);
+
+	drm_for_each_crtc(drm_crtc, drm_dev)
+		vs_crtc_destroy(drm_crtc);
+
+	return ret;
+}
+
+static void dc_unbind(struct device *dev, struct device *master, void *data)
+{
+	dc_deinit(dev);
+}
+
+const struct component_ops dc_component_ops = {
+	.bind = dc_bind,
+	.unbind = dc_unbind,
+};
+
+static const struct of_device_id dc_driver_dt_match[] = {
+	{ .compatible = "verisilicon,dc8200", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, dc_driver_dt_match);
+
+static int dc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct vs_dc *dc;
+	int irq, ret, i;
+
+	dc = devm_kzalloc(dev, sizeof(*dc), GFP_KERNEL);
+	if (!dc)
+		return -ENOMEM;
+
+	dc->hw.hi_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(dc->hw.hi_base))
+		return PTR_ERR(dc->hw.hi_base);
+
+	dc->hw.reg_base = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(dc->hw.reg_base))
+		return PTR_ERR(dc->hw.reg_base);
+
+	dc->dss_reg = devm_platform_ioremap_resource(pdev, 2);
+	if (IS_ERR(dc->dss_reg))
+		return PTR_ERR(dc->dss_reg);
+
+	dc->nclks = ARRAY_SIZE(dc->clk_vout);
+	for (i = 0; i < dc->nclks; ++i)
+		dc->clk_vout[i].id = vout_clocks[i];
+	ret = devm_clk_bulk_get(dev, dc->nclks, dc->clk_vout);
+	if (ret) {
+		dev_err(dev, "Failed to get clk controls\n");
+		return ret;
+	}
+
+	dc->nrsts = ARRAY_SIZE(dc->rst_vout);
+	for (i = 0; i < dc->nrsts; ++i)
+		dc->rst_vout[i].id = vout_resets[i];
+	ret = devm_reset_control_bulk_get_shared(dev, dc->nrsts,
+						 dc->rst_vout);
+	if (ret) {
+		dev_err(dev, "Failed to get reset controls\n");
+		return ret;
+	}
+
+	irq = platform_get_irq(pdev, 0);
+
+	ret = devm_request_irq(dev, irq, dc_isr, 0, dev_name(dev), dc);
+	if (ret < 0) {
+		dev_err(dev, "Failed to install irq:%u.\n", irq);
+		return ret;
+	}
+
+	dev_set_drvdata(dev, dc);
+
+	return component_add(dev, &dc_component_ops);
+}
+
+static int dc_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+
+	component_del(dev, &dc_component_ops);
+
+	dev_set_drvdata(dev, NULL);
+
+	return 0;
+}
+
+struct platform_driver dc_platform_driver = {
+	.probe = dc_probe,
+	.remove = dc_remove,
+	.driver = {
+		.name = "vs-dc",
+		.of_match_table = of_match_ptr(dc_driver_dt_match),
+	},
+};
+
+MODULE_AUTHOR("StarFive Corporation");
+MODULE_AUTHOR("Verisilicon Corporation");
+MODULE_DESCRIPTION("VeriSilicon DC Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/verisilicon/vs_dc.h b/drivers/gpu/drm/verisilicon/vs_dc.h
new file mode 100644
index 000000000000..ab76ac1e9943
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_dc.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
+ */
+
+#ifndef __VS_DC_H__
+#define __VS_DC_H__
+
+#include <linux/clk.h>
+#include <linux/mm_types.h>
+#include <linux/reset.h>
+#include <linux/version.h>
+
+#include <drm/drm_fourcc.h>
+#include <drm/drm_modes.h>
+
+#include "vs_crtc.h"
+#include "vs_dc_hw.h"
+#include "vs_plane.h"
+
+#define fourcc_mod_vs_get_type(val) \
+			(((val) & DRM_FORMAT_MOD_VS_TYPE_MASK) >> 54)
+
+struct vs_dc_plane {
+	enum dc_hw_plane_id id;
+};
+
+enum vout_clk {
+	CLK_VOUT_NOC_DISP = 0,
+	CLK_VOUT_PIX0,
+	CLK_VOUT_PIX1,
+	CLK_VOUT_AXI,
+	CLK_VOUT_CORE,
+	CLK_VOUT_AHB,
+	CLK_VOUT_HDMI_PIX,
+	CLK_VOUT_SOC_PIX,
+	CLK_VOUT_NUM
+};
+
+enum rst_vout {
+	RST_VOUT_AXI = 0,
+	RST_VOUT_AHB,
+	RST_VOUT_CORE,
+	RST_VOUT_NUM
+};
+
+struct vs_dc {
+	struct vs_crtc		*crtc[DC_DISPLAY_NUM];
+	struct dc_hw		hw;
+	void __iomem        *dss_reg;
+	bool			    first_frame;
+
+	struct vs_dc_plane  planes[PLANE_NUM];
+	struct clk_bulk_data clk_vout[CLK_VOUT_NUM];
+	int nclks;
+	struct reset_control_bulk_data rst_vout[RST_VOUT_NUM];
+	int nrsts;
+};
+
+extern struct platform_driver dc_platform_driver;
+
+#endif /* __VS_DC_H__ */
diff --git a/drivers/gpu/drm/verisilicon/vs_dc_hw.c b/drivers/gpu/drm/verisilicon/vs_dc_hw.c
new file mode 100644
index 000000000000..d370dd401084
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_dc_hw.c
@@ -0,0 +1,2008 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
+ */
+
+#include <linux/bits.h>
+#include <linux/io.h>
+#include <linux/media-bus-format.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_blend.h>
+#include <drm/drm_fourcc.h>
+#include <drm/vs_drm.h>
+
+#include "vs_dc_hw.h"
+#include "vs_type.h"
+
+static const u32 horkernel[] = {
+	0x00000000, 0x20000000, 0x00002000, 0x00000000,
+	0x00000000, 0x00000000, 0x23fd1c03, 0x00000000,
+	0x00000000, 0x00000000, 0x181f0000, 0x000027e1,
+	0x00000000, 0x00000000, 0x00000000, 0x2b981468,
+	0x00000000, 0x00000000, 0x00000000, 0x10f00000,
+	0x00002f10, 0x00000000, 0x00000000, 0x00000000,
+	0x32390dc7, 0x00000000, 0x00000000, 0x00000000,
+	0x0af50000, 0x0000350b, 0x00000000, 0x00000000,
+	0x00000000, 0x3781087f, 0x00000000, 0x00000000,
+	0x00000000, 0x06660000, 0x0000399a, 0x00000000,
+	0x00000000, 0x00000000, 0x3b5904a7, 0x00000000,
+	0x00000000, 0x00000000, 0x033c0000, 0x00003cc4,
+	0x00000000, 0x00000000, 0x00000000, 0x3de1021f,
+	0x00000000, 0x00000000, 0x00000000, 0x01470000,
+	0x00003eb9, 0x00000000, 0x00000000, 0x00000000,
+	0x3f5300ad, 0x00000000, 0x00000000, 0x00000000,
+	0x00480000, 0x00003fb8, 0x00000000, 0x00000000,
+	0x00000000, 0x3fef0011, 0x00000000, 0x00000000,
+	0x00000000, 0x00000000, 0x00004000, 0x00000000,
+	0x00000000, 0x00000000, 0x20002000, 0x00000000,
+	0x00000000, 0x00000000, 0x1c030000, 0x000023fd,
+	0x00000000, 0x00000000, 0x00000000, 0x27e1181f,
+	0x00000000, 0x00000000, 0x00000000, 0x14680000,
+	0x00002b98, 0x00000000, 0x00000000, 0x00000000,
+	0x2f1010f0, 0x00000000, 0x00000000, 0x00000000,
+	0x0dc70000, 0x00003239, 0x00000000, 0x00000000,
+	0x00000000, 0x350b0af5, 0x00000000, 0x00000000,
+	0x00000000, 0x087f0000, 0x00003781, 0x00000000,
+	0x00000000, 0x00000000, 0x399a0666, 0x00000000,
+	0x00000000, 0x00000000, 0x04a70000, 0x00003b59,
+	0x00000000, 0x00000000, 0x00000000, 0x3cc4033c,
+	0x00000000, 0x00000000, 0x00000000, 0x021f0000,
+};
+
+#define H_COEF_SIZE (sizeof(horkernel) / sizeof(u32))
+
+static const u32 verkernel[] = {
+	0x00000000, 0x20000000, 0x00002000, 0x00000000,
+	0x00000000, 0x00000000, 0x23fd1c03, 0x00000000,
+	0x00000000, 0x00000000, 0x181f0000, 0x000027e1,
+	0x00000000, 0x00000000, 0x00000000, 0x2b981468,
+	0x00000000, 0x00000000, 0x00000000, 0x10f00000,
+	0x00002f10, 0x00000000, 0x00000000, 0x00000000,
+	0x32390dc7, 0x00000000, 0x00000000, 0x00000000,
+	0x0af50000, 0x0000350b, 0x00000000, 0x00000000,
+	0x00000000, 0x3781087f, 0x00000000, 0x00000000,
+	0x00000000, 0x06660000, 0x0000399a, 0x00000000,
+	0x00000000, 0x00000000, 0x3b5904a7, 0x00000000,
+	0x00000000, 0x00000000, 0x033c0000, 0x00003cc4,
+	0x00000000, 0x00000000, 0x00000000, 0x3de1021f,
+	0x00000000, 0x00000000, 0x00000000, 0x01470000,
+	0x00003eb9, 0x00000000, 0x00000000, 0x00000000,
+	0x3f5300ad, 0x00000000, 0x00000000, 0x00000000,
+	0x00480000, 0x00003fb8, 0x00000000, 0x00000000,
+	0x00000000, 0x3fef0011, 0x00000000, 0x00000000,
+	0x00000000, 0x00000000, 0x00004000, 0x00000000,
+	0xcdcd0000, 0xfdfdfdfd, 0xabababab, 0xabababab,
+	0x00000000, 0x00000000, 0x5ff5f456, 0x000f5f58,
+	0x02cc6c78, 0x02cc0c28, 0xfeeefeee, 0xfeeefeee,
+	0xfeeefeee, 0xfeeefeee, 0xfeeefeee, 0xfeeefeee,
+	0xfeeefeee, 0xfeeefeee, 0xfeeefeee, 0xfeeefeee,
+	0xfeeefeee, 0xfeeefeee, 0xfeeefeee, 0xfeeefeee,
+	0xfeeefeee, 0xfeeefeee, 0xfeeefeee, 0xfeeefeee,
+	0xfeeefeee, 0xfeeefeee, 0xfeeefeee, 0xfeeefeee,
+	0xfeeefeee, 0xfeeefeee, 0xfeeefeee, 0xfeeefeee,
+	0xfeeefeee, 0xfeeefeee, 0xfeeefeee, 0xfeeefeee,
+	0xfeeefeee, 0xfeeefeee, 0xfeeefeee, 0xfeeefeee,
+	0xfeeefeee, 0xfeeefeee, 0xfeeefeee, 0xfeeefeee,
+	0xfeeefeee, 0xfeeefeee, 0xfeeefeee, 0xfeeefeee,
+};
+
+#define V_COEF_SIZE (sizeof(verkernel) / sizeof(u32))
+
+/*
+ * RGB 709->2020 conversion parameters
+ */
+static u16 RGB2RGB[RGB_TO_RGB_TABLE_SIZE] = {
+	10279,	5395,	709,
+	1132,	15065,	187,
+	269,	1442,	14674
+};
+
+/*
+ * YUV601 to RGB conversion parameters
+ * YUV2RGB[0]  - [8] : C0 - C8;
+ * YUV2RGB[9]  - [11]: D0 - D2;
+ * YUV2RGB[12] - [13]: Y clamp min & max calue;
+ * YUV2RGB[14] - [15]: UV clamp min & max calue;
+ */
+static s32 YUV601_2RGB[YUV_TO_RGB_TABLE_SIZE] = {
+	1196,	0,			1640,	1196,
+	-404,	-836,		1196,	2076,
+	0,		-916224,	558336,	-1202944,
+	64,		 940,		64,		960
+};
+
+/*
+ * YUV709 to RGB conversion parameters
+ * YUV2RGB[0]  - [8] : C0 - C8;
+ * YUV2RGB[9]  - [11]: D0 - D2;
+ * YUV2RGB[12] - [13]: Y clamp min & max calue;
+ * YUV2RGB[14] - [15]: UV clamp min & max calue;
+ */
+static s32 YUV709_2RGB[YUV_TO_RGB_TABLE_SIZE] = {
+	1196,		0,		1844,	1196,
+	-220,		-548,	1196,	2172,
+	0,			-1020672, 316672,  -1188608,
+	64,			940,		64,		960
+};
+
+/*
+ * YUV2020 to RGB conversion parameters
+ * YUV2RGB[0]  - [8] : C0 - C8;
+ * YUV2RGB[9]  - [11]: D0 - D2;
+ * YUV2RGB[12] - [13]: Y clamp min & max calue;
+ * YUV2RGB[14] - [15]: UV clamp min & max calue;
+ */
+static s32 YUV2020_2RGB[YUV_TO_RGB_TABLE_SIZE] = {
+	1196, 0, 1724, 1196,
+	-192, -668, 1196, 2200,
+	0, -959232, 363776, -1202944,
+	64, 940, 64, 960
+};
+
+/*
+ * RGB to YUV2020 conversion parameters
+ * RGB2YUV[0] - [8] : C0 - C8;
+ * RGB2YUV[9] - [11]: D0 - D2;
+ */
+static s16 RGB2YUV[RGB_TO_YUV_TABLE_SIZE] = {
+	230,	594,	52,
+	-125,  -323,	448,
+	448,   -412,   -36,
+	64,		512,	512
+};
+
+/*
+ * Degamma table for 709 color space data.
+ */
+static u16 DEGAMMA_709[DEGAMMA_SIZE] = {
+	0x0000, 0x0000, 0x0000, 0x0000, 0x0001, 0x0002, 0x0004, 0x0005,
+	0x0007, 0x000a, 0x000d, 0x0011, 0x0015, 0x0019, 0x001e, 0x0024,
+	0x002a, 0x0030, 0x0038, 0x003f, 0x0048, 0x0051, 0x005a, 0x0064,
+	0x006f, 0x007b, 0x0087, 0x0094, 0x00a1, 0x00af, 0x00be, 0x00ce,
+	0x00de, 0x00ef, 0x0101, 0x0114, 0x0127, 0x013b, 0x0150, 0x0166,
+	0x017c, 0x0193, 0x01ac, 0x01c4, 0x01de, 0x01f9, 0x0214, 0x0230,
+	0x024d, 0x026b, 0x028a, 0x02aa, 0x02ca, 0x02ec, 0x030e, 0x0331,
+	0x0355, 0x037a, 0x03a0, 0x03c7, 0x03ef, 0x0418, 0x0441, 0x046c,
+	0x0498, 0x04c4, 0x04f2, 0x0520, 0x0550, 0x0581, 0x05b2, 0x05e5,
+	0x0618, 0x064d, 0x0682, 0x06b9, 0x06f0, 0x0729, 0x0763, 0x079d,
+	0x07d9, 0x0816, 0x0854, 0x0893, 0x08d3, 0x0914, 0x0956, 0x0999,
+	0x09dd, 0x0a23, 0x0a69, 0x0ab1, 0x0afa, 0x0b44, 0x0b8f, 0x0bdb,
+	0x0c28, 0x0c76, 0x0cc6, 0x0d17, 0x0d69, 0x0dbb, 0x0e10, 0x0e65,
+	0x0ebb, 0x0f13, 0x0f6c, 0x0fc6, 0x1021, 0x107d, 0x10db, 0x113a,
+	0x119a, 0x11fb, 0x125d, 0x12c1, 0x1325, 0x138c, 0x13f3, 0x145b,
+	0x14c5, 0x1530, 0x159c, 0x160a, 0x1678, 0x16e8, 0x175a, 0x17cc,
+	0x1840, 0x18b5, 0x192b, 0x19a3, 0x1a1c, 0x1a96, 0x1b11, 0x1b8e,
+	0x1c0c, 0x1c8c, 0x1d0c, 0x1d8e, 0x1e12, 0x1e96, 0x1f1c, 0x1fa3,
+	0x202c, 0x20b6, 0x2141, 0x21ce, 0x225c, 0x22eb, 0x237c, 0x240e,
+	0x24a1, 0x2536, 0x25cc, 0x2664, 0x26fc, 0x2797, 0x2832, 0x28cf,
+	0x296e, 0x2a0e, 0x2aaf, 0x2b51, 0x2bf5, 0x2c9b, 0x2d41, 0x2dea,
+	0x2e93, 0x2f3e, 0x2feb, 0x3099, 0x3148, 0x31f9, 0x32ab, 0x335f,
+	0x3414, 0x34ca, 0x3582, 0x363c, 0x36f7, 0x37b3, 0x3871, 0x3930,
+	0x39f1, 0x3ab3, 0x3b77, 0x3c3c, 0x3d02, 0x3dcb, 0x3e94, 0x3f5f,
+	0x402c, 0x40fa, 0x41ca, 0x429b, 0x436d, 0x4442, 0x4517, 0x45ee,
+	0x46c7, 0x47a1, 0x487d, 0x495a, 0x4a39, 0x4b19, 0x4bfb, 0x4cde,
+	0x4dc3, 0x4eaa, 0x4f92, 0x507c, 0x5167, 0x5253, 0x5342, 0x5431,
+	0x5523, 0x5616, 0x570a, 0x5800, 0x58f8, 0x59f1, 0x5aec, 0x5be9,
+	0x5ce7, 0x5de6, 0x5ee7, 0x5fea, 0x60ef, 0x61f5, 0x62fc, 0x6406,
+	0x6510, 0x661d, 0x672b, 0x683b, 0x694c, 0x6a5f, 0x6b73, 0x6c8a,
+	0x6da2, 0x6ebb, 0x6fd6, 0x70f3, 0x7211, 0x7331, 0x7453, 0x7576,
+	0x769b, 0x77c2, 0x78ea, 0x7a14, 0x7b40, 0x7c6d, 0x7d9c, 0x7ecd,
+	0x3f65, 0x3f8c, 0x3fb2, 0x3fd8
+};
+
+/*
+ * Degamma table for 2020 color space data.
+ */
+static u16 DEGAMMA_2020[DEGAMMA_SIZE] = {
+	0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
+	0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
+	0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
+	0x0000, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001,
+	0x0001, 0x0002, 0x0002, 0x0002, 0x0002, 0x0002, 0x0003, 0x0003,
+	0x0003, 0x0003, 0x0004, 0x0004, 0x0004, 0x0005, 0x0005, 0x0006,
+	0x0006, 0x0006, 0x0007, 0x0007, 0x0008, 0x0008, 0x0009, 0x000a,
+	0x000a, 0x000b, 0x000c, 0x000c, 0x000d, 0x000e, 0x000f, 0x000f,
+	0x0010, 0x0011, 0x0012, 0x0013, 0x0014, 0x0016, 0x0017, 0x0018,
+	0x0019, 0x001b, 0x001c, 0x001e, 0x001f, 0x0021, 0x0022, 0x0024,
+	0x0026, 0x0028, 0x002a, 0x002c, 0x002e, 0x0030, 0x0033, 0x0035,
+	0x0038, 0x003a, 0x003d, 0x0040, 0x0043, 0x0046, 0x0049, 0x004d,
+	0x0050, 0x0054, 0x0057, 0x005b, 0x005f, 0x0064, 0x0068, 0x006d,
+	0x0071, 0x0076, 0x007c, 0x0081, 0x0086, 0x008c, 0x0092, 0x0098,
+	0x009f, 0x00a5, 0x00ac, 0x00b4, 0x00bb, 0x00c3, 0x00cb, 0x00d3,
+	0x00dc, 0x00e5, 0x00ee, 0x00f8, 0x0102, 0x010c, 0x0117, 0x0123,
+	0x012e, 0x013a, 0x0147, 0x0154, 0x0161, 0x016f, 0x017e, 0x018d,
+	0x019c, 0x01ac, 0x01bd, 0x01ce, 0x01e0, 0x01f3, 0x0206, 0x021a,
+	0x022f, 0x0244, 0x025a, 0x0272, 0x0289, 0x02a2, 0x02bc, 0x02d6,
+	0x02f2, 0x030f, 0x032c, 0x034b, 0x036b, 0x038b, 0x03ae, 0x03d1,
+	0x03f5, 0x041b, 0x0443, 0x046b, 0x0495, 0x04c1, 0x04ee, 0x051d,
+	0x054e, 0x0580, 0x05b4, 0x05ea, 0x0622, 0x065c, 0x0698, 0x06d6,
+	0x0717, 0x075a, 0x079f, 0x07e7, 0x0831, 0x087e, 0x08cd, 0x0920,
+	0x0976, 0x09ce, 0x0a2a, 0x0a89, 0x0aec, 0x0b52, 0x0bbc, 0x0c2a,
+	0x0c9b, 0x0d11, 0x0d8b, 0x0e0a, 0x0e8d, 0x0f15, 0x0fa1, 0x1033,
+	0x10ca, 0x1167, 0x120a, 0x12b2, 0x1360, 0x1415, 0x14d1, 0x1593,
+	0x165d, 0x172e, 0x1806, 0x18e7, 0x19d0, 0x1ac1, 0x1bbb, 0x1cbf,
+	0x1dcc, 0x1ee3, 0x2005, 0x2131, 0x2268, 0x23ab, 0x24fa, 0x2656,
+	0x27be, 0x2934, 0x2ab8, 0x2c4a, 0x2dec, 0x2f9d, 0x315f, 0x3332,
+	0x3516, 0x370d, 0x3916, 0x3b34, 0x3d66, 0x3fad, 0x420b, 0x4480,
+	0x470d, 0x49b3, 0x4c73, 0x4f4e, 0x5246, 0x555a, 0x588e, 0x5be1,
+	0x5f55, 0x62eb, 0x66a6, 0x6a86, 0x6e8c, 0x72bb, 0x7714, 0x7b99,
+	0x3dcb, 0x3e60, 0x3ef5, 0x3f8c
+};
+
+/* one is for primary plane and the other is for all overlay planes */
+static const struct dc_hw_plane_reg dc_plane_reg[] = {
+	{
+	.y_address		= DC_FRAMEBUFFER_ADDRESS,
+	.u_address		= DC_FRAMEBUFFER_U_ADDRESS,
+	.v_address		= DC_FRAMEBUFFER_V_ADDRESS,
+	.y_stride		= DC_FRAMEBUFFER_STRIDE,
+	.u_stride		= DC_FRAMEBUFFER_U_STRIDE,
+	.v_stride		= DC_FRAMEBUFFER_V_STRIDE,
+	.size			= DC_FRAMEBUFFER_SIZE,
+	.top_left		= DC_FRAMEBUFFER_TOP_LEFT,
+	.bottom_right	= DC_FRAMEBUFFER_BOTTOM_RIGHT,
+	.scale_factor_x			= DC_FRAMEBUFFER_SCALE_FACTOR_X,
+	.scale_factor_y			= DC_FRAMEBUFFER_SCALE_FACTOR_Y,
+	.h_filter_coef_index	= DC_FRAMEBUFFER_H_FILTER_COEF_INDEX,
+	.h_filter_coef_data		= DC_FRAMEBUFFER_H_FILTER_COEF_DATA,
+	.v_filter_coef_index	= DC_FRAMEBUFFER_V_FILTER_COEF_INDEX,
+	.v_filter_coef_data		= DC_FRAMEBUFFER_V_FILTER_COEF_DATA,
+	.init_offset			= DC_FRAMEBUFFER_INIT_OFFSET,
+	.color_key				= DC_FRAMEBUFFER_COLOR_KEY,
+	.color_key_high			= DC_FRAMEBUFFER_COLOR_KEY_HIGH,
+	.clear_value			= DC_FRAMEBUFFER_CLEAR_VALUE,
+	.color_table_index		= DC_FRAMEBUFFER_COLOR_TABLE_INDEX,
+	.color_table_data		= DC_FRAMEBUFFER_COLOR_TABLE_DATA,
+	.scale_config			= DC_FRAMEBUFFER_SCALE_CONFIG,
+	.water_mark				= DC_FRAMEBUFFER_WATER_MARK,
+	.degamma_index			= DC_FRAMEBUFFER_DEGAMMA_INDEX,
+	.degamma_data			= DC_FRAMEBUFFER_DEGAMMA_DATA,
+	.degamma_ex_data		= DC_FRAMEBUFFER_DEGAMMA_EX_DATA,
+	.src_global_color		= DC_FRAMEBUFFER_SRC_GLOBAL_COLOR,
+	.dst_global_color		= DC_FRAMEBUFFER_DST_GLOBAL_COLOR,
+	.blend_config			= DC_FRAMEBUFFER_BLEND_CONFIG,
+	.roi_origin				= DC_FRAMEBUFFER_ROI_ORIGIN,
+	.roi_size				= DC_FRAMEBUFFER_ROI_SIZE,
+	.yuv_to_rgb_coef0			= DC_FRAMEBUFFER_YUVTORGB_COEF0,
+	.yuv_to_rgb_coef1			= DC_FRAMEBUFFER_YUVTORGB_COEF1,
+	.yuv_to_rgb_coef2			= DC_FRAMEBUFFER_YUVTORGB_COEF2,
+	.yuv_to_rgb_coef3			= DC_FRAMEBUFFER_YUVTORGB_COEF3,
+	.yuv_to_rgb_coef4			= DC_FRAMEBUFFER_YUVTORGB_COEF4,
+	.yuv_to_rgb_coefd0			= DC_FRAMEBUFFER_YUVTORGB_COEFD0,
+	.yuv_to_rgb_coefd1			= DC_FRAMEBUFFER_YUVTORGB_COEFD1,
+	.yuv_to_rgb_coefd2			= DC_FRAMEBUFFER_YUVTORGB_COEFD2,
+	.y_clamp_bound				= DC_FRAMEBUFFER_Y_CLAMP_BOUND,
+	.uv_clamp_bound				= DC_FRAMEBUFFER_UV_CLAMP_BOUND,
+	.rgb_to_rgb_coef0			= DC_FRAMEBUFFER_RGBTORGB_COEF0,
+	.rgb_to_rgb_coef1			= DC_FRAMEBUFFER_RGBTORGB_COEF1,
+	.rgb_to_rgb_coef2			= DC_FRAMEBUFFER_RGBTORGB_COEF2,
+	.rgb_to_rgb_coef3			= DC_FRAMEBUFFER_RGBTORGB_COEF3,
+	.rgb_to_rgb_coef4			= DC_FRAMEBUFFER_RGBTORGB_COEF4,
+	},
+	{
+	.y_address		= DC_OVERLAY_ADDRESS,
+	.u_address		= DC_OVERLAY_U_ADDRESS,
+	.v_address		= DC_OVERLAY_V_ADDRESS,
+	.y_stride		= DC_OVERLAY_STRIDE,
+	.u_stride		= DC_OVERLAY_U_STRIDE,
+	.v_stride		= DC_OVERLAY_V_STRIDE,
+	.size			= DC_OVERLAY_SIZE,
+	.top_left		= DC_OVERLAY_TOP_LEFT,
+	.bottom_right	= DC_OVERLAY_BOTTOM_RIGHT,
+	.scale_factor_x	= DC_OVERLAY_SCALE_FACTOR_X,
+	.scale_factor_y	= DC_OVERLAY_SCALE_FACTOR_Y,
+	.h_filter_coef_index = DC_OVERLAY_H_FILTER_COEF_INDEX,
+	.h_filter_coef_data  = DC_OVERLAY_H_FILTER_COEF_DATA,
+	.v_filter_coef_index = DC_OVERLAY_V_FILTER_COEF_INDEX,
+	.v_filter_coef_data  = DC_OVERLAY_V_FILTER_COEF_DATA,
+	.init_offset		 = DC_OVERLAY_INIT_OFFSET,
+	.color_key			 = DC_OVERLAY_COLOR_KEY,
+	.color_key_high			= DC_OVERLAY_COLOR_KEY_HIGH,
+	.clear_value		 = DC_OVERLAY_CLEAR_VALUE,
+	.color_table_index	 = DC_OVERLAY_COLOR_TABLE_INDEX,
+	.color_table_data	 = DC_OVERLAY_COLOR_TABLE_DATA,
+	.scale_config		 = DC_OVERLAY_SCALE_CONFIG,
+	.water_mark				= DC_OVERLAY_WATER_MARK,
+	.degamma_index		 = DC_OVERLAY_DEGAMMA_INDEX,
+	.degamma_data		 = DC_OVERLAY_DEGAMMA_DATA,
+	.degamma_ex_data	 = DC_OVERLAY_DEGAMMA_EX_DATA,
+	.src_global_color	 = DC_OVERLAY_SRC_GLOBAL_COLOR,
+	.dst_global_color	 = DC_OVERLAY_DST_GLOBAL_COLOR,
+	.blend_config		 = DC_OVERLAY_BLEND_CONFIG,
+	.roi_origin				= DC_OVERLAY_ROI_ORIGIN,
+	.roi_size				= DC_OVERLAY_ROI_SIZE,
+	.yuv_to_rgb_coef0		 = DC_OVERLAY_YUVTORGB_COEF0,
+	.yuv_to_rgb_coef1		 = DC_OVERLAY_YUVTORGB_COEF1,
+	.yuv_to_rgb_coef2		 = DC_OVERLAY_YUVTORGB_COEF2,
+	.yuv_to_rgb_coef3		 = DC_OVERLAY_YUVTORGB_COEF3,
+	.yuv_to_rgb_coef4			= DC_OVERLAY_YUVTORGB_COEF4,
+	.yuv_to_rgb_coefd0			= DC_OVERLAY_YUVTORGB_COEFD0,
+	.yuv_to_rgb_coefd1			= DC_OVERLAY_YUVTORGB_COEFD1,
+	.yuv_to_rgb_coefd2			= DC_OVERLAY_YUVTORGB_COEFD2,
+	.y_clamp_bound		 = DC_OVERLAY_Y_CLAMP_BOUND,
+	.uv_clamp_bound		 = DC_OVERLAY_UV_CLAMP_BOUND,
+	.rgb_to_rgb_coef0		 = DC_OVERLAY_RGBTORGB_COEF0,
+	.rgb_to_rgb_coef1		 = DC_OVERLAY_RGBTORGB_COEF1,
+	.rgb_to_rgb_coef2		 = DC_OVERLAY_RGBTORGB_COEF2,
+	.rgb_to_rgb_coef3		 = DC_OVERLAY_RGBTORGB_COEF3,
+	.rgb_to_rgb_coef4		 = DC_OVERLAY_RGBTORGB_COEF4,
+	},
+};
+
+static const u32 primary_overlay_format0[] = {
+	DRM_FORMAT_XRGB4444,
+	DRM_FORMAT_XBGR4444,
+	DRM_FORMAT_RGBX4444,
+	DRM_FORMAT_BGRX4444,
+	DRM_FORMAT_ARGB4444,
+	DRM_FORMAT_ABGR4444,
+	DRM_FORMAT_RGBA4444,
+	DRM_FORMAT_BGRA4444,
+	DRM_FORMAT_XRGB1555,
+	DRM_FORMAT_XBGR1555,
+	DRM_FORMAT_RGBX5551,
+	DRM_FORMAT_BGRX5551,
+	DRM_FORMAT_ARGB1555,
+	DRM_FORMAT_ABGR1555,
+	DRM_FORMAT_RGBA5551,
+	DRM_FORMAT_BGRA5551,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_BGR565,
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_RGBX8888,
+	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_RGBA8888,
+	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_ARGB2101010,
+	DRM_FORMAT_ABGR2101010,
+	DRM_FORMAT_RGBA1010102,
+	DRM_FORMAT_BGRA1010102,
+	DRM_FORMAT_YUYV,
+	DRM_FORMAT_YVYU,
+	DRM_FORMAT_UYVY,
+	DRM_FORMAT_VYUY,
+	DRM_FORMAT_YVU420,
+	DRM_FORMAT_YUV420,
+	DRM_FORMAT_NV12,
+	DRM_FORMAT_NV21,
+	DRM_FORMAT_NV16,
+	DRM_FORMAT_NV61,
+	DRM_FORMAT_P010,
+};
+
+static const u32 primary_overlay_format1[] = {
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_RGBX8888,
+	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_RGBA8888,
+	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_ARGB2101010,
+	DRM_FORMAT_ABGR2101010,
+	DRM_FORMAT_RGBA1010102,
+	DRM_FORMAT_BGRA1010102,
+	DRM_FORMAT_NV12,
+	DRM_FORMAT_NV21,
+	DRM_FORMAT_YUV444,
+};
+
+static const u32 cursor_formats[] = {
+	DRM_FORMAT_ARGB8888
+};
+
+static const u64 format_modifier0[] = {
+	DRM_FORMAT_MOD_LINEAR,
+	fourcc_mod_vs_norm_code(DRM_FORMAT_MOD_VS_LINEAR),
+	fourcc_mod_vs_norm_code(DRM_FORMAT_MOD_VS_SUPER_TILED_XMAJOR),
+	fourcc_mod_vs_norm_code(DRM_FORMAT_MOD_VS_SUPER_TILED_YMAJOR),
+	fourcc_mod_vs_norm_code(DRM_FORMAT_MOD_VS_TILE_8X8),
+	fourcc_mod_vs_norm_code(DRM_FORMAT_MOD_VS_TILE_8X4),
+	fourcc_mod_vs_norm_code(DRM_FORMAT_MOD_VS_SUPER_TILED_XMAJOR_8X4),
+	fourcc_mod_vs_norm_code(DRM_FORMAT_MOD_VS_SUPER_TILED_YMAJOR_4X8),
+	DRM_FORMAT_MOD_INVALID
+};
+
+static const u64 format_modifier1[] = {
+	DRM_FORMAT_MOD_LINEAR,
+	fourcc_mod_vs_norm_code(DRM_FORMAT_MOD_VS_LINEAR),
+	fourcc_mod_vs_norm_code(DRM_FORMAT_MOD_VS_SUPER_TILED_XMAJOR),
+	fourcc_mod_vs_norm_code(DRM_FORMAT_MOD_VS_SUPER_TILED_YMAJOR),
+	fourcc_mod_vs_norm_code(DRM_FORMAT_MOD_VS_TILE_8X8),
+	fourcc_mod_vs_norm_code(DRM_FORMAT_MOD_VS_TILE_8X4),
+	fourcc_mod_vs_norm_code(DRM_FORMAT_MOD_VS_SUPER_TILED_XMAJOR_8X4),
+	fourcc_mod_vs_norm_code(DRM_FORMAT_MOD_VS_SUPER_TILED_YMAJOR_4X8),
+	fourcc_mod_vs_norm_code(DRM_FORMAT_MOD_VS_TILE_MODE4X4),
+	fourcc_mod_vs_custom_code(DRM_FORMAT_MOD_VS_TILE_MODE4X4),
+	DRM_FORMAT_MOD_INVALID
+};
+
+static const u64 secondary_format_modifiers[] = {
+	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_INVALID
+};
+
+#define FRAC_16_16(mult, div)	 (((mult) << 16) / (div))
+
+static const struct vs_plane_info dc_hw_planes[][PLANE_NUM] = {
+	{
+		/* DC_REV_0 */
+		{
+		.name			= "Primary",
+		.id				= PRIMARY_PLANE_0,
+		.type			= DRM_PLANE_TYPE_PRIMARY,
+		.num_formats	= ARRAY_SIZE(primary_overlay_format0),
+		.formats		= primary_overlay_format0,
+		.num_modifiers	= ARRAY_SIZE(format_modifier0),
+		.modifiers		= format_modifier0,
+		.min_width		= 0,
+		.min_height		= 0,
+		.max_width		= 4096,
+		.max_height		= 4096,
+		.rotation		= DRM_MODE_ROTATE_0 |
+							DRM_MODE_ROTATE_90 |
+							DRM_MODE_ROTATE_180 |
+							DRM_MODE_ROTATE_270 |
+							DRM_MODE_REFLECT_X |
+							DRM_MODE_REFLECT_Y,
+		.blend_mode		= BIT(DRM_MODE_BLEND_PIXEL_NONE) |
+							BIT(DRM_MODE_BLEND_PREMULTI) |
+							BIT(DRM_MODE_BLEND_COVERAGE),
+		.color_encoding = BIT(DRM_COLOR_YCBCR_BT709) |
+						  BIT(DRM_COLOR_YCBCR_BT2020),
+		.degamma_size	= DEGAMMA_SIZE,
+		.min_scale	 = FRAC_16_16(1, 3),
+		.max_scale	 = FRAC_16_16(10, 1),
+		.zpos		 = 0,
+		.watermark	 = true,
+		.color_mgmt  = true,
+		.roi		 = true,
+		},
+		{
+		.name			= "Overlay",
+		.id				= OVERLAY_PLANE_0,
+		.type			= DRM_PLANE_TYPE_OVERLAY,
+		.num_formats	= ARRAY_SIZE(primary_overlay_format0),
+		.formats		= primary_overlay_format0,
+		.num_modifiers	= ARRAY_SIZE(format_modifier0),
+		.modifiers		= format_modifier0,
+		.min_width		= 0,
+		.min_height		= 0,
+		.max_width		= 4096,
+		.max_height		= 4096,
+		.rotation	 = DRM_MODE_ROTATE_0 |
+					   DRM_MODE_ROTATE_90 |
+					   DRM_MODE_ROTATE_180 |
+					   DRM_MODE_ROTATE_270 |
+					   DRM_MODE_REFLECT_X |
+					   DRM_MODE_REFLECT_Y,
+		.blend_mode  = BIT(DRM_MODE_BLEND_PIXEL_NONE) |
+					   BIT(DRM_MODE_BLEND_PREMULTI) |
+					   BIT(DRM_MODE_BLEND_COVERAGE),
+		.color_encoding = BIT(DRM_COLOR_YCBCR_BT709) |
+						  BIT(DRM_COLOR_YCBCR_BT2020),
+		.degamma_size	= DEGAMMA_SIZE,
+		.min_scale	 = FRAC_16_16(1, 3),
+		.max_scale	 = FRAC_16_16(10, 1),
+		.zpos		 = 1,
+		.watermark	 = true,
+		.color_mgmt  = true,
+		.roi		 = true,
+		},
+		{
+		.name			= "Overlay_1",
+		.id				= OVERLAY_PLANE_1,
+		.type			= DRM_PLANE_TYPE_OVERLAY,
+		.num_formats	= ARRAY_SIZE(primary_overlay_format0),
+		.formats		= primary_overlay_format0,
+		.num_modifiers	= ARRAY_SIZE(secondary_format_modifiers),
+		.modifiers		= secondary_format_modifiers,
+		.min_width		= 0,
+		.min_height		= 0,
+		.max_width		= 4096,
+		.max_height		= 4096,
+		.rotation		= 0,
+		.blend_mode		= BIT(DRM_MODE_BLEND_PIXEL_NONE) |
+							BIT(DRM_MODE_BLEND_PREMULTI) |
+							BIT(DRM_MODE_BLEND_COVERAGE),
+		.color_encoding = BIT(DRM_COLOR_YCBCR_BT709) |
+						  BIT(DRM_COLOR_YCBCR_BT2020),
+		.degamma_size	= DEGAMMA_SIZE,
+		.min_scale	 = DRM_PLANE_NO_SCALING,
+		.max_scale	 = DRM_PLANE_NO_SCALING,
+		.zpos		 = 2,
+		.watermark	 = true,
+		.color_mgmt  = true,
+		.roi		 = true,
+		},
+		{
+		.name		 = "Primary_1",
+		.id				= PRIMARY_PLANE_1,
+		.type		 = DRM_PLANE_TYPE_PRIMARY,
+		.num_formats = ARRAY_SIZE(primary_overlay_format0),
+		.formats	 = primary_overlay_format0,
+		.num_modifiers = ARRAY_SIZE(format_modifier0),
+		.modifiers	 = format_modifier0,
+		.min_width	 = 0,
+		.min_height  = 0,
+		.max_width	 = 4096,
+		.max_height  = 4096,
+		.rotation	 = DRM_MODE_ROTATE_0 |
+					   DRM_MODE_ROTATE_90 |
+					   DRM_MODE_ROTATE_180 |
+					   DRM_MODE_ROTATE_270 |
+					   DRM_MODE_REFLECT_X |
+					   DRM_MODE_REFLECT_Y,
+		.blend_mode  = BIT(DRM_MODE_BLEND_PIXEL_NONE) |
+					   BIT(DRM_MODE_BLEND_PREMULTI) |
+					   BIT(DRM_MODE_BLEND_COVERAGE),
+		.color_encoding = BIT(DRM_COLOR_YCBCR_BT709) |
+						  BIT(DRM_COLOR_YCBCR_BT2020),
+		.degamma_size	= DEGAMMA_SIZE,
+		.min_scale	 = FRAC_16_16(1, 3),
+		.max_scale	 = FRAC_16_16(10, 1),
+		.zpos		 = 3,
+		.watermark	 = true,
+		.color_mgmt  = true,
+		.roi		 = true,
+		},
+		{
+		.name		 = "Overlay_2",
+		.id				= OVERLAY_PLANE_2,
+		.type		 = DRM_PLANE_TYPE_OVERLAY,
+		.num_formats = ARRAY_SIZE(primary_overlay_format0),
+		.formats	 = primary_overlay_format0,
+		.num_modifiers = ARRAY_SIZE(format_modifier0),
+		.modifiers	 = format_modifier0,
+		.min_width	 = 0,
+		.min_height  = 0,
+		.max_width	 = 4096,
+		.max_height  = 4096,
+		.rotation	 = DRM_MODE_ROTATE_0 |
+					   DRM_MODE_ROTATE_90 |
+					   DRM_MODE_ROTATE_180 |
+					   DRM_MODE_ROTATE_270 |
+					   DRM_MODE_REFLECT_X |
+					   DRM_MODE_REFLECT_Y,
+		.blend_mode  = BIT(DRM_MODE_BLEND_PIXEL_NONE) |
+					   BIT(DRM_MODE_BLEND_PREMULTI) |
+					   BIT(DRM_MODE_BLEND_COVERAGE),
+		.color_encoding = BIT(DRM_COLOR_YCBCR_BT709) |
+						  BIT(DRM_COLOR_YCBCR_BT2020),
+		.degamma_size	= DEGAMMA_SIZE,
+		.min_scale	 = FRAC_16_16(1, 3),
+		.max_scale	 = FRAC_16_16(10, 1),
+		.zpos		 = 4,
+		.watermark	 = true,
+		.color_mgmt  = true,
+		.roi		 = true,
+		},
+		{
+		.name		 = "Overlay_3",
+		.id			= OVERLAY_PLANE_3,
+		.type		 = DRM_PLANE_TYPE_OVERLAY,
+		.num_formats = ARRAY_SIZE(primary_overlay_format0),
+		.formats	 = primary_overlay_format0,
+		.num_modifiers = ARRAY_SIZE(secondary_format_modifiers),
+		.modifiers	 = secondary_format_modifiers,
+		.min_width	 = 0,
+		.min_height  = 0,
+		.max_width	 = 4096,
+		.max_height  = 4096,
+		.rotation	 = 0,
+		.blend_mode  = BIT(DRM_MODE_BLEND_PIXEL_NONE) |
+					   BIT(DRM_MODE_BLEND_PREMULTI) |
+					   BIT(DRM_MODE_BLEND_COVERAGE),
+		.color_encoding = BIT(DRM_COLOR_YCBCR_BT709) |
+						  BIT(DRM_COLOR_YCBCR_BT2020),
+		.degamma_size	= DEGAMMA_SIZE,
+		.min_scale	 = DRM_PLANE_NO_SCALING,
+		.max_scale	 = DRM_PLANE_NO_SCALING,
+		.zpos		 = 5,
+		.watermark	 = true,
+		.color_mgmt  = true,
+		.roi		 = true,
+		},
+		{
+		.name		 = "Cursor",
+		.id				= CURSOR_PLANE_0,
+		.type		 = DRM_PLANE_TYPE_CURSOR,
+		.num_formats = ARRAY_SIZE(cursor_formats),
+		.formats	 = cursor_formats,
+		.num_modifiers = 0,
+		.modifiers	 = NULL,
+		.min_width	 = 32,
+		.min_height  = 32,
+		.max_width	 = 64,
+		.max_height  = 64,
+		.rotation	 = 0,
+		.degamma_size = 0,
+		.min_scale	 = DRM_PLANE_NO_SCALING,
+		.max_scale	 = DRM_PLANE_NO_SCALING,
+		.zpos		 = 255,
+		.watermark	 = false,
+		.color_mgmt  = false,
+		.roi		 = false,
+		},
+		{
+		.name		 = "Cursor_1",
+		.id				= CURSOR_PLANE_1,
+		.type		 = DRM_PLANE_TYPE_CURSOR,
+		.num_formats = ARRAY_SIZE(cursor_formats),
+		.formats	 = cursor_formats,
+		.num_modifiers = 0,
+		.modifiers	 = NULL,
+		.min_width	 = 32,
+		.min_height  = 32,
+		.max_width	 = 64,
+		.max_height  = 64,
+		.rotation	 = 0,
+		.degamma_size = 0,
+		.min_scale	 = DRM_PLANE_NO_SCALING,
+		.max_scale	 = DRM_PLANE_NO_SCALING,
+		.zpos		 = 255,
+		.watermark	 = false,
+		.color_mgmt  = false,
+		.roi		 = false,
+		},
+	},
+	{
+		/* DC_REV_1 */
+		{
+		.name		 = "Primary",
+		.id				= PRIMARY_PLANE_0,
+		.type		 = DRM_PLANE_TYPE_PRIMARY,
+		.num_formats = ARRAY_SIZE(primary_overlay_format0),
+		.formats	 = primary_overlay_format0,
+		.num_modifiers = ARRAY_SIZE(format_modifier0),
+		.modifiers	 = format_modifier0,
+		.min_width	 = 0,
+		.min_height  = 0,
+		.max_width	 = 4096,
+		.max_height  = 4096,
+		.rotation	 = DRM_MODE_ROTATE_0 |
+					   DRM_MODE_ROTATE_90 |
+					   DRM_MODE_ROTATE_180 |
+					   DRM_MODE_ROTATE_270 |
+					   DRM_MODE_REFLECT_X |
+					   DRM_MODE_REFLECT_Y,
+		.blend_mode  = BIT(DRM_MODE_BLEND_PIXEL_NONE) |
+					   BIT(DRM_MODE_BLEND_PREMULTI) |
+					   BIT(DRM_MODE_BLEND_COVERAGE),
+		.color_encoding = BIT(DRM_COLOR_YCBCR_BT709) |
+						  BIT(DRM_COLOR_YCBCR_BT2020),
+		.degamma_size	= DEGAMMA_SIZE,
+		.min_scale	 = FRAC_16_16(1, 3),
+		.max_scale	 = FRAC_16_16(10, 1),
+		.zpos		 = 0,
+		.watermark	 = true,
+		.color_mgmt  = true,
+		.roi		 = true,
+		},
+		{
+		.name		 = "Overlay",
+		.id				= OVERLAY_PLANE_0,
+		.type		 = DRM_PLANE_TYPE_OVERLAY,
+		.num_formats = ARRAY_SIZE(primary_overlay_format0),
+		.formats	 = primary_overlay_format0,
+		.num_modifiers = ARRAY_SIZE(format_modifier0),
+		.modifiers	 = format_modifier0,
+		.min_width	 = 0,
+		.min_height  = 0,
+		.max_width	 = 4096,
+		.max_height  = 4096,
+		.rotation	 = DRM_MODE_ROTATE_0 |
+					   DRM_MODE_ROTATE_90 |
+					   DRM_MODE_ROTATE_180 |
+					   DRM_MODE_ROTATE_270 |
+					   DRM_MODE_REFLECT_X |
+					   DRM_MODE_REFLECT_Y,
+		.blend_mode  = BIT(DRM_MODE_BLEND_PIXEL_NONE) |
+					   BIT(DRM_MODE_BLEND_PREMULTI) |
+					   BIT(DRM_MODE_BLEND_COVERAGE),
+		.color_encoding = BIT(DRM_COLOR_YCBCR_BT709) |
+						  BIT(DRM_COLOR_YCBCR_BT2020),
+		.degamma_size	= DEGAMMA_SIZE,
+		.min_scale	 = FRAC_16_16(1, 3),
+		.max_scale	 = FRAC_16_16(10, 1),
+		.zpos		 = 1,
+		.watermark	 = true,
+		.color_mgmt  = true,
+		.roi		 = true,
+		},
+		{
+		.name		 = "Primary_1",
+		.id				= PRIMARY_PLANE_1,
+		.type		 = DRM_PLANE_TYPE_PRIMARY,
+		.num_formats = ARRAY_SIZE(primary_overlay_format0),
+		.formats	 = primary_overlay_format0,
+		.num_modifiers = ARRAY_SIZE(format_modifier0),
+		.modifiers	 = format_modifier0,
+		.min_width	 = 0,
+		.min_height  = 0,
+		.max_width	 = 4096,
+		.max_height  = 4096,
+		.rotation	 = DRM_MODE_ROTATE_0 |
+					   DRM_MODE_ROTATE_90 |
+					   DRM_MODE_ROTATE_180 |
+					   DRM_MODE_ROTATE_270 |
+					   DRM_MODE_REFLECT_X |
+					   DRM_MODE_REFLECT_Y,
+		.blend_mode  = BIT(DRM_MODE_BLEND_PIXEL_NONE) |
+					   BIT(DRM_MODE_BLEND_PREMULTI) |
+					   BIT(DRM_MODE_BLEND_COVERAGE),
+		.color_encoding = BIT(DRM_COLOR_YCBCR_BT709) |
+						  BIT(DRM_COLOR_YCBCR_BT2020),
+		.degamma_size	= DEGAMMA_SIZE,
+		.min_scale	 = FRAC_16_16(1, 3),
+		.max_scale	 = FRAC_16_16(10, 1),
+		.zpos		 = 2,
+		.watermark	 = true,
+		.color_mgmt  = true,
+		.roi		 = true,
+		},
+		{
+		.name		 = "Overlay_2",
+		.id				= OVERLAY_PLANE_2,
+		.type		 = DRM_PLANE_TYPE_OVERLAY,
+		.num_formats = ARRAY_SIZE(primary_overlay_format0),
+		.formats	 = primary_overlay_format0,
+		.num_modifiers = ARRAY_SIZE(format_modifier0),
+		.modifiers	 = format_modifier0,
+		.min_width	 = 0,
+		.min_height  = 0,
+		.max_width	 = 4096,
+		.max_height  = 4096,
+		.rotation	 = DRM_MODE_ROTATE_0 |
+					   DRM_MODE_ROTATE_90 |
+					   DRM_MODE_ROTATE_180 |
+					   DRM_MODE_ROTATE_270 |
+					   DRM_MODE_REFLECT_X |
+					   DRM_MODE_REFLECT_Y,
+		.blend_mode  = BIT(DRM_MODE_BLEND_PIXEL_NONE) |
+					   BIT(DRM_MODE_BLEND_PREMULTI) |
+					   BIT(DRM_MODE_BLEND_COVERAGE),
+		.color_encoding = BIT(DRM_COLOR_YCBCR_BT709) |
+						  BIT(DRM_COLOR_YCBCR_BT2020),
+		.degamma_size	= DEGAMMA_SIZE,
+		.min_scale	 = FRAC_16_16(1, 3),
+		.max_scale	 = FRAC_16_16(10, 1),
+		.zpos		 = 3,
+		.watermark	 = true,
+		.color_mgmt  = true,
+		.roi		 = true,
+		},
+		{
+		.name		 = "Cursor",
+		.id				= CURSOR_PLANE_0,
+		.type		 = DRM_PLANE_TYPE_CURSOR,
+		.num_formats = ARRAY_SIZE(cursor_formats),
+		.formats	 = cursor_formats,
+		.num_modifiers = 0,
+		.modifiers	 = NULL,
+		.min_width	 = 32,
+		.min_height  = 32,
+		.max_width	 = 64,
+		.max_height  = 64,
+		.rotation	 = 0,
+		.degamma_size = 0,
+		.min_scale	 = DRM_PLANE_NO_SCALING,
+		.max_scale	 = DRM_PLANE_NO_SCALING,
+		.zpos		 = 255,
+		.watermark	 = false,
+		.color_mgmt  = false,
+		.roi		 = false,
+		},
+		{
+		.name		 = "Cursor_1",
+		.id				= CURSOR_PLANE_1,
+		.type		 = DRM_PLANE_TYPE_CURSOR,
+		.num_formats = ARRAY_SIZE(cursor_formats),
+		.formats	 = cursor_formats,
+		.num_modifiers = 0,
+		.modifiers	 = NULL,
+		.min_width	 = 32,
+		.min_height  = 32,
+		.max_width	 = 64,
+		.max_height  = 64,
+		.rotation	 = 0,
+		.degamma_size = 0,
+		.min_scale	 = DRM_PLANE_NO_SCALING,
+		.max_scale	 = DRM_PLANE_NO_SCALING,
+		.zpos		 = 255,
+		.watermark	 = false,
+		.color_mgmt  = false,
+		.roi		 = false,
+		},
+	},
+	{
+		/* DC_REV_2 */
+		{
+		.name		 = "Primary",
+		.id				= PRIMARY_PLANE_0,
+		.type		 = DRM_PLANE_TYPE_PRIMARY,
+		.num_formats = ARRAY_SIZE(primary_overlay_format1),
+		.formats	 = primary_overlay_format1,
+		.num_modifiers = ARRAY_SIZE(format_modifier1),
+		.modifiers	 = format_modifier1,
+		.min_width	 = 0,
+		.min_height  = 0,
+		.max_width	 = 4096,
+		.max_height  = 4096,
+		.rotation	 = DRM_MODE_ROTATE_0 |
+					   DRM_MODE_ROTATE_90 |
+					   DRM_MODE_ROTATE_180 |
+					   DRM_MODE_ROTATE_270 |
+					   DRM_MODE_REFLECT_X |
+					   DRM_MODE_REFLECT_Y,
+		.blend_mode  = BIT(DRM_MODE_BLEND_PIXEL_NONE) |
+					   BIT(DRM_MODE_BLEND_PREMULTI) |
+					   BIT(DRM_MODE_BLEND_COVERAGE),
+		.color_encoding = BIT(DRM_COLOR_YCBCR_BT709) |
+						  BIT(DRM_COLOR_YCBCR_BT2020),
+		.degamma_size	= DEGAMMA_SIZE,
+		.min_scale	 = FRAC_16_16(1, 3),
+		.max_scale	 = FRAC_16_16(10, 1),
+		.zpos		 = 0,
+		.watermark	 = true,
+		.color_mgmt  = true,
+		.roi		 = true,
+		},
+		{
+		.name		 = "Overlay",
+		.id				= OVERLAY_PLANE_0,
+		.type		 = DRM_PLANE_TYPE_OVERLAY,
+		.num_formats = ARRAY_SIZE(primary_overlay_format1),
+		.formats	 = primary_overlay_format1,
+		.num_modifiers = ARRAY_SIZE(format_modifier1),
+		.modifiers	 = format_modifier1,
+		.min_width	 = 0,
+		.min_height  = 0,
+		.max_width	 = 4096,
+		.max_height  = 4096,
+		.rotation	 = DRM_MODE_ROTATE_0 |
+					   DRM_MODE_ROTATE_90 |
+					   DRM_MODE_ROTATE_180 |
+					   DRM_MODE_ROTATE_270 |
+					   DRM_MODE_REFLECT_X |
+					   DRM_MODE_REFLECT_Y,
+		.blend_mode  = BIT(DRM_MODE_BLEND_PIXEL_NONE) |
+					   BIT(DRM_MODE_BLEND_PREMULTI) |
+					   BIT(DRM_MODE_BLEND_COVERAGE),
+		.color_encoding = BIT(DRM_COLOR_YCBCR_BT709) |
+						  BIT(DRM_COLOR_YCBCR_BT2020),
+		.degamma_size	= DEGAMMA_SIZE,
+		.min_scale	 = FRAC_16_16(1, 3),
+		.max_scale	 = FRAC_16_16(10, 1),
+		.zpos		 = 1,
+		.watermark	 = true,
+		.color_mgmt  = true,
+		.roi		 = true,
+		},
+		{
+		.name		 = "Overlay_1",
+		.id				= OVERLAY_PLANE_1,
+		.type		 = DRM_PLANE_TYPE_OVERLAY,
+		.num_formats = ARRAY_SIZE(primary_overlay_format1),
+		.formats	 = primary_overlay_format1,
+		.num_modifiers = ARRAY_SIZE(secondary_format_modifiers),
+		.modifiers	 = secondary_format_modifiers,
+		.min_width	 = 0,
+		.min_height  = 0,
+		.max_width	 = 4096,
+		.max_height  = 4096,
+		.rotation	 = 0,
+		.blend_mode  = BIT(DRM_MODE_BLEND_PIXEL_NONE) |
+					   BIT(DRM_MODE_BLEND_PREMULTI) |
+					   BIT(DRM_MODE_BLEND_COVERAGE),
+		.color_encoding = BIT(DRM_COLOR_YCBCR_BT709) |
+						  BIT(DRM_COLOR_YCBCR_BT2020),
+		.degamma_size	= DEGAMMA_SIZE,
+		.min_scale	 = DRM_PLANE_NO_SCALING,
+		.max_scale	 = DRM_PLANE_NO_SCALING,
+		.zpos		 = 2,
+		.watermark	 = true,
+		.color_mgmt  = true,
+		.roi		 = true,
+		},
+		{
+		.name		 = "Primary_1",
+		.id				= PRIMARY_PLANE_1,
+		.type		 = DRM_PLANE_TYPE_PRIMARY,
+		.num_formats = ARRAY_SIZE(primary_overlay_format1),
+		.formats	 = primary_overlay_format1,
+		.num_modifiers = ARRAY_SIZE(format_modifier1),
+		.modifiers	 = format_modifier1,
+		.min_width	 = 0,
+		.min_height  = 0,
+		.max_width	 = 4096,
+		.max_height  = 4096,
+		.rotation	 = DRM_MODE_ROTATE_0 |
+					   DRM_MODE_ROTATE_90 |
+					   DRM_MODE_ROTATE_180 |
+					   DRM_MODE_ROTATE_270 |
+					   DRM_MODE_REFLECT_X |
+					   DRM_MODE_REFLECT_Y,
+		.blend_mode  = BIT(DRM_MODE_BLEND_PIXEL_NONE) |
+					   BIT(DRM_MODE_BLEND_PREMULTI) |
+					   BIT(DRM_MODE_BLEND_COVERAGE),
+		.color_encoding = BIT(DRM_COLOR_YCBCR_BT709) |
+						  BIT(DRM_COLOR_YCBCR_BT2020),
+		.degamma_size	= DEGAMMA_SIZE,
+		.min_scale	 = FRAC_16_16(1, 3),
+		.max_scale	 = FRAC_16_16(10, 1),
+		.zpos		 = 3,
+		.watermark	 = true,
+		.color_mgmt  = true,
+		.roi		 = true,
+		},
+		{
+		.name		 = "Overlay_2",
+		.id				= OVERLAY_PLANE_2,
+		.type		 = DRM_PLANE_TYPE_OVERLAY,
+		.num_formats = ARRAY_SIZE(primary_overlay_format1),
+		.formats	 = primary_overlay_format1,
+		.num_modifiers = ARRAY_SIZE(format_modifier1),
+		.modifiers	 = format_modifier1,
+		.min_width	 = 0,
+		.min_height  = 0,
+		.max_width	 = 4096,
+		.max_height  = 4096,
+		.rotation	 = DRM_MODE_ROTATE_0 |
+					   DRM_MODE_ROTATE_90 |
+					   DRM_MODE_ROTATE_180 |
+					   DRM_MODE_ROTATE_270 |
+					   DRM_MODE_REFLECT_X |
+					   DRM_MODE_REFLECT_Y,
+		.blend_mode  = BIT(DRM_MODE_BLEND_PIXEL_NONE) |
+					   BIT(DRM_MODE_BLEND_PREMULTI) |
+					   BIT(DRM_MODE_BLEND_COVERAGE),
+		.color_encoding = BIT(DRM_COLOR_YCBCR_BT709) |
+						  BIT(DRM_COLOR_YCBCR_BT2020),
+		.degamma_size	= DEGAMMA_SIZE,
+		.min_scale	 = FRAC_16_16(1, 3),
+		.max_scale	 = FRAC_16_16(10, 1),
+		.zpos		 = 4,
+		.watermark	 = true,
+		.color_mgmt  = true,
+		.roi		 = true,
+		},
+		{
+		.name		 = "Overlay_3",
+		.id				= OVERLAY_PLANE_3,
+		.type		 = DRM_PLANE_TYPE_OVERLAY,
+		.num_formats = ARRAY_SIZE(primary_overlay_format1),
+		.formats	 = primary_overlay_format1,
+		.num_modifiers = ARRAY_SIZE(secondary_format_modifiers),
+		.modifiers	 = secondary_format_modifiers,
+		.min_width	 = 0,
+		.min_height  = 0,
+		.max_width	 = 4096,
+		.max_height  = 4096,
+		.rotation	 = 0,
+		.blend_mode  = BIT(DRM_MODE_BLEND_PIXEL_NONE) |
+					   BIT(DRM_MODE_BLEND_PREMULTI) |
+					   BIT(DRM_MODE_BLEND_COVERAGE),
+		.color_encoding = BIT(DRM_COLOR_YCBCR_BT709) |
+						  BIT(DRM_COLOR_YCBCR_BT2020),
+		.degamma_size	= DEGAMMA_SIZE,
+		.min_scale	 = DRM_PLANE_NO_SCALING,
+		.max_scale	 = DRM_PLANE_NO_SCALING,
+		.zpos		 = 5,
+		.watermark	 = true,
+		.color_mgmt  = true,
+		.roi		 = true,
+		},
+		{
+		.name		 = "Cursor",
+		.id				= CURSOR_PLANE_0,
+		.type		 = DRM_PLANE_TYPE_CURSOR,
+		.num_formats = ARRAY_SIZE(cursor_formats),
+		.formats	 = cursor_formats,
+		.num_modifiers = 0,
+		.modifiers	 = NULL,
+		.min_width	 = 32,
+		.min_height  = 32,
+		.max_width	 = 64,
+		.max_height  = 64,
+		.rotation	 = 0,
+		.degamma_size = 0,
+		.min_scale	 = DRM_PLANE_NO_SCALING,
+		.max_scale	 = DRM_PLANE_NO_SCALING,
+		.zpos		 = 255,
+		.watermark	 = false,
+		.color_mgmt  = false,
+		.roi		 = false,
+		},
+		{
+		.name		 = "Cursor_1",
+		.id				= CURSOR_PLANE_1,
+		.type		 = DRM_PLANE_TYPE_CURSOR,
+		.num_formats = ARRAY_SIZE(cursor_formats),
+		.formats	 = cursor_formats,
+		.num_modifiers = 0,
+		.modifiers	 = NULL,
+		.min_width	 = 32,
+		.min_height  = 32,
+		.max_width	 = 64,
+		.max_height  = 64,
+		.rotation	 = 0,
+		.degamma_size = 0,
+		.min_scale	 = DRM_PLANE_NO_SCALING,
+		.max_scale	 = DRM_PLANE_NO_SCALING,
+		.zpos		 = 255,
+		.watermark	 = false,
+		.color_mgmt  = false,
+		.roi		 = false,
+		},
+	},
+};
+
+static const struct vs_dc_info dc_info[] = {
+	{
+		/* DC_REV_0 */
+		.name			= "DC8200",
+		.panel_num		= 2,
+		.plane_num		= 8,
+		.planes			= dc_hw_planes[DC_REV_0],
+		.layer_num		= 6,
+		.max_bpc		= 10,
+		.color_formats	= DRM_COLOR_FORMAT_RGB444 |
+						  DRM_COLOR_FORMAT_YCBCR444 |
+						  DRM_COLOR_FORMAT_YCBCR422 |
+						  DRM_COLOR_FORMAT_YCBCR420,
+		.gamma_size		= GAMMA_EX_SIZE,
+		.gamma_bits		= 12,
+		.pitch_alignment	= 128,
+		.pipe_sync		= false,
+		.mmu_prefetch	= false,
+		.background		= true,
+		.panel_sync		= true,
+		.cap_dec		= true,
+	},
+	{
+		/* DC_REV_1 */
+		.name			= "DC8200",
+		.panel_num		= 2,
+		.plane_num		= 6,
+		.planes			= dc_hw_planes[DC_REV_1],
+		.layer_num		= 4,
+		.max_bpc		= 10,
+		.color_formats	= DRM_COLOR_FORMAT_RGB444 |
+						  DRM_COLOR_FORMAT_YCBCR444 |
+						  DRM_COLOR_FORMAT_YCBCR422 |
+						  DRM_COLOR_FORMAT_YCBCR420,
+		.gamma_size		= GAMMA_EX_SIZE,
+		.gamma_bits		= 12,
+		.pitch_alignment	= 128,
+		.pipe_sync		= false,
+		.mmu_prefetch	= false,
+		.background		= true,
+		.panel_sync		= true,
+		.cap_dec		= true,
+	},
+	{
+		/* DC_REV_2 */
+		.name			= "DC8200",
+		.panel_num		= 2,
+		.plane_num		= 8,
+		.planes			= dc_hw_planes[DC_REV_2],
+		.layer_num		= 6,
+		.max_bpc		= 10,
+		.color_formats	= DRM_COLOR_FORMAT_RGB444 |
+						  DRM_COLOR_FORMAT_YCBCR444 |
+						  DRM_COLOR_FORMAT_YCBCR422 |
+						  DRM_COLOR_FORMAT_YCBCR420,
+		.gamma_size		= GAMMA_EX_SIZE,
+		.gamma_bits		= 12,
+		.pitch_alignment	= 128,
+		.pipe_sync		= false,
+		.mmu_prefetch	= false,
+		.background		= true,
+		.panel_sync		= true,
+		.cap_dec		= false,
+	},
+};
+
+static const struct dc_hw_funcs hw_func;
+
+static inline u32 hi_read(struct dc_hw *hw, u32 reg)
+{
+	return readl(hw->hi_base + reg);
+}
+
+static inline void hi_write(struct dc_hw *hw, u32 reg, u32 value)
+{
+	writel(value, hw->hi_base + reg);
+}
+
+static inline void dc_write(struct dc_hw *hw, u32 reg, u32 value)
+{
+	writel(value, hw->reg_base + reg - DC_REG_BASE);
+}
+
+static inline u32 dc_read(struct dc_hw *hw, u32 reg)
+{
+	u32 value = readl(hw->reg_base + reg - DC_REG_BASE);
+
+	return value;
+}
+
+static inline void dc_set_clear(struct dc_hw *hw, u32 reg, u32 set, u32 clear)
+{
+	u32 value = dc_read(hw, reg);
+
+	value &= ~clear;
+	value |= set;
+	dc_write(hw, reg, value);
+}
+
+static void load_default_filter(struct dc_hw *hw,
+				const struct dc_hw_plane_reg *reg, u32 offset)
+{
+	u8 i;
+
+	dc_write(hw, reg->scale_config + offset, 0x33);
+	dc_write(hw, reg->init_offset + offset, 0x80008000);
+	dc_write(hw, reg->h_filter_coef_index + offset, 0x00);
+	for (i = 0; i < H_COEF_SIZE; i++)
+		dc_write(hw, reg->h_filter_coef_data + offset, horkernel[i]);
+
+	dc_write(hw, reg->v_filter_coef_index + offset, 0x00);
+	for (i = 0; i < V_COEF_SIZE; i++)
+		dc_write(hw, reg->v_filter_coef_data + offset, verkernel[i]);
+}
+
+static void load_rgb_to_rgb(struct dc_hw *hw, const struct dc_hw_plane_reg *reg,
+			    u32 offset, u16 *table)
+{
+	dc_write(hw, reg->rgb_to_rgb_coef0 + offset, table[0] | (table[1] << 16));
+	dc_write(hw, reg->rgb_to_rgb_coef1 + offset, table[2] | (table[3] << 16));
+	dc_write(hw, reg->rgb_to_rgb_coef2 + offset, table[4] | (table[5] << 16));
+	dc_write(hw, reg->rgb_to_rgb_coef3 + offset, table[6] | (table[7] << 16));
+	dc_write(hw, reg->rgb_to_rgb_coef4 + offset, table[8]);
+}
+
+static void load_yuv_to_rgb(struct dc_hw *hw, const struct dc_hw_plane_reg *reg,
+			    u32 offset, s32 *table)
+{
+	dc_write(hw, reg->yuv_to_rgb_coef0 + offset,
+		 (0xFFFF & table[0]) | (table[1] << 16));
+	dc_write(hw, reg->yuv_to_rgb_coef1 + offset,
+		 (0xFFFF & table[2]) | (table[3] << 16));
+	dc_write(hw, reg->yuv_to_rgb_coef2 + offset,
+		 (0xFFFF & table[4]) | (table[5] << 16));
+	dc_write(hw, reg->yuv_to_rgb_coef3 + offset,
+		 (0xFFFF & table[6]) | (table[7] << 16));
+	dc_write(hw, reg->yuv_to_rgb_coef4 + offset, table[8]);
+	dc_write(hw, reg->yuv_to_rgb_coefd0 + offset, table[9]);
+	dc_write(hw, reg->yuv_to_rgb_coefd1 + offset, table[10]);
+	dc_write(hw, reg->yuv_to_rgb_coefd2 + offset, table[11]);
+	dc_write(hw, reg->y_clamp_bound + offset, table[12] | (table[13] << 16));
+	dc_write(hw, reg->uv_clamp_bound + offset, table[14] | (table[15] << 16));
+}
+
+static void load_rgb_to_yuv(struct dc_hw *hw, u32 offset, s16 *table)
+{
+	dc_write(hw, DC_DISPLAY_RGBTOYUV_COEF0 + offset,
+		 table[0] | (table[1] << 16));
+	dc_write(hw, DC_DISPLAY_RGBTOYUV_COEF1 + offset,
+		 table[2] | (table[3] << 16));
+	dc_write(hw, DC_DISPLAY_RGBTOYUV_COEF2 + offset,
+		 table[4] | (table[5] << 16));
+	dc_write(hw, DC_DISPLAY_RGBTOYUV_COEF3 + offset,
+		 table[6] | (table[7] << 16));
+	dc_write(hw, DC_DISPLAY_RGBTOYUV_COEF4 + offset, table[8]);
+	dc_write(hw, DC_DISPLAY_RGBTOYUV_COEFD0 + offset, table[9]);
+	dc_write(hw, DC_DISPLAY_RGBTOYUV_COEFD1 + offset, table[10]);
+	dc_write(hw, DC_DISPLAY_RGBTOYUV_COEFD2 + offset, table[11]);
+}
+
+static bool is_rgb(enum dc_hw_color_format format)
+{
+	switch (format) {
+	case FORMAT_X4R4G4B4:
+	case FORMAT_A4R4G4B4:
+	case FORMAT_X1R5G5B5:
+	case FORMAT_A1R5G5B5:
+	case FORMAT_R5G6B5:
+	case FORMAT_X8R8G8B8:
+	case FORMAT_A8R8G8B8:
+	case FORMAT_A2R10G10B10:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static void load_degamma_table(struct dc_hw *hw,
+			       const struct dc_hw_plane_reg *reg,
+			       u32 offset, u16 *table)
+{
+	u16 i;
+	u32 value;
+
+	dc_write(hw, reg->degamma_index + offset, 0);
+
+	for (i = 0; i < DEGAMMA_SIZE; i++) {
+		value = table[i] | (table[i] << 16);
+		dc_write(hw, reg->degamma_data + offset, value);
+		dc_write(hw, reg->degamma_ex_data + offset, table[i]);
+	}
+}
+
+static u32 get_addr_offset(u32 id)
+{
+	u32 offset = 0;
+
+	switch (id) {
+	case PRIMARY_PLANE_1:
+	case OVERLAY_PLANE_1:
+		offset = 0x04;
+		break;
+	case OVERLAY_PLANE_2:
+		offset = 0x08;
+		break;
+	case OVERLAY_PLANE_3:
+		offset = 0x0C;
+		break;
+	default:
+		break;
+	}
+
+	return offset;
+}
+
+int dc_hw_init(struct dc_hw *hw)
+{
+	u8 i, id, panel_num, layer_num;
+	u32 offset;
+	u32 revision = hi_read(hw, DC_HW_REVISION);
+	u32 cid = hi_read(hw, DC_HW_CHIP_CID);
+	const struct dc_hw_plane_reg *reg;
+
+	switch (revision) {
+	case 0x5720:
+		hw->rev = DC_REV_0;
+		break;
+	case 0x5721:
+		switch (cid) {
+		case 0x30B:
+			hw->rev = DC_REV_1;
+			break;
+		case 0x310:
+			hw->rev = DC_REV_2;
+			break;
+		default:
+			hw->rev = DC_REV_0;
+			break;
+		}
+		break;
+	default:
+		return -ENXIO;
+	}
+
+	hw->info = (struct vs_dc_info *)&dc_info[hw->rev];
+	hw->func = (struct dc_hw_funcs *)&hw_func;
+
+	layer_num = hw->info->layer_num;
+	for (i = 0; i < layer_num; i++) {
+		id = hw->info->planes[i].id;
+		offset = get_addr_offset(id);
+		if (id == PRIMARY_PLANE_0 || id == PRIMARY_PLANE_1)
+			reg = &dc_plane_reg[0];
+		else
+			reg = &dc_plane_reg[1];
+
+		load_default_filter(hw, reg, offset);
+		load_rgb_to_rgb(hw, reg, offset, RGB2RGB);
+	}
+
+	panel_num = hw->info->panel_num;
+	for (i = 0; i < panel_num; i++) {
+		offset = i << 2;
+
+		load_rgb_to_yuv(hw, offset, RGB2YUV);
+		dc_write(hw, DC_DISPLAY_PANEL_CONFIG + offset, 0x111);
+
+		offset = i ? DC_CURSOR_OFFSET : 0;
+		dc_write(hw, DC_CURSOR_BACKGROUND + offset, 0x00FFFFFF);
+		dc_write(hw, DC_CURSOR_FOREGROUND + offset, 0x00AAAAAA);
+	}
+
+	return 0;
+}
+
+void dc_hw_deinit(struct dc_hw *hw)
+{
+	/* Nothing to do */
+}
+
+void dc_hw_update_plane(struct dc_hw *hw, u8 id,
+			struct dc_hw_fb *fb, struct dc_hw_scale *scale,
+			struct dc_hw_position *pos, struct dc_hw_blend *blend)
+{
+	struct dc_hw_plane *plane = &hw->plane[id];
+
+	if (plane) {
+		if (fb) {
+			if (!fb->enable)
+				plane->fb.enable = false;
+			else
+				memcpy(&plane->fb, fb,
+				       sizeof(*fb) - sizeof(fb->dirty));
+			plane->fb.dirty = true;
+		}
+		if (scale) {
+			memcpy(&plane->scale, scale,
+			       sizeof(*scale) - sizeof(scale->dirty));
+			plane->scale.dirty = true;
+		}
+		if (pos) {
+			memcpy(&plane->pos, pos,
+			       sizeof(*pos) - sizeof(pos->dirty));
+			plane->pos.dirty = true;
+		}
+		if (blend) {
+			memcpy(&plane->blend, blend,
+			       sizeof(*blend) - sizeof(blend->dirty));
+			plane->blend.dirty = true;
+		}
+	}
+}
+
+void dc_hw_update_degamma(struct dc_hw *hw, u8 id, u32 mode)
+{
+	struct dc_hw_plane *plane = &hw->plane[id];
+
+	if (plane) {
+		if (hw->info->planes[id].degamma_size) {
+			plane->degamma.mode = mode;
+			plane->degamma.dirty = true;
+		} else {
+			plane->degamma.dirty = false;
+		}
+	}
+}
+
+void dc_hw_update_roi(struct dc_hw *hw, u8 id, struct dc_hw_roi *roi)
+{
+	struct dc_hw_plane *plane = &hw->plane[id];
+
+	if (plane) {
+		memcpy(&plane->roi, roi, sizeof(*roi) - sizeof(roi->dirty));
+		plane->roi.dirty = true;
+	}
+}
+
+void dc_hw_update_colorkey(struct dc_hw *hw, u8 id,
+			   struct dc_hw_colorkey *colorkey)
+{
+	struct dc_hw_plane *plane = &hw->plane[id];
+
+	if (plane) {
+		memcpy(&plane->colorkey, colorkey,
+		       sizeof(*colorkey) - sizeof(colorkey->dirty));
+		plane->colorkey.dirty = true;
+	}
+}
+
+void dc_hw_update_qos(struct dc_hw *hw, struct dc_hw_qos *qos)
+{
+	memcpy(&hw->qos, qos, sizeof(*qos) - sizeof(qos->dirty));
+	hw->qos.dirty = true;
+}
+
+void dc_hw_update_cursor(struct dc_hw *hw, u8 id, struct dc_hw_cursor *cursor)
+{
+	memcpy(&hw->cursor[id], cursor, sizeof(*cursor) - sizeof(cursor->dirty));
+	hw->cursor[id].dirty = true;
+}
+
+void dc_hw_update_gamma(struct dc_hw *hw, u8 id, u16 index,
+			u16 r, u16 g, u16 b)
+{
+	if (index >= hw->info->gamma_size)
+		return;
+
+	hw->gamma[id].gamma[index][0] = r;
+	hw->gamma[id].gamma[index][1] = g;
+	hw->gamma[id].gamma[index][2] = b;
+	hw->gamma[id].dirty = true;
+}
+
+void dc_hw_enable_gamma(struct dc_hw *hw, u8 id, bool enable)
+{
+	hw->gamma[id].enable = enable;
+	hw->gamma[id].dirty = true;
+}
+
+void dc_hw_setup_display(struct dc_hw *hw, struct dc_hw_display *display)
+{
+	u8 id = display->id;
+
+	memcpy(&hw->display[id], display, sizeof(*display));
+
+	hw->func->display(hw, display);
+}
+
+void dc_hw_enable_interrupt(struct dc_hw *hw, bool enable)
+{
+	if (enable)
+		hi_write(hw, AQ_INTR_ENBL, 0xFFFFFFFF);
+	else
+		hi_write(hw, AQ_INTR_ENBL, 0);
+}
+
+u32 dc_hw_get_interrupt(struct dc_hw *hw)
+{
+	return hi_read(hw, AQ_INTR_ACKNOWLEDGE);
+}
+
+bool dc_hw_check_underflow(struct dc_hw *hw)
+{
+	return dc_read(hw, DC_FRAMEBUFFER_CONFIG) & BIT(5);
+}
+
+void dc_hw_enable_shadow_register(struct dc_hw *hw, bool enable)
+{
+	u32 i, offset;
+	u8 id, layer_num = hw->info->layer_num;
+	u8 panel_num = hw->info->panel_num;
+
+	for (i = 0; i < layer_num; i++) {
+		id = hw->info->planes[i].id;
+		offset = get_addr_offset(id);
+		if (enable) {
+			if (id == PRIMARY_PLANE_0 || id == PRIMARY_PLANE_1)
+				dc_set_clear(hw, DC_FRAMEBUFFER_CONFIG_EX + offset, BIT(12), 0);
+			else
+				dc_set_clear(hw, DC_OVERLAY_CONFIG + offset, BIT(31), 0);
+		} else {
+			if (id == PRIMARY_PLANE_0 || id == PRIMARY_PLANE_1)
+				dc_set_clear(hw, DC_FRAMEBUFFER_CONFIG_EX + offset, 0, BIT(12));
+			else
+				dc_set_clear(hw, DC_OVERLAY_CONFIG + offset, 0, BIT(31));
+		}
+	}
+
+	for (i = 0; i < panel_num; i++) {
+		offset = i << 2;
+		if (enable)
+			dc_set_clear(hw, DC_DISPLAY_PANEL_CONFIG_EX + offset, 0, BIT(0));
+		else
+			dc_set_clear(hw, DC_DISPLAY_PANEL_CONFIG_EX + offset, BIT(0), 0);
+	}
+}
+
+void dc_hw_set_out(struct dc_hw *hw, enum dc_hw_out out, u8 id)
+{
+	if (out <= OUT_DP)
+		hw->out[id] = out;
+}
+
+static void gamma_ex_commit(struct dc_hw *hw)
+{
+	u8 panel_num = hw->info->panel_num;
+	u16 i, j;
+	u32 value;
+
+	for (j = 0; j < panel_num; j++) {
+		if (hw->gamma[j].dirty) {
+			if (hw->gamma[j].enable) {
+				dc_write(hw, DC_DISPLAY_GAMMA_EX_INDEX + (j << 2), 0x00);
+				for (i = 0; i < GAMMA_EX_SIZE; i++) {
+					value = hw->gamma[j].gamma[i][2] |
+						(hw->gamma[j].gamma[i][1] << 12);
+					dc_write(hw, DC_DISPLAY_GAMMA_EX_DATA + (j << 2), value);
+					dc_write(hw, DC_DISPLAY_GAMMA_EX_ONE_DATA + (j << 2),
+						 hw->gamma[j].gamma[i][0]);
+				}
+				dc_set_clear(hw, DC_DISPLAY_PANEL_CONFIG + (j << 2),
+					     BIT(13), 0);
+			} else {
+				dc_set_clear(hw, DC_DISPLAY_PANEL_CONFIG + (j << 2),
+					     0, BIT(13));
+			}
+			hw->gamma[j].dirty = false;
+		}
+	}
+}
+
+static void plane_commit(struct dc_hw *hw)
+{
+	struct dc_hw_plane *plane;
+	const struct dc_hw_plane_reg *reg;
+	bool primary = false;
+	u8 id, layer_num = hw->info->layer_num;
+	u32 i, offset;
+
+	for (i = 0; i < layer_num; i++) {
+		plane = &hw->plane[i];
+		id = hw->info->planes[i].id;
+		offset = get_addr_offset(id);
+		if (id == PRIMARY_PLANE_0 || id == PRIMARY_PLANE_1) {
+			reg = &dc_plane_reg[0];
+			primary = true;
+		} else {
+			reg = &dc_plane_reg[1];
+			primary = false;
+		}
+
+		if (plane->fb.dirty) {
+			if (plane->fb.enable) {
+				dc_write(hw, reg->y_address + offset,
+					 plane->fb.y_address);
+				dc_write(hw, reg->u_address + offset,
+					 plane->fb.u_address);
+				dc_write(hw, reg->v_address + offset,
+					 plane->fb.v_address);
+				dc_write(hw, reg->y_stride + offset,
+					 plane->fb.y_stride);
+				dc_write(hw, reg->u_stride + offset,
+					 plane->fb.u_stride);
+				dc_write(hw, reg->v_stride + offset,
+					 plane->fb.v_stride);
+				dc_write(hw, reg->size + offset,
+					 plane->fb.width |
+					 (plane->fb.height << 15));
+				dc_write(hw, reg->water_mark + offset,
+					 plane->fb.water_mark);
+
+				if (plane->fb.clear_enable)
+					dc_write(hw, reg->clear_value + offset,
+						 plane->fb.clear_value);
+			}
+
+			if (primary) {
+				dc_set_clear(hw, DC_FRAMEBUFFER_CONFIG + offset,
+					     (plane->fb.format << 26) |
+					     (plane->fb.uv_swizzle << 25) |
+					     (plane->fb.swizzle << 23) |
+					     (plane->fb.tile_mode << 17) |
+					     (plane->fb.yuv_color_space << 14) |
+					     (plane->fb.rotation << 11) |
+					     (plane->fb.clear_enable << 8),
+					     (0x1F << 26) |
+					     BIT(25) |
+					     (0x03 << 23) |
+					     (0x1F << 17) |
+					     (0x07 << 14) |
+					     (0x07 << 11) |
+					     BIT(8));
+				dc_set_clear(hw, DC_FRAMEBUFFER_CONFIG_EX + offset,
+					     (plane->fb.dec_enable << 1) |
+					     (plane->fb.enable << 13) |
+					     (plane->fb.zpos << 16) |
+					     (plane->fb.display_id << 19),
+					     BIT(1) | BIT(13) | (0x07 << 16) | BIT(19));
+			} else {
+				dc_set_clear(hw, DC_OVERLAY_CONFIG + offset,
+					     (plane->fb.dec_enable << 27) |
+					     (plane->fb.clear_enable << 25) |
+					     (plane->fb.enable << 24) |
+					     (plane->fb.format << 16) |
+					     (plane->fb.uv_swizzle << 15) |
+					     (plane->fb.swizzle << 13) |
+					     (plane->fb.tile_mode << 8) |
+					     (plane->fb.yuv_color_space << 5) |
+					     (plane->fb.rotation << 2),
+					     BIT(27) |
+					     BIT(25) |
+					     BIT(24) |
+					     (0x1F << 16) |
+					     BIT(15) |
+					     (0x03 << 13) |
+					     (0x1F << 8) |
+					     (0x07 << 5) |
+					     (0x07 << 2));
+				dc_set_clear(hw, DC_OVERLAY_CONFIG_EX + offset,
+					     plane->fb.zpos | (plane->fb.display_id << 3),
+					     0x07 | BIT(3));
+			}
+			plane->fb.dirty = false;
+		}
+
+		if (plane->scale.dirty) {
+			if (plane->scale.enable) {
+				dc_write(hw, reg->scale_factor_x + offset,
+					 plane->scale.scale_factor_x);
+				dc_write(hw, reg->scale_factor_y + offset,
+					 plane->scale.scale_factor_y);
+				if (primary)
+					dc_set_clear(hw,
+						     DC_FRAMEBUFFER_CONFIG + offset,
+						     BIT(22), 0);
+				else
+					dc_set_clear(hw,
+						     DC_OVERLAY_SCALE_CONFIG + offset,
+						     BIT(8), 0);
+			} else {
+				if (primary)
+					dc_set_clear(hw,
+						     DC_FRAMEBUFFER_CONFIG + offset,
+						     0, BIT(22));
+				else
+					dc_set_clear(hw,
+						     DC_OVERLAY_SCALE_CONFIG + offset,
+						     0, BIT(8));
+			}
+			plane->scale.dirty = false;
+		}
+
+		if (plane->pos.dirty) {
+			dc_write(hw, reg->top_left + offset,
+				 plane->pos.start_x |
+				 (plane->pos.start_y << 15));
+			dc_write(hw, reg->bottom_right + offset,
+				 plane->pos.end_x |
+				 (plane->pos.end_y << 15));
+			plane->pos.dirty = false;
+		}
+
+		if (plane->blend.dirty) {
+			dc_write(hw, reg->src_global_color + offset,
+				 plane->blend.alpha << 24);
+			dc_write(hw, reg->dst_global_color + offset,
+				 plane->blend.alpha << 24);
+			switch (plane->blend.blend_mode) {
+			case BLEND_PREMULTI:
+				dc_write(hw, reg->blend_config + offset, 0x3450);
+				break;
+			case BLEND_COVERAGE:
+				dc_write(hw, reg->blend_config + offset, 0x3950);
+				break;
+			case BLEND_PIXEL_NONE:
+				dc_write(hw, reg->blend_config + offset, 0x3548);
+				break;
+			default:
+				break;
+			}
+			plane->blend.dirty = false;
+		}
+
+		if (plane->colorkey.dirty) {
+			dc_write(hw, reg->color_key + offset, plane->colorkey.colorkey);
+			dc_write(hw, reg->color_key_high + offset,
+				 plane->colorkey.colorkey_high);
+
+			if (primary)
+				dc_set_clear(hw, DC_FRAMEBUFFER_CONFIG + offset,
+					     plane->colorkey.transparency << 9, 0x03 << 9);
+			else
+				dc_set_clear(hw, DC_OVERLAY_CONFIG + offset,
+					     plane->colorkey.transparency, 0x03);
+
+			plane->colorkey.dirty = false;
+		}
+
+		if (plane->roi.dirty) {
+			if (plane->roi.enable) {
+				dc_write(hw, reg->roi_origin + offset,
+					 plane->roi.x | (plane->roi.y << 16));
+				dc_write(hw, reg->roi_size + offset,
+					 plane->roi.width | (plane->roi.height << 16));
+				if (primary)
+					dc_set_clear(hw, DC_FRAMEBUFFER_CONFIG_EX + offset,
+						     BIT(0), 0);
+				else
+					dc_set_clear(hw, DC_OVERLAY_CONFIG + offset,
+						     BIT(22), 0);
+			} else {
+				if (primary)
+					dc_set_clear(hw, DC_FRAMEBUFFER_CONFIG_EX + offset,
+						     0, BIT(0));
+				else
+					dc_set_clear(hw, DC_OVERLAY_CONFIG + offset,
+						     0, BIT(22));
+			}
+			plane->roi.dirty = false;
+		}
+	}
+}
+
+static void plane_ex_commit(struct dc_hw *hw)
+{
+	struct dc_hw_plane *plane;
+	const struct dc_hw_plane_reg *reg;
+	bool primary = false;
+	u8 id, layer_num = hw->info->layer_num;
+	u32 i, offset;
+
+	for (i = 0; i < layer_num; i++) {
+		plane = &hw->plane[i];
+		id = hw->info->planes[i].id;
+		offset = get_addr_offset(id);
+		if (id == PRIMARY_PLANE_0 || id == PRIMARY_PLANE_1) {
+			reg = &dc_plane_reg[0];
+			primary = true;
+		} else {
+			reg = &dc_plane_reg[1];
+			primary = false;
+		}
+
+		if (plane->fb.dirty) {
+			if (is_rgb(plane->fb.format)) {
+				if (primary)
+					dc_set_clear(hw,
+						     DC_FRAMEBUFFER_CONFIG_EX + offset,
+						     BIT(6), BIT(8));
+				else
+					dc_set_clear(hw,
+						     DC_OVERLAY_CONFIG + offset,
+						     BIT(29), BIT(30));
+			} else {
+				if (primary)
+					dc_set_clear(hw,
+						     DC_FRAMEBUFFER_CONFIG_EX + offset,
+						     BIT(8), BIT(6));
+				else
+					dc_set_clear(hw,
+						     DC_OVERLAY_CONFIG + offset,
+						     BIT(30), BIT(29));
+				switch (plane->fb.yuv_color_space) {
+				case COLOR_SPACE_601:
+					load_yuv_to_rgb(hw, reg, offset, YUV601_2RGB);
+					break;
+				case COLOR_SPACE_709:
+					load_yuv_to_rgb(hw, reg, offset, YUV709_2RGB);
+					break;
+				case COLOR_SPACE_2020:
+					load_yuv_to_rgb(hw, reg, offset, YUV2020_2RGB);
+					break;
+				default:
+					break;
+				}
+			}
+		}
+		if (plane->degamma.dirty) {
+			switch (plane->degamma.mode) {
+			case VS_DEGAMMA_DISABLE:
+				if (primary)
+					dc_set_clear(hw,
+						     DC_FRAMEBUFFER_CONFIG_EX + offset,
+						     0, BIT(5));
+				else
+					dc_set_clear(hw,
+						     DC_OVERLAY_CONFIG + offset,
+						     0, BIT(28));
+				break;
+			case VS_DEGAMMA_BT709:
+				load_degamma_table(hw, reg, offset, DEGAMMA_709);
+				if (primary)
+					dc_set_clear(hw,
+						     DC_FRAMEBUFFER_CONFIG_EX + offset,
+						     BIT(5), 0);
+				else
+					dc_set_clear(hw,
+						     DC_OVERLAY_CONFIG + offset,
+						     BIT(28), 0);
+				break;
+			case VS_DEGAMMA_BT2020:
+				load_degamma_table(hw, reg, offset, DEGAMMA_2020);
+				if (primary)
+					dc_set_clear(hw,
+						     DC_FRAMEBUFFER_CONFIG_EX + offset,
+						     BIT(5), 0);
+				else
+					dc_set_clear(hw,
+						     DC_OVERLAY_CONFIG + offset,
+						     BIT(28), 0);
+				break;
+			default:
+				break;
+			}
+			plane->degamma.dirty = false;
+		}
+	}
+	plane_commit(hw);
+}
+
+static void setup_display(struct dc_hw *hw, struct dc_hw_display *display)
+{
+	u8 id = display->id;
+	u32 dpi_cfg, offset = id << 2;
+
+	if (hw->display[id].enable) {
+		switch (display->bus_format) {
+		case MEDIA_BUS_FMT_RGB565_1X16:
+			dpi_cfg = 0;
+			break;
+		case MEDIA_BUS_FMT_RGB666_1X18:
+			dpi_cfg = 3;
+			break;
+		case MEDIA_BUS_FMT_RGB666_1X24_CPADHI:
+			dpi_cfg = 4;
+			break;
+		case MEDIA_BUS_FMT_RGB888_1X24:
+			dpi_cfg = 5;
+			break;
+		case MEDIA_BUS_FMT_RGB101010_1X30:
+			dpi_cfg = 6;
+			break;
+		default:
+			dpi_cfg = 5;
+			break;
+		}
+		dc_write(hw, DC_DISPLAY_DPI_CONFIG + offset, dpi_cfg);
+
+		if (id == 0)
+			dc_set_clear(hw, DC_DISPLAY_PANEL_START, 0, BIT(0) | BIT(2));
+		else
+			dc_set_clear(hw, DC_DISPLAY_PANEL_START, 0, BIT(1) | BIT(2));
+
+		dc_write(hw, DC_DISPLAY_H + offset, hw->display[id].h_active |
+			 (hw->display[id].h_total << 16));
+		dc_write(hw, DC_DISPLAY_H_SYNC + offset,
+			 hw->display[id].h_sync_start |
+			 (hw->display[id].h_sync_end << 15) |
+			 (hw->display[id].h_sync_polarity ? 0 : BIT(31)) |
+			 BIT(30));
+		dc_write(hw, DC_DISPLAY_V + offset, hw->display[id].v_active |
+				(hw->display[id].v_total << 16));
+		dc_write(hw, DC_DISPLAY_V_SYNC + offset,
+			 hw->display[id].v_sync_start |
+			 (hw->display[id].v_sync_end << 15) |
+			 (hw->display[id].v_sync_polarity ? 0 : BIT(31)) |
+			 BIT(30));
+
+		if (hw->info->pipe_sync) {
+			switch (display->sync_mode) {
+			case VS_SINGLE_DC:
+				dc_set_clear(hw, DC_FRAMEBUFFER_CONFIG_EX,
+					     0, BIT(3) | BIT(4));
+				break;
+			case VS_MULTI_DC_PRIMARY:
+				dc_set_clear(hw, DC_FRAMEBUFFER_CONFIG_EX,
+					     BIT(3) | BIT(4), 0);
+				break;
+			case VS_MULTI_DC_SECONDARY:
+				dc_set_clear(hw, DC_FRAMEBUFFER_CONFIG_EX,
+					     BIT(3), BIT(4));
+				break;
+			default:
+				break;
+			}
+		}
+
+		if (hw->info->background)
+			dc_write(hw, DC_FRAMEBUFFER_BG_COLOR + offset,
+				 hw->display[id].bg_color);
+
+		if (hw->display[id].dither_enable) {
+			dc_write(hw, DC_DISPLAY_DITHER_TABLE_LOW + offset,
+				 DC_DISPLAY_DITHERTABLE_LOW);
+			dc_write(hw, DC_DISPLAY_DITHER_TABLE_HIGH + offset,
+				 DC_DISPLAY_DITHERTABLE_HIGH);
+			dc_write(hw, DC_DISPLAY_DITHER_CONFIG + offset, BIT(31));
+		} else {
+			dc_write(hw, DC_DISPLAY_DITHER_CONFIG + offset, 0);
+		}
+
+		dc_set_clear(hw, DC_DISPLAY_PANEL_CONFIG + offset, BIT(12), 0);
+		if (hw->display[id].sync_enable)
+			dc_set_clear(hw, DC_DISPLAY_PANEL_START, BIT(2) | BIT(3), 0);
+		else if (id == 0)
+			dc_set_clear(hw, DC_DISPLAY_PANEL_START, BIT(0), BIT(3));
+		else
+			dc_set_clear(hw, DC_DISPLAY_PANEL_START, BIT(1), BIT(3));
+	} else {
+		dc_set_clear(hw, DC_DISPLAY_PANEL_CONFIG + offset, 0, BIT(12));
+		if (id == 0)
+			dc_set_clear(hw, DC_DISPLAY_PANEL_START, 0, BIT(0) | BIT(2));
+		else
+			dc_set_clear(hw, DC_DISPLAY_PANEL_START, 0, BIT(1) | BIT(2));
+	}
+}
+
+static void setup_display_ex(struct dc_hw *hw, struct dc_hw_display *display)
+{
+	u8 id = display->id;
+	u32 dp_cfg, offset = id << 2;
+	bool is_yuv = false;
+
+	if (hw->display[id].enable && hw->out[id] == OUT_DP) {
+		switch (display->bus_format) {
+		case MEDIA_BUS_FMT_RGB565_1X16:
+			dp_cfg = 0;
+			break;
+		case MEDIA_BUS_FMT_RGB666_1X18:
+			dp_cfg = 1;
+			break;
+		case MEDIA_BUS_FMT_RGB888_1X24:
+			dp_cfg = 2;
+			break;
+		case MEDIA_BUS_FMT_RGB101010_1X30:
+			dp_cfg = 3;
+			break;
+		case MEDIA_BUS_FMT_UYVY8_1X16:
+			dp_cfg = 2 << 4;
+			is_yuv = true;
+			break;
+		case MEDIA_BUS_FMT_YUV8_1X24:
+			dp_cfg = 4 << 4;
+			is_yuv = true;
+			break;
+		case MEDIA_BUS_FMT_UYVY10_1X20:
+			dp_cfg = 8 << 4;
+			is_yuv = true;
+			break;
+		case MEDIA_BUS_FMT_YUV10_1X30:
+			dp_cfg = 10 << 4;
+			is_yuv = true;
+			break;
+		case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
+			dp_cfg = 12 << 4;
+			is_yuv = true;
+			break;
+		case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
+			dp_cfg = 13 << 4;
+			is_yuv = true;
+			break;
+		default:
+			dp_cfg = 2;
+			break;
+		}
+		if (is_yuv)
+			dc_set_clear(hw, DC_DISPLAY_PANEL_CONFIG + offset, BIT(16), 0);
+		else
+			dc_set_clear(hw, DC_DISPLAY_PANEL_CONFIG + offset, 0, BIT(16));
+		dc_write(hw, DC_DISPLAY_DP_CONFIG + offset, dp_cfg | BIT(3));
+	}
+
+	if (hw->out[id] == OUT_DPI)
+		dc_set_clear(hw, DC_DISPLAY_DP_CONFIG + offset, 0, BIT(3));
+
+	setup_display(hw, display);
+}
+
+static const struct dc_hw_funcs hw_func = {
+	.gamma = &gamma_ex_commit,
+	.plane = &plane_ex_commit,
+	.display = setup_display_ex,
+};
+
+void dc_hw_commit(struct dc_hw *hw)
+{
+	u32 i, offset = 0;
+	u8 plane_num = hw->info->plane_num;
+	u8 layer_num = hw->info->layer_num;
+	u8 cursor_num = plane_num - layer_num;
+
+	hw->func->gamma(hw);
+	hw->func->plane(hw);
+
+	for (i = 0; i < cursor_num; i++) {
+		if (hw->cursor[i].dirty) {
+			offset = hw->cursor[i].display_id ? DC_CURSOR_OFFSET : 0;
+			if (hw->cursor[i].enable) {
+				dc_write(hw, DC_CURSOR_ADDRESS + offset,
+					 hw->cursor[i].address);
+				dc_write(hw, DC_CURSOR_LOCATION + offset, hw->cursor[i].x |
+					 (hw->cursor[i].y << 16));
+				dc_set_clear(hw, DC_CURSOR_CONFIG + offset,
+					     (hw->cursor[i].hot_x << 16) |
+					     (hw->cursor[i].hot_y << 8) |
+					     (hw->cursor[i].size << 5) |
+					     BIT(3) | BIT(2) | 0x02,
+					     (0xFF << 16) |
+					     (0xFF << 8) |
+					     (0x07 << 5) | 0x1F);
+			} else {
+				dc_set_clear(hw, DC_CURSOR_CONFIG + offset, BIT(3), 0x03);
+			}
+			hw->cursor[i].dirty = false;
+		}
+	}
+
+	if (hw->qos.dirty) {
+		dc_set_clear(hw, DC_QOS_CONFIG, (hw->qos.high_value << 4) |
+					 hw->qos.low_value, 0xFF);
+		hw->qos.dirty = false;
+	}
+}
+
diff --git a/drivers/gpu/drm/verisilicon/vs_dc_hw.h b/drivers/gpu/drm/verisilicon/vs_dc_hw.h
new file mode 100644
index 000000000000..cd037718ecd5
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_dc_hw.h
@@ -0,0 +1,496 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
+ */
+
+#ifndef __VS_DC_HW_H__
+#define __VS_DC_HW_H__
+
+#include <linux/version.h>
+
+#define AQ_INTR_ACKNOWLEDGE				0x0010
+#define AQ_INTR_ENBL					0x0014
+#define DC_HW_REVISION					0x0024
+#define DC_HW_CHIP_CID					0x0030
+
+#define DC_REG_BASE					0x0800
+#define DC_REG_RANGE					0x2000
+#define DC_SEC_REG_OFFSET				0x100000
+
+#define DC_FRAMEBUFFER_CONFIG				0x1518
+#define DC_FRAMEBUFFER_CONFIG_EX			0x1cc0
+#define DC_FRAMEBUFFER_SCALE_CONFIG			0x1520
+#define DC_FRAMEBUFFER_TOP_LEFT				0x24d8
+#define DC_FRAMEBUFFER_BOTTOM_RIGHT			0x24e0
+#define DC_FRAMEBUFFER_ADDRESS				0x1400
+#define DC_FRAMEBUFFER_U_ADDRESS			0x1530
+#define DC_FRAMEBUFFER_V_ADDRESS			0x1538
+#define DC_FRAMEBUFFER_STRIDE				0x1408
+#define DC_FRAMEBUFFER_U_STRIDE				0x1800
+#define DC_FRAMEBUFFER_V_STRIDE				0x1808
+#define DC_FRAMEBUFFER_SIZE				0x1810
+#define DC_FRAMEBUFFER_SCALE_FACTOR_X			0x1828
+#define DC_FRAMEBUFFER_SCALE_FACTOR_Y			0x1830
+#define DC_FRAMEBUFFER_H_FILTER_COEF_INDEX		0x1838
+#define DC_FRAMEBUFFER_H_FILTER_COEF_DATA		0x1a00
+#define DC_FRAMEBUFFER_V_FILTER_COEF_INDEX		0x1a08
+#define DC_FRAMEBUFFER_V_FILTER_COEF_DATA		0x1a10
+#define DC_FRAMEBUFFER_INIT_OFFSET			0x1a20
+#define DC_FRAMEBUFFER_COLOR_KEY			0x1508
+#define DC_FRAMEBUFFER_COLOR_KEY_HIGH			0x1510
+#define DC_FRAMEBUFFER_CLEAR_VALUE			0x1a18
+#define DC_FRAMEBUFFER_COLOR_TABLE_INDEX		0x1818
+#define DC_FRAMEBUFFER_COLOR_TABLE_DATA			0x1820
+#define DC_FRAMEBUFFER_BG_COLOR				0x1528
+#define DC_FRAMEBUFFER_ROI_ORIGIN			0x1cb0
+#define DC_FRAMEBUFFER_ROI_SIZE				0x1cb8
+#define DC_FRAMEBUFFER_WATER_MARK			0x1ce8
+#define DC_FRAMEBUFFER_DEGAMMA_INDEX			0x1d88
+#define DC_FRAMEBUFFER_DEGAMMA_DATA			0x1d90
+#define DC_FRAMEBUFFER_DEGAMMA_EX_DATA			0x1d98
+#define DC_FRAMEBUFFER_YUVTORGB_COEF0			0x1da0
+#define DC_FRAMEBUFFER_YUVTORGB_COEF1			0x1da8
+#define DC_FRAMEBUFFER_YUVTORGB_COEF2			0x1db0
+#define DC_FRAMEBUFFER_YUVTORGB_COEF3			0x1db8
+#define DC_FRAMEBUFFER_YUVTORGB_COEF4			0x1e00
+#define DC_FRAMEBUFFER_YUVTORGB_COEFD0			0x1e08
+#define DC_FRAMEBUFFER_YUVTORGB_COEFD1			0x1e10
+#define DC_FRAMEBUFFER_YUVTORGB_COEFD2			0x1e18
+#define DC_FRAMEBUFFER_Y_CLAMP_BOUND			0x1e88
+#define DC_FRAMEBUFFER_UV_CLAMP_BOUND			0x1e90
+#define DC_FRAMEBUFFER_RGBTORGB_COEF0			0x1e20
+#define DC_FRAMEBUFFER_RGBTORGB_COEF1			0x1e28
+#define DC_FRAMEBUFFER_RGBTORGB_COEF2			0x1e30
+#define DC_FRAMEBUFFER_RGBTORGB_COEF3			0x1e38
+#define DC_FRAMEBUFFER_RGBTORGB_COEF4			0x1e40
+#define DC_FRAMEBUFFER_BLEND_CONFIG			0x2510
+#define DC_FRAMEBUFFER_SRC_GLOBAL_COLOR			0x2500
+#define DC_FRAMEBUFFER_DST_GLOBAL_COLOR			0x2508
+
+#define DC_OVERLAY_CONFIG				0x1540
+#define DC_OVERLAY_CONFIG_EX				0x2540
+#define DC_OVERLAY_SCALE_CONFIG				0x1c00
+#define DC_OVERLAY_BLEND_CONFIG				0x1580
+#define DC_OVERLAY_TOP_LEFT				0x1640
+#define DC_OVERLAY_BOTTOM_RIGHT				0x1680
+#define DC_OVERLAY_ADDRESS				0x15c0
+#define DC_OVERLAY_U_ADDRESS				0x1840
+#define DC_OVERLAY_V_ADDRESS				0x1880
+#define DC_OVERLAY_STRIDE				0x1600
+#define DC_OVERLAY_U_STRIDE				0x18c0
+#define DC_OVERLAY_V_STRIDE				0x1900
+#define DC_OVERLAY_SIZE					0x17c0
+#define DC_OVERLAY_SCALE_FACTOR_X			0x1a40
+#define DC_OVERLAY_SCALE_FACTOR_Y			0x1a80
+#define DC_OVERLAY_H_FILTER_COEF_INDEX			0x1aC0
+#define DC_OVERLAY_H_FILTER_COEF_DATA			0x1b00
+#define DC_OVERLAY_V_FILTER_COEF_INDEX			0x1b40
+#define DC_OVERLAY_V_FILTER_COEF_DATA			0x1b80
+#define DC_OVERLAY_INIT_OFFSET				0x1bC0
+#define DC_OVERLAY_COLOR_KEY				0x1740
+#define DC_OVERLAY_COLOR_KEY_HIGH			0x1780
+#define DC_OVERLAY_CLEAR_VALUE				0x1940
+#define DC_OVERLAY_COLOR_TABLE_INDEX			0x1980
+#define DC_OVERLAY_COLOR_TABLE_DATA			0x19c0
+#define DC_OVERLAY_SRC_GLOBAL_COLOR			0x16c0
+#define DC_OVERLAY_DST_GLOBAL_COLOR			0x1700
+#define DC_OVERLAY_ROI_ORIGIN				0x1d00
+#define DC_OVERLAY_ROI_SIZE				0x1d40
+#define DC_OVERLAY_WATER_MARK				0x1dc0
+#define DC_OVERLAY_DEGAMMA_INDEX			0x2200
+#define DC_OVERLAY_DEGAMMA_DATA				0x2240
+#define DC_OVERLAY_DEGAMMA_EX_DATA			0x2280
+#define DC_OVERLAY_YUVTORGB_COEF0			0x1ec0
+#define DC_OVERLAY_YUVTORGB_COEF1			0x1f00
+#define DC_OVERLAY_YUVTORGB_COEF2			0x1f40
+#define DC_OVERLAY_YUVTORGB_COEF3			0x1f80
+#define DC_OVERLAY_YUVTORGB_COEF4			0x1fc0
+#define DC_OVERLAY_YUVTORGB_COEFD0			0x2000
+#define DC_OVERLAY_YUVTORGB_COEFD1			0x2040
+#define DC_OVERLAY_YUVTORGB_COEFD2			0x2080
+#define DC_OVERLAY_Y_CLAMP_BOUND			0x22c0
+#define DC_OVERLAY_UV_CLAMP_BOUND			0x2300
+#define DC_OVERLAY_RGBTORGB_COEF0			0x20c0
+#define DC_OVERLAY_RGBTORGB_COEF1			0x2100
+#define DC_OVERLAY_RGBTORGB_COEF2			0x2140
+#define DC_OVERLAY_RGBTORGB_COEF3			0x2180
+#define DC_OVERLAY_RGBTORGB_COEF4			0x21c0
+
+#define DC_CURSOR_CONFIG				0x1468
+#define DC_CURSOR_ADDRESS				0x146c
+#define DC_CURSOR_LOCATION				0x1470
+#define DC_CURSOR_BACKGROUND				0x1474
+#define DC_CURSOR_FOREGROUND				0x1478
+#define DC_CURSOR_CLK_GATING				0x1484
+#define DC_CURSOR_CONFIG_EX				0x24e8
+#define DC_CURSOR_OFFSET				0x1080
+
+#define DC_DISPLAY_DITHER_CONFIG			0x1410
+#define DC_DISPLAY_PANEL_CONFIG				0x1418
+#define DC_DISPLAY_PANEL_CONFIG_EX			0x2518
+#define DC_DISPLAY_DITHER_TABLE_LOW			0x1420
+#define DC_DISPLAY_DITHER_TABLE_HIGH			0x1428
+#define DC_DISPLAY_H					0x1430
+#define DC_DISPLAY_H_SYNC				0x1438
+#define DC_DISPLAY_V					0x1440
+#define DC_DISPLAY_V_SYNC				0x1448
+#define DC_DISPLAY_CURRENT_LOCATION			0x1450
+#define DC_DISPLAY_GAMMA_INDEX				0x1458
+#define DC_DISPLAY_GAMMA_DATA				0x1460
+#define DC_DISPLAY_INT					0x147c
+#define DC_DISPLAY_INT_ENABLE				0x1480
+#define DC_DISPLAY_DBI_CONFIG				0x1488
+#define DC_DISPLAY_GENERAL_CONFIG			0x14b0
+#define DC_DISPLAY_DPI_CONFIG				0x14b8
+#define DC_DISPLAY_PANEL_START				0x1ccc
+#define DC_DISPLAY_DEBUG_COUNTER_SELECT			0x14d0
+#define DC_DISPLAY_DEBUG_COUNTER_VALUE			0x14d8
+#define DC_DISPLAY_DP_CONFIG				0x1cd0
+#define DC_DISPLAY_GAMMA_EX_INDEX			0x1cf0
+#define DC_DISPLAY_GAMMA_EX_DATA			0x1cf8
+#define DC_DISPLAY_GAMMA_EX_ONE_DATA			0x1d80
+#define DC_DISPLAY_RGBTOYUV_COEF0			0x1e48
+#define DC_DISPLAY_RGBTOYUV_COEF1			0x1e50
+#define DC_DISPLAY_RGBTOYUV_COEF2			0x1e58
+#define DC_DISPLAY_RGBTOYUV_COEF3			0x1e60
+#define DC_DISPLAY_RGBTOYUV_COEF4			0x1e68
+#define DC_DISPLAY_RGBTOYUV_COEFD0			0x1e70
+#define DC_DISPLAY_RGBTOYUV_COEFD1			0x1e78
+#define DC_DISPLAY_RGBTOYUV_COEFD2			0x1e80
+
+#define DC_CLK_GATTING					0x1a28
+#define DC_QOS_CONFIG					0x1a38
+
+#define DC_TRANSPARENCY_OPAQUE				0x00
+#define DC_TRANSPARENCY_KEY				0x02
+#define DC_DISPLAY_DITHERTABLE_LOW			0x7b48f3c0
+#define DC_DISPLAY_DITHERTABLE_HIGH			0x596ad1e2
+
+#define GAMMA_SIZE					256
+#define GAMMA_EX_SIZE					300
+#define DEGAMMA_SIZE					260
+
+#define RGB_TO_RGB_TABLE_SIZE				9
+#define YUV_TO_RGB_TABLE_SIZE				16
+#define RGB_TO_YUV_TABLE_SIZE				12
+
+#define DC_LAYER_NUM					6
+#define DC_DISPLAY_NUM					2
+#define DC_CURSOR_NUM					2
+
+enum dc_chip_rev {
+	DC_REV_0,/* For HW_REV_5720,HW_REV_5721_311 */
+	DC_REV_1,/* For HW_REV_5721_30B */
+	DC_REV_2,/* For HW_REV_5721_310 */
+};
+
+enum dc_hw_plane_id {
+	PRIMARY_PLANE_0,
+	OVERLAY_PLANE_0,
+	OVERLAY_PLANE_1,
+	PRIMARY_PLANE_1,
+	OVERLAY_PLANE_2,
+	OVERLAY_PLANE_3,
+	CURSOR_PLANE_0,
+	CURSOR_PLANE_1,
+	PLANE_NUM
+};
+
+enum dc_hw_color_format {
+	FORMAT_X4R4G4B4,//0
+	FORMAT_A4R4G4B4,//1
+	FORMAT_X1R5G5B5,//2
+	FORMAT_A1R5G5B5,//3
+	FORMAT_R5G6B5,//4
+	FORMAT_X8R8G8B8,//5
+	FORMAT_A8R8G8B8,//6
+	FORMAT_YUY2,//7
+	FORMAT_UYVY,//8
+	FORMAT_INDEX8,//9
+	FORMAT_MONOCHROME,//10
+	FORMAT_YV12 = 0xf,
+	FORMAT_A8,//16
+	FORMAT_NV12,//17
+	FORMAT_NV16,//18
+	FORMAT_RG16,//19
+	FORMAT_R8,//20
+	FORMAT_NV12_10BIT,//21
+	FORMAT_A2R10G10B10,//22
+	FORMAT_NV16_10BIT,//23
+	FORMAT_INDEX1,//24
+	FORMAT_INDEX2,//25
+	FORMAT_INDEX4,//26
+	FORMAT_P010,//27
+	FORMAT_YUV444,//28
+	FORMAT_YUV444_10BIT,//29
+};
+
+enum dc_hw_yuv_color_space {
+	COLOR_SPACE_601 = 0,
+	COLOR_SPACE_709 = 1,
+	COLOR_SPACE_2020 = 3,
+};
+
+enum dc_hw_rotation {
+	ROT_0 = 0,
+	ROT_90 = 4,
+	ROT_180 = 5,
+	ROT_270 = 6,
+	FLIP_X = 1,
+	FLIP_Y = 2,
+	FLIP_XY = 3,
+};
+
+enum dc_hw_swizzle {
+	SWIZZLE_ARGB = 0,
+	SWIZZLE_RGBA,
+	SWIZZLE_ABGR,
+	SWIZZLE_BGRA,
+};
+
+enum dc_hw_out {
+	OUT_DPI,
+	OUT_DP,
+};
+
+enum dc_hw_cursor_size {
+	CURSOR_SIZE_32X32 = 0,
+	CURSOR_SIZE_64X64,
+};
+
+enum dc_hw_blend_mode {
+	/* out.rgb = plane_alpha * fg.rgb +
+	 *		(1 - (plane_alpha * fg.alpha)) * bg.rgb
+	 */
+	BLEND_PREMULTI,
+	/* out.rgb = plane_alpha * fg.alpha * fg.rgb +
+	 *		(1 - (plane_alpha * fg.alpha)) * bg.rgb
+	 */
+	BLEND_COVERAGE,
+	/* out.rgb = plane_alpha * fg.rgb +
+	 *		(1 - plane_alpha) * bg.rgb
+	 */
+	BLEND_PIXEL_NONE,
+};
+
+struct dc_hw_plane_reg {
+	u32 y_address;
+	u32 u_address;
+	u32 v_address;
+	u32 y_stride;
+	u32 u_stride;
+	u32 v_stride;
+	u32 size;
+	u32 top_left;
+	u32 bottom_right;
+	u32 scale_factor_x;
+	u32 scale_factor_y;
+	u32 h_filter_coef_index;
+	u32 h_filter_coef_data;
+	u32 v_filter_coef_index;
+	u32 v_filter_coef_data;
+	u32 init_offset;
+	u32 color_key;
+	u32 color_key_high;
+	u32 clear_value;
+	u32 color_table_index;
+	u32 color_table_data;
+	u32 scale_config;
+	u32 water_mark;
+	u32 degamma_index;
+	u32 degamma_data;
+	u32 degamma_ex_data;
+	u32 src_global_color;
+	u32 dst_global_color;
+	u32 blend_config;
+	u32 roi_origin;
+	u32 roi_size;
+	u32 yuv_to_rgb_coef0;
+	u32 yuv_to_rgb_coef1;
+	u32 yuv_to_rgb_coef2;
+	u32 yuv_to_rgb_coef3;
+	u32 yuv_to_rgb_coef4;
+	u32 yuv_to_rgb_coefd0;
+	u32 yuv_to_rgb_coefd1;
+	u32 yuv_to_rgb_coefd2;
+	u32 y_clamp_bound;
+	u32 uv_clamp_bound;
+	u32 rgb_to_rgb_coef0;
+	u32 rgb_to_rgb_coef1;
+	u32 rgb_to_rgb_coef2;
+	u32 rgb_to_rgb_coef3;
+	u32 rgb_to_rgb_coef4;
+};
+
+struct dc_hw_fb {
+	u32 y_address;
+	u32 u_address;
+	u32 v_address;
+	u32 clear_value;
+	u32 water_mark;
+	u16 y_stride;
+	u16 u_stride;
+	u16 v_stride;
+	u16 width;
+	u16 height;
+	u8	format;
+	u8	tile_mode;
+	u8	rotation;
+	u8	yuv_color_space;
+	u8	swizzle;
+	u8	uv_swizzle;
+	u8	zpos;
+	u8	display_id;
+	bool	clear_enable;
+	bool	dec_enable;
+	bool	enable;
+	bool	dirty;
+};
+
+struct dc_hw_scale {
+	u32 scale_factor_x;
+	u32 scale_factor_y;
+	bool	enable;
+	bool	dirty;
+};
+
+struct dc_hw_position {
+	u16 start_x;
+	u16 start_y;
+	u16 end_x;
+	u16 end_y;
+	bool	dirty;
+};
+
+struct dc_hw_blend {
+	u8	alpha;
+	u8	blend_mode;
+	bool	dirty;
+};
+
+struct dc_hw_colorkey {
+	u32 colorkey;
+	u32 colorkey_high;
+	u8	transparency;
+	bool dirty;
+};
+
+struct dc_hw_roi {
+	u16 x;
+	u16 y;
+	u16 width;
+	u16 height;
+	bool enable;
+	bool dirty;
+};
+
+struct dc_hw_cursor {
+	u32 address;
+	u16 x;
+	u16 y;
+	u16 hot_x;
+	u16 hot_y;
+	u8	size;
+	u8	display_id;
+	bool	enable;
+	bool	dirty;
+};
+
+struct dc_hw_display {
+	u32 bus_format;
+	u16 h_active;
+	u16 h_total;
+	u16 h_sync_start;
+	u16 h_sync_end;
+	u16 v_active;
+	u16 v_total;
+	u16 v_sync_start;
+	u16 v_sync_end;
+	u16 sync_mode;
+	u32 bg_color;
+	u8	id;
+	bool	h_sync_polarity;
+	bool	v_sync_polarity;
+	bool	enable;
+	bool	sync_enable;
+	bool	dither_enable;
+};
+
+struct dc_hw_gamma {
+	u16 gamma[GAMMA_EX_SIZE][3];
+	bool	enable;
+	bool	dirty;
+};
+
+struct dc_hw_degamma {
+	u16 degamma[DEGAMMA_SIZE][3];
+	u32 mode;
+	bool	dirty;
+};
+
+struct dc_hw_plane {
+	struct dc_hw_fb			fb;
+	struct dc_hw_position	pos;
+	struct dc_hw_scale		scale;
+	struct dc_hw_blend		blend;
+	struct dc_hw_roi		roi;
+	struct dc_hw_colorkey	colorkey;
+	struct dc_hw_degamma	degamma;
+};
+
+struct dc_hw_qos {
+	u8	  low_value;
+	u8	  high_value;
+	bool  dirty;
+};
+
+struct dc_hw_read {
+	u32			reg;
+	u32			value;
+};
+
+struct dc_hw;
+struct dc_hw_funcs {
+	void (*gamma)(struct dc_hw *hw);
+	void (*plane)(struct dc_hw *hw);
+	void (*display)(struct dc_hw *hw, struct dc_hw_display *display);
+};
+
+struct dc_hw {
+	enum dc_chip_rev rev;
+	enum dc_hw_out		out[DC_DISPLAY_NUM];
+	void			*hi_base;
+	void			*reg_base;
+
+	struct dc_hw_display display[DC_DISPLAY_NUM];
+	struct dc_hw_gamma	 gamma[DC_DISPLAY_NUM];
+	struct dc_hw_plane	 plane[DC_LAYER_NUM];
+	struct dc_hw_cursor  cursor[DC_CURSOR_NUM];
+	struct dc_hw_qos	 qos;
+	struct dc_hw_funcs	 *func;
+	struct vs_dc_info	 *info;
+};
+
+int dc_hw_init(struct dc_hw *hw);
+void dc_hw_deinit(struct dc_hw *hw);
+void dc_hw_update_plane(struct dc_hw *hw, u8 id,
+			struct dc_hw_fb *fb, struct dc_hw_scale *scale,
+			struct dc_hw_position *pos, struct dc_hw_blend *blend);
+void dc_hw_update_degamma(struct dc_hw *hw, u8 id, u32 mode);
+void dc_hw_update_roi(struct dc_hw *hw, u8 id, struct dc_hw_roi *roi);
+void dc_hw_update_colorkey(struct dc_hw *hw, u8 id,
+			   struct dc_hw_colorkey *colorkey);
+void dc_hw_update_qos(struct dc_hw *hw, struct dc_hw_qos *qos);
+void dc_hw_update_cursor(struct dc_hw *hw, u8 id, struct dc_hw_cursor *cursor);
+void dc_hw_update_gamma(struct dc_hw *hw, u8 id, u16 index,
+			u16 r, u16 g, u16 b);
+void dc_hw_enable_gamma(struct dc_hw *hw, u8 id, bool enable);
+void dc_hw_setup_display(struct dc_hw *hw, struct dc_hw_display *display);
+void dc_hw_enable_interrupt(struct dc_hw *hw, bool enable);
+u32 dc_hw_get_interrupt(struct dc_hw *hw);
+bool dc_hw_check_underflow(struct dc_hw *hw);
+void dc_hw_enable_shadow_register(struct dc_hw *hw, bool enable);
+void dc_hw_set_out(struct dc_hw *hw, enum dc_hw_out out, u8 id);
+void dc_hw_commit(struct dc_hw *hw);
+
+#endif /* __VS_DC_HW_H__ */
diff --git a/drivers/gpu/drm/verisilicon/vs_drv.c b/drivers/gpu/drm/verisilicon/vs_drv.c
index d84aacd751bc..c28bfd74ffc9 100644
--- a/drivers/gpu/drm/verisilicon/vs_drv.c
+++ b/drivers/gpu/drm/verisilicon/vs_drv.c
@@ -32,6 +32,7 @@
 #include "vs_drv.h"
 #include "vs_fb.h"
 #include "vs_gem.h"
+#include "vs_dc.h"
 
 #define DRV_NAME	"starfive"
 #define DRV_DESC	"Starfive DRM driver"
@@ -181,6 +182,7 @@ static const struct component_master_ops vs_drm_ops = {
 };
 
 static struct platform_driver *drm_sub_drivers[] = {
+	&dc_platform_driver,
 };
 
 #define NUM_DRM_DRIVERS \
-- 
2.34.1

