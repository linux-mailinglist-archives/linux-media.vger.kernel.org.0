Return-Path: <linux-media+bounces-17399-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A31E968EF6
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 22:55:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8BCE283A0E
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 20:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E5F31A305B;
	Mon,  2 Sep 2024 20:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P6yD2Na+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAAE69959;
	Mon,  2 Sep 2024 20:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725310519; cv=none; b=aymmZNrLzPyyfMMq/cTO5SQGVu4TcfXhT5goDQTj5e9YkU26u8lcEYV7XRY+P8FMTDWMHIj2LOvwPkd1acRIkxo44E2/pYfd2ljCta+wowMfRtSj8RhLptYH/SmDOda1dKlzOl1wnx5uEfHWLmfDPC5VtSMyIJT9LtOPdWT4jsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725310519; c=relaxed/simple;
	bh=QkELulMvb7h/k6ZvvEb9NTwkc1cm2REAcITQnec8rHA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EUyW5bDqfePeLyeKfekXfBrSfVG4BIpVboQ93iYHPjbcaDMjLX8tnEQ6VzFibSAnXdEXTq8QPB+BNqCCcADx1oeVeAkdi3YklzrQSltrhR64+qxPq6XVz+gsegzgc/3hbVEkc8qCLqnQy1oCyjbjjyFElUfOcBEPtKhzY9SrFAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P6yD2Na+; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5bf01bdaff0so4265876a12.3;
        Mon, 02 Sep 2024 13:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725310515; x=1725915315; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Des4hBWDUWbYEBIVGxFeT8B5qH+Agsie2aIRmTRDSwo=;
        b=P6yD2Na+CMUtwzEThUbLzeco/g01G2/QP6HBocWmNiUyTrkWs3CT1sdbDUXyntOvD3
         fDPJHbWQ/KWpAYziZzt1vt8YVjUcjXTFdLC1WQ2Q736p9IRXfyxOlJn0XwKmeEGbCRi/
         GZT4S+DC0OeNFN+TfBXPTnCexk8bfAugnOX6RM2CMSjNQWCjItOeU4ki5x1G+gxo6U+9
         sPxLCNSABZ03b/XOf7m/696Y0lbooj8uTgKM5ecsyNSvpEJQRH8xnR2mcOmG14dpC8ce
         fmBf6i7Z4DBAY9/SbjlpPTyK9nzLB6mpzXDXUrYIY7SZ8aL/CxWMQ7GXC0ONodS1XA1j
         l22g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725310515; x=1725915315;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Des4hBWDUWbYEBIVGxFeT8B5qH+Agsie2aIRmTRDSwo=;
        b=cBqLam5fkbSxMh98M4m5cYqWm4De5ma199c4vAvjPBFplaFL8E0dRvWDFz9amrSttR
         4zHV5z9gQKNtClIcxfdX0gtSqs54cxJIHpgkQ0kgvWhzAEDxylB2R0w9TD3IF+50j9v1
         xE1tOPy+svX0Q/GzMsL6Zzb6uBbbBALipqFjo/KK/+EEX3rAdpFizAl0Es+MwqXt88Dl
         JO2j5Mbrr5vLhKjNncrJMyUDb+wkJk7UhSX34MOOBv8vJQQfexCr9KiOVXHVGD60CT55
         3sxXavsrjaddZ6Ag0C6Xv4QNHn2rNW+MHMXmgi/dtN9LezCDTgfAq3uw9wimBMam1XqA
         hFPg==
X-Forwarded-Encrypted: i=1; AJvYcCVJo9jewyJ/TrS7xS0oMlJC0smDIu/aPaMeIDcRfxiXCHkJcdzfiWFbxs5B3/YXJaBugeRTHKjrausAjjM=@vger.kernel.org, AJvYcCVYW8x+I4DgnH7Ahfwc5lBin9Eia/gbBQyjyTm8Kzs03oSFxnDBsHNhXADzVvGPzTmm8e8vRYjR9Wq9EtM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNH2aFjV9qOcbeo+Cv5v0SVXG4gsf1hT3u/ybsn5h37LQW2Jjv
	XqbTqvdR4IQATAnDuzrHqOwMijmKLykdpssDgsjYw3fG/SqzDXsmtou30ntv217hWC9dPalLsLa
	u/sqvkCRKWIoXnnijfDNLwmxfrhA7/As8Abk=
X-Google-Smtp-Source: AGHT+IEq0JltcCgLv2KQZcouPz4FtRqIru3SLe0NK/4po9xd7i/eH9mCRivUdGO5TKiXr1Wj5/TEir5Hv7ryhXlV84k=
X-Received: by 2002:a05:6402:348f:b0:5be:caf6:9dc7 with SMTP id
 4fb4d7f45d1cf-5c21ed89d01mr10019052a12.25.1725310515158; Mon, 02 Sep 2024
 13:55:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902-imx290-avail-v3-0-b32a12799fed@skidata.com>
 <20240902-imx290-avail-v3-4-b32a12799fed@skidata.com> <20240902195821.GQ1995@pendragon.ideasonboard.com>
In-Reply-To: <20240902195821.GQ1995@pendragon.ideasonboard.com>
From: Benjamin Bara <bbara93@gmail.com>
Date: Mon, 2 Sep 2024 22:55:04 +0200
Message-ID: <CAJpcXm6r_LAD+NC7u5aNvkEHq3Vb3osCea8MAn8nQ45dCtoxSg@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] media: i2c: imx290: Introduce initial "off" mode &
 link freq
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Benjamin Bara <benjamin.bara@skidata.com>
Content-Type: text/plain; charset="UTF-8"

