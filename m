Return-Path: <linux-media+bounces-38696-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D74DB16F46
	for <lists+linux-media@lfdr.de>; Thu, 31 Jul 2025 12:14:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 800127AC16A
	for <lists+linux-media@lfdr.de>; Thu, 31 Jul 2025 10:13:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F38AB221572;
	Thu, 31 Jul 2025 10:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EW2fLpcS"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E384299928;
	Thu, 31 Jul 2025 10:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753956869; cv=none; b=DKuUQ1oEIqfU5wp8zBbjyOXNt+zm4L7BL75HtlNIaLTI4w2fEpI3TaIBdo87DTeTp+Gbwdnm8v1Fyd30cRIsDVsnQB3fruziD8L5JPexN5PeyEK7xQfzcJ5JxqSI9LGR2YQDUy8HjkHZUqQFq2tARJcTKE8z7tsO3JCjVLT0Ajk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753956869; c=relaxed/simple;
	bh=I0BZILQoozjQVpBXvKZeoZ4fl7KSMXkO6kJQgJ7dzfA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lEkDqdtWTLQDKpUr4vZZJFcVXkw0nPIJ5GjOtGgVZe6TbnNN8dYvP8vvEbo07atrQdfJ78BFFqS+o6mZ0d/dOZZYOrG2UuNT88L4Ip6yNlLs0ONRFxUMe6JA974u/ZMXn9tZ4JtdRfUeOnQoZXwdWazQ4hGj2CrFwySbeETNcAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EW2fLpcS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87F40C4CEEF;
	Thu, 31 Jul 2025 10:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753956868;
	bh=I0BZILQoozjQVpBXvKZeoZ4fl7KSMXkO6kJQgJ7dzfA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EW2fLpcSa8NLVfMN54PwfLbPEbNPhzouqZEhIZ1Otsw/Cs/7e4wWSoVkgBwIciRe2
	 hE+Y2oKieUEEDTfAe5renRy1O7MC1m93++DqBzGiIdKsyXbkaRAzZCbZHauDr5a4D5
	 eSvvTmzYYqHp4IQaw1eLE/oBsZpD/3pStNPHr+q6f5LA5/UYTFu2t7unIqEMrxRb4I
	 7cUD14IbnwTUVB99iLOazo2TmIWVxIyxI9poTsnE7mijeT47Yhz+YygV1yiXYm7LWm
	 QzSMmNztHFpE7pOHSaJnJHqvA0LJoMEbgzh89m4Zcr7DlA493Rz/6nFTFuvrjoIKaj
	 5//JcXfurgKLg==
Date: Thu, 31 Jul 2025 12:14:26 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Hans Verkuil <hans@jjverkuil.nl>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Mats Randgaard <matrandg@cisco.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] media: tc358743: Fix the RGB MBUS format
Message-ID: <20250731-teal-oryx-of-shopping-ced228@houat>
References: <20250612-csi-bgr-rgb-v1-0-dc8a309118f8@kernel.org>
 <20250612-csi-bgr-rgb-v1-3-dc8a309118f8@kernel.org>
 <CAPY8ntCYG8ufxpMkgBj1ZpSW-H2HObpcbQNg9tj+EXUM4PGkfQ@mail.gmail.com>
 <e9b61666-6bf0-4ec2-8524-0b6d94f028ef@jjverkuil.nl>
 <20250618-dancing-rare-skua-eb7ffd@houat>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="k6dm4cewj3qobmxo"
Content-Disposition: inline
In-Reply-To: <20250618-dancing-rare-skua-eb7ffd@houat>


--k6dm4cewj3qobmxo
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/4] media: tc358743: Fix the RGB MBUS format
MIME-Version: 1.0

Hi Hans,

