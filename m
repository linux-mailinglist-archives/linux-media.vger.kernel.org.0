Return-Path: <linux-media+bounces-24462-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BE5A062C0
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 17:58:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FB961887B15
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 16:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 771611FF7CD;
	Wed,  8 Jan 2025 16:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="WEhY/R6m"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D351FF7AA
	for <linux-media@vger.kernel.org>; Wed,  8 Jan 2025 16:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736355476; cv=none; b=HSXtY/AgvIqRwZZjHwh/DuJoBrIy+Qmi7JXjWBgA5Yb4LTgbp51KeXCCzcZEJcw5xZ9MdkVffgm+ygqxwemn2xI9Y1V57ja20JH/qwbbKPK8/puJazv7cA7ESbWWwEKRMrWn0t9XkspJctPm+TvQaCrYCuXG+PZ59harZp6PM/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736355476; c=relaxed/simple;
	bh=tQ5niBL7tvgX0ixWbOA1r6t8yJwsqFxqZ1GiXYyObtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CLlcTWKXZH6j5n++E88VHU5Jf9fIqZg3SQ7D6L200L2na+GCYMrmJznjy27tcYRNEnpTMzTJCvVfv+is5tOGamBETdDZBGOuPjtLLB0s8qtuMaV4pnVe6+3UnLdROnh3IWJENQgfN+14zwUvdSgPvjDJatwWQzqDD64TRyqmxtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=WEhY/R6m; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4363dc916ceso7235225e9.0
        for <linux-media@vger.kernel.org>; Wed, 08 Jan 2025 08:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1736355473; x=1736960273; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0tPGYymga8OEn8r1EYBnLXSbNhvYtLaDM3m4Rxn8+bY=;
        b=WEhY/R6mBE6Ce2p20NwIebuOnC+UQOsg/dNbOiGnpFtWRLozKrK9T2ySasr2/gv9+2
         2Tk6eaDkR3eoAOUwHpuyjeP6TqF3BdZRgta9OZywt6DSayuzlNsCrAq5u8TYL31eywAn
         yUaGmsohezo8r13h4w92BQuTyX+z3HlHP9qB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736355473; x=1736960273;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0tPGYymga8OEn8r1EYBnLXSbNhvYtLaDM3m4Rxn8+bY=;
        b=Bc73tUXbDkDvEHI99y4jc8oIbFAQlDPUNjhQXWhUOxJJB7r6qI+O+WdMwVNWgmxWxg
         VFsSaLXalDhF2G2+bitJtngDiTsJiRS5mDFRufV1Pc/bPjlcSqm+7FVx3zicz+itSLs/
         Gt4Wu0sek+QvhyxITqdQ3YZC4e9t2Lb+4mJkimQI/e281tPo6S4TK/7y9AEcevxvksF6
         S0dI4omhhkCts6tG9cH66tUWW1NWeGAiH+fgTcMnj3FQD1kI4FFEqIki9yln5pAiARwW
         CTOW4zg3yaISUWmENYfIEnqjFeaTzDFExS/cE6mj3iVoO7Hs7PO6shp85vDuc7nGogoQ
         kJ0w==
X-Forwarded-Encrypted: i=1; AJvYcCV4qsLt+iHtdgDxuoKuUYVeAeoch70UTAPPK+T9eSQJSdm28As2nhShA4XlHH6Jw3TLtajJb1y13LF6Ng==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYvTBJMSns6xCyHrfwNnOjcrd6nY4lcD7UYBM3G3ktSERnRfei
	ysGYswUZXRq36CT4n/i0fRPJkXN11cbWaw+bGn1RP/ySowWivqpJHvh+tTya3kdSDTY/3nJilRB
	2
X-Gm-Gg: ASbGnctQbYAxVuQymw+L1wTPd8ts0g8+LkFdpvwxNJJ36hwv9amveeWZCH8Obvi7YIw
	ng6X43duSdG8vxAEzNjHeH71eXqfpcv9f+T/hp9u95r2t6h9jWwiCsm37QoStMVm+83NUvdiFVV
	1i/3kMnFINu7rZzOycCbhbGD3/p30fLUyAv3HJf6sh3NWItQHfXCaqnVvHEW2YaCQ4KhBXI/d6m
	w2DJYKz9jVcVBy2Ia8E89w1yn0KJQ8USxhEHfe8e4qLmXsr/xMsAdVLT3PwONtrFh3N
