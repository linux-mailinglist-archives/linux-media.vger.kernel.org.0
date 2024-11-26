Return-Path: <linux-media+bounces-22083-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B49A9D987C
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 14:25:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43308B21D4E
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 13:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E0351D47D2;
	Tue, 26 Nov 2024 13:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="LBpmAm9A"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707321D27BB
	for <linux-media@vger.kernel.org>; Tue, 26 Nov 2024 13:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732627309; cv=none; b=iS3LvxPqXfJcK1lUiiuKk+RTiWkV2KUqgCDJlfiGjUQjbnpYfjYQiIxYATLfkZdrqWSLm9nYgxkyrHSoEqwcJh+4FzGDA5r2MHcK4bYKUZuQisrbTcR6fLYrpLqHWqzFKn8IXg9mwYbd/Tl+icmrBf1eXGXQ5cdAy4CTH+atzHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732627309; c=relaxed/simple;
	bh=xam+gvTlNePOXWmvE6HJc/zjRx3Kw98Dpn1CFhvSyqg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m63cUgCJh7XIEVp/VP53teehVGf6eFUxl1n74w7siiTME11hX2Zfz9YeW4Qk8CQ4BlRUt+PSmXra3/gHuaDUdEX9Ikg4Yph7pv7e2nK0E4S2lMcUcY+4dQSn3YYzuP3V4tIhVMK7APi9O/t7GiC7URvz/MlO+CIukhMLT+Ocvfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=LBpmAm9A; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e388e1fd582so5585049276.2
        for <linux-media@vger.kernel.org>; Tue, 26 Nov 2024 05:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1732627306; x=1733232106; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JfBuef27ultxtQ0QhYJwcn92wHDcp/POc68y8FNaif0=;
        b=LBpmAm9AObLUzKerHSxN8trff1CqKfxODm7k9UylEpBFQGkD5Sd0hy+st+DT1FpXCh
         klq2v16ibdOsT2orIfQAJR/5C3g3XB3GMBSoGun4NHF1030nBRBCSA3QEZtoltFS7Vxr
         gsSBLqhuWBjB9lLTCAuL7O1ePNzEJiWw7+bxoHe9NnWrLo0+hE1N2eGvzP5HymxBIX58
         MshmXZvziqyVG/UHNgMihx/PfqLjUbG1CT0xilDvZGyIB7jNGUdIHGbN05LGYKCdF/Sl
         1DU5sWBYzTQJ9IRwsG0HhEJvOkmi3+9HMB1FSCL0wpCSE/0qoNbOCEf7JaRF5qs5g+hM
         uoLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732627306; x=1733232106;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JfBuef27ultxtQ0QhYJwcn92wHDcp/POc68y8FNaif0=;
        b=Wbqo+l5RrtlwAs83dzVjLU/TdqOPFBvRsiC339QYSWv2bZfU2Elc+5P6Mtk1DEupet
         JycApraNOBlM+v07Nwdw+6CQzkaJwzwWJMrSURIto1Fie0CLrWR9IziCaRuBslX8SOqL
         941RW6LjmgWrXgmPC0muiGGIiKL7Zp6cDo+h4PPmSdPkxjRLpw0aITUKAZRixza7TIAk
         7JfId7y5+hXVpmCQflqEzXd0tRCU+Y/sG+ESMzyjWEQ86mDQ3m2SHO3YiKFNKzqdMDvd
         7YeJYFvAMrP3EGnChA4JvdhMg8r5+zy30DBG0bylPod6YPfpkMVY5YvNcUyl71zugIcJ
         BaIw==
