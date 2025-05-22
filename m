Return-Path: <linux-media+bounces-33203-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D38AC14A6
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 21:17:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 634FE9E3F7E
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 19:17:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 511DD29B222;
	Thu, 22 May 2025 19:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jbzt6fpa"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC114287510
	for <linux-media@vger.kernel.org>; Thu, 22 May 2025 19:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747941292; cv=none; b=hhGJDoEnUVvZCzRC6APlAPzUinh8Znt6PidQ8rSur4HXptsOazue6EyWMeK4tNf6l+28yWQ+wlaFEeTJceCZO+H0YwejNnF2Oqb752K2eZCd17y6sTli7khBavlyJnINWqY6WlhDdwB2hkadfUmfh4hcP+2rbfRno7gM5O09VfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747941292; c=relaxed/simple;
	bh=48KOU03C6ig9fpKOv9cqZfxnQQrj+t5IAgMqA1jMLOo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UnTSybIdnViQIYkjHYt6ltPPLuXyWJ1TPcusOvz3YokMnQe3ELOuhniKJDKA7vNAfZdM5tRdm+RBj3l1rYkvJBmhkBveo/HNYUtSrDjYKZNlHY+eFb1rkSy6bnC3vIa9iQpcpF3gM04dnWxuMKBYg69OUUCS+Emjh+fGCOWY3sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jbzt6fpa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747941290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DxcIBXbY9aD24z/Sdb9axXzItBI4qzUHLrNE5Q1QDjU=;
	b=Jbzt6fpa4hEL/I0anAdP3/cIGmY3OjegBxYoC2HBVCyuMNx5Fm3wOIlnskTZdaTF7rC5FJ
	5+EP+8pYInfciVcxSMnWG1enGvrb8/YDveM6FQ9+f21fKO2+Srkhl6E7ELikREjIHWPg9d
	0CXAFFr2nsrP4vPJb/DNOwEXbGa9sO8=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-eHRjWPakOHivWizJRhkG9Q-1; Thu, 22 May 2025 15:14:48 -0400
X-MC-Unique: eHRjWPakOHivWizJRhkG9Q-1
X-Mimecast-MFC-AGG-ID: eHRjWPakOHivWizJRhkG9Q_1747941288
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f8bdefcb39so3567406d6.0
        for <linux-media@vger.kernel.org>; Thu, 22 May 2025 12:14:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747941288; x=1748546088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DxcIBXbY9aD24z/Sdb9axXzItBI4qzUHLrNE5Q1QDjU=;
        b=iP05iJAKJ56zcyxCSqZ3hN18mKR8S5x995rynRZj4nby17FjCLJdWaxZV1WqQGzVCV
         J4AO2Cc6ril1jFuNwiABao3aQ042XxV0Q1jn2gpfjd4mUxkqijDEdRaZzQK+OScyPNq3
         j+HirfsIt/1pO9jQg6ehxFIIYQ1v3xubiII8EmngoodU8pDlsbQzo2JYg33TOihJ09Y8
         4PZZ1BVTa4UJKytJXSC+E6h2wV6kZIBJj/TxnpKJEXpvH+28n0/vLfM8gEEyE2U58hfv
         evdtglSRJ9u1fctC35T5obvtbw03USOC5KR5mFPYPs35f0ky+F+el7fBDbEFVECcVpX9
         Vi/w==
X-Forwarded-Encrypted: i=1; AJvYcCWxmMaIPb3qhCQfbCfIk/jzqLj5Ua0TTinq++TJC/bbMoHksoxDaSLWtM35d2NEvjK1E9P5Qs7ofb+Gbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFPMK7Qr05sUCHhDdomTjnTdvVUUjsb1cBA+Hv/CjU2jHaYA4d
	F/IsvSHG5AeFvB9EmlEVatcwctGbcWA2rsLGE3ImZbIn7ktqXy1aBenM0DpEis30O4wH58zmcrz
	w1dAfRh/X5m6mYPRV285pgI5vhGS5op6540+wa5m1+NinDkEi5gYuVp6irq7hpm2f
X-Gm-Gg: ASbGncuCBMsIb+v/9envz5rY253Szg8Qm60lOQhaTt4ceoM01XMCqAKG04MCekCSaXl
	jSkq37ZjlSiNPhv0HNVGbNrhSWLHsz/tVQvAMH2jvI7YK47P3BkHCPCvImqLCryTOhFqb+HE37U
	P0sWQDgkd90S1BWFHtl2uK5N6sBTQKr8+GZDh+MfEZ7e5eoUYCtOvggan+OfAgB5tKnbROA2LGW
	OwjqHXDt0tgkzGqm+BYWAt5MR3bncVUsEt/S1/Q4cN/luMQC7OvaCGvdzN2NqoCP8Q9t7KTiSo9
	rObmuLda3cFG7ycvmxpk6lNXeoLkYoGUva5NYjOcMtY=
X-Received: by 2002:a05:6214:21c2:b0:6d9:ac3:e730 with SMTP id 6a1803df08f44-6fa9359ba0amr9187946d6.5.1747941287818;
        Thu, 22 May 2025 12:14:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXDudy5Pg6bUCPRtP0KahbCyP3R5ipmAB0kn6jEZFdIdpWn2q6/ZPEaqhoAbgeWBZfIF4h6Q==
X-Received: by 2002:a05:6214:21c2:b0:6d9:ac3:e730 with SMTP id 6a1803df08f44-6fa9359ba0amr9187686d6.5.1747941287499;
        Thu, 22 May 2025 12:14:47 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4301:5e20:98fe:4ecb:4f14:576b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b08ab862sm102862916d6.38.2025.05.22.12.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:14:47 -0700 (PDT)
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
Subject: [PATCH v3 1/3] Documentation: dma-buf: heaps: Fix code markup
Date: Thu, 22 May 2025 12:14:16 -0700
Message-ID: <20250522191418.442390-2-jkangas@redhat.com>
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

Code snippets should be wrapped in double backticks to follow
reStructuredText semantics; the use of single backticks uses the
:title-reference: role by default, which isn't quite what we want.
Add double backticks to code snippets to fix this.

Signed-off-by: Jared Kangas <jkangas@redhat.com>
---
 Documentation/userspace-api/dma-buf-heaps.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentation/userspace-api/dma-buf-heaps.rst
index 535f49047ce64..23bd0bd7b0654 100644
--- a/Documentation/userspace-api/dma-buf-heaps.rst
+++ b/Documentation/userspace-api/dma-buf-heaps.rst
@@ -19,7 +19,7 @@ following heaps:
  - The ``cma`` heap allocates physically contiguous, cacheable,
    buffers. Only present if a CMA region is present. Such a region is
    usually created either through the kernel commandline through the
-   `cma` parameter, a memory region Device-Tree node with the
-   `linux,cma-default` property set, or through the `CMA_SIZE_MBYTES` or
-   `CMA_SIZE_PERCENTAGE` Kconfig options. Depending on the platform, it
+   ``cma`` parameter, a memory region Device-Tree node with the
+   ``linux,cma-default`` property set, or through the ``CMA_SIZE_MBYTES`` or
+   ``CMA_SIZE_PERCENTAGE`` Kconfig options. Depending on the platform, it
    might be called ``reserved``, ``linux,cma``, or ``default-pool``.
-- 
2.49.0


