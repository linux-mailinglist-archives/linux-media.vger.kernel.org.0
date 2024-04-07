Return-Path: <linux-media+bounces-8798-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D165989AFFC
	for <lists+linux-media@lfdr.de>; Sun,  7 Apr 2024 11:09:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 037A0B211B5
	for <lists+linux-media@lfdr.de>; Sun,  7 Apr 2024 09:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6486F12E4A;
	Sun,  7 Apr 2024 09:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="otQ89WxR"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFF81C0DC6;
	Sun,  7 Apr 2024 09:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712480929; cv=none; b=j9AGTBvcGRJGEoFtMztiw806EaRtz2/hJGDdrAx4zL2Y6r9/77SYOn9Btp6vRI7VDCTPfAREG8daC+3ROZzjw35CC+gum8f0kT8KIUko7/bzNAJ3lI+1BBXAA0s5Sq8fCuAajo/zLhFNygwTXbUhVajnc5xyFlYWp+u42eWCbs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712480929; c=relaxed/simple;
	bh=KgrGSn5pMbk0FW6GFs10BHxu80zAjfMcJEcP65kHAKc=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:To:
	 Cc:Date:Message-ID; b=e/OC+MlOjbgx0XJkwibqeU+2RhyYBcy7Sx8T+1cNnH9oiN2ByduEwJnAxssRnRK6WruGV4MYQdppESgHkhstKnzB4odVmt51j1TUQjgnwDquLechrxzngrH3obfIjZUCPpc6KvyqYBDj1iEaWkQ9IqqcYFnEXAi+CWwsQHJdU2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=otQ89WxR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D2A0E8E1;
	Sun,  7 Apr 2024 11:08:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712480884;
	bh=KgrGSn5pMbk0FW6GFs10BHxu80zAjfMcJEcP65kHAKc=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=otQ89WxRW2EcuGjRLjT2HZydCsUenFR1TkGxHzHUadljoZC/EOqd26OkjIN7fSZse
	 /CYWstt4ZqrPgePW2Emusu2HN0wc8bTkddhm+59kMd1xMNU+U2C0o+yWg3khhFYn39
	 kSMzRLJtZOUPqnBt5yADQOIK1E+0nEKr5q7K6w/U=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240403033825.9072-3-zhi.mao@mediatek.com>
References: <20240403033825.9072-1-zhi.mao@mediatek.com> <20240403033825.9072-3-zhi.mao@mediatek.com>
Subject: Re: [PATCH v3 2/2] media: i2c: Add GC05A2 image sensor driver
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Zhi Mao <zhi.mao@mediatek.com>, krzysztof.kozlowski+dt@linaro.org, mchehab@kernel.org, robh+dt@kernel.org, sakari.ailus@linux.intel.com
Cc: laurent.pinchart@ideasonboard.com, shengnan.wang@mediatek.com, yaya.chang@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com, yunkec@chromium.org, conor+dt@kernel.org, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, jacopo.mondi@ideasonboard.com, zhi.mao@mediatek.com, 10572168@qq.com, hverkuil-cisco@xs4all.nl, heiko@sntech.de, jernej.skrabec@gmail.com, macromorgan@hotmail.com, linus.walleij@linaro.org, hdegoede@redhat.com, tomi.valkeinen@ideasonboard.com, gerald.loacker@wolfvision.net, andy.shevchenko@gmail.com, bingbu.cao@intel.com, dan.scally@ideasonboard.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Sun, 07 Apr 2024 10:08:39 +0100
Message-ID: <171248091995.2374960.12981271990757968652@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Hello,

Thanks for helping extending the kernels sensor driver support.

My comments below can likely be taken with a pinch of salt, as they are
mostly around the tabled register values ... but we have many drivers
which are binary blobs of sensor register values and I think it would be
far more beneficial to clean these up where possible...

So the first question is ... Can we ?



