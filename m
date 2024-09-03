Return-Path: <linux-media+bounces-17478-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4DB96A01D
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 16:15:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6433B1F27E0E
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 14:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 340C013C809;
	Tue,  3 Sep 2024 14:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="kkiqh3XM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181BF4CB2B
	for <linux-media@vger.kernel.org>; Tue,  3 Sep 2024 14:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725372820; cv=none; b=D+gSz7UHGNZSFcaK5mZKD3+qjU9XHMpI4LhxwgRT5Lb0R9B3ty06xUnUcY+zEQantDKjYU+0+r4TLvBOW7c5i3nff/uZwMcEipZg//4+xhHGOKPQAx7uV3tQSJty90/vhEumOAagoHYjKiu7x/+FKKfBxXeCYhnBs9ZtJt4HeVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725372820; c=relaxed/simple;
	bh=sPpHRr+MQLtm2Lboh1G6Dsx9tD1YkMHI84X65rPY/U0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OKXYb15U1LFMRr/FsfD4aZClheNvhf/nSUqZ7SUphMu/C9b3V9jN7CqTHdzl0YNUgvwa+VGbwoi1AlzoxbhBK57uJ7SPTyrGOJq55wU5IfAOLo/3GPzK0tmBmkRws4yTX+C1+YJU6DXItIwuUUN7/YhkqKePd6LBMyc+d3gik58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=kkiqh3XM; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e03caab48a2so4134993276.1
        for <linux-media@vger.kernel.org>; Tue, 03 Sep 2024 07:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1725372817; x=1725977617; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PDQY8XH9MN+Nzb3qiOmjoo7+Bk7qNxUQTWX7Kdpt7tE=;
        b=kkiqh3XMzG2D+5ForXHL07VXvBQG6ltsAVsXHa5a9blUO0HPA++rdAm5WjRrKYLKxq
         frvSdoGAAUomRxnMOKeUnR5r/1L/E5d4AETgukp5scByr6T9daYXLaNrW2RxWOeyhbsX
         Zcb2Zh2R3/tpdPf32TTVGZBWi8JV3Gj9AmLA37SwKdvOWBBG3T/TMH4AxrmKj5G0KzcW
         mF0OViY9ANP7fIgA7mMYvStdkIxDXIqsHyi+Z65wavH7zGzQj/L0ucUUJUDni59VJzNV
         ha0yrO7uQX3PeZ/7uV0RgZwXtW31/VHzs6gbuYYsk+Vb1erpzr6wcBhdsBFRX2WFbTz+
         Hxmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725372817; x=1725977617;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PDQY8XH9MN+Nzb3qiOmjoo7+Bk7qNxUQTWX7Kdpt7tE=;
        b=Zj17JkYxr4sMZskOzAON93TBcQ5u42fpW4OUbNHZglcrx7zgjqoMStzFn6O4PFhJ9/
         3RJXKDhBdSPrvMoLc+riBEth8vlOrY4ILFu+SXFopjlQllxo3IsgzD6v54LSP5nIbe6N
         B2lson3bP6aRUfipOyfpBwYOu5fXV10kUze4Z76b1DAB2l4y6WEumIJxJAWBftwRZ359
         nLEQYkjFH6xZN5idLMmi11OEdHPBXzZ3P10kba7Rf077Xyva3UaCpVu3oXcwSxOrO1zF
         kXSELjIlhElRg+zxqeLPWpI/roJJ4dNnVKyqmmLj7qTm6LPkfG9fDFUeAij5YXKeFUwE
         u+JQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeWTpHJObFmmrJ+QTbckVGxoyyIspWd9t7OMEaO5AKDewCjQ3+qjGnKvBIDAlbF2/t6+1n0lRWMQ2Xyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwASqOK/mbclmh2fiu2MRHCwQgJXOsSqjC/xejETmR2GQFjfr9/
	7O4unx1UhlvcjAEpZHyw1cRFkLy/VWTucUdTknKEq+Iw1S/TcWPbHNAQQaw1C/k9MONXYnzY3io
	NxTUgH382WoQ47yLA3Noe4u+DOFHsTrmufiopqA==