On Wed, Jun 18, 2025 at 04:54:07PM +0200, Maxime Ripard wrote:
> On Mon, Jun 16, 2025 at 10:02:17AM +0200, Hans Verkuil wrote:
> > On 12/06/2025 19:01, Dave Stevenson wrote:
> > > On Thu, 12 Jun 2025 at 13:54, Maxime Ripard <mripard@kernel.org> wrot=
e:
> > >>
> > >> The tc358743 is an HDMI to MIPI-CSI2 bridge. It supports two of the
> > >> three HDMI 1.4 video formats: RGB 4:4:4 and YCbCr 422.
> > >>
> > >> RGB 4:4:4 is converted to the MIPI-CSI2 RGB888 video format, and lis=
ted
> > >> in the driver as MEDIA_BUS_FMT_RGB888_1X24.
> > >>
> > >> Most CSI2 receiver drivers then map MEDIA_BUS_FMT_RGB888_1X24 to
> > >> V4L2_PIX_FMT_RGB24.
> > >>
> > >> However, V4L2_PIX_FMT_RGB24 is defined as having its color component=
s in
> > >> the R, G and B order, from left to right. MIPI-CSI2 however defines =
the
> > >> RGB888 format with blue first.
> > >>
> > >> This essentially means that the R and B will be swapped compared to =
what
> > >> V4L2_PIX_FMT_RGB24 defines.
> > >>
> > >> The proper MBUS format would be BGR888, so let's use that.
> > >=20
> > > I know where you're coming from, but this driver has been in the tree
> > > since 2015, so there is a reasonable expectation of users. I've had an
> > > overlay for it in our kernel tree since 4.14 (July 2018), and I know
> > > of at least PiKVM [1] as a product based on it. I don't know if Cisco
> > > are still supporting devices with it in.
> >=20
> > Those are all EOL, so no need to be concerned about that.
> >=20
> > But it is the most commonly used HDMI-to-CSI bridge, so breaking uAPI is
> > a real concern.
>=20
> Is it really broken?
>=20
> Discussing it with Laurent and Sakari last week, we couldn't find any
> example of a userspace where the media format was set in stone and not
> propagated across the pipeline.
>=20
> The uAPI however is *definitely* broken with unicam right now.
>=20
> > See more in my review comment in the code below.
> >=20
> > > Whilst the pixel format may now be considered to be incorrect,
> > > changing it will break userspace applications that have been using it
> > > for those 10 years if they're explicitly looking for
> > > MEDIA_BUS_FMT_RGB888_1X24 or the mapping of it through to
> > > V4L2_PIX_FMT_RGB24.
> > > The kernel docs at [2] quote Linus as saying
> > > "If you break existing user space setups THAT IS A REGRESSION.
> > > It's not ok to say "but we'll fix the user space setup"
> > > Really. NOT OK."
> > >=20
> > > I'm thinking of GStreamer if the format has been specified explicitly
> > > - it'll fail to negotiate due to v4l2src saying it can't handle the
> > > caps.
> > >=20
> > > Yes it sucks as a situation, but I'm not sure what the best solution
> > > is. Potentially accepting both MEDIA_BUS_FMT_RGB888_1X24 and
> > > MEDIA_BUS_FMT_BGR888_1X24 as valid MBUS codes for RGB, alongside
> > > MEDIA_BUS_FMT_UYVY8_1X16 for UYVY?
> > >=20
> > >   Dave
> > >=20
> > > [1] https://pikvm.org/
> > > [2] https://www.kernel.org/doc/html/latest/process/handling-regressio=
ns.html#quotes-from-linus-about-regression
> > >=20
> > >> Fixes: d32d98642de6 ("[media] Driver for Toshiba TC358743 HDMI to CS=
I-2 bridge")
> > >> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > >> ---
> > >>  drivers/media/i2c/tc358743.c | 10 +++++-----
> > >>  1 file changed, 5 insertions(+), 5 deletions(-)
> > >>
> > >> diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc3587=
43.c
> > >> index ca0b0b9bda1755313f066ba36ab218873b9ae438..a1c164a7716a10b0cb9f=
f38f88c0513b45f24771 100644
> > >> --- a/drivers/media/i2c/tc358743.c
> > >> +++ b/drivers/media/i2c/tc358743.c
> > >> @@ -688,11 +688,11 @@ static void tc358743_set_csi_color_space(struc=
t v4l2_subdev *sd)
> > >>                 mutex_lock(&state->confctl_mutex);
> > >>                 i2c_wr16_and_or(sd, CONFCTL, ~MASK_YCBCRFMT,
> > >>                                 MASK_YCBCRFMT_422_8_BIT);
> > >>                 mutex_unlock(&state->confctl_mutex);
> > >>                 break;
> > >> -       case MEDIA_BUS_FMT_RGB888_1X24:
> > >> +       case MEDIA_BUS_FMT_BGR888_1X24:
> > >>                 v4l2_dbg(2, debug, sd, "%s: RGB 888 24-bit\n", __fun=
c__);
> > >>                 i2c_wr8_and_or(sd, VOUT_SET2,
> > >>                                 ~(MASK_SEL422 | MASK_VOUT_422FIL_100=
) & 0xff,
> > >>                                 0x00);
> > >>                 i2c_wr8_and_or(sd, VI_REP, ~MASK_VOUT_COLOR_SEL & 0x=
ff,
> > >> @@ -1353,11 +1353,11 @@ static int tc358743_log_status(struct v4l2_s=
ubdev *sd)
> > >>                         (i2c_rd16(sd, CSI_STATUS) & MASK_S_HLT) ?
> > >>                         "yes" : "no");
> > >>         v4l2_info(sd, "Color space: %s\n",
> > >>                         state->mbus_fmt_code =3D=3D MEDIA_BUS_FMT_UY=
VY8_1X16 ?
> > >>                         "YCbCr 422 16-bit" :
> > >> -                       state->mbus_fmt_code =3D=3D MEDIA_BUS_FMT_RG=
B888_1X24 ?
> > >> +                       state->mbus_fmt_code =3D=3D MEDIA_BUS_FMT_BG=
R888_1X24 ?
> > >>                         "RGB 888 24-bit" : "Unsupported");
> > >>
> > >>         v4l2_info(sd, "-----%s status-----\n", is_hdmi(sd) ? "HDMI" =
: "DVI-D");
> > >>         v4l2_info(sd, "HDCP encrypted content: %s\n",
> > >>                         hdmi_sys_status & MASK_S_HDCP ? "yes" : "no"=
);
> > >> @@ -1691,11 +1691,11 @@ static int tc358743_enum_mbus_code(struct v4=
l2_subdev *sd,
> > >>                 struct v4l2_subdev_state *sd_state,
> > >>                 struct v4l2_subdev_mbus_code_enum *code)
> > >>  {
> > >>         switch (code->index) {
> > >>         case 0:
> > >> -               code->code =3D MEDIA_BUS_FMT_RGB888_1X24;
> > >> +               code->code =3D MEDIA_BUS_FMT_BGR888_1X24;
> >=20
> > So would this change break or fix the formats[] table in:
> >=20
> > drivers/media/platform/raspberrypi/rp1-cfe/cfe-fmts.h
>=20
> It's pretty much the same table than unicam, and I don't believe it
> does. For both those drivers the pixels are stored in memory in the CSI
> wire order, so the proper format to use is BGR24 for CSI, not RGB24.
>=20
> > Are there other bridge drivers that misinterpret MEDIA_BUS_FMT_RGB888_1=
X24
> > and/or MEDIA_BUS_FMT_RGB888_1X24?
>=20
> Yes, it's kind of a mess.
>=20
> adv748x, ds90ub960 and tc358743 report RGB888, and ov5640 reports
> BGR888.
>=20
> Then we have alvium CSI2 that supports both, and can swap color
> components, so that one isn't a concern.
>=20
> And finally, we have st-mipid02 which is also affected, but is a
> receiver so it's easier to solve.
>=20
> For RGB565, ov5640, mt9m114 and gc2145 are in that list, but the pixel
> representation isn't the same than RGB888, so it's not clear to me how
> they are affected.
>=20
> For RGB666, no v4l2 drivers are affected, but a fair bit of KMS drivers
> that use media bus formats still might.

Can we make some progress on this, one way or another?

Maxime

--k6dm4cewj3qobmxo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaItCAQAKCRAnX84Zoj2+
djwxAX9oiNCwAp5Rv5e4+zQf+6a/zStk7HUhKO7SWqhWWox0c1YGZ0sKUCE5mNku
F1Tx66MBgNO5drBlwCc8Yp3/KKDvY6zqFhSjdViWU5Arb6RF55ZPd/a6dPJ9Dqep
YUUjbqICsg==
=kqak
-----END PGP SIGNATURE-----

--k6dm4cewj3qobmxo--

