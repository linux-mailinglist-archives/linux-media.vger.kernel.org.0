Return-Path: <linux-media+bounces-29745-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BB6A8262B
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 15:22:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76DCB8C2436
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 13:21:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F20E264F8F;
	Wed,  9 Apr 2025 13:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oYiPNUPN"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B231525F78B;
	Wed,  9 Apr 2025 13:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744204756; cv=none; b=mze+2xhAkN62rLrRezJfiZF+TQL/uMEznMcwk/gnI6AR4IpfAxxhs1s4ziCWurTRkArFiKeSWizsJAMFiO5V4s4QbGq7/+A/H7EVEO28JY2IUmz52ENRmJG15NxQ0XgS1KNAYqIK9P2mZp9PwV5r2+tDBbVnNhV+1Iz7bTdURbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744204756; c=relaxed/simple;
	bh=ny9pPvFJ5Zid+zmKB7nDp5AE59k+FfvC0LsxKtkgDto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OzALAsrtdVidekAl46nI+O/1CVAVFbDiUR+xDUfrhbdgwHkONImQfAkg1KCb0wjxYyo5/sw6/F8meN8ZPriEuUrQ7h8O+8ht1c/gtS8iQ+4mzt14THg+43t4Sv07FomAL/rB72ERg3EmPVQNjjj6UzqQnbAfz1lxVdn36uU/fdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oYiPNUPN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F353CC4CEE7;
	Wed,  9 Apr 2025 13:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744204754;
	bh=ny9pPvFJ5Zid+zmKB7nDp5AE59k+FfvC0LsxKtkgDto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oYiPNUPNRquxwDEcnEDR0gurvjOXJDwRrKViTi0bTN9MxKlniyZtOTGFdtzWnBV1N
	 cxa7dyL3PCVMjnMAnkUQwFkXKbSDqstnaWgawP9OjCBvqdOZFKw4ZkBz6hPax0VboI
	 A7T1OHaAOOXkXNB1CbHV1gxRb7JDlBHSCZQ6fuVw6tMJSbFWpB7TN208lKOod0eTA9
	 pP7gU8drcOYoeLCgLTU8LZ3BdLL9gkJC/vEyM/tF/0WIwXIpAzNaSYzBvWZnTDDI8b
	 dqX6UPu6kuS3f6ion31atJwZTjavkTM4EmHwnSgbRQspC6GP6JXrA5W6ULuQ/mxonY
	 7T8sIy5WIw/dQ==
Date: Wed, 9 Apr 2025 18:49:03 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: David Hildenbrand <david@redhat.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>, akpm@linux-foundation.org,
	rppt@linux.ibm.com, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org,
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
Message-ID: <Z_Zzx8ixuCs2Ste1@sumit-X1>
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
 <20250305130634.1850178-10-jens.wiklander@linaro.org>
 <Z-JePo6yGlUgrZkw@sumit-X1>
 <CAHUa44H1MzBLBM+Oeawca52C8PF3uAT0ggbL-zRdnBqj4LYrZg@mail.gmail.com>
 <Z-u8MWNVNy9lLbkK@sumit-X1>
 <561d6050-e24f-4643-806f-8a520e324d11@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <561d6050-e24f-4643-806f-8a520e324d11@redhat.com>

Thanks David for your response.

On Wed, Apr 09, 2025 at 12:01:21PM +0200, David Hildenbrand wrote:
> On 01.04.25 12:13, Sumit Garg wrote:
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
> > > > >   drivers/tee/optee/Makefile        |   1 +
> > > > >   drivers/tee/optee/ffa_abi.c       | 143 ++++++++++++-
> > > > >   drivers/tee/optee/optee_private.h |  13 +-
> > > > >   drivers/tee/optee/rstmem.c        | 329 ++++++++++++++++++++++++++++++
> > > > >   4 files changed, 483 insertions(+), 3 deletions(-)
> > > > >   create mode 100644 drivers/tee/optee/rstmem.c
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
> > This will atleast ensure that mapped restricted memory without explicit
> > access works fine. Since otherwise once people start to enable real
> > memory restriction in OP-TEE, there can be chances of random hang ups
> > due to cache speculation.
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
> 
> Can we get some more information why that is even required, so we can decide
> if that is even the right thing to do? :)

The main reason which I can see is for memory re-use. Although we should
be able to carve out memory during boot and then mark it restricted for
the entire boot cycle but without re-use. Especially for secure media
pipeline use-case where the video buffers can be sufficiently large
enough which will benefit from memory re-use.

> 
> Who would mark the memory block as restricted and for which purpose?

It will be the higher privileged firmware/Trusted OS which can either be
the running on same CPU with higher privileges like Arm TrustZone or a
separate co-processor like AMD-TEE etc. The purpose is for secure media
pipeline, trusted UI or secure crypto use-cases where essentially the
motivation is that the Linux kernel shouldn't be able to access
decrypted content or key material in plain format but rather only the
allowed peripherals like media pipeline, crypto accelerators etc. able to
access them.

> 
> In arch/powerpc/platforms/powernv/memtrace.c we have some arch-specific code
> to remove the directmap after alloc_contig_pages(). See
> memtrace_alloc_node(). But it's very arch-specific ...

Thanks for the reference, we are looking for something like that but
with generic code along with capability to remap when the restricted
memory block is freed and available for normal kernel usage.

-Sumit

