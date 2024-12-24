Return-Path: <linux-media+bounces-24025-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA879FB9E0
	for <lists+linux-media@lfdr.de>; Tue, 24 Dec 2024 07:35:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7E04164B21
	for <lists+linux-media@lfdr.de>; Tue, 24 Dec 2024 06:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AECEE184540;
	Tue, 24 Dec 2024 06:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ILCTYlhs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFF929A2
	for <linux-media@vger.kernel.org>; Tue, 24 Dec 2024 06:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735022134; cv=none; b=qZko4+cQZhrgavuNE61VTjJHRdBnDy4Ly+8SrC4IJ4NWb+tiZxVcOeWCL68adTy1hwJZeQqH0ikVUg0ASTIHc3g+1qk2Uq1B7rZvcye0Jdq9kxbVn3PO6Ka0xhH2Il5RHVlLxQ+M7GRZFVtKWajA+bwGWwyPAKcgG8mjIMwc7xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735022134; c=relaxed/simple;
	bh=I9xE7/U0Fi8dO29DlF72sup1P9K1O+V3dE9r32mG9rQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lGrUvJX6MErcvoHYXr2rfpEIwon7bCkTBrh8xmspZfj01+uFakPKc2Yuu2LXNX/+eYRdzV11Ru7FRNqlQn1c831Z/Dj4fFxu73gZ9cKKMCyMUMT11Nm6Hk5ndGHTQggRKIBHxaGhfdxEvIfzDCe5SaNmXYAijtOc64aWHLqtK3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ILCTYlhs; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4afdf8520c2so1307383137.2
        for <linux-media@vger.kernel.org>; Mon, 23 Dec 2024 22:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735022130; x=1735626930; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3Zq9pXWdMCIiKRm78Fz0nKGiQDNXa8eZUXqOAkcmGfs=;
        b=ILCTYlhsJKCa7AmjBoiTiGasOKk88rZqi4z+Q/haGXIASYRzKmsIRmjzcUqYTMpiVj
         DB+oY8ScCanUW0aVJiGye9TJzQwkesAmJ66lIdMnJG3dBM2LLMKfN4pOykdlFZT8PFTD
         y9tjG8joijGAu9yw4oitdqHRxqv7piUkBcMI2YdxYGfPXiVBc9XU0u6MwJhBTxBaDhVT
         2xVz+YdUadohVVM5uOfd9HvyoiaFlPMA5ceB4IU12jpGFTlP0pV5apoL5bpn05B0oYTq
         SxV/ZBMLvue8ftQInaODl08NzujuP6ZAlrDcwG81PoxHZxvKc4e1itwJIh4vAmJTNScT
         LvxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735022130; x=1735626930;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Zq9pXWdMCIiKRm78Fz0nKGiQDNXa8eZUXqOAkcmGfs=;
        b=op4RWgfRF1myJMqaXS50mvsPoxrSN2Q6ikTL5AkqsYe874EQdFyWkIcDktZhXluqHf
         TsHO9B6K7AoJu0qDtj3Xh6+ooZMnshzuM28I2DdMZsKW5feJXQlwxaCJWI1HLdqrJmB8
         vPKIm+C/ujBZvKvTRfOF+5SpKcxhlPKOKXL3H6T6cBdg4OcNWr2hA6D0ZHtPq9eudh/i
         /c0TeSOHewg6G7Ia0ZVYCQIw7Ex6saHFj9Esto2S8psk2BUQPmKvt43/CWc0BvEk9DiG
         ZQ+JLZKG+AxcPD1c/SO3T2rZO/bj7eFgpQidkNPUXqbWdHuSO1V1r5EqXb4/OqdF3rK3
         GO+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVpX9ovFsioWHo+B1AgBPwHmbAVIN1WEEkxGq9sny9bTTSjc6O6VQKTpPQhG8qTEDw0UIHsEePrCXuJUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcZesYTP/T+3dAQti5vr4Em3Ow5TJHrCHgP1mfORzpYZrIuJeC
	NodHRFd7Sid3Qwm324/XPC0xaCpqIn9JthaEePt7PSpnCA4dmHyqVCmtk8qsnWqvVAr2pB0Sz3r
	QxcWBovLGK+XBbSzr/T+DmUupGmnOBaPnkvSTlg==
X-Gm-Gg: ASbGncv46DJ4m5MY6ZgI4jU94CZB5A+IdEXKp+6IYFkZWyM/nwjk25D2o/c3JZd8imu
	WA2HDqheSnA4ZKudY/pPUKhAPug2kgmJ9a/20Uj4=
X-Google-Smtp-Source: AGHT+IHBGEiDjz6Xi6bSRilLnhrvDUnZnjwDfKo+IRnWMREtwJZQeqlx3d2SsFhIQvcJWIOsMS/OGGYp9Fswz+6EXrA=
X-Received: by 2002:a05:6102:1629:b0:4b2:5d16:f75 with SMTP id
 ada2fe7eead31-4b2cc31c5e0mr12719925137.4.1735022130097; Mon, 23 Dec 2024
 22:35:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241217100809.3962439-1-jens.wiklander@linaro.org> <Z2KsuAs-Dd4ZDaXR@phenom.ffwll.local>
