Return-Path: <linux-media+bounces-21740-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F089C9D4C24
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 12:41:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 858702827E5
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 11:41:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68BC71D0F4F;
	Thu, 21 Nov 2024 11:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vdhpO3bx"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60C73C47B;
	Thu, 21 Nov 2024 11:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732189269; cv=none; b=KTrzqu7k7fQVZOHUIvchKso5469RxcAGt9XMFDl7kUorGlZb+YjDDbZvRJCCP0HoyRarY86HCiJ8kIpZavERCZ6x6j7DsqZXkpwZCSjaURwfXVAzgJOpMROUcN5decmDQK+4RrE6zQQaZ1T+hkwj0oqVh8IB07BGGt7q5dGpRSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732189269; c=relaxed/simple;
	bh=xi/MggR71byBBhUfd+bbxNTl1YfMsCSmSpm38mZB8jk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VZUr3f/Kqt2XotYQ7MLM85353cm/9DzFLZqh5My3KaKemKwEcmT7UiGA2QXCd+LT1rTQI+rRRdwiotN54nRo0Zza37Ma3Jh1QyeglqPDOkx4uoQebUOQMMrUVJB14zeMQDl/wuRFRf+f+VkDFg+eScYBh2p83pfL1Lgod8AkZYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vdhpO3bx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:883a:10f2:5b4b:5292:ac46:e988])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DD8C7670;
	Thu, 21 Nov 2024 12:40:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732189241;
	bh=xi/MggR71byBBhUfd+bbxNTl1YfMsCSmSpm38mZB8jk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vdhpO3bxhMoJIjI2CB818lo/lIp5vr7bK3M4qixh5Km/wXTVcRq31g0pcXLyflAcx
	 I6md36cvoxsD+uagFMEDjpdi+EQ/UtT6Y3h/xO2kMeg7TiW76w+v/fXBHdHIq7E/2R
	 ABlRLpJuVgzxjKdfN0ALEcpkKfjT3XU4nAmVXv6Q=
Date: Thu, 21 Nov 2024 17:10:54 +0530
From: Jai Luthra <jai.luthra@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] media: i2c: imx219: make HBLANK r/w to allow longer
 exposures
Message-ID: <5mpch5lokeoxbglc6n3gfugluzluguakv5udt6lflkn5qv23pk@kcllmxh5vqxm>
References: <20241029-imx219_fixes-v1-0-b45dc3658b4e@ideasonboard.com>
 <20241029-imx219_fixes-v1-2-b45dc3658b4e@ideasonboard.com>
 <ZySV3KKXSyIreRI4@kekkonen.localdomain>
 <CAPY8ntDF8W+xRBXbe=LYpg21LL7-svhCySTSJHRNiDzQs4Xw5Q@mail.gmail.com>
 <Zy3oKnHBiGOq8Uoj@kekkonen.localdomain>
 <CAPY8ntD4Q4f5fSC+xW=j-5T38_Zb5x7pGQM4RYVzrz+NJMGtUQ@mail.gmail.com>
 <ZzMytF509nZ8CYGZ@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="f6h4uy35r7yjlhco"
Content-Disposition: inline
In-Reply-To: <ZzMytF509nZ8CYGZ@kekkonen.localdomain>


--f6h4uy35r7yjlhco
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/3] media: i2c: imx219: make HBLANK r/w to allow longer
 exposures
MIME-Version: 1.0

Hi Sakari, Dave,

