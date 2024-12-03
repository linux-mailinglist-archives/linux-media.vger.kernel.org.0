Return-Path: <linux-media+bounces-22557-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D189E2CAA
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 21:06:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D66B9B44AA1
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 17:27:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB8681FDE19;
	Tue,  3 Dec 2024 17:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KVIsVwFx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8616F1FBCB5
	for <linux-media@vger.kernel.org>; Tue,  3 Dec 2024 17:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733246813; cv=none; b=j/OFkePC4iVBe/qxyjXOYyta0BJB3An9n7I6LjF/ADc8U3/NEyQpJ4vWzV1LG2uBZ0k3f+3waxyrmQUwaw2IXyaroCGFd8Q4cpW5C4FymnAvPpvi4w+1Y7yMeVkzH06e8R8WuIfZ/NV4yl+G9gh18Ui1RjJvkCcVdUxcgm6utf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733246813; c=relaxed/simple;
	bh=d/SKaEARJ6M0/cu1G8obkYNjM7fgsn+zCy4/XdkuEqM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ahgh3Eb2NyTbRtu1ELwHXIaVMYGVHzRsCt2qyXjBC685x73O5y9FQ42k3JK0/kCVCx35pvFwlV8YuQuWau4i8itxVTefeslebioso0cqSpgDM9TkOJNUfXj02QM4YkapBu34shl45RFofugexjusq0MjOgAn9RJXPAiFRpGUc70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KVIsVwFx; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-434a9f9a225so56105e9.1
        for <linux-media@vger.kernel.org>; Tue, 03 Dec 2024 09:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733246810; x=1733851610; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Vb9UXBOYsKi0pZ5x9hV4iMqdA2fMvrJ4pmauvo9ZZ8=;
        b=KVIsVwFxDhDefX7PSff7Lc1+S7MXB+cnYhP2mbB+dFDWfQhYaLOs6nVM85Zj43S0tM
         dm/hxnbrojsn4paJs6GxQs3na332MzvVkpAEiWmhXDJD8lRrPt6ueU8XTbYI9P4yHmtw
         +2RKGw/KrukdrQBXNPdzVKUHbull7Om7uA3OullCdUDmPx/7WEl32DrUFbIUnL9tUU4z
         A82vA6kAvsCMHadJzxZQte5PR1AOg7c/MUsRs47iBITAgJGpICiO0ZXWzWH7JtrEla76
         +H8aSgTTveexDPQ4iC18dCAxf4U7QCQ1o71ajaLeeGloM0/jSD5a7vW8Me26HSGey2we
         pIdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733246810; x=1733851610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Vb9UXBOYsKi0pZ5x9hV4iMqdA2fMvrJ4pmauvo9ZZ8=;
        b=tqBY0M/SxVSvlEn9HjTYxo6yB1smyNRfOMl9lpgvBxK6z8OUu1PGVhSGK0sFGuZf+E
         kKmot2Sk0Mm8Cy4h6w4VO1E8g+92K6mOLW3DVptwKVyw9O70aXUrXvnY0vngqmt2mXp9
         1NI+9MebY4x3JZ9ObMgkaSW+APdVcRxFBL/MSBMWG1Rxxye4Armbpr2WeXLQzwOJLk/w
         IWpfnGZb5dh8NwE8uufBGkTFkyvLVGQl8kqALagGT3kejM0M5uiwhdDZwGUs8se7Dkrh
         rtUJUmHVZwELkxrJO20gogczuv+LfI6S1hY79NLxcF1eiCfFnosqqZFhUtbhTuWAIdqP
         yKng==
X-Forwarded-Encrypted: i=1; AJvYcCVT6VMB1BZ2Sz7IzKrLK72CiuAa1bly1P75D1M0uuI3CVu84gL3iyBMxxrfwC9x6X7uFv/uScukDo4F9A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3yLTkZ8jRggFJ8YWkKzkn59/Zt7YXH8oD1ro8zjtsO74igpCA
	V52D2E2xefv561MkT5bBeQ8K9wM7ZEAynyOAKCfbDUf0vI6+ti+sYGRvJxmtqA==
X-Gm-Gg: ASbGncvFfaBtvlXiw0+W0XcvMnG04CEOy5AizTIvzgoz0UsjeH+pE7QOsnG3Mjrn01L
	PrS1u+nS+jfsWt/AgaayGPiozi4dnusFiz9JxqFKcEHQw7X2J97UQPY6XX5p9SoP7MCyYy6TUf+
	gfYjbE3SLGVmZHdALG9lr8H/ARW8RNNwlsILNtWrxzhmnEmfLSy2RM1IrsApmVzi1bIBehYHkrs
	bQMAKrGnjeGqgg5YMzzdvzNF3zRsh8XKxPooqs=
