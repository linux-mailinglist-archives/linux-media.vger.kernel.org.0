Return-Path: <linux-media+bounces-19793-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA749A204B
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2024 12:46:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C1D21C25041
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2024 10:46:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B122A1DAC9D;
	Thu, 17 Oct 2024 10:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YMbFW9Qg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCF51D9A44
	for <linux-media@vger.kernel.org>; Thu, 17 Oct 2024 10:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729161997; cv=none; b=fG6y46rlfLARcQMx9OGpZL/brGjTvs9N2/rHCsP0N82wx0O62QtIatiz41hSptBLdcRiVWmPhbv71fP0BmaNQ31j0cIEAz9odMav1UwEN+Eq5x0kKajmCDM4YzT2lLEd8FSkZJLCqz1ALTaHKburUbeFKLU4APO3e2VugEZZYZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729161997; c=relaxed/simple;
	bh=FxfJctS2+GCXh8kAlmoQ3toy0Gs0PnNzX6uu9kFmvzM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rm9+hprQdOaOdF+DO3v8Gjy3o8GPrjgg3cSEYO2IrNBjohewWdXrDwvgzd9dfe8+3j4CZZH95HYfH8qpXDz+krTcZyZbobmjTzsNw9K98zE4JDV5CvzzxvtS382fevZcPGRZZmLY/3U5SvI4fjgMVK3I34pUGP6N8BsvTGKuhV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YMbFW9Qg; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4a47d1a62bdso219345137.0
        for <linux-media@vger.kernel.org>; Thu, 17 Oct 2024 03:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729161992; x=1729766792; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5iLc9AQWQ9bPZ9PdWCnYLRDGxR6aVrX6pCcUlaC2gXg=;
        b=YMbFW9QgdOfhYNN5VZxo3Z8L114X8Xv3RZ5In3ojo2TnrB4AwQjksAWIC2GPqp/fHc
         Pw3y3ukFWm6gUx4B7LpTusrIxnWxHXWaFqKcKGBsVLveghrEzzNglj/ipWC7I3oR9dQt
         xAoQICQ9pfFqjxqKmCvzzY4rbVANZpe5RufqTnQ2BZ+VxIEHpCEe1GPehXkuk8c3lcIF
         519bCUKRDdHHXmIodCTVgFB4vI6qe//7WBk4JC7pLxZ0l9xw/M7u/ZyW9OYOgucsl28g
         ivo/Cs6PFPaDgvaoIJ3PJ/Lenrq8PjuL1pWeEdy3EYKwwh4c+EUFUG1KJqLT1Fo+Avno
         z++A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729161992; x=1729766792;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5iLc9AQWQ9bPZ9PdWCnYLRDGxR6aVrX6pCcUlaC2gXg=;
        b=V9x5VNZgUlgp+I7VV1aqJ/voL8T4mD5fNKSyEPhz9HSShOiihmGNIzYWtGamlTcBzV
         dyw3mM039cUP5W+4NsJSgZuf4brjILWSEFtl8xydl9Ikf/wXOEXTisAicE6Z5Sa4gO0L
         wsrfprQlP3zNdDmNJbyjKMjBjVbD9RAh23uZsLWHvKoDZB4fbJWuedrsz01eLg5LDSmF
         QMWohfXEIu0YsS8d2gvjjdR01CqrSgUfitFuVbjFkQ/RPHFit6PJKCiq/sSWDj/ArTDy
         ddQZkm1FPIa4s87dKp6RyTx7X0xYGi0LMfX/M5jo85t2IGW/Bz/uPagg2i7ME7SeywB/
         3KQg==
X-Forwarded-Encrypted: i=1; AJvYcCU2+Ce8YC4YOLKv3n21mIe8T+/ZhQ4XVygCB4TGHjCQi02n1hsg8N1x5ZQJA/tITU2no7zO7J5z+CVYoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEHdtz4el9LhYUeLt6o6ZQZTlreeRv21DmhCAEopmtJusZn6r5
	uXjqUMyVOOpITluRQpfT9gvEadjnqKCsvJg9PWgqV0mpdT3u0u0q2PGfEf9UC+sIogE4ZbgIvjv
	z59VnYJtefThSlQQRypFhGDYHPE+J3atShFrYmA==
X-Google-Smtp-Source: AGHT+IEhuubEp1XFMcAt1Qdpoup5VxogAcu1pC1JHif0I5jEeCDESB436aTA1yUdhOINM3pMJD6rd6T5GIpOG8DyYOM=
X-Received: by 2002:a05:6102:26c2:b0:4a4:8ef0:25ba with SMTP id
 ada2fe7eead31-4a5b5a3f858mr5284146137.21.1729161991842; Thu, 17 Oct 2024
 03:46:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241015101716.740829-1-jens.wiklander@linaro.org>
In-Reply-To: <20241015101716.740829-1-jens.wiklander@linaro.org>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Thu, 17 Oct 2024 16:16:20 +0530
Message-ID: <CAFA6WYOCDf6RqHr7E9nN7DQdoq+ZDwFO=Y0yB+fzit2GwzDkGg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/2] TEE subsystem for restricted dma-buf allocations
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
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

