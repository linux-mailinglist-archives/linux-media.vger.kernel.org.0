Return-Path: <linux-media+bounces-10325-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 537068B5AAD
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 15:59:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72B9C1C21217
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 13:59:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56EAC74BF5;
	Mon, 29 Apr 2024 13:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="UbkmTUEp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1890D6A8DC
	for <linux-media@vger.kernel.org>; Mon, 29 Apr 2024 13:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714399187; cv=none; b=Wu/V0HpeYEUFZRpinq9q+l7MwDmK5s0IpLccZWeTNYh/syzUAfxpnyS2ZmB4StS7EbfjZWX2u3caD53gDAwKo879Tr1r0spZZDAyO79X4MpH6LR7FZt1Lx9uS+Qeqi1woTRSFNq34gJRfFV87AaOgNm8GXL3qZ4hhdDdX0ct+YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714399187; c=relaxed/simple;
	bh=Vemc0dnxYHqSTrsw5RABxtqKi9pkuBtHsD8aGV1EAss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h9FuHh3MgEeynrJc0cDP8NYVZ6deV+eQ15tJUgbvXX3tAcxaRXC7E0DvFB4WDzFAM6GBh5+l6FOD6WtxV2b7O++J/KmSYgzKgu1EoyW+nrBskWzpVa1GnO9G3/g57RDACWzWkAM6/Ec2uomDvjE+HSr893WlTL0QAPNK8MEjPtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=UbkmTUEp; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-de607ab52f4so163550276.2
        for <linux-media@vger.kernel.org>; Mon, 29 Apr 2024 06:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1714399183; x=1715003983; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QGVZJC8r/j5eYQWbNpSIzuGhyUIHEO3hPodzcC8F8W0=;
        b=UbkmTUEppZb2+AUTI4zXG9XdJaT9I8TV20kZFWU4lbU/+0+nB8NDJkEfUSrV7+HvOD
         eR9z2DUoq57HGc4pHzAOfFzw7B7JrHpYRC0/AF7mj9ggxTOA1agI+ZP+uhOmsSzUuZRo
         FBJVooVCJncMCKYzJoEPmwe5HY44G5i5/K/ucYA4L94IgvgGUFgSgLMEWBjtZbR95IpN
         QjN01fmUqnPM1KGAcgGRNYQ5dZioipBDTeVIQHgYAUhqHUoclWONf6vdhUEdrlLGKuZw
         uXYxH4cAvqpjHcuUrMXF/aU0++CA3IysTm+cdjluD5Abq7goeJG0Vu14c7nQeFKFqqB2
         xovQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714399183; x=1715003983;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QGVZJC8r/j5eYQWbNpSIzuGhyUIHEO3hPodzcC8F8W0=;
        b=LIutbFvT4fH+XOVFOXBtgVj1YfEvQOwfWBptM1PHEte2OHdOsM+QfZ1yuxKLK9f6vd
         9OYhnvtIAMQ7W9IEiacrnKAn0unVxjiExZVVSCBXcbO5d2pGC4GBwiJAlS3BgdvGniH1
         aWu4nX2942GLAQgN1IT4y3Cwa4qUoohJX3Xn1jUc89ylmbhFllWjFy9DOL4FRovH1j0X
         pJppBsBUpqbDIuRoRhPGG23gfmaWNdFwsC3dIesDAbp2FDScBEvdqI2nl4UcYtn8XzRL
         T7fqazAuzDpHE/9GqszDt20GhYy8Ruipywisb1U247BSCkVmdh2fCTGX+7a/iA+kmYKa
         Ln+g==
X-Forwarded-Encrypted: i=1; AJvYcCV9Ktfj1OGqZ9pKc6KgP/AsBuLrxbAiCIHXo3DO7NePSHVGsBUyg59D0zc/AyghlMut8i2as9i/Aqi8UttVYyrkjSpo4roq0FMV1UM=
X-Gm-Message-State: AOJu0Yw3iJ2TRsBdBRl4lhcxitfeGDFzxlBJtvCuS875Q8AYWfmw7z2l
	wf0FCqaaNmz8pD6kYgAucFvvpiBQuKUdqWtM37mdujAWBoQG4fgLgqohhz9LdnkPZ5osLXQa71o
	kmAhgEG8MCYFz2v9Jw5IHZjzZU11pei233BYwPQ==
X-Google-Smtp-Source: AGHT+IF6hvv+TuHTh4cNpPQEiENhbEpvIocY7tOARQ9mHNE/X4HPPUiP+70OFpxWZL4GxtVoj/HENX5vuCW3qgY7YpY=
X-Received: by 2002:a25:2008:0:b0:de5:814e:7488 with SMTP id
 g8-20020a252008000000b00de5814e7488mr9968704ybg.46.1714399182423; Mon, 29 Apr
 2024 06:59:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240429051333.1306453-1-dongcheng.yan@intel.com>
In-Reply-To: <20240429051333.1306453-1-dongcheng.yan@intel.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 29 Apr 2024 14:59:25 +0100
Message-ID: <CAPY8ntAxXzB337rg7bBO8aZr+zM1ZzKyuMPdhDHKs0uceg9F1g@mail.gmail.com>
Subject: Re: [PATCH v2] media: i2c: Add ar0234 camera sensor driver
To: Dongcheng Yan <dongcheng.yan@intel.com>
Cc: sakari.ailus@linux.intel.com, linux-media@vger.kernel.org, 
	tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com, 
	bingbu.cao@linux.intel.com, daxing.li@intel.com
Content-Type: text/plain; charset="UTF-8"

Hi Dongcheng

Thanks for the patch.

As I've previously looked at this sensor, and had most of a driver
working [1], there are a couple of things that immediately stand out
to me in this patch.

[1] https://github.com/6by9/linux/blob/rpi-6.4.y-ar0234/drivers/media/i2c/ar0234.c

