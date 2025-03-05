Return-Path: <linux-media+bounces-27627-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CF85CA4FFC0
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 14:12:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E1461729EF
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 13:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A623324EA82;
	Wed,  5 Mar 2025 13:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RLd4Nlrh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B33724E00D
	for <linux-media@vger.kernel.org>; Wed,  5 Mar 2025 13:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741180021; cv=none; b=VveETVwZZmX4AoOq4wyl4BwbxytDE6CG+lvlw3plaSfjZeqbgBmWGXOgWt/Gqojw2FeY5RuTcp4wOiC6yOmRVScyJIgHkXgZ0daG5O8dqyDpKQlOjKapiYrh8h3VtlJGYg2+acQsdWyOFktc4VO53/Hl+WLX7D6wD3+VA8kT7X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741180021; c=relaxed/simple;
	bh=oNtXPm1WJ3efB3y6j/VVtzxNhxHC8L0s0JU904cMlfU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JOBk405W49VrIjBO7J/A4maGU/6IjmWwAuL2Lvq9TCfgLOUfTx/frfv7+iSEWBpY+RQ0EiwhT+OLssluLzWILOs5fC7p0JSNlPq4iW/PXXhCPGiEzbQ5bfUq+vVpXe4l0IsE8otkZLHY44wYV99NECk6UDgaeqcYNf9VlNSwy2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RLd4Nlrh; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e0b70fb1daso11838249a12.1
        for <linux-media@vger.kernel.org>; Wed, 05 Mar 2025 05:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741180017; x=1741784817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5CcAD/p05b1IVvXLEIrs8hiPkLvSkxniC6dMT97HxMQ=;
        b=RLd4Nlrh5HJO7lLxgnUPHgK6+AzmhrdrMGgIbPX2nokDOOrHpyrgksbzNP0KZEdHto
         0/KfJg6y3Ru2UgUXh7Ph26gxqAbwoF1Ro6IHEqqI1YfdapCdEAX5cRZCey3Fcc2FU68o
         IfAwM54wDmHZiQaGY3yPZ88di9tqvytOU7pLo/+ysb0KOopqqwsB2QvWnTgLvdFbzIhv
         I0Su6giCsHBdZDjKDh4gsdqZ3v38XSRXf80UNfn70m8RcDUNl/8Uu5/SMTweSxEXHqhS
         DB/blkhjiAlAj4u+HOvO0fiYjAwUKLiGML1ZumBRWUvAMbTZiWWpualnYk//DrAtGG9x
         Q8ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741180017; x=1741784817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5CcAD/p05b1IVvXLEIrs8hiPkLvSkxniC6dMT97HxMQ=;
        b=NNfYapLp6rw/hKp+cwzMzuyxHHP2lJP7pmJWkASPFXPn5NPNua/25+93Zijp3DP1Ob
         1NojwEiIpZEZFxsoIFexWudAyL9T5KBj8FDJICW0643QSCTYsH9yphmLMRStt+KgU1Nt
         GUrEmQZS/RCSYotzlehFS5wlzp6IC6F1iGaHa0pvU+hFxxjcyJM8AycRkzDgGoEnY0TI
         d32CrPLgksjSXIcTS1/RQr5vWedQueiHeXIMgV65Qvo8Ki7Vnyef1Og1zWXWDMpelYMV
         wXI/Ytk6zCLkdOTK99xTssc7CngM//zDrIpdddAHU3K8AZwu1HJgTrPn0PkLYSTNnB3C
         3b1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXvQ4kuEzVo70Ahzz0Wo6lumtEaD23gsBNhJlsjJqIeOLPZh3OIiqRWKEP0Jm3BKXRn4z6Mwft15fE84A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzI5AuQQa/aszrJpCzD0kaq9x5ctKoFtytI5dRKbHpmNhmiZUsj
	TZLRzG+MDklr1t22L3oRE+QGwMJ8SOImUWRzqAs66CpJtOIEkfWir+Mqvc/1de8=