X-Google-Smtp-Source: AGHT+IFKluDkp2P67lSFAn3UYumWfOOrcVKXJ4s1cpAviNR0WHIQ3RR5NqVHBYruKqlZTt7rmVNo3Q==
X-Received: by 2002:a05:6000:1fa5:b0:38a:88ac:ee69 with SMTP id ffacd0b85a97d-38a8b0d5bb4mr18015f8f.13.1736355473070;
        Wed, 08 Jan 2025 08:57:53 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c832e69sm52800921f8f.35.2025.01.08.08.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 08:57:52 -0800 (PST)
Date: Wed, 8 Jan 2025 17:57:50 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: simona.vetter@ffwll.ch, Jens Wiklander <jens.wiklander@linaro.org>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org,
	Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
Message-ID: <Z36ujiS8yyG1mfbA@phenom.ffwll.local>
Mail-Followup-To: Sumit Garg <sumit.garg@linaro.org>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org,
	Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com
References: <20241217100809.3962439-1-jens.wiklander@linaro.org>
 <Z2KsuAs-Dd4ZDaXR@phenom.ffwll.local>
 <CAFA6WYNVHu7_-bNAuTYBRBdoJwfk2VrW5M4aFVkb_UWQ=uxTvQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFA6WYNVHu7_-bNAuTYBRBdoJwfk2VrW5M4aFVkb_UWQ=uxTvQ@mail.gmail.com>
X-Operating-System: Linux phenom 6.12.3-amd64 

