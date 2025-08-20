Return-Path: <linux-media+bounces-40343-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36184B2D536
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 09:54:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95C5A4E87B7
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 07:54:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DAAE2D8396;
	Wed, 20 Aug 2025 07:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FSXw55u6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0182C11D1
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 07:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755676456; cv=none; b=DJom9hnVuXohiZGdEttBRrXRuKcbJGx6O2HZ0TidJTCobERyaOk24PY6U3cMQaxEDsH3SoJeKdWhQTpoM0vbQUDLZsST3ikiBILZLJTmsWB2lSsqpajIqnBHKqQNVv7A9d2RiImj8PyP0g46Hr2haV2AXULOIVpKiNnxP9O9I4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755676456; c=relaxed/simple;
	bh=ntFIgaL02srWXrd27KTUirbWqr2GvntCST8bEnN1u10=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P90rMeNpI1s18JCmmURBcdw/CfBIS9evSK5CI9NM9vxrTExUJ9a26Gjd3PTDmozaj4VYBf+Zfea7EI8OlD0becKjIQ+ZzoSqus3OMnq6OnPP8tm2OtyHDIcvvyxviPt9wZ3taBY92RgYcOOEnJkCWSpXpTC0BwvefawEwwY8wpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FSXw55u6; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-76e2e614b84so5876876b3a.0
        for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 00:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755676454; x=1756281254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b6MrObmZF0W3Iz/7ouACW2WJ6KhbE+Mk18toMzH5Rik=;
        b=FSXw55u6dgG59+5EoNNnlEp2jy3afuJENKS0DjmLxM+tyGdBz1Vh0TY0Se5ZgIbLo0
         ExAkdsk4BLdnxLmy58YMcw9gqDFf758PtEAnULa3xWq8Txun3dFi9IGz6QFj5Xu0VCav
         nvjw9M8Cw7OucuvjsOBTQUHHNA8lY+UWk2bmk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755676454; x=1756281254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b6MrObmZF0W3Iz/7ouACW2WJ6KhbE+Mk18toMzH5Rik=;
        b=S6POgOvmqTRoWaysDTDvKUFj44KuJjrLZf2/mu60ywHms/lyJ7W4nBj0LAFZh/UMCt
         AsbSTdaTgK0kSo9Wpa9rdhLIawbYLhoSnpDps/3Z7v1UyOT59IQC/d5rcupfJSsE9kfA
         XOWeBTGZVXjUWNkJDE1aWfBCb71mQrDFe2F0dPru2Yxaq6XF/Uzw2B4x6qZ/tNQkFh3M
         RTSzcruvx2fmcWgNo/Ohr81v9GRS10Fk2yaC8wWzu+6CNhmTd0hVWR+ORMpGfxpCNdWg
         6VbdZ0OQ5H4Y5/KL8X2kNPipOeAy31F0wFUte+fUBR74qOmNnTg86+Qt0Zh71bSibpTk
         h/+g==
X-Forwarded-Encrypted: i=1; AJvYcCXPRFSw2qjwW6FsDt8/uZ9wOzXREI3iGIbF4pB5k6EJ9yL7EXR4zrpGYg35Eb8L3krzbs4NJV77/0Mf6w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy1Fx5/HeohzmU2FpEfJnpzTHXDP2rzNOH9cMv9u0HifGdtoTq
	XOl1gD3kDGygX4+olNiPywxnn72/EewZKjIL/SafTv7l/1zBVu4l3Oc/LjfMLPJ8BQ==
X-Gm-Gg: ASbGnctB0VxkVrtIoJkKyvmwAaRsrHiPb1hQA2hA0/H2EXol9ZwkZsFietwukdeXMrs
	9T4YEMbcC5y/Gl2GhhljP2Eiid2jDyTwirfwbxoqcmpBrm3IukTICk1/trnzoOBjSgb8937j3Ag
	z9jgyB81M6paxTp0ojX6JFIAZAGZ8JsaeI+Y7ty1MaL5f50gJPN4lHpB3BQhvl18/FcrC7RxlWo
	bhojtV+75RHvyLqZrcOZfYeJZpFvvOwYD5GqtsaJxty3+gmnZvEy42gW1DTOkMR4kYhluMsLLI6
	IeT184aYD19vL4ujBhi3QRtNDVmxWepeABI8IBrY02I4mOzgiKsH7tMT0N4qDq1gcrlYqzShmsx
	3vYiQqkBs1a9cnyW8FqQLw/xEbJ4zTkuZTNYqETKl
