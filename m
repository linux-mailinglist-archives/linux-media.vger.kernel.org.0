Return-Path: <linux-media+bounces-17386-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CC335968D3D
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 20:19:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5981B1F23080
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 18:19:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A908B19CC11;
	Mon,  2 Sep 2024 18:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cu2648W/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFF519CC03;
	Mon,  2 Sep 2024 18:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725301142; cv=none; b=qQe6bdyofFF3SbGH5Am/QLly6t2a41riBKTID6mbuID689i043kA/zjWNkLPurfwpw9VW2YbOG5zbVrpk8Su+stzUFDPZlZKwqjNRlPIQ0Bp0HT9o9hX51RmWpsoLF8eEaZq0Mybt5VLSKbi17SmgOAfPMnEzzeI8dPr4QD16+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725301142; c=relaxed/simple;
	bh=D/geGiuZreM50wHNk3+rE6qw/c9jZHG8UlPD/TBrYrU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IZhQNrQMwt0oPxNjC2g8nwRsYQJ86p3boicqzauqmYtsdvBngjPSQDMJt+4jDMZmWNR6sG03WnW2YaRIIQl5K64lYz+lEz93S+G8ITdgy5EycBeilqvftM9GyBM0RvActRY4rMrcexo6sgp/htFTeKVuFnuoqOWal9A5kSsrggY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cu2648W/; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5c0aa376e15so2482925a12.1;
        Mon, 02 Sep 2024 11:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725301138; x=1725905938; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bT5kiWnKqIbTLuP1bx7rfiNJ+AxW9IS6n6BC+9VoOOY=;
        b=cu2648W/SI5e6IfxyoyFjBin8nGzkt9zXlW9mcja3tgYeJhx0CVMTe5spRVRYVOG8j
         rYz8Z4uiGFfhNeHZu7zwJuZveNah2yPSofe0aXyNxlbCj4yaJi4Hv/4Ir1n1xBFXM3tq
         INPqBgMFcJsHIUUKydyAmrakm39DHcIO8AHfjkrogTsVEvqWJvxrWHNqksE+isq4cG2G
         5EVB6kxJo5Sz7JTwPMJ2wHYz4stVBkKCf3Mozau+qvLj6k6kRNEIwe83F5mrYkcFsuEh
         7f1nMBPvtsFKMJEan5I8t0L9Kk45fgjrbeOBQ6wbsCiZ41P48ktDQDRDRcl7q8O3FJjW
         e5rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725301138; x=1725905938;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bT5kiWnKqIbTLuP1bx7rfiNJ+AxW9IS6n6BC+9VoOOY=;
        b=K95Di/yqqWfGcotlerUzZOcXNYM9mYzt7mcJETzYzjBVaS+b2SVczVlzyr3O82cXC5
         QB8Z01LMxtjea7F3GnuvEUXTkZ/65IIofmOaL0nIPD9qV8889GnZ82eALmj9q8wgrX9e
         Ge/YWaDlPm8dXyBgFn3/MTA2/XfWQm/k4Oh39ttr8ths5njOqXHt6nmOCWFK87DnaEWg
         GnejWR4ToZFAhL53GrHx2ztFfKZYwIYeehukVkGYOuaAGwOvgcJ9lnfVQzfpksds+hm8
         pdis3LovUOLeKTc8ILiE89AIHstS5iud/HsxbR2LWledyN2308iXFG9dHvRnwIIOhadK
         Ke7A==
X-Forwarded-Encrypted: i=1; AJvYcCU4OnncZ7cikVn44Ar3GI2tVfptlC05gRPAZv51r3+nq43UJ8b3UFRFBtQUBzvXHv2s/9eMxzNtSTIDknE=@vger.kernel.org, AJvYcCW9lim2oCn0Ft3pD1LfECP3Tck5NTO1+c8WLz5EXDPvL5O7M3Do/d1d5qlHzZRwByT2DjURokIBILnfBjE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAJEkhsYPg17J+YDqkJVGimufUyRYLJ6kBKahyitXEyBkASyfH
	U+DB8ZfGXhhoQ4ZTM8dmhqsAi4i+4CGnvRlOPdz28pr4P3ieH0LwWONQ51kDen4xd9iKrxWAvw/
	KWiV2wKxqoX9y2soD37KbUsMZwQM=
