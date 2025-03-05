Return-Path: <linux-media+bounces-27566-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A09A4F9E6
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 10:25:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D42E7A3815
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 09:24:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9713520468F;
	Wed,  5 Mar 2025 09:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tYIHersJ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3289A1CD21C;
	Wed,  5 Mar 2025 09:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741166728; cv=none; b=dbq8GH1FJnEDtIVDuADzC5TKgzHIdHZRpnACBVUrwfbYHZbf2FWabhV2Bs7pbQCbKWfAH7AXlxNnD1vkAyKTo/aoRXLjDSKtheT5kpb2RgnRMVaUAUC/TUbzGDFUwTGO45vTETU0qFpQQACAahY2w4tDO6CoGuQtdaK4c14bxK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741166728; c=relaxed/simple;
	bh=xhlx2MiJq8nYuUcx9JIk8rw8O4jgX6l1eI6LXGFmacE=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=orLkUztILF+ZyZZuu3DZKvHQs3ioO8GPLWZcwWCsgoFr7hoTDy/PDJ8mZpeL09ljnIelGIib0eZWpaJOJxJoj+pFUJcGyjzugCb5W4EuyEQNdUV5qhwZWTuHrb/WElMsvac6PKRF0bAQAJ1hqdw9tpgSd5IK3GVLu76h6kd95dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tYIHersJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8304C63F;
	Wed,  5 Mar 2025 10:23:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1741166631;
	bh=xhlx2MiJq8nYuUcx9JIk8rw8O4jgX6l1eI6LXGFmacE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=tYIHersJn8pAKNlvbR4JxMCLipGnD/eLj6ZscuGGuI5XCKtZtjPfQWUMn/5EntCie
	 yjZP7UGai3q7wvpLV0DgAWIZHMw25a3Ik007TWiHmkPxYOVddrU1dCv6MCeHpZf/dX
	 hf4UNPLg7nYn3QCZaETVFYY2s3VJQTUyuKsT++bY=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250305061309.17911-2-tarang.raval@siliconsignals.io>
References: <20250305061309.17911-1-tarang.raval@siliconsignals.io> <20250305061309.17911-2-tarang.raval@siliconsignals.io>
Subject: Re: [PATCH v2 1/2] media: i2c: imx219: switch to {enable,disable}_streams
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Tarang Raval <tarang.raval@siliconsignals.io>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
To: Tarang Raval <tarang.raval@siliconsignals.io>, sakari.ailus@linux.intel.com
Date: Wed, 05 Mar 2025 09:25:21 +0000
Message-ID: <174116672182.2914008.912215873023431841@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Tarang Raval (2025-03-05 06:13:08)
> Switch from s_stream to enable_streams and disable_streams callbacks.
>=20
> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
> ---
>  drivers/media/i2c/imx219.c | 43 +++++++++++++++-----------------------
>  1 file changed, 17 insertions(+), 26 deletions(-)
>=20
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index f662c9d75511..75d3123d47b4 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -723,12 +723,17 @@ static int imx219_configure_lanes(struct imx219 *im=
x219)
>                                   ARRAY_SIZE(imx219_4lane_regs), NULL);
>  };
> =20
> -static int imx219_start_streaming(struct imx219 *imx219,
> -                                 struct v4l2_subdev_state *state)
> +static int imx219_enable_streams(struct v4l2_subdev *sd,
> +                                struct v4l2_subdev_state *state, u32 pad,
> +                                u64 streams_mask)
>  {
> +       struct imx219 *imx219 =3D to_imx219(sd);
>         struct i2c_client *client =3D v4l2_get_subdevdata(&imx219->sd);
>         int ret;
> =20
> +       if (pad !=3D 0)
> +               return -EINVAL;
> +
>         ret =3D pm_runtime_resume_and_get(&client->dev);
>         if (ret < 0)
>                 return ret;
> @@ -767,10 +772,6 @@ static int imx219_start_streaming(struct imx219 *imx=
219,
>         if (ret)
>                 goto err_rpm_put;
> =20
> -       /* vflip and hflip cannot change during streaming */
> -       __v4l2_ctrl_grab(imx219->vflip, true);
> -       __v4l2_ctrl_grab(imx219->hflip, true);
> -

Why do you drop these lines? It's not mentioned in the commit message.
Are these handled somewhere else now ?

--
Kieran


>         return 0;
> =20
>  err_rpm_put:
> @@ -778,37 +779,25 @@ static int imx219_start_streaming(struct imx219 *im=
x219,
>         return ret;
>  }
> =20
> -static void imx219_stop_streaming(struct imx219 *imx219)
> +static int imx219_disable_streams(struct v4l2_subdev *sd,
> +                                 struct v4l2_subdev_state *state, u32 pa=
d,
> +                                 u64 streams_mask)
>  {
> +       struct imx219 *imx219 =3D to_imx219(sd);
>         struct i2c_client *client =3D v4l2_get_subdevdata(&imx219->sd);
>         int ret;
> =20
> +       if (pad !=3D 0)
> +               return -EINVAL;
> +
>         /* set stream off register */
>         ret =3D cci_write(imx219->regmap, IMX219_REG_MODE_SELECT,
>                         IMX219_MODE_STANDBY, NULL);
>         if (ret)
>                 dev_err(&client->dev, "%s failed to set stream\n", __func=
__);
> =20
> -       __v4l2_ctrl_grab(imx219->vflip, false);
> -       __v4l2_ctrl_grab(imx219->hflip, false);
> -
>         pm_runtime_put(&client->dev);
> -}
> -
> -static int imx219_set_stream(struct v4l2_subdev *sd, int enable)
> -{
> -       struct imx219 *imx219 =3D to_imx219(sd);
> -       struct v4l2_subdev_state *state;
> -       int ret =3D 0;
> -
> -       state =3D v4l2_subdev_lock_and_get_active_state(sd);
> -
> -       if (enable)
> -               ret =3D imx219_start_streaming(imx219, state);
> -       else
> -               imx219_stop_streaming(imx219);
> =20
> -       v4l2_subdev_unlock_state(state);
>         return ret;
>  }
> =20
> @@ -992,7 +981,7 @@ static int imx219_init_state(struct v4l2_subdev *sd,
>  }
> =20
>  static const struct v4l2_subdev_video_ops imx219_video_ops =3D {
> -       .s_stream =3D imx219_set_stream,
> +       .s_stream =3D v4l2_subdev_s_stream_helper,
>  };
> =20
>  static const struct v4l2_subdev_pad_ops imx219_pad_ops =3D {
> @@ -1001,6 +990,8 @@ static const struct v4l2_subdev_pad_ops imx219_pad_o=
ps =3D {
>         .set_fmt =3D imx219_set_pad_format,
>         .get_selection =3D imx219_get_selection,
>         .enum_frame_size =3D imx219_enum_frame_size,
> +       .enable_streams =3D imx219_enable_streams,
> +       .disable_streams =3D imx219_disable_streams,
>  };
> =20
>  static const struct v4l2_subdev_ops imx219_subdev_ops =3D {
> --=20
> 2.34.1
>

