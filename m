Return-Path: <linux-media+bounces-37110-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B794AFCC0A
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 15:29:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C5093A660F
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 13:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D32A02DE1E0;
	Tue,  8 Jul 2025 13:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="lCy12u9w"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E81522F75B
	for <linux-media@vger.kernel.org>; Tue,  8 Jul 2025 13:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751981140; cv=none; b=fcP3jks6H0hZyO/kPVnaRWtqZj4gl0c2v40G2Fx6AnmL04DU2pU/a2orXO7DKygQ533kGno/+zsc0UdVDQnsu2ZrRj9CES9IA6iy+1hdG/VTGT4x96LVI/S2S4Mc6uLJvOKfUqljg4KxRauPoYX3wMPIPV6e4gqAxTUqny8ouhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751981140; c=relaxed/simple;
	bh=Lvml6u3Iy6UV7DSyBemFDoMjc2zzEFVPyQy8zfzBbAQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AsmAlHxuE3rrEYUujci6m0kFKPsN6OOhcxVKL1c6vkPd+pAsFhWTOOCiF7xEtExRCaoP//7IwCXC7ZDVyAzc+6AxbNNhyLrEqsdzVKLjWkimFUVNIrimaR9792r2xln6EqwZrV59L1YXNJ4P3LEel2t/ULLKrwByAf/RJuZvn40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=lCy12u9w; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-70e75f30452so28656447b3.2
        for <linux-media@vger.kernel.org>; Tue, 08 Jul 2025 06:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1751981136; x=1752585936; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ac2mrOretGQ7zSXjrgvgCLToxarQeHTpBzbtdc6pRPU=;
        b=lCy12u9wYfni7kUeMFt6Gb1xCJIJdWHyQpDx3r236QY54HUWKr1EQUvI/x94I7BSWv
         QHI88qCTEIa4+9s+lbn3b9JMb4tcfC/TGIZqibbaUdEmiqpyvyqKt7Cw/4yZJzzmr3pL
         tfQuOLLpRLFz+/bcRzapDoPkFnKj5b7B841HLRtlsMP5fZh2lLGjtR7TavkeKaobhpCT
         Nv9uj7KFZhKFb2X/lnHxAkUSPhijCDz1p6MmNgkS0eehQDi81N5dAVzUjUxM4RURUsKi
         xgC3HfYpjRdaIssYqamvB1/4SJ6AUGc24k4YB7PFrRRdDThjMuLcVQjN/exJi2XDAaid
         X7Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751981136; x=1752585936;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ac2mrOretGQ7zSXjrgvgCLToxarQeHTpBzbtdc6pRPU=;
        b=VIcck0HsYy9RjPSoTAp/7sIjskyt8EnRgBxQAQxo9Beqv684Ludh7XdNhA5FAnnO8G
         h7El6LphxCCQVAHDALV4kTLHPEHJ/Re+vvNgFo61GlyrQ4gMgM4GZS0ec59rqOc/WU5j
         ZhtxBORrq7Nevp89xIrxYAFWRD3PgTdKtc24sCBbaFleabzGqwQ65uaKNEyVibGGc10o
         ICbQBa4f9Y61Mb4rxSlmm8fwkF7VxnCG9LSdMOMfbdEA7sTt4pfKHg/H4gaw2toX9JoI
         ufGLpDjpUZq/D9qcHhjn0zoLrL6nFAUGF/cd1p/GGhQ2BjI9Igiv82dx8rYY/nXEeHcj
         6MBA==
X-Forwarded-Encrypted: i=1; AJvYcCUzSCHBgcv8uG+/m3s7M3qDz4JXqvWi3Uq7HB/9GmQj7NDx0eHxSHv581AHaJ2HIrd3GbzYWAFujHYXlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLlt006zq6YRRnczPirSenRvjDoIXiLnBFkJPl4A4rXUb4CAPE
	Lm2hD27XjVTgjJthFsL7nUp4vKV9DFZRenGIDkV4xjz7b6qcWmLvI3M6oRfni5iqp+W7vizx7y8
	+zcQQoPv6fJqZhjJWNEcVF/Vcw3mYEStmWRdgRmJFWG62nHmE7bZWtZeKlA==
