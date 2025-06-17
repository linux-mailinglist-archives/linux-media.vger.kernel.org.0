Return-Path: <linux-media+bounces-35034-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C41ADC3C8
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 09:54:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DB2C3B59BE
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 07:54:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39B8B28ECE3;
	Tue, 17 Jun 2025 07:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E+smzD/V"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5CE28C2A3;
	Tue, 17 Jun 2025 07:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750146891; cv=none; b=jDxgJVh7gRKVLHgrXLwCqgFE8qSQB68olvJ19QkwVaeOnuKZRmU5e0Hvod2RGYXsRwdi0oVo6kU8SsswSPxDMwB/REqwEhrrhu2yeJ13dz7u4DFNQwxsDWsC0f8h1BLTt8R8Cv8ChLTkWKG0DDiqEq9UEMmksrtdcUJrG7G5yq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750146891; c=relaxed/simple;
	bh=Vr8r8M4ron0H/w8OpKBJSzyyhy7tl6sw2WOfKBrtkuM=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=G3Bqb7jROWVMrFJ/baXNXkbWb30iTKe1qXj5tpzXZozqpkVjDtt9PFCY9DtVUzb+NEtHjuqC3Q6cG6tvNTEC1A6scI0w9vcbUlhcnvdy2TjwRVGeuI16h+MvGtN4flnIC5YmD1HHA512++yeUxJCP0cYhjYi3ASj54OW87qq3Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E+smzD/V; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-adb5cb6d8f1so995515266b.3;
        Tue, 17 Jun 2025 00:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750146888; x=1750751688; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=snpa4M8wvjI3Jt75dD0dm1cl3ZvZlE8jLqCZvwug+5E=;
        b=E+smzD/V0fno4AkmEz/w8QnPKxkWg5I3NbGadSfueQaLhPhS64Td3wMQaO42WjmE3v
         H2DHqxy1nxT3BjQVeMOFlZx6WIUT2W+4eDFZsUvHzFOrtJQSGnOLlYI3QtjSsKZIoOAp
         39lx2n6T8BZY06UUQyRRC44Quu00E+JTJj8vZXV0v9V1KzKvK3e19cMMC5vRXkA84qpx
         ewiuxwRvPoaWfuT5jwh+LubqQDDx5mNDaFHABsFGG2U7VNMh8CADHG9xFa3/TIFKMMpM
         rJ8WVOptjX+yQkMmpTDyjiYFwNYz2oau27Ul7u2WE7D5FdDzVqbZPK57fUnG1QGW17VK
         DjDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750146888; x=1750751688;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=snpa4M8wvjI3Jt75dD0dm1cl3ZvZlE8jLqCZvwug+5E=;
        b=dN5TB7OawBAItIFHdZ4zg5OBDM5EKxT6VlJFZm4TQRRG6tlw155hxSd1fgNI3s5STz
         9w1My1qqXzIkGM/EFi8ZJhRGuXst94c+LZGR3w0q6A3pB1dT4o6tRkFQGoKd40M9VD8i
         zochnFoZ3BizNie75G4VWoViTMrsFDMDiN3yJwlbhtGB3UK8LF7bLBDAyAwLqVdKrdZH
         yZUhOvS8f+vWwt8a866JwvIOJbpqzt0lYM5ay54wQWztFfIRityi9K8NKE4EnNLA3bXu
         LCKOB6rmW7XS0IjfBomSblc8399iFAB2qRRImsHm5ZYPBMwBe5mRRzrNaQzT3N19qmIz
         Tfaw==
X-Forwarded-Encrypted: i=1; AJvYcCU55BOd/vEHhtMTt0uh6mOz18LpI9FsEGRb1BKo/dWugkVU7eV6ajqZC+jAKYlShTWCP4oSW0kSCbBUnXM=@vger.kernel.org, AJvYcCWNiWACIHTT1NsmfkeCNVEXS+eghsnVA/TUpxaZUQkDffc3TqMthr9/hHF0A/j8dyZI2JDnFw1Czkr/4jE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtujFdA3w1NjvCyNjAhGoqRCFzJBBvC5b/pvStdSfpLL/5xOuB
	Tc5JbB+tuOznQMRPgEOfT9F4rXITuAG/IUTaasGS1EndDe0QnfXBSWnu
