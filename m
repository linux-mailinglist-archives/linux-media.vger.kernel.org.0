Return-Path: <linux-media+bounces-55899-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOWXMK3zt2mfXQEAu9opvQ
	(envelope-from <linux-media+bounces-55899-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 13:12:29 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E592993FB
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 13:12:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E19CA3023912
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 12:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71E5C2BE639;
	Mon, 16 Mar 2026 12:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D5wD6fI8";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="HMeSvEGy"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098BC299AB1
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 12:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773662943; cv=none; b=LzGN7m0ke5xq7b/oo5DOY8iF+Sw7RisdfVFCiBIh4m15Aakk1egUSHVfRVpeoNSPa3Q5OqEDuXWLVvc/s6mANth6hKcUsQM/RfECqUd4gWhcjXXCrQYUrE31KI34UvZT7DPb13XxQfAP+03YUTpKsdZKeYOwsfS8MJJQfeyWeb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773662943; c=relaxed/simple;
	bh=jBLFFLQV8yHSfdC32lFmj4dK+ZWYo8SbBCwFTrA67xE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jOLrPVnM5p6gJPA9iqJpjNwetehIZQzOJEAxxIlh7Gs8a6freoFQM3qNv9f+aDFnx/2xG0UOuI9vKD8wpjhRltq0UngGveQpGeBy0d9SpuQLOIMe1ri0/ZZpJZO4ofogXGDKB6QvFEBB7iz112Tv+HkGe7rdYumzrFwVwalvTvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D5wD6fI8; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=HMeSvEGy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773662941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9hWncBj1VBOPQ2d4QY544TguWtyZIZ+X0CZjVivHv20=;
	b=D5wD6fI8Tmjw2Vjkscn5Dap95j19JGSegj8jyEKSdiWYBq3bGDleLllj1LdAoBWaqxCu3b
	AGdUvNE/mXHch/uj2JabADZ8+YbsZ0G3YGkkr6v95SiqdC+bPBIoCe/nre+PHmrh4xHRFE
	h5PmRjXuJPtO9wowANlq+pftwCi2lYk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-62-SkGQk7z2MDqmOOkdbm1yZw-1; Mon, 16 Mar 2026 08:08:59 -0400
X-MC-Unique: SkGQk7z2MDqmOOkdbm1yZw-1
X-Mimecast-MFC-AGG-ID: SkGQk7z2MDqmOOkdbm1yZw_1773662938
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-43b47c19ed8so397229f8f.1
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 05:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773662938; x=1774267738; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9hWncBj1VBOPQ2d4QY544TguWtyZIZ+X0CZjVivHv20=;
        b=HMeSvEGyHywWEFwnQzvm75U1CMeDbBZaVrOyvdsGwgVCDjFw1Xv1lpEU8TlZT0Ko3Z
         Y80+aZqfK1vvum4sUrs7rH5Yy5josX9z8+BB5WqbmbnBi6Wry2srTYmF2Sw4Vp9wwXdo
         k+7SndZbLsJ1qGiN/LOSo6GYbzjKvE3VoyoCG3p+LrTOHBWnhX3WssoSHIOINcKAV9IZ
         BlXB7JbzyCX5wNfpZMlbZJ/Uqe+KRDnTVT8QQTzUBy4JC+5DBji5d1L5mTzAwTEKHdkX
         rd4iX/nV5aVRnY9LYTYN2BNvCvhjJQ0yAMcC3ijPANRW5/A2k270KUdfJ7vl4cprik92
         pVGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773662938; x=1774267738;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9hWncBj1VBOPQ2d4QY544TguWtyZIZ+X0CZjVivHv20=;
        b=eN+RHG/9gkvCGKN8ZyHSM6NFgPIoZr5m87x/KatU6iyVXKql92OhwzxFdRC1RjFBj5
         XQDe7j8oYkQE/Qk3OiLRF9BqeTEeVSX3zdD7bSooWne6PxLbDW1jZlW8ccF3UUjDQkwI
         Dn5MqHB8v9rmqYpfgZYg55BP9gPn4YTQ44do6JdUdmFzXzZAUG6MQpSgWAZGNBL0xCdD
         wEILMkmrZxZXlCNx7vExpANSRg3jFp/+UqpC5i/JaaK64qWaZT32YZLqjkxQ9xh464U9
         ee88dYtY2MncbRCAqxcp1LbwlGREWpHjYQv88tK6JOZ3KLtDW68NNJK9VpPeo9npA+W/
         7pRQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1OdWftYCjZVrqLV2i5BOBb1dmk7is+Y405JItBonNJ+2IidTJNyEjVgPaWLo9l7YQv9QC6J1x9Vx2Xg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRN+GZO0tectXDERuLQa09/KOzJstgmm1Pw3pyR/0PfV/XRsH7
	ql8jNLTOAyi+DjHd5I8g66H3nDFcFkSylSbHnMQ3sPfdhuIXjrVpisvJIh0w0rJkts3/2ouonNe
	n0HOj58qv3MRgRhFoM+n1QWQHfQQj8sx1UYeoOgWNLiAK6U5kq7MchBaZbcBS+FC6
X-Gm-Gg: ATEYQzyKDxf4WZjNm04ieqsTbZb+6zAKka9eDdNdh4o5bNjhJW9Q8J+3B9sdJnpOpZj
	5vVuOt+DfXeCDJu3xT3kDYHNjViyTxH6JczLrF2Dyxv7DJ2ZLSlyb0i7ariizFAzKWCfPYlzFof
	dVJVdv1MvSp1OL5G0EB/q6VV/dQWFptWjx5Y1WSpyv3f1AbI7wphh18TkEgB1vcnjidHhJh+Rl7
	cdvGs3DKPZTfzVdPxxb+19VYzhYxvnPCtNbey1YRrbYq+bxvZcMduyW/NzWsyonhjzRZwiTwvLa
	LRA1JRGOjRme0MoOxZImbqjJxpyuBggktTDZ6HZTB997l4zjGFxV0J0fcRowTrQGI49t5CKCtA=
	=
X-Received: by 2002:a05:6000:250c:b0:439:cbcb:5723 with SMTP id ffacd0b85a97d-43a04dc083emr23719022f8f.42.1773662937769;
        Mon, 16 Mar 2026 05:08:57 -0700 (PDT)
X-Received: by 2002:a05:6000:250c:b0:439:cbcb:5723 with SMTP id ffacd0b85a97d-43a04dc083emr23718918f8f.42.1773662937106;
        Mon, 16 Mar 2026 05:08:57 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20c473sm44146333f8f.24.2026.03.16.05.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 05:08:56 -0700 (PDT)
Date: Mon, 16 Mar 2026 13:08:55 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Andrew Davis <afd@ti.com>
Cc: Albert Esteve <aesteve@redhat.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
	"T.J. Mercier" <tjmercier@google.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	echanude@redhat.com
Subject: Re: [PATCH v3 5/6] dma-buf: heaps: Add Coherent heap to dmabuf heaps
Message-ID: <20260316-cherubic-eel-of-philosophy-10ef2b@houat>
References: <20260306-b4-dmabuf-heap-coherent-rmem-v3-0-3d00d36c9bc4@redhat.com>
 <20260306-b4-dmabuf-heap-coherent-rmem-v3-5-3d00d36c9bc4@redhat.com>
 <e8dd476f-1be8-46fa-bf56-65fe0bfe29a1@ti.com>
 <CADSE00+-SQr3wGdgBmLowHPWE5bGxoyO4o20jZs4ma-71aOxUA@mail.gmail.com>
 <1afc696a-9afb-48af-887d-2a209680784e@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="jscl64m2oiw74tyk"
Content-Disposition: inline
In-Reply-To: <1afc696a-9afb-48af-887d-2a209680784e@ti.com>
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55899-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@redhat.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E5E592993FB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--jscl64m2oiw74tyk
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 5/6] dma-buf: heaps: Add Coherent heap to dmabuf heaps
MIME-Version: 1.0

