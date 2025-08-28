Return-Path: <linux-media+bounces-41242-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5ECB399C7
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 12:27:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C9BB7C30C3
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 10:27:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3035D3115B5;
	Thu, 28 Aug 2025 10:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h5eVtvSr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDCF30BF7E;
	Thu, 28 Aug 2025 10:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756376600; cv=none; b=WSHy2DzMgBKtbnD6EllPmhLCUXrVKmQDDartoKsczKLkNc4HT6QbpNRshMNh24jyufxne7q8CHAk8LOKpZDHWELpSg6jcLLKl9SeQr0Oz/GUKlk4/+k/hjgTZcbrKrTdGi8F3o76PApoHryLQihzIifLgPBPBR3SY+BUVlI0MzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756376600; c=relaxed/simple;
	bh=LPWSWIXlLuMB2c9Lle24BbirXI6SQ1/LxkXgluudhmg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LKsNEEnxGcGaEQ/CJnfqRY/XDIVjnhYqhNuVSyIXMklWMvcWTAGvV4FgGxiDzTHwHhp27zb0vT1kLO/Q4qxyhYIMfXgSRDnJM27J6/66ODBVFPiAiuYL9d95USLS1Xq7Fb4H2TCiRfEnyemcg5DldnzKSgtNfrLoqOmPO19dMus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h5eVtvSr; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3c98b309804so491497f8f.1;
        Thu, 28 Aug 2025 03:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756376597; x=1756981397; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vGYnQxoVRT6FoRMhhpzyK8mY4CvkA0DsYv69RLHz9Bk=;
        b=h5eVtvSr9URTBiFlPWfIDLQf6bqUuASmQu+1BJxu7U25UMrTF97SitYL2yCFmmdqDN
         pGsxXB1V/AT+Asl3yAynbG/tgELIs4eFuMnKSEBCCkh2pqxZ8DDv/SIl2SJat/oEyFPk
         W2o5CCwf+i6oELzYK7lLg652stJs+G8bH+SpGq8RJjOHescCeBxcOMd1nVepP69NPEuV
         oU2ooStOEWi+/8IqMqoCoPLs6kUD1/htVvQUNQ/PjJSSafLshXh+MkbqNoqVgywJ7CqV
         VFSoYwqqYMM427GqFuwzjHtnRb0FI8SPX30tRmGwJCzxu7wpc4nm4egbf+yBhg6o3Tut
         iftA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756376597; x=1756981397;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vGYnQxoVRT6FoRMhhpzyK8mY4CvkA0DsYv69RLHz9Bk=;
        b=Ze3GAIbtPCiyr2bZ9XOj5pEW3KeqP8wWy1O/dxNu7ktpPgxn06eoRSuqDlZ5whFW1p
         YH7bnIWQMMrmP2E0VkdWbgicaZORkgDTBysefyvGSif0dsMrPkm+64BhcZoy28veANPH
         vcqo2lSxQAnF0Nk7Y8nlcGkggKsxXfhD7lUbYYPlzPG6r5Qzv8PR5jpSDYu1w+AKvfSN
         uChK7XZ232rO8Hk42RlTOhekwkgwkcoBl3kknHZG9+Yr7e6yDQS6Sx3AIbcd/INU5TYa
         faNl+XvvcLLkXR5YYW3dIiE+G9bLFa2g9H7c31sAV4i/10FsH3uABmk+a9r6WbsPb9cg
         TeGg==
X-Forwarded-Encrypted: i=1; AJvYcCUUsTBs5JCySjxDwm3d+j0+bI30vVjxTwS/86pi3/bFfwvU1Oc5/W3SBhCLG/5ChIl4KmEdFHCAW+wiayFR@vger.kernel.org, AJvYcCUhlvQ4a/uc/RVtlDGmq5wBELxPvySOFYAblbbMTyOtBJAzhWyyvWE3MfrGLokfXerkeftIVBMgbqa6@vger.kernel.org, AJvYcCUzUwcb1sNyrN08LryjLady0EBa/ahJta72t7KTyB5iceqxNbZcG7ja3m02oKMEV81d0/X6aV3wpxf8@vger.kernel.org, AJvYcCVsE0fCn1HXyaM1D6W0O5rlArPYA6m5VW/NG6v0X04KspyjmuxQ4qTtCwKQ5WtVBB8EmzZR0IhQfZCOrMI=@vger.kernel.org, AJvYcCXpDlMHaEzgcc4yOf2lh5Pm3PRVMVe31RU+YFyuiwTBeCOhjPC8aUgk6zXhUC+grZ6Dit+6Cs9XWCbpN6k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxugeqyH8FNjscYwvmiiwXOaX8EdbVoWvp6CDXbMVgwRSkTVB+
	3pSy26Vc7nhMK63Cd8ApruFGzA9ScUUJ0uEjWHxyfoa/fKdqjC9rk7snF1kBYNE/UrH6z4YT0yn
	Cg1iL1GSnPHrgB5AIpDcyTtRNMvZLqwE=