Hi Jens,

On Tue, 15 Oct 2024 at 15:47, Jens Wiklander <jens.wiklander@linaro.org> wrote:
>
> Hi,
>
> This patch set allocates the restricted DMA-bufs via the TEE subsystem.
> This a complete rewrite compared to the previous patch set [1], and other
> earlier proposals [2] and [3] with a separate restricted heap.
>
> The TEE subsystem handles the DMA-buf allocations since it is the TEE
> (OP-TEE, AMD-TEE, TS-TEE, or a future QTEE) which sets up the restrictions
> for the memory used for the DMA-bufs.

Thanks for proposing this interface. IMHO, this solution will address
many concerns raised for the prior vendor specific DMA heaps approach
[1] as follows:

1. User-space interacting with the TEE subsystem for restricted memory
allocation makes it obvious that the returned DMA buf can't be
directly mapped by the CPU.

2. All the low level platform details gets abstracted out for
user-space regarding how the platform specific memory restriction
comes into play.

3. User-space doesn't have to deal with holding 2 DMA buffer
references, one after allocation from DMA heap and other for
communication with the TEE subsystem.

4. Allows for better co-ordination with other kernel subsystems
dealing with restricted DMA-bufs.

[1] https://lore.kernel.org/linux-arm-kernel/20240515112308.10171-1-yong.wu@mediatek.com/

>
> I've added a new IOCTL, TEE_IOC_RSTMEM_ALLOC, to allocate the restricted
> DMA-bufs. This new IOCTL reaches the backend TEE driver, allowing it to
> choose how to allocate the restricted physical memory.
>
> TEE_IOC_RSTMEM_ALLOC is quite similar to TEE_IOC_SHM_ALLOC so it's tempting
> to extend TEE_IOC_SHM_ALLOC with two new flags
> TEE_IOC_SHM_FLAG_SECURE_VIDEO and TEE_IOC_SHM_FLAG_SECURE_TRUSTED_UI for
> the same feature. However, it might be a bit confusing since
> TEE_IOC_SHM_ALLOC only returns an anonymous file descriptor, but
> TEE_IOC_SHM_FLAG_SECURE_VIDEO and TEE_IOC_SHM_FLAG_SECURE_TRUSTED_UI would
> return a DMA-buf file descriptor instead. What do others think?

I think it's better to keep it as a separate IOCTL given the primary
objective of buffer allocation and it's usage.

-Sumit

>
> This can be tested on QEMU with the following steps:
> repo init -u https://github.com/jenswi-linaro/manifest.git -m qemu_v8.xml \
>         -b prototype/sdp-v2
> repo sync -j8
> cd build
> make toolchains -j4
> make all -j$(nproc)
> make run-only
> # login and at the prompt:
> xtest --sdp-basic
>
> https://optee.readthedocs.io/en/latest/building/prerequisites.html
> list dependencies needed to build the above.
>
> The tests are pretty basic, mostly checking that a Trusted Application in
> the secure world can access and manipulate the memory. There are also some
> negative tests for out of bounds buffers etc.
>
> Thanks,
> Jens
>
> [1] https://lore.kernel.org/lkml/20240830070351.2855919-1-jens.wiklander@linaro.org/
> [2] https://lore.kernel.org/dri-devel/20240515112308.10171-1-yong.wu@mediatek.com/
> [3] https://lore.kernel.org/lkml/20220805135330.970-1-olivier.masse@nxp.com/
>
> Changes since the V1 RFC:
> * Based on v6.11
> * Complete rewrite, replacing the restricted heap with TEE_IOC_RSTMEM_ALLOC
>
> Changes since Olivier's post [2]:
> * Based on Yong Wu's post [1] where much of dma-buf handling is done in
>   the generic restricted heap
> * Simplifications and cleanup
> * New commit message for "dma-buf: heaps: add Linaro restricted dmabuf heap
>   support"
> * Replaced the word "secure" with "restricted" where applicable
>
> Jens Wiklander (2):
>   tee: add restricted memory allocation
>   optee: support restricted memory allocation
>
>  drivers/tee/Makefile              |   1 +
>  drivers/tee/optee/core.c          |  21 ++++
>  drivers/tee/optee/optee_private.h |   6 +
>  drivers/tee/optee/optee_smc.h     |  35 ++++++
>  drivers/tee/optee/smc_abi.c       |  45 ++++++-
>  drivers/tee/tee_core.c            |  33 ++++-
>  drivers/tee/tee_private.h         |   2 +
>  drivers/tee/tee_rstmem.c          | 200 ++++++++++++++++++++++++++++++
>  drivers/tee/tee_shm.c             |   2 +
>  drivers/tee/tee_shm_pool.c        |  69 ++++++++++-
>  include/linux/tee_core.h          |   6 +
>  include/linux/tee_drv.h           |   9 ++
>  include/uapi/linux/tee.h          |  33 ++++-
>  13 files changed, 455 insertions(+), 7 deletions(-)
>  create mode 100644 drivers/tee/tee_rstmem.c
>
> --
> 2.43.0
>

