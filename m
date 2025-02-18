Return-Path: <linux-media+bounces-26287-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AB4A3A008
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 15:36:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 967F41889022
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 14:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3051E26AAB6;
	Tue, 18 Feb 2025 14:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nkfUPgNo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A006526A1CF
	for <linux-media@vger.kernel.org>; Tue, 18 Feb 2025 14:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739889343; cv=none; b=uj2vTRHoRsITZhiS4xZy+N1q3y0gGGwArCExWsT40Pv+0XXIAYrN40j8Y1qBll9EfYBZVVSulPvuZwMyUbqKqIUxVyhC5aJMc8ASXxx8gJ+hvngrPhHALzsXbyxBkhK/sCWCFyl108/oanx2fs8lMmnQNe3OXaoaymI/+ewaVvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739889343; c=relaxed/simple;
	bh=WhYG1hm8OLxDUEdFyoQCfWlYeOH7bU0mIsfuuRRovIM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KNYS5tbUAw68n3rAQGwbKA8kkczJJN5tpKWdNZZHGBZZ+K0FvkAmwU5mw1IRt1FUHmAsdxa1BLg/RHuUpXesPrPPOg82z+GoORIPJbadMEvBdRW2a4AUSg1VwrTyaz8KcRlYpIxOk6N59NuZ+y6gD7YfRMbPe8B7VWfVnM7rhnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nkfUPgNo; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-545284eac3bso4737151e87.0
        for <linux-media@vger.kernel.org>; Tue, 18 Feb 2025 06:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739889340; x=1740494140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5crKMExrr5c3Q5dXwzY6LzWcqdtMg4U+Mqhx5XRVtIk=;
        b=nkfUPgNooz++zsBCExuxhFsFDnyb5IX6h0+GyDYQ+jtkIhafjtkVCrhY/xQF3Fl/H5
         DMtoqO+sWNnYD/Dc8cIQH5CwwHsz/PVKKfhwywxUe6dTyjcCrg63yQg9MiHmLtHw27RJ
         9gtJUXU7lVg3clpJ3wP/mwLsRNFYH/hiaAC7jcOLp/07R0si98QFDZZ+3qpEQ2b1zbpE
         GdEpcueF5G/CRPFBnPLSJm4Jl5l6CcL+ij6+kXXDUhsCyeWduPUUlR0a7Ns8c9F546qi
         Nfp6bn8GN22yKtF6ZmxOPPWnJNG5oVqDei3MgwBHPbQ5GwFgU8/Ha/g3skZdELKlynLU
         GELA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739889340; x=1740494140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5crKMExrr5c3Q5dXwzY6LzWcqdtMg4U+Mqhx5XRVtIk=;
        b=qvrca8NuZSx5HzpMLu0geRNRSQbobkdObq/8pkFZNchKiECm3YFyMWaIAY0uzXWkVD
         jzYZcxrc3ALe//Cj5XqhqdBOb9FwqQlpHV0to/F2fLaNfOgB365HYhbDayewKNX+wgzJ
         DpXG5jrsvrYBHrda0WVLLUqSgHeuK9sqtNJadOifGvEcRxCaJvchyQH80KUGuKBuhUlN
         tzpgDbRc2Rxsl6U4a0QNuxjedrd450N05aBiQTy2EnXU3XX7sGeGSFbb+QlI4NPilr6w
         dzkJuE7EXtQcmCQA1jybhHm8cjqF6T2XSWHgBOEzymEks4sfrWh36bhWAaDYI6pwNY84
         R65Q==
X-Forwarded-Encrypted: i=1; AJvYcCVJbGj1C8+WBjn1EM4++3D4pZSNicA7QmseyUy75sgB1p5e7k9tdCFnWNQGoFf0ZfsyRTQebEs36DM1jQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHOHjKXGfHyDG0Isep16enDMuT6DqjC7EjeUg+fmVTOI1iR360
	WSFHRFRv3oPaHv7YZAGI6wFyrxBe8vVmNmFXW/V3cO5v/oYmpYAPKZax6uSrBGI=
X-Gm-Gg: ASbGncteQhBq+CntM91Ve3BBZfVjbu9a1FgSMG5e5ZPAfjqjcjNniVtJCBikNnBA7yG
	nqArYe7DhK4r3eLwI7wdgdGOVgsDHhPv3z7m45tKDUB2MHroGmfZWTY0CZHn1o/Y1BqoLFZ31ef
	Xzx86mPNTXMh2YPLLRpqPGtjMtbLf+wKVhOVtK9FKzuZi5D/vBwKPO+xxOCrJNo/D734M85WBJI
	8p1R9U3dD67KlTQHQQ6G/dYYcLg3bnYDaMG3kL6rzi7N14BAcXCOQXTpSw2Zz3cBTA1B41pRyjE
	qVDD4S99XOpbv5ml/vX51IgEM7nYFzwE11K2rFmfbIVinuI0skLdKy0SszkA1YRt19mf
X-Google-Smtp-Source: AGHT+IGHuwCuQFYm4XQIVFkYY86WrwdSnRz+8agLRLCIecYLWINXh1qm1vFaOFrES19B9Zbg/l5wSA==
X-Received: by 2002:a05:6512:1092:b0:545:a1a:556b with SMTP id 2adb3069b0e04-5452fdb9988mr5179716e87.0.1739889339564;
        Tue, 18 Feb 2025 06:35:39 -0800 (PST)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-309311777a8sm12360831fa.25.2025.02.18.06.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 06:35:38 -0800 (PST)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org
