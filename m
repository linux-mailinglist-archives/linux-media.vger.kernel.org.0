Return-Path: <linux-media+bounces-17443-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 366EE9695C8
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 09:38:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9590A281265
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 07:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CC5B1DAC41;
	Tue,  3 Sep 2024 07:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HmmwQqJF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115E81C62B1;
	Tue,  3 Sep 2024 07:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725349102; cv=none; b=d0IrCl9Y94L8zFKEWrR9vQ6Bdo+IAr+M6Gdr1Yd1Ny6NrIjEiCqvXUnFfCsZtk5pTpPIqO92zD4AIprkrWG/cdO/VLmx9mcPpxXtE5Ym3Z5wNIHeixghn2yVx2ir83AOZmDL4SD6UgcD5kNYw3Rb8w/rrf0g7RYdoV7BRpn2pfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725349102; c=relaxed/simple;
	bh=m0855gQAJ8skHBtPFgRaM4q1dywuClcguC5OqagVUQk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lXLDL3JXtieD5wy9ByJ7nyyJaDE77X2aTzjHnKcBFPo6mEtxYqz2FMZ0pfZcpWmeVEktZ4uoW/EDghhrupjgAXPax1061UHCMCSgKIMXDDOtPJCWYZ4dqKJbN1FITanbRcYE+1kpkvY+4e/Bgh8v1AKiykgeToTX8KDQU7TTtCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HmmwQqJF; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5c25554ec1eso1944159a12.1;
        Tue, 03 Sep 2024 00:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725349099; x=1725953899; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vyoa5eKs/l33ZfvyCVg2WooqqObovTKmxe6HULVMNLc=;
        b=HmmwQqJFGvMBvGAs94vvuwVlk8jeoxSnQBhicT+TZF6fjp/FOi0/emRpRPXh+zuj56
         9PeR0KjSik+CZ4vbTuPG/tHm3SLZQUaLTC4y8PDOIHvjRQaUxDvGRur3GA+ZBzTCQ8O0
         qsqGG1hi0R1RDuVsl18gD5y2WzB04vvjI6m7V5oYps3rl30prwFE4GbUe/qoUHAHM+yb
         pfjWyd5rbrhRE9BdLXAhldY/Kzhz+mi61yNspOmdDtECxBFjNgTqzHZ/AIPa+UDbRveY
         ypLbW53GWV37it1sgHhnyXGHW2k+jj7U82uCkXarxZjk/1k601z0issmUYT9Q/UGj/cM
         Y9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725349099; x=1725953899;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vyoa5eKs/l33ZfvyCVg2WooqqObovTKmxe6HULVMNLc=;
        b=fP42NyuGNkuq7AmJuwsdZG6fn70kUhLnvSTGc+9T7Tqn0xla9OqIoLT1vGFbmWmdsQ
         9k5/teUhA8ZfP633HYR7dO6pDtPZrudu8rkYaLDkb4wlSRhQWhtkBXFPJmX7SQbqOycg
         z8mQgFep+Arjrpk5z4Jz2FjbScPZy80lf7RY86DDfE2YlhIJXsx/FM0W+xjbrcKMzFvA
         zYFKJoiUmg+CmVhOQR2phzoFYlN4pROt0vFy121Ej8ampvDOWg1BcYk1rHfxqq3csyZG
         HwhtMHntftBfPpK0pT2lli4JAvH15VTeIexf04EkHYxVJcYcVeHOj10ij8VlhSztqEuN
         eroA==
