Return-Path: <linux-media+bounces-13247-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 692EE908530
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 09:37:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC66D1F22A60
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 07:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E16614A09F;
	Fri, 14 Jun 2024 07:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="H/5mXIWh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEB1148FE8
	for <linux-media@vger.kernel.org>; Fri, 14 Jun 2024 07:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718350634; cv=none; b=dRDZezbIjmy4nJLfg6EqJI0I7GEP4vccCOgDVzKJPAetHGvMIIGwgj72Fn52G1adIcHnuy1kMzxwRlHrPZkrLUFlUokBEFhVBnhWmkXPzVR+mkex6TNX2gHBdUKjMnfgAUmTkmNqkySw1hN2L0clOpUjWJoyn1BAMDz+FW1D148=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718350634; c=relaxed/simple;
	bh=ihcsatofbEbFqoisSbzP/jK3zeZAf0bdRdbp/wxAHxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KaAGYnNMdcOxlBca+6X7G1JD2jQYM9pxVBzMY3oxyIWMBzyPeEZD927noNSjfUuvpuPXn5uC9O/ffDXutr2DYug1Kzwcw65NX+JZH1tI+BHDWJIsodxfBz5bgbzm9MA/KFGwijGz2hXcpVGIVRMB6Nmpt0SEaX+cUr8Urqca5us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=H/5mXIWh; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-24542b8607fso942382fac.1
        for <linux-media@vger.kernel.org>; Fri, 14 Jun 2024 00:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718350632; x=1718955432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iwDoOanHUygDwmb8b9OjRT4/rpr+scmAMggH3DnTSsE=;
        b=H/5mXIWhTOVNyr+iYHgObzLUOVzhE+BEecVD3JqAzAqDrMabtzviZz9V/q6debf710
         3mHTOn3NoUJ9v+Q6iqbrdZfpDhBn3lRIOoBMz1P94kVNeUO3oEl3mjqePTAl4WxFqoxU
         cTzlsR3tGvkp6ADa31Ts6M4bBSwhK7a+UW7Lg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718350632; x=1718955432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iwDoOanHUygDwmb8b9OjRT4/rpr+scmAMggH3DnTSsE=;
        b=PpfgJQlTD2CuXWtfmW+481N/mGAfd+uJazzesbxuEZXBI/Uvh5bWHMZ5GC4/YYBEr5
         Uv0RcOLjkZco/xH1nhTltYAah62tJli9fn07fX/BrHdVYtAc5+Vu5sqJ2ebeYbHiP1lS
         IdH0MMu3o+oBZTMYrF07H1h9u5LvBqmP6CVXHHceb9hGaeAK5CTI5dJBZnmq3ZLZrqOp
         e0YqkC3pKQZ42I/FooDIE5rLyHzAVEJMulXf9ziU1CU0MmEUQDLU8P+vxLCascOaSId5
         KQVV6uon+z/gRsYJR0+MDopXWqwc3+14JX+1vvXxOnrw7LTzQPen5JRjD3Pz+NSsmqkr
         4npA==
X-Gm-Message-State: AOJu0YzI0UffnNvqDnwKIgfSl5ckhV4puqRQLFnRe04R5vSJOWhXz2dH
	AOdhbMqWXKgNwewQM6MtG3yDRVjBb5EhBm+Jn95Sj0MyJ0E1vEC98YaaNFtOm18SVM9zu5Y9PMo
	=
X-Google-Smtp-Source: AGHT+IH0l4nVAAZB0BJ4stqCpG3BfjrbOs3wTFD+MZ2nW3B58NslSpoIyUpchOjkMuaw8oJr3QqAqA==
X-Received: by 2002:a05:6870:89a8:b0:254:963e:cc47 with SMTP id 586e51a60fabf-25842896ab1mr1972169fac.10.1718350632052;
        Fri, 14 Jun 2024 00:37:12 -0700 (PDT)
Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:336:17cf:71d5:5733])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc922643sm2468382b3a.31.2024.06.14.00.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 00:37:11 -0700 (PDT)
From: Yunke Cao <yunkec@chromium.org>
To: Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	Yunke Cao <yunkec@chromium.org>
Subject: [PATCH v4 2/4] media: videobuf2-core: release all planes first in __prepare_dmabuf()
Date: Fri, 14 Jun 2024 16:37:00 +0900
Message-ID: <20240614073702.316810-3-yunkec@chromium.org>
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

In the existing implementation, validating planes, checking if the planes
changed, releasing previous planes and reaquiring new planes all happens in
the same for loop.

Split the for loop into 3 parts
1. In the first for loop, validate planes and check if planes changed.
2. Call __vb2_buf_dmabuf_put() to release all planes.
3. In the second for loop, reaquire new planes.

Signed-off-by: Yunke Cao <yunkec@chromium.org>
---
v3:
Applied Tomasz's review comment
- Rename err_put_dbuf as err_put_planes.
- Move code that only executed once into if (reacquired) to simply it.
- In error handling, only call dma_buf_put() for valid pointers.
---
 .../media/common/videobuf2/videobuf2-core.c   | 115 +++++++++---------
 1 file changed, 59 insertions(+), 56 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index a26130706506..a4fbc7a57ee0 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -1388,11 +1388,13 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
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
@@ -1403,76 +1405,68 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
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
@@ -1480,19 +1474,28 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
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
2.45.2.627.g7a2c4fd464-goog