On Mon, 29 Apr 2024 at 06:14, Dongcheng Yan <dongcheng.yan@intel.com> wrote:
>
> The driver is implemented with V4L2 framework,
> and supports following features:
>
> - manual exposure and analog/digital gain control
> - vblank/hblank control
> - runtime PM support
> - 1280x960 at 30FPS
>
> Signed-off-by: Dongcheng Yan <dongcheng.yan@intel.com>
> ---
>  drivers/media/i2c/Kconfig  |   11 +
>  drivers/media/i2c/Makefile |    1 +
>  drivers/media/i2c/ar0234.c | 1053 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 1065 insertions(+)
>  create mode 100644 drivers/media/i2c/ar0234.c
>
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 56f276b920ab..4f50a489cfcc 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -51,6 +51,17 @@ config VIDEO_ALVIUM_CSI2
>           To compile this driver as a module, choose M here: the
>           module will be called alvium-csi2.
>
> +config VIDEO_AR0234
> +       tristate "ON Semiconductor AR0234 sensor support"
> +       depends on ACPI || COMPILE_TEST
> +       select V4L2_CCI_I2C
> +       help
> +         This is a Video4Linux2 sensor driver for the ON Semiconductor
> +         AR0234 camera.
> +
> +         To compile this driver as a module, choose M here: the
> +         module will be called ar0234.
> +
>  config VIDEO_AR0521
>         tristate "ON Semiconductor AR0521 sensor support"
>         help
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index dfbe6448b549..57b4f62106d9 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -19,6 +19,7 @@ obj-$(CONFIG_VIDEO_AK7375) += ak7375.o
>  obj-$(CONFIG_VIDEO_AK881X) += ak881x.o
>  obj-$(CONFIG_VIDEO_ALVIUM_CSI2) += alvium-csi2.o
>  obj-$(CONFIG_VIDEO_APTINA_PLL) += aptina-pll.o
> +obj-$(CONFIG_VIDEO_AR0234) += ar0234.o
>  obj-$(CONFIG_VIDEO_AR0521) += ar0521.o
>  obj-$(CONFIG_VIDEO_BT819) += bt819.o
>  obj-$(CONFIG_VIDEO_BT856) += bt856.o
> diff --git a/drivers/media/i2c/ar0234.c b/drivers/media/i2c/ar0234.c
> new file mode 100644
> index 000000000000..cdddd29d6469
> --- /dev/null
> +++ b/drivers/media/i2c/ar0234.c
> @@ -0,0 +1,1053 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2019 - 2024 Intel Corporation.
> +
> +#include <asm/unaligned.h>
> +#include <linux/acpi.h>
> +#include <linux/delay.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/pm_runtime.h>
> +
> +#include <media/v4l2-cci.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-fwnode.h>
> +
> +#define PIXEL_RATE                     180000000ULL
> +
> +/* Chip ID */
> +#define AR0234_REG_CHIP_ID             CCI_REG16(0x3000)
> +#define AR0234_CHIP_ID                 0x0a56
> +
> +#define AR0234_REG_MODE_SELECT         CCI_REG16(0x301a)
> +#define AR0234_MODE_RESET              0x00d9
> +#define AR0234_MODE_STANDBY            0x2058
> +#define AR0234_MODE_STREAMING          0x205c
> +
> +/* V_TIMING internal */
> +#define AR0234_REG_VTS                 CCI_REG16(0x300a)
> +#define AR0234_VTS_MAX                 0xffff
> +
> +/* Exposure control */
> +#define AR0234_REG_EXPOSURE            CCI_REG16(0x3012)
> +#define AR0234_EXPOSURE_MIN            0
> +#define AR0234_EXPOSURE_MAX_MARGIN     80
> +#define AR0234_EXPOSURE_STEP           1
> +
> +/* Analog gain control */
> +#define AR0234_REG_ANALOG_GAIN         CCI_REG16(0x3060)
> +#define AR0234_ANAL_GAIN_MIN           0
> +#define AR0234_ANAL_GAIN_MAX           0x7f
> +#define AR0234_ANAL_GAIN_STEP          1
> +#define AR0234_ANAL_GAIN_DEFAULT       0xe

Default gain of 0x0e would be x1.77778. Any particular reason for not
having the default as x1 ?

> +
> +/* Digital gain control */
> +#define AR0234_REG_GLOBAL_GAIN         CCI_REG16(0x305e)
> +#define AR0234_DGTL_GAIN_MIN           0
> +#define AR0234_DGTL_GAIN_MAX           0x7ff
> +#define AR0234_DGTL_GAIN_STEP          1
> +#define AR0234_DGTL_GAIN_DEFAULT       0x80
> +
> +#define AR0234_NATIVE_WIDTH            1280
> +#define AR0234_NATIVE_HEIGHT           960

AR0234 is a native 1920x1200 sensor at up to 120fps, not 1280x960
https://www.onsemi.com/products/sensors/image-sensors/ar0234cs