X-Gm-Gg: ASbGncu/Bb4oFeNqyI+Tol7Y05Hwe6hfy2wn9gaU3TXZ3dFoEWwN+nsdg9fjaBQdnrm
	oBRw7skFDQ9Mf67UHRn/MohHqPSIm2fBXSeMRQ7B5j7ON1VQWuxVOruLVAMtsAz/2cT10bc706K
	xP9fT1IqUyUB80vtWFRXjLWZypwJMV7DJn+0lDDqRlLt1PdH3ttBffqrsageXUd4+oopZQsvn7i
	3n5h4AjZ5M/PCQaYCpoMKwKJ/3mv5X7BaIQEeLhrWQJvjWPOhXimEZH/h2Y0i9EYiIvqQkXtPs0
	ipyisXeSp+flnitMyQ+xQpjZn6w+TPPh4vONcXrZrnIo/RU/siLgMC3HZnvUIYV6UgbkOMpyyhQ
	7GxwJUaAKVWEieTpaE0y7sQ==
X-Google-Smtp-Source: AGHT+IG3cgo4lt4+QBuBPJp4MiDy4EL2BqrtziPjGxQujndCvzWUBDgOAl5gJF76QqdWuudAiJRjUg==
X-Received: by 2002:a05:6402:1e92:b0:5d9:82bc:ad06 with SMTP id 4fb4d7f45d1cf-5e59f386d7dmr2815278a12.3.1741180016471;
        Wed, 05 Mar 2025 05:06:56 -0800 (PST)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5bcd1595bsm65714a12.42.2025.03.05.05.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 05:06:55 -0800 (PST)
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
	Daniel Stone <daniel@fooishbar.org>,
	Etienne Carriere <etienne.carriere@linaro.org>,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v6 06/10] tee: new ioctl to a register tee_shm from a dmabuf file descriptor
Date: Wed,  5 Mar 2025 14:04:12 +0100
Message-ID: <20250305130634.1850178-7-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250305130634.1850178-1-jens.wiklander@linaro.org>
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Etienne Carriere <etienne.carriere@linaro.org>

Enable userspace to create a tee_shm object that refers to a dmabuf
reference.

Userspace registers the dmabuf file descriptor as in a tee_shm object.
The registration is completed with a tee_shm file descriptor returned to
userspace.

Userspace is free to close the dmabuf file descriptor now since all the
resources are now held via the tee_shm object.

Closing the tee_shm file descriptor will release all resources used by the
tee_shm object.

This change only support dmabuf references that relates to physically
contiguous memory buffers.

New tee_shm flag to identify tee_shm objects built from a registered
dmabuf, TEE_SHM_DMA_BUF.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
Signed-off-by: Olivier Masse <olivier.masse@nxp.com>
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/tee_core.c    | 145 ++++++++++++++++++++++++++-----------
 drivers/tee/tee_private.h |   1 +
 drivers/tee/tee_shm.c     | 146 ++++++++++++++++++++++++++++++++++++--
 include/linux/tee_core.h  |   1 +
 include/linux/tee_drv.h   |  10 +++
 include/uapi/linux/tee.h  |  29 ++++++++
 6 files changed, 288 insertions(+), 44 deletions(-)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index 685afcaa3ea1..3a71643766d5 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -353,6 +353,103 @@ tee_ioctl_shm_register(struct tee_context *ctx,
 	return ret;
 }
 
