Return-Path: <linux-media+bounces-46227-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B3BC2DA03
	for <lists+linux-media@lfdr.de>; Mon, 03 Nov 2025 19:18:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7615B189B510
	for <lists+linux-media@lfdr.de>; Mon,  3 Nov 2025 18:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F3DD23D7F4;
	Mon,  3 Nov 2025 18:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="lFgd8s97"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D522264C8
	for <linux-media@vger.kernel.org>; Mon,  3 Nov 2025 18:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762193874; cv=none; b=OtDeqL515KT9oKlGY8HiY3Xj6YqkZYzUWJnj6MxAi95LDnTQ8J9iDzZxdWXNFjUYf1LnNs5vh46BhqZ45CHgopi3GBnCRoWHY3V7/G0scM7Bqrx9OqwAb8mBREpf4G8eb+P4nTUCzNfuKSXU7B/pQb553H//HunCkcnZ01ue8sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762193874; c=relaxed/simple;
	bh=q3logXzsizlE7vxCDEHKIRUBbcalhSKwMKCC5YbOdeg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=itfsw03/TsCDS4ac+UBCwRxxXrapri6hJlUdYtS4byTa3TR5tSUuZOBrtC7MeuZzxTgIkAzymjTu8GHVrHflgGK7NmcyjUJaSjqw6NHyokPcLy3J6MZOL94U0jat6b2zsZpEH0sEJHOcGcjaIGFR+G6larBCHvqqr9LNUJQtDHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=lFgd8s97; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-78488cdc20aso60154567b3.1
        for <linux-media@vger.kernel.org>; Mon, 03 Nov 2025 10:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1762193871; x=1762798671; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/xmAK/aryaCve4zg5te4EbYXs5XtAGc70a0N7jrOVis=;
        b=lFgd8s976x7GSAgtbxgIha2fcT43XDvV8skZh1K4878SKJWRK+x26KBg8J6OwIlAc/
         Qlo0KgIMGBdU/lMRXPL1ytvkimGW24FD8rNIMzRGXmWA0yMP9oj3s1v0kGUz/9czj2kW
         J9DAXu8LvnLVsfEgLq3YHo+tNZqVaQO8EHsQUU2JNnkrdaPPmFND+KKqg5b45khIKcWX
         eO8NIefBS7d++6RU7Xd+AVJavdbGjDbFu9Vx95lg73pfhuXrHxEtJ+9wNRYKxlk6YxD1
         ZW+Xvv+1gcEdZiIbQJ7GVHTOT2p0anF+r/kPpuFnI/qTNRJqCYsLMXITGZoIRqN4bXLC
         Pa4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762193871; x=1762798671;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/xmAK/aryaCve4zg5te4EbYXs5XtAGc70a0N7jrOVis=;
        b=pN1IZ/cTW1ODQL9Sc5koRgBh//Hc/lkSylj/cAF4xcxYPt6bIrRWWL2x+BmLwpgzHb
         hodG0Y/K2s/N0jBWBh4kAbjEb5jGeyc8b45hE2E5EbLwPYQbs65QjufO5ieLBLzbHGWm
         uqGk81aCChFMzg1It3GwqPhfI6/EKvZ8LDqF4Pw68y19NiID6s8r5DIzvq7E8zlYs5fC
         fYIifyWYXLhQTFGlQJPmoZsLKvk1J4ZqjfhCgP2TiMpjkzghK/v0PPgzLSRcUY1V7Qp5
         yA50+N/9/0+rSIW3jDGQ/rljtXfIjzJYUDNfVbtkCidH7WDVLRtqoyy78xdPgrhyR+Wj
         lC4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWU8BgXWEIuPG2haDfaSmQZytSQ0sdezYL6c6AWAhTQ+jg4oGElZKwnz8b1/ULL58Cgmzc0hOwCfHsdTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkJgcR/dYUWQibfAZ6X6wg+e7tFZgFs4E66+0aWT8mbPL049GM
	H+uTvzUojpmEAUzYeKWdkbRcNUm2F5dgwTLkBH3oXW3EJ6gTRyaSd9qTDp8p/8ACLN/zeqQiG80
	GuCgjjtGNIlNnSss++EriANUUeeb0iEvQje6gOyhO0A==