> +
> +#define to_ar0234(_sd) container_of(_sd, struct ar0234, sd)
> +
> +struct ar0234_reg_list {
> +       u32 num_of_regs;
> +       const struct cci_reg_sequence *regs;
> +};
> +
> +struct ar0234_link_freq_config {
> +       const struct ar0234_reg_list reg_list;
> +};
> +
> +struct ar0234_mode {
> +       u32 width;
> +       u32 height;
> +
> +       u32 vts_def;
> +       u32 vts_min;
> +
> +       u32 link_freq_index;
> +       u32 code;
> +
> +       u32 hblank;
> +       u32 vblank;
> +
> +       /* Sensor register settings for this mode */
> +       const struct ar0234_reg_list reg_list;
> +};
> +
> +static const struct cci_reg_sequence link_freq_360M_1280x960_10bit_2lane[] = {

This array is selected based on link frequency, but the name refers to
the resolution.

> +       { CCI_REG16(0x302a), 0x0005 },
> +       { CCI_REG16(0x302c), 0x0004 },
> +       { CCI_REG16(0x302e), 0x0003 },
> +       { CCI_REG16(0x3030), 0x0050 },
> +       { CCI_REG16(0x3036), 0x000a },
> +       { CCI_REG16(0x3038), 0x0002 },
> +       { CCI_REG16(0x31b0), 0x006e },
> +       { CCI_REG16(0x31b2), 0x0050 },
> +       { CCI_REG16(0x31b4), 0x4207 },
> +       { CCI_REG16(0x31b6), 0x2213 },
> +       { CCI_REG16(0x31b8), 0x704a },
> +       { CCI_REG16(0x31ba), 0x0289 },
> +       { CCI_REG16(0x31bc), 0x8c08 },
> +       { CCI_REG16(0x31ae), 0x0202 },
> +       { CCI_REG16(0x3002), 0x0080 },
> +       { CCI_REG16(0x3004), 0x0148 },

Y_START and X_START of 0x80,0x148 is an offset of 328, 128 (why did
OnSemi put Y first?)

> +       { CCI_REG16(0x3006), 0x043f },
> +       { CCI_REG16(0x3008), 0x0647 },

Y_END, X_END of 0x43f, 0x647, or more logically 1607,1087.

1087 is 113 pixels from the end of the 1200 lines of array, so we're
not centre cropped as the left side is 128 lines.
Likewise 1607 is 313 pixels from the end of the 1920 pixel width, so
not centred horizontally either.

More fundamentally, why are these registers in a table selected by
link frequency? They should be in mode_1280x960_10bit_2lane.

> +       { CCI_REG16(0x300a), 0x05b5 },

Duplicates AR0234_REG_VTS controlled via V4L2_CID_VBLANK, so will be
programmed via __v4l2_ctrl_handler_setup

> +       { CCI_REG16(0x300c), 0x0268 },

LINE_LENGTH_PCK aka HTS. 0x268 is decimal 616. My work said that the
actual value is this x4, which is 2464. Your mode lists HTS as 3600 +
1280 = 4880, so the numbers seem inconsistent.

> +       { CCI_REG16(0x3012), 0x058c },
> +       { CCI_REG16(0x31ac), 0x0a0a },
> +       { CCI_REG16(0x306e), 0x9010 },
> +       { CCI_REG16(0x30a2), 0x0001 },
> +       { CCI_REG16(0x30a6), 0x0001 },
> +       { CCI_REG16(0x3082), 0x0003 },
> +       { CCI_REG16(0x3040), 0x0000 },
> +       { CCI_REG16(0x31d0), 0x0000 },
> +};
> +
> +static const struct cci_reg_sequence mode_1280x960_10bit_2lane[] = {
> +       { CCI_REG16(0x3f4c), 0x121f },
> +       { CCI_REG16(0x3f4e), 0x121f },
> +       { CCI_REG16(0x3f50), 0x0b81 },
> +       { CCI_REG16(0x31e0), 0x0003 },
> +       { CCI_REG16(0x30b0), 0x0028 },
> +       /* R0X3088 specify the sequencer RAM access address. */
> +       { CCI_REG16(0x3088), 0x8000 },
> +       /* R0X3086 write the sequencer RAM. */
> +       { CCI_REG16(0x3086), 0xc1ae },
> +       { CCI_REG16(0x3086), 0x327f },
> +       { CCI_REG16(0x3086), 0x5780 },
> +       { CCI_REG16(0x3086), 0x272f },
> +       { CCI_REG16(0x3086), 0x7416 },
> +       { CCI_REG16(0x3086), 0x7e13 },
> +       { CCI_REG16(0x3086), 0x8000 },
> +       { CCI_REG16(0x3086), 0x307e },
> +       { CCI_REG16(0x3086), 0xff80 },
> +       { CCI_REG16(0x3086), 0x20c3 },
> +       { CCI_REG16(0x3086), 0xb00e },
> +       { CCI_REG16(0x3086), 0x8190 },
> +       { CCI_REG16(0x3086), 0x1643 },
> +       { CCI_REG16(0x3086), 0x1651 },
> +       { CCI_REG16(0x3086), 0x9d3e },
> +       { CCI_REG16(0x3086), 0x9545 },
> +       { CCI_REG16(0x3086), 0x2209 },
> +       { CCI_REG16(0x3086), 0x3781 },
> +       { CCI_REG16(0x3086), 0x9016 },
> +       { CCI_REG16(0x3086), 0x4316 },
> +       { CCI_REG16(0x3086), 0x7f90 },
> +       { CCI_REG16(0x3086), 0x8000 },
> +       { CCI_REG16(0x3086), 0x387f },
> +       { CCI_REG16(0x3086), 0x1380 },
> +       { CCI_REG16(0x3086), 0x233b },
> +       { CCI_REG16(0x3086), 0x7f93 },
> +       { CCI_REG16(0x3086), 0x4502 },
> +       { CCI_REG16(0x3086), 0x8000 },
> +       { CCI_REG16(0x3086), 0x7fb0 },
> +       { CCI_REG16(0x3086), 0x8d66 },
> +       { CCI_REG16(0x3086), 0x7f90 },
> +       { CCI_REG16(0x3086), 0x8192 },
> +       { CCI_REG16(0x3086), 0x3c16 },
> +       { CCI_REG16(0x3086), 0x357f },
> +       { CCI_REG16(0x3086), 0x9345 },
> +       { CCI_REG16(0x3086), 0x0280 },
> +       { CCI_REG16(0x3086), 0x007f },
> +       { CCI_REG16(0x3086), 0xb08d },
> +       { CCI_REG16(0x3086), 0x667f },
> +       { CCI_REG16(0x3086), 0x9081 },
> +       { CCI_REG16(0x3086), 0x8237 },
> +       { CCI_REG16(0x3086), 0x4502 },
> +       { CCI_REG16(0x3086), 0x3681 },
> +       { CCI_REG16(0x3086), 0x8044 },
> +       { CCI_REG16(0x3086), 0x1631 },
> +       { CCI_REG16(0x3086), 0x4374 },
> +       { CCI_REG16(0x3086), 0x1678 },
> +       { CCI_REG16(0x3086), 0x7b7d },
> +       { CCI_REG16(0x3086), 0x4502 },
> +       { CCI_REG16(0x3086), 0x450a },
> +       { CCI_REG16(0x3086), 0x7e12 },
> +       { CCI_REG16(0x3086), 0x8180 },
> +       { CCI_REG16(0x3086), 0x377f },
> +       { CCI_REG16(0x3086), 0x1045 },
> +       { CCI_REG16(0x3086), 0x0a0e },
> +       { CCI_REG16(0x3086), 0x7fd4 },
> +       { CCI_REG16(0x3086), 0x8024 },
> +       { CCI_REG16(0x3086), 0x0e82 },
> +       { CCI_REG16(0x3086), 0x9cc2 },
> +       { CCI_REG16(0x3086), 0xafa8 },
> +       { CCI_REG16(0x3086), 0xaa03 },
> +       { CCI_REG16(0x3086), 0x430d },
> +       { CCI_REG16(0x3086), 0x2d46 },
> +       { CCI_REG16(0x3086), 0x4316 },
> +       { CCI_REG16(0x3086), 0x5f16 },
> +       { CCI_REG16(0x3086), 0x530d },
> +       { CCI_REG16(0x3086), 0x1660 },
> +       { CCI_REG16(0x3086), 0x401e },
> +       { CCI_REG16(0x3086), 0x2904 },
> +       { CCI_REG16(0x3086), 0x2984 },
> +       { CCI_REG16(0x3086), 0x81e7 },
> +       { CCI_REG16(0x3086), 0x816f },
> +       { CCI_REG16(0x3086), 0x1706 },
> +       { CCI_REG16(0x3086), 0x81e7 },
> +       { CCI_REG16(0x3086), 0x7f81 },
> +       { CCI_REG16(0x3086), 0x5c0d },
> +       { CCI_REG16(0x3086), 0x5754 },
> +       { CCI_REG16(0x3086), 0x495f },
> +       { CCI_REG16(0x3086), 0x5305 },
> +       { CCI_REG16(0x3086), 0x5307 },
> +       { CCI_REG16(0x3086), 0x4d2b },
> +       { CCI_REG16(0x3086), 0xf810 },
> +       { CCI_REG16(0x3086), 0x164c },
> +       { CCI_REG16(0x3086), 0x0755 },
> +       { CCI_REG16(0x3086), 0x562b },
> +       { CCI_REG16(0x3086), 0xb82b },
> +       { CCI_REG16(0x3086), 0x984e },
> +       { CCI_REG16(0x3086), 0x1129 },
> +       { CCI_REG16(0x3086), 0x9460 },
> +       { CCI_REG16(0x3086), 0x5c09 },
> +       { CCI_REG16(0x3086), 0x5c1b },
> +       { CCI_REG16(0x3086), 0x4002 },
> +       { CCI_REG16(0x3086), 0x4500 },
> +       { CCI_REG16(0x3086), 0x4580 },
> +       { CCI_REG16(0x3086), 0x29b6 },
> +       { CCI_REG16(0x3086), 0x7f80 },
> +       { CCI_REG16(0x3086), 0x4004 },
> +       { CCI_REG16(0x3086), 0x7f88 },
> +       { CCI_REG16(0x3086), 0x4109 },
> +       { CCI_REG16(0x3086), 0x5c0b },
> +       { CCI_REG16(0x3086), 0x29b2 },
> +       { CCI_REG16(0x3086), 0x4115 },
> +       { CCI_REG16(0x3086), 0x5c03 },
> +       { CCI_REG16(0x3086), 0x4105 },
> +       { CCI_REG16(0x3086), 0x5f2b },
> +       { CCI_REG16(0x3086), 0x902b },
> +       { CCI_REG16(0x3086), 0x8081 },
> +       { CCI_REG16(0x3086), 0x6f40 },
> +       { CCI_REG16(0x3086), 0x1041 },
> +       { CCI_REG16(0x3086), 0x0160 },
> +       { CCI_REG16(0x3086), 0x29a2 },
> +       { CCI_REG16(0x3086), 0x29a3 },
> +       { CCI_REG16(0x3086), 0x5f4d },
> +       { CCI_REG16(0x3086), 0x1c17 },
> +       { CCI_REG16(0x3086), 0x0281 },
> +       { CCI_REG16(0x3086), 0xe729 },
> +       { CCI_REG16(0x3086), 0x8345 },
> +       { CCI_REG16(0x3086), 0x8840 },
> +       { CCI_REG16(0x3086), 0x0f7f },
> +       { CCI_REG16(0x3086), 0x8a40 },
> +       { CCI_REG16(0x3086), 0x2345 },
> +       { CCI_REG16(0x3086), 0x8024 },
> +       { CCI_REG16(0x3086), 0x4008 },
> +       { CCI_REG16(0x3086), 0x7f88 },
> +       { CCI_REG16(0x3086), 0x5d29 },
> +       { CCI_REG16(0x3086), 0x9288 },
> +       { CCI_REG16(0x3086), 0x102b },
> +       { CCI_REG16(0x3086), 0x0489 },
> +       { CCI_REG16(0x3086), 0x165c },
> +       { CCI_REG16(0x3086), 0x4386 },
> +       { CCI_REG16(0x3086), 0x170b },
> +       { CCI_REG16(0x3086), 0x5c03 },
> +       { CCI_REG16(0x3086), 0x8a48 },
> +       { CCI_REG16(0x3086), 0x4d4e },
> +       { CCI_REG16(0x3086), 0x2b80 },
> +       { CCI_REG16(0x3086), 0x4c09 },
> +       { CCI_REG16(0x3086), 0x4119 },
> +       { CCI_REG16(0x3086), 0x816f },
> +       { CCI_REG16(0x3086), 0x4110 },
> +       { CCI_REG16(0x3086), 0x4001 },
> +       { CCI_REG16(0x3086), 0x6029 },
> +       { CCI_REG16(0x3086), 0x8229 },
> +       { CCI_REG16(0x3086), 0x8329 },
> +       { CCI_REG16(0x3086), 0x435c },
> +       { CCI_REG16(0x3086), 0x055f },
> +       { CCI_REG16(0x3086), 0x4d1c },
> +       { CCI_REG16(0x3086), 0x81e7 },
> +       { CCI_REG16(0x3086), 0x4502 },
> +       { CCI_REG16(0x3086), 0x8180 },
> +       { CCI_REG16(0x3086), 0x7f80 },
> +       { CCI_REG16(0x3086), 0x410a },
> +       { CCI_REG16(0x3086), 0x9144 },
> +       { CCI_REG16(0x3086), 0x1609 },
> +       { CCI_REG16(0x3086), 0x2fc3 },
> +       { CCI_REG16(0x3086), 0xb130 },
> +       { CCI_REG16(0x3086), 0xc3b1 },
> +       { CCI_REG16(0x3086), 0x0343 },
> +       { CCI_REG16(0x3086), 0x164a },
> +       { CCI_REG16(0x3086), 0x0a43 },
> +       { CCI_REG16(0x3086), 0x160b },
> +       { CCI_REG16(0x3086), 0x4316 },
> +       { CCI_REG16(0x3086), 0x8f43 },
> +       { CCI_REG16(0x3086), 0x1690 },
> +       { CCI_REG16(0x3086), 0x4316 },
> +       { CCI_REG16(0x3086), 0x7f81 },
> +       { CCI_REG16(0x3086), 0x450a },
> +       { CCI_REG16(0x3086), 0x410f },
> +       { CCI_REG16(0x3086), 0x7f83 },
> +       { CCI_REG16(0x3086), 0x5d29 },
> +       { CCI_REG16(0x3086), 0x4488 },
> +       { CCI_REG16(0x3086), 0x102b },
> +       { CCI_REG16(0x3086), 0x0453 },
> +       { CCI_REG16(0x3086), 0x0d40 },
> +       { CCI_REG16(0x3086), 0x2345 },
> +       { CCI_REG16(0x3086), 0x0240 },
> +       { CCI_REG16(0x3086), 0x087f },
> +       { CCI_REG16(0x3086), 0x8053 },
> +       { CCI_REG16(0x3086), 0x0d89 },
> +       { CCI_REG16(0x3086), 0x165c },
> +       { CCI_REG16(0x3086), 0x4586 },
> +       { CCI_REG16(0x3086), 0x170b },
> +       { CCI_REG16(0x3086), 0x5c05 },
> +       { CCI_REG16(0x3086), 0x8a60 },
> +       { CCI_REG16(0x3086), 0x4b91 },
> +       { CCI_REG16(0x3086), 0x4416 },
> +       { CCI_REG16(0x3086), 0x09c1 },
> +       { CCI_REG16(0x3086), 0x2ca9 },
> +       { CCI_REG16(0x3086), 0xab30 },
> +       { CCI_REG16(0x3086), 0x51b3 },
> +       { CCI_REG16(0x3086), 0x3d5a },
> +       { CCI_REG16(0x3086), 0x7e3d },
> +       { CCI_REG16(0x3086), 0x7e19 },
> +       { CCI_REG16(0x3086), 0x8000 },
> +       { CCI_REG16(0x3086), 0x8b1f },
> +       { CCI_REG16(0x3086), 0x2a1f },
> +       { CCI_REG16(0x3086), 0x83a2 },
> +       { CCI_REG16(0x3086), 0x7516 },
> +       { CCI_REG16(0x3086), 0xad33 },
> +       { CCI_REG16(0x3086), 0x450a },
> +       { CCI_REG16(0x3086), 0x7f53 },
> +       { CCI_REG16(0x3086), 0x8023 },
> +       { CCI_REG16(0x3086), 0x8c66 },
> +       { CCI_REG16(0x3086), 0x7f13 },
> +       { CCI_REG16(0x3086), 0x8184 },
> +       { CCI_REG16(0x3086), 0x1481 },
> +       { CCI_REG16(0x3086), 0x8031 },
> +       { CCI_REG16(0x3086), 0x3d64 },
> +       { CCI_REG16(0x3086), 0x452a },
> +       { CCI_REG16(0x3086), 0x9451 },
> +       { CCI_REG16(0x3086), 0x9e96 },
> +       { CCI_REG16(0x3086), 0x3d2b },
> +       { CCI_REG16(0x3086), 0x3d1b },
> +       { CCI_REG16(0x3086), 0x529f },
> +       { CCI_REG16(0x3086), 0x0e3d },
> +       { CCI_REG16(0x3086), 0x083d },
> +       { CCI_REG16(0x3086), 0x167e },
> +       { CCI_REG16(0x3086), 0x307e },
> +       { CCI_REG16(0x3086), 0x1175 },
> +       { CCI_REG16(0x3086), 0x163e },
> +       { CCI_REG16(0x3086), 0x970e },
> +       { CCI_REG16(0x3086), 0x82b2 },
> +       { CCI_REG16(0x3086), 0x3d7f },
> +       { CCI_REG16(0x3086), 0xac3e },
> +       { CCI_REG16(0x3086), 0x4502 },
> +       { CCI_REG16(0x3086), 0x7e11 },
> +       { CCI_REG16(0x3086), 0x7fd0 },
> +       { CCI_REG16(0x3086), 0x8000 },
> +       { CCI_REG16(0x3086), 0x8c66 },
> +       { CCI_REG16(0x3086), 0x7f90 },
> +       { CCI_REG16(0x3086), 0x8194 },
> +       { CCI_REG16(0x3086), 0x3f44 },
> +       { CCI_REG16(0x3086), 0x1681 },
> +       { CCI_REG16(0x3086), 0x8416 },
> +       { CCI_REG16(0x3086), 0x2c2c },
> +       { CCI_REG16(0x3086), 0x2c2c },
> +       { CCI_REG16(0x302a), 0x0005 },
> +       { CCI_REG16(0x302c), 0x0001 },
> +       { CCI_REG16(0x302e), 0x0003 },
> +       { CCI_REG16(0x3030), 0x0032 },
> +       { CCI_REG16(0x3036), 0x000a },
> +       { CCI_REG16(0x3038), 0x0001 },
> +       { CCI_REG16(0x30b0), 0x0028 },
> +       { CCI_REG16(0x31b0), 0x0082 },
> +       { CCI_REG16(0x31b2), 0x005c },
> +       { CCI_REG16(0x31b4), 0x5248 },
> +       { CCI_REG16(0x31b6), 0x3257 },
> +       { CCI_REG16(0x31b8), 0x904b },
> +       { CCI_REG16(0x31ba), 0x030b },
> +       { CCI_REG16(0x31bc), 0x8e09 },
> +       { CCI_REG16(0x3354), 0x002b },
> +       { CCI_REG16(0x31d0), 0x0000 },
> +       { CCI_REG16(0x31ae), 0x0204 },
> +       { CCI_REG16(0x3002), 0x00d0 },
> +       { CCI_REG16(0x3004), 0x0148 },
> +       { CCI_REG16(0x3006), 0x048f },
> +       { CCI_REG16(0x3008), 0x0647 },

We've got 0x3002-0x3008 (start and end offsets) repeated both in
link_freq_360M_1280x960_10bit_2lane and here. If these are repeated,
then the whole table needs close scrutiny (sorry, not enough time to
check it now).

> +       { CCI_REG16(0x3064), 0x1802 },
> +       { CCI_REG16(0x300a), 0x04c4 },
> +       { CCI_REG16(0x300c), 0x04c4 },
> +       { CCI_REG16(0x30a2), 0x0001 },
> +       { CCI_REG16(0x30a6), 0x0001 },
> +       { CCI_REG16(0x3012), 0x010c },
> +       { CCI_REG16(0x3786), 0x0006 },
> +       { CCI_REG16(0x31ae), 0x0202 },
> +       { CCI_REG16(0x3088), 0x8050 },
> +       { CCI_REG16(0x3086), 0x9237 },
> +       { CCI_REG16(0x3044), 0x0410 },
> +       { CCI_REG16(0x3094), 0x03d4 },
> +       { CCI_REG16(0x3096), 0x0280 },
> +       { CCI_REG16(0x30ba), 0x7606 },
> +       { CCI_REG16(0x30b0), 0x0028 },
> +       { CCI_REG16(0x30ba), 0x7600 },
> +       { CCI_REG16(0x30fe), 0x002a },
> +       { CCI_REG16(0x31de), 0x0410 },
> +       { CCI_REG16(0x3ed6), 0x1435 },
> +       { CCI_REG16(0x3ed8), 0x9865 },
> +       { CCI_REG16(0x3eda), 0x7698 },
> +       { CCI_REG16(0x3edc), 0x99ff },
> +       { CCI_REG16(0x3ee2), 0xbb88 },
> +       { CCI_REG16(0x3ee4), 0x8836 },
> +       { CCI_REG16(0x3ef0), 0x1cf0 },
> +       { CCI_REG16(0x3ef2), 0x0000 },
> +       { CCI_REG16(0x3ef8), 0x6166 },
> +       { CCI_REG16(0x3efa), 0x3333 },
> +       { CCI_REG16(0x3efc), 0x6634 },
> +       { CCI_REG16(0x3088), 0x81ba },
> +       { CCI_REG16(0x3086), 0x3d02 },
> +       { CCI_REG16(0x3276), 0x05dc },
> +       { CCI_REG16(0x3f00), 0x9d05 },
> +       { CCI_REG16(0x3ed2), 0xfa86 },
> +       { CCI_REG16(0x3eee), 0xa4fe },
> +       { CCI_REG16(0x3ecc), 0x6e42 },
> +       { CCI_REG16(0x3ecc), 0x0e42 },
> +       { CCI_REG16(0x3eec), 0x0c0c },
> +       { CCI_REG16(0x3ee8), 0xaae4 },
> +       { CCI_REG16(0x3ee6), 0x3363 },
> +       { CCI_REG16(0x3ee6), 0x3363 },
> +       { CCI_REG16(0x3ee8), 0xaae4 },
> +       { CCI_REG16(0x3ee8), 0xaae4 },
> +       { CCI_REG16(0x3180), 0xc24f },
> +       { CCI_REG16(0x3102), 0x5000 },
> +       { CCI_REG16(0x3060), 0x000d },
> +       { CCI_REG16(0x3ed0), 0xff44 },
> +       { CCI_REG16(0x3ed2), 0xaa86 },
> +       { CCI_REG16(0x3ed4), 0x031f },
> +       { CCI_REG16(0x3eee), 0xa4aa },
> +};
> +
> +static const s64 link_freq_menu_items[] = {
> +       360000000ULL,
> +};
> +
> +static const struct ar0234_link_freq_config link_freq_configs[] = {
> +       {
> +               .reg_list = {
> +                       .num_of_regs =
> +                               ARRAY_SIZE(link_freq_360M_1280x960_10bit_2lane),
> +                       .regs = link_freq_360M_1280x960_10bit_2lane,
> +               }
> +       },
> +};
> +
> +static const struct ar0234_mode supported_modes[] = {
> +       {
> +               .width = AR0234_NATIVE_WIDTH,
> +               .height = AR0234_NATIVE_HEIGHT,
> +               .vts_def = 2435,
> +               .vts_min = 2435,

Really, or is that just the minimum you've used it with? My testing
appears to have found that VTS only needs to be image height + 4.

> +               .code = MEDIA_BUS_FMT_SGRBG10_1X10,
> +               .reg_list = {
> +                       .num_of_regs = ARRAY_SIZE(mode_1280x960_10bit_2lane),
> +                       .regs = mode_1280x960_10bit_2lane,
> +               },
> +               .link_freq_index = 0,
> +               .hblank = 3600,

Queried above as that doesn't appear to match the register values.
I do note that this is V4L2_CID_HBLANK value, so it is NOT the HTS
value in the registers. There could be some debate as to which is the
better domain to work in.

> +               .vblank = 1475,

That's vts_min - height (2435 - 960 = 1475). Duplicated data like that
increases the chance of errors when adding new modes.

> +       },
> +};
> +
> +struct ar0234 {
> +       struct v4l2_subdev sd;
> +       struct media_pad pad;
> +       struct v4l2_ctrl_handler ctrl_handler;
> +
> +       /* V4L2 Controls */
> +       struct v4l2_ctrl *link_freq;
> +       struct v4l2_ctrl *exposure;
> +       struct v4l2_ctrl *analogue_gain;
> +       struct v4l2_ctrl *digital_gain;

Neither analogue_gain nor digital_gain are ever written to or read, so
no need to store it.

> +       struct v4l2_ctrl *pixel_rate;

Ditto that it's never accessed once initialised.

> +       struct v4l2_ctrl *hblank;
> +       struct v4l2_ctrl *vblank;
> +
> +       struct regmap *regmap;
> +       unsigned long link_freq_bitmap;
> +       const struct ar0234_mode *cur_mode;
> +};
> +
> +static int ar0234_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +       struct ar0234 *ar0234 =
> +               container_of(ctrl->handler, struct ar0234, ctrl_handler);
> +       struct i2c_client *client = v4l2_get_subdevdata(&ar0234->sd);
> +       s64 exposure_max, exposure_def;
> +       struct v4l2_subdev_state *state;
> +       const struct v4l2_mbus_framefmt *format;
> +       int ret;
> +
> +       state = v4l2_subdev_get_locked_active_state(&ar0234->sd);
> +       format = v4l2_subdev_state_get_format(state, 0);
> +
> +       /* Propagate change of current control to all related controls */
> +       if (ctrl->id == V4L2_CID_VBLANK) {
> +               /* Update max exposure while meeting expected vblanking */
> +               exposure_max = format->height + ctrl->val -
> +                              AR0234_EXPOSURE_MAX_MARGIN;
> +               exposure_def = format->height - AR0234_EXPOSURE_MAX_MARGIN;
> +               __v4l2_ctrl_modify_range(ar0234->exposure,
> +                                        ar0234->exposure->minimum,
> +                                        exposure_max, ar0234->exposure->step,
> +                                        exposure_def);
> +       }
> +
> +       /* V4L2 controls values will be applied only when power is already up */
> +       if (!pm_runtime_get_if_in_use(&client->dev))
> +               return 0;
> +
> +       switch (ctrl->id) {
> +       case V4L2_CID_ANALOGUE_GAIN:
> +               ret = cci_write(ar0234->regmap, AR0234_REG_ANALOG_GAIN,
> +                               ctrl->val, NULL);
> +               break;
> +
> +       case V4L2_CID_DIGITAL_GAIN:
> +               ret = cci_write(ar0234->regmap, AR0234_REG_GLOBAL_GAIN,
> +                               ctrl->val, NULL);
> +               break;
> +
> +       case V4L2_CID_EXPOSURE:
> +               ret = cci_write(ar0234->regmap, AR0234_REG_EXPOSURE,
> +                               ctrl->val, NULL);
> +               break;
> +
> +       case V4L2_CID_VBLANK:
> +               ret = cci_write(ar0234->regmap, AR0234_REG_VTS,
> +                               ar0234->cur_mode->height + ctrl->val, NULL);
> +               break;
> +
> +       default:
> +               ret = -EINVAL;
> +               break;
> +       }
> +
> +       pm_runtime_put(&client->dev);
> +
> +       return ret;
> +}
> +
> +static const struct v4l2_ctrl_ops ar0234_ctrl_ops = {
> +       .s_ctrl = ar0234_set_ctrl,
> +};
> +
> +static int ar0234_init_controls(struct ar0234 *ar0234)
> +{
> +       struct i2c_client *client = v4l2_get_subdevdata(&ar0234->sd);
> +       struct v4l2_fwnode_device_properties props;
> +       struct v4l2_ctrl_handler *ctrl_hdlr;
> +       s64 exposure_max, vblank, hblank;
> +       u32 link_freq_size;
> +       int ret;
> +
> +       ctrl_hdlr = &ar0234->ctrl_handler;
> +       ret = v4l2_ctrl_handler_init(ctrl_hdlr, 8);
> +       if (ret)
> +               return ret;
> +
> +       link_freq_size = ARRAY_SIZE(link_freq_menu_items) - 1;
> +       ar0234->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr,
> +                                                  &ar0234_ctrl_ops,
> +                                                  V4L2_CID_LINK_FREQ,
> +                                                  link_freq_size, 0,
> +                                                  link_freq_menu_items);
> +       if (ar0234->link_freq)
> +               ar0234->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
> +       v4l2_ctrl_new_std(ctrl_hdlr, &ar0234_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
> +                         AR0234_ANAL_GAIN_MIN, AR0234_ANAL_GAIN_MAX,
> +                         AR0234_ANAL_GAIN_STEP, AR0234_ANAL_GAIN_DEFAULT);
> +       v4l2_ctrl_new_std(ctrl_hdlr, &ar0234_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
> +                         AR0234_DGTL_GAIN_MIN, AR0234_DGTL_GAIN_MAX,
> +                         AR0234_DGTL_GAIN_STEP, AR0234_DGTL_GAIN_DEFAULT);
> +
> +       exposure_max = ar0234->cur_mode->vts_def - AR0234_EXPOSURE_MAX_MARGIN;
> +       ar0234->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &ar0234_ctrl_ops,
> +                                            V4L2_CID_EXPOSURE,
> +                                            AR0234_EXPOSURE_MIN, exposure_max,
> +                                            AR0234_EXPOSURE_STEP,
> +                                            exposure_max);
> +
> +       ar0234->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &ar0234_ctrl_ops,
> +                                              V4L2_CID_PIXEL_RATE,
> +                                              PIXEL_RATE,
> +                                              PIXEL_RATE, 1,
> +                                              PIXEL_RATE);
> +       if (ar0234->pixel_rate)
> +               ar0234->pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;

