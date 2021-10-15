Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B422642FC81
	for <lists+linux-media@lfdr.de>; Fri, 15 Oct 2021 21:50:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238413AbhJOTvn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Oct 2021 15:51:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238379AbhJOTvm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Oct 2021 15:51:42 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFD5CC061570
        for <linux-media@vger.kernel.org>; Fri, 15 Oct 2021 12:49:35 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D190E2E3;
        Fri, 15 Oct 2021 21:49:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1634327373;
        bh=WOPIo5Gb4zgxxx3yqsMasWxMxWeLB2CqPh3z0ZRRMgw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=OkYMF2PMz4BZyVTQ0usRV0aUobBSvTr7TlDA00FcOiQ4so0NGtBFuMtW+4PfFLRUY
         2X3eSI/zEa3qyb8jXNHEGZwB3RdOhTp+XbD0RxBi1nSzww3ORG3b+56SMT3puQY6IO
         t4s9g7rrTXezi3uMyTG0uOtKB/RSRMksEx06xSEI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1634281530-2238-1-git-send-email-bingbu.cao@intel.com>
References: <1634281530-2238-1-git-send-email-bingbu.cao@intel.com>
Subject: Re: [PATCH v2] media: imx258: add vblank control to support more frame rate range
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     senozhatsky@chromium.org, tfiga@chromium.org, bingbu.cao@intel.com,
        bingbu.cao@linux.intel.com
To:     Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com
Date:   Fri, 15 Oct 2021 20:49:31 +0100
Message-ID: <163432737155.316423.6847119575037122257@Monstersaurus>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bingbu,

Quoting Bingbu Cao (2021-10-15 08:05:30)
> Current imx258 driver enable the automatic frame length tracking control
> by default and did not support VBLANK change, it's always working at 30fp=
s.
> However, in reality we need a wider frame rate range from 15 to 30.
> This patch disable the automatic frame length tracking control and enable
> the v4l2 VBLANK control to allow user changing frame rate per requirement.
>=20
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> ---
>  drivers/media/i2c/imx258.c | 23 +++++++++++++++++------
>  1 file changed, 17 insertions(+), 6 deletions(-)
> ---
> v1->v2: remove a wrong 'break'
> ---
> diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
> index 81cdf37216ca..3f46744b1a26 100644
> --- a/drivers/media/i2c/imx258.c
> +++ b/drivers/media/i2c/imx258.c
> @@ -29,6 +29,7 @@
>  #define IMX258_VTS_MAX                 0xffff
> =20
>  /*Frame Length Line*/
> +#define IMX258_REG_FLL                 0x0340
>  #define IMX258_FLL_MIN                 0x08a6
>  #define IMX258_FLL_MAX                 0xffff
>  #define IMX258_FLL_STEP                        1
> @@ -241,7 +242,7 @@ static const struct imx258_reg mode_4208x3118_regs[] =
=3D {
>         { 0x034D, 0x70 },
>         { 0x034E, 0x0C },
>         { 0x034F, 0x30 },
> -       { 0x0350, 0x01 },
> +       { 0x0350, 0x00 },

The commit message implies that the register 0x0350 controls the
"automatic frame length tracking".

Is it worth adding that register description as a comment at the end of
the line, to help future readers?

> +       { 0x0350, 0x00 }, /* automatic frame length tracking */

Without datasheets, these long register lists are very terse ...

If register names /functions can at least be identified then I suspect
it would help with future maintenance of the code?

Or is it too futile to imagine that these registers might improve in
documentation as time goes on...

--
Kieran


>         { 0x0202, 0x0C },
>         { 0x0203, 0x46 },
>         { 0x0204, 0x00 },
> @@ -360,7 +361,7 @@ static const struct imx258_reg mode_2104_1560_regs[] =
=3D {
>         { 0x034D, 0x38 },
>         { 0x034E, 0x06 },
>         { 0x034F, 0x18 },
> -       { 0x0350, 0x01 },
> +       { 0x0350, 0x00 },
>         { 0x0202, 0x06 },
>         { 0x0203, 0x2E },
>         { 0x0204, 0x00 },
> @@ -479,7 +480,7 @@ static const struct imx258_reg mode_1048_780_regs[] =
=3D {
>         { 0x034D, 0x18 },
>         { 0x034E, 0x03 },
>         { 0x034F, 0x0C },
> -       { 0x0350, 0x01 },
> +       { 0x0350, 0x00 },
>         { 0x0202, 0x03 },
>         { 0x0203, 0x42 },
>         { 0x0204, 0x00 },
> @@ -753,8 +754,17 @@ static int imx258_set_ctrl(struct v4l2_ctrl *ctrl)
>         struct imx258 *imx258 =3D
>                 container_of(ctrl->handler, struct imx258, ctrl_handler);
>         struct i2c_client *client =3D v4l2_get_subdevdata(&imx258->sd);
> +       s64 max;
>         int ret =3D 0;
> =20
> +       if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> +               /* Update max exposure to meet expected vblanking */
> +               max =3D imx258->cur_mode->height + ctrl->val - 10;
> +               __v4l2_ctrl_modify_range(imx258->exposure,
> +                                        imx258->exposure->minimum,
> +                                        max, imx258->exposure->step, max=
);
> +       }
> +
>         /*
>          * Applying V4L2 control value only happens
>          * when power is up for streaming
> @@ -773,6 +783,10 @@ static int imx258_set_ctrl(struct v4l2_ctrl *ctrl)
>                                 IMX258_REG_VALUE_16BIT,
>                                 ctrl->val);
>                 break;
> +       case V4L2_CID_VBLANK:
> +               ret =3D imx258_write_reg(imx258, IMX258_REG_FLL, 2,
> +                                      imx258->cur_mode->height + ctrl->v=
al);
> +               break;
>         case V4L2_CID_DIGITAL_GAIN:
>                 ret =3D imx258_update_digital_gain(imx258, IMX258_REG_VAL=
UE_16BIT,
>                                 ctrl->val);
> @@ -1189,9 +1203,6 @@ static int imx258_init_controls(struct imx258 *imx2=
58)
>                                 IMX258_VTS_MAX - imx258->cur_mode->height=
, 1,
>                                 vblank_def);
> =20
> -       if (imx258->vblank)
> -               imx258->vblank->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> -
>         imx258->hblank =3D v4l2_ctrl_new_std(
>                                 ctrl_hdlr, &imx258_ctrl_ops, V4L2_CID_HBL=
ANK,
>                                 IMX258_PPL_DEFAULT - imx258->cur_mode->wi=
dth,
> --=20
> 2.7.4
>
