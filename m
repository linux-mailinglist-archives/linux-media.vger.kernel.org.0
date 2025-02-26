Return-Path: <linux-media+bounces-27027-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E1DA45CAB
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 12:08:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A49E8172D76
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 11:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2195214214;
	Wed, 26 Feb 2025 11:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="r6wnNrA+"
X-Original-To: linux-media@vger.kernel.org
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A96C20E31F
	for <linux-media@vger.kernel.org>; Wed, 26 Feb 2025 11:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740568087; cv=none; b=CI21FbLUQ20bPskgAMt1qjjkNjV7l+bGQWJA65SDw0td69WMAngAFHnEn5O08/N1VlCY+BAbdjztfIJrj3FIVHEEEKgulR4VVaJdq6Zzp9M21AJ+O8QW3ykmQjrq1jAY2qttUXcHizZkhL+YImo+DdQZpQLNr/4vksT+4gDP0l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740568087; c=relaxed/simple;
	bh=ryLDPRzLIu25YQMaxZoJD1ubJecRgHg6OQPyQKsQKH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LM8H5xlwZ3BRdu+Mzvdh5cy/XCInatM062XDruCG0jzIC4Pgx0cQpKeiDuzfK5gOth5Ml90dy1bUaKNLpXlLJXW4eD5JMLKBj7OD014dkymai6dTPeBA7YOLleKnuX5BjphSyFp/FwMa3UO8V6SI2lA1vnN8KSMCHBURDqDy08c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=r6wnNrA+; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Wed, 26 Feb 2025 12:07:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740568071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iWmXbiVuFRh/FdEcvraqWB5N6Im6molF1Vz0h6ou1Gs=;
	b=r6wnNrA+8sL/jnrobpChYZFeVyOBgc508TUd3Xl6dpj5BLincDcSi9Wb1RxTGLw+I24m0b
	rNBBacBQ+bfK6/YhjX0JZfZmNwx5dlbnXwb9bqqTJo2AWIYA8gAIsNg+WP/8rX65eEYijR
	oQ6QBbe6JaHt+beQeBv/mYF/DEwGlwg=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] media: i2c: ov9282: fix analogue gain maximum
Message-ID: <ljhusn3jkbq64rn2ureul5kurenjwrtu7ppv5jjx5i542goe65@h4oltlieomfp>
References: <20250225-b4-ov9282-gain-v1-0-a24af2820dde@linux.dev>
 <20250225-b4-ov9282-gain-v1-3-a24af2820dde@linux.dev>
 <CAPY8ntCLUVX91+QYbFk-bHQumuvs70CuDLe85VZRTS2wW-tYHw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="qypklqcxyarzw3us"
Content-Disposition: inline
In-Reply-To: <CAPY8ntCLUVX91+QYbFk-bHQumuvs70CuDLe85VZRTS2wW-tYHw@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT


--qypklqcxyarzw3us
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave,
thanks for the quick and detailled reply!

On Tue, Feb 25, 2025 at 03:30:16PM +0000, Dave Stevenson wrote:
> Hi Richard
> 
> On Tue, 25 Feb 2025 at 13:09, Richard Leitner <richard.leitner@linux.dev> wrote:
> >
> > The sensors analogue gain is stored within two "LONG GAIN" registers
> > (0x3508 and 0x3509) where the first one holds the upper 5 bits of the
> > value. The second register (0x3509) holds the lower 4 bits of the gain
> > value in its upper 4 bits. The lower 4 register bits are fraction bits.
> >
> > This patch changes the gain control to adhere to the datasheet and
> > make the "upper gain register" (0x3508) accessible via the gain control,
> > resulting in a new maximum of 0x1fff instead of 0xff.
> >
> > As the "upper gain register" is now written during exposure/gain update
> > remove the hard-coded 0x00 write to it from common_regs.
> >
> > We cover only the "real gain format" use-case. The "sensor gain
> > format" one is ignored as based on the hard-coded "AEC MANUAL" register
> > configuration it is disabled.
> >
> > All values are based on the OV9281 datasheet v1.01 (09.18.2015).
> 
> My web searches turn up a 1.53 from Jan 2019 -
> http://www.sinotimes-tech.com/product/20220217221034589.pdf
> That lists 0x3508 as DEBUG, not LONG_GAIN.

