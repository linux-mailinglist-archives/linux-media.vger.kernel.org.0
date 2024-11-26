Return-Path: <linux-media+bounces-22084-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CE83A9D988D
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 14:30:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 685E216634D
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 13:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D850DF78;
	Tue, 26 Nov 2024 13:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TEKlSILg"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA063BA49;
	Tue, 26 Nov 2024 13:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732627850; cv=none; b=QrE/oX3k5yJLCA0mccyhEQZGwKTP9KYGpRFax5dP+CNwnzn/trP5j1goWGk+RMgcGoOkke0EbWqlZXwoHakrqhacOcFG3CJrIpQ/ipDapDZjZqPUaUrcgGJapo5poS1V1ol6hOy3YfAKqW1U2yZx1CZe32sIXRV9PlgMj8vIlyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732627850; c=relaxed/simple;
	bh=VjeUj+cky7Pe+HkDXvepWl+udgAVLPd0Kcf4koRoioM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YFy90yu5ZoLR6/uO6CFE61YnGDACz9r82hZXj8Jp7nXffxp0Q2DeIOddHOTJtqz6Vcw5hUUGZrZWaG/OOVAWzYK9rjIEz6aMKt3qKf85MvW2mZWFyCstBNe3cfwWCwcmyudDdAKDdb0/2h52pBWGvxhODz2PH0BHc6Hyhj/sKog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TEKlSILg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:883a:fbdb:56c3:2e5a:271e:2a92])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BF5846BE;
	Tue, 26 Nov 2024 14:30:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732627824;
	bh=VjeUj+cky7Pe+HkDXvepWl+udgAVLPd0Kcf4koRoioM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TEKlSILggbZFvC8Er3OWGeS2XBX+sbaXkAdLtROnLiV/OqXeEAKSjPnNko5cn5z8q
	 aFL/mEY53hpcKWch7LT6dMvhNypA8beWG6ySb4d2KUC648B5hJVaKYobq/ojKdVjK/
	 YOBQBf/yTpSzY+pu+TzO2PKuB42fwnNn2+vqrg2A=
Date: Tue, 26 Nov 2024 19:00:40 +0530
From: Jai Luthra <jai.luthra@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v3 2/3] media: i2c: imx219: make HBLANK r/w to allow
 longer exposures
Message-ID: <22fbl6eyjlruexv3cw7qegs2ekexyxvw5xocuads2eyws22ul7@dlerrm334bhp>
References: <20241125-imx219_fixes-v3-0-434fc0b541c8@ideasonboard.com>
 <20241125-imx219_fixes-v3-2-434fc0b541c8@ideasonboard.com>
 <20241126121640.GE5461@pendragon.ideasonboard.com>
 <CAPY8ntDAnj1uf-fBRbioZSwRm9zO4=e4-E+Rd-PAz0N3cmad-A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="u5of4lnw57pfl5mk"
Content-Disposition: inline
In-Reply-To: <CAPY8ntDAnj1uf-fBRbioZSwRm9zO4=e4-E+Rd-PAz0N3cmad-A@mail.gmail.com>


--u5of4lnw57pfl5mk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 2/3] media: i2c: imx219: make HBLANK r/w to allow
 longer exposures
MIME-Version: 1.0

Hi Dave,