X-Gm-Gg: ASbGncu65xhFA4OOvNR5DJ9hKvCXBgcANjG+4LyzTVSlO/a/0xtkVI2ksD6GD6Nyl1D
	J1kFy4lvOVxroa4CCv3tOxtsRLIgitzFSPyUGmxzKICNZ2q8ozc31yKCvNfWrXgRHxhIh/ZPn75
	eeBTkBmFbpochhDLreAXNSG/ov0rn/30xPoZz34eWsjKNA5QokIhey7dvAGyM8AK+vfGrSkrxWC
	ORexjwq
X-Google-Smtp-Source: AGHT+IFJEv9zxqfpx7q5UQXcYfMYfW9nwtmCrUwOTbez89F++l6zSO42XLVHFVGUVX7jveQxdxPjqpHfUNYnLFDLt4k=
X-Received: by 2002:a05:6000:2903:b0:3c0:3fcb:ed77 with SMTP id
 ffacd0b85a97d-3c5dcb11e67mr15482144f8f.47.1756376596525; Thu, 28 Aug 2025
 03:23:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250819121631.84280-1-clamor95@gmail.com> <1797126.QkHrqEjB74@senjougahara>
 <CAPVz0n2JdRXQ7oUJqXkmGO+EPZTq3t6k8HY7pWHT3eAVXj9T3w@mail.gmail.com> <2263218.C4sosBPzcN@senjougahara>
