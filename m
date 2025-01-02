Return-Path: <linux-media+bounces-24221-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2E19FFBFD
	for <lists+linux-media@lfdr.de>; Thu,  2 Jan 2025 17:40:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B908C7A25EA
	for <lists+linux-media@lfdr.de>; Thu,  2 Jan 2025 16:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7FC214AD02;
	Thu,  2 Jan 2025 16:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="NUfF4yk+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AE8187848
	for <linux-media@vger.kernel.org>; Thu,  2 Jan 2025 16:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735835915; cv=none; b=WRYbWowzNybcxXDONhJuFV0erY2KKMt/qJNfN4QxDZlzPcGuOmr3QY4ZM8+fS/w3bbAHoPNEwIMj/0EA86NX7UN9/Z8wBWFA58qfIwx4BKhS1LiDejW6O2P7QDjENZwUjPjSMjbG5gkfpWmWysYqWzSIlgU07gBEXRdToeKmnOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735835915; c=relaxed/simple;
	bh=YYW14kornmutL9wR7p63y0ohanjyZNis8IdCfOxANUY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ddwdxZp05vxPYJ4uT5YAn4ysqkouRUQwj+7R+P9yJzYF2evajDUDBii9Lk3uSaFTqPphmWfD541KZ2tR0nfauJ5RVm2+/v08jdETNC3FowadH/o7jkSXVW4HtBaM1BBn30bVeR5unHOuzQFRpBZYLdYUkYrdbVeAFthWA/K0Vqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=NUfF4yk+; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e53ef7462b6so10404772276.3
        for <linux-media@vger.kernel.org>; Thu, 02 Jan 2025 08:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1735835894; x=1736440694; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ysnvKRDOIMPalcn8D7LlAr5KbbyQH5/iYcw/HIM0EBk=;
        b=NUfF4yk+9DqJ6yKFdaOVRAhHYfjddvq62HhIqQBpxLdPnmII15oU6ZMgDARC8n6Ep1
         nrYK6yQDhdVHLaJbdcnpxDLNd2KHef+ROp/7P2kyEUmJs4moJtO1+xG0LZcgkZBebCLi
         UawZFDgb9Noo1BgpQdxWjfsiv0c8HYHQknH2T2h69PuTYrk+9hq+6cS9/qAsMWTQ2f/f
         PF4VJKvQVH8JKNh2Bm7of9ZaYD6xZdF1t63Vh/De1rmDqZ2FSkfRMWmDWK18oaFkZ3wc
         /wAWR18OQ2iTNSm5RrjFf3YhwnTm4G37rU//2DoMdADuB+e3RJpOjv4LmI0axGa1l168
         Ni+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735835894; x=1736440694;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ysnvKRDOIMPalcn8D7LlAr5KbbyQH5/iYcw/HIM0EBk=;
        b=AkcSll9TVG0gjyUs5t9iPZ6ryStbnD30dYj2iFkt6fpgRUSBWW31cpgsZHPeQV8eqh
         P7xhYNynjd+jiMOv9plY4Cxx7hSr75HFbCXa7R8Mz4gvcGiHdybj2mmIEPBDmlEQm714
         Pqtzq4lwX3zm/VseghWljWkZxw7aTocBOSGeiasjoYSnEzE7lWVqXfg5h19Kw21qdqX0
         sKJ24cBmGE5dQo75Vqkw8hJgAA1PliPhMVCP8MDub9PI+BuULHfSAkUbHBPGs8Og7aRb
         LDQXVO8krq6ztC8iCkn4jXedaGgbU7cCx2TCThzVaQIYHhF3NUmznpMMsf95WAJtGSCR
         tecA==
X-Forwarded-Encrypted: i=1; AJvYcCUHH4fCRoIjPJrVBm5YCW92RVQb43LrkSyvBTF0cSwpMdlUYqIraj/XeIoaKU7Q9MBLnCwK4P3ULwKGeA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj8jNG6rZyYR4Pztmb7UTFnW2CwBt1/HzQ1XdKB2X8lzlJ2GhX
	zwcQz+JHZU1F4Odd+J5cJqayEUu+yPgsFLAJGR6tI8cO5wuVeW8qP28dVLPl4kgYMUaldUKsEDc
	ePLSjv9JtEsOY01SlsjkaxKp+o460Mi+AwKGobg==
X-Gm-Gg: ASbGncuayFQTzN312x/8bmI5910bGWkDmYu0l8s5z+HM9ZSBcJHnYVpURNhsnhp/3de
	aTAiuOZ8ndnZAIVNHt9y4VHLIQAsRu4Zb3L02SA==
X-Google-Smtp-Source: AGHT+IHtHYLYZNLLmArksYSxDS5CTlJxJDcQUqbofJXmKhK08RVWbaUCtmYVSbl1EOmdMaXIKF9+Bdm0QWmgCUg2Cp4=
X-Received: by 2002:a05:690c:f84:b0:6ef:c5f6:2ac8 with SMTP id
 00721157ae682-6f3f820dfbfmr284283287b3.27.1735835893694; Thu, 02 Jan 2025
 08:38:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241230-imx219_fixes-v5-0-98446d816489@ideasonboard.com> <20241230-imx219_fixes-v5-2-98446d816489@ideasonboard.com>
