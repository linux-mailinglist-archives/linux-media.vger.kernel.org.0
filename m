Return-Path: <linux-media+bounces-24213-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4782E9FFB06
	for <lists+linux-media@lfdr.de>; Thu,  2 Jan 2025 16:35:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 599D8188346C
	for <lists+linux-media@lfdr.de>; Thu,  2 Jan 2025 15:35:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AEC815E96;
	Thu,  2 Jan 2025 15:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SYhAakRR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259634C83;
	Thu,  2 Jan 2025 15:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735832129; cv=none; b=EVjwadwF5t19ywI5OS+WxW23jjLgKyhI7+wpK8D2loDsFuJjbSus7PAUj876DztBEfGfnS5lvvgboceYvNTsjlZW+xXECuzBauLbwntm7aQmKoCiBz1ewlP/YpEy2gxG7MRNFmg2fOY8yvDCXffldBrqHel95A2e9ec4Yn+K3AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735832129; c=relaxed/simple;
	bh=XaoBo1yoUIleIP5kYsm60MiZb3PLA/VBHeNg+vDdTCg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WCTEuzbKiAGf+nC24pPyzOxvFVIxeEEDzR5jkIKlzkDZxLHMjnKz7LYQDMpuBQ0hgPItEm7PMHdgScbi47yHI8wu4CJeXX7hZGFZj0LN1NbhOahlBVdhhlR/HHBZkNtZ4nyUT2FM4iehMHZ/AjTAgIn8wRzsRkhjwHKhWi1ZRvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SYhAakRR; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53e28cf55cdso9842602e87.3;
        Thu, 02 Jan 2025 07:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735832126; x=1736436926; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iT4Lk/9j6jfvzdv4mtNNNlRP6HP4iXENTaMgFI8ZadE=;
        b=SYhAakRRtqGPJfSnjkD9ZE3rnx91PpUD31N3rG8jl3wYT4zDm/kOoUHmwrL4LZY35y
         S+6OZBAX3vJxGvMcjvkUvQ1pXoDYAxVEh9CBfrqPPUaNaU5ZHDaz+/p204zxtcgWWN5w
         QLgl7/jAOBRYDb7EgF3c1/UY8Q1icKtE5Y/bRNAMclVZImj1gZKZGjkQRYeTwZ9dw4y0
         IyNzGAVYtKe9WcO2wG5/Zb6NPJ0144zImtWodkUcLK0/tiYKWKJFjoleHx3E2yD2NZuc
         T5l54sozB5ZcPFiYyReW2sidmrggjYezTMjJb6LP0DkEwW1IryVT9Q3oxvikNbJ/LbM3
         eVKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735832126; x=1736436926;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iT4Lk/9j6jfvzdv4mtNNNlRP6HP4iXENTaMgFI8ZadE=;
        b=P2ND1d8x1YtWk3YOW6jN8wM0j8Z/a9k0HeU3JajRD5biozMKBl2fl8rd+4j+pGra1a
         V9r24FV+j9sCnNe4LxoX7wv/UV6NmIxMsh/QjHojleZUah5Dbfi4pfF9iFHW0t5Amrfk
         FH2x4RfAB6LyEigqOr+Q1PAlCUS1hmcM2kXmsJ2bbygq8JsEvaEz1EfbEve4JXQHR29r
         j7oo7KKB5Y+wYYPozyEZG7Sa3NCwcbr2We9t4wHkXwsxZBXai89KLu38qEJBuYEFsJXR
         fSCCO8GNiM0J3LYUqPpENKlxup04CJsfpMIKQa0WVyABl0JbNIzqDD3eCF7CB9GrNmvc
         Dcqw==
X-Forwarded-Encrypted: i=1; AJvYcCVyEKImYkGFBmMe58eQxmzr8UfXEtTeVBpLgDd7/deuV2ak+RRECg7fs+HD20H02X1aWIQOor1Xr4c/oUo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1DRhQX6RpBbAgwBlAKeiEyVAQxuu3cWhuezDxNJepf4kcrNfW
	pSpDOd6WkampN+cbNRsyGYMjTFctRJ6dWXqs8C/sLc5hSbA5FIMjmPNHwJeFZ2NbOg==
