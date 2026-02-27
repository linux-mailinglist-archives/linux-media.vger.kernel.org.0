Return-Path: <linux-media+bounces-53678-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qF3EF+hhoWnIsQQAu9opvQ
	(envelope-from <linux-media+bounces-53678-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 10:20:40 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B44271B533D
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 10:20:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 329DC3107687
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 09:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 658383D9047;
	Fri, 27 Feb 2026 09:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R9CTuJ9i";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="M1faumW/"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F4E3C1977
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 09:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772183706; cv=none; b=dWLg/4tPGEXdnDgGkpiwK+PqqYw7b8tWTawg898waTS/9X//wsEeNG5Vf0nE/ouwnQic/s+N+qIlsB4RYgl80KfvqVw9AweEPR8uOIngo7RCZSfFRF6sGS6eUOJhTUSCWu8X0m2afLFsbfVyzV7aIBD5z/nXIs8P7mKezAFzaSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772183706; c=relaxed/simple;
	bh=SN/V8YGuTcxY85kDU89KkD1e6w8cvJs3/3Dd7L0T5yk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YKJqmPLZfQfzVfWBIwFBZ2bv42ZT4MCULVFAZqg//Q+oRNWTHqeHrC4XWbmoAsSMthI8OmGNLyw9imFLMx6jFkWdJ8wPRYM9Fma07WDFnQ2ud3lke6gkieCF5yteMGRTON077CKRIJAndYu7fl3gA9Rh+CuMac8NEbvpva33DW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R9CTuJ9i; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=M1faumW/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772183702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SN/V8YGuTcxY85kDU89KkD1e6w8cvJs3/3Dd7L0T5yk=;
	b=R9CTuJ9i7ITbFT/y855/nbacwtvwU6vOVh3VBc3zUvgPd1s+rJgGzoMZgzVctn2eSJVOpN
	zUMKiTRH1UxNCbWlGGN9h1S46bNzAlmkjdnT9QkHfVREsu4vxCX/9Jhn4/ri4pUG+Nnp4N
	nGVJdsOXmQhr5nN8O9AJ2jggs2e08Xc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-e1Jd55IhOyqGBXCrEpohLw-1; Fri, 27 Feb 2026 04:15:00 -0500
X-MC-Unique: e1Jd55IhOyqGBXCrEpohLw-1
X-Mimecast-MFC-AGG-ID: e1Jd55IhOyqGBXCrEpohLw_1772183699
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4398fed3552so1606606f8f.3
        for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 01:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772183699; x=1772788499; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SN/V8YGuTcxY85kDU89KkD1e6w8cvJs3/3Dd7L0T5yk=;
        b=M1faumW/EOfMGcaLKdJLrLzK2bm6omrAorkOlDuDBG9YCbHEjObzBlO9xf65raNlR2
         tT8sGtbtn8aeRIVVF8SlCOh1vEX00Jyscnn45ptVkEN7TQfu3mTwsrvLqSYMnMEU96xL
         RaYQKaJQAzlznhQBOSgG8/DTbv3yp6MTTEiHN3+i2xEhH2G2TAQfRhHvnX9V2GNMFbTf
         /ozFkV1Cv062TWjBYSGEFyDrJ9NMH1j0jpO5Vim1CiiqTIgiRIMeuslobJ02y5rq34Be
         6+j0dD2ko+Mf+jQUcR2lMWxQcUlTZ0ivnWzlidkhjO6+PkBZGVFtURntS1PS5P8r6Fr9
         VD7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772183699; x=1772788499;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SN/V8YGuTcxY85kDU89KkD1e6w8cvJs3/3Dd7L0T5yk=;
        b=mqobtFa1lKv3JyJQGTjAD4MwRJ2yUxpYodAs4uaC8Egi7GwYMEzeCB5g7cJ0Ii0Ds3
         pocXoLGXKuQWOqhZ8TpUoZ4//pF1msz0Gq0tgnlMO3TVmh6o5YHj9cCOvraS8wmeSpWs
         r/0IKPDR0Ldn8S9H8TYK652FM77y76Wb0kvmlCcaycncKcAkLzW+x0ipDInXX+ujtPac
         ZVUkAo6mjg7GCkq8yPGWxphzDL0ncFXFXnIbG0cru2cFxe8f4t9Ey8SYqNxVrSH/2buM
         1Yu06BCNxSiQvB+6w97nGs+9gPTpGUsASA/wY4n3L2t5MYs8wVs6ujqVX/WXV63+pANX
         DfuA==
X-Forwarded-Encrypted: i=1; AJvYcCXlMAWZabEFvN+0TjMYNS/ktr/guvjQPrSWKvgMgqptIu1l0iXyXpkd/aDk2mRIgmHHNFoQqEYsUozWEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuvoD5+KUNhIDCBnE5O7C0oYVbzUxAkIXKXMhxLyX4AS+roptS
	eSjX6xqTy67zukQf1fZf0bYFAWpyGz7urlWzWZGYFkw4V+UX8TiEQqVh/B8GEUSzDxSXtyZLK9r
	81dgesEEQcxl83r9/my6u8Fl0zeVQy8Rwq2B4eOfTmYfGTnmt8U88pn/XDVrN69ix
X-Gm-Gg: ATEYQzzGVun7ZiWw29Wv2mjGyietOsMNGm/PVbek8NMFgNrXj81RWXKq4VtBugQFQJz
	6KYKTO2nGBIf7a+0PPbBrRRShUuw9ysAspFQDxSGx0bzlv0VVObJEy8AjUUvelTQS5MCLDQk+qE
	fTgDYhBhZ83CM4nT8q+BEBtxn/DXn9OJXW05oWBvbCzW8uYHe1YsZjoqvKfxICsQqqDZbEzbFNv
	Rqv7lI8E4xOZXY1miou/6mGthEttcCx8IHuNvUaCp8YV+FFQ+5+a4uvTpwSCxLMvlfRBeaoXbp4
	chRb8jXwOhnxpy4CEyS71p18MPgnBarprPgIVDxTunaKvh8fycVTdKoFyp5fxl/eNpKn4qLjxA=
	=
X-Received: by 2002:a05:6000:26cb:b0:432:c0e8:4a33 with SMTP id ffacd0b85a97d-4399de14d4cmr3501737f8f.22.1772183698303;
        Fri, 27 Feb 2026 01:14:58 -0800 (PST)
X-Received: by 2002:a05:6000:26cb:b0:432:c0e8:4a33 with SMTP id ffacd0b85a97d-4399de14d4cmr3501597f8f.22.1772183697160;
        Fri, 27 Feb 2026 01:14:57 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c76b20bsm5748279f8f.35.2026.02.27.01.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 01:14:56 -0800 (PST)
Date: Fri, 27 Feb 2026 10:14:56 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Albert Esteve <aesteve@redhat.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
	"T.J. Mercier" <tjmercier@google.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev, 
	echanude@redhat.com
Subject: Re: [PATCH] dma-buf: heaps: Add Coherent heap to dmabuf heaps
Message-ID: <20260227-gleaming-saffron-binturong-580b3f@houat>
References: <20260224-b4-dmabuf-heap-coherent-rmem-v1-1-dffef43298ac@redhat.com>
 <d05a81ff-c6af-4621-9593-d06f80220e34@arm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="hjogu5z26zgaiwsw"
Content-Disposition: inline
In-Reply-To: <d05a81ff-c6af-4621-9593-d06f80220e34@arm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53678-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B44271B533D
X-Rspamd-Action: no action


--hjogu5z26zgaiwsw
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] dma-buf: heaps: Add Coherent heap to dmabuf heaps
MIME-Version: 1.0

