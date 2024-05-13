Return-Path: <linux-media+bounces-11390-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A10A8C3D2F
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2024 10:30:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DBEC1C21405
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2024 08:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2FDE147C60;
	Mon, 13 May 2024 08:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WCO3H2U9"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3C2147C67
	for <linux-media@vger.kernel.org>; Mon, 13 May 2024 08:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715588991; cv=none; b=ZpsB+NKqpF8sL5q36gQbq87ngkGD8sGsUDPv5EiimOTcyMLc+jEz4L0pX8gcxyv6PU0YmIuUiVSfT4KwU4R55t9PevVhFOWzSl4QX/shzqboYL0+Ox1OKT30wXZ5bBpqyGN2bKyl0vq/n325oB7bB1n0S3+n1LychMm2uboho/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715588991; c=relaxed/simple;
	bh=ACGTg+jqwLvGd3uIYLEqlsb3DEYNKvz+FsT7qMFK+3A=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IvroAztePFPZqfFgCvZVkM907zHioMhpRt48LnWgtp/cnhrt7hqsnT5DUFRKrj1qGyVaiYvnJCqpuxI8+CRp3HoWgqTagM4T0uAGRd+JR3mPx4vIhJNLhuO+8sSPzZ4xvCF3xXx7U8hZfD4NtthbMeVw7npF0ejPLASRVfP34EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WCO3H2U9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715588988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ACGTg+jqwLvGd3uIYLEqlsb3DEYNKvz+FsT7qMFK+3A=;
	b=WCO3H2U9J8xIW0YHnO51WmuWJgF1pchXin9TwJRnGJdF6kay6IFr0iCfGD59NLjsxwSrVT
	c9LFJWMJJu1CLQrqSVaoWcU0QmaW6cT39GYVZ8BH7EQFBAp2zPaPA4OgpWzdIN3ebWktUI
	h0g1Tk1y4YLS7SxBR5LVump2dot7KLQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-249-XCWcZOK0Ngyi1mU4b60C_w-1; Mon, 13 May 2024 04:29:35 -0400
X-MC-Unique: XCWcZOK0Ngyi1mU4b60C_w-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-34e08bdc701so2863883f8f.3
        for <linux-media@vger.kernel.org>; Mon, 13 May 2024 01:29:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715588974; x=1716193774;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ACGTg+jqwLvGd3uIYLEqlsb3DEYNKvz+FsT7qMFK+3A=;
        b=xNFpRDDGnI2DjLhd0c+0R2RUyPsmY3v+SkA2trDipwwEjS1q2L0O4q7IjNko+7jt9y
         avaqnlviP863reoPhfH8b92MzYw1zQs2YFqnXLONumLDYhUwqxBjRxUIyzp9NsVS+Q2a
         qZua3ZcS7sf4fI0FZcm6PqJtOZ5qBL7Ndl2MjTKGRS9EFxW4bEpGAjvpJ0Jj+HA+OQ24
         NW7lUMCju2nJT3xP8d9HqTlx59AxLXx5tMXYZVPtglquU/8ZuoRlPe03NrvGVzK+OJ/c
         LJoJsq2jQqMlFU5fIloNsr9oSrX08uTttkP3UxAZX84N2OMa/ATku6p8tWb8PR7wkput
         /fGg==
X-Forwarded-Encrypted: i=1; AJvYcCXrmTA14iPIT/grb82BmEo/iGNkGYAb7jXfcafFnRtrgaYeCpta6T99CUuwHIAR6YEEFN99GPPH80brLAjh0Ijvlne+4xfsNT9Tds8=
X-Gm-Message-State: AOJu0YzHWNKfnqCVULbk1SPnzlHq/DhSNon4EFBgguE97Q6CJ1+o+1UR
	1uCgt5kaIibX6IoUHWju3qE3LY/5n4GHxKT537oXMZ8vp5gqsGQ/q1+ejh5SgJYlnqGL6DxKUiQ
	qq/z85N1Q7y/eBxtkFaqZDeFYM3JepbaL9LwA4LNZOU58H8Bp+9A/9ZT4qPkQ
X-Received: by 2002:a5d:444b:0:b0:34e:4cc2:7015 with SMTP id ffacd0b85a97d-3504a73bc06mr5553393f8f.31.1715588974249;
        Mon, 13 May 2024 01:29:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvlr1r3nrAIBq+G7ChUWvWgw+OvWO5SlmWK/Uy2RAOomeNeCf7DAAnSfqycFznvhJ7OQM6xQ==
