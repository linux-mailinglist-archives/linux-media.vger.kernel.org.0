Return-Path: <linux-media+bounces-47695-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DE40CC84FB3
	for <lists+linux-media@lfdr.de>; Tue, 25 Nov 2025 13:35:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8B9B234F230
	for <lists+linux-media@lfdr.de>; Tue, 25 Nov 2025 12:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2332431D365;
	Tue, 25 Nov 2025 12:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P9x+YP9E"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E5D226D14
	for <linux-media@vger.kernel.org>; Tue, 25 Nov 2025 12:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764074112; cv=none; b=jFgTvDt/SQPvabIJJP9nOQfayFYfKi2LBPjWmsztJUMAF3AV1QR7cnVMB+gLR3E1BL0wtNudBOc26Y2MjkashjmPUldLb2MSQ9JVRaRWQauA4FGzSvyQvLa15W/85I/oT+K1c23x6zOgOiQGlGdYWkINn4plYiU9uPSG7n228UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764074112; c=relaxed/simple;
	bh=9KhMQtglvgwFLq0EERoB1DGsMk7bVLgsTiRTkQIulec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MrmkjB4/yaR37trl74eBjzp8YSA44bcMnCQNUOdFnZaTnVFbJSJGiDxQib76T1fFuTX9OF3cnUF/dh/tgMWw/LtWQJlKqzkI9j/6IO+r2q9pl7Pcm/6CUbJPmA3J4Cx0gsxluuIIy22JuxJHp/FpdSipIIZKixpjWqTm6i9Ffx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P9x+YP9E; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-477a219db05so32310375e9.2
        for <linux-media@vger.kernel.org>; Tue, 25 Nov 2025 04:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764074109; x=1764678909; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=siB9qFjab8fX+nGosH2txh4HIYoNVo3aqhU42WS03o0=;
        b=P9x+YP9EXEnC7MMe0F5kk8o8F2AB7xaZa3E5RBDar3rlAchOZ1QM38zsIjtdEMifEG
         +3hXpND37T/LymWCB8VBxtGVRlPmm1kjRs4JlZm7WwVdlyfNz34bjzaDAwU2hbzWk2r4
         +FC5ikpPr/GNlJ2R/6WgiDYkS28IpAopY4azIg/V1BXMSzBFaDQ2gJ0YRLLUbTaOUiuy
         8ulPp6kL5/nmLgahc60VtlvC/WdwEuyYxJwlYlvCnwAdC00hO6zjNlDm7HmKnnfRxJvA
         WJIhjwxihIeragaJP9AetoGmnIjR7ceg95L66JS6cZzekSQdp680VNlYWm1JHvdwoWIq
         1bDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764074109; x=1764678909;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=siB9qFjab8fX+nGosH2txh4HIYoNVo3aqhU42WS03o0=;
        b=oZqfu2ntZAxIs7HMW+3eAAUaQY9nBlUPQcZNQG5wTuo4vkk3gfImT2vDD4bTHfKLQt
         ovs5AQCXIVqSRmdQ8/R0XqD/h3Lb56dY5Us1RakG5IcUbd9MAx2fZF8CPp9AFd2lZ0Oe
         AUDsEixn1kqtddKAlR1TOUKa0z2MAbukHSZ3HseZqiUVAnepexfx+uYp8TjJEyguWpId
         vkqPOyKufw5MAMIT/EsJGm3bMi0JGLKev9zthHrsY+//FRGByu6s32r+iEMhaqE1SHcY
         w466LMw/vlC9jQHpuLX2Y1IBkIszKiKpNJnncNbHKhV3aKG278A4qxIuxna2sknQmZNQ
         dB4w==
