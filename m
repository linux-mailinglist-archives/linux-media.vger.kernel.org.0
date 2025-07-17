Return-Path: <linux-media+bounces-38027-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC409B0902E
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 17:07:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A9B53B65C8
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 15:07:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D25012F85E9;
	Thu, 17 Jul 2025 15:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="qMsyattT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E5E2F6FB4
	for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 15:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752764854; cv=none; b=JA7xOT9yeCgCi20kUGmoMjTJiL/ZDrzqLY/NTzyau77GKhF73Cqe56FNPfRV1amd1rQT/1l8IpDwXhEof+eIcccxB3pbYQ4+0iJp4+V1+TqhhS9SfKUEhnseM0y4l2MHlw7sozEci2KPlt7Qeqh5CT03ALYfqbQTRC6ZxEkd4wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752764854; c=relaxed/simple;
	bh=LUhf8Uhu0Rs1JBy6bIh0q5Di8I4v3nRQ4wNrQ85s5vs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=grn7V+w0+g/pOvFryzZGpZGD6qHDN6nLibvw3p/nhISwlUE84pVzmEYTPSf1EDpk/HgP3fYHY+8pGUkGYcycQ+CBuHhlU72GFR1dJ3Gem+FgjUeHjH1FZyq0lXds8Gq+Ns4TZGGNpUWygbbLh+uc3VefTMwdZ5GTe6ClfNtEdkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=qMsyattT; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-714067ecea3so7976957b3.0
        for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 08:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1752764850; x=1753369650; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IfuACM8L/+ChRENLCJzdMyZSkz2T4dT0+ZCxSVcl3Qw=;
        b=qMsyattToLoM99iRZ6A+LrzvaKDeHIZ1UY7s7pexm52zgJc7Ordm7BhrJQAeF4qZ2D
         tFPr9S2nSyEej6wxJg5wxUUW3y+krU6uGUXONkK9BWh30ydn1KUWsPx49/JdqswCZICb
         lPJKWdtfDfEmOqcClMGC/VX6O3bNlLWbHG5+Q8Xjn2pvOVIwfWG+dJbKxuO3gSTlrFAQ
         A2Fthqqsh6yV/RtSQXE/Ownq3Sr5zXEJ+jyz3//aycBccw169zsxhs41/+vDBmu1g19d
         WHJjf4aMXMWjKLgcngygjFTRrGwGNJRITyuiIpQQvp50s/i997JV8uKTj/8sX1ZPljCG
         K1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752764850; x=1753369650;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IfuACM8L/+ChRENLCJzdMyZSkz2T4dT0+ZCxSVcl3Qw=;
        b=mMhCZtnPAv8u5bjW/8CYecPmy1UQ/sioI/mfQ+01bfymaYdeJU23Llvivw6+Aarh3X
         +/aP1PucQBeJ5/gYBj1lLOEwoL5wl+LNLueB16DWqKhQS9aSGFjU52MN4SuXuEmX2CDh
         YgOkdNNmRO+tKUHF0HKtJ025J8TUGl6Fq6hfLqKVfEsEGTWNGVAz7/O2R7JkTxwsGxoQ
         vy25cfHMp/XCi+DRIgpjSQ6dwzpEl2B7PkOkrIbDNRtZoDzFElJPmEPWlD+LAzS/lYKa
         aUvuzH7cqIv+QawapoQZJKEaTury7mdQadF7Cl9o2EZcheNhk3NOtyWf8W6Gbfyx0nC3
         +0rA==
X-Forwarded-Encrypted: i=1; AJvYcCWknZSh4WSlqBuy1UxW0rRczgsyS3N0zD3+ZsNoVuerPsg56XWnLUBTxB8cVhJn0LfyNJ0yswnh9MGD7w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3gB//RQUJ98B7krHtoaRmgbTe+0CISK9oFFfRpIMWJupDHF34
	H+EO7BwOXTgRVMD1jAhxb2UCrjrJTEMXYd/JeLA4Cy5T8hLNPrZGOxnU0GbY2UJ2H39d+10WZqG
	+v01ZLsaQDtcqV3yuuG4HInxwG7ayoHeyVT+4FonPpA==
X-Gm-Gg: ASbGncsnAVmshFT0U7/CrMgIr4dtAhT4RHSEMsK/fy0eK4ySRtIDtb0gTrfITmkZSl6
	Kof1a2e3btrt+2KXB+1OphtaF+6pNZAnbRZY1eTMDY3mwHY6J6oPd1X1lEvU3ekqSUsBYrNN2sP
	DIJowMeqEOUP/vzbsGuo36ipWFTKNs1BTYNe9HSbkNsWjwVrIHIe9Qz9bjC4+ofHGXfllauscei
	Bn46BOI3LfXkqp2q6JYmnXlfq5sDB60unObjWEOgnPF9pT/SQ==
X-Google-Smtp-Source: AGHT+IE7nB4a8P3mR3YYMPv0R1xgWY7wkFCTrq0nNvY3HIPgmOHGl4ogngHfwsB47UewiY7y4YBMYMpveIUI+j9sRqc=
X-Received: by 2002:a05:690c:22c6:b0:70e:142d:9c4e with SMTP id
 00721157ae682-71837470738mr92202197b3.26.1752764850020; Thu, 17 Jul 2025
 08:07:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250717124001.108486-1-vladimir.zapolskiy@linaro.org>
 <20250717124001.108486-3-vladimir.zapolskiy@linaro.org> <175276139540.560048.14744394485094549778@ping.linuxembedded.co.uk>
In-Reply-To: <175276139540.560048.14744394485094549778@ping.linuxembedded.co.uk>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 17 Jul 2025 16:07:12 +0100
X-Gm-Features: Ac12FXzZXGZW3KuPfmNnIkXNlNXW1zArEaHhagWuSiJ0JxFIGrNobhouUfjfaOo
Message-ID: <CAPY8ntCiKFFdfepqW0ms_0dhCtJJCwJoT=bxmJ5i0K254i6fkA@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: i2c: Add OmniVision OV6211 image sensor driver
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Vladimir and Kieran