In-Reply-To: <2263218.C4sosBPzcN@senjougahara>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 28 Aug 2025 13:23:04 +0300
X-Gm-Features: Ac12FXy741KXHMVpFaUwCes3wVnK2leeDs9abz6-2fqepf747-p4Rm2m7_S9AUc
Message-ID: <CAPVz0n3AvQaFrpeyUODpqOwkxxinjWgMQTgqvD4hAZvdqprVdA@mail.gmail.com>
Subject: Re: [PATCH v1 01/19] clk: tegra: init CSUS clock for Tegra20 and Tegra30
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>, 
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 28 =D1=81=D0=B5=D1=80=D0=BF. 2025=E2=80=AF=D1=80. =D0=BE 13:1=
5 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thursday, August 28, 2025 5:28=E2=80=AFPM Svyatoslav Ryhel wrote:
> > =D1=87=D1=82, 28 =D1=81=D0=B5=D1=80=D0=BF. 2025=E2=80=AF=D1=80. =D0=BE =
11:13 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > On Wednesday, August 27, 2025 7:45=E2=80=AFPM Svyatoslav Ryhel wrote:
> > > > =D1=81=D1=80, 27 =D1=81=D0=B5=D1=80=D0=BF. 2025=E2=80=AF=D1=80. =D0=
=BE 13:36 Mikko Perttunen <mperttunen@nvidia.com>
> =D0=BF=D0=B8=D1=88=D0=B5:
> > > > > On Wednesday, August 27, 2025 1:32=E2=80=AFPM Svyatoslav wrote:
> > > > > > 27 =D1=81=D0=B5=D1=80=D0=BF=D0=BD=D1=8F 2025=E2=80=AF=D1=80. 07=
:09:45 GMT+03:00, Mikko Perttunen
> > > > >
> > > > > <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > > > > >On Tuesday, August 19, 2025 9:16=E2=80=AFPM Svyatoslav Ryhel w=
rote:
> > > > > > >> CSUS clock is required to be enabled on camera device
> > > > > > >> configuration
> > > > > > >> or
> > > > > > >> else camera module refuses to initiate properly.
> > > > > > >>
> > > > > > >> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > > >> ---
> > > > > > >>
> > > > > > >>  drivers/clk/tegra/clk-tegra20.c | 1 +
> > > > > > >>  drivers/clk/tegra/clk-tegra30.c | 1 +
> > > > > > >>  2 files changed, 2 insertions(+)
> > > > > > >>
> > > > > > >> diff --git a/drivers/clk/tegra/clk-tegra20.c
> > > > > > >> b/drivers/clk/tegra/clk-tegra20.c index
> > > > > > >> 551ef0cf0c9a..42f8150c6110
> > > > > > >> 100644
> > > > > > >> --- a/drivers/clk/tegra/clk-tegra20.c
> > > > > > >> +++ b/drivers/clk/tegra/clk-tegra20.c
> > > > > > >> @@ -1043,6 +1043,7 @@ static struct tegra_clk_init_table
> > > > > > >> init_table[]
> > > > > > >> =3D {
> > > > > > >>
> > > > > > >>    { TEGRA20_CLK_GR3D, TEGRA20_CLK_PLL_C, 300000000, 0 },
> > > > > > >>    { TEGRA20_CLK_VDE, TEGRA20_CLK_PLL_C, 300000000, 0 },
> > > > > > >>    { TEGRA20_CLK_PWM, TEGRA20_CLK_PLL_P, 48000000, 0 },
> > > > > > >>
> > > > > > >> +  { TEGRA20_CLK_CSUS, TEGRA20_CLK_CLK_MAX, 6000000, 1 },
> > > > > > >>
> > > > > > >>    /* must be the last entry */
> > > > > > >>    { TEGRA20_CLK_CLK_MAX, TEGRA20_CLK_CLK_MAX, 0, 0 },
> > > > > > >>
> > > > > > >>  };
> > > > > > >>
> > > > > > >> diff --git a/drivers/clk/tegra/clk-tegra30.c
> > > > > > >> b/drivers/clk/tegra/clk-tegra30.c index
> > > > > > >> 82a8cb9545eb..70e85e2949e0
> > > > > > >> 100644
> > > > > > >> --- a/drivers/clk/tegra/clk-tegra30.c
> > > > > > >> +++ b/drivers/clk/tegra/clk-tegra30.c
> > > > > > >> @@ -1237,6 +1237,7 @@ static struct tegra_clk_init_table
> > > > > > >> init_table[]
> > > > > > >> =3D {
> > > > > > >>
> > > > > > >>    { TEGRA30_CLK_HDA, TEGRA30_CLK_PLL_P, 102000000, 0 },
> > > > > > >>    { TEGRA30_CLK_HDA2CODEC_2X, TEGRA30_CLK_PLL_P, 48000000, =
0 },
> > > > > > >>    { TEGRA30_CLK_PWM, TEGRA30_CLK_PLL_P, 48000000, 0 },
> > > > > > >>
> > > > > > >> +  { TEGRA30_CLK_CSUS, TEGRA30_CLK_CLK_MAX, 6000000, 1 },
> > > > > > >>
> > > > > > >>    /* must be the last entry */
> > > > > > >>    { TEGRA30_CLK_CLK_MAX, TEGRA30_CLK_CLK_MAX, 0, 0 },
> > > > > > >>
> > > > > > >>  };
> > > > > > >
> > > > > > >I looked into what this clock does and it seems to be a gate f=
or
> > > > > > >the
> > > > > > >CSUS
> > > > > > >pin, which provides an output clock for camera sensors (VI MCL=
K).
> > > > > > >Default
> > > > > > >source seems to be PLLC_OUT1. It would be good to note that on=
 the
> > > > > > >commit
> > > > > > >message, as I can't find any documentation about the CSUS cloc=
k
> > > > > > >elsewhere.
> > > > > > >
> > > > > > >What is the 6MHz rate based on?
> > > > > >
> > > > > > 6mhz is the statistic value which I was not able to alter while
> > > > > > testing.
> > > > > > I
> > > > > > have tried 12mhz and 24mhz too but it remained 6mhz, so I left =
it
> > > > > > 6mhz.
> > > > > >
> > > > > > >Since this seems to be a clock consumed by the sensor, it seem=
s to
> > > > > > >me
> > > > > > >that
> > > > > > >rather than making it always on, we could point to it in the
> > > > > > >sensor's
> > > > > > >device tree entry.
> > > > > >
> > > > > > Sensor device tree uses vi_sensor as clocks source and sensor
> > > > > > drivers
> > > > > > don't
> > > > > > support multiple linked clocks.
> > > > >
> > > > > AIUI vi_sensor is an internal clock so the sensor cannot be recei=
ving
> > > > > it
> > > > > directly. Perhaps the sensor is actually connected to csus, and t=
he
> > > > > reason
> > > > > we need to enable it is to allow the vi_sensor clock to pass thro=
ugh
> > > > > the
> > > > > csus gate?
> > > > >
> > > > > That leaves the question of why the csus pad would be muxed to
> > > > > vi_sensor
> > > > > by
> > > > > default, but perhaps there's an explanation for that.
> > > >
> > > > From downstream T30 sources csus and vi_sensor are always called in
> > > > pair (6MHz csus and 24MHz for vi_sensor), naturally I assumed that
> > > > latter is used as camera reference clock since most sensors has
> > > > reference clock around 24 MHz
> > >
> > > It's possible that the csus pad is still outputting 24MHz. The pinmux
> > > options for the csus pad are various clocks, so it would seem logical
> > > that the clock source for the pad is one of those clocks. However, on=
 the
