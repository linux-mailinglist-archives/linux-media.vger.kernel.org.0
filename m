Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2DD46E1A6
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2019 09:25:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726243AbfGSHZN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Jul 2019 03:25:13 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:33517 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726036AbfGSHZN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Jul 2019 03:25:13 -0400
Received: by mail-ot1-f68.google.com with SMTP id q20so31760842otl.0
        for <linux-media@vger.kernel.org>; Fri, 19 Jul 2019 00:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zE/a1KbzeG8hrEZenxQ0lLrtjmciWvLlvHoD1SQWCy4=;
        b=vbVf4sDxTlsEB6AqA7T0B13EViouL/92a/514yfZ23GkQOnDYigmsvwjs5MViqw0gr
         LFbCGP4+YWIRax4L2DzOCCBCltG7ToF2cOpn27vSFE9P/DKVhgwProo0gdMjmO5iEjgA
         6S2ObgjlfYtxFkvTRZSMH9gJQyzBlhY80Bc03kSd7KLbs2medPr4hOcJngkcxvYAT59R
         Ea0dteOCojta8C64fV2RCTs0ZoPF+4WV10rImlhysOO+pIN2AHFF61U2c36qMB2GseKB
         pHMbLi2Nl+gOB1l0EdEo1IIULVNFlp0uIX0LpWlZD7wfrl/BD9D1UqpYKYn5zHD3R1KX
         Mn+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zE/a1KbzeG8hrEZenxQ0lLrtjmciWvLlvHoD1SQWCy4=;
        b=DpMsIJTtKTXIzbUpSeMhZLCRHjosnq9fPGJfGhtx7IDmVdAaMMDwFbWrdtGK2ZSriP
         D/IiqoZxD9kaxjytWa0xUkKron2XNTCf8SN+1ObBmorvzNBlWR9oNIjxp2uNwidhQ9m4
         QuTkQSXZeIUixr+Tqq//yREPOeHGqNd9vTUDdzgvuviB5wFtlTm3TIsDnpon0KfPiDjO
         4Ux2b3JhiLa2VOWEgR5ISGIKtKF2dpCcGHSLwXZWgVBenbWq4jSqt9p9VQib3omH7H1n
         OBc4kOMvbD8+44QfU2TB3Kvl2yJZqP4s59MvkRXe2DQeyqQb+IEiwJyO4AEtTEwSwxD7
         soOQ==
X-Gm-Message-State: APjAAAUn9YUgnEXte7avBy6B8zs/vSYzNnITwsVmFyt0nR9rURSbFJ3U
        vnSJs70D85t+tsE6j6FZUJR4I7ePHxzq0SxEsnc=
X-Google-Smtp-Source: APXvYqwY1GvonGVK2goHq4P3UZXDlrmjbGwo7Q1PWbrignHtTmC9B7OiFeGkYmrI/LJSHUS9gwXS4Qiz2M18nmp5UaQ=
X-Received: by 2002:a9d:65cb:: with SMTP id z11mr17325533oth.325.1563521112163;
 Fri, 19 Jul 2019 00:25:12 -0700 (PDT)
MIME-Version: 1.0
References: <854769c0-c933-0919-2798-e8286e1694fb@xs4all.nl>
In-Reply-To: <854769c0-c933-0919-2798-e8286e1694fb@xs4all.nl>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Fri, 19 Jul 2019 08:24:45 +0100
Message-ID: <CA+V-a8tPC3YA9SY_9FtEa7QHhBHWcG5w8t3a4cs1XBT_VX5u7g@mail.gmail.com>
Subject: Re: [PATCH] media/i2c: don't return ENOTTY if SUBDEV_API is not set
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Akinobu Mita <akinobu.mita@gmail.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Rui Miguel Silva <rui.silva@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the patch.

