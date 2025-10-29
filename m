Return-Path: <linux-media+bounces-45947-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A87C1BD90
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 16:57:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04359584B5C
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 15:28:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DB6032938C;
	Wed, 29 Oct 2025 15:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DA7kToQa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD412C2369
	for <linux-media@vger.kernel.org>; Wed, 29 Oct 2025 15:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761751714; cv=none; b=u3O5AkU1p8VR+TXwWLFuu/ph3B2bSR1ccn4uZbCcLviBQf4FT4/XcLdWF8yr3AZI35Mc2pXRTy+Hy1dWDwD10MglI3ZaG+F0zXAHSe/xG9dkeO4TL7cHxOKTDoc8Kwapb1/qFNC2QyY/mk+swvFH3uV8A6r1AqAiaVWpyafhx2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761751714; c=relaxed/simple;
	bh=6Hm+Hd/nkAHPoOx4tK1kYN3Dwef4n8ETcUPkX7vlSr0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qTulYOu7cqbCXRvvwj3csJ/Sh1OCBgasEkoRoY/CW5iZdMmAnn4GJ/Ondj04wPy+boVPDbiTGh1Lv9tHWyZ2gu1sw1FScUo5UXpki/IgoJbLi5ey8pziBN0xuNf9/9SWKsnXB1NwCdY5gqBHqCEy9qxXEB/ItHTiVjE1EcrYfgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DA7kToQa; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4711b95226dso93913525e9.0
        for <linux-media@vger.kernel.org>; Wed, 29 Oct 2025 08:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761751710; x=1762356510; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uAa2iN++GVLa2WA7gWYwm1rM5oBGNyICAagxpNn7hGU=;
        b=DA7kToQab1n530SKsrMeiPNtP3XxBioP/KyDQy4g+04PBOf5uJSYXk9PYHAeLWi8y/
         kd+xJKqjFHaPxcROgPJzu6KgvrhzHWQY2lcA53infpDXBI/aJuIoZ4wHpJ2WzBxQmtTG
         ewomDf+Tuo8y6xhm4OtTbTWLBrErR3pkGHcyTNgCzU+WWcr92piTefQSdGxXbpRt5dww
         BYZx7rs6wIOrQwXHraIOhbFvIEyQLr69m9tn6hKWB26DOZFBKCVgF3CPoixmX9USxYKa
         qCFB5khe5DJekicBMBBEqrzX55cGv750p3CRrNxWoMSZE7LskFISWe/BGiJNajpCrLxP
         IwTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761751710; x=1762356510;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uAa2iN++GVLa2WA7gWYwm1rM5oBGNyICAagxpNn7hGU=;
        b=LiBCDrnyBiO14TrhrSDw9sMmAey4mCRIdxUNZeTEWzMU72i+t96z1ByhugTRNyHAtj
         tIh47bVklEmpo2+cOSvrihcr2FSUnQ13YUJhJfPjaFJXLVHQwCZbtSx4E/bPxMHy3qyP
         1viU6fXZJoCTHU7NCQLcXo6anbO6EwKlh/Byl4Ui8SqXpYNSsMCb97Y9SSAWxdYU0FeI
         WmxYtyEqoGutGxEHwikTTMN90F8FjiSMZoX8spGBcYBqPtx560Wwy6+kPaTbt0GdDZRT
         HmInbY3N33pBHlkbFgRwFmZohohLQyX0Ekat3fHvUSmOlWzjrQQhyFKEsz5TvH/L1uF5
         aGsw==
X-Forwarded-Encrypted: i=1; AJvYcCVIpPeAtwc8pzbDkJw/QOaE9qXj2L2QjKVmwbSGH9YH40n67cL6njGX21MFSU4osYrpOb5Dx4PTX2y/dw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyzIRaYkmTgwrqcK7NjIoi4loG9IakWP9raRbHVEeaVNkQxPuf
	vFCX4atMQ/heNYrtT+SPxomOy8IDeXKk2GMhSUk61gnpwIhpr6d0rjsHAPj/f1WYRktSZoYwVfA
	ACDbwH+VBvdEbO25wWHZK1ZZqvOOiUm4=
X-Gm-Gg: ASbGncvKWx0yGJI7STKM3hjmCzpnHXyGc6bqhAbVpMATTI16p9Tnetv0bIKtK1MbhaU
	6V0VyMlnLhdnwrVy/H+epinm3ivpPZYZyM0SJxTOPwj+tuxrX+vHXpYZvMTBUFZYe6D1mHsuNLs
	7exu98SgYaX9qOCaPo9Jrawcmev0jJ926JkQS/ttddr6aTVpQYkqf+jAT8ZAJzZNnlyxd9rURz6
	+RW2RA514MfeUupwcqAHExdoQopgqqBsHcxdsASbiNNwl2iE257vhinpOzTUg==
