Return-Path: <linux-media+bounces-29598-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F302A7F989
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 11:31:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB9B8189E8ED
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 09:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DB03265CB6;
	Tue,  8 Apr 2025 09:29:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941BF265CC4
	for <linux-media@vger.kernel.org>; Tue,  8 Apr 2025 09:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104552; cv=none; b=rbRaG5XN+LLZIoXX5V//c2WZR/QAYvgwoNu9BjzFbIPpN1XR1KNJmf3lYvmXGGpRtaFs/KQdyjZZaJi78RIz+rP0h3bADC8ZiNYnBfFl/LMt/qK6vienyjLrNZr1UoulzlVi62rqRWksJH4/zuoSJmqtN+PBJSnjQFpwStjd4XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104552; c=relaxed/simple;
	bh=Ku3j/0YEMwOy8G5E5cU/VZ6GVFGXf/YzPm7WN48eHyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LcoFy+Ehf5sj6OZ+dC60P4PeMoCCIbMM/j1pXYbMxYbTCCYrK5J+sdFMgSbYCobLhSWAgTRvkpF2jXt7JzwKwBMrhKF3VryvKdSzHR4h8hm2Sqx+RMsYzAmUKRd0tPvQwNwSsxhF2O5rDRKY6NyRRPUCWWFPq4LwR/kbq5rry4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 8AE9F1F00058
	for <linux-media@vger.kernel.org>; Tue,  8 Apr 2025 09:20:31 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 3C210AC0F60; Tue,  8 Apr 2025 09:20:28 +0000 (UTC)
X-Spam-Level: 
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id EFAFEAC0F5E;
	Tue,  8 Apr 2025 09:20:24 +0000 (UTC)
Date: Tue, 8 Apr 2025 11:20:23 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sean Young <sean@mess.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
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
	Steve Cho <stevecho@chromium.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Subject: Re: [ANN] Registration and Request for Topics for the Media Summit
 on May 13th in Nice, France
Message-ID: <Z_TqV2FhIq88sNRW@collins>
References: <044f2fa6-a245-4ae5-b9de-7a2e8831ccd6@xs4all.nl>
 <20250407193909.GA17385@pendragon.ideasonboard.com>
 <20250408133142.030bd1cf@sal.lan>
 <CAGb2v64JXggyR26q2M7h+E3pDKqccuQF8gJpBvR4p1uuYndUOQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qMyANM1MnOX5HoB2"
Content-Disposition: inline
In-Reply-To: <CAGb2v64JXggyR26q2M7h+E3pDKqccuQF8gJpBvR4p1uuYndUOQ@mail.gmail.com>


--qMyANM1MnOX5HoB2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Le Tue 08 Apr 25, 14:32, Chen-Yu Tsai a =C3=A9crit :
> On Tue, Apr 8, 2025 at 1:32=E2=80=AFPM Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> >
> > Em Mon, 7 Apr 2025 22:39:09 +0300
> > Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:
> >
> > > I would like to propose the following topic.
> > >
> > > Review of the status of staging drivers
> > >
> > > We have a set of 11 drivers in drivers/staging/media/, with various
> > > states of maturity and development activity.
> >
> > On a quick look, we have there:
> >
> > 1. source "drivers/staging/media/atomisp/Kconfig"
> > 2. source "drivers/staging/media/av7110/Kconfig"
> > 3. source "drivers/staging/media/imx/Kconfig"
> > 4. source "drivers/staging/media/ipu3/Kconfig"
> > 5. source "drivers/staging/media/max96712/Kconfig"
> > 6. source "drivers/staging/media/meson/vdec/Kconfig"
> > 7. source "drivers/staging/media/rkvdec/Kconfig"
> > 8. source "drivers/staging/media/starfive/Kconfig"
> > 9. source "drivers/staging/media/sunxi/Kconfig"
>=20
> This actually has two drivers:
>=20
> a. cedrus
>=20
> IIRC Paul has some more patches that are part of the stateless encoding
> work. Those would finish the remaining TODO items. Even without those
> I believe the existing decoding functionality is working fine.

Yes I did not get to that point yet but it's on my tasks list.

