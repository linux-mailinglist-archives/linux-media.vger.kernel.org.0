Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26C6031CD63
	for <lists+linux-media@lfdr.de>; Tue, 16 Feb 2021 17:00:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230119AbhBPP7S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Feb 2021 10:59:18 -0500
Received: from retiisi.eu ([95.216.213.190]:57586 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229626AbhBPP7N (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Feb 2021 10:59:13 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 9328C634CCA;
        Tue, 16 Feb 2021 17:56:20 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-media@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        mchehab@kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Joe Perches <joe@perches.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v9 3/4] drm: Switch to %p4cc format modifier
Date:   Tue, 16 Feb 2021 17:57:22 +0200
Message-Id: <20210216155723.17109-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210216155723.17109-1-sakari.ailus@linux.intel.com>
References: <20210216155723.17109-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Switch DRM drivers from drm_get_format_name() to %p4cc. This gets rid of a
large number of temporary variables at the same time.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Petr Mladek <pmladek@suse.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c        |  5 ++--
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c        |  5 ++--
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         |  5 ++--
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c         |  5 ++--
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  5 ++--
 .../arm/display/komeda/komeda_format_caps.h   | 11 -------
 .../arm/display/komeda/komeda_framebuffer.c   |  4 +--
 .../gpu/drm/arm/display/komeda/komeda_plane.c |  6 ++--
 drivers/gpu/drm/arm/malidp_mw.c               |  7 ++---
 drivers/gpu/drm/drm_atomic.c                  |  8 ++---
 drivers/gpu/drm/drm_crtc.c                    |  7 ++---
 drivers/gpu/drm/drm_framebuffer.c             | 11 ++-----
 drivers/gpu/drm/drm_mipi_dbi.c                |  5 ++--
 drivers/gpu/drm/drm_plane.c                   |  8 ++---
 .../gpu/drm/hisilicon/kirin/kirin_drm_ade.c   |  5 ++--
 drivers/gpu/drm/i915/display/intel_display.c  | 14 +++------
 .../drm/i915/display/intel_display_debugfs.c  | 30 ++++++++-----------
 drivers/gpu/drm/i915/display/intel_sprite.c   |  6 ++--
 drivers/gpu/drm/mcde/mcde_display.c           |  6 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |  6 ++--
 drivers/gpu/drm/nouveau/nouveau_display.c     |  9 ++----
 drivers/gpu/drm/radeon/atombios_crtc.c        | 10 +++----
 drivers/gpu/drm/sun4i/sun4i_backend.c         |  6 ++--
 drivers/gpu/drm/vkms/vkms_writeback.c         |  7 ++---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c           | 15 ++++------
 25 files changed, 69 insertions(+), 137 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
index 7944781e1086..ea825b4f8ee8 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
@@ -1862,7 +1862,6 @@ static int dce_v10_0_crtc_do_set_base(struct drm_crtc *crtc,
 	u32 tmp, viewport_w, viewport_h;
 	int r;
 	bool bypass_lut = false;
-	struct drm_format_name_buf format_name;
 
 	/* no fb bound */
 	if (!atomic && !crtc->primary->fb) {
@@ -1981,8 +1980,8 @@ static int dce_v10_0_crtc_do_set_base(struct drm_crtc *crtc,
 #endif
 		break;
 	default:
-		DRM_ERROR("Unsupported screen format %s\n",
-		          drm_get_format_name(target_fb->format->format, &format_name));
+		DRM_ERROR("Unsupported screen format %p4cc\n",
+			  &target_fb->format->format);
 		return -EINVAL;
 	}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
index 1b6ff0470011..a360a6dec198 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
@@ -1904,7 +1904,6 @@ static int dce_v11_0_crtc_do_set_base(struct drm_crtc *crtc,
 	u32 tmp, viewport_w, viewport_h;
 	int r;
 	bool bypass_lut = false;
-	struct drm_format_name_buf format_name;
 
 	/* no fb bound */
 	if (!atomic && !crtc->primary->fb) {
@@ -2023,8 +2022,8 @@ static int dce_v11_0_crtc_do_set_base(struct drm_crtc *crtc,
 #endif
 		break;
 	default:
-		DRM_ERROR("Unsupported screen format %s\n",
-		          drm_get_format_name(target_fb->format->format, &format_name));
+		DRM_ERROR("Unsupported screen format %p4cc\n",
+			  &target_fb->format->format);
 		return -EINVAL;
 	}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
index 83a88385b762..ef124ac853b6 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
@@ -1820,7 +1820,6 @@ static int dce_v6_0_crtc_do_set_base(struct drm_crtc *crtc,
 	u32 viewport_w, viewport_h;
 	int r;
 	bool bypass_lut = false;
-	struct drm_format_name_buf format_name;
 
 	/* no fb bound */
 	if (!atomic && !crtc->primary->fb) {
@@ -1929,8 +1928,8 @@ static int dce_v6_0_crtc_do_set_base(struct drm_crtc *crtc,
 #endif
 		break;
 	default:
-		DRM_ERROR("Unsupported screen format %s\n",
-		          drm_get_format_name(target_fb->format->format, &format_name));
+		DRM_ERROR("Unsupported screen format %p4cc\n",
+			  &target_fb->format->format);
 		return -EINVAL;
 	}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
index 224b30214427..c98650183828 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
@@ -1791,7 +1791,6 @@ static int dce_v8_0_crtc_do_set_base(struct drm_crtc *crtc,
 	u32 viewport_w, viewport_h;
 	int r;
 	bool bypass_lut = false;
-	struct drm_format_name_buf format_name;
 
 	/* no fb bound */
 	if (!atomic && !crtc->primary->fb) {
@@ -1902,8 +1901,8 @@ static int dce_v8_0_crtc_do_set_base(struct drm_crtc *crtc,
 #endif
 		break;
 	default:
-		DRM_ERROR("Unsupported screen format %s\n",
-		          drm_get_format_name(target_fb->format->format, &format_name));
+		DRM_ERROR("Unsupported screen format %p4cc\n",
+			  &target_fb->format->format);
 		return -EINVAL;
 	}
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index c6da89df055d..fcef3bf14952 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -4465,7 +4465,6 @@ fill_dc_plane_info_and_addr(struct amdgpu_device *adev,
 	const struct drm_framebuffer *fb = plane_state->fb;
 	const struct amdgpu_framebuffer *afb =
 		to_amdgpu_framebuffer(plane_state->fb);
-	struct drm_format_name_buf format_name;
 	int ret;
 
 	memset(plane_info, 0, sizeof(*plane_info));
@@ -4513,8 +4512,8 @@ fill_dc_plane_info_and_addr(struct amdgpu_device *adev,
 		break;
 	default:
 		DRM_ERROR(
-			"Unsupported screen format %s\n",
-			drm_get_format_name(fb->format->format, &format_name));
+			"Unsupported screen format %p4cc\n",
+			&fb->format->format);
 		return -EINVAL;
 	}
 
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_format_caps.h b/drivers/gpu/drm/arm/display/komeda/komeda_format_caps.h
index 32273cf18f7c..cf7a183f773d 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_format_caps.h
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_format_caps.h
@@ -82,17 +82,6 @@ struct komeda_format_caps_table {
 
 extern u64 komeda_supported_modifiers[];
 
-static inline const char *komeda_get_format_name(u32 fourcc, u64 modifier)
-{
-	struct drm_format_name_buf buf;
-	static char name[64];
-
-	snprintf(name, sizeof(name), "%s with modifier: 0x%llx.",
-		 drm_get_format_name(fourcc, &buf), modifier);
-
-	return name;
-}
-
 const struct komeda_format_caps *
 komeda_get_format_caps(struct komeda_format_caps_table *table,
 		       u32 fourcc, u64 modifier);
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
index 170f9dc8ec19..3c372d2deb0a 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
@@ -276,8 +276,8 @@ bool komeda_fb_is_layer_supported(struct komeda_fb *kfb, u32 layer_type,
 	supported = komeda_format_mod_supported(&mdev->fmt_tbl, layer_type,
 						fourcc, modifier, rot);
 	if (!supported)
-		DRM_DEBUG_ATOMIC("Layer TYPE: %d doesn't support fb FMT: %s.\n",
-			layer_type, komeda_get_format_name(fourcc, modifier));
+		DRM_DEBUG_ATOMIC("Layer TYPE: %d doesn't support fb FMT: %p4cc with modifier: 0x%llx.\n",
+				 layer_type, &fourcc, modifier);
 
 	return supported;
 }
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
index 98e915e325dd..2d5066ea270c 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
@@ -49,10 +49,8 @@ komeda_plane_init_data_flow(struct drm_plane_state *st,
 
 	dflow->rot = drm_rotation_simplify(st->rotation, caps->supported_rots);
 	if (!has_bits(dflow->rot, caps->supported_rots)) {
-		DRM_DEBUG_ATOMIC("rotation(0x%x) isn't supported by %s.\n",
-				 dflow->rot,
-				 komeda_get_format_name(caps->fourcc,
-							fb->modifier));
+		DRM_DEBUG_ATOMIC("rotation(0x%x) isn't supported by %p4cc with modifier: 0x%llx.\n",
+				 dflow->rot, &caps->fourcc, fb->modifier);
 		return -EINVAL;
 	}
 
diff --git a/drivers/gpu/drm/arm/malidp_mw.c b/drivers/gpu/drm/arm/malidp_mw.c
index 7d0e7b031e44..f5847a79dd7e 100644
--- a/drivers/gpu/drm/arm/malidp_mw.c
+++ b/drivers/gpu/drm/arm/malidp_mw.c
@@ -151,11 +151,8 @@ malidp_mw_encoder_atomic_check(struct drm_encoder *encoder,
 		malidp_hw_get_format_id(&malidp->dev->hw->map, SE_MEMWRITE,
 					fb->format->format, !!fb->modifier);
 	if (mw_state->format == MALIDP_INVALID_FORMAT_ID) {
-		struct drm_format_name_buf format_name;
-
-		DRM_DEBUG_KMS("Invalid pixel format %s\n",
-			      drm_get_format_name(fb->format->format,
-						  &format_name));
+		DRM_DEBUG_KMS("Invalid pixel format %p4cc\n",
+			      &fb->format->format);
 		return -EINVAL;
 	}
 
diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index dda60051854b..ce2ee6b8bf34 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -578,13 +578,9 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
 	ret = drm_plane_check_pixel_format(plane, fb->format->format,
 					   fb->modifier);
 	if (ret) {
-		struct drm_format_name_buf format_name;
-
-		DRM_DEBUG_ATOMIC("[PLANE:%d:%s] invalid pixel format %s, modifier 0x%llx\n",
+		DRM_DEBUG_ATOMIC("[PLANE:%d:%s] invalid pixel format %p4cc, modifier 0x%llx\n",
 				 plane->base.id, plane->name,
-				 drm_get_format_name(fb->format->format,
-						     &format_name),
-				 fb->modifier);
+				 &fb->format->format, fb->modifier);
 		return ret;
 	}
 
diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 74090fc3aa55..9ba2d3640b47 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -663,11 +663,8 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
 							   fb->format->format,
 							   fb->modifier);
 			if (ret) {
-				struct drm_format_name_buf format_name;
-
-				DRM_DEBUG_KMS("Invalid pixel format %s, modifier 0x%llx\n",
-					      drm_get_format_name(fb->format->format,
-								  &format_name),
+				DRM_DEBUG_KMS("Invalid pixel format %p4cc, modifier 0x%llx\n",
+					      &fb->format->format,
 					      fb->modifier);
 				goto out;
 			}
diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
index aca62ed51e82..4d01464b6f95 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -177,11 +177,8 @@ static int framebuffer_check(struct drm_device *dev,
 
 	/* check if the format is supported at all */
 	if (!__drm_format_info(r->pixel_format)) {
-		struct drm_format_name_buf format_name;
-
-		DRM_DEBUG_KMS("bad framebuffer format %s\n",
-			      drm_get_format_name(r->pixel_format,
-						  &format_name));
+		DRM_DEBUG_KMS("bad framebuffer format %p4cc\n",
+			      &r->pixel_format);
 		return -EINVAL;
 	}
 
@@ -1160,14 +1157,12 @@ EXPORT_SYMBOL(drm_framebuffer_plane_height);
 void drm_framebuffer_print_info(struct drm_printer *p, unsigned int indent,
 				const struct drm_framebuffer *fb)
 {
-	struct drm_format_name_buf format_name;
 	unsigned int i;
 
 	drm_printf_indent(p, indent, "allocated by = %s\n", fb->comm);
 	drm_printf_indent(p, indent, "refcount=%u\n",
 			  drm_framebuffer_read_refcount(fb));
-	drm_printf_indent(p, indent, "format=%s\n",
-			  drm_get_format_name(fb->format->format, &format_name));
+	drm_printf_indent(p, indent, "format=%p4cc\n", &fb->format->format);
 	drm_printf_indent(p, indent, "modifier=0x%llx\n", fb->modifier);
 	drm_printf_indent(p, indent, "size=%ux%u\n", fb->width, fb->height);
 	drm_printf_indent(p, indent, "layers:\n");
diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index 230c4fd7131c..43a9b739bba7 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -203,7 +203,6 @@ int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
 	struct drm_gem_object *gem = drm_gem_fb_get_obj(fb, 0);
 	struct drm_gem_cma_object *cma_obj = to_drm_gem_cma_obj(gem);
 	struct dma_buf_attachment *import_attach = gem->import_attach;
-	struct drm_format_name_buf format_name;
 	void *src = cma_obj->vaddr;
 	int ret = 0;
 
@@ -225,8 +224,8 @@ int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
 		drm_fb_xrgb8888_to_rgb565(dst, src, fb, clip, swap);
 		break;
 	default:
-		drm_err_once(fb->dev, "Format is not supported: %s\n",
-			     drm_get_format_name(fb->format->format, &format_name));
+		drm_err_once(fb->dev, "Format is not supported: %p4cc\n",
+			     &fb->format->format);
 		return -EINVAL;
 	}
 
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index a0cb746bcb0a..4d8429917d7d 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -623,12 +623,8 @@ static int __setplane_check(struct drm_plane *plane,
 	ret = drm_plane_check_pixel_format(plane, fb->format->format,
 					   fb->modifier);
 	if (ret) {
-		struct drm_format_name_buf format_name;
-
-		DRM_DEBUG_KMS("Invalid pixel format %s, modifier 0x%llx\n",
-			      drm_get_format_name(fb->format->format,
-						  &format_name),
-			      fb->modifier);
+		DRM_DEBUG_KMS("Invalid pixel format %p4cc, modifier 0x%llx\n",
+			      &fb->format->format, fb->modifier);
 		return ret;
 	}
 
diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
index aa6c53f88f7c..70aa6c8844c0 100644
--- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
+++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
@@ -549,16 +549,15 @@ static void ade_rdma_set(void __iomem *base, struct drm_framebuffer *fb,
 			 u32 ch, u32 y, u32 in_h, u32 fmt)
 {
 	struct drm_gem_cma_object *obj = drm_fb_cma_get_gem_obj(fb, 0);
-	struct drm_format_name_buf format_name;
 	u32 reg_ctrl, reg_addr, reg_size, reg_stride, reg_space, reg_en;
 	u32 stride = fb->pitches[0];
 	u32 addr = (u32)obj->paddr + y * stride;
 
 	DRM_DEBUG_DRIVER("rdma%d: (y=%d, height=%d), stride=%d, paddr=0x%x\n",
 			 ch + 1, y, in_h, stride, (u32)obj->paddr);
-	DRM_DEBUG_DRIVER("addr=0x%x, fb:%dx%d, pixel_format=%d(%s)\n",
+	DRM_DEBUG_DRIVER("addr=0x%x, fb:%dx%d, pixel_format=%d(%p4cc)\n",
 			 addr, fb->width, fb->height, fmt,
-			 drm_get_format_name(fb->format->format, &format_name));
+			 &fb->format->format);
 
 	/* get reg offset */
 	reg_ctrl = RD_CH_CTRL(ch);
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 53a00cf3fa32..7981627390a0 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -13319,7 +13319,6 @@ static void intel_dump_plane_state(const struct intel_plane_state *plane_state)
 	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
 	struct drm_i915_private *i915 = to_i915(plane->base.dev);
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
-	struct drm_format_name_buf format_name;
 
 	if (!fb) {
 		drm_dbg_kms(&i915->drm,
@@ -13330,10 +13329,9 @@ static void intel_dump_plane_state(const struct intel_plane_state *plane_state)
 	}
 
 	drm_dbg_kms(&i915->drm,
-		    "[PLANE:%d:%s] fb: [FB:%d] %ux%u format = %s modifier = 0x%llx, visible: %s\n",
+		    "[PLANE:%d:%s] fb: [FB:%d] %ux%u format = %p4cc modifier = 0x%llx, visible: %s\n",
 		    plane->base.base.id, plane->base.name,
-		    fb->base.id, fb->width, fb->height,
-		    drm_get_format_name(fb->format->format, &format_name),
+		    fb->base.id, fb->width, fb->height, &fb->format->format,
 		    fb->modifier, yesno(plane_state->uapi.visible));
 	drm_dbg_kms(&i915->drm, "\trotation: 0x%x, scaler: %d\n",
 		    plane_state->hw.rotation, plane_state->scaler_id);
@@ -17927,13 +17925,9 @@ static int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 	if (!drm_any_plane_has_format(&dev_priv->drm,
 				      mode_cmd->pixel_format,
 				      mode_cmd->modifier[0])) {
-		struct drm_format_name_buf format_name;
-
 		drm_dbg_kms(&dev_priv->drm,
-			    "unsupported pixel format %s / modifier 0x%llx\n",
-			    drm_get_format_name(mode_cmd->pixel_format,
-						&format_name),
-			    mode_cmd->modifier[0]);
+			    "unsupported pixel format %p4cc / modifier 0x%llx\n",
+			    &mode_cmd->pixel_format, mode_cmd->modifier[0]);
 		goto err;
 	}
 
diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index ca41e8c00ad7..a7f026c9524b 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -771,27 +771,25 @@ static void intel_plane_uapi_info(struct seq_file *m, struct intel_plane *plane)
 	const struct intel_plane_state *plane_state =
 		to_intel_plane_state(plane->base.state);
 	const struct drm_framebuffer *fb = plane_state->uapi.fb;
-	struct drm_format_name_buf format_name;
 	struct drm_rect src, dst;
 	char rot_str[48];
 
 	src = drm_plane_state_src(&plane_state->uapi);
 	dst = drm_plane_state_dest(&plane_state->uapi);
 
-	if (fb)
-		drm_get_format_name(fb->format->format, &format_name);
-
 	plane_rotation(rot_str, sizeof(rot_str),
 		       plane_state->uapi.rotation);
 
-	seq_printf(m, "\t\tuapi: [FB:%d] %s,0x%llx,%dx%d, visible=%s, src=" DRM_RECT_FP_FMT ", dst=" DRM_RECT_FMT ", rotation=%s\n",
-		   fb ? fb->base.id : 0, fb ? format_name.str : "n/a",
-		   fb ? fb->modifier : 0,
-		   fb ? fb->width : 0, fb ? fb->height : 0,
-		   plane_visibility(plane_state),
-		   DRM_RECT_FP_ARG(&src),
-		   DRM_RECT_ARG(&dst),
-		   rot_str);
+	seq_puts(m, "\t\tuapi: [FB:");
+	if (fb)
+		seq_printf(m, "%d] %p4cc,0x%llx,%dx%d", fb->base.id,
+			   &fb->format->format, fb->modifier, fb->width,
+			   fb->height);
+	else
+		seq_puts(m, "0] n/a,0x0,0x0,");
+	seq_printf(m, ", visible=%s, src=" DRM_RECT_FP_FMT ", dst=" DRM_RECT_FMT
+		   ", rotation=%s\n", plane_visibility(plane_state),
+		   DRM_RECT_FP_ARG(&src), DRM_RECT_ARG(&dst), rot_str);
 
 	if (plane_state->planar_linked_plane)
 		seq_printf(m, "\t\tplanar: Linked to [PLANE:%d:%s] as a %s\n",
@@ -804,19 +802,17 @@ static void intel_plane_hw_info(struct seq_file *m, struct intel_plane *plane)
 	const struct intel_plane_state *plane_state =
 		to_intel_plane_state(plane->base.state);
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
-	struct drm_format_name_buf format_name;
 	char rot_str[48];
 
 	if (!fb)
 		return;
 
-	drm_get_format_name(fb->format->format, &format_name);
-
 	plane_rotation(rot_str, sizeof(rot_str),
 		       plane_state->hw.rotation);
 
-	seq_printf(m, "\t\thw: [FB:%d] %s,0x%llx,%dx%d, visible=%s, src=" DRM_RECT_FP_FMT ", dst=" DRM_RECT_FMT ", rotation=%s\n",
-		   fb->base.id, format_name.str,
+	seq_printf(m, "\t\thw: [FB:%d] %p4cc,0x%llx,%dx%d, visible=%s, src="
+		   DRM_RECT_FP_FMT ", dst=" DRM_RECT_FMT ", rotation=%s\n",
+		   fb->base.id, &fb->format->format,
 		   fb->modifier, fb->width, fb->height,
 		   yesno(plane_state->uapi.visible),
 		   DRM_RECT_FP_ARG(&plane_state->uapi.src),
diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/drm/i915/display/intel_sprite.c
index 019a2d6d807a..e4e55d1aec10 100644
--- a/drivers/gpu/drm/i915/display/intel_sprite.c
+++ b/drivers/gpu/drm/i915/display/intel_sprite.c
@@ -2285,7 +2285,6 @@ static int skl_plane_check_fb(const struct intel_crtc_state *crtc_state,
 	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
 	unsigned int rotation = plane_state->hw.rotation;
-	struct drm_format_name_buf format_name;
 
 	if (!fb)
 		return 0;
@@ -2333,9 +2332,8 @@ static int skl_plane_check_fb(const struct intel_crtc_state *crtc_state,
 		case DRM_FORMAT_XVYU12_16161616:
 		case DRM_FORMAT_XVYU16161616:
 			drm_dbg_kms(&dev_priv->drm,
-				    "Unsupported pixel format %s for 90/270!\n",
-				    drm_get_format_name(fb->format->format,
-							&format_name));
+				    "Unsupported pixel format %p4cc for 90/270!\n",
+				    &fb->format->format);
 			return -EINVAL;
 		default:
 			break;
diff --git a/drivers/gpu/drm/mcde/mcde_display.c b/drivers/gpu/drm/mcde/mcde_display.c
index 7c2e0b865441..83ac7493e751 100644
--- a/drivers/gpu/drm/mcde/mcde_display.c
+++ b/drivers/gpu/drm/mcde/mcde_display.c
@@ -1161,7 +1161,6 @@ static void mcde_display_enable(struct drm_simple_display_pipe *pipe,
 	int dsi_pkt_size;
 	int fifo_wtrmrk;
 	int cpp = fb->format->cpp[0];
-	struct drm_format_name_buf tmp;
 	u32 dsi_formatter_frame;
 	u32 val;
 	int ret;
@@ -1173,9 +1172,8 @@ static void mcde_display_enable(struct drm_simple_display_pipe *pipe,
 		return;
 	}
 
-	dev_info(drm->dev, "enable MCDE, %d x %d format %s\n",
-		 mode->hdisplay, mode->vdisplay,
-		 drm_get_format_name(format, &tmp));
+	dev_info(drm->dev, "enable MCDE, %d x %d format %p4cc\n",
+		 mode->hdisplay, mode->vdisplay, &format);
 
 
 	/* Clear any pending interrupts */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 56eb22554197..ea9d73983d13 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -71,7 +71,6 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 {
 	struct dpu_hw_mixer *lm = mixer->hw_lm;
 	uint32_t blend_op;
-	struct drm_format_name_buf format_name;
 
 	/* default to opaque blending */
 	blend_op = DPU_BLEND_FG_ALPHA_FG_CONST |
@@ -87,9 +86,8 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 	lm->ops.setup_blend_config(lm, pstate->stage,
 				0xFF, 0, blend_op);
 
-	DPU_DEBUG("format:%s, alpha_en:%u blend_op:0x%x\n",
-		drm_get_format_name(format->base.pixel_format, &format_name),
-		format->alpha_enable, blend_op);
+	DPU_DEBUG("format:%p4cc, alpha_en:%u blend_op:0x%x\n",
+		  &format->base.pixel_format, format->alpha_enable, blend_op);
 }
 
 static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index bceb48a2dfca..a305b749c321 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -322,12 +322,9 @@ nouveau_framebuffer_new(struct drm_device *dev,
 	     mode_cmd->pitches[0] >= 0x10000 || /* at most 64k pitch */
 	     (mode_cmd->pitches[1] && /* pitches for planes must match */
 	      mode_cmd->pitches[0] != mode_cmd->pitches[1]))) {
-		struct drm_format_name_buf format_name;
-		DRM_DEBUG_KMS("Unsuitable framebuffer: format: %s; pitches: 0x%x\n 0x%x\n",
-			      drm_get_format_name(mode_cmd->pixel_format,
-						  &format_name),
-			      mode_cmd->pitches[0],
-			      mode_cmd->pitches[1]);
+		DRM_DEBUG_KMS("Unsuitable framebuffer: format: %p4cc; pitches: 0x%x\n 0x%x\n",
+			      &mode_cmd->pixel_format,
+			      mode_cmd->pitches[0], mode_cmd->pitches[1]);
 		return -EINVAL;
 	}
 
diff --git a/drivers/gpu/drm/radeon/atombios_crtc.c b/drivers/gpu/drm/radeon/atombios_crtc.c
index 1979ed3d6547..c94e429e75f9 100644
--- a/drivers/gpu/drm/radeon/atombios_crtc.c
+++ b/drivers/gpu/drm/radeon/atombios_crtc.c
@@ -1157,7 +1157,6 @@ static int dce4_crtc_do_set_base(struct drm_crtc *crtc,
 	u32 tmp, viewport_w, viewport_h;
 	int r;
 	bool bypass_lut = false;
-	struct drm_format_name_buf format_name;
 
 	/* no fb bound */
 	if (!atomic && !crtc->primary->fb) {
@@ -1267,8 +1266,8 @@ static int dce4_crtc_do_set_base(struct drm_crtc *crtc,
 #endif
 		break;
 	default:
-		DRM_ERROR("Unsupported screen format %s\n",
-		          drm_get_format_name(target_fb->format->format, &format_name));
+		DRM_ERROR("Unsupported screen format %p4cc\n",
+			  &target_fb->format->format);
 		return -EINVAL;
 	}
 
@@ -1478,7 +1477,6 @@ static int avivo_crtc_do_set_base(struct drm_crtc *crtc,
 	u32 viewport_w, viewport_h;
 	int r;
 	bool bypass_lut = false;
-	struct drm_format_name_buf format_name;
 
 	/* no fb bound */
 	if (!atomic && !crtc->primary->fb) {
@@ -1579,8 +1577,8 @@ static int avivo_crtc_do_set_base(struct drm_crtc *crtc,
 #endif
 		break;
 	default:
-		DRM_ERROR("Unsupported screen format %s\n",
-		          drm_get_format_name(target_fb->format->format, &format_name));
+		DRM_ERROR("Unsupported screen format %p4cc\n",
+			  &target_fb->format->format);
 		return -EINVAL;
 	}
 
diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/sun4i/sun4i_backend.c
index 522e51a404cc..bf8cfefa0365 100644
--- a/drivers/gpu/drm/sun4i/sun4i_backend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
@@ -510,7 +510,6 @@ static int sun4i_backend_atomic_check(struct sunxi_engine *engine,
 		struct sun4i_layer_state *layer_state =
 			state_to_sun4i_layer_state(plane_state);
 		struct drm_framebuffer *fb = plane_state->fb;
-		struct drm_format_name_buf format_name;
 
 		if (!sun4i_backend_plane_is_supported(plane_state,
 						      &layer_state->uses_frontend))
@@ -527,9 +526,8 @@ static int sun4i_backend_atomic_check(struct sunxi_engine *engine,
 			}
 		}
 
-		DRM_DEBUG_DRIVER("Plane FB format is %s\n",
-				 drm_get_format_name(fb->format->format,
-						     &format_name));
+		DRM_DEBUG_DRIVER("Plane FB format is %p4cc\n",
+				 &fb->format->format);
 		if (fb->format->has_alpha || (plane_state->alpha != DRM_BLEND_ALPHA_OPAQUE))
 			num_alpha_planes++;
 
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index 78fdc1d59186..0935686475a0 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -42,11 +42,8 @@ static int vkms_wb_encoder_atomic_check(struct drm_encoder *encoder,
 	}
 
 	if (fb->format->format != vkms_wb_formats[0]) {
-		struct drm_format_name_buf format_name;
-
-		DRM_DEBUG_KMS("Invalid pixel format %s\n",
-			      drm_get_format_name(fb->format->format,
-						  &format_name));
+		DRM_DEBUG_KMS("Invalid pixel format %p4cc\n",
+			      &fb->format->format);
 		return -EINVAL;
 	}
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index bc67f2b930e1..0cd2c55036bb 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -895,7 +895,6 @@ static int vmw_kms_new_framebuffer_surface(struct vmw_private *dev_priv,
 	struct vmw_framebuffer_surface *vfbs;
 	enum SVGA3dSurfaceFormat format;
 	int ret;
-	struct drm_format_name_buf format_name;
 
 	/* 3D is only supported on HWv8 and newer hosts */
 	if (dev_priv->active_display_unit == vmw_du_legacy)
@@ -933,8 +932,8 @@ static int vmw_kms_new_framebuffer_surface(struct vmw_private *dev_priv,
 		format = SVGA3D_A1R5G5B5;
 		break;
 	default:
-		DRM_ERROR("Invalid pixel format: %s\n",
-			  drm_get_format_name(mode_cmd->pixel_format, &format_name));
+		DRM_ERROR("Invalid pixel format: %p4cc\n",
+			  &mode_cmd->pixel_format);
 		return -EINVAL;
 	}
 
@@ -1149,7 +1148,6 @@ static int vmw_create_bo_proxy(struct drm_device *dev,
 	uint32_t format;
 	struct vmw_resource *res;
 	unsigned int bytes_pp;
-	struct drm_format_name_buf format_name;
 	int ret;
 
 	switch (mode_cmd->pixel_format) {
@@ -1171,8 +1169,8 @@ static int vmw_create_bo_proxy(struct drm_device *dev,
 		break;
 
 	default:
-		DRM_ERROR("Invalid framebuffer format %s\n",
-			  drm_get_format_name(mode_cmd->pixel_format, &format_name));
+		DRM_ERROR("Invalid framebuffer format %p4cc\n",
+			  &mode_cmd->pixel_format);
 		return -EINVAL;
 	}
 
@@ -1216,7 +1214,6 @@ static int vmw_kms_new_framebuffer_bo(struct vmw_private *dev_priv,
 	struct drm_device *dev = dev_priv->dev;
 	struct vmw_framebuffer_bo *vfbd;
 	unsigned int requested_size;
-	struct drm_format_name_buf format_name;
 	int ret;
 
 	requested_size = mode_cmd->height * mode_cmd->pitches[0];
@@ -1236,8 +1233,8 @@ static int vmw_kms_new_framebuffer_bo(struct vmw_private *dev_priv,
 		case DRM_FORMAT_RGB565:
 			break;
 		default:
-			DRM_ERROR("Invalid pixel format: %s\n",
-				  drm_get_format_name(mode_cmd->pixel_format, &format_name));
+			DRM_ERROR("Invalid pixel format: %p4cc\n",
+				  &mode_cmd->pixel_format);
 			return -EINVAL;
 		}
 	}
-- 
2.29.2

