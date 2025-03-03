Return-Path: <linux-media+bounces-27326-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB01A4BF02
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 12:40:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3EE51889DD4
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 11:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A39E5202963;
	Mon,  3 Mar 2025 11:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LVydP8Gh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C52E201006;
	Mon,  3 Mar 2025 11:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741002018; cv=none; b=Zy+9pykK0Jvrr2WqeN8/MRd4g2usFoTjyT75SLyHC2nslejplJhTXb0D/Fr4DNTEiL5iJSjN+qJS+EjIhuFFZxD4Emh9ix4rgcixBAq3SMz18278ltqQHA+QlgyzDjvgC1H5mPnGvsC3R7P0Y7N3yNaGFCUhUQY4PwS5M3IM5Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741002018; c=relaxed/simple;
	bh=YYbw0twHWKoAfJ9niGlDXpv/GCZV3S5e278sKRuhd1o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Oyqr4OTnfMnPzNk5IVnE0SAa6dYslLrJfpSGoftk0Uy2KmCJ1IgXHJ79k5HsxUqRgp8Qi1UDYfHn77B3lFhflB2S0OL98BsB2JQRQofcpzKMetMGitdsMGsFbjjBR522zy1a+0eYMr9nUghLyqdHjpJjeX5HkCsm2dYRsKX2eI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LVydP8Gh; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-549490e290dso3158583e87.2;
        Mon, 03 Mar 2025 03:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741002015; x=1741606815; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RqOngwUEjSuVUtl2EN2OtrWhKsT4v+sY6g+D1KtVO20=;
        b=LVydP8Gh4kYxLkMR5DNbcCr1sPYhsfIFVrG57frC53GxtXT+FUoorKTM26v8ghKAyr
         kMZHaxbhZHRJ/4R0Bc6cG5vxXsAekNhLcrXpLc0uCvmpGOYhGHMnOgyayYwi9QZoyWcM
         wUEL6o+pAob98XLNlsIRhWfxf2MuF317D20ANxlPmMxihTaL/EawtaiVoUa+AYCXGUOP
         AUOIxYUIAhH16ovgg8e+2efBeeCovBMwPTKowXhtYvwYP4fcpQf9dmnbJIfDe04TF0Dy
         wFQOB9NJJtA1LagsbausG1oKIKBA3IoBB051A/J+dvB9/LKwhHCCaUB+0GEtEQZmRQy5
         QH4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741002015; x=1741606815;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RqOngwUEjSuVUtl2EN2OtrWhKsT4v+sY6g+D1KtVO20=;
        b=gyZRSzVqfsjjNedGF7h7xomYWcSZX//HF7IcZGQv54pJCQhL6kdmyB77p4MNkQDtJY
         rXx6DUq9ZkjPuIrIgA+DfyFUsAc9NNYF+Q09Tn/osQJ4J3zuxK9jpsSaOBROnV2Cx6MS
         1blhBsOe+i2dwjQxMVej4qBDF92gll+AVePuzDaxZbstykZHkvS2V9PpSyr5Yyy7Slfx
         rfhPXjxFVRxd8TB1VuuG+cDtmx2+gGrhzfn8CLavCXmPCRZjblj/TVqeNDs6XBprpTsK
         Svu75IT+l/ymqXPbPhalha4ZiheyGvWAglcHC0ujRwxOUSVtiXYUzcPCfe2CjXml5Qti
         V+qw==
X-Forwarded-Encrypted: i=1; AJvYcCW/Uo+0tfrcgc3kMihjtKz0t/0jo22WuuqWECIZpErg3iJtLLBiMMd0L80v9XuPBrMUmPEPk9ZrziMqWOA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw/JZtoC0NYCk30qezix59lsDhDKhXG1E99FtVq7Rbgti0HoQX
	g7caA/nG7DHgPyywyzw9C7w++V6C/xtcAwriA+t7cEGWM7uEU6NbTzOL5OT7
X-Gm-Gg: ASbGnctR5G4n51KU0zi41lKfrT9mUl8FbjbbU8WuWBGd5FlXmyzAZHosTgpPJeF19jl
	mgwotfKrlv85I0w5H66+a8gJF+Fi8oBgXDo8uTBA41DoMI/ML3oobm15ILiglhgTqwGpG0cjuhS
	XrsIpFz9nwJu99+H5NlUV735E7uch7oDrO4caAj1CbpeKMUIhfW+IXwe7KZvG1sIN2Sk5CLh4Vw
	RthVz0HR9+gnNERWM9jmE0icNYgiLizZHEAGVMnhURpzeiBTLMQ+Ehe25NzCCN/B2kiJklC0Q6t
	ygJn6QfQ2RGSSI+f/ibSzXEpp7zZJwVbm98lHgPaePah4VHSuSqYQtHafOPgzV4R0ELw32FRgBd
	0mDyf7ImBvC1kgU8lAjM+kQgImpz0bM6DQYH8E2rC
X-Google-Smtp-Source: AGHT+IH6/3bm43v60en4yvBpA0E6eJcZTxM/vDnluS8y2VWAPrUuChj3nEiAbcrbv7L0cQ0TzEE54A==
X-Received: by 2002:a05:6512:3f18:b0:545:1d96:d6f7 with SMTP id 2adb3069b0e04-5494c333056mr5105031e87.32.1741002014366;
        Mon, 03 Mar 2025 03:40:14 -0800 (PST)
Received: from razdolb.local (static.248.157.217.95.clients.your-server.de. [95.217.157.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54949de706fsm1125399e87.23.2025.03.03.03.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 03:40:13 -0800 (PST)
From: Mikhail Rudenko <mike.rudenko@gmail.com>
Date: Mon, 03 Mar 2025 14:40:10 +0300
Subject: [PATCH v4 2/2] media: rkisp1: Allow non-coherent video capture
 buffers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-b4-rkisp-noncoherent-v4-2-e32e843fb6ef@gmail.com>
References: <20250303-b4-rkisp-noncoherent-v4-0-e32e843fb6ef@gmail.com>
In-Reply-To: <20250303-b4-rkisp-noncoherent-v4-0-e32e843fb6ef@gmail.com>
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
2.48.1


