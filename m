Return-Path: <linux-media+bounces-55596-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDuiN3LFs2lAawAAu9opvQ
	(envelope-from <linux-media+bounces-55596-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 09:06:10 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 835E727F41A
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 09:06:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A20C03240A2A
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 07:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7C2E37266F;
	Fri, 13 Mar 2026 07:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K/3/v9zY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E41134B426
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 07:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773388523; cv=pass; b=ljg2ux08cJ5gY5G5aSPVLRVDC8WzV5KKf7GDBups9uBhdSIEJXaGKw1ZyMmp2/mj/bDsav0cuYT0snCbnWfMCOUvhBPOpJPORVucf7poCC32gmunSTyGlCFLLPHVZ5kaiW3kFVFWv9J5nlHXXqjFXqd7TPFZ0JXLEQ+HZ6IHkXE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773388523; c=relaxed/simple;
	bh=4vNwTT/i+vp3MLwt2DbuIY0p6Uxbw/qX2lDJ0JjdjaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LqonqQNz4L8PmFojU7mJ5vXweXnWxwEwiga+evUmB+cVb4OpAdiEvbdxCIXa9R8qdY3zB0FPjH/q9spEjPlky4Vjyan40VfDVnTNEOHFc6QGZggQWeKZ+OmN/l8fXXiCls096qMgkDIujdvHoYVIk9pWBO+YXG5HVwcPtDAemSE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K/3/v9zY; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-128d7db88b9so2254551c88.0
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 00:55:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773388520; cv=none;
        d=google.com; s=arc-20240605;
        b=g5hJAFYkaMe1SrqrSRBI07dFMS1HMmDGiiV8MHT6lt8nCItf3IfMw/Dmyd4A0nanHa
         UifUZm6B3Tyo3EQqBn3w02uRZ2cxIfG+0vDvrt6/WmI9izqjxU7gFLeWb7v1BoY9dAtt
         Nyh7S3rl9r5idVfww2Pj2WVu4+SjWFwgN/AMa6JISsGnnB7JnlisyQQ7rcYVEsTPsy3x
         uGUaWdRaQTQxiHXK2lTHqpGk1Bbfg56VwUskLX+0eLSofYvi+MsAPuU1lh7YESgXV5z/
         VBOMEnbB9dcxSdWKWO/ZTYFU15uEKmJmIfsEvBpaRTb5TLw4bri0IPZ0PrIlYF8DwhhP
         OT8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PgijjloqpevuZ4ykxolP6Q7mvsG7In7FnSc0zHjI3r0=;
        fh=Vd6fygCh15b+8M+A55prJDJy9f7JOCSX+tiRQXFuwO8=;
        b=NZAFF4gQ3Puok6jugnEgz0Vp8lfa7LEuHGwojiDBKxtEN4+ey9a9oG1oEYGkN64EoD
         dCedOoeDiSqmAlP9loHErIPTyqvflRvcOMLGEKpF6lU5cc6CS/gBkG0tdkqmmQdEtrV9
         C4Df9yn9WpZ32gbZM4OFWIbf1CeMNj/vXRYKN5Q9mYN0BrNhqh0SYP1kuTur8rzkuvD1
         HAErNzjWHLK9bYq8PcLXZPkDUISOpSG/kpd77aJPN4FtdTAES1HXj1i4vCLGGQ0NcBpI
         8J5RTCAvZICEkOxKRFhc6gYt54kcQWu5r14MCMlhj1pmDW+QWeCem3Y4eP/ciDjMjWyE
         46Pg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773388520; x=1773993320; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PgijjloqpevuZ4ykxolP6Q7mvsG7In7FnSc0zHjI3r0=;
        b=K/3/v9zYjUBEaWkab+aCO9382cSEVt0IwNgFqI5TT5GH0TB7VU095/ukP7B/13h7Cj
         00p0coJJa/X1GNivJWu1/B6raujOKxQCDxG/IAWOac/8C882yNLRZsz9sQdMcURQiU6g
         tD2ro46/1AWpCflNJ96PYdG5YOpI7lQJMb4R+XzKgzSSTFcNu/FNn0XKO4lo6fCDrs/B
         5izv3pX4auaRbwlw5ViNCbezy1Incd1RUC+RfmhvpUKH3bH787IuaOxH4aH3XmMyy2H8
         scMkjOjTNay2VNmouxEN7IvQ0gc/NwpC3RTzTcwbWmiCQY9vdlisd8w0y/H+NloWmsv/
         k1RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773388520; x=1773993320;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PgijjloqpevuZ4ykxolP6Q7mvsG7In7FnSc0zHjI3r0=;
        b=bVA8vTYMWCTj0p7FeTs9trd5Bmspzd09LldX4NophuYQJQIMlTgYJoHxBdQnUDiKFV
         WaSMXO6YwwmD5FKpTOgUdTApIe2X1Om/iou1ys/q+/Dq69Ubi672Tphxwme2PhPxQF2w
         PGhXJxaX28FmGkdtfyBXynzyyRRpEMp3t5fMKZNs17jd1cIx8b4dO29RffsQnSOWYfEr
         nMssaTwY/BYJnndinanEKMXmfmKGTELeBDc8O631pqSNjEolqd6CcGbtSfJ+UslRUyF8
         KB4x+fi7+R9JAxhxxtmBW4NZBLc743rGSj3THWsh54YVoLeSHPrqR6nTCAqW7XRQK+2n
         AH3w==
X-Gm-Message-State: AOJu0Ywm6pukUfrGjnRUSqRZXSUTHf0ipYTxaW/cogmhBmP1jYn0B7GV
	kg7Mz9AA5evh2kWAAwkKZ9w6MPXCtZKmfpZ1Dzwwzk3loCHSJUUBUKkiMQd4uy/a0pifRsRCH7x
	dgij8r9+cfvuhrZQ2cPV2bxDNJA1VwCeHjgfH0HQ=
X-Gm-Gg: ATEYQzyf1K5t9pE88skhs7rCjsfjZ+NT3NaRyhsq59xCBidS+lYh//+2ib3gXyG0+Th
	+TaDd6InGF7J0d6nmt/V870DhLS8wx9IGm5MES6rWGlL5GPVfvvPzKqX5B3X3g283rpxvotHtzO
	VGqCmgo9icSA51N+jaL4iXY38kkvMwybjV+HZsyHqLRyLaAohxVniBxZ52bauNVtrplnVnBhTZG
	pn7hfSUDzvhReCxAe95O7DsE6UHjmtFKrO2KW7sWdXwNwTk/6/OgHUsGag+R43/aHDRzeeWp9N8
	ZQTEEa2C
X-Received: by 2002:a05:7022:422:b0:127:148b:3fcc with SMTP id
 a92af1059eb24-128f3d17c60mr947470c88.8.1773388520009; Fri, 13 Mar 2026
 00:55:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312150437.1091195-1-eagle.alexander923@gmail.com>
 <20260312150437.1091195-3-eagle.alexander923@gmail.com> <CAPY8ntAf9TjgW-E6WeJuMdsHy8pV8-CvqQJriWEFpgLB-brD5A@mail.gmail.com>
In-Reply-To: <CAPY8ntAf9TjgW-E6WeJuMdsHy8pV8-CvqQJriWEFpgLB-brD5A@mail.gmail.com>
From: Alexander Shiyan <eagle.alexander923@gmail.com>
Date: Fri, 13 Mar 2026 10:55:08 +0300
X-Gm-Features: AaiRm50DFZVAF7Y4ebuvjXhciEY_atKHdYiC5gfss19Mb3jrOyS14fO7lIanhL0
Message-ID: <CAP1tNvRMoHteLcjjGbEFcp_8JRALC7mQM6efHyTrgvrZFfiByA@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: i2c: Add driver for Sony IMX662 sensor
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Tetsuya Nomura <tetsuya.nomura@soho-enterprise.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55596-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eaglealexander923@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 835E727F41A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello, Dave.

> > This patch adds a V4L2 subdevice driver for the Sony IMX662 CMOS image
> > sensor. The sensor has a native resolution of 1936x1100 (effective
> > 1920x1080) and can achieve up to 90 frames per second depending on
> > the configuration. The driver supports:
> > - MIPI CSI-2 with 2 or 4 data lanes.
> > - RAW10 and RAW12 formats (both colour and monochrome).
> > - Controls: exposure, analogue gain, horizontal/vertical blanking,
> >   horizontal/vertical flip, brightness.
> > - A placeholder V4L2_CID_HDR_SENSOR_MODE control for future Clear HDR
> >   support (the actual HDR modes are not yet implemented).
> > - Runtime PM.
> > - Cropping via the selection API.
> > - Multiple link frequencies selectable via device tree.
> >
> > Tested on ARM64 Rockchip RK3568 platform with a 24 MHz external clock
> > and various link frequencies.
>
> Interesting timing as I've been looking at IMX662 too, but on a Raspberry Pi.
> FWIW my driver is at
> https://github.com/6by9/linux/blob/rpi-6.12.y-imx662/drivers/media/i2c/imx662.c
>
> Comments are based on brief testing and reading of the code. This is
> not a full review.
>
> > Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
...
> > diff --git a/drivers/media/i2c/imx662.c b/drivers/media/i2c/imx662.c
> > new file mode 100644
> > index 000000000000..d7be17b5a47d
> > --- /dev/null
> > +++ b/drivers/media/i2c/imx662.c
...
> > +static int imx662_set_gain(struct imx662 *imx662, u32 value)
> > +{
> > +       int ret = 0;
> > +
> > +       if (imx662->hdr == IMX662_HDR_OFF) {
> > +               bool useHGC = value >= IMX662_ANA_GAIN_HCG_MIN;
> > +
> > +               cci_write(imx662->regmap, IMX662_REGHOLD, 1, &ret);
> > +               cci_write(imx662->regmap, IMX662_GAIN, value, &ret);
> > +               cci_write(imx662->regmap, IMX662_FDG_SEL0,
> > +                         useHGC ? IMX662_FDG_SEL0_HCG : IMX662_FDG_SEL0_LCG,
> > +                         &ret);
>
> IIRC HCG adds in another 12dB or something of gain. Automatically
> enabling it above a value of 0x22 means that the gain response isn't
> consistent with a band of gains that can't be achieved.
> Running libcamera with this driver I get significant oscillation as
> HCG gets turned on and off. Fix useHGC = 0 and the exposure and gain
> control is stable.
> AIUI Use of HCG should be a separate control if it is to be used.

Thanks for the feedback.

I haven't found any mention of a 12 dB value or any other specific gain value
when enabling LCG/HCG in the datasheet or application notes. I agree it would
be more correct to use a separate user control here, as is done in the
driver that
Tetsuya Nomura referred to in his email. (It's strange that his email
didn't make it
to the mailing list.)

...
> > +static void imx662_set_link_limits(struct imx662 *imx662)
> > +{
> > +       u64 pixel_rate;
> > +
> > +       pixel_rate = imx662_link_freqs[imx662->link_freq_index] * 2;
> > +       pixel_rate *= imx662->num_data_lanes;
> > +       do_div(pixel_rate, imx662->format->bpp);
> > +
> > +       __v4l2_ctrl_s_ctrl_int64(imx662->pixel_rate, pixel_rate);
>
> Are you sure on this? All my testing had pixel rate being independent
> of bit depth and number of lanes.
> Trying your driver with 360Hz link freq / 720Mbit/s data rate on 2
> lanes. All the computations end up with a max frame rate of 60fps in
> 10bit mode and 50fps in 12bit, when I'm expecting a max of 30fps from
> the datasheet.
> Asking for 1920x1080 12bit @ 30fps via libcamera results in hblank of
> 0 and vblank of 1003 with a pixel rate of 120000000. The actual
> framerate achieved is 27.85fps.
>
> I'd found working from a pixel rate of 222750000 (INCK of 74.250*3),
> and writing HMAX with the "normal" line length value of width+hblank
> but divided by 3, all the numbers for line time and frame rate control
> fall out.
> IMX415 was similar, but some input clocks multiplied up to 72MHz
> instead of 74.25MHz and produced a set of different link frequencies,
> so complicated matters.

I'm not entirely sure I understand the suggestion.
Of course, having some fixed value would greatly simplify the driver,
but it's still unclear to me where these calculations come from, and where
does the divisor of 3 come from?
Nevertheless, looking at the mode table, it becomes clear that the resulting
frame rate does not depend on the CSI-2 format (10 or 12 bits),
so apparently something needs to be changed...

> > +       case V4L2_CID_BRIGHTNESS:
> > +               cci_write(imx662->regmap, IMX662_BLKLEVEL, ctrl->val, &ret);
>
> Setting the black level based on the brightness control isn't one I've
> seen done on any other image sensor. It has similarities, but feels
> very wrong.

As far as I understand, V4L2_CID_BRIGHTNESS is exactly the control
that sets an offset added to the signal. This matches the intended use for
black level adjustment. According to the V4L2 specification,
V4L2_CID_BLACK_LEVEL is deprecated because its functionality is covered
by V4L2_CID_BRIGHTNESS (offset) and gain controls.
So I believe this is the correct mapping. Am I wrong?

> > +static int imx662_enum_mbus_code(struct v4l2_subdev *sd,
> > +                                struct v4l2_subdev_state *sd_state,
> > +                                struct v4l2_subdev_mbus_code_enum *code)
> > +{
> > +       struct imx662 *imx662 = to_imx662(sd);
> > +       const struct imx662_format *fmt;
> > +       u16 hmax_min;
> > +
> > +       if (code->index >= ARRAY_SIZE(imx662_formats))
> > +               return -EINVAL;
> > +
> > +       fmt = &imx662_formats[code->index];
> > +       if (imx662->num_data_lanes == 2)
> > +               hmax_min = fmt->hmax_lane2[imx662->link_freq_index];
> > +       else
> > +               hmax_min = fmt->hmax_lane4[imx662->link_freq_index];
> > +       if (!hmax_min)
> > +               return -EINVAL;
>
> This doesn't work.
> I happened to test with a link frequency of 1188 first on 2 lanes.
> That is valid for 12bit but not 10bit.
> v4l2-ctl --list-subdev-mbus-codes will start at index 0 which fails,
> and therefore it never tries index 1 which would work.
> The supported formats need to be contiguous starting at index 0.

Nice catch! You're absolutely right.

...
> > +{
> > +       struct imx662 *imx662 = to_imx662(sd);
> > +
> > +       config->type = V4L2_MBUS_CSI2_DPHY;
> > +       config->bus.mipi_csi2.flags = V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK;
>
> Is it dropping to LP whilst streaming? I can't find any reference to
> the clock lane behaviour in the datasheet, but I also haven't found an
> oscilloscope to check for myself.

I think you're right.
I already mentioned in another thread that I'm using a non-standard ISP driver,
so the get_mbus_config() call is necessary for me. Perhaps after switching to
the mainline driver (which is already in the kernel) this will be removed.

...
> > +       imx662->reset = devm_gpiod_get_optional(imx662->dev, "reset",
> > +                                               GPIOD_OUT_LOW);
>
> This is inverted. If the line is reset, then you would set it with
> GPIOD_OUT_HIGH to keep the sensor in reset initially.
> https://github.com/torvalds/linux/commit/9d108d226224b91ad11e7cfcf846c2a1721b466d

Thanks, fixed!
...
> > +       usleep_range(1, 2);
> > +       gpiod_set_value_cansleep(imx662->reset, 1);
> > +       usleep_range(30000, 31000);
>
> Timings and delays here don't appear to follow the datasheet power on sequence.
> - Power rails on
> - Tlow of 500ns
> - XCLR high
> - T3 of 1us
> - Enable INCK
> - T4 of 20us before I2C comms starts.
> You've enabled the clock before asserting reset.

Fixed.

...
> > +       imx662->sd.internal_ops = &imx662_internal_ops;
> > +       imx662->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> > +                           V4L2_SUBDEV_FL_HAS_EVENTS;
>
> If you've only added this for reporting control changes, then the
> framework does that automatically these days.
> Likewise the subscribe_event and unsubscribe_event hooks can go.

Fixed.

...
> > +static const struct of_device_id imx662_of_match[] __maybe_unused = {
> > +       {
> > +               .compatible = "sony,imx662",
>
> If you follow the pattern from imx296 where there are mono and colour
> variants, it takes the full sensor part number.
> The colour sensor is imx662aaqr.
> The mono sensor is imx662aamr.

Fixed.

