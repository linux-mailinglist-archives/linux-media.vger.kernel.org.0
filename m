Return-Path: <linux-media+bounces-40224-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5D1B2BA21
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 09:05:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDBAE169593
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 07:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B8AC26CE12;
	Tue, 19 Aug 2025 07:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="G254xaAt"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF991DA3D;
	Tue, 19 Aug 2025 07:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755587097; cv=none; b=S0rGkkg86XWJV323s1wlXUs6fMfQFeRGiOWWiaoiGHMPVcnVNpWvjHaZvrJKVzYfSioWlwajP9ixRWtDBbojitiTSKTm3t6zOa1sNjSnWKT/VFZfrP2pHCnf5LD6xs253rH2Kg85YSfUmX6hJUq9y+oQTyCCq/yJIzBvb3RdoQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755587097; c=relaxed/simple;
	bh=EY4dcCa82N1pfu8mcLUFaTiu+NXfFugnQSnISbf+19Q=;
	h=Content-Type:MIME-Version:Content-Disposition:In-Reply-To:
	 References:Subject:From:Cc:To:Date:Message-ID; b=f8GGT2vynFmPEFb/FYVGCZKSQm7VvSAdJKFTSZK734BioR/qIb39O7S7xVSd0GmcbFTEERuplDVWLWkKKX7Iyhra5dOnXSVjkL0PHr+EdCE6lREGPI1gu9mq7qDFIZOtGMjMr1ukj0fFKNV186Gp+/X0AmxmGYVteZLVWCVF4+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=G254xaAt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [223.190.80.157])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 53F8B596;
	Tue, 19 Aug 2025 09:03:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755587035;
	bh=EY4dcCa82N1pfu8mcLUFaTiu+NXfFugnQSnISbf+19Q=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=G254xaAtDUXHMqy3UM6yFjldqGZutrbG2tJqjs9uAzJAc6TtuBJ8oyorKnqSB/IlL
	 jLYxaLhXQ8KQxnMLGkwkU2Ex+jqNGJL30gZrTcoCI1k1bCVh3tcxsP9+Cibj0bD3Hk
	 2iJVrgwAIsLipx9hRKfaoxtcDdyvxCCIsXsQ8e6w=
Content-Type: multipart/signed; micalg="pgp-sha512"; protocol="application/pgp-signature"; boundary="===============1922544961252460224=="
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <175507897155.560048.8971835015591511326@ping.linuxembedded.co.uk>
References: <20250813-imx335_binning-v1-0-a42b687d8541@ideasonboard.com> <20250813-imx335_binning-v1-6-a42b687d8541@ideasonboard.com> <175507897155.560048.8971835015591511326@ping.linuxembedded.co.uk>
Subject: Re: [PATCH 6/6] media: imx335: Support 2x2 binning
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
To: Kieran Bingham <kieran.bingham@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Tue, 19 Aug 2025 12:34:39 +0530
Message-ID: <175558707934.8696.2656831519669631310@freya>
User-Agent: alot/0.12.dev28+gd2c823fe

--===============1922544961252460224==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Kieran,

Thanks for the review!