V4L2_CID_PIXEL_RATE defaults to read only by the core
(v4l2_ctrl_fill), so no need to set it manually.

> +
> +       vblank = AR0234_VTS_MAX - ar0234->cur_mode->height;
> +       ar0234->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &ar0234_ctrl_ops,
> +                                          V4L2_CID_VBLANK, 0, vblank, 1,
> +                                          ar0234->cur_mode->vblank);
> +       hblank = ar0234->cur_mode->hblank;
> +       ar0234->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &ar0234_ctrl_ops,
> +                                          V4L2_CID_HBLANK, hblank, hblank, 1,
> +                                          hblank);
> +       if (ar0234->hblank)
> +               ar0234->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +

It would be nice to add V4L2_CID_HFLIP and V4L2_CID_VFLIP too. It's
fairly easy on this module as it doesn't change the Bayer order.
Register 0x3040 bits 14 & 15, or 0x301d bits 0 & 1.

> +       if (ctrl_hdlr->error)
> +               return ctrl_hdlr->error;
> +
> +       ret = v4l2_fwnode_device_parse(&client->dev, &props);
> +       if (ret)
> +               return ret;
> +
> +       ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &ar0234_ctrl_ops,
> +                                             &props);
> +       if (ret)
> +               return ret;
> +
> +       ar0234->sd.ctrl_handler = ctrl_hdlr;
> +
> +       return 0;
> +}
> +
> +static void ar0234_update_pad_format(const struct ar0234_mode *mode,
> +                                    struct v4l2_mbus_framefmt *fmt)
> +{
> +       fmt->width = mode->width;
> +       fmt->height = mode->height;
> +       fmt->code = mode->code;
> +       fmt->field = V4L2_FIELD_NONE;
> +}
> +
> +static int ar0234_start_streaming(struct ar0234 *ar0234)
> +{
> +       struct i2c_client *client = v4l2_get_subdevdata(&ar0234->sd);
> +       const struct ar0234_reg_list *reg_list;
> +       int link_freq_index, ret;
> +
> +       ret = pm_runtime_resume_and_get(&client->dev);
> +       if (ret < 0)
> +               return ret;
> +
> +       /*
> +        * Setting 0X301A.bit[0] will initiate a reset sequence:
> +        * the frame being generated will be truncated.
> +        */
> +       ret = cci_write(ar0234->regmap, AR0234_REG_MODE_SELECT,
> +                       AR0234_MODE_RESET, NULL);
> +       if (ret) {
> +               dev_err(&client->dev, "failed to reset");
> +               goto err_rpm_put;
> +       }
> +
> +       usleep_range(1000, 1500);
> +
> +       reg_list = &ar0234->cur_mode->reg_list;
> +       ret = cci_multi_reg_write(ar0234->regmap, reg_list->regs,
> +                                 reg_list->num_of_regs, NULL);
> +       if (ret) {
> +               dev_err(&client->dev, "failed to set mode");
> +               goto err_rpm_put;
> +       }
> +
> +       link_freq_index = ar0234->cur_mode->link_freq_index;
> +       if (link_freq_index > 0) {
> +               reg_list = &link_freq_configs[link_freq_index].reg_list;
> +               ret = cci_multi_reg_write(ar0234->regmap, reg_list->regs,
> +                                         reg_list->num_of_regs, NULL);
> +               if (ret) {
> +                       dev_err(&client->dev, "failed to set plls");
> +                       goto err_rpm_put;
> +               }
> +       }
> +
> +       ret = __v4l2_ctrl_handler_setup(ar0234->sd.ctrl_handler);
> +       if (ret)
> +               goto err_rpm_put;
> +
> +       ret = cci_write(ar0234->regmap, AR0234_REG_MODE_SELECT,
> +                       AR0234_MODE_STREAMING, NULL);
> +       if (ret) {
> +               dev_err(&client->dev, "failed to start stream");
> +               goto err_rpm_put;
> +       }
> +
> +       return 0;
> +
> +err_rpm_put:
> +       pm_runtime_put(&client->dev);
> +       return ret;
> +}
> +
> +static int ar0234_stop_streaming(struct ar0234 *ar0234)
> +{
> +       int ret;
> +       struct i2c_client *client = v4l2_get_subdevdata(&ar0234->sd);
> +
> +       ret = cci_write(ar0234->regmap, AR0234_REG_MODE_SELECT,
> +                       AR0234_MODE_STANDBY, NULL);
> +       if (ret < 0)
> +               dev_err(&client->dev, "failed to stop stream");
> +
> +       pm_runtime_put(&client->dev);
> +       return ret;
> +}
> +
> +static int ar0234_set_stream(struct v4l2_subdev *sd, int enable)
> +{
> +       struct ar0234 *ar0234 = to_ar0234(sd);
> +       struct v4l2_subdev_state *state;
> +       int ret = 0;
> +
> +       state = v4l2_subdev_lock_and_get_active_state(sd);
> +
> +       if (enable)
> +               ret = ar0234_start_streaming(ar0234);
> +       else
> +               ret = ar0234_stop_streaming(ar0234);
> +
> +       v4l2_subdev_unlock_state(state);
> +
> +       return ret;
> +}
> +
> +static int ar0234_set_format(struct v4l2_subdev *sd,
> +                            struct v4l2_subdev_state *sd_state,
> +                            struct v4l2_subdev_format *fmt)
> +{
> +       struct ar0234 *ar0234 = to_ar0234(sd);
> +       struct i2c_client *client = v4l2_get_subdevdata(&ar0234->sd);
> +       struct v4l2_rect *crop;
> +       const struct ar0234_mode *mode;
> +       s64 hblank;
> +       int ret;
> +
> +       mode = v4l2_find_nearest_size(supported_modes,
> +                                     ARRAY_SIZE(supported_modes),
> +                                     width, height,
> +                                     fmt->format.width,
> +                                     fmt->format.height);
> +
> +       crop = v4l2_subdev_state_get_crop(sd_state, fmt->pad);
> +       crop->width = mode->width;
> +       crop->height = mode->height;
> +
> +       ar0234_update_pad_format(mode, &fmt->format);
> +       *v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
> +
> +       if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
> +               return 0;
> +
> +       ar0234->cur_mode = mode;
> +       ret = __v4l2_ctrl_s_ctrl(ar0234->link_freq, mode->link_freq_index);
> +       if (ret) {
> +               dev_err(&client->dev, "Link Freq ctrl set failed\n");
> +               return ret;
> +       }
> +
> +       hblank = ar0234->cur_mode->hblank;
> +       ret = __v4l2_ctrl_modify_range(ar0234->hblank, hblank, hblank,
> +                                      1, hblank);
> +       if (ret) {
> +               dev_err(&client->dev, "HB ctrl range update failed\n");
> +               return ret;
> +       }
> +
> +       /* Update limits and set FPS to default */
> +       ret = __v4l2_ctrl_modify_range(ar0234->vblank, 0,
> +                                      AR0234_VTS_MAX - mode->height, 1,
> +                                      ar0234->cur_mode->vblank);
> +       if (ret) {
> +               dev_err(&client->dev, "VB ctrl range update failed\n");
> +               return ret;
> +       }
> +
> +       ret = __v4l2_ctrl_s_ctrl(ar0234->vblank, ar0234->cur_mode->vblank);
> +       if (ret) {
> +               dev_err(&client->dev, "VB ctrl set failed\n");
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static int ar0234_enum_mbus_code(struct v4l2_subdev *sd,
> +                                struct v4l2_subdev_state *sd_state,
> +                                struct v4l2_subdev_mbus_code_enum *code)
> +{
> +       if (code->index > 0)
> +               return -EINVAL;
> +
> +       code->code = MEDIA_BUS_FMT_SGRBG10_1X10;
> +
> +       return 0;
> +}
> +
> +static int ar0234_enum_frame_size(struct v4l2_subdev *sd,
> +                                 struct v4l2_subdev_state *sd_state,
> +                                 struct v4l2_subdev_frame_size_enum *fse)
> +{
> +       if (fse->index >= ARRAY_SIZE(supported_modes))
> +               return -EINVAL;
> +
> +       if (fse->code != MEDIA_BUS_FMT_SGRBG10_1X10)
> +               return -EINVAL;
> +
> +       fse->min_width = supported_modes[fse->index].width;
> +       fse->max_width = fse->min_width;
> +       fse->min_height = supported_modes[fse->index].height;
> +       fse->max_height = fse->min_height;
> +
> +       return 0;
> +}
> +
> +static int ar0234_get_selection(struct v4l2_subdev *sd,
> +                               struct v4l2_subdev_state *state,
> +                               struct v4l2_subdev_selection *sel)
> +{
> +       switch (sel->target) {
> +       case V4L2_SEL_TGT_CROP_DEFAULT:
> +       case V4L2_SEL_TGT_CROP:
> +               sel->r = *v4l2_subdev_state_get_crop(state, 0);
> +               break;
> +       case V4L2_SEL_TGT_CROP_BOUNDS:
> +               sel->r.top = 0;
> +               sel->r.left = 0;
> +               sel->r.width = AR0234_NATIVE_WIDTH;
> +               sel->r.height = AR0234_NATIVE_HEIGHT;
> +               break;

The numbers look wrong here based on the fact the mode is cropped.

Implement V4L2_SEL_TGT_NATIVE_SIZE as well?

> +       default:
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
> +static int ar0234_init_state(struct v4l2_subdev *sd,
> +                            struct v4l2_subdev_state *sd_state)
> +{
> +       struct v4l2_subdev_format fmt = {
> +               .which = V4L2_SUBDEV_FORMAT_TRY,
> +               .pad = 0,
> +               .format = {
> +                       .code = MEDIA_BUS_FMT_SGRBG10_1X10,
> +                       .width = AR0234_NATIVE_WIDTH,
> +                       .height = AR0234_NATIVE_HEIGHT,
> +               },
> +       };
> +
> +       ar0234_set_format(sd, sd_state, &fmt);
> +
> +       return 0;
> +}
> +
> +static const struct v4l2_subdev_video_ops ar0234_video_ops = {
> +       .s_stream = ar0234_set_stream,
> +};
> +
> +static const struct v4l2_subdev_pad_ops ar0234_pad_ops = {
> +       .set_fmt = ar0234_set_format,
> +       .get_fmt = v4l2_subdev_get_fmt,
> +       .enum_mbus_code = ar0234_enum_mbus_code,
> +       .enum_frame_size = ar0234_enum_frame_size,
> +       .get_selection = ar0234_get_selection,
> +};
> +
> +static const struct v4l2_subdev_core_ops ar0234_core_ops = {
> +       .subscribe_event = v4l2_ctrl_subdev_subscribe_event,
> +       .unsubscribe_event = v4l2_event_subdev_unsubscribe,
> +};
> +
> +static const struct v4l2_subdev_ops ar0234_subdev_ops = {
> +       .core = &ar0234_core_ops,
> +       .video = &ar0234_video_ops,
> +       .pad = &ar0234_pad_ops,
> +};
> +
> +static const struct media_entity_operations ar0234_subdev_entity_ops = {
> +       .link_validate = v4l2_subdev_link_validate,
> +};
> +
> +static const struct v4l2_subdev_internal_ops ar0234_internal_ops = {
> +       .init_state = ar0234_init_state,
> +};
> +
> +static int ar0234_parse_fwnode(struct ar0234 *ar0234, struct device *dev)
> +{
> +       struct fwnode_handle *endpoint;
> +       struct v4l2_fwnode_endpoint bus_cfg = {
> +               .bus_type = V4L2_MBUS_CSI2_DPHY,
> +       };
> +       int ret;
> +
> +       endpoint =
> +               fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0,
> +                                               FWNODE_GRAPH_ENDPOINT_NEXT);
> +       if (!endpoint) {
> +               dev_err(dev, "endpoint node not found\n");
> +               return -EPROBE_DEFER;
> +       }
> +
> +       ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &bus_cfg);
> +       if (ret) {
> +               dev_err(dev, "parsing endpoint node failed\n");
> +               goto out_err;
> +       }
> +
> +       ret = v4l2_link_freq_to_bitmap(dev, bus_cfg.link_frequencies,
> +                                      bus_cfg.nr_of_link_frequencies,
> +                                      link_freq_menu_items,
> +                                      ARRAY_SIZE(link_freq_menu_items),
> +                                      &ar0234->link_freq_bitmap);
> +       if (ret)
> +               goto out_err;

Validate the number of data lanes too? Whilst this driver currently
only supports 2 lanes, the sensor supports 1, 2, or 4.

Your register configuration also puts the sensor in a continuous clock
mode. It would be nice to at least document that, if not check for it
in the configuration.

> +
> +out_err:
> +       v4l2_fwnode_endpoint_free(&bus_cfg);
> +       fwnode_handle_put(endpoint);
> +       return ret;
> +}
> +
> +static int ar0234_identify_module(struct ar0234 *ar0234)
> +{
> +       struct i2c_client *client = v4l2_get_subdevdata(&ar0234->sd);
> +       int ret;
> +       u64 val;
> +
> +       ret = cci_read(ar0234->regmap, AR0234_REG_CHIP_ID, &val, NULL);

An easy future extension is to add support for the mono variant of the
sensor. It reports as CHIP_ID 0x1a56. This isn't a request to add it
now, but more requesting that we don't make it hard to implement later
(simplest support just changes the MBUS_CODE.

> +       if (ret)
> +               return ret;
> +
> +       if (val != AR0234_CHIP_ID) {
> +               dev_err(&client->dev, "chip id mismatch: %x!=%llx",
> +                       AR0234_CHIP_ID, val);
> +               return -ENXIO;
> +       }
> +
> +       return 0;
> +}
> +
> +static void ar0234_remove(struct i2c_client *client)
> +{
> +       struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +       struct ar0234 *ar0234 = to_ar0234(sd);
> +
> +       v4l2_async_unregister_subdev(&ar0234->sd);
> +       v4l2_subdev_cleanup(sd);
> +       media_entity_cleanup(&ar0234->sd.entity);
> +       v4l2_ctrl_handler_free(&ar0234->ctrl_handler);
> +       pm_runtime_disable(&client->dev);
> +       pm_runtime_set_suspended(&client->dev);
> +}
> +
> +static int ar0234_probe(struct i2c_client *client)
> +{
> +       struct device *dev = &client->dev;
> +       struct ar0234 *ar0234;
> +       int ret;
> +
> +       ar0234 = devm_kzalloc(&client->dev, sizeof(*ar0234), GFP_KERNEL);
> +       if (!ar0234)
> +               return -ENOMEM;
> +
> +       ret = ar0234_parse_fwnode(ar0234, dev);
> +       if (ret)
> +               return ret;

You don't look for a clock feeding the sensor. What frequency is that
clock at? The PLL settings you program into the registers are going to
be dependent on that.
On the basis that Intel normally use 19.2MHz clocks for their sensors,
plugging your register settings in I get a pixel rate of 51.2MPix/s,
not the 180MPix/s defined as PIXEL_RATE. I could be totally wrong, but
that makes me dubious of almost all the timing values.

If I use the register settings from my driver with the 24MHz clock
that it expects, the pixel clock does come out as 180MPix/s. To get
the expected numbers out with your register settings, I think you'd
need an external clock of 67.5MHz which is out of spec (max 54 MHz),
and the PLL will be out of spec too.

  Dave

> +
> +       ar0234->regmap = devm_cci_regmap_init_i2c(client, 16);
> +       if (IS_ERR(ar0234->regmap))
> +               return dev_err_probe(dev, PTR_ERR(ar0234->regmap),
> +                                    "failed to init CCI\n");
> +
> +       v4l2_i2c_subdev_init(&ar0234->sd, client, &ar0234_subdev_ops);
> +
> +       ret = ar0234_identify_module(ar0234);
> +       if (ret) {
> +               dev_err(&client->dev, "failed to find sensor: %d", ret);
> +               return ret;
> +       }
> +
> +       /* Set default mode to max resolution */
> +       ar0234->cur_mode = &supported_modes[0];
> +       ret = ar0234_init_controls(ar0234);
> +       if (ret) {
> +               dev_err(&client->dev, "failed to init controls: %d", ret);
> +               goto probe_error_v4l2_ctrl_handler_free;
> +       }
> +
> +       ar0234->sd.internal_ops = &ar0234_internal_ops;
> +       ar0234->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> +                           V4L2_SUBDEV_FL_HAS_EVENTS;
> +       ar0234->sd.entity.ops = &ar0234_subdev_entity_ops;
> +       ar0234->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> +
> +       ar0234->pad.flags = MEDIA_PAD_FL_SOURCE;
> +       ret = media_entity_pads_init(&ar0234->sd.entity, 1, &ar0234->pad);
> +       if (ret) {
> +               dev_err(&client->dev, "failed to init entity pads: %d", ret);
> +               goto probe_error_v4l2_ctrl_handler_free;
> +       }
> +
> +       ar0234->sd.state_lock = ar0234->ctrl_handler.lock;
> +       ret = v4l2_subdev_init_finalize(&ar0234->sd);
> +       if (ret < 0) {
> +               dev_err(dev, "v4l2 subdev init error: %d\n", ret);
> +               goto probe_error_media_entity_cleanup;
> +       }
> +
> +       /*
> +        * Device is already turned on by i2c-core with ACPI domain PM.
> +        * Enable runtime PM and turn off the device.
> +        */
> +       pm_runtime_set_active(&client->dev);
> +       pm_runtime_enable(&client->dev);
> +       pm_runtime_idle(&client->dev);
> +
> +       ret = v4l2_async_register_subdev_sensor(&ar0234->sd);
> +       if (ret < 0) {
> +               dev_err(&client->dev, "failed to register V4L2 subdev: %d",
> +                       ret);
> +               goto probe_error_rpm;
> +       }
> +
> +       return 0;
> +probe_error_rpm:
> +       pm_runtime_disable(&client->dev);
> +       v4l2_subdev_cleanup(&ar0234->sd);
> +
> +probe_error_media_entity_cleanup:
> +       media_entity_cleanup(&ar0234->sd.entity);
> +
> +probe_error_v4l2_ctrl_handler_free:
> +       v4l2_ctrl_handler_free(ar0234->sd.ctrl_handler);
> +
> +       return ret;
> +}
> +
> +static const struct acpi_device_id ar0234_acpi_ids[] = {
> +       { "INTC10C0" },
> +       {}
> +};
> +
> +MODULE_DEVICE_TABLE(acpi, ar0234_acpi_ids);
> +
> +static struct i2c_driver ar0234_i2c_driver = {
> +       .driver = {
> +               .name = "ar0234",
> +               .acpi_match_table = ACPI_PTR(ar0234_acpi_ids),
> +       },
> +       .probe = ar0234_probe,
> +       .remove = ar0234_remove,
> +};
> +
> +module_i2c_driver(ar0234_i2c_driver);
> +
> +MODULE_DESCRIPTION("ON Semiconductor ar0234 sensor driver");
> +MODULE_AUTHOR("Dongcheng Yan <dongcheng.yan@intel.com>");
> +MODULE_AUTHOR("Hao Yao <hao.yao@intel.com>");
> +MODULE_LICENSE("GPL");
> --
> 2.34.1
>
>

