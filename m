Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C1C7CAF03
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 21:15:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730583AbfJCTPK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 15:15:10 -0400
Received: from mail-wr1-f52.google.com ([209.85.221.52]:34863 "EHLO
        mail-wr1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730382AbfJCTPK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 15:15:10 -0400
Received: by mail-wr1-f52.google.com with SMTP id v8so3997254wrt.2;
        Thu, 03 Oct 2019 12:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=fYwGBeUiBfZ3DuFZnlZx5sUy268cNpvEp2Ss+NL8Ixg=;
        b=s1MjDEpqhFr5mZW9Y3HPLZBlnxUt+0K2SBLy6uBDKSC79L/oAOqObxv8jekCDGGCSu
         +9QAwzkPVO5uaXj1ld8Ga/ex/cjMr50XPgY3/akfgsUGhkhwHSzcJXkQyw7rA2WYMCET
         R7fW6Wf1jfc5042uUKgQOSD1AHYBlaEVgvBTVYZplZJas4ya9E9Pvq1Nv8QcU/ZI2MTI
         BmoRLqIQwofDaba2YZW+O4gQbUrwO1JOnRqxz5PyUX9a4fCldYpIbC9RXQxHkNmAuhwE
         IlOTASPhg0ozQ5ykgFRjtehOI9Xjqe2LmbLLiwRJXyxKLUYWakLbsP+VUHNioDde+M6l
         URFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=fYwGBeUiBfZ3DuFZnlZx5sUy268cNpvEp2Ss+NL8Ixg=;
        b=Dz66n8tAtf/R3beLY5hwxro0mAzNS19sFjeC5FNfOaQ6J0pwEiucjqXEozeR3CpKMZ
         k3v35lbJakFCIE1PFLfxpv9IUHluC6U2SGZnwOKbZpW4qSnifC93WMTuLw+S/AgG0b25
         29gUv+CfjV2DniRTN/iZFN2OedvxfrxAr3cb7cSa5cjWfOEi0qbAvU/MXc2WpbFBUXlC
         GumNkE47O42qaW3wv/Is93/zxu2A6ZdfMzirPV6XTyK9AvLeg+1kH33XXi/dgFdtIdn5
         JVKSkytS5v3pIetMWDFp6564c3FWfMYoRi6YVj7KJl/dQX/lCFlCKbIVjjdH7WrWJyTL
         +YlQ==
X-Gm-Message-State: APjAAAXI30nRXCQwOCIYpvxpR138Ir5ckfz+k5Mm6FqSU8cKn4JGGX4D
        us0i65ZwsTQRGf55D1c6rSWAda7OhEw+AcFdbY+1okEUAxM=
X-Google-Smtp-Source: APXvYqwH7ls/ZSODMxLJ79Zrz+9+ISg4AsNwNmjiu5nJmpBxu2FmNSKPDKoVkY82D1DKUT5KX17p1Rqdpv/otH0Vcw4=
X-Received: by 2002:adf:cd86:: with SMTP id q6mr8309615wrj.153.1570130105102;
 Thu, 03 Oct 2019 12:15:05 -0700 (PDT)
MIME-Version: 1.0
From:   =?UTF-8?Q?Carlos_Eduardo_Cl=C3=ADmaco_Barbosa?= 
        <climacobarbosacee@gmail.com>
Date:   Thu, 3 Oct 2019 16:14:53 -0300
Message-ID: <CACViCuWTp0SHj+eSQu7i27whfDQez1wJqPMnoBzYAijOBxzJwQ@mail.gmail.com>
Subject: [PATCH 2/2] media: vimc: include pointer to info in struct vimc_pix_map
To:     Helen Koike <helen.koike@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Change struct vimc_pix_map and add vimc_pix_map_fmt to clean up and
increase readability
---
 drivers/media/platform/vimc/vimc-capture.c | 24 ++++-----
 drivers/media/platform/vimc/vimc-common.c  | 61 ++++++++++++++++------
 drivers/media/platform/vimc/vimc-common.h  | 25 ++++++---
 drivers/media/platform/vimc/vimc-debayer.c |  8 ++-
 drivers/media/platform/vimc/vimc-scaler.c  | 26 ++++-----
 drivers/media/platform/vimc/vimc-sensor.c  | 29 +++++-----
 6 files changed, 100 insertions(+), 73 deletions(-)

diff --git a/drivers/media/platform/vimc/vimc-capture.c
b/drivers/media/platform/vimc/vimc-capture.c
index 49bc8c133980..42719605f9d1 100644
--- a/drivers/media/platform/vimc/vimc-capture.c
+++ b/drivers/media/platform/vimc/vimc-capture.c
@@ -91,8 +91,7 @@ static int vimc_cap_try_fmt_vid_cap(struct file
*file, void *priv,
                     struct v4l2_format *f)
 {
     struct v4l2_pix_format *format = &f->fmt.pix;
-    const struct vimc_pix_map *vpix;
-    const struct v4l2_format_info *vinfo;
+    struct vimc_pix_map vpix;

     format->width = clamp_t(u32, format->width, VIMC_FRAME_MIN_WIDTH,
                 VIMC_FRAME_MAX_WIDTH) & ~1;
@@ -101,13 +100,12 @@ static int vimc_cap_try_fmt_vid_cap(struct file
*file, void *priv,

     /* Don't accept a pixelformat that is not on the table */
     vpix = vimc_pix_map_by_pixelformat(format->pixelformat);
-    if (!vpix) {
+    if (!vpix.info) {
         format->pixelformat = fmt_default.pixelformat;
         vpix = vimc_pix_map_by_pixelformat(format->pixelformat);
     }
-    vinfo = v4l2_format_info(format->pixelformat);
     /* TODO: Add support for custom bytesperline values */
-    format->bytesperline = format->width * vinfo->bpp[0];
+    format->bytesperline = format->width * vpix.info->bpp[0];
     format->sizeimage = format->bytesperline * format->height;

     if (format->field == V4L2_FIELD_ANY)
@@ -154,12 +152,12 @@ static int vimc_cap_s_fmt_vid_cap(struct file
*file, void *priv,
 static int vimc_cap_enum_fmt_vid_cap(struct file *file, void *priv,
                      struct v4l2_fmtdesc *f)
 {
-    const struct vimc_pix_map *vpix = vimc_pix_map_by_index(f->index);
+    const struct vimc_pix_map vpix = vimc_pix_map_by_index(f->index);

-    if (!vpix)
+    if (!vpix.info)
         return -EINVAL;

-    f->pixelformat = vpix->pixelformat;
+    f->pixelformat = vpix.info->format;

     return 0;
 }
@@ -167,14 +165,14 @@ static int vimc_cap_enum_fmt_vid_cap(struct file
*file, void *priv,
 static int vimc_cap_enum_framesizes(struct file *file, void *fh,
                     struct v4l2_frmsizeenum *fsize)
 {
-    const struct vimc_pix_map *vpix;
+    struct vimc_pix_map vpix;

     if (fsize->index)
         return -EINVAL;

     /* Only accept code in the pix map table */
     vpix = vimc_pix_map_by_code(fsize->pixel_format);
-    if (!vpix)
+    if (!vpix.info)
         return -EINVAL;

     fsize->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
@@ -398,8 +396,7 @@ static int vimc_cap_comp_bind(struct device *comp,
struct device *master,
 {
     struct v4l2_device *v4l2_dev = master_data;
     struct vimc_platform_data *pdata = comp->platform_data;
-    const struct vimc_pix_map *vpix;
-    const struct v4l2_format_info *vinfo;
+    struct vimc_pix_map vpix;
     struct vimc_cap_device *vcap;
     struct video_device *vdev;
     struct vb2_queue *q;
@@ -455,8 +452,7 @@ static int vimc_cap_comp_bind(struct device *comp,
struct device *master,
     /* Set default frame format */
     vcap->format = fmt_default;
     vpix = vimc_pix_map_by_pixelformat(vcap->format.pixelformat);
-    vinfo = v4l2_format_info(vpix->pixelformat);
-    vcap->format.bytesperline = vcap->format.width * vinfo->bpp[0];
+    vcap->format.bytesperline = vcap->format.width * vpix.info->bpp[0];
     vcap->format.sizeimage = vcap->format.bytesperline *
                  vcap->format.height;

diff --git a/drivers/media/platform/vimc/vimc-common.c
b/drivers/media/platform/vimc/vimc-common.c
index 2d1205f0a600..e807734bb373 100644
--- a/drivers/media/platform/vimc/vimc-common.c
+++ b/drivers/media/platform/vimc/vimc-common.c
@@ -14,7 +14,7 @@
  * NOTE: non-bayer formats need to come first (necessary for enum_mbus_code
  * in the scaler)
  */
-static const struct vimc_pix_map vimc_pix_map_list[] = {
+static struct vimc_pix_map_fmt vimc_pix_map_fmt_list[] = {
     /* TODO: add all missing formats */

     /* RGB formats */
@@ -118,36 +118,63 @@ static const struct vimc_pix_map vimc_pix_map_list[] = {
     },
 };

-const struct vimc_pix_map *vimc_pix_map_by_index(unsigned int i)
+struct vimc_pix_map vimc_pix_map_fmt_info(const struct vimc_pix_map_fmt *vfmt)
 {
-    if (i >= ARRAY_SIZE(vimc_pix_map_list))
-        return NULL;

-    return &vimc_pix_map_list[i];
+    struct vimc_pix_map vpix = {
+        .code = vfmt->code,
+        .info = v4l2_format_info(vfmt->pixelformat),
+    };
+    return vpix;
+}
+
+const struct vimc_pix_map vimc_pix_map_by_index(unsigned int i)
+{
+    struct vimc_pix_map vpix;
+    struct vimc_pix_map_fmt *vfmt;
+
+    if (i >= ARRAY_SIZE(vimc_pix_map_fmt_list))
+        return (struct vimc_pix_map) {};
+
+    vfmt = &vimc_pix_map_fmt_list[i];
+    vpix = vimc_pix_map_fmt_info(vfmt);
+
+    return vpix;
 }
 EXPORT_SYMBOL_GPL(vimc_pix_map_by_index);

-const struct vimc_pix_map *vimc_pix_map_by_code(u32 code)
+const struct vimc_pix_map vimc_pix_map_by_code(u32 code)
 {
+    struct vimc_pix_map vpix;
+    struct vimc_pix_map_fmt *vfmt;
     unsigned int i;

-    for (i = 0; i < ARRAY_SIZE(vimc_pix_map_list); i++) {
-        if (vimc_pix_map_list[i].code == code)
-            return &vimc_pix_map_list[i];
+    for (i = 0; i < ARRAY_SIZE(vimc_pix_map_fmt_list); i++) {
+        if (vimc_pix_map_fmt_list[i].code == code) {
+            vfmt = &vimc_pix_map_fmt_list[i];
+            vpix = vimc_pix_map_fmt_info(vfmt);
+            return vpix;
+        }
     }
-    return NULL;
+    return (struct vimc_pix_map) {};
 }
 EXPORT_SYMBOL_GPL(vimc_pix_map_by_code);

-const struct vimc_pix_map *vimc_pix_map_by_pixelformat(u32 pixelformat)
+const struct vimc_pix_map vimc_pix_map_by_pixelformat(u32 pixelformat)
 {
+    struct vimc_pix_map vpix;
+    struct vimc_pix_map_fmt *vfmt;
     unsigned int i;

-    for (i = 0; i < ARRAY_SIZE(vimc_pix_map_list); i++) {
-        if (vimc_pix_map_list[i].pixelformat == pixelformat)
-            return &vimc_pix_map_list[i];
+    for (i = 0; i < ARRAY_SIZE(vimc_pix_map_fmt_list); i++) {
+        if (vimc_pix_map_fmt_list[i].pixelformat == pixelformat) {
+            vfmt = &vimc_pix_map_fmt_list[i];
+            vpix = vimc_pix_map_fmt_info(vfmt);
+
+            return vpix;
+        }
     }
-    return NULL;
+    return (struct vimc_pix_map) {};
 }
 EXPORT_SYMBOL_GPL(vimc_pix_map_by_pixelformat);

@@ -221,7 +248,7 @@ static int vimc_get_mbus_format(struct media_pad *pad,
                              struct video_device,
                              entity);
         struct vimc_ent_device *ved = video_get_drvdata(vdev);
-        const struct vimc_pix_map *vpix;
+        struct vimc_pix_map vpix;
         struct v4l2_pix_format vdev_fmt;

         if (!ved->vdev_get_format)
@@ -229,7 +256,7 @@ static int vimc_get_mbus_format(struct media_pad *pad,

         ved->vdev_get_format(ved, &vdev_fmt);
         vpix = vimc_pix_map_by_pixelformat(vdev_fmt.pixelformat);
-        v4l2_fill_mbus_format(&fmt->format, &vdev_fmt, vpix->code);
+        v4l2_fill_mbus_format(&fmt->format, &vdev_fmt, vpix.code);
     } else {
         return -EINVAL;
     }
diff --git a/drivers/media/platform/vimc/vimc-common.h
b/drivers/media/platform/vimc/vimc-common.h
index 0a54dcd37410..3eb66c3026b8 100644
--- a/drivers/media/platform/vimc/vimc-common.h
+++ b/drivers/media/platform/vimc/vimc-common.h
@@ -68,20 +68,33 @@ struct vimc_platform_data {
 };

 /**
- * struct vimc_pix_map - maps media bus code with v4l2 pixel format
+ * struct vimc_pix_map_fmt - maps media bus code with v4l2 pixel format
  *
  * @code:        media bus format code defined by MEDIA_BUS_FMT_* macros
- * @bbp:        number of bytes each pixel occupies
  * @pixelformat:    pixel format devined by V4L2_PIX_FMT_* macros
  *
  * Struct which matches the MEDIA_BUS_FMT_* codes with the corresponding
  * V4L2_PIX_FMT_* fourcc pixelformat and its bytes per pixel (bpp)
  */
-struct vimc_pix_map {
+struct vimc_pix_map_fmt {
     unsigned int code;
     u32 pixelformat;
 };

+/**
+ * struct vimc_pix_map - maps media bus code with v4l2 pixel info
+ *
+ * @code:        media bus format code defined by MEDIA_BUS_FMT_* macros
+ * @info:        pixel info defined by v4l2_format_info function
+ *
+ * Struct which matches the MEDIA_BUS_FMT_* codes with the corresponding
+ * V4L2_PIX_FMT_* fourcc pixelformat and its information
+ */
+struct vimc_pix_map {
+    unsigned int code;
+    struct v4l2_format_info *info;
+};
+
 /**
  * struct vimc_ent_device - core struct that represents a node in the topology
  *
@@ -148,21 +161,21 @@ int vimc_pipeline_s_stream(struct media_entity
*ent, int enable);
  *
  * @i:            index of the vimc_pix_map struct in vimc_pix_map_list
  */
-const struct vimc_pix_map *vimc_pix_map_by_index(unsigned int i);
+const struct vimc_pix_map vimc_pix_map_by_index(unsigned int i);

 /**
  * vimc_pix_map_by_code - get vimc_pix_map struct by media bus code
  *
  * @code:        media bus format code defined by MEDIA_BUS_FMT_* macros
  */
-const struct vimc_pix_map *vimc_pix_map_by_code(u32 code);
+const struct vimc_pix_map vimc_pix_map_by_code(u32 code);

 /**
  * vimc_pix_map_by_pixelformat - get vimc_pix_map struct by v4l2 pixel format
  *
  * @pixelformat:    pixel format devined by V4L2_PIX_FMT_* macros
  */
-const struct vimc_pix_map *vimc_pix_map_by_pixelformat(u32 pixelformat);
+const struct vimc_pix_map vimc_pix_map_by_pixelformat(u32 pixelformat);

 /**
  * vimc_ent_sd_register - initialize and register a subdev node
diff --git a/drivers/media/platform/vimc/vimc-debayer.c
b/drivers/media/platform/vimc/vimc-debayer.c
index 50801f76a448..8823d856b89f 100644
--- a/drivers/media/platform/vimc/vimc-debayer.c
+++ b/drivers/media/platform/vimc/vimc-debayer.c
@@ -313,8 +313,7 @@ static int vimc_deb_s_stream(struct v4l2_subdev
*sd, int enable)
     struct vimc_deb_device *vdeb = v4l2_get_subdevdata(sd);

     if (enable) {
-        const struct vimc_pix_map *vpix;
-        const struct v4l2_format_info *vinfo;
+        struct vimc_pix_map vpix;
         unsigned int frame_size;

         if (vdeb->src_frame)
@@ -322,13 +321,12 @@ static int vimc_deb_s_stream(struct v4l2_subdev
*sd, int enable)

         /* Calculate the frame size of the source pad */
         vpix = vimc_pix_map_by_code(vdeb->src_code);
-        vinfo = v4l2_format_info(vpix->pixelformat);
         frame_size = vdeb->sink_fmt.width * vdeb->sink_fmt.height *
-                vinfo->bpp[0];
+                vpix.info->bpp[0];

         /* Save the bytes per pixel of the sink */
         vpix = vimc_pix_map_by_code(vdeb->sink_fmt.code);
-        vdeb->sink_bpp = vinfo->bpp[0];
+        vdeb->sink_bpp = vpix.info->bpp[0];

         /* Get the corresponding pixel map from the table */
         vdeb->sink_pix_map =
diff --git a/drivers/media/platform/vimc/vimc-scaler.c
b/drivers/media/platform/vimc/vimc-scaler.c
index 599653169b1e..11b054c05374 100644
--- a/drivers/media/platform/vimc/vimc-scaler.c
+++ b/drivers/media/platform/vimc/vimc-scaler.c
@@ -66,11 +66,9 @@ static int vimc_sca_init_cfg(struct v4l2_subdev *sd,
     return 0;
 }

-static int vimc_is_bayer(const struct vimc_pix_map *vpix)
+static int vimc_is_bayer(const struct vimc_pix_map vpix)
 {
-    const struct v4l2_format_info *vinfo =
-                v4l2_format_info(vpix->pixelformat);
-    const u8 *bpp = vinfo->bpp;
+    const u8 *bpp = vpix.info->bpp;

     return bpp[0] != 1 || bpp[1] || bpp[2] || bpp[3];
 }
@@ -79,12 +77,12 @@ static int vimc_sca_enum_mbus_code(struct v4l2_subdev *sd,
                    struct v4l2_subdev_pad_config *cfg,
                    struct v4l2_subdev_mbus_code_enum *code)
 {
-    const struct vimc_pix_map *vpix = vimc_pix_map_by_index(code->index);
+    const struct vimc_pix_map vpix = vimc_pix_map_by_index(code->index);
     /* We don't support bayer format */
-    if (!vpix || vimc_is_bayer(vpix))
+    if (!vpix.info || vimc_is_bayer(vpix))
         return -EINVAL;

-    code->code = vpix->code;
+    code->code = vpix.code;

     return 0;
 }
@@ -93,14 +91,14 @@ static int vimc_sca_enum_frame_size(struct v4l2_subdev *sd,
                     struct v4l2_subdev_pad_config *cfg,
                     struct v4l2_subdev_frame_size_enum *fse)
 {
-    const struct vimc_pix_map *vpix;
+    struct vimc_pix_map vpix;

     if (fse->index)
         return -EINVAL;

     /* Only accept code in the pix map table in non bayer format */
     vpix = vimc_pix_map_by_code(fse->code);
-    if (!vpix || vimc_is_bayer(vpix))
+    if (!vpix.info || vimc_is_bayer(vpix))
         return -EINVAL;

     fse->min_width = VIMC_FRAME_MIN_WIDTH;
@@ -139,11 +137,11 @@ static int vimc_sca_get_fmt(struct v4l2_subdev *sd,

 static void vimc_sca_adjust_sink_fmt(struct v4l2_mbus_framefmt *fmt)
 {
-    const struct vimc_pix_map *vpix;
+    struct vimc_pix_map vpix;

     /* Only accept code in the pix map table in non bayer format */
     vpix = vimc_pix_map_by_code(fmt->code);
-    if (!vpix || vimc_is_bayer(vpix))
+    if (!vpix.info || vimc_is_bayer(vpix))
         fmt->code = sink_fmt_default.code;

     fmt->width = clamp_t(u32, fmt->width, VIMC_FRAME_MIN_WIDTH,
@@ -217,8 +215,7 @@ static int vimc_sca_s_stream(struct v4l2_subdev
*sd, int enable)
     struct vimc_sca_device *vsca = v4l2_get_subdevdata(sd);

     if (enable) {
-        const struct vimc_pix_map *vpix;
-        const struct v4l2_format_info *vinfo;
+        struct vimc_pix_map vpix;
         unsigned int frame_size;

         if (vsca->src_frame)
@@ -226,8 +223,7 @@ static int vimc_sca_s_stream(struct v4l2_subdev
*sd, int enable)

         /* Save the bytes per pixel of the sink */
         vpix = vimc_pix_map_by_code(vsca->sink_fmt.code);
-        vinfo = v4l2_format_info(vpix->pixelformat);
-        vsca->bpp = vinfo->bpp[0];
+        vsca->bpp = vpix.info->bpp[0];

         /* Calculate the width in bytes of the src frame */
         vsca->src_line_size = vsca->sink_fmt.width *
diff --git a/drivers/media/platform/vimc/vimc-sensor.c
b/drivers/media/platform/vimc/vimc-sensor.c
index 81acd12b0896..45650beaa0c2 100644
--- a/drivers/media/platform/vimc/vimc-sensor.c
+++ b/drivers/media/platform/vimc/vimc-sensor.c
@@ -59,12 +59,12 @@ static int vimc_sen_enum_mbus_code(struct v4l2_subdev *sd,
                    struct v4l2_subdev_pad_config *cfg,
                    struct v4l2_subdev_mbus_code_enum *code)
 {
-    const struct vimc_pix_map *vpix = vimc_pix_map_by_index(code->index);
+    struct vimc_pix_map vpix = vimc_pix_map_by_index(code->index);

-    if (!vpix)
+    if (!vpix.info)
         return -EINVAL;

-    code->code = vpix->code;
+    code->code = vpix.code;

     return 0;
 }
@@ -73,14 +73,14 @@ static int vimc_sen_enum_frame_size(struct v4l2_subdev *sd,
                     struct v4l2_subdev_pad_config *cfg,
                     struct v4l2_subdev_frame_size_enum *fse)
 {
-    const struct vimc_pix_map *vpix;
+    struct vimc_pix_map vpix;

     if (fse->index)
         return -EINVAL;

     /* Only accept code in the pix map table */
     vpix = vimc_pix_map_by_code(fse->code);
-    if (!vpix)
+    if (!vpix.info)
         return -EINVAL;

     fse->min_width = VIMC_FRAME_MIN_WIDTH;
@@ -107,16 +107,15 @@ static int vimc_sen_get_fmt(struct v4l2_subdev *sd,

 static void vimc_sen_tpg_s_format(struct vimc_sen_device *vsen)
 {
-    const struct vimc_pix_map *vpix =
+    const struct vimc_pix_map vpix =
                 vimc_pix_map_by_code(vsen->mbus_format.code);
-    const struct v4l2_format_info *vinfo =
-                v4l2_format_info(vpix->pixelformat);

     tpg_reset_source(&vsen->tpg, vsen->mbus_format.width,
              vsen->mbus_format.height, vsen->mbus_format.field);
-    tpg_s_bytesperline(&vsen->tpg, 0, vsen->mbus_format.width * vinfo->bpp[0]);
+    tpg_s_bytesperline(&vsen->tpg, 0,
+            vsen->mbus_format.width * vpix.info->bpp[0]);
     tpg_s_buf_height(&vsen->tpg, vsen->mbus_format.height);
-    tpg_s_fourcc(&vsen->tpg, vpix->pixelformat);
+    tpg_s_fourcc(&vsen->tpg, vpix.info->format);
     /* TODO: add support for V4L2_FIELD_ALTERNATE */
     tpg_s_field(&vsen->tpg, vsen->mbus_format.field, false);
     tpg_s_colorspace(&vsen->tpg, vsen->mbus_format.colorspace);
@@ -127,11 +126,11 @@ static void vimc_sen_tpg_s_format(struct
vimc_sen_device *vsen)

 static void vimc_sen_adjust_fmt(struct v4l2_mbus_framefmt *fmt)
 {
-    const struct vimc_pix_map *vpix;
+    struct vimc_pix_map vpix;

     /* Only accept code in the pix map table */
     vpix = vimc_pix_map_by_code(fmt->code);
-    if (!vpix)
+    if (!vpix.info)
         fmt->code = fmt_default.code;

     fmt->width = clamp_t(u32, fmt->width, VIMC_FRAME_MIN_WIDTH,
@@ -207,8 +206,7 @@ static int vimc_sen_s_stream(struct v4l2_subdev
*sd, int enable)
                 container_of(sd, struct vimc_sen_device, sd);

     if (enable) {
-        const struct vimc_pix_map *vpix;
-        const struct v4l2_format_info *vinfo;
+        struct vimc_pix_map vpix;
         unsigned int frame_size;

         if (vsen->kthread_sen)
@@ -217,8 +215,7 @@ static int vimc_sen_s_stream(struct v4l2_subdev
*sd, int enable)

         /* Calculate the frame size */
         vpix = vimc_pix_map_by_code(vsen->mbus_format.code);
-        vinfo = v4l2_format_info(vpix->pixelformat);
-        frame_size = vsen->mbus_format.width * vinfo->bpp[0] *
+        frame_size = vsen->mbus_format.width * vpix.info->bpp[0] *
                  vsen->mbus_format.height;

         /*
-- 
2.23.0
