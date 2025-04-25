Return-Path: <linux-media+bounces-31018-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C71A9C2D1
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 11:07:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58A71926AC5
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 09:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C1D622ACF7;
	Fri, 25 Apr 2025 09:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dz+0XG7q"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF1A1F3FC8
	for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 09:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745571795; cv=none; b=nnVE68lH2GyDnYjIqKQgTy/PAW5XOd7o0Iw51eqxJSHBjMsv5HjcKNwPES0tSSMkFJW436EQLrRIBIMvYhjVlJE/yyzi9qDtgXnKGdStg5PcnCpVYSwAegkQsvZ5chTbljExE+f/in8Yu6P2NXBP3lKtUWAU0fgJ1brx5tl+gLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745571795; c=relaxed/simple;
	bh=5jg+vfnT5zWKfo9icg0I9eXLNibQm09GP1SFsn2rjmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nYEm0tbZSiugp+ovE3No4kw+5I14v/RmNeSzV9s4KNmJz0K9qWAeMG9Y12G5Jj80QSuBRNSVpcwTZlJtSo/ZbkDflRiDGb5VNq6IoU4/fixxL4ohw0vSWErvJB5G2Kulb4srL33yTxU3d57rrAIf7bMsz9Y+8xFN6gtoEiru/eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dz+0XG7q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67DBBC4CEEB;
	Fri, 25 Apr 2025 09:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745571794;
	bh=5jg+vfnT5zWKfo9icg0I9eXLNibQm09GP1SFsn2rjmI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dz+0XG7qYTYM6CzVdwNRIeeKqE+2jFRPzaTOtdJQLfVDNNbtXofj4hr4nwYCP5SVS
	 Up0goNrvQ6wLrZPS5DEYdNcY4YOhDOxz4iqcKBd3MrQ78kJYIbcIAQl9D6Z7qSoXEU
	 z8lQ+tvnZMH9bGPO0l/1OdBf59C2a+Ako67NZGkGpE6/Yg1ml/dmCYBvcsb1uGZ9cE
	 hVHXCFjP54Ip1oRlxyBYbesR4QVXM7ol+lAdLdY3jayCJHhZa1GCWBVRv+xTkiHrPB
	 Le1gaGdMd7POSmtYm4g66DBLa0cEa0ipsX0VcXeE9JUg1Dth1rst9Li7vW040GQI/U
	 tqzwRoqwd8rOg==
Date: Fri, 25 Apr 2025 11:03:12 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Hans Verkuil <hans@jjverkuil.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Sean Young <sean@mess.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Ricardo Ribalda <ribalda@chromium.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Michael Tretter <m.tretter@pengutronix.de>, Tomasz Figa <tfiga@chromium.org>, 
	"Hu, Jerry W" <jerry.w.hu@intel.com>, Steve Cho <stevecho@chromium.org>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Kevin Hilman <khilman@baylibre.com>, 
	Paul Kocialkowski <paulk@sys-base.io>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Arthur Vinchon <arthur.vinchon@allegrodvt.com>, 
	Marco Felsch <m.felsch@pengutronix.de>, Jackson Lee <jackson.lee@chipsnmedia.com>, 
	Mirela Rabulea <mirela.rabulea@nxp.com>, Hans de Goede <hdegoede@redhat.com>, 
	Jai Luthra <jai.luthra@ideasonboard.com>, Devarsh Thakkar <devarsht@ti.com>
Subject: Re: [ANN] Media Summit May 13th: Draft Agenda (v3)
Message-ID: <20250425-invaluable-witty-wildebeest-fadf3f@houat>
References: <cb671b09-a5fa-4662-b31f-dfddda79fd11@jjverkuil.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ls5r3xbmdntrjta5"
Content-Disposition: inline
In-Reply-To: <cb671b09-a5fa-4662-b31f-dfddda79fd11@jjverkuil.nl>


--ls5r3xbmdntrjta5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [ANN] Media Summit May 13th: Draft Agenda (v3)
MIME-Version: 1.0

Hi Hans,

On Fri, Apr 25, 2025 at 10:12:55AM +0200, Hans Verkuil wrote:
> Here is my v3 of the draft agenda for the media summit.
>=20
> One important notice: it turned out that the meeting room does not actual=
ly have
> dedicated video conference equipment. I'm trying to figure out a solution=
 for this,
> but for those that registered for remote attendance, be aware that it mig=
ht not
> work out or be of poor quality.
>=20
> The list of topics has filled up nicely, and so has the number of in-pers=
on
> attendees. There is still room enough, so let me know if you want to atte=
nd.
> The deadline for that is May 1st.
>=20
> As always, this draft agenda is subject to change and all times are guess=
timates!
>=20
> Please note that I am transitioning from my old hverkuil@xs4all.nl email =
to
> my new hans@jjverkuil.nl email. If you have problems replying to that new=
 email,