On Tue, Dec 24, 2024 at 12:05:19PM +0530, Sumit Garg wrote:
> Hi Simona,
> 
> On Wed, 18 Dec 2024 at 16:36, Simona Vetter <simona.vetter@ffwll.ch> wrote:
> >
> > On Tue, Dec 17, 2024 at 11:07:36AM +0100, Jens Wiklander wrote:
> > > Hi,
> > >
> > > This patch set allocates the restricted DMA-bufs via the TEE subsystem.
> > >
> > > The TEE subsystem handles the DMA-buf allocations since it is the TEE
> > > (OP-TEE, AMD-TEE, TS-TEE, or perhaps a future QCOMTEE) which sets up the
> > > restrictions for the memory used for the DMA-bufs.
> > >
> > > I've added a new IOCTL, TEE_IOC_RSTMEM_ALLOC, to allocate the restricted
> > > DMA-bufs. This IOCTL reaches the backend TEE driver, allowing it to choose
> > > how to allocate the restricted physical memory.
> > >
> > > TEE_IOC_RSTMEM_ALLOC takes in addition to a size and flags parameters also
> > > a use-case parameter. This is used by the backend TEE driver to decide on
> > > allocation policy and which devices should be able to access the memory.
> > >
> > > Three use-cases (Secure Video Playback, Trusted UI, and Secure Video
> > > Recording) has been identified so far to serve as examples of what can be
> > > expected. More use-cases can be added in userspace ABI, but it's up to the
> > > backend TEE drivers to provide the implementation.
> > >
> > > Each use-case has it's own restricted memory pool since different use-cases
> > > requires isolation from different parts of the system. A restricted memory
> > > pool can be based on a static carveout instantiated while probing the TEE
> > > backend driver, or dynamically allocated from CMA and made restricted as
> > > needed by the TEE.
> > >
> > > This can be tested on QEMU with the following steps:
> > > repo init -u https://github.com/jenswi-linaro/manifest.git -m qemu_v8.xml \
> > >         -b prototype/sdp-v4
> > > repo sync -j8
> > > cd build
> > > make toolchains -j$(nproc)
> > > make SPMC_AT_EL=1 all -j$(nproc)
> > > make SPMC_AT_EL=1 run-only
> > > # login and at the prompt:
> > > xtest --sdp-basic
> > >
> > > The SPMC_AT_EL=1 parameter configures the build with FF-A and an SPMC at
> > > S-EL1 inside OP-TEE. The parameter can be changed into SPMC_AT_EL=n to test
> > > without FF-A using the original SMC ABI instead. Please remember to do
> > > %rm -rf ../trusted-firmware-a/build/qemu
> > > for TF-A to be rebuilt properly using the new configuration.
> > >
> > > https://optee.readthedocs.io/en/latest/building/prerequisites.html
> > > list dependencies needed to build the above.
> > >
> > > The tests are pretty basic, mostly checking that a Trusted Application in
> > > the secure world can access and manipulate the memory. There are also some
> > > negative tests for out of bounds buffers etc.
> >
> > I think I've dropped this on earlier encrypted dma-buf discussions for
> > TEE, but can't find one right now ...
> 
> Thanks for raising this query.
> 
> >
> > Do we have some open source userspace for this? To my knowledge we have
> > two implementations of encrypted/content protected dma-buf in upstream
> > right now in the amd and intel gpu drivers, and unless I'm mistaken they
> > both have some minimal userspace supporting EXT_protected_textures:
> 
> First of all to clarify the support Jens is adding here for allocating
> restricted shared memory allocation in TEE subsystem is meant to be
> generic and not specific to only secure media pipeline use-case. Then
> here we not only have open source test applications but rather open
> source firmware too (OP-TEE as a Trusted OS) [1] supporting this as a
> core feature where we maintain a stable and extensible ABI among the
> kernel and the OP-TEE core.
> 
> Restricted memory is a feature enforced by hardware specific firewalls
> where a particular TEE implementation governs which particular block
> of memory is accessible to a particular peripheral or a CPU running in
> a higher privileged mode than the Linux kernel. There can be numeric
> use-cases surrounding that as follows:
> 
> - Secure media pipeline where the contents gets decrypted and stored
> in a restricted buffer which are then accessible only to media display
> pipeline peripherals.
> - Trusted user interface where a peripheral takes input from the user
> and stores it in a restricted buffer which then is accessible to TEE
> implementation only.
> - Another possible use-case can be for the TEE implementation to store
> key material in a restricted buffer which is only accessible to the
> hardware crypto accelerator.
> 
> I am sure there will be more use-cases related to this feature but
> those will only be possible once we provide a stable and extensible
> restricted memory interface among the Linux user-space and the secure
> world user-space (normally referred to as Trusted Applications).
> 
> [1] https://github.com/OP-TEE/optee_os/pull/7159
> 
> >
> > https://github.com/KhronosGroup/OpenGL-Registry/blob/main/extensions/EXT/EXT_protected_textures.txt
> >
> > It's not great, but it does just barely clear the bar in my opinion. I
> > guess something in gstreamer or similar video pipeline framework would
> > also do the job.
> >
> > Especially with the context of the uapi discussion in the v1/RFC thread I
> > think we need more than a bare-bones testcase to make sure this works in
> > actual use.
> 
> Currently the TEE subsystem already supports a stable ABI for shared
> memory allocator among Linux user-space and secure world user-space
> here [2]. And the stable ABI for restricted memory is also along the
> same lines meant to be a vendor neutral abstraction for the user-space
> access. The current test cases not only test the interface but also
> perform regression tests too.
> 
> I am also in favour of end to end open source use-cases. But I fear
> without progressing in a step wise manner as with this proposal we
> would rather force developers to upstream all the software pieces in
> one go which will be kind of a chicken and egg situation. I am sure
> once this feature lands Mediatek folks will be interested to port
> their secure video playback patchset [3] on top of it. Similarly other
> silicon vendors like NXP, Qcom etc. will be motivated to do the same.
> 
> [2] https://docs.kernel.org/userspace-api/tee.html
> [3] https://lore.kernel.org/linux-arm-kernel/20240515112308.10171-1-yong.wu@mediatek.com/

We get entire opengl/vulkan driver stacks ready before we merge new drm
drivers, I really don't think this is too hard from a technical pov. And I
think the mediatek patches had the same issue of lacking userspace for it,
so that's not moving things forward.
-Sima

