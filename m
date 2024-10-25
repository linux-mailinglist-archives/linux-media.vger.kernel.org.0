Return-Path: <linux-media+bounces-20314-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A80F9B034A
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 15:00:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8EAB2814CC
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 13:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C92CE206501;
	Fri, 25 Oct 2024 12:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Iwsac/fE"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA8C7081D
	for <linux-media@vger.kernel.org>; Fri, 25 Oct 2024 12:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729861187; cv=none; b=Js45ILvNIZgeMBuiopBmp2euZCZ0+mJvxL4r4lTiPPb8aWJYn/SHFd//k4+TMklHdFPlTbyDUgYYrkPtzsszZ+FShtEC4ElD6d2+0f61YIbcn12D702QV70HkrpBEPr4AcaSk1VJAFyvak+ZhaXNfMkfP/fFkHikGy3QYMkUzaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729861187; c=relaxed/simple;
	bh=zTpnS1yUfQswYu5oTY4YiKuuLousXYbnmOsVy83on0g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A0gEQ3RU6ampPnbRo/LaugeUcDn/gcbnFG+tBRuGGdluetqM0lYuUzMqj/PvpGZ3gEOdHj9SdvO+kmA9sP3Qh2pBXh88S87sEU7BUrMFI5eA8q48JLIyUaE6j9Y84xucNBuMOlfZAtzr+JXNEV3MdBFDUH+9cwCDl4hxv8uVN9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Iwsac/fE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729861179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CU62u7LsLbtxgk0XIO+hviO58APwew5XdrmaQ4ishBU=;
	b=Iwsac/fEa8DgffOHMMVkVaVIWyZHceAhgBlIIq7Qt1GyoRzjy97DFoIA6bX6RN1RHH0okO
	/KnIklxlKtWe+jfMz2fkS1SHNF/HvurRRcqsrYxvTmn58bJR+sN4q6aVePn/Z60S7f6AGo
	Sy6gGC52GJyLPaEGcB68uoJOCVeaWOk=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-lTZu7Es8NA6df6QzHisq6A-1; Fri, 25 Oct 2024 08:59:38 -0400
X-MC-Unique: lTZu7Es8NA6df6QzHisq6A-1
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-6e31d9c8efcso36884787b3.0
        for <linux-media@vger.kernel.org>; Fri, 25 Oct 2024 05:59:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729861177; x=1730465977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CU62u7LsLbtxgk0XIO+hviO58APwew5XdrmaQ4ishBU=;
        b=vtYydxZYXRoDdFJtlYXmT9Y8vq08j2aqTjReCKiRXMNp6YmP8aFBRzhaYy0Om6eVvd
         CbaIGAyFZuRFPd4SQSYXap96d7bWYu1iveHjJv7J6E6U81Xf4W+fZhlAoSGgu+hsMEw/
         b67tt6/vw+a1Dp2A65uetYnmR8rOSuiWQrqfS7fTqQly9xK/VPVXdoPFYoSzaORYvdeA
         qrPudP/UFpH2cfmho7CZJzb5mMj/6jt3JNjB1hT9cvtQZ61q0Ifh1VQpSNHmthpvDwC9
         HrH3CD5U7ybR38uJ2VXNmJC2E4I/BZXN9rZ1kPOumVGgL7XL3ka0I2QjAzUfPbh/61/W
         ipiA==
X-Forwarded-Encrypted: i=1; AJvYcCUjc/HNqrBhU71yUrHEYXvBM+ppBC5AAt3Q1qKNOnvt8r04u3+GzfviAe33UfpJhfN5mZCuB02pAk/5BQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBZsyDSpK95Xtdp5+LRWIrvzwmpLbwbD3SBF6/Gwzd+HfTWHTi
	8sd+903cC9DE8InDzhfwkK+PPPYOdZ2tXrOFWJSs8na2OsMlsLnkqcSQG5QRfvWeEE0IFopBi/F
	P8J52231vM4DB5eOmqXoE0LIJ4ixiHcmXMfhvdnaVQFzhhPibhsSyZ0tdaLmoM9N5M6UDMypPal
	w5SVmnI+CSswMqQS/wmMbMZXGVN70L6Dki1HM=
X-Received: by 2002:a05:690c:fc6:b0:6e7:e76e:5852 with SMTP id 00721157ae682-6e7f0fa4112mr116567757b3.32.1729861177063;
        Fri, 25 Oct 2024 05:59:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrofGde9N4jL56oU91Hr0unyaewUKBgPlkSMWIcLI+2xc63UXS7kAMCv9gUkJCAUAnTgq3kU3pSlhuYUft6Bc=
X-Received: by 2002:a05:690c:fc6:b0:6e7:e76e:5852 with SMTP id
 00721157ae682-6e7f0fa4112mr116567457b3.32.1729861176444; Fri, 25 Oct 2024
 05:59:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241017062347.60966-1-hpa@redhat.com> <f39fe6cb-a210-4169-83a7-3b2ee7007851@redhat.com>
