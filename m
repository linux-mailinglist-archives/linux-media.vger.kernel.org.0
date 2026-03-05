Return-Path: <linux-media+bounces-54631-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHIiMYd4qWl77wAAu9opvQ
	(envelope-from <linux-media+bounces-54631-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 13:35:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 315B3211C21
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 13:35:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9182130FCA0B
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 12:30:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D6B73988E1;
	Thu,  5 Mar 2026 12:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X0wPEB93";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="S1K6Uk0i"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB7B382366
	for <linux-media@vger.kernel.org>; Thu,  5 Mar 2026 12:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772713812; cv=none; b=KzimOoK1AEskX6u+xVzM9H6aCZ5d++Qu2R0VnQKwDzldn3OGlRFqDBHrwk1hUR3rqLMP2B7jbl6zBn6BrqGAF5vh5RGXTma+ZKPh6Mf4FemKxdjgr6fLSLckx+Gtjn3is7o1juIP6mG06TlNQWe8i91Z0akN2NUA5pxCRAWKsS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772713812; c=relaxed/simple;
	bh=Lg95G1xu+NEVn/pWaaP1EFWLbKdl8JNBbyWopZXFGhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UKj+6P3U01Yk3XuSxMKtQ2PgqeEv4IDPTxbslcE2vnAdyKpxhq+4N1qNkAqeuEKyUVjO386sDTYbD7xKNN+vjCagNEZbMfyA9kaUm2fAsS8JW0v1rLs1Q7DbHqMq/0yexGjXmPsnf6n6/ZYdEuUcPMXUaw5Zkgu61tp4Els6A2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X0wPEB93; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=S1K6Uk0i; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772713810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n4h7C/mVddSBf5SlRktQxYvLNWZ3n2LVuIMNQt34HFE=;
	b=X0wPEB93IEajUz0A2g6HSP7hGEjVZfKf5SQk+w47OE41tznRCbdnVt+dqNrgHdEKyQC+Rv
	d7POpEKcmrQq6Fn2dhGPPDi2xfAtXXhZNkB7u1qSIlHjwmqZR8bhypsoMhC/PL1Fqb8o5P
	Upl3T6egc0NgIPcbguYIPtLQ8+gxYVo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-118--hRkGqoNOyit_vldAaQfhQ-1; Thu, 05 Mar 2026 07:30:08 -0500
X-MC-Unique: -hRkGqoNOyit_vldAaQfhQ-1
X-Mimecast-MFC-AGG-ID: -hRkGqoNOyit_vldAaQfhQ_1772713808
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-483a2db68caso65578045e9.0
        for <linux-media@vger.kernel.org>; Thu, 05 Mar 2026 04:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772713807; x=1773318607; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n4h7C/mVddSBf5SlRktQxYvLNWZ3n2LVuIMNQt34HFE=;
        b=S1K6Uk0iCJGCqMeyRbQHRJ7FHgs0W4J6sf0MiJP0TQEuIcpeAGCiDSpMq+utgupnXm
         GclkAv84BBT+3qPEpPJ9/wewwAH2MycdayY8Nuf7+CdLiVgge98vCjS5sa/At21MeTMu
         c0+MSx7/9Eu8NEi81jv0ignkNQwSgi6ihmRxAyZUPf1lOs85ndWs0Ce6FruiOyoDf6Jp
         OmkUbX07fuPLFrHU7f5ZrAA1GxLgMxUmFviAJFB0C46oehFl23YvAblimj5w57AVgXC5
         uAfjW+gmwWng5QSAH2r5eo3LBEAwfMc9md8vstZa4meqZtvYDKaFb9SrGV08w0B5Gug9
         XBaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772713807; x=1773318607;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n4h7C/mVddSBf5SlRktQxYvLNWZ3n2LVuIMNQt34HFE=;
        b=jHRZKwb/oFbToeentr9CXg3RHABr+1hsXaP1X/ktrPeR9g/eLpgBBWRw824K7bD+Ff
         GNfOK9MPR4nmu80lJARvfelwipuzt9fMbz+/HGxszgaQRGEjj8K5jzKX1Nv12fs/h2sw
         RGcFA/zCqw2IezAzOMo/ml78f1lcIJ9bsQ6VqhEDxSNu3s5Hm1CXecXqI4B7Sy+WUChx
         GQ+Yle519FcuoRrlwCKg1Z1Ic9XAXzkqLzPEGYRR7nSNqrC4tyY97meQmeXdxufs0MJl
         lbSDdclvFlXMIWT9fP65sRcyHBw62HkhwulRDtkiv+XPiISL2AliTFeyI1JoqDwklaZV
         kqeg==
X-Forwarded-Encrypted: i=1; AJvYcCWuPWh17tsr+G8/yPU6ERYDcXeBFqhdS9+npdG8Gbllbf1CoQO6Ab0Dkpo7eIrHHhV4YDYUFB4ooVOE5g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNuiLK5vI9vRXLh8p5JSaq3Q5vDC8fO/pNcz8O6jGwljHda6Tu
	h26vDK/qfXCDm/gKSUmxaAabCt6D5tqfazmnVkuQpnboT3Oz1fZmPSjVwGCA6EimKH6jTpHUgMn
	yHCjtt9qN5xBl22Ku1n4gN/rlR13CvDFfMyYYzdvq2LcE5OqTvlEE45E4p+IBqSQ5
X-Gm-Gg: ATEYQzwQDAhuX1C7TNt+l7+nznP5DD2CMBuPCyTiYhAiqBZUd8UNJZjQum+/ASiqdr8
	0E6N9t2twBiH6V0ysepdaelP0FW+UfDKFhJe9rcRCnlepG9ACG3sHWlJ7VYuWQ54A+IlP2Zu4wQ
	CJe7g0CayJOfU0a4leEyAVKd4jnwdFjJeDtQrQgGF5/MO6Gal78/Wj46iNvLRM8iesSNnsehxhJ
	TCH0x4+A0I5XF3ZKdgRiEmFGsWEgmYzDTeTp8xwAlcJVG1x45j5DWkh39K5AVIXTp5Dhz67zudp
	kwX8dBedg+jbwiUPDe/mO16DbZk8pgqAvn59OvA1VkZCzbb+1PZZYT5lk+IVwzPPikkwrQGqmA=
	=
X-Received: by 2002:a05:600c:1e0d:b0:483:3380:ca11 with SMTP id 5b1f17b1804b1-485198c81e4mr91451385e9.33.1772713807344;
        Thu, 05 Mar 2026 04:30:07 -0800 (PST)
X-Received: by 2002:a05:600c:1e0d:b0:483:3380:ca11 with SMTP id 5b1f17b1804b1-485198c81e4mr91450615e9.33.1772713806762;
        Thu, 05 Mar 2026 04:30:06 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad1656bsm39645565e9.24.2026.03.05.04.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 04:30:05 -0800 (PST)
Date: Thu, 5 Mar 2026 13:30:05 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Albert Esteve <aesteve@redhat.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev, 
	devicetree@vger.kernel.org, echanude@redhat.com
Subject: Re: [PATCH v2 4/6] dma-buf: heaps: Add Coherent heap to dmabuf heaps
Message-ID: <20260305-antique-flying-gopher-4cbe34@houat>
References: <20260303-b4-dmabuf-heap-coherent-rmem-v2-0-65a4653b3378@redhat.com>
 <20260303-b4-dmabuf-heap-coherent-rmem-v2-4-65a4653b3378@redhat.com>
 <20260303-rigorous-cow-of-saturation-23f87b@houat>
 <CADSE00+jCZSHi=OLbmOebBwnue5tjG7AFPKN76CbYDWYBcP+AA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="hngdcoke4k7khock"
Content-Disposition: inline
In-Reply-To: <CADSE00+jCZSHi=OLbmOebBwnue5tjG7AFPKN76CbYDWYBcP+AA@mail.gmail.com>
X-Rspamd-Queue-Id: 315B3211C21
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54631-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@redhat.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,bootlin.com:url]
X-Rspamd-Action: no action