Quoting Kieran Bingham (2025-08-13 15:26:11)
> Quoting Jai Luthra (2025-08-13 08:20:37)
> > Introduce 2x2 binning mode (1312x972@60fps). Since there are multiple
> > modes now, use v4l2_find_nearest_size() to select the appropriate mode
> > in .set_fmt().
> >=20
> > For 2x2 binning the minimum shutter value supported is 17 instead of 9.
> > This effects the maximum allowed exposure time, and if not enforced then
> > the sensor produces very dark frames when the minimum shutter limit is
> > violated.
> >=20
> > Lastly, update the crop size reported to the userspace. When trying 2x2
> > binning with the datasheet suggested pixel array size (i.e. 2592 / 2 =
=3D>
> > 1296), on some platforms (Raspberry Pi 5) artefacts are introduced on
>=20
> It was visible on i.MX8MP too. I look forward to testing this update on
> my platform!
>
> > the right edge of the output image. Instead, using a higher width of
> > 1312 works fine on all platforms.
> >=20
> > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > ---
> >  drivers/media/i2c/imx335.c | 274 +++++++++++++++++++++++++++++++++++--=
--------
> >  1 file changed, 217 insertions(+), 57 deletions(-)
> >=20
> > diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
> > index df1535927f481de3a0d043ac9be24b9336ea8f7f..24d26bc6260bf60ca73df81=
fe398121ac9371b42 100644
> > --- a/drivers/media/i2c/imx335.c
> > +++ b/drivers/media/i2c/imx335.c
> > @@ -35,6 +35,7 @@
> > =20
> >  /* Lines per frame */
> >  #define IMX335_REG_VMAX                        CCI_REG24_LE(0x3030)
> > +#define IMX335_REG_HMAX                        CCI_REG16_LE(0x3034)
> > =20
> >  #define IMX335_REG_OPB_SIZE_V          CCI_REG8(0x304c)
> >  #define IMX335_REG_ADBIT               CCI_REG8(0x3050)
> > @@ -42,10 +43,13 @@
> > =20
> >  #define IMX335_REG_SHUTTER             CCI_REG24_LE(0x3058)
> >  #define IMX335_EXPOSURE_MIN            1
> > -#define IMX335_EXPOSURE_OFFSET         9
> > +#define IMX335_SHUTTER_MIN             9
> > +#define IMX335_SHUTTER_MIN_BINNED      17
> >  #define IMX335_EXPOSURE_STEP           1
> >  #define IMX335_EXPOSURE_DEFAULT                0x0648
> > =20
> > +#define IMX335_REG_AREA2_WIDTH_1       CCI_REG16_LE(0x3072)
> > +
>=20
> Ohh what's the distinction between Area2 and Area3 ? (I should probably
> jsut open the datasheet to answer that myself ...)
>=20

From what I understood, Area3 is for the active cropping region, and Area2
is for the OB (Optical black) region. The tables recommend different values
for this register (48 for binning, 40 for all-pixel) and the diagrams on
pg. 56 and 59 show the vertical effective OB reduce by 8 from normal to 2x2
binned mode.

Why a smaller OB region is needed for binned mode is something I don't
understand.

> >  #define IMX335_REG_AREA3_ST_ADR_1      CCI_REG16_LE(0x3074)
> >  #define IMX335_REG_AREA3_WIDTH_1       CCI_REG16_LE(0x3076)
> > =20
> > @@ -126,9 +130,9 @@
> >  /* IMX335 native and active pixel array size. */
> >  #define IMX335_NATIVE_WIDTH            2696U
> >  #define IMX335_NATIVE_HEIGHT           2044U
> > -#define IMX335_PIXEL_ARRAY_LEFT                52U
> > +#define IMX335_PIXEL_ARRAY_LEFT                36U
> >  #define IMX335_PIXEL_ARRAY_TOP         50U
> > -#define IMX335_PIXEL_ARRAY_WIDTH       2592U
> > +#define IMX335_PIXEL_ARRAY_WIDTH       2624U
> >  #define IMX335_PIXEL_ARRAY_HEIGHT      1944U
>=20
> Should these changes have been in the earlier "Update the native pixel
> array width" patch?
>=20

Well, I wasn't sure if it is okay to update the CROP_BOUNDS/CROP_DEFAULT
selection targets before the driver actually supports a mode with a bigger
crop rectangle - which is introduced by this patch.

Does userspace/libcamera require the cropping bounds for some calculation?