X-Google-Smtp-Source: AGHT+IH1zBZWoldEPqc/7dF8gU0sc+s+CQcWpZTQ6Eapg8ae35jl//2FDLZqj+1mzGvPiKN0e9dt/yrrxzYfmNxHiro=
X-Received: by 2002:a05:600c:314b:b0:470:ffd1:782d with SMTP id
 5b1f17b1804b1-4771e38c52amr30276505e9.6.1761751709767; Wed, 29 Oct 2025
 08:28:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251028092200.7003-1-clamor95@gmail.com> <20251028092200.7003-3-clamor95@gmail.com>
 <aQEEUpgW8nmZ3ZCl@kekkonen.localdomain> <CAPVz0n2SuOcoDn4KZ_zb4NCuaes6nppHRgffWC4yTHmOsbe1vw@mail.gmail.com>
 <PN3P287MB18291BB4CCC68C8BA1260A628BFAA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
In-Reply-To: <PN3P287MB18291BB4CCC68C8BA1260A628BFAA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 29 Oct 2025 17:28:18 +0200
X-Gm-Features: AWmQ_bn0PZP9NrAdcAOezLD6aP13tRMaVybdb8dsVq-Iv6QDXYQVXnIfXlTohL8
Message-ID: <CAPVz0n2ELC-Lc7-kO5DV-8pabBueMnXe3YY9-k+zoaxracASKQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2 RESEND] media: i2c: add Sony IMX111 CMOS camera
 sensor driver
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede <hansg@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dongcheng Yan <dongcheng.yan@intel.com>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 29 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 17:1=
9 Tarang Raval <tarang.raval@siliconsignals.io> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslav,
>
> > > On Tue, Oct 28, 2025 at 11:22:00AM +0200, Svyatoslav Ryhel wrote:
> > > > Add a v4l2 sub-device driver for the Sony IMX111 image sensor. This=
 is a
> > > > camera sensor using the i2c bus for control and the csi-2 bus for d=
ata.
> > > >
> > > > The following features are supported:
> > > > - manual exposure, digital and analog gain control support
> > > > - pixel rate/link freq control support
> > > > - supported resolution up to 3280x2464 for single shot capture
> > > > - supported resolution up to 1920x1080 @ 30fps for video
> > > > - supported bayer order output SGBRG10 and SGBRG8
> > > >
> > > > Camera module seems to be partially compatible with Nokia SMIA but =
it
> > > > lacks a few registers required for clock calculations and has diffe=
rent
> > > > vendor-specific per-mode configurations which makes it incompatible=
 with
