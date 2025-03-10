Return-Path: <linux-media+bounces-27974-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C202CA59E98
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 18:32:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53593188FB67
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 17:32:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F3D2233D7B;
	Mon, 10 Mar 2025 17:32:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816B0233730
	for <linux-media@vger.kernel.org>; Mon, 10 Mar 2025 17:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741627929; cv=none; b=Uu15RdUREaMJ0fuzFeMaz1buEkzktDGc32DkPZqULl+71g7zxgvshEViBAXZ8tudiawm8eFtbh8yT/03yT6mkmu0ZahvXGiTfkA06UyW4qPtLnn8jszaQ/S5BhGBB1BU0doa7UqG2a9JFb/aJzdWPCODMxUrGAk4TNtfzXz3WrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741627929; c=relaxed/simple;
	bh=Q+j220t8oc8qhbyg0K2XtScnX1zoKgEuXNWaGd0e2Ww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dJaa4nN7STbhiRPaiIBljhlG6XGMWFhHRxuGEw7OTLfv5cRXmbmFktdfa5jP57trWxL0D6WESoe+uimRMr/mluDjb2m6U+Ilkg8eOtcAqe4B+7Wj2nS/8C04+zkmq09jHxgT79CY/qZpxT/NV/WHTGxl4TO/pW0CX0D/2laycQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 7838E1F00059
	for <linux-media@vger.kernel.org>; Mon, 10 Mar 2025 17:23:47 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 7E380AA9252; Mon, 10 Mar 2025 17:23:44 +0000 (UTC)
X-Spam-Level: 
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 61B55AA9238;
	Mon, 10 Mar 2025 17:23:41 +0000 (UTC)
Date: Mon, 10 Mar 2025 18:23:38 +0100
From: Paul Kocialkowski <paulk@sys-base.io>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	"stanimir.k.varbanov@gmail.com" <stanimir.k.varbanov@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Tomasz Figa <tfiga@chromium.org>,
	"Hu, Jerry W" <jerry.w.hu@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Steve Cho <stevecho@chromium.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Kevin Hilman <khilman@baylibre.com>
Subject: Re: [ANN v2] Media Summit 2025: Nice in May or Amsterdam in August?
Message-ID: <Z88gGktbzEsmuehK@collins>
References: <ab1fef54-d83f-46e2-a6c8-42b0761368fc@xs4all.nl>
 <d29353c7-7ae2-411b-9c13-3fbd7bd63da2@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zZz7CSSQ5VAw0CeB"
Content-Disposition: inline
In-Reply-To: <d29353c7-7ae2-411b-9c13-3fbd7bd63da2@xs4all.nl>


--zZz7CSSQ5VAw0CeB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Le Thu 27 Feb 25, 11:05, Hans Verkuil a =C3=A9crit :
> Just a friendly reminder to reply if you want to attend the Media Summit,=
 and
> if so, which place works for you.
>=20
> Currently the preference seems to be Nice.

I will also attend Embedded Recipes in Nice and really unsure about ELCE in
Amsterdam. Like Nicolas pointed out, it's an expensive trip with less and l=
ess
technical value. I feel like it's mostly interesting to get business
visibility and see people from the community.

I'd be interested to talk about stateless video encoding uAPI topics there.

Cheers,

Paul

> On 20/02/2025 11:24, Hans Verkuil wrote:
> > [Repost because I mixed up a Lyon and Nice, and to provide more info on=
 the other
> >  events that take place in Nice. Also added Kevin Hilman to the CC list=
=2E]
> >=20
> > Hi all,
> >=20
> > We want to organize a Media Summit this year as well to meet each other=
 face-to-face.
> > We try to co-locate with an existing conference, and this year there ar=
e two options:
> >=20
> > 1) Co-locate with the Embedded Recipes conference in Nice in France whi=
ch is held on May 14-16:
> >=20
> >    https://embedded-recipes.org/2025/
> >=20
> >    So a media summit would probably take place on May 11 or 12.
> >=20
> >    This conference is a one room, one track format. But the room holds =
up to 200
> >    people and the expectation is that it is not a problem to get ticket=
s for it.
> >    And we might be able to reserve some tickets for us as well.
> >=20
> >    There is a libcamera workshop on Friday, and AFAIK a pipewire worksh=
op on the same day.
> >    GStreamer plans an event during the weekend after ER.
> >=20
> > 2) Co-locate with the Open Source Summit Europe in Amsterdam which is h=
eld on August 25-27.
> >=20
> >    https://events.linuxfoundation.org/open-source-summit-europe/
> >=20
> >    The Embedded Linux Conference Europe is part of that event. The summ=
it would
> >    probably be on August 24 or 28.
> >=20
> > I know that getting permission to travel is still a problem for many, w=
hich is why we
> > try to co-locate with a larger event.
> >=20
> > So: if you are a core media maintainer or an active media developer, an=
d want to join
> > the Media Summit, which of these two options would work for you?
> >=20
> > If possible, I would like to get an idea of what I can expect in about =
two weeks time.
> > I'll send out a reminder in about a week as well.
> >=20
> > Feel free to forward this if you know other people who might be interes=
ted.
> >=20
> > If you haven't been to one of these Media Summits before, then you can =
find the report
> > on last year's summit here:
> >=20
> > https://lore.kernel.org/linux-media/45e4f5d4-f6c4-4f0b-96b5-f5e1125b084=
5@xs4all.nl/
> >=20
> > That should give you an idea of what to expect.
> >=20
> > Regards,
> >=20
> > 	Hans
> >=20
>=20
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--zZz7CSSQ5VAw0CeB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmfPIBoACgkQhP3B6o/u
lQx6LQ//TrvZjwFHNKcGm2GVU1kgGiRdd9wltPWUlLmqaqoO9vqPALHyPyePmHjd
XP13yEpOra4vb3PskeT5mUapy5b8HnsolrFKp0XNPYNqyOs1lTvDpIdfWgeF+Av4
g/fgI8xKp2WNqG4L4aO97DUXnoGRxSu1bCJ3q5kOfNH3mdzesJ0at3CSq03w8uB7
FrGC48JcNezNW9zDoA6i3tg4DYxTXKgLmwmpbfxSVvn+qzjH/CKb5k+xAbYJiVSw
iWJHvoCq3RE/3RDpFIwyFqa/I1iI8b/sWAJ6vmN7Tfm2MYFcRKzD3nYeQan2zM9J
YhNIw53HyjVsdSUzP2U/gJrtjbuwR3NqFhKjVZcViBasjgaaVfuzFm/JGkXyKNw6
WfziFHN7ezUIO8hGQ6PyObPf7yA5kkW0NjSw+TpRs5pGSyGKr4oeYxyRZBGCiw/s
Ov3AjmCG0Z+R+dD3g+K2da88Wc1fP4tbrqxAv2el04aWezHbEkIM0Djyk5nMB8EK
5fAkVVyhOKUzB2xUhYSCvNQ0PE9GE/f/EaIE5A/IGk+pfMZbJAuJFbQY6W5l4A7b
lvDQbL6ZBtjKPe6+bTVZGRiYb9E7IRdRxs7EaWmVa6DNqhFVJ9dL5g1QoMw6Qa9T
9zLzlDw3cvnCsohqOgCIoPnaty+gwZuLrivaH3VozF4eOJZbcpM=
=XIn2
-----END PGP SIGNATURE-----

--zZz7CSSQ5VAw0CeB--

