Return-Path: <linux-media+bounces-22640-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5029E4251
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 18:50:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 190C2B3805B
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 16:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71CC520DD51;
	Wed,  4 Dec 2024 16:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0tm4hcD9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024FF20CCE4
	for <linux-media@vger.kernel.org>; Wed,  4 Dec 2024 16:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733329626; cv=none; b=Quz1h6+VAhHXeqrmys0WU8cHts5zXv7uVSu176StX8n9Bm5nNpcRHaG3TdwG3u6wyaHv+g8mhVGVZFCWaHYu7MQ61qLRND6GMe6G05dIVQSZWczIo2foIQKlTFtkFiZV5KIrx/Un5KWszVoT6oTQg1s7npFDZ48LmrpX49ej8gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733329626; c=relaxed/simple;
	bh=mvwHL7Jb84Pbju4MjxbJaCZAU90KwtuuZ/LtjIuw+f8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jbhBBrD6osI+ZjjZpRSVVdaYHYsQ6eo3EoHPVIdzzBSn6tmRwWfoT53hqVKxfsjdLV625XOtkDlO+8eRIMlOvctHgEWhXLdHO1dVBVSFdMhn7+iOZAjK2Mmb2GKHrzTOU1AMNFxbGDi3clRUQLWejByuHy/NONdf5ZuM3hJDvyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0tm4hcD9; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4349ea54db7so61795e9.0
        for <linux-media@vger.kernel.org>; Wed, 04 Dec 2024 08:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733329623; x=1733934423; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4W1li+PQJAySFeW+G0OUEYywmlbqWEh+T217K5HBe5s=;
        b=0tm4hcD9Rdc1/uJ8eW9oZMKN8dUnmpthZPz4oE9NOkhfLo0TzCWMOv274JrGRuBG1j
         sKm15naXCQbSAC7aL0yIk4Yzzi0NzbG128GZRHN+iPDFNlwMjdKchb4xK06oSTD44Moy
         Xu/j+wjhg/dIC+OurYLoiguJuC/fq9qj1fFa2x7Me4sRP7+TqDF4dXQnYb1fS9N45TjN
         xgkWuMARc0OAiKfrEpypVgOWgBVOSeV/Z47LqhKYlMKrI7xuj9u2tyaVdtfsGacryZne
         84hsPe+IfbpJwEOpaPhmI1qTHu64gAsMxbhbWFGOxEqcUv0pXnXrQg9tUunHVnvoSaQB
         8XlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733329623; x=1733934423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4W1li+PQJAySFeW+G0OUEYywmlbqWEh+T217K5HBe5s=;
        b=PEkNJ7gFWf+wAQ4FQBw0/PO6mspktecHZ1MpUy8URWdZRKrN74s0OMhAnGkbzeVoav
         8O0x9rNmiOGx4Gyg8XUK2gldYjZrfT4B7vd2Kd23RD/EytzBJWeLeibf7LFbQoUOFcaC
         mbO+Ej3bQ9ozsVIjTJMV4++78qmr1WXzxqSQI6Aim5us87EH4W8F8LYCheYuA3/KPBxm
         vzzN610Uzb+lyVD20G5Is5v+zgrU748NwnNk6GaHTtGiEw5Vq9GsNuY/btZFWkHbYOs4
         sYHYY3gwDje85MfSTMQhEWpvvu2LH+KQLBTf9A2RVjCtRERM4kUSsn+1WZVJL0+e/IY/
         Q4hQ==
X-Forwarded-Encrypted: i=1; AJvYcCX24xQMGQHVNNlSd1xJYd2F49D6XGXE9OaYKffLO1qeup246+n20SvOz4g576LNDBgBrA98aZHQEsGxKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+k+2dl/UlazlykRqbRociwi0qkyVY/NRCppXQkUHByRlzacSg
	AUSwRRTh0m/FnWimB6OcliaL9OQaE2hf+6zo/85wLBXSPF5qpcTBx73lvQblmw==
X-Gm-Gg: ASbGncskvUNFnsfsnJeX4U/ZJZbCLlsXXMD0J+Y7lXVSrkkizMDi7HYjrMPO9EOvMKz
	tWJnwN9O75FfLy5o8GSBrAaou3B1qDcFbcMKTK3cyg4445HcBc0Z4o7Uyc0B2JnohrCk8qMAl5p
	l7M8vfY7O5S6FyveVgiEksW2VbQrp1PpefIqQ6SD+y3Hpye5zceZ0OvvBkHjYJXFpp7z/Tdn3dM
	BY02fS+vXtHVo4MXybMgbikx1PZQpX6UCi30G4=