X-Forwarded-Encrypted: i=1; AJvYcCU3B6EhyhPqaQNgYkKKPHR6n9qaQbja6IysCwAXV+EDo4mrmzQzdEFVKcC6J2YuvjlDyvQhRxYklqARqg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9AHaevwbVcQMhgkZogfxp9vNkO3wmoL4rkKBVEypW/6AkkdmG
	rI9sXCz/Vbz0TfXN0+R3SrzgP86bKWVSh3q17mVizQ11BrPQtOSws/gngQeEcuJhyQn0ZGQp9tH
	IjxiWRYLC0djVY8z2GWn2EzCp524/PAOoV+ZEhVYneSI+5V5nl1Y=
X-Gm-Gg: ASbGncuF4cMssT/u069V7Ey+5EkqrQml+L5/OP5djlQG4+MJjOtp4rjZUOakb5Kh4rH
	N8nEltmXFIyHM7kjv6JJbMWdY5vFdyjo=
X-Google-Smtp-Source: AGHT+IHfhcF4QUWpiCk5PqoluUphXMfbjozdMDmHBwlDT1LoH8pl43N8YjZscxunkeOuUY8uIJhg9aIdBNlj/hHa588=
X-Received: by 2002:a05:6902:3411:b0:e30:8568:9d20 with SMTP id
 3f1490d57ef6-e38f8c0c808mr12517464276.53.1732627305045; Tue, 26 Nov 2024
 05:21:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241125-imx219_fixes-v3-0-434fc0b541c8@ideasonboard.com>
 <20241125-imx219_fixes-v3-2-434fc0b541c8@ideasonboard.com> <20241126121640.GE5461@pendragon.ideasonboard.com>
In-Reply-To: <20241126121640.GE5461@pendragon.ideasonboard.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 26 Nov 2024 13:21:27 +0000
Message-ID: <CAPY8ntDAnj1uf-fBRbioZSwRm9zO4=e4-E+Rd-PAz0N3cmad-A@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] media: i2c: imx219: make HBLANK r/w to allow
 longer exposures
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Tue, 26 Nov 2024 at 12:16, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, Nov 25, 2024 at 08:36:26PM +0530, Jai Luthra wrote:
> > From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> >
> > The HBLANK control was read-only, and always configured such
> > that the sensor HTS register was 3448. This limited the maximum
> > exposure time that could be achieved to around 1.26 secs.
> >
> > Make HBLANK read/write so that the line time can be extended,
> > and thereby allow longer exposures (and slower frame rates).
> > Retain the overall HTS setting when changing modes rather than
> > resetting it to a default.
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > ---
> >  drivers/media/i2c/imx219.c | 37 ++++++++++++++++++++++++-------------
> >  1 file changed, 24 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > index f98aad74fe584a18e2fe7126f92bf294762a54e3..970e6362d0ae3a9078daf337155e83d637bc1ca1 100644
> > --- a/drivers/media/i2c/imx219.c
> > +++ b/drivers/media/i2c/imx219.c
> > @@ -76,8 +76,10 @@
> >
> >  #define IMX219_VBLANK_MIN            32
> >
> > -/* HBLANK control - read only */
> > -#define IMX219_PPL_DEFAULT           3448
> > +/* HBLANK control range */
>
> Just drop the comment, and drop the blank lines, this belongs to the
> "V_TIMING internal" section.
>
> > +#define IMX219_PPL_MIN                       0x0d78
>
> Why PPL and not HTS ?

The IMX219 datasheet defines the register as LINE_LENGTH_A, with
comment line_length_pck.

HTS is not a term used in the imx219 datasheet, so why introduce it to
the driver? I'd go along with a rename to LLP if you wish.
(HTS is more commonly an Omnivision term, not a Sony one).