On Nov 26, 2024 at 13:21:27 +0000, Dave Stevenson wrote:
> Hi Laurent
>=20
> On Tue, 26 Nov 2024 at 12:16, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > On Mon, Nov 25, 2024 at 08:36:26PM +0530, Jai Luthra wrote:
> > > From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >
> > > The HBLANK control was read-only, and always configured such
> > > that the sensor HTS register was 3448. This limited the maximum
> > > exposure time that could be achieved to around 1.26 secs.
> > >
> > > Make HBLANK read/write so that the line time can be extended,
> > > and thereby allow longer exposures (and slower frame rates).
> > > Retain the overall HTS setting when changing modes rather than
> > > resetting it to a default.
> > >
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > > ---
> > >  drivers/media/i2c/imx219.c | 37 ++++++++++++++++++++++++-------------
> > >  1 file changed, 24 insertions(+), 13 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > > index f98aad74fe584a18e2fe7126f92bf294762a54e3..970e6362d0ae3a9078daf=
337155e83d637bc1ca1 100644
> > > --- a/drivers/media/i2c/imx219.c
> > > +++ b/drivers/media/i2c/imx219.c
> > > @@ -76,8 +76,10 @@
> > >
> > >  #define IMX219_VBLANK_MIN            32
> > >
> > > -/* HBLANK control - read only */
> > > -#define IMX219_PPL_DEFAULT           3448
> > > +/* HBLANK control range */
> >
> > Just drop the comment, and drop the blank lines, this belongs to the
> > "V_TIMING internal" section.
> >
> > > +#define IMX219_PPL_MIN                       0x0d78
> >
> > Why PPL and not HTS ?
>=20
> The IMX219 datasheet defines the register as LINE_LENGTH_A, with
> comment line_length_pck.
>=20
> HTS is not a term used in the imx219 datasheet, so why introduce it to
> the driver? I'd go along with a rename to LLP if you wish.
> (HTS is more commonly an Omnivision term, not a Sony one).

The FRAME_LENGTH_A register is also named IMX219_REG_VTS in the driver,=20
so I think calling this PPL would be confusing, unless we also rename=20
VTS to something else (frame_length_lines -> so FLL?)

Just my two cents but VTS/HTS is at least instantly parsable to my=20
eyes.. compared to the sony names.

