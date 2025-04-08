Return-Path: <linux-media+bounces-29623-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A11C3A80CCC
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 15:48:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9392E4C7AC6
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 13:40:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A945B18DF6E;
	Tue,  8 Apr 2025 13:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lbZayWTY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2575F84D13
	for <linux-media@vger.kernel.org>; Tue,  8 Apr 2025 13:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744119588; cv=none; b=HAFvBvg1xa6p2+ShigZoREJJqYQeewojJr0/QOf26x+iPjoXiNPhdbEePtJ5pP4CVVIQYLD/B2xZcjGJv+tMm3jPA9z76kC22SQyJ2tC8w2rQjjTRDvfTr7h4Opk9WvjX8+ehSkjUFmLotlBj7D7i9yl3qA/KINEVH5yjo2C4OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744119588; c=relaxed/simple;
	bh=CZCrfXUui6VYpt7IL2lGsT58sZt2BG0XemsiaElHqiM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u1eybtQOaKAeCof8Dgxb/OdBoWNZQq9K5wHnyHs+1PXbEUvk+zSfvY5sPLZTsv1oz+LEFKF21PsqNUrRZS8+YCh5Q9So9EXeCICS2i9h1izQCDVVapQUxIUsAo1Wy97qAtEH8FQad1Lrnq1JoepbyqK4DNTia+24GwEEqu05SyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lbZayWTY; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-2b8e2606a58so3000086fac.0
        for <linux-media@vger.kernel.org>; Tue, 08 Apr 2025 06:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744119585; x=1744724385; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KHOdC/Vml2+FnzmLfGzflP63fCypDI+MruYpwHo3lNA=;
        b=lbZayWTYx3gypGKzDGTDkaR+CN3nCSMz2CgeMspigs/7m0CHA+ktJ80tQkvC9/YI1L
         fBoPCzkLfuEMZHGNc01QghSMqnAT54R3W6nM5WsxYBhMepYEl2tjmMfR8tkykCREP+w4
         Lz9Y2dwXLLE/pOCaBQ8rsYNlvWGq8/ydiKJcKY1tjeGVOKZsaS0iOb4N+VLjOKXrKbt7
         7JtSI1EjyP9irwjWW7oGL27cqNDlrCWe65NX7NL6W+UDCAnhOV3L2z+VgHdSzXTuu+F7
         AYoyg8hLBXEnPVWx8AojG+ZeM7/mstx2BYs5zSPQ/plzZVNNBW5eJIbID8dVg3rO1XuA
         2OQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744119585; x=1744724385;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KHOdC/Vml2+FnzmLfGzflP63fCypDI+MruYpwHo3lNA=;
        b=qQGSL6NJtOqHOcQ3TCmmR6t6odAinNUaLU18kafZgjom8LlVArTsjP0D16vAYiId6E
         C0DJ3xJt8id5OZ5GDF0UeQifXV/N8tqEmPZliM3KjPooHWpKO6kCnwQ1JQLqFqOTMD6t
         sC25SzD2xEnI2l0JRlY5jgL5+2+vJ/Bx69rNQhCU4YJN4iE3P4C/gw/YYgeWjWbl7k4R
         M6r5RDQ0QKm5gIM3yIbxfDXxzQ4bSn9X7SaHEBiy2Px6zWltRk4oI+EuJnvs2vr/ADm8
         eKUF+AtG81xFuYMtzdWZ5a2CMk8rG63vGxxAP+Km1ShY8bFHShsLB9wetYeH+NKo70D+
         V1Eg==
X-Forwarded-Encrypted: i=1; AJvYcCUI9Oes1W9/J8fTovg8w80N36xIhp2eOBFWh7i4md21Ty1lYsqzcWAECLrPDL0O8upVRsy0bteoexThyA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzg5zpGEajUyqjc1O3JJehnCTYvomXWaop4bZU38LmNT3bKc1w
	EM5JBXQ7KUGeiDSJeHfItI2hrK7s4m4LSkp0Y/UfYweLfQ4GnZhnSqb5i5iyHKvDGyNziDfMqGC
	KETjjRr7WhTdFyTFD4ArFU6D//oNE7lZT72he1w==
X-Gm-Gg: ASbGncs0wN01PG62IsEn4ojNiqYH0fLuTZ4SVYiNszJtc75oBCM9y1lXNyI1K2T5UJD
	+v/5tcIk1lrJEhiX7yhUmpt7KY7KMEUXZDxF1Jj4Z+1e71jT8I+qtcZAjiRBDOU9j59qQc0y36D
	nfTxCTU7OlW/U6rlKAFUAMoRayB88=
