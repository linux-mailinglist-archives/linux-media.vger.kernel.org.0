Return-Path: <linux-media+bounces-6354-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4934787032B
	for <lists+linux-media@lfdr.de>; Mon,  4 Mar 2024 14:47:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1C8728056E
	for <lists+linux-media@lfdr.de>; Mon,  4 Mar 2024 13:47:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B6013F9D3;
	Mon,  4 Mar 2024 13:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IxuGQTbK"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B4E3D963
	for <linux-media@vger.kernel.org>; Mon,  4 Mar 2024 13:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709560006; cv=none; b=Z83va/8R6Uqy8N8aoIEop0X+ZxoFpyPOwJWbvrRdXNicz9X9BoMuQGc+ERDrFRclG9edUJwm5l+DH9w5q7q95LSpCgxiRUiDTvJJfCFFOKirhTn/Tl7cVs1Pk6XYuJRjXn9X4k0pRCcgRTIN7v97sm1sMti+lblHmuzGZjrq5LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709560006; c=relaxed/simple;
	bh=Q88Rz4/+NBzkR3XYuch9lXGw33XhoO+Cyt7eysT+me0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kIA8vfSKOTuFMdJrqB0KAOnu1ic5cpXkiQ+Z9CLwNMWwJwmot6VKPZmbYnLQwWVF4Vu0WVNYH6ONI8VDKQrE0SveAwSTYyJKeGZQnPbnhuFwO0Fyd5M+ilfdm70RassjC/UIqzLOjwDJARqcbIStbdg9erlWnFo4utd2P7MqUog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IxuGQTbK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709560003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QCGGysk9V3zX3MKANzB850USkbZ/kN28T92ufXmffaE=;
	b=IxuGQTbKevaaNSuqvjsQ1xMQ/5+uxQRVANtxRSOIvC+oa/RT9YUz8axsDXuB9bvksBxpsD
	6vhRbHUW6r3ORIH7jSx1WXtu1cs3C2YP2/akzIZ+lTKu2AuoVq4YYFlaM4HjbUjskRPncM
	haIbYkRJMvxjwgLxu7udvxixLEFdc3s=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-210-oQiZr341M0WT_DRGkGDzvQ-1; Mon, 04 Mar 2024 08:46:41 -0500
X-MC-Unique: oQiZr341M0WT_DRGkGDzvQ-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-33e41caf403so371324f8f.1
        for <linux-media@vger.kernel.org>; Mon, 04 Mar 2024 05:46:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709560000; x=1710164800;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QCGGysk9V3zX3MKANzB850USkbZ/kN28T92ufXmffaE=;
        b=bQiPC7jo63ZyqxM/esHBn2L+Hd6RgWanBd+Zge0dttOyfSJgE8eRGIqPH5tj13YzO1
         GF3Dm/roCFNVIN8GpzrjJDX98vdBCJWc7r72AO03tMgsu/CK0u9PaEcb3UlxnD6BevgI
         KjQxqQVDrAVZDIKU96hvmrgH+A5M7fScKDyUnTlW17Zzq3Bu6DQ5TbzJOxvJe4BP3fvq
         rVjSUCKP6X4y1Ia98y6WCwyKTsBtQP3mY17/9J6xVzbm3hl+BDvE1bBtfBnrkIJUlRo7
         fP7WvzMcdQhg2DqlbydMC3CRn+mr7a8fmUBO9zZCnUeCbKyuQuk+v7mXUXViXYdCvnkA
         BlPA==
X-Forwarded-Encrypted: i=1; AJvYcCXvZE3ypG3DrrXrwtlDIwJ9a36dm8dcygN1VubLAnA51C9RqLVYf3lJv9gcRGbumuFkd2be1lY15ReSj94qKaD8pneOKi/Tn7eQjds=
X-Gm-Message-State: AOJu0Ywwa4mdLW7FVNROV2SWcIK602swpn7aQCPQqMhXHi2dEpTfYbZ/
	u0GoGNGfrKhmSIxxVSvgJXd0ZdzAW8Lz01mb+xWYyNbqf4ueINf/mpWQp1ZXJd+1HJYwp0HviPR
	ZKEUAp7J/Ia7qN93FH7sDz5+96xJmlhe9os8O3NK5kyjspVyDbIeRr8Czyioy
X-Received: by 2002:adf:ef48:0:b0:33e:1b4a:5e3e with SMTP id c8-20020adfef48000000b0033e1b4a5e3emr6840246wrp.25.1709560000650;
        Mon, 04 Mar 2024 05:46:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHd8XS9FYOfilvgLRtjeG1KygbV+QSjJjbAkmlBiywXWnSvA/2J5xgH29abw7vw/KmdAUTC9A==
X-Received: by 2002:adf:ef48:0:b0:33e:1b4a:5e3e with SMTP id c8-20020adfef48000000b0033e1b4a5e3emr6840230wrp.25.1709560000263;
        Mon, 04 Mar 2024 05:46:40 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
        by smtp.gmail.com with ESMTPSA id i10-20020adff30a000000b0033b6e26f0f9sm12278531wro.42.2024.03.04.05.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 05:46:40 -0800 (PST)
