Return-Path: <linux-media+bounces-21055-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B40259C0619
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 13:44:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D83DB1C20CC1
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 12:44:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC63F20FA85;
	Thu,  7 Nov 2024 12:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Kk1W20y4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5CF20F5AA
	for <linux-media@vger.kernel.org>; Thu,  7 Nov 2024 12:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730983453; cv=none; b=jhlMH/lA+2vAHgm2HEanYbr4Tr+ZVwLqnlDN7wpLBJWzs7H1MJ8iyezjmNzyLZ8mFY9r/Ip4sBCa6+gaCbBUDESooCXKeH45f0DHmuZx1X1+z6pmRCJFpz88NIvKNg52dMkNNhItrMvo9fZ01vRrXJrEsqn0CD5wnYw1aitCMek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730983453; c=relaxed/simple;
	bh=OggBClXw1X0WYOAp9UFgYJXpstndQoQeXklKfzIx+V4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ESy9zCAUhVi3bd984HN3UOc01Ry7XJir8sYZmg41N1QFgapxikdXG/EAZT2NGbaQ5OSzVgIurjtFxkQ+4JeLCy5EBk3h0XwDLmp+neOaB7ceiSR0At5NBGW4GSvvEkj7rXOoo81fBYQTSpuGcQKqrz5kv2NIQGQmKzjooAxGo0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Kk1W20y4; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e0875f1e9edso1202753276.1
        for <linux-media@vger.kernel.org>; Thu, 07 Nov 2024 04:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1730983449; x=1731588249; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DoT2KYwKhbZKBbmPOKYlp7YSWvEMOgYbaeZiWtUEgo4=;
        b=Kk1W20y4g5O60axwt06G9q55JyUyC7ww/hriDx/3c12bAlBPDGXIiwZLkWroC7xb3u
         giF5AlvJfLuOyChGCx/At6MAS1m7EOHf514OJFBDRZQM5N1jeU5BuYLCWM8U5b+asz4Y
         NokRxKsgevw6wtXHr2oyTz19FjxNqD2G1eoMo2A/UdVqsF8px/73wWJq5V5SQU/C9SCM
         MSdCFG6jcem6LM1MOG7DTG8j0GJ2uYu9nP92KwadM8GN8WGByc6x44ZVfy7NML+Lwach
         ScWz6wOxcSqgmE0fOIzVUDkDS21nOln5nFR4N4zotjk9Myy6hzDaimGnFYDANw1fSEzk
         +nKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730983449; x=1731588249;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DoT2KYwKhbZKBbmPOKYlp7YSWvEMOgYbaeZiWtUEgo4=;
        b=dzFvQdp2EYum4iHAa4gKPAlPb0iUDKgbGwp8aO4FNtOu7G0NPv1EA2Ry29TVk+83dW
         j4VWn2U2PSNlNI2UcTg2JDWjSxTL8tmxNQa2cpdymaWlEOH+6ShXzqVz6RoESXIObYMb
         2NiZRy3A9vCgiiFQDKUGZ83OnJfKqVEO2eWqeTOm1ZZ3WJo2abzcQbeXvYnjIpZyyMwF
         /XwWqBVIXmrTaMlkXFvbUdtcuDp8FVqKQdvmsNBrnAwOEsF7RmL7PpZqP4+ONZZ2+H4k
         99RWmQx18lntYrU42+Iubrzn1hZK9nDIcNgZZXp7Pt8sLaqKtsPQHbUOwzM07hLqFt/F
         Tg6Q==
X-Forwarded-Encrypted: i=1; AJvYcCX9F0GHwYI8Ce4IYRlvFLZL7G+CRklk+dptPBdXUwhDXfkENXvlJTISMno2lbD9aOmPVgvMIqBV1ixAFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKfpHqaeDxCukvCiTgqaLrQsb3EJBtpoF3XnlL3VnWuGeTsXBj
	u70nkdNA2vo9PXS2JBve9f1EdDnAIOFPgzusS2QFnQeQXfXi88KiToMNY5A86y9ztt6Spu7YH+T
	h2MTRc5l3qFZ0sldt10NC3I6bELuJkjGtG7Ovts6Zs1buyzKh
