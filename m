Return-Path: <linux-media+bounces-44238-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C32BD194C
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 08:06:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B461E3B2EE4
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 06:06:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 033032DEA76;
	Mon, 13 Oct 2025 06:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UPd967vi"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4493B19D071
	for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 06:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760335575; cv=none; b=WUwR7Ru4K0SvC/ME4wj+mQUIqYaQ7vdu+ld54MVcwSS/tFHr5mJodvzHwTJJuUewDIGETLkJ+pLHxVaU0tYaVgV3E2aiV9DSoIP9zeV4SztLdIRz6W7xSf6f7rwYTA8K3+LiLZnf/7fPOHUsek/lMFG7Qqw+n2XjgcK8xYE6y98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760335575; c=relaxed/simple;
	bh=nhJeqvp+5iqwSA867fIik207j1/8MyUm40NKYVCAl3g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JeotTsCcMmjO+ranfVYoP5/2jdGqCjSjGBvMaqrzjc7rf4SSadIBqBNDL41z/dR353IDzjxt2U5cCphhja5cf+xr/iAvXS9tUDwNoUv8JA/6pE7YnUngZEGmH3uy1gHp2Jdurxvts1dV6AyVabEivjx3gepFR2ZXU8loX4thm1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UPd967vi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760335571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/oC4aAd8YLOdgrL+Mf2bAQxVSRkxe0uBWfcL40AYk7Y=;
	b=UPd967viEeAEgUBDqktjc2Styzn6u2Yt2cXRuKS89hipzDIYSjn/Ie5N9+8jiUpzOqiqIf
	qQhec4AL/1ytwpKoYngJnIkbRj8A5LPYlVs7yYnJdg5ajGl4HFF7FppYlpQuPtkkcf8miY
	hNtsNi4bhRbfF/BokskexIZsa/4rND4=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-422-ex53VLOfMwO5wQOaTkMeUQ-1; Mon, 13 Oct 2025 02:06:08 -0400
X-MC-Unique: ex53VLOfMwO5wQOaTkMeUQ-1
X-Mimecast-MFC-AGG-ID: ex53VLOfMwO5wQOaTkMeUQ_1760335567
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-3a5620fde02so9242846fac.1
        for <linux-media@vger.kernel.org>; Sun, 12 Oct 2025 23:06:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760335567; x=1760940367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/oC4aAd8YLOdgrL+Mf2bAQxVSRkxe0uBWfcL40AYk7Y=;
        b=JpJB3A2TMgX63k+RtNmUHfc21yxW971feWSmKE2O1qNbBE7krLl8X64DzPrzBBef9O
         nnk9QLX51Sh5lBoY9HetAz6Yys5lgxw6Pfu8w5kzJRLYySTzn55SZ3LGwwNJ8qJF3KKf
         miYh+7wRlbi5+7VKfkHoSrBzvWwb5uMF/qwcCWa7HLBzZYAux1qPrnDCBHJ8AhnE80eK
         +ho9vJ8zJnyoKGnF1OSSwPEJX9BY5Z8Y5dAdpaOOZT7Hw2LEssnD6zDP62aU1KoJlm0a
         852tz6K9t6SmCF8WVnDuqd6VqcxiHe8aZ+1yxt6P5m7u9mJFDVn48xuZ9DNSly2fL6yn
         KmZA==
X-Forwarded-Encrypted: i=1; AJvYcCWwLxUtcsjwtk/5J10Jpze4lF8DK/eHylt/lWloLuDT8CxhbaWG9MreS0CuBBlt7rgwdCuLe/u5aOfiyw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh5a0sHcX4jPVINMJrRh2n4urUnGBaCU2FbcjGqrO6/19Quhjy
	H5TahcuBAblUq5albsDtMunHnQrqZSIgc44uVYusDU2X/GBSSBhM9VxkOtWJ7HUWH82rlNU6Sy/
	mkJorY12Gy7Krm0O7YRYVvdZkaLUAVHvfgmiS460qNXsO9ihSeq3sKvdSWb8/d9F7izRfv1L2mn
	tMv2eKnhtIVbiJoI7xMdVxlVKPHVaDmG2JcEAXE94=
