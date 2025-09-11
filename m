Return-Path: <linux-media+bounces-42324-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6D6B5314B
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 13:46:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F292586201
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 11:46:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CE712D7D27;
	Thu, 11 Sep 2025 11:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="neQOcDIq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A83822127B;
	Thu, 11 Sep 2025 11:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757591173; cv=none; b=lYqAD4mxNsYzsuOrU0GLl7MIXvXM6abiMNDoRV8vdNqy4xWw4VFnAgoFPvF3ha3New+u2Tb3bnROhGZF+Ykyq2B7BPxk/gURfbD/okJ6ao9InCwRP81NopPZOyXUThXB5EwskdNJiiwilk5pDV4LSaKS+mnMAgl2xhHfJ/fWmqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757591173; c=relaxed/simple;
	bh=i6adV/YvvfS3A0eCN3aNnsH8pWOr3Go3Jeg8Z9Js2dQ=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=eQ5ctco9rCLic1Btv1hD8wYdSe8COGTulnIXhz2eNigAb9ZqLpyJ4gjK0cjHN8REIWKxnsQx6MnNnDongvzj7B82yWHXAUFte+t9yI7/fGD279e8SBNirqhLjIho3kVrDUWeE/FTa4We5y0CfE4k2KrPWvPU5/2g8p59uvcPDh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=neQOcDIq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 95990593;
	Thu, 11 Sep 2025 13:44:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757591095;
	bh=i6adV/YvvfS3A0eCN3aNnsH8pWOr3Go3Jeg8Z9Js2dQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=neQOcDIqb24rv6kVas+prerXQxMyJdwfajzdf077qOjbV2ZVjzpQSu0WM9ClFGvPS
	 iMACgKv0VGynZIoM+dEf4Iz+lx6ojrh/nDh86qG34MSTJU5MoDHWRQHBTNOsQqv8Xx
	 jWKI4BRinfBvPQH4rS7jixyBukPglEs/gyG2jy6Q=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250911-imx335_binning-v2-8-30a28df74df6@ideasonboard.com>
References: <20250911-imx335_binning-v2-0-30a28df74df6@ideasonboard.com> <20250911-imx335_binning-v2-8-30a28df74df6@ideasonboard.com>
Subject: Re: [PATCH v2 8/8] media: imx335: Switch to {enable,disable}_streams
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Tommaso Merciai <tomm.merciai@gmail.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Thu, 11 Sep 2025 12:46:07 +0100
Message-ID: <175759116755.1246375.6132980092125123604@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Jai Luthra (2025-09-11 09:14:24)
> Switch from s_stream to enable_streams and disable_streams callbacks.
>=20

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
>  drivers/media/i2c/imx335.c | 53 +++++++++++++++++++++-------------------=
------
>  1 file changed, 24 insertions(+), 29 deletions(-)
>=20
> diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
> index c985edab7e2a965ccd9427b013cbb3fa8778de2b..a1af70d050bca79255ac9303e=
8508de919bc4fdc 100644
> --- a/drivers/media/i2c/imx335.c
> +++ b/drivers/media/i2c/imx335.c
> @@ -1019,13 +1019,19 @@ static int imx335_set_framefmt(struct imx335 *imx=
335)
>  }
> =20
>  /**
> - * imx335_start_streaming() - Start sensor stream
> - * @imx335: pointer to imx335 device
> + * imx335_enable_streams() - Enable sensor streams
> + * @sd: V4L2 subdevice
> + * @state: V4L2 subdevice state
> + * @pad: The pad to enable
> + * @streams_mask: Bitmask of streams to enable
>   *
>   * Return: 0 if successful, error code otherwise.
>   */
> -static int imx335_start_streaming(struct imx335 *imx335)
> +static int imx335_enable_streams(struct v4l2_subdev *sd,
> +                                struct v4l2_subdev_state *state, u32 pad,
> +                                u64 streams_mask)
>  {
> +       struct imx335 *imx335 =3D to_imx335(sd);
>         const struct imx335_reg_list *reg_list;
>         int ret;
> =20
> @@ -1099,37 +1105,24 @@ static int imx335_start_streaming(struct imx335 *=
imx335)
>  }
> =20
>  /**
> - * imx335_stop_streaming() - Stop sensor stream
> - * @imx335: pointer to imx335 device
> - */
> -static void imx335_stop_streaming(struct imx335 *imx335)
> -{
> -       cci_write(imx335->cci, IMX335_REG_MODE_SELECT,
> -                 IMX335_MODE_STANDBY, NULL);
> -       pm_runtime_put(imx335->dev);
> -}
> -
> -/**
> - * imx335_set_stream() - Enable sensor streaming
> - * @sd: pointer to imx335 subdevice
> - * @enable: set to enable sensor streaming
> + * imx335_disable_streams() - Disable sensor streams
> + * @sd: V4L2 subdevice
> + * @state: V4L2 subdevice state
> + * @pad: The pad to disable
> + * @streams_mask: Bitmask of streams to disable
>   *
>   * Return: 0 if successful, error code otherwise.
>   */
> -static int imx335_set_stream(struct v4l2_subdev *sd, int enable)
> +static int imx335_disable_streams(struct v4l2_subdev *sd,
> +                                  struct v4l2_subdev_state *state, u32 p=
ad,
> +                                  u64 streams_mask)
>  {
>         struct imx335 *imx335 =3D to_imx335(sd);
> -       struct v4l2_subdev_state *state;
> -       int ret =3D 0;
> -
> -       state =3D v4l2_subdev_lock_and_get_active_state(sd);
> -
> -       if (enable)
> -               ret =3D imx335_start_streaming(imx335);
> -       else
> -               imx335_stop_streaming(imx335);
> +       int ret;
> =20
> -       v4l2_subdev_unlock_state(state);
> +       ret =3D cci_write(imx335->cci, IMX335_REG_MODE_SELECT,
> +                       IMX335_MODE_STANDBY, NULL);
> +       pm_runtime_put(imx335->dev);
> =20
>         return ret;
>  }
> @@ -1249,7 +1242,7 @@ static int imx335_parse_hw_config(struct imx335 *im=
x335)
> =20
>  /* V4l2 subdevice ops */
>  static const struct v4l2_subdev_video_ops imx335_video_ops =3D {
> -       .s_stream =3D imx335_set_stream,
> +       .s_stream =3D v4l2_subdev_s_stream_helper,
>  };
> =20
>  static const struct v4l2_subdev_pad_ops imx335_pad_ops =3D {
> @@ -1259,6 +1252,8 @@ static const struct v4l2_subdev_pad_ops imx335_pad_=
ops =3D {
>         .set_selection =3D imx335_get_selection,
>         .get_fmt =3D v4l2_subdev_get_fmt,
>         .set_fmt =3D imx335_set_pad_format,
> +       .enable_streams =3D imx335_enable_streams,
> +       .disable_streams =3D imx335_disable_streams,
>  };
> =20
>  static const struct v4l2_subdev_ops imx335_subdev_ops =3D {
>=20
> --=20
> 2.51.0
>

