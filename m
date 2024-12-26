Return-Path: <linux-media+bounces-24089-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA229FC8C3
	for <lists+linux-media@lfdr.de>; Thu, 26 Dec 2024 06:59:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 515FC1882A95
	for <lists+linux-media@lfdr.de>; Thu, 26 Dec 2024 05:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B89DC155CBA;
	Thu, 26 Dec 2024 05:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cYdlko6v"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A15D12B71
	for <linux-media@vger.kernel.org>; Thu, 26 Dec 2024 05:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735192777; cv=none; b=FlYlUzn0ROUny5/E1xasJBOFFON0X+NAzl17HmI/Q99P87WGl16chszbDpGloTI7dzHsxRlOGMrt8z8NMcQmwxftshAWAgl+MR5eAo3Fy/V5pDopt65fKIsXFhoW+L2KgAjtDgfwAVGFubmhi6uw2QgQpQZOFVtJHVRzGioDyCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735192777; c=relaxed/simple;
	bh=4SpLP1y1WpIf2QcscRKvg6PvauYcQk/j9AUKbJWM3j8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eSrveZUcN5eVDTZW3jcCp9zZcqU6BHC0OYHLlBSEO76+01smzLPmQXHCPuyXJ3K8gtcvDBJjGWPGSG15NwfPBbp3Xw8gMj+t824Rb3Sf1YMRfvtbDVIBG0eCFgu3nus0ySsCdc8bgj8bQer1EFJOvbuoIBEHX7ZXgee2wTPCSeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cYdlko6v; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4afecb2731dso1558278137.3
        for <linux-media@vger.kernel.org>; Wed, 25 Dec 2024 21:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735192774; x=1735797574; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tj/33c0J9joYWGIFk0SUpBommdcWsbOtMfpln3ym7us=;
        b=cYdlko6vV3ufE95yPJER0KJ2q9mWyOVs64vWRu+UpE0VnTesq7GsgpzhBDPuMgN/rA
         fwD5ELO3vzXaR7zJL3lDfxi6rdPnWOYR5BHU3qKcSm7363cmjQlNSaZIX5/HcF83FFhe
         wNT6WYAtgf9IuG/6nc03ssGvZNuc6lgSiWwovwDkL+Toiqvx9Oltq6HlvtZ9HbS0zRV0
         QqheW+GrQE5XkfO2+Lt7oSZAVhaMpX2QvtPUWie/P4lFhYU62XR/4H+2xLnz7KCJux+D
         EMR9PHMs8s2Da24EfFuclvAc7Cnh3fXroNH9a2znNz7x8OPlW8zMiUbXXUgZQJ6VPbRf
         fsiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735192774; x=1735797574;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tj/33c0J9joYWGIFk0SUpBommdcWsbOtMfpln3ym7us=;
        b=Phyee8Qw7KanMt2cM8wcs1UV+AollMIc7Wdx9jmk3CL+6KGKiTH0fZZLBPskLpwioq
         gxD4cKU+DOQxkoSInNEohar6Q4P+ilGzf6n/0hA35QSeJDXEopXx72JJcEvORtv04F6B
         UaeavljvRtdRkRj4pEPajgI8xWwiVfQvwMVDjSt7Vb73HGTtXSLavuNFSWfAFQ0cakrc
         rb1eEm+ARU3ZlY1BcM8NqotwyiRBUOkbcVVZaTbUy9IMKVTwAL6Nk33WGAVB/dcdizEB
         bgBO5+MYoBjwgwWcZaeTXxiPBsPRYgOtTSBmdv1/MaqhsXETG8fkYj54ptTuqCJ/RQiv
         +gqw==
X-Forwarded-Encrypted: i=1; AJvYcCXY6H6CDwNgcdhVXQS/XDDozJ2epkDZRvF4EQPqYyzeQF2VvCcBzVk+8Bei4sru5bmZHua6t9DFhonA+A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb9rH1ZNpQDeS33+xja4u8TSLa1/Q+FvOXHZmlB7/Ix9hTsXbp
	ooVRbbCvoPzKpZ8S7rmWycpaRzAoRzRnfjh7cHReI354xl6Poq6IMmDGluCD04lknAqSTUQ98VP
	p0yDX5oRFRK+XgKlE6Fo8TS5a3I3u7OUFHdWqsA==
X-Gm-Gg: ASbGncv4ioWId7NJ1cQn9N6/b5D/MV6Mi8yE34XI5JAzvpylQmPbRSJlRO8lPpL5wqS
	menga5tH+C+i37Z+e7aI04TJU6NTXB5wJ0VZDZcw=
