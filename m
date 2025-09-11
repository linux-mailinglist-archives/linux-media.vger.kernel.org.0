Return-Path: <linux-media+bounces-42312-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE75B52FE8
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 13:18:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DDBC1CC0A5E
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 11:17:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6BF1220F2C;
	Thu, 11 Sep 2025 11:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rShC73/S"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876E521E0AD;
	Thu, 11 Sep 2025 11:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757589292; cv=none; b=AIqx6qBDRlL1T9aixlYe9ORHZJ1ZVbOWIq+5CXbNdXgNsdT3D6tUnu7h8AbrlNpmY+v63kNudrI4VSaLpSLx3Vq5Zm8R/HRfCVmgZ5EMB1/jb26dMvx8IyGVNma+4auhT7PF2zqsr3HN9jANYuAN96d74nhxb/q3nxGAEtaxfPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757589292; c=relaxed/simple;
	bh=eAdrPAZ3GXawVrWkGJf8v4SUTpXlecWFN6x2lLuoKj8=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=ulXKQdi8PHYHi4WyLEN1TRncaLhDCn/iRwX3HVmKRhnOgpKkyimX+dL9bNHOzBYhZ2jnUTNpaA4vugIq9MSjLMA5KllM5QGXVDWfTwfhiG9u3D4o6T0eRx44W2g5+58SyqSx9H+2SfISLL9SmLWESg7Gewau3qNRFKjPDRe0CdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rShC73/S; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D43BF520;
	Thu, 11 Sep 2025 13:13:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757589212;
	bh=eAdrPAZ3GXawVrWkGJf8v4SUTpXlecWFN6x2lLuoKj8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=rShC73/SnWCxDLamRpbzde6a0RXH0p6QSXaoLAU80dDcD/WvJt3OhVXNrcrkWXHeK
	 zpV0lRGq4dRE8SDlnMWEszRv02lfouospTRvME529tD03Q1f1sAnKd0V84d7se6Nva
	 iK/IRFs8VEVS52ciTeX8SUA/aqoAhyA3ACCW9gPw=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250911-imx335_binning-v2-5-30a28df74df6@ideasonboard.com>
References: <20250911-imx335_binning-v2-0-30a28df74df6@ideasonboard.com> <20250911-imx335_binning-v2-5-30a28df74df6@ideasonboard.com>
Subject: Re: [PATCH v2 5/8] media: imx335: Handle runtime PM in leaf functions
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Tommaso Merciai <tomm.merciai@gmail.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Thu, 11 Sep 2025 12:14:45 +0100
Message-ID: <175758928516.1246375.13284167198046981915@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Jai Luthra (2025-09-11 09:14:21)
> Simplify .s_stream callback implementation by moving the runtime PM
> calls to the leaf functions. This patch should not affect any
> functionality.
>=20
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>