Thanks. That helps a lot :-)

> 
> The current range allows analogue gain to x15.9375.
> Expanding it to 0x1ff.f would be up to x511.9375. I believe that
> equates to ~54dB as we're scaling voltages, not power. The spec sheet
> for the sensor lists S/N of 38dB and dynamic range of 68dB, so x511
> will be almost pure noise.
> 
> Doing a very basic test using i2ctransfer to set gain values whilst
> the sensor is running suggests that the image is the same regardless
> of bits 2-4 of 0x3508. Setting either bits 0 or 1 increases the gain
> by around x8.5, but they don't combine.
> 
> Overall can I ask how you've tested that a range up to 0x1fff works,
> and on which module? I currently don't believe this works as intended.

I've done some basic testing on a vision components OV9281 module.
Nonetheless it seems I should have done more testing... I just ran a
"gain sweep" test and it seems you are perfectly right...

The lower two bits of 0x3508 have some kind of offset and "flattening" effect
on the applied gain, like shown in the plot (X is the gain, Y is the reported
mean brightness of the picture, read by magick).

  45 +---------------------------------------------------------------------+
     |         +           +           +           +           +           |
     |                     A                     AA                        |
  40 |-+                AAA                    AA                        +-|
     |                 AA                 A AAA                            |
  35 |-+             AA                AAA A                             +-|
     |              AA              AAAA                             AAAAAA|
     |            AA             AAAA                          AAAAAA      |
  30 |-+         AA           AAAA                       AAAAAA          +-|
     |         AA           AAA                    AAAAAA                  |
     |         A           A                         A                     |
  25 |-+     AA                                                          +-|
     |      A                                                              |
     |     A                                                               |
  20 |-+ AA                                                              +-|
     |   A                                                                 |
  15 |-AA                                                                +-|
     |A                                                                    |
     |A        +           +           +           +           +           |
  10 +---------------------------------------------------------------------+
            0x0080      0x0100      0x0180      0x0200      0x0280      0x0300
                                      gain

This pattern repeats up to 0x1fff, so I guess all other bits of 0x3508
have no effect on the gain (like shown in the plot attached as png, as
it got way to big for ascii).

I'm sorry for the inconvenience caused... I've somehow messed up my
initial tests.

Thank you again for your feedback!

So please feel free to ignore this patch. Should I send a new series
with just the two minor patches of this series? Or should I include them
in the next series for the ov9282 driver?

regards;rl

