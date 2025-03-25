Return-Path: <linux-media+bounces-28722-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 94404A704CB
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 16:17:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE6253B02C4
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 15:16:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E27CE25BAA9;
	Tue, 25 Mar 2025 15:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oZERRMa4"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889A525A333
	for <linux-media@vger.kernel.org>; Tue, 25 Mar 2025 15:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742915798; cv=none; b=ryGSLIUTvHyInhhku2Tpyy5N93uJuYReqAxO7iYsmp/FdeBMZDJw3bt5HfKUDI2fd0rN7MlK3LmKJmWi/RRwOY6QsufbrsbH1AWS0pWvRHEVMboWq3sM4BigGWNvzJPhofFKjaJ4eFVAiDZw5MKnG/VbZNiopo47f2dJSH+/61A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742915798; c=relaxed/simple;
	bh=AFP+BbTnFqQWSPwTYD9sOcVD5aSLbq3ADjETl9Twh5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MjxW166nMDlmOmyvZPRKof5ZZ+v2gq1godrgrxs8A5bz0JcVEKgO3xdmKUphjDvtPxEOhelV3NMVgAao8ay2KniHPT7z9GtE48wYlITC46ucYbMLBwcDS2B7gK950ZgUzMXNb7APuudN7MWjC7sUk4ntIhttIVgUjbEu/BlkEPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oZERRMa4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:904a:b2d:8d57:4705:738e])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AAF74353;
	Tue, 25 Mar 2025 16:14:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742915686;
	bh=AFP+BbTnFqQWSPwTYD9sOcVD5aSLbq3ADjETl9Twh5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oZERRMa42Dl0uKSsOfjrUjskNFTlhBQSqjvn4GBpkildV/XSi10ESpQJt50paOXlD
	 +7iJWgt3Y2ftYqfBLjuN6mpJzIWrd1F/tQGYRm+wsvOsExfsLX1HmNf26gfBa6+x/n
	 4ocw55Y0shKeVj1kdxE8iO8944JCLTy9rCmFtgUs=
Date: Tue, 25 Mar 2025 20:46:28 +0530
From: Jai Luthra <jai.luthra@ideasonboard.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Sean Young <sean@mess.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Ricardo Ribalda <ribalda@chromium.org>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, "stanimir.k.varbanov@gmail.com" <stanimir.k.varbanov@gmail.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Michael Tretter <m.tretter@pengutronix.de>, 
	Tomasz Figa <tfiga@chromium.org>, "Hu, Jerry W" <jerry.w.hu@intel.com>, 
	Steve Cho <stevecho@chromium.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Kevin Hilman <khilman@baylibre.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Devarsh Thakkar <devarsht@ti.com>
Subject: Re: [ANN] Registration and Request for Topics for the Media Summit
 on May 13th in Nice, France
Message-ID: <sbhsskq7kzrl5bkbqbijxszz7hfg34pjajgdmw23x7aseztyy3@26zcjwnjkpl4>
References: <044f2fa6-a245-4ae5-b9de-7a2e8831ccd6@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ldac3pzuvzllfarh"
Content-Disposition: inline
In-Reply-To: <044f2fa6-a245-4ae5-b9de-7a2e8831ccd6@xs4all.nl>


--ldac3pzuvzllfarh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [ANN] Registration and Request for Topics for the Media Summit
 on May 13th in Nice, France
MIME-Version: 1.0

Hi all,

On Mar 14, 2025 at 10:59:58 +0100, Hans Verkuil wrote:
> Hi all,
>=20
> We will organize another Media Summit on Tuesday May 13th to coincide with
> the Embedded Recipes Conference in Nice, France:
>=20
> https://embedded-recipes.org/2025/
>=20
> Note that there are also some workshops held after this conference:
>=20
> https://embedded-recipes.org/2025/workshops/
>=20
> And apparently a gStreamer event during the weekend. If anyone has more
> details about this, please reply to this post.
>=20
> The Media Summit will be held at Hotel Campanile:
>=20
> https://nice-aeroport.campanile.com/en-us/
>=20
> It is close to the Airport and to the Embedded Recipes venue.
>=20
> The meeting room can hold up to 30 people and has video conferencing supp=
ort.
>=20
> That said, I want to keep remote participation to a minimum. This yearly =
summit is meant
> for active media developers to meet up face-to-face and to discuss media =
subsystem issues.
> But if you are an active media developer and are really not able to atten=
d in person, then
> remote participation is an option.
>=20
> If you want to attend the meeting (either in person or remote), then send=
 an email to me
> directly. The deadline for that is May 2nd as the hotel needs to know the=
 final number of
> attendees by then. We have more seats available than last year, so I do n=
ot expect to run out.
> In the unlikely case that this becomes a problem, then I will revisit thi=
s.
>=20
> There is no registration fee.
>=20
> If you have a topic that you want to discuss, just 'Reply All' to this an=
nouncement.
> It would be very much appreciated if you can also add a guesstimate of th=
e time
> you need for your topic.

I have the following topic to discuss, required for supporting=20
multi-stream (RGBIR) sensor drivers:

Jai Luthra:
Per-stream V4L2 controls
Duration guesstimate: 40 mins

>=20
> See last year's Media Summit Report as an example of what to expect:
>=20
> https://lore.kernel.org/linux-media/45e4f5d4-f6c4-4f0b-96b5-f5e1125b0845@=
xs4all.nl/
>=20
> There are two topics already for the upcoming Media Summit:
>=20
> Paul Kocialkowski:
> Stateless video encoding uAPI
>=20
> Hans Verkuil:
> Status of Media CI/Multi-committers
> Duration guesstimate: 1 hour
>=20
> Regards,
>=20
> 	Hans

Thanks,
Jai

--ldac3pzuvzllfarh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmfiyMwACgkQQ96R+SSa
cUVcJRAAoNRmOLmxBGwo3wQL+ZmJ1wR/tFpXtTd7Sm8eHbDfJ58qPIdJFE1VFx4q
ZocMhnn2Zosm+HlLC2fhmYSSojKlqS3rZuvJa8WWlvGQp7D4Q9nzB2SJHZ5lGkhi
DZNYiNYL9Edh0dxevwLx4H30cTc+MVOa0magWLeZZit2VX1FWUJachmTKID7kqYm
mh2USwF7o9PQoQJv7Ez8SuaA+LN90x02tCaFoY7VjPoVXbttZV+v89lxjB2Hlgem
IbgxmyR7Nm/6LVCei6MZ0DlBGdDHszklFFs5OTg7Jl5UH/gruNUL99J7YuudOAfT
wyb1KFHT42rPIR/1F6leTDIoJbaG+6Rqgvcc5pg5U0IxvSr/WH2lOWkcNZvbDYGG
pxuT/gGpEP0Kl1NGgFbd8ql6W20hcDUae7If0EeR4+RFVVazsVmKKICSElo3Cwnr
jaDPL8aNoofMwSoK0jEDDBXYRTGNa//cWd5uxVSxzq6sjCkheUxZ4gR/2nKaxv8y
hKo46SeUkunawkabyoT+jqC4p4sxMJlmXAV6ccFYfhMRpcIlJaeGr04xUf/Vpc4L
jpLkwsx0iJOlEQCEB4d7bWVO3p8zcHwzTqobkAuHGMbN0cqR7mXOAUCOKy7Mi7VP
RnoqcUV6eHz6ykLWLPYNik2z5WRtjWedVB/Lt0AmbQDqL21COyk=
=ACF1
-----END PGP SIGNATURE-----

--ldac3pzuvzllfarh--

