Return-Path: <linux-media+bounces-27033-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6E8A45FC7
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 13:53:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03EF0189108B
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 12:53:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BF4D2153C8;
	Wed, 26 Feb 2025 12:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="f3sdHV5e"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F642258CD1
	for <linux-media@vger.kernel.org>; Wed, 26 Feb 2025 12:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740574386; cv=none; b=ady72x9FjRIFWX/yclQ6q+F9xe0PHuJDylf/oQSD+83zUckpNOGyfrlHqRAEZVd6QQ3Div9hIedrCSajQ8h50gBh4vwMTPGwyGKFp6U2FVLa8Lw87vNB1LU82PzRyRnG2ZwVaMfSQTYJV+Z5wQWKCwP6GKlh0MC64tFsbfO2eHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740574386; c=relaxed/simple;
	bh=jRNgPW45zWQ45hI3RAWVxJoCz1a2NuguVn3BaKcnNrs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZOjqviQX33YuL7ER1USWiBjK3kvWaI7VAIaY4gx4ePPfuAwCOo1CDsyl3QGMEolMn74PypxGlNGjuWGt3v3EUXEz9fEne54ulFutiimlDX2UV73AGQ+v7NF1DIskqjSc/hONFVxjljUoswb2JrLaLKBHTCurHM6pxf4a6n4CNr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=f3sdHV5e; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e6091256429so501223276.2
        for <linux-media@vger.kernel.org>; Wed, 26 Feb 2025 04:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1740574383; x=1741179183; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rYv9w16OZV8gtKXzmVqp/j+qAA3eBSefly8IKqb6078=;
        b=f3sdHV5enlGY3RBiAufLa3zr6jigy9DHFtHELJV1ouuLv/210g+1VQ3Y5VqwujfrMM
         URvUb21Gth0DZAuGdOv/FTAoJayyIymlUjWRGAfG0eKAz5yelb1Mkn9LfMnxYlRkY29q
         p8XV0ZWOqDiEPvywxuMjn2gs4NdMmStgHe0VmAB6VSBpPnG/kp0DQ8rJeHbpfcGyRFZr
         MWt9bulqSFxTDyA0DIDGo7pt8rOihovmWfeYFjYjWQ8Rpob9HGBg43636UOHwPoL7a12
         FVQdgCgjgXc5srgdb8uheTc44xsz5Sz3sgwE2LNJ4JL+Ik6YCcHm3N3bVcZNUQuHZEDS
         RDeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740574383; x=1741179183;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rYv9w16OZV8gtKXzmVqp/j+qAA3eBSefly8IKqb6078=;
        b=ZKAGeMvDeUR+tNKNnRzPrSYU19iDGQWfjvoTqh6qWMASWliQ+J73SM9MEN3lm8/MHB
         pYrZYyNUGGAo2ePHd+3AC1DriYllFRFrkdwIdj5ngUWCPyanDlvnQsqIJAIaBmdrU0Wu
         PEEX2NjblRpfpuY8rBi9DloMk1/q2Tz6E+W36RotCYTi6nuaSjvd+B7DoljscfOGPc23
         5Uyj5721EoLPhqRJ+C2JAahk2z0DfPHQFmtiFjPWI/xWO8MRHveJr2RrCbFXDGkgo05C
         +z+g4P3YFolmK2XtkoQW29sR9wZWPxZd+44/86TKWmryfGgktgYTLp3CD1+OmS/tjVVh
         uvUg==
X-Forwarded-Encrypted: i=1; AJvYcCXmbxb5DQvIB5iduNvfBg+ESrCJb9ejsP50JPxCkArMsWgAflpTwX/h931x8q0Q3HlvktwOcxwR8eMtkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8Fu4gOlhhJB2dqNgpq7LHAjNNm9VfTqxw0Hujur7bhNBxhpFe
	zbSR8AzW1CRMSPAE+QTuxB63DfWslESoeL7fC6qsPROe3bsURggIgXtoDm7+OuW0mK2fQlZJDNU
	aaLxFxRklUSg36u08fmzHp9KiB7o4eBz6Gi9oWQ==
X-Gm-Gg: ASbGncsCYzSRjcy2Lv4xXuEkWzBNen1n7hdoTc2YUwFN/LSmPf97WFdG/dtbU3LQIr2
	pw1vD01VwN9oG3yDAyRRZHef1UeUHXjxFz6mSyuXHTNGEZY3eUgtKkjBmlcffWCedzlGSbv7UJH
	ar9q8s13YaBjVhcHUrRXt1nNvwumzYC+RVtVq0osY=
