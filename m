Return-Path: <linux-media+bounces-48234-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 661A0CA420F
	for <lists+linux-media@lfdr.de>; Thu, 04 Dec 2025 16:00:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 40410301F7EC
	for <lists+linux-media@lfdr.de>; Thu,  4 Dec 2025 15:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B0D4285068;
	Thu,  4 Dec 2025 14:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hZL0mYGB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1107F26E71F
	for <linux-media@vger.kernel.org>; Thu,  4 Dec 2025 14:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764860398; cv=none; b=VtTFGNQeJnk4YDZA+wUtBrWxvZpOvuR8sGuw59ioqrKHWilw0zXej0RKMR4GMS6R93b4yLq+MOszvbWuWhYzpf5wq0jmoQoBTPd1YTRZ4iBTpxbFQQXwEI/MPX1dEtWLm/rZaj62zOrOfG4vu66DygE7UHagB4N5ueA5hN/jhOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764860398; c=relaxed/simple;
	bh=pkiLUcd5lMA2ghEDaPhmFGvnSCD9uXVXplAFWew63L4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mti39aIAYKIID6nG07ShFdJmGGjX/gP3V5PPonPuM5E1SohSyjPjXQ8uk+HgfQSJgWXc6lnyFeZ23U5NMsGMy7c2oUzxh/iQxhoOORINuwpx4fXSRZSOHbh0/LB6NVx86ZB5ojkXz2dCNDi2XEXCDHZejyPRIZ6qEnKi7RDLLqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hZL0mYGB; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42e2e445dbbso547638f8f.2
        for <linux-media@vger.kernel.org>; Thu, 04 Dec 2025 06:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764860395; x=1765465195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xFWFQJyqNEArb97bML7scQOt1LXkeAlqXlQJNt06ohg=;
        b=hZL0mYGB9Rci+UMm+heN7nqyA7GMTatNa93NUg+kEzgfd1p9ndOjJLgSetTdsBZVYg
         S6mUWM9hZhLGD4yKBJy6iKMu+Jt4D3I3S2CO8zlxjKG2uoaKO9Kuf83aUDpwd/5adcZJ
         CNkopo4pzjM6rpJ0jHNkr+8aibS8AZ8Lz2SZmMEPiFz7kETUkxcbTF0takw2+0cXc/Gw
         2P2QuZDGh0SShqB5RtUkt0QMx25zVZuBy/pLXMtr/xrW3X91tnZjf8C6DzaJu+2GYmj1
         rrYpQEK7TyqipcbbXx+vVxa/owjVL5qG3GPUf49Qi9fCUHdtjSMee6hpCjNDhxlcEq4B
         E5aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764860395; x=1765465195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xFWFQJyqNEArb97bML7scQOt1LXkeAlqXlQJNt06ohg=;
        b=o6rR6nj8Xv2s04I1WU0ibUBuBC5C6u4+GIPFpGjkjDn4C4F+CJ/DNSZEITNwfY4E5R
         jIJjNdT80hkQ+b7oe4La/T9Dj9iAVYyLFmrVZQiYH/fK+5LtsHvX/xucBwZT/jmJCr7h
         rjt+1YTsmXdWIPtTtLf8qq/NaAF4jexYKrZtanAYj+wfRI/wqHXWiI+hYg7W9fNfoZRM
         Qv/6ecq/j7tm2irmv2OUqMDTBi8nimaRsmHR+zE3J7W67M3qmGk1gJMAhaiHkgJ9jqi0
         SQUU2umki3r9Xx6TuVmUmVIDQZS1xwp6+0iTlbK7ER1zA07OBI30i26W1S2sWS3/svii
         yTnQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8gd/GMuXqXaY+MMKtjf9BGoUbusrPF8quPmSuuAu8OE7RYfbzP7i6frLiVPq8Lj2kIIN23SSzHgmWAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuVsAQCUmcVfkREToZEF3VQCfHe9ZlpvtlcDh6W3Aqm4RTfSrL
	TjEpid8l5ykJO1BeqiTXS286v4G2M/8IAVroM+fVjBLRNlSs6kc/wDeU
X-Gm-Gg: ASbGncsAp9WSW7BM+Tj19fja+g9IAN2bx6k8hN5gVwmd/Dj+Kt3vOI4nrK4N+PfVBd/
	TEKLgxbBTWlvwsFTu3SLwuorvEROOOF3X/gN0Nm5ur1zf6ryMStuENph9ogBHSWB06h7HOI6t0S
	spxFZyzRdl53hchneilZ7Y8a+1xuSfzx1DrurpGCWYaxIsXil3rfNgaZ9LAOUEQFsfAxwbPiXAw
	/+KdjAbzrG1xXCrfS9Nq/WneSGe8A9XUchayC41en+pXfJWh0KLybeQCPkQRmhe1ivqbKyyFN/v
	AYgFC2xvgwfFQW6LddO52hxJyWWeRi5b50lETCV8PzsHZqs5PKuu0vetKeL8pibMv6oiXWTPmof
	EUHSuMnq3k+TPLCocuDpZ507+zIWQOwKVYR1UueaJNHJgEeo3RENGQrj/hidQu+5XZntMG8FArE
	Vomwwj5wL/jZ8iLdJLE4iq39qeZ+jvxYy8uQ==
X-Google-Smtp-Source: AGHT+IG9v9h20E8VTHUoLcKatGxvnYbRKazdI61G/E6P5Z/sBf3V209yQKFoFn/ZFKs2knJoDlVqew==
X-Received: by 2002:a05:6000:2905:b0:429:b8f9:a887 with SMTP id ffacd0b85a97d-42f73171e51mr7463511f8f.6.1764860395251;
        Thu, 04 Dec 2025 06:59:55 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:1591:1600:c95:ff70:a9ae:a00c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d331af5sm3473291f8f.31.2025.12.04.06.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 06:59:54 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To: sumit.semwal@linaro.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	simona.vetter@ffwll.ch
Subject: [PATCH 2/2] dma-buf: enable DMABUF_DEBUG by default on DEBUG kernels
Date: Thu,  4 Dec 2025 15:59:52 +0100
Message-ID: <20251204145952.7052-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251204145952.7052-1-christian.koenig@amd.com>
References: <20251204145952.7052-1-christian.koenig@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The overhead of enforcing the DMA-buf rules for importers is now so low
that it save to enable it by default on DEBUG kernels.

This will hopefully result in fixing more issues in importers.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
index b46eb8a552d7..fdd823e446cc 100644
--- a/drivers/dma-buf/Kconfig
+++ b/drivers/dma-buf/Kconfig
@@ -55,7 +55,7 @@ config DMABUF_MOVE_NOTIFY
 config DMABUF_DEBUG
 	bool "DMA-BUF debug checks"
 	depends on DMA_SHARED_BUFFER
-	default y if DMA_API_DEBUG
+	default y if DEBUG
 	help
 	  This option enables additional checks for DMA-BUF importers and
 	  exporters. Specifically it validates that importers do not peek at the
-- 
2.43.0


