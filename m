Return-Path: <linux-media+bounces-39872-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 718B3B25EF3
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 10:35:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A12F07BDF78
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 08:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEC582EB5A5;
	Thu, 14 Aug 2025 08:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NN4NwYVF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855872C21F6
	for <linux-media@vger.kernel.org>; Thu, 14 Aug 2025 08:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755160323; cv=none; b=mtKSGQA6E5/oq8tjrf892p41mNUbYf9FS8LG4AVSkalMgnBiNoMKQVJdSvn4R2T2UZX7JTga2V+HEJahzzUWDhyRUHoywSt9kGiCEgj+h4ywSpBvoNdG5zIVUOt2qzhaRmw4viELCUJ1BKewH9WOdz7a1vE6aX0WNlUhEjSAWtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755160323; c=relaxed/simple;
	bh=W31IDfZMYUKnK+FRU3nRlnB+7wScM3Buw/tMWifpA50=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j93IOrRiuh6+r3bcFXhT3cL4RlxS1FY1IJQxLVA2OnD54iJr9x2Rb4uaBTEgFCWU1ipGnGVpMugFLQopo0Cl+nHNuG0S2mrbWIs4wgfofNNGAG3y2Qps71olVhFk+UKKirhhRDtXpVjL5XChaH6hLri7+5a9NqLjsvZEpndAbVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NN4NwYVF; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b471746a879so378548a12.2
        for <linux-media@vger.kernel.org>; Thu, 14 Aug 2025 01:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755160321; x=1755765121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t5lh1GA3+nbQMxzV+tGHExe9OHBSJYl0b1Mlv1COJrg=;
        b=NN4NwYVF6/BVnSCEJHIoiOc9o+voPilu0dvxjHRnUbyOpAg/EsISFxAm3lkTo5GmVC
         LCfBTOC41FUDzbD+k0DkCy117odBhjUw6+f14OkIQpF86Dwu81OyMIOz/y24IXj9jlyg
         sTTCGMFeIiMAtHDMEAw+gEekAN+8GvpgYGX2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755160321; x=1755765121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t5lh1GA3+nbQMxzV+tGHExe9OHBSJYl0b1Mlv1COJrg=;
        b=SKq2S7rPWsNwBKZG90uJkl1jyEslucumqSEHs8W9JeDMWFPGhEDz/N1fYqmTHUROEX
         speAveRkYsFV9liLVmic/oaNK2/ux8HaVFTAwAfu59y0vD/+X7m3mELBCURmAHnVVJoS
         CSwI2hI/9yIAEQp8kTKLjnvww+d+ot5Fe5tAAU5h/J0Y7rlkCtSibCBI12h2o9lLQTK9
         GPK1hPNmxxJFIm988MwgI3n1U/QaSjP3lhKMCbAELVQV83sG1nPPRFMeAiDvN6zjb1/V
         VuWr6YwqgFQ6DwII5pejY/nqq4B6hEFqIf++Qb5ykq67Nros2Of2JB/XzoapqV8n5W7N
         MMBQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0o+XGMDxzykCvo0N2rbtf/PHRvtLWGBwVQRIlkcZjaDZ/EJOCIdHSHm/IDRoxtSJMTjy36bViGyelmg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvqE5mxjSp8m7yf81LQ/JHYY/eHiVIvFsd1VKITaBWiJI9rWzz
	qAu3Ma2yhIbl5X8XpmPwTm/pXLL2avviuGXaLEZ/CkEVYvdoavuaLke0jw4VWVgzPA==
X-Gm-Gg: ASbGncviBGuXugPebo5py+JGVaK0C3UfoW1dNHDneC5Dw2Hz30ziH4K4l1j5hyl+f67
	yiW2cRffhK2dIT71v6Rgd2IbO5PRlIqUObTyLFTcN7ZlbOk4JBDsv9w42n0J9AOj451uAwO4Lsw
	CQXcy/P1jTycWMyk87/YcFbk8KPJxcjzeq8/wzG5WJAiclvgumuEGnLLWbVf+jHvBE6X6JNgdX3
	afH6vBL8z7bv6Mr1CUNw10k1dSVauVSPjQADuM+1DtHEy2YvWicql3HKGl+KEhss94HjWp5i9ae
	C7k2S6vm5jXew9XSN24bM83pQg9XSwjm6PvErl1VLuCQ6VZ9PR9BUS62FblSe+DLizF6FL17rcw
	1BvkQ8BIKUVZ92zESGcnZxxEa6DdCCrTjXgjUJF6J