> 
>   Dave
> 
> > Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> > ---
> >  drivers/media/i2c/ov9282.c | 17 ++++++++++-------
> >  1 file changed, 10 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > index c882a021cf18852237bf9b9524d3de0c5b48cbcb..e6effb2b42d4d5d0ca3d924df59c60512f9ce65d 100644
> > --- a/drivers/media/i2c/ov9282.c
> > +++ b/drivers/media/i2c/ov9282.c
> > @@ -54,11 +54,11 @@
> >  #define OV9282_AEC_MANUAL_DEFAULT      0x00
> >
> >  /* Analog gain control */
> > -#define OV9282_REG_AGAIN       0x3509
> > -#define OV9282_AGAIN_MIN       0x10
> > -#define OV9282_AGAIN_MAX       0xff
> > -#define OV9282_AGAIN_STEP      1
> > -#define OV9282_AGAIN_DEFAULT   0x10
> > +#define OV9282_REG_AGAIN       0x3508
> > +#define OV9282_AGAIN_MIN       0x0010
> > +#define OV9282_AGAIN_MAX       0x1fff
> > +#define OV9282_AGAIN_STEP      0x0001
> > +#define OV9282_AGAIN_DEFAULT   0x0010
> >
> >  /* Group hold register */
> >  #define OV9282_REG_HOLD                0x3308
> > @@ -226,7 +226,6 @@ static const struct ov9282_reg common_regs[] = {
> >         {OV9282_REG_AEC_MANUAL, OV9282_GAIN_PREC16_EN},
> >         {0x3505, 0x8c},
> >         {0x3507, 0x03},
> > -       {0x3508, 0x00},
> >         {0x3610, 0x80},
> >         {0x3611, 0xa0},
> >         {0x3620, 0x6e},
> > @@ -605,7 +604,11 @@ static int ov9282_update_exp_gain(struct ov9282 *ov9282, u32 exposure, u32 gain)
> >         if (ret)
> >                 goto error_release_group_hold;
> >
> > -       ret = ov9282_write_reg(ov9282, OV9282_REG_AGAIN, 1, gain);
> > +       ret = ov9282_write_reg(ov9282, OV9282_REG_AGAIN, 1, (gain >> 8) & 0x1f);
> > +       if (ret)
> > +               goto error_release_group_hold;
> > +
> > +       ret = ov9282_write_reg(ov9282, OV9282_REG_AGAIN + 1, 1, gain & 0xff);
> >
> >  error_release_group_hold:
> >         ov9282_write_reg(ov9282, OV9282_REG_HOLD, 1, 0);
> >
> > --
> > 2.47.2
> >
> >

--qypklqcxyarzw3us
Content-Type: image/png
Content-Disposition: attachment; filename="plot4.png"
Content-Transfer-Encoding: base64

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
tM5FBnqzP0RBmgCAxPkbQgAAgES1olByyygAAECiFIQAAACJUhACAAAkSkEIAACQKAUhAABA
ohSEAAAAiVIQAgAAJEpBCAAAkCgFIQAAQKIUhAAAAIlSEAIAACRKQQgAAJAoBSEAAECiFIQA
AACJUhACAAAkSkEIAACQKAUhAABAohSEAAAAiVIQAgAAJEpBCACkZX1lf9FNgJLQm0pAQQgA
uXFsBHnRm6A9Ii4IDRNRkKYoSFMUpAkAyF1H0Q0AAGiH3mdV6q9vrc4qqDkQMb2pTBSEANAs
x0ZRqGdkfWW/7ARLb4qC3lQmlWq12vy7nDx58oEHHti8efOhQ4emTp26aNGif/Nv/k3tW9dd
d92OHTt6//DixYs3bNgwUJsqA7Wq35um7IihkaYoSFMUpCkujo2iIE1RkKYoSFObDVwoDU8+
Vwi7uro2bty4cePGT3ziE3v37l28eHFHR8ftt9+eZdnx48fnz5+/du3a+g+PHj26mXU5IREF
aYqCNEVBmgCA1smhIHz//fcfffTRFStW/PEf/3GWZdOnT9+9e/fWrVtrBWFPT8/5558/adKk
5lcEANA851YgL3pTCeRQEJ599tkHDx4cNWpUfckFF1ywZ8+e2uuenp6xY8c2vxYACJ9jI8iL
3gTtkc8toxMnTqy/Pnny5M6dO6+88sral8ePH2/yHtHTMUxEQZqiIE1RkCYAIHf5P4fwrrvu
OnDgwF133VX7sqen59lnn7366qsnTZp0xRVX3HPPPe+++27uKwUAAGCocn7sxN13333fffc9
9thjV1xxRW3J+PHjDx8+fMcdd3R2dj799NMrVqx49dVXv/71r+e7XgAAAIYqz88tvf322x99
9NEtW7bceOONp/uZr33ta8uXLz969Gjvu0wb29SCT1MFAACIWriPnciy7M4779y8efOTTz55
zTXXDPBjH/vYx7IsO3jw4AAFYZZllUqlYYkSEQAASEffmqgV8vkbwr/5m79Zu3bttm3bGqrB
V1555U//9E9feeWV+pLnn39+xIgRnZ2dA79htY9c2gkAABCF9tREOVxzPHny5GWXXfaJT3xi
3bp1vZdPmjTp3Xff/chHPnLBBRc88MADF1544d69e5csWfKFL3zhP/7H/zhQm9wyCgAA8Mta
USjl8I4/+MEPZs+e3Xf566+/PmnSpB/96EddXV179uzp6emZNm3awoULb7vttrPOOmugNikI
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
M+cfRwAAAABJRU5ErkJggg==

--qypklqcxyarzw3us--

