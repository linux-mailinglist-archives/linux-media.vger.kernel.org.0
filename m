Return-Path: <linux-media+bounces-29596-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 938C7A7F949
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 11:20:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C32F1735A1
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 09:20:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C95D264FA0;
	Tue,  8 Apr 2025 09:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xm+As+b9"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659CB1990CD;
	Tue,  8 Apr 2025 09:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104024; cv=none; b=BYZxPNwP5voQGavtGX+HlfzzCV9+oo8u1QYtinK8ni1GZehN6mMoBCLPUpPKHiui7DKNMK/5n/2zkAALkvCmYifLZyPFKF6I9TmrnsnRsghRwhBdTXhZ+uJ9Uge8slyO6VM8Q/sNYMu/6u5gilLH7GBF/cEYTxIRPpJCI/qd1/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104024; c=relaxed/simple;
	bh=oPws6XXa1Q7PyoXErXwLGgOjoJSswMaricVXHxQU9Do=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mxCN3XcOMEInh8LqxGBqveYWENQ2bl2oyBltLTLUiQxUltObVwKE2AxJ97rBa9b0wlyJHshiywbWqTxXTF/kH3hfvJiy+qyfvVA9hacGChUMpcwUlrDoRl3LV7RQ7z6oL43Jw5OCbZa4nyYgFXdj/hYEZ1mPzS39wuFzlfQ51wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xm+As+b9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E1B0C4CEE8;
	Tue,  8 Apr 2025 09:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744104023;
	bh=oPws6XXa1Q7PyoXErXwLGgOjoJSswMaricVXHxQU9Do=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xm+As+b9UdgYv/Vwn+Ce+i9sfrkGk17Y9klQ6NCFQJ27qHYHPZPVTJ6cizsC97m6l
	 jsxG8tf+ShISAEgZYJGEFHXKQHRFrfk8EDxFfYvQtRMQ+xH4cJNcX6Jq/Gp0hr4d3Q
	 2Qns0WjrHSTdjW4z+m+7NyDWRCq6+VDUUrTOR/tykowjfr5AgBVCMs8W/h2txv+XK4
	 bSfD5neJNSHpkjOlIrfYq/MrXxZs//V5HXvLXbCgsObUkwme7s7yOaHvNqp+sLpirU
	 l6ndy/YReXkpL+EFvfxCa5qHEWjsJ59tlmfxV33V9i2sBltwI6n8dd06ZTpsqJ2rbw
	 nyl390aUzvCpw==
Date: Tue, 8 Apr 2025 14:50:13 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: akpm@linux-foundation.org, david@redhat.com, rppt@linux.ibm.com,
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
	azarrabi@qti.qualcomm.com, Simona Vetter <simona.vetter@ffwll.ch>,
	Daniel Stone <daniel@fooishbar.org>, linux-mm@kvack.org
Subject: Re: [PATCH v6 09/10] optee: FF-A: dynamic restricted memory
 allocation
Message-ID: <Z_TqTUpGhz1s-F8h@sumit-X1>
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
 <20250305130634.1850178-10-jens.wiklander@linaro.org>
 <Z-JePo6yGlUgrZkw@sumit-X1>
 <CAHUa44H1MzBLBM+Oeawca52C8PF3uAT0ggbL-zRdnBqj4LYrZg@mail.gmail.com>
 <Z-u8MWNVNy9lLbkK@sumit-X1>
 <CAHUa44GGEypYfiVz5E1aBsZ0TOK0UoeDBVRYB8_dUYJLhrSyUg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHUa44GGEypYfiVz5E1aBsZ0TOK0UoeDBVRYB8_dUYJLhrSyUg@mail.gmail.com>