X-Google-Smtp-Source: AGHT+IFTH7AAc4CwiqK7IOMNsqVxgw4eojzXip3g8FQlYFzBeGkUveBb2j3eLKrE/Y5UsiKs0/PrHw==
X-Received: by 2002:a17:903:1585:b0:234:9656:7db9 with SMTP id d9443c01a7336-244586a100emr33596695ad.32.1755160320704;
        Thu, 14 Aug 2025 01:32:00 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:c44f:5805:6bc2:66d4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e897716bsm347532695ad.112.2025.08.14.01.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 01:32:00 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] media: mediatek: vcodec: Use spinlock for context list protection lock
Date: Thu, 14 Aug 2025 16:31:43 +0800
Message-ID: <20250814083144.191554-1-wenst@chromium.org>
X-Mailer: git-send-email 2.51.0.rc1.163.g2494970778-goog
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previously a mutex was added to protect the encoder and decoder context
lists from unexpected changes originating from the SCP IP block, causing
the context pointer to go invalid, resulting in a NULL pointer
dereference in the IPI handler.

Turns out on the MT8173, the VPU IPI handler is called from hard IRQ
context. This causes a big warning from the scheduler. This was first
reported downstream on the ChromeOS kernels, but is also reproducible
on mainline using Fluster with the FFmpeg v4l2m2m decoders. Even though
the actual capture format is not supported, the affected code paths
are triggered.

Since this lock just protects the context list and operations on it are
very fast, it should be OK to switch to a spinlock.

Fixes: 6467cda18c9f ("media: mediatek: vcodec: adding lock to protect decoder context list")
Fixes: afaaf3a0f647 ("media: mediatek: vcodec: adding lock to protect encoder context list")
Cc: Yunfei Dong <yunfei.dong@mediatek.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../mediatek/vcodec/common/mtk_vcodec_fw_vpu.c       | 10 ++++++----
 .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c     | 12 +++++++-----
 .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h     |  2 +-
 .../platform/mediatek/vcodec/decoder/vdec_vpu_if.c   |  4 ++--
 .../mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c     | 12 +++++++-----
 .../mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h     |  2 +-
 .../platform/mediatek/vcodec/encoder/venc_vpu_if.c   |  4 ++--
 7 files changed, 26 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