> > > > existing CCS driver.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
>
> ...
>
> > > > +#include <linux/clk.h>
> > > > +#include <linux/delay.h>
> > > > +#include <linux/gpio/consumer.h>
> > > > +#include <linux/i2c.h>
> > > > +#include <linux/kernel.h>
> > > > +#include <linux/media.h>
> > > > +#include <linux/module.h>
> > > > +#include <linux/pm_runtime.h>
> > > > +#include <linux/ratelimit.h>
> > > > +#include <linux/regmap.h>
> > > > +#include <linux/regulator/consumer.h>
> > > > +#include <linux/slab.h>
> > > > +#include <linux/string.h>
> > > > +#include <linux/types.h>
> > > > +#include <linux/videodev2.h>
> > > > +#include <linux/units.h>
> > > > +
> > > > +#include <media/media-entity.h>
> > > > +#include <media/v4l2-async.h>
> > > > +#include <media/v4l2-cci.h>
> > > > +#include <media/v4l2-ctrls.h>
> > > > +#include <media/v4l2-device.h>
> > > > +#include <media/v4l2-fwnode.h>
> > > > +#include <media/v4l2-event.h>
> > > > +#include <media/v4l2-image-sizes.h>
> > > > +#include <media/v4l2-subdev.h>
> > > > +#include <media/v4l2-mediabus.h>
>
> A few of those headers seem to be unused and can be removed
>
> Like:
>
> #include <linux/ratelimit.h>
> #include <linux/slab.h>
> #include <linux/string.h>
> #include <media/v4l2-event.h>
> #include <media/v4l2-image-sizes.h>
>
> ...
>
> > > > +/* product information registers */
> > > > +#define IMX111_PRODUCT_ID                    CCI_REG16(0x0000)
> > > > +#define   IMX111_CHIP_ID                     0x111
> > > > +#define IMX111_REVISION                              CCI_REG8(0x00=
02)
> > > > +#define IMX111_MANUFACTURER_ID                       CCI_REG8(0x00=
03)
> > > > +#define IMX111_SMIA_VER                              CCI_REG8(0x00=
04)
> > > > +#define IMX111_FRAME_COUNTER                 CCI_REG8(0x0005)
> > > > +#define IMX111_PIXEL_ORDER                   CCI_REG8(0x0006)
> > > > +
> > > > +/* general configuration registers */
> > > > +#define IMX111_STREAMING_MODE                        CCI_REG8(0x01=
00)
> > > > +#define   IMX111_MODE_STANDBY                        0
> > > > +#define   IMX111_MODE_STREAMING                      1
> > > > +#define IMX111_IMAGE_ORIENTATION             CCI_REG8(0x0101)
> > > > +#define   IMX111_IMAGE_HFLIP                 BIT(0)
> > > > +#define   IMX111_IMAGE_VFLIP                 BIT(1)
> > > > +#define IMX111_SOFTWARE_RESET                        CCI_REG8(0x01=
03)
> > > > +#define   IMX111_RESET_ON                    1
> > > > +#define IMX111_GROUP_WRITE                   CCI_REG8(0x0104)
> > > > +#define   IMX111_GROUP_WRITE_ON                      1
> > > > +#define IMX111_FRAME_DROP                    CCI_REG8(0x0105)
> > > > +#define   IMX111_FRAME_DROP_ON                       1
> > > > +#define IMX111_CHANNEL_ID                    CCI_REG8(0x0110)
> > > > +#define IMX111_SIGNALLING_MODE                       CCI_REG8(0x01=
11)
> > > > +#define IMX111_DATA_DEPTH                    CCI_REG16(0x0112)
> > > > +#define   IMX111_DATA_DEPTH_RAW8             0x08
> > > > +#define   IMX111_DATA_DEPTH_RAW10            0x0a
> > > > +
> > > > +/* integration time registers */
> > > > +#define IMX111_INTEGRATION_TIME                      CCI_REG16(0x0=
202)
> > > > +#define IMX111_INTEGRATION_TIME_MIN          0x1
> > > > +#define IMX111_INTEGRATION_TIME_MAX          0xffff
> > > > +#define IMX111_INTEGRATION_TIME_STEP         1
> > > > +
> > > > +/* analog gain control */
> > > > +#define IMX111_REG_ANALOG_GAIN                       CCI_REG8(0x02=
05)
> > > > +#define IMX111_ANA_GAIN_MIN                  0
> > > > +#define IMX111_ANA_GAIN_MAX                  240
> > > > +#define IMX111_ANA_GAIN_STEP                 1
> > > > +#define IMX111_ANA_GAIN_DEFAULT                      0
> > > > +
> > > > +/* digital gain control */
> > > > +#define IMX111_REG_DIG_GAIN_GREENR           CCI_REG16(0x020e)
> > > > +#define IMX111_REG_DIG_GAIN_RED                      CCI_REG16(0x0=
210)
> > > > +#define IMX111_REG_DIG_GAIN_BLUE             CCI_REG16(0x0212)
> > > > +#define IMX111_REG_DIG_GAIN_GREENB           CCI_REG16(0x0214)
> > > > +#define IMX111_DGTL_GAIN_MIN                 0x0100
> > > > +#define IMX111_DGTL_GAIN_MAX                 0x0fff
> > > > +#define IMX111_DGTL_GAIN_DEFAULT             0x0100
> > > > +#define IMX111_DGTL_GAIN_STEP                        1
> > > > +
> > > > +/* clock configuration registers */
> > > > +#define IMX111_PIXEL_CLK_DIVIDER_PLL1                CCI_REG8(0x03=
01) /* fixed to 10 */
> > > > +#define IMX111_SYSTEM_CLK_DIVIDER_PLL1               CCI_REG8(0x03=
03) /* fixed to 1 */
> > > > +#define IMX111_PRE_PLL_CLK_DIVIDER_PLL1              CCI_REG8(0x03=
05)
> > > > +#define IMX111_PLL_MULTIPLIER_PLL1           CCI_REG8(0x0307)
> > > > +#define IMX111_PLL_SETTLING_TIME             CCI_REG8(0x303c)
> > > > +#define   IMX111_PLL_SETTLING_TIME_DEFAULT   200
> > > > +#define IMX111_POST_DIVIDER                  CCI_REG8(0x30a4)
> > > > +#define   IMX111_POST_DIVIDER_DIV1           2
> > > > +#define   IMX111_POST_DIVIDER_DIV2           0
> > > > +#define   IMX111_POST_DIVIDER_DIV4           1
> > > > +
> > > > +/* frame timing registers */
> > > > +#define IMX111_VERTICAL_TOTAL_LENGTH         CCI_REG16(0x0340)
> > > > +#define IMX111_HORIZONTAL_TOTAL_LENGTH               CCI_REG16(0x0=
342)
> > > > +
> > > > +/* image size registers */
> > > > +#define IMX111_HORIZONTAL_START                      CCI_REG16(0x0=
344)
> > > > +#define IMX111_VERTICAL_START                        CCI_REG16(0x0=
346)
> > > > +#define IMX111_HORIZONTAL_END                        CCI_REG16(0x0=
348)
> > > > +#define IMX111_VERTICAL_END                  CCI_REG16(0x034a)
> > > > +#define IMX111_IMAGE_WIDTH                   CCI_REG16(0x034c)
> > > > +#define IMX111_IMAGE_HEIGHT                  CCI_REG16(0x034e)
>
> In the mode register settings, you can use the above macros.
>
> > > > +static const struct cci_reg_sequence mode_820x614[] =3D {
> > > > +     { CCI_REG8(0x0340), 0x04 },     { CCI_REG8(0x0341), 0xec },
> > > > +     { CCI_REG8(0x0342), 0x0d },     { CCI_REG8(0x0343), 0xd0 },
> > > > +     { CCI_REG8(0x0344), 0x00 },     { CCI_REG8(0x0345), 0x08 },
> > > > +     { CCI_REG8(0x0346), 0x00 },     { CCI_REG8(0x0347), 0x34 },
> > > > +     { CCI_REG8(0x0348), 0x0c },     { CCI_REG8(0x0349), 0xd7 },
> > > > +     { CCI_REG8(0x034a), 0x09 },     { CCI_REG8(0x034b), 0xcb },
> > > > +     { CCI_REG8(0x034c), 0x03 },     { CCI_REG8(0x034d), 0x34 },
> > > > +     { CCI_REG8(0x034e), 0x02 },     { CCI_REG8(0x034f), 0x66 },
>
> Here, you can use those macros.
>
> Likewise, in every mode.
>

This is not as simple as a substitution, imx111 requires group write
in order to write 16bit values to registers. I will see what I can do
about this.

> > > > +     { CCI_REG8(0x0381), 0x05 },     { CCI_REG8(0x0383), 0x03 },
> > > > +     { CCI_REG8(0x0385), 0x05 },     { CCI_REG8(0x0387), 0x03 },
> > > > +     { CCI_REG8(0x3033), 0x00 },     { CCI_REG8(0x303d), 0x10 },
> > > > +     { CCI_REG8(0x303e), 0x40 },     { CCI_REG8(0x3040), 0x08 },
> > > > +     { CCI_REG8(0x3041), 0x97 },     { CCI_REG8(0x3048), 0x01 },
> > > > +     { CCI_REG8(0x304c), 0x6f },     { CCI_REG8(0x304d), 0x03 },
> > > > +     { CCI_REG8(0x3064), 0x12 },     { CCI_REG8(0x3073), 0x00 },
> > > > +     { CCI_REG8(0x3074), 0x11 },     { CCI_REG8(0x3075), 0x11 },
> > > > +     { CCI_REG8(0x3076), 0x11 },     { CCI_REG8(0x3077), 0x11 },
> > > > +     { CCI_REG8(0x3079), 0x00 },     { CCI_REG8(0x307a), 0x00 },
> > > > +     { CCI_REG8(0x309b), 0x28 },     { CCI_REG8(0x309c), 0x13 },
> > > > +     { CCI_REG8(0x309e), 0x00 },     { CCI_REG8(0x30a0), 0x14 },
> > > > +     { CCI_REG8(0x30a1), 0x09 },     { CCI_REG8(0x30aa), 0x03 },
> > > > +     { CCI_REG8(0x30b2), 0x03 },     { CCI_REG8(0x30d5), 0x09 },
> > > > +     { CCI_REG8(0x30d6), 0x00 },     { CCI_REG8(0x30d7), 0x00 },
> > > > +     { CCI_REG8(0x30d8), 0x00 },     { CCI_REG8(0x30d9), 0x00 },
> > > > +     { CCI_REG8(0x30de), 0x04 },     { CCI_REG8(0x30df), 0x20 },
> > > > +     { CCI_REG8(0x3102), 0x08 },     { CCI_REG8(0x3103), 0x22 },
> > > > +     { CCI_REG8(0x3104), 0x20 },     { CCI_REG8(0x3105), 0x00 },
> > > > +     { CCI_REG8(0x3106), 0x87 },     { CCI_REG8(0x3107), 0x00 },
> > > > +     { CCI_REG8(0x3108), 0x03 },     { CCI_REG8(0x3109), 0x02 },
> > > > +     { CCI_REG8(0x310a), 0x03 },     { CCI_REG8(0x315c), 0x9c },
> > > > +     { CCI_REG8(0x315d), 0x9b },     { CCI_REG8(0x316e), 0x9d },
> > > > +     { CCI_REG8(0x316f), 0x9c },     { CCI_REG8(0x3318), 0x7a },
> > > > +     { CCI_REG8(0x3348), 0xe0 },
> > > > +};
>
> ...
>
> > > > +static int imx111_init_controls(struct imx111 *sensor)
> > > > +{
> > > > +     const struct v4l2_ctrl_ops *ops =3D &imx111_ctrl_ops;
> > > > +     struct device *dev =3D regmap_get_device(sensor->regmap);
> > > > +     struct v4l2_fwnode_device_properties props;
> > > > +     struct v4l2_subdev *sd =3D &sensor->sd;
> > > > +     struct v4l2_ctrl_handler *hdl =3D &sensor->hdl;
> > > > +     s64 pixel_rate_min, pixel_rate_max;
> > > > +     int i, ret;
> > > > +
> > > > +     ret =3D v4l2_fwnode_device_parse(dev, &props);
> > > > +     if (ret < 0)
> > > > +             return ret;
> > > > +
> > > > +     ret =3D v4l2_ctrl_handler_init(hdl, 13);
> > > > +     if (ret)
> > > > +             return ret;
> > > > +
> > > > +     pixel_rate_min =3D div_u64(sensor->pixel_clk_raw, 2 * IMX111_=
DATA_DEPTH_RAW10);
> > > > +     pixel_rate_max =3D div_u64(sensor->pixel_clk_raw, 2 * IMX111_=
DATA_DEPTH_RAW8);
> > > > +     sensor->pixel_rate =3D v4l2_ctrl_new_std(hdl, NULL, V4L2_CID_=
PIXEL_RATE,
> > > > +                                            pixel_rate_min, pixel_=
rate_max,
> > > > +                                            1, div_u64(sensor->pix=
el_clk_raw,
> > > > +                                            2 * sensor->data_depth=
));
> > > > +
> > > > +     sensor->link_freq =3D v4l2_ctrl_new_int_menu(hdl, NULL, V4L2_=
CID_LINK_FREQ,
> > > > +                                                0, 0, &sensor->def=
ault_link_freq);
> > > > +     if (sensor->link_freq)
> > > > +             sensor->link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ONL=
Y;
> > > > +
> > > > +     v4l2_ctrl_new_std(hdl, ops, V4L2_CID_ANALOGUE_GAIN,
> > > > +                       IMX111_ANA_GAIN_MIN, IMX111_ANA_GAIN_MAX,
> > > > +                       IMX111_ANA_GAIN_STEP, IMX111_ANA_GAIN_DEFAU=
LT);
> > > > +
> > > > +     v4l2_ctrl_new_std(hdl, ops, V4L2_CID_DIGITAL_GAIN,
> > > > +                       IMX111_DGTL_GAIN_MIN, IMX111_DGTL_GAIN_MAX,
> > > > +                       IMX111_DGTL_GAIN_STEP, IMX111_DGTL_GAIN_DEF=
AULT);
> > > > +
> > > > +     sensor->hflip =3D v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HFLIP,=
 0, 1, 1, 0);
> > > > +     if (sensor->hflip)
> > > > +             sensor->hflip->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOU=
T;
> > > > +
> > > > +     sensor->vflip =3D v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VFLIP,=
 0, 1, 1, 0);
> > > > +     if (sensor->vflip)
> > > > +             sensor->vflip->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOU=
T;
> > >
> > > Could you also add VBLANK and HBLANK controls, please?
> > >
> >
> > I may try to, but since no datasheet is available, my suggestion may
> > be quite arbitrary. In this iteration v/hblank are considered to be 0.
>
> The registers IMX111_VERTICAL_TOTAL_LENGTH and IMX111_HORIZONTAL_TOTAL_LE=
NGTH
> are used to set the vertical and horizontal total lengths in every mode.
> I believe you can use these registers to implement VBLANK and HBLANK.
>

This is what I am currently trying to implement

> You can find the appropriate values for these from the mode register sett=
ings.
>
> Best Regards,
> Tarang