X-Google-Smtp-Source: AGHT+IH0TNX49DlvsUlDmYHqE+X/GJfm7kzNvuJYlH9rEpQHDfxMRPXJgjMqM5godm3e1PRO0SoeKQ==
X-Received: by 2002:a7b:cc83:0:b0:434:9d76:5031 with SMTP id 5b1f17b1804b1-434d12b8d88mr1204505e9.1.1733246809511;
        Tue, 03 Dec 2024 09:26:49 -0800 (PST)
Received: from localhost ([2a00:79e0:9d:4:92ba:3294:39ee:2d61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0dbe4e6sm194671505e9.14.2024.12.03.09.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 09:26:49 -0800 (PST)
From: Jann Horn <jannh@google.com>
Date: Tue, 03 Dec 2024 18:25:37 +0100
Subject: [PATCH 3/3] udmabuf: fix memory leak on last export_udmabuf()
 error path
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-udmabuf-fixes-v1-3-f99281c345aa@google.com>
References: <20241203-udmabuf-fixes-v1-0-f99281c345aa@google.com>
In-Reply-To: <20241203-udmabuf-fixes-v1-0-f99281c345aa@google.com>
To: Gerd Hoffmann <kraxel@redhat.com>, 
 Vivek Kasireddy <vivek.kasireddy@intel.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, 
 John Stultz <john.stultz@linaro.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 Jann Horn <jannh@google.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733246802; l=2748;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=d/SKaEARJ6M0/cu1G8obkYNjM7fgsn+zCy4/XdkuEqM=;
 b=X3evmweW4JuzseSHwdhP7RA4Pf8e6N5ueqNFDbhwq7nktyWWe+H3fxCMDbqjeNobSJ+OFwz4q
 CrhwTQWCO5HCdsMU7uLiRuWbk2eiWJ94PEjMmxwGvVbe3p9pYkPZ/mf
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=

In export_udmabuf(), if dma_buf_fd() fails because the FD table is full, a
dma_buf owning the udmabuf has already been created; but the error handling
in udmabuf_create() will tear down the udmabuf without doing anything about
the containing dma_buf.

This leaves a dma_buf in memory that contains a dangling pointer; though
that doesn't seem to lead to anything bad except a memory leak.

Fix it by moving the dma_buf_fd() call out of export_udmabuf() so that we
can give it different error handling.

Note that the shape of this code changed a lot in commit 5e72b2b41a21
("udmabuf: convert udmabuf driver to use folios"); but the memory leak
seems to have existed since the introduction of udmabuf.

Fixes: fbb0de795078 ("Add udmabuf misc device")
Signed-off-by: Jann Horn <jannh@google.com>
---
 drivers/dma-buf/udmabuf.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 8ce77f5837d71a73be677cad014e05f29706057d..aae0071be14a2c83a428b59ea9e905c7173232be 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -317,12 +317,11 @@ static int check_memfd_seals(struct file *memfd)
 	return 0;
 }
 
-static int export_udmabuf(struct udmabuf *ubuf,
-			  struct miscdevice *device,
-			  u32 flags)
+static struct dma_buf *export_udmabuf(struct udmabuf *ubuf,
+				      struct miscdevice *device,
+				      u32 flags)
 {
 	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
-	struct dma_buf *buf;
 
 	ubuf->device = device;
 	exp_info.ops  = &udmabuf_ops;
@@ -330,11 +329,7 @@ static int export_udmabuf(struct udmabuf *ubuf,
 	exp_info.priv = ubuf;
 	exp_info.flags = O_RDWR;
 
-	buf = dma_buf_export(&exp_info);
-	if (IS_ERR(buf))
-		return PTR_ERR(buf);
-
-	return dma_buf_fd(buf, flags);
+	return dma_buf_export(&exp_info);
 }
 
 static long udmabuf_pin_folios(struct udmabuf *ubuf, struct file *memfd,
@@ -391,6 +386,7 @@ static long udmabuf_create(struct miscdevice *device,
 	struct folio **folios = NULL;
 	pgoff_t pgcnt = 0, pglimit;
 	struct udmabuf *ubuf;
+	struct dma_buf *dmabuf;
 	long ret = -EINVAL;
 	u32 i, flags;
 
@@ -451,9 +447,16 @@ static long udmabuf_create(struct miscdevice *device,
 	}
 
 	flags = head->flags & UDMABUF_FLAGS_CLOEXEC ? O_CLOEXEC : 0;
-	ret = export_udmabuf(ubuf, device, flags);
-	if (ret < 0)
+	dmabuf = export_udmabuf(ubuf, device, flags);
+	if (IS_ERR(dmabuf)) {
+		ret = PTR_ERR(dmabuf);
 		goto err;
+	}
+	/* ownership of ubuf is held by the dmabuf from here */
+
+	ret = dma_buf_fd(dmabuf, flags);
+	if (ret < 0)
+		dma_buf_put(dmabuf);
 
 	kvfree(folios);
 	return ret;

-- 
2.47.0.338.g60cca15819-goog