Looks reasonable to me and although the stop_streaming function changes
to no longer return a value - it was previously unused so no functional
change indeed as far as I can see:

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> ---
>  drivers/media/i2c/imx335.c | 51 ++++++++++++++++++++--------------------=
------
>  1 file changed, 22 insertions(+), 29 deletions(-)
>=20
> diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
> index 62a76517ecb263a4fd7e7a593c02a3cdaf3da190..7631f41e6f1e65695fb76a66d=
9ac5a3588c69658 100644
> --- a/drivers/media/i2c/imx335.c
> +++ b/drivers/media/i2c/imx335.c
> @@ -919,13 +919,17 @@ static int imx335_start_streaming(struct imx335 *im=
x335)
>         const struct imx335_reg_list *reg_list;
>         int ret;
> =20
> +       ret =3D pm_runtime_resume_and_get(imx335->dev);
> +       if (ret < 0)
> +               return ret;
> +
>         /* Setup PLL */
>         reg_list =3D &link_freq_reglist[__ffs(imx335->link_freq_bitmap)];
>         ret =3D cci_multi_reg_write(imx335->cci, reg_list->regs,
>                                   reg_list->num_of_regs, NULL);
>         if (ret) {
>                 dev_err(imx335->dev, "%s failed to set plls\n", __func__);
> -               return ret;
> +               goto err_rpm_put;
>         }
> =20
>         /* Write sensor mode registers */
> @@ -934,27 +938,27 @@ static int imx335_start_streaming(struct imx335 *im=
x335)
>                                   reg_list->num_of_regs, NULL);
>         if (ret) {
>                 dev_err(imx335->dev, "fail to write initial registers\n");
> -               return ret;
> +               goto err_rpm_put;
>         }
> =20
>         ret =3D imx335_set_framefmt(imx335);
>         if (ret) {
>                 dev_err(imx335->dev, "%s failed to set frame format: %d\n=
",
>                         __func__, ret);
> -               return ret;
> +               goto err_rpm_put;
>         }
> =20
>         /* Configure lanes */
>         ret =3D cci_write(imx335->cci, IMX335_REG_LANEMODE,
>                         imx335->lane_mode, NULL);
>         if (ret)
> -               return ret;
> +               goto err_rpm_put;
> =20
>         /* Setup handler will write actual exposure and gain */
>         ret =3D  __v4l2_ctrl_handler_setup(imx335->sd.ctrl_handler);
>         if (ret) {
>                 dev_err(imx335->dev, "fail to setup handler\n");
> -               return ret;
> +               goto err_rpm_put;
>         }
> =20
>         /* Start streaming */
> @@ -962,25 +966,29 @@ static int imx335_start_streaming(struct imx335 *im=
x335)
>                         IMX335_MODE_STREAMING, NULL);
>         if (ret) {
>                 dev_err(imx335->dev, "fail to start streaming\n");
> -               return ret;
> +               goto err_rpm_put;
>         }
> =20
>         /* Initial regulator stabilization period */
>         usleep_range(18000, 20000);
> =20
>         return 0;
> +
> +err_rpm_put:
> +       pm_runtime_put(imx335->dev);
> +
> +       return ret;
>  }
> =20
>  /**
>   * imx335_stop_streaming() - Stop sensor stream
>   * @imx335: pointer to imx335 device
> - *
> - * Return: 0 if successful, error code otherwise.
>   */
> -static int imx335_stop_streaming(struct imx335 *imx335)
> +static void imx335_stop_streaming(struct imx335 *imx335)
>  {
> -       return cci_write(imx335->cci, IMX335_REG_MODE_SELECT,
> -                        IMX335_MODE_STANDBY, NULL);
> +       cci_write(imx335->cci, IMX335_REG_MODE_SELECT,
> +                 IMX335_MODE_STANDBY, NULL);
> +       pm_runtime_put(imx335->dev);
>  }
> =20
>  /**
> @@ -993,30 +1001,15 @@ static int imx335_stop_streaming(struct imx335 *im=
x335)
>  static int imx335_set_stream(struct v4l2_subdev *sd, int enable)
>  {
>         struct imx335 *imx335 =3D to_imx335(sd);
> -       int ret;
> +       int ret =3D 0;
> =20
>         mutex_lock(&imx335->mutex);
> =20
> -       if (enable) {
> -               ret =3D pm_runtime_resume_and_get(imx335->dev);
> -               if (ret)
> -                       goto error_unlock;
> -
> +       if (enable)
>                 ret =3D imx335_start_streaming(imx335);
> -               if (ret)
> -                       goto error_power_off;
> -       } else {
> +       else
>                 imx335_stop_streaming(imx335);
> -               pm_runtime_put(imx335->dev);
> -       }
> -
> -       mutex_unlock(&imx335->mutex);
> =20
> -       return 0;
> -
> -error_power_off:
> -       pm_runtime_put(imx335->dev);
> -error_unlock:
>         mutex_unlock(&imx335->mutex);
> =20
>         return ret;
>=20
> --=20
> 2.51.0
>