+static int
+tee_ioctl_shm_register_fd(struct tee_context *ctx,
+			  struct tee_ioctl_shm_register_fd_data __user *udata)
+{
+	struct tee_ioctl_shm_register_fd_data data;
+	struct tee_shm *shm;
+	long ret;
+
+	if (copy_from_user(&data, udata, sizeof(data)))
+		return -EFAULT;
+
+	/* Currently no input flags are supported */
+	if (data.flags)
+		return -EINVAL;
+
+	shm = tee_shm_register_fd(ctx, data.fd);
+	if (IS_ERR(shm))
+		return -EINVAL;
+
+	data.id = shm->id;
+	data.flags = shm->flags;
+	data.size = shm->size;
+
+	if (copy_to_user(udata, &data, sizeof(data)))
+		ret = -EFAULT;
+	else
+		ret = tee_shm_get_fd(shm);
+
+	/*
+	 * When user space closes the file descriptor the shared memory
+	 * should be freed or if tee_shm_get_fd() failed then it will
+	 * be freed immediately.
+	 */
+	tee_shm_put(shm);
+	return ret;
+}
+
+static int param_from_user_memref(struct tee_context *ctx,
+				  struct tee_param_memref *memref,
+				  struct tee_ioctl_param *ip)
+{
+	struct tee_shm *shm;
+	size_t offs = 0;
+
+	/*
+	 * If a NULL pointer is passed to a TA in the TEE,
+	 * the ip.c IOCTL parameters is set to TEE_MEMREF_NULL
+	 * indicating a NULL memory reference.
+	 */
+	if (ip->c != TEE_MEMREF_NULL) {
+		/*
+		 * If we fail to get a pointer to a shared
+		 * memory object (and increase the ref count)
+		 * from an identifier we return an error. All
+		 * pointers that has been added in params have
+		 * an increased ref count. It's the callers
+		 * responibility to do tee_shm_put() on all
+		 * resolved pointers.
+		 */
+		shm = tee_shm_get_from_id(ctx, ip->c);
+		if (IS_ERR(shm))
+			return PTR_ERR(shm);
+
+		/*
+		 * Ensure offset + size does not overflow
+		 * offset and does not overflow the size of
+		 * the referred shared memory object.
+		 */
+		if ((ip->a + ip->b) < ip->a ||
+		    (ip->a + ip->b) > shm->size) {
+			tee_shm_put(shm);
+			return -EINVAL;
+		}
+
+		if (shm->flags & TEE_SHM_DMA_BUF) {
+			struct tee_shm *parent_shm;
+
+			parent_shm = tee_shm_get_parent_shm(shm, &offs);
+			if (parent_shm) {
+				tee_shm_put(shm);
+				shm = parent_shm;
+			}
+		}
+	} else if (ctx->cap_memref_null) {
+		/* Pass NULL pointer to OP-TEE */
+		shm = NULL;
+	} else {
+		return -EINVAL;
+	}
+
+	memref->shm_offs = ip->a + offs;
+	memref->size = ip->b;
+	memref->shm = shm;
+
+	return 0;
+}
+
 static int params_from_user(struct tee_context *ctx, struct tee_param *params,
 			    size_t num_params,
 			    struct tee_ioctl_param __user *uparams)
