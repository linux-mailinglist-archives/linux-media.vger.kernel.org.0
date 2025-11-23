Return-Path: <linux-media+bounces-47631-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 151A1C7E917
	for <lists+linux-media@lfdr.de>; Sun, 23 Nov 2025 23:56:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFBEC3A5C06
	for <lists+linux-media@lfdr.de>; Sun, 23 Nov 2025 22:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D44112C0281;
	Sun, 23 Nov 2025 22:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g7doDkH8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA53A2BE63A
	for <linux-media@vger.kernel.org>; Sun, 23 Nov 2025 22:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763938327; cv=none; b=G6Docnf05h4qbtTxBemmZM3YoGF/bLF5PRE6zSraJdiS2irqltzJ5bnWt6W8NOK8h7BU05zEYxh+X3eQNUvm4y0MfPU0EgC7BGFosNpdSI71I4MtAcXI1zphIvT7c2PZ9EKmuZVuydkGHv4bBR5zUWbe+T6vChVZ5dbAvQkhvTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763938327; c=relaxed/simple;
	bh=3Yw5gnORHPUkwdVq0k9YaTZDeI1SsW0ivfxZGTZP3Cc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m0DP+/Zwc7DEsznaBMt6PoQnY+XNHHC6OFX2CPPFcrU8BJeVUPt4dfT9Ju9VgsxRGdykuRvxItNZYvGDpKbOLSyk4hhjTEQaaKhJHjZ+QZHYZLfwfdiqKJJSaWMQLVZYpZ8i075HvcimuS026Ox5hHt4zf5zohdCWeK/CgCAcMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g7doDkH8; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42b3108f41fso2154203f8f.3
        for <linux-media@vger.kernel.org>; Sun, 23 Nov 2025 14:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763938323; x=1764543123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I7U8WjZVUJLujU3iF7ZJF1k1wei+IEPh96Vfasq7vRA=;
        b=g7doDkH8grU2riP18oRUs8e7YFeVqVJgtvrGYpXTDCrFt7l5LfFbbFQV7UU8gCdyGp
         MR6NYn3HA3mxPoK15qLVKYWUrVqa2sfDDOUxXfAGmwHbFMC18bSE8YvzGj5tDWtryPks
         8UjKawvGHRUpM86YqWkTWDXnmohwApBm1LnKVh3jC1QLu2SO9zJQF3JDzKeLlqccltMn
         yxQ8bnOZ3aomzXJKG1yB8F/V0ziKDadgldKdoc8BkUl0YoTBEp6N1E1oUQC4rlfmCYD2
         uEJYUbT5DBWpVja9JCdof68MIXMc9ZEXqxDvtxe2FrU50U4bMf6S5XVfC7o8b74QdMq6
         LbeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763938323; x=1764543123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I7U8WjZVUJLujU3iF7ZJF1k1wei+IEPh96Vfasq7vRA=;
        b=wzB+5c747NMHn3CY7KbYgakYk86a2O3WjwR5GYXMq0y8uNqMmYJ9P2fzLscIIUlBc7
         seciG3RBtTdNq/Khd0Ytwmfjj18xMospPz3j0eXJtyW2NQsZwsqGKMg0FswsZ2f1q8xi
         uhjWmBdSb7usTOKWOZqz6rrgIe6BfmuKsrVMql7X5sVrjZVrRySmZRleB3O9Qo0YCayV
         VHKJK/0qeJRRajrxC0UnDvdFqqN3EE9pVr/NY7uDqQusMYW5NXtHwyAtuwilBfddqLvT
         yf9S+C2NpCGKL+qEWUv6TuMAKEvSJ1YipVTHSmj1fp2DciYcJnZz+5e+/r2JN8V1+8GV
         Khnw==
X-Forwarded-Encrypted: i=1; AJvYcCWrQ2+J5P9HMYGxFh4Ck3Tam9FutPvxM/jV7uxNRsilEVvUM/h4HxUpKBxbEb7N/1HczD1p1uywl+0USw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVXxKvKflTqMlai4bRtjnlJxHFpzFx9Kjkhpw7ZaIOCXoo7Nef
	o7w6aF4NqVlnOnvaomRFR1nn+kdHtNJz0d8p1VEpopxFonBynpRMn4QG
