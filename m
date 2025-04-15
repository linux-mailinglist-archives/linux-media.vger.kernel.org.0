Return-Path: <linux-media+bounces-30267-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE54AA8A0DF
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 16:21:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4B113AEFBD
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 14:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AA55274667;
	Tue, 15 Apr 2025 14:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="GqsIkBOX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25FC28466B
	for <linux-media@vger.kernel.org>; Tue, 15 Apr 2025 14:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744726861; cv=none; b=DGq9ztIO+LxBBPcV+zGuRrlB1FuFlSqmU/bmiA83rtowMDPuuaU/pt2ex9myU48MD/D4GXQbN1YAP62y22Uxfg0Y5T3zpubN2zXPpPKo+HvvmHx2IXDPVgoLcz8xntGaD/pGkJfmDZxWqLiXlZHU57DDglo7urE5SWpsmwndIcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744726861; c=relaxed/simple;
	bh=4AFgrwsIfzL+Gr4JUkL1JfanzHBZAokkO/DURSHeGBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YMf5ECVRYCN5qVT7u4aV5iNrqIxj4k8EFu+8lTl51KwAS4CvIehEU+T0zhs49VzkYDaPVe6ccWSL63ZW5iw1evEalqCwYsprAmPnUD9AzllpHM1G8DsAU0siiO4kZlRjZ6oQF8CoxFxStcl/xj9j14orgVTlPwPkKSa9/EZqS38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=GqsIkBOX; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6fece18b3c8so54326117b3.3
        for <linux-media@vger.kernel.org>; Tue, 15 Apr 2025 07:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1744726858; x=1745331658; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qGz4sdb2FW3UTtHyV6VKldDsfJAeyEdkakQqD81wq/Y=;
        b=GqsIkBOX68777F13sAPs4rfjM7KxonkNowcDKMztRjpK6bjX8WT92qZXJ0WtZCYZU7
         5yvB1FqZT6aI3NCSGYCj10b8jsUqj3gPWpVggbi4GAT0At1MGCBnQLbbIPpm2QNJaBFd
         mJSyL2lU7eZaqdX0CT/zY7L+dqFTR6XE/+8rq1G5yY3/EUnXetwHoU4EnYOfkdS0x8W9
         XSePafhcdeBSc+n+Jnp8bGfpI9P/eARvdYRDvqPSvJ5Ke9F0VL+T4JaClSrRuQ+HDCKj
         1+r2nb4KZF4d0EODrNC/2eKELgoGWRMjrhaYf83Rv73NtH8YIJ74pTQBNcFT0qfuaC8b
         1+RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744726858; x=1745331658;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qGz4sdb2FW3UTtHyV6VKldDsfJAeyEdkakQqD81wq/Y=;
        b=D1Pr3IeGa0XgKfn4kueOu641Oziw6aCw7TQZ7zqb5zyi6N3lqFL6JcmkEvKxi9Mj2Z
         kisneOiemwCBk5G1D2XfeqLC7roFs6Gw8MDoR0KEw9pzz3AVS7hwVjLGPJDWTu44mWcB
         K+58TcAv5UZ2WlfV7E56DIwbSf0Jc/c+J2YravmeZthJwgbS5+8nNZM1FIzUqI0iUSRA
         G7uhO7XYDvzG3vVMv2Tp6kHP03b/75IbhGQk34V0UlkeMMWsKtsw0zzyTm8CY6O/H0gi
         slwNSRcdu72YOxjQXSu7RgiGEwF5THhUDzKQyEtHHEKrVpL34m7o9GOYeMY1htuqdFDF
         CtXw==
X-Gm-Message-State: AOJu0YxPWzoVkvhnFIBI/d6MBxHbsRsVyc7KuX5aYX3OMNUJssbn2zY6
	zENEM4EesE8hFRQQc5/1a2Dikox3/N4igtyormWdGdlu7vlGI5Yj2OuiXxpg8TbLH3MhhvKHgNH
	acWcWmX45NO07XTcfgZSA4x1zfQVbTxvNiFaVPg==
X-Gm-Gg: ASbGncuMBgz5o9Vdp3iMALh58g8nfPnZlt/sNiLgEeg8PdLWiIlQm7KLp3Rnp0ESmLb
	l61avBtNfZCImEJqdei2Bg2Bm2ryDGL0Ku7f6z+LtB6DdCG0PQDrhQJiEdNaOVE5mcuaoYiAjFB
	4p/ell+UGqZH2BwT82F+z3PR/5ZZQqOdKLk7TeCQF00mGTkpsPdc1jZg==
X-Google-Smtp-Source: AGHT+IFDITso3tBaUOn7ZqV62ZEHd6zCsmHKshAsYU1WYofpZTKhEe1wz3K9Vw+8auCPzyxljcgVx1F7/1ghy2BZVhM=
X-Received: by 2002:a05:690c:6e04:b0:6fb:9280:5bf4 with SMTP id
 00721157ae682-70559a61875mr283213537b3.30.1744726858413; Tue, 15 Apr 2025
 07:20:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230924153309.12423-1-laurent.pinchart@ideasonboard.com> <20230924153309.12423-19-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20230924153309.12423-19-laurent.pinchart@ideasonboard.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 15 Apr 2025 15:20:40 +0100
