Return-Path: <linux-media+bounces-8289-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CC5893872
	for <lists+linux-media@lfdr.de>; Mon,  1 Apr 2024 08:35:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6012AB20FA6
	for <lists+linux-media@lfdr.de>; Mon,  1 Apr 2024 06:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97CBD8480;
	Mon,  1 Apr 2024 06:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Gfr+tQwK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C42E1113
	for <linux-media@vger.kernel.org>; Mon,  1 Apr 2024 06:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711953311; cv=none; b=X+vKLwdFTU+79lCPRvR1UCSMPXUKuAf770BQWwUH9///42giqWts6VBQtyxIDfyUf6LNpPWJOW0OI+jssc+ZPyBYznqT19s85qchhO5E2oIeLnM6XkQiWWvJ1TvQP6Bu+pjKJvtE0aP7LsP14h+f9NsCja9pClAqakP1ZgLY2x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711953311; c=relaxed/simple;
	bh=nBm1ANrqgfgohCkHRtIKarqlRe0cvStEIo9jqZxrs1M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CSeRQyVPHvuHE4Y6bf6bX3xJ5o73NVpPYgtG8EvCU5B01Y/LlvCVtjy54WnUzUcwykODKdY8stKiNPsAOdXWjE0KW3Ick6d9UUl2kInj6zGN6Axo2Rp+jHdW8WrgpDWN+2kIShQi8bbBK100+8SHfz/1oGEhqjL2tJnecrYElyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Gfr+tQwK; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5a558d9c33aso2417646eaf.1
        for <linux-media@vger.kernel.org>; Sun, 31 Mar 2024 23:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711953308; x=1712558108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w1/wCCuBBrbjiP6SdGYP0qF7z92Rp4SYGCqgP6iGWAs=;
        b=Gfr+tQwKk8GWU1FsJSGrpNZCBBp8QENVUx0X0ugULEx06rjtB0o4nydkckVatGGE+i
         OoWHlh3UC9bnreF95STLkI29nltWhgWlzgBQBrFT3yc95RmLjKyK0+Ixmano+6QA6mah
         I1bg8yciDsI5BSXxk2V+c60PFx1VaIRN+RxXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711953308; x=1712558108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w1/wCCuBBrbjiP6SdGYP0qF7z92Rp4SYGCqgP6iGWAs=;
        b=sUqu8rGJy70juBCnUhRj4cwqPvXulw3ccwdy/I+uO8/8Ey/rEtY0xQ0+6BF6e+waoH
         dGAgzWaQ2a/K0zos8Yjd8+4+pW4FXk8W8dSloB9uuFfxfJkLzVmMdByXgZ+yb/BVGmy0
         3M0hjHCu7Ee1HP8LMzi9cHjseb3G9diEurrndHtoKvzevFKVYjZktQLDMOhiNEiL2y9Z
         xdCvGlhqvs9KVyZGszU47hh+W5mG5cPnRGN7JTV0wv7EBASx2A3fQp/cBsNd17OeMrQo
         l5vULk4t472v4SvNiWOQrTDlUHwJBjcEw1TtGkLxgtR4yfNKi9CYJ29GqYL+ng0UWQ2e
         rQmQ==
X-Gm-Message-State: AOJu0Yy+yUy2dGJodXQpYvOLO+sNKIl0LLGDJ4qVHjnWiHedeSrGHL0s
	pvK0CzqNuz0e5/NprQvDKchdOO2En6vu21bbHLGVayY6VNTCSLHynp9aU3A47drmsVxuzuTCrQ4
	=
X-Google-Smtp-Source: AGHT+IG0EhZIC4o687WHBJF1yyeGxl9k14jP2LVOYVO/L+VNDR3T7UMCiNcVL7s1uvzBhGp5NzCEHw==
X-Received: by 2002:a05:6358:9a01:b0:183:cd9a:b2dd with SMTP id p1-20020a0563589a0100b00183cd9ab2ddmr2852008rwa.23.1711953308429;
        Sun, 31 Mar 2024 23:35:08 -0700 (PDT)
Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:d20f:3ce7:c221:2db5])
        by smtp.gmail.com with ESMTPSA id 34-20020a631062000000b005d8b2f04eb7sm6982185pgq.62.2024.03.31.23.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Mar 2024 23:35:08 -0700 (PDT)