X-Gm-Gg: ASbGncuJkDnDkVTsznQAw3snpGHhWGSN3pmuejomCC3bqfti2ONWC4w/YNZ8bt5vKAq
	4cZxEKIWNLBmCbNrfQBRC/B56yVAP+PRbgHx0zSJWTcuKx/g9KV8cXgZWqUxr2zR5kWUThQb6Rl
	bAybFPzf/Gf1uJ3AEKY7vl/zWqDHeRqY067ht6tcbp55PmXvn3I1Rr8izNOpRzdWwS8fI+JOShy
	EEOuAutkWd9ocOCuImQKcviBrSKjimfo9wnOIJBfd91OmhKzeueenDtbIhS+wUtecy0yS+fAT/d
	uWYKkLxu2EtyrOF5WtVU92UziywqYz6DcEgJkZJKulD4L79wmZo4
X-Google-Smtp-Source: AGHT+IFuQdFNtPKtYU0kU7F2ognrgVg6FfagolZHbxa4JZ1HZFQ63T/tY5ua6ZtGvZjW1YAsQ2kn3w==
X-Received: by 2002:a05:6512:b19:b0:542:2e09:639a with SMTP id 2adb3069b0e04-5422e0963efmr12639162e87.10.1735832125581;
        Thu, 02 Jan 2025 07:35:25 -0800 (PST)
Received: from razdolb.local (static.248.157.217.95.clients.your-server.de. [95.217.157.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223602617sm3958832e87.109.2025.01.02.07.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 07:35:24 -0800 (PST)
From: Mikhail Rudenko <mike.rudenko@gmail.com>
Date: Thu, 02 Jan 2025 18:35:00 +0300
Subject: [PATCH] media: rkisp1: allow non-coherent video capture buffers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250102-b4-rkisp-noncoherent-v1-1-bba164f7132c@gmail.com>
X-B4-Tracking: v=1; b=H4sIACOydmcC/x3MMQqAMAxA0atIZgO2iopXEYe2Rg1CKqmIIN7d4
 viG/x9IpEwJhuIBpYsTR8kwZQFhc7IS8pwNtrKNsbVB36DunA6UKCFupCQnurmlLnSu7b2DnB5
 KC9//dpze9wOZweAXZgAAAA==
X-Change-ID: 20241231-b4-rkisp-noncoherent-ad6e7c7a68ba
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mikhail Rudenko <mike.rudenko@gmail.com>
X-Mailer: b4 0.14.2

Currently, the rkisp1 driver always uses coherent DMA allocations for
video capture buffers. However, on some platforms, using non-coherent
buffers can improve performance, especially when CPU processing of
MMAP'ed video buffers is required.

For example, on the Rockchip RK3399 running at maximum CPU frequency,
the time to memcpy a frame from a 1280x720 XRGB32 MMAP'ed buffer to a
malloc'ed userspace buffer decreases from 7.7 ms to 1.1 ms when using
non-coherent DMA allocation. CPU usage also decreases accordingly.

This change allows userspace to request the allocation of non-coherent
buffers. Note that the behavior for existing users will remain unchanged
unless they explicitly set the V4L2_MEMORY_FLAG_NON_COHERENT flag when
allocating buffers.

Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
index 6dcefd144d5abe358323e37ac6133c6134ac636e..c94f7d1d73a92646457a27da20726ec6f92e7717 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
@@ -1563,6 +1563,7 @@ static int rkisp1_register_capture(struct rkisp1_capture *cap)
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
 	q->lock = &node->vlock;
 	q->dev = cap->rkisp1->dev;
+	q->allow_cache_hints = 1;
 	ret = vb2_queue_init(q);
 	if (ret) {
 		dev_err(cap->rkisp1->dev,

---
base-commit: 40ed9e9b2808beeb835bd0ed971fb364c285d39c
change-id: 20241231-b4-rkisp-noncoherent-ad6e7c7a68ba

Best regards,
-- 
Mikhail Rudenko <mike.rudenko@gmail.com>