X-Gm-Gg: ASbGncvLqCb8h622NfrnEFkWsGjTRgfoFyrbqcKMpbqKjwicQ36WOXej4ygysI/IsFK
	hyUN4QVto/g/+CdV7UCL/3NH8VAisYJ9m07f3XusSv9/MYQvq+WoUXUbUwHnjEFpcEockFShwc+
	nZGFLDkld/7tuv3CQWAiM8l0UP6w6S24c3OX8qBywLtRcDm+4iSHgKYRljG9PIXGBGp5Rqmnqoz
	CvYcRWERngIilQXPhU3VE5Zd2CetJVm/7ZEF9fF+rJBtkMiIAmLZ6Zj+ngzgzJW93mLtNpQj/sm
	iM76AgGJPghhihnKwLwQTXbRUdDtAIB9QY4vT8OPoRsdc4oRw1Ps8DDG0oPnbjzTlV/9rqx1Bm7
	/HxQHbZDThQSlBXnjmrox40uDLkwWnEjhnCKC18sMV/yqiTsms5iTTh3UwNhp3+19MEXTCVjd3B
	7sYc60XmRXwxIBNA==
X-Google-Smtp-Source: AGHT+IHP6prALX51tQ6Iw6dY96wePGFkgrZhEc+sNQdx04+GPwBJksTSC7+04SaYBCnud+M1CKHhfg==
X-Received: by 2002:a05:6000:430e:b0:42b:2e94:5a94 with SMTP id ffacd0b85a97d-42cc1cf4540mr9370759f8f.29.1763938323162;
        Sun, 23 Nov 2025 14:52:03 -0800 (PST)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fb9190sm24849064f8f.33.2025.11.23.14.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 14:52:01 -0800 (PST)
From: Pavel Begunkov <asml.silence@gmail.com>
To: linux-block@vger.kernel.org,
	io-uring@vger.kernel.org
Cc: Vishal Verma <vishal1.verma@intel.com>,
	tushar.gohad@intel.com,
	Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Pavel Begunkov <asml.silence@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	David Wei <dw@davidwei.uk>
Subject: [RFC v2 10/11] io_uring/rsrc: add dmabuf-backed buffer registeration
Date: Sun, 23 Nov 2025 22:51:30 +0000
Message-ID: <b38f2c3af8c03ee4fc5f67f97b4412ecd8588924.1763725388.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1763725387.git.asml.silence@gmail.com>
References: <cover.1763725387.git.asml.silence@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an ability to register a dmabuf backed io_uring buffer. It also
needs know which device to use for attachment, for that it takes
target_fd and extracts the device through the new file op. Unlike normal
buffers, it also retains the target file so that any imports from
ineligible requests can be rejected in next patches.

Suggested-by: Vishal Verma <vishal1.verma@intel.com>
Suggested-by: David Wei <dw@davidwei.uk>
Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 io_uring/rsrc.c | 106 +++++++++++++++++++++++++++++++++++++++++++++++-
 io_uring/rsrc.h |   1 +
 2 files changed, 106 insertions(+), 1 deletion(-)

diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
index 691f9645d04c..7dfebf459dd0 100644
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@ -10,6 +10,8 @@
 #include <linux/compat.h>
 #include <linux/io_uring.h>
 #include <linux/io_uring/cmd.h>
+#include <linux/dma-buf.h>
+#include <linux/dma_token.h>
 
 #include <uapi/linux/io_uring.h>
 
@@ -802,6 +804,106 @@ bool io_check_coalesce_buffer(struct page **page_array, int nr_pages,
 	return true;
 }
 
