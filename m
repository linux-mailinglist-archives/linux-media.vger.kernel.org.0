Return-Path: <linux-media+bounces-10969-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3E28BDCF9
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 10:12:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9BB48B219C0
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 08:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B71A13C910;
	Tue,  7 May 2024 08:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NJbTFCeX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224DB13C808;
	Tue,  7 May 2024 08:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715069491; cv=none; b=IUyqazdWZ0Si9YMb0XITifVDMI4LcJzUktXyDP9Ox2MRApL4Bg+Ldy6J0M5tV04LniuY5h9syKvTrzqxF9t7QwzCL5jQ/my0JQnw9+qebvIhRNux0dUjbdnjppF7jnVlNKwE6ABLSOgYU/HQnkJws4vg66YGqay1glY7A996G14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715069491; c=relaxed/simple;
	bh=uma4ShckrABuf9MAliQQWYRx5NoqTx28b4HzRVSFuJE=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=qoGz5mXgFVpi0I28ozUud4X1jnU72BczktjHEgxDTvcfO5FzQpc7udLOjHK3T7KnH3xiB2H4WOLle5mOHPuzBGUziM8DNE1Av3LKyvcSzE/+WMN9YLXFRhDiQlvuKzk1ZQYy1osIV5q7MolFJfB/JoBxBtlPgSk3cL3LgIdp5h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NJbTFCeX; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-518931f8d23so2773458e87.3;
        Tue, 07 May 2024 01:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715069488; x=1715674288; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4HsiX+8mOqfVlwa1GKvO6P2/nQCW9Ffe/NVggRPUcEE=;
        b=NJbTFCeXUX9r8PEYJyUC2HUsKQf2SqhwuErZfZqsUCa6aMdWHZ801KmHzX9xsVUDZv
         iQk91O6jUuhaCHAceCDUeKU7n5CVHGq3imZFhL+kuS/NRBlV/CFmYbiW7tcdvMEXIAqv
         /gqYxCTC4TBBt53RPQ36xsO6NxnZDtrrnGV1LFChvjJe7D3kPckLAp/olI70a4757XFs
         bfxAiZ6od0YPdKbGe+OgaVXWqBryPJrXcg4JvBsIU5r7NBWFTF4iwQuyC+p+Ab0+EUGK
         VnfBgZ2rphu/THFcSzfAzmXvM9Dmj4rSFukPEiGJ4RVFWh5/Gyl4Wbx0zvpTc/MxIaeK
         XfzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715069488; x=1715674288;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4HsiX+8mOqfVlwa1GKvO6P2/nQCW9Ffe/NVggRPUcEE=;
        b=eKmoiGtMydJvEz2LWmPeyUhs9+viJbzhHrUDC1ZFiJS5Uexm5guMwApF5N1cmoM3nP
         HmC0r4PCg10Lsvz3CIEe1+R2MttwjJIB0GG9jkRabQvaAN5B0+Nl3xdlgu7hE+qzDMtT
         z1MfQmmNEjkOgb7z0tn+YHE1CQLvHB4ai1B2g4ps6+RsYZvO0S9suBIwPO6nFpBHkXt6
         +QOAbFzSKgU+7RLU2FXZ/7jm5rUuQdbtEj3Ts6UZe75aa3zdg98SeAslBRczhsIjkMu4
         gNQpLzPv355xyL6GsCQi4bAtnehFpsQRFA9eOclsq1wkNpgVLwifWwmJBQasPBHMeFJH
         VwSw==
X-Forwarded-Encrypted: i=1; AJvYcCXMk2Z1rtOkjT2+uYGKWdDMD5yZ7uH3xm9sp9uREYqkAHyaPKKy9h/Lres0DDKs90e3/zoOp85Dgmqwnpx1IAxFpf4NmkOKRLI7FWsfhrxIpOQTrGr46TJZsG0bDQpqfipOAOZi4ndfinVR/msgPA==
X-Gm-Message-State: AOJu0YxYQnyPTyj9Mkp5Uua+MBzQFlxMqBYYwBK23dkZ6WY5UwS6pfpN
	tP4HsSu36JqYdYpC4E5p82DLFeaMwjmfKuqzNf4pF6rduYJsW3I4IJt7Bw==
X-Google-Smtp-Source: AGHT+IG+luarxA+5V5k6jUquzNRm+OSczXzuDL2LwrJwdrTuUCv0EsK84+7PjPqrtqLHmHnFRd9b/Q==
X-Received: by 2002:a05:6512:7c:b0:51b:223f:ac47 with SMTP id i28-20020a056512007c00b0051b223fac47mr8025424lfo.41.1715069487662;
        Tue, 07 May 2024 01:11:27 -0700 (PDT)
Received: from [192.168.1.105] ([31.173.80.156])
        by smtp.gmail.com with ESMTPSA id y6-20020a0565123f0600b0051e16048adesm1983975lfa.48.2024.05.07.01.11.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 May 2024 01:11:27 -0700 (PDT)
Subject: Re: [PATCH] media: renesas: vsp1: Fix _irqsave and _irq mix
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org
References: <20240505174544.18359-1-laurent.pinchart+renesas@ideasonboard.com>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <8b532593-1e06-2378-280c-47951ad51453@gmail.com>
Date: Tue, 7 May 2024 11:11:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240505174544.18359-1-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 5/5/24 8:45 PM, Laurent Pinchart wrote:

> The histogram support mixes _irqsave and _irq, causing the following
> smatch warning:
> 
>      drivers/media/platform/renesas/vsp1/vsp1_histo.c:153 histo_stop_streaming()
>      warn: mixing irqsave and irq
> 
> The histo_stop_streaming() calls spin_lock_irqsave() followed by
> wait_event_lock_irq(). The former hints that interrupts may be disabled
> by the caller, while the latter reenables interrupts unconditionally.
> This doesn't cause any real bug, as the function is always called with
> interrupts enabled, but the pattern is still in correct.

   Incorrect? :-)

> Fix the problem by using spin_lock_irq() instead of spin_lock_irqsave()
> in histo_stop_streaming(). While at it, switch to spin_lock_irq() and
> spin_lock() as appropriate elsewhere.
> 
> Fixes: 99362e32332b ("[media] v4l: vsp1: Add histogram support")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/linux-renesas-soc/164d74ff-312c-468f-be64-afa7182cd2f4@moroto.mountain/
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  .../media/platform/renesas/vsp1/vsp1_histo.c  | 20 ++++++++-----------
>  1 file changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_histo.c b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
> index 71155282ca11..cd1c8778662e 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_histo.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
[...]

MBR, Sergey