X-Google-Smtp-Source: AGHT+IFsSdkRzl5nNIyhhaLn10+uqRdISbdnkxZnKFwU3/R5s9QQ3ML2yLmFOFKhQg1ciToNB9YPY1sS5bi5tQZYKMA=
X-Received: by 2002:a05:6902:2701:b0:e5d:e04f:f2bb with SMTP id
 3f1490d57ef6-e607a56c2e1mr5789855276.45.1740574382263; Wed, 26 Feb 2025
 04:53:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250225-b4-ov9282-gain-v1-0-a24af2820dde@linux.dev>
 <20250225-b4-ov9282-gain-v1-3-a24af2820dde@linux.dev> <CAPY8ntCLUVX91+QYbFk-bHQumuvs70CuDLe85VZRTS2wW-tYHw@mail.gmail.com>
 <ljhusn3jkbq64rn2ureul5kurenjwrtu7ppv5jjx5i542goe65@h4oltlieomfp>
In-Reply-To: <ljhusn3jkbq64rn2ureul5kurenjwrtu7ppv5jjx5i542goe65@h4oltlieomfp>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 26 Feb 2025 12:52:46 +0000
X-Gm-Features: AQ5f1JozCOdThpWKsqLB_NoitB7XM2WjA44sxQQj0vcWMgnWJcJeSjdsaFkAhNY
Message-ID: <CAPY8ntD3k48cPfOQK2iEveLHahhFMV9JMwfq3sV-SvnrsZkxng@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: i2c: ov9282: fix analogue gain maximum
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Feb 2025 at 11:07, Richard Leitner <richard.leitner@linux.dev> wrote:
>
> Hi Dave,
> thanks for the quick and detailled reply!
>
> On Tue, Feb 25, 2025 at 03:30:16PM +0000, Dave Stevenson wrote:
> > Hi Richard
> >
> > On Tue, 25 Feb 2025 at 13:09, Richard Leitner <richard.leitner@linux.dev> wrote:
> > >
> > > The sensors analogue gain is stored within two "LONG GAIN" registers
> > > (0x3508 and 0x3509) where the first one holds the upper 5 bits of the
> > > value. The second register (0x3509) holds the lower 4 bits of the gain
> > > value in its upper 4 bits. The lower 4 register bits are fraction bits.
> > >
> > > This patch changes the gain control to adhere to the datasheet and
> > > make the "upper gain register" (0x3508) accessible via the gain control,
> > > resulting in a new maximum of 0x1fff instead of 0xff.
> > >
> > > As the "upper gain register" is now written during exposure/gain update
> > > remove the hard-coded 0x00 write to it from common_regs.
> > >
> > > We cover only the "real gain format" use-case. The "sensor gain
> > > format" one is ignored as based on the hard-coded "AEC MANUAL" register
> > > configuration it is disabled.
> > >
> > > All values are based on the OV9281 datasheet v1.01 (09.18.2015).
> >
> > My web searches turn up a 1.53 from Jan 2019 -
> > http://www.sinotimes-tech.com/product/20220217221034589.pdf
> > That lists 0x3508 as DEBUG, not LONG_GAIN.
>
> Thanks. That helps a lot :-)
>
> >
> > The current range allows analogue gain to x15.9375.
> > Expanding it to 0x1ff.f would be up to x511.9375. I believe that
> > equates to ~54dB as we're scaling voltages, not power. The spec sheet
> > for the sensor lists S/N of 38dB and dynamic range of 68dB, so x511
> > will be almost pure noise.
> >
> > Doing a very basic test using i2ctransfer to set gain values whilst
> > the sensor is running suggests that the image is the same regardless
> > of bits 2-4 of 0x3508. Setting either bits 0 or 1 increases the gain
> > by around x8.5, but they don't combine.
> >
> > Overall can I ask how you've tested that a range up to 0x1fff works,
> > and on which module? I currently don't believe this works as intended.
>
> I've done some basic testing on a vision components OV9281 module.
> Nonetheless it seems I should have done more testing... I just ran a
> "gain sweep" test and it seems you are perfectly right...
>
> The lower two bits of 0x3508 have some kind of offset and "flattening" effect
> on the applied gain, like shown in the plot (X is the gain, Y is the reported
> mean brightness of the picture, read by magick).
>
>   45 +---------------------------------------------------------------------+
>      |         +           +           +           +           +           |
>      |                     A                     AA                        |
>   40 |-+                AAA                    AA                        +-|
>      |                 AA                 A AAA                            |
>   35 |-+             AA                AAA A                             +-|
>      |              AA              AAAA                             AAAAAA|
>      |            AA             AAAA                          AAAAAA      |
>   30 |-+         AA           AAAA                       AAAAAA          +-|
>      |         AA           AAA                    AAAAAA                  |
>      |         A           A                         A                     |
>   25 |-+     AA                                                          +-|
>      |      A                                                              |
>      |     A                                                               |
>   20 |-+ AA                                                              +-|
>      |   A                                                                 |
>   15 |-AA                                                                +-|
>      |A                                                                    |
>      |A        +           +           +           +           +           |
>   10 +---------------------------------------------------------------------+
>             0x0080      0x0100      0x0180      0x0200      0x0280      0x0300
>                                       gain
>
> This pattern repeats up to 0x1fff, so I guess all other bits of 0x3508
> have no effect on the gain (like shown in the plot attached as png, as
> it got way to big for ascii).
>
> I'm sorry for the inconvenience caused... I've somehow messed up my
> initial tests.

