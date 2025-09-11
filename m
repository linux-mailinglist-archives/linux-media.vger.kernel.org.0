Return-Path: <linux-media+bounces-42325-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AC5B5316D
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 13:52:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1888F165962
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 11:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92FD93148BA;
	Thu, 11 Sep 2025 11:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PeI0TeiJ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30322DEA9D;
	Thu, 11 Sep 2025 11:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757591525; cv=none; b=jcB1e0tzuykAA3dnaxj1o3VUBwSYNCFsPVxMbx476HkS4luDc16bO8vxPYUH61aFE+uL/PPr83ROY4K++SAtyB+17eqj5/yykirSnMSee22gVHS9EkIMqIjSp3e2dehCYq2Du3h2lJnu8dLPN8/tUxR+TcK4XA21GPsK6ICRA0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757591525; c=relaxed/simple;
	bh=qdwTBqZPfQcmnUy27xPV05OQaSnntcymw3F30yTFBy8=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=GrT6me6cKACNvNI2qYUlE0w9HuQyQ4lxJncA7S6s2eXTajuhEgoMQL7VBbAU0y+Rjs4LHvB3zjuy/hiT35H7JG8mAa4EhRwKzlTf9Ws7LvfE+Y5skJEw4L5V6whua7eAYe1uTfFHwCDLRk02gXqiOOwgEiGq2fWZGGGj+Sy4lEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PeI0TeiJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9F368664;
	Thu, 11 Sep 2025 13:50:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757591445;
	bh=qdwTBqZPfQcmnUy27xPV05OQaSnntcymw3F30yTFBy8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=PeI0TeiJyHqN4iZwjCVloz7pj6TT4m02XBnsirItW9tRF66UKaz2Qongj5vuDaxOv
	 VOfY6sSPeoKaS+c946w9FsJ7mrqSKTCU8dpjCL0/V26kLGrO+59wo32VV3F7Kk81q6
	 6w7UWpTvKXsJQlxXEZ/7qb3gEzvBMIxEE+OUDqos=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250911-imx335_binning-v2-7-30a28df74df6@ideasonboard.com>