X-Received: by 2002:a5d:444b:0:b0:34e:4cc2:7015 with SMTP id ffacd0b85a97d-3504a73bc06mr5553375f8f.31.1715588973707;
        Mon, 13 May 2024 01:29:33 -0700 (PDT)
Received: from localhost ([193.32.126.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502b8a789asm10513081f8f.51.2024.05.13.01.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 01:29:33 -0700 (PDT)
Date: Mon, 13 May 2024 10:29:22 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Hans de Goede <hdegoede@redhat.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
	"T.J. Mercier" <tjmercier@google.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Lennart Poettering <mzxreary@0pointer.de>, Robert Mader <robert.mader@collabora.com>, 
	Sebastien Bacher <sebastien.bacher@canonical.com>, Linux Media Mailing List <linux-media@vger.kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Milan Zamazal <mzamazal@redhat.com>, 
	Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
Subject: Re: Safety of opening up /dev/dma_heap/* to physically present users
 (udev uaccess tag) ?
Message-ID: <20240513-heretic-didactic-newt-1d6daf@penduick>
References: <bb372250-e8b8-4458-bc99-dd8365b06991@redhat.com>
 <ojduxo54lpcbfg2wfuhqhy7k3phncamtklh65z7gvttcwztmhk@zkifewcy4ovi>
 <3c0c7e7e-1530-411b-b7a4-9f13e0ff1f9e@redhat.com>
 <e7ilwp3vc32xze3iu2ejgqlgz44codsktnvyiufjhuf2zxcnnf@tnwzgzoxvbg2>
 <d2a512b2-e6b1-4675-b406-478074bbbe95@linaro.org>
 <Zjpmu_Xj6BPdkDPa@phenom.ffwll.local>
 <20240507183613.GB20390@pendragon.ideasonboard.com>
 <4f59a9d78662831123cc7e560218fa422e1c5eca.camel@collabora.com>
 <Zjs5eM-rRoh6WYYu@phenom.ffwll.local>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="uitctc2p333ggqzy"
Content-Disposition: inline
In-Reply-To: <Zjs5eM-rRoh6WYYu@phenom.ffwll.local>


--uitctc2p333ggqzy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 08, 2024 at 10:36:08AM +0200, Daniel Vetter wrote:
> On Tue, May 07, 2024 at 04:07:39PM -0400, Nicolas Dufresne wrote:
> > Hi,
> >=20
> > Le mardi 07 mai 2024 =E0 21:36 +0300, Laurent Pinchart a =E9crit=A0:
> > > Shorter term, we have a problem to solve, and the best option we have
> > > found so far is to rely on dma-buf heaps as a backend for the frame
> > > buffer allocatro helper in libcamera for the use case described above.
> > > This won't work in 100% of the cases, clearly. It's a stop-gap measure
> > > until we can do better.
> >=20
> > Considering the security concerned raised on this thread with dmabuf he=
ap
> > allocation not be restricted by quotas, you'd get what you want quickly=
 with
> > memfd + udmabuf instead (which is accounted already).
> >=20
> > It was raised that distro don't enable udmabuf, but as stated there by =
Hans, in
> > any cases distro needs to take action to make the softISP works. This
> > alternative is easy and does not interfere in anyway with your future p=
lan or
> > the libcamera API. You could even have both dmabuf heap (for Raspbian) =
and the
> > safer memfd+udmabuf for the distro with security concerns.
> >=20
> > And for the long term plan, we can certainly get closer by fixing that =
issue
> > with accounting. This issue also applied to v4l2 io-ops, so it would be=
 nice to
> > find common set of helpers to fix these exporters.
>=20
> Yeah if this is just for softisp, then memfd + udmabuf is also what I was
> about to suggest. Not just as a stopgap, but as the real official thing.
>=20
> udmabuf does kinda allow you to pin memory, but we can easily fix that by
> adding the right accounting and then either let mlock rlimits or cgroups
> kernel memory limits enforce good behavior.

I think the main drawback with memfd is that it'll be broken for devices
without an IOMMU, and while you said that it's uncommon for GPUs, it's
definitely not for codecs and display engines.

Maxime

--uitctc2p333ggqzy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZkHPWQAKCRAnX84Zoj2+
duxcAX0X7gUdYVGGk8sIw/t/75URUn2L5jsx1bztYmSAMrIPZpJ7dy/qcltWYmgI
q0DvusYBf1GwSIDpuk/d4mHAtHlq5OHKP4OPgGrWsyOdD3IsotlmEl1GTuBDF6Eq
cHFRahQOCA==
=o8us
-----END PGP SIGNATURE-----

--uitctc2p333ggqzy--