In-Reply-To: <Z2KsuAs-Dd4ZDaXR@phenom.ffwll.local>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 24 Dec 2024 12:05:19 +0530
Message-ID: <CAFA6WYNVHu7_-bNAuTYBRBdoJwfk2VrW5M4aFVkb_UWQ=uxTvQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
To: simona.vetter@ffwll.ch
Cc: Jens Wiklander <jens.wiklander@linaro.org>, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org, 
	linux-arm-kernel@lists.infradead.org, Olivier Masse <olivier.masse@nxp.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com
Content-Type: text/plain; charset="UTF-8"

Hi Simona,

On Wed, 18 Dec 2024 at 16:36, Simona Vetter <simona.vetter@ffwll.ch> wrote:
>
> On Tue, Dec 17, 2024 at 11:07:36AM +0100, Jens Wiklander wrote:
> > Hi,
> >
> > This patch set allocates the restricted DMA-bufs via the TEE subsystem.
> >
> > The TEE subsystem handles the DMA-buf allocations since it is the TEE
> > (OP-TEE, AMD-TEE, TS-TEE, or perhaps a future QCOMTEE) which sets up the
> > restrictions for the memory used for the DMA-bufs.
> >
> > I've added a new IOCTL, TEE_IOC_RSTMEM_ALLOC, to allocate the restricted
> > DMA-bufs. This IOCTL reaches the backend TEE driver, allowing it to choose
> > how to allocate the restricted physical memory.
> >
> > TEE_IOC_RSTMEM_ALLOC takes in addition to a size and flags parameters also
> > a use-case parameter. This is used by the backend TEE driver to decide on
> > allocation policy and which devices should be able to access the memory.
> >
> > Three use-cases (Secure Video Playback, Trusted UI, and Secure Video
> > Recording) has been identified so far to serve as examples of what can be
> > expected. More use-cases can be added in userspace ABI, but it's up to the
> > backend TEE drivers to provide the implementation.
> >
> > Each use-case has it's own restricted memory pool since different use-cases
> > requires isolation from different parts of the system. A restricted memory
> > pool can be based on a static carveout instantiated while probing the TEE
> > backend driver, or dynamically allocated from CMA and made restricted as
> > needed by the TEE.
> >
> > This can be tested on QEMU with the following steps:
> > repo init -u https://github.com/jenswi-linaro/manifest.git -m qemu_v8.xml \
> >         -b prototype/sdp-v4
> > repo sync -j8
> > cd build
> > make toolchains -j$(nproc)
> > make SPMC_AT_EL=1 all -j$(nproc)
> > make SPMC_AT_EL=1 run-only
> > # login and at the prompt:
> > xtest --sdp-basic
> >
> > The SPMC_AT_EL=1 parameter configures the build with FF-A and an SPMC at
> > S-EL1 inside OP-TEE. The parameter can be changed into SPMC_AT_EL=n to test
> > without FF-A using the original SMC ABI instead. Please remember to do
> > %rm -rf ../trusted-firmware-a/build/qemu
> > for TF-A to be rebuilt properly using the new configuration.
> >
> > https://optee.readthedocs.io/en/latest/building/prerequisites.html
> > list dependencies needed to build the above.
> >
> > The tests are pretty basic, mostly checking that a Trusted Application in
> > the secure world can access and manipulate the memory. There are also some
> > negative tests for out of bounds buffers etc.
>
> I think I've dropped this on earlier encrypted dma-buf discussions for
> TEE, but can't find one right now ...

Thanks for raising this query.

>
> Do we have some open source userspace for this? To my knowledge we have
> two implementations of encrypted/content protected dma-buf in upstream
> right now in the amd and intel gpu drivers, and unless I'm mistaken they
> both have some minimal userspace supporting EXT_protected_textures:

First of all to clarify the support Jens is adding here for allocating
restricted shared memory allocation in TEE subsystem is meant to be
generic and not specific to only secure media pipeline use-case. Then
here we not only have open source test applications but rather open
source firmware too (OP-TEE as a Trusted OS) [1] supporting this as a
core feature where we maintain a stable and extensible ABI among the
kernel and the OP-TEE core.

Restricted memory is a feature enforced by hardware specific firewalls
where a particular TEE implementation governs which particular block
of memory is accessible to a particular peripheral or a CPU running in
a higher privileged mode than the Linux kernel. There can be numeric
use-cases surrounding that as follows:

- Secure media pipeline where the contents gets decrypted and stored
in a restricted buffer which are then accessible only to media display
pipeline peripherals.
- Trusted user interface where a peripheral takes input from the user
and stores it in a restricted buffer which then is accessible to TEE
implementation only.
- Another possible use-case can be for the TEE implementation to store
key material in a restricted buffer which is only accessible to the
hardware crypto accelerator.

I am sure there will be more use-cases related to this feature but
those will only be possible once we provide a stable and extensible
restricted memory interface among the Linux user-space and the secure
world user-space (normally referred to as Trusted Applications).

[1] https://github.com/OP-TEE/optee_os/pull/7159

