Return-Path: <linux-media+bounces-12562-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C964A8FC4C3
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 09:41:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8043F2828CF
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 07:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6E2118C35D;
	Wed,  5 Jun 2024 07:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mK5hivPZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B908D18C356
	for <linux-media@vger.kernel.org>; Wed,  5 Jun 2024 07:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717573250; cv=none; b=mpXMF/DiwFvSNmr0LwkFD1eRqnqLtWEndZhnGhWybVmVbs9N7To6bUnpaZXCOYz017E8nBFwaFHtx4PUbds2yo4SFuK/dG41x4Gn/I6Eq2PsCsgApmYoUdOIXl0VtAR0qFB3l0S0Wslcm8J5CeoxOTwwR3bDlNazlpgHexQvxc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717573250; c=relaxed/simple;
	bh=/ASCOX5eT+IGEco2MTmPN5goM4pJFVnmbynShjYA9C8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fRw34GBpmgTC+/dGDbQeSyTQNWRqAi9ThwLwncZFgiluT4oU6gWjLFz3pSDC6nVyorapINNxKbqltteeNPHvKIWi4XDbLr7/SFRh718BzgWWCmNwvikNTF2lnIkEsTX3ZY4IfDwfcFTZJ5mUYoKrbCpulnenJGjq54ejQTZfMx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mK5hivPZ; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-703e5a09c11so552892b3a.2
        for <linux-media@vger.kernel.org>; Wed, 05 Jun 2024 00:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717573248; x=1718178048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t04at/1az1gpesu5WPsR4YAcHcPjXq1Mids7Upubl5M=;
        b=mK5hivPZhVuBssCdES496CMP2iKxIY3mbWbZpc7F89nl1+HZwsugWKGgEy1vXBLBuo
         ZDHJfe4zUPNw4W/bPhjgC0QG5PZI0dYccEFMFzrpY0ZfN61hS1YE8CIjZzh3aReODjWV
         6yTvS79d4CuWizDNg0H/pxCcRLZo9xvf4P48M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717573248; x=1718178048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t04at/1az1gpesu5WPsR4YAcHcPjXq1Mids7Upubl5M=;
        b=AlmAzf5f3VSngcjg16De5JDQV6sCTqShRbiOfQq+yj0t/UTJw1aVl9rjktWCyWNT/w
         g6gUZcI2Ei24GU+pp+BRQG0SIoI6ZIvDoH7Lh0Xrn0tQlFTF3k5Yq1WYs1P+Zn+uOWGv
         SuTpInP/V0oFt+7S+Q0Fv/BCBz3YLITI7CqG0NkB8RjdAfWQH7qzRZssdhikfegjDCcF
         2D3prj6Izlj3Hpr4ov8wJ6Gzb8j/JuEBR2dWltVRKbW+dUxXSfmgVF6xah2ot4PWJA8s
         CDU6BNCKetR4ZGgOx8QWTo1+BTMO9L1wXvtxfb4mjPFLl90GMjuADSD3tYw76NNEIPPG
         Wsgw==
X-Gm-Message-State: AOJu0YyYexlJJ4LTxURZEj9I9kQk2fJX1uYBhSLZ9+VzXa7Y2wFv26zt
	FMld1/c/yNgngfWovJjC5ixXh8h17FF2fiyjWwQGxd7DivzbF3o0KKEpL/BzGg==
X-Google-Smtp-Source: AGHT+IGDNcfAOhvHZeEUbC2a/gQw1w1ZyjIGSZhGGpNBEwE1axh1itrdawQ2fyddNhyLVFxeqxWCEg==
X-Received: by 2002:a05:6a20:3c8a:b0:1b0:2472:da14 with SMTP id adf61e73a8af0-1b2b6e4b4c5mr2346362637.2.1717573247958;
        Wed, 05 Jun 2024 00:40:47 -0700 (PDT)
Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:f834:a68:ab2:f744])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6324e54besm95500405ad.254.2024.06.05.00.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 00:40:47 -0700 (PDT)
From: Yunke Cao <yunkec@chromium.org>
To: Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	Yunke Cao <yunkec@chromium.org>
Subject: [PATCH v3 4/4] media: videobuf2-core: attach once if multiple planes share the same dbuf
Date: Wed,  5 Jun 2024 16:40:35 +0900
Message-ID: <20240605074035.2620140-5-yunkec@chromium.org>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
In-Reply-To: <20240605074035.2620140-1-yunkec@chromium.org>
References: <20240605074035.2620140-1-yunkec@chromium.org>
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
v3
- Adjust the patch according to the previous patches to resolve conflicts.
- Add comment to explain the purpose of the change.

v2
- Separate out the refactor changes out to previous patches.
- Fix mem_priv check.
---
 .../media/common/videobuf2/videobuf2-core.c   | 29 ++++++++++++++++---
 include/media/videobuf2-core.h                |  3 ++
 2 files changed, 28 insertions(+), 4 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index cbc8928f0418..90b65bf6c463 100644
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
 
@@ -1427,6 +1431,23 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
 		}
 
 		for (plane = 0; plane < vb->num_planes; ++plane) {
+			/*
+			 * This is an optimization to reduce dma_buf attachment/mapping.
+			 * When the same dma_buf is used for multiple planes, there is no need
+			 * to create duplicated attachments.
+			 */
+			for (i = 0; i < plane; ++i) {
+				if (planes[plane].dbuf == vb->planes[i].dbuf) {
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
2.45.1.288.g0e0cd299f1-goog


