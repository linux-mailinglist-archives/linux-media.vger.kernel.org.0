Return-Path: <linux-media+bounces-19889-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCE49A421A
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 17:17:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 80CB11C2364C
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 15:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6358200C8E;
	Fri, 18 Oct 2024 15:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mvzrp7HJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB2F23D2
	for <linux-media@vger.kernel.org>; Fri, 18 Oct 2024 15:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729264612; cv=none; b=a0QOujsCrcGWHAfM5l/cPkjKT5P6B0CznVDHgL+qlvaFLiIPSTIPnBQrfclSbnmatm+wkH0joncArgtmc4ksEtD3n95byjfnIcRAsnnu2Q9q+xzV2S88v/Ns4E+BKWAMkiSr239Nw+YPQGM7/7V5RmERqmf8aqz7mjsgd5RrMRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729264612; c=relaxed/simple;
	bh=LygxUKJfVLMcjkQWcdeYML3V3fjbveTCoh/9SlrPUjI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mA38Iqgu+mR5DKpTgG6OOYmKX+XakeyTVKJE6g8TXESiC9yadgADjQDoW6XrrOgsqJo69GqI6E4ddEBTF63WT3EpJwn9qQFm7L9/tqtHXxriyE8KgqsBGtK1JUfR0J/Idzh0PJ3Js5IFR6rMRc7iw+vDVhXb4Mr/lT/UwCI+ycY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mvzrp7HJ; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-2689e7a941fso1151932fac.3
        for <linux-media@vger.kernel.org>; Fri, 18 Oct 2024 08:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729264608; x=1729869408; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jAytm+vTrrtYhXgD+UllQFjS/zTHJKwJ78TI6ibsmew=;
        b=Mvzrp7HJ+40K1rPBczx7OxtRWToy7Wfq7rT56pZR7iB6ombfhHFbGE4fcwJ3E1SIHm
         F7Gj6JMF1C7Gy/JW5Y2drUyqtFlUf7NbLSyHGJMlfxEZ70pIjfMejHNc2od/fdRyoFYu
         cEezS3LEeoINjug9fc+PM8/XwFkCdX6wXjKiAnac3hrePi7xFfTlcWZ6PbrPi53PY9Co
         2SeI2UGohFsmKdIIjrx4B/ImIFSFszMtNryEztvAxsGuVEnbQ1oWA6DFXNP/D49pEQ2j
         woRN4xN8ndAVtjId/ksryVXjnjh4jMWcwD2yyG/wkcEFVJhnuLZnavhlq5rSHkhdspqC
         XZog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729264608; x=1729869408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jAytm+vTrrtYhXgD+UllQFjS/zTHJKwJ78TI6ibsmew=;
        b=NkwqO3be65ouMEADY3YzYLPoTOHE8lDyTRtFBy3U/XfYIfbRgNWmZfThfnvqNXALI0
         /ExCd04O7eSKu1Kt46zcNRQQ28aS6Xr5ERpnX3gldaoMpzIdEfk6aI1ASs5fidwwu1sk
         0EXBxgkoGzZtGxU0BleoSOXAKh6oAE64/jZCsYYjvRe9hbs6N43yxImPU/lW3m9gzRWQ
         yiD7KL/rmW5tJuIJ52RMQsBPp/06gwq9lJYO7/0zw5XCFZ4W9EW0TmW0RjEfyoClJ/zy
         PQAMtZdXyrX55ES1G7BkN1DWPyT/ZCIAQWMcW8uqxz0urMHWfhcxtyesPkO2GDDGKKqz
         26ZA==
X-Forwarded-Encrypted: i=1; AJvYcCUHyT3x/lecGJ6V3Xp24t1V0q5+AkXYPyy1v+sIFL1QqEyQX9prItt//p+xq/gnXWU65UHYJ+6JWMV9og==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWWYsucAEmCp9F+Qpi+FudtTPFpWiUHZgMId1MLad6spxBEIgn
	v7ikgN5eru0PTueTSiiNdy7ceeu8YlI7PRbpx+dxaCHPzreb3GlIeI/9XGRvq4rgZvmvhxMe7iT
	dFyx5z4p24T64O8j7IFSHb0sW5ppiLSU3WfBc0g==
X-Google-Smtp-Source: AGHT+IGolIsaMF++Cy6m1kdkSWxRaRgoSmJ+SJAAIuYVSNeW7g86RMg1ygCv7BHSNEhaFysoGwUOjmgwMXq354t4fEo=
X-Received: by 2002:a05:6870:1594:b0:288:2906:6877 with SMTP id
 586e51a60fabf-2892c5b26d6mr2532230fac.45.1729264608454; Fri, 18 Oct 2024
 08:16:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241015101716.740829-1-jens.wiklander@linaro.org> <CAFA6WYOCDf6RqHr7E9nN7DQdoq+ZDwFO=Y0yB+fzit2GwzDkGg@mail.gmail.com>
In-Reply-To: <CAFA6WYOCDf6RqHr7E9nN7DQdoq+ZDwFO=Y0yB+fzit2GwzDkGg@mail.gmail.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 18 Oct 2024 17:16:36 +0200
Message-ID: <CAHUa44Fonf1RdEJ-_SmBS_9+QZmhJ-O0UCi_FNm1xs655oM2Tw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/2] TEE subsystem for restricted dma-buf allocations
To: Sumit Garg <sumit.garg@linaro.org>
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
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2024 at 12:46=E2=80=AFPM Sumit Garg <sumit.garg@linaro.org>=
 wrote:
>
> Hi Jens,
>
> On Tue, 15 Oct 2024 at 15:47, Jens Wiklander <jens.wiklander@linaro.org> =
wrote:
> >
> > Hi,
> >
> > This patch set allocates the restricted DMA-bufs via the TEE subsystem.
> > This a complete rewrite compared to the previous patch set [1], and oth=
er
> > earlier proposals [2] and [3] with a separate restricted heap.
> >
> > The TEE subsystem handles the DMA-buf allocations since it is the TEE
> > (OP-TEE, AMD-TEE, TS-TEE, or a future QTEE) which sets up the restricti=
ons
> > for the memory used for the DMA-bufs.
>
> Thanks for proposing this interface. IMHO, this solution will address
> many concerns raised for the prior vendor specific DMA heaps approach
> [1] as follows:
>
> 1. User-space interacting with the TEE subsystem for restricted memory
> allocation makes it obvious that the returned DMA buf can't be
> directly mapped by the CPU.
>
> 2. All the low level platform details gets abstracted out for
> user-space regarding how the platform specific memory restriction
> comes into play.
>
> 3. User-space doesn't have to deal with holding 2 DMA buffer
> references, one after allocation from DMA heap and other for
> communication with the TEE subsystem.
>
> 4. Allows for better co-ordination with other kernel subsystems
> dealing with restricted DMA-bufs.
>
> [1] https://lore.kernel.org/linux-arm-kernel/20240515112308.10171-1-yong.=
wu@mediatek.com/
>
> >
> > I've added a new IOCTL, TEE_IOC_RSTMEM_ALLOC, to allocate the restricte=
d
> > DMA-bufs. This new IOCTL reaches the backend TEE driver, allowing it to
> > choose how to allocate the restricted physical memory.
> >
> > TEE_IOC_RSTMEM_ALLOC is quite similar to TEE_IOC_SHM_ALLOC so it's temp=
ting
> > to extend TEE_IOC_SHM_ALLOC with two new flags
> > TEE_IOC_SHM_FLAG_SECURE_VIDEO and TEE_IOC_SHM_FLAG_SECURE_TRUSTED_UI fo=
r
> > the same feature. However, it might be a bit confusing since
> > TEE_IOC_SHM_ALLOC only returns an anonymous file descriptor, but
> > TEE_IOC_SHM_FLAG_SECURE_VIDEO and TEE_IOC_SHM_FLAG_SECURE_TRUSTED_UI wo=
uld
> > return a DMA-buf file descriptor instead. What do others think?
>
> I think it's better to keep it as a separate IOCTL given the primary
> objective of buffer allocation and it's usage.

Agreed.

Thanks,
Jens

>
> -Sumit
>
> >
> > This can be tested on QEMU with the following steps:
> > repo init -u https://github.com/jenswi-linaro/manifest.git -m qemu_v8.x=
ml \
> >         -b prototype/sdp-v2
> > repo sync -j8
> > cd build
> > make toolchains -j4
> > make all -j$(nproc)
> > make run-only
> > # login and at the prompt:
> > xtest --sdp-basic
> >
> > https://optee.readthedocs.io/en/latest/building/prerequisites.html
> > list dependencies needed to build the above.
> >
> > The tests are pretty basic, mostly checking that a Trusted Application =
in
> > the secure world can access and manipulate the memory. There are also s=
ome
> > negative tests for out of bounds buffers etc.
> >
> > Thanks,
> > Jens
> >
> > [1] https://lore.kernel.org/lkml/20240830070351.2855919-1-jens.wiklande=
r@linaro.org/
> > [2] https://lore.kernel.org/dri-devel/20240515112308.10171-1-yong.wu@me=
diatek.com/
> > [3] https://lore.kernel.org/lkml/20220805135330.970-1-olivier.masse@nxp=
.com/
> >
> > Changes since the V1 RFC:
> > * Based on v6.11
> > * Complete rewrite, replacing the restricted heap with TEE_IOC_RSTMEM_A=
LLOC
> >
> > Changes since Olivier's post [2]:
> > * Based on Yong Wu's post [1] where much of dma-buf handling is done in
> >   the generic restricted heap
> > * Simplifications and cleanup
> > * New commit message for "dma-buf: heaps: add Linaro restricted dmabuf =
heap
> >   support"
> > * Replaced the word "secure" with "restricted" where applicable
> >
> > Jens Wiklander (2):
> >   tee: add restricted memory allocation
> >   optee: support restricted memory allocation
> >
> >  drivers/tee/Makefile              |   1 +
> >  drivers/tee/optee/core.c          |  21 ++++
> >  drivers/tee/optee/optee_private.h |   6 +
> >  drivers/tee/optee/optee_smc.h     |  35 ++++++
> >  drivers/tee/optee/smc_abi.c       |  45 ++++++-
> >  drivers/tee/tee_core.c            |  33 ++++-
> >  drivers/tee/tee_private.h         |   2 +
> >  drivers/tee/tee_rstmem.c          | 200 ++++++++++++++++++++++++++++++
> >  drivers/tee/tee_shm.c             |   2 +
> >  drivers/tee/tee_shm_pool.c        |  69 ++++++++++-
> >  include/linux/tee_core.h          |   6 +
> >  include/linux/tee_drv.h           |   9 ++
> >  include/uapi/linux/tee.h          |  33 ++++-
> >  13 files changed, 455 insertions(+), 7 deletions(-)
> >  create mode 100644 drivers/tee/tee_rstmem.c
> >
> > --
> > 2.43.0
> >

