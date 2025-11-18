Return-Path: <linux-media+bounces-47289-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 72467C6977D
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 13:49:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A28124F2441
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 12:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 056BA23E346;
	Tue, 18 Nov 2025 12:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="T1GaAGno"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40F522D793
	for <linux-media@vger.kernel.org>; Tue, 18 Nov 2025 12:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763470071; cv=none; b=EmJy8DuuqhgnFGGHXgvKsszlmxlUnUGN2U3l91VinXMQ5PS7190cgVR/2CaEI7czeptCpCVzT9P8F4+SdV6ghyPOSLSxjZIiTfoq6/57HTSSC7CSdNbchcdTbTlEsVC3R8ZhBFZFoZ0Rq80qXgRz9SFuPqBeNyZ0RnTRgVc+TcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763470071; c=relaxed/simple;
	bh=Z64v7taxnAT9+RFiPdKjtWyhstOkUYb8NY2GdhGX8SE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=njOO989zUiX6RQQ3i6RSl0diEpxyUwWkACXDVD3+bwEsZ+aRn2bg/AtOYz6AfeNsnLjVw0fKuev9Gm8T3+Fc5GuP1eCpPNTY4sfs/K7ALHwUCErmgfvFzVdEJzCagGV9jTaVi1QI0z+26j5+gF/39nqCatPpepjfKZ9wAYpOGXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=T1GaAGno; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-37a3340391cso46577121fa.3
        for <linux-media@vger.kernel.org>; Tue, 18 Nov 2025 04:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1763470065; x=1764074865; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5F+q+11rWxFdCLXBq4xBjBzozpfpygyEwTxgA/nhiow=;
        b=T1GaAGnopsbL87nKn/ajbVUrqIsasY3ywsskihTd5LlgDv9IYB0NiiR1+fNZXUaHDS
         DPBF/Vf8l7g2vfziFaCJbYZT3Z+ShZHMXVLckvYjuKCsE+41OZ0JUy/APt+mGFa02xYF
         4oPj1PMhvTYBzMMVZsAfOVmAHSs7rrsBn+gce4ef8X3mq3H5vn6rUe1jJTGfFJpg/i4P
         TBaQDw5gkGd4xz1pP8GclDDpPcognoV51hGrO5LPlv01XW2AyI/6lfPW/0IXeISLGgPN
         IE8k2kLy5+JOy/qq8Pka4NPDYPqJevXHJVZ8HElJ6/41y8bo8bNM5GY4e79OvmjjVvJ9
         Zv2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763470065; x=1764074865;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5F+q+11rWxFdCLXBq4xBjBzozpfpygyEwTxgA/nhiow=;
        b=g5kFc+dHIUvdFZ34re1HlGCYJtPcaQXWmTy97Kp9gGRvuabMh5BZG9s1gx/SszUG8o
         xb8i/xq6YfLR9jpvjYWsng+9YvlmA2mZ48se9wow+U2d2yw2pTI1funuYE3ahMjfWR6I
         Sckgg7AgXPIpM2lo69knze2jb/HJa1hVgfofmCBEqNU87iD5r9XtmDnT4Z24W1ZvDiI/
         uHH7rvFna/4qkd57wKKNglZCjPghIo4QYU2/JWDIznrklbpbqmLImzG4NZME0d4ZKljG
         1KGDJi8lKg5xJb9xHQfgtT4It6aRXleFRVPryPkNblZeJLzYsuk0R0IpbyX5b8EFQRm/
         IN1w==
X-Forwarded-Encrypted: i=1; AJvYcCXiCxwP28NCC+jehytk9w2Gu52d3HriAA8hUwuzvN+gbbvp5rlBVhV53x55k8J0aGdYPG9hETWwfKXxCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvgbjt2jUUncK9qqAZMBZelbBzmRflQJ5nTSt2SU/xZRRvwlQO
	gWiaiUGuD+uu4PDMBn8y2IYOQkhva7qboluK9fiPjy3cjXHhKFpy6Y7YnFs0MZLTIFMRDdYbTJ1
	SEEY2G7u2BSE4Eh2jgjDL4ThWwYI0EDb4YaS9cfkPGg==
