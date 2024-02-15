Return-Path: <linux-media+bounces-5205-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 284F58560BA
	for <lists+linux-media@lfdr.de>; Thu, 15 Feb 2024 12:05:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A24431F2306B
	for <lists+linux-media@lfdr.de>; Thu, 15 Feb 2024 11:05:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3423B433B1;
	Thu, 15 Feb 2024 11:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QjCNBHd3"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C2117581;
	Thu, 15 Feb 2024 11:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707994804; cv=none; b=Lg7lhnELP7IS3274rbgCy5DFF5o7FZ90hrP2Pap4QJi+0y5Nc/2MplqffVAiOTC68nLp3kbag3eHH+U9U0ZtufRiTdWvfrgMDvbp7jSzxDbzi//7eRlwKvX//apsB9isF05rvq15q0xO0Q/bf0tHfhhal8YUTzTccdy0nKEmrFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707994804; c=relaxed/simple;
	bh=Ljo22OLLV1jsYk36eFmaaPdGKB/DzUQf8sEwgakSRIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yo1o47SY+k5xn+YmZIb6/MK9OWsPRRBKwkNIH74CcoL6sNaBiRJVSpqdDPnliPT7m9px8+hYakFdBKtcgrzHBoeC3UQGuS3dyJKri04zUvyT49Aoy0FoevZdpD4aDpzjeoL7RxyHVj2N2AHrWrUeUo6uKnyELtf71htsXcvxxLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QjCNBHd3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBC5BC433C7;
	Thu, 15 Feb 2024 11:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707994804;
	bh=Ljo22OLLV1jsYk36eFmaaPdGKB/DzUQf8sEwgakSRIE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QjCNBHd3MZI6fRfVp7a6EoNWM616T5+u1n3Gf4bZLB4kjTRfsQTP8F/kWttSSeKv9
	 QburFf6ryiGXRiidxyJZCgfnhAX4P7ArXA8rqrziRC6lA619UHo1/phVHn5v/HdVjD
	 nOhC/aBrya8y9SfT6a4CuZ3+xdiIKmjI0Ozpd6rIIbT8y5sl/LJFQvI+7mxPA08NhX
	 lsquCp+j3U8h7mXjn7+mDQHcleMtdEc8sp5/uflqTrlWTEO4QHtuMo4VUhyZIVLVLF
	 mYmN81mQ12sZngJ2Y9Wws0QKIPlsc9vp8yvm2+LolXIRSwxyzLpT031jL2rhqPxCTD
	 DOK1Tcdk4tRsA==
Date: Thu, 15 Feb 2024 12:00:01 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, 
	Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Hans Verkuil <hverkuil@xs4all.nl>, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: Re: Re: Re: Re: Re: Re: [PATCH v5 08/44] drm/connector: hdmi:
 Add Broadcast RGB property
Message-ID: <2mih3humepuedtli7ge52ncom4uffkqravdpalncgfyucmwdzc@bp5o7i3ky77a>
References: <73peztbeeikb3fg6coxu3punxllgtyrmgco34tnxkojtsjbr3s@26bud3sjbcez>
 <Zb0M_2093UwPXK8y@intel.com>
 <hez2m57ogqx3yyqk45tzdkvxvhrbdepgm244i4m2aty2xhf5b5@acqgvmxhmmvr>
 <Zb0aYAapkxQ2kopt@intel.com>
 <zml6j27skvjmbrfyz7agy5waxajv4p4asbemeexelm3wuv4o7j@xkd2wvnxhbuc>
 <20240209203435.GB996172@toolbox>
 <ahfl6f72lpgpsbnrbgvbsh4db4npr2hh36kua2c6krh544hv5r@dndw4hz2mu2g>
 <Zco-DQaXqae7B1jt@intel.com>
 <yx2t7xltxxgsngdsxamsfq6y7dze3wzegxcqwmsb5yrxen73x6@u3vilqhpci4w>
 <20240212170618.GA1372043@toolbox>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7ujblr6jhcr73aj6"
Content-Disposition: inline
In-Reply-To: <20240212170618.GA1372043@toolbox>


