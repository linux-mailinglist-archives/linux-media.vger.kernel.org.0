Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A182D6E1FC
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2019 09:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726239AbfGSHw5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Jul 2019 03:52:57 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:33082 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726076AbfGSHw5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Jul 2019 03:52:57 -0400
Received: by mail-wm1-f68.google.com with SMTP id h19so23127717wme.0
        for <linux-media@vger.kernel.org>; Fri, 19 Jul 2019 00:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=MS526RM6cOro9BioQ/3mnBdhtpOHSbh595z8uGfOaiw=;
        b=fD9Z3HsDps0J8jHUd8M1mY05N+unMLVeXsuZtf3fKMWuLDPiWvGsAxmO7kK/jNipGt
         cugiBqNcCcm2wCE8KsyEpAxmt1yOIN0FmA4p97HmEjSJo/CJsAewbCNI3VLMYVW8CZ6V
         LZVyB+VOq1LzdUuJumq+CqBRfVE9c5lVvWMJlS7hSyyUjexIGBbLP/oc6MBMaqopv63R
         gzpags5rv6p2PMPMG34y6hiJMxputu/sQoK7n7B1xG0hipM1GUfhI3jOJGnR/hX6Akpf
         7Z+xewLvrJ0+xc+nvgQ5DsHQXXZcZqyzIDRktyT0Fy3uSTJt7JFJrb1RjrRpXijaLjk6
         TeCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=MS526RM6cOro9BioQ/3mnBdhtpOHSbh595z8uGfOaiw=;
        b=fLr2iK1bE8F54/Q6BU+aRZ4O24F5FzJjxDw3y6GYEnTbL1TIQNcInDlHjMr9m4Jnqg
         41POE6/uAcsNw4x0rr1RvJFuDBPM2N33KVz3MLEDBwp1BfggyIwt8G6zjHI0mC6D7Rkr
         EYI8F2T4m8SlRCEh3hzK/QuZtWAQwZIkYnB20MOncLTCEMcDQlgLqOncSPu2/3VfQq9l
         /O6yPdlW+MjOnYFxgL99WAWzvlU0HQoT00uR1fpUBlAm2kNliqon0+yeFsjv/eTufF2O
         u61AY+zhKKHAIWgKe6tB+hRQVQoWjsn280aZ+N32RX9yvcLZ0ol3ueICAeix3H/hajO2
         2xlA==
X-Gm-Message-State: APjAAAX4fucDz02bA2ejmGs4sSlwf4Lbi5JCwIfjoi2zyLgQfiAAzqCA
        4ToIswoa8uv+W6eipI1qzGa7sQ==
X-Google-Smtp-Source: APXvYqwOewNnQRDDmR+9DduxAaSo3r2RHXllhaws/df0eE9/9T92k+dTPfGORvwHnAC6SbrsakFNyA==
X-Received: by 2002:a7b:c0d0:: with SMTP id s16mr34909816wmh.136.1563522775280;
        Fri, 19 Jul 2019 00:52:55 -0700 (PDT)
Received: from arch-late (87-196-80-194.net.novis.pt. [87.196.80.194])
        by smtp.gmail.com with ESMTPSA id v5sm31433566wre.50.2019.07.19.00.52.53
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 19 Jul 2019 00:52:54 -0700 (PDT)
References: <854769c0-c933-0919-2798-e8286e1694fb@xs4all.nl>
User-agent: mu4e 1.2.0; emacs 27.0.50
From:   Rui Miguel Silva <rui.silva@linaro.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Prabhakar Lad <prabhakar.csengg@gmail.com>,
        Akinobu Mita <akinobu.mita@gmail.com>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: Re: [PATCH] media/i2c: don't return ENOTTY if SUBDEV_API is not set
In-reply-to: <854769c0-c933-0919-2798-e8286e1694fb@xs4all.nl>
Date:   Fri, 19 Jul 2019 08:52:52 +0100
Message-ID: <m3zhla5uln.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,
On Wed 17 Jul 2019 at 10:24, Hans Verkuil wrote:
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
>  drivers/media/i2c/ov2680.c  | 5 +----
>  drivers/media/i2c/ov5695.c  | 5 +----
>  drivers/media/i2c/ov7740.c  | 8 ++------
>  6 files changed, 7 insertions(+), 19 deletions(-)
>

for the ov2680:
Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>

---
Cheers,
	Rui


