Return-Path: <linux-media+bounces-8496-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 017ED896A33
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 11:14:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 831AE1F21101
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 09:14:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9921E71B3C;
	Wed,  3 Apr 2024 09:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Nqf1foKK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E866FE05
	for <linux-media@vger.kernel.org>; Wed,  3 Apr 2024 09:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712135597; cv=none; b=jW5yLCcxQIIwRTFN5XnPIVLyLBvJ1OIlPp5LN8LurUtI14EdmKU8bQ3Bt2cTAm+/v+Cfzsu7HShEcU0eLUTroq32albkyoxMClQWm9NZe2bYRF1iILRs7tgOucV2AdVpWhNJyV2bTSmOXk9v9mqSSlDlmWR9SyVHClI8pegoShg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712135597; c=relaxed/simple;
	bh=kPJ3qjufZNJhSRlMqwht8mg5xpGzMfW3PDbcwKHQ4Mk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GnTWhQWXQXm1nm8S9nFXiG8RWfku+l3Nlfo0/ofwL4RmsP+b7Dz7gsAH5+U8Oy9hCl5eE1MlXawqJBGNV2S2bz2EFHtIc8EfykFE9K4lhLhWTkuAxdYx9kwbuoNnaT/pRMXpKp4LyAk1n442WM6P0PQzssXu3dgawWXAIXnoH5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Nqf1foKK; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1e0878b76f3so6090875ad.0
        for <linux-media@vger.kernel.org>; Wed, 03 Apr 2024 02:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712135595; x=1712740395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Q6naeswlCg1RFODdohQF8TohLRu7F+DupH02PoNoNg=;
        b=Nqf1foKKAsaDPORaLZVfBb2NwMgSz7IW3EznpiJ2uXcHrIZroCvgXHr6p5F6iBKJeh
         Qe7gCvRbC4TJvcVcTal4R/Ul/DWV3IyW42mPra6VYTvyMkp3JtmEUml2FF8pzm79rLRd
         4SDNkWPeUT7avniHORYAppaqXiO0gK38mBTuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712135595; x=1712740395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Q6naeswlCg1RFODdohQF8TohLRu7F+DupH02PoNoNg=;
        b=UJmL+zqli55q3JePx129qpSqDGrPoP3isICsN1QGhVTPgeqgGwGBBB3GDbYfVZiN36
         P4PCioOizvRD9ZzKa2/wgXqt8qd7O4RmoCbsq4wStR6kMwAZ0sZi6y9OTT+PJZsOrOzm
         Fb0AbMliSEjjl2Xdiup2evrusSg3W3FF0XO3d6Jt6XQX7GGF5EjvnJgO9c6t9lK8wATA
         IDu30wkhwR3Okj5t1k8lKRjrOkXaEjDS6P//I1YbqFuevyxoSAaopmGCxIilvMoq5Bf9
         ROg0IUx9S9bemmpd+krb4vpD6In4n6ayr3o6nAY+qO/LYRvEWmmfXwCzgZr1qsUxlUYz
         Yulg==
X-Gm-Message-State: AOJu0YxE1eiZKc/WoTTiWNXWsK+eeaXcaEFUHBHCI4htVNXvP+CulGyg
	48vN7XLPUheJ17BCXufUIoYMcVhQNZNfXZVSo5aEgICxXAvtwThjfF8+LNlyCw==
X-Google-Smtp-Source: AGHT+IFbjY7JYqnsv43pzQbTsKYVXKErsbPmPcBfkA3wJZ6QN4DEiyrIVb5hDV4SgU8WeqrXsIa2aw==
X-Received: by 2002:a17:903:22c2:b0:1e0:9926:aded with SMTP id y2-20020a17090322c200b001e09926adedmr2366272plg.24.1712135594943;
        Wed, 03 Apr 2024 02:13:14 -0700 (PDT)
Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:d5be:b59a:f5f7:246d])
        by smtp.gmail.com with ESMTPSA id lo14-20020a170903434e00b001e0aded0ca7sm12692811plb.239.2024.04.03.02.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 02:13:14 -0700 (PDT)
From: Yunke Cao <yunkec@chromium.org>
To: Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	Yunke Cao <yunkec@chromium.org>
Subject: [PATCH v2 1/3] media: videobuf2-core: release all planes first in __prepare_dmabuf()
Date: Wed,  3 Apr 2024 18:13:04 +0900
Message-ID: <20240403091306.1308878-2-yunkec@chromium.org>
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

