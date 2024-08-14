Return-Path: <linux-media+bounces-16266-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A04789511DB
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 04:07:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9982C1F243BB
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 02:07:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0628C1CD39;
	Wed, 14 Aug 2024 02:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="leDFCHXn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3820A21
	for <linux-media@vger.kernel.org>; Wed, 14 Aug 2024 02:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723601223; cv=none; b=Kr0diTxOCmFb2hGmD/90iQqo6OpIy50wipnZ+DR0xmzbkJmCNGtA7V6GZ4V3in5dXYH0zG0kUPEfvi8A1T4Y/fYYXm80v+W/HaqmCwjn4dyzetbNkgQTC9R7yqBPSHDSP+KIds3Y+1OGuXhq1gZXAtL2AFIP8vF3S0Vp1BnoM8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723601223; c=relaxed/simple;
	bh=kvN5a0n/wJKUJuiQB2mVD9jODWNuNf3o55USPgryGbU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hOE0ebsDWDxE8PZH1/IKbVHHKI6nEjqiPhqNA8X50eb/xRHp5MMWhvZQEvnEAUCdwcBoNrJOmM29CRkmQXZitA3GK/Otrvo5EbaV6vkCac3DrXGTySCLryKBqhKAeSndWV5QAt+52jJ1xlJLPhtAVf+ykGsKPxjZQ8556KV+MNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=leDFCHXn; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7bcf8077742so4411115a12.0
        for <linux-media@vger.kernel.org>; Tue, 13 Aug 2024 19:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723601221; x=1724206021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oer7Z/BAZa2AXUlghr5uJcQkvUFgqodj+Ovxovv0c/Y=;
        b=leDFCHXnZ1NG1XKldJfkXIqrcWkW4jsEmkNxN7XROm/qW+KbaqgUZIRd1BvQrQv5Gg
         y3yUu9Lvuh7nBwQe9xbpGa8jnfV3D6746DQZHBXMUPXXpa+Gop0U3NhZe4j80sRAa2rw
         urTmbuUfjrWWzHfL7zjZ0MNrQoM5RA5WF07os=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723601221; x=1724206021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oer7Z/BAZa2AXUlghr5uJcQkvUFgqodj+Ovxovv0c/Y=;
        b=ISeRK/kfPjGnhtDi1Stt17Dk/DORosl8kvyTk+6Q0PZXCRjj1B13hsOnCbPqNYKtjp
         rQNkoy9eTnbWDQ9H4O2HaTqe7Tbs+5VpfixWpuSTYtBp+I2OHXTV0Zt6vukPQB4WH2A3
         wZ3HqACUWT7jRows8Z43B0Cjmqg1eSxf05rxtWZUh2pJUBOedTS0/NIldfGrmrYxqxz4
         uZEk2f9ncu1K5QSebMtQShnpXGBAz7PMsdbt+QSq2S8IBQG3IKST3LHjGjGVQ/dEY6xN
         orAiIcy9v3cs3PhsNK4+O9LQOkZr0w+yHbItXjLgvReu9uxTvuk69qh/upGtoC9xZXDN
         Mjdw==
X-Gm-Message-State: AOJu0YzgJzIMpEeUx/AX3JldsMPZHSHIbXCsxrIKDM9N/hdADUSsHyiq
	Q+9mVrcDloEEr7I9Ni3DSfEQEA2vd/daNZOl+/+r+17W/G2kC8c4oavurmM9Jw==
X-Google-Smtp-Source: AGHT+IHVclrjZEyEWaLysG4E5RO5jiTzGq+2N5shf9v6IlJzRd5ZB5yenL00/YE5KnXH6uSMa2JAxQ==
X-Received: by 2002:a05:6a20:d706:b0:1c6:ecee:1850 with SMTP id adf61e73a8af0-1c8eaf8e7fcmr2067307637.49.1723601221185;
        Tue, 13 Aug 2024 19:07:01 -0700 (PDT)
Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:269a:7c5:e4f2:518c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d3ac7d65b1sm303064a91.4.2024.08.13.19.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 19:07:00 -0700 (PDT)
From: Yunke Cao <yunkec@chromium.org>
To: Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	Yunke Cao <yunkec@chromium.org>
Subject: [PATCH v5 4/4] media: videobuf2-core: attach once if multiple planes share the same dbuf
Date: Wed, 14 Aug 2024 11:06:43 +0900
Message-ID: <20240814020643.2229637-5-yunkec@chromium.org>
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
In-Reply-To: <20240814020643.2229637-1-yunkec@chromium.org>
References: <20240814020643.2229637-1-yunkec@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When multiple planes use the same dma buf, each plane will have its own dma
buf attachment and mapping. It is a waste of IOVA space.