X-Google-Smtp-Source: AGHT+IE00N5vnKOUc7MqeRMXg+SxsijMu6w8qky0ELkHlxmHmPLT1blVC7fcWxjQJ3Y0TOTnD9UaTmwXTcjzXGMlnJk=
X-Received: by 2002:a05:6102:3ec6:b0:4af:bf45:39a8 with SMTP id
 ada2fe7eead31-4b2cc3a793dmr19596749137.16.1735192774291; Wed, 25 Dec 2024
 21:59:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241217100809.3962439-1-jens.wiklander@linaro.org>
 <Z2KsuAs-Dd4ZDaXR@phenom.ffwll.local> <CAFA6WYNVHu7_-bNAuTYBRBdoJwfk2VrW5M4aFVkb_UWQ=uxTvQ@mail.gmail.com>
 <Z2p-v-xjhzhPso6u@wunner.de>
In-Reply-To: <Z2p-v-xjhzhPso6u@wunner.de>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Thu, 26 Dec 2024 11:29:23 +0530
Message-ID: <CAFA6WYMEjT5EAG3AL8NpbET6L=M86LBgnhLnWirvDZg9cUUiuA@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
To: Lukas Wunner <lukas@wunner.de>
Cc: simona.vetter@ffwll.ch, Jens Wiklander <jens.wiklander@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com
Content-Type: text/plain; charset="UTF-8"

Hi Lukas,

On Tue, 24 Dec 2024 at 14:58, Lukas Wunner <lukas@wunner.de> wrote:
>
> On Tue, Dec 24, 2024 at 12:05:19PM +0530, Sumit Garg wrote:
> > Restricted memory is a feature enforced by hardware specific firewalls
> > where a particular TEE implementation governs which particular block
> > of memory is accessible to a particular peripheral or a CPU running in
> > a higher privileged mode than the Linux kernel.
> [...]
> > - Another possible use-case can be for the TEE implementation to store
> > key material in a restricted buffer which is only accessible to the
> > hardware crypto accelerator.
>
> Just a heads-up:
>
> For RSA sign/verify operations using rsassa-pkcs1 encoding,
> the message to be signed/verified (which I understand could
> be located in restricted memory) is prepended by a padding.
>
> The crypto subsystem does the prepending of the padding in software.
> The actual signature generation/verification (which is an RSA encrypt
> or decrypt operation) may be performed in hardware by a crypto
> accelerator.
>
> Before commit 8552cb04e083 ("crypto: rsassa-pkcs1 - Copy source
> data for SG list"), the kernel constructed a scatterlist
> consisting of the padding on the one hand, and of the message
> to be signed/verified on the other hand.  I believe this worked
> for use cases where the message is located in restricted memory.
>
> However since that commit, the kernel kmalloc's a new buffer and
> copies the message to be signed/verified into it.  The argument
> was that although the *kernel* may be able to access the data,
> the crypto accelerator may *not* be able to do so.  In particular,
> portions of the padding are located in the kernel's .rodata section
> which is a valid virtual address on x86 but not on arm64 and
> which may be inaccessible to a crypto accelerator.
>
> However in the case of restricted memory, the situation is exactly
> the opposite:  The kernel may *not* be able to access the data,
> but the crypto accelerator can access it just fine.
>
> I did raise a concern about this to the maintainer, but to no avail:
> https://lore.kernel.org/r/Z1Kym1-9ka8kGHrM@wunner.de/

Herbert's point is valid that there isn't any point for mapping
restricted memory in the kernel virtual address space as any kernel
access to that space can lead to platform specific hardware error
scenarios. And for that reason we simply disallow dma_buf_mmap() and
don't support dma_buf_vmap() for DMA-bufs holding TEE restricted
memory. The only consumers for those DMA-bufs will be the DMA capable
peripherals granted access permissions by the TEE implementation. IOW,
kernel role here will be to just provide the DMA-buf infrastructure
for buffers to be set up by TEE and then setting up DMA addresses for
peripherals to access them. The hardware crypto accelerator can be one
such peripheral.

>
> This is the alternative solution I would have preferred:
> https://lore.kernel.org/r/3de5d373c86dcaa5abc36f501c1398c4fbf05f2f.1732865109.git.lukas@wunner.de/
>
> > I am also in favour of end to end open source use-cases. But I fear
> > without progressing in a step wise manner as with this proposal we
> > would rather force developers to upstream all the software pieces in
> > one go which will be kind of a chicken and egg situation. I am sure
> > once this feature lands Mediatek folks will be interested to port
> > their secure video playback patchset [3] on top of it. Similarly other
> > silicon vendors like NXP, Qcom etc. will be motivated to do the same.
>
> The crypto use case may be easier to bring up than the video decoding
> use case because you don't need to implement a huge amount of
> user space code.

Agree, if you already have such an existing hardware use-case then
please feel free to build up on this patch-set.

-Sumit

>
> Thanks,
>
> Lukas

