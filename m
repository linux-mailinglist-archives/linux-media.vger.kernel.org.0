Return-Path: <linux-media+bounces-24806-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5D4A129CE
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 18:26:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 507403A7318
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 17:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D77B11D5CC7;
	Wed, 15 Jan 2025 17:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RibZaNXg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF2E1D47D9;
	Wed, 15 Jan 2025 17:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736961937; cv=none; b=nmuZ79L5lszbQItmWqeN3/s7mJRC9Wf3qqvYEPqQHR7mGEzAESVY/mh+4CzRpPQIg4uyGbLiazf82T1STn+QnlKhVqO4f8WYcm1/iC7whDTPPmpjkb1EnDPSEXGzIOKnQe1iixPEqqd8uIQfGuTs76hPlD9VU1Hr5brsKEEU4TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736961937; c=relaxed/simple;
	bh=yqiH8zQa4ElqkkjmIJW5m3RfF/o4uD61OfV0gG8rgTM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MDpZC4fjSIT3Ib7aqR5CneNTnT2u/+eWeBDPi27tbX9HxYKJQ8yAirkewx62XpFV9WcLetxdY901U+OKGyIYlHTyLWk2ZK1Zb5A4PWxyV08aVQyckOhR/7tu29VxmLlX4s0+RsC77HazU49vKC+Lo9RGEdL9YTL/5za/i91uDs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RibZaNXg; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53f22fd6832so30252e87.1;
        Wed, 15 Jan 2025 09:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736961934; x=1737566734; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UOk1tpd1Scx8u9ygptTnBU+QUAeBmZsMjmcHaDde8t4=;
        b=RibZaNXg+arYzlQ4HPARuv5XPoMWk6G7HunxXKLMcqEDfq7KlOy6h3tsGcjlscMWhu
         wrQy/A5YaxgObGBlHUp4NimM3Zw65d89W0rliPuCciqpcNSAqOXyq3xy9IwKGy7L4vk9
         iEybdufG4dcn3H8ghhDuZczzw5p8TEb8hemKmK8tje/uE9He3h59ZfDB/SBNPGGpYhaP
         J/AHDEa6H0hmHk+5bfv6mH8VbiWB9Drt1rY9lEe7uRJj41EEOae4OyzM8BlibjjGx61N
         +XsOBUdolw+V321/U4F86n0aiVdi8R8MVu2i8xuJjIMfFQ57JY34ijSSEncvjMrpXGe+
         nw6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736961934; x=1737566734;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UOk1tpd1Scx8u9ygptTnBU+QUAeBmZsMjmcHaDde8t4=;
        b=QwSvbEBGcwIJDv8/lHuekAY7h9RKEAgw1Nl+dc0ewYvH/0bQIUqSLdE8Om4UuNCcMh
         kGQIouoTAkj+U6LkA+hqID9wFJ2loU6CPICI8NzIgTo6e2kCvmM943nzSM9vXWhuJiBx
         ZIjWs8iBnDQhO/a6ql2uVNEAQk3vrGF5y+dqJ4DVJrsywbKvHoHu+L0W9bazP8r5MWtX
         hjoIpJU+1QSwFMhpyqj1ViXOgCY+5ArJKmvjjaQWFl9nzDFHH9XvD5z5Gcu7Xrvd9XMs
         NLzNgPPI4vUtOEF1Uvr5Le9N+cG/0fSR9Yt1iiCOgu8Tm78LlI0cPQDIe3hk0eukEtFf
         rhPg==
X-Forwarded-Encrypted: i=1; AJvYcCXmiDQ0dT8f6A2xBivDLhNQOmU3jj5ph0dsz1DHobACY3sB8ioBYvn0tzwhV82I0hON2xpTQwJr5jZmUuY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcImbK6/dG1zBpVt0n7BCJdGNkOqLchEXRKzbKoboVJi5xhi4z
	NrAjIuwaiuCJsvkQWTXGqDedxNOIJVBcavAnlsf/Y7zImDCp0uRv
X-Gm-Gg: ASbGncsB4FsrM3GlYkB/QBRpKIqMNmoK17QlGUCB3HXNfI8Zi1Q8+xPGCXu330JTYTF
	9tfZZ7uejb4wjLCKZmRqsAcBQi6+TQpsNzd5e3VpstNAq7r/x4z+vXklW91ysMrN6vGa2LM54z3
	07hGS0vk7I1n0R3Zt273DMp1uw4P3Q+9+zTKQ1aGTHYcGSzlBbZMCOAM1c5TcXKGPAtG9FkNjLJ
	n6Ok/2eDL5csp1K2ef5f5RJ3vRmVuLQGBfNvtj5L4hqbT6UAXkiVpeDUSLhSnzsqbwWGRj6/L7b
	ULq8407YU+Zgt7cMvwNVkR87Lw21k7/Gu8/EAiN8JH1XbkD599rh
X-Google-Smtp-Source: AGHT+IFFOoCcSAzA0wB433xlaBd40KuCCYr+BuGWAMVyMEtJFz3DrRjgISJriqbitaXGlv5UNa4Zlw==
X-Received: by 2002:a05:6512:138d:b0:540:23dd:2139 with SMTP id 2adb3069b0e04-542845d322dmr7884243e87.29.1736961933312;
        Wed, 15 Jan 2025 09:25:33 -0800 (PST)
Received: from razdolb.local (static.248.157.217.95.clients.your-server.de. [95.217.157.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bea6778sm2105360e87.131.2025.01.15.09.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 09:25:32 -0800 (PST)
From: Mikhail Rudenko <mike.rudenko@gmail.com>
Date: Wed, 15 Jan 2025 20:25:06 +0300
Subject: [PATCH v2 2/2] media: rkisp1: Allow non-coherent video capture
 buffers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-b4-rkisp-noncoherent-v2-2-0853e1a24012@gmail.com>
References: <20250115-b4-rkisp-noncoherent-v2-0-0853e1a24012@gmail.com>
In-Reply-To: <20250115-b4-rkisp-noncoherent-v2-0-0853e1a24012@gmail.com>
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Mikhail Rudenko <mike.rudenko@gmail.com>
X-Mailer: b4 0.14.2

Currently, the rkisp1 driver always uses coherent DMA allocations for
video capture buffers. However, on some platforms, using non-coherent
buffers can improve performance, especially when CPU processing of
MMAP'ed video buffers is required.

For example, on the Rockchip RK3399 running at maximum CPU frequency,
the time to memcpy a frame from a 1280x720 XRGB32 MMAP'ed buffer to a
malloc'ed userspace buffer decreases from 7.7 ms to 1.1 ms when using
non-coherent DMA allocation. When doing cache management with
DMA_BUF_IOCTL_SYNC, DMA_BUF_SYNC_START and DMA_BUF_SYNC_END operations
take around 270 us each.

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

-- 
2.47.1