X-Google-Smtp-Source: AGHT+IHvJjrk2TtQqpsyJ1Ye0D3Ld8eJPj/J3yAc/mNjIWdy7fiHoTPy/AdpxRywfbk04Kizt/1zwQ==
X-Received: by 2002:a05:6a20:389d:b0:23f:f431:9f64 with SMTP id adf61e73a8af0-2431b829560mr2427344637.25.1755676454152;
        Wed, 20 Aug 2025 00:54:14 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:53f4:ede0:803f:9a86])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4764090714sm1547298a12.32.2025.08.20.00.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 00:54:13 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Tomasz Figa <tfiga@chromium.org>
Subject: [PATCH v2] media: mediatek: vcodec: Use spinlock for context list protection lock
Date: Wed, 20 Aug 2025 15:54:05 +0800
Message-ID: <20250820075405.1041838-1-wenst@chromium.org>
X-Mailer: git-send-email 2.51.0.rc1.167.g924127e9c0-goog
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
Changes since v1:
- Switched to _irqsave / _irqrestore variants even in helper only called
  by IRQ handler (Tomasz)

 .../mediatek/vcodec/common/mtk_vcodec_fw_vpu.c       | 10 ++++++----
 .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c     | 12 +++++++-----
 .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h     |  2 +-
 .../platform/mediatek/vcodec/decoder/vdec_vpu_if.c   |  5 +++--
 .../mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c     | 12 +++++++-----
 .../mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h     |  2 +-
 .../platform/mediatek/vcodec/encoder/venc_vpu_if.c   |  5 +++--
 7 files changed, 28 insertions(+), 20 deletions(-)

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
index 145958206e38..40b97f114cf6 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
@@ -75,16 +75,17 @@ static void handle_get_param_msg_ack(const struct vdec_vpu_ipi_get_param_ack *ms
 static bool vpu_dec_check_ap_inst(struct mtk_vcodec_dec_dev *dec_dev, struct vdec_vpu_inst *vpu)
 {
 	struct mtk_vcodec_dec_ctx *ctx;
+	unsigned long flags;
 	int ret = false;
 
-	mutex_lock(&dec_dev->dev_ctx_lock);
+	spin_lock_irqsave(&dec_dev->dev_ctx_lock, flags);
 	list_for_each_entry(ctx, &dec_dev->ctx_list, list) {
 		if (!IS_ERR_OR_NULL(ctx) && ctx->vpu_inst == vpu) {
 			ret = true;
 			break;
 		}
 	}
-	mutex_unlock(&dec_dev->dev_ctx_lock);
+	spin_unlock_irqrestore(&dec_dev->dev_ctx_lock, flags);
 
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
index 51bb7ee141b9..3c229b1f6b21 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
@@ -45,16 +45,17 @@ static void handle_enc_encode_msg(struct venc_vpu_inst *vpu, const void *data)
 static bool vpu_enc_check_ap_inst(struct mtk_vcodec_enc_dev *enc_dev, struct venc_vpu_inst *vpu)
 {
 	struct mtk_vcodec_enc_ctx *ctx;
+	unsigned long flags;
 	int ret = false;
 
-	mutex_lock(&enc_dev->dev_ctx_lock);
+	spin_lock_irqsave(&enc_dev->dev_ctx_lock, flags);
 	list_for_each_entry(ctx, &enc_dev->ctx_list, list) {
 		if (!IS_ERR_OR_NULL(ctx) && ctx->vpu_inst == vpu) {
 			ret = true;
 			break;
 		}
 	}
-	mutex_unlock(&enc_dev->dev_ctx_lock);
+	spin_unlock_irqrestore(&enc_dev->dev_ctx_lock, flags);
 
 	return ret;
 }
-- 
2.51.0.rc1.167.g924127e9c0-goog


