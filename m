Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4992DCAEFA
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 21:11:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387715AbfJCTLF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 15:11:05 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38979 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728608AbfJCTLF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 15:11:05 -0400
Received: by mail-wr1-f68.google.com with SMTP id r3so3964350wrj.6;
        Thu, 03 Oct 2019 12:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=Uy+F0VpQToARzHY6Pem0ajhcIVMix33cr7TNPDIW5cY=;
        b=D8DGTa7jvidlWT3vabCm0T+ety3YZ6ooxzHM4hfaAkyvWj86qsibGQqSPwXdkZTsUr
         hjZlQ7jdF57nMTSgDmDoTYKP8tF9t9Vs/y6gw6OLzVbZLcUFEIXVPZ+2Nol6rySVWSUp
         zfGyAqo7+lOsjQ1tQ8W7xznhMacHCztQX7LmCJLgSYZQxnvNPimIAmjIZ46/YHptJmtX
         ijKvL+iKp9WtuRRg0f4i8wE+HryYM57/n7agWRECNOOyBoh99ZQERT1MV5/1aZ427uAK
         Z62yYBMPacXjjJX0LlOoO4VbYAGc8zHME+lzUpaeLMkJLxT/OC2EuHdrAzYDKRVh4mmU
         +jZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=Uy+F0VpQToARzHY6Pem0ajhcIVMix33cr7TNPDIW5cY=;
        b=OlVQSWhkBQhjrUhvBnqH/7k4hRZcHK6+WerJI7Gpuo3TrCKcdQDKoFcVcFiJSZxePe
         Gjy1xg/hNhzp1CoSj8dkSMQYNeMGk3KWBejcV2rJm0wS+VHK5dewmy5W53yj1a+9U4V5
         axjGSLzhMQZOirA18yKFRMONJV5Uz2JRIYnZjQWmPdrdE4J2kCIHjHWbOTNczP6ZcIxi
         clXqkP4YcfzK83a7ftuPAOle/qj/n/1SsMzGFw5y+i0Pj/gGmcmf61TVnOo3I/sjW46f
         IZb3BMfYeAI1mBvjR96yqZtHgpIAf520CJWxKCWPTdku1S18oLWdVpPd2opEbLXdSLiC
         Tw+A==
X-Gm-Message-State: APjAAAWUbztfRcMTsIniLV6KAuEFByXe77EiEgKgCZv769+8YyZQAuhO
        ipfEO0yNQ2XA5OafGknVyaG3z7n/v/Jt43LDA7x7wLIh
X-Google-Smtp-Source: APXvYqztZDpMq9JX6EgIK5YsjEmpybfMFT1ixjKM82kVhe3hmKOzMkMhjnhMqSMEPQgOvgYlrOO6BhRJa5kuPWmZ4k4=
X-Received: by 2002:adf:cd86:: with SMTP id q6mr8298120wrj.153.1570129862046;
 Thu, 03 Oct 2019 12:11:02 -0700 (PDT)
MIME-Version: 1.0
From:   =?UTF-8?Q?Carlos_Eduardo_Cl=C3=ADmaco_Barbosa?= 
        <climacobarbosacee@gmail.com>
Date:   Thu, 3 Oct 2019 16:10:50 -0300
Message-ID: <CACViCuVVe6Jcy=0OnFTFFS6sGyhOx0WnpTR-8nRmvqf2JyiDww@mail.gmail.com>
Subject: [PATCH 1/2] media: vimc: get pixformat info from v4l2_format_info to
  avoid code repetition
To:     Helen Koike <helen.koike@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As the info found in vim_pix_map members are already available in
v4l2_format_info so those were removed to optimize the code and their
calls were remapped to matching ones.
---
 drivers/media/platform/vimc/vimc-capture.c |  8 +++-
 drivers/media/platform/vimc/vimc-common.c  | 46 ----------------------
 drivers/media/platform/vimc/vimc-common.h  |  2 -
 drivers/media/platform/vimc/vimc-debayer.c |  6 ++-
 drivers/media/platform/vimc/vimc-scaler.c  | 20 +++++++---
 drivers/media/platform/vimc/vimc-sensor.c  |  8 +++-
 6 files changed, 31 insertions(+), 59 deletions(-)