Date: Mon, 4 Mar 2024 14:46:39 +0100
From: Maxime Ripard <mripard@redhat.com>
To: John Stultz <jstultz@google.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	"T.J. Mercier" <tjmercier@google.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: ECC memory semantics for heaps
Message-ID: <20240304-bizarre-quizzical-dugong-caec1a@houat>
References: <20240228-nifty-flashy-shrew-905edc@houat>
 <CANDhNCquJn6bH3KxKf65BWiTYLVqSd9892-xtFDHHqqyrroCMQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xlyfw7uby4cdowbn"
Content-Disposition: inline
In-Reply-To: <CANDhNCquJn6bH3KxKf65BWiTYLVqSd9892-xtFDHHqqyrroCMQ@mail.gmail.com>


--xlyfw7uby4cdowbn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi John,

Thanks for your answer

On Wed, Feb 28, 2024 at 08:17:55PM -0800, John Stultz wrote:
> On Wed, Feb 28, 2024 at 7:24=E2=80=AFAM Maxime Ripard <mripard@redhat.com=
> wrote:
> >
> > I'm currently working on a platform that seems to have togglable RAM ECC
> > support. Enabling ECC reduces the memory capacity and memory bandwidth,
> > so while it's a good idea to protect most of the system, it's not worth
> > it for things like framebuffers that won't really be affected by a
> > bitflip.
> >
> > It's currently setup by enabling ECC on the entire memory, and then
> > having a region of memory where ECC is disabled and where we're supposed
> > to allocate from for allocations that don't need it.
> >
> > My first thought to support this was to create a reserved memory region
> > for the !ECC memory, and to create a heap to allocate buffers from that
> > region. That would leave the system protected by ECC, while enabling
> > userspace to be nicer to the system by allocating buffers from the !ECC
> > region if it doesn't need it.
> >
> > However, this creates basically a new combination compared to the one we
> > already have (ie, physically contiguous vs virtually contiguous), and we
> > probably would want to throw in cacheable vs non-cacheable too.
> >
> > If we had to provide new heaps for each variation, we would have 8 heaps
> > (and 6 new ones), which could be fine I guess but would still increase
> > quite a lot the number of heaps we have so far.
> >
> > Is it something that would be a problem? If it is, do you see another
> > way to support those kind of allocations (like providing hints through
> > the ioctl maybe?)?
>=20
> So, the dma-buf heaps interface uses chardevs so that we can have a
> lot of flexibility in the types of heaps (and don't have the risk of
> bitmask exhaustion like ION had). So I don't see adding many
> differently named heaps as particularly problematic.

Ok

> That said, if there are truly generic properties (cacheable vs
> non-cachable is maybe one of those) which apply to most heaps, I'm
> open to making use of the flags. But I want to avoid having per-heap
> flags, it really needs to be a generic attribute.
>=20
> And I personally don't mind the idea of having things added as heaps
> initially, and potentially upgrading them to flags if needed (allowing
> heap drivers to optionally enumerate the old chardevs behind a config
> option for backwards compatibility).
>=20
> How common is the hardware that is going to provide this configurable
> ECC option

In terms of number of SoCs with the feature, it's probably a handful. In
terms of number of units shipped, we're in the fairly common range :)

> and will you really want the option on all of the heap types?

Aside from the cacheable/uncacheable discussion, yes. We could probably
get away with only physically contiguous allocations at the moment
though, I'll double check.

> Will there be any hardware constraint limitations caused by the
> ECC/!ECC flags? (ie: Devices that can't use !ECC allocated buffers?)

My understanding is that there's no device restriction. It will be a
carved out memory so we will need to maintain a separate pool and it
will be limited in size, but that's pretty much the only one afaik.

> If not, I wonder if it would make sense to have something more along
> the lines using a fcntl()  like how F_SEAL_* is used with memfds?
> With some of the discussion around "restricted"/"secure" heaps that
> can change state, I've liked this idea of just allocating dmabufs from
> normal heaps and then using fcntl or something similar to modify
> properties of the buffer that are separate from the type of memory
> that is needed to be allocated to satisfy device constraints.

Sorry, I'm not super familiar with F_SEAL so I don't really follow what
you have in mind here. Do you have any additional resources I could read
to understand better what you're thinking about?

Also, if we were to modify the ECC attributes after the dma-buf has been
allocated by dma-buf, and if the !ECC memory is carved out only, then
wouldn't that mean we would need to reallocate the backing buffer for
that dma-buf?

Thanks!
Maxime

--xlyfw7uby4cdowbn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZeXQvwAKCRDj7w1vZxhR
xdCNAP0aoKv5z5ER46fpzkiFLUlLe0grbDaCh1XU5h/Dj5hCxgD8C1HqiN6hYcJc
keOGmEKCro5a+yCswAkbkbuipbTtOgI=
=y/Py
-----END PGP SIGNATURE-----

--xlyfw7uby4cdowbn--