Quoting Zhi Mao (2024-04-03 04:38:25)
> Add a V4L2 sub-device driver for Galaxycore GC05A2 image sensor.
>=20
> Signed-off-by: Zhi Mao <zhi.mao@mediatek.com>
> ---
>  drivers/media/i2c/Kconfig  |   10 +
>  drivers/media/i2c/Makefile |    1 +
>  drivers/media/i2c/gc05a2.c | 1383 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 1394 insertions(+)
>  create mode 100644 drivers/media/i2c/gc05a2.c
>=20
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 56f276b920ab..97993bf160f9 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -70,6 +70,16 @@ config VIDEO_GC0308
>           To compile this driver as a module, choose M here: the
>           module will be called gc0308.
> =20
> +config VIDEO_GC05A2
> +       tristate "GalaxyCore gc05a2 sensor support"
> +       select V4L2_CCI_I2C
> +       help
> +         This is a Video4Linux2 sensor driver for the GalaxyCore gc05a2
> +         camera.
> +
> +         To compile this driver as a module, choose M here: the
> +         module will be called gc05a2.
> +
>  config VIDEO_GC2145
>         select V4L2_CCI_I2C
>         tristate "GalaxyCore GC2145 sensor support"
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index dfbe6448b549..8ed6faf0f854 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -38,6 +38,7 @@ obj-$(CONFIG_VIDEO_DW9768) +=3D dw9768.o
>  obj-$(CONFIG_VIDEO_DW9807_VCM) +=3D dw9807-vcm.o
>  obj-$(CONFIG_VIDEO_ET8EK8) +=3D et8ek8/
>  obj-$(CONFIG_VIDEO_GC0308) +=3D gc0308.o
> +obj-$(CONFIG_VIDEO_GC05A2) +=3D gc05a2.o
>  obj-$(CONFIG_VIDEO_GC2145) +=3D gc2145.o
>  obj-$(CONFIG_VIDEO_HI556) +=3D hi556.o
>  obj-$(CONFIG_VIDEO_HI846) +=3D hi846.o
> diff --git a/drivers/media/i2c/gc05a2.c b/drivers/media/i2c/gc05a2.c
> new file mode 100644
> index 000000000000..461d33055a3b
> --- /dev/null
> +++ b/drivers/media/i2c/gc05a2.c
> @@ -0,0 +1,1383 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Driver for GalaxyCore gc05a2 image sensor
> + *
> + * Copyright 2024 MediaTek
> + *
> + * Zhi Mao <zhi.mao@mediatek.com>
> + */
> +#include <linux/array_size.h>
> +#include <linux/bits.h>
> +#include <linux/clk.h>
> +#include <linux/container_of.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/math64.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/property.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/types.h>
> +#include <linux/units.h>
> +
> +#include <media/v4l2-cci.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-subdev.h>
> +
> +#define GC05A2_REG_TEST_PATTERN_EN CCI_REG8(0x008c)
> +#define GC05A2_REG_TEST_PATTERN_IDX CCI_REG8(0x008d)
> +#define GC05A2_TEST_PATTERN_EN 0x01
> +
> +#define GC05A2_STREAMING_REG CCI_REG8(0x0100)
> +
> +#define GC05A2_FLIP_REG CCI_REG8(0x0101)
> +#define GC05A2_FLIP_H_MASK BIT(0)
> +#define GC05A2_FLIP_V_MASK BIT(1)
> +
> +#define GC05A2_EXP_REG CCI_REG16(0x0202)
> +#define GC05A2_EXP_MARGIN 16
> +#define GC05A2_EXP_MIN 4
> +#define GC05A2_EXP_STEP 1
> +
> +#define GC05A2_AGAIN_REG CCI_REG16(0x0204)
> +#define GC05A2_AGAIN_MIN 1024
> +#define GC05A2_AGAIN_MAX (1024 * 16)
> +#define GC05A2_AGAIN_STEP 1
> +
> +#define GC05A2_FRAME_LENGTH_REG CCI_REG16(0x0340)
> +#define GC05A2_VTS_MAX 0xffff
> +
> +#define GC05A2_REG_CHIP_ID CCI_REG16(0x03f0)
> +#define GC05A2_CHIP_ID 0x05a2
> +
> +#define GC05A2_NATIVE_WIDTH 2592
> +#define GC05A2_NATIVE_HEIGHT 1944
> +
> +#define GC05A2_DEFAULT_CLK_FREQ (24 * HZ_PER_MHZ)
> +#define GC05A2_MBUS_CODE MEDIA_BUS_FMT_SGRBG10_1X10
> +#define GC05A2_DATA_LANES 2
> +#define GC05A2_RGB_DEPTH 10
> +#define GC05A2_SLEEP_US  (2 * USEC_PER_MSEC)
> +
> +static const char *const gc05a2_test_pattern_menu[] =3D {
> +       "No Pattern",  "Fade_to_gray_Color Bar", "Color Bar",
> +       "PN9",         "Horizental_gradient",    "Checkboard Pattern",
> +       "Slant",       "Resolution",             "Solid Black",
> +       "Solid White",
> +};
> +
> +static const s64 gc05a2_link_freq_menu_items[] =3D {
> +       (448 * HZ_PER_MHZ),
> +       (224 * HZ_PER_MHZ),
> +};
> +
> +static const char *const gc05a2_supply_name[] =3D {
> +       "avdd",
> +       "dvdd",
> +       "dovdd",
> +};
> +
> +struct gc05a2 {
> +       struct device *dev;
> +       struct v4l2_subdev sd;
> +       struct media_pad pad;
> +
> +       struct clk *xclk;
> +       struct regulator_bulk_data supplies[ARRAY_SIZE(gc05a2_supply_name=
)];
> +       struct gpio_desc *reset_gpio;
> +
> +       struct v4l2_ctrl_handler ctrls;
> +       struct v4l2_ctrl *pixel_rate;
> +       struct v4l2_ctrl *link_freq;
> +       struct v4l2_ctrl *exposure;
> +       struct v4l2_ctrl *vblank;
> +       struct v4l2_ctrl *hblank;
> +       struct v4l2_ctrl *hflip;
> +       struct v4l2_ctrl *vflip;
> +
> +       struct regmap *regmap;
> +       unsigned long link_freq_bitmap;
> +
> +       /* True if the device has been identified */
> +       bool identified;
> +       const struct gc05a2_mode *cur_mode;
> +};
> +
> +struct gc05a2_reg_list {
> +       u32 num_of_regs;
> +       const struct cci_reg_sequence *regs;
> +};
> +
> +static const struct cci_reg_sequence mode_2592x1944[] =3D {
> +       /* system */
> +       { CCI_REG8(0x0135), 0x01 },
> +
> +       /* pre_setting */
> +       { CCI_REG8(0x0084), 0x21 },
> +       { CCI_REG8(0x0d05), 0xcc },
> +       { CCI_REG8(0x0218), 0x00 },
> +       { CCI_REG8(0x005e), 0x48 },
> +       { CCI_REG8(0x0d06), 0x01 },
> +       { CCI_REG8(0x0007), 0x16 },
> +       { CCI_REG8(0x0101), 0x00 },
> +
> +       /* analog */
> +       { CCI_REG8(0x0342), 0x07 },
> +       { CCI_REG8(0x0343), 0x28 },
> +       { CCI_REG8(0x0220), 0x07 },
> +       { CCI_REG8(0x0221), 0xd0 },
> +       { CCI_REG8(0x0202), 0x07 },
> +       { CCI_REG8(0x0203), 0x32 },
> +       { CCI_REG8(0x0340), 0x07 },
> +       { CCI_REG8(0x0341), 0xf0 },
> +       { CCI_REG8(0x0219), 0x00 },
> +       { CCI_REG8(0x0346), 0x00 },
> +       { CCI_REG8(0x0347), 0x04 },
> +       { CCI_REG8(0x0d14), 0x00 },
> +       { CCI_REG8(0x0d13), 0x05 },
> +       { CCI_REG8(0x0d16), 0x05 },
> +       { CCI_REG8(0x0d15), 0x1d },
> +       { CCI_REG8(0x00c0), 0x0a },
> +       { CCI_REG8(0x00c1), 0x30 },
> +       { CCI_REG8(0x034a), 0x07 },
> +       { CCI_REG8(0x034b), 0xa8 },
> +       { CCI_REG8(0x0e0a), 0x00 },
> +       { CCI_REG8(0x0e0b), 0x00 },
> +       { CCI_REG8(0x0e0e), 0x03 },
> +       { CCI_REG8(0x0e0f), 0x00 },
> +       { CCI_REG8(0x0e06), 0x0a },
> +       { CCI_REG8(0x0e23), 0x15 },
> +       { CCI_REG8(0x0e24), 0x15 },
> +       { CCI_REG8(0x0e2a), 0x10 },
> +       { CCI_REG8(0x0e2b), 0x10 },
> +       { CCI_REG8(0x0e17), 0x49 },
> +       { CCI_REG8(0x0e1b), 0x1c },
> +       { CCI_REG8(0x0e3a), 0x36 },
> +       { CCI_REG8(0x0d11), 0x84 },
> +       { CCI_REG8(0x0e52), 0x14 },
> +       { CCI_REG8(0x000b), 0x10 },
> +       { CCI_REG8(0x0008), 0x08 },
> +       { CCI_REG8(0x0223), 0x17 },
> +       { CCI_REG8(0x0d27), 0x39 },
> +       { CCI_REG8(0x0d22), 0x00 },
> +       { CCI_REG8(0x03f6), 0x0d },
> +       { CCI_REG8(0x0d04), 0x07 },
> +       { CCI_REG8(0x03f3), 0x72 },
> +       { CCI_REG8(0x03f4), 0xb8 },
> +       { CCI_REG8(0x03f5), 0xbc },
> +       { CCI_REG8(0x0d02), 0x73 },
> +
> +       /* auto load start */
> +       { CCI_REG8(0x00cb), 0x00 },
> +
> +       /* OUT 2592*1944 */
> +       { CCI_REG8(0x0350), 0x01 },
> +       { CCI_REG8(0x0353), 0x00 },
> +       { CCI_REG8(0x0354), 0x08 },

> +       { CCI_REG8(0x034c), 0x0a },
> +       { CCI_REG8(0x034d), 0x20 },

Should/Could this be
        { CCI_REG16(0x034c), 2592 }, /* Width */


> +       { CCI_REG8(0x021f), 0x14 },
> +
> +       /* MIPI */
> +       { CCI_REG8(0x0107), 0x05 },
> +       { CCI_REG8(0x0117), 0x01 },
> +       { CCI_REG8(0x0d81), 0x00 },
> +       { CCI_REG8(0x0d84), 0x0c },
> +       { CCI_REG8(0x0d85), 0xa8 },
> +       { CCI_REG8(0x0d86), 0x06 },
> +       { CCI_REG8(0x0d87), 0x55 },
> +       { CCI_REG8(0x0db3), 0x06 },
> +       { CCI_REG8(0x0db4), 0x08 },
> +       { CCI_REG8(0x0db5), 0x1e },
> +       { CCI_REG8(0x0db6), 0x02 },
> +       { CCI_REG8(0x0db8), 0x12 },
> +       { CCI_REG8(0x0db9), 0x0a },
> +       { CCI_REG8(0x0d93), 0x06 },
> +       { CCI_REG8(0x0d94), 0x09 },
> +       { CCI_REG8(0x0d95), 0x0d },
> +       { CCI_REG8(0x0d99), 0x0b },
> +       { CCI_REG8(0x0084), 0x01 },
> +
> +       /* OUT */
> +       { CCI_REG8(0x0110), 0x01 },
> +};
> +
> +static const struct cci_reg_sequence mode_1280x720[] =3D {
> +       /* system */
> +       { CCI_REG8(0x0135), 0x05 },

In 2592x1944 this is 0x01. Do you have a datasheet? Can you explain why
they are different? Can you add register definitions that have names to
make this more maintainable or extendable in the future?

There's discussion in the recent series improving the IMX258 which makes
me wonder if we should try harder to have sensor drivers with clearer
definitions.


> +
> +       /*pre_setting*/

/* pre_setting */ ?

> +       { CCI_REG8(0x0084), 0x21 },
> +       { CCI_REG8(0x0d05), 0xcc },
> +       { CCI_REG8(0x0218), 0x80 },
> +       { CCI_REG8(0x005e), 0x49 },
> +       { CCI_REG8(0x0d06), 0x81 },
> +       { CCI_REG8(0x0007), 0x16 },
> +       { CCI_REG8(0x0101), 0x00 },

In 2592x1944, only register 0x0218 differs. Why? What is that? Can it be
broken out to a function that applies the correct configuration at
startuup based on a parameter instead of duplicating this table set?

> +
> +       /* analog */
> +       { CCI_REG8(0x0342), 0x07 },
> +       { CCI_REG8(0x0343), 0x10 },
> +       { CCI_REG8(0x0220), 0x07 },
> +       { CCI_REG8(0x0221), 0xd0 },
> +       { CCI_REG8(0x0202), 0x03 },
> +       { CCI_REG8(0x0203), 0x32 },
> +       { CCI_REG8(0x0340), 0x04 },
> +       { CCI_REG8(0x0341), 0x08 },
> +       { CCI_REG8(0x0219), 0x00 },
> +       { CCI_REG8(0x0346), 0x01 },
> +       { CCI_REG8(0x0347), 0x00 },
> +       { CCI_REG8(0x0d14), 0x00 },
> +       { CCI_REG8(0x0d13), 0x05 },
> +       { CCI_REG8(0x0d16), 0x05 },
> +       { CCI_REG8(0x0d15), 0x1d },
> +       { CCI_REG8(0x00c0), 0x0a },
> +       { CCI_REG8(0x00c1), 0x30 },
> +       { CCI_REG8(0x034a), 0x05 },
> +       { CCI_REG8(0x034b), 0xb0 },
> +       { CCI_REG8(0x0e0a), 0x00 },
> +       { CCI_REG8(0x0e0b), 0x00 },
> +       { CCI_REG8(0x0e0e), 0x03 },
> +       { CCI_REG8(0x0e0f), 0x00 },
> +       { CCI_REG8(0x0e06), 0x0a },
> +       { CCI_REG8(0x0e23), 0x15 },
> +       { CCI_REG8(0x0e24), 0x15 },
> +       { CCI_REG8(0x0e2a), 0x10 },
> +       { CCI_REG8(0x0e2b), 0x10 },
> +       { CCI_REG8(0x0e17), 0x49 },
> +       { CCI_REG8(0x0e1b), 0x1c },
> +       { CCI_REG8(0x0e3a), 0x36 },
> +       { CCI_REG8(0x0d11), 0x84 },
> +       { CCI_REG8(0x0e52), 0x14 },
> +       { CCI_REG8(0x000b), 0x0e },
> +       { CCI_REG8(0x0008), 0x03 },
> +       { CCI_REG8(0x0223), 0x16 },
> +       { CCI_REG8(0x0d27), 0x39 },
> +       { CCI_REG8(0x0d22), 0x00 },
> +       { CCI_REG8(0x03f6), 0x0d },
> +       { CCI_REG8(0x0d04), 0x07 },
> +       { CCI_REG8(0x03f3), 0x72 },
> +       { CCI_REG8(0x03f4), 0xb8 },
> +       { CCI_REG8(0x03f5), 0xbc },
> +       { CCI_REG8(0x0d02), 0x73 },
> +

Are any of those able to be broken out to named register to be more
clear in their intent?

> +       /* auto load start */
> +       { CCI_REG8(0x00cb), 0xfc },
> +

Why is this auto load start so different to the other modes 'auto load
start'? What do the bits refer to ?

> +       /* OUT 1280x720 */
> +       { CCI_REG8(0x0350), 0x01 },
> +       { CCI_REG8(0x0353), 0x00 },
> +       { CCI_REG8(0x0354), 0x0c },

> +       { CCI_REG8(0x034c), 0x05 },
> +       { CCI_REG8(0x034d), 0x00 },

Should/Could this be=20
         { CCI_REG16(0x034c), 1280 },

Are there any other register settings that would make more sense to be
in decimal units that match their actual context?


> +       { CCI_REG8(0x021f), 0x14 },

I don't see a setting for 720/0x2d0. Do these registers only set the
width?

> +
> +       /* MIPI */
> +       { CCI_REG8(0x0107), 0x05 },
> +       { CCI_REG8(0x0117), 0x01 },
> +       { CCI_REG8(0x0d81), 0x00 },
> +       { CCI_REG8(0x0d84), 0x06 },
> +       { CCI_REG8(0x0d85), 0x40 },
> +       { CCI_REG8(0x0d86), 0x03 },
> +       { CCI_REG8(0x0d87), 0x21 },
> +       { CCI_REG8(0x0db3), 0x03 },
> +       { CCI_REG8(0x0db4), 0x04 },
> +       { CCI_REG8(0x0db5), 0x0d },
> +       { CCI_REG8(0x0db6), 0x01 },
> +       { CCI_REG8(0x0db8), 0x04 },
> +       { CCI_REG8(0x0db9), 0x06 },
> +       { CCI_REG8(0x0d93), 0x03 },
> +       { CCI_REG8(0x0d94), 0x04 },
> +       { CCI_REG8(0x0d95), 0x05 },
> +       { CCI_REG8(0x0d99), 0x06 },
> +       { CCI_REG8(0x0084), 0x01 },
> +
> +       /* OUT */

Out where? What is out?

> +       { CCI_REG8(0x0110), 0x01 },
> +};
> +
> +static const struct cci_reg_sequence mode_table_common[] =3D {
> +       { GC05A2_STREAMING_REG, 0x00 },
> +       /* system */
> +       { CCI_REG8(0x0315), 0xd4 },
> +       { CCI_REG8(0x0d06), 0x01 },
> +       { CCI_REG8(0x0a70), 0x80 },
> +       { CCI_REG8(0x031a), 0x00 },
> +       { CCI_REG8(0x0314), 0x00 },
> +       { CCI_REG8(0x0130), 0x08 },
> +       { CCI_REG8(0x0132), 0x01 },
> +       { CCI_REG8(0x0136), 0x38 },
> +       { CCI_REG8(0x0137), 0x03 },
> +       { CCI_REG8(0x0134), 0x5b },
> +       { CCI_REG8(0x031c), 0xe0 },
> +       { CCI_REG8(0x0d82), 0x14 },
> +       { CCI_REG8(0x0dd1), 0x56 },
> +
> +       /* gate_mode */
> +       { CCI_REG8(0x0af4), 0x01 },
> +       { CCI_REG8(0x0002), 0x10 },
> +       { CCI_REG8(0x00c3), 0x34 },
> +
> +       /* auto load start */

The previous 'auto load start' referenced 0x00cb ?

> +       { CCI_REG8(0x00c4), 0x00 },
> +       { CCI_REG8(0x00c5), 0x01 },
> +       { CCI_REG8(0x0af6), 0x00 },
> +       { CCI_REG8(0x0ba0), 0x17 },
> +       { CCI_REG8(0x0ba1), 0x00 },
> +       { CCI_REG8(0x0ba2), 0x00 },
> +       { CCI_REG8(0x0ba3), 0x00 },
> +       { CCI_REG8(0x0ba4), 0x03 },
> +       { CCI_REG8(0x0ba5), 0x00 },
> +       { CCI_REG8(0x0ba6), 0x00 },
> +       { CCI_REG8(0x0ba7), 0x00 },
> +       { CCI_REG8(0x0ba8), 0x40 },
> +       { CCI_REG8(0x0ba9), 0x00 },
> +       { CCI_REG8(0x0baa), 0x00 },
> +       { CCI_REG8(0x0bab), 0x00 },
> +       { CCI_REG8(0x0bac), 0x40 },
> +       { CCI_REG8(0x0bad), 0x00 },
> +       { CCI_REG8(0x0bae), 0x00 },
> +       { CCI_REG8(0x0baf), 0x00 },
> +       { CCI_REG8(0x0bb0), 0x02 },
> +       { CCI_REG8(0x0bb1), 0x00 },
> +       { CCI_REG8(0x0bb2), 0x00 },
> +       { CCI_REG8(0x0bb3), 0x00 },
> +       { CCI_REG8(0x0bb8), 0x02 },
> +       { CCI_REG8(0x0bb9), 0x00 },
> +       { CCI_REG8(0x0bba), 0x00 },
> +       { CCI_REG8(0x0bbb), 0x00 },
> +       { CCI_REG8(0x0a70), 0x80 },
> +       { CCI_REG8(0x0a71), 0x00 },
> +       { CCI_REG8(0x0a72), 0x00 },
> +       { CCI_REG8(0x0a66), 0x00 },
> +       { CCI_REG8(0x0a67), 0x80 },
> +       { CCI_REG8(0x0a4d), 0x4e },
> +       { CCI_REG8(0x0a50), 0x00 },
> +       { CCI_REG8(0x0a4f), 0x0c },
> +       { CCI_REG8(0x0a66), 0x00 },
> +       { CCI_REG8(0x00ca), 0x00 },
> +       { CCI_REG8(0x00cc), 0x00 },
> +       { CCI_REG8(0x00cd), 0x00 },
> +       { CCI_REG8(0x0aa1), 0x00 },
> +       { CCI_REG8(0x0aa2), 0xe0 },
> +       { CCI_REG8(0x0aa3), 0x00 },
> +       { CCI_REG8(0x0aa4), 0x40 },
> +       { CCI_REG8(0x0a90), 0x03 },
> +       { CCI_REG8(0x0a91), 0x0e },
> +       { CCI_REG8(0x0a94), 0x80 },
> +
> +       /* standby */
> +       { CCI_REG8(0x0af6), 0x20 },
> +       { CCI_REG8(0x0b00), 0x91 },
> +       { CCI_REG8(0x0b01), 0x17 },
> +       { CCI_REG8(0x0b02), 0x01 },
> +       { CCI_REG8(0x0b03), 0x00 },
> +       { CCI_REG8(0x0b04), 0x01 },
> +       { CCI_REG8(0x0b05), 0x17 },
> +       { CCI_REG8(0x0b06), 0x01 },
> +       { CCI_REG8(0x0b07), 0x00 },
> +       { CCI_REG8(0x0ae9), 0x01 },
> +       { CCI_REG8(0x0aea), 0x02 },
> +       { CCI_REG8(0x0ae8), 0x53 },
> +       { CCI_REG8(0x0ae8), 0x43 },
> +
> +       /* gain_partition */
> +       { CCI_REG8(0x0af6), 0x30 },
> +       { CCI_REG8(0x0b00), 0x08 },
> +       { CCI_REG8(0x0b01), 0x0f },
> +       { CCI_REG8(0x0b02), 0x00 },
> +       { CCI_REG8(0x0b04), 0x1c },
> +       { CCI_REG8(0x0b05), 0x24 },
> +       { CCI_REG8(0x0b06), 0x00 },
> +       { CCI_REG8(0x0b08), 0x30 },
> +       { CCI_REG8(0x0b09), 0x40 },
> +       { CCI_REG8(0x0b0a), 0x00 },
> +       { CCI_REG8(0x0b0c), 0x0e },
> +       { CCI_REG8(0x0b0d), 0x2a },
> +       { CCI_REG8(0x0b0e), 0x00 },
> +       { CCI_REG8(0x0b10), 0x0e },
> +       { CCI_REG8(0x0b11), 0x2b },
> +       { CCI_REG8(0x0b12), 0x00 },
> +       { CCI_REG8(0x0b14), 0x0e },
> +       { CCI_REG8(0x0b15), 0x23 },
> +       { CCI_REG8(0x0b16), 0x00 },
> +       { CCI_REG8(0x0b18), 0x0e },
> +       { CCI_REG8(0x0b19), 0x24 },
> +       { CCI_REG8(0x0b1a), 0x00 },
> +       { CCI_REG8(0x0b1c), 0x0c },
> +       { CCI_REG8(0x0b1d), 0x0c },
> +       { CCI_REG8(0x0b1e), 0x00 },
> +       { CCI_REG8(0x0b20), 0x03 },
> +       { CCI_REG8(0x0b21), 0x03 },
> +       { CCI_REG8(0x0b22), 0x00 },
> +       { CCI_REG8(0x0b24), 0x0e },
> +       { CCI_REG8(0x0b25), 0x0e },
> +       { CCI_REG8(0x0b26), 0x00 },
> +       { CCI_REG8(0x0b28), 0x03 },
> +       { CCI_REG8(0x0b29), 0x03 },
> +       { CCI_REG8(0x0b2a), 0x00 },
> +       { CCI_REG8(0x0b2c), 0x12 },
> +       { CCI_REG8(0x0b2d), 0x12 },
> +       { CCI_REG8(0x0b2e), 0x00 },
> +       { CCI_REG8(0x0b30), 0x08 },
> +       { CCI_REG8(0x0b31), 0x08 },
> +       { CCI_REG8(0x0b32), 0x00 },
> +       { CCI_REG8(0x0b34), 0x14 },
> +       { CCI_REG8(0x0b35), 0x14 },
> +       { CCI_REG8(0x0b36), 0x00 },
> +       { CCI_REG8(0x0b38), 0x10 },
> +       { CCI_REG8(0x0b39), 0x10 },
> +       { CCI_REG8(0x0b3a), 0x00 },
> +       { CCI_REG8(0x0b3c), 0x16 },
> +       { CCI_REG8(0x0b3d), 0x16 },
> +       { CCI_REG8(0x0b3e), 0x00 },
> +       { CCI_REG8(0x0b40), 0x10 },
> +       { CCI_REG8(0x0b41), 0x10 },
> +       { CCI_REG8(0x0b42), 0x00 },
> +       { CCI_REG8(0x0b44), 0x19 },
> +       { CCI_REG8(0x0b45), 0x19 },
> +       { CCI_REG8(0x0b46), 0x00 },
> +       { CCI_REG8(0x0b48), 0x16 },
> +       { CCI_REG8(0x0b49), 0x16 },
> +       { CCI_REG8(0x0b4a), 0x00 },
> +       { CCI_REG8(0x0b4c), 0x19 },
> +       { CCI_REG8(0x0b4d), 0x19 },
> +       { CCI_REG8(0x0b4e), 0x00 },
> +       { CCI_REG8(0x0b50), 0x16 },
> +       { CCI_REG8(0x0b51), 0x16 },
> +       { CCI_REG8(0x0b52), 0x00 },
> +       { CCI_REG8(0x0b80), 0x01 },
> +       { CCI_REG8(0x0b81), 0x00 },
> +       { CCI_REG8(0x0b82), 0x00 },
> +       { CCI_REG8(0x0b84), 0x00 },
> +       { CCI_REG8(0x0b85), 0x00 },
> +       { CCI_REG8(0x0b86), 0x00 },
> +       { CCI_REG8(0x0b88), 0x01 },
> +       { CCI_REG8(0x0b89), 0x6a },
> +       { CCI_REG8(0x0b8a), 0x00 },
> +       { CCI_REG8(0x0b8c), 0x00 },
> +       { CCI_REG8(0x0b8d), 0x01 },
> +       { CCI_REG8(0x0b8e), 0x00 },
> +       { CCI_REG8(0x0b90), 0x01 },
> +       { CCI_REG8(0x0b91), 0xf6 },
> +       { CCI_REG8(0x0b92), 0x00 },
> +       { CCI_REG8(0x0b94), 0x00 },
> +       { CCI_REG8(0x0b95), 0x02 },
> +       { CCI_REG8(0x0b96), 0x00 },
> +       { CCI_REG8(0x0b98), 0x02 },
> +       { CCI_REG8(0x0b99), 0xc4 },
> +       { CCI_REG8(0x0b9a), 0x00 },
> +       { CCI_REG8(0x0b9c), 0x00 },
> +       { CCI_REG8(0x0b9d), 0x03 },
> +       { CCI_REG8(0x0b9e), 0x00 },
> +       { CCI_REG8(0x0ba0), 0x03 },
> +       { CCI_REG8(0x0ba1), 0xd8 },
> +       { CCI_REG8(0x0ba2), 0x00 },
> +       { CCI_REG8(0x0ba4), 0x00 },
> +       { CCI_REG8(0x0ba5), 0x04 },
> +       { CCI_REG8(0x0ba6), 0x00 },
> +       { CCI_REG8(0x0ba8), 0x05 },
> +       { CCI_REG8(0x0ba9), 0x4d },
> +       { CCI_REG8(0x0baa), 0x00 },
> +       { CCI_REG8(0x0bac), 0x00 },
> +       { CCI_REG8(0x0bad), 0x05 },
> +       { CCI_REG8(0x0bae), 0x00 },
> +       { CCI_REG8(0x0bb0), 0x07 },
> +       { CCI_REG8(0x0bb1), 0x3e },
> +       { CCI_REG8(0x0bb2), 0x00 },
> +       { CCI_REG8(0x0bb4), 0x00 },
> +       { CCI_REG8(0x0bb5), 0x06 },
> +       { CCI_REG8(0x0bb6), 0x00 },
> +       { CCI_REG8(0x0bb8), 0x0a },
> +       { CCI_REG8(0x0bb9), 0x1a },
> +       { CCI_REG8(0x0bba), 0x00 },
> +       { CCI_REG8(0x0bbc), 0x09 },
> +       { CCI_REG8(0x0bbd), 0x36 },
> +       { CCI_REG8(0x0bbe), 0x00 },
> +       { CCI_REG8(0x0bc0), 0x0e },
> +       { CCI_REG8(0x0bc1), 0x66 },
> +       { CCI_REG8(0x0bc2), 0x00 },
> +       { CCI_REG8(0x0bc4), 0x10 },
> +       { CCI_REG8(0x0bc5), 0x06 },
> +       { CCI_REG8(0x0bc6), 0x00 },
> +       { CCI_REG8(0x02c1), 0xe0 },
> +       { CCI_REG8(0x0207), 0x04 },
> +       { CCI_REG8(0x02c2), 0x10 },
> +       { CCI_REG8(0x02c3), 0x74 },
> +       { CCI_REG8(0x02c5), 0x09 },
> +       { CCI_REG8(0x02c1), 0xe0 },
> +       { CCI_REG8(0x0207), 0x04 },
> +       { CCI_REG8(0x02c2), 0x10 },
> +       { CCI_REG8(0x02c5), 0x09 },
> +       { CCI_REG8(0x02c1), 0xe0 },
> +       { CCI_REG8(0x0207), 0x04 },
> +       { CCI_REG8(0x02c2), 0x10 },
> +       { CCI_REG8(0x02c5), 0x09 },
> +
> +       /* auto load CH_GAIN */
> +       { CCI_REG8(0x0aa1), 0x15 },
> +       { CCI_REG8(0x0aa2), 0x50 },
> +       { CCI_REG8(0x0aa3), 0x00 },
> +       { CCI_REG8(0x0aa4), 0x09 },
> +       { CCI_REG8(0x0a90), 0x25 },
> +       { CCI_REG8(0x0a91), 0x0e },
> +       { CCI_REG8(0x0a94), 0x80 },
> +
> +       /* ISP */
> +       { CCI_REG8(0x0050), 0x00 },
> +       { CCI_REG8(0x0089), 0x83 },
> +       { CCI_REG8(0x005a), 0x40 },
> +       { CCI_REG8(0x00c3), 0x35 },
> +       { CCI_REG8(0x00c4), 0x80 },
> +       { CCI_REG8(0x0080), 0x10 },
> +       { CCI_REG8(0x0040), 0x12 },
> +       { CCI_REG8(0x0053), 0x0a },
> +       { CCI_REG8(0x0054), 0x44 },
> +       { CCI_REG8(0x0055), 0x32 },
> +       { CCI_REG8(0x0058), 0x89 },
> +       { CCI_REG8(0x004a), 0x03 },
> +       { CCI_REG8(0x0048), 0xf0 },
> +       { CCI_REG8(0x0049), 0x0f },
> +       { CCI_REG8(0x0041), 0x20 },
> +       { CCI_REG8(0x0043), 0x0a },
> +       { CCI_REG8(0x009d), 0x08 },
> +       { CCI_REG8(0x0236), 0x40 },
> +
> +       /* gain */

Is the gain configurable? Is this analogue gain? digital gain? or colour
balanace gains ?


> +       { CCI_REG8(0x0204), 0x04 },
> +       { CCI_REG8(0x0205), 0x00 },
> +       { CCI_REG8(0x02b3), 0x00 },
> +       { CCI_REG8(0x02b4), 0x00 },
> +       { CCI_REG8(0x009e), 0x01 },
> +       { CCI_REG8(0x009f), 0x94 },
> +
> +       /* auto load REG */
> +       { CCI_REG8(0x0aa1), 0x10 },
> +       { CCI_REG8(0x0aa2), 0xf8 },
> +       { CCI_REG8(0x0aa3), 0x00 },
> +       { CCI_REG8(0x0aa4), 0x1f },
> +       { CCI_REG8(0x0a90), 0x11 },
> +       { CCI_REG8(0x0a91), 0x0e },
> +       { CCI_REG8(0x0a94), 0x80 },
> +       { CCI_REG8(0x03fe), 0x00 },
> +       { CCI_REG8(0x0a90), 0x00 },
> +       { CCI_REG8(0x0a70), 0x00 },
> +       { CCI_REG8(0x0a67), 0x00 },
> +       { CCI_REG8(0x0af4), 0x29 },
> +
> +       /* DPHY */
> +       { CCI_REG8(0x0d80), 0x07 },
> +       { CCI_REG8(0x0dd3), 0x18 },
> +
> +       /* CISCTL_Reset */
> +       { CCI_REG8(0x031c), 0x80 },
> +       { CCI_REG8(0x03fe), 0x30 },
> +       { CCI_REG8(0x0d17), 0x06 },
> +       { CCI_REG8(0x03fe), 0x00 },
> +       { CCI_REG8(0x0d17), 0x00 },
> +       { CCI_REG8(0x031c), 0x93 },
> +       { CCI_REG8(0x03fe), 0x00 },
> +       { CCI_REG8(0x031c), 0x80 },
> +       { CCI_REG8(0x03fe), 0x30 },
> +       { CCI_REG8(0x0d17), 0x06 },
> +       { CCI_REG8(0x03fe), 0x00 },
> +       { CCI_REG8(0x0d17), 0x00 },
> +       { CCI_REG8(0x031c), 0x93 },
> +};
> +
> +struct gc05a2_mode {
> +       u32 width;
> +       u32 height;
> +       const struct gc05a2_reg_list reg_list;
> +
> +       u32 hts; /* Horizontal timining size */
> +       u32 vts_def; /* Default vertical timining size */
> +       u32 vts_min; /* Min vertical timining size */
> +};
> +
> +/* Declare modes in order, from biggest to smallest height. */
> +static const struct gc05a2_mode gc05a2_modes[] =3D {
> +       {
> +               /* 2592*1944@30fps */
> +               .width =3D GC05A2_NATIVE_WIDTH,
> +               .height =3D GC05A2_NATIVE_HEIGHT,
> +               .reg_list =3D {
> +                       .num_of_regs =3D ARRAY_SIZE(mode_2592x1944),
> +                       .regs =3D mode_2592x1944,
> +               },
> +               .hts =3D 3664,
> +               .vts_def =3D 2032,
> +               .vts_min =3D 2032,
> +       },
> +       {
> +               /* 1280*720@60fps */
> +               .width =3D 1280,
> +               .height =3D 720,
> +               .reg_list =3D {
> +                       .num_of_regs =3D ARRAY_SIZE(mode_1280x720),
> +                       .regs =3D mode_1280x720,
> +               },
> +               .hts =3D 3616,
> +               .vts_def =3D 1032,
> +               .vts_min =3D 1032,
> +       },
> +};
> +
> +static inline struct gc05a2 *to_gc05a2(struct v4l2_subdev *sd)
> +{
> +       return container_of(sd, struct gc05a2, sd);
> +}
> +
> +static int gc05a2_power_on(struct device *dev)
> +{
> +       struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> +       struct gc05a2 *gc05a2 =3D to_gc05a2(sd);
> +       int ret;
> +
> +       ret =3D regulator_bulk_enable(ARRAY_SIZE(gc05a2_supply_name),
> +                                   gc05a2->supplies);
> +       if (ret < 0) {
> +               dev_err(gc05a2->dev, "failed to enable regulators: %d\n",=
 ret);
> +               return ret;
> +       }
> +
> +       ret =3D clk_prepare_enable(gc05a2->xclk);
> +       if (ret < 0) {
> +               regulator_bulk_disable(ARRAY_SIZE(gc05a2_supply_name),
> +                                      gc05a2->supplies);
> +               dev_err(gc05a2->dev, "clk prepare enable failed\n");
> +               return ret;
> +       }
> +
> +       fsleep(GC05A2_SLEEP_US);
> +
> +       gpiod_set_value_cansleep(gc05a2->reset_gpio, 0);
> +       fsleep(GC05A2_SLEEP_US);
> +
> +       return 0;
> +}
> +
> +static int gc05a2_power_off(struct device *dev)
> +{
> +       struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> +       struct gc05a2 *gc05a2 =3D to_gc05a2(sd);
> +
> +       clk_disable_unprepare(gc05a2->xclk);
> +       gpiod_set_value_cansleep(gc05a2->reset_gpio, 1);
> +       regulator_bulk_disable(ARRAY_SIZE(gc05a2_supply_name),
> +                              gc05a2->supplies);
> +
> +       return 0;
> +}
> +
> +static int gc05a2_enum_mbus_code(struct v4l2_subdev *sd,
> +                                struct v4l2_subdev_state *sd_state,
> +                                struct v4l2_subdev_mbus_code_enum *code)
> +{
> +       if (code->index > 0)
> +               return -EINVAL;
> +
> +       code->code =3D GC05A2_MBUS_CODE;
> +
> +       return 0;
> +}
> +
> +static int gc05a2_enum_frame_size(struct v4l2_subdev *subdev,
> +                                 struct v4l2_subdev_state *sd_state,
> +                                 struct v4l2_subdev_frame_size_enum *fse)
> +{
> +       if (fse->code !=3D GC05A2_MBUS_CODE)
> +               return -EINVAL;
> +
> +       if (fse->index >=3D ARRAY_SIZE(gc05a2_modes))
> +               return -EINVAL;
> +
> +       fse->min_width =3D gc05a2_modes[fse->index].width;
> +       fse->max_width =3D gc05a2_modes[fse->index].width;
> +       fse->min_height =3D gc05a2_modes[fse->index].height;
> +       fse->max_height =3D gc05a2_modes[fse->index].height;
> +
> +       return 0;
> +}
> +
> +static int gc05a2_update_cur_mode_controls(struct gc05a2 *gc05a2,
> +                                          const struct gc05a2_mode *mode)
> +{
> +       s64 exposure_max, h_blank;
> +       int ret;
> +
> +       ret =3D __v4l2_ctrl_modify_range(gc05a2->vblank,
> +                                      mode->vts_min - mode->height,
> +                                      GC05A2_VTS_MAX - mode->height, 1,
> +                                      mode->vts_def - mode->height);
> +       if (ret) {
> +               dev_err(gc05a2->dev, "VB ctrl range update failed\n");
> +               return ret;
> +       }
> +
> +       h_blank =3D mode->hts - mode->width;
> +       ret =3D __v4l2_ctrl_modify_range(gc05a2->hblank, h_blank, h_blank=
, 1,
> +                                      h_blank);
> +       if (ret) {
> +               dev_err(gc05a2->dev, "HB ctrl range update failed\n");
> +               return ret;
> +       }
> +
> +       exposure_max =3D mode->vts_def - GC05A2_EXP_MARGIN;
> +       ret =3D __v4l2_ctrl_modify_range(gc05a2->exposure, GC05A2_EXP_MIN,
> +                                      exposure_max, GC05A2_EXP_STEP,
> +                                      exposure_max);
> +       if (ret) {
> +               dev_err(gc05a2->dev, "exposure ctrl range update failed\n=
");
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static void gc05a2_update_pad_format(struct gc05a2 *gc08a3,
> +                                    const struct gc05a2_mode *mode,
> +                                    struct v4l2_mbus_framefmt *fmt)
> +{
> +       fmt->width =3D mode->width;
> +       fmt->height =3D mode->height;
> +       fmt->code =3D GC05A2_MBUS_CODE;
> +       fmt->field =3D V4L2_FIELD_NONE;
> +       fmt->colorspace =3D V4L2_COLORSPACE_RAW;
> +       fmt->ycbcr_enc =3D V4L2_MAP_YCBCR_ENC_DEFAULT(fmt->colorspace);
> +       fmt->quantization =3D V4L2_QUANTIZATION_FULL_RANGE;
> +       fmt->xfer_func =3D V4L2_XFER_FUNC_NONE;
> +}
> +
> +static int gc05a2_set_format(struct v4l2_subdev *sd,
> +                            struct v4l2_subdev_state *state,
> +                            struct v4l2_subdev_format *fmt)
> +{
> +       struct gc05a2 *gc05a2 =3D to_gc05a2(sd);
> +       struct v4l2_mbus_framefmt *mbus_fmt;
> +       struct v4l2_rect *crop;
> +       const struct gc05a2_mode *mode;
> +
> +       mode =3D v4l2_find_nearest_size(gc05a2_modes, ARRAY_SIZE(gc05a2_m=
odes),
> +                                     width, height, fmt->format.width,
> +                                     fmt->format.height);
> +
> +       /* update crop info to subdev state */
> +       crop =3D v4l2_subdev_state_get_crop(state, 0);
> +       crop->width =3D mode->width;
> +       crop->height =3D mode->height;
> +
> +       /* update fmt info to subdev state */
> +       gc05a2_update_pad_format(gc05a2, mode, &fmt->format);
> +       mbus_fmt =3D v4l2_subdev_state_get_format(state, 0);
> +       *mbus_fmt =3D fmt->format;
> +
> +       if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> +               return 0;
> +       gc05a2->cur_mode =3D mode;
> +       gc05a2_update_cur_mode_controls(gc05a2, mode);
> +
> +       return 0;
> +}
> +
> +static int gc05a2_get_selection(struct v4l2_subdev *sd,
> +                               struct v4l2_subdev_state *state,
> +                               struct v4l2_subdev_selection *sel)
> +{
> +       switch (sel->target) {
> +       case V4L2_SEL_TGT_CROP_DEFAULT:
> +       case V4L2_SEL_TGT_CROP:
> +               sel->r =3D *v4l2_subdev_state_get_crop(state, 0);
> +               break;
> +       case V4L2_SEL_TGT_CROP_BOUNDS:
> +               sel->r.top =3D 0;
> +               sel->r.left =3D 0;
> +               sel->r.width =3D GC05A2_NATIVE_WIDTH;
> +               sel->r.height =3D GC05A2_NATIVE_HEIGHT;
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
> +static int gc05a2_init_state(struct v4l2_subdev *sd,
> +                            struct v4l2_subdev_state *state)
> +{
> +       struct v4l2_subdev_format fmt =3D {
> +               .which =3D V4L2_SUBDEV_FORMAT_TRY,
> +               .pad =3D 0,
> +               .format =3D {
> +                       .code =3D GC05A2_MBUS_CODE,
> +                       .width =3D gc05a2_modes[0].width,
> +                       .height =3D gc05a2_modes[0].height,
> +               },
> +       };
> +
> +       gc05a2_set_format(sd, state, &fmt);
> +
> +       return 0;
> +}
> +
> +static int gc05a2_set_ctrl_hflip(struct gc05a2 *gc05a2, u32 ctrl_val)
> +{
> +       int ret;
> +       u64 val;
> +
> +       ret =3D cci_read(gc05a2->regmap, GC05A2_FLIP_REG, &val, NULL);
> +       if (ret) {
> +               dev_err(gc05a2->dev, "read hflip register failed: %d\n", =
ret);
> +               return ret;
> +       }
> +
> +       return cci_update_bits(gc05a2->regmap, GC05A2_FLIP_REG,
> +                              GC05A2_FLIP_H_MASK,
> +                              ctrl_val ? GC05A2_FLIP_H_MASK : 0, NULL);
> +}
> +
> +static int gc05a2_set_ctrl_vflip(struct gc05a2 *gc05a2, u32 ctrl_val)
> +{
> +       int ret;
> +       u64 val;
> +
> +       ret =3D cci_read(gc05a2->regmap, GC05A2_FLIP_REG, &val, NULL);
> +       if (ret) {
> +               dev_err(gc05a2->dev, "read vflip register failed: %d\n", =
ret);
> +               return ret;
> +       }
> +
> +       return cci_update_bits(gc05a2->regmap, GC05A2_FLIP_REG,
> +                              GC05A2_FLIP_V_MASK,
> +                              ctrl_val ? GC05A2_FLIP_V_MASK : 0, NULL);
> +}
> +
> +static int gc05a2_test_pattern(struct gc05a2 *gc05a2, u32 pattern_menu)
> +{
> +       u32 pattern;
> +       int ret;
> +
> +       if (pattern_menu) {
> +               switch (pattern_menu) {
> +               case 1:
> +               case 2:
> +               case 3:
> +               case 4:
> +               case 5:
> +               case 6:
> +               case 7:
> +                       pattern =3D pattern_menu << 4;
> +                       break;
> +
> +               case 8:
> +                       pattern =3D 0;
> +                       break;
> +
> +               case 9:
> +                       pattern =3D 4;
> +                       break;
> +
> +               default:
> +                       pattern =3D 0x00;
> +                       break;
> +               }

This is fairly terse. Can we add comments, or definitions for the types
or such so that the above is easier to interpret?

> +
> +               ret =3D cci_write(gc05a2->regmap, GC05A2_REG_TEST_PATTERN=
_IDX,
> +                               pattern, NULL);
> +               if (ret)
> +                       return ret;
> +
> +               return cci_write(gc05a2->regmap, GC05A2_REG_TEST_PATTERN_=
EN,
> +                                GC05A2_TEST_PATTERN_EN, NULL);
> +       } else {
> +               return cci_write(gc05a2->regmap, GC05A2_REG_TEST_PATTERN_=
EN,
> +                                0x00, NULL);
> +       }
> +}
> +
> +static int gc05a2_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +       struct gc05a2 *gc05a2 =3D
> +               container_of(ctrl->handler, struct gc05a2, ctrls);
> +       int ret =3D 0;
> +       s64 exposure_max;
> +       struct v4l2_subdev_state *state;
> +       const struct v4l2_mbus_framefmt *format;
> +
> +       state =3D v4l2_subdev_get_locked_active_state(&gc05a2->sd);
> +       format =3D v4l2_subdev_state_get_format(state, 0);
> +
> +       if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> +               /* Update max exposure while meeting expected vblanking */
> +               exposure_max =3D format->height + ctrl->val - GC05A2_EXP_=
MARGIN;
> +               __v4l2_ctrl_modify_range(gc05a2->exposure,
> +                                        gc05a2->exposure->minimum,
> +                                        exposure_max, gc05a2->exposure->=
step,
> +                                        exposure_max);
> +       }
> +
> +       /*
> +        * Applying V4L2 control value only happens
> +        * when power is on for streaming.
> +        */
> +       if (!pm_runtime_get_if_active(gc05a2->dev))
> +               return 0;
> +
> +       switch (ctrl->id) {
> +       case V4L2_CID_EXPOSURE:
> +               ret =3D cci_write(gc05a2->regmap, GC05A2_EXP_REG,
> +                               ctrl->val, NULL);
> +               break;
> +
> +       case V4L2_CID_ANALOGUE_GAIN:
> +               ret =3D cci_write(gc05a2->regmap, GC05A2_AGAIN_REG,
> +                               ctrl->val, NULL);
> +               break;
> +
> +       case V4L2_CID_VBLANK:
> +               ret =3D cci_write(gc05a2->regmap, GC05A2_FRAME_LENGTH_REG,
> +                               gc05a2->cur_mode->height + ctrl->val, NUL=
L);
> +               break;
> +
> +       case V4L2_CID_HFLIP:
> +               ret =3D gc05a2_set_ctrl_hflip(gc05a2, ctrl->val);
> +               break;
> +
> +       case V4L2_CID_VFLIP:
> +               ret =3D gc05a2_set_ctrl_vflip(gc05a2, ctrl->val);
> +               break;
> +
> +       case V4L2_CID_TEST_PATTERN:
> +               ret =3D gc05a2_test_pattern(gc05a2, ctrl->val);
> +               break;
> +
> +       default:
> +               break;
> +       }
> +
> +       pm_runtime_put(gc05a2->dev);
> +
> +       return ret;
> +}
> +
> +static const struct v4l2_ctrl_ops gc05a2_ctrl_ops =3D {
> +       .s_ctrl =3D gc05a2_set_ctrl,
> +};
> +
> +static int gc05a2_identify_module(struct gc05a2 *gc05a2)
> +{
> +       u64 val;
> +       int ret;
> +
> +       if (gc05a2->identified)
> +               return 0;
> +
> +       ret =3D cci_read(gc05a2->regmap, GC05A2_REG_CHIP_ID, &val, NULL);
> +       if (ret)
> +               return ret;
> +
> +       if (val !=3D GC05A2_CHIP_ID) {
> +               dev_err(gc05a2->dev, "chip id mismatch: 0x%x!=3D0x%llx",
> +                       GC05A2_CHIP_ID, val);
> +               return -ENXIO;
> +       }
> +
> +       gc05a2->identified =3D true;
> +
> +       return 0;
> +}
> +
> +static int gc05a2_start_streaming(struct gc05a2 *gc05a2)
> +{
> +       const struct gc05a2_mode *mode;
> +       const struct gc05a2_reg_list *reg_list;
> +       int ret;
> +
> +       ret =3D pm_runtime_resume_and_get(gc05a2->dev);
> +       if (ret < 0)
> +               return ret;
> +
> +       ret =3D gc05a2_identify_module(gc05a2);
> +       if (ret)
> +               goto err_rpm_put;
> +
> +       ret =3D cci_multi_reg_write(gc05a2->regmap,
> +                                 mode_table_common,
> +                                 ARRAY_SIZE(mode_table_common), NULL);
> +       if (ret)
> +               goto err_rpm_put;
> +
> +       mode =3D gc05a2->cur_mode;
> +       reg_list =3D &mode->reg_list;
> +
> +       ret =3D cci_multi_reg_write(gc05a2->regmap,
> +                                 reg_list->regs, reg_list->num_of_regs, =
NULL);
> +       if (ret < 0)
> +               goto err_rpm_put;
> +
> +       ret =3D __v4l2_ctrl_handler_setup(&gc05a2->ctrls);
> +       if (ret < 0) {
> +               dev_err(gc05a2->dev, "could not sync v4l2 controls\n");
> +               goto err_rpm_put;
> +       }
> +
> +       ret =3D cci_write(gc05a2->regmap, GC05A2_STREAMING_REG, 1, NULL);
> +       if (ret < 0) {
> +               dev_err(gc05a2->dev, "write STREAMING_REG failed: %d\n", =
ret);
> +               goto err_rpm_put;
> +       }
> +
> +       return 0;
> +
> +err_rpm_put:
> +       pm_runtime_put(gc05a2->dev);
> +       return ret;
> +}
> +
> +static int gc05a2_stop_streaming(struct gc05a2 *gc05a2)
> +{
> +       int ret;
> +
> +       ret =3D cci_write(gc05a2->regmap, GC05A2_STREAMING_REG, 0, NULL);
> +       if (ret < 0)
> +               dev_err(gc05a2->dev, "could not sent stop streaming %d\n"=
, ret);
> +
> +       pm_runtime_put(gc05a2->dev);
> +       return ret;
> +}
> +
> +static int gc05a2_s_stream(struct v4l2_subdev *subdev, int enable)
> +{
> +       struct gc05a2 *gc05a2 =3D to_gc05a2(subdev);
> +       struct v4l2_subdev_state *state;
> +       int ret;
> +
> +       state =3D v4l2_subdev_lock_and_get_active_state(subdev);
> +
> +       if (enable)
> +               ret =3D gc05a2_start_streaming(gc05a2);
> +       else
> +               ret =3D gc05a2_stop_streaming(gc05a2);
> +
> +       v4l2_subdev_unlock_state(state);
> +
> +       return ret;
> +}
> +
> +static const struct v4l2_subdev_video_ops gc05a2_video_ops =3D {
> +       .s_stream =3D gc05a2_s_stream,
> +};
> +
> +static const struct v4l2_subdev_pad_ops gc05a2_subdev_pad_ops =3D {
> +       .enum_mbus_code =3D gc05a2_enum_mbus_code,
> +       .enum_frame_size =3D gc05a2_enum_frame_size,
> +       .get_fmt =3D v4l2_subdev_get_fmt,
> +       .set_fmt =3D gc05a2_set_format,
> +       .get_selection =3D gc05a2_get_selection,
> +};
> +
> +static const struct v4l2_subdev_core_ops gc05a2_core_ops =3D {
> +       .subscribe_event =3D v4l2_ctrl_subdev_subscribe_event,
> +       .unsubscribe_event =3D v4l2_event_subdev_unsubscribe,
> +};
> +
> +static const struct v4l2_subdev_ops gc05a2_subdev_ops =3D {
> +       .core =3D &gc05a2_core_ops,
> +       .video =3D &gc05a2_video_ops,
> +       .pad =3D &gc05a2_subdev_pad_ops,
> +};
> +
> +static const struct v4l2_subdev_internal_ops gc05a2_internal_ops =3D {
> +       .init_state =3D gc05a2_init_state,
> +};
> +
> +static int gc05a2_get_regulators(struct device *dev, struct gc05a2 *gc05=
a2)
> +{
> +       unsigned int i;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(gc05a2_supply_name); i++)
> +               gc05a2->supplies[i].supply =3D gc05a2_supply_name[i];
> +
> +       return devm_regulator_bulk_get(dev, ARRAY_SIZE(gc05a2_supply_name=
),
> +                                      gc05a2->supplies);
> +}
> +
> +static int gc05a2_parse_fwnode(struct gc05a2 *gc05a2)
> +{
> +       struct fwnode_handle *endpoint;
> +       struct v4l2_fwnode_endpoint bus_cfg =3D {
> +               .bus_type =3D V4L2_MBUS_CSI2_DPHY,
> +       };
> +       int ret;
> +       struct device *dev =3D gc05a2->dev;
> +
> +       endpoint =3D
> +               fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0,
> +                                               FWNODE_GRAPH_ENDPOINT_NEX=
T);
> +       if (!endpoint) {
> +               dev_err(dev, "endpoint node not found\n");
> +               return -EINVAL;
> +       }
> +
> +       ret =3D v4l2_fwnode_endpoint_alloc_parse(endpoint, &bus_cfg);
> +       if (ret) {
> +               dev_err(dev, "parsing endpoint node failed\n");
> +               goto done;
> +       }
> +
> +       ret =3D v4l2_link_freq_to_bitmap(dev, bus_cfg.link_frequencies,
> +                                      bus_cfg.nr_of_link_frequencies,
> +                                      gc05a2_link_freq_menu_items,
> +                                      ARRAY_SIZE(gc05a2_link_freq_menu_i=
tems),
> +                                      &gc05a2->link_freq_bitmap);
> +       if (ret)
> +               goto done;
> +
> +done:
> +       v4l2_fwnode_endpoint_free(&bus_cfg);
> +       fwnode_handle_put(endpoint);
> +       return ret;
> +}
> +
> +static u64 gc05a2_to_pixel_rate(u32 f_index)
> +{
> +       u64 pixel_rate =3D
> +               gc05a2_link_freq_menu_items[f_index] * 2 * GC05A2_DATA_LA=
NES;
> +
> +       return div_u64(pixel_rate, GC05A2_RGB_DEPTH);
> +}
> +
> +static int gc05a2_init_controls(struct gc05a2 *gc05a2)
> +{
> +       struct i2c_client *client =3D v4l2_get_subdevdata(&gc05a2->sd);
> +       const struct gc05a2_mode *mode =3D &gc05a2_modes[0];
> +       const struct v4l2_ctrl_ops *ops =3D &gc05a2_ctrl_ops;
> +       struct v4l2_fwnode_device_properties props;
> +       struct v4l2_ctrl_handler *ctrl_hdlr;
> +       s64 exposure_max, h_blank;
> +       int ret;
> +
> +       ctrl_hdlr =3D &gc05a2->ctrls;
> +       ret =3D v4l2_ctrl_handler_init(ctrl_hdlr, 9);
> +       if (ret)
> +               return ret;
> +
> +       gc05a2->hflip =3D v4l2_ctrl_new_std(ctrl_hdlr, &gc05a2_ctrl_ops,
> +                                         V4L2_CID_HFLIP, 0, 1, 1, 0);
> +       gc05a2->vflip =3D v4l2_ctrl_new_std(ctrl_hdlr, &gc05a2_ctrl_ops,
> +                                         V4L2_CID_VFLIP, 0, 1, 1, 0);
> +       v4l2_ctrl_cluster(2, &gc05a2->hflip);
> +
> +       gc05a2->link_freq =3D
> +       v4l2_ctrl_new_int_menu(ctrl_hdlr,
> +                              &gc05a2_ctrl_ops,
> +                              V4L2_CID_LINK_FREQ,
> +                              ARRAY_SIZE(gc05a2_link_freq_menu_items) - =
1,
> +                              0,
> +                              gc05a2_link_freq_menu_items);
> +       if (gc05a2->link_freq)
> +               gc05a2->link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> +
> +       gc05a2->pixel_rate =3D
> +               v4l2_ctrl_new_std(ctrl_hdlr,
> +                                 &gc05a2_ctrl_ops,
> +                                 V4L2_CID_PIXEL_RATE, 0,
> +                                 gc05a2_to_pixel_rate(0),
> +                                 1,
> +                                 gc05a2_to_pixel_rate(0));
> +
> +       gc05a2->vblank =3D
> +               v4l2_ctrl_new_std(ctrl_hdlr,
> +                                 &gc05a2_ctrl_ops, V4L2_CID_VBLANK,
> +                                 mode->vts_min - mode->height,
> +                                 GC05A2_VTS_MAX - mode->height, 1,
> +                                 mode->vts_def - mode->height);
> +
> +       h_blank =3D mode->hts - mode->width;
> +       gc05a2->hblank =3D v4l2_ctrl_new_std(ctrl_hdlr, &gc05a2_ctrl_ops,
> +                                          V4L2_CID_HBLANK, h_blank, h_bl=
ank, 1,
> +                                          h_blank);
> +       if (gc05a2->hblank)
> +               gc05a2->hblank->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> +
> +       v4l2_ctrl_new_std(ctrl_hdlr, &gc05a2_ctrl_ops,
> +                         V4L2_CID_ANALOGUE_GAIN, GC05A2_AGAIN_MIN,
> +                         GC05A2_AGAIN_MAX, GC05A2_AGAIN_STEP,
> +                         GC05A2_AGAIN_MIN);
> +
> +       exposure_max =3D mode->vts_def - GC05A2_EXP_MARGIN;
> +       gc05a2->exposure =3D v4l2_ctrl_new_std(ctrl_hdlr, &gc05a2_ctrl_op=
s,
> +                                            V4L2_CID_EXPOSURE, GC05A2_EX=
P_MIN,
> +                                            exposure_max, GC05A2_EXP_STE=
P,
> +                                            exposure_max);
> +
> +       v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &gc05a2_ctrl_ops,
> +                                    V4L2_CID_TEST_PATTERN,
> +                                    ARRAY_SIZE(gc05a2_test_pattern_menu)=
 - 1,
> +                                    0, 0, gc05a2_test_pattern_menu);
> +
> +       /* register properties to fwnode (e.g. rotation, orientation) */
> +       ret =3D v4l2_fwnode_device_parse(&client->dev, &props);
> +       if (ret)
> +               goto error_ctrls;
> +
> +       ret =3D v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, ops, &props);
> +       if (ret)
> +               goto error_ctrls;
> +
> +       if (ctrl_hdlr->error) {
> +               ret =3D ctrl_hdlr->error;
> +               goto error_ctrls;
> +       }
> +
> +       gc05a2->sd.ctrl_handler =3D ctrl_hdlr;
> +
> +       return 0;
> +
> +error_ctrls:
> +       v4l2_ctrl_handler_free(ctrl_hdlr);
> +
> +       return ret;
> +}
> +
> +static int gc05a2_probe(struct i2c_client *client)
> +{
> +       struct device *dev =3D &client->dev;
> +       struct gc05a2 *gc05a2;
> +       int ret;
> +
> +       gc05a2 =3D devm_kzalloc(dev, sizeof(*gc05a2), GFP_KERNEL);
> +       if (!gc05a2)
> +               return -ENOMEM;
> +
> +       gc05a2->dev =3D dev;
> +
> +       ret =3D gc05a2_parse_fwnode(gc05a2);
> +       if (ret)
> +               return ret;
> +
> +       gc05a2->regmap =3D devm_cci_regmap_init_i2c(client, 16);
> +       if (IS_ERR(gc05a2->regmap))
> +               return dev_err_probe(dev, PTR_ERR(gc05a2->regmap),
> +                                    "failed to init CCI\n");
> +
> +       gc05a2->xclk =3D devm_clk_get(dev, NULL);
> +       if (IS_ERR(gc05a2->xclk))
> +               return dev_err_probe(dev, PTR_ERR(gc05a2->xclk),
> +                                    "failed to get xclk\n");
> +
> +       ret =3D clk_set_rate(gc05a2->xclk, GC05A2_DEFAULT_CLK_FREQ);
> +       if (ret)
> +               return dev_err_probe(dev, ret,
> +                                    "failed to set xclk frequency\n");
> +
> +       ret =3D gc05a2_get_regulators(dev, gc05a2);
> +       if (ret < 0)
> +               return dev_err_probe(dev, ret,
> +                                    "failed to get regulators\n");
> +
> +       gc05a2->reset_gpio =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW=
);
> +       if (IS_ERR(gc05a2->reset_gpio))
> +               return dev_err_probe(dev, PTR_ERR(gc05a2->reset_gpio),
> +                                    "failed to get gpio\n");
> +
> +       v4l2_i2c_subdev_init(&gc05a2->sd, client, &gc05a2_subdev_ops);
> +       gc05a2->sd.internal_ops =3D &gc05a2_internal_ops;
> +       gc05a2->cur_mode =3D &gc05a2_modes[0];
> +
> +       ret =3D gc05a2_init_controls(gc05a2);
> +       if (ret)
> +               return dev_err_probe(dev, ret,
> +                                    "failed to init controls\n");
> +
> +       gc05a2->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE |
> +                           V4L2_SUBDEV_FL_HAS_EVENTS;
> +       gc05a2->pad.flags =3D MEDIA_PAD_FL_SOURCE;
> +       gc05a2->sd.dev =3D &client->dev;
> +       gc05a2->sd.entity.function =3D MEDIA_ENT_F_CAM_SENSOR;
> +
> +       ret =3D media_entity_pads_init(&gc05a2->sd.entity, 1, &gc05a2->pa=
d);
> +       if (ret < 0) {
> +               dev_err(dev, "could not register media entity\n");
> +               goto err_v4l2_ctrl_handler_free;
> +       }
> +
> +       gc05a2->sd.state_lock =3D gc05a2->ctrls.lock;
> +       ret =3D v4l2_subdev_init_finalize(&gc05a2->sd);
> +       if (ret < 0) {
> +               dev_err(dev, "v4l2 subdev init error: %d\n", ret);
> +               goto err_media_entity_cleanup;
> +       }
> +
> +       pm_runtime_set_active(gc05a2->dev);
> +       pm_runtime_enable(gc05a2->dev);
> +       pm_runtime_set_autosuspend_delay(gc05a2->dev, 1000);
> +       pm_runtime_use_autosuspend(gc05a2->dev);
> +       pm_runtime_idle(gc05a2->dev);
> +
> +       ret =3D v4l2_async_register_subdev_sensor(&gc05a2->sd);
> +       if (ret < 0) {
> +               dev_err(dev, "could not register v4l2 device\n");
> +               goto err_rpm;
> +       }
> +
> +       return 0;
> +
> +err_rpm:
> +       pm_runtime_disable(gc05a2->dev);
> +       v4l2_subdev_cleanup(&gc05a2->sd);
> +
> +err_media_entity_cleanup:
> +       media_entity_cleanup(&gc05a2->sd.entity);
> +
> +err_v4l2_ctrl_handler_free:
> +       v4l2_ctrl_handler_free(&gc05a2->ctrls);
> +
> +       return ret;
> +}
> +
> +static void gc05a2_remove(struct i2c_client *client)
> +{
> +       struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> +       struct gc05a2 *gc05a2 =3D to_gc05a2(sd);
> +
> +       v4l2_async_unregister_subdev(&gc05a2->sd);
> +       v4l2_subdev_cleanup(sd);
> +       media_entity_cleanup(&gc05a2->sd.entity);
> +       v4l2_ctrl_handler_free(&gc05a2->ctrls);
> +
> +       pm_runtime_disable(&client->dev);
> +       if (!pm_runtime_status_suspended(&client->dev))
> +               gc05a2_power_off(gc05a2->dev);
> +       pm_runtime_set_suspended(&client->dev);
> +}
> +
> +static const struct of_device_id gc05a2_of_match[] =3D {
> +       { .compatible =3D "galaxycore,gc05a2" },
> +       {}
> +};
> +MODULE_DEVICE_TABLE(of, gc05a2_of_match);
> +
> +static DEFINE_RUNTIME_DEV_PM_OPS(gc05a2_pm_ops,
> +                                gc05a2_power_off,
> +                                gc05a2_power_on,
> +                                NULL);
> +
> +static struct i2c_driver gc05a2_i2c_driver =3D {
> +       .driver =3D {
> +               .of_match_table =3D gc05a2_of_match,
> +               .pm =3D pm_ptr(&gc05a2_pm_ops),
> +               .name  =3D "gc05a2",
> +       },
> +       .probe =3D gc05a2_probe,
> +       .remove =3D gc05a2_remove,
> +};
> +module_i2c_driver(gc05a2_i2c_driver);
> +
> +MODULE_DESCRIPTION("GalaxyCore gc05a2 Camera driver");
> +MODULE_AUTHOR("Zhi Mao <zhi.mao@mediatek.com>");
> +MODULE_LICENSE("GPL");
> --=20
> 2.25.1
>

