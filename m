Return-Path: <linux-media+bounces-53700-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CVbFd+SoWmvuQQAu9opvQ
	(envelope-from <linux-media+bounces-53700-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 13:49:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DC51B75B1
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 13:49:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DFF2A30961C5
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 12:49:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13DB73603DE;
	Fri, 27 Feb 2026 12:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HMBoK6wp";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Si7kFERC"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2834B2441A6
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 12:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772196567; cv=pass; b=E0f+mjWjxWWQvAcCyN9kGWWgAg0ymPVaFHwX2pJ+ntHmxm6CfkQPEtSMjy0cSgk3ZXx+O1IZgRyR2vq1fpc59Tq4TuaTJtLvzckzeMTjWLqticgLZohQ/69WyzUEWicHm708cJF+2q3BgAGm9x9XhrAPldADHthkJm/WKruBGFc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772196567; c=relaxed/simple;
	bh=r43hDinvDeUV0ZgLsH3gcJ0cr2YlxqW47lMZerVZX6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o5SCr2JvQeuZ/r7tE6+DxIBmX3Hyr6ZVvjeW7KOLffxnMvyTjrNzhlfSv2DIXnTZ+lKHZUOGEU5+C1KZtYjW2a/qfgQ22DIdQwPFDkT3mUKCEy5IpnQI+owrGYtRPiH0TJ+42sGV125cgnjSA3+ONHvgJg+SJrc9DVOOQI6cj60=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HMBoK6wp; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Si7kFERC; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772196564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=emjNJI3EUS42delHpg5qpfmMfKUahwxgnItjKotcIy4=;
	b=HMBoK6wpphBC8hyqj+eNe0Uxy43K0jar27EYP5LEl96TmKfb8q67Pz/XsV8Rq3mrHWCdhE
	LrLDz3QZdl2v10FLebQYJrG6v21apm9ZR44xHVmd0c7zoDuEMzX3thzCw7zLSd5kHMXn3k
	49zWNX9yy3BqI7cc1EIIPt7LPuBC4v8=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-mxRhQeeXMVWFHDljREmrzA-1; Fri, 27 Feb 2026 07:49:22 -0500
X-MC-Unique: mxRhQeeXMVWFHDljREmrzA-1
X-Mimecast-MFC-AGG-ID: mxRhQeeXMVWFHDljREmrzA_1772196562
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-794b240c0d3so52081567b3.0
        for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 04:49:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772196562; cv=none;
        d=google.com; s=arc-20240605;
        b=TTBhzyMa5kTFp2OdRxWF20vkvnfc9KUcFLIx0InYqoHjVIvbBmg3D5ECqICx0O5s6+
         ooZ/THQ3T6Dv8fCrKCWoIpKte4pSfoYfQxF3xl1gHfyjtUfxsDckCKX5wiJOOlcHFkn7
         G37/ucfwc+oUhhNd8D5SeWxpQTlL5+f0i+IfgznarU4vkjHP90m39vxBlTcqcvb1aqyj
         NY5OyCFA9iV+X9DwLgYIwUB5m+QkZTySykznwN7Ao5jEHPF5VGYIMDnwSF23w5fhCwa0
         cTjYle1YZcbmH984PnQa2q7yVvX2QC3Ug7vbeonDO/url1A3G3G4iJHmU48DjG8qFxgT
         YuCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=emjNJI3EUS42delHpg5qpfmMfKUahwxgnItjKotcIy4=;
        fh=povBo5NlFUXBQYP1jEY4ok0WdeUEw3GD9GvtatknGic=;
        b=SU3poi7ANXSqI1BRjlCU9NOY1u38R8bnB1/duFhHRjVTZSY3uXaj2lVjpBubH3uIYr
         ulzKqgENLv5IcweZKGDhnZkcUYOliBpAHBm2/EU5QaSWSVfGMO9z0nwc5TR4rWtwpBMZ
         U9Su2Q0Ljdp8wdfgTF4KfpMrBcHYxKVtZrMjQtkygY7Xy0Zine/EfkcQMiOTIQdDhaIz
         kEvWd8FMbGVTApVPDO8SqqPuT07hrG2S0kYONqfR7Uovu9nHGyKTIqLdba0kNNkOtTht
         DSc/z2m7t6D5T48Dj9fJS2nz/zyRwbGwWVwMfmd25LWAK5HiqJ3LNvJqeh3rbQflAzn/
         42vg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772196562; x=1772801362; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=emjNJI3EUS42delHpg5qpfmMfKUahwxgnItjKotcIy4=;
        b=Si7kFERC9Ai1/MK5/7B3mMkQK+Qm4ie3QKNaigpzwG+d+CjAdv93Cj+mtEm+6TCAFX
         Bbss62T1DbDTbf8WjFPWTtOqi/5T4NFp1PuA5uljayMRvEZhNRVabGq+jrc38nFjwkmb
         R//imvdj5O6tRYAXvngnrP0Ab0j2x15HjcJD1b3EfBKFV7XKbH8NPMKuVUvfU0HWMWuU
         WjMyHYC6E/xtP9EMhk9uCC29YcKyhiiofUW+8KzwoLv9pZ2qtLW4CBYvCM+FuSlH7xHC
         hjjjhbwVPGZE3Cw1JHSNBH3gQhsdg48EsZJPAaJW+urFITkXFmd4iI24C3BOmm5yAzs/
         ugVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772196562; x=1772801362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=emjNJI3EUS42delHpg5qpfmMfKUahwxgnItjKotcIy4=;
        b=ajOiprtExGCwCw9RY8x8V/dgVWbKQwai96T693TKdjweqgQHNQNDB9iZLU+6J2a+Ei
         CKusO2QtAJojY9p0xbniCLSjvQYfRS7BWrMVsiTRWvQH9+WIjXZvjNUVenMPWeIf3l5O
         L18gheXXTDv/0LydR8msLnWh+X1bqkc7MRya1NSMXuR64FK6phUPDdo/wemHofGNURob
         6/2vR4wx7OSsxarVDLszGVzR9zyrwmNvb9rND+0IBi8PtoDWwo+uaYLxG6KF7qzSsJsq
         JL/Bch8kjt8JSqVVVggdoekP1TBFz2n5bAoi92wWkYVZDwuB60bZAyD54ztmElGvIXJw
         WniA==
X-Forwarded-Encrypted: i=1; AJvYcCU1vs9QZ0dpVbqDFu/Qf/8FKSfnzDmYZLb0kaSrhT0ltXBPgRLRTk1HNaXp1xMYX0tvBH9eDgaOj13BWw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1rrDMphbnYNbMq7CABNgql5p+lClTZ9GdrUpGc/egFbvAvnYl
	SczoZOK0/Bvz9dDE4IWEe6nHd8b6yM+jQvYD9al3qO1c0nszwDXfryTgmQ6yWxBiPdkdGJPU8G9
	WaoRDRVqTcwzlGQdb9KAJfEcjl9e+TyD6vsgJOxflzRxI2QS1hokRlARyIIKgcknpUXBVQ1MNVt
	sLLzCvRowGSg3a7m6ixbdkP3Ef5qwKP9kqmZDbLqI=
X-Gm-Gg: ATEYQzw96QfurViwB7VhH5+/LwQo/yvgF3yBh0f1rvtjQjvkzmm2SjvLL1vciYeuTFE
	RM0nCCrDS6UXJoj8m8lejUz3fin0pZP9vGb4oHchp/BS2fD2gFKYsn2kDFriM+Lw7gKTgiNzy2X
	H6NhiuZv6S1WyrK+6Mbl+BJwmWbwGQWj5RN1QUyURl3vk0ZbieU6+rU0G4jcGGIG+ZiGXO9cJ2+
	g==
X-Received: by 2002:a05:690c:4a09:b0:797:f674:1fa4 with SMTP id 00721157ae682-79874d77248mr55589767b3.24.1772196562151;
        Fri, 27 Feb 2026 04:49:22 -0800 (PST)
X-Received: by 2002:a05:690c:4a09:b0:797:f674:1fa4 with SMTP id
 00721157ae682-79874d77248mr55589547b3.24.1772196561677; Fri, 27 Feb 2026
 04:49:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260224-b4-dmabuf-heap-coherent-rmem-v1-1-dffef43298ac@redhat.com>
 <20260226-smoky-fancy-dachshund-1a2f92@penduick>
In-Reply-To: <20260226-smoky-fancy-dachshund-1a2f92@penduick>
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 27 Feb 2026 13:49:10 +0100
X-Gm-Features: AaiRm51s6aI5LtsHrsyLHI09H87sFZU1p8g6Zc9DvZONMQMUWWzKQgR5cEi1kBA
Message-ID: <CADSE00+PwA-ZC9F2_rryi9XZaz9gPWd2qUA5NSaLQUs78gmvvw@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: heaps: Add Coherent heap to dmabuf heaps
To: Maxime Ripard <mripard@redhat.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	iommu@lists.linux.dev, echanude@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53700-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aesteve@redhat.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,exp_info.name:url]
X-Rspamd-Queue-Id: A0DC51B75B1
X-Rspamd-Action: no action