From: Yunke Cao <yunkec@chromium.org>
To: Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	Yunke Cao <yunkec@chromium.org>
Subject: [RFC PATCH] media: videobuf2-core: attach once if multiple planes share the same dbuf
Date: Mon,  1 Apr 2024 15:35:00 +0900
Message-ID: <20240401063500.680384-1-yunkec@chromium.org>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When multiple planes use the same dma buf, each plane will have its own dma
buf attachment and mapping. It is a waste of IOVA space.

This patch adds a duplicated_dbuf flag in vb2_plane. If a plane's dbuf
is the same as an existing plane, do not create another attachment and
mapping.

Signed-off-by: Yunke Cao <yunkec@chromium.org>
---
 .../media/common/videobuf2/videobuf2-core.c   | 30 +++++++++++++++----
 include/media/videobuf2-core.h                |  3 ++
 2 files changed, 28 insertions(+), 5 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index b6bf8f232f48..b03e058ef2b1 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -304,10 +304,13 @@ static void __vb2_plane_dmabuf_put(struct vb2_buffer *vb, struct vb2_plane *p)
 	if (!p->mem_priv)
 		return;
 
-	if (p->dbuf_mapped)
-		call_void_memop(vb, unmap_dmabuf, p->mem_priv);
+	if (!p->duplicated_dbuf) {
+		if (p->dbuf_mapped)
+			call_void_memop(vb, unmap_dmabuf, p->mem_priv);
+
+		call_void_memop(vb, detach_dmabuf, p->mem_priv);
+	}
 
-	call_void_memop(vb, detach_dmabuf, p->mem_priv);
 	dma_buf_put(p->dbuf);
 	p->mem_priv = NULL;
 	p->dbuf = NULL;
@@ -1327,7 +1330,7 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
 	struct vb2_plane planes[VB2_MAX_PLANES];
 	struct vb2_queue *q = vb->vb2_queue;
 	void *mem_priv;
-	unsigned int plane;
+	unsigned int plane, i;
 	int ret = 0;
 	bool reacquired = vb->planes[0].mem_priv == NULL;
 
@@ -1383,6 +1386,22 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
 		vb->planes[plane].m.fd = 0;
 		vb->planes[plane].data_offset = 0;
 
+		if (mem_priv && plane > 0) {
+			for (i = 0; i < plane; ++i) {
+				if (dbuf == vb->planes[i].dbuf) {
+					vb->planes[plane].duplicated_dbuf = true;
+					break;
+				}
+			}
+		}
+
+		/* There's no need to attach a duplicated dbuf. */
+		if (vb->planes[plane].duplicated_dbuf) {
+			vb->planes[plane].dbuf = dbuf;
+			vb->planes[plane].mem_priv = mem_priv;
+			continue;
+		}
+
 		/* Acquire each plane's memory */
 		mem_priv = call_ptr_memop(attach_dmabuf,
 					  vb,
@@ -1396,6 +1415,7 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
 			goto err;
 		}
 
+		vb->planes[plane].duplicated_dbuf = false;
 		vb->planes[plane].dbuf = dbuf;
 		vb->planes[plane].mem_priv = mem_priv;
 	}
@@ -1406,7 +1426,7 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
 	 * userspace knows sooner rather than later if the dma-buf map fails.
 	 */
 	for (plane = 0; plane < vb->num_planes; ++plane) {
-		if (vb->planes[plane].dbuf_mapped)
+		if (vb->planes[plane].dbuf_mapped || vb->planes[plane].duplicated_dbuf)
 			continue;
 
 		ret = call_memop(vb, map_dmabuf, vb->planes[plane].mem_priv);
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 8b86996b2719..5db781da2ebc 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -154,6 +154,8 @@ struct vb2_mem_ops {
  * @mem_priv:	private data with this plane.
  * @dbuf:	dma_buf - shared buffer object.
  * @dbuf_mapped:	flag to show whether dbuf is mapped or not
+ * @duplicated_dbuf:	boolean to show whether dbuf is duplicated with a
+ *		previous plane of the buffer.
  * @bytesused:	number of bytes occupied by data in the plane (payload).
  * @length:	size of this plane (NOT the payload) in bytes. The maximum
  *		valid size is MAX_UINT - PAGE_SIZE.
@@ -179,6 +181,7 @@ struct vb2_plane {
 	void			*mem_priv;
 	struct dma_buf		*dbuf;
 	unsigned int		dbuf_mapped;
+	bool			duplicated_dbuf;
 	unsigned int		bytesused;
 	unsigned int		length;
 	unsigned int		min_length;
-- 
2.44.0.478.gd926399ef9-goog