On Wed, Jul 17, 2019 at 10:24 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> If CONFIG_VIDEO_V4L2_SUBDEV_API is not set, then it is still possible
> to call set_fmt for V4L2_SUBDEV_FORMAT_TRY, the result is just not
> stored. So return 0 instead of -ENOTTY.
>
> Calling get_fmt with V4L2_SUBDEV_FORMAT_TRY should return -EINVAL
> instead of -ENOTTY, after all the get_fmt functionality is still
> present, just not supported for TRY.
>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
> This was fixed for the ov7670 (https://patchwork.linuxtv.org/patch/57584/) when
> working on the via-camera driver, but the same pattern is found in other drivers,
> and those are fixed in this patch.
> ---
>  drivers/media/i2c/mt9m111.c | 2 +-
>  drivers/media/i2c/ov2640.c  | 2 +-
>  drivers/media/i2c/ov2659.c  | 4 +---

for ov2659 changes,

Acked-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>

Cheers,
--Prabhakar Lad

>  drivers/media/i2c/ov2680.c  | 5 +----
>  drivers/media/i2c/ov5695.c  | 5 +----
>  drivers/media/i2c/ov7740.c  | 8 ++------
>  6 files changed, 7 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/media/i2c/mt9m111.c b/drivers/media/i2c/mt9m111.c
> index d10fe3712036..d4864d155f0b 100644
> --- a/drivers/media/i2c/mt9m111.c
> +++ b/drivers/media/i2c/mt9m111.c
> @@ -536,7 +536,7 @@ static int mt9m111_get_fmt(struct v4l2_subdev *sd,
>                 format->format = *mf;
>                 return 0;
>  #else
> -               return -ENOTTY;
> +               return -EINVAL;
>  #endif
>         }
>
> diff --git a/drivers/media/i2c/ov2640.c b/drivers/media/i2c/ov2640.c
> index 30e7e6b2b293..39474b287bb2 100644
> --- a/drivers/media/i2c/ov2640.c
> +++ b/drivers/media/i2c/ov2640.c
> @@ -932,7 +932,7 @@ static int ov2640_get_fmt(struct v4l2_subdev *sd,
>                 format->format = *mf;
>                 return 0;
>  #else
> -               return -ENOTTY;
> +               return -EINVAL;
>  #endif
>         }
>
> diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
> index 5ed2413eac8a..a71277e361ff 100644
> --- a/drivers/media/i2c/ov2659.c
> +++ b/drivers/media/i2c/ov2659.c
> @@ -1055,7 +1055,7 @@ static int ov2659_get_fmt(struct v4l2_subdev *sd,
>                 mutex_unlock(&ov2659->lock);
>                 return 0;
>  #else
> -       return -ENOTTY;
> +               return -EINVAL;
>  #endif
>         }
>
> @@ -1131,8 +1131,6 @@ static int ov2659_set_fmt(struct v4l2_subdev *sd,
>  #ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
>                 mf = v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
>                 *mf = fmt->format;
> -#else
> -               ret = -ENOTTY;
>  #endif
>         } else {
>                 s64 val;
> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
> index b10bcfabaeeb..164f983c1814 100644
> --- a/drivers/media/i2c/ov2680.c
> +++ b/drivers/media/i2c/ov2680.c
> @@ -675,7 +675,7 @@ static int ov2680_get_fmt(struct v4l2_subdev *sd,
>  #ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
>                 fmt = v4l2_subdev_get_try_format(&sensor->sd, cfg, format->pad);
>  #else
> -               ret = -ENOTTY;
> +               ret = -EINVAL;
>  #endif
>         } else {
>                 fmt = &sensor->fmt;
> @@ -723,10 +723,7 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
>  #ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
>                 try_fmt = v4l2_subdev_get_try_format(sd, cfg, 0);
>                 format->format = *try_fmt;
> -#else
> -               ret = -ENOTTY;
>  #endif
> -
>                 goto unlock;
>         }
>
> diff --git a/drivers/media/i2c/ov5695.c b/drivers/media/i2c/ov5695.c
> index e65a94353175..34b7046d9702 100644
> --- a/drivers/media/i2c/ov5695.c
> +++ b/drivers/media/i2c/ov5695.c
> @@ -823,9 +823,6 @@ static int ov5695_set_fmt(struct v4l2_subdev *sd,
>         if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
>  #ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
>                 *v4l2_subdev_get_try_format(sd, cfg, fmt->pad) = fmt->format;
> -#else
> -               mutex_unlock(&ov5695->mutex);
> -               return -ENOTTY;
>  #endif
>         } else {
>                 ov5695->cur_mode = mode;
> @@ -856,7 +853,7 @@ static int ov5695_get_fmt(struct v4l2_subdev *sd,
>                 fmt->format = *v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
>  #else
>                 mutex_unlock(&ov5695->mutex);
> -               return -ENOTTY;
> +               return -EINVAL;
>  #endif
>         } else {
>                 fmt->format.width = mode->width;
> diff --git a/drivers/media/i2c/ov7740.c b/drivers/media/i2c/ov7740.c
> index 70bb870b1d08..a2f8f19bca7c 100644
> --- a/drivers/media/i2c/ov7740.c
> +++ b/drivers/media/i2c/ov7740.c
> @@ -827,13 +827,9 @@ static int ov7740_set_fmt(struct v4l2_subdev *sd,
>  #ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
>                 mbus_fmt = v4l2_subdev_get_try_format(sd, cfg, format->pad);
>                 *mbus_fmt = format->format;
> -
> +#endif
>                 mutex_unlock(&ov7740->mutex);
>                 return 0;
> -#else
> -               ret = -ENOTTY;
> -               goto error;
> -#endif
>         }
>
>         ret = ov7740_try_fmt_internal(sd, &format->format, &ovfmt, &fsize);
> @@ -868,7 +864,7 @@ static int ov7740_get_fmt(struct v4l2_subdev *sd,
>                 format->format = *mbus_fmt;
>                 ret = 0;
>  #else
> -               ret = -ENOTTY;
> +               ret = -EINVAL;
>  #endif
>         } else {
>                 format->format = ov7740->format;
> --
> 2.20.1
>