Hi Laurent!

On Mon, 2 Sept 2024 at 21:58, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Sep 02, 2024 at 05:57:29PM +0200, bbara93@gmail.com wrote:
> > From: Benjamin Bara <benjamin.bara@skidata.com>
> >
> > To be compliant to the V4L2 API, the driver currently "randomly" decides
> > on one of the two supported modes which also implies a link frequency.
> >
> > Add a new mode and frequency which symbolize that the sensor is not in
> > use. This can be used as a default value during probe() and enables us
> > to avoid communication with the sensor.
>
> I really doin't like this change. I would like to instead move away from
> modes and make the driver freely configurable.

Which controls do you want to have freely configurable? At least on the
imx290 the exposure limits depend on the blanking, and the blanking
limits depend on the format. As the format is defined by the mode on
imx290, I think this will be quite hard with the current controls.

> Furthermore, the concept of an initial unconfigured state isn't valid
> in V4L2. The driver must fully initialize the whole device state at
> probe time.

I understand that and it makes sense to me. But given the dependencies
from above and the fact that the format is currently part of this
"state", it makes the "freely configurable" intention even harder :-(

Kind regards
Benjamin

> > Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
> > ---
> > Changes since v2:
> > - new
> > ---
> >  drivers/media/i2c/imx290.c | 29 +++++++++++++++++++++++------
> >  1 file changed, 23 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > index 6812e7cb9e23..ece4d66001f5 100644
> > --- a/drivers/media/i2c/imx290.c
> > +++ b/drivers/media/i2c/imx290.c
> > @@ -425,14 +425,17 @@ static const struct imx290_csi_cfg imx290_csi_297mhz = {
> >  /* supported link frequencies */
> >  #define FREQ_INDEX_1080P     0
> >  #define FREQ_INDEX_720P              1
> > +#define FREQ_INDEX_OFF               2
> >  static const s64 imx290_link_freq_2lanes[] = {
> >       [FREQ_INDEX_1080P] = 445500000,
> >       [FREQ_INDEX_720P] = 297000000,
> > +     [FREQ_INDEX_OFF] = 0,
> >  };
> >
> >  static const s64 imx290_link_freq_4lanes[] = {
> >       [FREQ_INDEX_1080P] = 222750000,
> >       [FREQ_INDEX_720P] = 148500000,
> > +     [FREQ_INDEX_OFF] = 0,
> >  };
> >
> >  /*
> > @@ -552,6 +555,10 @@ static const struct imx290_mode imx290_modes_4lanes[] = {
> >       },
> >  };
> >
> > +static const struct imx290_mode imx290_mode_off = {
> > +     .link_freq_index = FREQ_INDEX_OFF,
> > +};
> > +
> >  static inline const struct imx290_mode *imx290_modes_ptr(const struct imx290 *imx290)
> >  {
> >       if (imx290->nlanes == 2)
> > @@ -876,10 +883,19 @@ static unsigned int imx290_get_blank_min(const struct imx290 *imx290, bool v)
> >  static void imx290_ctrl_update(struct imx290 *imx290,
> >                              const struct imx290_mode *mode)
> >  {
> > -     unsigned int hblank_min = mode->hmax_min - mode->width;
> > -     unsigned int hblank_max = IMX290_HMAX_MAX - mode->width;
> > -     unsigned int vblank_min = mode->vmax_min - mode->height;
> > -     unsigned int vblank_max = IMX290_VMAX_MAX - mode->height;
> > +     unsigned int hblank_min, hblank_max, vblank_min, vblank_max;
> > +
> > +     if (mode == &imx290_mode_off) {
> > +             hblank_min = imx290_get_blank_min(imx290, false);
> > +             hblank_max = HBLANK_MAX;
> > +             vblank_min = imx290_get_blank_min(imx290, true);
> > +             vblank_max = VBLANK_MAX;
> > +     } else {
> > +             hblank_min = mode->hmax_min - mode->width;
> > +             hblank_max = IMX290_HMAX_MAX - mode->width;
> > +             vblank_min = mode->vmax_min - mode->height;
> > +             vblank_max = IMX290_VMAX_MAX - mode->height;
> > +     }
> >
> >       __v4l2_ctrl_s_ctrl(imx290->link_freq, mode->link_freq_index);
> >
> > @@ -932,7 +948,8 @@ static int imx290_ctrl_init(struct imx290 *imx290)
> >       imx290->link_freq =
> >               v4l2_ctrl_new_int_menu(&imx290->ctrls, &imx290_ctrl_ops,
> >                                      V4L2_CID_LINK_FREQ,
> > -                                    imx290_link_freqs_num(imx290) - 1, 0,
> > +                                    imx290_link_freqs_num(imx290) - 1,
> > +                                    FREQ_INDEX_OFF,
> >                                      imx290_link_freqs_ptr(imx290));
> >       if (imx290->link_freq)
> >               imx290->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > @@ -1278,7 +1295,7 @@ static int imx290_subdev_init(struct imx290 *imx290)
> >       struct v4l2_subdev_state *state;
> >       int ret;
> >
> > -     imx290->current_mode = &imx290_modes_ptr(imx290)[0];
> > +     imx290->current_mode = &imx290_mode_off;
> >
> >       v4l2_i2c_subdev_init(&imx290->sd, client, &imx290_subdev_ops);
> >       imx290->sd.internal_ops = &imx290_internal_ops;
> >
>
> --
> Regards,
>
> Laurent Pinchart