Hi Maxime!

On Thu, Feb 26, 2026 at 11:12=E2=80=AFAM Maxime Ripard <mripard@redhat.com>=
 wrote:
>
> Hi Albert,
>
> Thanks for your patch!
>
> On Tue, Feb 24, 2026 at 08:57:33AM +0100, Albert Esteve wrote:
> > Add a dma-buf heap for DT coherent reserved-memory
> > (i.e., 'shared-dma-pool' without 'reusable' property),
> > exposing one heap per region for userspace buffers.
> >
> > The heap binds a synthetic platform device to each region
> > so coherent allocations use the correct dev->dma_mem,
> > and it defers registration until late_initcall when
> > normal allocator are available.
> >
> > This patch includes charging of the coherent heap
> > allocator to the dmem cgroup.
> >
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > ---
> > This patch introduces a new driver to expose DT coherent reserved-memor=
y
> > regions as dma-buf heaps, allowing userspace buffers to be created.
> >
> > Since these regions are device-dependent, we bind a synthetic platform
> > device to each region so coherent allocations use the correct dev->dma_=
mem.
> >
> > Following Eric=E2=80=99s [1] and Maxime=E2=80=99s [2] work on charging =
DMA buffers
> > allocated from userspace to cgroups (dmem), this patch adds the same
> > charging pattern used by CMA heaps patch. Charging is done only through
> > the dma-buf heap interface so it can be attributed to a userspace alloc=
ator.
> >
> > This allows each device-specific reserved-memory region to enforce its
> > own limits.
> >
> > [1] https://lore.kernel.org/all/20260218-dmabuf-heap-cma-dmem-v2-0-b249=
886fb7b2@redhat.com/
> > [2] https://lore.kernel.org/all/20250310-dmem-cgroups-v1-0-2984c1bc9312=
@kernel.org/
> > ---
> >  drivers/dma-buf/heaps/Kconfig         |  17 ++
> >  drivers/dma-buf/heaps/Makefile        |   1 +
> >  drivers/dma-buf/heaps/coherent_heap.c | 485 ++++++++++++++++++++++++++=
++++++++
> >  include/linux/dma-heap.h              |  11 +
> >  kernel/dma/coherent.c                 |   9 +
> >  5 files changed, 523 insertions(+)
> >
> > diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kcon=
fig
> > index a5eef06c42264..93765dca164e3 100644
> > --- a/drivers/dma-buf/heaps/Kconfig
> > +++ b/drivers/dma-buf/heaps/Kconfig
> > @@ -12,3 +12,20 @@ config DMABUF_HEAPS_CMA
> >         Choose this option to enable dma-buf CMA heap. This heap is bac=
ked
> >         by the Contiguous Memory Allocator (CMA). If your system has th=
ese
> >         regions, you should say Y here.
> > +
> > +config DMABUF_HEAPS_COHERENT
> > +     bool "DMA-BUF Coherent Reserved-Memory Heap"
> > +     depends on DMABUF_HEAPS && OF_RESERVED_MEM && DMA_DECLARE_COHEREN=
T
> > +     help
> > +       Choose this option to enable coherent reserved-memory dma-buf h=
eaps.
> > +       This heap is backed by non-reusable DT "shared-dma-pool" region=
s.
> > +       If your system defines coherent reserved-memory regions, you sh=
ould
> > +       say Y here.
> > +
> > +config COHERENT_AREAS_DEFERRED
> > +     int "Max deferred coherent reserved-memory regions"
> > +     depends on DMABUF_HEAPS_COHERENT
> > +     default 16
> > +     help
> > +       Maximum number of coherent reserved-memory regions that can be
> > +       deferred for later registration during early boot.
> > diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/heaps/Mak=
efile
> > index 974467791032f..96bda7a65f041 100644
> > --- a/drivers/dma-buf/heaps/Makefile
> > +++ b/drivers/dma-buf/heaps/Makefile
> > @@ -1,3 +1,4 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >  obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)    +=3D system_heap.o
> >  obj-$(CONFIG_DMABUF_HEAPS_CMA)               +=3D cma_heap.o
> > +obj-$(CONFIG_DMABUF_HEAPS_COHERENT)  +=3D coherent_heap.o
> > diff --git a/drivers/dma-buf/heaps/coherent_heap.c b/drivers/dma-buf/he=
aps/coherent_heap.c
> > new file mode 100644
> > index 0000000000000..870b2b89aefcb
> > --- /dev/null
> > +++ b/drivers/dma-buf/heaps/coherent_heap.c
> > @@ -0,0 +1,485 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * DMABUF heap for coherent reserved-memory regions
> > + *
> > + * Copyright (C) 2026 Red Hat, Inc.
> > + * Author: Albert Esteve <aesteve@redhat.com>
> > + *
> > + */
> > +
> > +#include <linux/cgroup_dmem.h>
> > +#include <linux/dma-heap.h>
> > +#include <linux/dma-buf.h>
> > +#include <linux/dma-mapping.h>
> > +#include <linux/err.h>
> > +#include <linux/highmem.h>
> > +#include <linux/iosys-map.h>
> > +#include <linux/of_reserved_mem.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/scatterlist.h>
> > +#include <linux/slab.h>
> > +#include <linux/vmalloc.h>
> > +
> > +#define DEFERRED_AREAS_MAX CONFIG_COHERENT_AREAS_DEFERRED
>
> I'm not sure we need to make it configurable. Distros are going to set
> it to the user with the highest number of regions anyway. How about
> using MAX_RESERVED_REGIONS for now?