> diff --git a/drivers/media/i2c/mt9m111.c b/drivers/media/i2c/mt9m111.c
> index d10fe3712036..d4864d155f0b 100644
> --- a/drivers/media/i2c/mt9m111.c
> +++ b/drivers/media/i2c/mt9m111.c
> @@ -536,7 +536,7 @@ static int mt9m111_get_fmt(struct v4l2_subdev *sd,
>  		format->format = *mf;
>  		return 0;
>  #else
> -		return -ENOTTY;
> +		return -EINVAL;
>  #endif
>  	}
>
> diff --git a/drivers/media/i2c/ov2640.c b/drivers/media/i2c/ov2640.c
> index 30e7e6b2b293..39474b287bb2 100644
> --- a/drivers/media/i2c/ov2640.c
> +++ b/drivers/media/i2c/ov2640.c
> @@ -932,7 +932,7 @@ static int ov2640_get_fmt(struct v4l2_subdev *sd,
>  		format->format = *mf;
>  		return 0;
>  #else
> -		return -ENOTTY;
> +		return -EINVAL;
>  #endif
>  	}
>
> diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
> index 5ed2413eac8a..a71277e361ff 100644
> --- a/drivers/media/i2c/ov2659.c
> +++ b/drivers/media/i2c/ov2659.c
> @@ -1055,7 +1055,7 @@ static int ov2659_get_fmt(struct v4l2_subdev *sd,
>  		mutex_unlock(&ov2659->lock);
>  		return 0;
>  #else
> -	return -ENOTTY;
> +		return -EINVAL;
>  #endif
>  	}
>
> @@ -1131,8 +1131,6 @@ static int ov2659_set_fmt(struct v4l2_subdev *sd,
>  #ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
>  		mf = v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
>  		*mf = fmt->format;
> -#else
> -		ret = -ENOTTY;
>  #endif
>  	} else {
>  		s64 val;
> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
> index b10bcfabaeeb..164f983c1814 100644
> --- a/drivers/media/i2c/ov2680.c
> +++ b/drivers/media/i2c/ov2680.c
> @@ -675,7 +675,7 @@ static int ov2680_get_fmt(struct v4l2_subdev *sd,
>  #ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
>  		fmt = v4l2_subdev_get_try_format(&sensor->sd, cfg, format->pad);
>  #else
> -		ret = -ENOTTY;
> +		ret = -EINVAL;
>  #endif
>  	} else {
>  		fmt = &sensor->fmt;
> @@ -723,10 +723,7 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
>  #ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
>  		try_fmt = v4l2_subdev_get_try_format(sd, cfg, 0);
>  		format->format = *try_fmt;
> -#else
> -		ret = -ENOTTY;
>  #endif
> -
>  		goto unlock;
>  	}
>
> diff --git a/drivers/media/i2c/ov5695.c b/drivers/media/i2c/ov5695.c
> index e65a94353175..34b7046d9702 100644
> --- a/drivers/media/i2c/ov5695.c
> +++ b/drivers/media/i2c/ov5695.c
> @@ -823,9 +823,6 @@ static int ov5695_set_fmt(struct v4l2_subdev *sd,
>  	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
>  #ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
>  		*v4l2_subdev_get_try_format(sd, cfg, fmt->pad) = fmt->format;
> -#else
> -		mutex_unlock(&ov5695->mutex);
> -		return -ENOTTY;
>  #endif
>  	} else {
>  		ov5695->cur_mode = mode;
> @@ -856,7 +853,7 @@ static int ov5695_get_fmt(struct v4l2_subdev *sd,
>  		fmt->format = *v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
>  #else
>  		mutex_unlock(&ov5695->mutex);
> -		return -ENOTTY;
> +		return -EINVAL;
>  #endif
>  	} else {
>  		fmt->format.width = mode->width;
> diff --git a/drivers/media/i2c/ov7740.c b/drivers/media/i2c/ov7740.c
> index 70bb870b1d08..a2f8f19bca7c 100644
> --- a/drivers/media/i2c/ov7740.c
> +++ b/drivers/media/i2c/ov7740.c
> @@ -827,13 +827,9 @@ static int ov7740_set_fmt(struct v4l2_subdev *sd,
>  #ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
>  		mbus_fmt = v4l2_subdev_get_try_format(sd, cfg, format->pad);
>  		*mbus_fmt = format->format;
> -
> +#endif
>  		mutex_unlock(&ov7740->mutex);
>  		return 0;
> -#else
> -		ret = -ENOTTY;
> -		goto error;
> -#endif
>  	}
>
>  	ret = ov7740_try_fmt_internal(sd, &format->format, &ovfmt, &fsize);
> @@ -868,7 +864,7 @@ static int ov7740_get_fmt(struct v4l2_subdev *sd,
>  		format->format = *mbus_fmt;
>  		ret = 0;
>  #else
> -		ret = -ENOTTY;
> +		ret = -EINVAL;
>  #endif
>  	} else {
>  		format->format = ov7740->format;

