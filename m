Return-Path: <linux-media+bounces-11940-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDB88D0183
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 15:30:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A604B283694
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 13:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0D5915F309;
	Mon, 27 May 2024 13:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F2glDx+3"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E05415ECFE;
	Mon, 27 May 2024 13:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716816623; cv=none; b=bLM3jKfs9+IzvMcj41KzNa3KVq+oG/WqMki8EWUUMXOJ3EOz/kyORnedJZcc2RQwIdZDCcPxRbmFbmf9jHvaMuYpl0BbjcIBDd3BgZn4iNTz8+81hwE409oiEQf1rmP90U4ZDgNEzu3Q4ROW2sISWUUMJpzQhCtlFMYlhv3cEpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716816623; c=relaxed/simple;
	bh=TF/G2ffwfrBRISpD7K1d5EZ9ItCYMb2x92oWHu7T4AM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lQJxiEOy+vK8GxzS+YiFkGkebOzg+lS3X3/BnddotmX8ZTenYUgxfc7ACJdC+Mhl70WF1xbkhmzwMele4fzZTaOi6sEktbhjXJsxUgFybPaUclkVUbjQXFJ5ky0kzcs0lQBpdJ8OAyQlcWU17LVIwdlL3CdDHbjVegF14BuTX2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F2glDx+3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48CB1C4AF07;
	Mon, 27 May 2024 13:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716816622;
	bh=TF/G2ffwfrBRISpD7K1d5EZ9ItCYMb2x92oWHu7T4AM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F2glDx+39JvZ8wnXQ32eLjUP4/ijfHmYOPAR3IWCS52WYonp3adypyoHL43pOKEIw
	 pua5H9IocB1EWiS+PP8277F61bmkw/7YM6Zq/yAJnDph5evoOKVrSMVPEEC8kfF0Lc
	 eCinKxXlFityRJ45ODnWMC4rgTnkq1De/XcY6nde07CDm+9iFxYSe1hibktpnIBBA8
	 u5g/nqZzec8VeOsqqIqlj+ggMKD4mFYlVtfUDdcqlReD4FRfkGlNeMTtcWH0MUdHrL
	 DzfbRjC7mgqW3t9+cKg/mO/eRsTT+seji5fjvNsd1TkEPIKzMzkKVXvTv2v83M68us
	 +LBBBDXRC+udA==
Date: Mon, 27 May 2024 15:30:19 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
	Sandy Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andy Yan <andy.yan@rock-chips.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Sebastian Wick <sebastian.wick@redhat.com>, 
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH v14 17/28] drm/connector: hdmi: Add Broadcast RGB property
Message-ID: <20240527-colorful-orange-bug-bbeefe@houat>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-17-51950db4fedb@kernel.org>
 <4n55dbl2h275z5ubebigri4xjtjsvt44w62n656srdgndcav2j@rrq5haucqx5u>
 <20240527-adamant-just-spaniel-ebed4e@houat>
 <a65wtf2hy7ufimkcgo5k2c34ygvtv7erwh567ngsnuaha7qiny@nl6lx67qsjuw>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="rh4txa2gphc5y7co"
Content-Disposition: inline
In-Reply-To: <a65wtf2hy7ufimkcgo5k2c34ygvtv7erwh567ngsnuaha7qiny@nl6lx67qsjuw>