X-Forwarded-Encrypted: i=1; AJvYcCU9Fwo257TYGRXG/A28dgKL77KBgUGIdrLi1zUmgr3r3FrP1FDvdzXhaJcgXuc5gtfocP8+AFFu/GS/eds=@vger.kernel.org, AJvYcCWaD0wo5+NgtfkIMaWTxKVBo9MSR6jPNmogAbo4i2+EYEcr+svkRyLwICWZIPBErA82V3ulTFP4SqXQ2u0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAK96QRxNhKk57HBjFmbG7kVzOzAvykM0ME1rywZrER5lhl688
	5g/XUZi7a+vT3b4uVuH/ca79MSs/otgShgLlv46IllZT2pPOCnNl7AzBVnVc2aCKsZyfaw9zh68
	Ma2CTAjiv4PTjHLPlbOdIPnAftBA=
X-Google-Smtp-Source: AGHT+IGBkSCVMR1zWJi0QifOpeF1k/8BXecsGw6tPyCr82AbY1cp+LlitXMeigzK65wMhuiCH2jRjLWoAhBNcHkWyqg=
X-Received: by 2002:a05:6402:4404:b0:5c2:467a:185b with SMTP id
 4fb4d7f45d1cf-5c2467a1c60mr5970212a12.9.1725349098989; Tue, 03 Sep 2024
 00:38:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902-imx290-avail-v3-0-b32a12799fed@skidata.com>
 <20240902-imx290-avail-v3-2-b32a12799fed@skidata.com> <CAPY8ntCj=u4ZQJwjhvZF30x08Cf0h7R5yQTim7QCKd8bi_M08w@mail.gmail.com>
In-Reply-To: <CAPY8ntCj=u4ZQJwjhvZF30x08Cf0h7R5yQTim7QCKd8bi_M08w@mail.gmail.com>
From: Benjamin Bara <bbara93@gmail.com>
Date: Tue, 3 Sep 2024 09:38:08 +0200
Message-ID: <CAJpcXm6GB27o6OZ2igUkg1oiwGqBFj9EGAmLfshJycWZKAaEDw@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] media: i2c: imx290: Define absolute control ranges
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Benjamin Bara <benjamin.bara@skidata.com>
Content-Type: text/plain; charset="UTF-8"

Hi Dave!

