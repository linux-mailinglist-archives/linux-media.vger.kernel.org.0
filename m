Return-Path: <linux-media+bounces-13249-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C376908534
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 09:37:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89127B2313A
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 07:37:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70C41181D0C;
	Fri, 14 Jun 2024 07:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AVMrkxLB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D1014F9FC
	for <linux-media@vger.kernel.org>; Fri, 14 Jun 2024 07:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718350637; cv=none; b=XOXa+zkELd5XrGH3YzE1HlrYOZrpO8s6X6b4lAZEWp3efwjDU3hQrT9Pa5AdMDZmtQx5KpE5PTYYYy1CxRvc2uK2rIQugym+zzS+NQKL1wgv8E3uX6vXA4sVt44q7pL+UaTFl+Oz7DYmGzO0US39sooeg8y0vz8xvyewON+M7gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718350637; c=relaxed/simple;
	bh=R1muw++Z7H6mN1jgPNwV+vJ/av+1NjaBT0rCAs4IuR0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ltfyJ5KTjz1511JXLZvZVZVqlVRQavH0pT9BZh8q63EWO+6ibmfPetTmPtqIdFy2TBA2ua0Jy7ab0mkWTXNqqxjkmWOerTMQoPVI2QSwWsnQE3JksTkotkPRCkzcLI6knrMBUjdLTHF3JYIiYSt5SY3VBwC0SHtdO2RWAKIVBMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AVMrkxLB; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-704313fa830so1500558b3a.3
        for <linux-media@vger.kernel.org>; Fri, 14 Jun 2024 00:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718350636; x=1718955436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=402pCG13entEg8MQsJhYqCgKO7kxugEROaOLmrqgiYI=;
        b=AVMrkxLBCYcj3xH0Z5WVdqPJhBGkcW0kSVpXLxCHFiBnPQcxZJEyd6pDOhGAlEqUG3
         XrLiG3l+HPDJphv0NnSo2br+nliIrt1ASWHibiS8a0ePep79rV7j2YsGNwcWfWl74MDk
         0ARhZ4ogWlL1s7cNFS2GsbDUyh4HnXJSq1Pwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718350636; x=1718955436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=402pCG13entEg8MQsJhYqCgKO7kxugEROaOLmrqgiYI=;
        b=T2sxv5uyc0SSvdpDxuMvHsMulgBo1iM6iSSYFbr7O/784D8BBRZ5tYzQpvqrq/OYGL
         XGH+rsLf0kldCpixrn9RV66/p74RqIXEZd1J7VM62e1vSyMQiaoYkSlJfRmPJIh5pBhI
         PSTJUeP+D5iy6jGwOUyJYUZfawajaoCAYYy6h2jDQQwh4r/6D7W5GFIXnQtRmovMBNZw
         UF4qWmavYKkqHk+XeskcykcQwe6bKbHTi4ohDtuWmYXnWoLIZbzkS/PwM8FpM4IFAr/H
         eXhoj0+NNKbpkTjUM5UiL2h3sUSuhci5EYhAmOgYMTFoBtJOAXiZSJrFrQ5c1DTEqYqt
         UyCA==
X-Gm-Message-State: AOJu0Yzzmrt4lw+fHdu3U/WkZWqL7D1Vk8/3diwir6gz7SVeCwg2t2bb
	qczuT9ktfYcIsyPYYHnltA0iqs8o1w9SoyBChnknhRBYy8wNkOO6RE4iabJJQw==
X-Google-Smtp-Source: AGHT+IHIScl9s/lWW1BTCnqrVm8pxG49H8tuhHvqfsuV7vO3BFjkD3bQD2VyEHDcQYlJlpjA2d2dhw==
X-Received: by 2002:a05:6a00:1796:b0:705:9b04:70f with SMTP id d2e1a72fcca58-705d7200894mr2114551b3a.30.1718350635879;
        Fri, 14 Jun 2024 00:37:15 -0700 (PDT)
Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:336:17cf:71d5:5733])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc922643sm2468382b3a.31.2024.06.14.00.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 00:37:15 -0700 (PDT)
From: Yunke Cao <yunkec@chromium.org>
To: Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	Yunke Cao <yunkec@chromium.org>
Subject: [PATCH v4 4/4] media: videobuf2-core: attach once if multiple planes share the same dbuf
Date: Fri, 14 Jun 2024 16:37:02 +0900
Message-ID: <20240614073702.316810-5-yunkec@chromium.org>
X-Mailer: git-send-email 2.45.2.627.g7a2c4fd464-goog
In-Reply-To: <20240614073702.316810-1-yunkec@chromium.org>
References: <20240614073702.316810-1-yunkec@chromium.org>
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
---
v4
- Only set dbuf_duplicated when alloc_devs are equal.

v3
- Adjust the patch according to the previous patches to resolve conflicts.
- Add comment to explain the purpose of the change.

v2
- Separate out the refactor changes out to previous patches.
- Fix mem_priv check.
---
 .../media/common/videobuf2/videobuf2-core.c   | 30 ++++++++++++++++---
 include/media/videobuf2-core.h                |  3 ++
 2 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index cbc8928f0418..c19f1df3a4d2 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -304,10 +304,13 @@ static void __vb2_plane_dmabuf_put(struct vb2_buffer *vb, struct vb2_plane *p)
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
@@ -316,6 +319,7 @@ static void __vb2_plane_dmabuf_put(struct vb2_buffer *vb, struct vb2_plane *p)
 	p->length = 0;
 	p->m.fd = 0;
 	p->data_offset = 0;
+	p->dbuf_duplicated = false;
 }
 
 /*
@@ -1374,7 +1378,7 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
 	struct vb2_plane planes[VB2_MAX_PLANES];
 	struct vb2_queue *q = vb->vb2_queue;
 	void *mem_priv;
-	unsigned int plane;
+	unsigned int plane, i;
 	int ret = 0;
 	bool reacquired = vb->planes[0].mem_priv == NULL;
 
@@ -1427,6 +1431,24 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
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
index 955237ac503d..053ced60595f 100644
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
+	bool			dbuf_duplicated;
 	unsigned int		bytesused;
 	unsigned int		length;
 	unsigned int		min_length;
-- 
2.45.2.627.g7a2c4fd464-goog