X-Google-Smtp-Source: AGHT+IEGdH8Hj2wazK7AfWtMmT7ZbWzTqy7SKMVAB2/yqtWzcn0JYMegF8Y4nkv5VYbSut5v3zKKTS45cnpzPucZmOc=
X-Received: by 2002:a05:6402:2108:b0:5be:eb4f:d4cb with SMTP id
 4fb4d7f45d1cf-5c21ed31405mr15587124a12.5.1725301137313; Mon, 02 Sep 2024
 11:18:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902-imx290-avail-v3-0-b32a12799fed@skidata.com> <CAPY8ntD4tbSF41+ShJ0WdP5=N3uJi2tWDEyr-ypcKha40T+Q=Q@mail.gmail.com>
In-Reply-To: <CAPY8ntD4tbSF41+ShJ0WdP5=N3uJi2tWDEyr-ypcKha40T+Q=Q@mail.gmail.com>
From: Benjamin Bara <bbara93@gmail.com>
Date: Mon, 2 Sep 2024 20:18:45 +0200
Message-ID: <CAJpcXm6YxT69nYy+j8zkswsmaV_93S+dyXFjaJet7Jfm-cHv7A@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] media: i2c: imx290: check for availability in probe()
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Benjamin Bara <benjamin.bara@skidata.com>
Content-Type: text/plain; charset="UTF-8"

Hi Dave!

Thank you for your feedback!

On Mon, 2 Sept 2024 at 19:55, Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
> On Mon, 2 Sept 2024 at 16:57, <bbara93@gmail.com> wrote:
> > This series introduces i2c communication with the imx290 sensor during
> > probe s.t. the v4l2 subdev is not initialized when the chip is not
> > reachable.
> >
> > The datasheets show that INCKSEL* registers have a different default
> > value after reset on imx290[1] and imx327[2], however I am not sure if
> > this is a sufficient identification option - therefore I just removed
> > the current CHIP_ID register for now.
> >
> > Thank you all for the feedback and the discussion, I updated the series
> > to contain some of the ideas that came up.
> >
> > For now, I kept reading back the content of the STANDBY register, as
> > suggested by Sakari and Alexander. If not wanted (as suggested by
> > Laurent), I can re-add my "optional read" commit from the first version
> > of this series instead.
> >
> > *Overview:*
> > Patch 1/7 is a split from the old 1/2 which defines the values of the
> > STANDBY register and uses them.
> > Patch 2/7 is new and defines the whole supported range of the controls.
> > Patch 3/7 is the old 2/2 to drop the CHIP_ID register.
> > Patch 4+5/7 are new and target the avoidable communication during
> > probe(). I decided to use a variant that also works on machines without
> > runtime PM active, and falls back to the values of 2/7 instead.
>
> I was reading through patches 2, 4, 5, and 7 and really not seeing
> what you're trying to avoid here. Adding an option to avoid powering
> up the sensor is one thing, but we've got masses of other changes to
> fake HBLANK, VBLANK, and LINK_FREQ values, even though we appear to
> still have a pad format defined as 1920x1080 1x10 set on the pad. All
> those controls are therefore declaring invalid ranges at that point.

I guess I missed the pad format. My idea with 2+4 was to have "more free
control ranges" while we don't have a mode set yet - but it is probably
not a really good idea. Patch 5, as you said, can also be replaced with
a bool. As Laurent brought up the point with the privacy LED, patch 7 is
just an example how we can avoid powering the sensor up during probe
time.