X-Google-Smtp-Source: AGHT+IEN4iFEJvvqM9POvKE1Xbxg1aJuDADnDtFVa3bwjgX7EjE7l2Xbum94PfzolONPJBxCrlUkgWCGX+Ire6m9SXQ=
X-Received: by 2002:a05:6902:d47:b0:e1a:90ef:3b6d with SMTP id
 3f1490d57ef6-e1a90ef3bf3mr7192204276.7.1725372816859; Tue, 03 Sep 2024
 07:13:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902-imx290-avail-v3-0-b32a12799fed@skidata.com>
 <20240902-imx290-avail-v3-4-b32a12799fed@skidata.com> <20240902195821.GQ1995@pendragon.ideasonboard.com>
 <CAJpcXm6r_LAD+NC7u5aNvkEHq3Vb3osCea8MAn8nQ45dCtoxSg@mail.gmail.com> <20240903130053.GA25878@pendragon.ideasonboard.com>
In-Reply-To: <20240903130053.GA25878@pendragon.ideasonboard.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 3 Sep 2024 15:13:20 +0100
Message-ID: <CAPY8ntD7M5k+v-oPOMhyJV=_OcHwVjq_32m18_MrHO4zsYQOzg@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] media: i2c: imx290: Introduce initial "off" mode &
 link freq
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Benjamin Bara <bbara93@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Benjamin Bara <benjamin.bara@skidata.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Sept 2024 at 14:01, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, Sep 02, 2024 at 10:55:04PM +0200, Benjamin Bara wrote:
> > On Mon, 2 Sept 2024 at 21:58, Laurent Pinchart wrote:
> > > On Mon, Sep 02, 2024 at 05:57:29PM +0200, bbara93@gmail.com wrote:
> > > > From: Benjamin Bara <benjamin.bara@skidata.com>
> > > >
> > > > To be compliant to the V4L2 API, the driver currently "randomly" decides
> > > > on one of the two supported modes which also implies a link frequency.
> > > >
> > > > Add a new mode and frequency which symbolize that the sensor is not in
> > > > use. This can be used as a default value during probe() and enables us
> > > > to avoid communication with the sensor.
> > >
> > > I really doin't like this change. I would like to instead move away from
> > > modes and make the driver freely configurable.
> >
> > Which controls do you want to have freely configurable? At least on the
> > imx290 the exposure limits depend on the blanking, and the blanking
> > limits depend on the format. As the format is defined by the mode on
> > imx290, I think this will be quite hard with the current controls.
>
> I want to make the format freely configurable.

Isn't this partly limited by the discussion led by Jacopo in Dublin
back in 2022 [1]?

How do we shift from the current list of 2 modes, to a single defined
mode that the selection API can then crop?
Changing the list of enumerated modes is likely to break existing
users of this driver, and AIUI it isn't currently permitted for
selecting a new enumerated mode to update the selection rectangles.

It also needs someone to sit down and fully digest the window cropping
mode section of the datasheet, and hope that the sensor actually
behaves as documented. I know I don't have the time to do that at
present.

[1] https://www.spinics.net/lists/linux-media/msg218231.html