X-Gm-Gg: ASbGnctJNC5ZLCpHyEd7vsm0J33aIK3c5VHMOPdet42hXQPZd/qIhkN6+LJy0gnkHtS
	5jfOy674gRqgK+904gLCnERYXcC2Xc3gdpk5ZFtuHDsQbQDNxaWUpN3DEAwet12q9jZit2+sVkm
	+2IVbGGmmBd0gl1ZYLgRQ/OHudQLOND/UfgKMlseQ2igk3HfpzfVs3OXEKkLTCmWYPqFFFEl+Xh
	i8=
X-Google-Smtp-Source: AGHT+IFPJz7pslJdb4M1bXLmZdkdPrMML4Darh26FwsjLVXhVKFZ1smd7jWqCl4dVvz+RT5DBYqODR4klDAPSYq+Tr4=
X-Received: by 2002:a05:690c:6101:b0:6ef:652b:91cf with SMTP id
 00721157ae682-717a03a66d1mr39861897b3.27.1751981136195; Tue, 08 Jul 2025
 06:25:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250708102604.29261-1-hardevsinh.palaniya@siliconsignals.io> <20250708102604.29261-3-hardevsinh.palaniya@siliconsignals.io>
In-Reply-To: <20250708102604.29261-3-hardevsinh.palaniya@siliconsignals.io>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 8 Jul 2025 14:25:15 +0100
X-Gm-Features: Ac12FXzemYbgyTVVghQT2QqT0urqmPgwmos5PREm9RDH5PD2Or9HTvjlVwrzn0A
Message-ID: <CAPY8ntDzFNQ8Hg7zXdqCpAAGSsoUAPOf=k1ku6aU_q1eY-EVWQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] media: i2c: add ov2735 image sensor driver
To: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Cc: sakari.ailus@linux.intel.com, andriy.shevchenko@linux.intel.com, 
	krzk+dt@kernel.org, Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hans Verkuil <hverkuil@xs4all.nl>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
	Hans de Goede <hansg@kernel.org>, Ricardo Ribalda <ribalda@chromium.org>, 
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Matthias Fend <matthias.fend@emfend.at>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Jingjing Xiong <jingjing.xiong@intel.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Dongcheng Yan <dongcheng.yan@intel.com>, 
	Arnd Bergmann <arnd@arndb.de>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Hardevsinh

Only a very quick read through, but 2 things stand out.

