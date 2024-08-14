Return-Path: <linux-media+bounces-16264-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4499511D9
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 04:07:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43200284308
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 02:07:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7CC81CAB1;
	Wed, 14 Aug 2024 02:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="S1l/ri05"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8F3182B9
	for <linux-media@vger.kernel.org>; Wed, 14 Aug 2024 02:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723601219; cv=none; b=m9ax3ws19ydF/ikoMBdYknzm2EA3XpvzhX9WtRoogExW9G6RXKAu+dFwzsoD3MropJ5IH/zaISCNdkcOtY3+SqnD9lWqwNFoICANAbTdYV5FuRGbIiSmTftwD2lxsapCXs6tZnHPaLmER7cuVtpfKQ8x6gYI8oBLAC584on8c30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723601219; c=relaxed/simple;
	bh=MHivubr+aSfdTDoAx9G+VE8FPPqxd+dMJCQilgPia9A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PcwYDnaaOb15PN1HJniL32YOfSbF5JgGhJFBpG+nzrIC5kMTuEIGnNX7ubPnxlfhaAhm1GZWp/0PQDtxUsGaakQx9ZBIHZX2WxUVDEHPB2Vt+BUFaJtCN0F8ACn3sceHgXu+NJXQir7YCoxBHT38KG+sDLolj6T8k60eV6RoeZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=S1l/ri05; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7a115c427f1so4057008a12.0
        for <linux-media@vger.kernel.org>; Tue, 13 Aug 2024 19:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723601216; x=1724206016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gqSR9lUPhshSAqptcvIC1X38m1fnyWXPJXD2Hh6SXwg=;
        b=S1l/ri05zISZDJGtoHs2BlB3SaX4PX3pOEwHwz222myQQhwfG3zPhn/v9Jo4i0mTJI
         WpBhLNWKvZ5ZgDv67neTKI3vTsLjujgO4BX+oovflFCvP4DEuhJWgYwhe+97emr9SsxS
         7fTA4gO20EE/lHqfcE29xSaUEMNdcLNO5DUcg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723601216; x=1724206016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gqSR9lUPhshSAqptcvIC1X38m1fnyWXPJXD2Hh6SXwg=;
        b=mDxBtmfD3mYoBB0KeQxtil5lAZQb3OV8BKoVZ2WR7WR1de6FjnEjQrMggD2wP2g/TB
         ZyFJZQZnz+Gb6P5NJG0qdYQ0FkDZLWqLy7sN8qZPo4sPrT4S5H9L3Ec2fkPXITyV6aDC
         aFJcI1vBufTEYEQxqadyBm+Ca7y1G8HKNpr6ZKUQg3Wp+I3XvLh13OsfqgbakUYnxpOl
         T1ksJ0okH6ZkPA025WJRrhApAtGT9oZ+SgjezG1JHUzWnzxtmb44sI5MuR+xIGhaM2WL
         R1BO98Id+/ZL6Z5GPrA2JrAZrmcJQtKF4qcSVI8Pei4IavC7YrEIshBsRIf1ZraH6wlJ
         Lvug==
X-Gm-Message-State: AOJu0Yw0TPrlqCi51qxqXLIVHorGN+YvE8ZvvdtGGFA6ncgFzwNGFhq4
	sCvz5Cn77G+5r4cc9BgNwryeij50hjUutvrl6JgYhYZTKJI3VMU5ghpwUQJj1w==
X-Google-Smtp-Source: AGHT+IGDKtYIcxHkPm11eZ2ZMO94UifhkPiMwSygfHWqPNpvh9HGHPVTJ43n3/gL3mD58NV6RjmFJg==
X-Received: by 2002:a05:6a20:438e:b0:1c6:a825:8bc1 with SMTP id adf61e73a8af0-1c8eae97e97mr2189401637.29.1723601216392;
        Tue, 13 Aug 2024 19:06:56 -0700 (PDT)
Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:269a:7c5:e4f2:518c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d3ac7d65b1sm303064a91.4.2024.08.13.19.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 19:06:55 -0700 (PDT)
From: Yunke Cao <yunkec@chromium.org>
To: Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	Yunke Cao <yunkec@chromium.org>
Subject: [PATCH v5 2/4] media: videobuf2-core: release all planes first in __prepare_dmabuf()
Date: Wed, 14 Aug 2024 11:06:41 +0900
Message-ID: <20240814020643.2229637-3-yunkec@chromium.org>
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