This patch adds a dbuf_duplicated boolean in vb2_plane. If a plane's dbuf
is the same as an existing plane, do not create another attachment and
mapping.

Signed-off-by: Yunke Cao <yunkec@chromium.org>
Acked-by: Tomasz Figa <tfiga@chromium.org>
---
v5
- Fix typo in videobuf2-core.h comments.

v4
- Only set dbuf_duplicated when alloc_devs are equal.

v3
- Adjust the patch according to the previous patches to resolve conflicts.
- Add comment to explain the purpose of the change.

v2
- Separate out the refactor changes out to previous patches.
- Fix mem_priv check.

 .../media/common/videobuf2/videobuf2-core.c   | 30 ++++++++++++++++---
 include/media/videobuf2-core.h                |  3 ++
 2 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index e6af963307e3..500a4e0c84ab 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -303,10 +303,13 @@ static void __vb2_plane_dmabuf_put(struct vb2_buffer *vb, struct vb2_plane *p)
 	if (!p->mem_priv)
 		return;
 
-	if (p->dbuf_mapped)
-		call_void_memop(vb, unmap_dmabuf, p->mem_priv);
+	if (!p->dbuf_duplicated) {
+		if (p->dbuf_mapped)
+			call_void_memop(vb, unmap_dmabuf, p->mem_priv);
+
+		call_void_memop(vb, detach_dmabuf, p->mem_priv);
+	}
 
-	call_void_memop(vb, detach_dmabuf, p->mem_priv);
 	dma_buf_put(p->dbuf);
 	p->mem_priv = NULL;
 	p->dbuf = NULL;
@@ -315,6 +318,7 @@ static void __vb2_plane_dmabuf_put(struct vb2_buffer *vb, struct vb2_plane *p)
 	p->length = 0;
 	p->m.fd = 0;
 	p->data_offset = 0;
+	p->dbuf_duplicated = false;
 }
 
 /*
@@ -1379,7 +1383,7 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
 	struct vb2_plane planes[VB2_MAX_PLANES];
 	struct vb2_queue *q = vb->vb2_queue;
 	void *mem_priv;
-	unsigned int plane;
+	unsigned int plane, i;
 	int ret = 0;
 	bool reacquired = vb->planes[0].mem_priv == NULL;
 
@@ -1432,6 +1436,24 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
 		}
 
 		for (plane = 0; plane < vb->num_planes; ++plane) {
+			/*
+			 * This is an optimization to reduce dma_buf attachment/mapping.
+			 * When the same dma_buf is used for multiple planes, there is no need
+			 * to create duplicated attachments.
+			 */
+			for (i = 0; i < plane; ++i) {
+				if (planes[plane].dbuf == vb->planes[i].dbuf &&
+				    q->alloc_devs[plane] == q->alloc_devs[i]) {
+					vb->planes[plane].dbuf_duplicated = true;
+					vb->planes[plane].dbuf = vb->planes[i].dbuf;
+					vb->planes[plane].mem_priv = vb->planes[i].mem_priv;
+					break;
+				}
+			}
+
+			if (vb->planes[plane].dbuf_duplicated)
+				continue;
+
 			/* Acquire each plane's memory */
 			mem_priv = call_ptr_memop(attach_dmabuf,
 						  vb,
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 955237ac503d..9b02aeba4108 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -154,6 +154,8 @@ struct vb2_mem_ops {
  * @mem_priv:	private data with this plane.
  * @dbuf:	dma_buf - shared buffer object.
  * @dbuf_mapped:	flag to show whether dbuf is mapped or not
+ * @dbuf_duplicated:	boolean to show whether dbuf is duplicated with a
+ *		previous plane of the buffer.
  * @bytesused:	number of bytes occupied by data in the plane (payload).
  * @length:	size of this plane (NOT the payload) in bytes. The maximum
  *		valid size is MAX_UINT - PAGE_SIZE.
@@ -179,6 +181,7 @@ struct vb2_plane {
 	void			*mem_priv;
 	struct dma_buf		*dbuf;
 	unsigned int		dbuf_mapped;
+	bool			dbuf_duplicated;
 	unsigned int		bytesused;
 	unsigned int		length;
 	unsigned int		min_length;
-- 
2.46.0.184.g6999bdac58-goog