References: <20250911-imx335_binning-v2-0-30a28df74df6@ideasonboard.com> <20250911-imx335_binning-v2-7-30a28df74df6@ideasonboard.com>
Subject: Re: [PATCH v2 7/8] media: imx335: Support 2x2 binning
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Tommaso Merciai <tomm.merciai@gmail.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Thu, 11 Sep 2025 12:51:57 +0100
Message-ID: <175759151735.1246375.12434122590720598140@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Jai Luthra (2025-09-11 09:14:23)
> Introduce 2x2 binning mode (1312x972@60fps). Since there are multiple
> modes now, use v4l2_find_nearest_size() to select the appropriate mode
> in .set_fmt().
>=20
> For 2x2 binning the minimum shutter value supported is 17 instead of 9.
> This effects the maximum allowed exposure time, and if not enforced then
> the sensor produces very dark frames when the minimum shutter limit is
> violated.
>=20
> Lastly, update the crop size reported to the userspace. When trying 2x2
> binning with the datasheet suggested pixel array size (i.e. 2592 / 2 =3D>
> 1296), on some platforms (Raspberry Pi 5) artefacts are introduced on
> the right edge of the output image. Instead, using a higher width of
> 1312 works fine on all platforms.
>=20
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
>  drivers/media/i2c/imx335.c | 275 +++++++++++++++++++++++++++++++++++----=
------
>  1 file changed, 217 insertions(+), 58 deletions(-)
>=20
> diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
> index 9b9bbe6473d545bc5618c0fe8191df0b18037cd8..c985edab7e2a965ccd9427b01=
3cbb3fa8778de2b 100644
> --- a/drivers/media/i2c/imx335.c
> +++ b/drivers/media/i2c/imx335.c
> @@ -35,6 +35,7 @@
> =20
>  /* Lines per frame */
>  #define IMX335_REG_VMAX                        CCI_REG24_LE(0x3030)
> +#define IMX335_REG_HMAX                        CCI_REG16_LE(0x3034)
> =20
>  #define IMX335_REG_OPB_SIZE_V          CCI_REG8(0x304c)
>  #define IMX335_REG_ADBIT               CCI_REG8(0x3050)
> @@ -42,10 +43,13 @@
> =20
>  #define IMX335_REG_SHUTTER             CCI_REG24_LE(0x3058)
>  #define IMX335_EXPOSURE_MIN            1
> -#define IMX335_EXPOSURE_OFFSET         9
> +#define IMX335_SHUTTER_MIN             9
> +#define IMX335_SHUTTER_MIN_BINNED      17
>  #define IMX335_EXPOSURE_STEP           1
>  #define IMX335_EXPOSURE_DEFAULT                0x0648
> =20
> +#define IMX335_REG_AREA2_WIDTH_1       CCI_REG16_LE(0x3072)
> +
>  #define IMX335_REG_AREA3_ST_ADR_1      CCI_REG16_LE(0x3074)
>  #define IMX335_REG_AREA3_WIDTH_1       CCI_REG16_LE(0x3076)
> =20
> @@ -133,12 +137,11 @@ static const struct v4l2_rect imx335_native_area =
=3D {
> =20
>  static const struct v4l2_rect imx335_active_area =3D {
>         .top =3D 50,
> -       .left =3D 52,
> -       .width =3D 2592,
> +       .left =3D 36,
> +       .width =3D 2624,
>         .height =3D 1944,
>  };
> =20
> -
>  /**
>   * struct imx335_reg_list - imx335 sensor register list
>   * @num_of_regs: Number of registers in the list
> @@ -155,8 +158,14 @@ static const char * const imx335_supply_name[] =3D {
>         "dvdd", /* Digital Core (1.2V) supply */
>  };
> =20
> +enum imx335_scan_mode {
> +       IMX335_ALL_PIXEL,
> +       IMX335_2_2_BINNING,
> +};
> +
>  /**
>   * struct imx335_mode - imx335 sensor mode structure
> + * @scan_mode: Configuration scan mode (All pixel / 2x2Binning)
>   * @width: Frame width
>   * @height: Frame height
>   * @code: Format code
> @@ -170,6 +179,7 @@ static const char * const imx335_supply_name[] =3D {
>   * @vflip_inverted: Register list vflip (inverted readout)
>   */
>  struct imx335_mode {
> +       enum imx335_scan_mode scan_mode;
>         u32 width;
>         u32 height;
>         u32 code;
> @@ -271,12 +281,33 @@ static const struct cci_reg_sequence mode_2592x1944=
_regs[] =3D {
>         { IMX335_REG_MODE_SELECT, IMX335_MODE_STANDBY },
>         { IMX335_REG_MASTER_MODE, 0x00 },
>         { IMX335_REG_WINMODE, 0x04 },
> +       { IMX335_REG_HMAX, 550 },
>         { IMX335_REG_HTRIMMING_START, 48 },
>         { IMX335_REG_HNUM, 2592 },
>         { IMX335_REG_Y_OUT_SIZE, 1944 },
> +       { IMX335_REG_AREA2_WIDTH_1, 40 },
>         { IMX335_REG_AREA3_WIDTH_1, 3928 },
>         { IMX335_REG_OPB_SIZE_V, 0 },
>         { IMX335_REG_XVS_XHS_DRV, 0x00 },
> +};
> +
> +static const struct cci_reg_sequence mode_1312x972_regs[] =3D {
> +       { IMX335_REG_MODE_SELECT, IMX335_MODE_STANDBY },
> +       { IMX335_REG_MASTER_MODE, 0x00 },
> +       { IMX335_REG_WINMODE, 0x01 },
> +       { IMX335_REG_HMAX, 275 },
> +       { IMX335_REG_HTRIMMING_START, 48 },
> +       { IMX335_REG_HNUM, 2600 },
> +       { IMX335_REG_Y_OUT_SIZE, 972 },
> +       { IMX335_REG_AREA2_WIDTH_1, 48 },
> +       { IMX335_REG_AREA3_WIDTH_1, 3936 },
> +       { IMX335_REG_OPB_SIZE_V, 0 },
> +       { IMX335_REG_XVS_XHS_DRV, 0x00 },
> +       { CCI_REG8(0x3300), 1 }, /* TCYCLE */
> +       { CCI_REG8(0x3199), 0x30 }, /* HADD/VADD */
> +};
> +
> +static const struct cci_reg_sequence imx335_common_regs[] =3D {
>         { CCI_REG8(0x3288), 0x21 },
>         { CCI_REG8(0x328a), 0x02 },
>         { CCI_REG8(0x3414), 0x05 },
> @@ -367,16 +398,72 @@ static const struct cci_reg_sequence mode_2592x1944=
_vflip_inverted[] =3D {
>         { CCI_REG16_LE(0x3116), 0x002 },
>  };
> =20
> -static const struct cci_reg_sequence raw10_framefmt_regs[] =3D {
> -       { IMX335_REG_ADBIT, 0x00 },
> -       { IMX335_REG_MDBIT, 0x00 },
> -       { IMX335_REG_ADBIT1, 0x1ff },
> +static const struct cci_reg_sequence mode_1312x972_vflip_normal[] =3D {
> +       { IMX335_REG_AREA3_ST_ADR_1, 176 },
> +
> +       /* Undocumented */
> +       { CCI_REG8(0x3078), 0x04 },
> +       { CCI_REG8(0x3079), 0xfd },
> +       { CCI_REG8(0x307a), 0x04 },
> +       { CCI_REG8(0x307b), 0xfe },
> +       { CCI_REG8(0x307c), 0x04 },
> +       { CCI_REG8(0x307d), 0xfb },
> +       { CCI_REG8(0x307e), 0x04 },
> +       { CCI_REG8(0x307f), 0x02 },
> +       { CCI_REG8(0x3080), 0x04, },
> +       { CCI_REG8(0x3081), 0xfd, },
> +       { CCI_REG8(0x3082), 0x04, },
> +       { CCI_REG8(0x3083), 0xfe, },
> +       { CCI_REG8(0x3084), 0x04, },
> +       { CCI_REG8(0x3085), 0xfb, },
> +       { CCI_REG8(0x3086), 0x04, },
> +       { CCI_REG8(0x3087), 0x02, },
> +       { CCI_REG8(0x30a4), 0x77, },
> +       { CCI_REG8(0x30a8), 0x20, },
> +       { CCI_REG8(0x30a9), 0x00, },
> +       { CCI_REG8(0x30ac), 0x08, },
> +       { CCI_REG8(0x30ad), 0x08, },
> +       { CCI_REG8(0x30b0), 0x20, },
> +       { CCI_REG8(0x30b1), 0x00, },
> +       { CCI_REG8(0x30b4), 0x10, },
> +       { CCI_REG8(0x30b5), 0x10, },

Something odd happened to that table, I don't think the extra ',' should
be at the end of these entries (0x3080->0x030b5).

> +       { CCI_REG16_LE(0x30b6), 0x00 },
> +       { CCI_REG16_LE(0x3112), 0x10 },
> +       { CCI_REG16_LE(0x3116), 0x10 },
>  };
> =20
> -static const struct cci_reg_sequence raw12_framefmt_regs[] =3D {
> -       { IMX335_REG_ADBIT, 0x01 },
> -       { IMX335_REG_MDBIT, 0x01 },
> -       { IMX335_REG_ADBIT1, 0x47 },
> +static const struct cci_reg_sequence mode_1312x972_vflip_inverted[] =3D {
> +       { IMX335_REG_AREA3_ST_ADR_1, 4112 },
> +
> +       /* Undocumented */
> +       { CCI_REG8(0x3078), 0x04 },
> +       { CCI_REG8(0x3079), 0xfd },
> +       { CCI_REG8(0x307a), 0x04 },
> +       { CCI_REG8(0x307b), 0xfe },
> +       { CCI_REG8(0x307c), 0x04 },
> +       { CCI_REG8(0x307d), 0xfb },
> +       { CCI_REG8(0x307e), 0x04 },
> +       { CCI_REG8(0x307f), 0x02 },
> +       { CCI_REG8(0x3080), 0xfc, },
> +       { CCI_REG8(0x3081), 0x05, },
> +       { CCI_REG8(0x3082), 0xfc, },
> +       { CCI_REG8(0x3083), 0x02, },
> +       { CCI_REG8(0x3084), 0xfc, },
> +       { CCI_REG8(0x3085), 0x03, },
> +       { CCI_REG8(0x3086), 0xfc, },
> +       { CCI_REG8(0x3087), 0xfe, },
> +       { CCI_REG8(0x30a4), 0x77, },
> +       { CCI_REG8(0x30a8), 0x20, },
> +       { CCI_REG8(0x30a9), 0x00, },
> +       { CCI_REG8(0x30ac), 0x08, },
> +       { CCI_REG8(0x30ad), 0x78, },
> +       { CCI_REG8(0x30b0), 0x20, },
> +       { CCI_REG8(0x30b1), 0x00, },
> +       { CCI_REG8(0x30b4), 0x10, },
> +       { CCI_REG8(0x30b5), 0x70, },

Same here ...

Other than that


Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> +       { CCI_REG16_LE(0x30b6), 0x01f2 },
> +       { CCI_REG16_LE(0x3112), 0x10 },
> +       { CCI_REG16_LE(0x3116), 0x02 },
>  };
> =20
>  static const struct cci_reg_sequence mipi_data_rate_1188Mbps[] =3D {
> @@ -441,25 +528,49 @@ static const u32 imx335_mbus_codes[] =3D {
>  };
> =20
>  /* Supported sensor mode configurations */
> -static const struct imx335_mode supported_mode =3D {
> -       .width =3D 2592,
> -       .height =3D 1944,
> -       .hblank =3D 342,
> -       .vblank =3D 2556,
> -       .vblank_min =3D 2556,
> -       .vblank_max =3D 133060,
> -       .pclk =3D 396000000,
> -       .reg_list =3D {
> -               .num_of_regs =3D ARRAY_SIZE(mode_2592x1944_regs),
> -               .regs =3D mode_2592x1944_regs,
> -       },
> -       .vflip_normal =3D {
> -               .num_of_regs =3D ARRAY_SIZE(mode_2592x1944_vflip_normal),
> -               .regs =3D mode_2592x1944_vflip_normal,
> -       },
> -       .vflip_inverted =3D {
> -               .num_of_regs =3D ARRAY_SIZE(mode_2592x1944_vflip_inverted=
),
> -               .regs =3D mode_2592x1944_vflip_inverted,
> +static const struct imx335_mode supported_modes[] =3D {
> +       {
> +               .scan_mode =3D IMX335_ALL_PIXEL,
> +               .width =3D 2592,
> +               .height =3D 1944,
> +               .hblank =3D 342,
> +               .vblank =3D 2556,
> +               .vblank_min =3D 2556,
> +               .vblank_max =3D 133060,
> +               .pclk =3D 396000000,
> +               .reg_list =3D {
> +                       .num_of_regs =3D ARRAY_SIZE(mode_2592x1944_regs),
> +                       .regs =3D mode_2592x1944_regs,
> +               },
> +               .vflip_normal =3D {
> +                       .num_of_regs =3D ARRAY_SIZE(mode_2592x1944_vflip_=
normal),
> +                       .regs =3D mode_2592x1944_vflip_normal,
> +               },
> +               .vflip_inverted =3D {
> +                       .num_of_regs =3D ARRAY_SIZE(mode_2592x1944_vflip_=
inverted),
> +                       .regs =3D mode_2592x1944_vflip_inverted,
> +               }
> +       }, {
> +               .scan_mode =3D IMX335_2_2_BINNING,
> +               .width =3D 1312,
> +               .height =3D 972,
> +               .hblank =3D 155,
> +               .vblank =3D 3528,
> +               .vblank_min =3D 3528,
> +               .vblank_max =3D 133060,
> +               .pclk =3D 396000000,
> +               .reg_list =3D {
> +                       .num_of_regs =3D ARRAY_SIZE(mode_1312x972_regs),
> +                       .regs =3D mode_1312x972_regs,
> +               },
> +               .vflip_normal =3D {
> +                       .num_of_regs =3D ARRAY_SIZE(mode_1312x972_vflip_n=
ormal),
> +                       .regs =3D mode_1312x972_vflip_normal,
> +               },
> +               .vflip_inverted =3D {
> +                       .num_of_regs =3D ARRAY_SIZE(mode_1312x972_vflip_i=
nverted),
> +                       .regs =3D mode_1312x972_vflip_inverted,
> +               },
>         },
>  };
> =20
> @@ -616,18 +727,22 @@ static int imx335_set_ctrl(struct v4l2_ctrl *ctrl)
> =20
>         /* Propagate change of current control to all related controls */
>         if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> +               u32 shutter_min =3D IMX335_SHUTTER_MIN;
> +               u32 lpfr;
> +
>                 imx335->vblank =3D imx335->vblank_ctrl->val;
> +               lpfr =3D imx335->vblank + imx335->cur_mode->height;
> =20
>                 dev_dbg(imx335->dev, "Received vblank %u, new lpfr %u\n",
> -                       imx335->vblank,
> -                       imx335->vblank + imx335->cur_mode->height);
> +                       imx335->vblank, lpfr);
> +
> +               if (imx335->cur_mode->scan_mode =3D=3D IMX335_2_2_BINNING)
> +                       shutter_min =3D IMX335_SHUTTER_MIN_BINNED;
> =20
>                 ret =3D __v4l2_ctrl_modify_range(imx335->exp_ctrl,
>                                                IMX335_EXPOSURE_MIN,
> -                                              imx335->vblank +
> -                                              imx335->cur_mode->height -
> -                                              IMX335_EXPOSURE_OFFSET,
> -                                              1, IMX335_EXPOSURE_DEFAULT=
);
> +                                              lpfr - shutter_min, 1,
> +                                              IMX335_EXPOSURE_DEFAULT);
>                 if (ret)
>                         return ret;
>         }
> @@ -727,17 +842,16 @@ static int imx335_enum_frame_size(struct v4l2_subde=
v *sd,
>         struct imx335 *imx335 =3D to_imx335(sd);
>         u32 code;
> =20
> -       /* Only a single supported_mode available. */
> -       if (fsize->index > 0)
> +       if (fsize->index >=3D ARRAY_SIZE(supported_modes))
>                 return -EINVAL;
> =20
>         code =3D imx335_get_format_code(imx335, fsize->code);
>         if (fsize->code !=3D code)
>                 return -EINVAL;
> =20
> -       fsize->min_width =3D supported_mode.width;
> +       fsize->min_width =3D supported_modes[fsize->index].width;
>         fsize->max_width =3D fsize->min_width;
> -       fsize->min_height =3D supported_mode.height;
> +       fsize->min_height =3D supported_modes[fsize->index].height;
>         fsize->max_height =3D fsize->min_height;
> =20
>         return 0;
> @@ -779,9 +893,13 @@ static int imx335_set_pad_format(struct v4l2_subdev =
*sd,
>         struct imx335 *imx335 =3D to_imx335(sd);
>         struct v4l2_mbus_framefmt *format;
>         const struct imx335_mode *mode;
> +       struct v4l2_rect *crop;
>         int i, ret =3D 0;
> =20
> -       mode =3D &supported_mode;
> +       mode =3D v4l2_find_nearest_size(supported_modes,
> +                                     ARRAY_SIZE(supported_modes),
> +                                     width, height,
> +                                     fmt->format.width, fmt->format.heig=
ht);
> =20
>         for (i =3D 0; i < ARRAY_SIZE(imx335_mbus_codes); i++) {
>                 if (imx335_mbus_codes[i] =3D=3D fmt->format.code)
> @@ -793,6 +911,16 @@ static int imx335_set_pad_format(struct v4l2_subdev =
*sd,
>         format =3D v4l2_subdev_state_get_format(sd_state, fmt->pad);
>         *format =3D fmt->format;
> =20
> +       crop =3D v4l2_subdev_state_get_crop(sd_state, fmt->pad);
> +       crop->width =3D fmt->format.width;
> +       crop->height =3D fmt->format.height;
> +       if (mode->scan_mode =3D=3D IMX335_2_2_BINNING) {
> +               crop->width *=3D 2;
> +               crop->height *=3D 2;
> +       }
> +       crop->left =3D (imx335_native_area.width - crop->width) / 2;
> +       crop->top =3D (imx335_native_area.height - crop->height) / 2;
> +
>         if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE) {
>                 ret =3D imx335_update_controls(imx335, mode);
>                 if (!ret)
> @@ -816,7 +944,7 @@ static int imx335_init_state(struct v4l2_subdev *sd,
>         struct v4l2_subdev_format fmt =3D { 0 };
> =20
>         fmt.which =3D sd_state ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FOR=
MAT_ACTIVE;
> -       imx335_fill_pad_format(imx335, &supported_mode, &fmt);
> +       imx335_fill_pad_format(imx335, &supported_modes[0], &fmt);
> =20
>         __v4l2_ctrl_modify_range(imx335->link_freq_ctrl, 0,
>                                  __fls(imx335->link_freq_bitmap),
> @@ -839,11 +967,15 @@ static int imx335_get_selection(struct v4l2_subdev =
*sd,
>                                 struct v4l2_subdev_selection *sel)
>  {
>         switch (sel->target) {
> +       case V4L2_SEL_TGT_CROP:
> +               sel->r =3D *v4l2_subdev_state_get_crop(sd_state, 0);
> +
> +               return 0;
> +
>         case V4L2_SEL_TGT_NATIVE_SIZE:
>                 sel->r =3D imx335_native_area;
>                 return 0;
> =20
> -       case V4L2_SEL_TGT_CROP:
>         case V4L2_SEL_TGT_CROP_DEFAULT:
>         case V4L2_SEL_TGT_CROP_BOUNDS:
>                 sel->r =3D imx335_active_area;
> @@ -855,19 +987,35 @@ static int imx335_get_selection(struct v4l2_subdev =
*sd,
> =20
>  static int imx335_set_framefmt(struct imx335 *imx335)
>  {
> -       switch (imx335->cur_mbus_code) {
> -       case MEDIA_BUS_FMT_SRGGB10_1X10:
> -               return cci_multi_reg_write(imx335->cci, raw10_framefmt_re=
gs,
> -                                          ARRAY_SIZE(raw10_framefmt_regs=
),
> -                                          NULL);
> -
> -       case MEDIA_BUS_FMT_SRGGB12_1X12:
> -               return cci_multi_reg_write(imx335->cci, raw12_framefmt_re=
gs,
> -                                          ARRAY_SIZE(raw12_framefmt_regs=
),
> -                                          NULL);
> +       /*
> +        * In the all-pixel scan mode the AD conversion shall match the o=
utput
> +        * bit width requested.
> +        *
> +        * However, when 2/2 binning is enabled, the AD conversion is alw=
ays
> +        * 10-bit, so we ensure ADBIT is clear and ADBIT1 is assigned 0x1=
ff.
> +        * That's as much as the documentation gives us...
> +        */
> +       int ret =3D 0;
> +       u8 bpp =3D imx335->cur_mbus_code =3D=3D MEDIA_BUS_FMT_SRGGB10_1X1=
0 ? 10 : 12;
> +       u8 ad_conv =3D bpp;
> +
> +       /* Start with the output mode */
> +       cci_write(imx335->cci, IMX335_REG_MDBIT, bpp =3D=3D 12, &ret);
> +
> +       /* Enforce 10 bit AD on binning modes */
> +       if (imx335->cur_mode->scan_mode =3D=3D IMX335_2_2_BINNING)
> +               ad_conv =3D 10;
> +
> +       /* AD Conversion configuration */
> +       if (ad_conv =3D=3D 10) {
> +               cci_write(imx335->cci, IMX335_REG_ADBIT, 0x00, &ret);
> +               cci_write(imx335->cci, IMX335_REG_ADBIT1, 0x1ff, &ret);
> +       } else { /* 12 bit AD Conversion */
> +               cci_write(imx335->cci, IMX335_REG_ADBIT, 0x01, &ret);
> +               cci_write(imx335->cci, IMX335_REG_ADBIT1, 0x47, &ret);
>         }
> =20
> -       return -EINVAL;
> +       return ret;
>  }
> =20
>  /**
> @@ -903,6 +1051,14 @@ static int imx335_start_streaming(struct imx335 *im=
x335)
>                 goto err_rpm_put;
>         }
> =20
> +       /* Write sensor common registers */
> +       ret =3D cci_multi_reg_write(imx335->cci, imx335_common_regs,
> +                                 ARRAY_SIZE(imx335_common_regs), NULL);
> +       if (ret) {
> +               dev_err(imx335->dev, "fail to write initial registers\n");
> +               goto err_rpm_put;
> +       }
> +
>         ret =3D imx335_set_framefmt(imx335);
>         if (ret) {
>                 dev_err(imx335->dev, "%s failed to set frame format: %d\n=
",
> @@ -1184,7 +1340,7 @@ static int imx335_init_controls(struct imx335 *imx3=
35)
>         struct v4l2_ctrl_handler *ctrl_hdlr =3D &imx335->ctrl_handler;
>         const struct imx335_mode *mode =3D imx335->cur_mode;
>         struct v4l2_fwnode_device_properties props;
> -       u32 lpfr;
> +       u32 lpfr, shutter_min;
>         int ret;
> =20
>         ret =3D v4l2_fwnode_device_parse(imx335->dev, &props);
> @@ -1198,11 +1354,14 @@ static int imx335_init_controls(struct imx335 *im=
x335)
> =20
>         /* Initialize exposure and gain */
>         lpfr =3D mode->vblank + mode->height;
> +       shutter_min =3D IMX335_SHUTTER_MIN;
> +       if (mode->scan_mode =3D=3D IMX335_2_2_BINNING)
> +               shutter_min =3D IMX335_SHUTTER_MIN_BINNED;
>         imx335->exp_ctrl =3D v4l2_ctrl_new_std(ctrl_hdlr,
>                                              &imx335_ctrl_ops,
>                                              V4L2_CID_EXPOSURE,
>                                              IMX335_EXPOSURE_MIN,
> -                                            lpfr - IMX335_EXPOSURE_OFFSE=
T,
> +                                            lpfr - shutter_min,
>                                              IMX335_EXPOSURE_STEP,
>                                              IMX335_EXPOSURE_DEFAULT);
> =20
> @@ -1329,7 +1488,7 @@ static int imx335_probe(struct i2c_client *client)
>         }
> =20
>         /* Set default mode to max resolution */
> -       imx335->cur_mode =3D &supported_mode;
> +       imx335->cur_mode =3D &supported_modes[0];
>         imx335->cur_mbus_code =3D imx335_mbus_codes[0];
>         imx335->vblank =3D imx335->cur_mode->vblank;
> =20
>=20
> --=20
> 2.51.0
>

