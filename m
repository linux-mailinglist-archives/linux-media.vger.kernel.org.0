Return-Path: <linux-media+bounces-12560-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBCC8FC4C1
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 09:41:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37FD5283673
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 07:41:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2858F18F2DC;
	Wed,  5 Jun 2024 07:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ync3gavv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C4218F2C4
	for <linux-media@vger.kernel.org>; Wed,  5 Jun 2024 07:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717573246; cv=none; b=Gq1SgHgDKmmvB/ZFsUPnKeUybCHMDZz6wkypvxUYltnnNEh6aQoGF3s2aqERDp+A9fxoRMlz58p8fFRsg9rr2pV5NCQ4Ir7v9Pk7Jf9TUKwq6VhksTULvKnU7/kW6N0SI5KleD5BdoSrsgMeo8i7NWmNuSQs2RP1jYDmT1XB6FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717573246; c=relaxed/simple;
	bh=ypiKIisSHOrrOIkwn7HkY6IwpIa5NiyrqnfYxXQIyMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xhtq1m7nXZgc0jplePIz20X2R7KErTo0gOT/meTCQP7cgbj5julQ8/fClPsO2LPucZfHaq3biUvun+XrDfHX21wrjyjYWJVoInIVPso1LT87UTfpP8hpKoiVUQfC06UTJXNg6sCTU6odK+slex2QwbHZSAnolFCpl6tCO6cJTDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ync3gavv; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-703ed15b273so260933b3a.1
        for <linux-media@vger.kernel.org>; Wed, 05 Jun 2024 00:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717573244; x=1718178044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2cqysvyrWpSWwrRs/+n9EY6jDo5oCwiSq1EpZvbmuEo=;
        b=Ync3gavveVAx4WtfSP6aEX05XNd/E1FbKp0ofthP51odHZ6ku7XMANhPVPkcuX2yHf
         Qa4aks8KEF82tbc2Qy7hUB/euSTKpNuOg6se+SQDVGPKotmdIkfFc80ct5ggo1RtbGuu
         WtpcS6OnbDOhND7uswHiyOYVxDTMVjjbrD8/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717573244; x=1718178044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2cqysvyrWpSWwrRs/+n9EY6jDo5oCwiSq1EpZvbmuEo=;
        b=cH4pExSpwU3boB4oAdov6g67ZKNCM4Byx9l0nigrNQskd7gjlWNpnpphDP0f8yDcwR
         i7w9ws9nJYGY+zI3eIIWBvTnYwUl5PTnW5SZOQFbyUdtOQ+UqEJ4+0tfSF9shLVGA8ZX
         cGD7DiwiYld8EiWRIwg+tl3FLKoqiVgmASAHuGM5VDXsPwyfS6bReKfTrFAUo8VRpDTF
         mKxRxRvfXdhj7r6Wu/IKoyF0lvPczxKf40h7cvWB0cy1pEzj15wkLIsQpDQgCqqeZIuf
         1fuuu4v1tiuvKVy4C+BuPAvXJCmVoSOU85UWVgvY0dQprln9KhIx2jcjH1Ka0HDwY8wp
         0DAQ==
X-Gm-Message-State: AOJu0YymFbJIIwJwjnZKiRB9x4yNY34/9CLH9WdpxkwMZ9aXvEDeuPB3
	SV+/IbmBj2niPt3nAQNVNmcDV5kocnALLr8WZ8LSsmaBenfloiJqnATmWEnYDg==
X-Google-Smtp-Source: AGHT+IFzwusOHJPZAP/24fHZXt4voVCtlK1TIQpTu6sLqq3w1TsMtfwt0KaToFo6z47uyP4f+sZ0ag==
X-Received: by 2002:a05:6a20:d80d:b0:1af:881c:e924 with SMTP id adf61e73a8af0-1b2b763736fmr2044374637.62.1717573244236;
        Wed, 05 Jun 2024 00:40:44 -0700 (PDT)
Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:f834:a68:ab2:f744])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6324e54besm95500405ad.254.2024.06.05.00.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 00:40:44 -0700 (PDT)
From: Yunke Cao <yunkec@chromium.org>
To: Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	Yunke Cao <yunkec@chromium.org>
Subject: [PATCH v3 2/4] media: videobuf2-core: release all planes first in __prepare_dmabuf()
Date: Wed,  5 Jun 2024 16:40:33 +0900
Message-ID: <20240605074035.2620140-3-yunkec@chromium.org>
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
2.45.1.288.g0e0cd299f1-goog