+struct io_regbuf_dma {
+	struct dma_token		*token;
+	struct file			*target_file;
+	struct dma_buf			*dmabuf;
+};
+
+static void io_release_reg_dmabuf(void *priv)
+{
+	struct io_regbuf_dma *db = priv;
+
+	dma_token_release(db->token);
+	dma_buf_put(db->dmabuf);
+	fput(db->target_file);
+	kfree(db);
+}
+
+static struct io_rsrc_node *io_register_dmabuf(struct io_ring_ctx *ctx,
+						struct io_uring_reg_buffer *rb,
+						struct iovec *iov)
+{
+	struct dma_token_params params = {};
+	struct io_rsrc_node *node = NULL;
+	struct io_mapped_ubuf *imu = NULL;
+	struct io_regbuf_dma *regbuf = NULL;
+	struct file *target_file = NULL;
+	struct dma_buf *dmabuf = NULL;
+	struct dma_token *token;
+	int ret;
+
+	if (iov->iov_base || iov->iov_len)
+		return ERR_PTR(-EFAULT);
+
+	node = io_rsrc_node_alloc(ctx, IORING_RSRC_BUFFER);
+	if (!node) {
+		ret = -ENOMEM;
+		goto err;
+	}
+
+	imu = io_alloc_imu(ctx, 0);
+	if (!imu) {
+		ret = -ENOMEM;
+		goto err;
+	}
+
+	regbuf = kzalloc(sizeof(*regbuf), GFP_KERNEL);
+	if (!regbuf) {
+		ret = -ENOMEM;
+		goto err;
+	}
+
+	target_file = fget(rb->target_fd);
+	if (!target_file) {
+		ret = -EBADF;
+		goto err;
+	}
+
+	dmabuf = dma_buf_get(rb->dmabuf_fd);
+	if (IS_ERR(dmabuf)) {
+		ret = PTR_ERR(dmabuf);
+		dmabuf = NULL;
+		goto err;
+	}
+
+	params.dmabuf = dmabuf;
+	params.dir = DMA_BIDIRECTIONAL;
+	token = dma_token_create(target_file, &params);
+	if (IS_ERR(token)) {
+		ret = PTR_ERR(token);
+		goto err;
+	}
+
+	regbuf->target_file = target_file;
+	regbuf->token = token;
+	regbuf->dmabuf = dmabuf;
+
+	imu->nr_bvecs = 1;
+	imu->ubuf = 0;
+	imu->len = dmabuf->size;
+	imu->folio_shift = 0;
+	imu->release = io_release_reg_dmabuf;
+	imu->priv = regbuf;
+	imu->flags = IO_IMU_F_DMA;
+	imu->dir = IO_IMU_DEST | IO_IMU_SOURCE;
+	refcount_set(&imu->refs, 1);
+	node->buf = imu;
+	return node;
+err:
+	if (regbuf)
+		kfree(regbuf);
+	if (imu)
+		io_free_imu(ctx, imu);
+	if (node)
+		io_cache_free(&ctx->node_cache, node);
+	if (target_file)
+		fput(target_file);
+	if (dmabuf)
+		dma_buf_put(dmabuf);
+	return ERR_PTR(ret);
+}
+
 static struct io_rsrc_node *io_sqe_buffer_register(struct io_ring_ctx *ctx,
 						   struct io_uring_reg_buffer *rb,
 						   struct iovec *iov,
@@ -817,7 +919,7 @@ static struct io_rsrc_node *io_sqe_buffer_register(struct io_ring_ctx *ctx,
 	bool coalesced = false;
 
 	if (rb->dmabuf_fd != -1 || rb->target_fd != -1)
-		return NULL;
+		return io_register_dmabuf(ctx, rb, iov);
 
 	if (!iov->iov_base)
 		return NULL;
@@ -1117,6 +1219,8 @@ static int io_import_fixed(int ddir, struct iov_iter *iter,
 
 	offset = buf_addr - imu->ubuf;
 
+	if (imu->flags & IO_IMU_F_DMA)
+		return -EOPNOTSUPP;
 	if (imu->flags & IO_IMU_F_KBUF)
 		return io_import_kbuf(ddir, iter, imu, len, offset);
 
diff --git a/io_uring/rsrc.h b/io_uring/rsrc.h
index 7c1128a856ec..280d3988abf3 100644
--- a/io_uring/rsrc.h
+++ b/io_uring/rsrc.h
@@ -30,6 +30,7 @@ enum {
 
 enum {
 	IO_IMU_F_KBUF			= 1,
+	IO_IMU_F_DMA			= 2,
 };
 
 struct io_mapped_ubuf {
-- 
2.52.0