On Thu, 17 Jul 2025 at 15:10, Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
>
> Quoting Vladimir Zapolskiy (2025-07-17 13:40:01)
> > OmniVision OV6211 is a monochrome image sensor, which produces frames in
> > 8/10-bit raw output format and supports 400x400, 200x200 and 100x100
> > output image resolution modes.
> >
> > Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> > ---
> >  MAINTAINERS                |   8 +
> >  drivers/media/i2c/Kconfig  |   9 +
> >  drivers/media/i2c/Makefile |   1 +
> >  drivers/media/i2c/ov6211.c | 877 +++++++++++++++++++++++++++++++++++++
> >  4 files changed, 895 insertions(+)
> >  create mode 100644 drivers/media/i2c/ov6211.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 1ef99240a57e..364914ca2d45 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -18433,6 +18433,14 @@ S:     Maintained
> >  T:     git git://linuxtv.org/media.git
> >  F:     drivers/media/i2c/ov5695.c
> >
> > +OMNIVISION OV6211 SENSOR DRIVER
> > +M:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> > +L:     linux-media@vger.kernel.org
> > +S:     Maintained
> > +T:     git git://linuxtv.org/media_tree.git
> > +F:     Documentation/devicetree/bindings/media/i2c/ovti,ov6211.yaml
> > +F:     drivers/media/i2c/ov6211.c
> > +
> >  OMNIVISION OV64A40 SENSOR DRIVER
> >  M:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> >  L:     linux-media@vger.kernel.org
> > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > index 6237fe804a5c..2c54753e1b25 100644
> > --- a/drivers/media/i2c/Kconfig
> > +++ b/drivers/media/i2c/Kconfig
> > @@ -542,6 +542,15 @@ config VIDEO_OV5695
> >           To compile this driver as a module, choose M here: the
> >           module will be called ov5695.
> >
> > +config VIDEO_OV6211
> > +       tristate "OmniVision OV6211 sensor support"
> > +       help
> > +         This is a Video4Linux2 sensor driver for the OmniVision
> > +         OV6211 camera.
> > +
> > +         To compile this driver as a module, choose M here: the
> > +         module will be called ov6211.
> > +
> >  config VIDEO_OV64A40
> >         tristate "OmniVision OV64A40 sensor support"
> >         select V4L2_CCI_I2C
> > diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> > index 5873d29433ee..03814fc8e2f7 100644
> > --- a/drivers/media/i2c/Makefile
> > +++ b/drivers/media/i2c/Makefile
> > @@ -103,6 +103,7 @@ obj-$(CONFIG_VIDEO_OV5670) += ov5670.o
> >  obj-$(CONFIG_VIDEO_OV5675) += ov5675.o
> >  obj-$(CONFIG_VIDEO_OV5693) += ov5693.o
> >  obj-$(CONFIG_VIDEO_OV5695) += ov5695.o
> > +obj-$(CONFIG_VIDEO_OV6211) += ov6211.o
> >  obj-$(CONFIG_VIDEO_OV64A40) += ov64a40.o
> >  obj-$(CONFIG_VIDEO_OV6650) += ov6650.o
> >  obj-$(CONFIG_VIDEO_OV7251) += ov7251.o
> > diff --git a/drivers/media/i2c/ov6211.c b/drivers/media/i2c/ov6211.c
> > new file mode 100644
> > index 000000000000..f2a9daf40896
> > --- /dev/null
> > +++ b/drivers/media/i2c/ov6211.c
> > @@ -0,0 +1,877 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +// Copyright (c) 2024-2025 Linaro Ltd
> > +
> > +#include <linux/clk.h>
> > +#include <linux/delay.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/i2c.h>
> > +#include <linux/module.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/regulator/consumer.h>
> > +#include <linux/unaligned.h>
> > +#include <media/v4l2-ctrls.h>
> > +#include <media/v4l2-device.h>
> > +#include <media/v4l2-fwnode.h>
> > +
> > +#define OV6211_REG_VALUE_08BIT         1
> > +#define OV6211_REG_VALUE_16BIT         2
> > +#define OV6211_REG_VALUE_24BIT         3
> > +
> > +#define OV6211_LINK_FREQ_240MHZ                240000000ULL
> > +#define OV6211_MCLK_FREQ_24MHZ         24000000
> > +#define OV6211_DATA_LANES              1
> > +
> > +#define OV6211_REG_CHIP_ID             0x300a
> > +#define OV6211_CHIP_ID                 0x6710
> > +
> > +#define OV6211_REG_MODE_SELECT         0x0100
> > +#define OV6211_MODE_STANDBY            0x00
> > +#define OV6211_MODE_STREAMING          0x01
> > +
> > +/* Exposure controls from sensor */
> > +#define OV6211_REG_EXPOSURE            0x3500
> > +#define OV6211_EXPOSURE_MIN            1
> > +#define OV6211_EXPOSURE_MAX_MARGIN     4
> > +#define OV6211_EXPOSURE_STEP           1
> > +#define OV6211_EXPOSURE_DEFAULT                210
> > +
> > +/* Analogue gain controls from sensor */
> > +#define OV6211_REG_ANALOGUE_GAIN       0x350a
> > +#define OV6211_ANALOGUE_GAIN_MIN       1
> > +#define OV6211_ANALOGUE_GAIN_MAX       0x3ff
> > +#define OV6211_ANALOGUE_GAIN_STEP      1
> > +#define OV6211_ANALOGUE_GAIN_DEFAULT   0xa0
> > +
> > +#define to_ov6211(_sd)                 container_of(_sd, struct ov6211, sd)
> > +
> > +struct ov6211_reg {
> > +       u16 address;
> > +       u8 val;
> > +};
> > +
> > +struct ov6211_reg_list {
> > +       const struct ov6211_reg *regs;
> > +       u32 num_of_regs;
> > +};
> > +
> > +struct ov6211_mode {
> > +       /* Frame width in pixels */
> > +       u32 width;
> > +
> > +       /* Frame height in pixels */
> > +       u32 height;
> > +
> > +       /* Horizontal timining size */
> > +       u32 hts;
> > +
> > +       /* Default vertical timining size */
> > +       u32 vts;
> > +
> > +       /* Sensor register settings for this resolution */
> > +       const struct ov6211_reg_list reg_list;
> > +};
> > +
> > +static const s64 link_freq_menu_items[] = {
> > +       OV6211_LINK_FREQ_240MHZ,
> > +};
> > +
> > +static const struct ov6211_reg mode_400x400_regs[] = {
> > +       { 0x0103, 0x01 },
> > +       { 0x0100, 0x00 },
> > +       { 0x3005, 0x08 },
> > +       { 0x3013, 0x12 },
> > +       { 0x3014, 0x04 },
> > +       { 0x3016, 0x10 },
> > +       { 0x3017, 0x00 },
> > +       { 0x3018, 0x00 },
> > +       { 0x301a, 0x00 },
> > +       { 0x301b, 0x00 },
> > +       { 0x301c, 0x00 },
> > +       { 0x3037, 0xf0 },
> > +       { 0x3080, 0x01 },
> > +       { 0x3081, 0x00 },
> > +       { 0x3082, 0x01 },
> > +       { 0x3098, 0x04 },
> > +       { 0x3099, 0x28 },
> > +       { 0x309a, 0x06 },
> > +       { 0x309b, 0x04 },
> > +       { 0x309c, 0x00 },
> > +       { 0x309d, 0x00 },
> > +       { 0x309e, 0x01 },
> > +       { 0x309f, 0x00 },
> > +       { 0x30b0, 0x08 },
> > +       { 0x30b1, 0x02 },
> > +       { 0x30b2, 0x00 },
> > +       { 0x30b3, 0x28 },
> > +       { 0x30b4, 0x02 },
> > +       { 0x30b5, 0x00 },
> > +       { 0x3106, 0xd9 },
> > +       { 0x3500, 0x00 },
> > +       { 0x3501, 0x0d },
> > +       { 0x3502, 0x20 },
> > +       { 0x3503, 0x07 },
> > +       { 0x3509, 0x10 },
> > +       { 0x350b, 0xa0 },
> > +       { 0x3600, 0xfc },
> > +       { 0x3620, 0xb7 },
> > +       { 0x3621, 0x05 },
> > +       { 0x3626, 0x31 },
> > +       { 0x3627, 0x40 },
> > +       { 0x3632, 0xa3 },
> > +       { 0x3633, 0x34 },
> > +       { 0x3634, 0x40 },
> > +       { 0x3636, 0x00 },
> > +       { 0x3660, 0x80 },
> > +       { 0x3662, 0x03 },
> > +       { 0x3664, 0xf0 },
> > +       { 0x366a, 0x10 },
> > +       { 0x366b, 0x06 },
> > +       { 0x3680, 0xf4 },
> > +       { 0x3681, 0x50 },
> > +       { 0x3682, 0x00 },
> > +       { 0x3708, 0x20 },
> > +       { 0x3709, 0x40 },
> > +       { 0x370d, 0x03 },
> > +       { 0x373b, 0x02 },
> > +       { 0x373c, 0x08 },
> > +       { 0x3742, 0x00 },
> > +       { 0x3744, 0x16 },
> > +       { 0x3745, 0x08 },
> > +       { 0x3781, 0xfc },
> > +       { 0x3788, 0x00 },
> > +       { 0x3800, 0x00 },
> > +       { 0x3801, 0x04 },
> > +       { 0x3802, 0x00 },
> > +       { 0x3803, 0x04 },
> > +       { 0x3804, 0x01 },
> > +       { 0x3805, 0x9b },
> > +       { 0x3806, 0x01 },
> > +       { 0x3807, 0x9b },
> > +       { 0x3808, 0x01 },
> > +       { 0x3809, 0x90 },
>
> 0x190 == 400;
>
> > +       { 0x380a, 0x01 },
> > +       { 0x380b, 0x90 },
>
> So I bet these are the width and height registers.

Almost certainly as that also matches OV7251 and OV9281.
0x3800/1 is X_ADDR_START
0x3802/3 is Y_ADDR_START
0x3804/5 is X_ADDR_END
0x3806/7 is Y_ADDR_END
0x3808/9 is X_OUTPUT_SIZE
0x380a/b is Y_OUTPUT_SIZE.
Those almost all fit here, although it does imply that it's reading
(0x019b - 0x0004 + 1 = ) 408 x408 from the array, but only outputting
400x400.

> Have you got a data sheet for this ? It would be /really/ far more
> helpful to break out the specific register updates here for the mode
> configuration at least.
>
> > +       { 0x380c, 0x05 },
> > +       { 0x380d, 0xf2 },
> > +       { 0x380e, 0x01 },
> > +       { 0x380f, 0xb6 },
> > +       { 0x3810, 0x00 },
> > +       { 0x3811, 0x04 },
> > +       { 0x3812, 0x00 },
> > +       { 0x3813, 0x04 },
> > +       { 0x3814, 0x11 },
> > +       { 0x3815, 0x11 },
> > +       { 0x3820, 0x00 },
> > +       { 0x3821, 0x00 },
> > +       { 0x382b, 0xfa },
> > +       { 0x382f, 0x04 },
> > +       { 0x3832, 0x00 },
> > +       { 0x3833, 0x05 },
> > +       { 0x3834, 0x00 },
> > +       { 0x3835, 0x05 },
> > +       { 0x3882, 0x04 },
> > +       { 0x3883, 0x00 },
> > +       { 0x38a4, 0x10 },
> > +       { 0x38a5, 0x00 },
> > +       { 0x38b1, 0x03 },
> > +       { 0x3b80, 0x00 },
> > +       { 0x3b81, 0xff },
> > +       { 0x3b82, 0x10 },
> > +       { 0x3b83, 0x00 },
> > +       { 0x3b84, 0x08 },
> > +       { 0x3b85, 0x00 },
> > +       { 0x3b86, 0x01 },
> > +       { 0x3b87, 0x00 },
> > +       { 0x3b88, 0x00 },
> > +       { 0x3b89, 0x00 },
> > +       { 0x3b8a, 0x00 },
> > +       { 0x3b8b, 0x05 },
> > +       { 0x3b8c, 0x00 },
> > +       { 0x3b8d, 0x00 },
> > +       { 0x3b8e, 0x01 },
> > +       { 0x3b8f, 0xb2 },
> > +       { 0x3b94, 0x05 },
> > +       { 0x3b95, 0xf2 },
> > +       { 0x3b96, 0xc0 },
> > +       { 0x4004, 0x04 },
> > +       { 0x404e, 0x01 },
> > +       { 0x4801, 0x0f },
> > +       { 0x4806, 0x0f },
> > +       { 0x4837, 0x43 },
> > +       { 0x5a08, 0x00 },
> > +       { 0x5a01, 0x00 },
> > +       { 0x5a03, 0x00 },
> > +       { 0x5a04, 0x10 },
> > +       { 0x5a05, 0xa0 },
> > +       { 0x5a06, 0x0c },
> > +       { 0x5a07, 0x78 },
> > +};
> > +
> > +static const struct ov6211_mode supported_modes[] = {
> > +       {
> > +               .width = 400,
> > +               .height = 400,
> > +               .hts = 1522,
> > +               .vts = 438,

This implies we do have the blanking values, but don't expose them.
The values don't appear to be used for anything though.

> > +               .reg_list = {
> > +                       .regs = mode_400x400_regs,
> > +                       .num_of_regs = ARRAY_SIZE(mode_400x400_regs),
> > +               },
> > +       },
> > +};
> > +
> > +struct ov6211 {
> > +       struct clk *xvclk;
> > +       struct gpio_desc *reset_gpio;
> > +       struct regulator *avdd;
> > +       struct regulator *dovdd;
> > +       struct regulator *dvdd;
> > +
> > +       struct v4l2_subdev sd;
> > +       struct media_pad pad;
> > +       struct v4l2_ctrl_handler ctrl_handler;
> > +
> > +       /* V4L2 Controls */
> > +       struct v4l2_ctrl *link_freq;
> > +       struct v4l2_ctrl *exposure;
> > +
> > +       /* Current mode */
> > +       const struct ov6211_mode *cur_mode;
> > +
> > +       /* To serialize asynchronous callbacks */
> > +       struct mutex mutex;
> > +};
> > +
> > +static int ov6211_read_reg(struct ov6211 *ov6211, u16 reg, u16 len, u32 *val)
> > +{
> > +       struct i2c_client *client = v4l2_get_subdevdata(&ov6211->sd);
> > +       u8 addr_buf[2], data_buf[4] = { 0 };
> > +       struct i2c_msg msgs[2];
> > +       int ret;
> > +
> > +       if (len > 4)
> > +               return -EINVAL;
> > +
> > +       put_unaligned_be16(reg, addr_buf);
> > +       msgs[0].addr = client->addr;
> > +       msgs[0].flags = 0;
> > +       msgs[0].len = sizeof(addr_buf);
> > +       msgs[0].buf = addr_buf;
> > +       msgs[1].addr = client->addr;
> > +       msgs[1].flags = I2C_M_RD;
> > +       msgs[1].len = len;
> > +       msgs[1].buf = &data_buf[4 - len];
> > +
> > +       ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
> > +       if (ret != ARRAY_SIZE(msgs))
> > +               return -EIO;
> > +
> > +       *val = get_unaligned_be32(data_buf);
> > +
> > +       return 0;
> > +}
> > +
> > +static int ov6211_write_reg(struct ov6211 *ov6211, u16 reg, u16 len, u32 val)
> > +{
> > +       struct i2c_client *client = v4l2_get_subdevdata(&ov6211->sd);
> > +       u8 buf[6];
> > +
> > +       if (len > 4)
> > +               return -EINVAL;
> > +
> > +       put_unaligned_be16(reg, buf);
> > +       put_unaligned_be32(val << 8 * (4 - len), buf + 2);
> > +       if (i2c_master_send(client, buf, len + 2) != len + 2)
> > +               return -EIO;
> > +
> > +       return 0;
> > +}
> > +
> > +static int ov6211_write_reg_list(struct ov6211 *ov6211,
> > +                                const struct ov6211_reg_list *r_list)
> > +{
> > +       struct i2c_client *client = v4l2_get_subdevdata(&ov6211->sd);
> > +       unsigned int i;
> > +       int ret;
> > +
> > +       for (i = 0; i < r_list->num_of_regs; i++) {
> > +               ret = ov6211_write_reg(ov6211, r_list->regs[i].address, 1,
> > +                                      r_list->regs[i].val);
> > +               if (ret) {
> > +                       dev_err_ratelimited(&client->dev,
> > +                                           "failed to write reg 0x%4.4x. error = %d\n",
> > +                                           r_list->regs[i].address, ret);
> > +                       return ret;
> > +               }
> > +       }
> > +
> > +       return 0;
> > +}
> > +
>
> Please use CCI helpers now.
>
>
>
> > +static int ov6211_set_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +       struct ov6211 *ov6211 = container_of(ctrl->handler, struct ov6211,
> > +                                            ctrl_handler);
> > +       struct i2c_client *client = v4l2_get_subdevdata(&ov6211->sd);
> > +       int ret;
> > +
> > +       /* V4L2 controls values will be applied only when power is already up */
> > +       if (!pm_runtime_get_if_in_use(&client->dev))
> > +               return 0;
> > +
> > +       switch (ctrl->id) {
> > +       case V4L2_CID_ANALOGUE_GAIN:
> > +               ret = ov6211_write_reg(ov6211, OV6211_REG_ANALOGUE_GAIN,
> > +                                      OV6211_REG_VALUE_16BIT, ctrl->val);
> > +               break;
> > +       case V4L2_CID_EXPOSURE:
> > +               ret = ov6211_write_reg(ov6211, OV6211_REG_EXPOSURE,
> > +                                      OV6211_REG_VALUE_24BIT, ctrl->val << 4);
> > +               break;
>
> What about V4L2_CID_HBLANK and V4L2_CID_VBLANK ?

It's also missing V4L2_CID_PIXEL_RATE, so even with the blanking
values you can't control frame rate.

> > +       default:
> > +               ret = -EINVAL;
> > +               break;
> > +       }
> > +
> > +       pm_runtime_put(&client->dev);
> > +
> > +       return ret;
> > +}
> > +
> > +static const struct v4l2_ctrl_ops ov6211_ctrl_ops = {
> > +       .s_ctrl = ov6211_set_ctrl,
> > +};
> > +
> > +static int ov6211_init_controls(struct ov6211 *ov6211)
> > +{
> > +       struct v4l2_ctrl_handler *ctrl_hdlr;
> > +       s64 exposure_max;
> > +       int ret;
> > +
> > +       ctrl_hdlr = &ov6211->ctrl_handler;
> > +       ret = v4l2_ctrl_handler_init(ctrl_hdlr, 3);
> > +       if (ret)
> > +               return ret;
> > +
> > +       ctrl_hdlr->lock = &ov6211->mutex;
> > +
> > +       ov6211->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &ov6211_ctrl_ops,
> > +                                       V4L2_CID_LINK_FREQ,
> > +                                       ARRAY_SIZE(link_freq_menu_items) - 1,
> > +                                       0, link_freq_menu_items);
> > +       if (ov6211->link_freq)
> > +               ov6211->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > +
> > +       v4l2_ctrl_new_std(ctrl_hdlr, &ov6211_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
> > +                         OV6211_ANALOGUE_GAIN_MIN, OV6211_ANALOGUE_GAIN_MAX,
> > +                         OV6211_ANALOGUE_GAIN_STEP,
> > +                         OV6211_ANALOGUE_GAIN_DEFAULT);
> > +
> > +       exposure_max = (ov6211->cur_mode->vts - OV6211_EXPOSURE_MAX_MARGIN);
> > +       ov6211->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &ov6211_ctrl_ops,
> > +                                            V4L2_CID_EXPOSURE,
> > +                                            OV6211_EXPOSURE_MIN, exposure_max,
> > +                                            OV6211_EXPOSURE_STEP,
> > +                                            OV6211_EXPOSURE_DEFAULT);
> > +
>
> As well as the blanking - I think this driver is missing reporting the
> crop selection implementation to report the sensor crops.