X-Gm-Gg: ASbGncvjKHC8GPUZ270m5o+WB+ZdkWxYukDKmsvr6/o2Tmb1NIErxnAqUOC01a1muUf
	b3NYFbgqGGRNUDCzmlcvpbSGUDRZmOMS+QMgXVY2e6RBPAAajumKc2KLS2401zV46xK86IflF5b
	nUKyS5rl/jN8O5p3LZhfPVutDotYp8fmVO4ulf8zRitKuaWuXwpdRznXTiIWrUr4iNDK5FCHGZC
	d1EN5RUF15q5sI4tLxPCdB2tOucp0T8BU+dHKCfSX0AIAlsVH3AQ/AcysxUAqlYcl3PnMeD7Fqw
	+D9jSZYeRmWu2ck=
X-Google-Smtp-Source: AGHT+IGcgEFUr5deY4pPSdI5g3GGTKJg5m8vCQ92sTgWgtytfF3T52LKepy+5xm5mqYdVYh8x5/RAvJkiR9+pLZ8LUc=
X-Received: by 2002:a05:6512:8019:10b0:595:91c5:3dd8 with SMTP id
 2adb3069b0e04-59591c541c7mr1799736e87.26.1763470064624; Tue, 18 Nov 2025
 04:47:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251028-b4-rpi-ov5647-v1-0-098413454f5e@ideasonboard.com>
 <20251028-b4-rpi-ov5647-v1-13-098413454f5e@ideasonboard.com>
 <tca3pwpzwqokxpjlv5mjsf3mai6ojlwypve6np53vur4cojd3t@viistqpnzv25> <176346530691.268162.12757814341347187181@freya>
In-Reply-To: <176346530691.268162.12757814341347187181@freya>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 18 Nov 2025 12:47:25 +0000
X-Gm-Features: AWmQ_bn5wMBEdS-aHqStYZtogw4oouMsGDHjQ10nuj94wPgSqCRZA4o7_fgP9uQ
Message-ID: <CAPY8ntA2TCf9FuB6Nk+On+y6N_PMuYPAOAr3Yx8YESwe4skWvw@mail.gmail.com>
Subject: Re: [PATCH 13/13] media: i2c: ov5647: Add V4L2_CID_LINK_FREQUENCY control
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Jacopo Mondi <jacopo@jmondi.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	David Plowman <david.plowman@raspberrypi.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Peter Robinson <pbrobinson@gmail.com>, 
	Stefan Wahren <wahrenst@gmx.net>, "Ivan T. Ivanov" <iivanov@suse.de>
Content-Type: text/plain; charset="UTF-8"

Hi Jacopo & Jai