On Nov 12, 2024 at 10:49:24 +0000, Sakari Ailus wrote:
> Hi Dave,
>=20
> On Mon, Nov 11, 2024 at 07:37:56PM +0000, Dave Stevenson wrote:
> > Hi Sakari
> >=20
> > On Fri, 8 Nov 2024 at 10:30, Sakari Ailus <sakari.ailus@linux.intel.com=
> wrote:
> > >
> > > Hi Dave,
> > >
> > > On Thu, Nov 07, 2024 at 12:43:52PM +0000, Dave Stevenson wrote:
> > > > Hi Sakari
> > > >
> > > > On Fri, 1 Nov 2024 at 08:48, Sakari Ailus <sakari.ailus@linux.intel=
=2Ecom> wrote:
> > > > >
> > > > > Hi Jai,
> > > > >
> > > > > On Tue, Oct 29, 2024 at 02:27:36PM +0530, Jai Luthra wrote:
> > > > > > From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > > > >
> > > > > > The HBLANK control was read-only, and always configured such
> > > > > > that the sensor HTS register was 3448. This limited the maximum
> > > > > > exposure time that could be achieved to around 1.26 secs.
> > > > > >
> > > > > > Make HBLANK read/write so that the line time can be extended,
> > > > > > and thereby allow longer exposures (and slower frame rates).
> > > > > > Retain the overall HTS setting when changing modes rather than
> > > > > > resetting it to a default.
> > > > >
> > > > > It looks like this changes horizontal blanking at least in some c=
ases. Does
> > > > > this also work as expected in binned modes, for instance?
> > > > >
> > > > > Many sensors have image quality related issues on untested albeit
> > > > > functional line length values.
> > > > >
> > > > > So my question is: how has this been validated?
> > > >
> > > > Validated by Sony, or others?
> > > > I've tested a range of values in all modes and not observed any ima=
ge
> > > > quality issues.
> > >
> > > Somehow at least. :-)
> > >
> > > >
> > > > From previous discussions with Sony, they always provide their big
> > > > spreadsheet of register values for the specific mode and frame rate
> > > > requested. I don't think they even officially state that changing
> > > > VTS/FRM_LENGTH_LINES to change the framerate is permitted.
> > > > There are some Sony datasheets (eg imx258) that state "set to X. Any
> > > > other value please confirm with Sony", but that isn't the case for =
the
> > > > imx219 datasheet. I take that as it is permitted within the defined
> > > > ranges.
> > >
> > > I'm not that much concerned of vertical blanking, changing that withi=
n the
> > > valid range has effects on the image itself very seldom. Horizontal
> > > blanking is different though and this is what the patch makes changea=
ble,
> > > including a change in the default value. Of course there are big
> > > differences between sensors here.
> >=20
> > The intention was that the default value shouldn't change, and as the
> > overall PIXELS_PER_LINE value was meant to be retained on a mode
> > change the value used should only change if an application changes
> > V4L2_CID_HBLANK. If I blundered in the implementation of that, then
> > that should be fixed (I know Jacopo made comments, but I haven't had a
> > chance to investigate).
>=20
> I guess I misread the patch. It indeed should be the same.
>=20
> >=20
> > I doubt we'd get validation from Sony beyond the contents of the
> > datasheet. Potentially as the sensor is so old they don't have the
> > information or engineers involved.
> > I'm happy to set up a test system and capture a set of images with
> > HBLANK from min to max at some increment. With the same exposure and
> > gain they should all be identical as long as there isn't any movement
> > (rolling shutter with longer readout times and all that). Would that
> > be satisfactory?
>=20
> Sounds good to me. I just thought how it actually had been tested. :-)
>=20

While not a thorough test, I manually tested with different values for=20
horizontal_blanking for both binned and non-binned modes, and the image=20
quality looked okay, with expected behaviour (i.e. increase in exposure=20
and decrease in frame rate as total pixels per line increase)

I will send a v2 of this series with all the fixes.

> >=20
> > For contrast, the IMX290 datasheet states that VMAX shall be fixed at
> > 0x465 for all-pixel mode / 0x2ee for 720p mode, and HMAX should be
> > changed for frame rate control. As you say, sensors differ.
>=20
> --=20
> Kind regards,
>=20
> Sakari Ailus

--=20
Thanks,
Jai

GPG Fingerprint: 4DE0 D818 E5D5 75E8 D45A AFC5 43DE 91F9 249A 7145

--f6h4uy35r7yjlhco
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmc/HEUACgkQQ96R+SSa
cUXPLw//fe9WYR5bMfP4AM5Xw6J8HAEV2Q2cRsmDbTa3lpwTrRVFZPX8+gJv7VMA
EVjTtgSA559f6kgdeRra1/IkTHM1VNtcSQSdM9KnGyj3AvrDZ4yIc5utjrATqgY8
BDvYy6EcZHvX/gpPvP2QFATlaHQumDLF7eOFGSOVIQB7XDjRx585yVkoTlnzyekl
/lQEPqhDErO/X7Evm1tdlg4grfHiim81cVrjMfzXC6qSv4Xf7R/DHwHlKK3xVqoR
7sJdB5mnvqwVuJMDC9unwoB2Xe58FtUMk78n7DRid0D/gS5CPOiDSl5HKgjYqZgE
wrVSDAMH25eLX/3bgh9g6+xBRiTx58WWQ6Lj3+IRKK7kpp+aBgIMBfNIvxWN6+2z
ZWXoyOFAD8Uih72szt2VV0FcXY5LNvDyzQR9uot5TVgDA7wwjJRqmlrzcaoByfjt
5fOJIvx2bFYDiFgGXTIhxGwIs0ud+n/0nbIK7+aaP481/Mz8mC0y7vscaQBrgEtc
C4kloczFx49zB5nattkCc0NnQgAl6LR+gASd2fN5C31Ul10hCjBsLArBWUoAwYNu
H3rERJHPUDV+2i/7Js2Yya5jrh5YTiLnT9Sao76NklR9RF1AXMuw6Oc7RT+tWcpQ
ahC3dS+fxQw4yqKAeuLeVxRM2KWVWJ2JMhgCtVQvrtvyufL84HM=
=HEEJ
-----END PGP SIGNATURE-----

--f6h4uy35r7yjlhco--