The existing implementation, validating planes, checking if the planes
changed, releasing previous planes and reaquiring new planes all happens in
the same for loop.

Split the for loop into 3 parts
1. In the first for loop, validate planes and check if planes changed.
2. Call __vb2_buf_dmabuf_put() to release all planes.
3. In the second for loop, reaquire new planes.

Signed-off-by: Yunke Cao <yunkec@chromium.org>
---
 .../media/common/videobuf2/videobuf2-core.c   | 64 ++++++++++---------
 1 file changed, 34 insertions(+), 30 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index b6bf8f232f48..702f7b6f783a 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -1341,11 +1341,13 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
 	for (plane = 0; plane < vb->num_planes; ++plane) {
 		struct dma_buf *dbuf = dma_buf_get(planes[plane].m.fd);
 
+		planes[plane].dbuf = dbuf;
+
 		if (IS_ERR_OR_NULL(dbuf)) {
 			dprintk(q, 1, "invalid dmabuf fd for plane %d\n",
 				plane);
 			ret = -EINVAL;
-			goto err;
+			goto err_put_dbuf;
 		}
 
 		/* use DMABUF size if length is not provided */
@@ -1356,17 +1358,14 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
 			dprintk(q, 1, "invalid dmabuf length %u for plane %d, minimum length %u\n",
 				planes[plane].length, plane,
 				vb->planes[plane].min_length);
-			dma_buf_put(dbuf);
 			ret = -EINVAL;
-			goto err;
+			goto err_put_dbuf;
 		}
 
 		/* Skip the plane if already verified */
 		if (dbuf == vb->planes[plane].dbuf &&
-			vb->planes[plane].length == planes[plane].length) {
-			dma_buf_put(dbuf);
+		    vb->planes[plane].length == planes[plane].length)
 			continue;
-		}
 
 		dprintk(q, 3, "buffer for plane %d changed\n", plane);
 
@@ -1375,29 +1374,30 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
 			vb->copied_timestamp = 0;
 			call_void_vb_qop(vb, buf_cleanup, vb);
 		}
+	}
 
-		/* Release previously acquired memory if present */
-		__vb2_plane_dmabuf_put(vb, &vb->planes[plane]);
-		vb->planes[plane].bytesused = 0;
-		vb->planes[plane].length = 0;
-		vb->planes[plane].m.fd = 0;
-		vb->planes[plane].data_offset = 0;
+	if (reacquired) {
+		__vb2_buf_dmabuf_put(vb);
+
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
+				goto err_put_dbuf;
+			}
 
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
+			vb->planes[plane].dbuf = planes[plane].dbuf;
+			vb->planes[plane].mem_priv = mem_priv;
 		}
-
-		vb->planes[plane].dbuf = dbuf;
-		vb->planes[plane].mem_priv = mem_priv;
+	} else {
+		for (plane = 0; plane < vb->num_planes; ++plane)
+			dma_buf_put(planes[plane].dbuf);
 	}
 
 	/*
@@ -1413,7 +1413,7 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
 		if (ret) {
 			dprintk(q, 1, "failed to map dmabuf for plane %d\n",
 				plane);
-			goto err;
+			goto err_put_vb2_buf;
 		}
 		vb->planes[plane].dbuf_mapped = 1;
 	}
@@ -1437,7 +1437,7 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
 		ret = call_vb_qop(vb, buf_init, vb);
 		if (ret) {
 			dprintk(q, 1, "buffer initialization failed\n");
-			goto err;
+			goto err_put_vb2_buf;
 		}
 	}
 
@@ -1445,11 +1445,15 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
 	if (ret) {
 		dprintk(q, 1, "buffer preparation failed\n");
 		call_void_vb_qop(vb, buf_cleanup, vb);
-		goto err;
+		goto err_put_vb2_buf;
 	}
 
 	return 0;
-err:
+
+err_put_dbuf:
+	for (plane = 0; plane < vb->num_planes; ++plane)
+		dma_buf_put(planes[plane].dbuf);
+err_put_vb2_buf:
 	/* In case of errors, release planes that were already acquired */
 	__vb2_buf_dmabuf_put(vb);
 
-- 
2.44.0.478.gd926399ef9-goog