No problem - this is why we review and test patches.
My general view would be that anything over x64 on analogue gain would
be unusual, and on most sensors x16 is about the limit of useful gain.

> Thank you again for your feedback!
>
> So please feel free to ignore this patch. Should I send a new series
> with just the two minor patches of this series? Or should I include them
> in the next series for the ov9282 driver?

Up to Sakari.
The other two patches have my R-b responses, so taking those two and
ignoring this one should be fairly simple, but it just depends upon
workflows.

  Dave

> regards;rl
>
> >
> >   Dave
> >
> > > Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> > > ---
> > >  drivers/media/i2c/ov9282.c | 17 ++++++++++-------
> > >  1 file changed, 10 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > > index c882a021cf18852237bf9b9524d3de0c5b48cbcb..e6effb2b42d4d5d0ca3d924df59c60512f9ce65d 100644
> > > --- a/drivers/media/i2c/ov9282.c
> > > +++ b/drivers/media/i2c/ov9282.c
> > > @@ -54,11 +54,11 @@
> > >  #define OV9282_AEC_MANUAL_DEFAULT      0x00
> > >
> > >  /* Analog gain control */
> > > -#define OV9282_REG_AGAIN       0x3509
> > > -#define OV9282_AGAIN_MIN       0x10
> > > -#define OV9282_AGAIN_MAX       0xff
> > > -#define OV9282_AGAIN_STEP      1
> > > -#define OV9282_AGAIN_DEFAULT   0x10
> > > +#define OV9282_REG_AGAIN       0x3508
> > > +#define OV9282_AGAIN_MIN       0x0010
> > > +#define OV9282_AGAIN_MAX       0x1fff
> > > +#define OV9282_AGAIN_STEP      0x0001
> > > +#define OV9282_AGAIN_DEFAULT   0x0010
> > >
> > >  /* Group hold register */
> > >  #define OV9282_REG_HOLD                0x3308
> > > @@ -226,7 +226,6 @@ static const struct ov9282_reg common_regs[] = {
> > >         {OV9282_REG_AEC_MANUAL, OV9282_GAIN_PREC16_EN},
> > >         {0x3505, 0x8c},
> > >         {0x3507, 0x03},
> > > -       {0x3508, 0x00},
> > >         {0x3610, 0x80},
> > >         {0x3611, 0xa0},
> > >         {0x3620, 0x6e},
> > > @@ -605,7 +604,11 @@ static int ov9282_update_exp_gain(struct ov9282 *ov9282, u32 exposure, u32 gain)
> > >         if (ret)
> > >                 goto error_release_group_hold;
> > >
> > > -       ret = ov9282_write_reg(ov9282, OV9282_REG_AGAIN, 1, gain);
> > > +       ret = ov9282_write_reg(ov9282, OV9282_REG_AGAIN, 1, (gain >> 8) & 0x1f);
> > > +       if (ret)
> > > +               goto error_release_group_hold;
> > > +
> > > +       ret = ov9282_write_reg(ov9282, OV9282_REG_AGAIN + 1, 1, gain & 0xff);
> > >
> > >  error_release_group_hold:
> > >         ov9282_write_reg(ov9282, OV9282_REG_HOLD, 1, 0);
> > >
> > > --
> > > 2.47.2
> > >
> > >

