Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D065456D3
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2019 09:56:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725886AbfFNH4d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Jun 2019 03:56:33 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:33104 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725823AbfFNH4d (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Jun 2019 03:56:33 -0400
Received: by mail-pg1-f195.google.com with SMTP id k187so1099422pga.0
        for <linux-media@vger.kernel.org>; Fri, 14 Jun 2019 00:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mmKV/67gOwYFLoM5/FiXzDi+xH0SGN8o0NbA7pNsjCY=;
        b=koXfTa/kmrs5vxkpSIZ5zhK26y4xoonzFUIPh0Sk28s4Toorcv23GXlKCm33ncsXAr
         apG1Q/wmjHR7Xv4lNy186bBO7PbUy/fxE3z2GsWTFyubhq/XaG3nPKRoaTAqnrRNT2AH
         alsxfbuENLdc0hEdAyZzX+wRoFwdYlC4S9pfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mmKV/67gOwYFLoM5/FiXzDi+xH0SGN8o0NbA7pNsjCY=;
        b=pUPMwiwwlIARDcWvnbsaXcmsuFljSOk+iPuG9MzN7vFt0Ose4Arwy9js5kiPhTJM/I
         Nmy/0VG6K0p++NJAEXxz1HDAm82fP4JJ3Y2eS/Chprr0r29fxst/xHPowELxqNz+bD6V
         WwDjGCs1mwXq+z6EZUDbCAy/bdilX64WSxRkBFz0z6+364flOMncvDl956q5OwdlFqf5
         kVtN9qCGk3QnMoDHrOl9bhPWYxQYXv69/JI85xnI+UYQwcmzLkyrfpoXkrYEi9ZC/T7E
         t+ki9oR+Z49DWmXgUmf/1F77QOOg0VVHnvx3jSX/Ejt2l46KC1Of3DVaRKPrPb7l7iNh
         Qmvg==
X-Gm-Message-State: APjAAAXpM/zsY4nMFb5Hoe0+3SU4r7Dj2mxwLdTVoFht4fCmDzNCdD75
        Fa7MmIZvFsdjV/ecacldNQjExw==
X-Google-Smtp-Source: APXvYqxXhfj62eZnL+BcI5Yti/4SNpOkZ5qPsFweI0C35kivvocu28qzF01UPla/rBv5ZrQ0+Kl0TQ==
X-Received: by 2002:a62:1a93:: with SMTP id a141mr98019934pfa.72.1560498991977;
        Fri, 14 Jun 2019 00:56:31 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:4:4:9712:8cf1:d0f:7d33])
        by smtp.gmail.com with ESMTPSA id w132sm1840477pfd.78.2019.06.14.00.56.28
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 00:56:30 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v2] media: mtk-vcodec: avoid unneeded pointer-to-long conversions
Date:   Fri, 14 Jun 2019 16:56:21 +0900
Message-Id: <20190614075621.106554-1-acourbot@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The interface used to communicate with the firmware casts pointers
into unsigned longs and back again in order to store private
references, all of this for pointers that remain purely in the kernel.
Replace these unsigned longs with void pointers to make the code a bit
sturdier and easier to follow.

Also simplify some interfaces by removing arguments that could be
infered from others.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
Changes since v1:

* Fix sparse warnings.

 drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h   |  2 +-
 .../media/platform/mtk-vcodec/vdec/vdec_h264_if.c    | 12 ++++++------
 drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c | 12 ++++++------
 drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c | 12 ++++++------
 drivers/media/platform/mtk-vcodec/vdec_drv_base.h    |  8 ++++----
 drivers/media/platform/mtk-vcodec/vdec_drv_if.c      | 10 +++++-----
 .../media/platform/mtk-vcodec/venc/venc_h264_if.c    | 10 +++++-----
 drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c | 10 +++++-----
 drivers/media/platform/mtk-vcodec/venc_drv_base.h    |  8 ++++----
 drivers/media/platform/mtk-vcodec/venc_drv_if.c      |  6 +++---
 10 files changed, 45 insertions(+), 45 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index c1422739dab4..c95de5d08dda 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -273,7 +273,7 @@ struct mtk_vcodec_ctx {
 
 	const struct vdec_common_if *dec_if;
 	const struct venc_common_if *enc_if;
-	unsigned long drv_handle;
+	void *drv_handle;
 
 	struct vdec_pic_info picinfo;
 	int dpb_size;
diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c
index c035f744b1f1..67a7d4f813d5 100644
--- a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c
@@ -266,7 +266,7 @@ static void get_dpb_size(struct vdec_h264_inst *inst, unsigned int *dpb_sz)
 	mtk_vcodec_debug(inst, "sz=%d", *dpb_sz);
 }
 