In-Reply-To: <f39fe6cb-a210-4169-83a7-3b2ee7007851@redhat.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Fri, 25 Oct 2024 20:59:24 +0800
Message-ID: <CAEth8oEjWeK53dFYb_nF3Z=U0V08+MbRH8meAsfUrW-0KPNpbQ@mail.gmail.com>
Subject: Re: [PATCH v5] media: Add t4ka3 camera sensor driver
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Tue, Oct 22, 2024 at 9:32=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Hi Kate,
>
> Thank you for helping me clean this up and submitting it upstream.
>
> Some review comments inline / below.
>
> On 17-Oct-24 8:23 AM, Kate Hsuan wrote:
> > Add the t4ka3 driver from:
> > https://github.com/kitakar5525/surface3-atomisp-cameras.git
> >
> > With many cleanups / changes (almost a full rewrite) to make it suitabl=
e
> > for upstream:
> >
> > * Remove the VCM and VCM-OTP support, the mainline kernel models VCMs a=
nd
> >   calibration data eeproms as separate v4l2-subdev-s.
> >
> > * Remove the integration-factor t4ka3_get_intg_factor() support and IOC=
TL,
> >   this provided info to userspace through an atomisp private IOCTL.
> >
> > * Turn atomisp specific exposure/gain IOCTL into standard v4l2 controls=
.
> >
> > * Use normal ACPI power-management in combination with runtime-pm suppo=
rt
> >   instead of atomisp specific GMIN power-management code.
> >
> > * Turn into a standard V4L2 sensor driver using
> >   v4l2_async_register_subdev_sensor().
> >
> > * Add vblank, hblank, and link-freq controls; drop get_frame_interval()=
.
> >
> > * Use CCI register helpers.
> >
> > * Calculate values for modes instead of using fixed register-value list=
s,
> >   allowing arbritrary modes.
> >
> > * Add get_selection() and set_selection() support
> >
> > * Add a CSI2 bus configuration check
> >
> > This been tested on a Xiaomi Mipad2 tablet which has a T4KA3 sensor wit=
h
> > DW9761 VCM as back sensor.
> >
> > Co-developed-by: Hans de Goede <hdegoede@redhat.com>
> > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > Signed-off-by: Kate Hsuan <hpa@redhat.com>
> > ---
> > Changes in v5:
> > 1. Improved Kconfig help description.
> >
> > Changes in v4:
> > 1. Another CI issue fixes.
> >
> > Changes in v3:
> > 1. Fix the issues reported by the CI system.
> >
> > Changes in v2:
> > 1. The regmap information was obtained before configuring runtime PM so
> >    probe() can return without disabling runtime PM.
> > 2. In t4ka3_s_stream(), return -EBUSY when the streaming is enabled.
> > ---
> >  drivers/media/i2c/Kconfig  |   12 +
> >  drivers/media/i2c/Makefile |    1 +
> >  drivers/media/i2c/t4ka3.c  | 1120 ++++++++++++++++++++++++++++++++++++
> >  3 files changed, 1133 insertions(+)
> >  create mode 100644 drivers/media/i2c/t4ka3.c
> >
> > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > index 8ba096b8ebca..6ec51f969b32 100644
> > --- a/drivers/media/i2c/Kconfig
> > +++ b/drivers/media/i2c/Kconfig
> > @@ -690,6 +690,18 @@ config VIDEO_S5K6A3
> >         This is a V4L2 sensor driver for Samsung S5K6A3 raw
> >         camera sensor.
> >
> > +config VIDEO_T4KA3
> > +     tristate "Toshiba T4KA3 sensor support"
> > +     depends on ACPI || COMPILE_TEST
> > +     depends on GPIOLIB
> > +     select V4L2_CCI_I2C
> > +     help
> > +       This is a Video4Linux2 sensor driver for the Toshiba T4KA3 8 MP
> > +       camera sensor.
> > +
> > +       To compile this driver as a module, choose M here: the
> > +       module will be called t4ka3.
> > +
> >  config VIDEO_VGXY61
> >       tristate "ST VGXY61 sensor support"
> >       select V4L2_CCI_I2C
> > diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> > index fbb988bd067a..ad67ea33ce37 100644
> > --- a/drivers/media/i2c/Makefile
> > +++ b/drivers/media/i2c/Makefile
> > @@ -129,6 +129,7 @@ obj-$(CONFIG_VIDEO_SAA717X) +=3D saa717x.o
> >  obj-$(CONFIG_VIDEO_SAA7185) +=3D saa7185.o
> >  obj-$(CONFIG_VIDEO_SONY_BTF_MPX) +=3D sony-btf-mpx.o
> >  obj-$(CONFIG_VIDEO_ST_MIPID02) +=3D st-mipid02.o
> > +obj-$(CONFIG_VIDEO_T4KA3) +=3D t4ka3.o
> >  obj-$(CONFIG_VIDEO_TC358743) +=3D tc358743.o
> >  obj-$(CONFIG_VIDEO_TC358746) +=3D tc358746.o
> >  obj-$(CONFIG_VIDEO_TDA1997X) +=3D tda1997x.o
> > diff --git a/drivers/media/i2c/t4ka3.c b/drivers/media/i2c/t4ka3.c
> > new file mode 100644
> > index 000000000000..f62920e93430
> > --- /dev/null
> > +++ b/drivers/media/i2c/t4ka3.c
> > @@ -0,0 +1,1120 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Support for T4KA3 8M camera sensor.
> > + *
> > + * Copyright (C) 2015 Intel Corporation. All Rights Reserved.
> > + * Copyright (C) 2016 XiaoMi, Inc.
> > + * Copyright (C) 2024 Hans de Goede <hansg@kernel.org>
> > + */
> > +
> > +#include <linux/acpi.h>
> > +#include <linux/bits.h>
> > +#include <linux/delay.h>
> > +#include <linux/dev_printk.h>
> > +#include <linux/device.h>
> > +#include <linux/err.h>
> > +#include <linux/errno.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/i2c.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/mutex.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/regmap.h>
> > +#include <linux/types.h>
> > +
> > +#include <media/media-entity.h>
> > +#include <media/v4l2-async.h>
> > +#include <media/v4l2-cci.h>
> > +#include <media/v4l2-common.h>
> > +#include <media/v4l2-ctrls.h>
> > +#include <media/v4l2-fwnode.h>
> > +#include <media/v4l2-subdev.h>
> > +
> > +#define T4KA3_NATIVE_WIDTH                   3280
> > +#define T4KA3_NATIVE_HEIGHT                  2464
> > +#define T4KA3_NATIVE_START_LEFT                      0
> > +#define T4KA3_NATIVE_START_TOP                       0
> > +#define T4KA3_ACTIVE_WIDTH                   3280
> > +#define T4KA3_ACTIVE_HEIGHT                  2460
> > +#define T4KA3_ACTIVE_START_LEFT                      0
> > +#define T4KA3_ACTIVE_START_TOP                       2
> > +#define T4KA3_MIN_CROP_WIDTH                 2
> > +#define T4KA3_MIN_CROP_HEIGHT                        2
> > +
> > +#define T4KA3_PIXELS_PER_LINE                        3440
> > +#define T4KA3_LINES_PER_FRAME_30FPS          2492
> > +#define T4KA3_FPS                            30
> > +#define T4KA3_PIXEL_RATE \
> > +     (T4KA3_PIXELS_PER_LINE * T4KA3_LINES_PER_FRAME_30FPS * T4KA3_FPS)
> > +
> > +/*
> > + * TODO this really should be derived from the 19.2 MHz xvclk combined
> > + * with the PLL settings. But without a datasheet this is the closest
> > + * approximation possible.
> > + *
> > + * link-freq =3D pixel_rate * bpp / (lanes * 2)
> > + * (lanes * 2) because CSI lanes use double-data-rate (DDR) signalling=
.
> > + * bpp =3D 10 and lanes =3D 4
> > + */
> > +#define T4KA3_LINK_FREQ                              ((u64)T4KA3_PIXEL=
_RATE * 10 / 8)
> > +
> > +/* For enum_frame_size() full-size + binned-/quarter-size */
> > +#define T4KA3_FRAME_SIZES                    2
> > +
> > +#define T4KA3_REG_PRODUCT_ID_HIGH            CCI_REG8(0x0000)
> > +#define T4KA3_REG_PRODUCT_ID_LOW             CCI_REG8(0x0001)
> > +#define T4KA3_PRODUCT_ID                     0x1490
> > +
> > +#define T4KA3_REG_STREAM                     CCI_REG8(0x0100)
> > +#define T4KA3_REG_IMG_ORIENTATION            CCI_REG8(0x0101)
> > +#define T4KA3_HFLIP_BIT                              BIT(0)
> > +#define T4KA3_VFLIP_BIT                              BIT(1)
> > +#define T4KA3_REG_PARAM_HOLD                 CCI_REG8(0x0104)
> > +#define T4KA3_REG_COARSE_INTEGRATION_TIME    CCI_REG16(0x0202)
> > +#define T4KA3_COARSE_INTEGRATION_TIME_MARGIN 6
> > +#define T4KA3_REG_DIGGAIN_GREEN_R            CCI_REG16(0x020e)
> > +#define T4KA3_REG_DIGGAIN_RED                        CCI_REG16(0x0210)
> > +#define T4KA3_REG_DIGGAIN_BLUE                       CCI_REG16(0x0212)
> > +#define T4KA3_REG_DIGGAIN_GREEN_B            CCI_REG16(0x0214)
> > +#define T4KA3_REG_GLOBAL_GAIN                        CCI_REG16(0x0234)
> > +#define T4KA3_MIN_GLOBAL_GAIN_SUPPORTED              0x0080
> > +#define T4KA3_MAX_GLOBAL_GAIN_SUPPORTED              0x07ff
> > +#define T4KA3_REG_FRAME_LENGTH_LINES         CCI_REG16(0x0340) /* aka =
VTS */
> > +/* FIXME: need a datasheet to verify the min + max vblank values */
> > +#define T4KA3_MIN_VBLANK                     4
> > +#define T4KA3_MAX_VBLANK                     0xffff
> > +#define T4KA3_REG_PIXELS_PER_LINE            CCI_REG16(0x0342) /* aka =
HTS */
> > +/* These 2 being horz/vert start is a guess (no datasheet), always 0 *=
/
> > +#define T4KA3_REG_HORZ_START                 CCI_REG16(0x0344)
> > +#define T4KA3_REG_VERT_START                 CCI_REG16(0x0346)
> > +/* Always 3279 (T4KA3_NATIVE_WIDTH - 1, window is used to crop */
> > +#define T4KA3_REG_HORZ_END                   CCI_REG16(0x0348)
> > +/* Always 2463 (T4KA3_NATIVE_HEIGHT - 1, window is used to crop */
> > +#define T4KA3_REG_VERT_END                   CCI_REG16(0x034a)
> > +/* Output size (after cropping/window) */
> > +#define T4KA3_REG_HORZ_OUTPUT_SIZE           CCI_REG16(0x034c)
> > +#define T4KA3_REG_VERT_OUTPUT_SIZE           CCI_REG16(0x034e)
> > +/* Window/crop start + size *after* binning */
> > +#define T4KA3_REG_WIN_START_X                        CCI_REG16(0x0408)
> > +#define T4KA3_REG_WIN_START_Y                        CCI_REG16(0x040a)
> > +#define T4KA3_REG_WIN_WIDTH                  CCI_REG16(0x040c)
> > +#define T4KA3_REG_WIN_HEIGHT                 CCI_REG16(0x040e)
> > +#define T4KA3_REG_TEST_PATTERN_MODE          CCI_REG8(0x0601)
> > +/* Unknown register at address 0x0900 */
> > +#define T4KA3_REG_0900                               CCI_REG8(0x0900)
> > +#define T4KA3_REG_BINNING                    CCI_REG8(0x0901)
> > +#define T4KA3_BINNING_VAL(_b) \
> > +     ({ typeof(_b) (b) =3D (_b); \
> > +     ((b) << 4) | (b); })
> > +
> > +struct t4ka3_ctrls {
> > +     struct v4l2_ctrl_handler handler;
> > +     struct v4l2_ctrl *hflip;
> > +     struct v4l2_ctrl *vflip;
> > +     struct v4l2_ctrl *vblank;
> > +     struct v4l2_ctrl *hblank;
> > +     struct v4l2_ctrl *exposure;
> > +     struct v4l2_ctrl *test_pattern;
> > +     struct v4l2_ctrl *link_freq;
> > +     struct v4l2_ctrl *gain;
> > +};
> > +
> > +struct t4ka3_mode {
> > +     struct v4l2_rect                crop;
> > +     struct v4l2_mbus_framefmt       fmt;
> > +     int                             binning;
> > +     u16                             win_x;
> > +     u16                             win_y;
> > +};
> > +
> > +struct t4ka3_data {
> > +     struct v4l2_subdev sd;
> > +     struct media_pad pad;
> > +     struct mutex lock; /* serialize sensor's ioctl */
> > +     struct t4ka3_ctrls ctrls;
> > +     struct t4ka3_mode mode;
> > +     struct device *dev;
> > +     struct regmap *regmap;
> > +     struct gpio_desc *powerdown_gpio;
> > +     struct gpio_desc *reset_gpio;
> > +     s64 link_freq[1];
> > +     int streaming;
> > +};
> > +
> > +/* init settings */
> > +static const struct cci_reg_sequence t4ka3_init_config[] =3D {
> > +     {CCI_REG8(0x4136), 0x13},
> > +     {CCI_REG8(0x4137), 0x33},
> > +     {CCI_REG8(0x3094), 0x01},
> > +     {CCI_REG8(0x0233), 0x01},
> > +     {CCI_REG8(0x4B06), 0x01},
> > +     {CCI_REG8(0x4B07), 0x01},
> > +     {CCI_REG8(0x3028), 0x01},
> > +     {CCI_REG8(0x3032), 0x14},
> > +     {CCI_REG8(0x305C), 0x0C},
> > +     {CCI_REG8(0x306D), 0x0A},
> > +     {CCI_REG8(0x3071), 0xFA},
> > +     {CCI_REG8(0x307E), 0x0A},
> > +     {CCI_REG8(0x307F), 0xFC},
> > +     {CCI_REG8(0x3091), 0x04},
> > +     {CCI_REG8(0x3092), 0x60},
> > +     {CCI_REG8(0x3096), 0xC0},
> > +     {CCI_REG8(0x3100), 0x07},
> > +     {CCI_REG8(0x3101), 0x4C},
> > +     {CCI_REG8(0x3118), 0xCC},
> > +     {CCI_REG8(0x3139), 0x06},
> > +     {CCI_REG8(0x313A), 0x06},
> > +     {CCI_REG8(0x313B), 0x04},
> > +     {CCI_REG8(0x3143), 0x02},
> > +     {CCI_REG8(0x314F), 0x0E},
> > +     {CCI_REG8(0x3169), 0x99},
> > +     {CCI_REG8(0x316A), 0x99},
> > +     {CCI_REG8(0x3171), 0x05},
> > +     {CCI_REG8(0x31A1), 0xA7},
> > +     {CCI_REG8(0x31A2), 0x9C},
> > +     {CCI_REG8(0x31A3), 0x8F},
> > +     {CCI_REG8(0x31A4), 0x75},
> > +     {CCI_REG8(0x31A5), 0xEE},
> > +     {CCI_REG8(0x31A6), 0xEA},
> > +     {CCI_REG8(0x31A7), 0xE4},
> > +     {CCI_REG8(0x31A8), 0xE4},
> > +     {CCI_REG8(0x31DF), 0x05},
> > +     {CCI_REG8(0x31EC), 0x1B},
> > +     {CCI_REG8(0x31ED), 0x1B},
> > +     {CCI_REG8(0x31EE), 0x1B},
> > +     {CCI_REG8(0x31F0), 0x1B},
> > +     {CCI_REG8(0x31F1), 0x1B},
> > +     {CCI_REG8(0x31F2), 0x1B},
> > +     {CCI_REG8(0x3204), 0x3F},
> > +     {CCI_REG8(0x3205), 0x03},
> > +     {CCI_REG8(0x3210), 0x01},
> > +     {CCI_REG8(0x3216), 0x68},
> > +     {CCI_REG8(0x3217), 0x58},
> > +     {CCI_REG8(0x3218), 0x58},
> > +     {CCI_REG8(0x321A), 0x68},
> > +     {CCI_REG8(0x321B), 0x60},
> > +     {CCI_REG8(0x3238), 0x03},
> > +     {CCI_REG8(0x3239), 0x03},
> > +     {CCI_REG8(0x323A), 0x05},
> > +     {CCI_REG8(0x323B), 0x06},
> > +     {CCI_REG8(0x3243), 0x03},
> > +     {CCI_REG8(0x3244), 0x08},
> > +     {CCI_REG8(0x3245), 0x01},
> > +     {CCI_REG8(0x3307), 0x19},
> > +     {CCI_REG8(0x3308), 0x19},
> > +     {CCI_REG8(0x3320), 0x01},
> > +     {CCI_REG8(0x3326), 0x15},
> > +     {CCI_REG8(0x3327), 0x0D},
> > +     {CCI_REG8(0x3328), 0x01},
> > +     {CCI_REG8(0x3380), 0x01},
> > +     {CCI_REG8(0x339E), 0x07},
> > +     {CCI_REG8(0x3424), 0x00},
> > +     {CCI_REG8(0x343C), 0x01},
> > +     {CCI_REG8(0x3398), 0x04},
> > +     {CCI_REG8(0x343A), 0x10},
> > +     {CCI_REG8(0x339A), 0x22},
> > +     {CCI_REG8(0x33B4), 0x00},
> > +     {CCI_REG8(0x3393), 0x01},
> > +     {CCI_REG8(0x33B3), 0x6E},
> > +     {CCI_REG8(0x3433), 0x06},
> > +     {CCI_REG8(0x3433), 0x00},
> > +     {CCI_REG8(0x33B3), 0x00},
> > +     {CCI_REG8(0x3393), 0x03},
> > +     {CCI_REG8(0x33B4), 0x03},
> > +     {CCI_REG8(0x343A), 0x00},
> > +     {CCI_REG8(0x339A), 0x00},
> > +     {CCI_REG8(0x3398), 0x00}
> > +};
> > +
> > +static const struct cci_reg_sequence t4ka3_pre_mode_set_regs[] =3D {
> > +     {CCI_REG8(0x0112), 0x0A},
> > +     {CCI_REG8(0x0113), 0x0A},
> > +     {CCI_REG8(0x0114), 0x03},
> > +     {CCI_REG8(0x4136), 0x13},
> > +     {CCI_REG8(0x4137), 0x33},
> > +     {CCI_REG8(0x0820), 0x0A},
> > +     {CCI_REG8(0x0821), 0x0D},
> > +     {CCI_REG8(0x0822), 0x00},
> > +     {CCI_REG8(0x0823), 0x00},
> > +     {CCI_REG8(0x0301), 0x0A},
> > +     {CCI_REG8(0x0303), 0x01},
> > +     {CCI_REG8(0x0305), 0x04},
> > +     {CCI_REG8(0x0306), 0x02},
> > +     {CCI_REG8(0x0307), 0x18},
> > +     {CCI_REG8(0x030B), 0x01},
> > +};
> > +
> > +static const struct cci_reg_sequence t4ka3_post_mode_set_regs[] =3D {
> > +     {CCI_REG8(0x0902), 0x00},
> > +     {CCI_REG8(0x4220), 0x00},
> > +     {CCI_REG8(0x4222), 0x01},
> > +     {CCI_REG8(0x3380), 0x01},
> > +     {CCI_REG8(0x3090), 0x88},
> > +     {CCI_REG8(0x3394), 0x20},
> > +     {CCI_REG8(0x3090), 0x08},
> > +     {CCI_REG8(0x3394), 0x10}
> > +};
> > +
> > +static inline struct t4ka3_data *to_t4ka3_sensor(struct v4l2_subdev *s=
d)
> > +{
> > +     return container_of(sd, struct t4ka3_data, sd);
> > +}
> > +
> > +static inline struct t4ka3_data *ctrl_to_t4ka3(struct v4l2_ctrl *ctrl)
> > +{
> > +     return container_of(ctrl->handler, struct t4ka3_data, ctrls.handl=
er);
> > +}
> > +
> > +/* T4KA3 default GRBG */
> > +static const int t4ka3_hv_flip_bayer_order[] =3D {
> > +     MEDIA_BUS_FMT_SGRBG10_1X10,
> > +     MEDIA_BUS_FMT_SBGGR10_1X10,
> > +     MEDIA_BUS_FMT_SRGGB10_1X10,
> > +     MEDIA_BUS_FMT_SGBRG10_1X10,
> > +};
> > +
> > +static const struct v4l2_rect t4ka3_default_crop =3D {
> > +     .left =3D T4KA3_ACTIVE_START_LEFT,
> > +     .top =3D T4KA3_ACTIVE_START_TOP,
> > +     .width =3D T4KA3_ACTIVE_WIDTH,
> > +     .height =3D T4KA3_ACTIVE_HEIGHT,
> > +};
> > +
> > +static int t4ka3_detect(struct t4ka3_data *sensor, u16 *id);
> > +
> > +static void t4ka3_set_bayer_order(struct t4ka3_data *sensor,
> > +                               struct v4l2_mbus_framefmt *fmt)
> > +{
> > +     int hv_flip =3D 0;
> > +
> > +     if (sensor->ctrls.vflip && sensor->ctrls.vflip->val)
> > +             hv_flip +=3D 1;
> > +
> > +     if (sensor->ctrls.hflip && sensor->ctrls.hflip->val)
> > +             hv_flip +=3D 2;
> > +
> > +     fmt->code =3D t4ka3_hv_flip_bayer_order[hv_flip];
> > +}
> > +
> > +static int t4ka3_update_exposure_range(struct t4ka3_data *sensor)
> > +{
> > +     int exp_max =3D sensor->mode.fmt.height + sensor->ctrls.vblank->v=
al -
> > +                   T4KA3_COARSE_INTEGRATION_TIME_MARGIN;
> > +
> > +     return __v4l2_ctrl_modify_range(sensor->ctrls.exposure, 0, exp_ma=
x,
> > +                                     1, exp_max);
> > +}
> > +
> > +static struct v4l2_rect *
> > +__t4ka3_get_pad_crop(struct t4ka3_data *sensor,
> > +                  struct v4l2_subdev_state *state,
> > +                  unsigned int pad,
> > +                  enum v4l2_subdev_format_whence which)
> > +{
> > +     if (which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> > +             return v4l2_subdev_state_get_crop(state, pad);
> > +
> > +     return &sensor->mode.crop;
> > +}
> > +
> > +static struct v4l2_mbus_framefmt *
> > +__t4ka3_get_pad_format(struct t4ka3_data *sensor,
> > +                    struct v4l2_subdev_state *sd_state, unsigned int p=
ad,
> > +                    enum v4l2_subdev_format_whence which)
> > +{
> > +     if (which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> > +             return v4l2_subdev_state_get_format(sd_state, pad);
> > +
> > +     return &sensor->mode.fmt;
> > +}
> > +
> > +static void t4ka3_fill_format(struct t4ka3_data *sensor,
> > +                           struct v4l2_mbus_framefmt *fmt,
> > +                           unsigned int width, unsigned int height)
> > +{
> > +     memset(fmt, 0, sizeof(*fmt));
> > +     fmt->width =3D width;
> > +     fmt->height =3D height;
> > +     fmt->field =3D V4L2_FIELD_NONE;
> > +     fmt->colorspace =3D V4L2_COLORSPACE_SRGB;
> > +     t4ka3_set_bayer_order(sensor, fmt);
> > +}
> > +
> > +static void t4ka3_calc_mode(struct t4ka3_data *sensor)
> > +{
> > +     int width =3D sensor->mode.fmt.width;
> > +     int height =3D sensor->mode.fmt.height;
> > +     int binning;
> > +
> > +     if (width  <=3D (sensor->mode.crop.width / 2) &&
> > +         height <=3D (sensor->mode.crop.height / 2))
> > +             binning =3D 2;
> > +     else
> > +             binning =3D 1;
> > +
> > +     width *=3D binning;
> > +     height *=3D binning;
> > +
> > +     sensor->mode.binning =3D binning;
> > +     sensor->mode.win_x =3D (sensor->mode.crop.left +
> > +                             (sensor->mode.crop.width - width) / 2) & =
~1;
> > +     sensor->mode.win_y =3D (sensor->mode.crop.top +
> > +                             (sensor->mode.crop.height - height) / 2) =
& ~1;
> > +     /*
> > +      * t4ka's window is done after binning, but must still be a multi=
ple of 2 ?
> > +      * Round up to avoid top 2 black lines in 1640x1230 (quarter res)=
 case.
> > +      */
> > +     sensor->mode.win_x =3D DIV_ROUND_UP(sensor->mode.win_x, binning);
> > +     sensor->mode.win_y =3D DIV_ROUND_UP(sensor->mode.win_y, binning);
> > +}
> > +
> > +static void t4ka3_get_vblank_limits(struct t4ka3_data *sensor, int *mi=
n, int *max, int *def)
> > +{
> > +     *min =3D T4KA3_MIN_VBLANK + (sensor->mode.binning - 1) * sensor->=
mode.fmt.height;
> > +     *max =3D T4KA3_MAX_VBLANK - sensor->mode.fmt.height;
> > +     *def =3D T4KA3_LINES_PER_FRAME_30FPS - sensor->mode.fmt.height;
> > +}
> > +
> > +static int t4ka3_set_pad_format(struct v4l2_subdev *sd,
> > +                             struct v4l2_subdev_state *sd_state,
> > +                             struct v4l2_subdev_format *format)
> > +{
> > +     struct t4ka3_data *sensor =3D to_t4ka3_sensor(sd);
> > +     struct v4l2_mbus_framefmt *try_fmt;
> > +     const struct v4l2_rect *crop;
> > +     unsigned int width, height;
> > +     int min, max, def, ret =3D 0;
> > +
> > +     crop =3D __t4ka3_get_pad_crop(sensor, sd_state, format->pad, form=
at->which);
> > +
> > +     /* Limit set_fmt max size to crop width / height */
> > +     width =3D clamp_val(ALIGN(format->format.width, 2),
> > +                       T4KA3_MIN_CROP_WIDTH, crop->width);
> > +     height =3D clamp_val(ALIGN(format->format.height, 2),
> > +                        T4KA3_MIN_CROP_HEIGHT, crop->height);
> > +     t4ka3_fill_format(sensor, &format->format, width, height);
> > +
> > +     if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY) {
> > +             try_fmt =3D v4l2_subdev_state_get_format(sd_state, 0);
> > +             *try_fmt =3D format->format;
> > +             return 0;
> > +     }
> > +
> > +     mutex_lock(&sensor->lock);
> > +
> > +     if (sensor->streaming) {
> > +             ret =3D -EBUSY;
> > +             goto unlock;
> > +     }
> > +
> > +     sensor->mode.fmt =3D format->format;
> > +     t4ka3_calc_mode(sensor);
> > +
> > +     /* vblank range is height dependent adjust and reset to default *=
/
> > +     t4ka3_get_vblank_limits(sensor, &min, &max, &def);
> > +     ret =3D __v4l2_ctrl_modify_range(sensor->ctrls.vblank, min, max, =
1, def);
> > +     if (ret)
> > +             goto unlock;
> > +
> > +     ret =3D __v4l2_ctrl_s_ctrl(sensor->ctrls.vblank, def);
> > +     if (ret)
> > +             goto unlock;
> > +
> > +     def =3D T4KA3_ACTIVE_WIDTH - sensor->mode.fmt.width;
> > +     ret =3D __v4l2_ctrl_modify_range(sensor->ctrls.hblank, def, def, =
1, def);
> > +     if (ret)
> > +             goto unlock;
> > +     ret =3D __v4l2_ctrl_s_ctrl(sensor->ctrls.hblank, def);
> > +     if (ret)
> > +             goto unlock;
> > +
> > +     /* exposure range depends on vts which may have changed */
> > +     ret =3D t4ka3_update_exposure_range(sensor);
> > +     if (ret)
> > +             goto unlock;
> > +
> > +unlock:
> > +     mutex_unlock(&sensor->lock);
> > +     return ret;
> > +}
> > +
> > +/* Horizontal flip the image. */
> > +static int t4ka3_t_hflip(struct v4l2_subdev *sd, int value)
> > +{
> > +     struct t4ka3_data *sensor =3D to_t4ka3_sensor(sd);
> > +     int ret;
> > +     u64 val;
> > +
> > +     if (sensor->streaming)
> > +             return -EBUSY;
> > +
> > +     val =3D value ? T4KA3_HFLIP_BIT : 0;
> > +
> > +     ret =3D cci_update_bits(sensor->regmap, T4KA3_REG_IMG_ORIENTATION=
,
> > +                           T4KA3_HFLIP_BIT, val, NULL);
> > +     if (ret)
> > +             return ret;
> > +
> > +     t4ka3_set_bayer_order(sensor, &sensor->mode.fmt);
> > +     return 0;
> > +}
> > +
> > +/* Vertically flip the image */
> > +static int t4ka3_t_vflip(struct v4l2_subdev *sd, int value)
> > +{
> > +     struct t4ka3_data *sensor =3D to_t4ka3_sensor(sd);
> > +     int ret;
> > +     u64 val;
> > +
> > +     if (sensor->streaming)
> > +             return -EBUSY;
> > +
> > +     val =3D value ? T4KA3_VFLIP_BIT : 0;
> > +
> > +     ret =3D cci_update_bits(sensor->regmap, T4KA3_REG_IMG_ORIENTATION=
,
> > +                           T4KA3_VFLIP_BIT, val, NULL);
> > +     if (ret)
> > +             return ret;
> > +
> > +     t4ka3_set_bayer_order(sensor, &sensor->mode.fmt);
> > +     return 0;
> > +}
> > +
> > +static int t4ka3_test_pattern(struct t4ka3_data *sensor, s32 value)
> > +{
> > +     return cci_write(sensor->regmap, T4KA3_REG_TEST_PATTERN_MODE, val=
ue, NULL);
> > +}
> > +
> > +static int t4ka3_detect(struct t4ka3_data *sensor, u16 *id)
> > +{
> > +     struct i2c_client *client =3D v4l2_get_subdevdata(&sensor->sd);
> > +     struct i2c_adapter *adapter =3D client->adapter;
> > +     u64 high, low;
> > +     int ret =3D 0;
> > +
> > +     /* i2c check */
> > +     if (!i2c_check_functionality(adapter, I2C_FUNC_I2C))
> > +             return -ENODEV;
> > +
> > +     /* check sensor chip ID  */
> > +     cci_read(sensor->regmap, T4KA3_REG_PRODUCT_ID_HIGH, &high, &ret);
> > +     cci_read(sensor->regmap, T4KA3_REG_PRODUCT_ID_LOW, &low, &ret);
> > +     if (ret)
> > +             return ret;
> > +
> > +     *id =3D (((u8)high) << 8) | (u8)low;
> > +     if (*id !=3D T4KA3_PRODUCT_ID) {
> > +             dev_err(sensor->dev, "main sensor t4ka3 ID error\n");
> > +             return -ENODEV;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int
> > +t4ka3_s_config(struct v4l2_subdev *sd)
> > +{
> > +     struct t4ka3_data *sensor =3D to_t4ka3_sensor(sd);
> > +     u16 sensor_id;
> > +     int ret;
> > +
> > +     ret =3D pm_runtime_get_sync(sensor->sd.dev);
> > +     if (ret < 0) {
> > +             dev_err(sensor->dev, "t4ka3 power-up err");
> > +             return ret;
> > +     }
> > +
> > +     ret =3D t4ka3_detect(sensor, &sensor_id);
> > +     if (ret) {
> > +             dev_err(sensor->dev, "Failed to detect sensor.\n");
> > +             goto fail_detect;
> > +     }
> > +
> > +fail_detect:
> > +     pm_runtime_put(sensor->sd.dev);
> > +     return ret;
> > +}
>
> This s_config function is a left-over from the atomisp specific
> GMIN platform handling code which has been removed. IMHO this
> function should be dropped and probe() should call t4ka3_detect()
> directly itself.
Okay!

>
> Also see my remarks on how probe() currently sets up the
> runtime-pm.
>
> > +static int t4ka3_s_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +     struct t4ka3_data *sensor =3D ctrl_to_t4ka3(ctrl);
> > +     int ret;
> > +
> > +     /* Update exposure range on vblank changes */
> > +     if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> > +             ret =3D t4ka3_update_exposure_range(sensor);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     /* Only apply changes to the controls if the device is powered up=
 */
> > +     if (!pm_runtime_get_if_in_use(sensor->sd.dev)) {
> > +             t4ka3_set_bayer_order(sensor, &sensor->mode.fmt);
> > +             return 0;
> > +     }
> > +
> > +     switch (ctrl->id) {
> > +     case V4L2_CID_TEST_PATTERN:
> > +             ret =3D t4ka3_test_pattern(sensor, ctrl->val);
> > +             break;
> > +     case V4L2_CID_VFLIP:
> > +             ret =3D t4ka3_t_vflip(&sensor->sd, ctrl->val);
> > +             break;
> > +     case V4L2_CID_HFLIP:
> > +             ret =3D t4ka3_t_hflip(&sensor->sd, ctrl->val);
> > +             break;
> > +     case V4L2_CID_VBLANK:
> > +             ret =3D cci_write(sensor->regmap, T4KA3_REG_FRAME_LENGTH_=
LINES,
> > +                             sensor->mode.fmt.height + ctrl->val, NULL=
);
> > +             break;
> > +     case V4L2_CID_EXPOSURE:
> > +             ret =3D cci_write(sensor->regmap, T4KA3_REG_COARSE_INTEGR=
ATION_TIME,
> > +                             ctrl->val, NULL);
> > +             break;
> > +     case V4L2_CID_ANALOGUE_GAIN:
> > +             ret =3D cci_write(sensor->regmap, T4KA3_REG_GLOBAL_GAIN,
> > +                             ctrl->val, NULL);
> > +             break;
> > +     default:
> > +             ret =3D -EINVAL;
> > +             break;
> > +     }
> > +
> > +     pm_runtime_put(sensor->sd.dev);
> > +     return ret;
> > +}
> > +
> > +/* Window/crop start + size *after* binning */
> > +#define T4KA3_REG_WIN_START_X                        CCI_REG16(0x0408)
> > +#define T4KA3_REG_WIN_START_Y                        CCI_REG16(0x040a)
> > +#define T4KA3_REG_WIN_WIDTH                  CCI_REG16(0x040c)
> > +#define T4KA3_REG_WIN_HEIGHT                 CCI_REG16(0x040e)
> > +#define T4KA3_REG_TEST_PATTERN_MODE          CCI_REG8(0x0601)
> > +/* Unknown register at address 0x0900 */
> > +#define T4KA3_REG_0900                               CCI_REG8(0x0900)
>
> This is a copy and paste of the same defines above, please drop them.
Okay.


>
> > +static int t4ka3_set_mode(struct t4ka3_data *sensor)
> > +{
> > +     int ret =3D 0;
> > +
> > +     cci_write(sensor->regmap, T4KA3_REG_HORZ_OUTPUT_SIZE, sensor->mod=
e.fmt.width, &ret);
> > +     /* Write mode-height - 2 otherwise things don't work, hw-bug ? */
> > +     cci_write(sensor->regmap, T4KA3_REG_VERT_OUTPUT_SIZE, sensor->mod=
e.fmt.height - 2, &ret);
> > +     /* Note overwritten by __v4l2_ctrl_handler_setup() based on vblan=
k ctrl */
> > +     cci_write(sensor->regmap, T4KA3_REG_FRAME_LENGTH_LINES, T4KA3_LIN=
ES_PER_FRAME_30FPS, &ret);
> > +     cci_write(sensor->regmap, T4KA3_REG_PIXELS_PER_LINE, T4KA3_PIXELS=
_PER_LINE, &ret);
> > +     /* Always use the full sensor, using window to crop */
> > +     cci_write(sensor->regmap, T4KA3_REG_HORZ_START, 0, &ret);
> > +     cci_write(sensor->regmap, T4KA3_REG_VERT_START, 0, &ret);
> > +     cci_write(sensor->regmap, T4KA3_REG_HORZ_END, T4KA3_NATIVE_WIDTH =
- 1, &ret);
> > +     cci_write(sensor->regmap, T4KA3_REG_VERT_END, T4KA3_NATIVE_HEIGHT=
 - 1, &ret);
> > +     /* Set window */
> > +     cci_write(sensor->regmap, T4KA3_REG_WIN_START_X, sensor->mode.win=
_x, &ret);
> > +     cci_write(sensor->regmap, T4KA3_REG_WIN_START_Y, sensor->mode.win=
_y, &ret);
> > +     cci_write(sensor->regmap, T4KA3_REG_WIN_WIDTH, sensor->mode.fmt.w=
idth, &ret);
> > +     cci_write(sensor->regmap, T4KA3_REG_WIN_HEIGHT, sensor->mode.fmt.=
height, &ret);
> > +     /* Write 1 to unknown register 0x0900 */
> > +     cci_write(sensor->regmap, T4KA3_REG_0900, 1, &ret);
> > +     cci_write(sensor->regmap, T4KA3_REG_BINNING, T4KA3_BINNING_VAL(se=
nsor->mode.binning), &ret);
> > +
> > +     return ret;
> > +}
> > +
> > +static int t4ka3_s_stream(struct v4l2_subdev *sd, int enable)
> > +{
> > +     struct t4ka3_data *sensor =3D to_t4ka3_sensor(sd);
> > +     int ret;
> > +
> > +     mutex_lock(&sensor->lock);
> > +
> > +     if (sensor->streaming =3D=3D enable) {
> > +             dev_warn(sensor->dev, "Stream already %s\n", enable ? "st=
arted" : "stopped");
> > +             ret =3D -EBUSY;
> > +             goto error_unlock;
> > +     }
> > +
> > +     if (enable) {
> > +             ret =3D pm_runtime_get_sync(sensor->sd.dev);
> > +             if (ret < 0) {
> > +                     dev_err(sensor->dev, "power-up err.\n");
> > +                     goto error_unlock;
> > +             }
> > +
> > +             cci_multi_reg_write(sensor->regmap, t4ka3_init_config,
> > +                                 ARRAY_SIZE(t4ka3_init_config), &ret);
> > +             /* enable group hold */
> > +             cci_write(sensor->regmap, T4KA3_REG_PARAM_HOLD, 1, &ret);
> > +             cci_multi_reg_write(sensor->regmap, t4ka3_pre_mode_set_re=
gs,
> > +                                 ARRAY_SIZE(t4ka3_pre_mode_set_regs), =
&ret);
> > +             if (ret)
> > +                     goto error_powerdown;
> > +
> > +             ret =3D t4ka3_set_mode(sensor);
> > +             if (ret)
> > +                     goto error_powerdown;
> > +
> > +             ret =3D cci_multi_reg_write(sensor->regmap, t4ka3_post_mo=
de_set_regs,
> > +                                       ARRAY_SIZE(t4ka3_post_mode_set_=
regs), NULL);
> > +             if (ret)
> > +                     goto error_powerdown;
> > +
> > +             /* Restore value of all ctrls */
> > +             ret =3D __v4l2_ctrl_handler_setup(&sensor->ctrls.handler)=
;
> > +             if (ret)
> > +                     goto error_powerdown;
> > +
> > +             /* disable group hold */
> > +             cci_write(sensor->regmap, T4KA3_REG_PARAM_HOLD, 0, &ret);
> > +             cci_write(sensor->regmap, T4KA3_REG_STREAM, 1, &ret);
> > +             if (ret)
> > +                     goto error_powerdown;
> > +
> > +             sensor->streaming =3D 1;
> > +     } else {
> > +             ret =3D cci_write(sensor->regmap, T4KA3_REG_STREAM, 0, NU=
LL);
> > +             if (ret)
> > +                     goto error_powerdown;
> > +
> > +             ret =3D pm_runtime_put(sensor->sd.dev);
> > +             if (ret)
> > +                     goto error_unlock;
> > +
> > +             sensor->streaming =3D 0;
> > +     }
> > +
> > +     mutex_unlock(&sensor->lock);
> > +     return ret;
> > +
> > +error_powerdown:
> > +     pm_runtime_put(sensor->sd.dev);
> > +error_unlock:
> > +     mutex_unlock(&sensor->lock);
> > +     return ret;
> > +}
> > +
> > +static int t4ka3_get_selection(struct v4l2_subdev *sd,
> > +                            struct v4l2_subdev_state *state,
> > +                            struct v4l2_subdev_selection *sel)
> > +{
> > +     struct t4ka3_data *sensor =3D to_t4ka3_sensor(sd);
> > +
> > +     switch (sel->target) {
> > +     case V4L2_SEL_TGT_CROP:
> > +             mutex_lock(&sensor->lock);
> > +             sel->r =3D *__t4ka3_get_pad_crop(sensor, state, sel->pad,
> > +                                            sel->which);
> > +             mutex_unlock(&sensor->lock);
> > +             break;
> > +     case V4L2_SEL_TGT_NATIVE_SIZE:
> > +     case V4L2_SEL_TGT_CROP_BOUNDS:
> > +             sel->r.top =3D 0;
> > +             sel->r.left =3D 0;
> > +             sel->r.width =3D T4KA3_NATIVE_WIDTH;
> > +             sel->r.height =3D T4KA3_NATIVE_HEIGHT;
> > +             break;
> > +     case V4L2_SEL_TGT_CROP_DEFAULT:
> > +             sel->r =3D t4ka3_default_crop;
> > +             break;
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int t4ka3_set_selection(struct v4l2_subdev *sd,
> > +                            struct v4l2_subdev_state *state,
> > +                            struct v4l2_subdev_selection *sel)
> > +{
> > +     struct t4ka3_data *sensor =3D to_t4ka3_sensor(sd);
> > +     struct v4l2_mbus_framefmt *format;
> > +     struct v4l2_rect *crop;
> > +     struct v4l2_rect rect;
> > +
> > +     if (sel->target !=3D V4L2_SEL_TGT_CROP)
> > +             return -EINVAL;
> > +
> > +     /*
> > +      * Clamp the boundaries of the crop rectangle to the size of the =
sensor
> > +      * pixel array. Align to multiples of 2 to ensure Bayer pattern i=
sn't
> > +      * disrupted.
> > +      */
> > +     rect.left =3D clamp_val(ALIGN(sel->r.left, 2),
> > +                           T4KA3_NATIVE_START_LEFT, T4KA3_NATIVE_WIDTH=
);
> > +     rect.top =3D clamp_val(ALIGN(sel->r.top, 2),
> > +                          T4KA3_NATIVE_START_TOP, T4KA3_NATIVE_HEIGHT)=
;
> > +     rect.width =3D clamp_val(ALIGN(sel->r.width, 2),
> > +                            T4KA3_MIN_CROP_WIDTH, T4KA3_NATIVE_WIDTH);
> > +     rect.height =3D clamp_val(ALIGN(sel->r.height, 2),
> > +                             T4KA3_MIN_CROP_HEIGHT, T4KA3_NATIVE_HEIGH=
T);
> > +
> > +     /* Make sure the crop rectangle isn't outside the bounds of the a=
rray */
> > +     rect.width =3D min_t(unsigned int, rect.width,
> > +                        T4KA3_NATIVE_WIDTH - rect.left);
> > +     rect.height =3D min_t(unsigned int, rect.height,
> > +                         T4KA3_NATIVE_HEIGHT - rect.top);
> > +
> > +     crop =3D __t4ka3_get_pad_crop(sensor, state, sel->pad, sel->which=
);
> > +
> > +     mutex_lock(&sensor->lock);
> > +
> > +     *crop =3D rect;
> > +
> > +     if (rect.width !=3D crop->width || rect.height !=3D crop->height)=
 {
> > +             /*
> > +              * Reset the output image size if the crop rectangle size=
 has
> > +              * been modified.
> > +              */
> > +             format =3D __t4ka3_get_pad_format(sensor, state, sel->pad=
,
> > +                                             sel->which);
> > +             format->width =3D rect.width;
> > +             format->height =3D rect.height;
> > +             if (sel->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE)
> > +                     t4ka3_calc_mode(sensor);
> > +     }
> > +
> > +     mutex_unlock(&sensor->lock);
> > +
> > +     sel->r =3D rect;
> > +
> > +     return 0;
> > +}
> > +
> > +static int
> > +t4ka3_enum_mbus_code(struct v4l2_subdev *sd,
> > +                  struct v4l2_subdev_state *sd_state,
> > +                  struct v4l2_subdev_mbus_code_enum *code)
> > +{
> > +     if (code->index)
> > +             return -EINVAL;
> > +
> > +     code->code =3D MEDIA_BUS_FMT_SGRBG10_1X10;
> > +     return 0;
> > +}
> > +
> > +static int t4ka3_enum_frame_size(struct v4l2_subdev *sd,
> > +                              struct v4l2_subdev_state *sd_state,
> > +                              struct v4l2_subdev_frame_size_enum *fse)
> > +{
> > +     struct t4ka3_data *sensor =3D to_t4ka3_sensor(sd);
> > +     struct v4l2_rect *crop;
> > +
> > +     if (fse->index >=3D T4KA3_FRAME_SIZES)
> > +             return -EINVAL;
> > +
> > +     crop =3D __t4ka3_get_pad_crop(sensor, sd_state, fse->pad, fse->wh=
ich);
> > +     if (!crop)
> > +             return -EINVAL;
> > +
> > +     fse->min_width =3D crop->width / (fse->index + 1);
> > +     fse->min_height =3D crop->height / (fse->index + 1);
> > +     fse->max_width =3D fse->min_width;
> > +     fse->max_height =3D fse->min_height;
> > +
> > +     return 0;
> > +}
> > +
> > +static int
> > +t4ka3_get_pad_format(struct v4l2_subdev *sd,
> > +                  struct v4l2_subdev_state *sd_state,
> > +                  struct v4l2_subdev_format *fmt)
> > +{
> > +     struct t4ka3_data *sensor =3D to_t4ka3_sensor(sd);
> > +     struct v4l2_mbus_framefmt *format =3D
> > +             __t4ka3_get_pad_format(sensor, sd_state, fmt->pad, fmt->w=
hich);
> > +
> > +     fmt->format =3D *format;
> > +     return 0;
> > +}
> > +
> > +static int t4ka3_check_hwcfg(struct t4ka3_data *sensor)
> > +{
> > +     struct fwnode_handle *fwnode =3D dev_fwnode(sensor->dev);
> > +     struct v4l2_fwnode_endpoint bus_cfg =3D {
> > +             .bus_type =3D V4L2_MBUS_CSI2_DPHY,
> > +     };
> > +     struct fwnode_handle *endpoint;
> > +     unsigned int i;
> > +     int ret;
> > +
> > +     /*
> > +      * Sometimes the fwnode graph is initialized by the bridge driver=
.
> > +      * Bridge drivers doing this may also add GPIO mappings, wait for=
 this.
> > +      */
> > +     endpoint =3D fwnode_graph_get_next_endpoint(fwnode, NULL);
> > +     if (!endpoint)
> > +             return dev_err_probe(sensor->dev, -EPROBE_DEFER,
> > +                                  "waiting for fwnode graph endpoint\n=
");
> > +
> > +     ret =3D v4l2_fwnode_endpoint_alloc_parse(endpoint, &bus_cfg);
> > +     fwnode_handle_put(endpoint);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (bus_cfg.bus.mipi_csi2.num_data_lanes !=3D 4) {
> > +             dev_err(sensor->dev, "only a 4-lane CSI2 config is suppor=
ted");
> > +             ret =3D -EINVAL;
> > +             goto out_free_bus_cfg;
> > +     }
> > +
> > +     if (!bus_cfg.nr_of_link_frequencies) {
> > +             dev_err(sensor->dev, "no link frequencies defined\n");
> > +             ret =3D -EINVAL;
> > +             goto out_free_bus_cfg;
> > +     }
> > +
> > +     for (i =3D 0; i < bus_cfg.nr_of_link_frequencies; i++) {
> > +             if (bus_cfg.link_frequencies[i] =3D=3D T4KA3_LINK_FREQ)
> > +                     break;
> > +     }
> > +
> > +     if (i =3D=3D bus_cfg.nr_of_link_frequencies) {
> > +             dev_err(sensor->dev, "supported link freq %llu not found\=
n",
> > +                     T4KA3_LINK_FREQ);
> > +             ret =3D -EINVAL;
> > +             goto out_free_bus_cfg;
> > +     }
> > +
> > +out_free_bus_cfg:
> > +     v4l2_fwnode_endpoint_free(&bus_cfg);
> > +
> > +     return ret;
> > +}
> > +
> > +static int t4ka3_init_state(struct v4l2_subdev *sd,
> > +                         struct v4l2_subdev_state *sd_state)
> > +{
> > +     struct t4ka3_data *sensor =3D to_t4ka3_sensor(sd);
> > +
> > +     *v4l2_subdev_state_get_crop(sd_state, 0) =3D t4ka3_default_crop;
> > +
> > +     t4ka3_fill_format(sensor, v4l2_subdev_state_get_format(sd_state, =
0),
> > +                       T4KA3_ACTIVE_WIDTH, T4KA3_ACTIVE_HEIGHT);
> > +     return 0;
> > +}
> > +
> > +static const struct v4l2_ctrl_ops t4ka3_ctrl_ops =3D {
> > +     .s_ctrl =3D t4ka3_s_ctrl,
> > +};
> > +
> > +static const struct v4l2_subdev_video_ops t4ka3_video_ops =3D {
> > +     .s_stream =3D t4ka3_s_stream,
> > +};
> > +
> > +static const struct v4l2_subdev_pad_ops t4ka3_pad_ops =3D {
> > +     .enum_mbus_code =3D t4ka3_enum_mbus_code,
> > +     .enum_frame_size =3D t4ka3_enum_frame_size,
> > +     .get_fmt =3D t4ka3_get_pad_format,
> > +     .set_fmt =3D t4ka3_set_pad_format,
> > +     .get_selection =3D t4ka3_get_selection,
> > +     .set_selection =3D t4ka3_set_selection,
> > +};
> > +
> > +static const struct v4l2_subdev_ops t4ka3_ops =3D {
> > +     .video =3D &t4ka3_video_ops,
> > +     .pad =3D &t4ka3_pad_ops,
> > +};
> > +
> > +static const struct v4l2_subdev_internal_ops t4ka3_internal_ops =3D {
> > +     .init_state =3D t4ka3_init_state,
> > +};
> > +
> > +static void t4ka3_remove(struct i2c_client *client)
> > +{
> > +     struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> > +     struct t4ka3_data *sensor =3D to_t4ka3_sensor(sd);
> > +
> > +     v4l2_async_unregister_subdev(&sensor->sd);
> > +     media_entity_cleanup(&sensor->sd.entity);
> > +     v4l2_ctrl_handler_free(&sensor->ctrls.handler);
> > +     pm_runtime_disable(&client->dev);
> > +}
> > +
> > +static int t4ka3_init_controls(struct t4ka3_data *sensor)
> > +{
> > +     const struct v4l2_ctrl_ops *ops =3D &t4ka3_ctrl_ops;
> > +     struct t4ka3_ctrls *ctrls =3D &sensor->ctrls;
> > +     struct v4l2_ctrl_handler *hdl =3D &ctrls->handler;
> > +     int min, max, def;
> > +     static const char * const test_pattern_menu[] =3D {
> > +             "Disabled",
> > +             "Solid White",
> > +             "Color Bars",
> > +             "Gradient",
> > +             "Random Data",
> > +     };
> > +
> > +     v4l2_ctrl_handler_init(hdl, 4);
> > +
> > +     hdl->lock =3D &sensor->lock;
> > +
> > +     ctrls->vflip =3D v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VFLIP, 0, 1=
, 1, 0);
> > +     ctrls->hflip =3D v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HFLIP, 0, 1=
, 1, 0);
> > +
> > +     ctrls->test_pattern =3D v4l2_ctrl_new_std_menu_items(hdl, ops,
> > +                                                        V4L2_CID_TEST_=
PATTERN,
> > +                                                        ARRAY_SIZE(tes=
t_pattern_menu) - 1,
> > +                                                        0, 0, test_pat=
tern_menu);
> > +     ctrls->link_freq =3D v4l2_ctrl_new_int_menu(hdl, NULL, V4L2_CID_L=
INK_FREQ,
> > +                                               0, 0, sensor->link_freq=
);
> > +
> > +     t4ka3_get_vblank_limits(sensor, &min, &max, &def);
> > +     ctrls->vblank =3D v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VBLANK, mi=
n, max, 1, def);
> > +
> > +     def =3D T4KA3_PIXELS_PER_LINE - sensor->mode.fmt.width;
> > +     ctrls->hblank =3D v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HBLANK,
> > +                                       def, def, 1, def);
> > +
> > +     max =3D T4KA3_LINES_PER_FRAME_30FPS - T4KA3_COARSE_INTEGRATION_TI=
ME_MARGIN;
> > +     ctrls->exposure =3D v4l2_ctrl_new_std(hdl, ops, V4L2_CID_EXPOSURE=
,
> > +                                         0, max, 1, max);
> > +
> > +     ctrls->gain =3D v4l2_ctrl_new_std(hdl, ops, V4L2_CID_ANALOGUE_GAI=
N,
> > +                                     T4KA3_MIN_GLOBAL_GAIN_SUPPORTED,
> > +                                     T4KA3_MAX_GLOBAL_GAIN_SUPPORTED,
> > +                                     1, T4KA3_MIN_GLOBAL_GAIN_SUPPORTE=
D);
> > +
> > +     if (hdl->error)
> > +             return hdl->error;
> > +
> > +     ctrls->vflip->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> > +     ctrls->hflip->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> > +     ctrls->link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> > +     ctrls->hblank->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> > +
> > +     sensor->sd.ctrl_handler =3D hdl;
> > +     return 0;
> > +}
> > +
> > +static int t4ka3_pm_suspend(struct device *dev)
> > +{
> > +     struct t4ka3_data *sensor =3D dev_get_drvdata(dev);
> > +
> > +     gpiod_set_value_cansleep(sensor->powerdown_gpio, 1);
> > +     gpiod_set_value_cansleep(sensor->reset_gpio, 1);
> > +
> > +     return 0;
> > +}
> > +
> > +static int t4ka3_pm_resume(struct device *dev)
> > +{
> > +     struct t4ka3_data *sensor =3D dev_get_drvdata(dev);
> > +     u16 sensor_id;
> > +     int ret;
> > +
> > +     usleep_range(5000, 6000);
> > +
> > +     gpiod_set_value_cansleep(sensor->powerdown_gpio, 0);
> > +     gpiod_set_value_cansleep(sensor->reset_gpio, 0);
> > +
> > +     /* waiting for the sensor after powering up */
> > +     msleep(20);
> > +
> > +     ret =3D t4ka3_detect(sensor, &sensor_id);
> > +     if (ret) {
> > +             dev_err(sensor->dev, "sensor detect failed\n");
> > +             return ret;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static DEFINE_RUNTIME_DEV_PM_OPS(t4ka3_pm_ops, t4ka3_pm_suspend, t4ka3=
_pm_resume, NULL);
> > +
> > +static int t4ka3_probe(struct i2c_client *client)
> > +{
> > +     struct t4ka3_data *sensor;
> > +     int ret;
> > +
> > +     /* allocate sensor device & init sub device */
> > +     sensor =3D devm_kzalloc(&client->dev, sizeof(*sensor), GFP_KERNEL=
);
> > +     if (!sensor)
> > +             return -ENOMEM;
> > +
> > +     sensor->dev =3D &client->dev;
> > +
> > +     ret =3D t4ka3_check_hwcfg(sensor);
> > +     if (ret)
> > +             return ret;
> > +
> > +     mutex_init(&sensor->lock);
> > +
> > +     sensor->link_freq[0] =3D T4KA3_LINK_FREQ;
> > +     sensor->mode.crop =3D t4ka3_default_crop;
> > +     t4ka3_fill_format(sensor, &sensor->mode.fmt, T4KA3_ACTIVE_WIDTH, =
T4KA3_ACTIVE_HEIGHT);
> > +     t4ka3_calc_mode(sensor);
> > +
> > +     v4l2_i2c_subdev_init(&sensor->sd, client, &t4ka3_ops);
> > +     sensor->sd.internal_ops =3D &t4ka3_internal_ops;
> > +
> > +     sensor->powerdown_gpio =3D devm_gpiod_get(&client->dev, "powerdow=
n",
> > +                                             GPIOD_OUT_HIGH);
> > +     if (IS_ERR(sensor->powerdown_gpio))
> > +             return dev_err_probe(&client->dev, PTR_ERR(sensor->powerd=
own_gpio),
> > +                                  "getting powerdown GPIO\n");
> > +
> > +     sensor->reset_gpio =3D devm_gpiod_get_optional(&client->dev, "res=
et",
> > +                                                  GPIOD_OUT_HIGH);
> > +     if (IS_ERR(sensor->reset_gpio))
> > +             return dev_err_probe(&client->dev, PTR_ERR(sensor->reset_=
gpio),
> > +                                  "getting reset GPIO\n");
> > +
> > +     sensor->regmap =3D devm_cci_regmap_init_i2c(client, 16);
> > +     if (IS_ERR(sensor->regmap))
> > +             return PTR_ERR(sensor->regmap);
> > +
>
> The runtime-pm code starting here.
>
> > +     pm_runtime_set_suspended(&client->dev);
> > +     pm_runtime_enable(&client->dev);
> > +     pm_runtime_set_autosuspend_delay(&client->dev, 1000);
> > +     pm_runtime_use_autosuspend(&client->dev);
> > +
> > +     ret =3D t4ka3_s_config(&sensor->sd);
> > +     if (ret)
> > +             goto err_pm_runtime;
>
> And including the get / put runtime-pm calls in s_config() has 2 issues:
>
> 1. The i2c-core code will already runtime-resume the device, so at the AC=
PI level
> the device has already been resumed, thus calling pm_runtime_set_suspende=
d) is
> technically not correct and this will lead to the ACPI runtime-resume met=
hod
> getting called a seocnd time, which should be harmless but still.
>
> The proper thing would be to manually call the driver's own resume functi=
on
> to set the GPIO and not mess with the runtime state.
>
> 2. This will not work if runtime-pm is disabled in Kconfig causing the GP=
IOs
> to never get set, which will cause the detect() to fail.
>
> Instead I suggest replacing the above code block by something like this s=
imilar
> to the ov2680 code:
>
>         /*
>          * Power up and verify the chip now, so that if runtime pm is
>          * disabled the chip is left on and streaming will work.
>          */
>         ret =3D t4ka3_pm_resume(&client->dev);
>         if (ret)
>                 return ret;
>
>         pm_runtime_set_active(&client->dev);
>         pm_runtime_get_noresume(&client->dev);
>         pm_runtime_enable(&client->dev);
>
> and then after the v4l2_async_register_subdev_sensor()
> ... (see below)
>
>
>
> > +
> > +     sensor->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
> > +     sensor->pad.flags =3D MEDIA_PAD_FL_SOURCE;
> > +     sensor->sd.entity.function =3D MEDIA_ENT_F_CAM_SENSOR;
> > +
> > +     ret =3D t4ka3_init_controls(sensor);
> > +     if (ret)
> > +             goto err_controls;
> > +
> > +     ret =3D media_entity_pads_init(&sensor->sd.entity, 1, &sensor->pa=
d);
> > +     if (ret)
> > +             goto err_controls;
> > +
> > +     ret =3D v4l2_async_register_subdev_sensor(&sensor->sd);
> > +     if (ret)
> > +             goto err_media_entity;
>
>         pm_runtime_set_autosuspend_delay(&client->dev, 1000);
>         pm_runtime_use_autosuspend(&client->dev);
>         pm_runtime_put_autosuspend(&client->dev);
>
>
> > +
> > +     return 0;
> > +
> > +err_media_entity:
> > +     media_entity_cleanup(&sensor->sd.entity);
> > +err_controls:
> > +     v4l2_ctrl_handler_free(&sensor->ctrls.handler);
> > +err_pm_runtime:
> > +     pm_runtime_disable(&client->dev);
>
> and insert:
>
>         pm_runtime_put_noidle(&client->dev);
>
> here.
>
> > +     return ret;
> > +}
>
> and in remove() replace
>
>         pm_runtime_disable(&client->dev);
>
> with:
>
>        /*
>          * Disable runtime PM. In case runtime PM is disabled in the kern=
el,
>          * make sure to turn power off manually.
>          */
>         pm_runtime_disable(&client->dev);
>         if (!pm_runtime_status_suspended(&client->dev))
>                 ov2680_power_off(sensor);
>         pm_runtime_set_suspended(&client->dev);

Okay. It looks better :)

>
> > +static struct acpi_device_id t4ka3_acpi_match[] =3D {
> > +     { "XMCC0003" },
> > +     {}
> > +};
> > +MODULE_DEVICE_TABLE(acpi, t4ka3_acpi_match);
> > +
> > +static struct i2c_driver t4ka3_driver =3D {
> > +     .driver =3D {
> > +             .name =3D "t4ka3",
> > +             .acpi_match_table =3D ACPI_PTR(t4ka3_acpi_match),
> > +             .pm =3D pm_sleep_ptr(&t4ka3_pm_ops),
> > +     },
> > +     .probe =3D t4ka3_probe,
> > +     .remove =3D t4ka3_remove,
> > +};
> > +module_i2c_driver(t4ka3_driver)
> > +
> > +MODULE_DESCRIPTION("A low-level driver for T4KA3 sensor");
> > +MODULE_AUTHOR("HARVEY LV <harvey.lv@intel.com>");
> > +MODULE_LICENSE("GPL");
>
> Regards,
>
> Hans
>
>

Thank you for reviewing it.
I'll propose a v6 patch and include the comments you mentioned above.

--
BR,
Kate