X-Google-Smtp-Source: AGHT+IFDzPIFIE+uzUvKzwMFVIPM56PzO88jEFUON9fAPcL/eNFR02o6bcfZi6WAQ34EoSMSHnDr8Fk6F3d560XOiCg=
X-Received: by 2002:a05:6870:2b10:b0:295:eb96:9fd4 with SMTP id
 586e51a60fabf-2cc9e59d03amr9326894fac.11.1744119585123; Tue, 08 Apr 2025
 06:39:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
 <20250305130634.1850178-10-jens.wiklander@linaro.org> <Z-JePo6yGlUgrZkw@sumit-X1>
 <CAHUa44H1MzBLBM+Oeawca52C8PF3uAT0ggbL-zRdnBqj4LYrZg@mail.gmail.com>
 <Z-u8MWNVNy9lLbkK@sumit-X1> <CAHUa44GGEypYfiVz5E1aBsZ0TOK0UoeDBVRYB8_dUYJLhrSyUg@mail.gmail.com>
 <Z_TqTUpGhz1s-F8h@sumit-X1>
In-Reply-To: <Z_TqTUpGhz1s-F8h@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 8 Apr 2025 15:39:33 +0200
X-Gm-Features: ATxdqUFlhhnGRONqCMm9Feg_Wns0J0dqc4_QCcuIsEY1x6VIJsUuiFEXYdjvaKs
Message-ID: <CAHUa44EV=q35i-anXkAF2N7mY8gmWqfMbU0YXARHHOas5iKxHw@mail.gmail.com>
Subject: Re: [PATCH v6 09/10] optee: FF-A: dynamic restricted memory allocation
To: Sumit Garg <sumit.garg@kernel.org>
Cc: akpm@linux-foundation.org, david@redhat.com, rppt@linux.ibm.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 11:20=E2=80=AFAM Sumit Garg <sumit.garg@kernel.org> =
wrote:
>
> On Tue, Apr 01, 2025 at 02:26:59PM +0200, Jens Wiklander wrote:
> > On Tue, Apr 1, 2025 at 12:13=E2=80=AFPM Sumit Garg <sumit.garg@kernel.o=
rg> wrote:
> > >
> > > + MM folks to seek guidance here.
> > >
> > > On Thu, Mar 27, 2025 at 09:07:34AM +0100, Jens Wiklander wrote:
> > > > Hi Sumit,
> > > >
> > > > On Tue, Mar 25, 2025 at 8:42=E2=80=AFAM Sumit Garg <sumit.garg@kern=
el.org> wrote:
> > > > >
> > > > > On Wed, Mar 05, 2025 at 02:04:15PM +0100, Jens Wiklander wrote:
> > > > > > Add support in the OP-TEE backend driver dynamic restricted mem=
ory
> > > > > > allocation with FF-A.
> > > > > >
> > > > > > The restricted memory pools for dynamically allocated restrict =
memory
> > > > > > are instantiated when requested by user-space. This instantiati=
on can
> > > > > > fail if OP-TEE doesn't support the requested use-case of restri=
cted
> > > > > > memory.
> > > > > >
> > > > > > Restricted memory pools based on a static carveout or dynamic a=
llocation
> > > > > > can coexist for different use-cases. We use only dynamic alloca=
tion with
> > > > > > FF-A.
> > > > > >
> > > > > > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > > > > > ---
> > > > > >  drivers/tee/optee/Makefile        |   1 +
> > > > > >  drivers/tee/optee/ffa_abi.c       | 143 ++++++++++++-
> > > > > >  drivers/tee/optee/optee_private.h |  13 +-
> > > > > >  drivers/tee/optee/rstmem.c        | 329 ++++++++++++++++++++++=
++++++++
> > > > > >  4 files changed, 483 insertions(+), 3 deletions(-)
> > > > > >  create mode 100644 drivers/tee/optee/rstmem.c
> > > > > >
> > >
> > > <snip>
> > >
> > > > > > diff --git a/drivers/tee/optee/rstmem.c b/drivers/tee/optee/rst=
mem.c
> > > > > > new file mode 100644
> > > > > > index 000000000000..ea27769934d4
> > > > > > --- /dev/null
> > > > > > +++ b/drivers/tee/optee/rstmem.c
> > > > > > @@ -0,0 +1,329 @@
> > > > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > > > +/*
> > > > > > + * Copyright (c) 2025, Linaro Limited
> > > > > > + */
> > > > > > +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> > > > > > +
> > > > > > +#include <linux/errno.h>
> > > > > > +#include <linux/genalloc.h>
> > > > > > +#include <linux/slab.h>
> > > > > > +#include <linux/string.h>
> > > > > > +#include <linux/tee_core.h>
> > > > > > +#include <linux/types.h>
> > > > > > +#include "optee_private.h"
> > > > > > +
> > > > > > +struct optee_rstmem_cma_pool {
> > > > > > +     struct tee_rstmem_pool pool;
> > > > > > +     struct gen_pool *gen_pool;
> > > > > > +     struct optee *optee;
> > > > > > +     size_t page_count;
> > > > > > +     u16 *end_points;
> > > > > > +     u_int end_point_count;
> > > > > > +     u_int align;
> > > > > > +     refcount_t refcount;
> > > > > > +     u32 use_case;
> > > > > > +     struct tee_shm *rstmem;
> > > > > > +     /* Protects when initializing and tearing down this struc=
t */
> > > > > > +     struct mutex mutex;
> > > > > > +};
> > > > > > +
> > > > > > +static struct optee_rstmem_cma_pool *
> > > > > > +to_rstmem_cma_pool(struct tee_rstmem_pool *pool)
> > > > > > +{
> > > > > > +     return container_of(pool, struct optee_rstmem_cma_pool, p=
ool);
> > > > > > +}
> > > > > > +
> > > > > > +static int init_cma_rstmem(struct optee_rstmem_cma_pool *rp)
> > > > > > +{
> > > > > > +     int rc;
> > > > > > +
> > > > > > +     rp->rstmem =3D tee_shm_alloc_cma_phys_mem(rp->optee->ctx,=
 rp->page_count,
> > > > > > +                                             rp->align);
> > > > > > +     if (IS_ERR(rp->rstmem)) {
> > > > > > +             rc =3D PTR_ERR(rp->rstmem);
> > > > > > +             goto err_null_rstmem;
> > > > > > +     }
> > > > > > +
> > > > > > +     /*
> > > > > > +      * TODO unmap the memory range since the physical memory =
will
> > > > > > +      * become inaccesible after the lend_rstmem() call.
> > > > > > +      */
> > > > >
> > > > > What's your plan for this TODO? I think we need a CMA allocator h=
ere
> > > > > which can allocate un-mapped memory such that any cache speculati=
on
> > > > > won't lead to CPU hangs once the memory restriction comes into pi=
cture.
> > > >
> > > > What happens is platform-specific. For some platforms, it might be
> > > > enough to avoid explicit access. Yes, a CMA allocator with unmapped
> > > > memory or where memory can be unmapped is one option.
> > >
> > > Did you get a chance to enable real memory protection on RockPi board=
?
> >
> > No, I don't think I have access to the needed documentation for the
> > board to set it up for relevant peripherals.
> >
> > > This will atleast ensure that mapped restricted memory without explic=
it
> > > access works fine. Since otherwise once people start to enable real
> > > memory restriction in OP-TEE, there can be chances of random hang ups
> > > due to cache speculation.
> >
> > A hypervisor in the normal world can also make the memory inaccessible
> > to the kernel. That shouldn't cause any hangups due to cache
> > speculation.
>
> The hypervisor should unmap the memory from EL2 translation tables which
> I think should disallow the cache speculation to take place. However,
> without hypervisor here the memory remains mapped in normal world which
> can lead to cache speculation for restricted buffers. That's why we
> should atleast test on one platform with real memory protection enabled
> to rule out any assumptions we make.

Do I hear a volunteer? ;-)

Anyway, this isn't something that can be enabled in the kernel alone.
Only platforms where the firmware has been updated will be affected.
If this can't be supported on a particular platform, there's still the
option with a static carveout.

Cheers,
Jens

>
> -Sumit
>
> >
> > Cheers,
> > Jens
> >
> > >
> > > MM folks,
> > >
> > > Basically what we are trying to achieve here is a "no-map" DT behavio=
ur
> > > [1] which is rather dynamic in  nature. The use-case here is that a m=
emory
> > > block allocated from CMA can be marked restricted at runtime where we
> > > would like the Linux not being able to directly or indirectly (cache
> > > speculation) access it. Once memory restriction use-case has been
> > > completed, the memory block can be marked as normal and freed for
> > > further CMA allocation.
> > >
> > > It will be apprciated if you can guide us regarding the appropriate A=
PIs
> > > to use for un-mapping/mamping CMA allocations for this use-case.
> > >
> > > [1] https://github.com/devicetree-org/dt-schema/blob/main/dtschema/sc=
hemas/reserved-memory/reserved-memory.yaml#L79
> > >
> > > -Sumit