> If it's solely trying to stop imx290_set_ctrl sending register writes
> when not streaming, isn't it simpler to have a basic bool in the state
> structure to denote whether we've passed through
 imx290_set_stream(subdev, 1)? Set it in the same place as
> pm_runtime_resume_and_get is called as it's mimicking exactly the same
> behaviour.
>
> > Additionally, imx290_runtime_suspend() is using v4l_subdev, and
> > therefore depends on the subdevice. If we move the autosuspend stuff
> > before the subdevice creation, we basically have a race between the
> > delay and the subdevice creation. Although it is not very close, I don't
> > think it is a good idea to potentially autosuspend before the subdev is
> > created.
> > Patch 6/7 is the old 1/2.
> > Patch 7/7 is a new PoC to decide to check the availability based on the
> > power state of the sensor during probe().
> >
> > Note: dummy-regulators, which are used when no supplies are set in the
> > DT, are always-on.
> > Note2: The "off" mode is currently only active after probe(). If this
> > approach is of interest, I would also ensure that it is active once
> > streaming has stopped - need to dig deeper if it is necessary to store
> > the "old current" before stopping, therefore only "initial" for now.
>
> What extra data do you see sent after stopping? On any system with
> runtime PM, imx290_set_ctrl will stop at the "if
> (!pm_runtime_get_if_in_use(imx290->dev))" check.

This is rather related to patch 2+4. As I already expected that it has
downsides to have an extra (invalid) "off mode", I didn't set it
everytime streaming is stopped. I guess dropping 2+4 and replacing 5
with a bool is probably a better idea to have this.

Thanks
Benjamin

>
>   Dave
>
> > thanks & regards
> > Benjamin
> >
> > [1] https://static6.arrow.com/aropdfconversion/c0c7efde6571c768020a72f59b226308b9669e45/sony_imx290lqr-c_datasheet.pdf
> > [2] https://e2e.ti.com/cfs-file/__key/communityserver-discussions-components-files/138/IMX327LQR_2D00_C_5F00_TechnicalDatasheet_5F00_E_5F00_Rev0.2.pdf
> >
> > ---
> > Changes in v3:
> > - probably better readable in the overview
> > - 1/2 -> 1+6/7
> > - 2/2 -> 3/7 (added R-b - thx for that)
> > - others are new based on the discussions/suggestions
> > - Link to v2: https://lore.kernel.org/r/20240828-imx290-avail-v2-0-bd320ac8e8fa@skidata.com
> >
> > Changes in v2:
> > - dropped 1/2 to ignore the read value in cci_read() (old 2/2 -> new 1/2)
> > - 1/2: read-back standby mode instead and ensure that it is really in standby
> > - new 2/2: drop chip_id register definition which seems to be incorrect
> > - Link to v1: https://lore.kernel.org/r/20240807-imx290-avail-v1-0-666c130c7601@skidata.com
> >
> > ---
> > Benjamin Bara (7):
> >       media: i2c: imx290: Define standby mode values
> >       media: i2c: imx290: Define absolute control ranges
> >       media: i2c: imx290: Remove CHIP_ID reg definition
> >       media: i2c: imx290: Introduce initial "off" mode & link freq
> >       media: i2c: imx290: Avoid communication during probe()
> >       media: i2c: imx290: Check for availability in probe()
> >       media: i2c: imx290: Implement a "privacy mode" for probe()
> >
> >  drivers/media/i2c/imx290.c | 153 ++++++++++++++++++++++++++++++++++++---------
> >  1 file changed, 124 insertions(+), 29 deletions(-)
> > ---
> > base-commit: eec5d86d5bac6b3e972eb9c1898af3c08303c52d
> > change-id: 20240807-imx290-avail-85795c27d988
> >
> > Best regards,
> > --
> > Benjamin Bara <benjamin.bara@skidata.com>
> >
> >