On Tue, 18 Nov 2025 at 11:28, Jai Luthra <jai.luthra@ideasonboard.com> wrote:
>
> Hi Jacopo,
>
> Quoting Jacopo Mondi (2025-11-02 16:59:02)
> > Hi Jai
> >
> > On Tue, Oct 28, 2025 at 12:57:24PM +0530, Jai Luthra wrote:
> > > From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >
> > > The link frequency can vary between modes, so add it as a
> > > control.
> > >
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > > ---
> > >  drivers/media/i2c/ov5647.c | 25 ++++++++++++++++++++++++-
> > >  1 file changed, 24 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> > > index be0b96c4372ae0c6d8fc57280b195d6069dd7019..dea978305c3c868819780f7f631b225f4c1e7756 100644
> > > --- a/drivers/media/i2c/ov5647.c
> > > +++ b/drivers/media/i2c/ov5647.c
> > > @@ -97,6 +97,13 @@ static const char * const ov5647_supply_names[] = {
> > >
> > >  #define OV5647_NUM_SUPPLIES ARRAY_SIZE(ov5647_supply_names)
> > >
> > > +#define FREQ_INDEX_FULL              0
> > > +#define FREQ_INDEX_VGA               1
> > > +static const s64 ov5647_link_freqs[] = {
> > > +     [FREQ_INDEX_FULL]       = 218500000,
> >
> > The full mode pixel rate is set to 87500000, which considering CSI-2
> > DDR mode and the 2 lanes in use give me a link freq of 21875000.
>
> Indeed, I get the same value, will update.

Agreed. I obviously lost a digit.

> >
> > Do you know where 218500000 comes from ? (it might be perfectly legit,
> > I'm not questioning that).
> >
>
> > > +     [FREQ_INDEX_VGA]        = 208333000,
>
> This value should be 137500000 if we do the same calculation using the
> pixel rate for the VGA mode. But for the VGA mode, the sensor does 2x2
> binning + 2x2 subsampling, which is quite a bit different than other modes.
>
> https://docs.kernel.org/driver-api/media/tx-rx.html#pixel-rate mentions
> that the pixel rate value calculated from the bus link frequency does not
> necessarily have to match the PIXEL_RATE control value (which is for the
> sensor's internal readout of pixels including blanking).

Indeed you should never assume that pixel rate and link frequency are
directly linked. So many sensors have separate PLLs for the pixel
array vs the MIPI block.

Having said that, OV5647 appears to use the same PLL for pixel clock
and MIPI, although it does have a separate PLLADCLK which is
presumably for the ADC.

> Ultimately, these values are coming from the BSP where the CFE driver is
> using the link frequency control to configure the DPHY-RX rate, so I think
> it would be wiser to not reduce the VGA link frequency value, which may
> cause issues with DPHY-RX latching. We can always fix it later if needed.

It's been a long time since I looked at these settings, but I do have
a spreadsheet from Omnivision that gives clock frequencies based on
register values.
In my experience the link frequency isn't critical to be exactly right
as it typically only sets up timeout ranges in the PHY. Even if the
value is significantly out it will generally work just fine.

VGA and full modes differ in register 0x3036 (SC_CMMN_PLL_MULTIPLIER)
which alters all the timings.

Running the numbers again, I get the VGA link frequency to be
145.8333MHz, but also the pixel rate to be 58.333MPix/s vs 55 in the
driver. I don't recall the VGA mode being 6% out on frame rate and
exposure setup, so I can't quite square that with reality. I'll try to
find 10 minutes to confirm, unless either of you happen to have one
set up and could validate the frame times.

  Dave

> > > +};
> > > +
> > >  struct regval_list {
> > >       u16 addr;
> > >       u8 data;
> > > @@ -106,6 +113,7 @@ struct ov5647_mode {
> > >       struct v4l2_mbus_framefmt       format;
> > >       struct v4l2_rect                crop;
> > >       u64                             pixel_rate;
> > > +     unsigned int                    link_freq_index;
> > >       int                             hts;
> > >       int                             vts;
> > >       const struct regval_list        *reg_list;
> > > @@ -128,6 +136,7 @@ struct ov5647 {
> > >       struct v4l2_ctrl                *exposure;
> > >       struct v4l2_ctrl                *hflip;
> > >       struct v4l2_ctrl                *vflip;
> > > +     struct v4l2_ctrl                *link_freq;
> > >  };
> > >
> > >  static inline struct ov5647 *to_sensor(struct v4l2_subdev *sd)
> > > @@ -376,6 +385,7 @@ static const struct ov5647_mode ov5647_modes[] = {
> > >                       .height         = 1944
> > >               },
> > >               .pixel_rate     = 87500000,
> > > +             .link_freq_index = FREQ_INDEX_FULL,
> > >               .hts            = 2844,
> > >               .vts            = 0x7b0,
> > >               .reg_list       = ov5647_2592x1944_10bpp,
> > > @@ -397,6 +407,7 @@ static const struct ov5647_mode ov5647_modes[] = {
> > >                       .height         = 1080,
> > >               },
> > >               .pixel_rate     = 87500000,
> > > +             .link_freq_index = FREQ_INDEX_FULL,
> > >               .hts            = 2416,
> > >               .vts            = 0x450,
> > >               .reg_list       = ov5647_1080p30_10bpp,
> > > @@ -418,6 +429,7 @@ static const struct ov5647_mode ov5647_modes[] = {
> > >                       .height         = 1944,
> > >               },
> > >               .pixel_rate     = 87500000,
> > > +             .link_freq_index = FREQ_INDEX_FULL,
> > >               .hts            = 1896,
> > >               .vts            = 0x59b,
> > >               .reg_list       = ov5647_2x2binned_10bpp,
> > > @@ -439,6 +451,7 @@ static const struct ov5647_mode ov5647_modes[] = {
> > >                       .height         = 1920,
> > >               },
> > >               .pixel_rate     = 55000000,
> > > +             .link_freq_index = FREQ_INDEX_VGA,
> > >               .hts            = 1852,
> > >               .vts            = 0x1f8,
> > >               .reg_list       = ov5647_640x480_10bpp,
> > > @@ -925,6 +938,8 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
> > >                                        sensor->exposure->minimum,
> > >                                        exposure_max, sensor->exposure->step,
> > >                                        exposure_def);
> > > +
> > > +             __v4l2_ctrl_s_ctrl(sensor->link_freq, mode->link_freq_index);
> >
> > Doesn't this cause an error in s_ctrl where the control is not handled
> > ?
>
> The framework returns -EACCESS for read-only controls in validate_ctrls()
>
> >
> > >       }
> > >       *fmt = mode->format;
> > >       /* The code we pass back must reflect the current h/vflips. */
> > > @@ -1230,7 +1245,7 @@ static int ov5647_init_controls(struct ov5647 *sensor, struct device *dev)
> > >       int hblank, exposure_max, exposure_def;
> > >       struct v4l2_fwnode_device_properties props;
> > >
> > > -     v4l2_ctrl_handler_init(&sensor->ctrls, 9);
> > > +     v4l2_ctrl_handler_init(&sensor->ctrls, 10);
> > >
> > >       v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
> > >                         V4L2_CID_AUTOGAIN, 0, 1, 1, 0);
> > > @@ -1290,6 +1305,14 @@ static int ov5647_init_controls(struct ov5647 *sensor, struct device *dev)
> > >       if (sensor->vflip)
> > >               sensor->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> > >
> > > +     sensor->link_freq =
> > > +             v4l2_ctrl_new_int_menu(&sensor->ctrls, &ov5647_ctrl_ops,
> >
> > As suggested for PIXEL_RATE, if you make the control read-only you
> > should set the control ops to NULL.
>
> Will do in v2.
>
> > > +                                    V4L2_CID_LINK_FREQ,
> > > +                                    ARRAY_SIZE(ov5647_link_freqs) - 1, 0,
> > > +                                    ov5647_link_freqs);
> > > +     if (sensor->link_freq)
> > > +             sensor->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> >
> > You know, I thought link_freq was set as READ_ONLY by the framework,
> > but it's actuallt PIXEL_RATE (you can remove setting the flags
> > in the driver if you send a patch to remove the control ops when
> > registering PIXEL_RATE).
>
> Will do.
>
> >
> > Thanks
> >   j
> >
> > > +
> > >       v4l2_fwnode_device_parse(dev, &props);
> > >
> > >       v4l2_ctrl_new_fwnode_properties(&sensor->ctrls, &ov5647_ctrl_ops,
> > >
> > > --
> > > 2.51.0
> > >
>
> Thanks,
> Jai