Hi Andrew, Albert,

On Wed, Mar 11, 2026 at 08:18:28AM -0500, Andrew Davis wrote:
> On 3/11/26 5:19 AM, Albert Esteve wrote:
> > On Tue, Mar 10, 2026 at 4:34=E2=80=AFPM Andrew Davis <afd@ti.com> wrote:
> > >=20
> > > On 3/6/26 4:36 AM, Albert Esteve wrote:
> > > > Expose DT coherent reserved-memory pools ("shared-dma-pool"
> > > > without "reusable") as dma-buf heaps, creating one heap per
> > > > region so userspace can allocate from the exact device-local
> > > > pool intended for coherent DMA.
> > > >=20
> > > > This is a missing backend in the long-term effort to steer
> > > > userspace buffer allocations (DRM, v4l2, dma-buf heaps)
> > > > through heaps for clearer cgroup accounting. CMA and system
> > > > heaps already exist; non-reusable coherent reserved memory
> > > > did not.
> > > >=20
> > > > The heap binds the heap device to each memory region so
> > > > coherent allocations use the correct dev->dma_mem, and
> > > > it defers registration until module_init when normal
> > > > allocators are available.
> > > >=20
> > > > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > > > ---
> > > >    drivers/dma-buf/heaps/Kconfig         |   9 +
> > > >    drivers/dma-buf/heaps/Makefile        |   1 +
> > > >    drivers/dma-buf/heaps/coherent_heap.c | 414 ++++++++++++++++++++=
++++++++++++++
> > > >    3 files changed, 424 insertions(+)
> > > >=20
> > > > diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/=
Kconfig
> > > > index a5eef06c42264..aeb475e585048 100644
> > > > --- a/drivers/dma-buf/heaps/Kconfig
> > > > +++ b/drivers/dma-buf/heaps/Kconfig
> > > > @@ -12,3 +12,12 @@ config DMABUF_HEAPS_CMA
> > > >          Choose this option to enable dma-buf CMA heap. This heap i=
s backed
> > > >          by the Contiguous Memory Allocator (CMA). If your system h=
as these
> > > >          regions, you should say Y here.
> > > > +
> > > > +config DMABUF_HEAPS_COHERENT
> > > > +     bool "DMA-BUF Coherent Reserved-Memory Heap"
> > > > +     depends on DMABUF_HEAPS && OF_RESERVED_MEM && DMA_DECLARE_COH=
ERENT
> > > > +     help
> > > > +       Choose this option to enable coherent reserved-memory dma-b=
uf heaps.
> > > > +       This heap is backed by non-reusable DT "shared-dma-pool" re=
gions.
> > > > +       If your system defines coherent reserved-memory regions, yo=
u should
> > > > +       say Y here.
> > > > diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/heaps=
/Makefile
> > > > index 974467791032f..96bda7a65f041 100644
> > > > --- a/drivers/dma-buf/heaps/Makefile
> > > > +++ b/drivers/dma-buf/heaps/Makefile
> > > > @@ -1,3 +1,4 @@
> > > >    # SPDX-License-Identifier: GPL-2.0
> > > >    obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)   +=3D system_heap.o
> > > >    obj-$(CONFIG_DMABUF_HEAPS_CMA)              +=3D cma_heap.o
> > > > +obj-$(CONFIG_DMABUF_HEAPS_COHERENT)  +=3D coherent_heap.o
> > > > diff --git a/drivers/dma-buf/heaps/coherent_heap.c b/drivers/dma-bu=
f/heaps/coherent_heap.c
> > > > new file mode 100644
> > > > index 0000000000000..55f53f87c4c15
> > > > --- /dev/null
> > > > +++ b/drivers/dma-buf/heaps/coherent_heap.c
> > > > @@ -0,0 +1,414 @@
> > > > +// SPDX-License-Identifier: GPL-2.0
> > > > +/*
> > > > + * DMABUF heap for coherent reserved-memory regions
> > > > + *
> > > > + * Copyright (C) 2026 Red Hat, Inc.
> > > > + * Author: Albert Esteve <aesteve@redhat.com>
> > > > + *
> > > > + */
> > > > +
> > > > +#include <linux/dma-buf.h>
> > > > +#include <linux/dma-heap.h>
> > > > +#include <linux/dma-map-ops.h>
> > > > +#include <linux/dma-mapping.h>
> > > > +#include <linux/err.h>
> > > > +#include <linux/highmem.h>
> > > > +#include <linux/iosys-map.h>
> > > > +#include <linux/of_reserved_mem.h>
> > > > +#include <linux/scatterlist.h>
> > > > +#include <linux/slab.h>
> > > > +#include <linux/vmalloc.h>
> > > > +
> > > > +struct coherent_heap {
> > > > +     struct dma_heap *heap;
> > > > +     struct reserved_mem *rmem;
> > > > +     char *name;
> > > > +};
> > > > +
> > > > +struct coherent_heap_buffer {
> > > > +     struct coherent_heap *heap;
> > > > +     struct list_head attachments;
> > > > +     struct mutex lock;
> > > > +     unsigned long len;
> > > > +     dma_addr_t dma_addr;
> > > > +     void *alloc_vaddr;
> > > > +     struct page **pages;
> > > > +     pgoff_t pagecount;
> > > > +     int vmap_cnt;
> > > > +     void *vaddr;
> > > > +};
> > > > +
> > > > +struct dma_heap_attachment {
> > > > +     struct device *dev;
> > > > +     struct sg_table table;
> > > > +     struct list_head list;
> > > > +     bool mapped;
> > > > +};
> > > > +
> > > > +static int coherent_heap_attach(struct dma_buf *dmabuf,
> > > > +                             struct dma_buf_attachment *attachment)
> > > > +{
> > > > +     struct coherent_heap_buffer *buffer =3D dmabuf->priv;
> > > > +     struct dma_heap_attachment *a;
> > > > +     int ret;
> > > > +
> > > > +     a =3D kzalloc_obj(*a);
> > > > +     if (!a)
> > > > +             return -ENOMEM;
> > > > +
> > > > +     ret =3D sg_alloc_table_from_pages(&a->table, buffer->pages,
> > > > +                                     buffer->pagecount, 0,
> > > > +                                     buffer->pagecount << PAGE_SHI=
FT,
> > > > +                                     GFP_KERNEL);
> > > > +     if (ret) {
> > > > +             kfree(a);
> > > > +             return ret;
> > > > +     }
> > > > +
> > > > +     a->dev =3D attachment->dev;
> > > > +     INIT_LIST_HEAD(&a->list);
> > > > +     a->mapped =3D false;
> > > > +
> > > > +     attachment->priv =3D a;
> > > > +
> > > > +     mutex_lock(&buffer->lock);
> > > > +     list_add(&a->list, &buffer->attachments);
> > > > +     mutex_unlock(&buffer->lock);
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static void coherent_heap_detach(struct dma_buf *dmabuf,
> > > > +                              struct dma_buf_attachment *attachmen=
t)
> > > > +{
> > > > +     struct coherent_heap_buffer *buffer =3D dmabuf->priv;
> > > > +     struct dma_heap_attachment *a =3D attachment->priv;
> > > > +
> > > > +     mutex_lock(&buffer->lock);
> > > > +     list_del(&a->list);
> > > > +     mutex_unlock(&buffer->lock);
> > > > +
> > > > +     sg_free_table(&a->table);
> > > > +     kfree(a);
> > > > +}
> > > > +
> > > > +static struct sg_table *coherent_heap_map_dma_buf(struct dma_buf_a=
ttachment *attachment,
> > > > +                                               enum dma_data_direc=
tion direction)
> > > > +{
> > > > +     struct dma_heap_attachment *a =3D attachment->priv;
> > > > +     struct sg_table *table =3D &a->table;
> > > > +     int ret;
> > > > +
> > > > +     ret =3D dma_map_sgtable(attachment->dev, table, direction, 0);
> > > > +     if (ret)
> > > > +             return ERR_PTR(-ENOMEM);
> > > > +     a->mapped =3D true;
> > > > +
> > > > +     return table;
> > > > +}
> > > > +
> > > > +static void coherent_heap_unmap_dma_buf(struct dma_buf_attachment =
*attachment,
> > > > +                                     struct sg_table *table,
> > > > +                                     enum dma_data_direction direc=
tion)
> > > > +{
> > > > +     struct dma_heap_attachment *a =3D attachment->priv;
> > > > +
> > > > +     a->mapped =3D false;
> > > > +     dma_unmap_sgtable(attachment->dev, table, direction, 0);
> > > > +}
> > > > +
> > > > +static int coherent_heap_dma_buf_begin_cpu_access(struct dma_buf *=
dmabuf,
> > > > +                                               enum dma_data_direc=
tion direction)
> > > > +{
> > > > +     struct coherent_heap_buffer *buffer =3D dmabuf->priv;
> > > > +     struct dma_heap_attachment *a;
> > > > +
> > > > +     mutex_lock(&buffer->lock);
> > > > +     if (buffer->vmap_cnt)
> > > > +             invalidate_kernel_vmap_range(buffer->vaddr, buffer->l=
en);
> > > > +
> > > > +     list_for_each_entry(a, &buffer->attachments, list) {
> > > > +             if (!a->mapped)
> > > > +                     continue;
> > > > +             dma_sync_sgtable_for_cpu(a->dev, &a->table, direction=
);
> > > > +     }
> > > > +     mutex_unlock(&buffer->lock);
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static int coherent_heap_dma_buf_end_cpu_access(struct dma_buf *dm=
abuf,
> > > > +                                             enum dma_data_directi=
on direction)
> > > > +{
> > > > +     struct coherent_heap_buffer *buffer =3D dmabuf->priv;
> > > > +     struct dma_heap_attachment *a;
> > > > +
> > > > +     mutex_lock(&buffer->lock);
> > > > +     if (buffer->vmap_cnt)
> > > > +             flush_kernel_vmap_range(buffer->vaddr, buffer->len);
> > > > +
> > > > +     list_for_each_entry(a, &buffer->attachments, list) {
> > > > +             if (!a->mapped)
> > > > +                     continue;
> > > > +             dma_sync_sgtable_for_device(a->dev, &a->table, direct=
ion);
> > > > +     }
> > > > +     mutex_unlock(&buffer->lock);
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static int coherent_heap_mmap(struct dma_buf *dmabuf, struct vm_ar=
ea_struct *vma)
> > > > +{
> > > > +     struct coherent_heap_buffer *buffer =3D dmabuf->priv;
> > > > +     struct coherent_heap *coh_heap =3D buffer->heap;
> > > > +     struct device *heap_dev =3D dma_heap_get_dev(coh_heap->heap);
> > > > +
> > > > +     return dma_mmap_coherent(heap_dev, vma, buffer->alloc_vaddr,
> > > > +                              buffer->dma_addr, buffer->len);
> > > > +}
> > > > +
> > > > +static void *coherent_heap_do_vmap(struct coherent_heap_buffer *bu=
ffer)
> > > > +{
> > > > +     void *vaddr;
> > > > +
> > > > +     vaddr =3D vmap(buffer->pages, buffer->pagecount, VM_MAP, PAGE=
_KERNEL);
> > > > +     if (!vaddr)
> > > > +             return ERR_PTR(-ENOMEM);
> > > > +
> > > > +     return vaddr;
> > > > +}
> > > > +
> > > > +static int coherent_heap_vmap(struct dma_buf *dmabuf, struct iosys=
_map *map)
> > > > +{
> > > > +     struct coherent_heap_buffer *buffer =3D dmabuf->priv;
> > > > +     void *vaddr;
> > > > +     int ret =3D 0;
> > > > +
> > > > +     mutex_lock(&buffer->lock);
> > > > +     if (buffer->vmap_cnt) {
> > > > +             buffer->vmap_cnt++;
> > > > +             iosys_map_set_vaddr(map, buffer->vaddr);
> > > > +             goto out;
> > > > +     }
> > > > +
> > > > +     vaddr =3D coherent_heap_do_vmap(buffer);
> > > > +     if (IS_ERR(vaddr)) {
> > > > +             ret =3D PTR_ERR(vaddr);
> > > > +             goto out;
> > > > +     }
> > > > +
> > > > +     buffer->vaddr =3D vaddr;
> > > > +     buffer->vmap_cnt++;
> > > > +     iosys_map_set_vaddr(map, buffer->vaddr);
> > > > +out:
> > > > +     mutex_unlock(&buffer->lock);
> > > > +
> > > > +     return ret;
> > > > +}
> > > > +
> > > > +static void coherent_heap_vunmap(struct dma_buf *dmabuf, struct io=
sys_map *map)
> > > > +{
> > > > +     struct coherent_heap_buffer *buffer =3D dmabuf->priv;
> > > > +
> > > > +     mutex_lock(&buffer->lock);
> > > > +     if (!--buffer->vmap_cnt) {
> > > > +             vunmap(buffer->vaddr);
> > > > +             buffer->vaddr =3D NULL;
> > > > +     }
> > > > +     mutex_unlock(&buffer->lock);
> > > > +     iosys_map_clear(map);
> > > > +}
> > > > +
> > > > +static void coherent_heap_dma_buf_release(struct dma_buf *dmabuf)
> > > > +{
> > > > +     struct coherent_heap_buffer *buffer =3D dmabuf->priv;
> > > > +     struct coherent_heap *coh_heap =3D buffer->heap;
> > > > +     struct device *heap_dev =3D dma_heap_get_dev(coh_heap->heap);
> > > > +
> > > > +     if (buffer->vmap_cnt > 0) {
> > > > +             WARN(1, "%s: buffer still mapped in the kernel\n", __=
func__);
> > > > +             vunmap(buffer->vaddr);
> > > > +             buffer->vaddr =3D NULL;
> > > > +             buffer->vmap_cnt =3D 0;
> > > > +     }
> > > > +
> > > > +     if (buffer->alloc_vaddr)
> > > > +             dma_free_coherent(heap_dev, buffer->len, buffer->allo=
c_vaddr,
> > > > +                               buffer->dma_addr);
> > > > +     kfree(buffer->pages);
> > > > +     kfree(buffer);
> > > > +}
> > > > +
> > > > +static const struct dma_buf_ops coherent_heap_buf_ops =3D {
> > > > +     .attach =3D coherent_heap_attach,
> > > > +     .detach =3D coherent_heap_detach,
> > > > +     .map_dma_buf =3D coherent_heap_map_dma_buf,
> > > > +     .unmap_dma_buf =3D coherent_heap_unmap_dma_buf,
> > > > +     .begin_cpu_access =3D coherent_heap_dma_buf_begin_cpu_access,
> > > > +     .end_cpu_access =3D coherent_heap_dma_buf_end_cpu_access,
> > > > +     .mmap =3D coherent_heap_mmap,
> > > > +     .vmap =3D coherent_heap_vmap,
> > > > +     .vunmap =3D coherent_heap_vunmap,
> > > > +     .release =3D coherent_heap_dma_buf_release,
> > > > +};
> > > > +
> > > > +static struct dma_buf *coherent_heap_allocate(struct dma_heap *hea=
p,
> > > > +                                           unsigned long len,
> > > > +                                           u32 fd_flags,
> > > > +                                           u64 heap_flags)
> > > > +{
> > > > +     struct coherent_heap *coh_heap;
> > > > +     struct coherent_heap_buffer *buffer;
> > > > +     struct device *heap_dev;
> > > > +     DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
> > > > +     size_t size =3D PAGE_ALIGN(len);
> > > > +     pgoff_t pagecount =3D size >> PAGE_SHIFT;
> > > > +     struct dma_buf *dmabuf;
> > > > +     int ret =3D -ENOMEM;
> > > > +     pgoff_t pg;
> > > > +
> > > > +     coh_heap =3D dma_heap_get_drvdata(heap);
> > > > +     if (!coh_heap)
> > > > +             return ERR_PTR(-EINVAL);
> > > > +
> > > > +     heap_dev =3D dma_heap_get_dev(coh_heap->heap);
> > > > +     if (!heap_dev)
> > > > +             return ERR_PTR(-ENODEV);
> > > > +
> > > > +     buffer =3D kzalloc_obj(*buffer);
> > > > +     if (!buffer)
> > > > +             return ERR_PTR(-ENOMEM);
> > > > +
> > > > +     INIT_LIST_HEAD(&buffer->attachments);
> > > > +     mutex_init(&buffer->lock);
> > > > +     buffer->len =3D size;
> > > > +     buffer->heap =3D coh_heap;
> > > > +     buffer->pagecount =3D pagecount;
> > > > +
> > > > +     buffer->alloc_vaddr =3D dma_alloc_coherent(heap_dev, buffer->=
len,
> > > > +                                              &buffer->dma_addr, G=
FP_KERNEL);
> > >=20
> > > You are doing this DMA allocation using a non-DMA pseudo-device (heap=
_dev).
> > > This is why you need to do that dma_coerce_mask_and_coherent(64) nons=
ense, you
> > > are doing a DMA alloc for the CPU itself. This might still work, but =
only if
> > > dma_map_sgtable() can handle swiotlb/iommu for all attaching devices =
at map
> > > time.
> >=20
> > The concern is valid. We're allocating via a synthetic device, which
> > ties the allocation to that device's DMA domain. I looked deeper into
> > this trying to address the concern.
> >=20
> > The approach works because dma_map_sgtable() handles both
> > dma_map_direct and use_dma_iommu cases in __dma_map_sg_attrs(). For
> > each physical address in the sg_table (extracted via sg_phys()), it
> > creates device-specific DMA mappings:
> > - For direct mapping: it checks if the address is directly accessible
> > (dma_capable()), and if not, it falls back to swiotlb.
> > - For IOMMU: it creates mappings that allow the device to access
> > physical addresses.
> >=20
> > This means every attached device gets its own device-specific DMA
> > mapping, properly handling cases where the physical addresses are
> > inaccessible or have DMA constraints.
> >=20
>=20
> While this means it might still "work" it won't always be ideal. Take
> the case where the consuming device(s) have a 32bit address restriction,
> if the allocation was done using the real devices then the backing buffer
> itself would be allocated in <32bit mem. Whereas here the allocation
> could end up in >32bit mem, as the CPU/synthetic device supports that.
> Then each mapping device would instead get a bounce buffer.
>=20
> (this example might not be great as we usually know the address of
> carveout/reserved memory regions, but substitute in whatever restriction
> makes more sense)
>=20
> These non-reusable carveouts tend to be made for some specific device, and
> they are made specifically because that device has some memory restrictio=
n.
> So we might run into the situation above more than one would expect.
>=20
> Not a blocker here, but just something worth thinking on.

As I detailed in the previous version [1] the main idea behind that work
is to allow to get rid of dma_alloc_attrs for framework and drivers to
allocate from the heaps instead.

Robin was saying he wasn't comfortable with exposing this heap to
userspace, and we're saying here that maybe this might not always work
anyway (or at least that we couldn't test it fully).

Maybe the best thing is to defer this series until we are at a point
where we can start enabling the "heap allocations" in frameworks then?
Hopefully we will have hardware to test it with by then, and we might
not even need to expose it to userspace at all but only to the kernel.

What do you think?
Maxime

--jscl64m2oiw74tyk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCabfy0wAKCRAnX84Zoj2+
dgeiAXoDtrr53jaDnso+MPGG32MwwvCyvuZkKpfa3kBAN2BnNbY6OIpgaEgG4FYc
Utw0NWMBf0PSYnXgs3OvaozQSkQ36eIEwTWcE0i0EbBh1GsiEccBubIWIh/7iLit
uDjYaOlmGw==
=hHFI
-----END PGP SIGNATURE-----

--jscl64m2oiw74tyk--