X-Gm-Gg: ASbGnct8K9h/inEs5cf9YxElBexAOlXSTw3e6EPNeThE78Fy5nQibvNfHpX0ZmPE324
	OB8ZhwxbXgd6gkWFh6o52yJdfB/fAFBC73wltZcNodqJSYPMcNZrFC7z7tRRJe7i9c5YFZn3zev
	gsmBaIHypYTHelxfgHL7jB
X-Received: by 2002:a05:6870:e30c:b0:365:e541:5431 with SMTP id 586e51a60fabf-3c0f69ef8b4mr10635245fac.16.1760335567045;
        Sun, 12 Oct 2025 23:06:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IET/YuW83MeTJkH24nSVQNpm0qGBJhRFnSN8YFSUCS/i/HEKiJA0IMrQcRrD//RUXz3hJl7hHp0jGqJlUfcYP8=
X-Received: by 2002:a05:6870:e30c:b0:365:e541:5431 with SMTP id
 586e51a60fabf-3c0f69ef8b4mr10635230fac.16.1760335566421; Sun, 12 Oct 2025
 23:06:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250930043904.25090-1-hpa@redhat.com> <33dd5660-efb6-47e0-9672-f3ae65751185@kernel.org>
In-Reply-To: <33dd5660-efb6-47e0-9672-f3ae65751185@kernel.org>
From: Kate Hsuan <hpa@redhat.com>
Date: Mon, 13 Oct 2025 14:05:55 +0800
X-Gm-Features: AS18NWDQqcFn2_I7830rUicwX06EeVosyvKLxi3r6bUOsM_Fr7ayQVdD8Qw_8gc
Message-ID: <CAEth8oGUELF7GZ9bnFGAALMQN-GBn6uz_+NrXNfhx9DLqBjpxg@mail.gmail.com>
Subject: Re: [PATCH v8] media: Add t4ka3 camera sensor driver
To: Hans de Goede <hansg@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Thu, Oct 9, 2025 at 8:13=E2=80=AFPM Hans de Goede <hansg@kernel.org> wro=
te:
>
> Hi Kate,
>
> On 30-Sep-25 6:39 AM, kate Hsuan wrote:
> > From: Kate Hsuan <hpa@redhat.com>
> >
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
> > Co-developed-by: Hans de Goede <hansg@kernel.org>
> > Signed-off-by: Hans de Goede <hansg@kernel.org>
> > Signed-off-by: Kate Hsuan <hpa@redhat.com>
> > ---
> > Changes in v8:
> > 1. Drop the local mutex lock and v4l2-core manages all the locking.
> > 2. __t4ka3_get_pad_format() and __t4ka3_get_pad_crop() are replaced wit=
h
> >    v4l2_subdev_state_get_format() and v4l2_subdev_state_get_crop().
> > 3. The deprecated s_stream was replaced with enable_streams() and
> >    disable_streams().
> > 4. Drop unused functions.
> > 5. t4ka3_get_active_format() helper is used to get the active format.
> > 6. v4l2_link_freq_to_bitmap() is used to check and get the supported
> >    link frequency.
>
> Thank you for the new version. While working on something else
> I took a quick look (not a full review yet) and I noticed
> that the new code calls t4ka3_get_active_format() and
> t4ka3_get_active_crop() from probe() through calling
> t4ka3_calc_mode() and t4ka3_get_vblank_limits().
>
> Both the t4ka3_get_active_*() helpers call
> v4l2_subdev_get_locked_active_state(), which does a:
>
>         lockdep_assert_held(sd->active_state->lock);
>
> which will not trigger from probe(). While fixing this I also
> noticed that t4ka3_get_vblank_limits() is called before
> t4ka3_calc_mode() but it uses sensor->mode.binning which gets
> set by calc_mode() so the calc_mode() must be done first.
>
> Attached is as small fixup patch fixing this as well
> as 2 other small (whitespace + typo) things I noticed.
>
> Regards,
>
> Hans