On Mon, 2 Sept 2024 at 20:00, Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
> On Mon, 2 Sept 2024 at 16:58, <bbara93@gmail.com> wrote:
> >
> > From: Benjamin Bara <benjamin.bara@skidata.com>
> >
> > For now, the driver activates the first mode (1080p) as current active
> > mode in probe(). This e.g. means that one cannot set VBLANK below 45
> > (vmax_min - height), although theoretically the minimum is 30 (720p
> > mode). Define the absolute possible/supported ranges to have them
> > available later.
>
> Currently the driver will set the ranges for VBLANK and HBLANK
> whenever the mode changes.
>
> How is it helpful to fake these numbers? Seeing as they aren't
> reflecting anything useful, they may as well all be 0.
>
> > Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
> > ---
> > Changes since v2:
> > - new
> > ---
> >  drivers/media/i2c/imx290.c | 36 ++++++++++++++++++++++++++++++++----
> >  1 file changed, 32 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > index 1c97f9650eb4..466492bab600 100644
> > --- a/drivers/media/i2c/imx290.c
> > +++ b/drivers/media/i2c/imx290.c
> > @@ -499,6 +499,10 @@ static const struct imx290_clk_cfg imx290_720p_clock_config[] = {
> >  };
> >
> >  /* Mode configs */
> > +#define WIDTH_720P     1280
> > +#define HEIGHT_720P    720
> > +#define MINIMUM_WIDTH  WIDTH_720P
> > +#define MINIMUM_HEIGHT HEIGHT_720P
> >  static const struct imx290_mode imx290_modes_2lanes[] = {
> >         {
> >                 .width = 1920,
> > @@ -512,8 +516,8 @@ static const struct imx290_mode imx290_modes_2lanes[] = {
> >                 .clk_cfg = imx290_1080p_clock_config,
> >         },
> >         {
> > -               .width = 1280,
> > -               .height = 720,
> > +               .width = WIDTH_720P,
> > +               .height = HEIGHT_720P,
> >                 .hmax_min = 3300,
> >                 .vmax_min = 750,
> >                 .link_freq_index = FREQ_INDEX_720P,
> > @@ -537,8 +541,8 @@ static const struct imx290_mode imx290_modes_4lanes[] = {
> >                 .clk_cfg = imx290_1080p_clock_config,
> >         },
> >         {
> > -               .width = 1280,
> > -               .height = 720,
> > +               .width = WIDTH_720P,
> > +               .height = HEIGHT_720P,
> >                 .hmax_min = 3300,
> >                 .vmax_min = 750,
> >                 .link_freq_index = FREQ_INDEX_720P,
> > @@ -846,6 +850,30 @@ static const char * const imx290_test_pattern_menu[] = {
> >         "000/555h Toggle Pattern",
> >  };
> >
> > +/* absolute supported control ranges */
> > +#define HBLANK_MAX     (IMX290_HMAX_MAX - MINIMUM_WIDTH)
> > +#define VBLANK_MAX     (IMX290_VMAX_MAX - MINIMUM_HEIGHT)
> > +static unsigned int imx290_get_blank_min(const struct imx290 *imx290, bool v)
> > +{
>
> This function is never used in this patch. I'm surprised the compiler
> doesn't throw an error on a static function not being used.
> You first use it in patch 4 "Introduce initial "off" mode & link freq"

I think I couldn't really transport my intention behind this function
and going to try to explain my thought process a little bit:

My basic understanding of sensors and blanking times is that the sensors
cannot "just forward image data" but also need some time for internal
stuff. My expectation would be that this time should be the same for two
different modes (720p and 1080p) of the same type ("all pixel readout").
I would even expect that in this type of mode, most of the "internal
time" is used for transferring data, therefore I would also expect that
the minimum blanking times for 720p to be lower (or at least equal) than
1080p. This would make my intention quite easy: Just activate the lowest
resolution during probe, because it has the widest allowed blanking time
ranges, and then we can "freely configure", independent of the mode
later used.

However, this is not the case here: The minimum VBLANK of the 1080p mode
is lower than the minimum VBLANK of the 720p mode. Together with
HBLANK_min_720p < HBLANK_min_1080p, we need a "virtual, invalid" mode to
support both minimas.

What would make things simpler here would be allowing us to control the
total times instead of the blanking times. In this case, we can directly
use the minimum defined {H,V}MAX of the mode and default to the mode
with the lowest possible resolution instead. This would enable a freely
configurable frame duration with full supported ranges and valid modes.

Kind regards
Benjamin

> > +       const struct imx290_mode *modes = imx290_modes_ptr(imx290);
> > +       unsigned int min = UINT_MAX;
> > +       int i;
> > +
> > +       for (i = 0; i < imx290_modes_num(imx290); i++) {
> > +               unsigned int tmp;
> > +
> > +               if (v)
> > +                       tmp = modes[i].hmax_min - modes[i].width;
>
> if (v)
>    return h
>
> With the complete series my sensor comes up with controls defined as
> vertical_blanking 0x009e0901 (int)    : min=280 max=261423 step=1
> default=280 value=280
> horizontal_blanking 0x009e0902 (int)    : min=30 max=64255 step=1
> default=30 value=30
>
> Set the mode to 1080p and I get
> vertical_blanking 0x009e0901 (int)    : min=45 max=261063 step=1
> default=45 value=1169
> horizontal_blanking 0x009e0902 (int)    : min=280 max=63615 step=1
> default=280 value=280
>
>   Dave
>
> > +               else
> > +                       tmp = modes[i].vmax_min - modes[i].height;
> > +
> > +               if (tmp < min)
> > +                       min = tmp;
> > +       }
> > +
> > +       return min;
> > +}
> > +
> >  static void imx290_ctrl_update(struct imx290 *imx290,
> >                                const struct imx290_mode *mode)
> >  {
> >
> > --
> > 2.46.0
> >
> >