Hi Robin,

On Thu, Feb 26, 2026 at 03:22:05PM +0000, Robin Murphy wrote:
> On 24/02/2026 7:57 am, Albert Esteve wrote:
> > Add a dma-buf heap for DT coherent reserved-memory
> > (i.e., 'shared-dma-pool' without 'reusable' property),
> > exposing one heap per region for userspace buffers.
>=20
> Despite the "shared" naming of the compatible, these kinds of reservations
> are often for highly device-specific purposes, and sometimes may not even=
 be
> accessible to other devices at all, so it's far from clear that there's a
> generic use-case for connecting them to dma-buf. Certainly it doesn't seem
> like a good idea to unconditionally create heaps for *everyting*, and give
> userspace free reign to mess with things it doesn't necessarily understand
> (especially where usage-specific restrictions implied by "no-map" are
> involved) and which may break drivers.

So, let's take a step back. We want to enable cgroup memory accounting
for any buffer allocation done through an ioctl, so DRM dumb buffers,
BOs, v4l2 buffers, dma-buf heap allocations, etc.

system memory would be tracked by the memcg cgroup memory, dedicated
memory pool through dmem, and CMA is kind of up in the air at the
moment, but probably both.

That means that when calling dma_alloc_attrs (or one of its variants),
you would not know which cgroup controller it's going to account into,
and thus enforcing limits becomes difficult.

So the plan discussed last year with the DRM (and then v4l2) maintainers
was to get away from using dma_alloc_attrs entirely and rely on the
heaps instead. Heap drivers would always allocate from the same cgroup
controller, so it's easier that way.

So, in order to get there, we need to create a heap instance for every
possible dma_alloc_attrs backend.

We have that for CMA and GFP already, but we're missing coherent (and
maybe more?).

> Most drivers that accomodate a memory-region expect to manage it themselv=
es,
> so I would think it should be up to the drivers to opt into delegating
> "their" pool to userspace by registering it as a heap. Or at very worst, =
at
> least some additional DT compatible or property to indicate that it really
> is safe and desirable to use a given pool in a truly shared manner.

I'm not sure a DT property is going to work there, because then we're
going to have drivers bypassing cgroup accounting forever. That being
said, I think we can work with the opt-in option you were mentioning.
That way, we could do it at the DRM/v4l2 framework level and roll it out
for all those drivers, without affecting the other framework and drivers
that could use it.

> Otherwise, If we just present some heaps named "memory@xyz" to userspace
> (arch/arm64/boot/dts/ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi is a
> fun example), do we really expect it to maintain exhaustive
> platform-specific knowledge of which actual device(s) they belong to and
> what they're for?

That ship has kind of sailed already. I'm not pleased about it either,
but it was the outcome of the discussion last time.

> And if it does try to just mess around and allocate and map stuff, how
> does the dma-buf layer also have all of that usage-specific detail to
> know what memory attributes are safe to map with etc.?

Sorry, I'm not quite sure what you mean by that. Did you mean how we
have to care about caching for example, or something else?

Maxime

--hjogu5z26zgaiwsw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaaFgiwAKCRAnX84Zoj2+
dqyJAYC1uBydtbMfbpOFtGCNJsHB17IA4OH5sJIk3fS2LDU/EQuKyKw7R/VeibN4
q57PX2IBf2dgDshYL8OBvoLDgsJkfFUj0iSSKlBoDlKgHznvB/qC6QhahQoiJcKe
NX2SEVA1rQ==
=liUf
-----END PGP SIGNATURE-----

--hjogu5z26zgaiwsw--


