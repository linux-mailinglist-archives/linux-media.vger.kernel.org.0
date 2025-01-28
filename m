Return-Path: <linux-media+bounces-25388-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 573F6A21333
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 21:37:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C88057A4397
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 20:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 914EF1F2C4B;
	Tue, 28 Jan 2025 20:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GIu9wA8P"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490891EF084;
	Tue, 28 Jan 2025 20:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738096590; cv=none; b=D9tQI8NLgS+DHPRsIzlHbDmsK+Q2jS5zoF5OZhHUT+PFoTuJ7097S/n+d1w9ggXw4tnUetIJDkF6rxDcI5Q9YYmh1oEL5Y/Odm3GzbMRpy9yriS9JbPPp17uhdZtJzxzqBIzmK8yaBoBYpM+1XafRbvhbOqLl7mDXb4B4PwC/9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738096590; c=relaxed/simple;
	bh=yqiH8zQa4ElqkkjmIJW5m3RfF/o4uD61OfV0gG8rgTM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=thINJfeSFQCd+lL9A8Wd27NWFHRjmDD1ATBw7E/o9zuCjUoSZgCBWe452If6DB5euQpCkgFpRdM2S4vrINnnyotqYROeRlyqgjSS1rNd2RaDQifN2yq7KpGwZPJorwQwJLOE8GXc0uVdzGTSTWTg8r22xBF8yv181kC6VMfLEsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GIu9wA8P; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53e3a37ae07so6878199e87.3;
        Tue, 28 Jan 2025 12:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738096586; x=1738701386; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UOk1tpd1Scx8u9ygptTnBU+QUAeBmZsMjmcHaDde8t4=;
        b=GIu9wA8PAf4MY5/mc1aZ48zOZGUAi9Jw03CQ4RpL9An7OmdaOlEvYGuAqeHaHJTkGx
         PhI1V33iVJgb8qgmFqvd4TdgsUbO4Wts/dht2JAxvg3eNaQ2+q36MOboeaBnMZ9hiyFM
         g453wJkSYFWoIup2Sin72EGthZHp4GCxxZzeTwIwuY+yxlfQDAK8pCQobfp5WxlyM9I7
         5NtxS39FrKYeuMiJTUbofqUn9qn+vksMVblzWwExJym97zw5bUIRhSGSI4nfD0M9chxK
         rbK5uJNjUskOJvGAuKzac66tTiRNGTcgm71HUUFRkZrbN5zyyQdKzhWkZzfxswZGFLFz
         yqgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738096586; x=1738701386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UOk1tpd1Scx8u9ygptTnBU+QUAeBmZsMjmcHaDde8t4=;
        b=lI8wDAuJW/9qsDb51OZ5/LYvut6N8mBy4TELW07rbK+j6a2UrXNXnjbXzJM64Spnfq
         RGZvKtGpKsCctJ6koDFoFC/5wlHNYFS6UrKR4ZQ9Smr73xpsk0dwwwdp/8FTZ9UxgrXx
         oCAnJASNnYeRDwTPTr3yOYbHIsXgf8zfR4801IlCJN4xafb5LPDNBcJGuSN4jOVExJjV
         Cbpwvf+tvpProoqOf0cvMVVxkJgikieaRA/GEv2VUx2mE+OoGzrdYfE/+dCiN9kFk7ZL
         H8eUuYBFCGaXxSnrXvBiCiZOmKU/ueUUym1jzGH9vsYGDquZVvzHPNsq/7DqRVliME5j
         u4qw==
X-Forwarded-Encrypted: i=1; AJvYcCXFFalzq5VimnADkPB4UDovhIpMlKRGEfbvOuABy0NiMmAsov1xj+7FnX4sRqVxGqK73chueBHWG83Hxis=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpEM8PRj5sujsbORr2Oz0WiSOO1D+XH3dfknYgLf5RcsQcgEod
	Y7xAtc2BDRiTI8wbxMgjiIuX9P6kTB7ZZE//wTPbX0iKqzfWRDzGNcVff2cY
X-Gm-Gg: ASbGncsU57AWS/u0RQFxUzp6AsoFubPCuFc6j2ctG7gY/iP7hfdfmIeotWguc/BF456
	0cmgh/mYMPugDmn9OsHQ0J5Rb6Ryj7LAObNsT/o5D8sjWKmXLP4fLSqgj29/DEcQLdLZLhWPXGG
	PxXylQd+1M0Nmr9MjAXs7lIxrrDDw9YxU3QNBqoKmWkhvNEDksVs7ADLrf7wXM5uAHmDqYo3Lh5
	FpIOFwcx3jdExzBlDP8zm33onqo8z2Hlfjfdm0WmlnQpS3WTN2mEHTYqCmTHlmhIiCqeypumnAj
	mmQJfv6j0f4wsIX0IJSHUyJdcvGgPECVN3TMTI3ousDo7xiwiGWHDZwdOnGT8PKKnGFedfNUH8t
	3KRMnPHaXOqE=
X-Google-Smtp-Source: AGHT+IGMzL/80XBmn1eSfudDP9ZNpYqbMrbvgK9R+lJGhmNTKy7DW7XmzgqBK5JBk5vxw5I6MfuFfQ==
X-Received: by 2002:a05:6512:b81:b0:540:17ac:b379 with SMTP id 2adb3069b0e04-543e4bf6192mr102601e87.25.1738096585531;
        Tue, 28 Jan 2025 12:36:25 -0800 (PST)
Received: from razdolb.local (static.248.157.217.95.clients.your-server.de. [95.217.157.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c822fcb0sm1778361e87.55.2025.01.28.12.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 12:36:24 -0800 (PST)
From: Mikhail Rudenko <mike.rudenko@gmail.com>
Date: Tue, 28 Jan 2025 23:35:52 +0300
Subject: [PATCH v3 2/2] media: rkisp1: Allow non-coherent video capture
 buffers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250128-b4-rkisp-noncoherent-v3-2-baf39c997d2a@gmail.com>
References: <20250128-b4-rkisp-noncoherent-v3-0-baf39c997d2a@gmail.com>
In-Reply-To: <20250128-b4-rkisp-noncoherent-v3-0-baf39c997d2a@gmail.com>
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


