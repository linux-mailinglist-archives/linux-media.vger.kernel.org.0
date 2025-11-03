Return-Path: <linux-media+bounces-46228-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB5AC2DA2F
	for <lists+linux-media@lfdr.de>; Mon, 03 Nov 2025 19:19:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A72B8189B63E
	for <lists+linux-media@lfdr.de>; Mon,  3 Nov 2025 18:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9D75284684;
	Mon,  3 Nov 2025 18:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="bJTZ39Qp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5ED2356C6
	for <linux-media@vger.kernel.org>; Mon,  3 Nov 2025 18:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762193968; cv=none; b=snJPlqxMEUssEA+TkU3r5fExL8/J0o/hs/26i0po0XfAREkJPaDYoHrBG3vGh7x0ASZWfIyD03h0mRA2gnV/cP1DOXkE0GFbd3XQwyNB4KKWeRkh+CpZoGao5yX6UoeoM7YbcxplXiPe/1TFyscbZtjxcW4jihxzIBXQt8lqsl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762193968; c=relaxed/simple;
	bh=xkq3fhSpFsbo743IPkDyvhPc+xLdeirly7xbrbNg1WA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YEBDsNl0LafQ6ebR4jq554TGQfGOm+1/gMViEXwp7LlJunGigWB39w84icSx6zPHg8qa26I4yKHdbQ6EqvU5mEAnzul5NNyakGyNvZQpK9lkRava07GWaUfnUTeBojkwv51qijnDhXEfNjN5XjCwlIfW6dANQM8MptnCb/CKOwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=bJTZ39Qp; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7866dcf50b1so14394587b3.3
        for <linux-media@vger.kernel.org>; Mon, 03 Nov 2025 10:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1762193964; x=1762798764; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0+bzmYsLGCARLUOgmbjt1DiXQ4aCZGvMf16y2vz6rb8=;
        b=bJTZ39QpCbgXO4Ltl9oqqF3fJOOdPdAC9u/Xx+jOeNMePvGvnhd0BDOl6++92z1hV+
         EevvEAjk+7aIceDipNaQm8/jpJnYgLFucT3g9O9FC8172DqIb6C0MwcLNIerYltCLK1h
         /LT2DipuFqpIlsQhF1YUi7XjSX7nLOzzIDdTRS6QXhFnjfNpvHelrLTZhrjDVlwlgYmp
         8uG3VvdLraHitq6xHYPxqli3iTid8LcgyJT73XwKtS2x/LSqPYi4WYtNGSecLqZ8FHvH
         x4Z1CyiElLJMJwjZXdwnwQQDRdu+JKQKGBopuZUdRJQWjFbq9VjeGNKqWO0PG5C7GTZ7
         7nWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762193964; x=1762798764;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0+bzmYsLGCARLUOgmbjt1DiXQ4aCZGvMf16y2vz6rb8=;
        b=SpJxosnRS/12k7VmjHWypsjSahHhHZRM48eDRXstb3AaeKUks7NPCWX2TaK9YDWE+T
         PhdRsmPy/97BJW+BnCLAew0rVK/I+XbuMnL28/Jiy1pkK47N6nlmhMSSZrhwHznz+k4t
         gukpz5MSow7C7Vq2eFUHrZBsS92OZyTDzm8EnyTzYuaDgTGpY0fM97jZizrxlDBMG4+y
         7rimxHwpmFzi9fr2DjnF7VoUKNJs8og6OAvHOBhuwuCHGiQ8j1qyfGF8l86qXaAPm4lN
         JMoY6DD85tICTbJF+yisGqkI3QTfeST3Glpu+dzDw0ZXxOs2UID9qApORQHOC8YlSg9e
         8gYQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+LzHvXtvAg16k+NCjQ8Zc6XnlUKuTl8BcZbU/eQDhpOgrbUHG+NYI6K/50hMsQjxOHMj8g/lWb8o+vw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlOlBza3eJzBJyoUP+64WR1wLyPEW6pA24IpJsyIiKnY3v/oO7
	mBzOZ1aj5+dTuFe3aH9pbkc5+pGQy/IWaCi3Yg0KW1wC6k+D7acQAPH6I+rPmkxl/RqslDwKSIn
	CI+sFn+yeGBqGNz/UhY6ijdOi6qlca/dSCj1qLf6QXQ==