In-Reply-To: <20241230-imx219_fixes-v5-2-98446d816489@ideasonboard.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 2 Jan 2025 16:37:56 +0000
Message-ID: <CAPY8ntCSSe-T7ZjNZZ2-qQWcJd+rOFJwF2HY41NCKhx0T+weHA@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] media: i2c: imx219: Rename VTS to FRM_LENGTH
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

Hi Jai

Thanks for the patch

On Mon, 30 Dec 2024 at 06:12, Jai Luthra <jai.luthra@ideasonboard.com> wrote:
>
> The IMX219 datasheet uses the terms FRM_LENGTH and LINE_LENGTH instead
> of VTS/HTS.

nit: This patch doesn't make any changes to HTS / LINE_LENGTH as there
are no references to it (yet - that's patch 3/5)
Taken with the context of the commit subject, it's fine by me.

>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/imx219.c | 31 +++++++++++++++----------------
>  1 file changed, 15 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 0486bbc046cb9c36afd911eb799c1b010a01d496..8565b1b030be2ee24bcc37415e99ee4ef83cc683 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -70,9 +70,8 @@
>  #define IMX219_EXPOSURE_MAX            65535
>
>  /* V_TIMING internal */
> -#define IMX219_REG_VTS                 CCI_REG16(0x0160)
> -#define IMX219_VTS_MAX                 0xffff
> -
> +#define IMX219_REG_FRM_LENGTH          CCI_REG16(0x0160)
> +#define IMX219_FLL_MAX                 0xffff
>  #define IMX219_VBLANK_MIN              32
>
>  /* HBLANK control - read only */
> @@ -154,7 +153,7 @@ struct imx219_mode {
>         unsigned int height;
>
>         /* V-timing */
> -       unsigned int vts_def;
> +       unsigned int fll_def;
>  };
>
>  static const struct cci_reg_sequence imx219_common_regs[] = {
> @@ -289,25 +288,25 @@ static const struct imx219_mode supported_modes[] = {
>                 /* 8MPix 15fps mode */
>                 .width = 3280,
>                 .height = 2464,
> -               .vts_def = 3526,
> +               .fll_def = 3526,
>         },
>         {
>                 /* 1080P 30fps cropped */
>                 .width = 1920,
>                 .height = 1080,
> -               .vts_def = 1763,
> +               .fll_def = 1763,
>         },
>         {
>                 /* 2x2 binned 30fps mode */
>                 .width = 1640,
>                 .height = 1232,
> -               .vts_def = 1763,
> +               .fll_def = 1763,
>         },
>         {
>                 /* 640x480 30fps mode */
>                 .width = 640,
>                 .height = 480,
> -               .vts_def = 1763,
> +               .fll_def = 1763,
>         },
>  };
>
> @@ -418,7 +417,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
>                           imx219->hflip->val | imx219->vflip->val << 1, &ret);
>                 break;
>         case V4L2_CID_VBLANK:
> -               cci_write(imx219->regmap, IMX219_REG_VTS,
> +               cci_write(imx219->regmap, IMX219_REG_FRM_LENGTH,
>                           format->height + ctrl->val, &ret);
>                 break;
>         case V4L2_CID_TEST_PATTERN_RED:
> @@ -493,15 +492,15 @@ static int imx219_init_controls(struct imx219 *imx219)
>         /* Initial vblank/hblank/exposure parameters based on current mode */
>         imx219->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
>                                            V4L2_CID_VBLANK, IMX219_VBLANK_MIN,
> -                                          IMX219_VTS_MAX - mode->height, 1,
> -                                          mode->vts_def - mode->height);
> +                                          IMX219_FLL_MAX - mode->height, 1,
> +                                          mode->fll_def - mode->height);
>         hblank = IMX219_PPL_DEFAULT - mode->width;
>         imx219->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
>                                            V4L2_CID_HBLANK, hblank, hblank,
>                                            1, hblank);
>         if (imx219->hblank)
>                 imx219->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> -       exposure_max = mode->vts_def - 4;
> +       exposure_max = mode->fll_def - 4;
>         exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
>                 exposure_max : IMX219_EXPOSURE_DEFAULT;
>         imx219->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
> @@ -847,12 +846,12 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>
>                 /* Update limits and set FPS to default */
>                 __v4l2_ctrl_modify_range(imx219->vblank, IMX219_VBLANK_MIN,
> -                                        IMX219_VTS_MAX - mode->height, 1,
> -                                        mode->vts_def - mode->height);
> +                                        IMX219_FLL_MAX - mode->height, 1,
> +                                        mode->fll_def - mode->height);
>                 __v4l2_ctrl_s_ctrl(imx219->vblank,
> -                                  mode->vts_def - mode->height);
> +                                  mode->fll_def - mode->height);
>                 /* Update max exposure while meeting expected vblanking */
> -               exposure_max = mode->vts_def - 4;
> +               exposure_max = mode->fll_def - 4;
>                 exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
>                         exposure_max : IMX219_EXPOSURE_DEFAULT;
>                 __v4l2_ctrl_modify_range(imx219->exposure,
>
> --
> 2.47.1
>

