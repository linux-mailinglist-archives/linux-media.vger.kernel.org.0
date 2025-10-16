Return-Path: <linux-media+bounces-44649-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79463BE1393
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 04:11:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 282A8480D40
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 02:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAA4720FAAB;
	Thu, 16 Oct 2025 02:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="irYzWRXl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50487260F
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 02:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760580703; cv=none; b=S92NkO66Aiv6W3VOpYKGEzkd5Hwp5ZGW5+D/Rh9KOvixRLhh+IePaHO+EZySiD7Vdr/j0gh9glWh6fUQhB9KGkty9gPW0g3/uo4+N6aDjuHfUMdAsO/btWl6QqQJ5Yf+WGYGnh3krBSlg+Brtgj8z8aOZA1TfVyGhbhOVhjAu8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760580703; c=relaxed/simple;
	bh=+XyzHt2+lndqbVro9NnPUkSykS/KdNffOJt4rBBZ3DU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=PBobGB/74qDjVUFYOT5T3d8/UW7QPBeI/nRDhgKhjQQWZzUAHMXvQH4+ocr83OyvhxSGzkaSe1c3PpDKKtC+momKme/3Ca0L5H42RXpTDiUKBw4Qi5FswA9x3ABW/RDvil83mRaOREG5FSTYAEbi1eUpsPDThq59CVrn3fGa/vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=irYzWRXl; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b551350adfaso150831a12.3
        for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 19:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760580701; x=1761185501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sdptM39vQ4ZC4ul+xKv7N2vDIBoFzhiZ3qTbS/fd4wk=;
        b=irYzWRXlibNEljAZY1RizWQ0zecxxVv3XaFPy64HsuOKsUHASNn+HELJOOWn+WTypo
         VArSfsfFDB4IoY9oeysXvQIWQdtv95KcjV1xLjoC2vU6Rdml19CA75IaQpxSXVOWMEGv
         URgdnGs9/s4QsXozI67yhvfEnNf2MdSfBI1Qs5c48ETPMoVdlmAKInhOndgrXjRjdVPc
         Ym+ocJ8TTtETpgeFHTxrVsdXDSJCarstBjsM4dlMvzI4TOClm8VANgXAAZ5UDcCoRbgz
         Y6uoU4GB7sUcNIgT9hllNsFtJJBFcmlwaJcYlwOMbsdNKcN3N0V6HZZF0xqYblqOynoT
         tMfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760580701; x=1761185501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sdptM39vQ4ZC4ul+xKv7N2vDIBoFzhiZ3qTbS/fd4wk=;
        b=QG6FjUKHQR9Jl0KbNasTx8uL4o4sFyfJ+9LWgI2k6ZY7QuTQLlXcpCfNoo0OnmD1i4
         CTdHGWfix0FZnKTeSl75e4MZNHAL88LPnTdYgjQBg3sx+yOVDKiwbabJoAFqcIzJWer1
         bZ6lLIF62eQJ5LRIjS3i7hfS88w3u75t5xQgdVj+eUfzB2sB/pXYs/E4L75rra1NpVb7
         9a/c1ZNC/ZJdZmEOeVnLdUs9xnODQu4YdcjctnUGF/uc+mZoPcW/FhqJxrkri1O3nXwm
         IT6MnaxG2GK77DKtaJCGwFLKmKccUf9rYEHqG4qhJNknN7e4tnt1OG2edgBG3snoCR28
         Gq4A==
X-Gm-Message-State: AOJu0YylFixNodJtcv5BnSMS0n0c+5k1Gf2TUk1l+a34R3Gxj/GFZ9at
	gY1RZzzszJUvDqBQJf2HyjJjARmv3syXWuTM12h5l81eoSymvu2B0XlZ
X-Gm-Gg: ASbGncv6fpOqM34ReIm/ogqzwtqwpQmiEPji9NsCqjvkoPhCSQPwYzDFUktM/+LP7sO
	1nH/Iiy/hBLmreuUfysXA1BEpzKztqqCz4Wi22iVh0LSaWwjk2lVJIvVXkBjzv0/L9tp3YrYwH2
	pPTol+Tf9iGRoNbAoRtoj/5q+DeDYEmcTV21uLXg6s+cBI3OzgfpDde877/kIg8paxCNOSP0Hu+
	+mld+jGZgjDvKsStuUnQKRYt7mGWzjyWf/NWed0yBnfwmoxV5G8HVO9X0R2Dgl3Zpjd3tjmcj2h
	4YA2LQJK3A+oFoYRncCEsUxqnbAVnF8U8CFYJLD0Jx5ofIAnl5yQumTYCaY6IabjRyHbjSyYgZw
	6XOHT6NXYDtmUflBfzDZFk8jJxNy2Nxy0Z4Lam87nm2wzrO4T3C7H2qq6O8Ze3jfvobLdYDl1Yd
	GThjzqh4pemYByV06+sp1Ts6Znpa0V17RQ41BGkr8=
X-Google-Smtp-Source: AGHT+IFbCTTdrxHYHVaVBnRH7IgNG3/mtcqYbWJHh1vVVuc/6HuS6Iye7V7sP+9RojodPULKBM28tQ==
X-Received: by 2002:a17:902:ccc8:b0:271:49f:eaf5 with SMTP id d9443c01a7336-290273ecb42mr374140105ad.30.1760580700864;
        Wed, 15 Oct 2025 19:11:40 -0700 (PDT)
Received: from crl-3.node2.local ([125.63.65.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099afdcc2sm10397715ad.115.2025.10.15.19.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 19:11:40 -0700 (PDT)
From: Kriish Sharma <kriish.sharma2006@gmail.com>
To: sumit.semwal@linaro.org,
	benjamin.gaignard@collabora.com,
	Brian.Starkey@arm.com,
	jstultz@google.com,
	tjmercier@google.com,
	corbet@lwn.net
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kriish Sharma <kriish.sharma2006@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2] htmldocs: userspace-api/dma-buf-heaps.rst: fix block quote warning
Date: Thu, 16 Oct 2025 02:09:12 +0000
Message-Id: <20251016020912.1653230-1-kriish.sharma2006@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix the following warning encountered when running `make htmldocs`:

  Documentation/userspace-api/dma-buf-heaps.rst:29: WARNING: Block quote ends without a blank line; unexpected unindent

Added a blank line before the "Naming Convention" heading to comply with reST

Fixes: 507211e3c7a1 ("Documentation: dma-buf: heaps: Add naming guidelines")
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Kriish Sharma <kriish.sharma2006@gmail.com>
---
v2:
 - Corrected the Fixes tag per Bagas Sanjaya’s review.

v1: https://lore.kernel.org/all/20251015183402.1649988-1-kriish.sharma2006@gmail.com/
 
 Documentation/userspace-api/dma-buf-heaps.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentation/userspace-api/dma-buf-heaps.rst
index a0979440d2a4..c0035dc257e0 100644
--- a/Documentation/userspace-api/dma-buf-heaps.rst
+++ b/Documentation/userspace-api/dma-buf-heaps.rst
@@ -26,6 +26,7 @@ following heaps:
    ``DMABUF_HEAPS_CMA_LEGACY`` Kconfig option is set, a duplicate node is
    created following legacy naming conventions; the legacy name might be
    ``reserved``, ``linux,cma``, or ``default-pool``.
+
 Naming Convention
 =================
 
-- 
2.34.1