X-Gm-Features: ATxdqUGVqZ09aNouYMdzgfaylJkUMBfu1088DbOIZ5b84M_-jmGQo6i7ZE2DleA
Message-ID: <CAPY8ntDmDkh+RM6knYMqqgpN11KhjaFUAowMsGmhV_3b92oN-A@mail.gmail.com>
Subject: Re: [PATCH v4 18/20] media: i2c: imx219: Calculate crop rectangle dynamically
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Sun, 24 Sept 2023 at 16:33, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Calculate the crop rectangle size and location dynamically when setting
> the format, instead of storing it in the imx219_mode structure. This
> removes duplicated information from the mode, to guarantee consistency.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
> Changes since v2:
>
> - Handle horizontal and vertical binning separately
> ---
>  drivers/media/i2c/imx219.c | 45 +++++++++++++-------------------------
>  1 file changed, 15 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index bf1c2a1dad95..2b88c5b8a7bf 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -18,6 +18,7 @@
>  #include <linux/delay.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/i2c.h>
> +#include <linux/minmax.h>
>  #include <linux/module.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regulator/consumer.h>
> @@ -153,9 +154,6 @@ struct imx219_mode {
>         /* Frame height */
>         unsigned int height;
>
> -       /* Analog crop rectangle. */
> -       struct v4l2_rect crop;
> -
>         /* V-timing */
>         unsigned int vts_def;
>  };
> @@ -292,48 +290,24 @@ static const struct imx219_mode supported_modes[] = {
>                 /* 8MPix 15fps mode */
>                 .width = 3280,
>                 .height = 2464,
> -               .crop = {
> -                       .left = IMX219_PIXEL_ARRAY_LEFT,
> -                       .top = IMX219_PIXEL_ARRAY_TOP,
> -                       .width = 3280,
> -                       .height = 2464
> -               },
>                 .vts_def = 3526,
>         },
>         {
>                 /* 1080P 30fps cropped */
>                 .width = 1920,
>                 .height = 1080,
> -               .crop = {
> -                       .left = 688,
> -                       .top = 700,
> -                       .width = 1920,
> -                       .height = 1080
> -               },
>                 .vts_def = 1763,
>         },
>         {
>                 /* 2x2 binned 30fps mode */
>                 .width = 1640,
>                 .height = 1232,
> -               .crop = {
> -                       .left = IMX219_PIXEL_ARRAY_LEFT,
> -                       .top = IMX219_PIXEL_ARRAY_TOP,
> -                       .width = 3280,
> -                       .height = 2464
> -               },
>                 .vts_def = 1763,
>         },
>         {
>                 /* 640x480 30fps mode */
>                 .width = 640,
>                 .height = 480,
> -               .crop = {
> -                       .left = 1008,
> -                       .top = 760,
> -                       .width = 1280,
> -                       .height = 960
> -               },
>                 .vts_def = 1763,
>         },
>  };
> @@ -844,6 +818,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>         int exposure_max, exposure_def, hblank;
>         struct v4l2_mbus_framefmt *format;
>         struct v4l2_rect *crop;
> +       unsigned int bin_h, bin_v;
>
>         mode = v4l2_find_nearest_size(supported_modes,
>                                       ARRAY_SIZE(supported_modes),
> @@ -853,10 +828,20 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>         imx219_update_pad_format(imx219, mode, &fmt->format, fmt->format.code);
>
>         format = v4l2_subdev_get_pad_format(sd, sd_state, 0);
> -       crop = v4l2_subdev_get_pad_crop(sd, sd_state, 0);
> -
>         *format = fmt->format;
> -       *crop = mode->crop;
> +
> +       /*
> +        * Use binning to maximize the crop rectangle size, and centre it in the
> +        * sensor.
> +        */
> +       bin_h = min(IMX219_PIXEL_ARRAY_WIDTH / format->width, 2U);
> +       bin_v = min(IMX219_PIXEL_ARRAY_HEIGHT / format->height, 2U);

This patch missed 6.6 as the previous LTS, so we've only just noticed
this regression with 6.12. It's also present in 6.15-rc2.

The 1920x1080 mode will give you bin_h of 1, but bin_v of 2 as 1080 <
(2480/2). You therefore get a weirdly stretched image from the sensor.

I accept that having a nicely generic cropping/binning configuration
is ideal, but currently this is a mode based driver, and there is no
API to allow for configuring generic cropping/binning configuration.
Until that API exists and can be implemented for previously mode-based
drivers without regression, I see the only real options being either
- move the binning setup back into struct imx219_mode and defined in
supported modes
- set the two binning values to be the same as the minimum of the two
computed values.
Which would be preferred?

Thanks
  Dave

> +
> +       crop = v4l2_subdev_get_pad_crop(sd, sd_state, 0);
> +       crop->width = format->width * bin_h;
> +       crop->height = format->height * bin_v;
> +       crop->left = (IMX219_NATIVE_WIDTH - crop->width) / 2;
> +       crop->top = (IMX219_NATIVE_HEIGHT - crop->height) / 2;
>
>         if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
>                 /* Update limits and set FPS to default */
> --
> Regards,
>
> Laurent Pinchart
>