> > > clock framework side, the csus clock is just a gate. What I'm confuse=
d
> > > about is that since on the clock framework side the parent of csus is
> > > currently set to clk_m, I don't know why setting the rate of csus wou=
ld
> > > affect the output of the pad, given clk_m is not one of the options f=
or
> > > the pinmux.
> > >
> > > It's be good to verify the register value for the csus pinmux to see =
where
> > > it thinks the clock is coming from, and then check how that matches w=
ith
> > > what we are seeing.
> >
> > TRM does not provide such data, it has only register address with
> > layout for it as a plain pad control, that register has only DRVDN,
> > DRVUP, SLWR and SLWF and I don't see a way to decode clock value or
> > parent or anything similar. If you give me a method I will calculate
> > those values.
>
> I notice that on Tegra20, there is a mux pingroup called 'csus', which ha=
s the
> mux options PLLC_OUT1, PLLP_OUT2, PLLP_OUT3, and VI_SENSOR_CLK (based on
> upstream pinctrl-tegra20.c). The TRM also says 'Enable clock to SUS pad.'
> about the CSUS (or SUS) clock.
>
> On Tegra30, however, which I guess you refer to, I guess mux pingroups ar=
e
> gone and each pin has its own mux (again looking at upstream pinctrl-
> tegra30.c). vi_mclk_pt1 is now its own mux with the options VI, VI_ALT1,
> VI_ALT2, VI_ALT3. The drive group for this pin is still called csus, so b=
y
> that name it only has the drive settings as you mention.
>
> Are you testing on Tegra20, Tegra30, or both?
>

I am testing on Tegra30 since I did not have compatible Tegra20 device
(with supported camera).

> I've looked at some Tegra30 schematics, and they show a signal called VI_=
MCLK
> being routed to CSI cameras.
>
> >
> > Another theory is that maybe csus is used for VIP cameras only and
> > vi_sensor is used for CSI cameras, but they both have to be on in
> > order to work correctly. Csus was removed from Tegra114 along with
> > VIP, might not be a coincidence. Moreover, T124 uses vi_sensor as
> > camera mclk source.
>
> I see the CSUS clock still on Tegra124 based on the upstream kernel. Ther=
e is
> also a CAM_MCLK pin. It seems Tegra30 has both VI_MCLK and CAM_MCLK pins,
> which both can output the clock. After Tegra30 there is only CAM_MCLK.
>
> Looking at L4T r21, in tegra12_clocks.c, it defines the clocks mclk and m=
clk2.
> There is a comment on mclk saying:
>
>                        .clk_num =3D 92, /* csus */
>
> whereas mclk2 is vim2_clk. These clocks are indeed defined as gates, with
> vi_sensor / vi_sensor2 as parent, set_rate being passed onto the parent.
>
> All of that wasn't very coherently written, but to summarize my thoughts:
>
> On Tegra30, we have
> - Pins vi_mclk and cam_mclk. Both can only source from (vi_)mclk which al=
so
> goes by name csus. The mclk/csus clock is a clock gate with vi_sensor as
> parent.
> On Tegra114 and later,
> - Same situation, but vi_mclk is gone, so instead we have cam_mclk (possi=
bly
> multiple with associated mclkN and vi_sensorN clocks)
> On Tegra20,
> - The vi_mclk pin has a variety of mux options, one of which is VI_SENSOR=
_CLK.
> I expect this to correspond to the same behavior as later chips, i.e. sou=
rces
> from the csus(/mclk) clock, which sources from vi_sensor.
>

While this is all quite interesting, how to configure this properly?

> >
> > Here is a fragment of Tegra124 clock tree (dumped from Mi pad 1)
> >
> >          pll_p                                 on     13  x34      4080=
00000
> > vi_sensor2                       $ off    0   3.0      136000000 mclk2
> >                    $ off    0            136000000 vi_sensor
> >         $ off    0   3.0      136000000 mclk                          $=
 off
> >    0            136000000
> > > > > > >Cheers,
> > > > > > >Mikko
>
>
>
>