On Tue, 8 Jul 2025 at 11:27, Hardevsinh Palaniya
<hardevsinh.palaniya@siliconsignals.io> wrote:
>
> Add a v4l2 subdevice driver for the Omnivision OV2735 sensor.
>
> The Omnivision OV2735 is a 1/2.7-Inch CMOS image sensor with an
> active array size of 1920 x 1080.
>
> The following features are supported:
> - Manual exposure an gain control support
> - vblank/hblank control support
> - Test pattern support control
> - Supported resolution: 1920 x 1080 @ 30fps (SGRBG10)
>
> Co-developed-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
> Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
> Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
> ---
>  MAINTAINERS                |   9 +
>  drivers/media/i2c/Kconfig  |  10 +
>  drivers/media/i2c/Makefile |   1 +
>  drivers/media/i2c/ov2735.c | 908 +++++++++++++++++++++++++++++++++++++
>  4 files changed, 928 insertions(+)
>  create mode 100644 drivers/media/i2c/ov2735.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 92e9d8c7708f..058bbfd9523b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18471,6 +18471,15 @@ T:     git git://linuxtv.org/media.git
>  F:     Documentation/devicetree/bindings/media/i2c/ovti,ov2685.yaml
>  F:     drivers/media/i2c/ov2685.c
>
> +OMNIVISION OV2735 SENSOR DRIVER
> +M:     Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
> +M:     Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
> +L:     linux-media@vger.kernel.org
> +S:     Maintained
> +T:     git git://linuxtv.org/media.git
> +F:     Documentation/devicetree/bindings/media/i2c/ovti,ov2735.yaml
> +F:     drivers/media/i2c/ov2735.c
> +
>  OMNIVISION OV2740 SENSOR DRIVER
>  M:     Tianshu Qiu <tian.shu.qiu@intel.com>
>  R:     Sakari Ailus <sakari.ailus@linux.intel.com>
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 4b4c199da6ea..9646eab1b177 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -446,6 +446,16 @@ config VIDEO_OV2685
>           To compile this driver as a module, choose M here: the
>           module will be called ov2685.
>
> +config VIDEO_OV2735
> +       tristate "OmniVision OV2735 sensor support"
> +       select V4L2_CCI_I2C
> +       help
> +         This is a Video4Linux2 sensor driver for the Sony
> +         OV2735 camera.
> +
> +         To compile this driver as a module, choose M here: the
> +         module will be called ov2735.
> +
>  config VIDEO_OV2740
>         tristate "OmniVision OV2740 sensor support"
>         depends on ACPI || COMPILE_TEST
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index 5873d29433ee..1adb27743fa1 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -93,6 +93,7 @@ obj-$(CONFIG_VIDEO_OV2640) += ov2640.o
>  obj-$(CONFIG_VIDEO_OV2659) += ov2659.o
>  obj-$(CONFIG_VIDEO_OV2680) += ov2680.o
>  obj-$(CONFIG_VIDEO_OV2685) += ov2685.o
> +obj-$(CONFIG_VIDEO_OV2735) += ov2735.o
>  obj-$(CONFIG_VIDEO_OV2740) += ov2740.o
>  obj-$(CONFIG_VIDEO_OV4689) += ov4689.o
>  obj-$(CONFIG_VIDEO_OV5640) += ov5640.o
> diff --git a/drivers/media/i2c/ov2735.c b/drivers/media/i2c/ov2735.c
> new file mode 100644
> index 000000000000..a7df516eaedc
> --- /dev/null
> +++ b/drivers/media/i2c/ov2735.c
> @@ -0,0 +1,908 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * V4L2 Support for the OV2735
> + *
> + * Copyright (C) 2025 Silicon Signals Pvt. Ltd.
> + *
> + * Based on Rockchip ov2735 Camera Driver
> + * Copyright (C) 2017 Fuzhou Rockchip Electronics Co., Ltd.
> + *
> + * Inspired from ov8858, imx219, imx283 camera drivers
> + */
> +
> +#include <linux/array_size.h>
> +#include <linux/clk.h>
> +#include <linux/container_of.h>
> +#include <linux/delay.h>
> +#include <linux/device/devres.h>
> +#include <linux/err.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/property.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/units.h>
> +#include <linux/types.h>
> +
> +#include <media/v4l2-cci.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-mediabus.h>
> +
> +#define OV2735_XCLK_FREQ                       (24 * HZ_PER_MHZ)
> +
> +#define OV2735_REG_PAGE_SELECT                 CCI_REG8(0xfd)
> +
> +/* Page 0 */
> +#define OV2735_REG_CHIPID                      CCI_REG16(0x02)
> +#define OV2735_CHIPID                          0x2735
> +
> +#define OV2735_REG_SOFT_REST                   CCI_REG8(0x20)
> +
> +/* Clock Settings */
> +#define OV2735_REG_PLL_CTRL                    CCI_REG8(0x2f)
> +#define OV2735_REG_PLL_OUTDIV                  CCI_REG8(0x34)
> +#define OV2735_REG_CLK_MODE                    CCI_REG8(0x30)
> +#define OV2735_REG_CLOCK_REG1                  CCI_REG8(0x33)
> +#define OV2735_REG_CLOCK_REG2                  CCI_REG8(0x35)
> +
> +/* Page 1 */
> +#define OV2735_REG_STREAM_CTRL                 CCI_REG8(0xa0)
> +#define OV2735_STREAM_ON                       0x01
> +#define OV2735_STREAM_OFF                      0x00
> +
> +#define OV2735_REG_UPDOWN_MIRROR               CCI_REG8(0x3f)
> +#define OV2735_REG_BINNING_DAC_CODE_MODE       CCI_REG8(0x30)
> +#define OV2735_REG_FRAME_LENGTH                        CCI_REG16(0x0e)
> +#define OV2735_VTS_MAX                         0x0fff
> +#define OV2735_REG_FRAME_EXP_SEPERATE_EN       CCI_REG8(0x0d)
> +#define OV2735_FRAME_EXP_SEPERATE_EN           0x10
> +#define OV2735_REG_FRAME_SYNC                  CCI_REG8(0x01)
> +
> +#define OV2735_REG_HBLANK                      CCI_REG16(0x09)
> +
> +#define OV2735_REG_HS_MIPI                     CCI_REG8(0xb1)
> +#define OV2735_REG_MIPI_CTRL1                  CCI_REG8(0x92)
> +#define OV2735_REG_MIPI_CTRL2                  CCI_REG8(0x94)
> +#define OV2735_REG_MIPI_CTRL3                  CCI_REG8(0xa1)
> +#define OV2735_REG_MIPI_CTRL4                  CCI_REG8(0xb2)
> +#define OV2735_REG_MIPI_CTRL5                  CCI_REG8(0xb3)
> +#define OV2735_REG_MIPI_CTRL6                  CCI_REG8(0xb4)
> +#define OV2735_REG_MIPI_CTRL7                  CCI_REG8(0xb5)
> +#define OV2735_REG_PREPARE                     CCI_REG8(0x95)
> +#define OV2735_REG_R_HS_ZERO                   CCI_REG8(0x96)
> +#define OV2735_REG_TRAIL                       CCI_REG8(0x98)
> +#define OV2735_REG_R_CLK_ZERO                  CCI_REG8(0x9c)
> +#define OV2735_REG_MIPI_V_SIZE                 CCI_REG16(0x8e)
> +#define OV2735_REG_MIPI_H_SIZE                 CCI_REG16(0x90)
> +
> +#define OV2735_REG_ANALOG_CTRL3                        CCI_REG8(0x25)
> +#define OV2735_REG_VNCP                                CCI_REG8(0x20)
> +
> +/* BLC registers */
> +#define OV2735_REG_BLC_GAIN_BLUE               CCI_REG8(0x86)
> +#define OV2735_REG_BLC_GAIN_RED                        CCI_REG8(0x87)
> +#define OV2735_REG_BLC_GAIN_GR                 CCI_REG8(0x88)
> +#define OV2735_REG_BLC_GAIN_GB                 CCI_REG8(0x89)
> +#define OV2735_REG_GB_SUBOFFSET                        CCI_REG8(0xf0)
> +#define OV2735_REG_BLUE_SUBOFFSET              CCI_REG8(0xf1)
> +#define OV2735_REG_RED_SUBOFFSET               CCI_REG8(0xf2)
> +#define OV2735_REG_GR_SUBOFFSET                        CCI_REG8(0xf3)
> +#define OV2735_REG_BLC_BPC_TH_P                        CCI_REG8(0xfc)
> +#define OV2735_REG_BLC_BPC_TH_N                        CCI_REG8(0xfe)
> +
> +#define OV2735_REG_TEST_PATTERN                        CCI_REG8(0xb2)
> +#define OV2735_TEST_PATTERN_ENABLE             0x01
> +#define OV2735_TEST_PATTERN_DISABLE            0xfe
> +
> +#define OV2735_REG_LONG_EXPOSURE               CCI_REG16(0x03)
> +#define        OV2735_EXPOSURE_MIN                     4
> +#define        OV2735_EXPOSURE_STEP                    1
> +
> +#define OV2735_REG_ANALOG_GAIN                  CCI_REG8(0x24)
> +#define        OV2735_ANALOG_GAIN_MIN                  0x10
> +#define        OV2735_ANALOG_GAIN_MAX                  0xff
> +#define        OV2735_ANALOG_GAIN_STEP                 1
> +#define        OV2735_ANALOG_GAIN_DEFAULT              0x10
> +
> +/* Page 2 */
> +#define OV2735_REG_V_START                     CCI_REG16(0xa0)
> +#define OV2735_REG_V_SIZE                      CCI_REG16(0xa2)
> +#define OV2735_REG_H_START                     CCI_REG16(0xa4)
> +#define OV2735_REG_H_SIZE                      CCI_REG16(0xa6)
> +
> +#define OV2735_LINK_FREQ_420MHZ                        (420 * HZ_PER_MHZ)
> +#define OV2735_PIXEL_RATE                      (168 * HZ_PER_MHZ)
> +
> +static const char * const ov2735_supply_name[] = {
> +       "AVDD",         /* Analog power */
> +       "DOVDD",        /* Digital I/O power */
> +       "DVDD",         /* Digital core power */
> +};
> +
> +struct ov2735 {
> +       struct device *dev;
> +       struct regmap *cci;
> +       struct v4l2_subdev sd;
> +       struct media_pad pad;
> +       struct i2c_client *client;
> +       struct clk *xclk;
> +       struct gpio_desc *reset_gpio;
> +       struct gpio_desc *pwdn_gpio;
> +       struct regulator_bulk_data supplies[ARRAY_SIZE(ov2735_supply_name)];
> +
> +       /* V4L2 Controls */
> +       struct v4l2_ctrl_handler handler;
> +       struct v4l2_ctrl *link_freq;
> +       struct v4l2_ctrl *pixel_rate;
> +       struct v4l2_ctrl *hblank;
> +       struct v4l2_ctrl *vblank;
> +       struct v4l2_ctrl *gain;
> +       struct v4l2_ctrl *exposure;
> +       struct v4l2_ctrl *test_pattern;
> +};
> +
> +struct ov2735_reglist {
> +       unsigned int num_regs;
> +       const struct cci_reg_sequence *regvals;
> +};
> +
> +struct ov2735_mode {
> +       u32 width;
> +       u32 height;
> +       u32 hts_def;
> +       u32 vts_def;
> +       u32 exp_def;
> +       struct ov2735_reglist reg_list;
> +};
> +
> +static struct cci_reg_sequence ov2735_1920_1080_30fps[] = {
> +       { OV2735_REG_PAGE_SELECT,               0x00 },
> +       { OV2735_REG_PLL_CTRL,                  0x10 },
> +       { OV2735_REG_PLL_OUTDIV,                0x00 },
> +       { OV2735_REG_CLK_MODE,                  0x15 },
> +       { OV2735_REG_CLOCK_REG1,                0x01 },
> +       { OV2735_REG_CLOCK_REG2,                0x20 },
> +       { OV2735_REG_PAGE_SELECT,               0x01 },
> +       { OV2735_REG_BINNING_DAC_CODE_MODE,     0x00 },
> +       { CCI_REG8(0xfb),                       0x73 },
> +       { OV2735_REG_FRAME_SYNC,                0x01 },
> +       { OV2735_REG_PAGE_SELECT,               0x01 },
> +
> +       /* Timing ctrl */
> +       { CCI_REG8(0x1a), 0x6b },
> +       { CCI_REG8(0x1c), 0xea },
> +       { CCI_REG8(0x16), 0x0c },
> +       { CCI_REG8(0x21), 0x00 },
> +       { CCI_REG8(0x11), 0x63 },
> +       { CCI_REG8(0x19), 0xc3 },
> +
> +       /* Analog ctrl */
> +       { CCI_REG8(0x26), 0x5a },
> +       { CCI_REG8(0x29), 0x01 },
> +       { CCI_REG8(0x33), 0x6f },
> +       { CCI_REG8(0x2a), 0xd2 },
> +       { CCI_REG8(0x2c), 0x40 },
> +       { CCI_REG8(0xd0), 0x02 },
> +       { CCI_REG8(0xd1), 0x01 },
> +       { CCI_REG8(0xd2), 0x20 },
> +       { CCI_REG8(0xd3), 0x04 },
> +       { CCI_REG8(0xd4), 0x2a },
> +       { CCI_REG8(0x50), 0x00 },
> +       { CCI_REG8(0x51), 0x2c },
> +       { CCI_REG8(0x52), 0x29 },
> +       { CCI_REG8(0x53), 0x00 },
> +       { CCI_REG8(0x55), 0x44 },
> +       { CCI_REG8(0x58), 0x29 },
> +       { CCI_REG8(0x5a), 0x00 },
> +       { CCI_REG8(0x5b), 0x00 },
> +       { CCI_REG8(0x5d), 0x00 },
> +       { CCI_REG8(0x64), 0x2f },
> +       { CCI_REG8(0x66), 0x62 },
> +       { CCI_REG8(0x68), 0x5b },
> +       { CCI_REG8(0x75), 0x46 },
> +       { CCI_REG8(0x76), 0x36 },
> +       { CCI_REG8(0x77), 0x4f },
> +       { CCI_REG8(0x78), 0xef },
> +       { CCI_REG8(0x72), 0xcf },
> +       { CCI_REG8(0x73), 0x36 },
> +       { CCI_REG8(0x7d), 0x0d },
> +       { CCI_REG8(0x7e), 0x0d },
> +       { CCI_REG8(0x8a), 0x77 },
> +       { CCI_REG8(0x8b), 0x77 },
> +
> +       { OV2735_REG_PAGE_SELECT,       0x01 },
> +       { OV2735_REG_HS_MIPI,           0x83 },
> +       { OV2735_REG_MIPI_CTRL5,        0x0b },
> +       { OV2735_REG_MIPI_CTRL6,        0x14 },
> +       { CCI_REG8(0x9d),               0x40 },
> +       { OV2735_REG_MIPI_CTRL3,        0x05 },
> +       { OV2735_REG_MIPI_CTRL2,        0x44 },
> +       { OV2735_REG_PREPARE,           0x33 },
> +       { OV2735_REG_R_HS_ZERO, 0x1f },
> +       { OV2735_REG_TRAIL,             0x45 },
> +       { OV2735_REG_R_CLK_ZERO,        0x10 },
> +       { OV2735_REG_MIPI_CTRL7,        0x70 },
> +       { OV2735_REG_ANALOG_CTRL3,      0xe0 },
> +       { OV2735_REG_VNCP,              0x7b },
> +
> +       /* BLC */
> +       { OV2735_REG_PAGE_SELECT,       0x01 },
> +       { OV2735_REG_BLC_GAIN_BLUE,     0x77 },
> +       { OV2735_REG_BLC_GAIN_GB,       0x77 },
> +       { OV2735_REG_BLC_GAIN_RED,      0x74 },
> +       { OV2735_REG_BLC_GAIN_GR,       0x74 },
> +       { OV2735_REG_BLC_BPC_TH_P,      0xe0 },
> +       { OV2735_REG_BLC_BPC_TH_N,      0xe0 },
> +       { OV2735_REG_GB_SUBOFFSET,      0x40 },
> +       { OV2735_REG_BLUE_SUBOFFSET,    0x40 },
> +       { OV2735_REG_RED_SUBOFFSET,     0x40 },
> +       { OV2735_REG_GR_SUBOFFSET,      0x40 },
> +
> +       /* 1920x1080 */
> +       { OV2735_REG_PAGE_SELECT,       0x02 },
> +       { OV2735_REG_V_START,           0x0008 },
> +       { OV2735_REG_V_SIZE,            0x0438 },
> +       { OV2735_REG_H_START,           0x0008 },
> +       { OV2735_REG_H_SIZE,            0x03c0 },
> +       { OV2735_REG_PAGE_SELECT,       0x01 },
> +       { OV2735_REG_MIPI_V_SIZE,       0x0780 },
> +       { OV2735_REG_MIPI_H_SIZE,       0x0438 },
> +};
> +
> +static const struct ov2735_mode supported_modes[] = {
> +       {
> +               .width = 1920,
> +               .height = 1080,
> +               .exp_def = 399,
> +               .hts_def = 2200,
> +               .vts_def = 2545,
> +               .reg_list = {
> +                       .num_regs = ARRAY_SIZE(ov2735_1920_1080_30fps),
> +                       .regvals = ov2735_1920_1080_30fps,
> +               },
> +       },
> +};
> +
> +static const s64 link_freq_menu_items[] = {
> +       OV2735_LINK_FREQ_420MHZ,
> +};
> +
> +static const char * const ov2735_test_pattern_menu[] = {
> +       "Disabled",
> +       "Vertical Color",
> +};
> +
> +static const u32 ov2735_mbus_codes[] = {
> +       MEDIA_BUS_FMT_SGRBG10_1X10,
> +};