Makes sense, will do.

>
> >
> > [...]
> >
> > +struct coherent_heap {
> > +     struct dma_heap *heap;
> > +     struct reserved_mem *rmem;
> > +     char *name;
> > +     struct device *dev;
> > +     struct platform_device *pdev;
> > +#if IS_ENABLED(CONFIG_CGROUP_DMEM)
> > +     struct dmem_cgroup_region *cg;
> > +#endif
>
> We might want to leave the dmem accounting out for now so we can focus
> on the heap itself. That being said, it ended up being pretty trivial
> for CMA, so maybe it's not too much of a concern.

Sure. That allows us to follow the same patterns once the CMA series lands.
I will strip all dmem accounting parts for v2.

>
> >
> > [...]
> >
> > +static int __coherent_heap_register(struct reserved_mem *rmem)
> > +{
> > +     struct dma_heap_export_info exp_info;
> > +     struct coherent_heap *coh_heap;
> > +#if IS_ENABLED(CONFIG_CGROUP_DMEM)
> > +     struct dmem_cgroup_region *region;
> > +#endif
> > +     const char *rmem_name;
> > +     int ret;
> > +
> > +     if (!rmem)
> > +             return -EINVAL;
> > +
> > +     rmem_name =3D rmem->name ? rmem->name : "unknown";
>
> If the reserved region has no name, we probably shouldn't expose it to
> userspace at all. Using unknown will probably create some bugs if you
> have several, but also it's pretty like to have a name at some point and
> thus we wouldn't have a stable name for the uAPI.

Agreed. I will return an error code if no name is present.

>
> > +     coh_heap =3D kzalloc_obj(*coh_heap);
> > +     if (!coh_heap)
> > +             return -ENOMEM;
> > +
> > +     coh_heap->name =3D kasprintf(GFP_KERNEL, "coherent_%s", rmem_name=
);
> > +     if (!coh_heap->name) {
> > +             ret =3D -ENOMEM;
> > +             goto free_coherent_heap;
> > +     }
>
> Similarly, we shouldn't use the coherent_ prefix for the heap name. If
> the backing allocator ever changes (and between contiguous and coherent,
> the difference is just a single property value in the DT), then the name
> would change and userspace would break. We should directly use the name
> of the region here.
>
> > +     coh_heap->rmem =3D rmem;
> > +
> > +     /* create a platform device per rmem and bind it */
> > +     coh_heap->pdev =3D platform_device_register_simple("coherent-heap=
",
> > +                                                      PLATFORM_DEVID_A=
UTO,
> > +                                                      NULL, 0);
> > +     if (IS_ERR(coh_heap->pdev)) {
> > +             ret =3D PTR_ERR(coh_heap->pdev);
> > +             goto free_name;
> > +     }
>
> We probably should use a faux_device here instead of a platform_device,
> but more importantly, the heap itself already has a device allocated for
> it (dev_ret in dma_heap_add).
>
> It's not in struct dma_heap yet, but there's a patch that moves it there
> that we should probably carry:
> https://lore.kernel.org/r/20210120210937.15069-2-john.stultz@linaro.org/

Thanks for sharing the link! I will pick the patch.

>
> > +     if (rmem->ops && rmem->ops->device_init) {
> > +             ret =3D rmem->ops->device_init(rmem, &coh_heap->pdev->dev=
);
> > +             if (ret)
> > +                     goto pdev_unregister;
> > +     }
>
> I'm not really a fan of calling ops directly. Maybe we should create an
> of_reserved_mem_device_init_with_mem function that would do it for us
> (and would be called by of_reserved_mem_device_init_by_idx and the
> likes).

Agreed.

>
> > +     coh_heap->dev =3D &coh_heap->pdev->dev;
> > +#if IS_ENABLED(CONFIG_CGROUP_DMEM)
> > +     region =3D dmem_cgroup_register_region(rmem->size, "coh/%s", rmem=
_name);
> > +     if (IS_ERR(region)) {
> > +             ret =3D PTR_ERR(region);
> > +             goto pdev_unregister;
> > +     }
> > +     coh_heap->cg =3D region;
> > +#endif
>
> Same comment than for CMA here: it should really be created by the
> coherent memory region itself.
>
> > +     exp_info.name =3D coh_heap->name;
> > +     exp_info.ops =3D &coherent_heap_ops;
> > +     exp_info.priv =3D coh_heap;
> > +
> > +     coh_heap->heap =3D dma_heap_add(&exp_info);
> > +     if (IS_ERR(coh_heap->heap)) {
> > +             ret =3D PTR_ERR(coh_heap->heap);
> > +             goto cg_unregister;
> > +     }
> > +
> > +     return 0;
> > +
> > +cg_unregister:
> > +#if IS_ENABLED(CONFIG_CGROUP_DMEM)
> > +     dmem_cgroup_unregister_region(coh_heap->cg);
> > +#endif
> > +pdev_unregister:
> > +     platform_device_unregister(coh_heap->pdev);
> > +     coh_heap->pdev =3D NULL;
> > +free_name:
> > +     kfree(coh_heap->name);
> > +free_coherent_heap:
> > +     kfree(coh_heap);
> > +
> > +     return ret;
> > +}
> > +
> > +int dma_heap_coherent_register(struct reserved_mem *rmem)
> > +{
> > +     int ret;
> > +
> > +     ret =3D __coherent_heap_register(rmem);
> > +     if (ret =3D=3D -ENOMEM)
> > +             return coherent_heap_add_deferred(rmem);
> > +     return ret;
> > +}
>
> I appreciate you did it like we did for CMA, but if we ever want to make
> that heap a module you'll end up with a dependency from the core kernel
> on a module which doesn't work. The best here might be to wait a bit
> until we have somewhat of an agreement on
>
> https://lore.kernel.org/r/20260225-dma-buf-heaps-as-modules-v1-0-2109225a=
090d@kernel.org
>
> > +static int __init coherent_heap_register_deferred(void)
> > +{
> > +     unsigned int i;
> > +     int ret;
> > +
> > +     for (i =3D 0; i < rmem_areas_deferred_num; i++) {
> > +             struct reserved_mem *rmem =3D rmem_areas_deferred[i];
> > +
> > +             ret =3D __coherent_heap_register(rmem);
> > +             if (ret) {
> > +                     pr_warn("Failed to add coherent heap %s",
> > +                             rmem->name ? rmem->name : "unknown");
> > +                     continue;
> > +             }
> > +     }
> > +
> > +     return 0;
> > +}
> > +late_initcall(coherent_heap_register_deferred);
>
> Why do you need a late_initcall here? Isn't module_init enough?

When I tested this initially, I relied on direct invocations from
cma/coherent.c to register new coherent heap areas. However it failed
in `kzalloc_obj` calls within the register function. Then I read the
article about boot time memory management[1] and saw other drivers
collected info for deferred initialization at late_initcall(), similar
to what I tried to do here. I honestly did not try with module_init().
Since I will refactor this part to follow your previous comments, I
will try to update if possible.

[1] https://docs.kernel.org/core-api/boot-time-mm.html

>
> > +MODULE_DESCRIPTION("DMA-BUF heap for coherent reserved-memory regions"=
);
> > diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
> > index 648328a64b27e..e894cfa1ecf1a 100644
> > --- a/include/linux/dma-heap.h
> > +++ b/include/linux/dma-heap.h
> > @@ -9,9 +9,11 @@
> >  #ifndef _DMA_HEAPS_H
> >  #define _DMA_HEAPS_H
> >
> > +#include <linux/errno.h>
> >  #include <linux/types.h>
> >
> >  struct dma_heap;
> > +struct reserved_mem;
> >
> >  /**
> >   * struct dma_heap_ops - ops to operate on a given heap
> > @@ -48,4 +50,13 @@ struct dma_heap *dma_heap_add(const struct dma_heap_=
export_info *exp_info);
> >
> >  extern bool mem_accounting;
> >
> > +#if IS_ENABLED(CONFIG_DMABUF_HEAPS_COHERENT)
> > +int dma_heap_coherent_register(struct reserved_mem *rmem);
> > +#else
> > +static inline int dma_heap_coherent_register(struct reserved_mem *rmem=
)
> > +{
> > +     return -EOPNOTSUPP;
> > +}
> > +#endif
> > +
> >  #endif /* _DMA_HEAPS_H */
> > diff --git a/kernel/dma/coherent.c b/kernel/dma/coherent.c
> > index 1147497bc512c..f49d13e460e4b 100644
> > --- a/kernel/dma/coherent.c
> > +++ b/kernel/dma/coherent.c
> > @@ -9,6 +9,7 @@
> >  #include <linux/module.h>
> >  #include <linux/dma-direct.h>
> >  #include <linux/dma-map-ops.h>
> > +#include <linux/dma-heap.h>
> >
> >  struct dma_coherent_mem {
> >       void            *virt_base;
> > @@ -393,6 +394,14 @@ static int __init rmem_dma_setup(struct reserved_m=
em *rmem)
> >       rmem->ops =3D &rmem_dma_ops;
> >       pr_info("Reserved memory: created DMA memory pool at %pa, size %l=
d MiB\n",
> >               &rmem->base, (unsigned long)rmem->size / SZ_1M);
> > +
> > +     if (IS_ENABLED(CONFIG_DMABUF_HEAPS_COHERENT)) {
> > +             int ret =3D dma_heap_coherent_register(rmem);
> > +
> > +             if (ret)
> > +                     pr_warn("Reserved memory: failed to register cohe=
rent heap for %s (%d)\n",
> > +                             rmem->name ? rmem->name : "unknown", ret)=
;
> > +     }
>
> I think this should be split into a patch of its own. It's going to be
> reviewed (and possibly merged) by another maintainer, through another
> tree.

That's fine. I will split it into another series then. I guess I can
send it with a Based-On: tag or similar to link two series together?

BR,
Albert

>
> Maxime


