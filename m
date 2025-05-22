Return-Path: <linux-media+bounces-33204-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EC1AC14A8
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 21:18:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52AF51888387
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 19:18:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BB3D29B8C5;
	Thu, 22 May 2025 19:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BJARz9EB"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A946829B208
	for <linux-media@vger.kernel.org>; Thu, 22 May 2025 19:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747941294; cv=none; b=J5xjWHxwGKWQ/5jCQopHtTwIchDgtl+bvRM4SLcIzIaG1zeOKq6BpSErSmOTojcW2EUfTlpJ8ewc6EEvSZG6M7E89TDGPKLi2X5lh3ZzuLF+FL2RJnO8z1mN+aZti/cMIIEH0Yq88MezEgjjmQCYDR2zQ7Ux6hEDiT0+uB5y0mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747941294; c=relaxed/simple;
	bh=sfBmd1OBbJI2abcZpauJWCnwwx49LFyiSAV6mfejFhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Va3RxmzDg+LmFn9nxW7tbAsA/Rt2R55fHd/MsMWxBxhbSM3A41Q7jzesaO635Mbka3BwcaUEp4l9XLCcZJ5gslTtV9RNeTRxOvHgktKC5455n30uIHKD448FWDutC8yk+xdwSdK1trCoQJembTMgraQ2Ez8EHj7ELG/zR7+jqCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BJARz9EB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747941291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DslNlnyYeBMO8E0a4QEwSeg6EwzYfoV0u5u9NaRMXyQ=;
	b=BJARz9EBv9wdayT4HHRjAoPCnyox5xzJGuuummINN/Lac68j6vtM8EJZm3c1kjYmS81RiF
	MyTTs08w1D8aydsQrjMAq8NzBLZYyct8pe6bWOU025TlgX3VMsAKJjn0j9DrUhQGUkCd6Z
	IkjYN7HMAmm7mWQi4rII6aOjTvxEYkA=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-33-FOqRSuoeNaOa0guCM7NJ6A-1; Thu, 22 May 2025 15:14:50 -0400
X-MC-Unique: FOqRSuoeNaOa0guCM7NJ6A-1
X-Mimecast-MFC-AGG-ID: FOqRSuoeNaOa0guCM7NJ6A_1747941290
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f8d0c8e917so47303116d6.3
        for <linux-media@vger.kernel.org>; Thu, 22 May 2025 12:14:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747941290; x=1748546090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DslNlnyYeBMO8E0a4QEwSeg6EwzYfoV0u5u9NaRMXyQ=;
        b=TZXfubO/FISsJ5dXTv2lEIMgq2UmfbKT/kjBJ2X20S/KJFayeqctXkU1PWMorhnmuc
         AyaY88k4tKc8CfReLqa/iMC+YIdMkQzCpn3KqAxqUQ6USCOAa+T78bqdEpYgThMnZTEb
         3+S/PljDdf7bqAxxwUSwWAVd3kuKT3zjBnSZE8usWlFmNxpUBz59zEkKGrjWXxKu294t
         DUnbVSM5T32JnivjpsBhprkgh6rJYAqr0FxK64kPPdDrFlWlLk9//A722eenCIMvPoTH
         Hh+9DgrZaFbwbHaiFS/yFNwtiac8YsGvuA7iLymsLCdYEvufuH1+SHVsDWSUHEUVWzV/
         ZRIg==
X-Forwarded-Encrypted: i=1; AJvYcCUNAkoIb8z2+ZR5P0uKUpGWHpyExU/Pcqxif7UrMe+O26XhRAPh4RGKm5Kv8UsuboWZp7W/FF5flnKkwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqRtQJwpYnEA7mBKsB/RNXGYrplJleotjBX6MHBzpW8Q/iijSR
	0UAaJm4kFaM1HwyCBv3QUfweN1VzIZ3UKg0FKzPnp9jwyIv8vaDdZOHGV3i41iUgC5v7fmtHjdD
	46W1dsRdrQ4bu2d0ZWnDHkS5IBClGkEDvEL6Hu5nWdBf05x8kc9Ptk6oOgpvWrfzK
X-Gm-Gg: ASbGnctaiJ+pjCHF7ohF3ozai9bcb38zSxPbh7bumWdNdUEXiHza4V0q/bscjDCtdkJ
	C1mY7h6wbZDjJlZ1Puwx3Ti+UFi1JrfB7qGuinRrdOI+YdytKDTMUT+wOEbeorzdfifEvZ5IP4v
	KFyYGe60iU3wHXPXphErEl3joUZqbxZA5TpkSWLeemdcfujl4sGiSG7LPu4eZXaG+vczg58W5k3
	JYiaJjtvufBqiHjgQVVmpYgJypMMKDqop0RV2oI4FwxQ42miQAJYqADAW0GdtVkT63loiTKG2v4
	lhVqf50JrhULdxRLV+YA1w1kexCYLS0fltzpngYGGA4=
X-Received: by 2002:a05:6214:d03:b0:6ed:12b0:f181 with SMTP id 6a1803df08f44-6fa93a3329fmr5223796d6.14.1747941289860;
        Thu, 22 May 2025 12:14:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUDT8yQqi4n4RTYXy8azlp/sJFJlAyhLHZ60JNEKpweDC9ye+5j/Kk6h96Y/dCMxu9PAXk8w==
X-Received: by 2002:a05:6214:d03:b0:6ed:12b0:f181 with SMTP id 6a1803df08f44-6fa93a3329fmr5223506d6.14.1747941289482;
        Thu, 22 May 2025 12:14:49 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4301:5e20:98fe:4ecb:4f14:576b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b08ab862sm102862916d6.38.2025.05.22.12.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:14:49 -0700 (PDT)
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
Subject: [PATCH v3 2/3] dma-buf: heaps: Parameterize heap name in __add_cma_heap()
Date: Thu, 22 May 2025 12:14:17 -0700
Message-ID: <20250522191418.442390-3-jkangas@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250522191418.442390-1-jkangas@redhat.com>
References: <20250522191418.442390-1-jkangas@redhat.com>
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


