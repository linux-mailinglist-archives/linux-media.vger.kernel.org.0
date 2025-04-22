Return-Path: <linux-media+bounces-30723-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FB9A972F4
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 18:42:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8F8C17CF49
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 16:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E65692949E3;
	Tue, 22 Apr 2025 16:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Nk+llupu"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EF5293B7B
	for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 16:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745340142; cv=none; b=PDAk4MfYZbx5o+oic4ma6bV4puAcZ5SWzGI0Xr4XU+tyogoEtVTYoJ31nFkwTrBjclGnMkH9O//eryjcsN/EP9Bp/HY02efefBwe2DC4KC4L9GEwIVUDosBCy1657Cs0YgdkRLXx+dig3s/rZgpAAb1FPCeBj8ot9Ljvg12UDcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745340142; c=relaxed/simple;
	bh=sfBmd1OBbJI2abcZpauJWCnwwx49LFyiSAV6mfejFhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PVrc/k4prKEtSJTFffAmx6VVLj6xzf8EZeqLbB8mJYb7WGAPj44bCUpUTm+dzbGEWnWeV/Iw0TI+PTRK9+PNZaLbFd505gmAL08L6yaZM8ZtFQwKCLO/YKQAinqQb155EvyIuYmcUxsLHCEplIjpHRfXXv4IyzZ9HCDMakGN6YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Nk+llupu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745340138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DslNlnyYeBMO8E0a4QEwSeg6EwzYfoV0u5u9NaRMXyQ=;
	b=Nk+llupuYE2/Z1iEn+78im+9pJrLVjjxMlHiF4JtQUme0HNKPgdiNFQNLKiNo7IGN+0ZBu
	yRdOyI33BP5h2ODWmer/z4uKPQ4my/JLFo+It7Len+QeBJsWJ31TmBHy0reEUy1Uz0Gfkz
	Av1drl8YwhQ5xCV60u5wGIMII1zYR9o=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-qdwbLirLNU2VuqvgjGS_wQ-1; Tue, 22 Apr 2025 12:42:17 -0400
X-MC-Unique: qdwbLirLNU2VuqvgjGS_wQ-1
X-Mimecast-MFC-AGG-ID: qdwbLirLNU2VuqvgjGS_wQ_1745340136
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e916df0d5dso98306166d6.2
        for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 09:42:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745340136; x=1745944936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DslNlnyYeBMO8E0a4QEwSeg6EwzYfoV0u5u9NaRMXyQ=;
        b=t2NRquxEk9OtkQ3eYFsO9+KU6G0S6eEx3GfKrDbGcNAmeyX37Ca1BZpQVX48ecObJ0
         mj2mizZ7uEvvjltVVSPD14YY52wu2BPVmsUBn9W1ahGYCnBZFRqZ05AljEX1kJegg4bp
         Pw3QnH8G57+Dkl84jTXygNISEWZ5iz/w4zsI+AWMeR92xV35MXSLcmOyvmh57i0r/Ib9
         WoOmRNvv/FyM6w8mHloSgsdqV4QVJHNEwctFdxs5h/4tf9nGXn1I+luaSwcMfz5scr5h
         1Dl6iga7X5g8mQdlKX9QgbZ7FSq/X/OnSmfsMmozsiWnQMDR53McRlZpslcrbjKBU3HX
         nFsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxcO6PUBk2wrMCUYkkZUTOHPmLGyvEJaade+kXv9zNkfMQsssCP3MaRqTgsY5gFUodLxpFvG3z/fAoWg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywks4UVsV0t+a4Y6iX0UhoVOvB5/Lx/KPeRXcSoAYAjybnqkL/N
	7PgjNyAmVy6XZgYB2mWWiKQefObmPcz2hn2PFbV3QHv8CP3WWDggYFd39WZygQ3dD7WNQDJ4VT6
	A4WOKiDFZcIVhRJZOCe8jw/2ERBy8j3+EynZQuW9sS0dRlSIjzHc5e3FnZWB5
