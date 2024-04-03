Return-Path: <linux-media+bounces-8498-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D17D896A48
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 11:16:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 54E84B2B265
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 09:14:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 147DB745D9;
	Wed,  3 Apr 2024 09:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fmq1uT1k"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F191171B4F
	for <linux-media@vger.kernel.org>; Wed,  3 Apr 2024 09:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712135600; cv=none; b=pHCDcm7j+6v4NpmtTb5ahHEQc6xo9jVyPALLiwaDhDx6KuKUljPBBWtLUIyZoO5aioqA02lkN7g7knypWF+KfzMKL/mf3V/5gA97PCtiBIqgNG/oltSsdlz0PKSxwh+x0vAmacVgVJ04jURnL6iwtfjlTKdWaSsYrVm9jK0tcl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712135600; c=relaxed/simple;
	bh=POdkDInzdUvu0ghNCgxNK4ulMolIE+flfkF4jMBv0Vc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VXtzEqrGOK4zGxavYZgFJPSH2nqGWIJukLPkUhJukh9F4sFBRTBnVaskQCH4C96H5+IBVUDm9NbuliIiiRB3o8tuYB51EyBZZmaBH3wm9QlpoKkGbwdHFB/7r/lLMHOGWW6oS3G/sr8k5nxDlHK8atCmtwqafJmRF8gi+e6kstQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fmq1uT1k; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1e0f2798cd8so50774345ad.3
        for <linux-media@vger.kernel.org>; Wed, 03 Apr 2024 02:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712135598; x=1712740398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rvwLGUnkhMKJQa7aB2byIHr562jcELHGQ/vzY9XvszI=;
        b=fmq1uT1kgkZ9VDVOhLejN9Qih3PtP3SfDpItsMYRSntyG6SqoGoP+bRtZ/DapCK42p
         wPxqw0BDg6LUudJsoSr/ryiWJJtoODXHtbDAdImYMOPGpeF/RVHqxoUjpbuEi+/8fhj2
         uqex7cYwwwjsel3xdtU+z7O4ZAAWnEOE2LDH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712135598; x=1712740398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rvwLGUnkhMKJQa7aB2byIHr562jcELHGQ/vzY9XvszI=;
        b=GlS/qR2OsXoRxqlA2phaV2dzF/+vMhxzfV+5d6DDVHRSs+tDQ/NAJwMPasX9kVPDRv
         BpWQaBbkzrolp9yazD/2FdzIL2pkwQyRu+UfrX+dZV8T/oJUEuasuPAiekgdzrsfxIBP
         ChK6h9bWa9jEIWpKZxUnl5TRFkDCAARsyqK59TDIUG61QKA1C/Cx17ib/Q+ypjdhzfV+
         7QGJKHvZ2sf8+j8Yzo0zsXbp8NRMX4hauqaFnVq3hBpmwro4Q9Q2vpwhbt7XSsOmP3bi
         lAT2w/vMUz0BBCwsCgCma6MQM69UaC2C00oXpEVVzse8FTVGCeoc8KYhi84+Ow34UDlf
         aNFw==
X-Gm-Message-State: AOJu0Ywyqffws1eVlfIynk7fJ8mMXyG8dhfn33GbGx/FHIsmbNGLFyCB
	+R/I8LPXjMyxq9B0uljT34sBIKnRMv2vGaHxk1oUlClCsWHaHoAYH2SfHuS88w==
X-Google-Smtp-Source: AGHT+IG/1npLPtoayDkIkgngDU0AXElvO6WVZRo6jM7auWAPU4ZT/lJjYcD51/AOjiLHamWFDREf0A==
X-Received: by 2002:a17:902:eccc:b0:1e2:9aa7:fd21 with SMTP id a12-20020a170902eccc00b001e29aa7fd21mr391632plh.54.1712135598394;
        Wed, 03 Apr 2024 02:13:18 -0700 (PDT)
Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:d5be:b59a:f5f7:246d])
        by smtp.gmail.com with ESMTPSA id lo14-20020a170903434e00b001e0aded0ca7sm12692811plb.239.2024.04.03.02.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 02:13:18 -0700 (PDT)
From: Yunke Cao <yunkec@chromium.org>
To: Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	Yunke Cao <yunkec@chromium.org>
Subject: [PATCH v2 3/3] media: videobuf2-core: attach once if multiple planes share the same dbuf
Date: Wed,  3 Apr 2024 18:13:06 +0900
Message-ID: <20240403091306.1308878-4-yunkec@chromium.org>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
In-Reply-To: <20240403091306.1308878-1-yunkec@chromium.org>
References: <20240403091306.1308878-1-yunkec@chromium.org>
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
 .../media/common/videobuf2/videobuf2-core.c   | 27 +++++++++++++++----
 include/media/videobuf2-core.h                |  3 +++
 2 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index a5368cef73bb..64fe3801b802 100644
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
@@ -1327,7 +1330,7 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
 	struct vb2_plane planes[VB2_MAX_PLANES];
 	struct vb2_queue *q = vb->vb2_queue;
 	void *mem_priv;
-	unsigned int plane;
+	unsigned int plane, i;
 	int ret = 0;
 	bool reacquired = vb->planes[0].mem_priv == NULL;
 
@@ -1380,6 +1383,19 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
 		__vb2_buf_dmabuf_put(vb);
 
 		for (plane = 0; plane < vb->num_planes; ++plane) {
+			for (i = 0; i < plane; ++i) {
+				if (planes[plane].dbuf == vb->planes[i].dbuf) {
+					vb->planes[plane].dbuf_duplicated = true;
+					vb->planes[plane].dbuf = vb->planes[i].dbuf;
+					vb->planes[plane].mem_priv = vb->planes[i].mem_priv;
+					break;
+				}
+			}
+
+			/* There's no need to attach a duplicated dbuf. */
+			if (vb->planes[plane].dbuf_duplicated)
+				continue;
+
 			/* Acquire each plane's memory */
 			mem_priv = call_ptr_memop(attach_dmabuf,
 						  vb,
@@ -1392,6 +1408,7 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
 				goto err_put_dbuf;
 			}
 
+			vb->planes[plane].dbuf_duplicated = false;
 			vb->planes[plane].dbuf = planes[plane].dbuf;
 			vb->planes[plane].mem_priv = mem_priv;
 		}
@@ -1406,7 +1423,7 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
 	 * userspace knows sooner rather than later if the dma-buf map fails.
 	 */
 	for (plane = 0; plane < vb->num_planes; ++plane) {
-		if (vb->planes[plane].dbuf_mapped)
+		if (vb->planes[plane].dbuf_mapped || vb->planes[plane].dbuf_duplicated)
 			continue;
 
 		ret = call_memop(vb, map_dmabuf, vb->planes[plane].mem_priv);
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 8b86996b2719..2484e7d2881d 100644
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
2.44.0.478.gd926399ef9-goog