--hngdcoke4k7khock
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 4/6] dma-buf: heaps: Add Coherent heap to dmabuf heaps
MIME-Version: 1.0

On Tue, Mar 03, 2026 at 03:47:14PM +0100, Albert Esteve wrote:
> On Tue, Mar 3, 2026 at 2:20=E2=80=AFPM Maxime Ripard <mripard@redhat.com>=
 wrote:
> > On Tue, Mar 03, 2026 at 01:33:47PM +0100, Albert Esteve wrote:
> > > Add a dma-buf heap for DT coherent reserved-memory
> > > (i.e., 'shared-dma-pool' without 'reusable' property),
> > > exposing one heap per region for userspace buffers.
> > >
> > > The heap binds the heap device to each memory region so
> > > coherent allocations use the correct dev->dma_mem, and
> > > it defers registration until module_init when normal
> > > allocators are available.
> > >
> > > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > > ---
> > >  drivers/dma-buf/dma-heap.c            |   4 +-
> > >  drivers/dma-buf/heaps/Kconfig         |   9 +
> > >  drivers/dma-buf/heaps/Makefile        |   1 +
> > >  drivers/dma-buf/heaps/coherent_heap.c | 426 ++++++++++++++++++++++++=
++++++++++
> > >  include/linux/dma-heap.h              |  11 +
> > >  include/linux/dma-map-ops.h           |   7 +
> > >  6 files changed, 456 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> > > index 88189d4e48561..ba87e5ac16ae2 100644
> > > --- a/drivers/dma-buf/dma-heap.c
> > > +++ b/drivers/dma-buf/dma-heap.c
> > > @@ -390,8 +390,8 @@ struct dma_heap *dma_heap_add(const struct dma_he=
ap_export_info *exp_info)
> > >
> > >       heap =3D dma_heap_create(exp_info);
> > >       if (IS_ERR(heap)) {
> > > -             pr_err("dma_heap: failed to create heap (%d)\n", PTR_ER=
R(heap));
> > > -             return PTR_ERR(heap);
> > > +             pr_err("dma_heap: failed to create heap (%ld)\n", PTR_E=
RR(heap));
> > > +             return ERR_CAST(heap);
> >
> > This looks unrelated and should possibly be squashed into the previous
> > patch that introduces dma_heap_create()?
> >
> > > +static int coherent_heap_init_dma_mask(struct device *dev)
> > > +{
> > > +     int ret;
> > > +
> > > +     ret =3D dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(64));
> > > +     if (!ret)
> > > +             return 0;
> > > +
> > > +     /* Fallback to 32-bit DMA mask */
> > > +     return dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(32));
> > > +}
> >
> > Why do you need to mess with the DMA mask? I'd expect that device to be
> > able to access everything.
>=20
> When I tested I was getting: "reserved memory is beyond device's set
> DMA address range", so I tested if it was fixed with
> dma_coerce_mask_and_coherent() and/or dma_set_mask_coherent(). I did
> not debug the value of coherent_dma_mask, but given the error I assume
> it was not set properly? Ultimately, using the 64 bit mask fixed it,
> and I added a 32-bit fallback to ensure support for 32-bit systems.