X-Gm-Gg: ASbGncuELZ/adCAWBxy7j7G7gAOj1Qvuf50dF4eZF24CK0kfKYonyFUqfff0MEV/WJg
	EUikNrycQT7UfJ1jBIUoIoQs/EkQCWxMw0quPvKLx83DSWHQ9sfcdWKtmhKL7utgmh1HTYYiQez
	EaWj2sRZ+cG/g8udsaZ2EkqTB/b1Ph74LdnlwHqiO9GnVbAAcLh9L3qxJDbWpR9GScGJ4DrQxLi
	tQbLPSnpT2A2EGvvMH1IcjcH8U2izhO1ngSp4zii++PSNOF5HCpU4DlFTkeQVN95XMLL0sp06GC
	eAFJTJ8PWO/NCtO34SSzhsMvA50ZJVCG/40p2Y62zSQ=
X-Received: by 2002:ad4:5b83:0:b0:6e6:5f28:9874 with SMTP id 6a1803df08f44-6f2c45020bbmr281212196d6.2.1745340136461;
        Tue, 22 Apr 2025 09:42:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhkxVwuhOpuvq8AHrvgiI5QWqG6hL6givDMi15YOYCGirBK6AgyVMwswxh5i/TmbGi6XhlcQ==
X-Received: by 2002:ad4:5b83:0:b0:6e6:5f28:9874 with SMTP id 6a1803df08f44-6f2c45020bbmr281211806d6.2.1745340136156;
        Tue, 22 Apr 2025 09:42:16 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4301:5e20:98fe:4ecb:4f14:576b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2bfd182sm59451376d6.80.2025.04.22.09.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 09:42:15 -0700 (PDT)
From: Jared Kangas <jkangas@redhat.com>
To: sumit.semwal@linaro.org,
	benjamin.gaignard@collabora.com,
	Brian.Starkey@arm.com,
	jstultz@google.com,
	tjmercier@google.com,
	christian.koenig@amd.com
Cc: mripard@kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Jared Kangas <jkangas@redhat.com>
Subject: [PATCH 1/2] dma-buf: heaps: Parameterize heap name in __add_cma_heap()
Date: Tue, 22 Apr 2025 09:41:47 -0700
Message-ID: <20250422164148.547798-2-jkangas@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422164148.547798-1-jkangas@redhat.com>
References: <20250422164148.547798-1-jkangas@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prepare for the introduction of a fixed-name CMA heap by replacing the
unused void pointer parameter in __add_cma_heap() with the heap name.

Signed-off-by: Jared Kangas <jkangas@redhat.com>
---
 drivers/dma-buf/heaps/cma_heap.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 9512d050563a9..e998d8ccd1dc6 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -366,17 +366,17 @@ static const struct dma_heap_ops cma_heap_ops = {
 	.allocate = cma_heap_allocate,
 };
 
-static int __init __add_cma_heap(struct cma *cma, void *data)
+static int __init __add_cma_heap(struct cma *cma, const char *name)
 {
-	struct cma_heap *cma_heap;
 	struct dma_heap_export_info exp_info;
+	struct cma_heap *cma_heap;
 
 	cma_heap = kzalloc(sizeof(*cma_heap), GFP_KERNEL);
 	if (!cma_heap)
 		return -ENOMEM;
 	cma_heap->cma = cma;
 
-	exp_info.name = cma_get_name(cma);
+	exp_info.name = name;
 	exp_info.ops = &cma_heap_ops;
 	exp_info.priv = cma_heap;
 
@@ -394,12 +394,16 @@ static int __init __add_cma_heap(struct cma *cma, void *data)
 static int __init add_default_cma_heap(void)
 {
 	struct cma *default_cma = dev_get_cma_area(NULL);
-	int ret = 0;
+	int ret;
 
-	if (default_cma)
-		ret = __add_cma_heap(default_cma, NULL);
+	if (!default_cma)
+		return 0;
 
-	return ret;
+	ret = __add_cma_heap(default_cma, cma_get_name(default_cma));
+	if (ret)
+		return ret;
+
+	return 0;
 }
 module_init(add_default_cma_heap);
 MODULE_DESCRIPTION("DMA-BUF CMA Heap");
-- 
2.49.0