index d7027d600208..223fb2294894 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
@@ -47,30 +47,32 @@ static void mtk_vcodec_vpu_reset_dec_handler(void *priv)
 {
 	struct mtk_vcodec_dec_dev *dev = priv;
 	struct mtk_vcodec_dec_ctx *ctx;
+	unsigned long flags;
 
 	dev_err(&dev->plat_dev->dev, "Watchdog timeout!!");
 
-	mutex_lock(&dev->dev_ctx_lock);
+	spin_lock_irqsave(&dev->dev_ctx_lock, flags);
 	list_for_each_entry(ctx, &dev->ctx_list, list) {
 		ctx->state = MTK_STATE_ABORT;
 		mtk_v4l2_vdec_dbg(0, ctx, "[%d] Change to state MTK_STATE_ABORT", ctx->id);
 	}
-	mutex_unlock(&dev->dev_ctx_lock);
+	spin_unlock_irqrestore(&dev->dev_ctx_lock, flags);
 }
 
 static void mtk_vcodec_vpu_reset_enc_handler(void *priv)
 {
 	struct mtk_vcodec_enc_dev *dev = priv;
 	struct mtk_vcodec_enc_ctx *ctx;
+	unsigned long flags;
 
 	dev_err(&dev->plat_dev->dev, "Watchdog timeout!!");
 
-	mutex_lock(&dev->dev_ctx_lock);
+	spin_lock_irqsave(&dev->dev_ctx_lock, flags);
 	list_for_each_entry(ctx, &dev->ctx_list, list) {
 		ctx->state = MTK_STATE_ABORT;
 		mtk_v4l2_vdec_dbg(0, ctx, "[%d] Change to state MTK_STATE_ABORT", ctx->id);
 	}
-	mutex_unlock(&dev->dev_ctx_lock);
+	spin_unlock_irqrestore(&dev->dev_ctx_lock, flags);
 }
 
 static const struct mtk_vcodec_fw_ops mtk_vcodec_vpu_msg = {
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
index 46d176e6de63..3b81fae9f913 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
@@ -198,6 +198,7 @@ static int fops_vcodec_open(struct file *file)
 	struct mtk_vcodec_dec_ctx *ctx = NULL;
 	int ret = 0, i, hw_count;
 	struct vb2_queue *src_vq;
+	unsigned long flags;
 
 	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
@@ -267,9 +268,9 @@ static int fops_vcodec_open(struct file *file)
 
 	ctx->dev->vdec_pdata->init_vdec_params(ctx);
 
-	mutex_lock(&dev->dev_ctx_lock);
+	spin_lock_irqsave(&dev->dev_ctx_lock, flags);
 	list_add(&ctx->list, &dev->ctx_list);
-	mutex_unlock(&dev->dev_ctx_lock);
+	spin_unlock_irqrestore(&dev->dev_ctx_lock, flags);
 	mtk_vcodec_dbgfs_create(ctx);
 
 	mutex_unlock(&dev->dev_mutex);
@@ -294,6 +295,7 @@ static int fops_vcodec_release(struct file *file)
 {
 	struct mtk_vcodec_dec_dev *dev = video_drvdata(file);
 	struct mtk_vcodec_dec_ctx *ctx = file_to_dec_ctx(file);
+	unsigned long flags;
 
 	mtk_v4l2_vdec_dbg(0, ctx, "[%d] decoder", ctx->id);
 	mutex_lock(&dev->dev_mutex);
@@ -312,9 +314,9 @@ static int fops_vcodec_release(struct file *file)
 	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
 
 	mtk_vcodec_dbgfs_remove(dev, ctx->id);
-	mutex_lock(&dev->dev_ctx_lock);
+	spin_lock_irqsave(&dev->dev_ctx_lock, flags);
 	list_del_init(&ctx->list);
-	mutex_unlock(&dev->dev_ctx_lock);
+	spin_unlock_irqrestore(&dev->dev_ctx_lock, flags);
 	kfree(ctx);
 	mutex_unlock(&dev->dev_mutex);
 	return 0;
@@ -407,7 +409,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	for (i = 0; i < MTK_VDEC_HW_MAX; i++)
 		mutex_init(&dev->dec_mutex[i]);
 	mutex_init(&dev->dev_mutex);
-	mutex_init(&dev->dev_ctx_lock);
+	spin_lock_init(&dev->dev_ctx_lock);
 	spin_lock_init(&dev->irqlock);
 
 	snprintf(dev->v4l2_dev.name, sizeof(dev->v4l2_dev.name), "%s",
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
index d047d7c580fb..9d68808e8f9c 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
@@ -285,7 +285,7 @@ struct mtk_vcodec_dec_dev {
 	/* decoder hardware mutex lock */
 	struct mutex dec_mutex[MTK_VDEC_HW_MAX];
 	struct mutex dev_mutex;
-	struct mutex dev_ctx_lock;
+	spinlock_t dev_ctx_lock;
 	struct workqueue_struct *decode_workqueue;
 
 	spinlock_t irqlock;
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
index 145958206e38..e9b5cac9c63b 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
@@ -77,14 +77,14 @@ static bool vpu_dec_check_ap_inst(struct mtk_vcodec_dec_dev *dec_dev, struct vde
 	struct mtk_vcodec_dec_ctx *ctx;
 	int ret = false;
 
-	mutex_lock(&dec_dev->dev_ctx_lock);
+	spin_lock(&dec_dev->dev_ctx_lock);
 	list_for_each_entry(ctx, &dec_dev->ctx_list, list) {
 		if (!IS_ERR_OR_NULL(ctx) && ctx->vpu_inst == vpu) {
 			ret = true;
 			break;
 		}
 	}
-	mutex_unlock(&dec_dev->dev_ctx_lock);
+	spin_unlock(&dec_dev->dev_ctx_lock);
 
 	return ret;
 }
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
index fb1c3bdc2dae..82b8ff38e8f1 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
@@ -117,6 +117,7 @@ static int fops_vcodec_open(struct file *file)
 	struct mtk_vcodec_enc_ctx *ctx = NULL;
 	int ret = 0;
 	struct vb2_queue *src_vq;
+	unsigned long flags;
 
 	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
@@ -176,9 +177,9 @@ static int fops_vcodec_open(struct file *file)
 	mtk_v4l2_venc_dbg(2, ctx, "Create instance [%d]@%p m2m_ctx=%p ",
 			  ctx->id, ctx, ctx->m2m_ctx);
 
-	mutex_lock(&dev->dev_ctx_lock);
+	spin_lock_irqsave(&dev->dev_ctx_lock, flags);
 	list_add(&ctx->list, &dev->ctx_list);
-	mutex_unlock(&dev->dev_ctx_lock);
+	spin_unlock_irqrestore(&dev->dev_ctx_lock, flags);
 
 	mutex_unlock(&dev->dev_mutex);
 	mtk_v4l2_venc_dbg(0, ctx, "%s encoder [%d]", dev_name(&dev->plat_dev->dev),
@@ -203,6 +204,7 @@ static int fops_vcodec_release(struct file *file)
 {
 	struct mtk_vcodec_enc_dev *dev = video_drvdata(file);
 	struct mtk_vcodec_enc_ctx *ctx = file_to_enc_ctx(file);
+	unsigned long flags;
 
 	mtk_v4l2_venc_dbg(1, ctx, "[%d] encoder", ctx->id);
 	mutex_lock(&dev->dev_mutex);
@@ -213,9 +215,9 @@ static int fops_vcodec_release(struct file *file)
 	v4l2_fh_exit(&ctx->fh);
 	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
 
-	mutex_lock(&dev->dev_ctx_lock);
+	spin_lock_irqsave(&dev->dev_ctx_lock, flags);
 	list_del_init(&ctx->list);
-	mutex_unlock(&dev->dev_ctx_lock);
+	spin_unlock_irqrestore(&dev->dev_ctx_lock, flags);
 	kfree(ctx);
 	mutex_unlock(&dev->dev_mutex);
 	return 0;
@@ -297,7 +299,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 
 	mutex_init(&dev->enc_mutex);
 	mutex_init(&dev->dev_mutex);
-	mutex_init(&dev->dev_ctx_lock);
+	spin_lock_init(&dev->dev_ctx_lock);
 	spin_lock_init(&dev->irqlock);
 
 	snprintf(dev->v4l2_dev.name, sizeof(dev->v4l2_dev.name), "%s",
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
index 5b304a551236..0cddfa13594f 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
@@ -206,7 +206,7 @@ struct mtk_vcodec_enc_dev {
 	/* encoder hardware mutex lock */
 	struct mutex enc_mutex;
 	struct mutex dev_mutex;
-	struct mutex dev_ctx_lock;
+	spinlock_t dev_ctx_lock;
 	struct workqueue_struct *encode_workqueue;
 
 	int enc_irq;
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
index 51bb7ee141b9..79a91283da78 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
@@ -47,14 +47,14 @@ static bool vpu_enc_check_ap_inst(struct mtk_vcodec_enc_dev *enc_dev, struct ven
 	struct mtk_vcodec_enc_ctx *ctx;
 	int ret = false;
 
-	mutex_lock(&enc_dev->dev_ctx_lock);
+	spin_lock(&enc_dev->dev_ctx_lock);
 	list_for_each_entry(ctx, &enc_dev->ctx_list, list) {
 		if (!IS_ERR_OR_NULL(ctx) && ctx->vpu_inst == vpu) {
 			ret = true;
 			break;
 		}
 	}
-	mutex_unlock(&enc_dev->dev_ctx_lock);
+	spin_unlock(&enc_dev->dev_ctx_lock);
 
 	return ret;
 }
-- 
2.51.0.rc1.163.g2494970778-goog