In the existing implementation, validating planes, checking if the planes
changed, releasing previous planes and reaquiring new planes all happens in
the same for loop.

Split the for loop into 3 parts
1. In the first for loop, validate planes and check if planes changed.
2. Call __vb2_buf_dmabuf_put() to release all planes.
3. In the second for loop, reaquire new planes.

Signed-off-by: Yunke Cao <yunkec@chromium.org>
Acked-by: Tomasz Figa <tfiga@chromium.org>
---
v3:
- Applied Tomasz's review comment:
- Rename err_put_dbuf as err_put_planes.
- Move code that only executed once into if (reacquired) to simply it.
- In error handling, only call dma_buf_put() for valid pointers.
---
 .../media/common/videobuf2/videobuf2-core.c   | 115 +++++++++---------
 1 file changed, 59 insertions(+), 56 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 4d232b08f950..b53d94659e30 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -1387,11 +1387,13 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
 	for (plane = 0; plane < vb->num_planes; ++plane) {
 		struct dma_buf *dbuf = dma_buf_get(planes[plane].m.fd);
 
+		planes[plane].dbuf = dbuf;
+
 		if (IS_ERR_OR_NULL(dbuf)) {
 			dprintk(q, 1, "invalid dmabuf fd for plane %d\n",
 				plane);
 			ret = -EINVAL;
-			goto err;
+			goto err_put_planes;
 		}
 
 		/* use DMABUF size if length is not provided */
@@ -1402,76 +1404,68 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
 			dprintk(q, 1, "invalid dmabuf length %u for plane %d, minimum length %u\n",
 				planes[plane].length, plane,
 				vb->planes[plane].min_length);
-			dma_buf_put(dbuf);
 			ret = -EINVAL;
-			goto err;
+			goto err_put_planes;
 		}
 
 		/* Skip the plane if already verified */
 		if (dbuf == vb->planes[plane].dbuf &&
-			vb->planes[plane].length == planes[plane].length) {
-			dma_buf_put(dbuf);
+		    vb->planes[plane].length == planes[plane].length)
 			continue;
-		}
 
 		dprintk(q, 3, "buffer for plane %d changed\n", plane);
 