Cc: Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sumit Garg <sumit.garg@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v5 2/7] tee: add TEE_IOC_RSTMEM_FD_INFO
Date: Tue, 18 Feb 2025 15:34:51 +0100
Message-ID: <20250218143527.1236668-3-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250218143527.1236668-1-jens.wiklander@linaro.org>
References: <20250218143527.1236668-1-jens.wiklander@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add TEE_IOC_RSTMEM_FD_INFO to retrieve information about a previously
allocated restricted memory dma-buf file descriptor. This is needed if
the file descriptor from a restricted memory allocation has been saved
due to limitations in the application.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/tee_core.c    | 31 +++++++++++++++++++++++++++++++
 drivers/tee/tee_private.h |  2 ++
 drivers/tee/tee_rstmem.c  |  8 ++++++++
 include/uapi/linux/tee.h  | 27 +++++++++++++++++++++++++++
 4 files changed, 68 insertions(+)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index f4a45b77753b..01a2a9513578 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -848,6 +848,35 @@ tee_ioctl_rstmem_alloc(struct tee_context *ctx,
 	return fd;
 }
 
+static int
+tee_ioctl_rstmem_fd_info(struct tee_context *ctx,
+			 struct tee_ioctl_rstmem_fd_info __user *udata)
+{
+	struct tee_ioctl_rstmem_fd_info data;
+	struct dma_buf *dmabuf;
+	struct tee_shm *shm;
+
+	if (copy_from_user(&data, udata, sizeof(data)))
+		return -EFAULT;
+
+	dmabuf = dma_buf_get(data.fd);
+	if (IS_ERR(dmabuf))
+		return PTR_ERR(dmabuf);
+	shm = tee_rstmem_dmabuf_to_shm(ctx, dmabuf);
+	if (!IS_ERR(shm)) {
+		data.flags = 0;
+		data.use_case = shm->use_case;
+		data.id = shm->id;
+		data.size = shm->size;
+	}
+	dma_buf_put(dmabuf);
+	if (IS_ERR(shm))
+		return PTR_ERR(shm);
+	if (copy_to_user(udata, &data, sizeof(data)))
+		return -EFAULT;
+	return 0;
+}
+
 static long tee_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 {
 	struct tee_context *ctx = filp->private_data;
@@ -874,6 +903,8 @@ static long tee_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		return tee_ioctl_supp_send(ctx, uarg);
 	case TEE_IOC_RSTMEM_ALLOC:
 		return tee_ioctl_rstmem_alloc(ctx, uarg);
+	case TEE_IOC_RSTMEM_FD_INFO:
+		return tee_ioctl_rstmem_fd_info(ctx, uarg);
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/tee/tee_private.h b/drivers/tee/tee_private.h
index bf97796909c0..b076089b2512 100644
--- a/drivers/tee/tee_private.h
+++ b/drivers/tee/tee_private.h
@@ -25,5 +25,7 @@ struct tee_shm *tee_shm_register_user_buf(struct tee_context *ctx,
 					  unsigned long addr, size_t length);
 struct dma_buf *tee_rstmem_alloc(struct tee_context *ctx, u32 flags,
 				 u32 use_case, size_t size, int *shm_id);
+struct tee_shm *tee_rstmem_dmabuf_to_shm(struct tee_context *ctx,
+					 struct dma_buf *dmabuf);
 
 #endif /*TEE_PRIVATE_H*/
diff --git a/drivers/tee/tee_rstmem.c b/drivers/tee/tee_rstmem.c
index 3b27594ec30b..5108772f3ca0 100644
--- a/drivers/tee/tee_rstmem.c
+++ b/drivers/tee/tee_rstmem.c
@@ -178,3 +178,11 @@ struct dma_buf *tee_rstmem_alloc(struct tee_context *ctx, u32 flags,
 	tee_device_put(teedev);
 	return dmabuf;
 }
+
+struct tee_shm *tee_rstmem_dmabuf_to_shm(struct tee_context *ctx,
+					 struct dma_buf *dmabuf)
+{
+	if (dmabuf->ops != &rstmem_generic_buf_ops)
+		return ERR_PTR(-EINVAL);
+	return dmabuf->priv;
+}
diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
index 88834448debb..30ab5bd80a55 100644
--- a/include/uapi/linux/tee.h
+++ b/include/uapi/linux/tee.h
@@ -431,6 +431,33 @@ struct tee_ioctl_rstmem_alloc_data {
 #define TEE_IOC_RSTMEM_ALLOC     _IOWR(TEE_IOC_MAGIC, TEE_IOC_BASE + 10, \
 				       struct tee_ioctl_rstmem_alloc_data)
 
+/**
+ * struct tee_ioctl_rstmem_fd_info - Restricted memory information
+ * @fd:		[in] File descriptor returned from the previous allocation
+ * @flags:	[out] Flags from the allocation
+ * @use_case:	[out] Restricted memory use case, TEE_IOC_UC_*
+ * @id:		[out] Identifier of the restricted memory
+ * @size:	[out] Size of the restricted memory
+ */
+struct tee_ioctl_rstmem_fd_info {
+	__s32 fd;
+	__u32 flags;
+	__u32 use_case;
+	__s32 id;
+	__u64 size;
+};
+
+/**
+ * TEE_IOC_RSTMEM_FD_INFO - get restricted memory information from an fd
+ *
+ * Returns information about a previously allocated restricted memory
+ * dma-buf file descriptor.
+ *
+ * Returns 0 on success or < 0 on failure
+ */
+#define TEE_IOC_RSTMEM_FD_INFO	_IOWR(TEE_IOC_MAGIC, TEE_IOC_BASE + 11, \
+				      struct tee_ioctl_rstmem_fd_info)
+
 /*
  * Five syscalls are used when communicating with the TEE driver.
  * open(): opens the device associated with the driver
-- 
2.43.0