X-Google-Smtp-Source: AGHT+IFxTlGmGXtO+gti6IDe6nN/9i5MoY6EIkDL/S+U10Uwbut4N21TN5+9JMZjadgnuQEdINJ5lg==
X-Received: by 2002:a05:600c:138c:b0:434:9d76:5031 with SMTP id 5b1f17b1804b1-434d52a1a87mr1200535e9.1.1733329622396;
        Wed, 04 Dec 2024 08:27:02 -0800 (PST)
Received: from localhost ([2a00:79e0:9d:4:4606:5fa1:8ade:6950])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e391656csm13529589f8f.47.2024.12.04.08.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 08:27:01 -0800 (PST)
From: Jann Horn <jannh@google.com>
Date: Wed, 04 Dec 2024 17:26:21 +0100
Subject: [PATCH v2 3/3] udmabuf: fix memory leak on last export_udmabuf()
 error path
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-udmabuf-fixes-v2-3-23887289de1c@google.com>
References: <20241204-udmabuf-fixes-v2-0-23887289de1c@google.com>
In-Reply-To: <20241204-udmabuf-fixes-v2-0-23887289de1c@google.com>
To: Gerd Hoffmann <kraxel@redhat.com>, 
 Vivek Kasireddy <vivek.kasireddy@intel.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, John Stultz <jstultz@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 Jann Horn <jannh@google.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733329589; l=2920;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=mvwHL7Jb84Pbju4MjxbJaCZAU90KwtuuZ/LtjIuw+f8=;
 b=fcP3sbdyj//3/2F+j7CV5MfjiClV4Op+98VqArx+dvhb/6GkinHSzqeg9LJqzsq7iAU0UxgUh
 QpLwT4usxp1DhuRdSWGAKD7NSw4TKBtLSJfIgmMudebJ46OZuQdrIzb
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
Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Jann Horn <jannh@google.com>
---
 drivers/dma-buf/udmabuf.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index b330b99fcc7619a05bb7dc2aeeb9c82faf9a387b..cc7398cc17d67fca0634e763534901f8e6b454f8 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -317,12 +317,10 @@ static int check_memfd_seals(struct file *memfd)
 	return 0;
 }
 
-static int export_udmabuf(struct udmabuf *ubuf,
-			  struct miscdevice *device,
-			  u32 flags)
+static struct dma_buf *export_udmabuf(struct udmabuf *ubuf,
+				      struct miscdevice *device)
 {
 	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
-	struct dma_buf *buf;
 
 	ubuf->device = device;
 	exp_info.ops  = &udmabuf_ops;
@@ -330,11 +328,7 @@ static int export_udmabuf(struct udmabuf *ubuf,
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
@@ -391,6 +385,7 @@ static long udmabuf_create(struct miscdevice *device,
 	struct folio **folios = NULL;
 	pgoff_t pgcnt = 0, pglimit;
 	struct udmabuf *ubuf;
+	struct dma_buf *dmabuf;
 	long ret = -EINVAL;
 	u32 i, flags;
 
@@ -455,9 +450,20 @@ static long udmabuf_create(struct miscdevice *device,
 	}
 
 	flags = head->flags & UDMABUF_FLAGS_CLOEXEC ? O_CLOEXEC : 0;
-	ret = export_udmabuf(ubuf, device, flags);
-	if (ret < 0)
+	dmabuf = export_udmabuf(ubuf, device);
+	if (IS_ERR(dmabuf)) {
+		ret = PTR_ERR(dmabuf);
 		goto err;
+	}
+	/*
+	 * Ownership of ubuf is held by the dmabuf from here.
+	 * If the following dma_buf_fd() fails, dma_buf_put() cleans up both the
+	 * dmabuf and the ubuf (through udmabuf_ops.release).
+	 */
+
+	ret = dma_buf_fd(dmabuf, flags);
+	if (ret < 0)
+		dma_buf_put(dmabuf);
 
 	kvfree(folios);
 	return ret;

-- 
2.47.0.338.g60cca15819-goog