-static int vdec_h264_init(struct mtk_vcodec_ctx *ctx, unsigned long *h_vdec)
+static int vdec_h264_init(struct mtk_vcodec_ctx *ctx)
 {
 	struct vdec_h264_inst *inst = NULL;
 	int err;
@@ -295,7 +295,7 @@ static int vdec_h264_init(struct mtk_vcodec_ctx *ctx, unsigned long *h_vdec)
 
 	mtk_vcodec_debug(inst, "H264 Instance >> %p", inst);
 
-	*h_vdec = (unsigned long)inst;
+	ctx->drv_handle = inst;
 	return 0;
 
 error_deinit:
@@ -306,7 +306,7 @@ static int vdec_h264_init(struct mtk_vcodec_ctx *ctx, unsigned long *h_vdec)
 	return err;
 }
 
-static void vdec_h264_deinit(unsigned long h_vdec)
+static void vdec_h264_deinit(void *h_vdec)
 {
 	struct vdec_h264_inst *inst = (struct vdec_h264_inst *)h_vdec;
 
@@ -331,7 +331,7 @@ static int find_start_code(unsigned char *data, unsigned int data_sz)
 	return -1;
 }
 
-static int vdec_h264_decode(unsigned long h_vdec, struct mtk_vcodec_mem *bs,
+static int vdec_h264_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 			    struct vdec_fb *fb, bool *res_chg)
 {
 	struct vdec_h264_inst *inst = (struct vdec_h264_inst *)h_vdec;
@@ -451,8 +451,8 @@ static void vdec_h264_get_fb(struct vdec_h264_inst *inst,
 	list->count--;
 }
 
-static int vdec_h264_get_param(unsigned long h_vdec,
-			       enum vdec_get_param_type type, void *out)
+static int vdec_h264_get_param(void *h_vdec, enum vdec_get_param_type type,
+			       void *out)
 {
 	struct vdec_h264_inst *inst = (struct vdec_h264_inst *)h_vdec;
 
diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c
index 24f976f0d477..42e302650e69 100644
--- a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c
@@ -388,7 +388,7 @@ static void free_working_buf(struct vdec_vp8_inst *inst)
 	inst->vsi->dec.working_buf_dma = 0;
 }
 
-static int vdec_vp8_init(struct mtk_vcodec_ctx *ctx, unsigned long *h_vdec)
+static int vdec_vp8_init(struct mtk_vcodec_ctx *ctx)
 {
 	struct vdec_vp8_inst *inst;
 	int err;
@@ -419,7 +419,7 @@ static int vdec_vp8_init(struct mtk_vcodec_ctx *ctx, unsigned long *h_vdec)
 	get_hw_reg_base(inst);
 	mtk_vcodec_debug(inst, "VP8 Instance >> %p", inst);
 
-	*h_vdec = (unsigned long)inst;
+	ctx->drv_handle = inst;
 	return 0;
 
 error_deinit:
@@ -429,7 +429,7 @@ static int vdec_vp8_init(struct mtk_vcodec_ctx *ctx, unsigned long *h_vdec)
 	return err;
 }
 
-static int vdec_vp8_decode(unsigned long h_vdec, struct mtk_vcodec_mem *bs,
+static int vdec_vp8_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 			   struct vdec_fb *fb, bool *res_chg)
 {
 	struct vdec_vp8_inst *inst = (struct vdec_vp8_inst *)h_vdec;
@@ -565,8 +565,8 @@ static void get_crop_info(struct vdec_vp8_inst *inst, struct v4l2_rect *cr)
 			 cr->left, cr->top, cr->width, cr->height);
 }
 