-		if (!reacquired) {
-			reacquired = true;
+		reacquired = true;
+	}
+
+	if (reacquired) {
+		if (vb->planes[0].mem_priv) {
 			vb->copied_timestamp = 0;
 			call_void_vb_qop(vb, buf_cleanup, vb);
+			__vb2_buf_dmabuf_put(vb);
 		}
 
-		/* Release previously acquired memory if present */
-		__vb2_plane_dmabuf_put(vb, &vb->planes[plane]);
-
-		/* Acquire each plane's memory */
-		mem_priv = call_ptr_memop(attach_dmabuf,
-					  vb,
-					  q->alloc_devs[plane] ? : q->dev,
-					  dbuf,
-					  planes[plane].length);
-		if (IS_ERR(mem_priv)) {
-			dprintk(q, 1, "failed to attach dmabuf\n");
-			ret = PTR_ERR(mem_priv);
-			dma_buf_put(dbuf);
-			goto err;
-		}
-
-		vb->planes[plane].dbuf = dbuf;
-		vb->planes[plane].mem_priv = mem_priv;
-	}
+		for (plane = 0; plane < vb->num_planes; ++plane) {
+			/* Acquire each plane's memory */
+			mem_priv = call_ptr_memop(attach_dmabuf,
+						  vb,
+						  q->alloc_devs[plane] ? : q->dev,
+						  planes[plane].dbuf,
+						  planes[plane].length);
+			if (IS_ERR(mem_priv)) {
+				dprintk(q, 1, "failed to attach dmabuf\n");
+				ret = PTR_ERR(mem_priv);
+				goto err_put_vb2_buf;
+			}
 
-	/*
-	 * This pins the buffer(s) with dma_buf_map_attachment()). It's done
-	 * here instead just before the DMA, while queueing the buffer(s) so
-	 * userspace knows sooner rather than later if the dma-buf map fails.
-	 */
-	for (plane = 0; plane < vb->num_planes; ++plane) {
-		if (vb->planes[plane].dbuf_mapped)
-			continue;
+			vb->planes[plane].dbuf = planes[plane].dbuf;
+			vb->planes[plane].mem_priv = mem_priv;
 
-		ret = call_memop(vb, map_dmabuf, vb->planes[plane].mem_priv);
-		if (ret) {
-			dprintk(q, 1, "failed to map dmabuf for plane %d\n",
-				plane);
-			goto err;
+			/*
+			 * This pins the buffer(s) with dma_buf_map_attachment()). It's done
+			 * here instead just before the DMA, while queueing the buffer(s) so
+			 * userspace knows sooner rather than later if the dma-buf map fails.
+			 */
+			ret = call_memop(vb, map_dmabuf, vb->planes[plane].mem_priv);
+			if (ret) {
+				dprintk(q, 1, "failed to map dmabuf for plane %d\n",
+					plane);
+				goto err_put_vb2_buf;
+			}
+			vb->planes[plane].dbuf_mapped = 1;
 		}
-		vb->planes[plane].dbuf_mapped = 1;
-	}
 
-	/*
-	 * Now that everything is in order, copy relevant information
-	 * provided by userspace.
-	 */
-	for (plane = 0; plane < vb->num_planes; ++plane) {
-		vb->planes[plane].bytesused = planes[plane].bytesused;
-		vb->planes[plane].length = planes[plane].length;
-		vb->planes[plane].m.fd = planes[plane].m.fd;
-		vb->planes[plane].data_offset = planes[plane].data_offset;
-	}
+		/*
+		 * Now that everything is in order, copy relevant information
+		 * provided by userspace.
+		 */
+		for (plane = 0; plane < vb->num_planes; ++plane) {
+			vb->planes[plane].bytesused = planes[plane].bytesused;
+			vb->planes[plane].length = planes[plane].length;
+			vb->planes[plane].m.fd = planes[plane].m.fd;
+			vb->planes[plane].data_offset = planes[plane].data_offset;
+		}
 
-	if (reacquired) {
 		/*
 		 * Call driver-specific initialization on the newly acquired buffer,
 		 * if provided.
@@ -1479,19 +1473,28 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
 		ret = call_vb_qop(vb, buf_init, vb);
 		if (ret) {
 			dprintk(q, 1, "buffer initialization failed\n");
-			goto err;
+			goto err_put_vb2_buf;
 		}
+	} else {
+		for (plane = 0; plane < vb->num_planes; ++plane)
+			dma_buf_put(planes[plane].dbuf);
 	}
 
 	ret = call_vb_qop(vb, buf_prepare, vb);
 	if (ret) {
 		dprintk(q, 1, "buffer preparation failed\n");
 		call_void_vb_qop(vb, buf_cleanup, vb);
-		goto err;
+		goto err_put_vb2_buf;
 	}
 
 	return 0;
-err:
+
+err_put_planes:
+	for (plane = 0; plane < vb->num_planes; ++plane) {
+		if (!IS_ERR_OR_NULL(planes[plane].dbuf))
+			dma_buf_put(planes[plane].dbuf);
+	}
+err_put_vb2_buf:
 	/* In case of errors, release planes that were already acquired */
 	__vb2_buf_dmabuf_put(vb);
 
-- 
2.46.0.184.g6999bdac58-goog


