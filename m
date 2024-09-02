Return-Path: <linux-media+bounces-17389-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3B2968E84
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 21:44:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9BFAFB21F8B
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 19:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81C401C62B5;
	Mon,  2 Sep 2024 19:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XPuH37Eh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353C31A3A8D;
	Mon,  2 Sep 2024 19:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725306232; cv=none; b=U+Nfh9FNO3AbsXBajxdKDZYzE5rYt3TmP65Llh046sTyyEsOLGtIiq3TbjsCDL0zm9F/40a6m0H5+ZdspWcyjbEad2q9+I0GWiKZ6ULFcAUx2t8aesshha+klmWXtXDzYbKpMfR4YXYwgeaHR+mCy60p4qa+ddZmkDGflJOWzMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725306232; c=relaxed/simple;
	bh=WmaQEMd3JE9ZTkRCyNerdZexPn2Yb8jAQcwyAeVm24g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=koFckrijXMk58RCdg65FAqOpHtnEIHfz1J9W0aQ1vnKhvQZdZKNRgQxWTRQU/P6Om9hfvSZ0mozSafVyVzwArObfq9Rm8jVeNeFY8DC7jKv+iQM0TBhUtSgMtA+D1A8Mm7RordbZ3JYfN6fnsCeBLkvJiweS5agIis+Bxu8/iOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XPuH37Eh; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5c25dd38824so506445a12.0;
        Mon, 02 Sep 2024 12:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725306229; x=1725911029; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PAcVm81xwjNlpuXjiQxC/gQknWTt88XBwjwjsmfyxGE=;
        b=XPuH37EhbkQ6Z0ZEQnaVxg299omvVeUla0R3iy4z8T+3Tzg5zz+teiUxd7ReBzUkre
         hnh2u22Ibcf9wY3DXifgs3VnmEXi/c/bOtlZ6kI8GEYa8mUSLwbFpHppQB6ewsPKVHj9
         P8zXSHLtSP/1oJKnRh/PVoX+eRWHa/1EjyOagB0MHmszcxesOYXrN9SVAAxbi06jcWw4
         4aDpaYIRpetXTelVm1Rf88RxWwblsi9LFZz/t06pmul4ROLWqrH+13LpgrnAPpyWOpmK
         9MXQVLah3+6O5JRngEh1Nw0gPlyJbbD6nF0Hklo+4LEs4z9qHcfZwzTlHDRFv7bx6Dx/
         pnRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725306229; x=1725911029;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PAcVm81xwjNlpuXjiQxC/gQknWTt88XBwjwjsmfyxGE=;
        b=Gru7eStqINH2Fl5X1K9WlgXgiBpa/Vqww07xzgSNc944VMPDuqwOAF1mZxdBWetNZj
         f3HBocLg9ykvAoS/+1lwIsBY1FdmbjyXp6faibH/PMNoh1NbgQ2DV6B07UHwUPMSgVGV
         8XtFxGxRDkBnkflJbvkcoPouT1LCLle18UzSIiCfaytlDSXUEGHDxK97ws6PQFM53Dsn
         DszgArNUgHcAlc3QdwFWKPWuXUOZsBre0TkxMXuhdSnWdayPNEWdXanU98lHAReGg6+u
         AQD08vwjn12zWHXpHMVKAeeZXycYgduCO9IEw1NqegHW9ZrIAWMuIpcBjNyfc2Hz77m3
         j+6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUnA/zDFfZuv5tHYjIuyA6it/WLhK9CFvm2n70wU9JU8pXneFkgm/rd50o7NFo4OBn/ND3nUMLrHz5Q43E=@vger.kernel.org, AJvYcCX+wpA7rwbwksDki2NGDPfB89FWPZjeUZt0ffDJ5Xj+LiDp7mFyfGH7Ygrk8NBDf5BqS8yp4F4SEEXvyyc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl6AIe3QKjlbQsCZIMPDODSRTpAGUf3lYdueXqISqTqJPwT7Ua
	wtN90zVg5Qo4Lg5gYF22MtHoKmL4jI7UOnew4YcSsExVsfC74F6plTD8V7JczAbMntSXx+TOat+
	sEe3rIvg3aJQAyLOFtMeDJo5jsP4=
X-Google-Smtp-Source: AGHT+IEaHkDNCvjAQuSZ8l8bPEDxb20m9nLYGFlUiHesvjoFSC2+ib5Sn1iQENQ9fWh8ry89wR1LdxyQj2UMjkSyOuI=
X-Received: by 2002:a05:6402:35ce:b0:5bf:7dc:bb8d with SMTP id
 4fb4d7f45d1cf-5c22f8a199bmr11796155a12.13.1725306229093; Mon, 02 Sep 2024
 12:43:49 -0700 (PDT)
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
Date: Mon, 2 Sep 2024 21:43:36 +0200
Message-ID: <CAJpcXm5cLjvqkuCB25strgYaUo4p058yLAXg8+LZ_7T12+3-ug@mail.gmail.com>
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
>
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

The idea here is to have VBLANK=30 available in the initial "after
probe" state of the sensor. VBLANK=30 is a valid value for 720p mode,
but it cannot be set after probe, because the driver (not the user)
decided that 1080 mode is active. The idea is to relax the ranges while
the mode is not set. Once the mode is known, the values are tightened
to the real mode-dependent values.

Kind regards
Benjamin

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