> 
> -Sumit
> 
> >
> > Cheers, Sima
> >
> > >
> > > Thanks,
> > > Jens
> > >
> > > Changes since V3:
> > > * Make the use_case and flags field in struct tee_shm u32's instead of
> > >   u16's
> > > * Add more description for TEE_IOC_RSTMEM_ALLOC in the header file
> > > * Import namespace DMA_BUF in module tee, reported by lkp@intel.com
> > > * Added a note in the commit message for "optee: account for direction
> > >   while converting parameters" why it's needed
> > > * Factor out dynamic restricted memory allocation from
> > >   "optee: support restricted memory allocation" into two new commits
> > >   "optee: FF-A: dynamic restricted memory allocation" and
> > >   "optee: smc abi: dynamic restricted memory allocation"
> > > * Guard CMA usage with #ifdef CONFIG_CMA, effectively disabling dynamic
> > >   restricted memory allocate if CMA isn't configured
> > >
> > > Changes since the V2 RFC:
> > > * Based on v6.12
> > > * Replaced the flags for SVP and Trusted UID memory with a u32 field with
> > >   unique id for each use case
> > > * Added dynamic allocation of restricted memory pools
> > > * Added OP-TEE ABI both with and without FF-A for dynamic restricted memory
> > > * Added support for FF-A with FFA_LEND
> > >
> > > Changes since the V1 RFC:
> > > * Based on v6.11
> > > * Complete rewrite, replacing the restricted heap with TEE_IOC_RSTMEM_ALLOC
> > >
> > > Changes since Olivier's post [2]:
> > > * Based on Yong Wu's post [1] where much of dma-buf handling is done in
> > >   the generic restricted heap
> > > * Simplifications and cleanup
> > > * New commit message for "dma-buf: heaps: add Linaro restricted dmabuf heap
> > >   support"
> > > * Replaced the word "secure" with "restricted" where applicable
> > >
> > > Jens Wiklander (6):
> > >   tee: add restricted memory allocation
> > >   optee: account for direction while converting parameters
> > >   optee: sync secure world ABI headers
> > >   optee: support restricted memory allocation
> > >   optee: FF-A: dynamic restricted memory allocation
> > >   optee: smc abi: dynamic restricted memory allocation
> > >
> > >  drivers/tee/Makefile              |   1 +
> > >  drivers/tee/optee/Makefile        |   1 +
> > >  drivers/tee/optee/call.c          |  10 +-
> > >  drivers/tee/optee/core.c          |   1 +
> > >  drivers/tee/optee/ffa_abi.c       | 178 +++++++++++++-
> > >  drivers/tee/optee/optee_ffa.h     |  27 ++-
> > >  drivers/tee/optee/optee_msg.h     |  65 ++++-
> > >  drivers/tee/optee/optee_private.h |  75 ++++--
> > >  drivers/tee/optee/optee_smc.h     |  71 +++++-
> > >  drivers/tee/optee/rpc.c           |  31 ++-
> > >  drivers/tee/optee/rstmem.c        | 388 ++++++++++++++++++++++++++++++
> > >  drivers/tee/optee/smc_abi.c       | 213 ++++++++++++++--
> > >  drivers/tee/tee_core.c            |  38 ++-
> > >  drivers/tee/tee_private.h         |   2 +
> > >  drivers/tee/tee_rstmem.c          | 201 ++++++++++++++++
> > >  drivers/tee/tee_shm.c             |   2 +
> > >  drivers/tee/tee_shm_pool.c        |  69 +++++-
> > >  include/linux/tee_core.h          |  15 ++
> > >  include/linux/tee_drv.h           |   2 +
> > >  include/uapi/linux/tee.h          |  44 +++-
> > >  20 files changed, 1358 insertions(+), 76 deletions(-)
> > >  create mode 100644 drivers/tee/optee/rstmem.c
> > >  create mode 100644 drivers/tee/tee_rstmem.c
> > >
> > >
> > > base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
> > > --
> > > 2.43.0
> > >
> >
> > --
> > Simona Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