Thank you for reviewing and the fix patch.

I found the driver was a bit unstable when I was working on modifying probe=
().
Now I know the reason for it. I'll squash your fix patch into the
driver and propose a v9 patch. :)


>
>
>
> > Changes in v7:
> > 1. Add pixel_rate control.
> >
> > Changes in v6:
> > 1. t4ka3_s_config() was removed.
> > 2. The unused macros were removed.
> > 3. The runtime pm initial flow was improved.
> > 4. In remove(), if the device is not in the "suspend" state, the device
> >    will be manually turned off.
> >
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
> >  drivers/media/i2c/t4ka3.c  | 1094 ++++++++++++++++++++++++++++++++++++
> >  3 files changed, 1107 insertions(+)
> >  create mode 100644 drivers/media/i2c/t4ka3.c
> >
> > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > index 6237fe804a5c..b60581dec514 100644
> > --- a/drivers/media/i2c/Kconfig
> > +++ b/drivers/media/i2c/Kconfig
> > @@ -713,6 +713,18 @@ config VIDEO_S5K6A3
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
> >  config VIDEO_VD55G1
> >       tristate "ST VD55G1 sensor support"
> >       select V4L2_CCI_I2C
> > diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> > index 5873d29433ee..af4a18bebc42 100644
> > --- a/drivers/media/i2c/Makefile
> > +++ b/drivers/media/i2c/Makefile
> > @@ -132,6 +132,7 @@ obj-$(CONFIG_VIDEO_SAA717X) +=3D saa717x.o
> >  obj-$(CONFIG_VIDEO_SAA7185) +=3D saa7185.o
> >  obj-$(CONFIG_VIDEO_SONY_BTF_MPX) +=3D sony-btf-mpx.o
> >  obj-$(CONFIG_VIDEO_ST_MIPID02) +=3D st-mipid02.o
> > +obj-$(CONFIG_VIDEO_T4KA3) +=3D t4ka3.o
> >  obj-$(CONFIG_VIDEO_TC358743) +=3D tc358743.o
> >  obj-$(CONFIG_VIDEO_TC358746) +=3D tc358746.o
> >  obj-$(CONFIG_VIDEO_TDA1997X) +=3D tda1997x.o
> > diff --git a/drivers/media/i2c/t4ka3.c b/drivers/media/i2c/t4ka3.c
> > new file mode 100644
> > index 000000000000..cae622c138d9
> > --- /dev/null
> > +++ b/drivers/media/i2c/t4ka3.c
> > @@ -0,0 +1,1094 @@
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
> > +     struct v4l2_ctrl *gain;
> > +     struct v4l2_ctrl *test_pattern;
> > +     struct v4l2_ctrl *link_freq;
> > +     struct v4l2_ctrl *pixel_rate;
> > +};
> > +
> > +struct t4ka3_mode {
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
> > +
> > +     /* MIPI lane info */
> > +     u32 link_freq_index;
> > +     u8 mipi_lanes;
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
> > +static const s64 link_freq_menu_items[] =3D {
> > +     T4KA3_LINK_FREQ,
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
> > +static struct v4l2_mbus_framefmt *t4ka3_get_active_format(struct t4ka3=
_data *sensor)
> > +{
> > +     struct v4l2_subdev_state *active_state =3D
> > +             v4l2_subdev_get_locked_active_state(&sensor->sd);
> > +
> > +     return v4l2_subdev_state_get_format(active_state, 0);
> > +}
> > +
> > +static struct v4l2_rect *t4ka3_get_active_crop(struct t4ka3_data *sens=
or)
> > +{
> > +     struct v4l2_subdev_state *active_state =3D
> > +             v4l2_subdev_get_locked_active_state(&sensor->sd);
> > +
> > +     return v4l2_subdev_state_get_crop(active_state, 0);
> > +}
> > +
> > +static int t4ka3_update_exposure_range(struct t4ka3_data *sensor)
> > +{
> > +     struct v4l2_mbus_framefmt *fmt;
> > +
> > +     fmt =3D t4ka3_get_active_format(sensor);
> > +
> > +     int exp_max =3D fmt->height + sensor->ctrls.vblank->val -
> > +                   T4KA3_COARSE_INTEGRATION_TIME_MARGIN;
> > +
> > +     return __v4l2_ctrl_modify_range(sensor->ctrls.exposure, 0, exp_ma=
x,
> > +                                     1, exp_max);
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
> > +     struct v4l2_mbus_framefmt *fmt;
> > +     struct v4l2_rect *crop;
> > +     int width;
> > +     int height;
> > +     int binning;
> > +
> > +     fmt =3D t4ka3_get_active_format(sensor);
> > +     crop =3D t4ka3_get_active_crop(sensor);
> > +
> > +     width =3D fmt->width;
> > +     height =3D fmt->height;
> > +
> > +     if (width  <=3D (crop->width / 2) && height <=3D (crop->height / =
2))
> > +             binning =3D 2;
> > +     else
> > +             binning =3D 1;
> > +
> > +     width *=3D binning;
> > +     height *=3D binning;
> > +
> > +     sensor->mode.binning =3D binning;
> > +     sensor->mode.win_x =3D (crop->left + (crop->width - width) / 2) &=
 ~1;
> > +     sensor->mode.win_y =3D (crop->top + (crop->height - height) / 2) =
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
> > +     struct v4l2_mbus_framefmt *fmt;
> > +
> > +     fmt =3D t4ka3_get_active_format(sensor);
> > +
> > +     *min =3D T4KA3_MIN_VBLANK + (sensor->mode.binning - 1) * fmt->hei=
ght;
> > +     *max =3D T4KA3_MAX_VBLANK - fmt->height;
> > +     *def =3D T4KA3_LINES_PER_FRAME_30FPS - fmt->height;
> > +}
> > +
> > +static int t4ka3_set_pad_format(struct v4l2_subdev *sd,
> > +                             struct v4l2_subdev_state *sd_state,
> > +                             struct v4l2_subdev_format *format)
> > +{
> > +     struct t4ka3_data *sensor =3D to_t4ka3_sensor(sd);
> > +     struct v4l2_mbus_framefmt *try_fmt;
> > +     struct v4l2_mbus_framefmt *fmt;
> > +     const struct v4l2_rect *crop;
> > +     unsigned int width, height;
> > +     int min, max, def, ret =3D 0;
> > +
> > +     crop =3D t4ka3_get_active_crop(sensor);
> > +     fmt =3D t4ka3_get_active_format(sensor);
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
> > +     if (format->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE && sensor->str=
eaming)
> > +             return -EBUSY;
> > +
> > +     *v4l2_subdev_state_get_format(sd_state, 0) =3D format->format;
> > +
> > +     if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> > +             return 0;
> > +
> > +     t4ka3_calc_mode(sensor);
> > +
> > +     /* vblank range is height dependent adjust and reset to default *=
/
> > +     t4ka3_get_vblank_limits(sensor, &min, &max, &def);
> > +     ret =3D __v4l2_ctrl_modify_range(sensor->ctrls.vblank, min, max, =
1, def);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D __v4l2_ctrl_s_ctrl(sensor->ctrls.vblank, def);
> > +     if (ret)
> > +             return ret;
> > +
> > +     def =3D T4KA3_ACTIVE_WIDTH - fmt->width;
> > +     ret =3D __v4l2_ctrl_modify_range(sensor->ctrls.hblank, def, def, =
1, def);
> > +     if (ret)
> > +             return ret;
> > +     ret =3D __v4l2_ctrl_s_ctrl(sensor->ctrls.hblank, def);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* exposure range depends on vts which may have changed */
> > +     ret =3D t4ka3_update_exposure_range(sensor);
> > +
> > +     return ret;
> > +}
> > +
> > +/* Horizontal or vertically flip the image */
> > +static int t4ka3_t_vflip(struct v4l2_subdev *sd, int value, u8 flip_bi=
t)
> > +{
> > +     struct t4ka3_data *sensor =3D to_t4ka3_sensor(sd);
> > +     struct v4l2_mbus_framefmt *fmt;
> > +     int ret;
> > +     u64 val;
> > +
> > +     if (sensor->streaming)
> > +             return -EBUSY;
> > +
> > +     val =3D value ? flip_bit : 0;
> > +
> > +     ret =3D cci_update_bits(sensor->regmap, T4KA3_REG_IMG_ORIENTATION=
,
> > +                           flip_bit, val, NULL);
> > +     if (ret)
> > +             return ret;
> > +
> > +     fmt =3D t4ka3_get_active_format(sensor);
> > +     t4ka3_set_bayer_order(sensor, fmt);
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
> > +static int t4ka3_s_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +     struct t4ka3_data *sensor =3D ctrl_to_t4ka3(ctrl);
> > +     struct v4l2_mbus_framefmt *fmt;
> > +     int ret;
> > +
> > +     /* Update exposure range on vblank changes */
> > +     if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> > +             ret =3D t4ka3_update_exposure_range(sensor);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     fmt =3D t4ka3_get_active_format(sensor);
> > +
> > +     /* Only apply changes to the controls if the device is powered up=
 */
> > +     if (!pm_runtime_get_if_in_use(sensor->sd.dev)) {
> > +             t4ka3_set_bayer_order(sensor, fmt);
> > +             return 0;
> > +     }
> > +
> > +     switch (ctrl->id) {
> > +     case V4L2_CID_TEST_PATTERN:
> > +             ret =3D t4ka3_test_pattern(sensor, ctrl->val);
> > +             break;
> > +     case V4L2_CID_VFLIP:
> > +             ret =3D t4ka3_t_vflip(&sensor->sd, ctrl->val, T4KA3_VFLIP=
_BIT);
> > +             break;
> > +     case V4L2_CID_HFLIP:
> > +             ret =3D t4ka3_t_vflip(&sensor->sd, ctrl->val, T4KA3_HFLIP=
_BIT);
> > +             break;
> > +     case V4L2_CID_VBLANK:
> > +             ret =3D cci_write(sensor->regmap, T4KA3_REG_FRAME_LENGTH_=
LINES,
> > +                             fmt->height + ctrl->val, NULL);
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
> > +static int t4ka3_set_mode(struct t4ka3_data *sensor)
> > +{
> > +     struct v4l2_mbus_framefmt *fmt;
> > +     int ret =3D 0;
> > +
> > +     fmt =3D t4ka3_get_active_format(sensor);
> > +
> > +     cci_write(sensor->regmap, T4KA3_REG_HORZ_OUTPUT_SIZE, fmt->width,=
 &ret);
> > +     /* Write mode-height - 2 otherwise things don't work, hw-bug ? */
> > +     cci_write(sensor->regmap, T4KA3_REG_VERT_OUTPUT_SIZE, fmt->height=
 - 2, &ret);
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
> > +     cci_write(sensor->regmap, T4KA3_REG_WIN_WIDTH, fmt->width, &ret);
> > +     cci_write(sensor->regmap, T4KA3_REG_WIN_HEIGHT, fmt->height, &ret=
);
> > +     /* Write 1 to unknown register 0x0900 */
> > +     cci_write(sensor->regmap, T4KA3_REG_0900, 1, &ret);
> > +     cci_write(sensor->regmap, T4KA3_REG_BINNING, T4KA3_BINNING_VAL(se=
nsor->mode.binning), &ret);
> > +
> > +     return ret;
> > +}
> > +
> > +static int t4ka3_enable_stream(struct v4l2_subdev *sd, struct v4l2_sub=
dev_state *state,
> > +                            u32 pad, u64 streams_mask)
> > +{
> > +     struct t4ka3_data *sensor =3D to_t4ka3_sensor(sd);
> > +     int ret;
> > +
> > +     ret =3D pm_runtime_get_sync(sensor->sd.dev);
> > +     if (ret < 0) {
> > +             dev_err(sensor->dev, "power-up err.\n");
> > +             goto error_exit;
> > +     }
> > +
> > +     cci_multi_reg_write(sensor->regmap, t4ka3_init_config,
> > +                         ARRAY_SIZE(t4ka3_init_config), &ret);
> > +     /* enable group hold */
> > +     cci_write(sensor->regmap, T4KA3_REG_PARAM_HOLD, 1, &ret);
> > +     cci_multi_reg_write(sensor->regmap, t4ka3_pre_mode_set_regs,
> > +                         ARRAY_SIZE(t4ka3_pre_mode_set_regs), &ret);
> > +     if (ret)
> > +             goto error_powerdown;
> > +
> > +     ret =3D t4ka3_set_mode(sensor);
> > +     if (ret)
> > +             goto error_powerdown;
> > +
> > +     ret =3D cci_multi_reg_write(sensor->regmap, t4ka3_post_mode_set_r=
egs,
> > +                               ARRAY_SIZE(t4ka3_post_mode_set_regs), N=
ULL);
> > +     if (ret)
> > +             goto error_powerdown;
> > +
> > +     /* Restore value of all ctrls */
> > +     ret =3D __v4l2_ctrl_handler_setup(&sensor->ctrls.handler);
> > +     if (ret)
> > +             goto error_powerdown;
> > +
> > +     /* disable group hold */
> > +     cci_write(sensor->regmap, T4KA3_REG_PARAM_HOLD, 0, &ret);
> > +     cci_write(sensor->regmap, T4KA3_REG_STREAM, 1, &ret);
> > +     if (ret)
> > +             goto error_powerdown;
> > +
> > +     sensor->streaming =3D 1;
> > +
> > +     return ret;
> > +
> > +error_powerdown:
> > +     pm_runtime_put(sensor->sd.dev);
> > +error_exit:
> > +     return ret;
> > +}
> > +
> > +static int t4ka3_disable_stream(struct v4l2_subdev *sd, struct v4l2_su=
bdev_state *state,
> > +                             u32 pad, u64 streams_mask)
> > +{
> > +     struct t4ka3_data *sensor =3D to_t4ka3_sensor(sd);
> > +     int ret;
> > +
> > +     ret =3D cci_write(sensor->regmap, T4KA3_REG_STREAM, 0, NULL);
> > +     pm_runtime_put(sensor->sd.dev);
> > +     sensor->streaming =3D 0;
> > +     return ret;
> > +}
> > +
> > +static int t4ka3_get_selection(struct v4l2_subdev *sd,
> > +                            struct v4l2_subdev_state *state,
> > +                            struct v4l2_subdev_selection *sel)
> > +{
> > +     switch (sel->target) {
> > +     case V4L2_SEL_TGT_CROP:
> > +             sel->r =3D *v4l2_subdev_state_get_crop(state, sel->pad);
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
> > +     crop =3D v4l2_subdev_state_get_crop(state, sel->pad);
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
> > +             format =3D v4l2_subdev_state_get_format(state, sel->pad);
> > +             format->width =3D rect.width;
> > +             format->height =3D rect.height;
> > +             if (sel->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE)
> > +                     t4ka3_calc_mode(sensor);
> > +     }
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
> > +     struct v4l2_rect *crop;
> > +
> > +     if (fse->index >=3D T4KA3_FRAME_SIZES)
> > +             return -EINVAL;
> > +
> > +     crop =3D v4l2_subdev_state_get_crop(sd_state, fse->pad);
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
> > +static int t4ka3_check_hwcfg(struct t4ka3_data *sensor)
> > +{
> > +     struct fwnode_handle *fwnode =3D dev_fwnode(sensor->dev);
> > +     struct v4l2_fwnode_endpoint bus_cfg =3D {
> > +             .bus_type =3D V4L2_MBUS_CSI2_DPHY,
> > +     };
> > +     struct fwnode_handle *endpoint;
> > +     unsigned long link_freq_bitmap;
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
> > +     ret =3D v4l2_link_freq_to_bitmap(sensor->dev, bus_cfg.link_freque=
ncies,
> > +                                    bus_cfg.nr_of_link_frequencies,
> > +                                    link_freq_menu_items,
> > +                                    ARRAY_SIZE(link_freq_menu_items),
> > +                                    &link_freq_bitmap);
> > +
> > +     if (ret =3D=3D -ENOENT) {
> > +             dev_err_probe(sensor->dev, -ENOENT,
> > +                           "No match found between driver-supported li=
nk frequencies.\n");
> > +             goto out_free_bus_cfg;
> > +     }
> > +
> > +     if (ret =3D=3D -ENODATA) {
> > +             dev_err_probe(sensor->dev, -ENODATA,
> > +                           "No link frequency was specified in the fir=
mware.\n");
> > +             goto out_free_bus_cfg;
> > +     }
> > +
> > +     sensor->link_freq_index =3D ffs(link_freq_bitmap) - 1;
> > +
> > +     /* 4 MIPI lanes */
> > +     if (bus_cfg.bus.mipi_csi2.num_data_lanes !=3D 4) {
> > +             ret =3D dev_err_probe(sensor->dev, -EINVAL,
> > +                                 "number of CSI2 data lanes %u is not =
supported\n",
> > +                                 bus_cfg.bus.mipi_csi2.num_data_lanes)=
;
> > +             goto out_free_bus_cfg;
> > +     }
> > +
> > +     sensor->mipi_lanes =3D bus_cfg.bus.mipi_csi2.num_data_lanes;
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
> > +     .s_stream =3D v4l2_subdev_s_stream_helper,
> > +};
> > +
> > +static const struct v4l2_subdev_pad_ops t4ka3_pad_ops =3D {
> > +     .enum_mbus_code =3D t4ka3_enum_mbus_code,
> > +     .enum_frame_size =3D t4ka3_enum_frame_size,
> > +     .get_fmt =3D v4l2_subdev_get_fmt,
> > +     .set_fmt =3D t4ka3_set_pad_format,
> > +     .get_selection =3D t4ka3_get_selection,
> > +     .set_selection =3D t4ka3_set_selection,
> > +     .enable_streams =3D t4ka3_enable_stream,
> > +     .disable_streams =3D t4ka3_disable_stream,
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
> > +static int t4ka3_init_controls(struct t4ka3_data *sensor)
> > +{
> > +     const struct v4l2_ctrl_ops *ops =3D &t4ka3_ctrl_ops;
> > +     struct t4ka3_ctrls *ctrls =3D &sensor->ctrls;
> > +     struct v4l2_ctrl_handler *hdl =3D &ctrls->handler;
> > +     struct v4l2_fwnode_device_properties props;
> > +     int ret, min, max, def;
> > +     static const char * const test_pattern_menu[] =3D {
> > +             "Disabled",
> > +             "Solid White",
> > +             "Color Bars",
> > +             "Gradient",
> > +             "Random Data",
> > +     };
> > +
> > +     v4l2_ctrl_handler_init(hdl, 11);
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
> > +     ctrls->pixel_rate =3D v4l2_ctrl_new_std(hdl, NULL, V4L2_CID_PIXEL=
_RATE,
> > +                                           0, T4KA3_PIXEL_RATE,
> > +                                           1, T4KA3_PIXEL_RATE);
> > +
> > +     t4ka3_get_vblank_limits(sensor, &min, &max, &def);
> > +     ctrls->vblank =3D v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VBLANK, mi=
n, max, 1, def);
> > +
> > +     def =3D T4KA3_ACTIVE_WIDTH;
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
> > +     ret =3D v4l2_fwnode_device_parse(sensor->dev, &props);
> > +     if (ret)
> > +             return ret;
> > +
> > +     v4l2_ctrl_new_fwnode_properties(hdl, ops, &props);
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
> > +static void t4ka3_remove(struct i2c_client *client)
> > +{
> > +     struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> > +     struct t4ka3_data *sensor =3D to_t4ka3_sensor(sd);
> > +
> > +     v4l2_async_unregister_subdev(&sensor->sd);
> > +     media_entity_cleanup(&sensor->sd.entity);
> > +     v4l2_ctrl_handler_free(&sensor->ctrls.handler);
> > +
> > +     /*
> > +      * Disable runtime PM. In case runtime PM is disabled in the kern=
el,
> > +      * make sure to turn power off manually.
> > +      */
> > +     pm_runtime_disable(&client->dev);
> > +     if (!pm_runtime_status_suspended(&client->dev))
> > +             t4ka3_pm_suspend(&client->dev);
> > +     pm_runtime_set_suspended(&client->dev);
> > +}
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
> > +     ret =3D t4ka3_pm_resume(sensor->dev);
> > +     if (ret)
> > +             return ret;
> > +
> > +     pm_runtime_set_active(&client->dev);
> > +     pm_runtime_get_noresume(&client->dev);
> > +     pm_runtime_enable(&client->dev);
> > +
> > +     sensor->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
> > +     sensor->pad.flags =3D MEDIA_PAD_FL_SOURCE;
> > +     sensor->sd.entity.function =3D MEDIA_ENT_F_CAM_SENSOR;
> > +
> > +     ret =3D media_entity_pads_init(&sensor->sd.entity, 1, &sensor->pa=
d);
> > +     if (ret)
> > +             goto err_media_entity;
> > +
> > +     sensor->sd.state_lock =3D sensor->ctrls.handler.lock;
> > +     ret =3D v4l2_subdev_init_finalize(&sensor->sd);
> > +     if (ret < 0) {
> > +             dev_err(&client->dev, "failed to init subdev: %d", ret);
> > +             goto err_subdev_entry;
> > +     }
> > +
> > +     ret =3D t4ka3_init_controls(sensor);
> > +     if (ret)
> > +             goto err_controls;
> > +
> > +     t4ka3_calc_mode(sensor);
> > +
> > +     ret =3D v4l2_async_register_subdev_sensor(&sensor->sd);
> > +     if (ret)
> > +             goto err_subdev_entry;
> > +
> > +     pm_runtime_set_autosuspend_delay(&client->dev, 1000);
> > +     pm_runtime_use_autosuspend(&client->dev);
> > +     pm_runtime_put_autosuspend(&client->dev);
> > +
> > +     return 0;
> > +
> > +err_subdev_entry:
> > +     v4l2_subdev_cleanup(&sensor->sd);
> > +
> > +err_controls:
> > +     v4l2_ctrl_handler_free(&sensor->ctrls.handler);
> > +
> > +err_media_entity:
> > +     media_entity_cleanup(&sensor->sd.entity);
> > +     pm_runtime_disable(&client->dev);
> > +     pm_runtime_put_noidle(&client->dev);
> > +
> > +     return ret;
> > +}
> > +
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
> > +MODULE_AUTHOR("Kate Hsuan <hpa@redhat.com>");
> > +MODULE_LICENSE("GPL");



--
BR,
Kate