>
> https://github.com/KhronosGroup/OpenGL-Registry/blob/main/extensions/EXT/EXT_protected_textures.txt
>
> It's not great, but it does just barely clear the bar in my opinion. I
> guess something in gstreamer or similar video pipeline framework would
> also do the job.
>
> Especially with the context of the uapi discussion in the v1/RFC thread I
> think we need more than a bare-bones testcase to make sure this works in
> actual use.

Currently the TEE subsystem already supports a stable ABI for shared
memory allocator among Linux user-space and secure world user-space
here [2]. And the stable ABI for restricted memory is also along the
same lines meant to be a vendor neutral abstraction for the user-space
access. The current test cases not only test the interface but also
perform regression tests too.

I am also in favour of end to end open source use-cases. But I fear
without progressing in a step wise manner as with this proposal we
would rather force developers to upstream all the software pieces in
one go which will be kind of a chicken and egg situation. I am sure
once this feature lands Mediatek folks will be interested to port
their secure video playback patchset [3] on top of it. Similarly other
silicon vendors like NXP, Qcom etc. will be motivated to do the same.

[2] https://docs.kernel.org/userspace-api/tee.html
[3] https://lore.kernel.org/linux-arm-kernel/20240515112308.10171-1-yong.wu@mediatek.com/

-Sumit

>
> Cheers, Sima
>
> >
> > Thanks,
> > Jens
> >
> > Changes since V3:
> > * Make the use_case and flags field in struct tee_shm u32's instead of
> >   u16's
> > * Add more description for TEE_IOC_RSTMEM_ALLOC in the header file
> > * Import namespace DMA_BUF in module tee, reported by lkp@intel.com
> > * Added a note in the commit message for "optee: account for direction
> >   while converting parameters" why it's needed
> > * Factor out dynamic restricted memory allocation from
> >   "optee: support restricted memory allocation" into two new commits
> >   "optee: FF-A: dynamic restricted memory allocation" and
> >   "optee: smc abi: dynamic restricted memory allocation"
> > * Guard CMA usage with #ifdef CONFIG_CMA, effectively disabling dynamic
> >   restricted memory allocate if CMA isn't configured
> >
> > Changes since the V2 RFC:
> > * Based on v6.12
> > * Replaced the flags for SVP and Trusted UID memory with a u32 field with
> >   unique id for each use case
> > * Added dynamic allocation of restricted memory pools
> > * Added OP-TEE ABI both with and without FF-A for dynamic restricted memory
> > * Added support for FF-A with FFA_LEND
> >
> > Changes since the V1 RFC:
> > * Based on v6.11
> > * Complete rewrite, replacing the restricted heap with TEE_IOC_RSTMEM_ALLOC
> >
> > Changes since Olivier's post [2]:
> > * Based on Yong Wu's post [1] where much of dma-buf handling is done in
> >   the generic restricted heap
> > * Simplifications and cleanup
> > * New commit message for "dma-buf: heaps: add Linaro restricted dmabuf heap
> >   support"
> > * Replaced the word "secure" with "restricted" where applicable
> >
> > Jens Wiklander (6):
> >   tee: add restricted memory allocation
> >   optee: account for direction while converting parameters
> >   optee: sync secure world ABI headers
> >   optee: support restricted memory allocation
> >   optee: FF-A: dynamic restricted memory allocation
> >   optee: smc abi: dynamic restricted memory allocation
> >
> >  drivers/tee/Makefile              |   1 +
> >  drivers/tee/optee/Makefile        |   1 +
> >  drivers/tee/optee/call.c          |  10 +-
> >  drivers/tee/optee/core.c          |   1 +
> >  drivers/tee/optee/ffa_abi.c       | 178 +++++++++++++-
> >  drivers/tee/optee/optee_ffa.h     |  27 ++-
> >  drivers/tee/optee/optee_msg.h     |  65 ++++-
> >  drivers/tee/optee/optee_private.h |  75 ++++--
> >  drivers/tee/optee/optee_smc.h     |  71 +++++-
> >  drivers/tee/optee/rpc.c           |  31 ++-
> >  drivers/tee/optee/rstmem.c        | 388 ++++++++++++++++++++++++++++++
> >  drivers/tee/optee/smc_abi.c       | 213 ++++++++++++++--
> >  drivers/tee/tee_core.c            |  38 ++-
> >  drivers/tee/tee_private.h         |   2 +
> >  drivers/tee/tee_rstmem.c          | 201 ++++++++++++++++
> >  drivers/tee/tee_shm.c             |   2 +
> >  drivers/tee/tee_shm_pool.c        |  69 +++++-
> >  include/linux/tee_core.h          |  15 ++
> >  include/linux/tee_drv.h           |   2 +
> >  include/uapi/linux/tee.h          |  44 +++-
> >  20 files changed, 1358 insertions(+), 76 deletions(-)
> >  create mode 100644 drivers/tee/optee/rstmem.c
> >  create mode 100644 drivers/tee/tee_rstmem.c
> >
> >
> > base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
> > --
> > 2.43.0
> >
>
> --
> Simona Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

