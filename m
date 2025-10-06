Return-Path: <linux-media+bounces-43788-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 884EABBE374
	for <lists+linux-media@lfdr.de>; Mon, 06 Oct 2025 15:47:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6AEDD1892E04
	for <lists+linux-media@lfdr.de>; Mon,  6 Oct 2025 13:47:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A50462D24B6;
	Mon,  6 Oct 2025 13:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UrsFh482"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC31223339
	for <linux-media@vger.kernel.org>; Mon,  6 Oct 2025 13:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759758438; cv=none; b=FCg1gu4UIl8QV0QfgQbjnOJVYf7Sy6v/jEdE5sLTEKWZomHGwC1r0CRK3/QD4eYPiphuDcJ63G5lqjCF9oFP8bav+VAREigz+7Y4B+mN3g5725NMuLMYfj/+LQV9CWGzaut1dJ3TRZKAnxV2sudj7ZooRAAeir6sQzsdT8kzi2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759758438; c=relaxed/simple;
	bh=BuK7AnQrVMZcB9xMUMx+r0Tm89YvN3yTPM1jNB6FSfA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jZ/DY9dOBMMnotXZ4dwZCW8IPdNwMguy+h9SedL/tbOfrNpf+yt0g9GEOmCAO+i3QhtqGa7HHE1lZHtoaC7MKBaO1Rkci7Lkqp4ZrZGPZ20v1ojF72+kqmvZDSiotcR9HTZaof+4YlVlLlVwdCKJ/SBAE0zmF7JtlNPQyW6zkU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UrsFh482; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3f0ae439bc3so2471923f8f.1
        for <linux-media@vger.kernel.org>; Mon, 06 Oct 2025 06:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759758435; x=1760363235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ykaAfDA6fK+gQoVD6r/9heA6ErlZ1qqQhHNz6PenFtM=;
        b=UrsFh482ChQnXLiZiHkJjRHqzCOezZN1wTXCCcz4ft+6dh6i3QU/VzkLFBXHwWt0Jz
         VNJMXkAVk5zAan6XMG/xqHQQ2BKMqY0vx1tuOVhaPBYre2DhvuM8oxrFH8rAo90L2vpS
         N7g1VqgPKLyGjlWNSV1k/YHmShRbpoj1QNmGRj4U2vUN6bfeWxE2+V8vgzo/nSw+yQ4m
         d1QxLLJnjCph/mpS88kQeCsHlbsiVKYrub0XYH7fzQaJTEDIbCBh16ad2bZmE0hoQxGb
         vh+i66BrTBwJUIdBNvk+3aN9ASSxWfRcJ9dkzg1plsnGBfuoS1o2azvXa6K+MCtEMQ66
         800Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759758435; x=1760363235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ykaAfDA6fK+gQoVD6r/9heA6ErlZ1qqQhHNz6PenFtM=;
        b=dM0wSwk+EMTBzxbZyj/ngqPccBxFpQTr5L3HJ14GGIsKTEr+76vanwjLE9AP6zSaRF
         fFBMf6iHwU2QMLuKuNdfB99uD9e/WUBM16jn4DQY+WEVVVJhcDS/PQuXGj3i0msEJkI8
         gD2JrTdoNmwRWe1Us6whFh4Uob/ALEEZG9wd5oaSvco45M0T+TiyMuvv2q1f6nijyz6X
         pGpUTPeITAfi5KqI/MSSi1fZWhZPG0W9F6mOkCY81NfgqJ1i8Yd8ZBbpcdi7BGoahbyM
         yETPAu6wifJTpWiNQNH8AVCzpyp4XFnqPMNIv9adr74kCm2P69atB1IKOgwERo3nfRsX
         hKLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVc/8hdGLmu4D17NcPjhjSfMx9LnMnHPIBo5zo4JHAXee9mjeie5PvzFT/G/Jj5Q6jLkxsBUOri7wOEFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YygHijIS90F2q1N4VZzAxHmNN7Vrpx6oB/Ip6D94HExXgzVsrsF
	tMu7Yo/RlVZuo962ZtMTuctjlSIKdTl/yY8VDAqS4/tWxaHW8p8rQ/8H
X-Gm-Gg: ASbGncv4IvRGB/XO5J0sYEYCiHfpo4MBfU6K1ZLIwBdCgwZrFP+RiIa0fuVbZhohh/A
	uHI3D6kK6jIskFyA4jnW6bQsK9xsyzIXUCqbHdzqNDB82y7VmQikaqPP6p0O4/cBNvBzRXEFHRe
	9KlcbzAMk6k37Gf61foPoLTpIqwKDTVcXOAQqdf9iT7MnqlW4h7eAjR5vH7jcFkjQCZrKiNuKsq
	9Klc1DIxNQG9hXZPFekdRiac5NMkpDdhWb5A9+K09duRfUqb40gGuBwJbrxdeMTrK4HFEcfwlNj
	mGRKGsWScIZ3FjoDwk8C5oMiJ9nDaTFJWvZPuCP2oWHgV1sv0hDEMuiRG04dVQdfVWeGILZgVI2
	jIeuQBmBkzhQx/PmQM2IY9+10znYmbARbQ7l4cpweyHk9GcYFtvGJx6OshmE=
X-Google-Smtp-Source: AGHT+IGt/TaymBas0Wox5VXpeJZMwWsZOYyvYRRK6eQW+9dxtYpqDSvK0Ox0qUxnYoZRr2+FbONLPQ==
X-Received: by 2002:a05:6000:2204:b0:408:5363:8266 with SMTP id ffacd0b85a97d-425671b07c1mr8352403f8f.44.1759758434680;
        Mon, 06 Oct 2025 06:47:14 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1585:c600:2084:c9fe:598c:ebd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8b0068sm20966125f8f.26.2025.10.06.06.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 06:47:14 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To: sumit.semwal@linaro.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	simona.vetter@ffwll.ch
Subject: [PATCH 1/2] dma-buf: replace "#if" with just "if"
Date: Mon,  6 Oct 2025 15:47:12 +0200
Message-ID: <20251006134713.1846-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

No need to conditional compile that code, let the compilers dead code
elimination handle it instead.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-buf.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 2bcf9ceca997..2305bb2cc1f1 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1141,8 +1141,7 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
 	}
 	mangle_sg_table(sg_table);
 
-#ifdef CONFIG_DMA_API_DEBUG
-	{
+	if (IS_ENABLED(CONFIG_DMA_API_DEBUG)) {
 		struct scatterlist *sg;
 		u64 addr;
 		int len;
@@ -1154,10 +1153,10 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
 			if (!PAGE_ALIGNED(addr) || !PAGE_ALIGNED(len)) {
 				pr_debug("%s: addr %llx or len %x is not page aligned!\n",
 					 __func__, addr, len);
+				break;
 			}
 		}
 	}
-#endif /* CONFIG_DMA_API_DEBUG */
 	return sg_table;
 
 error_unmap:
-- 
2.43.0


