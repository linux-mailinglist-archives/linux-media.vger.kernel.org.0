Return-Path: <linux-media+bounces-55576-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SH5HGkazs2lYZwAAu9opvQ
	(envelope-from <linux-media+bounces-55576-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 07:48:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A6D27E502
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 07:48:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 24AD13072BD2
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 06:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A42D635CB6B;
	Fri, 13 Mar 2026 06:48:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mailgateway.gmoserver.jp (smtp-gateway2-static080.gmoserver.jp [163.44.89.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE12F239E60;
	Fri, 13 Mar 2026 06:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=163.44.89.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773384497; cv=none; b=WdHcuG8+HKCTSilJAnOjihnGhI4nqZ9gc8pYNnYtwumAJpu/VGToG+Nex435EAu3blo8fmXnt7KmfYxKWefnN/tKFLFPfTnd7eQjI4K9fAhqpS35sTUIutIzOibMgRlJEpU6PHMQEba1W6D4J5LaEbW0Qjf2YEuY6atLBDC9tmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773384497; c=relaxed/simple;
	bh=+CZGxMFPq/OkFP+wIon1GxqhpwcUzAEbQNZHFcZ2dOY=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=tQ6DliBjkdFgRQsvoyI8pgScCs8F9Nztbk4Q6YkuQxKCUqHsmw8Ri6IuPePwkjwbgW8CMSIn3qYCazD0qb+nFK8YiLbADtaszjPvPLQK6WzsLw7kOiJ0A0LfnhcEoHM9Vn2aP3+cXQQJSzd2uEU5GXGQB2sOM5HQ9Crvmwa2ZXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=soho-enterprise.com; spf=pass smtp.mailfrom=soho-enterprise.com; arc=none smtp.client-ip=163.44.89.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=soho-enterprise.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soho-enterprise.com
Received: from smtp20.gmoserver.jp (unknown [172.17.55.150])
	by mailgateway.gmoserver.jp (Postfix) with ESMTP id 629B71B13FA;
	Fri, 13 Mar 2026 10:15:10 +0900 (JST)
Received: from localhost (localhost [127.0.0.1])
	by smtp20.gmoserver.jp (Postfix) with ESMTP id 36DA87C7E3;
	Fri, 13 Mar 2026 10:15:03 +0900 (JST)
X-Virus-Scanned: amavisd-new at gmoserver.jp
Received: from smtp20.gmoserver.jp ([127.0.0.1])
	by localhost (smtp20.gmoserver.jp [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4n-7YNYb++zK; Fri, 13 Mar 2026 10:15:03 +0900 (JST)
Received: from SohoPC02 (220-152-21-89.rev.home.ne.jp [220.152.21.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp20.gmoserver.jp (Postfix) with ESMTPSA id B11FB7C7A8;
	Fri, 13 Mar 2026 10:15:02 +0900 (JST)
From: <tetsuya.nomura@soho-enterprise.com>
To: "'Dave Stevenson'" <dave.stevenson@raspberrypi.com>,
	"'Alexander Shiyan'" <eagle.alexander923@gmail.com>
Cc: <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>,
	"'Mauro Carvalho Chehab'" <mchehab@kernel.org>,
	"'Rob Herring'" <robh@kernel.org>,
	"'Krzysztof Kozlowski'" <krzk+dt@kernel.org>,
	"'Conor Dooley'" <conor+dt@kernel.org>,
	"'Sakari Ailus'" <sakari.ailus@linux.intel.com>,
	"'Hans Verkuil'" <hverkuil@kernel.org>,
	"'Hans de Goede'" <hansg@kernel.org>,
	"'Manivannan Sadhasivam'" <manivannan.sadhasivam@linaro.org>,
	"'Will Whang'" <will@willwhang.com>
References: <20260312150437.1091195-1-eagle.alexander923@gmail.com> <20260312150437.1091195-3-eagle.alexander923@gmail.com> <CAPY8ntAf9TjgW-E6WeJuMdsHy8pV8-CvqQJriWEFpgLB-brD5A@mail.gmail.com>
In-Reply-To: <CAPY8ntAf9TjgW-E6WeJuMdsHy8pV8-CvqQJriWEFpgLB-brD5A@mail.gmail.com>
Subject: RE: [PATCH 2/2] media: i2c: Add driver for Sony IMX662 sensor
Date: Fri, 13 Mar 2026 10:15:01 +0900
Message-ID: <00ea01dcb286$d14e6590$73eb30b0$@soho-enterprise.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQLWkgMh2oM9tpRNzZ6qmyNCdJVM7ADy4dAGAhzDOYuzn2rOoA==
Content-Language: ja
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	TAGGED_FROM(0.00)[bounces-55576-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[raspberrypi.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[soho-enterprise.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.955];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tetsuya.nomura@soho-enterprise.com,linux-media@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,linaro.org:email,soho-enterprise.com:email,soho-enterprise.com:mid,soho-enterprise.com:url,raspberrypi.com:email]
X-Rspamd-Queue-Id: 84A6D27E502
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Dear Alex-san and Dave-san,

This is Nomura from Soho Enterprise Ltd.
Thank you for your comments on this driver.

I would like to add a small note regarding the background of the current =
implementation.

There is actually another publicly available V4L2 driver for the IMX662.
For example, Will Whang (added to Cc) has published the following =
driver:

https://github.com/will127534/imx662-v4l2-driver

Unlike my early IMX662 driver, which was initially derived from the =
Raspberry Pi Foundation=E2=80=99s IMX290 driver as a temporary =
implementation, Will Whang=E2=80=99s driver is based on the IMX585 =
driver.

Because of that, it already implements several features, including:

Support for both 2-lane and 4-lane CSI-2 configurations
Support for MONO sensor variants
Support for HCG mode

In addition, the link-frequency configuration also appears to be =
consistent with the implementation used for IMX585-based drivers.

From a functional point of view, it seems to be a relatively complete =
implementation.

It is possible that the current patch was developed based on the =
temporary IMX662 driver I previously published (which itself was derived =
from IMX290), but if the goal is to upstream IMX662 support, it might be =
useful to also review Will Whang=E2=80=99s implementation and =
potentially combine the best parts of the different drivers.

I am not an expert in V4L2 driver development, so I do not have a =
concrete proposal on how such a merge should be done, but I wanted to =
share this information in case it is useful for improving the IMX662 =
support overall.

Thank you for working on upstream support for the IMX662.

Best regards,

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Tetsuya NOMURA
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Soho Enterprise Ltd.
4-11-26 Gent BLDG 2F, Asahi-cho, Atsugi-shi,=20
Kanagawa, Japan  243-0014
URL: https://soho-enterprise.com
Mail: tetsuya.nomura@soho-enterprise.com
Phone: +81-90-1839-1135
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D


-----Original Message-----
From: Dave Stevenson <dave.stevenson@raspberrypi.com>=20
Sent: Friday, March 13, 2026 4:50 AM
To: Alexander Shiyan <eagle.alexander923@gmail.com>
Cc: linux-media@vger.kernel.org; devicetree@vger.kernel.org; Mauro =
Carvalho Chehab <mchehab@kernel.org>; Rob Herring <robh@kernel.org>; =
Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley =
<conor+dt@kernel.org>; Sakari Ailus <sakari.ailus@linux.intel.com>; Hans =
Verkuil <hverkuil@kernel.org>; Hans de Goede <hansg@kernel.org>; Tetsuya =
Nomura <tetsuya.nomura@soho-enterprise.com>; Manivannan Sadhasivam =
<manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 2/2] media: i2c: Add driver for Sony IMX662 sensor

Hi Alexander

On Thu, 12 Mar 2026 at 15:11, Alexander Shiyan =
<eagle.alexander923@gmail.com> wrote:
>
> This patch adds a V4L2 subdevice driver for the Sony IMX662 CMOS image =

> sensor. The sensor has a native resolution of 1936x1100 (effective
> 1920x1080) and can achieve up to 90 frames per second depending on the =

> configuration. The driver supports:
> - MIPI CSI-2 with 2 or 4 data lanes.
> - RAW10 and RAW12 formats (both colour and monochrome).
> - Controls: exposure, analogue gain, horizontal/vertical blanking,
>   horizontal/vertical flip, brightness.
> - A placeholder V4L2_CID_HDR_SENSOR_MODE control for future Clear HDR
>   support (the actual HDR modes are not yet implemented).
> - Runtime PM.
> - Cropping via the selection API.
> - Multiple link frequencies selectable via device tree.
>
> Tested on ARM64 Rockchip RK3568 platform with a 24 MHz external clock=20
> and various link frequencies.

Interesting timing as I've been looking at IMX662 too, but on a =
Raspberry Pi.
FWIW my driver is at
https://github.com/6by9/linux/blob/rpi-6.12.y-imx662/drivers/media/i2c/im=
x662.c

Comments are based on brief testing and reading of the code. This is not =
a full review.

> Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
> ---
>  drivers/media/i2c/Kconfig  |   11 +
>  drivers/media/i2c/Makefile |    1 +
>  drivers/media/i2c/imx662.c | 1176=20
> ++++++++++++++++++++++++++++++++++++
>  3 files changed, 1188 insertions(+)
>  create mode 100644 drivers/media/i2c/imx662.c
>
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig=20
> index 609b6a8fc6db..936461b685fe 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -310,6 +310,17 @@ config VIDEO_IMX415
>           To compile this driver as a module, choose M here: the
>           module will be called imx415.
>
> +config VIDEO_IMX662
> +       tristate "Sony IMX662 sensor support"
> +       depends on OF || COMPILE_TEST
> +       select V4L2_CCI_I2C
> +       help
> +         This is a Video4Linux2 sensor driver for the Sony
> +         IMX662 camera.
> +
> +         To compile this driver as a module, choose M here: the
> +         module will be called imx662.
> +
>  config VIDEO_IMX678
>         tristate "Sony IMX678 sensor support"
>         depends on OF_GPIO
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile=20
> index 35e6ccbe16d9..e18cb8a68360 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -63,6 +63,7 @@ obj-$(CONFIG_VIDEO_IMX335) +=3D imx335.o
>  obj-$(CONFIG_VIDEO_IMX355) +=3D imx355.o
>  obj-$(CONFIG_VIDEO_IMX412) +=3D imx412.o
>  obj-$(CONFIG_VIDEO_IMX415) +=3D imx415.o
> +obj-$(CONFIG_VIDEO_IMX662) +=3D imx662.o
>  obj-$(CONFIG_VIDEO_IMX678) +=3D imx678.o
>  obj-$(CONFIG_VIDEO_IR_I2C) +=3D ir-kbd-i2c.o
>  obj-$(CONFIG_VIDEO_ISL7998X) +=3D isl7998x.o diff --git=20
> a/drivers/media/i2c/imx662.c b/drivers/media/i2c/imx662.c new file=20
> mode 100644 index 000000000000..d7be17b5a47d
> --- /dev/null
> +++ b/drivers/media/i2c/imx662.c
> @@ -0,0 +1,1176 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Driver for the Sony IMX662 CMOS Image Sensor
> + *
> + * Copyright (C) 2026 Alexander Shiyan <eagle.alexander923@gmail.com>
> + *
> + * Some parts of code taken from imx662.c by:
> + * Copyright (C) 2022 Soho Enterprise Ltd.
> + * Author: Tetsuya Nomura <tetsuya.nomura@soho-enterprise.com>
> + *
> + * Some parts of code taken from imx290.c by:
> + * Copyright (C) 2019 FRAMOS GmbH.
> + * Copyright (C) 2019 Linaro Ltd.
> + * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/module.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/regulator/consumer.h> #include <media/v4l2-cci.h>=20
> +#include <media/v4l2-ctrls.h> #include <media/v4l2-event.h> #include=20
> +<media/v4l2-fwnode.h> #include <media/v4l2-subdev.h>
> +
> +#define IMX662_STANDBY                         CCI_REG8(0x3000)
> +#define IMX662_REGHOLD                         CCI_REG8(0x3001)
> +#define IMX662_XMSTA                           CCI_REG8(0x3002)
> +#define IMX662_INCK_SEL                                =
CCI_REG8(0x3014)
> +#      define IMX662_INCK_SEL_74_25            (0x00)
> +#      define IMX662_INCK_SEL_37_125           (0x01)
> +#      define IMX662_INCK_SEL_72               (0x02)
> +#      define IMX662_INCK_SEL_27               (0x03)
> +#      define IMX662_INCK_SEL_24               (0x04)
> +#define IMX662_DATARATE_SEL                    CCI_REG8(0x3015)
> +
> +enum {
> +       IMX662_DATARATE_2376    =3D 0,
> +       IMX662_DATARATE_2079    =3D 1,
> +       IMX662_DATARATE_1782    =3D 2,
> +       IMX662_DATARATE_1440    =3D 3,
> +       IMX662_DATARATE_1188    =3D 4,
> +       IMX662_DATARATE_891     =3D 5,
> +       IMX662_DATARATE_720     =3D 6,
> +       IMX662_DATARATE_594     =3D 7,
> +       IMX662_DATARATE_MAX
> +};
> +
> +#define IMX662_WINMODE                         CCI_REG8(0x3018)
> +#define IMX662_WDMODE                          CCI_REG8(0x301a)
> +#define IMX662_VCMODE                          CCI_REG8(0x301e)
> +#define IMX662_HREVERSE                                =
CCI_REG8(0x3020)
> +#define IMX662_VREVERSE                                =
CCI_REG8(0x3021)
> +#define IMX662_ADBIT                           CCI_REG8(0x3022)
> +#define IMX662_MDBIT                           CCI_REG8(0x3023)
> +#define IMX662_VMAX                            CCI_REG24_LE(0x3028)
> +#      define IMX662_VMAX_MAX                  (0x0ffffe)
> +#define IMX662_HMAX                            CCI_REG16_LE(0x302c)
> +#      define IMX662_HMAX_MAX                  (0xffff)
> +#define IMX662_FDG_SEL0                                =
CCI_REG8(0x3030)
> +#      define IMX662_FDG_SEL0_LCG              (0x00)
> +#      define IMX662_FDG_SEL0_HCG              (0x01)
> +#define IMX662_FDG_SEL1                                =
CCI_REG8(0x3031)
> +#define IMX662_PIX_HST                         CCI_REG16_LE(0x303c)
> +#define IMX662_LANEMODE                                =
CCI_REG8(0x3040)
> +#define IMX662_PIX_HWIDTH                      CCI_REG16_LE(0x303e)
> +#define IMX662_PIX_VST                         CCI_REG16_LE(0x3044)
> +#define IMX662_PIX_VWIDTH                      CCI_REG16_LE(0x3046)
> +#define IMX662_SHR0                            CCI_REG24_LE(0x3050)
> +#      define IMX662_SHR0_MIN                  (4)
> +#define IMX662_SHR1                            CCI_REG24_LE(0x3054)
> +#define IMX662_RHS1                            CCI_REG24_LE(0x3060)
> +#define IMX662_CHDR_GAIN_EN                    CCI_REG8(0x3069)
> +#define IMX662_GAIN                            CCI_REG16_LE(0x3070)
> +#      define IMX662_ANA_GAIN_HCG_MIN          (0x22)
> +#define IMX662_GAIN1                           CCI_REG16_LE(0x3072)
> +#define IMX662_EXP_GAIN                                =
CCI_REG8(0x3081)
> +#define IMX662_CHDR_DGAIN0_HG                  CCI_REG16_LE(0x308c)
> +#define IMX662_CHDR_AGAIN0_LG                  CCI_REG16_LE(0x3094)
> +#define IMX662_CHDR_AGAIN1                     CCI_REG16_LE(0x3096)
> +#define IMX662_CHDR_AGAIN0_HG                  CCI_REG16_LE(0x309c)
> +#define IMX662_BLKLEVEL                                =
CCI_REG16_LE(0x30dc)
> +#define IMX662_GAIN_PGC_FIDMD                  CCI_REG8(0x3400)
> +
> +#define IMX662_NATIVE_WIDTH                    (1936U)
> +#define IMX662_NATIVE_HEIGHT                   (1100U)
> +#define IMX662_PIXEL_ARRAY_LEFT                        (8U)
> +#define IMX662_PIXEL_ARRAY_TOP                 (8U)
> +#define IMX662_PIXEL_ARRAY_WIDTH               (1920U)
> +#define IMX662_PIXEL_ARRAY_HEIGHT              (1080U)
> +#define IMX662_MIN_CROP_WIDTH                  (80U)
> +#define IMX662_MIN_CROP_HEIGHT                 (180U)
> +#define IMX662_CROP_WIDTH_STEP                 (16U)
> +#define IMX662_CROP_HEIGHT_STEP                        (4U)
> +
> +enum imx662_colour_variant {
> +       IMX662_VARIANT_COLOUR,
> +       IMX662_VARIANT_MONO,
> +       IMX662_VARIANT_MAX
> +};
> +
> +enum imx662_hdr_mode {
> +       IMX662_HDR_OFF,
> +       IMX662_HDR_CLRHDR,
> +       IMX662_HDR_CLRHDR_DOL2,
> +       IMX662_HDR_MAX
> +};
> +
> +static const char * const imx662_supply_names[] =3D {
> +       "avdd",
> +       "dvdd",
> +       "ovdd",
> +};
> +
> +struct imx662_format {
> +       u8 bpp;
> +       u8 ad_md_bit;
> +       u16 hmax_lane2[IMX662_DATARATE_MAX];
> +       u16 hmax_lane4[IMX662_DATARATE_MAX];
> +       u32 code[IMX662_VARIANT_MAX];
> +};
> +
> +struct imx662 {
> +       struct device *dev;
> +       struct clk *clk;
> +       struct regmap *regmap;
> +
> +       struct v4l2_subdev sd;
> +       struct media_pad pad;
> +
> +       struct regulator_bulk_data =
supplies[ARRAY_SIZE(imx662_supply_names)];
> +       struct gpio_desc *reset;
> +
> +       unsigned int num_data_lanes;
> +
> +       u8 link_freq_index;
> +       u8 inck;
> +
> +       enum imx662_colour_variant variant;
> +
> +       enum imx662_hdr_mode hdr;
> +
> +       const struct imx662_format *format;
> +
> +       struct v4l2_rect crop;
> +
> +       bool streaming;
> +
> +       struct v4l2_ctrl_handler ctrls;
> +
> +       struct v4l2_ctrl *pixel_rate;
> +       struct v4l2_ctrl *link_freq;
> +       struct v4l2_ctrl *hblank;
> +       struct v4l2_ctrl *vblank;
> +       struct v4l2_ctrl *exposure;
> +       struct v4l2_ctrl *gain;
> +       struct v4l2_ctrl *hflip;
> +       struct v4l2_ctrl *vflip;
> +};
> +
> +static inline struct imx662 *to_imx662(struct v4l2_subdev *_sd) {
> +       return container_of(_sd, struct imx662, sd); }
> +
> +static const struct cci_reg_sequence imx662_regs_common[] =3D {
> +       { IMX662_WINMODE, 0x04 },
> +       { IMX662_CHDR_GAIN_EN, 0x00 },
> +       { IMX662_CHDR_DGAIN0_HG, 0x0100 },
> +       { IMX662_CHDR_AGAIN0_LG, 0x0000 },
> +       { IMX662_CHDR_AGAIN1, 0x0000 },
> +       { IMX662_CHDR_AGAIN0_HG, 0x0000 }, };
> +
> +static const struct cci_reg_sequence imx662_regs_hdr_off[] =3D {
> +       { IMX662_WDMODE, 0x00 },
> +       { IMX662_VCMODE, 0x01 },
> +       { IMX662_FDG_SEL1, 0x00 },
> +       { IMX662_SHR1, 0x000093 },
> +       { IMX662_RHS1, 0x000095 },
> +       { IMX662_GAIN1, 0x0000 },
> +       { IMX662_EXP_GAIN, 0x00 },
> +       { IMX662_GAIN_PGC_FIDMD, 0x01 }, };
> +
> +static const s64 imx662_link_freqs[] =3D {
> +       [IMX662_DATARATE_2376]  =3D 2376000000LL / 2,
> +       [IMX662_DATARATE_2079]  =3D 2079000000LL / 2,
> +       [IMX662_DATARATE_1782]  =3D 1782000000LL / 2,
> +       [IMX662_DATARATE_1440]  =3D 1440000000LL / 2,
> +       [IMX662_DATARATE_1188]  =3D 1188000000LL / 2,
> +       [IMX662_DATARATE_891]   =3D 891000000LL / 2,
> +       [IMX662_DATARATE_720]   =3D 720000000LL / 2,
> +       [IMX662_DATARATE_594]   =3D 594000000LL / 2,
> +};
> +
> +static const char * const imx662_hdr_menu[] =3D {
> +       [IMX662_HDR_OFF] =3D "No HDR",
> +       /* Not implemented modes: */
> +       /* [IMX662_HDR_CLRHDR] =3D "Clear HDR" */
> +       /* [IMX662_HDR_CLRHDR_DOL2] =3D "Clear HDR + DOL 2 Frame" */ =
};
> +
> +static const struct imx662_format imx662_formats[] =3D {
> +       {
> +               .bpp =3D 10,
> +               .ad_md_bit =3D 0,
> +               .hmax_lane2 =3D {
> +                       [IMX662_DATARATE_594] =3D 2376,
> +                       [IMX662_DATARATE_720] =3D 1980,
> +                       [IMX662_DATARATE_891] =3D 990,
> +                       [IMX662_DATARATE_1440] =3D 660,
> +               },
> +               .hmax_lane4 =3D {
> +                       [IMX662_DATARATE_594] =3D 990,
> +                       [IMX662_DATARATE_720] =3D 660,
> +               },
> +               .code =3D {
> +                       [IMX662_VARIANT_COLOUR] =3D =
MEDIA_BUS_FMT_SRGGB10_1X10,
> +                       [IMX662_VARIANT_MONO] =3D =
MEDIA_BUS_FMT_Y10_1X10,
> +               },
> +       }, {
> +               .bpp =3D 12,
> +               .ad_md_bit =3D BIT(0),
> +               .hmax_lane2 =3D {
> +                       [IMX662_DATARATE_720] =3D 1980,
> +                       [IMX662_DATARATE_891] =3D 1188,
> +                       [IMX662_DATARATE_1188] =3D 990,
> +               },
> +               .hmax_lane4 =3D {
> +                       [IMX662_DATARATE_594] =3D 990,
> +               },
> +               .code =3D {
> +                       [IMX662_VARIANT_COLOUR] =3D =
MEDIA_BUS_FMT_SRGGB12_1X12,
> +                       [IMX662_VARIANT_MONO] =3D =
MEDIA_BUS_FMT_Y12_1X12,
> +               },
> +       },
> +};
> +
> +static int imx662_set_gain(struct imx662 *imx662, u32 value) {
> +       int ret =3D 0;
> +
> +       if (imx662->hdr =3D=3D IMX662_HDR_OFF) {
> +               bool useHGC =3D value >=3D IMX662_ANA_GAIN_HCG_MIN;
> +
> +               cci_write(imx662->regmap, IMX662_REGHOLD, 1, &ret);
> +               cci_write(imx662->regmap, IMX662_GAIN, value, &ret);
> +               cci_write(imx662->regmap, IMX662_FDG_SEL0,
> +                         useHGC ? IMX662_FDG_SEL0_HCG : =
IMX662_FDG_SEL0_LCG,
> +                         &ret);

IIRC HCG adds in another 12dB or something of gain. Automatically =
enabling it above a value of 0x22 means that the gain response isn't =
consistent with a band of gains that can't be achieved.
Running libcamera with this driver I get significant oscillation as HCG =
gets turned on and off. Fix useHGC =3D 0 and the exposure and gain =
control is stable.

AIUI Use of HCG should be a separate control if it is to be used.

> +               cci_write(imx662->regmap, IMX662_REGHOLD, 0, NULL);
> +       } else
> +               ret =3D -EINVAL;
> +
> +       return ret;
> +}
> +
> +static int imx662_set_hblank(struct imx662 *imx662, u32 value) {
> +       unsigned int hmax_min;
> +
> +       if (imx662->num_data_lanes =3D=3D 2)
> +               hmax_min =3D
> +                       =
imx662->format->hmax_lane2[imx662->link_freq_index];
> +       else
> +               hmax_min =3D
> +                      =20
> + imx662->format->hmax_lane4[imx662->link_freq_index];
> +
> +       if (!hmax_min)
> +               return -EINVAL;
> +
> +       return cci_write(imx662->regmap, IMX662_HMAX, hmax_min +=20
> +value, NULL); }
> +
> +static void imx662_exposure_update(struct imx662 *imx662) {
> +       int exposure_max, exposure_val;
> +
> +       exposure_max =3D
> +               imx662->vblank->val + imx662->crop.height - =
IMX662_SHR0_MIN - 1;
> +       exposure_val =3D
> +               clamp(imx662->exposure->val, IMX662_SHR0_MIN,=20
> + exposure_max);
> +
> +       __v4l2_ctrl_modify_range(imx662->exposure, IMX662_SHR0_MIN,
> +                                exposure_max, 1, exposure_val);
> +       __v4l2_ctrl_s_ctrl(imx662->exposure, exposure_val); }
> +
> +static void imx662_gain_update(struct imx662 *imx662) {
> +       /* Should be differ (max 80 + EXP_GAIN?) in HDR modes */
> +       __v4l2_ctrl_modify_range(imx662->gain, 0, 240, 1, 0); }
> +
> +static void imx662_set_link_limits(struct imx662 *imx662) {
> +       u64 pixel_rate;
> +
> +       pixel_rate =3D imx662_link_freqs[imx662->link_freq_index] * 2;
> +       pixel_rate *=3D imx662->num_data_lanes;
> +       do_div(pixel_rate, imx662->format->bpp);
> +
> +       __v4l2_ctrl_s_ctrl_int64(imx662->pixel_rate, pixel_rate);

Are you sure on this? All my testing had pixel rate being independent of =
bit depth and number of lanes.
Trying your driver with 360Hz link freq / 720Mbit/s data rate on 2 =
lanes. All the computations end up with a max frame rate of 60fps in =
10bit mode and 50fps in 12bit, when I'm expecting a max of 30fps from =
the datasheet.
Asking for 1920x1080 12bit @ 30fps via libcamera results in hblank of
0 and vblank of 1003 with a pixel rate of 120000000. The actual =
framerate achieved is 27.85fps.

I'd found working from a pixel rate of 222750000 (INCK of 74.250*3), and =
writing HMAX with the "normal" line length value of width+hblank but =
divided by 3, all the numbers for line time and frame rate control fall =
out.
IMX415 was similar, but some input clocks multiplied up to 72MHz instead =
of 74.25MHz and produced a set of different link frequencies, so =
complicated matters.

> +}
> +
> +static int imx662_set_framing_limits(struct imx662 *imx662) {
> +       unsigned int vmax_min, hblank_max, vblank_min, vblank_max;
> +
> +       if (imx662->hdr =3D=3D IMX662_HDR_OFF)
> +               vmax_min =3D 1250;
> +       else
> +               vmax_min =3D 2500;
> +
> +       hblank_max =3D IMX662_HMAX_MAX - imx662->crop.width;
> +       vblank_min =3D vmax_min - imx662->crop.height;
> +       vblank_max =3D IMX662_VMAX_MAX - imx662->crop.height;
> +
> +       __v4l2_ctrl_modify_range(imx662->hblank, 0, hblank_max, 1, 0);
> +
> +       __v4l2_ctrl_modify_range(imx662->vblank, vblank_min, =
vblank_max,
> +                                1, vblank_min);
> +
> +       return 0;
> +}
> +
> +static int imx662_set_ctrl(struct v4l2_ctrl *ctrl) {
> +       struct imx662 *imx662 =3D container_of(ctrl->handler,
> +                                            struct imx662, ctrls);
> +       int ret =3D 0;
> +
> +       if (ctrl->flags & V4L2_CTRL_FLAG_READ_ONLY)
> +               return 0;
> +
> +       if (!pm_runtime_get_if_in_use(imx662->dev))
> +               return 0;
> +
> +       switch (ctrl->id) {
> +       case V4L2_CID_HBLANK:
> +               ret =3D imx662_set_hblank(imx662, ctrl->val);
> +               break;
> +       case V4L2_CID_VBLANK:
> +               cci_write(imx662->regmap, IMX662_VMAX,
> +                         ctrl->val + imx662->crop.height, &ret);
> +               if (ret)
> +                       break;
> +               imx662_exposure_update(imx662);
> +               break;
> +       case V4L2_CID_EXPOSURE:
> +               cci_write(imx662->regmap, IMX662_SHR0,
> +                         imx662->vblank->val + imx662->crop.height -
> +                         ctrl->val - 1, &ret);
> +               break;
> +       case V4L2_CID_ANALOGUE_GAIN:
> +               ret =3D imx662_set_gain(imx662, ctrl->val);
> +               break;
> +       case V4L2_CID_HFLIP:
> +               cci_write(imx662->regmap, IMX662_HREVERSE,
> +                         ctrl->val ? BIT(0) : 0x00, &ret);
> +               break;
> +       case V4L2_CID_VFLIP:
> +               cci_write(imx662->regmap, IMX662_VREVERSE,
> +                         ctrl->val ? BIT(0) : 0x00, &ret);
> +               break;
> +       case V4L2_CID_BRIGHTNESS:
> +               cci_write(imx662->regmap, IMX662_BLKLEVEL, ctrl->val,=20
> + &ret);

Setting the black level based on the brightness control isn't one I've =
seen done on any other image sensor. It has similarities, but feels very =
wrong.

> +               break;
> +       case V4L2_CID_HDR_SENSOR_MODE:
> +               if (!imx662->streaming) {
> +                       imx662->hdr =3D ctrl->val;
> +                       imx662_gain_update(imx662);
> +                       ret =3D imx662_set_framing_limits(imx662);
> +               } else
> +                       ret =3D -EBUSY;
> +               break;
> +       default:
> +               dev_err(imx662->dev, "Invalid control %d\n", =
ctrl->id);
> +               ret =3D -EINVAL;
> +               break;
> +       }
> +
> +       pm_runtime_put_autosuspend(imx662->dev);
> +
> +       return ret;
> +}
> +
> +static const struct v4l2_ctrl_ops imx662_ctrl_ops =3D {
> +       .s_ctrl =3D imx662_set_ctrl,
> +};
> +
> +static int imx662_enum_mbus_code(struct v4l2_subdev *sd,
> +                                struct v4l2_subdev_state *sd_state,
> +                                struct v4l2_subdev_mbus_code_enum=20
> +*code) {
> +       struct imx662 *imx662 =3D to_imx662(sd);
> +       const struct imx662_format *fmt;
> +       u16 hmax_min;
> +
> +       if (code->index >=3D ARRAY_SIZE(imx662_formats))
> +               return -EINVAL;
> +
> +       fmt =3D &imx662_formats[code->index];
> +       if (imx662->num_data_lanes =3D=3D 2)
> +               hmax_min =3D fmt->hmax_lane2[imx662->link_freq_index];
> +       else
> +               hmax_min =3D fmt->hmax_lane4[imx662->link_freq_index];
> +       if (!hmax_min)
> +               return -EINVAL;

This doesn't work.
I happened to test with a link frequency of 1188 first on 2 lanes.
That is valid for 12bit but not 10bit.
v4l2-ctl --list-subdev-mbus-codes will start at index 0 which fails, and =
therefore it never tries index 1 which would work.
The supported formats need to be contiguous starting at index 0.

> +
> +       code->code =3D=20
> + imx662_formats[code->index].code[imx662->variant];
> +
> +       return 0;
> +}
> +
> +static int imx662_enum_frame_size(struct v4l2_subdev *sd,
> +                                 struct v4l2_subdev_state *sd_state,
> +                                 struct v4l2_subdev_frame_size_enum=20
> +*fse) {
> +       if (fse->index)
> +               return -EINVAL;
> +
> +       fse->min_width =3D IMX662_MIN_CROP_WIDTH;
> +       fse->max_width =3D IMX662_PIXEL_ARRAY_WIDTH;
> +       fse->min_height =3D IMX662_MIN_CROP_HEIGHT;
> +       fse->max_height =3D IMX662_PIXEL_ARRAY_HEIGHT;
> +
> +       return 0;
> +}
> +
> +static int imx662_set_pad_format(struct v4l2_subdev *sd,
> +                                struct v4l2_subdev_state *sd_state,
> +                                struct v4l2_subdev_format *fmt) {
> +       struct imx662 *imx662 =3D to_imx662(sd);
> +       const struct imx662_format *format;
> +       u32 width, height;
> +       int i, ret;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(imx662_formats); i++) {
> +               if (imx662_formats[i].code[imx662->variant] =3D=3D
> +                   fmt->format.code) {
> +                       format =3D &imx662_formats[i];
> +                       break;
> +               }
> +       }
> +       if (!format)
> +               return -EINVAL;
> +
> +       width =3D round_down(fmt->format.width, =
IMX662_CROP_WIDTH_STEP);
> +       width =3D clamp(width, IMX662_MIN_CROP_WIDTH, =
IMX662_PIXEL_ARRAY_WIDTH);
> +       height =3D round_down(fmt->format.height, =
IMX662_CROP_HEIGHT_STEP);
> +       height =3D clamp(height,
> +                      IMX662_MIN_CROP_HEIGHT,=20
> + IMX662_PIXEL_ARRAY_HEIGHT);
> +
> +       fmt->format.width =3D width;
> +       fmt->format.height =3D height;
> +       fmt->format.field =3D V4L2_FIELD_NONE;
> +       fmt->format.colorspace =3D V4L2_COLORSPACE_RAW;
> +       fmt->format.ycbcr_enc =3D V4L2_YCBCR_ENC_DEFAULT;
> +       fmt->format.quantization =3D V4L2_QUANTIZATION_DEFAULT;
> +       fmt->format.xfer_func =3D V4L2_XFER_FUNC_NONE;
> +
> +       if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_TRY) {
> +               *v4l2_subdev_state_get_format(sd_state, fmt->pad) =3D =
fmt->format;
> +               return 0;
> +       }
> +
> +       if (imx662->format !=3D format) {
> +               imx662->format =3D format;
> +               imx662_set_link_limits(imx662);
> +               ret =3D imx662_set_framing_limits(imx662);
> +               if (ret)
> +                       return ret;
> +               imx662_exposure_update(imx662);
> +       }
> +
> +       if (imx662->crop.width !=3D width || imx662->crop.height !=3D =
height) {
> +               imx662->crop.width =3D width;
> +               imx662->crop.height =3D height;
> +               imx662->crop.left =3D
> +                       min_t(u32, imx662->crop.left, =
IMX662_PIXEL_ARRAY_LEFT +
> +                             IMX662_PIXEL_ARRAY_WIDTH - width);
> +               imx662->crop.top =3D
> +                       min_t(u32, imx662->crop.top, =
IMX662_PIXEL_ARRAY_TOP +
> +                             IMX662_PIXEL_ARRAY_HEIGHT - height);
> +               imx662->crop.left =3D
> +                       max(imx662->crop.left, =
IMX662_PIXEL_ARRAY_LEFT);
> +               imx662->crop.top =3D
> +                       max(imx662->crop.top, IMX662_PIXEL_ARRAY_TOP);
> +
> +               ret =3D imx662_set_framing_limits(imx662);
> +               if (ret)
> +                       return ret;
> +
> +               imx662_exposure_update(imx662);
> +       }
> +
> +       *v4l2_subdev_state_get_format(sd_state, fmt->pad) =3D=20
> + fmt->format;
> +
> +       return 0;
> +}
> +
> +static int imx662_get_selection(struct v4l2_subdev *sd,
> +                               struct v4l2_subdev_state *sd_state,
> +                               struct v4l2_subdev_selection *sel) {
> +       struct imx662 *imx662 =3D to_imx662(sd);
> +
> +       switch (sel->target) {
> +       case V4L2_SEL_TGT_CROP:
> +               if (sel->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> +                       sel->r =3D
> +                               *v4l2_subdev_state_get_crop(sd_state, =
sel->pad);
> +               else
> +                       sel->r =3D imx662->crop;
> +
> +               return 0;
> +       case V4L2_SEL_TGT_CROP_DEFAULT:
> +       case V4L2_SEL_TGT_CROP_BOUNDS:
> +               sel->r.top =3D IMX662_PIXEL_ARRAY_TOP;
> +               sel->r.left =3D IMX662_PIXEL_ARRAY_LEFT;
> +               sel->r.width =3D IMX662_PIXEL_ARRAY_WIDTH;
> +               sel->r.height =3D IMX662_PIXEL_ARRAY_HEIGHT;
> +
> +               return 0;
> +       case V4L2_SEL_TGT_NATIVE_SIZE:
> +               sel->r.top =3D 0;
> +               sel->r.left =3D 0;
> +               sel->r.width =3D IMX662_NATIVE_WIDTH;
> +               sel->r.height =3D IMX662_NATIVE_HEIGHT;
> +
> +               return 0;
> +       }
> +
> +       return -EINVAL;
> +}
> +
> +static int imx662_set_selection(struct v4l2_subdev *sd,
> +                               struct v4l2_subdev_state *sd_state,
> +                               struct v4l2_subdev_selection *sel) {
> +       struct imx662 *imx662 =3D to_imx662(sd);
> +       struct v4l2_rect rect =3D sel->r;
> +       struct v4l2_rect *try_crop;
> +       struct v4l2_mbus_framefmt *try_fmt;
> +       u32 max_left, max_top;
> +
> +       if (sel->target !=3D V4L2_SEL_TGT_CROP)
> +               return -EINVAL;
> +
> +       max_left =3D IMX662_PIXEL_ARRAY_LEFT + =
IMX662_PIXEL_ARRAY_WIDTH -
> +                  IMX662_MIN_CROP_WIDTH;
> +       max_top =3D IMX662_PIXEL_ARRAY_TOP + IMX662_PIXEL_ARRAY_HEIGHT =
-
> +                 IMX662_MIN_CROP_HEIGHT;
> +
> +       rect.left =3D clamp_t(u32, rect.left, IMX662_PIXEL_ARRAY_LEFT, =
max_left);
> +       rect.top =3D clamp_t(u32, rect.top, IMX662_PIXEL_ARRAY_TOP,=20
> + max_top);
> +
> +       rect.width =3D
> +               clamp_t(u32,
> +                       round_down(rect.width, =
IMX662_CROP_WIDTH_STEP),
> +                       IMX662_MIN_CROP_WIDTH, =
IMX662_PIXEL_ARRAY_WIDTH);
> +       rect.height =3D
> +               clamp_t(u32,
> +                       round_down(rect.height, =
IMX662_CROP_HEIGHT_STEP),
> +                       IMX662_MIN_CROP_HEIGHT,=20
> + IMX662_PIXEL_ARRAY_HEIGHT);
> +
> +       if (rect.left + rect.width - 1 >
> +           IMX662_PIXEL_ARRAY_LEFT + IMX662_PIXEL_ARRAY_WIDTH - 1)
> +               rect.left =3D
> +                       IMX662_PIXEL_ARRAY_LEFT + =
IMX662_PIXEL_ARRAY_WIDTH -
> +                       rect.width;
> +       if (rect.top + rect.height - 1 >
> +           IMX662_PIXEL_ARRAY_TOP + IMX662_PIXEL_ARRAY_HEIGHT - 1)
> +               rect.top =3D
> +                       IMX662_PIXEL_ARRAY_TOP + =
IMX662_PIXEL_ARRAY_HEIGHT -
> +                       rect.height;
> +
> +       if (sel->flags & V4L2_SEL_FLAG_GE) {
> +               if (rect.width < sel->r.width) {
> +                       u32 new_width =3D rect.width +=20
> + IMX662_CROP_WIDTH_STEP;
> +
> +                       if (new_width <=3D IMX662_PIXEL_ARRAY_WIDTH)
> +                               rect.width =3D new_width;
> +               }
> +               if (rect.height < sel->r.height) {
> +                       u32 new_height =3D rect.height +=20
> + IMX662_CROP_HEIGHT_STEP;
> +
> +                       if (new_height <=3D IMX662_PIXEL_ARRAY_HEIGHT)
> +                               rect.height =3D new_height;
> +               }
> +       }
> +
> +       if (sel->flags & V4L2_SEL_FLAG_LE) {
> +               if (rect.width > sel->r.width &&
> +                   rect.width >=3D IMX662_MIN_CROP_WIDTH +
> +                                 IMX662_CROP_WIDTH_STEP)
> +                       rect.width -=3D IMX662_CROP_WIDTH_STEP;
> +               if (rect.height > sel->r.height &&
> +                   rect.height >=3D IMX662_MIN_CROP_HEIGHT +
> +                                  IMX662_CROP_HEIGHT_STEP)
> +                       rect.height -=3D IMX662_CROP_HEIGHT_STEP;
> +       }
> +
> +       if (rect.width < IMX662_MIN_CROP_WIDTH ||
> +           rect.height < IMX662_MIN_CROP_HEIGHT)
> +               return -EINVAL;
> +
> +       if (sel->which =3D=3D V4L2_SUBDEV_FORMAT_TRY) {
> +               try_crop =3D v4l2_subdev_state_get_crop(sd_state, =
sel->pad);
> +               *try_crop =3D rect;
> +
> +               try_fmt =3D v4l2_subdev_state_get_format(sd_state, =
sel->pad);
> +               if (try_fmt) {
> +                       try_fmt->width =3D rect.width;
> +                       try_fmt->height =3D rect.height;
> +               }
> +       } else {
> +               if (imx662->streaming)
> +                       return -EBUSY;
> +
> +               if (imx662->crop.left =3D=3D rect.left &&
> +                   imx662->crop.top =3D=3D rect.top &&
> +                   imx662->crop.width =3D=3D rect.width &&
> +                   imx662->crop.height =3D=3D rect.height) {
> +                       sel->r =3D rect;
> +                       return 0;
> +               }
> +
> +               imx662->crop =3D rect;
> +
> +               try_fmt =3D v4l2_subdev_state_get_format(sd_state, =
sel->pad);
> +               if (try_fmt) {
> +                       try_fmt->width =3D rect.width;
> +                       try_fmt->height =3D rect.height;
> +               }
> +
> +               imx662_set_framing_limits(imx662);
> +       }
> +
> +       sel->r =3D rect;
> +
> +       return 0;
> +}
> +
> +static int imx662_init_state(struct v4l2_subdev *sd,
> +                            struct v4l2_subdev_state *state) {
> +       struct imx662 *imx662 =3D to_imx662(sd);
> +       struct v4l2_subdev_format fmt =3D {
> +               .which =3D V4L2_SUBDEV_FORMAT_TRY,
> +               .format =3D {
> +                       .width =3D imx662->crop.width,
> +                       .height =3D imx662->crop.height,
> +                       .code =3D =
imx662->format->code[imx662->variant],
> +               },
> +       };
> +       int ret;
> +
> +       ret =3D imx662_set_pad_format(sd, state, &fmt);
> +       if (ret)
> +               return ret;
> +
> +       *v4l2_subdev_state_get_crop(state, 0) =3D imx662->crop;
> +
> +       return 0;
> +}
> +
> +static int imx662_enable_streams(struct v4l2_subdev *sd,
> +                                struct v4l2_subdev_state *state, u32 =
pad,
> +                                u64 streams_mask) {
> +       struct imx662 *imx662 =3D to_imx662(sd);
> +       int ret;
> +
> +       ret =3D pm_runtime_resume_and_get(imx662->dev);
> +       if (ret)
> +               return ret;
> +
> +       cci_multi_reg_write(imx662->regmap, imx662_regs_common,
> +                           ARRAY_SIZE(imx662_regs_common), &ret);
> +
> +       cci_write(imx662->regmap, IMX662_INCK_SEL, imx662->inck,=20
> + &ret);
> +
> +       cci_write(imx662->regmap, IMX662_PIX_HST, imx662->crop.left, =
&ret);
> +       cci_write(imx662->regmap, IMX662_PIX_VST, imx662->crop.top, =
&ret);
> +       cci_write(imx662->regmap, IMX662_PIX_HWIDTH, =
imx662->crop.width, &ret);
> +       cci_write(imx662->regmap, IMX662_PIX_VWIDTH,=20
> + imx662->crop.height, &ret);
> +
> +       cci_write(imx662->regmap, IMX662_LANEMODE, =
imx662->num_data_lanes - 1,
> +                 &ret);
> +
> +       cci_write(imx662->regmap, IMX662_DATARATE_SEL,
> +                 imx662->link_freq_index, &ret);
> +
> +       cci_write(imx662->regmap, IMX662_ADBIT, =
imx662->format->ad_md_bit,
> +                 &ret);
> +       cci_write(imx662->regmap, IMX662_MDBIT, =
imx662->format->ad_md_bit,
> +                 &ret);
> +
> +       switch (imx662->hdr) {
> +       case IMX662_HDR_OFF:
> +               cci_multi_reg_write(imx662->regmap, =
imx662_regs_hdr_off,
> +                                   ARRAY_SIZE(imx662_regs_hdr_off), =
&ret);
> +               break;
> +       default:
> +               break;
> +       }
> +
> +       if (ret)
> +               goto start_err;
> +
> +       ret =3D __v4l2_ctrl_handler_setup(imx662->sd.ctrl_handler);
> +       if (ret) {
> +               dev_err(imx662->dev, "Could not sync v4l2 =
controls\n");
> +               return ret;
> +       }
> +
> +       cci_write(imx662->regmap, IMX662_STANDBY, 0x00, &ret);
> +
> +       usleep_range(24000, 25000);
> +
> +       cci_write(imx662->regmap, IMX662_XMSTA, 0x00, &ret);
> +       if (!ret) {
> +               imx662->streaming =3D true;
> +               return 0;
> +       }
> +
> +start_err:
> +       pm_runtime_put_autosuspend(imx662->dev);
> +
> +       return dev_err_probe(imx662->dev, ret, "Failed to setup=20
> +sensor\n"); }
> +
> +static int imx662_disable_streams(struct v4l2_subdev *sd,
> +                                 struct v4l2_subdev_state *state, u32 =
pad,
> +                                 u64 streams_mask) {
> +       struct imx662 *imx662 =3D to_imx662(sd);
> +       int ret;
> +
> +       ret =3D cci_write(imx662->regmap, IMX662_STANDBY, 0x01, NULL);
> +
> +       cci_write(imx662->regmap, IMX662_XMSTA, 0x01, &ret);
> +
> +       imx662->streaming =3D false;
> +
> +       pm_runtime_put_autosuspend(imx662->dev);
> +
> +       return ret;
> +}
> +
> +static int imx662_g_mbus_config(struct v4l2_subdev *sd, unsigned int =
pad_id,
> +                               struct v4l2_mbus_config *config)

g_mbus_config shouldn't be needed unless some properties can change =
dynamically. All these should come from device tree.

> +{
> +       struct imx662 *imx662 =3D to_imx662(sd);
> +
> +       config->type =3D V4L2_MBUS_CSI2_DPHY;
> +       config->bus.mipi_csi2.flags =3D=20
> + V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK;

Is it dropping to LP whilst streaming? I can't find any reference to the =
clock lane behaviour in the datasheet, but I also haven't found an =
oscilloscope to check for myself.

> +       config->bus.mipi_csi2.num_data_lanes =3D =
imx662->num_data_lanes;
> +
> +       return 0;
> +}
> +
> +static const struct v4l2_subdev_video_ops imx662_video_ops =3D {
> +       .s_stream =3D v4l2_subdev_s_stream_helper, };
> +
> +static const struct v4l2_subdev_pad_ops imx662_pad_ops =3D {
> +       .enum_mbus_code =3D imx662_enum_mbus_code,
> +       .enum_frame_size =3D imx662_enum_frame_size,
> +       .get_fmt =3D v4l2_subdev_get_fmt,
> +       .set_fmt =3D imx662_set_pad_format,
> +       .get_selection =3D imx662_get_selection,
> +       .set_selection =3D imx662_set_selection,
> +       .enable_streams =3D imx662_enable_streams,
> +       .disable_streams =3D imx662_disable_streams,
> +       .get_mbus_config =3D imx662_g_mbus_config, };
> +
> +static const struct v4l2_subdev_core_ops imx662_core_ops =3D {
> +       .subscribe_event =3D v4l2_ctrl_subdev_subscribe_event,
> +       .unsubscribe_event =3D v4l2_event_subdev_unsubscribe, };
> +
> +static const struct v4l2_subdev_ops imx662_subdev_ops =3D {
> +       .core =3D &imx662_core_ops,
> +       .video =3D &imx662_video_ops,
> +       .pad =3D &imx662_pad_ops,
> +};
> +
> +static const struct v4l2_subdev_internal_ops imx662_internal_ops =3D =
{
> +       .init_state =3D imx662_init_state, };
> +
> +static const struct media_entity_operations imx662_subdev_entity_ops =
=3D {
> +       .link_validate =3D v4l2_subdev_link_validate, };
> +
> +static int imx662_ctrls_init(struct imx662 *imx662) {
> +       struct v4l2_fwnode_device_properties props;
> +       int ret;
> +
> +       ret =3D v4l2_fwnode_device_parse(imx662->dev, &props);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D v4l2_ctrl_handler_init(&imx662->ctrls, 10);
> +       if (ret)
> +               return ret;
> +
> +       imx662->pixel_rate =3D v4l2_ctrl_new_std(&imx662->ctrls, =
&imx662_ctrl_ops,
> +                                              V4L2_CID_PIXEL_RATE, 1,
> +                                              INT_MAX, 1, 1);
> +
> +       imx662->link_freq =3D
> +               v4l2_ctrl_new_int_menu(&imx662->ctrls, =
&imx662_ctrl_ops,
> +                                      V4L2_CID_LINK_FREQ,
> +                                      ARRAY_SIZE(imx662_link_freqs) - =
1,
> +                                      imx662->link_freq_index,
> +                                      imx662_link_freqs);
> +       if (imx662->link_freq)
> +               imx662->link_freq->flags |=3D =
V4L2_CTRL_FLAG_READ_ONLY;
> +
> +       imx662->hblank =3D v4l2_ctrl_new_std(&imx662->ctrls, =
&imx662_ctrl_ops,
> +                                          V4L2_CID_HBLANK, 0, 1, 1,=20
> + 0);
> +
> +       imx662->vblank =3D v4l2_ctrl_new_std(&imx662->ctrls, =
&imx662_ctrl_ops,
> +                                          V4L2_CID_VBLANK, 0, 1, 1,=20
> + 0);
> +
> +       imx662->exposure =3D v4l2_ctrl_new_std(&imx662->ctrls, =
&imx662_ctrl_ops,
> +                                            V4L2_CID_EXPOSURE, =
IMX662_SHR0_MIN,
> +                                            0xffff, 1, 0xffff);
> +
> +       imx662->gain =3D v4l2_ctrl_new_std(&imx662->ctrls, =
&imx662_ctrl_ops,
> +                                        V4L2_CID_ANALOGUE_GAIN, 0, 1, =

> + 1, 0);
> +
> +       imx662->hflip =3D v4l2_ctrl_new_std(&imx662->ctrls, =
&imx662_ctrl_ops,
> +                                         V4L2_CID_HFLIP, 0, 1, 1, 0);
> +
> +       imx662->vflip =3D v4l2_ctrl_new_std(&imx662->ctrls, =
&imx662_ctrl_ops,
> +                                         V4L2_CID_VFLIP, 0, 1, 1, 0);
> +
> +       v4l2_ctrl_new_std(&imx662->ctrls, &imx662_ctrl_ops,
> +                         V4L2_CID_BRIGHTNESS, 0, 0x3ff, 1, 50);
> +
> +       v4l2_ctrl_new_std_menu_items(&imx662->ctrls, &imx662_ctrl_ops,
> +                                    V4L2_CID_HDR_SENSOR_MODE,
> +                                    ARRAY_SIZE(imx662_hdr_menu) - 1, =
0,
> +                                    IMX662_HDR_OFF, imx662_hdr_menu);
> +
> +       ret =3D v4l2_ctrl_new_fwnode_properties(&imx662->ctrls, =
&imx662_ctrl_ops,
> +                                             &props);
> +       if (ret)
> +               return dev_err_probe(imx662->dev, ret,
> +                                    "Failed to add controls\n");
> +
> +       imx662->sd.ctrl_handler =3D &imx662->ctrls;
> +
> +       imx662_set_link_limits(imx662);
> +       imx662_gain_update(imx662);
> +       imx662_set_framing_limits(imx662);
> +       imx662_exposure_update(imx662);
> +
> +       return 0;
> +}
> +
> +static int imx662_init_clk(struct imx662 *imx662) {
> +       u32 xclk_freq;
> +
> +       imx662->clk =3D devm_v4l2_sensor_clk_get(imx662->dev, NULL);
> +       if (IS_ERR(imx662->clk))
> +               return dev_err_probe(imx662->dev, =
PTR_ERR(imx662->clk),
> +                                    "Failed to get clock\n");
> +
> +       xclk_freq =3D clk_get_rate(imx662->clk);
> +
> +       switch (xclk_freq) {
> +       case 24000000:
> +               imx662->inck =3D IMX662_INCK_SEL_24;
> +               break;
> +       case 27000000:
> +               imx662->inck =3D IMX662_INCK_SEL_27;
> +               break;
> +       case 37125000:
> +               imx662->inck =3D IMX662_INCK_SEL_37_125;
> +               break;
> +       case 72000000:
> +               imx662->inck =3D IMX662_INCK_SEL_72;
> +               break;
> +       case 74250000:
> +               imx662->inck =3D IMX662_INCK_SEL_74_25;
> +               break;
> +       default:
> +               dev_err(imx662->dev,
> +                       "External clock frequency %u is not =
supported\n",
> +                       xclk_freq);
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
> +static int imx662_parse_hw_config(struct imx662 *imx662) {
> +       static const unsigned long supported_2lane =3D
> +               BIT(IMX662_DATARATE_594) | BIT(IMX662_DATARATE_720) |
> +               BIT(IMX662_DATARATE_891) | BIT(IMX662_DATARATE_1188) |
> +               BIT(IMX662_DATARATE_1440);
> +       static const unsigned long supported_4lane =3D
> +               BIT(IMX662_DATARATE_594) | BIT(IMX662_DATARATE_720);
> +       struct v4l2_fwnode_endpoint bus_cfg =3D {
> +               .bus_type =3D V4L2_MBUS_CSI2_DPHY
> +       };
> +       struct fwnode_handle *ep;
> +       unsigned long link_freq;
> +       unsigned int i;
> +       int ret;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(imx662->supplies); i++)
> +               imx662->supplies[i].supply =3D imx662_supply_names[i];
> +
> +       ret =3D devm_regulator_bulk_get(imx662->dev,
> +                                     ARRAY_SIZE(imx662->supplies),
> +                                     imx662->supplies);
> +       if (ret)
> +               return dev_err_probe(imx662->dev, ret,
> +                                    "Failed to get supplies\n");
> +
> +       imx662->reset =3D devm_gpiod_get_optional(imx662->dev, =
"reset",
> +                                               GPIOD_OUT_LOW);

This is inverted. If the line is reset, then you would set it with =
GPIOD_OUT_HIGH to keep the sensor in reset initially.
https://github.com/torvalds/linux/commit/9d108d226224b91ad11e7cfcf846c2a1=
721b466d

> +       if (IS_ERR(imx662->reset))
> +               return dev_err_probe(imx662->dev, =
PTR_ERR(imx662->reset),
> +                                    "Failed to get reset GPIO\n");
> +
> +       ret =3D imx662_init_clk(imx662);
> +       if (ret)
> +               return ret;
> +
> +       imx662->variant =3D=20
> + (uintptr_t)of_device_get_match_data(imx662->dev);
> +
> +       ep =3D fwnode_graph_get_next_endpoint(dev_fwnode(imx662->dev), =
NULL);
> +       if (!ep)
> +               return -ENXIO;
> +
> +       ret =3D v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> +       fwnode_handle_put(ep);
> +       if (ret)
> +               return ret;
> +
> +       switch (bus_cfg.bus.mipi_csi2.num_data_lanes) {
> +       case 2:
> +       case 4:
> +               imx662->num_data_lanes =3D =
bus_cfg.bus.mipi_csi2.num_data_lanes;
> +               break;
> +       default:
> +               ret =3D dev_err_probe(imx662->dev, -EINVAL,
> +                                   "Invalid number of CSI2 data lanes =
%d\n",
> +                                   =
bus_cfg.bus.mipi_csi2.num_data_lanes);
> +               goto done_endpoint_free;
> +       }
> +
> +       ret =3D v4l2_link_freq_to_bitmap(imx662->dev, =
bus_cfg.link_frequencies,
> +                                      bus_cfg.nr_of_link_frequencies,
> +                                      imx662_link_freqs,
> +                                      ARRAY_SIZE(imx662_link_freqs),
> +                                      &link_freq);
> +
> +       if (imx662->num_data_lanes =3D=3D 2)
> +               link_freq &=3D supported_2lane;
> +       else
> +               link_freq &=3D supported_4lane;
> +
> +       if (ret || !link_freq) {
> +               dev_err(imx662->dev,
> +                       "No valid link-frequency property found\n");
> +               ret =3D ret ? : -EINVAL;
> +               goto done_endpoint_free;
> +       }
> +
> +       imx662->link_freq_index =3D __fls(link_freq);
> +
> +done_endpoint_free:
> +       v4l2_fwnode_endpoint_free(&bus_cfg);
> +
> +       return ret;
> +}
> +
> +static int imx662_power_on(struct device *dev) {
> +       struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> +       struct imx662 *imx662 =3D to_imx662(sd);
> +       int ret;
> +
> +       ret =3D regulator_bulk_enable(ARRAY_SIZE(imx662->supplies),
> +                                   imx662->supplies);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "Failed to enable=20
> + regulators\n");
> +
> +       ret =3D clk_prepare_enable(imx662->clk);
> +       if (ret) {
> +               dev_err(dev, "Failed to enable clock\n");
> +               regulator_bulk_disable(ARRAY_SIZE(imx662->supplies),
> +                                      imx662->supplies);
> +               return ret;
> +       }
> +
> +       usleep_range(1, 2);
> +       gpiod_set_value_cansleep(imx662->reset, 1);
> +       usleep_range(30000, 31000);

Timings and delays here don't appear to follow the datasheet power on =
sequence.
- Power rails on
- Tlow of 500ns
- XCLR high
- T3 of 1us
- Enable INCK
- T4 of 20us before I2C comms starts.

You've enabled the clock before asserting reset.

> +
> +       return 0;
> +}
> +
> +static int imx662_power_off(struct device *dev) {
> +       struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> +       struct imx662 *imx662 =3D to_imx662(sd);
> +
> +       gpiod_set_value_cansleep(imx662->reset, 0);
> +       regulator_bulk_disable(ARRAY_SIZE(imx662->supplies), =
imx662->supplies);
> +       clk_disable_unprepare(imx662->clk);

Whilst the datasheet doesn't set any timing or ordering for power off, =
it's normal to reverse the power on sequence.

> +
> +       return 0;
> +}
> +
> +static void imx662_subdev_cleanup(struct imx662 *imx662) {
> +       media_entity_cleanup(&imx662->sd.entity);
> +       v4l2_ctrl_handler_free(&imx662->ctrls);
> +}
> +
> +static int imx662_probe(struct i2c_client *client) {
> +       struct device *dev =3D &client->dev;
> +       struct imx662 *imx662;
> +       int ret;
> +
> +       imx662 =3D devm_kzalloc(dev, sizeof(*imx662), GFP_KERNEL);
> +       if (!imx662)
> +               return -ENOMEM;
> +
> +       imx662->dev =3D dev;
> +
> +       imx662->regmap =3D devm_cci_regmap_init_i2c(client, 16);
> +       if (IS_ERR(imx662->regmap))
> +               return PTR_ERR(imx662->regmap);
> +
> +       ret =3D imx662_parse_hw_config(imx662);
> +       if (ret)
> +               return ret;
> +
> +       v4l2_i2c_subdev_init(&imx662->sd, client, &imx662_subdev_ops);
> +
> +       ret =3D imx662_power_on(dev);
> +       if (ret)
> +               goto error_subdev;
> +
> +       pm_runtime_set_active(dev);
> +       pm_runtime_get_noresume(dev);
> +       pm_runtime_enable(dev);
> +       pm_runtime_set_autosuspend_delay(dev, 1000);
> +       pm_runtime_use_autosuspend(dev);
> +
> +       imx662->crop.left =3D IMX662_PIXEL_ARRAY_LEFT;
> +       imx662->crop.top =3D IMX662_PIXEL_ARRAY_TOP;
> +       imx662->crop.width =3D IMX662_PIXEL_ARRAY_WIDTH;
> +       imx662->crop.height =3D IMX662_PIXEL_ARRAY_HEIGHT;
> +
> +       imx662->format =3D &imx662_formats[0];
> +
> +       cci_write(imx662->regmap, IMX662_STANDBY, 0x01, &ret);
> +       cci_write(imx662->regmap, IMX662_XMSTA, 0x01, &ret);
> +       if (ret)
> +               goto error_pm;
> +
> +       ret =3D imx662_ctrls_init(imx662);
> +       if (ret)
> +               goto error_pm;
> +
> +       imx662->sd.internal_ops =3D &imx662_internal_ops;
> +       imx662->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE |
> +                           V4L2_SUBDEV_FL_HAS_EVENTS;

If you've only added this for reporting control changes, then the =
framework does that automatically these days.
Likewise the subscribe_event and unsubscribe_event hooks can go.

> +       imx662->sd.entity.ops =3D &imx662_subdev_entity_ops;
> +       imx662->sd.entity.function =3D MEDIA_ENT_F_CAM_SENSOR;
> +
> +       imx662->pad.flags =3D MEDIA_PAD_FL_SOURCE;
> +       ret =3D media_entity_pads_init(&imx662->sd.entity, 1, =
&imx662->pad);
> +       if (ret) {
> +               dev_err(dev, "Failed to init entity pads: %d\n", ret);
> +               goto error_pm;
> +       }
> +
> +       imx662->sd.state_lock =3D imx662->ctrls.lock;
> +
> +       ret =3D v4l2_subdev_init_finalize(&imx662->sd);
> +       if (ret) {
> +               dev_err(dev, "Subdev init error\n");
> +               goto error_media;
> +       }
> +
> +       ret =3D v4l2_async_register_subdev_sensor(&imx662->sd);
> +       if (ret) {
> +               dev_err(dev, "Failed to register sensor sub-device: =
%d\n", ret);
> +               goto error_media;
> +       }
> +
> +       pm_runtime_put_autosuspend(dev);
> +
> +       return 0;
> +
> +error_media:
> +       media_entity_cleanup(&imx662->sd.entity);
> +
> +error_pm:
> +       pm_runtime_disable(dev);
> +       pm_runtime_put_noidle(dev);
> +       imx662_power_off(dev);
> +
> +error_subdev:
> +       imx662_subdev_cleanup(imx662);
> +
> +       return ret;
> +}
> +
> +static void imx662_remove(struct i2c_client *client) {
> +       struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> +       struct imx662 *imx662 =3D to_imx662(sd);
> +
> +       v4l2_async_unregister_subdev(sd);
> +       imx662_subdev_cleanup(imx662);
> +
> +       pm_runtime_disable(&client->dev);
> +       if (!pm_runtime_status_suspended(&client->dev))
> +               imx662_power_off(&client->dev);
> +       pm_runtime_set_suspended(&client->dev);
> +}
> +
> +static const struct of_device_id imx662_of_match[] __maybe_unused =3D =
{
> +       {
> +               .compatible =3D "sony,imx662",

If you follow the pattern from imx296 where there are mono and colour =
variants, it takes the full sensor part number.
The colour sensor is imx662aaqr.
The mono sensor is imx662aamr.

  Dave

> +               .data =3D (void *)IMX662_VARIANT_COLOUR
> +       },
> +       {
> +               .compatible =3D "sony,imx662-mono",
> +               .data =3D (void *)IMX662_VARIANT_MONO
> +       },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(of, imx662_of_match);
> +
> +static DEFINE_RUNTIME_DEV_PM_OPS(imx662_pm_ops, imx662_power_off,
> +                                imx662_power_on, NULL);
> +
> +static struct i2c_driver imx662_i2c_driver =3D {
> +       .probe =3D imx662_probe,
> +       .remove =3D imx662_remove,
> +       .driver =3D {
> +               .name =3D "imx662",
> +               .pm =3D pm_ptr(&imx662_pm_ops),
> +               .of_match_table =3D imx662_of_match,
> +       },
> +};
> +module_i2c_driver(imx662_i2c_driver);
> +
> +MODULE_DESCRIPTION("Sony IMX662 CMOS Image Sensor Driver");=20
> +MODULE_AUTHOR("Alexander Shiyan <eagle.alexander923@gmail.com>");=20
> +MODULE_LICENSE("GPL");
> --
> 2.52.0
>
>