On Tue, Apr 01, 2025 at 02:26:59PM +0200, Jens Wiklander wrote:
> On Tue, Apr 1, 2025 at 12:13 PM Sumit Garg <sumit.garg@kernel.org> wrote:
> >
> > + MM folks to seek guidance here.
> >
> > On Thu, Mar 27, 2025 at 09:07:34AM +0100, Jens Wiklander wrote:
> > > Hi Sumit,
> > >
> > > On Tue, Mar 25, 2025 at 8:42 AM Sumit Garg <sumit.garg@kernel.org> wrote:
> > > >
> > > > On Wed, Mar 05, 2025 at 02:04:15PM +0100, Jens Wiklander wrote:
> > > > > Add support in the OP-TEE backend driver dynamic restricted memory
> > > > > allocation with FF-A.
> > > > >
> > > > > The restricted memory pools for dynamically allocated restrict memory
> > > > > are instantiated when requested by user-space. This instantiation can
> > > > > fail if OP-TEE doesn't support the requested use-case of restricted
> > > > > memory.
> > > > >
> > > > > Restricted memory pools based on a static carveout or dynamic allocation
> > > > > can coexist for different use-cases. We use only dynamic allocation with
> > > > > FF-A.
> > > > >
> > > > > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > > > > ---
> > > > >  drivers/tee/optee/Makefile        |   1 +
> > > > >  drivers/tee/optee/ffa_abi.c       | 143 ++++++++++++-
> > > > >  drivers/tee/optee/optee_private.h |  13 +-
> > > > >  drivers/tee/optee/rstmem.c        | 329 ++++++++++++++++++++++++++++++
> > > > >  4 files changed, 483 insertions(+), 3 deletions(-)
> > > > >  create mode 100644 drivers/tee/optee/rstmem.c
> > > > >
> >
> > <snip>
> >
> > > > > diff --git a/drivers/tee/optee/rstmem.c b/drivers/tee/optee/rstmem.c
> > > > > new file mode 100644
> > > > > index 000000000000..ea27769934d4
> > > > > --- /dev/null
> > > > > +++ b/drivers/tee/optee/rstmem.c
> > > > > @@ -0,0 +1,329 @@
> > > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > > +/*
> > > > > + * Copyright (c) 2025, Linaro Limited
> > > > > + */
> > > > > +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> > > > > +
> > > > > +#include <linux/errno.h>
> > > > > +#include <linux/genalloc.h>
> > > > > +#include <linux/slab.h>
> > > > > +#include <linux/string.h>
> > > > > +#include <linux/tee_core.h>
> > > > > +#include <linux/types.h>
> > > > > +#include "optee_private.h"
> > > > > +
> > > > > +struct optee_rstmem_cma_pool {
> > > > > +     struct tee_rstmem_pool pool;
> > > > > +     struct gen_pool *gen_pool;
> > > > > +     struct optee *optee;
> > > > > +     size_t page_count;
> > > > > +     u16 *end_points;
> > > > > +     u_int end_point_count;
> > > > > +     u_int align;
> > > > > +     refcount_t refcount;
> > > > > +     u32 use_case;
> > > > > +     struct tee_shm *rstmem;
> > > > > +     /* Protects when initializing and tearing down this struct */
> > > > > +     struct mutex mutex;
> > > > > +};
> > > > > +
> > > > > +static struct optee_rstmem_cma_pool *
> > > > > +to_rstmem_cma_pool(struct tee_rstmem_pool *pool)
> > > > > +{
> > > > > +     return container_of(pool, struct optee_rstmem_cma_pool, pool);
> > > > > +}
> > > > > +
> > > > > +static int init_cma_rstmem(struct optee_rstmem_cma_pool *rp)
> > > > > +{
> > > > > +     int rc;
> > > > > +
> > > > > +     rp->rstmem = tee_shm_alloc_cma_phys_mem(rp->optee->ctx, rp->page_count,
> > > > > +                                             rp->align);
> > > > > +     if (IS_ERR(rp->rstmem)) {
> > > > > +             rc = PTR_ERR(rp->rstmem);
> > > > > +             goto err_null_rstmem;
> > > > > +     }
> > > > > +
> > > > > +     /*
> > > > > +      * TODO unmap the memory range since the physical memory will
> > > > > +      * become inaccesible after the lend_rstmem() call.
> > > > > +      */
> > > >
> > > > What's your plan for this TODO? I think we need a CMA allocator here
> > > > which can allocate un-mapped memory such that any cache speculation
> > > > won't lead to CPU hangs once the memory restriction comes into picture.
> > >
> > > What happens is platform-specific. For some platforms, it might be
> > > enough to avoid explicit access. Yes, a CMA allocator with unmapped
> > > memory or where memory can be unmapped is one option.
> >
> > Did you get a chance to enable real memory protection on RockPi board?
> 
> No, I don't think I have access to the needed documentation for the
> board to set it up for relevant peripherals.
> 
> > This will atleast ensure that mapped restricted memory without explicit
> > access works fine. Since otherwise once people start to enable real
> > memory restriction in OP-TEE, there can be chances of random hang ups
> > due to cache speculation.
> 
> A hypervisor in the normal world can also make the memory inaccessible
> to the kernel. That shouldn't cause any hangups due to cache
> speculation.

The hypervisor should unmap the memory from EL2 translation tables which
I think should disallow the cache speculation to take place. However,
without hypervisor here the memory remains mapped in normal world which
can lead to cache speculation for restricted buffers. That's why we
should atleast test on one platform with real memory protection enabled
to rule out any assumptions we make.

-Sumit

> 
> Cheers,
> Jens
> 
> >
> > MM folks,
> >
> > Basically what we are trying to achieve here is a "no-map" DT behaviour
> > [1] which is rather dynamic in  nature. The use-case here is that a memory
> > block allocated from CMA can be marked restricted at runtime where we
> > would like the Linux not being able to directly or indirectly (cache
> > speculation) access it. Once memory restriction use-case has been
> > completed, the memory block can be marked as normal and freed for
> > further CMA allocation.
> >
> > It will be apprciated if you can guide us regarding the appropriate APIs
> > to use for un-mapping/mamping CMA allocations for this use-case.
> >
> > [1] https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/reserved-memory/reserved-memory.yaml#L79
> >
> > -Sumit