So you don't need to handle the fallback because
dma_coerce_mask_and_coherent will truncate the generated mask to
dma_addr_t, which is 64bits on 64 bits platforms, and 32 bits on 32 bits
platforms.

https://elixir.bootlin.com/linux/v6.19.3/source/kernel/dma/mapping.c#L908

But I think my point was more than there's nothing specific to the
coherent heap itself: the device allocated for the heap should have the
right mask for any heap, so it's something I'd rather put in
dma_heap_add.

> > > +static int __coherent_heap_register(struct reserved_mem *rmem)
> > > +{
> > > +     struct dma_heap_export_info exp_info;
> > > +     struct coherent_heap *coh_heap;
> > > +     struct device *heap_dev;
> > > +     int ret;
> > > +
> > > +     if (!rmem || !rmem->name)
> > > +             return -EINVAL;
> > > +
> > > +     coh_heap =3D kzalloc_obj(*coh_heap);
> > > +     if (!coh_heap)
> > > +             return -ENOMEM;
> > > +
> > > +     coh_heap->rmem =3D rmem;
> > > +     coh_heap->name =3D kstrdup(rmem->name, GFP_KERNEL);
> > > +     if (!coh_heap->name) {
> > > +             ret =3D -ENOMEM;
> > > +             goto free_coherent_heap;
> > > +     }
> > > +
> > > +     exp_info.name =3D coh_heap->name;
> > > +     exp_info.ops =3D &coherent_heap_ops;
> > > +     exp_info.priv =3D coh_heap;
> > > +
> > > +     coh_heap->heap =3D dma_heap_create(&exp_info);
> > > +     if (IS_ERR(coh_heap->heap)) {
> > > +             ret =3D PTR_ERR(coh_heap->heap);
> > > +             goto free_name;
> > > +     }
> > > +
> > > +     heap_dev =3D dma_heap_get_dev(coh_heap->heap);
> > > +     ret =3D coherent_heap_init_dma_mask(heap_dev);
> > > +     if (ret) {
> > > +             pr_err("coherent_heap: failed to set DMA mask (%d)\n", =
ret);
> > > +             goto destroy_heap;
> > > +     }
> > > +
> > > +     ret =3D of_reserved_mem_device_init_with_mem(heap_dev, rmem);
> > > +     if (ret) {
> > > +             pr_err("coherent_heap: failed to initialize memory (%d)=
\n", ret);
> > > +             goto destroy_heap;
> > > +     }
> > > +
> > > +     ret =3D dma_heap_register(coh_heap->heap);
> > > +     if (ret) {
> > > +             pr_err("coherent_heap: failed to register heap (%d)\n",=
 ret);
> > > +             goto destroy_heap;
> > > +     }
> >
> > I guess it's more of a comment about your previous patch, but it's not
> > clear to me why you needed to split dma_heap_add into dma_heap_create /
> > _register. Can you expand a bit?
>=20
> So first I tried to just use dma_heap_add() and then use the heap_dev
> afterward to call of_reserved_mem_device_init_with_mem(), but if that
> call failed, the error path required some kind dma_heap_remove()
> function as the heap was already registered by then.
>=20
> In the CMA heap for example, dma_heap_add() is invoked at the end of
> the `init` function. Therefore, you do not have this issue, if it
> failed it means the heap was not added and you just need to clean
> everything else.
>=20
> However, performing a remove() does not sound like something that can
> be done safely. I've spent some time thinking on alternatives, but
> splitting felt the best pattern.
>=20
> This way I can:
> 1. Create the device
> 2. Call of_reserved_mem_device_init_with_mem
> 3. Register the heap
>=20
> This places registration at the end, making every error path and
> cleanup easy to handle.
>=20
> Also, the `dma_heap_add()` code already seemed to handle these two
> parts/phases implicitly with device_create(), so splitting felt
> architecturally sound.

That makes sense, thanks!

Maxime

--hngdcoke4k7khock
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaal3SAAKCRAnX84Zoj2+
dn3QAX9E8YO33rmROOTGm7jbkHqsOZ8TA0MZtGRMovqQZMantYBJIMKP5dURZuMJ
oYoU8x4BgLjR9qQ/3rZv2lePDmMzvq1bRUaeUiPuJqKtDmMVvUOIXTdhGEcO1s7+
wnCWMipN7A==
=F33u
-----END PGP SIGNATURE-----

--hngdcoke4k7khock--