X-Google-Smtp-Source: AGHT+IHAwSP2WkrlVmT2PSuiqke4KuCVLABNPv4HEHmf4muee6fSbW/yq0MXZe6+DtmJJ7sfMlYhkRttS/InmJBj+wo=
X-Received: by 2002:a05:690c:91:b0:6e7:e493:2da8 with SMTP id
 00721157ae682-6e9d8b002a0mr395596007b3.36.1730983448142; Thu, 07 Nov 2024
 04:44:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241029-imx219_fixes-v1-0-b45dc3658b4e@ideasonboard.com>
 <20241029-imx219_fixes-v1-2-b45dc3658b4e@ideasonboard.com> <ZySV3KKXSyIreRI4@kekkonen.localdomain>
In-Reply-To: <ZySV3KKXSyIreRI4@kekkonen.localdomain>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 7 Nov 2024 12:43:52 +0000
Message-ID: <CAPY8ntDF8W+xRBXbe=LYpg21LL7-svhCySTSJHRNiDzQs4Xw5Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: i2c: imx219: make HBLANK r/w to allow longer exposures
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sakari

On Fri, 1 Nov 2024 at 08:48, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Hi Jai,
>
> On Tue, Oct 29, 2024 at 02:27:36PM +0530, Jai Luthra wrote:
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
>
> It looks like this changes horizontal blanking at least in some cases. Does
> this also work as expected in binned modes, for instance?
>
> Many sensors have image quality related issues on untested albeit
> functional line length values.
>
> So my question is: how has this been validated?

Validated by Sony, or others?
I've tested a range of values in all modes and not observed any image
quality issues.

From previous discussions with Sony, they always provide their big
spreadsheet of register values for the specific mode and frame rate
requested. I don't think they even officially state that changing
VTS/FRM_LENGTH_LINES to change the framerate is permitted.
There are some Sony datasheets (eg imx258) that state "set to X. Any
other value please confirm with Sony", but that isn't the case for the
imx219 datasheet. I take that as it is permitted within the defined
ranges.

  Dave

> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > ---
> >  drivers/media/i2c/imx219.c | 35 +++++++++++++++++++++++------------
> >  1 file changed, 23 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > index f98aad74fe584a18e2fe7126f92bf294762a54e3..de9230d4ad81f085640be254db9391ae7ad20773 100644
> > --- a/drivers/media/i2c/imx219.c
> > +++ b/drivers/media/i2c/imx219.c
> > @@ -76,8 +76,10 @@
> >
> >  #define IMX219_VBLANK_MIN            32
> >
> > -/* HBLANK control - read only */
> > -#define IMX219_PPL_DEFAULT           3448
> > +/* HBLANK control range */
> > +#define IMX219_PPL_MIN                       3448
> > +#define IMX219_PPL_MAX                       0x7ff0
> > +#define IMX219_REG_HTS                       CCI_REG16(0x0162)
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
> > @@ -496,12 +502,11 @@ static int imx219_init_controls(struct imx219 *imx219)
> >                                          V4L2_CID_VBLANK, IMX219_VBLANK_MIN,
> >                                          IMX219_VTS_MAX - mode->height, 1,
> >                                          mode->vts_def - mode->height);
> > -     hblank = IMX219_PPL_DEFAULT - mode->width;
> > +     hblank = IMX219_PPL_MIN - mode->width;
> >       imx219->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
> > -                                        V4L2_CID_HBLANK, hblank, hblank,
> > +                                        V4L2_CID_HBLANK, hblank,
> > +                                        IMX219_PPL_MIN - mode->width,
> >                                          1, hblank);
> > -     if (imx219->hblank)
> > -             imx219->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> >       exposure_max = mode->vts_def - 4;
> >       exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
> >               exposure_max : IMX219_EXPOSURE_DEFAULT;
> > @@ -842,6 +847,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> >       crop->top = (IMX219_NATIVE_HEIGHT - crop->height) / 2;
> >
> >       if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> > +             u32 prev_hts = format->width + imx219->hblank->val;
> >               int exposure_max;
> >               int exposure_def;
> >               int hblank;
> > @@ -861,13 +867,18 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> >                                        exposure_max, imx219->exposure->step,
> >                                        exposure_def);
> >               /*
> > -              * Currently PPL is fixed to IMX219_PPL_DEFAULT, so hblank
> > -              * depends on mode->width only, and is not changeble in any
> > -              * way other than changing the mode.
> > +              * Retain PPL setting from previous mode so that the
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
> Kind regards,
>
> Sakari Ailus

