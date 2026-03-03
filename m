Return-Path: <linux-media+bounces-54259-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOizByqepmlqRwAAu9opvQ
	(envelope-from <linux-media+bounces-54259-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 09:39:06 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 813781EAE1C
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 09:39:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07E69302D5D5
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 08:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E09EB3876AC;
	Tue,  3 Mar 2026 08:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R16Bq374";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="S/Ba2Uyd"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9730829A2
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 08:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772527136; cv=pass; b=cV7mAgUS7H9STvBAQl5+m8LFP7tZHGn+akQni8nmIOfUFiF0fup09nFnm3w/7ICrujFLz+gpXX9PJEiaWjWxBTfX0syEmMVnBEqOGDjU6PLbTpRaB3nAdnEojMcaffuMLt0TVoqqaz6OMdPcitybAm4N8iLAEq2LK+P03qgP9Tg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772527136; c=relaxed/simple;
	bh=QDQnInAsL2Qfmw6FBVNREV/abj8/0FdHTJn7iIXG0qQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cEboHMhg4MqxdBNVuR3z4CzpXxwNXKw9PB9+t9Mpy4CpCRB8a+7ZeMK7mfihHsnzt7Xm5dXiqhFe6LUFtonv8FwAwGRFWKG4EpsP/e6J5lIuR4yusP4U1LWBd5qG9p+i6Suj4NGWmcxq02m0u20OMf82ZS7rSNk4pSIbvG+ACCw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R16Bq374; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=S/Ba2Uyd; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772527133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rd+HXuut1lETpru3dBBpsGK37Q80G0fWm9xDLYLkL1U=;
	b=R16Bq374S54q5wDM6Op7gAMOLqSSmOGRbvoHL5R1nSB6uth02um30JTNSls6kNaeMBTEFK
	G9KF4NG57l1YGtMcWoXipWbtKMItCGh+2mEROErIpJiBkkmvgWdliDAeOeXZHpEjKJSCsa
	mlzT7aCg6CYHsA3gb9YZtDpJL+0cqJY=
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-352-aXMy0JhCPXWYn2qcKX7WOQ-1; Tue, 03 Mar 2026 03:38:52 -0500
X-MC-Unique: aXMy0JhCPXWYn2qcKX7WOQ-1
X-Mimecast-MFC-AGG-ID: aXMy0JhCPXWYn2qcKX7WOQ_1772527132
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-64ca4e3767dso5999949d50.2
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 00:38:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772527132; cv=none;
        d=google.com; s=arc-20240605;
        b=lciKO0dVs6MxdBbJOaXj7m/if/ZxjM+NuXHnEjz/v5jXICXx/fffse2aK1k6wqatYU
         5FWwnWmbZK3iABAKhvYOExxDiDsp44zDgZS5PDsv8vIyQ88SIBGjPSrmL5WT5nKq29KT
         iVCbe1Y9XBX1R3RqxoXA7IYXSudT+UAogAWtfIWy1hSZrKfgx9nuSM4vPevgL9eVNOW4
         CCoxP0BSuW8b/4Cuq6VkcQzNm9Bceff5a3B5jfn7bDh8NYz/UT9HH1CYlGCJ1Np8XjPK
         WQG8zUEjLxCLMWwulVh9mIPLdguN/AMMaRZNeAmhDwdlgh0pjiLaufv66KfkFUchbXL+
         EfBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rd+HXuut1lETpru3dBBpsGK37Q80G0fWm9xDLYLkL1U=;
        fh=S+VJxQkbS3xa/YrXSGF07NE5TNhegVctRS3nA87pwtA=;
        b=jNHlmWRReZkzVgBPP4gmdbIfDLWCgnO6/DRMjClEJKs0Cc+fSkCD74XcqGJ7WOOHIL
         GeGkEZkPnOYYeB7C1lxoWnrIS113tB6WngIWb6Jji9W6w1EaGc5bnwrTEZ9L+2bhDH4r
         g06PjbE/jIgMTCMpqMMpKSfr2wzGMspC4mh6R65JlGYNzls3WpkjGNdtuObqAmuPVWcW
         SEDPQs1DhiaUy7ZciZttCrTjx4dR3/v7WGYSOBXFmQKhXAo5Jek6QoRPSUE00anmvl4B
         mYMQjRlWRqXh/07pQ1211JgGHRSaItlBy3BZmNg/+X1XZi4ehzcpkMjzd2VLE2zEmz0v
         /75A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772527132; x=1773131932; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rd+HXuut1lETpru3dBBpsGK37Q80G0fWm9xDLYLkL1U=;
        b=S/Ba2UydCNk9AaQC8RADx+F0fXcYImwXbOEqBN0jIsP30ZgWKwiIEU0yGlhtAikNvV
         UyA92jHJi7ga15CvvAHfYrD7KYdgoVUdFDnRlw8tibMie7sHNAlmBJEiIhfdhDv86cOm
         tf77VokpXf0D3Fyzo6nTgRFDM2MDJsQojQjTQhYpyezlKLvH0nzlhVG4JDs0a6AlJ5Fu
         debITiXIK7K9MnGRR71FE27BvdMU172+UvXqzBJJQKKzktxd/dnLyCobKFrX+QE14SFT
         j4lvbWfMyyJmDPGzDJcMqCk/GSr6tUDLZtFOaeStal9ncRUL/31SFOT81Cg8IuQbdCEz
         lTIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772527132; x=1773131932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rd+HXuut1lETpru3dBBpsGK37Q80G0fWm9xDLYLkL1U=;
        b=HpyhP/j6HZssvYMrQgfzub1OKadkWln4kaeLMeINtjOQ6TJtTXdjSp4o+lT8VsL0Fn
         Oy7auuSmMmWw0q2xnNV/QWEZV5D3fXAkJx/qiA/WaiBNLNQWhIaNmy/phFT7wjLjrgp1
         HauYvfoFth9NXJjSNaa1sJHxGS55+Oobzn8a7fpolUs/rh/X1JvftG7ml6Tk9q0PvZ3Q
         OtZsG6ckB+b9ZoX+mTnclTAZ1xEBnhk3L3ldeXlz+uQpjh2z3jY0M35FGwTkiWU6v8MP
         KWDNh4fQhEERBA6q64Ai3PjseLLBzo7bs5UljCJgXNtrc/Ith5RFgXr9CUjAS6zZAmwP
         uioQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6DzjHWGP+ltVPO6xR7K8IKR7/r7yfFXDr+LSruAlP8tU7qzqmiWZkKAABkpW64FodveWCEgWPQgF0rQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/TAeG3mdtYf9ei+WQHkKjCINqa2rk6A16Yrm083aXM2eyCsvO
	Bi8AYa31HGHlKKDA3KfmSmIqhXLHQW/mMqFQWaZr/IJqhoBlJsqtYC1zuyDyFFn+NJnevm0LH12
	itVvVa1iHH4GGTbrZzJarNu2uioLq3O0Ki7iAjIh9PUKOfk7ArwiRSBEUJ+oEGzyRdZ92UnvmKG
	fD1J2ZGPr3bVDBudR5GINYoFN+WxZT/YbA88sFofw=
X-Gm-Gg: ATEYQzwv2a9Yy/EGE7HPYY085YmDVjVyIl6kET6lA57ubkC2p7WJmefGvlQIvHkZ5/n
	Q0buLaTKmd3ecmDHFEeEvKVu41K0xsQxJCEJdObkAJlSRtzPVQWdeXavgCi5hQ632U0g4pMzAtx
	mE4avm1hG7uFsay+ibffKUxbuGhsp8FEeStMEcfWMj389EB5DnV7E5DfS7tXPC/6B1LjTaAQQ9v
	Q==
X-Received: by 2002:a53:ee60:0:b0:64c:9abc:27d5 with SMTP id 956f58d0204a3-64cc204847dmr10424757d50.2.1772527131950;
        Tue, 03 Mar 2026 00:38:51 -0800 (PST)
X-Received: by 2002:a53:ee60:0:b0:64c:9abc:27d5 with SMTP id
 956f58d0204a3-64cc204847dmr10424739d50.2.1772527131449; Tue, 03 Mar 2026
 00:38:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260224-b4-dmabuf-heap-coherent-rmem-v1-1-dffef43298ac@redhat.com>
 <20260226-smoky-fancy-dachshund-1a2f92@penduick> <CADSE00+PwA-ZC9F2_rryi9XZaz9gPWd2qUA5NSaLQUs78gmvvw@mail.gmail.com>
In-Reply-To: <CADSE00+PwA-ZC9F2_rryi9XZaz9gPWd2qUA5NSaLQUs78gmvvw@mail.gmail.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Tue, 3 Mar 2026 09:38:40 +0100
X-Gm-Features: AaiRm53owRtuWIif-EW8znMUUIlsgF8fdMlhGZ-WMbFVsOOUM3G5V6Owv7M9krs
Message-ID: <CADSE00LUJJRHxXnRZ6_xi-oRPXaS-0-+Jtjeua2HW=JvLdW0=g@mail.gmail.com>
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
X-Rspamd-Queue-Id: 813781EAE1C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54259-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aesteve@redhat.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[exp_info.name:url,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 1:49=E2=80=AFPM Albert Esteve <aesteve@redhat.com> =
wrote:
>
> Hi Maxime!
>
> On Thu, Feb 26, 2026 at 11:12=E2=80=AFAM Maxime Ripard <mripard@redhat.co=
m> wrote:
> >
> > Hi Albert,
> >
> > Thanks for your patch!
> >
> > On Tue, Feb 24, 2026 at 08:57:33AM +0100, Albert Esteve wrote:
> > > Add a dma-buf heap for DT coherent reserved-memory
> > > (i.e., 'shared-dma-pool' without 'reusable' property),
> > > exposing one heap per region for userspace buffers.
> > >
> > > The heap binds a synthetic platform device to each region
> > > so coherent allocations use the correct dev->dma_mem,
> > > and it defers registration until late_initcall when
> > > normal allocator are available.
> > >
> > > This patch includes charging of the coherent heap
> > > allocator to the dmem cgroup.
> > >
> > > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > > ---
> > > This patch introduces a new driver to expose DT coherent reserved-mem=
ory
> > > regions as dma-buf heaps, allowing userspace buffers to be created.
> > >
> > > Since these regions are device-dependent, we bind a synthetic platfor=
m
> > > device to each region so coherent allocations use the correct dev->dm=
a_mem.
> > >
> > > Following Eric=E2=80=99s [1] and Maxime=E2=80=99s [2] work on chargin=
g DMA buffers
> > > allocated from userspace to cgroups (dmem), this patch adds the same
> > > charging pattern used by CMA heaps patch. Charging is done only throu=
gh
> > > the dma-buf heap interface so it can be attributed to a userspace all=
ocator.
> > >
> > > This allows each device-specific reserved-memory region to enforce it=
s
> > > own limits.
> > >
> > > [1] https://lore.kernel.org/all/20260218-dmabuf-heap-cma-dmem-v2-0-b2=
49886fb7b2@redhat.com/
> > > [2] https://lore.kernel.org/all/20250310-dmem-cgroups-v1-0-2984c1bc93=
12@kernel.org/
> > > ---
> > >  drivers/dma-buf/heaps/Kconfig         |  17 ++
> > >  drivers/dma-buf/heaps/Makefile        |   1 +
> > >  drivers/dma-buf/heaps/coherent_heap.c | 485 ++++++++++++++++++++++++=
++++++++++
> > >  include/linux/dma-heap.h              |  11 +
> > >  kernel/dma/coherent.c                 |   9 +
> > >  5 files changed, 523 insertions(+)
> > >
> > > diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kc=
onfig
> > > index a5eef06c42264..93765dca164e3 100644
> > > --- a/drivers/dma-buf/heaps/Kconfig
> > > +++ b/drivers/dma-buf/heaps/Kconfig
> > > @@ -12,3 +12,20 @@ config DMABUF_HEAPS_CMA
> > >         Choose this option to enable dma-buf CMA heap. This heap is b=
acked
> > >         by the Contiguous Memory Allocator (CMA). If your system has =
these
> > >         regions, you should say Y here.
> > > +
> > > +config DMABUF_HEAPS_COHERENT
> > > +     bool "DMA-BUF Coherent Reserved-Memory Heap"
> > > +     depends on DMABUF_HEAPS && OF_RESERVED_MEM && DMA_DECLARE_COHER=
ENT
> > > +     help
> > > +       Choose this option to enable coherent reserved-memory dma-buf=
 heaps.
> > > +       This heap is backed by non-reusable DT "shared-dma-pool" regi=
ons.
> > > +       If your system defines coherent reserved-memory regions, you =
should
> > > +       say Y here.
> > > +
> > > +config COHERENT_AREAS_DEFERRED
> > > +     int "Max deferred coherent reserved-memory regions"
> > > +     depends on DMABUF_HEAPS_COHERENT
> > > +     default 16
> > > +     help
> > > +       Maximum number of coherent reserved-memory regions that can b=
e
> > > +       deferred for later registration during early boot.
> > > diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/heaps/M=
akefile
> > > index 974467791032f..96bda7a65f041 100644
> > > --- a/drivers/dma-buf/heaps/Makefile
> > > +++ b/drivers/dma-buf/heaps/Makefile
> > > @@ -1,3 +1,4 @@
> > >  # SPDX-License-Identifier: GPL-2.0
> > >  obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)    +=3D system_heap.o
> > >  obj-$(CONFIG_DMABUF_HEAPS_CMA)               +=3D cma_heap.o
> > > +obj-$(CONFIG_DMABUF_HEAPS_COHERENT)  +=3D coherent_heap.o
> > > diff --git a/drivers/dma-buf/heaps/coherent_heap.c b/drivers/dma-buf/=
heaps/coherent_heap.c
> > > new file mode 100644
> > > index 0000000000000..870b2b89aefcb
> > > --- /dev/null
> > > +++ b/drivers/dma-buf/heaps/coherent_heap.c
> > > @@ -0,0 +1,485 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * DMABUF heap for coherent reserved-memory regions
> > > + *
> > > + * Copyright (C) 2026 Red Hat, Inc.
> > > + * Author: Albert Esteve <aesteve@redhat.com>
> > > + *
> > > + */
> > > +
> > > +#include <linux/cgroup_dmem.h>
> > > +#include <linux/dma-heap.h>
> > > +#include <linux/dma-buf.h>
> > > +#include <linux/dma-mapping.h>
> > > +#include <linux/err.h>
> > > +#include <linux/highmem.h>
> > > +#include <linux/iosys-map.h>
> > > +#include <linux/of_reserved_mem.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/scatterlist.h>
> > > +#include <linux/slab.h>
> > > +#include <linux/vmalloc.h>
> > > +
> > > +#define DEFERRED_AREAS_MAX CONFIG_COHERENT_AREAS_DEFERRED
> >
> > I'm not sure we need to make it configurable. Distros are going to set
> > it to the user with the highest number of regions anyway. How about
> > using MAX_RESERVED_REGIONS for now?
>
> Makes sense, will do.
>
> >
> > >
> > > [...]
> > >
> > > +struct coherent_heap {
> > > +     struct dma_heap *heap;
> > > +     struct reserved_mem *rmem;
> > > +     char *name;
> > > +     struct device *dev;
> > > +     struct platform_device *pdev;
> > > +#if IS_ENABLED(CONFIG_CGROUP_DMEM)
> > > +     struct dmem_cgroup_region *cg;
> > > +#endif
> >
> > We might want to leave the dmem accounting out for now so we can focus
> > on the heap itself. That being said, it ended up being pretty trivial
> > for CMA, so maybe it's not too much of a concern.
>
> Sure. That allows us to follow the same patterns once the CMA series land=
s.
> I will strip all dmem accounting parts for v2.
>
> >
> > >
> > > [...]
> > >
> > > +static int __coherent_heap_register(struct reserved_mem *rmem)
> > > +{
> > > +     struct dma_heap_export_info exp_info;
> > > +     struct coherent_heap *coh_heap;
> > > +#if IS_ENABLED(CONFIG_CGROUP_DMEM)
> > > +     struct dmem_cgroup_region *region;
> > > +#endif
> > > +     const char *rmem_name;
> > > +     int ret;
> > > +
> > > +     if (!rmem)
> > > +             return -EINVAL;
> > > +
> > > +     rmem_name =3D rmem->name ? rmem->name : "unknown";
> >
> > If the reserved region has no name, we probably shouldn't expose it to
> > userspace at all. Using unknown will probably create some bugs if you
> > have several, but also it's pretty like to have a name at some point an=
d
> > thus we wouldn't have a stable name for the uAPI.
>
> Agreed. I will return an error code if no name is present.
>
> >
> > > +     coh_heap =3D kzalloc_obj(*coh_heap);
> > > +     if (!coh_heap)
> > > +             return -ENOMEM;
> > > +
> > > +     coh_heap->name =3D kasprintf(GFP_KERNEL, "coherent_%s", rmem_na=
me);
> > > +     if (!coh_heap->name) {
> > > +             ret =3D -ENOMEM;
> > > +             goto free_coherent_heap;
> > > +     }
> >
> > Similarly, we shouldn't use the coherent_ prefix for the heap name. If
> > the backing allocator ever changes (and between contiguous and coherent=
,
> > the difference is just a single property value in the DT), then the nam=
e
> > would change and userspace would break. We should directly use the name
> > of the region here.
> >
> > > +     coh_heap->rmem =3D rmem;
> > > +
> > > +     /* create a platform device per rmem and bind it */
> > > +     coh_heap->pdev =3D platform_device_register_simple("coherent-he=
ap",
> > > +                                                      PLATFORM_DEVID=
_AUTO,
> > > +                                                      NULL, 0);
> > > +     if (IS_ERR(coh_heap->pdev)) {
> > > +             ret =3D PTR_ERR(coh_heap->pdev);
> > > +             goto free_name;
> > > +     }
> >
> > We probably should use a faux_device here instead of a platform_device,
> > but more importantly, the heap itself already has a device allocated fo=
r
> > it (dev_ret in dma_heap_add).
> >
> > It's not in struct dma_heap yet, but there's a patch that moves it ther=
e
> > that we should probably carry:
> > https://lore.kernel.org/r/20210120210937.15069-2-john.stultz@linaro.org=
/
>
> Thanks for sharing the link! I will pick the patch.
>
> >
> > > +     if (rmem->ops && rmem->ops->device_init) {
> > > +             ret =3D rmem->ops->device_init(rmem, &coh_heap->pdev->d=
ev);
> > > +             if (ret)
> > > +                     goto pdev_unregister;
> > > +     }
> >
> > I'm not really a fan of calling ops directly. Maybe we should create an
> > of_reserved_mem_device_init_with_mem function that would do it for us
> > (and would be called by of_reserved_mem_device_init_by_idx and the
> > likes).
>
> Agreed.
>
> >
> > > +     coh_heap->dev =3D &coh_heap->pdev->dev;
> > > +#if IS_ENABLED(CONFIG_CGROUP_DMEM)
> > > +     region =3D dmem_cgroup_register_region(rmem->size, "coh/%s", rm=
em_name);
> > > +     if (IS_ERR(region)) {
> > > +             ret =3D PTR_ERR(region);
> > > +             goto pdev_unregister;
> > > +     }
> > > +     coh_heap->cg =3D region;
> > > +#endif
> >
> > Same comment than for CMA here: it should really be created by the
> > coherent memory region itself.
> >
> > > +     exp_info.name =3D coh_heap->name;
> > > +     exp_info.ops =3D &coherent_heap_ops;
> > > +     exp_info.priv =3D coh_heap;
> > > +
> > > +     coh_heap->heap =3D dma_heap_add(&exp_info);
> > > +     if (IS_ERR(coh_heap->heap)) {
> > > +             ret =3D PTR_ERR(coh_heap->heap);
> > > +             goto cg_unregister;
> > > +     }
> > > +
> > > +     return 0;
> > > +
> > > +cg_unregister:
> > > +#if IS_ENABLED(CONFIG_CGROUP_DMEM)
> > > +     dmem_cgroup_unregister_region(coh_heap->cg);
> > > +#endif
> > > +pdev_unregister:
> > > +     platform_device_unregister(coh_heap->pdev);
> > > +     coh_heap->pdev =3D NULL;
> > > +free_name:
> > > +     kfree(coh_heap->name);
> > > +free_coherent_heap:
> > > +     kfree(coh_heap);
> > > +
> > > +     return ret;
> > > +}
> > > +
> > > +int dma_heap_coherent_register(struct reserved_mem *rmem)
> > > +{
> > > +     int ret;
> > > +
> > > +     ret =3D __coherent_heap_register(rmem);
> > > +     if (ret =3D=3D -ENOMEM)
> > > +             return coherent_heap_add_deferred(rmem);
> > > +     return ret;
> > > +}
> >
> > I appreciate you did it like we did for CMA, but if we ever want to mak=
e
> > that heap a module you'll end up with a dependency from the core kernel
> > on a module which doesn't work. The best here might be to wait a bit
> > until we have somewhat of an agreement on
> >
> > https://lore.kernel.org/r/20260225-dma-buf-heaps-as-modules-v1-0-210922=
5a090d@kernel.org
> >
> > > +static int __init coherent_heap_register_deferred(void)
> > > +{
> > > +     unsigned int i;
> > > +     int ret;
> > > +
> > > +     for (i =3D 0; i < rmem_areas_deferred_num; i++) {
> > > +             struct reserved_mem *rmem =3D rmem_areas_deferred[i];
> > > +
> > > +             ret =3D __coherent_heap_register(rmem);
> > > +             if (ret) {
> > > +                     pr_warn("Failed to add coherent heap %s",
> > > +                             rmem->name ? rmem->name : "unknown");
> > > +                     continue;
> > > +             }
> > > +     }
> > > +
> > > +     return 0;
> > > +}
> > > +late_initcall(coherent_heap_register_deferred);
> >
> > Why do you need a late_initcall here? Isn't module_init enough?
>
> When I tested this initially, I relied on direct invocations from
> cma/coherent.c to register new coherent heap areas. However it failed
> in `kzalloc_obj` calls within the register function. Then I read the
> article about boot time memory management[1] and saw other drivers
> collected info for deferred initialization at late_initcall(), similar
> to what I tried to do here. I honestly did not try with module_init().
> Since I will refactor this part to follow your previous comments, I
> will try to update if possible.
>
> [1] https://docs.kernel.org/core-api/boot-time-mm.html
>
> >
> > > +MODULE_DESCRIPTION("DMA-BUF heap for coherent reserved-memory region=
s");
> > > diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
> > > index 648328a64b27e..e894cfa1ecf1a 100644
> > > --- a/include/linux/dma-heap.h
> > > +++ b/include/linux/dma-heap.h
> > > @@ -9,9 +9,11 @@
> > >  #ifndef _DMA_HEAPS_H
> > >  #define _DMA_HEAPS_H
> > >
> > > +#include <linux/errno.h>
> > >  #include <linux/types.h>
> > >
> > >  struct dma_heap;
> > > +struct reserved_mem;
> > >
> > >  /**
> > >   * struct dma_heap_ops - ops to operate on a given heap
> > > @@ -48,4 +50,13 @@ struct dma_heap *dma_heap_add(const struct dma_hea=
p_export_info *exp_info);
> > >
> > >  extern bool mem_accounting;
> > >
> > > +#if IS_ENABLED(CONFIG_DMABUF_HEAPS_COHERENT)
> > > +int dma_heap_coherent_register(struct reserved_mem *rmem);
> > > +#else
> > > +static inline int dma_heap_coherent_register(struct reserved_mem *rm=
em)
> > > +{
> > > +     return -EOPNOTSUPP;
> > > +}
> > > +#endif
> > > +
> > >  #endif /* _DMA_HEAPS_H */
> > > diff --git a/kernel/dma/coherent.c b/kernel/dma/coherent.c
> > > index 1147497bc512c..f49d13e460e4b 100644
> > > --- a/kernel/dma/coherent.c
> > > +++ b/kernel/dma/coherent.c
> > > @@ -9,6 +9,7 @@
> > >  #include <linux/module.h>
> > >  #include <linux/dma-direct.h>
> > >  #include <linux/dma-map-ops.h>
> > > +#include <linux/dma-heap.h>
> > >
> > >  struct dma_coherent_mem {
> > >       void            *virt_base;
> > > @@ -393,6 +394,14 @@ static int __init rmem_dma_setup(struct reserved=
_mem *rmem)
> > >       rmem->ops =3D &rmem_dma_ops;
> > >       pr_info("Reserved memory: created DMA memory pool at %pa, size =
%ld MiB\n",
> > >               &rmem->base, (unsigned long)rmem->size / SZ_1M);
> > > +
> > > +     if (IS_ENABLED(CONFIG_DMABUF_HEAPS_COHERENT)) {
> > > +             int ret =3D dma_heap_coherent_register(rmem);
> > > +
> > > +             if (ret)
> > > +                     pr_warn("Reserved memory: failed to register co=
herent heap for %s (%d)\n",
> > > +                             rmem->name ? rmem->name : "unknown", re=
t);
> > > +     }
> >
> > I think this should be split into a patch of its own. It's going to be
> > reviewed (and possibly merged) by another maintainer, through another
> > tree.
>
> That's fine. I will split it into another series then. I guess I can
> send it with a Based-On: tag or similar to link two series together?

Oof, never mind. I see now that the suggestion is to split into a
patch of its own, not a different series. I misread it last time.

That makes more sense now.

>
> BR,
> Albert
>
> >
> > Maxime