> > +#define IMX219_PPL_MAX                       0x7ff0
> > +#define IMX219_REG_HTS                       CCI_REG16(0x0162)
>
> The min/max should go below the register definition.
>
> >
> >  #define IMX219_REG_LINE_LENGTH_A     CCI_REG16(0x0162)
> >  #define IMX219_REG_X_ADD_STA_A               CCI_REG16(0x0164)
> > @@ -422,6 +424,10 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> >               cci_write(imx219->regmap, IMX219_REG_VTS,
> >                         format->height + ctrl->val, &ret);
> >               break;
> > +     case V4L2_CID_HBLANK:
> > +             cci_write(imx219->regmap, IMX219_REG_HTS,
> > +                       format->width + ctrl->val, &ret);
> > +             break;
> >       case V4L2_CID_TEST_PATTERN_RED:
> >               cci_write(imx219->regmap, IMX219_REG_TESTP_RED,
> >                         ctrl->val, &ret);
> > @@ -496,12 +502,10 @@ static int imx219_init_controls(struct imx219 *imx219)
> >                                          V4L2_CID_VBLANK, IMX219_VBLANK_MIN,
> >                                          IMX219_VTS_MAX - mode->height, 1,
> >                                          mode->vts_def - mode->height);
> > -     hblank = IMX219_PPL_DEFAULT - mode->width;
> > +     hblank = IMX219_PPL_MIN - mode->width;
> >       imx219->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
> >                                          V4L2_CID_HBLANK, hblank, hblank,
>
> The minimum and maximum are identical, is this intentional ?

The limits should be updated when the format is set, so the values
shouldn't matter when created. However I'd want to check that did
happen seeing as vblank computes the limits here.
It is as easy to set them correctly here too (max = IMX219_PPL_MAX -
mode->width), so you may as well.

> >                                          1, hblank);
> > -     if (imx219->hblank)
> > -             imx219->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> >       exposure_max = mode->vts_def - 4;
> >       exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
> >               exposure_max : IMX219_EXPOSURE_DEFAULT;
> > @@ -817,6 +821,10 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> >       struct v4l2_mbus_framefmt *format;
> >       struct v4l2_rect *crop;
> >       unsigned int bin_h, bin_v;
> > +     u32 prev_hts;
> > +
> > +     format = v4l2_subdev_state_get_format(state, 0);
> > +     prev_hts = format->width + imx219->hblank->val;
> >
> >       mode = v4l2_find_nearest_size(supported_modes,
> >                                     ARRAY_SIZE(supported_modes),
> > @@ -824,8 +832,6 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> >                                     fmt->format.width, fmt->format.height);
> >
> >       imx219_update_pad_format(imx219, mode, &fmt->format, fmt->format.code);
> > -
> > -     format = v4l2_subdev_state_get_format(state, 0);
> >       *format = fmt->format;
> >
> >       /*
> > @@ -861,13 +867,18 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> >                                        exposure_max, imx219->exposure->step,
> >                                        exposure_def);
> >               /*
> > -              * Currently PPL is fixed to IMX219_PPL_DEFAULT, so hblank
> > -              * depends on mode->width only, and is not changeble in any
> > -              * way other than changing the mode.
> > +              * Retain PPL setting from previous mode so that the
>
> Rename PPL to HTS here too.

Disagree as above. The local variable here should be renamed prev_ppl
or prev_llp.

  Dave

> > +              * line time does not change on a mode change.
> > +              * Limits have to be recomputed as the controls define
> > +              * the blanking only, so PPL values need to have the
> > +              * mode width subtracted.
> >                */
> > -             hblank = IMX219_PPL_DEFAULT - mode->width;
> > -             __v4l2_ctrl_modify_range(imx219->hblank, hblank, hblank, 1,
> > -                                      hblank);
> > +             hblank = prev_hts - mode->width;
> > +             __v4l2_ctrl_modify_range(imx219->hblank,
> > +                                      IMX219_PPL_MIN - mode->width,
> > +                                      IMX219_PPL_MAX - mode->width,
> > +                                      1, IMX219_PPL_MIN - mode->width);
> > +             __v4l2_ctrl_s_ctrl(imx219->hblank, hblank);
> >       }
> >
> >       return 0;
> >
>
> --
> Regards,
>
> Laurent Pinchart