X-Gm-Gg: ASbGncvQsxrrpKK9yx5QtQUNPlnxu4pGOhiPXmsxMfjPcrSJ8IVaRymG+uwn1jea8Rs
	qOVzWJqLHQdcGZhHXNELIXjINhd/z3OfdWYYBfzN8jVVfx6mqg4CC/L5KovwxBHqQXL/+JnSfUi
	/RIkxVQ4KIocEeB7YS6LBeofG3+1R7umnKKstDDfFt+rwJjqoufDiO0tbtQH7yv/gJarpU6mZFO
	H9Zk8CootqHCYi+hDM7XsHuR5ID8TLAk4oeyfctocDFZ2z/Yi7pZ0XNXPSB3vUVW+ivfSlq01oC
	v8ekJE4Lq5vloXM7Pz3UITsb8WUYdqRr9X7FuoSbicPg1KYKQ886bfX6HP8GMA0jZZV9qG8=
X-Google-Smtp-Source: AGHT+IF0cbDvyG9t5QpTq27y/7w+0VC3HoZnhZqn97hCN4lYvqiTDzZEXF27gVaRsT2gnTXMxW0ZoA==
X-Received: by 2002:a17:907:2da9:b0:ade:4121:8d3f with SMTP id a640c23a62f3a-adfad29dd50mr988779666b.8.1750146887636;
        Tue, 17 Jun 2025 00:54:47 -0700 (PDT)
Received: from [10.3.15.29] ([217.19.38.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec81bb9cesm807842966b.49.2025.06.17.00.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 00:54:47 -0700 (PDT)
Message-ID: <43a834c8f871f8719368b3f3239f27ee4f6c6286.camel@gmail.com>
Subject: [PATCH] ARM/dma-mapping: invalidate caches on arch_dma_prep_coherent
From: Christian Meissl <meissl.christian@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Russell King <linux@armlinux.org.uk>, Christoph Hellwig <hch@lst.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Date: Tue, 17 Jun 2025 09:54:46 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

since switching to dma-direct, memory using DMA_ATTR_NO_KERNEL_MAPPING
is no longer allocated using the arch specific handlers and instead
will use dma_direct_alloc_no_mapping. While the arm specific allocation
handlers implicitly clear the allocated dma buffers and will flush any cach=
es
dma-direct relies on ARCH_HAS_DMA_PREP_COHERENT to flush the caches.

Without this flush video frame corruption can occur in drivers
like the coda v4l2 driver which explicitly sets the DMA_ATTR_NO_KERNEL_MAPP=
ING flag.

Fixes: ae626eb97376 ("ARM/dma-mapping: use dma-direct unconditionally")
Signed-off-by: Christian Meissl <meissl.christian@gmail.com>
---
 arch/arm/Kconfig          | 1 +
 arch/arm/mm/dma-mapping.c | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 3072731fe09c..7a3aaf3a490b 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -14,6 +14,7 @@ config ARM
        select ARCH_HAS_DEBUG_VIRTUAL if MMU
        select ARCH_HAS_DMA_ALLOC if MMU
        select ARCH_HAS_DMA_OPS
+       select ARCH_HAS_DMA_PREP_COHERENT
        select ARCH_HAS_DMA_WRITE_COMBINE if !ARM_DMA_MEM_BUFFERABLE
        select ARCH_HAS_ELF_RANDOMIZE
        select ARCH_HAS_FORTIFY_SOURCE
diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index 88c2d68a69c9..bde7ae4ba31a 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -1821,3 +1821,11 @@ void arch_dma_free(struct device *dev, size_t size, =
void *cpu_addr,
 {
        __arm_dma_free(dev, size, cpu_addr, dma_handle, attrs, false);
 }
+
+void arch_dma_prep_coherent(struct page *page, size_t size)
+{
+       void *ptr =3D page_address(page);
+
+       dmac_flush_range(ptr, ptr + size);
+       outer_flush_range(__pa(ptr), __pa(ptr) + size);
+}
--=20
2.49.0