> > =20
> >  /**
> > @@ -147,8 +151,14 @@ static const char * const imx335_supply_name[] =3D=
 {
> >         "dvdd", /* Digital Core (1.2V) supply */
> >  };
> > =20
> > +enum imx335_scan_mode {
> > +       IMX335_ALL_PIXEL,
> > +       IMX335_2_2_BINNING,
> > +};
> > +
> >  /**
> >   * struct imx335_mode - imx335 sensor mode structure
> > + * @scan_mode: Configuration scan mode (All pixel / 2x2Binning)
> >   * @width: Frame width
> >   * @height: Frame height
> >   * @code: Format code
> > @@ -162,6 +172,7 @@ static const char * const imx335_supply_name[] =3D {
> >   * @vflip_inverted: Register list vflip (inverted readout)
> >   */
> >  struct imx335_mode {
> > +       enum imx335_scan_mode scan_mode;
> >         u32 width;
> >         u32 height;
> >         u32 code;
> > @@ -263,12 +274,33 @@ static const struct cci_reg_sequence mode_2592x19=
44_regs[] =3D {
> >         { IMX335_REG_MODE_SELECT, IMX335_MODE_STANDBY },
> >         { IMX335_REG_MASTER_MODE, 0x00 },
> >         { IMX335_REG_WINMODE, 0x04 },
> > +       { IMX335_REG_HMAX, 550 },
>=20
> Is this more related to the media: imx335: Update HBLANK range on mode
> change patch too?
>=20
> Or perhaps distinct on it's own? If this isn't the default value perhaps
> it needs a separate commit message explaining it.
>=20

I believe this change is related, but distinct from the userspace hblank
control update in that previous patch.

The 1312x972 mode sets HMAX =3D 275 for 60fps operation. The default mode
(and default power on value) is HMAX =3D 550 for 30fps operation.

> If HMAX is only 550 - is it in some clock specific unit ? But I'm not
> too worried about that until we want variable HBLANK.

Yes, HMAX is some kind of a clock unit for horizontal period as the
datasheet mentions on pg. 70 that 1 XHS period =3D HMAX / 74.25us

Will look more into it if/when we want variable hblank.

>=20
>=20
> >         { IMX335_REG_HTRIMMING_START, 48 },
> >         { IMX335_REG_HNUM, 2592 },
> >         { IMX335_REG_Y_OUT_SIZE, 1944 },
> > +       { IMX335_REG_AREA2_WIDTH_1, 40 },
> >         { IMX335_REG_AREA3_WIDTH_1, 3928 },
> >         { IMX335_REG_OPB_SIZE_V, 0 },
> >         { IMX335_REG_XVS_XHS_DRV, 0x00 },
> > +};
> > +
> > +static const struct cci_reg_sequence mode_1312x972_regs[] =3D {
> > +       { IMX335_REG_MODE_SELECT, IMX335_MODE_STANDBY },
> > +       { IMX335_REG_MASTER_MODE, 0x00 },
> > +       { IMX335_REG_WINMODE, 0x01 },
> > +       { IMX335_REG_HMAX, 275 },
> > +       { IMX335_REG_HTRIMMING_START, 48 },
> > +       { IMX335_REG_HNUM, 2600 },
> > +       { IMX335_REG_Y_OUT_SIZE, 972 },
> > +       { IMX335_REG_AREA2_WIDTH_1, 48 },
> > +       { IMX335_REG_AREA3_WIDTH_1, 3936 },
> > +       { IMX335_REG_OPB_SIZE_V, 0 },
> > +       { IMX335_REG_XVS_XHS_DRV, 0x00 },
> > +       { CCI_REG8(0x3300), 1 }, /* TCYCLE */
> > +       { CCI_REG8(0x3199), 0x30 }, /* HADD/VADD */
> > +};
> > +
> > +static const struct cci_reg_sequence imx335_common_regs[] =3D {
> >         { CCI_REG8(0x3288), 0x21 },
> >         { CCI_REG8(0x328a), 0x02 },
> >         { CCI_REG8(0x3414), 0x05 },
> > @@ -359,16 +391,72 @@ static const struct cci_reg_sequence mode_2592x19=
44_vflip_inverted[] =3D {
> >         { CCI_REG16_LE(0x3116), 0x002 },
> >  };
> > =20
> > -static const struct cci_reg_sequence raw10_framefmt_regs[] =3D {
> > -       { IMX335_REG_ADBIT, 0x00 },
> > -       { IMX335_REG_MDBIT, 0x00 },
> > -       { IMX335_REG_ADBIT1, 0x1ff },
> > +static const struct cci_reg_sequence mode_1312x972_vflip_normal[] =3D {
> > +       { IMX335_REG_AREA3_ST_ADR_1, 176 },
> > +
> > +       /* Undocumented */
> > +       { CCI_REG8(0x3078), 0x04 },
> > +       { CCI_REG8(0x3079), 0xfd },
> > +       { CCI_REG8(0x307a), 0x04 },
> > +       { CCI_REG8(0x307b), 0xfe },
> > +       { CCI_REG8(0x307c), 0x04 },
> > +       { CCI_REG8(0x307d), 0xfb },
> > +       { CCI_REG8(0x307e), 0x04 },
> > +       { CCI_REG8(0x307f), 0x02 },
>=20
> That set are common to both modes.

Will fix in v2.

>=20
> > +       { CCI_REG8(0x3080), 0x04, },
> > +       { CCI_REG8(0x3081), 0xfd, },
> > +       { CCI_REG8(0x3082), 0x04, },
> > +       { CCI_REG8(0x3083), 0xfe, },
> > +       { CCI_REG8(0x3084), 0x04, },
> > +       { CCI_REG8(0x3085), 0xfb, },
> > +       { CCI_REG8(0x3086), 0x04, },
> > +       { CCI_REG8(0x3087), 0x02, },
>=20
> These are a suspicious mix of switching between 0xfc,0xfd,
> 0x02,0x03,0x04,0x05... but I haven't spent enough time to analyse what
> the pattern or underlying meaning could be yet.
>=20
> > +       { CCI_REG8(0x30a4), 0x77, },
> > +       { CCI_REG8(0x30a8), 0x20, },
> > +       { CCI_REG8(0x30a9), 0x00, },
> > +       { CCI_REG8(0x30ac), 0x08, },
> > +       { CCI_REG8(0x30ad), 0x08, },
> > +       { CCI_REG8(0x30b0), 0x20, },
> > +       { CCI_REG8(0x30b1), 0x00, },
> > +       { CCI_REG8(0x30b4), 0x10, },
> > +       { CCI_REG8(0x30b5), 0x10, },
>=20
> It's a lot of churn for a flipped scan out ... But codifying just the
> differences without knowing the underlying meaning of those registers
> probably isn't worth the effort at the moment.
>=20
> So I think keeping these tables is unfortunately the sanest thing to do
> for now.
>=20

Yeah unfortunately we don't even know the names of these registers, just
the values to use :(

> > +       { CCI_REG16_LE(0x30b6), 0x00 },
> > +       { CCI_REG16_LE(0x3112), 0x10 },
> > +       { CCI_REG16_LE(0x3116), 0x10 },
> >  };
> > =20
> > -static const struct cci_reg_sequence raw12_framefmt_regs[] =3D {
> > -       { IMX335_REG_ADBIT, 0x01 },
> > -       { IMX335_REG_MDBIT, 0x01 },
> > -       { IMX335_REG_ADBIT1, 0x47 },
> > +static const struct cci_reg_sequence mode_1312x972_vflip_inverted[] =
=3D {
> > +       { IMX335_REG_AREA3_ST_ADR_1, 4112 },
> > +
> > +       /* Undocumented */
> > +       { CCI_REG8(0x3078), 0x04 },
> > +       { CCI_REG8(0x3079), 0xfd },
> > +       { CCI_REG8(0x307a), 0x04 },
> > +       { CCI_REG8(0x307b), 0xfe },
> > +       { CCI_REG8(0x307c), 0x04 },
> > +       { CCI_REG8(0x307d), 0xfb },
> > +       { CCI_REG8(0x307e), 0x04 },
> > +       { CCI_REG8(0x307f), 0x02 },
> > +       { CCI_REG8(0x3080), 0xfc, },
> > +       { CCI_REG8(0x3081), 0x05, },
> > +       { CCI_REG8(0x3082), 0xfc, },
> > +       { CCI_REG8(0x3083), 0x02, },
> > +       { CCI_REG8(0x3084), 0xfc, },
> > +       { CCI_REG8(0x3085), 0x03, },
> > +       { CCI_REG8(0x3086), 0xfc, },
> > +       { CCI_REG8(0x3087), 0xfe, },
> > +       { CCI_REG8(0x30a4), 0x77, },
> > +       { CCI_REG8(0x30a8), 0x20, },
> > +       { CCI_REG8(0x30a9), 0x00, },
> > +       { CCI_REG8(0x30ac), 0x08, },
> > +       { CCI_REG8(0x30ad), 0x78, },
> > +       { CCI_REG8(0x30b0), 0x20, },
> > +       { CCI_REG8(0x30b1), 0x00, },
> > +       { CCI_REG8(0x30b4), 0x10, },
> > +       { CCI_REG8(0x30b5), 0x70, },
>=20
> > +       { CCI_REG16_LE(0x30b6), 0x01f2 },
> > +       { CCI_REG16_LE(0x3112), 0x10 },
> > +       { CCI_REG16_LE(0x3116), 0x02 },
>=20
> More of a discussion point ...=20
> but should we write these as 0x0010 ? / 0x002 ?

Sounds better to me, will fix in v2.

>=20
> >  };
> > =20
> >  static const struct cci_reg_sequence mipi_data_rate_1188Mbps[] =3D {
> > @@ -433,25 +521,49 @@ static const u32 imx335_mbus_codes[] =3D {
> >  };
> > =20
> >  /* Supported sensor mode configurations */
> > -static const struct imx335_mode supported_mode =3D {
> > -       .width =3D 2592,
> > -       .height =3D 1944,
> > -       .hblank =3D 342,
> > -       .vblank =3D 2556,
> > -       .vblank_min =3D 2556,
> > -       .vblank_max =3D 133060,
> > -       .pclk =3D 396000000,
> > -       .reg_list =3D {
> > -               .num_of_regs =3D ARRAY_SIZE(mode_2592x1944_regs),
> > -               .regs =3D mode_2592x1944_regs,
> > -       },
> > -       .vflip_normal =3D {
> > -               .num_of_regs =3D ARRAY_SIZE(mode_2592x1944_vflip_normal=
),
> > -               .regs =3D mode_2592x1944_vflip_normal,
> > -       },
> > -       .vflip_inverted =3D {
> > -               .num_of_regs =3D ARRAY_SIZE(mode_2592x1944_vflip_invert=
ed),
> > -               .regs =3D mode_2592x1944_vflip_inverted,
> > +static const struct imx335_mode supported_modes[] =3D {
> > +       {
> > +               .scan_mode =3D IMX335_ALL_PIXEL,
> > +               .width =3D 2592,
> > +               .height =3D 1944,
> > +               .hblank =3D 342,
> > +               .vblank =3D 2556,
> > +               .vblank_min =3D 2556,
> > +               .vblank_max =3D 133060,
> > +               .pclk =3D 396000000,
> > +               .reg_list =3D {
> > +                       .num_of_regs =3D ARRAY_SIZE(mode_2592x1944_regs=
),
> > +                       .regs =3D mode_2592x1944_regs,
> > +               },
> > +               .vflip_normal =3D {
> > +                       .num_of_regs =3D ARRAY_SIZE(mode_2592x1944_vfli=
p_normal),
> > +                       .regs =3D mode_2592x1944_vflip_normal,
> > +               },
> > +               .vflip_inverted =3D {
> > +                       .num_of_regs =3D ARRAY_SIZE(mode_2592x1944_vfli=
p_inverted),
> > +                       .regs =3D mode_2592x1944_vflip_inverted,
> > +               }
> > +       }, {
> > +               .scan_mode =3D IMX335_2_2_BINNING,
> > +               .width =3D 1312,
> > +               .height =3D 972,
> > +               .hblank =3D 155,
> > +               .vblank =3D 3528,
> > +               .vblank_min =3D 3528,
> > +               .vblank_max =3D 133060,
> > +               .pclk =3D 396000000,
> > +               .reg_list =3D {
> > +                       .num_of_regs =3D ARRAY_SIZE(mode_1312x972_regs),
> > +                       .regs =3D mode_1312x972_regs,
> > +               },
> > +               .vflip_normal =3D {
> > +                       .num_of_regs =3D ARRAY_SIZE(mode_1312x972_vflip=
_normal),
> > +                       .regs =3D mode_1312x972_vflip_normal,
> > +               },
> > +               .vflip_inverted =3D {
> > +                       .num_of_regs =3D ARRAY_SIZE(mode_1312x972_vflip=
_inverted),
> > +                       .regs =3D mode_1312x972_vflip_inverted,
> > +               },
> >         },
> >  };
> > =20
> > @@ -608,18 +720,22 @@ static int imx335_set_ctrl(struct v4l2_ctrl *ctrl)
> > =20
> >         /* Propagate change of current control to all related controls =
*/
> >         if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> > +               u32 shutter_min =3D IMX335_SHUTTER_MIN;
> > +               u32 lpfr;
> > +
> >                 imx335->vblank =3D imx335->vblank_ctrl->val;
> > +               lpfr =3D imx335->vblank + imx335->cur_mode->height;
> > =20
> >                 dev_dbg(imx335->dev, "Received vblank %u, new lpfr %u\n=
",
> > -                       imx335->vblank,
> > -                       imx335->vblank + imx335->cur_mode->height);
> > +                       imx335->vblank, lpfr);
> > +
> > +               if (imx335->cur_mode->scan_mode =3D=3D IMX335_2_2_BINNI=
NG)
> > +                       shutter_min =3D IMX335_SHUTTER_MIN_BINNED;
> > =20
> >                 ret =3D __v4l2_ctrl_modify_range(imx335->exp_ctrl,
> >                                                IMX335_EXPOSURE_MIN,
> > -                                              imx335->vblank +
> > -                                              imx335->cur_mode->height=
 -
> > -                                              IMX335_EXPOSURE_OFFSET,
> > -                                              1, IMX335_EXPOSURE_DEFAU=
LT);
> > +                                              lpfr - shutter_min, 1,
> > +                                              IMX335_EXPOSURE_DEFAULT);
> >                 if (ret)
> >                         return ret;
> >         }
> > @@ -719,17 +835,16 @@ static int imx335_enum_frame_size(struct v4l2_sub=
dev *sd,
> >         struct imx335 *imx335 =3D to_imx335(sd);
> >         u32 code;
> > =20
> > -       /* Only a single supported_mode available. */
> > -       if (fsize->index > 0)
> > +       if (fsize->index >=3D ARRAY_SIZE(supported_modes))
> >                 return -EINVAL;
> > =20
> >         code =3D imx335_get_format_code(imx335, fsize->code);
> >         if (fsize->code !=3D code)
> >                 return -EINVAL;
> > =20
> > -       fsize->min_width =3D supported_mode.width;
> > +       fsize->min_width =3D supported_modes[fsize->index].width;
> >         fsize->max_width =3D fsize->min_width;
> > -       fsize->min_height =3D supported_mode.height;
> > +       fsize->min_height =3D supported_modes[fsize->index].height;
> >         fsize->max_height =3D fsize->min_height;
> > =20
> >         return 0;
> > @@ -771,9 +886,13 @@ static int imx335_set_pad_format(struct v4l2_subde=
v *sd,
> >         struct imx335 *imx335 =3D to_imx335(sd);
> >         struct v4l2_mbus_framefmt *format;
> >         const struct imx335_mode *mode;
> > +       struct v4l2_rect *crop;
> >         int i, ret =3D 0;
> > =20
> > -       mode =3D &supported_mode;
> > +       mode =3D v4l2_find_nearest_size(supported_modes,
> > +                                     ARRAY_SIZE(supported_modes),
> > +                                     width, height,
> > +                                     fmt->format.width, fmt->format.he=
ight);
> > =20
> >         for (i =3D 0; i < ARRAY_SIZE(imx335_mbus_codes); i++) {
> >                 if (imx335_mbus_codes[i] =3D=3D fmt->format.code)
> > @@ -785,6 +904,16 @@ static int imx335_set_pad_format(struct v4l2_subde=
v *sd,
> >         format =3D v4l2_subdev_state_get_format(sd_state, fmt->pad);
> >         *format =3D fmt->format;
> > =20
> > +       crop =3D v4l2_subdev_state_get_crop(sd_state, fmt->pad);
> > +       crop->width =3D fmt->format.width;
> > +       crop->height =3D fmt->format.height;
> > +       if (mode->scan_mode =3D=3D IMX335_2_2_BINNING) {
> > +               crop->width *=3D 2;
> > +               crop->height *=3D 2;
> > +       }
> > +       crop->left =3D (IMX335_NATIVE_WIDTH - crop->width) / 2;
> > +       crop->top =3D (IMX335_NATIVE_HEIGHT - crop->height) / 2;
> > +
> >         if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE) {
> >                 ret =3D imx335_update_controls(imx335, mode);
> >                 if (!ret)
> > @@ -808,7 +937,7 @@ static int imx335_init_state(struct v4l2_subdev *sd,
> >         struct v4l2_subdev_format fmt =3D { 0 };
> > =20
> >         fmt.which =3D sd_state ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_F=
ORMAT_ACTIVE;
> > -       imx335_fill_pad_format(imx335, &supported_mode, &fmt);
> > +       imx335_fill_pad_format(imx335, &supported_modes[0], &fmt);
> > =20
> >         __v4l2_ctrl_modify_range(imx335->link_freq_ctrl, 0,
> >                                  __fls(imx335->link_freq_bitmap),
> > @@ -831,6 +960,11 @@ static int imx335_get_selection(struct v4l2_subdev=
 *sd,
> >                                 struct v4l2_subdev_selection *sel)
> >  {
> >         switch (sel->target) {
> > +       case V4L2_SEL_TGT_CROP:
> > +               sel->r =3D *v4l2_subdev_state_get_crop(sd_state, 0);
> > +
> > +               return 0;
> > +
> >         case V4L2_SEL_TGT_NATIVE_SIZE:
> >                 sel->r.top =3D 0;
> >                 sel->r.left =3D 0;
> > @@ -839,7 +973,6 @@ static int imx335_get_selection(struct v4l2_subdev =
*sd,
> > =20
> >                 return 0;
> > =20
> > -       case V4L2_SEL_TGT_CROP:
> >         case V4L2_SEL_TGT_CROP_DEFAULT:
> >         case V4L2_SEL_TGT_CROP_BOUNDS:
> >                 sel->r.top =3D IMX335_PIXEL_ARRAY_TOP;
> > @@ -855,19 +988,35 @@ static int imx335_get_selection(struct v4l2_subde=
v *sd,
> > =20
> >  static int imx335_set_framefmt(struct imx335 *imx335)
> >  {
> > -       switch (imx335->cur_mbus_code) {
> > -       case MEDIA_BUS_FMT_SRGGB10_1X10:
> > -               return cci_multi_reg_write(imx335->cci, raw10_framefmt_=
regs,
> > -                                          ARRAY_SIZE(raw10_framefmt_re=
gs),
> > -                                          NULL);
> > -
> > -       case MEDIA_BUS_FMT_SRGGB12_1X12:
> > -               return cci_multi_reg_write(imx335->cci, raw12_framefmt_=
regs,
> > -                                          ARRAY_SIZE(raw12_framefmt_re=
gs),
> > -                                          NULL);
> > +       /*
> > +        * In the all-pixel scan mode the AD conversion shall match the=
 output
> > +        * bit width requested.
> > +        *
> > +        * However, when 2/2 binning is enabled, the AD conversion is a=
lways
> > +        * 10-bit, so we ensure ADBIT is clear and ADBIT1 is assigned 0=
x1ff.
> > +        * That's as much as the documentation gives us...
> > +        */
> > +       int ret =3D 0;
> > +       u8 bpp =3D imx335->cur_mbus_code =3D=3D MEDIA_BUS_FMT_SRGGB10_1=
X10 ? 10 : 12;
> > +       u8 ad_conv =3D bpp;
> > +
> > +       /* Start with the output mode */
> > +       cci_write(imx335->cci, IMX335_REG_MDBIT, bpp =3D=3D 12, &ret);
> > +
> > +       /* Enforce 10 bit AD on binning modes */
> > +       if (imx335->cur_mode->scan_mode =3D=3D IMX335_2_2_BINNING)
> > +               ad_conv =3D 10;
> > +
> > +       /* AD Conversion configuration */
> > +       if (ad_conv =3D=3D 10) {
> > +               cci_write(imx335->cci, IMX335_REG_ADBIT, 0x00, &ret);
> > +               cci_write(imx335->cci, IMX335_REG_ADBIT1, 0x1ff, &ret);
> > +       } else { /* 12 bit AD Conversion */
> > +               cci_write(imx335->cci, IMX335_REG_ADBIT, 0x01, &ret);
> > +               cci_write(imx335->cci, IMX335_REG_ADBIT1, 0x47, &ret);
> >         }
> > =20
> > -       return -EINVAL;
> > +       return ret;
> >  }
> > =20
> >  /**
> > @@ -903,6 +1052,14 @@ static int imx335_start_streaming(struct imx335 *=
imx335)
> >                 goto err_rpm_put;
> >         }
> > =20
> > +       /* Write sensor common registers */
> > +       ret =3D cci_multi_reg_write(imx335->cci, imx335_common_regs,
> > +                                 ARRAY_SIZE(imx335_common_regs), NULL);
> > +       if (ret) {
> > +               dev_err(imx335->dev, "fail to write initial registers\n=
");
> > +               goto err_rpm_put;
> > +       }
> > +
> >         ret =3D imx335_set_framefmt(imx335);
> >         if (ret) {
> >                 dev_err(imx335->dev, "%s failed to set frame format: %d=
\n",
> > @@ -1186,7 +1343,7 @@ static int imx335_init_controls(struct imx335 *im=
x335)
> >         struct v4l2_ctrl_handler *ctrl_hdlr =3D &imx335->ctrl_handler;
> >         const struct imx335_mode *mode =3D imx335->cur_mode;
> >         struct v4l2_fwnode_device_properties props;
> > -       u32 lpfr;
> > +       u32 lpfr, shutter_min;
> >         int ret;
> > =20
> >         ret =3D v4l2_fwnode_device_parse(imx335->dev, &props);
> > @@ -1200,11 +1357,14 @@ static int imx335_init_controls(struct imx335 *=
imx335)
> > =20
> >         /* Initialize exposure and gain */
> >         lpfr =3D mode->vblank + mode->height;
> > +       shutter_min =3D IMX335_SHUTTER_MIN;
> > +       if (mode->scan_mode =3D=3D IMX335_2_2_BINNING)
> > +               shutter_min =3D IMX335_SHUTTER_MIN_BINNED;
> >         imx335->exp_ctrl =3D v4l2_ctrl_new_std(ctrl_hdlr,
> >                                              &imx335_ctrl_ops,
> >                                              V4L2_CID_EXPOSURE,
> >                                              IMX335_EXPOSURE_MIN,
> > -                                            lpfr - IMX335_EXPOSURE_OFF=
SET,
> > +                                            lpfr - shutter_min,
> >                                              IMX335_EXPOSURE_STEP,
> >                                              IMX335_EXPOSURE_DEFAULT);
> > =20
> > @@ -1331,7 +1491,7 @@ static int imx335_probe(struct i2c_client *client)
> >         }
> > =20
> >         /* Set default mode to max resolution */
> > -       imx335->cur_mode =3D &supported_mode;
> > +       imx335->cur_mode =3D &supported_modes[0];
> >         imx335->cur_mbus_code =3D imx335_mbus_codes[0];
> >         imx335->vblank =3D imx335->cur_mode->vblank;
> > =20
> >=20
> > --=20
> > 2.50.1
> >
--===============1922544961252460224==
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Description: signature
Content-Type: application/pgp-signature; name="signature.asc"; charset="us-ascii"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmikIgYACgkQQ96R+SSa
cUUjpRAAwJ8lABhLGnVH6LQvLaPf06pRHFo/ToeBkEx2s0KhloWR0baieM/OC6fw
e0ImsAACP5vIrUgXziDSKq4Vnl/3Z6ya8gJH7Kos2X4rCn1trbCIcXqOVdOiAMsU
KmvIIOHO+oeI1V5g0D30aeOxTFAXTCoX3HIXVclMd6K1mqxLx9V5Sj5TwXShdOdV
12zItBh87WXvoJEzk1ubC+l303qv8N9sFOKHTuR1uZVgN3RW2yBSV4/ZRRlsCLGx
yxczxU4AszlE2ZACFRSTUdQSewI2hRftJs6PpUyCYQa75D8ESe0O/Gj0tNm4H2xq
0GZnf5LOYaGPw/dEV42kZxB/luIDUU+yqDuM0u3RuOSGkFKXAjPagrE/whKqCfQ5
gpzYKm+F6SMBUaQJM43ekTSov0kWgi+3qAFahMFAZaeloNqLWeIVG9Q56WR3twvn
2g8QRemxT92Lz2Rpc4XskA9eph9wZdEadWRosBjNnTmT193y01F30cp1thFoVcKh
39nUsAe06HLAnDAwZWXnZR/amS6hbt3Z1rDSXeedi/DnXjSRnMvkg5mVC55f6yt5
f888ebGAXrViCrWbkx+UHj4P+w1cHuUpK9vKB7r/L5pbCThrpTfKjDydF8F3UJKA
ykgW3vzfxyodoM2vlyTHZavAkEkfLr838rT5DOOfqaKv2SzDW94=
=CMMe
-----END PGP SIGNATURE-----

--===============1922544961252460224==--