--7ujblr6jhcr73aj6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 12, 2024 at 06:06:18PM +0100, Sebastian Wick wrote:
> On Mon, Feb 12, 2024 at 05:53:48PM +0100, Maxime Ripard wrote:
> > On Mon, Feb 12, 2024 at 05:49:33PM +0200, Ville Syrj=E4l=E4 wrote:
> > > On Mon, Feb 12, 2024 at 11:01:07AM +0100, Maxime Ripard wrote:
> > > > On Fri, Feb 09, 2024 at 09:34:35PM +0100, Sebastian Wick wrote:
> > > > > On Mon, Feb 05, 2024 at 10:39:38AM +0100, Maxime Ripard wrote:
> > > > > > On Fri, Feb 02, 2024 at 06:37:52PM +0200, Ville Syrj=E4l=E4 wro=
te:
> > > > > > > On Fri, Feb 02, 2024 at 04:59:30PM +0100, Maxime Ripard wrote:
> > > > > > > > On Fri, Feb 02, 2024 at 05:40:47PM +0200, Ville Syrj=E4l=E4=
 wrote:
> > > > > > > > > On Fri, Feb 02, 2024 at 02:01:39PM +0100, Maxime Ripard w=
rote:
> > > > > > > > > > Hi,
> > > > > > > > > >=20
> > > > > > > > > > On Mon, Jan 15, 2024 at 03:37:20PM +0100, Sebastian Wic=
k wrote:
> > > > > > > > > > > > >  /**
> > > > > > > > > > > > >   * DOC: HDMI connector properties
> > > > > > > > > > > > >   *
> > > > > > > > > > > > > + * Broadcast RGB
> > > > > > > > > > > > > + *      Indicates the RGB Quantization Range (Fu=
ll vs Limited) used.
> > > > > > > > > > > > > + *      Infoframes will be generated according t=
o that value.
> > > > > > > > > > > > > + *
> > > > > > > > > > > > > + *      The value of this property can be one of=
 the following:
> > > > > > > > > > > > > + *
> > > > > > > > > > > > > + *      Automatic:
> > > > > > > > > > > > > + *              RGB Range is selected automatica=
lly based on the mode
> > > > > > > > > > > > > + *              according to the HDMI specificat=
ions.
> > > > > > > > > > > > > + *
> > > > > > > > > > > > > + *      Full:
> > > > > > > > > > > > > + *              Full RGB Range is forced.
> > > > > > > > > > > > > + *
> > > > > > > > > > > > > + *      Limited 16:235:
> > > > > > > > > > > > > + *              Limited RGB Range is forced. Unl=
ike the name suggests,
> > > > > > > > > > > > > + *              this works for any number of bit=
s-per-component.
> > > > > > > > > > > > > + *
> > > > > > > > > > > > > + *      Drivers can set up this property by call=
ing
> > > > > > > > > > > > > + *      drm_connector_attach_broadcast_rgb_prope=
rty().
> > > > > > > > > > > > > + *
> > > > > > > > > > > >=20
> > > > > > > > > > > > This is a good time to document this in more detail=
=2E There might be two
> > > > > > > > > > > > different things being affected:
> > > > > > > > > > > >=20
> > > > > > > > > > > > 1. The signalling (InfoFrame/SDP/...)
> > > > > > > > > > > > 2. The color pipeline processing
> > > > > > > > > > > >=20
> > > > > > > > > > > > All values of Broadcast RGB always affect the color=
 pipeline processing
> > > > > > > > > > > > such that a full-range input to the CRTC is convert=
ed to either full- or
> > > > > > > > > > > > limited-range, depending on what the monitor is sup=
posed to accept.
> > > > > > > > > > > >=20
> > > > > > > > > > > > When automatic is selected, does that mean that the=
re is no signalling,
> > > > > > > > > > > > or that the signalling matches what the monitor is =
supposed to accept
> > > > > > > > > > > > according to the spec? Also, is this really HDMI sp=
ecific?
> > > > > > > > > > > >=20
> > > > > > > > > > > > When full or limited is selected and the monitor do=
esn't support the
> > > > > > > > > > > > signalling, what happens?
> > > > > > > > > > >=20
> > > > > > > > > > > Forgot to mention: user-space still has no control ov=
er RGB vs YCbCr on
> > > > > > > > > > > the cable, so is this only affecting RGB? If not, how=
 does it affect
> > > > > > > > > > > YCbCr?
> > > > > > > > > >=20
> > > > > > > > > > So I dug a bit into both the i915 and vc4 drivers, and =
it looks like if
> > > > > > > > > > we're using a YCbCr format, i915 will always use a limi=
ted range while
> > > > > > > > > > vc4 will follow the value of the property.
> > > > > > > > >=20
> > > > > > > > > The property is literally called "Broadcast *RGB*".
> > > > > > > > > That should explain why it's only affecting RGB.
> > > > > > > >=20
> > > > > > > > Right. And the limited range option is called "Limited 16:2=
35" despite
> > > > > > > > being usable on bpc > 8 bits. Naming errors occurs, and his=
tory happens
> > > > > > > > to make names inconsistent too, that's fine and not an argu=
ment in
> > > > > > > > itself.
> > > > > > > >=20
> > > > > > > > > Full range YCbCr is a much rarer beast so we've never bot=
hered
> > > > > > > > > to enable it.
> > > > > > > >=20
> > > > > > > > vc4 supports it.
> > > > > > >=20
> > > > > > > Someone implemented it incorrectly then.
> > > > > >=20
> > > > > > Incorrectly according to what documentation / specification? I'=
m sorry,
> > > > > > but I find it super ironic that i915 gets to do its own thing, =
not
> > > > > > document any of it, and when people try to clean things up they=
 get told
> > > > > > that we got it all wrong.
> > > > >=20
> > > > > FWIW, this was an i915 property and if another driver uses the sa=
me
> > > > > property name it must have the same behavior. Yes, it isn't stand=
ardized
> > > > > and yes, it's not documented (hence this effort here) but it's st=
ill on
> > > > > vc4 to make the property compatible.
> > > >=20
> > > > How is it not compatible? It's a superset of what i915 provides, but
> > > > it's strictly compatible with it.
> > >=20
> > > No it is not.
> >=20
> > The property is compatible with i915 interpretation of it, whether you
> > like it or not. And that's what Sebastian was referring to.
> >=20
> > > Eg. what happens if you set the thing to full range for RGB (which you
> > > must on many broken monitors), and then the kernel automagically
> > > switches to YCbCr (for whatever reason) but the monitor doesn't
> > > support full range YCbCr? Answer: you get crap output.
> >=20
> > And that part is just moving goalposts.
>=20
> But it's really not.

It really is. This whole discussion started by "well it would be nice if
we made that property handled by the core", and we're now at the "we
need to deal with broken YCbCr displays and i915 opinion about them"
stage. After creating documentation, unit tests, etc. It's the textbook
definition of moving goalposts. And while i915 won't be affected by all
that work.

That series has been stuck for multiple iterations on pointless and
mundane debates while the biggest part and whole point of it is not
getting any review. So yeah, sorry, it's frustrating.

> The Broadcast RGB property kind of works from a user space perspective
> because it's a workaround for broken sinks. If a sink expects limited
> range we can force full range. If this however affects YCbCr modes as
> well, then this isn't a workaround for broken RGB range anymore
> because it now breaks YCbCr.

Or, you know, it's a workaround for broken YCbCr display.

> Sorry, but vc4 just has to change.
>=20
> And again: let's please stop trying to improve the property.

I'm not. I'm super close to just dropping that patch entirely and keep
the current situation that seems to work fine for everyone.

Maxime

--7ujblr6jhcr73aj6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZc3usAAKCRDj7w1vZxhR
xUOcAPsFDv7RLl3qbYbEO9cMd3YT0Mx2eLivHvf3dB/UGMSz0QEAqPyXmKeZnkyC
qKM4LbWO65EO3EMbSppQ/HMoRyV2CAg=
=aE2T
-----END PGP SIGNATURE-----

--7ujblr6jhcr73aj6--