> please let me know and just send it to the old email (that won't go away).
>=20
> The Media Summit will be held Tuesday May 13th to coincide with
> the Embedded Recipes Conference in Nice, France:
>=20
> https://embedded-recipes.org/2025/
>=20
> Note that there are also some workshops held after this conference:
>=20
> https://embedded-recipes.org/2025/workshops/
>=20
> And a gStreamer hackfest:
>=20
> https://discourse.gstreamer.org/t/gstreamer-spring-hackfest-2025-on-16-18=
-may-2025-in-nice-france/4366
>=20
> The Media Summit will be held at Hotel Campanile:
>=20
> https://nice-aeroport.campanile.com/en-us/
>=20
> It is close to the Airport and to the Embedded Recipes venue.
>=20
> The meeting room can hold up to 30 people and has video conferencing supp=
ort; it is
> sponsored by Collabora and Cisco Systems Norway.
>=20
> We currently have the following confirmed in-person attendees:
>=20
> Sakari Ailus <sakari.ailus@linux.intel.com> (Intel)
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> (Media Maintainer, Huaw=
ei)
> Nicolas Dufresne <nicolas.dufresne@collabora.com> (Collabora)
> Benjamin Gaignard <benjamin.gaignard@collabora.com> (Collabora)
> Hans de Goede <hdegoede@redhat.com> (Red Hat)
> Paul Kocialkowski <paulk@sys-base.io> (sys-base)
> Jai Luthra <jai.luthra@ideasonboard.com> (Ideas on Board)
> Jacopo Mondi <jacopo.mondi@ideasonboard.com> (Ideas on Board)
> Benjamin Mugnier <benjamin.mugnier@foss.st.com> (STMicroelectronics)
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> (Ideas on Board)
> Ricardo Ribalda <ribalda@chromium.org> (Google)
> Maxime Ripard <mripard@redhat.com> (Red Hat)
> Dave Stevenson <dave.stevenson@raspberrypi.com> (Raspberry Pi)
> Devarsh Thakkar <devarsht@ti.com> (Texas Instruments)
> Hans Verkuil <hans@jjverkuil.nl> (Media Maintainer, Cisco Systems Norway)
> Arthur Vinchon <arthur.vinchon@allegrodvt.com> (Allegro DVT)
>=20
> As you can see, there is enough room for more people, so don't hesitate to
> register by sending an email to me. The deadline is May 1st.
>=20
> And the following remote participants:
>=20
> Marco Felsch <m.felsch@pengutronix.de> (Pengutronix)
> Martin Hecht <mhecht73@googlemail.com> (Avnet Silica)
> Hu, Jerry W <jerry.w.hu@intel.com> (Intel)
> jackson.lee <jackson.lee@chipsnmedia.com> (Chips 'n Media)
> Mirela Rabulea <mirela.rabulea@nxp.com> (NXP)
> Michael Tretter <m.tretter@pengutronix.de> (Pengutronix)
>=20
> Note: information on how to connect remotely will come later. See also th=
e notice
> at the top of this email.
>=20
> If any information above is incorrect, or if I missed someone, then pleas=
e let me know asap.
>=20
> Draft Agenda:
>=20
> 9:00-9:30: Get settled :-)
>=20
> 9:30-9:40: Hans Verkuil: Quick introduction
>=20
> 9:40-10:25: Paul Kocialkowski: Stateless video encoding uAPI
>=20
> 10:25-11:15: Jai Luthra: Per-stream V4L2 controls
>=20
> 11:15-11:30: break
>=20
> 11:30-12:15: Sakari Ailus: Identifying camera modules
>=20
> 12:15-13:30: lunch TBD
>=20
> 13:30-14:00: Laurent Pinchart: Review of the status of staging drivers
>=20
> 14:00-15:00: Hans de Goede: Discuss V4L2 subdev API ambiguities
>=20
> 15:15-15:30: break
>=20
> 15:30-15:50: Jacopo Mondi: Unify the multi-context support with the m2m c=
ontext handling
>=20
> 15:50-16:35: Ricardo Ribalda: Openness Framework for ISPs
>=20
> 16:35-17:30: Hans Verkuil: Status of Media CI/Multi-committers
>=20
> Please reply with corrections, questions, etc. to this email. I'll update=
 the agenda
> over time. Again, these times are very preliminary.

I realise I'm a bit late to the party, but if there's a waiting list I'd
like to add enabling cgroups memory accounting. We've started to
implement and discuss it in DRM and there's some pretty specific topics
for them, but I'd like to discuss what they might be for v4l2 in
general. I wouldn't expect it to take more than 30 minutes.

Maxime

--ls5r3xbmdntrjta5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaAtP0AAKCRAnX84Zoj2+
dnhLAYDAnZrOLclQ3peTVnNTHImHRvupxkJWirS8jYkEEjL1ych+HXxG2UVrdcI+
dUWhdh8BgO+5UTYoy741XReLzCRdfvBPKFbwGgj2LHVZSL9LdZeeRRua7ZRWpa1n
G0J9jxBoVw==
=imau
-----END PGP SIGNATURE-----

--ls5r3xbmdntrjta5--