On the other hand I was told that it is displeasing and worrying for some
people to see the staging warning when the driver is loaded and so that it
would be good to unstage it ASAP, since indeed decode works well.

I feel like it's best to keep it in staging before its architecture is rewo=
rked.
But if everyone agrees that it makes no difference (i.e. architecture rework
patches would be accepted after unstaging) then it makes sense to unstage it
without waiting.

> b. sun6i-isp
>=20
> This was also done by Paul during his time at Bootlin. However I don't
> think anyone is using it, since the DT parts never landed.

I was pretty sure the patches were ready to go at this point.
I can respin them, it would be a shame to trash all this work.

And people are definitely using it, I got a bunch of private emails about
the driver and know of a few companies/products using it.

Cheers,

Paul

>=20
> ChenYu
>=20
> > 10. source "drivers/staging/media/tegra-video/Kconfig"
> > 11. source "drivers/staging/media/deprecated/atmel/Kconfig"
> >
> > > drivers/staging/ is not meant as a place for drivers to die,
> >
> > It is, actually: we usually move things there before dropping,
> > because, on most cases, they could be salvaged if someone is
> > interested on it.
> >
> > > we should nudge the relevant
> > > maintainers and consider dropping drivers that show no hope of
> > > progressing.
> >
> > Fully agreed.
> >
> > -
> >
> > Yet, while it makes sense to have action plans for drivers on staging,
> > I don't think that the Media Summit is the best place to discuss,
> > as people that might be involved with them may not be able to
> > participate there.
> >
> > See, there are different situations there, like:
> >
> > - platform drivers: at worse case, those should be removed when
> >   the core/DT support for such platform is removed. We removed
> >   several such drivers in the past. We can also remove them earlier,
> >   if there are reasons for doing that and nobody is complaining;
> >
> > - drivers like atomisp that takes a lot of efforts to be promoted.
> >   As long as I see some progress (and we've been seeing progress
> >   on every kernel version), I can't see any reason why removing it.
> >
> > - drivers like ipu3, which is for an entire family of PC CPUs.
> >   I prefer not dropping drivers like these unless we have very good
> >   reasons to do so. On the other hand, we are seeing very little
> >   progress on those.
> >
> > Anyway, better to split this into different threads, copying
> > the people involved on the recent changes for such drivers.
> >
> > Regards,
> > Mauro
> >

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--qMyANM1MnOX5HoB2
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmf06lcACgkQhP3B6o/u
lQydvA/8CDviZ1cWLB1RG28MqmKlXhK/p0QLOmCgceGkrAylfIbS8gwtZasFTK0R
FqyPvT0HM6jiX1nAHvYV+CdBQvJrjnj7d6clETIsgT/AbIfS+NPDK6hTyh+1w32U
NRHKjYa63qiXibfFmfLU8IZDuLuN7wpFOXnkPuptqB17Cvyfd81TY5w6axWXj3fV
e7uJejfPEZrnxS2fQjiLldMVYDI4tKdaVDUgey+ejGkr7QJ8WGYipEPzEcIQqKVV
u9551/VJcsX4gZjk3w2K+AbMvzEPWsU1DdKke+OLP5OKXfEoP4Zmry1fdhUzKPfM
ovSUIZQ8pUrUmiYQlDEzoHAC2ssWBVEp3MPKLRIP2vMDmYly9QivHggWunMxmF9s
tGgeE+rd1F/qLM6OejBXOT50fz497oOIt3VjKs4EZVikKs4M4Mg5vcpeNVcERrgT
sfNBZkg7ENaiqkX5GIoO7xAxZP2RUgLgXS81QdjTZ2oUKQgyXGUPx59D0/ngbsXU
qeNY6GACqoPUiWdj8uz6bmTvlsAtk1fVJF9NYNl8yB/rOF1NOPUawtbv9FD8AUQv
/WIETiV1EC81h6H6YsqG3uq+zOhHxQ0sbAti17AukS1bbMBt5f+z62dlgaMg4OAs
HsFuhLOyjn6/qFdmIxsmGbIGNQjwns4Z2RUX3QB1dNyjIjdPUQI=
=9Rh+
-----END PGP SIGNATURE-----

--qMyANM1MnOX5HoB2--