diff --git a/drivers/media/platform/vimc/vimc-capture.c
b/drivers/media/platform/vimc/vimc-capture.c
index 1d56b91830ba..49bc8c133980 100644
--- a/drivers/media/platform/vimc/vimc-capture.c
+++ b/drivers/media/platform/vimc/vimc-capture.c
@@ -92,6 +92,7 @@ static int vimc_cap_try_fmt_vid_cap(struct file
*file, void *priv,
 {
     struct v4l2_pix_format *format = &f->fmt.pix;
     const struct vimc_pix_map *vpix;
+    const struct v4l2_format_info *vinfo;

     format->width = clamp_t(u32, format->width, VIMC_FRAME_MIN_WIDTH,
                 VIMC_FRAME_MAX_WIDTH) & ~1;
@@ -104,8 +105,9 @@ static int vimc_cap_try_fmt_vid_cap(struct file
*file, void *priv,
         format->pixelformat = fmt_default.pixelformat;
         vpix = vimc_pix_map_by_pixelformat(format->pixelformat);
     }
+    vinfo = v4l2_format_info(format->pixelformat);
     /* TODO: Add support for custom bytesperline values */
-    format->bytesperline = format->width * vpix->bpp;
+    format->bytesperline = format->width * vinfo->bpp[0];
     format->sizeimage = format->bytesperline * format->height;

     if (format->field == V4L2_FIELD_ANY)
@@ -397,6 +399,7 @@ static int vimc_cap_comp_bind(struct device *comp,
struct device *master,
     struct v4l2_device *v4l2_dev = master_data;
     struct vimc_platform_data *pdata = comp->platform_data;
     const struct vimc_pix_map *vpix;
+    const struct v4l2_format_info *vinfo;
     struct vimc_cap_device *vcap;
     struct video_device *vdev;
     struct vb2_queue *q;
@@ -452,7 +455,8 @@ static int vimc_cap_comp_bind(struct device *comp,
struct device *master,
     /* Set default frame format */
     vcap->format = fmt_default;
     vpix = vimc_pix_map_by_pixelformat(vcap->format.pixelformat);
-    vcap->format.bytesperline = vcap->format.width * vpix->bpp;
+    vinfo = v4l2_format_info(vpix->pixelformat);
+    vcap->format.bytesperline = vcap->format.width * vinfo->bpp[0];
     vcap->format.sizeimage = vcap->format.bytesperline *
                  vcap->format.height;

diff --git a/drivers/media/platform/vimc/vimc-common.c
b/drivers/media/platform/vimc/vimc-common.c
index 7e1ae0b12f1e..2d1205f0a600 100644
--- a/drivers/media/platform/vimc/vimc-common.c
+++ b/drivers/media/platform/vimc/vimc-common.c
@@ -21,146 +21,100 @@ static const struct vimc_pix_map vimc_pix_map_list[] = {
     {
         .code = MEDIA_BUS_FMT_BGR888_1X24,
         .pixelformat = V4L2_PIX_FMT_BGR24,
-        .bpp = 3,
-        .bayer = false,
     },
     {
         .code = MEDIA_BUS_FMT_RGB888_1X24,
         .pixelformat = V4L2_PIX_FMT_RGB24,
-        .bpp = 3,
-        .bayer = false,
     },
     {
         .code = MEDIA_BUS_FMT_ARGB8888_1X32,
         .pixelformat = V4L2_PIX_FMT_ARGB32,
-        .bpp = 4,
-        .bayer = false,
     },

     /* Bayer formats */
     {
         .code = MEDIA_BUS_FMT_SBGGR8_1X8,
         .pixelformat = V4L2_PIX_FMT_SBGGR8,
-        .bpp = 1,
-        .bayer = true,
     },
     {
         .code = MEDIA_BUS_FMT_SGBRG8_1X8,
         .pixelformat = V4L2_PIX_FMT_SGBRG8,
-        .bpp = 1,
-        .bayer = true,
     },
     {
         .code = MEDIA_BUS_FMT_SGRBG8_1X8,
         .pixelformat = V4L2_PIX_FMT_SGRBG8,
-        .bpp = 1,
-        .bayer = true,
     },
     {
         .code = MEDIA_BUS_FMT_SRGGB8_1X8,
         .pixelformat = V4L2_PIX_FMT_SRGGB8,
-        .bpp = 1,
-        .bayer = true,
     },
     {
         .code = MEDIA_BUS_FMT_SBGGR10_1X10,
         .pixelformat = V4L2_PIX_FMT_SBGGR10,
-        .bpp = 2,
-        .bayer = true,
     },
     {
         .code = MEDIA_BUS_FMT_SGBRG10_1X10,
         .pixelformat = V4L2_PIX_FMT_SGBRG10,
-        .bpp = 2,
-        .bayer = true,
     },
     {
         .code = MEDIA_BUS_FMT_SGRBG10_1X10,
         .pixelformat = V4L2_PIX_FMT_SGRBG10,
-        .bpp = 2,
-        .bayer = true,
     },
     {
         .code = MEDIA_BUS_FMT_SRGGB10_1X10,
         .pixelformat = V4L2_PIX_FMT_SRGGB10,
-        .bpp = 2,
-        .bayer = true,
     },

     /* 10bit raw bayer a-law compressed to 8 bits */
     {
         .code = MEDIA_BUS_FMT_SBGGR10_ALAW8_1X8,
         .pixelformat = V4L2_PIX_FMT_SBGGR10ALAW8,
-        .bpp = 1,
-        .bayer = true,
     },
     {
         .code = MEDIA_BUS_FMT_SGBRG10_ALAW8_1X8,
         .pixelformat = V4L2_PIX_FMT_SGBRG10ALAW8,
-        .bpp = 1,
-        .bayer = true,
     },
     {
         .code = MEDIA_BUS_FMT_SGRBG10_ALAW8_1X8,
         .pixelformat = V4L2_PIX_FMT_SGRBG10ALAW8,
-        .bpp = 1,
-        .bayer = true,
     },
     {
         .code = MEDIA_BUS_FMT_SRGGB10_ALAW8_1X8,
         .pixelformat = V4L2_PIX_FMT_SRGGB10ALAW8,
-        .bpp = 1,
-        .bayer = true,
     },

     /* 10bit raw bayer DPCM compressed to 8 bits */
     {
         .code = MEDIA_BUS_FMT_SBGGR10_DPCM8_1X8,
         .pixelformat = V4L2_PIX_FMT_SBGGR10DPCM8,
-        .bpp = 1,
-        .bayer = true,
     },
     {
         .code = MEDIA_BUS_FMT_SGBRG10_DPCM8_1X8,
         .pixelformat = V4L2_PIX_FMT_SGBRG10DPCM8,
-        .bpp = 1,
-        .bayer = true,
     },
     {
         .code = MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8,
         .pixelformat = V4L2_PIX_FMT_SGRBG10DPCM8,
-        .bpp = 1,
-        .bayer = true,
     },
     {
         .code = MEDIA_BUS_FMT_SRGGB10_DPCM8_1X8,
         .pixelformat = V4L2_PIX_FMT_SRGGB10DPCM8,
-        .bpp = 1,
-        .bayer = true,
     },
     {
         .code = MEDIA_BUS_FMT_SBGGR12_1X12,
         .pixelformat = V4L2_PIX_FMT_SBGGR12,
-        .bpp = 2,
-        .bayer = true,
     },
     {
         .code = MEDIA_BUS_FMT_SGBRG12_1X12,
         .pixelformat = V4L2_PIX_FMT_SGBRG12,
-        .bpp = 2,
-        .bayer = true,
     },
     {
         .code = MEDIA_BUS_FMT_SGRBG12_1X12,
         .pixelformat = V4L2_PIX_FMT_SGRBG12,
-        .bpp = 2,
-        .bayer = true,
     },
     {
         .code = MEDIA_BUS_FMT_SRGGB12_1X12,
         .pixelformat = V4L2_PIX_FMT_SRGGB12,
-        .bpp = 2,
-        .bayer = true,
     },
 };

diff --git a/drivers/media/platform/vimc/vimc-common.h
b/drivers/media/platform/vimc/vimc-common.h
index 9c2e0e216c6b..0a54dcd37410 100644
--- a/drivers/media/platform/vimc/vimc-common.h
+++ b/drivers/media/platform/vimc/vimc-common.h
@@ -79,9 +79,7 @@ struct vimc_platform_data {
  */
 struct vimc_pix_map {
     unsigned int code;
-    unsigned int bpp;
     u32 pixelformat;
-    bool bayer;
 };

 /**
diff --git a/drivers/media/platform/vimc/vimc-debayer.c
b/drivers/media/platform/vimc/vimc-debayer.c
index b72b8385067b..50801f76a448 100644
--- a/drivers/media/platform/vimc/vimc-debayer.c
+++ b/drivers/media/platform/vimc/vimc-debayer.c
@@ -314,6 +314,7 @@ static int vimc_deb_s_stream(struct v4l2_subdev
*sd, int enable)

     if (enable) {
         const struct vimc_pix_map *vpix;
+        const struct v4l2_format_info *vinfo;
         unsigned int frame_size;

         if (vdeb->src_frame)
@@ -321,12 +322,13 @@ static int vimc_deb_s_stream(struct v4l2_subdev
*sd, int enable)

         /* Calculate the frame size of the source pad */
         vpix = vimc_pix_map_by_code(vdeb->src_code);
+        vinfo = v4l2_format_info(vpix->pixelformat);
         frame_size = vdeb->sink_fmt.width * vdeb->sink_fmt.height *
-                vpix->bpp;
+                vinfo->bpp[0];

         /* Save the bytes per pixel of the sink */
         vpix = vimc_pix_map_by_code(vdeb->sink_fmt.code);
-        vdeb->sink_bpp = vpix->bpp;
+        vdeb->sink_bpp = vinfo->bpp[0];

         /* Get the corresponding pixel map from the table */
         vdeb->sink_pix_map =
diff --git a/drivers/media/platform/vimc/vimc-scaler.c
b/drivers/media/platform/vimc/vimc-scaler.c
index 49ab8d9dd9c9..599653169b1e 100644
--- a/drivers/media/platform/vimc/vimc-scaler.c
+++ b/drivers/media/platform/vimc/vimc-scaler.c
@@ -66,14 +66,22 @@ static int vimc_sca_init_cfg(struct v4l2_subdev *sd,
     return 0;
 }

+static int vimc_is_bayer(const struct vimc_pix_map *vpix)
+{
+    const struct v4l2_format_info *vinfo =
+                v4l2_format_info(vpix->pixelformat);
+    const u8 *bpp = vinfo->bpp;
+
+    return bpp[0] != 1 || bpp[1] || bpp[2] || bpp[3];
+}
+
 static int vimc_sca_enum_mbus_code(struct v4l2_subdev *sd,
                    struct v4l2_subdev_pad_config *cfg,
                    struct v4l2_subdev_mbus_code_enum *code)
 {
     const struct vimc_pix_map *vpix = vimc_pix_map_by_index(code->index);
-
     /* We don't support bayer format */
-    if (!vpix || vpix->bayer)
+    if (!vpix || vimc_is_bayer(vpix))
         return -EINVAL;

     code->code = vpix->code;
@@ -92,7 +100,7 @@ static int vimc_sca_enum_frame_size(struct v4l2_subdev *sd,

     /* Only accept code in the pix map table in non bayer format */
     vpix = vimc_pix_map_by_code(fse->code);
-    if (!vpix || vpix->bayer)
+    if (!vpix || vimc_is_bayer(vpix))
         return -EINVAL;

     fse->min_width = VIMC_FRAME_MIN_WIDTH;
@@ -135,7 +143,7 @@ static void vimc_sca_adjust_sink_fmt(struct
v4l2_mbus_framefmt *fmt)

     /* Only accept code in the pix map table in non bayer format */
     vpix = vimc_pix_map_by_code(fmt->code);
-    if (!vpix || vpix->bayer)
+    if (!vpix || vimc_is_bayer(vpix))
         fmt->code = sink_fmt_default.code;

     fmt->width = clamp_t(u32, fmt->width, VIMC_FRAME_MIN_WIDTH,
@@ -210,6 +218,7 @@ static int vimc_sca_s_stream(struct v4l2_subdev
*sd, int enable)

     if (enable) {
         const struct vimc_pix_map *vpix;
+        const struct v4l2_format_info *vinfo;
         unsigned int frame_size;

         if (vsca->src_frame)
@@ -217,7 +226,8 @@ static int vimc_sca_s_stream(struct v4l2_subdev
*sd, int enable)

         /* Save the bytes per pixel of the sink */
         vpix = vimc_pix_map_by_code(vsca->sink_fmt.code);
-        vsca->bpp = vpix->bpp;
+        vinfo = v4l2_format_info(vpix->pixelformat);
+        vsca->bpp = vinfo->bpp[0];

         /* Calculate the width in bytes of the src frame */
         vsca->src_line_size = vsca->sink_fmt.width *
diff --git a/drivers/media/platform/vimc/vimc-sensor.c
b/drivers/media/platform/vimc/vimc-sensor.c
index 6c53b9fc1617..81acd12b0896 100644
--- a/drivers/media/platform/vimc/vimc-sensor.c
+++ b/drivers/media/platform/vimc/vimc-sensor.c
@@ -109,10 +109,12 @@ static void vimc_sen_tpg_s_format(struct
vimc_sen_device *vsen)
 {
     const struct vimc_pix_map *vpix =
                 vimc_pix_map_by_code(vsen->mbus_format.code);
+    const struct v4l2_format_info *vinfo =
+                v4l2_format_info(vpix->pixelformat);

     tpg_reset_source(&vsen->tpg, vsen->mbus_format.width,
              vsen->mbus_format.height, vsen->mbus_format.field);
-    tpg_s_bytesperline(&vsen->tpg, 0, vsen->mbus_format.width * vpix->bpp);
+    tpg_s_bytesperline(&vsen->tpg, 0, vsen->mbus_format.width * vinfo->bpp[0]);
     tpg_s_buf_height(&vsen->tpg, vsen->mbus_format.height);
     tpg_s_fourcc(&vsen->tpg, vpix->pixelformat);
     /* TODO: add support for V4L2_FIELD_ALTERNATE */
@@ -206,6 +208,7 @@ static int vimc_sen_s_stream(struct v4l2_subdev
*sd, int enable)

     if (enable) {
         const struct vimc_pix_map *vpix;
+        const struct v4l2_format_info *vinfo;
         unsigned int frame_size;

         if (vsen->kthread_sen)
@@ -214,7 +217,8 @@ static int vimc_sen_s_stream(struct v4l2_subdev
*sd, int enable)

         /* Calculate the frame size */
         vpix = vimc_pix_map_by_code(vsen->mbus_format.code);
-        frame_size = vsen->mbus_format.width * vpix->bpp *
+        vinfo = v4l2_format_info(vpix->pixelformat);
+        frame_size = vsen->mbus_format.width * vinfo->bpp[0] *
                  vsen->mbus_format.height;

         /*
-- 
2.23.0
