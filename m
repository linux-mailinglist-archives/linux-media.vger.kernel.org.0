Return-Path: <linux-media+bounces-14827-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E359692CE77
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2024 11:45:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 52523B26CAF
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2024 09:45:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 644CC18FA2E;
	Wed, 10 Jul 2024 09:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="p+lEzOo6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA35618EFF9;
	Wed, 10 Jul 2024 09:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720604701; cv=none; b=cFQ+oOcPe0YaSUUAZ93sSxU7RJCMYgN8zmjTBzEaq4F604lN4CSwIL74XEVl1bczNE3yNhCtUTLOnPCRYeqzOLQbw8Mzcn6ZOfqgHUXKcrD43jM7Q1z0TYmKbibBfWIuYLGaLFaD6udvhGaxgk0EnSOJYhUxL8OhjZS+PRLWVik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720604701; c=relaxed/simple;
	bh=zuLdMcepRN/UScnbC+ohCbrPF8wsnjY0QJ2444VG8H8=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=qnO083nKskAa3DWZvH4hWxD/fiJmaDDWg8xJA+kek8eiAeBkEQHVF3eTCYyzfjfV4C3B5CeW1HTI522921JtFSuFOAWJqapuo9E6dgyMM1ngFmvK6tEQgEOOWYlw5KamOtFwfaFYV1GRAbGodJz02pWTnq4PZiJPew7R1lsBDU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=p+lEzOo6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EC3C68D0;
	Wed, 10 Jul 2024 11:44:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1720604665;
	bh=zuLdMcepRN/UScnbC+ohCbrPF8wsnjY0QJ2444VG8H8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=p+lEzOo62HQ6J/Y3IvNkDQmKEkhNbO8vMvPFuvzKIhis9SACWy9Bl9ZgbV6eOFM7M
	 NKIUEoIY7Rk4rVuTxXhSsLwb+qyuBGGodfIHcQ+bKTi3XDkDScOD4NkQVTDPRk8O3r
	 FKbZD9r/OlgTpbN62Zmf75tfWTsSOyHWLzddr2uw=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240710044633.81372-3-umang.jain@ideasonboard.com>