-static int vdec_vp8_get_param(unsigned long h_vdec,
-			      enum vdec_get_param_type type, void *out)
+static int vdec_vp8_get_param(void *h_vdec, enum vdec_get_param_type type,
+			      void *out)
 {
 	struct vdec_vp8_inst *inst = (struct vdec_vp8_inst *)h_vdec;
 
@@ -599,7 +599,7 @@ static int vdec_vp8_get_param(unsigned long h_vdec,
 	return 0;
 }
 
-static void vdec_vp8_deinit(unsigned long h_vdec)
+static void vdec_vp8_deinit(void *h_vdec)
 {
 	struct vdec_vp8_inst *inst = (struct vdec_vp8_inst *)h_vdec;
 
diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
index 9e6b630d7f5b..bed452ac9d13 100644
--- a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
@@ -757,7 +757,7 @@ static int validate_vsi_array_indexes(struct vdec_vp9_inst *inst,
 	return 0;
 }
 
-static void vdec_vp9_deinit(unsigned long h_vdec)
+static void vdec_vp9_deinit(void *h_vdec)
 {
 	struct vdec_vp9_inst *inst = (struct vdec_vp9_inst *)h_vdec;
 	struct mtk_vcodec_mem *mem;
@@ -779,7 +779,7 @@ static void vdec_vp9_deinit(unsigned long h_vdec)
 	vp9_free_inst(inst);
 }
 
-static int vdec_vp9_init(struct mtk_vcodec_ctx *ctx, unsigned long *h_vdec)
+static int vdec_vp9_init(struct mtk_vcodec_ctx *ctx)
 {
 	struct vdec_vp9_inst *inst;
 
@@ -803,7 +803,7 @@ static int vdec_vp9_init(struct mtk_vcodec_ctx *ctx, unsigned long *h_vdec)
 	inst->vsi = (struct vdec_vp9_vsi *)inst->vpu.vsi;
 	init_all_fb_lists(inst);
 
-	(*h_vdec) = (unsigned long)inst;
+	ctx->drv_handle = inst;
 	return 0;
 
 err_deinit_inst:
@@ -812,7 +812,7 @@ static int vdec_vp9_init(struct mtk_vcodec_ctx *ctx, unsigned long *h_vdec)
 	return -EINVAL;
 }
 
-static int vdec_vp9_decode(unsigned long h_vdec, struct mtk_vcodec_mem *bs,
+static int vdec_vp9_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 		   struct vdec_fb *fb, bool *res_chg)
 {
 	int ret = 0;
@@ -969,8 +969,8 @@ static void get_crop_info(struct vdec_vp9_inst *inst, struct v4l2_rect *cr)
 			 cr->left, cr->top, cr->width, cr->height);
 }
 
-static int vdec_vp9_get_param(unsigned long h_vdec,
-		enum vdec_get_param_type type, void *out)
+static int vdec_vp9_get_param(void *h_vdec, enum vdec_get_param_type type,
+			      void *out)
 {
 	struct vdec_vp9_inst *inst = (struct vdec_vp9_inst *)h_vdec;
 	int ret = 0;
diff --git a/drivers/media/platform/mtk-vcodec/vdec_drv_base.h b/drivers/media/platform/mtk-vcodec/vdec_drv_base.h
index 2019aec71ddb..ceb4db4cb3be 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_drv_base.h
+++ b/drivers/media/platform/mtk-vcodec/vdec_drv_base.h
@@ -17,7 +17,7 @@ struct vdec_common_if {
 	 * @ctx     : [in] mtk v4l2 context
 	 * @h_vdec  : [out] driver handle
 	 */
-	int (*init)(struct mtk_vcodec_ctx *ctx, unsigned long *h_vdec);
+	int (*init)(struct mtk_vcodec_ctx *ctx);
 
 	/**
 	 * (*decode)() - trigger decode
@@ -26,7 +26,7 @@ struct vdec_common_if {
 	 * @fb      : [in] frame buffer to store decoded frame
 	 * @res_chg : [out] resolution change happen
 	 */
-	int (*decode)(unsigned long h_vdec, struct mtk_vcodec_mem *bs,
+	int (*decode)(void *h_vdec, struct mtk_vcodec_mem *bs,
 		      struct vdec_fb *fb, bool *res_chg);
 
 	/**
@@ -35,14 +35,14 @@ struct vdec_common_if {
 	 * @type   : [in] input parameter type
 	 * @out    : [out] buffer to store query result
 	 */
-	int (*get_param)(unsigned long h_vdec, enum vdec_get_param_type type,
+	int (*get_param)(void *h_vdec, enum vdec_get_param_type type,
 			 void *out);
 
 	/**
 	 * (*deinit)() - deinitialize driver.
 	 * @h_vdec : [in] driver handle to be deinit
 	 */
-	void (*deinit)(unsigned long h_vdec);
+	void (*deinit)(void *h_vdec);
 };
 
 #endif
diff --git a/drivers/media/platform/mtk-vcodec/vdec_drv_if.c b/drivers/media/platform/mtk-vcodec/vdec_drv_if.c
index bd42d9028c42..8354404a7fc9 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_drv_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec_drv_if.c
@@ -39,7 +39,7 @@ int vdec_if_init(struct mtk_vcodec_ctx *ctx, unsigned int fourcc)
 
 	mtk_vdec_lock(ctx);
 	mtk_vcodec_dec_clock_on(&ctx->dev->pm);
-	ret = ctx->dec_if->init(ctx, &ctx->drv_handle);
+	ret = ctx->dec_if->init(ctx);
 	mtk_vcodec_dec_clock_off(&ctx->dev->pm);
 	mtk_vdec_unlock(ctx);
 
@@ -66,7 +66,7 @@ int vdec_if_decode(struct mtk_vcodec_ctx *ctx, struct mtk_vcodec_mem *bs,
 		}
 	}
 
-	if (ctx->drv_handle == 0)
+	if (!ctx->drv_handle)
 		return -EIO;
 
 	mtk_vdec_lock(ctx);
@@ -89,7 +89,7 @@ int vdec_if_get_param(struct mtk_vcodec_ctx *ctx, enum vdec_get_param_type type,
 {
 	int ret = 0;
 
-	if (ctx->drv_handle == 0)
+	if (!ctx->drv_handle)
 		return -EIO;
 
 	mtk_vdec_lock(ctx);
@@ -101,7 +101,7 @@ int vdec_if_get_param(struct mtk_vcodec_ctx *ctx, enum vdec_get_param_type type,
 
 void vdec_if_deinit(struct mtk_vcodec_ctx *ctx)
 {
-	if (ctx->drv_handle == 0)
+	if (!ctx->drv_handle)
 		return;
 
 	mtk_vdec_lock(ctx);
@@ -110,5 +110,5 @@ void vdec_if_deinit(struct mtk_vcodec_ctx *ctx)
 	mtk_vcodec_dec_clock_off(&ctx->dev->pm);
 	mtk_vdec_unlock(ctx);
 
-	ctx->drv_handle = 0;
+	ctx->drv_handle = NULL;
 }
diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c b/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
index 21f2eaea207b..0183dd395d44 100644
--- a/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
@@ -458,7 +458,7 @@ static void h264_encode_filler(struct venc_h264_inst *inst, void *buf,
 	memset(p, 0xff, size);
 }
 
-static int h264_enc_init(struct mtk_vcodec_ctx *ctx, unsigned long *handle)
+static int h264_enc_init(struct mtk_vcodec_ctx *ctx)
 {
 	int ret = 0;
 	struct venc_h264_inst *inst;
@@ -484,12 +484,12 @@ static int h264_enc_init(struct mtk_vcodec_ctx *ctx, unsigned long *handle)
 	if (ret)
 		kfree(inst);
 	else
-		(*handle) = (unsigned long)inst;
+		ctx->drv_handle = inst;
 
 	return ret;
 }
 
-static int h264_enc_encode(unsigned long handle,
+static int h264_enc_encode(void *handle,
 			   enum venc_start_opt opt,
 			   struct venc_frm_buf *frm_buf,
 			   struct mtk_vcodec_mem *bs_buf,
@@ -584,7 +584,7 @@ static int h264_enc_encode(unsigned long handle,
 	return ret;
 }
 
-static int h264_enc_set_param(unsigned long handle,
+static int h264_enc_set_param(void *handle,
 			      enum venc_set_param_type type,
 			      struct venc_enc_param *enc_prm)
 {
@@ -637,7 +637,7 @@ static int h264_enc_set_param(unsigned long handle,
 	return ret;
 }
 
-static int h264_enc_deinit(unsigned long handle)
+static int h264_enc_deinit(void *handle)
 {
 	int ret = 0;
 	struct venc_h264_inst *inst = (struct venc_h264_inst *)handle;
diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c b/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
index 81f87f6ec435..3787e75ca902 100644
--- a/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
@@ -323,7 +323,7 @@ static int vp8_enc_encode_frame(struct venc_vp8_inst *inst,
 	return ret;
 }
 
-static int vp8_enc_init(struct mtk_vcodec_ctx *ctx, unsigned long *handle)
+static int vp8_enc_init(struct mtk_vcodec_ctx *ctx)
 {
 	int ret = 0;
 	struct venc_vp8_inst *inst;
@@ -349,12 +349,12 @@ static int vp8_enc_init(struct mtk_vcodec_ctx *ctx, unsigned long *handle)
 	if (ret)
 		kfree(inst);
 	else
-		(*handle) = (unsigned long)inst;
+		ctx->drv_handle = inst;
 
 	return ret;
 }
 
-static int vp8_enc_encode(unsigned long handle,
+static int vp8_enc_encode(void *handle,
 			  enum venc_start_opt opt,
 			  struct venc_frm_buf *frm_buf,
 			  struct mtk_vcodec_mem *bs_buf,
@@ -391,7 +391,7 @@ static int vp8_enc_encode(unsigned long handle,
 	return ret;
 }
 
-static int vp8_enc_set_param(unsigned long handle,
+static int vp8_enc_set_param(void *handle,
 			     enum venc_set_param_type type,
 			     struct venc_enc_param *enc_prm)
 {
@@ -442,7 +442,7 @@ static int vp8_enc_set_param(unsigned long handle,
 	return ret;
 }
 
-static int vp8_enc_deinit(unsigned long handle)
+static int vp8_enc_deinit(void *handle)
 {
 	int ret = 0;
 	struct venc_vp8_inst *inst = (struct venc_vp8_inst *)handle;
diff --git a/drivers/media/platform/mtk-vcodec/venc_drv_base.h b/drivers/media/platform/mtk-vcodec/venc_drv_base.h
index 09968a68db42..3d718411dc73 100644
--- a/drivers/media/platform/mtk-vcodec/venc_drv_base.h
+++ b/drivers/media/platform/mtk-vcodec/venc_drv_base.h
@@ -19,7 +19,7 @@ struct venc_common_if {
 	 * @ctx:	[in] mtk v4l2 context
 	 * @handle: [out] driver handle
 	 */
-	int (*init)(struct mtk_vcodec_ctx *ctx, unsigned long *handle);
+	int (*init)(struct mtk_vcodec_ctx *ctx);
 
 	/**
 	 * (*encode)() - trigger encode
@@ -29,7 +29,7 @@ struct venc_common_if {
 	 * @bs_buf: [in] bitstream buffer to store output bitstream
 	 * @result: [out] encode result
 	 */
-	int (*encode)(unsigned long handle, enum venc_start_opt opt,
+	int (*encode)(void *handle, enum venc_start_opt opt,
 		      struct venc_frm_buf *frm_buf,
 		      struct mtk_vcodec_mem *bs_buf,
 		      struct venc_done_result *result);
@@ -40,14 +40,14 @@ struct venc_common_if {
 	 * @type: [in] parameter type
 	 * @in: [in] buffer to store the parameter
 	 */
-	int (*set_param)(unsigned long handle, enum venc_set_param_type type,
+	int (*set_param)(void *handle, enum venc_set_param_type type,
 			 struct venc_enc_param *in);
 
 	/**
 	 * (*deinit)() - deinitialize driver.
 	 * @handle: [in] driver handle
 	 */
-	int (*deinit)(unsigned long handle);
+	int (*deinit)(void *handle);
 };
 
 #endif
diff --git a/drivers/media/platform/mtk-vcodec/venc_drv_if.c b/drivers/media/platform/mtk-vcodec/venc_drv_if.c
index 600c43c17e48..b5cc645f7c68 100644
--- a/drivers/media/platform/mtk-vcodec/venc_drv_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc_drv_if.c
@@ -37,7 +37,7 @@ int venc_if_init(struct mtk_vcodec_ctx *ctx, unsigned int fourcc)
 
 	mtk_venc_lock(ctx);
 	mtk_vcodec_enc_clock_on(&ctx->dev->pm);
-	ret = ctx->enc_if->init(ctx, (unsigned long *)&ctx->drv_handle);
+	ret = ctx->enc_if->init(ctx);
 	mtk_vcodec_enc_clock_off(&ctx->dev->pm);
 	mtk_venc_unlock(ctx);
 
@@ -89,7 +89,7 @@ int venc_if_deinit(struct mtk_vcodec_ctx *ctx)
 {
 	int ret = 0;
 
-	if (ctx->drv_handle == 0)
+	if (!ctx->drv_handle)
 		return 0;
 
 	mtk_venc_lock(ctx);
@@ -98,7 +98,7 @@ int venc_if_deinit(struct mtk_vcodec_ctx *ctx)
 	mtk_vcodec_enc_clock_off(&ctx->dev->pm);
 	mtk_venc_unlock(ctx);
 
-	ctx->drv_handle = 0;
+	ctx->drv_handle = NULL;
 
 	return ret;
 }
-- 
2.22.0.410.gd8fdbe21b5-goog