X-Gm-Gg: ASbGncvcP60FpKyVmVNWjUvW71oTzr4jFgDhwfv/x9KMxFgjfp2t27D3FarnimeQCYb
	locWUx8hp0FO9u4kt9AWbwXbyGfNi3f/fqMJFIvwhirFMvtWcrB6iDu/7ZjugFYS6O2S7BYOJn0
	AgNT0L+6GWJIHY6WbtNpV2HqpV6eMlYTYs/EZBCpM5kbeHujXItDtykiXMeX9r0Gz4wOVD9DtRG
	jIdxFXprlzF84F0gTCs3zrVQkAHWMR2paAdWrBVEGiIadilpdGV0AwKwMWL09irKa7xUs549Cz0
	OtDwcHewsi8pHifiNbnsrbVPh0w=
X-Google-Smtp-Source: AGHT+IFqE8B94Mp2/FJ4pe8YGqharK3QI0mj5qNCj+r9MNVvDf2hJB3l7zQZO5XO9mTAk+uegLHpNOSHPzCdeHMMZAU=
X-Received: by 2002:a05:690c:62c4:b0:786:5789:57df with SMTP id
 00721157ae682-78657895902mr97319357b3.45.1762193871162; Mon, 03 Nov 2025
 10:17:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251031114835.113026-1-tarang.raval@siliconsignals.io> <20251031114835.113026-2-tarang.raval@siliconsignals.io>
In-Reply-To: <20251031114835.113026-2-tarang.raval@siliconsignals.io>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 3 Nov 2025 18:17:31 +0000
X-Gm-Features: AWmQ_bmurtv0JEn9tphiJaL2oYCvaL0iF7Drv_num1dn1VxlUEctW68r9rEtJqs
Message-ID: <CAPY8ntDy0NmU5D6Q=v+X0nN9beGFLWHQp0jpfNYq+shGaam87g@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] media: i2c: imx219: Propagate errors from control
 range updates
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: sakari.ailus@linux.intel.com, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tarang

On Fri, 31 Oct 2025 at 11:49, Tarang Raval
<tarang.raval@siliconsignals.io> wrote:
>
> Propagate return values from __v4l2_ctrl_modify_range() and
> __v4l2_ctrl_s_ctrl() in imx219_set_ctrl() and imx219_set_pad_format().
> This ensures proper error handling instead of ignoring possible
> failures. Also return the result of imx219_set_pad_format() from
> imx219_init_state().

It should be impossible for a number of these to fail unless someone
has messed up in updating the driver, but it does little harm in
returning the error code back out.

The slight hesitation would be that in imx219_set_pad_format you could
have updated the ranges/values of one or more controls, and then fail
leaving a partially implemented mode change. It has returned an error,
but an application would be reasonable in thinking that the previous
working state has been retained when it hasn't.
As long as it would only trigger due to a driver bug rather than user
interaction, I would *not* propose that all values have to be saved
and have to be restored on failure. It just gets too ugly.

> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/imx219.c | 61 +++++++++++++++++++++++++-------------
>  1 file changed, 40 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 48efdcd2a8f9..40693635c0c3 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -453,10 +453,14 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
>                 exposure_max = format->height + ctrl->val - 4;
>                 exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
>                         exposure_max : IMX219_EXPOSURE_DEFAULT;
> -               __v4l2_ctrl_modify_range(imx219->exposure,
> -                                        imx219->exposure->minimum,
> -                                        exposure_max, imx219->exposure->step,
> -                                        exposure_def);
> +               ret = __v4l2_ctrl_modify_range(imx219->exposure,
> +                                              imx219->exposure->minimum,
> +                                              exposure_max,
> +                                              imx219->exposure->step,
> +                                              exposure_def);
> +               if (ret)
> +                       return ret;
> +
>         }
>
>         /*
> @@ -848,6 +852,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>         struct v4l2_rect *crop;
>         u8 bin_h, bin_v, binning;
>         u32 prev_line_len;
> +       int ret;
>
>         format = v4l2_subdev_state_get_format(state, 0);
>         prev_line_len = format->width + imx219->hblank->val;
> @@ -883,19 +888,28 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>                 int pixel_rate;
>
>                 /* Update limits and set FPS to default */
> -               __v4l2_ctrl_modify_range(imx219->vblank, IMX219_VBLANK_MIN,
> -                                        IMX219_FLL_MAX - mode->height, 1,
> +               ret = __v4l2_ctrl_modify_range(imx219->vblank, IMX219_VBLANK_MIN,
> +                                              IMX219_FLL_MAX - mode->height, 1,
> +                                              mode->fll_def - mode->height);
> +               if (ret)
> +                       return ret;
> +
> +               ret = __v4l2_ctrl_s_ctrl(imx219->vblank,
>                                          mode->fll_def - mode->height);
> -               __v4l2_ctrl_s_ctrl(imx219->vblank,
> -                                  mode->fll_def - mode->height);
> +               if (ret)
> +                       return ret;
> +
>                 /* Update max exposure while meeting expected vblanking */
>                 exposure_max = mode->fll_def - 4;
>                 exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
>                         exposure_max : IMX219_EXPOSURE_DEFAULT;
> -               __v4l2_ctrl_modify_range(imx219->exposure,
> -                                        imx219->exposure->minimum,
> -                                        exposure_max, imx219->exposure->step,
> -                                        exposure_def);
> +               ret = __v4l2_ctrl_modify_range(imx219->exposure,
> +                                              imx219->exposure->minimum,
> +                                              exposure_max,
> +                                              imx219->exposure->step,
> +                                              exposure_def);
> +               if (ret)
> +                       return ret;
>
>                 /*
>                  * With analog binning the default minimum line length of 3448
> @@ -906,9 +920,12 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>                 imx219_get_binning(state, &bin_h, &bin_v);
>                 llp_min = (bin_h & bin_v) == IMX219_BINNING_X2_ANALOG ?
>                                   IMX219_BINNED_LLP_MIN : IMX219_LLP_MIN;
> -               __v4l2_ctrl_modify_range(imx219->hblank, llp_min - mode->width,
> -                                        IMX219_LLP_MAX - mode->width, 1,
> -                                        llp_min - mode->width);
> +               ret = __v4l2_ctrl_modify_range(imx219->hblank,
> +                                              llp_min - mode->width,
> +                                              IMX219_LLP_MAX - mode->width, 1,
> +                                              llp_min - mode->width);
> +               if (ret)
> +                       return ret;
>                 /*
>                  * Retain PPL setting from previous mode so that the
>                  * line time does not change on a mode change.
> @@ -917,13 +934,17 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>                  * mode width subtracted.
>                  */
>                 hblank = prev_line_len - mode->width;
> -               __v4l2_ctrl_s_ctrl(imx219->hblank, hblank);
> +               ret = __v4l2_ctrl_s_ctrl(imx219->hblank, hblank);
> +               if (ret)
> +                       return ret;
>
>                 /* Scale the pixel rate based on the mode specific factor */
>                 pixel_rate = imx219_get_pixel_rate(imx219) *
>                              imx219_get_rate_factor(state);
> -               __v4l2_ctrl_modify_range(imx219->pixel_rate, pixel_rate,
> -                                        pixel_rate, 1, pixel_rate);
> +               ret = __v4l2_ctrl_modify_range(imx219->pixel_rate, pixel_rate,
> +                                              pixel_rate, 1, pixel_rate);
> +               if (ret)
> +                       return ret;
>         }
>
>         return 0;
> @@ -972,9 +993,7 @@ static int imx219_init_state(struct v4l2_subdev *sd,
>                 },
>         };
>
> -       imx219_set_pad_format(sd, state, &fmt);
> -
> -       return 0;
> +       return imx219_set_pad_format(sd, state, &fmt);
>  }
>
>  static const struct v4l2_subdev_video_ops imx219_video_ops = {
> --
> 2.34.1
>