A call to v4l2_fwnode_device_parse and v4l2_ctrl_new_fwnode_properties
wouldn't go amiss to provide the standard orientation and rotation
properties wouldn't go amiss either.

> > +       if (ctrl_hdlr->error)
> > +               return ctrl_hdlr->error;
> > +
> > +       ov6211->sd.ctrl_handler = ctrl_hdlr;
> > +
> > +       return 0;
> > +}
> > +
> > +static void ov6211_update_pad_format(const struct ov6211_mode *mode,
> > +                                    struct v4l2_mbus_framefmt *fmt)
> > +{
> > +       fmt->width = mode->width;
> > +       fmt->height = mode->height;
> > +       fmt->code = MEDIA_BUS_FMT_Y8_1X8;
> > +       fmt->field = V4L2_FIELD_NONE;
> > +}
> > +
> > +static int ov6211_start_streaming(struct ov6211 *ov6211)
> > +{
> > +       struct i2c_client *client = v4l2_get_subdevdata(&ov6211->sd);
> > +       const struct ov6211_reg_list *reg_list;
> > +       int ret;
> > +
> > +       reg_list = &ov6211->cur_mode->reg_list;
> > +       ret = ov6211_write_reg_list(ov6211, reg_list);
> > +       if (ret) {
> > +               dev_err(&client->dev, "failed to set mode\n");
> > +               return ret;
> > +       }
> > +
> > +       ret = __v4l2_ctrl_handler_setup(ov6211->sd.ctrl_handler);
> > +       if (ret)
> > +               return ret;
> > +
> > +       ret = ov6211_write_reg(ov6211, OV6211_REG_MODE_SELECT,
> > +                              OV6211_REG_VALUE_08BIT,
> > +                              OV6211_MODE_STREAMING);
> > +       if (ret) {
> > +               dev_err(&client->dev, "failed to start streaming\n");
> > +               return ret;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static void ov6211_stop_streaming(struct ov6211 *ov6211)
> > +{
> > +       struct i2c_client *client = v4l2_get_subdevdata(&ov6211->sd);
> > +
> > +       if (ov6211_write_reg(ov6211, OV6211_REG_MODE_SELECT,
> > +                            OV6211_REG_VALUE_08BIT, OV6211_MODE_STANDBY))
> > +               dev_err(&client->dev, "failed to stop streaming\n");
> > +}
> > +
> > +static int ov6211_set_stream(struct v4l2_subdev *sd, int enable)
> > +{
> > +       struct ov6211 *ov6211 = to_ov6211(sd);
> > +       struct i2c_client *client = v4l2_get_subdevdata(sd);
> > +       int ret = 0;
> > +
> > +       mutex_lock(&ov6211->mutex);
> > +
> > +       if (enable) {
> > +               ret = pm_runtime_resume_and_get(&client->dev);
> > +               if (ret) {
> > +                       mutex_unlock(&ov6211->mutex);
> > +                       return ret;
> > +               }
> > +
> > +               ret = ov6211_start_streaming(ov6211);
> > +               if (!ret) {
> > +                       mutex_unlock(&ov6211->mutex);
> > +                       return 0;
> > +               }
> > +       }
> > +
> > +       ov6211_stop_streaming(ov6211);
> > +       pm_runtime_put(&client->dev);
> > +
> > +       mutex_unlock(&ov6211->mutex);
> > +
> > +       return ret;
> > +}
> > +
> > +static int ov6211_set_format(struct v4l2_subdev *sd,
> > +                            struct v4l2_subdev_state *sd_state,
> > +                            struct v4l2_subdev_format *fmt)
> > +{
> > +       struct ov6211 *ov6211 = to_ov6211(sd);
> > +       const struct ov6211_mode *mode;
> > +
> > +       mode = v4l2_find_nearest_size(supported_modes,
> > +                                     ARRAY_SIZE(supported_modes),
> > +                                     width, height,
> > +                                     fmt->format.width,
> > +                                     fmt->format.height);
> > +
> > +       mutex_lock(&ov6211->mutex);
> > +
> > +       ov6211_update_pad_format(mode, &fmt->format);
> > +       if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
> > +               *v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
> > +       else
> > +               ov6211->cur_mode = mode;
> > +
> > +       mutex_unlock(&ov6211->mutex);
> > +
> > +       return 0;
> > +}
> > +
> > +static int ov6211_get_format(struct v4l2_subdev *sd,
> > +                            struct v4l2_subdev_state *sd_state,
> > +                            struct v4l2_subdev_format *fmt)
> > +{
> > +       struct ov6211 *ov6211 = to_ov6211(sd);
> > +
> > +       mutex_lock(&ov6211->mutex);
> > +
> > +       if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
> > +               fmt->format = *v4l2_subdev_state_get_format(sd_state, fmt->pad);
> > +       else
> > +               ov6211_update_pad_format(ov6211->cur_mode, &fmt->format);
> > +
> > +       mutex_unlock(&ov6211->mutex);
> > +
> > +       return 0;
> > +}
> > +
> > +static int ov6211_enum_mbus_code(struct v4l2_subdev *sd,
> > +                                struct v4l2_subdev_state *sd_state,
> > +                                struct v4l2_subdev_mbus_code_enum *code)
> > +{
> > +       if (code->index > 0)
> > +               return -EINVAL;
> > +
> > +       code->code = MEDIA_BUS_FMT_Y8_1X8;
> > +
> > +       return 0;
> > +}
> > +
> > +static int ov6211_enum_frame_size(struct v4l2_subdev *sd,
> > +                                 struct v4l2_subdev_state *sd_state,
> > +                                 struct v4l2_subdev_frame_size_enum *fse)
> > +{
> > +       if (fse->index >= ARRAY_SIZE(supported_modes))
> > +               return -EINVAL;
> > +
> > +       if (fse->code != MEDIA_BUS_FMT_Y8_1X8)
> > +               return -EINVAL;
> > +
> > +       fse->min_width = supported_modes[fse->index].width;
> > +       fse->max_width = fse->min_width;
> > +       fse->min_height = supported_modes[fse->index].height;
> > +       fse->max_height = fse->min_height;
> > +
> > +       return 0;
> > +}
> > +
> > +static int ov6211_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> > +{
> > +       struct ov6211 *ov6211 = to_ov6211(sd);
> > +
> > +       mutex_lock(&ov6211->mutex);
> > +
> > +       ov6211_update_pad_format(&supported_modes[0],
> > +                                v4l2_subdev_state_get_format(fh->state, 0));
> > +
> > +       mutex_unlock(&ov6211->mutex);
> > +
> > +       return 0;
> > +}
> > +
> > +static const struct v4l2_subdev_video_ops ov6211_video_ops = {
> > +       .s_stream = ov6211_set_stream,
> > +};
> > +
> > +static const struct v4l2_subdev_pad_ops ov6211_pad_ops = {
> > +       .set_fmt = ov6211_set_format,
> > +       .get_fmt = ov6211_get_format,
> > +       .enum_mbus_code = ov6211_enum_mbus_code,
> > +       .enum_frame_size = ov6211_enum_frame_size,
> > +};
> > +
> > +static const struct v4l2_subdev_ops ov6211_subdev_ops = {
> > +       .video = &ov6211_video_ops,
> > +       .pad = &ov6211_pad_ops,
> > +};
> > +
> > +static const struct media_entity_operations ov6211_subdev_entity_ops = {
> > +       .link_validate = v4l2_subdev_link_validate,
> > +};
> > +
> > +static const struct v4l2_subdev_internal_ops ov6211_internal_ops = {
> > +       .open = ov6211_open,
> > +};
> > +
> > +static int ov6211_identify_module(struct ov6211 *ov6211)
> > +{
> > +       struct i2c_client *client = v4l2_get_subdevdata(&ov6211->sd);
> > +       int ret;
> > +       u32 val;
> > +
> > +       ret = ov6211_read_reg(ov6211, OV6211_REG_CHIP_ID,
> > +                             OV6211_REG_VALUE_16BIT, &val);
> > +       if (ret)
> > +               return ret;
> > +
> > +       if (val != OV6211_CHIP_ID) {
> > +               dev_err(&client->dev, "chip id mismatch: %x!=%x\n",
> > +                       OV6211_CHIP_ID, val);
> > +               return -ENXIO;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static int ov6211_check_hwcfg(struct ov6211 *ov6211)
> > +{
> > +       struct i2c_client *client = v4l2_get_subdevdata(&ov6211->sd);
> > +       struct device *dev = &client->dev;
> > +       struct fwnode_handle *fwnode = dev_fwnode(dev), *ep;
> > +       struct v4l2_fwnode_endpoint bus_cfg = {
> > +               .bus_type = V4L2_MBUS_CSI2_DPHY
> > +       };
> > +       int ret;
> > +
> > +       if (!fwnode)
> > +               return -ENXIO;
> > +
> > +       ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
> > +       if (!ep)
> > +               return -ENXIO;
> > +
> > +       ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> > +       fwnode_handle_put(ep);
> > +       if (ret)
> > +               return ret;
> > +
> > +       if (bus_cfg.bus.mipi_csi2.num_data_lanes &&

Is it permitted to omit the data-lanes configuration?

> > +           bus_cfg.bus.mipi_csi2.num_data_lanes != OV6211_DATA_LANES) {
> > +               dev_err(dev, "Invalid number of data lanes: %u\n",
> > +                       bus_cfg.bus.mipi_csi2.num_data_lanes);
> > +               ret = -EINVAL;
> > +               goto check_hwcfg_error;
> > +       }
> > +
> > +       if (!bus_cfg.nr_of_link_frequencies) {
> > +               dev_err(dev, "link-frequency property is not found\n");
> > +               ret = -EINVAL;
> > +               goto check_hwcfg_error;
> > +       }
> > +
> > +       if (bus_cfg.nr_of_link_frequencies != 1 ||
> > +           bus_cfg.link_frequencies[0] != link_freq_menu_items[0]) {
> > +               dev_err(dev, "Unsupported link-frequency property is found\n");
> > +               ret = -EINVAL;
> > +               goto check_hwcfg_error;
> > +       }
> > +
> > +check_hwcfg_error:
> > +       v4l2_fwnode_endpoint_free(&bus_cfg);
> > +
> > +       return ret;
> > +}
> > +
> > +static int ov6211_power_on(struct device *dev)
> > +{
> > +       struct v4l2_subdev *sd = dev_get_drvdata(dev);
> > +       struct ov6211 *ov6211 = to_ov6211(sd);
> > +       int ret;
> > +
> > +       if (ov6211->avdd) {
> > +               ret = regulator_enable(ov6211->avdd);
> > +               if (ret)
> > +                       return ret;
> > +       }
> > +
> > +       if (ov6211->dovdd) {
> > +               ret = regulator_enable(ov6211->dovdd);
> > +               if (ret)
> > +                       goto avdd_disable;
> > +       }
> > +
> > +       if (ov6211->dvdd) {
> > +               ret = regulator_enable(ov6211->dvdd);
> > +               if (ret)
> > +                       goto dovdd_disable;
> > +       }
> > +
> > +       gpiod_set_value_cansleep(ov6211->reset_gpio, 0);
> > +       usleep_range(10 * USEC_PER_MSEC, 15 * USEC_PER_MSEC);
> > +
> > +       ret = clk_prepare_enable(ov6211->xvclk);
> > +       if (ret)
> > +               goto dvdd_disable;
> > +
> > +       return 0;
> > +
> > +dvdd_disable:
> > +       if (ov6211->dvdd)
> > +               regulator_disable(ov6211->dvdd);
> > +dovdd_disable:
> > +       if (ov6211->dovdd)
> > +               regulator_disable(ov6211->dovdd);
> > +avdd_disable:
> > +       if (ov6211->avdd)
> > +               regulator_disable(ov6211->avdd);
> > +
> > +       return ret;
> > +}
> > +
> > +static int ov6211_power_off(struct device *dev)
> > +{
> > +       struct v4l2_subdev *sd = dev_get_drvdata(dev);
> > +       struct ov6211 *ov6211 = to_ov6211(sd);
> > +
> > +       clk_disable_unprepare(ov6211->xvclk);
> > +
> > +       gpiod_set_value_cansleep(ov6211->reset_gpio, 1);
> > +
> > +       if (ov6211->dvdd)
> > +               regulator_disable(ov6211->dvdd);
> > +
> > +       if (ov6211->dovdd)
> > +               regulator_disable(ov6211->dovdd);
> > +
> > +       if (ov6211->avdd)
> > +               regulator_disable(ov6211->avdd);
> > +
> > +       return 0;
> > +}
> > +
> > +static void ov6211_remove(struct i2c_client *client)
> > +{
> > +       struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > +       struct ov6211 *ov6211 = to_ov6211(sd);
> > +
> > +       v4l2_async_unregister_subdev(sd);
> > +       media_entity_cleanup(&sd->entity);
> > +       v4l2_ctrl_handler_free(sd->ctrl_handler);
> > +       pm_runtime_disable(&client->dev);
> > +       mutex_destroy(&ov6211->mutex);
> > +}
> > +
> > +static int ov6211_probe(struct i2c_client *client)
> > +{
> > +       struct ov6211 *ov6211;
> > +       unsigned long freq;
> > +       int ret;
> > +
> > +       ov6211 = devm_kzalloc(&client->dev, sizeof(*ov6211), GFP_KERNEL);
> > +       if (!ov6211)
> > +               return -ENOMEM;
> > +
> > +       v4l2_i2c_subdev_init(&ov6211->sd, client, &ov6211_subdev_ops);
> > +
> > +       ov6211->xvclk = devm_clk_get_optional(&client->dev, NULL);
> > +       if (IS_ERR(ov6211->xvclk)) {
> > +               ret = PTR_ERR(ov6211->xvclk);
> > +               dev_err(&client->dev, "failed to get XVCLK clock: %d\n", ret);
> > +               return ret;
> > +       }
> > +
> > +       freq = clk_get_rate(ov6211->xvclk);
> > +       if (freq && freq != OV6211_MCLK_FREQ_24MHZ)
> > +               return dev_err_probe(&client->dev, -EINVAL,
> > +                               "XVCLK clock frequency %lu is not supported\n",
> > +                               freq);

This would be nicer to make use of the cleanups that have just been
implemented in
https://lore.kernel.org/linux-media/cover.1750942967.git.mehdi.djait@linux.intel.com/
and
https://lore.kernel.org/linux-media/20250710174808.5361-1-laurent.pinchart@ideasonboard.com/T/

  Dave

> > +
> > +       ret = ov6211_check_hwcfg(ov6211);
> > +       if (ret) {
> > +               dev_err(&client->dev, "failed to check HW configuration: %d",
> > +                       ret);
> > +               return ret;
> > +       }
> > +
> > +       ov6211->reset_gpio = devm_gpiod_get_optional(&client->dev, "reset",
> > +                                                    GPIOD_OUT_HIGH);
> > +       if (IS_ERR(ov6211->reset_gpio)) {
> > +               dev_err(&client->dev, "cannot get reset GPIO\n");
> > +               return PTR_ERR(ov6211->reset_gpio);
> > +       }
> > +
> > +       ov6211->avdd = devm_regulator_get_optional(&client->dev, "avdd");
> > +       if (IS_ERR(ov6211->avdd)) {
> > +               ret = PTR_ERR(ov6211->avdd);
> > +               if (ret != -ENODEV) {
> > +                       dev_err_probe(&client->dev, ret,
> > +                                     "Failed to get 'avdd' regulator\n");
> > +                       return ret;
> > +               }
> > +
> > +               ov6211->avdd = NULL;
> > +       }
> > +
> > +       ov6211->dovdd = devm_regulator_get_optional(&client->dev, "dovdd");
> > +       if (IS_ERR(ov6211->dovdd)) {
> > +               ret = PTR_ERR(ov6211->dovdd);
> > +               if (ret != -ENODEV) {
> > +                       dev_err_probe(&client->dev, ret,
> > +                                     "Failed to get 'dovdd' regulator\n");
> > +                       return ret;
> > +               }
> > +
> > +               ov6211->dovdd = NULL;
> > +       }
> > +
> > +       ov6211->dvdd = devm_regulator_get_optional(&client->dev, "dvdd");
> > +       if (IS_ERR(ov6211->dvdd)) {
> > +               ret = PTR_ERR(ov6211->dvdd);
> > +               if (ret != -ENODEV) {
> > +                       dev_err_probe(&client->dev, ret,
> > +                                     "Failed to get 'dvdd' regulator\n");
> > +                       return ret;
> > +               }
> > +
> > +               ov6211->dvdd = NULL;
> > +       }
> > +
> > +       /* The sensor must be powered on to read the CHIP_ID register */
> > +       ret = ov6211_power_on(&client->dev);
> > +       if (ret)
> > +               return ret;
> > +
> > +       ret = ov6211_identify_module(ov6211);
> > +       if (ret) {
> > +               dev_err(&client->dev, "failed to find sensor: %d\n", ret);
> > +               goto power_off;
> > +       }
> > +
> > +       mutex_init(&ov6211->mutex);
> > +       ov6211->cur_mode = &supported_modes[0];
> > +       ret = ov6211_init_controls(ov6211);
> > +       if (ret) {
> > +               dev_err(&client->dev, "failed to init controls: %d\n", ret);
> > +               goto probe_error_v4l2_ctrl_handler_free;
> > +       }
> > +
> > +       ov6211->sd.internal_ops = &ov6211_internal_ops;
> > +       ov6211->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> > +       ov6211->sd.entity.ops = &ov6211_subdev_entity_ops;
> > +       ov6211->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> > +       ov6211->pad.flags = MEDIA_PAD_FL_SOURCE;
> > +       ret = media_entity_pads_init(&ov6211->sd.entity, 1, &ov6211->pad);
> > +       if (ret) {
> > +               dev_err(&client->dev, "failed to init entity pads: %d\n", ret);
> > +               goto probe_error_v4l2_ctrl_handler_free;
> > +       }
> > +
> > +       ret = v4l2_async_register_subdev_sensor(&ov6211->sd);
> > +       if (ret < 0) {
> > +               dev_err(&client->dev, "failed to register V4L2 subdev: %d\n",
> > +                       ret);
> > +               goto probe_error_media_entity_cleanup;
> > +       }
> > +
> > +       /* Enable runtime PM and turn off the device */
> > +       pm_runtime_set_active(&client->dev);
> > +       pm_runtime_enable(&client->dev);
> > +       pm_runtime_idle(&client->dev);
> > +
> > +       return 0;
> > +
> > +probe_error_media_entity_cleanup:
> > +       media_entity_cleanup(&ov6211->sd.entity);
> > +
> > +probe_error_v4l2_ctrl_handler_free:
> > +       v4l2_ctrl_handler_free(ov6211->sd.ctrl_handler);
> > +       mutex_destroy(&ov6211->mutex);
> > +
> > +power_off:
> > +       ov6211_power_off(&client->dev);
> > +
> > +       return ret;
> > +}
> > +
> > +static const struct dev_pm_ops ov6211_pm_ops = {
> > +       SET_RUNTIME_PM_OPS(ov6211_power_off, ov6211_power_on, NULL)
> > +};
> > +
> > +static const struct of_device_id ov6211_of_match[] = {
> > +       { .compatible = "ovti,ov6211" },
> > +       { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, ov6211_of_match);
> > +
> > +static struct i2c_driver ov6211_i2c_driver = {
> > +       .driver = {
> > +               .name = "ov6211",
> > +               .pm = &ov6211_pm_ops,
> > +               .of_match_table = ov6211_of_match,
> > +       },
> > +       .probe = ov6211_probe,
> > +       .remove = ov6211_remove,
> > +};
> > +
> > +module_i2c_driver(ov6211_i2c_driver);
> > +
> > +MODULE_AUTHOR("Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>");
> > +MODULE_DESCRIPTION("OmniVision OV6211 sensor driver");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.49.0
> >
>