This is only used in ov2735_enum_mbus_code, but the code is hard coded
in ov2735_enum_frame_size and ov2735_init_state. Making it consistent
would be nice.

> +
> +static inline struct ov2735 *to_ov2735(struct v4l2_subdev *_sd)
> +{
> +       return container_of(_sd, struct ov2735, sd);
> +}
> +
> +static int ov2735_enable_test_pattern(struct ov2735 *ov2735, u32 pattern)
> +{
> +       int ret = 0;
> +       u64 val;
> +
> +       cci_read(ov2735->cci, OV2735_REG_TEST_PATTERN, &val, &ret);
> +       if (ret)
> +               return ret;
> +
> +       switch (pattern) {
> +       case 0:
> +               val &= ~OV2735_TEST_PATTERN_ENABLE;
> +               break;
> +       case 1:
> +               val |= OV2735_TEST_PATTERN_ENABLE;
> +               break;
> +       }
> +
> +       return cci_write(ov2735->cci, OV2735_REG_TEST_PATTERN, val, NULL);
> +}
> +
> +static int ov2735_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +       struct ov2735 *ov2735 = container_of(ctrl->handler, struct ov2735,
> +                                            handler);
> +       const struct ov2735_mode *mode;
> +       struct v4l2_mbus_framefmt *fmt;
> +       struct v4l2_subdev_state *state;
> +       u64 vts;
> +       int ret = 0;
> +
> +       state = v4l2_subdev_get_locked_active_state(&ov2735->sd);
> +       fmt = v4l2_subdev_state_get_format(state, 0);
> +
> +       mode = v4l2_find_nearest_size(supported_modes,
> +                                     ARRAY_SIZE(supported_modes),
> +                                     width, height,
> +                                     fmt->width, fmt->height);
> +
> +       if (ctrl->id == V4L2_CID_VBLANK) {
> +               /* Honour the VBLANK limits when setting exposure. */
> +               s64 max = mode->height + ctrl->val - 4;
> +
> +               ret = __v4l2_ctrl_modify_range(ov2735->exposure,
> +                                              ov2735->exposure->minimum, max,
> +                                        ov2735->exposure->step,
> +                                        ov2735->exposure->default_value);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       /*
> +        * Applying V4L2 control value only happens
> +        * when power is up for streaming.
> +        */
> +       if (pm_runtime_get_if_in_use(ov2735->dev) == 0)
> +               return 0;
> +
> +       cci_write(ov2735->cci, OV2735_REG_PAGE_SELECT, 0x01, &ret);
> +
> +       switch (ctrl->id) {
> +       case V4L2_CID_EXPOSURE:
> +               cci_write(ov2735->cci, OV2735_REG_LONG_EXPOSURE, ctrl->val, &ret);
> +               break;
> +       case V4L2_CID_ANALOGUE_GAIN:
> +               cci_write(ov2735->cci, OV2735_REG_ANALOG_GAIN, ctrl->val, &ret);
> +               break;
> +       case V4L2_CID_HBLANK:
> +               cci_write(ov2735->cci, OV2735_REG_HBLANK, ctrl->val, &ret);
> +               break;
> +       case V4L2_CID_VBLANK:
> +               vts = ctrl->val + mode->height;
> +               cci_write(ov2735->cci, OV2735_REG_FRAME_EXP_SEPERATE_EN,
> +                                      OV2735_FRAME_EXP_SEPERATE_EN, &ret);
> +               cci_write(ov2735->cci, OV2735_REG_FRAME_LENGTH, vts, &ret);
> +               break;
> +       case V4L2_CID_TEST_PATTERN:
> +               ret = ov2735_enable_test_pattern(ov2735, ctrl->val);
> +               break;
> +       default:
> +               dev_err(ov2735->dev, "ctrl(id:0x%x, val:0x%x) is not handled\n",
> +                       ctrl->id, ctrl->val);
> +               break;
> +       }
> +       cci_write(ov2735->cci, OV2735_REG_FRAME_SYNC, 0x01, &ret);
> +
> +       pm_runtime_put(ov2735->dev);
> +
> +       return ret;
> +}
> +
> +static const struct v4l2_ctrl_ops ov2735_ctrl_ops = {
> +       .s_ctrl = ov2735_set_ctrl,
> +};
> +
> +static int ov2735_init_controls(struct ov2735 *ov2735)
> +{
> +       struct v4l2_ctrl_handler *ctrl_hdlr;
> +       struct v4l2_fwnode_device_properties props;
> +       const struct ov2735_mode *mode = &supported_modes[0];
> +       u64 hblank_def, vblank_def, exp_max;
> +       int ret;
> +
> +       ctrl_hdlr = &ov2735->handler;
> +       ret = v4l2_ctrl_handler_init(ctrl_hdlr, 7);

You initialise 7 controls here, but also call
v4l2_ctrl_new_fwnode_properties which adds 2 additional ones, so this
should be 9.

  Dave