X-Gm-Gg: ASbGncud4vejI6eFak5eOhmWLDsnAC5oJsx+musqM+4Lxe54KGQIG3bE4vehMq59oW4
	FmlIOqphOyiyOg6R4oUnaQ4X2/I67B4/KA0w1HjUes4RHAmV1FZBxc190YEN3u2My5R1wDQd7Cc
	1GeT4k+HMAq0ASwckkqDf2Bik3xTiL+9rzHS+1805/sB+bNwc+yEREezsOv1KuQUS3I8whh6YdG
	3rGdu+fw5/5clftnWxKjRSXW0gvpsN+7VHPiBPIyqjLZbbxoKWwYWKACQogOUmK7LDwWOWd3lOm
	TMW7sTdsVp4Crddm
X-Google-Smtp-Source: AGHT+IFYEcVRZ8Vp/nBZVlCxk0dTBlD25PQ4RLWPQN64T3kSW7BOSZMhPUuKdc+YhyRkIQHbcQ84biOR9TP9h+2A3ak=
X-Received: by 2002:a05:690c:6d07:b0:786:5b30:7760 with SMTP id
 00721157ae682-7865b307cadmr81378617b3.23.1762193964170; Mon, 03 Nov 2025
 10:19:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251031114835.113026-1-tarang.raval@siliconsignals.io> <20251031114835.113026-3-tarang.raval@siliconsignals.io>
In-Reply-To: <20251031114835.113026-3-tarang.raval@siliconsignals.io>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 3 Nov 2025 18:19:04 +0000
X-Gm-Features: AWmQ_blx2gMGL2UsqCcStrzwij5tXg4E1ntRGMYX5pT_bX8awn1r-Qs8gNy6n9A
Message-ID: <CAPY8ntDAjyUF4gMO7a2HEcW8cnFaXe0bABtRA7bzWwrt1utp3Q@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] media: i2c: imx219: Replace exposure magic value
 with named constant
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: sakari.ailus@linux.intel.com, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tarang

On Fri, 31 Oct 2025 at 11:49, Tarang Raval
<tarang.raval@siliconsignals.io> wrote:
>
> Introduce IMX219_EXPOSURE_OFFSET (4) and use it instead of the literal
> '4' when computing the maximum coarse exposure. The IMX219 datasheet
> specifies the maximum storage time as frame_length_lines - 4.
> (Ref: Datasheet section 5-7-1)
>
> Also fix one indentation issue for consistency.
>
> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/imx219.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 40693635c0c3..e87d5a18fe87 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -68,6 +68,7 @@
>  #define IMX219_EXPOSURE_STEP           1
>  #define IMX219_EXPOSURE_DEFAULT                0x640
>  #define IMX219_EXPOSURE_MAX            65535
> +#define IMX219_EXPOSURE_OFFSET                 4
>
>  /* V_TIMING internal */
>  #define IMX219_REG_FRM_LENGTH_A                CCI_REG16(0x0160)
> @@ -450,9 +451,9 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
>                 int exposure_max, exposure_def;
>
>                 /* Update max exposure while meeting expected vblanking */
> -               exposure_max = format->height + ctrl->val - 4;
> +               exposure_max = format->height + ctrl->val - IMX219_EXPOSURE_OFFSET;
>                 exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
> -                       exposure_max : IMX219_EXPOSURE_DEFAULT;
> +                               exposure_max : IMX219_EXPOSURE_DEFAULT;
>                 ret = __v4l2_ctrl_modify_range(imx219->exposure,
>                                                imx219->exposure->minimum,
>                                                exposure_max,
> @@ -579,9 +580,9 @@ static int imx219_init_controls(struct imx219 *imx219)
>                                            IMX219_LLP_MIN - mode->width,
>                                            IMX219_LLP_MAX - mode->width, 1,
>                                            IMX219_LLP_MIN - mode->width);
> -       exposure_max = mode->fll_def - 4;
> +       exposure_max = mode->fll_def - IMX219_EXPOSURE_OFFSET;
>         exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
> -               exposure_max : IMX219_EXPOSURE_DEFAULT;
> +                       exposure_max : IMX219_EXPOSURE_DEFAULT;
>         imx219->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
>                                              V4L2_CID_EXPOSURE,
>                                              IMX219_EXPOSURE_MIN, exposure_max,
> @@ -900,9 +901,9 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>                         return ret;
>
>                 /* Update max exposure while meeting expected vblanking */
> -               exposure_max = mode->fll_def - 4;
> +               exposure_max = mode->fll_def - IMX219_EXPOSURE_OFFSET;
>                 exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
> -                       exposure_max : IMX219_EXPOSURE_DEFAULT;
> +                               exposure_max : IMX219_EXPOSURE_DEFAULT;
>                 ret = __v4l2_ctrl_modify_range(imx219->exposure,
>                                                imx219->exposure->minimum,
>                                                exposure_max,
> --
> 2.34.1
>