> > > Furthermore, the concept of an initial unconfigured state isn't valid
> > > in V4L2. The driver must fully initialize the whole device state at
> > > probe time.
> >
> > I understand that and it makes sense to me. But given the dependencies
> > from above and the fact that the format is currently part of this
> > "state", it makes the "freely configurable" intention even harder :-(
>
> Why can't we simply initialize the controls with limits that correspond
> to the default format ? I don't understand what issue this is trying to
> solve.

If I'm following the full discussion correctly now, it's trying to
avoid those couple of register writes during probe due to updating
VBLANK and HBLANK control ranges. Adding all this "dummy mode" code
seems overkill to achieve that.

I see 3 simpler approaches:
- Move the pm_runtime calls so that the range updates are when the
sensor is powered down. Ack on that needing very careful handling of
what is initialised when.
- Move the lines
    state = v4l2_subdev_lock_and_get_active_state(&imx290->sd);
    imx290_ctrl_update(imx290, imx290->current_mode);
    v4l2_subdev_unlock_state(state);
out of imx290_subdev_init to the end of imx290_probe, after the pm_runtime_put
- Add a flag to the state (in addition to the pm_runtime handling) to
denote that we're between stream_on and stream_off, and therefore
imx290_set_ctrl should update registers.

A quick test of the 2nd option (with patches 1, 3, and 6) appears to
achieve that aim - I only see the one read from patch 6.
IMHO trying to address the case where runtime PM is disabled is fairly
redundant, but others may disagree. Option 3 would achieve that with
minimal extra overhead though.

  Dave

> > > > Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
> > > > ---
> > > > Changes since v2:
> > > > - new
> > > > ---
> > > >  drivers/media/i2c/imx290.c | 29 +++++++++++++++++++++++------
> > > >  1 file changed, 23 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > > > index 6812e7cb9e23..ece4d66001f5 100644
> > > > --- a/drivers/media/i2c/imx290.c
> > > > +++ b/drivers/media/i2c/imx290.c
> > > > @@ -425,14 +425,17 @@ static const struct imx290_csi_cfg imx290_csi_297mhz = {
> > > >  /* supported link frequencies */
> > > >  #define FREQ_INDEX_1080P     0
> > > >  #define FREQ_INDEX_720P              1
> > > > +#define FREQ_INDEX_OFF               2
> > > >  static const s64 imx290_link_freq_2lanes[] = {
> > > >       [FREQ_INDEX_1080P] = 445500000,
> > > >       [FREQ_INDEX_720P] = 297000000,
> > > > +     [FREQ_INDEX_OFF] = 0,
> > > >  };
> > > >
> > > >  static const s64 imx290_link_freq_4lanes[] = {
> > > >       [FREQ_INDEX_1080P] = 222750000,
> > > >       [FREQ_INDEX_720P] = 148500000,
> > > > +     [FREQ_INDEX_OFF] = 0,
> > > >  };
> > > >
> > > >  /*
> > > > @@ -552,6 +555,10 @@ static const struct imx290_mode imx290_modes_4lanes[] = {
> > > >       },
> > > >  };
> > > >
> > > > +static const struct imx290_mode imx290_mode_off = {
> > > > +     .link_freq_index = FREQ_INDEX_OFF,
> > > > +};
> > > > +
> > > >  static inline const struct imx290_mode *imx290_modes_ptr(const struct imx290 *imx290)
> > > >  {
> > > >       if (imx290->nlanes == 2)
> > > > @@ -876,10 +883,19 @@ static unsigned int imx290_get_blank_min(const struct imx290 *imx290, bool v)
> > > >  static void imx290_ctrl_update(struct imx290 *imx290,
> > > >                              const struct imx290_mode *mode)
> > > >  {
> > > > -     unsigned int hblank_min = mode->hmax_min - mode->width;
> > > > -     unsigned int hblank_max = IMX290_HMAX_MAX - mode->width;
> > > > -     unsigned int vblank_min = mode->vmax_min - mode->height;
> > > > -     unsigned int vblank_max = IMX290_VMAX_MAX - mode->height;
> > > > +     unsigned int hblank_min, hblank_max, vblank_min, vblank_max;
> > > > +
> > > > +     if (mode == &imx290_mode_off) {
> > > > +             hblank_min = imx290_get_blank_min(imx290, false);
> > > > +             hblank_max = HBLANK_MAX;
> > > > +             vblank_min = imx290_get_blank_min(imx290, true);
> > > > +             vblank_max = VBLANK_MAX;
> > > > +     } else {
> > > > +             hblank_min = mode->hmax_min - mode->width;
> > > > +             hblank_max = IMX290_HMAX_MAX - mode->width;
> > > > +             vblank_min = mode->vmax_min - mode->height;
> > > > +             vblank_max = IMX290_VMAX_MAX - mode->height;
> > > > +     }
> > > >
> > > >       __v4l2_ctrl_s_ctrl(imx290->link_freq, mode->link_freq_index);
> > > >
> > > > @@ -932,7 +948,8 @@ static int imx290_ctrl_init(struct imx290 *imx290)
> > > >       imx290->link_freq =
> > > >               v4l2_ctrl_new_int_menu(&imx290->ctrls, &imx290_ctrl_ops,
> > > >                                      V4L2_CID_LINK_FREQ,
> > > > -                                    imx290_link_freqs_num(imx290) - 1, 0,
> > > > +                                    imx290_link_freqs_num(imx290) - 1,
> > > > +                                    FREQ_INDEX_OFF,
> > > >                                      imx290_link_freqs_ptr(imx290));
> > > >       if (imx290->link_freq)
> > > >               imx290->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > > > @@ -1278,7 +1295,7 @@ static int imx290_subdev_init(struct imx290 *imx290)
> > > >       struct v4l2_subdev_state *state;
> > > >       int ret;
> > > >
> > > > -     imx290->current_mode = &imx290_modes_ptr(imx290)[0];
> > > > +     imx290->current_mode = &imx290_mode_off;
> > > >
> > > >       v4l2_i2c_subdev_init(&imx290->sd, client, &imx290_subdev_ops);
> > > >       imx290->sd.internal_ops = &imx290_internal_ops;
> > > >
>
> --
> Regards,
>
> Laurent Pinchart
>