References: <20240710044633.81372-1-umang.jain@ideasonboard.com> <20240710044633.81372-3-umang.jain@ideasonboard.com>
Subject: Re: [PATCH 2/2] media: imx335: Support vertical flip
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Alexander Shiyan <eagle.alexander923@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, open list <linux-kernel@vger.kernel.org>, Umang Jain <umang.jain@ideasonboard.com>
To: Umang Jain <umang.jain@ideasonboard.com>, linux-media@vger.kernel.org
Date: Wed, 10 Jul 2024 10:44:54 +0100
Message-ID: <172060469478.392292.6825899092646846962@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Umang Jain (2024-07-10 05:46:32)
> Support vertical flip by setting REG_VREVERSE.
> Additional registers also needs to be set per mode, according
> to the readout direction (normal/inverted) as mentioned in the
> data sheet.
>=20
> Since the register IMX335_REG_AREA3_ST_ADR_1 is based on the
> flip (and is set via vflip related registers), it has been
> moved out of the 2592x1944 mode regs.
>=20
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>  drivers/media/i2c/imx335.c | 71 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 69 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
> index 6c1e61b6696b..cd150606a8a9 100644
> --- a/drivers/media/i2c/imx335.c
> +++ b/drivers/media/i2c/imx335.c
> @@ -56,6 +56,9 @@
>  #define IMX335_AGAIN_STEP              1
>  #define IMX335_AGAIN_DEFAULT           0
> =20
> +/* Vertical flip */
> +#define IMX335_REG_VREVERSE            CCI_REG8(0x304f)
> +
>  #define IMX335_REG_TPG_TESTCLKEN       CCI_REG8(0x3148)
> =20
>  #define IMX335_REG_INCLKSEL1           CCI_REG16_LE(0x314c)
> @@ -155,6 +158,8 @@ static const char * const imx335_supply_name[] =3D {
>   * @vblank_max: Maximum vertical blanking in lines
>   * @pclk: Sensor pixel clock
>   * @reg_list: Register list for sensor mode
> + * @vflip_normal: Register list vflip (normal readout)
> + * @vflip_inverted: Register list vflip (inverted readout)
>   */
>  struct imx335_mode {
>         u32 width;
> @@ -166,6 +171,8 @@ struct imx335_mode {
>         u32 vblank_max;
>         u64 pclk;
>         struct imx335_reg_list reg_list;
> +       struct imx335_reg_list vflip_normal;
> +       struct imx335_reg_list vflip_inverted;
>  };
> =20
>  /**
> @@ -183,6 +190,7 @@ struct imx335_mode {
>   * @pclk_ctrl: Pointer to pixel clock control
>   * @hblank_ctrl: Pointer to horizontal blanking control
>   * @vblank_ctrl: Pointer to vertical blanking control
> + * @vflip: Pointer to vertical flip control
>   * @exp_ctrl: Pointer to exposure control
>   * @again_ctrl: Pointer to analog gain control
>   * @vblank: Vertical blanking in lines
> @@ -207,6 +215,7 @@ struct imx335 {
>         struct v4l2_ctrl *pclk_ctrl;
>         struct v4l2_ctrl *hblank_ctrl;
>         struct v4l2_ctrl *vblank_ctrl;
> +       struct v4l2_ctrl *vflip;
>         struct {
>                 struct v4l2_ctrl *exp_ctrl;
>                 struct v4l2_ctrl *again_ctrl;
> @@ -259,7 +268,6 @@ static const struct cci_reg_sequence mode_2592x1944_r=
egs[] =3D {
>         { IMX335_REG_HTRIMMING_START, 48 },
>         { IMX335_REG_HNUM, 2592 },
>         { IMX335_REG_Y_OUT_SIZE, 1944 },
> -       { IMX335_REG_AREA3_ST_ADR_1, 176 },
>         { IMX335_REG_AREA3_WIDTH_1, 3928 },
>         { IMX335_REG_OPB_SIZE_V, 0 },
>         { IMX335_REG_XVS_XHS_DRV, 0x00 },
> @@ -333,6 +341,26 @@ static const struct cci_reg_sequence mode_2592x1944_=
regs[] =3D {
>         { CCI_REG8(0x3a00), 0x00 },
>  };
> =20
> +static const struct cci_reg_sequence mode_2592x1944_vflip_normal[] =3D {
> +       { IMX335_REG_AREA3_ST_ADR_1, 176 },
> +
> +       /* Undocumented V-Flip related registers on Page 55 of datasheet.=
 */
> +       { CCI_REG8(0x3081), 0x02, },
> +       { CCI_REG8(0x3083), 0x02, },
> +       { CCI_REG16_LE(0x30b6), 0x00 },
> +       { CCI_REG16_LE(0x3116), 0x08 },
> +};
> +
> +static const struct cci_reg_sequence mode_2592x1944_vflip_inverted[] =3D=
 {
> +       { IMX335_REG_AREA3_ST_ADR_1, 4112 },
> +
> +       /* Undocumented V-Flip related registers on Page 55 of datasheet.=
 */
> +       { CCI_REG8(0x3081), 0xfe, },
> +       { CCI_REG8(0x3083), 0xfe, },
> +       { CCI_REG16_LE(0x30b6), 0x1fa },
> +       { CCI_REG16_LE(0x3116), 0x002 },

A little more awkward than the usual flip controls, but I think we do
need to track what the datasheet gives us for now unless we can get more
information from Sony or do some reverse engineering here which isn't
really worth the effort at the moment.


Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> +};
> +
>  static const struct cci_reg_sequence raw10_framefmt_regs[] =3D {
>         { IMX335_REG_ADBIT, 0x00 },
>         { IMX335_REG_MDBIT, 0x00 },
> @@ -419,6 +447,14 @@ static const struct imx335_mode supported_mode =3D {
>                 .num_of_regs =3D ARRAY_SIZE(mode_2592x1944_regs),
>                 .regs =3D mode_2592x1944_regs,
>         },
> +       .vflip_normal =3D {
> +               .num_of_regs =3D ARRAY_SIZE(mode_2592x1944_vflip_normal),
> +               .regs =3D mode_2592x1944_vflip_normal,
> +       },
> +       .vflip_inverted =3D {
> +               .num_of_regs =3D ARRAY_SIZE(mode_2592x1944_vflip_inverted=
),
> +               .regs =3D mode_2592x1944_vflip_inverted,
> +       },
>  };
> =20
>  /**
> @@ -492,6 +528,26 @@ static int imx335_update_exp_gain(struct imx335 *imx=
335, u32 exposure, u32 gain)
>         return ret;
>  }
> =20
> +static int imx335_update_vertical_flip(struct imx335 *imx335, u32 vflip)
> +{
> +       int ret =3D 0;
> +
> +       if (vflip)
> +               cci_multi_reg_write(imx335->cci,
> +                                   imx335->cur_mode->vflip_inverted.regs,
> +                                   imx335->cur_mode->vflip_inverted.num_=
of_regs,
> +                                   &ret);
> +       else
> +               cci_multi_reg_write(imx335->cci,
> +                                   imx335->cur_mode->vflip_normal.regs,
> +                                   imx335->cur_mode->vflip_normal.num_of=
_regs,
> +                                   &ret);
> +       if (ret)
> +               return ret;
> +
> +       return cci_write(imx335->cci, IMX335_REG_VREVERSE, vflip, NULL);
> +}
> +
>  static int imx335_update_test_pattern(struct imx335 *imx335, u32 pattern=
_index)
>  {
>         int ret =3D 0;
> @@ -584,6 +640,10 @@ static int imx335_set_ctrl(struct v4l2_ctrl *ctrl)
> =20
>                 ret =3D imx335_update_exp_gain(imx335, exposure, analog_g=
ain);
> =20
> +               break;
> +       case V4L2_CID_VFLIP:
> +               ret =3D imx335_update_vertical_flip(imx335, ctrl->val);
> +
>                 break;
>         case V4L2_CID_TEST_PATTERN:
>                 ret =3D imx335_update_test_pattern(imx335, ctrl->val);
> @@ -1167,7 +1227,7 @@ static int imx335_init_controls(struct imx335 *imx3=
35)
>                 return ret;
> =20
>         /* v4l2_fwnode_device_properties can add two more controls */
> -       ret =3D v4l2_ctrl_handler_init(ctrl_hdlr, 9);
> +       ret =3D v4l2_ctrl_handler_init(ctrl_hdlr, 10);
>         if (ret)
>                 return ret;
> =20
> @@ -1202,6 +1262,13 @@ static int imx335_init_controls(struct imx335 *imx=
335)
> =20
>         v4l2_ctrl_cluster(2, &imx335->exp_ctrl);
> =20
> +       imx335->vflip =3D v4l2_ctrl_new_std(ctrl_hdlr,
> +                                         &imx335_ctrl_ops,
> +                                         V4L2_CID_VFLIP,
> +                                         0, 1, 1, 0);
> +       if (imx335->vflip)
> +               imx335->vflip->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> +
>         imx335->vblank_ctrl =3D v4l2_ctrl_new_std(ctrl_hdlr,
>                                                 &imx335_ctrl_ops,
>                                                 V4L2_CID_VBLANK,
> --=20
> 2.45.0
>