X-Forwarded-Encrypted: i=1; AJvYcCXMGl3eZgF96u+Pum00IUK9wMdbtItCK4EUvdUWqU2GbxFkVX8w/RZMx6WSyeMkDbvoX+AW6HCLljXXsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZxo4dse2cZqNjRRfPMuGsxPPXezDHSsPjGMh69z/MBVqKTjrx
	PO2py0vqFDOxXZU3bTRD+XtFHVDv+K1jODP5balZwXZpfy9SMb6A+TKP
X-Gm-Gg: ASbGncsokqWyoyVklt/ZxZ2rZkxS4qy9s6XWgSSGRLwaxU8aArTPbwOXqbjLdScDw3q
	7uIWD3X2mKl0HT1SLv9ob1HcqzseIYXyxzSDMkOd7bFdcg6qQ+f6UyiiaPLN1dMCFrKu2Ds+JOM
	p6qmHrvIbB6MxZMOfMcIM0AVQrNPJ1H583LSEaF/B8qEX4/CECQ9vvHM0kGIhBsfX3twhJUTFxo
	NPsTGYyoykdeqn53oyGg+u7sDTtJrc4uPkOaHz3tIuxzHtRdNexTRL/bAmbfcs0Gq3QMBHpahy9
	0pk704Y19ZzmiTl9mZAitUu4YwX7zCKvhdcK/N+zocmBNmH/L0upIZoDbG9/YQ8xv4TLZA6Q00O
	fgMATBGd/JwRxovYEjCqcvXpWPOkyLg5JToiYE6UnHr5gq4aeouw/pNfUOmhf5kDD1nFLC7GGuY
	2GJky/6i0ogU98JAf60BXtNJ+ftOq8vh2xKGxEK9AKwRqGpKkDdT0zGL/X2enmtQ==
X-Google-Smtp-Source: AGHT+IGiAByXWX/VuXJ575rRIj6bTeEbAlnebab6FY0vB4jAmRqS6rohlKvvoUgeChvVCplBX1c2lg==
X-Received: by 2002:a05:600c:1d1b:b0:477:9671:3a42 with SMTP id 5b1f17b1804b1-477c1133e4bmr159739175e9.35.1764074109236;
        Tue, 25 Nov 2025 04:35:09 -0800 (PST)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fb919bsm33941871f8f.34.2025.11.25.04.35.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 04:35:08 -0800 (PST)
Message-ID: <1f8b5e97-1f3c-46f8-8328-449c159b7d66@gmail.com>
Date: Tue, 25 Nov 2025 12:35:06 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 00/11] Add dmabuf read/write via io_uring
To: Anuj gupta <anuj1072538@gmail.com>
Cc: linux-block@vger.kernel.org, io-uring@vger.kernel.org,
 Vishal Verma <vishal1.verma@intel.com>, tushar.gohad@intel.com,
 Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <cover.1763725387.git.asml.silence@gmail.com>
 <CACzX3Au7PW2zFFLmtNgW10wq+Kp-bp66GXUVCUCfS4VvK3tDYw@mail.gmail.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <CACzX3Au7PW2zFFLmtNgW10wq+Kp-bp66GXUVCUCfS4VvK3tDYw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/24/25 13:35, Anuj gupta wrote:
> This series significantly reduces the IOMMU/DMA overhead for I/O,
> particularly when the IOMMU is configured in STRICT or LAZY mode. I
> modified t/io_uring in fio to exercise this path and tested with an
> Intel Optane device. On my setup, I see the following improvement:
> 
> - STRICT: before = 570 KIOPS, after = 5.01 MIOPS
> - LAZY: before = 1.93 MIOPS, after = 5.01 MIOPS
> - PASSTHROUGH: before = 5.01 MIOPS, after = 5.01 MIOPS
> 
> The STRICT/LAZY numbers clearly show the benefit of avoiding per-I/O
> dma_map/dma_unmap and reusing the pre-mapped DMA addresses.

Thanks for giving it a run. Looks indeed promising, and I believe
that was the main use case Keith was pursuing. I'll fix up the
build problems for v3

-- 
Pavel Begunkov