@@ -360,8 +457,8 @@ static int params_from_user(struct tee_context *ctx, struct tee_param *params,
 	size_t n;
 
 	for (n = 0; n < num_params; n++) {
-		struct tee_shm *shm;
 		struct tee_ioctl_param ip;
+		int rc;
 
 		if (copy_from_user(&ip, uparams + n, sizeof(ip)))
 			return -EFAULT;
@@ -384,45 +481,10 @@ static int params_from_user(struct tee_context *ctx, struct tee_param *params,
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
-			/*
-			 * If a NULL pointer is passed to a TA in the TEE,
-			 * the ip.c IOCTL parameters is set to TEE_MEMREF_NULL
-			 * indicating a NULL memory reference.
-			 */
-			if (ip.c != TEE_MEMREF_NULL) {
-				/*
-				 * If we fail to get a pointer to a shared
-				 * memory object (and increase the ref count)
-				 * from an identifier we return an error. All
-				 * pointers that has been added in params have
-				 * an increased ref count. It's the callers
-				 * responibility to do tee_shm_put() on all
-				 * resolved pointers.
-				 */
-				shm = tee_shm_get_from_id(ctx, ip.c);
-				if (IS_ERR(shm))
-					return PTR_ERR(shm);
-
-				/*
-				 * Ensure offset + size does not overflow
-				 * offset and does not overflow the size of
-				 * the referred shared memory object.
-				 */
-				if ((ip.a + ip.b) < ip.a ||
-				    (ip.a + ip.b) > shm->size) {
-					tee_shm_put(shm);
-					return -EINVAL;
-				}
-			} else if (ctx->cap_memref_null) {
-				/* Pass NULL pointer to OP-TEE */
-				shm = NULL;
-			} else {
-				return -EINVAL;
-			}
-
-			params[n].u.memref.shm_offs = ip.a;
-			params[n].u.memref.size = ip.b;
-			params[n].u.memref.shm = shm;
+			rc = param_from_user_memref(ctx, &params[n].u.memref,
+						    &ip);
+			if (rc)
+				return rc;
 			break;
 		default:
 			/* Unknown attribute */
@@ -827,6 +889,8 @@ static long tee_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		return tee_ioctl_shm_alloc(ctx, uarg);
 	case TEE_IOC_SHM_REGISTER:
 		return tee_ioctl_shm_register(ctx, uarg);
+	case TEE_IOC_SHM_REGISTER_FD:
+		return tee_ioctl_shm_register_fd(ctx, uarg);
 	case TEE_IOC_OPEN_SESSION:
 		return tee_ioctl_open_session(ctx, uarg);
 	case TEE_IOC_INVOKE:
@@ -1288,3 +1352,4 @@ MODULE_AUTHOR("Linaro");
 MODULE_DESCRIPTION("TEE Driver");
 MODULE_VERSION("1.0");
 MODULE_LICENSE("GPL v2");
+MODULE_IMPORT_NS("DMA_BUF");
diff --git a/drivers/tee/tee_private.h b/drivers/tee/tee_private.h
index 6c6ff5d5eed2..aad7f6c7e0f0 100644
--- a/drivers/tee/tee_private.h
+++ b/drivers/tee/tee_private.h
@@ -24,6 +24,7 @@ void teedev_ctx_put(struct tee_context *ctx);
 struct tee_shm *tee_shm_alloc_user_buf(struct tee_context *ctx, size_t size);
 struct tee_shm *tee_shm_register_user_buf(struct tee_context *ctx,
 					  unsigned long addr, size_t length);
+struct tee_shm *tee_shm_get_parent_shm(struct tee_shm *shm, size_t *offs);
 
 int tee_heap_update_from_dma_buf(struct tee_device *teedev,
 				 struct dma_buf *dmabuf, size_t *offset,
diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
index daf6e5cfd59a..8b79918468b5 100644
--- a/drivers/tee/tee_shm.c
+++ b/drivers/tee/tee_shm.c
@@ -4,6 +4,7 @@
  */
 #include <linux/anon_inodes.h>
 #include <linux/device.h>
+#include <linux/dma-buf.h>
 #include <linux/idr.h>
 #include <linux/io.h>
 #include <linux/mm.h>
@@ -15,6 +16,16 @@
 #include <linux/highmem.h>
 #include "tee_private.h"
 
+/* extra references appended to shm object for registered shared memory */
+struct tee_shm_dmabuf_ref {
+	struct tee_shm shm;
+	size_t offset;
+	struct dma_buf *dmabuf;
+	struct dma_buf_attachment *attach;
+	struct sg_table *sgt;
+	struct tee_shm *parent_shm;
+};
+
 static void shm_put_kernel_pages(struct page **pages, size_t page_count)
 {
 	size_t n;
@@ -45,7 +56,23 @@ static void release_registered_pages(struct tee_shm *shm)
 
 static void tee_shm_release(struct tee_device *teedev, struct tee_shm *shm)
 {
-	if (shm->flags & TEE_SHM_POOL) {
+	struct tee_shm *parent_shm = NULL;
+	void *p = shm;
+
+	if (shm->flags & TEE_SHM_DMA_BUF) {
+		struct tee_shm_dmabuf_ref *ref;
+
+		ref = container_of(shm, struct tee_shm_dmabuf_ref, shm);
+		parent_shm = ref->parent_shm;
+		p = ref;
+		if (ref->attach) {
+			dma_buf_unmap_attachment(ref->attach, ref->sgt,
+						 DMA_BIDIRECTIONAL);
+
+			dma_buf_detach(ref->dmabuf, ref->attach);
+		}
+		dma_buf_put(ref->dmabuf);
+	} else if (shm->flags & TEE_SHM_POOL) {
 		teedev->pool->ops->free(teedev->pool, shm);
 	} else if (shm->flags & TEE_SHM_DYNAMIC) {
 		int rc = teedev->desc->ops->shm_unregister(shm->ctx, shm);
@@ -57,9 +84,10 @@ static void tee_shm_release(struct tee_device *teedev, struct tee_shm *shm)
 		release_registered_pages(shm);
 	}
 
-	teedev_ctx_put(shm->ctx);
+	if (shm->ctx)
+		teedev_ctx_put(shm->ctx);
 
-	kfree(shm);
+	kfree(p);
 
 	tee_device_put(teedev);
 }
@@ -169,7 +197,7 @@ struct tee_shm *tee_shm_alloc_user_buf(struct tee_context *ctx, size_t size)
  * tee_client_invoke_func(). The memory allocated is later freed with a
  * call to tee_shm_free().
  *
- * @returns a pointer to 'struct tee_shm'
+ * @returns a pointer to 'struct tee_shm' on success, and ERR_PTR on failure
  */
 struct tee_shm *tee_shm_alloc_kernel_buf(struct tee_context *ctx, size_t size)
 {
@@ -179,6 +207,116 @@ struct tee_shm *tee_shm_alloc_kernel_buf(struct tee_context *ctx, size_t size)
 }
 EXPORT_SYMBOL_GPL(tee_shm_alloc_kernel_buf);
 
+struct tee_shm *tee_shm_register_fd(struct tee_context *ctx, int fd)
+{
+	struct tee_shm_dmabuf_ref *ref;
+	int rc;
+
+	if (!tee_device_get(ctx->teedev))
+		return ERR_PTR(-EINVAL);
+
+	teedev_ctx_get(ctx);
+
+	ref = kzalloc(sizeof(*ref), GFP_KERNEL);
+	if (!ref) {
+		rc = -ENOMEM;
+		goto err_put_tee;
+	}
+
+	refcount_set(&ref->shm.refcount, 1);
+	ref->shm.ctx = ctx;
+	ref->shm.id = -1;
+	ref->shm.flags = TEE_SHM_DMA_BUF;
+
+	ref->dmabuf = dma_buf_get(fd);
+	if (IS_ERR(ref->dmabuf)) {
+		rc = PTR_ERR(ref->dmabuf);
+		goto err_kfree_ref;
+	}
+
+	rc = tee_heap_update_from_dma_buf(ctx->teedev, ref->dmabuf,
+					  &ref->offset, &ref->shm,
+					  &ref->parent_shm);
+	if (!rc)
+		goto out;
+	if (rc != -EINVAL)
+		goto err_put_dmabuf;
+
+	ref->attach = dma_buf_attach(ref->dmabuf, &ctx->teedev->dev);
+	if (IS_ERR(ref->attach)) {
+		rc = PTR_ERR(ref->attach);
+		goto err_put_dmabuf;
+	}
+
+	ref->sgt = dma_buf_map_attachment(ref->attach, DMA_BIDIRECTIONAL);
+	if (IS_ERR(ref->sgt)) {
+		rc = PTR_ERR(ref->sgt);
+		goto err_detach;
+	}
+
+	if (sg_nents(ref->sgt->sgl) != 1) {
+		rc = PTR_ERR(ref->sgt->sgl);
+		goto err_unmap_attachement;
+	}
+
+	ref->shm.paddr = page_to_phys(sg_page(ref->sgt->sgl));
+	ref->shm.size = ref->sgt->sgl->length;
+
+out:
+	mutex_lock(&ref->shm.ctx->teedev->mutex);
+	ref->shm.id = idr_alloc(&ref->shm.ctx->teedev->idr, &ref->shm,
+				1, 0, GFP_KERNEL);
+	mutex_unlock(&ref->shm.ctx->teedev->mutex);
+	if (ref->shm.id < 0) {
+		rc = ref->shm.id;
+		if (ref->attach)
+			goto err_unmap_attachement;
+		goto err_put_dmabuf;
+	}
+
+	return &ref->shm;
+
+err_unmap_attachement:
+	dma_buf_unmap_attachment(ref->attach, ref->sgt, DMA_BIDIRECTIONAL);
+err_detach:
+	dma_buf_detach(ref->dmabuf, ref->attach);
+err_put_dmabuf:
+	dma_buf_put(ref->dmabuf);
+err_kfree_ref:
+	kfree(ref);
+err_put_tee:
+	teedev_ctx_put(ctx);
+	tee_device_put(ctx->teedev);
+
+	return ERR_PTR(rc);
+}
+EXPORT_SYMBOL_GPL(tee_shm_register_fd);
+
+struct tee_shm *tee_shm_get_parent_shm(struct tee_shm *shm, size_t *offs)
+{
+	struct tee_shm *parent_shm = NULL;
+
+	if (shm->flags & TEE_SHM_DMA_BUF) {
+		struct tee_shm_dmabuf_ref *ref;
+
+		ref = container_of(shm, struct tee_shm_dmabuf_ref, shm);
+		if (ref->parent_shm) {
+			/*
+			 * the shm already has one reference to
+			 * ref->parent_shm so we should be clear of 0.
+			 * We're getting another reference since the caller
+			 * of this function expects to put the returned
+			 * parent_shm when it's done with it.
+			 */
+			parent_shm = ref->parent_shm;
+			refcount_inc(&parent_shm->refcount);
+			*offs = ref->offset;
+		}
+	}
+
+	return parent_shm;
+}
+
 /**
  * tee_shm_alloc_priv_buf() - Allocate shared memory for a privately shared
  *			      kernel buffer
diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
index 16ef078247ae..6bd833b6d0e1 100644
--- a/include/linux/tee_core.h
+++ b/include/linux/tee_core.h
@@ -28,6 +28,7 @@
 #define TEE_SHM_USER_MAPPED	BIT(1)  /* Memory mapped in user space */
 #define TEE_SHM_POOL		BIT(2)  /* Memory allocated from pool */
 #define TEE_SHM_PRIV		BIT(3)  /* Memory private to TEE driver */
+#define TEE_SHM_DMA_BUF		BIT(4)	/* Memory with dma-buf handle */
 
 #define TEE_DEVICE_FLAG_REGISTERED	0x1
 #define TEE_MAX_DEV_NAME_LEN		32
diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
index a54c203000ed..824f1251de60 100644
--- a/include/linux/tee_drv.h
+++ b/include/linux/tee_drv.h
@@ -116,6 +116,16 @@ struct tee_shm *tee_shm_alloc_kernel_buf(struct tee_context *ctx, size_t size);
 struct tee_shm *tee_shm_register_kernel_buf(struct tee_context *ctx,
 					    void *addr, size_t length);
 
+/**
+ * tee_shm_register_fd() - Register shared memory from file descriptor
+ *
+ * @ctx:	Context that allocates the shared memory
+ * @fd:		Shared memory file descriptor reference
+ *
+ * @returns a pointer to 'struct tee_shm' on success, and ERR_PTR on failure
+ */
+struct tee_shm *tee_shm_register_fd(struct tee_context *ctx, int fd);
+
 /**
  * tee_shm_free() - Free shared memory
  * @shm:	Handle to shared memory to free
diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
index d0430bee8292..1f9a4ac2b211 100644
--- a/include/uapi/linux/tee.h
+++ b/include/uapi/linux/tee.h
@@ -118,6 +118,35 @@ struct tee_ioctl_shm_alloc_data {
 #define TEE_IOC_SHM_ALLOC	_IOWR(TEE_IOC_MAGIC, TEE_IOC_BASE + 1, \
 				     struct tee_ioctl_shm_alloc_data)
 
+/**
+ * struct tee_ioctl_shm_register_fd_data - Shared memory registering argument
+ * @fd:		[in] File descriptor identifying the shared memory
+ * @size:	[out] Size of shared memory to allocate
+ * @flags:	[in] Flags to/from allocation.
+ * @id:		[out] Identifier of the shared memory
+ *
+ * The flags field should currently be zero as input. Updated by the call
+ * with actual flags as defined by TEE_IOCTL_SHM_* above.
+ * This structure is used as argument for TEE_IOC_SHM_REGISTER_FD below.
+ */
+struct tee_ioctl_shm_register_fd_data {
+	__s64 fd;
+	__u64 size;
+	__u32 flags;
+	__s32 id;
+};
+
+/**
+ * TEE_IOC_SHM_REGISTER_FD - register a shared memory from a file descriptor
+ *
+ * Returns a file descriptor on success or < 0 on failure
+ *
+ * The returned file descriptor refers to the shared memory object in kernel
+ * land. The shared memory is freed when the descriptor is closed.
+ */
+#define TEE_IOC_SHM_REGISTER_FD	_IOWR(TEE_IOC_MAGIC, TEE_IOC_BASE + 8, \
+				     struct tee_ioctl_shm_register_fd_data)
+
 /**
  * struct tee_ioctl_buf_data - Variable sized buffer
  * @buf_ptr:	[in] A __user pointer to a buffer
-- 
2.43.0