--rh4txa2gphc5y7co
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, May 27, 2024 at 12:43:18PM GMT, Dmitry Baryshkov wrote:
> On Mon, May 27, 2024 at 11:02:13AM +0200, Maxime Ripard wrote:
> > Hi,
> >=20
> > Thanks again for that thorough review :)
> >=20
> > On Thu, May 23, 2024 at 01:22:56PM GMT, Dmitry Baryshkov wrote:
> > > On Tue, May 21, 2024 at 12:13:50PM +0200, Maxime Ripard wrote:
> > > > The i915 driver has a property to force the RGB range of an HDMI ou=
tput.
> > > > The vc4 driver then implemented the same property with the same
> > > > semantics. KWin has support for it, and a PR for mutter is also the=
re to
> > > > support it.
> > > >=20
> > > > Both drivers implementing the same property with the same semantics,
> > > > plus the userspace having support for it, is proof enough that it's
> > > > pretty much a de-facto standard now and we can provide helpers for =
it.
> > > >=20
> > > > Let's plumb it into the newly created HDMI connector.
> > > >=20
> > > > Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > > Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> > > > Reviewed-by: Sebastian Wick <sebastian.wick@redhat.com>
> > > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > > ---
> > > >  Documentation/gpu/kms-properties.csv            |  1 -
> > > >  drivers/gpu/drm/display/drm_hdmi_state_helper.c |  4 +-
> > > >  drivers/gpu/drm/drm_atomic.c                    |  2 +
> > > >  drivers/gpu/drm/drm_atomic_uapi.c               |  4 ++
> > > >  drivers/gpu/drm/drm_connector.c                 | 88 +++++++++++++=
++++++++++++
> > > >  include/drm/drm_connector.h                     | 36 ++++++++++
> > > >  6 files changed, 133 insertions(+), 2 deletions(-)
> > > >=20
> > > > diff --git a/Documentation/gpu/kms-properties.csv b/Documentation/g=
pu/kms-properties.csv
> > > > index 0f9590834829..caef14c532d4 100644
> > > > --- a/Documentation/gpu/kms-properties.csv
> > > > +++ b/Documentation/gpu/kms-properties.csv
> > > > @@ -15,11 +15,10 @@ Owner Module/Drivers,Group,Property Name,Type,P=
roperty Values,Object attached,De
> > > >  ,,=E2=80=9Csaturation=E2=80=9D,RANGE,"Min=3D0, Max=3D100",Connecto=
r,TBD
> > > >  ,,=E2=80=9Chue=E2=80=9D,RANGE,"Min=3D0, Max=3D100",Connector,TBD
> > > >  ,Virtual GPU,=E2=80=9Csuggested X=E2=80=9D,RANGE,"Min=3D0, Max=3D0=
xffffffff",Connector,property to suggest an X offset for a connector
> > > >  ,,=E2=80=9Csuggested Y=E2=80=9D,RANGE,"Min=3D0, Max=3D0xffffffff",=
Connector,property to suggest an Y offset for a connector
> > > >  ,Optional,"""aspect ratio""",ENUM,"{ ""None"", ""4:3"", ""16:9"" }=
",Connector,TDB
> > > > -i915,Generic,"""Broadcast RGB""",ENUM,"{ ""Automatic"", ""Full"", =
""Limited 16:235"" }",Connector,"When this property is set to Limited 16:23=
5 and CTM is set, the hardware will be programmed with the result of the mu=
ltiplication of CTM by the limited range matrix to ensure the pixels normal=
ly in the range 0..1.0 are remapped to the range 16/255..235/255."
> > >=20
> > > Should it still be defined as a generic property?
> >=20
> > I'm not sure what you mean here, sorry. It's being documented as a
> > connector property now, so it's very much still listed as a generic
> > property?
>=20
> I didn't perform my duty well enough and I didn't check the file for
> other instances of the property. Now I indeed see a generic "Broadcast
> RGB" property, but to me it looks like having a different set of values:
>=20
> ,,"""Broadcast RGB""",ENUM,"{ =E2=80=9Coff=E2=80=9D, =E2=80=9Cauto=E2=80=
=9D, =E2=80=9Con=E2=80=9D }",Connector,TBD

That's not really what I meant: that file is deprecated now and it's not
where we document the properties anymore. This patch has improved that
documentation and moved it to the new place, and removed the deprecated
part.

However, this line shouldn't be there at all. I'll add a patch to remove
it.

Thanks!
Maxime

--rh4txa2gphc5y7co
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZlSK6wAKCRAnX84Zoj2+
duG9AYDdUpGu5aVO7zw3zFdz1kudBfe8bhW4zbk7Rqh2F38nbF9k6OHwGoXKxcQe
BoqzGpYBf2GmKLiAj1MKfeIjRVsuVzqIgaw1sWlPvBOTPP+4TYXBl/H+8CBtp9KB
EgfYt9ctqg==
=NOy6
-----END PGP SIGNATURE-----

--rh4txa2gphc5y7co--

