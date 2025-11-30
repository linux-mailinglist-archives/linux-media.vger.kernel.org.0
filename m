Return-Path: <linux-media+bounces-47899-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8ABC94EA8
	for <lists+linux-media@lfdr.de>; Sun, 30 Nov 2025 11:54:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F3BBC4E1F91
	for <lists+linux-media@lfdr.de>; Sun, 30 Nov 2025 10:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAE96274670;
	Sun, 30 Nov 2025 10:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LOpbfreA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CC326B2D7
	for <linux-media@vger.kernel.org>; Sun, 30 Nov 2025 10:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764500093; cv=none; b=Vzj7e54tqEQqEGX9TBectd+UKGr75xDKUdVtZAxbE3f9ePYskj/U7AyKMq7fBlxy8PEMpG2dEh0COfXqbXDz6LbKz5zRDqUJ+9cAZXALrUuLNlOHNv5U9Jz7QCnueq2+301N+FnGAyYunCsvmQJNFemfBuY0fF24fJKrM4sTQpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764500093; c=relaxed/simple;
	bh=L1sxHs09QWy2TJzSq9uN8ZU47i5n+r4cLPph4KWc6+w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gjoUKW8MzDQSEm/mMu3u4ME7fhQuyMkPWFM/c2AhcORQhDCZlMxWmISIdCtuWH/pO8Z/tV2EY/lScSXwphv/h0QE3IBU9Ij86RTQqer9hwqEX8zurxRumBxY4YOn7ImwX5HUVgLqSBMyqOKCnl5A5PN3HvvyNM6q29JeZMBvDdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LOpbfreA; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5959b2f3fc9so3033447e87.2
        for <linux-media@vger.kernel.org>; Sun, 30 Nov 2025 02:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764500089; x=1765104889; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dOSBjcoOnlyTQvfFFh+eu9Zfh6ZQd1i1HR+OFbVxZQc=;
        b=LOpbfreApDoGhiz5lgl1UmFQVR6isKX5qy+zl2WR4aX4uKrzjMhbsRu9tOCayUbsXC
         KB39RDHEyzUEA7cUXRrV9NxWJMnCHw12U8HDbo6VYZkm+x2MtpnwwoeSgfe3fIxBQNSZ
         OJdes7emB2C8OHe0bTx5F/NXIKeC5RPPbkaVPmjWPqOYmn9E2OssT2AxZPHbLGHi8jut
         S+bbJpLEqZHVxylHqD/h6yLjfRl0yDrPpS/OekClZTsd+b3sCl4ecEk1runLOunq5Q2+
         SX3MtVkGjTo2AtMekGSgb05ZBpL0duu/6M1THKij2YdagC3krTJeLlp6loD/L9IxlUBB
         wGiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764500089; x=1765104889;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dOSBjcoOnlyTQvfFFh+eu9Zfh6ZQd1i1HR+OFbVxZQc=;
        b=J1tikuflU9JgMXbLeCSl6Z3zmsvY6G0Ct3A09I3YCzzuJVuFuYZeQV9GmRAH3YVMBf
         Zbv4arsPCo9zUy4tnK4MVEoT00YE/H48B6+CAIJ67BmAtdMOC2syPlBGT2jVbRHyTVlU
         fXsY9/1/W8DxTX3TQwkK8UU10YbGV2T4wW+MRRzEKKK657hoLdipeLgm5CXoz7sZikX0
         RXRRHQCZ7QW36T6ilNrSNRTNzRh8sPobmTkDdJdspWjnBUQ6XRqMByqZgMOO52SsnCyR
         FM+z7qkWLXzvLng2zhxBon5LXuonD69QttdpiQD0+v9lFZFvuLD7dCSpR1vT/k3wNlrO
         L8ug==
X-Gm-Message-State: AOJu0YzPRRJt/EOBtinIKziIDP8LYccPHinoQwUpBWQSUzNHntKQ56OL
	Z5pW3jCFibrhb/YYMmeY8cdvDY9T8j18GzuQ3RgEtji8HM4g2zdSdBQLAPY6wt0o260=
X-Gm-Gg: ASbGncvV/6ggSUL5xc2zgluCg2HxHRpGOA5P+3VyOZa2jknVxyTGm2Y/ODD0vMDLYgT
	KP2AM8mSIx6/LJSrgrOVqTEu7JtxdS1/f/LlL182BGWAUi2IY4e6m6xTuA55YCcw3bRw7GLQTPB
	CMEe4goQ+L44Q/MA6lcDNRGs1Jl0+LExfXYKBDwOrCdD7+viCdBQkY+RuzGdgV8VOzkJwM3t6m8
	ysjxyKrye94xGGfinXa7k3zqmQ7IbE8bB7hj0OoVWbqutqD50o8cAfiks8xs28Tjm/ynjcktt5h
	lr5v7+iaEPIPS9q2moNu9Ss88oyZmgh+0wlpojTZiAz8l0o3BZTDzhiK30almVq3bJOhSzw//X5
	HPikPsRvlgDXLYmSusCA+ThkNIFMrQ9D7KEYk+ybz+nHfvXzlTGJmNAYvQlOYV4qv4uo9LQyQup
	2VLULDla9XdxkUQVdIQdR96w==
X-Google-Smtp-Source: AGHT+IFq1IN29e+3yywBpe9PVvbAinfdw0+qXi1MtIWv/v8nCdlDFCMMUU2tdkAh+KiyaMZkqBd+jw==
X-Received: by 2002:a05:6512:3096:b0:594:546c:431f with SMTP id 2adb3069b0e04-596a3ee5548mr11152417e87.49.1764500088979;
        Sun, 30 Nov 2025 02:54:48 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bfa48cc8sm2710565e87.83.2025.11.30.02.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 02:54:48 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 30 Nov 2025 11:54:48 +0100
Subject: [PATCH] dma-buf: heaps: Clear CMA pages with clear_page()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251130-dma-buf-heap-clear-page-v1-1-a8dcea2a88ee@linaro.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqDMBAAvyJ7dsFsU7F+RXrYxE2zYDUkWAri3
 w0eB2bmgCJZpcDYHJDlp0W3tYJpG/CR14+gzpWBOnoaQy+cv4xuDxiFE/pFOGPiqpEdnKNHL9Z
 bqHXKEvR/n6f3eV4/1KeyaQAAAA==
X-Change-ID: 20251129-dma-buf-heap-clear-page-248bb236e4c4
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.3

clear_page() translates into memset(*p, 0, PAGE_SIZE) on some
architectures, but on the major architectures it will call
an optimized assembly snippet so use this instead of open
coding a memset().

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/dma-buf/heaps/cma_heap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 0df007111975..9eaff80050f2 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -315,7 +315,7 @@ static struct dma_buf *cma_heap_allocate(struct dma_heap *heap,
 		while (nr_clear_pages > 0) {
 			void *vaddr = kmap_local_page(page);
 
-			memset(vaddr, 0, PAGE_SIZE);
+			clear_page(vaddr);
 			kunmap_local(vaddr);
 			/*
 			 * Avoid wasting time zeroing memory if the process

---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251129-dma-buf-heap-clear-page-248bb236e4c4

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