>=20
> > > +#define IMX219_PPL_MAX                       0x7ff0
> > > +#define IMX219_REG_HTS                       CCI_REG16(0x0162)
> >
> > The min/max should go below the register definition.
> >
> > >
> > >  #define IMX219_REG_LINE_LENGTH_A     CCI_REG16(0x0162)
> > >  #define IMX219_REG_X_ADD_STA_A               CCI_REG16(0x0164)
> > > @@ -422,6 +424,10 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctr=
l)
> > >               cci_write(imx219->regmap, IMX219_REG_VTS,
> > >                         format->height + ctrl->val, &ret);
> > >               break;
> > > +     case V4L2_CID_HBLANK:
> > > +             cci_write(imx219->regmap, IMX219_REG_HTS,
> > > +                       format->width + ctrl->val, &ret);
> > > +             break;
> > >       case V4L2_CID_TEST_PATTERN_RED:
> > >               cci_write(imx219->regmap, IMX219_REG_TESTP_RED,
> > >                         ctrl->val, &ret);
> > > @@ -496,12 +502,10 @@ static int imx219_init_controls(struct imx219 *=
imx219)
> > >                                          V4L2_CID_VBLANK, IMX219_VBLA=
NK_MIN,
> > >                                          IMX219_VTS_MAX - mode->heigh=
t, 1,
> > >                                          mode->vts_def - mode->height=
);
> > > -     hblank =3D IMX219_PPL_DEFAULT - mode->width;
> > > +     hblank =3D IMX219_PPL_MIN - mode->width;
> > >       imx219->hblank =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_op=
s,
> > >                                          V4L2_CID_HBLANK, hblank, hbl=
ank,
> >
> > The minimum and maximum are identical, is this intentional ?
>=20
> The limits should be updated when the format is set, so the values
> shouldn't matter when created. However I'd want to check that did
> happen seeing as vblank computes the limits here.
> It is as easy to set them correctly here too (max =3D IMX219_PPL_MAX -
> mode->width), so you may as well.
>=20
> > >                                          1, hblank);
> > > -     if (imx219->hblank)
> > > -             imx219->hblank->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> > >       exposure_max =3D mode->vts_def - 4;
> > >       exposure_def =3D (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
> > >               exposure_max : IMX219_EXPOSURE_DEFAULT;
> > > @@ -817,6 +821,10 @@ static int imx219_set_pad_format(struct v4l2_sub=
dev *sd,
> > >       struct v4l2_mbus_framefmt *format;
> > >       struct v4l2_rect *crop;
> > >       unsigned int bin_h, bin_v;
> > > +     u32 prev_hts;
> > > +
> > > +     format =3D v4l2_subdev_state_get_format(state, 0);
> > > +     prev_hts =3D format->width + imx219->hblank->val;
> > >
> > >       mode =3D v4l2_find_nearest_size(supported_modes,
> > >                                     ARRAY_SIZE(supported_modes),
> > > @@ -824,8 +832,6 @@ static int imx219_set_pad_format(struct v4l2_subd=
ev *sd,
> > >                                     fmt->format.width, fmt->format.he=
ight);
> > >
> > >       imx219_update_pad_format(imx219, mode, &fmt->format, fmt->forma=
t.code);
> > > -
> > > -     format =3D v4l2_subdev_state_get_format(state, 0);
> > >       *format =3D fmt->format;
> > >
> > >       /*
> > > @@ -861,13 +867,18 @@ static int imx219_set_pad_format(struct v4l2_su=
bdev *sd,
> > >                                        exposure_max, imx219->exposure=
->step,
> > >                                        exposure_def);
> > >               /*
> > > -              * Currently PPL is fixed to IMX219_PPL_DEFAULT, so hbl=
ank
> > > -              * depends on mode->width only, and is not changeble in=
 any
> > > -              * way other than changing the mode.
> > > +              * Retain PPL setting from previous mode so that the
> >
> > Rename PPL to HTS here too.
>=20
> Disagree as above. The local variable here should be renamed prev_ppl
> or prev_llp.
>=20
>   Dave
>=20
> > > +              * line time does not change on a mode change.
> > > +              * Limits have to be recomputed as the controls define
> > > +              * the blanking only, so PPL values need to have the
> > > +              * mode width subtracted.
> > >                */
> > > -             hblank =3D IMX219_PPL_DEFAULT - mode->width;
> > > -             __v4l2_ctrl_modify_range(imx219->hblank, hblank, hblank=
, 1,
> > > -                                      hblank);
> > > +             hblank =3D prev_hts - mode->width;
> > > +             __v4l2_ctrl_modify_range(imx219->hblank,
> > > +                                      IMX219_PPL_MIN - mode->width,
> > > +                                      IMX219_PPL_MAX - mode->width,
> > > +                                      1, IMX219_PPL_MIN - mode->widt=
h);
> > > +             __v4l2_ctrl_s_ctrl(imx219->hblank, hblank);
> > >       }
> > >
> > >       return 0;
> > >
> >
> > --
> > Regards,
> >
> > Laurent Pinchart

Thanks,
Jai

--u5of4lnw57pfl5mk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmdFzX8ACgkQQ96R+SSa
cUWj0hAAqroFVMf464vTWwDcN/o8mFwibZ9aZwRr20/xZzkHCO87N2aI9TJU6z+v
CGKopAwQF8XnRd0SNj2i6XJ6vOc+pHDbo3Hrr5JbKhqI1UVU72V6XuZ1XVV0g5MR
wQMvYe50VJ75L2j133jeSnPZcrcN2gv3XlFiHe9TvRlPVltpj8nlnrlvbffA0YUZ
E70YcAOTFO/74DyIfF15zV/ElBhUBcm8LG0CICIdJDEbjNcPOa4cq2Tuj59nV+A/
yAWxTTUlmnrerW8jnZuoIEeJx0pj/w/WJRYWbdSeYLoNyWp4AoF3vyS7RSpcLeO1
v2sbIq6PnRCUyKkj/t2JSjzAmX+6enrY6R3rPgmUySspHJVEAoPjdiDHX+1OzNy3
BYzsiD+GDNZcu2LXug6Sw4f3MUgVz/PlN7X7rlNUrPVVRuLgQSMjLuFaRRZMDZEN
0EgK54YYXCkxhycPiviaA4zFU4Puqaj8an/vQmx5ZWQDKv0iZMd09S6nL1xuDOF3
urQ8muk54ag9X2rMbuo9yiqrGQDDY0ePWlIR00b+sisBrLenr2oNICJHV1XRO7rq
8UAWFL7jSzCeKNJbIl9QrBWi7BZNis2V1ocUzBC7aAHG4I8A5cphgoKHVveo3At6
9INt1N3quEHY7WJ9WOmRv7CMeA2Ogynn1uqmQh7wUl8ApQ7T0rM=
=NgXV
-----END PGP SIGNATURE-----

--u5of4lnw57pfl5mk--

