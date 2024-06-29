Return-Path: <linux-media+bounces-14407-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC7891CF13
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2024 22:51:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F8AE1F21A7A
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2024 20:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4078713D89D;
	Sat, 29 Jun 2024 20:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UPzxzOsH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C6B137747;
	Sat, 29 Jun 2024 20:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719694300; cv=none; b=ubG4vwHiPbMgGliYoZdMjw5MOX49UqTJm7FRCePp+qbKYewi3HL4fL7qJLiWUXpjiCog+KErQA/4CZX3aCUAIS7IOb99MWJ0JR77ZO2dQ89HHP1EHkRHixEBb3keDtfBRq6vvM+ys+wZc3J0DKLmonNy2fN2OKLhA2HYpgrLveg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719694300; c=relaxed/simple;
	bh=drt2rMkSdIFA0RT1Xf1+U40I5LxwH+N6M5PRAS/xYgE=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=gUwu2jk48PdJnCkBUXJwdDciEgbV/tS/xa09Krbsgh5cl9kGnYz/74bFoZVdVb69F93tR1DK/Vyqz21EGx4TY2rAVrWLjAuboAPtXy+UoLyq0fsdk2YjqC8xX4ryDo5dJ8zErmAOHvKeROAs5QEIx3xJlbX+u9Awk7MRHoxBCL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UPzxzOsH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C4006471;
	Sat, 29 Jun 2024 22:51:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1719694266;
	bh=drt2rMkSdIFA0RT1Xf1+U40I5LxwH+N6M5PRAS/xYgE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=UPzxzOsHE+nxUD/nkYEK8Ibj12yNhIA96UR33FZecHBO34viPItC9rWyuhGIbvD0D
	 xw7Uk/Ba19W90A1+tjSJWNIvzJsISbH1/XHmGAbo1BbBwqTdwxrsPnOEnrP/1yhDV0
	 zSj2N5qOBQhhVKtry3x8Neg49cyJuTziOLbMK56c=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240628-imx728-driver-v2-2-80efa6774286@d3engineering.com>
References: <20240628-imx728-driver-v2-0-80efa6774286@d3engineering.com> <20240628-imx728-driver-v2-2-80efa6774286@d3engineering.com>
Subject: Re: [PATCH v2 2/2] media: i2c: Add driver for Sony IMX728
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
To: Alexander Stein <alexander.stein@ew.tq-group.com>, Conor Dooley <conor+dt@kernel.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Spencer Hill <shill@d3engineering.com>
Date: Sat, 29 Jun 2024 21:51:28 +0100
Message-ID: <171969428808.212912.4106533455091773786@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Hi Spencer,

Thanks for upstreaming sensor drivers! That's always got to be a
positive.

I have a script that looks for keys that I think are useful to consider
for review and it's picked up a few topics. I'm not sure how essential /
relevant they are in this instance yet as I don't know what this sensor
can be connected to...

kbingham@Monstersaurus:~$ notmuch-v4l2-check-sensor-controls 20240628-imx72=
8-driver-v2-2-80efa6774286@d3engineering.com
Processing /home/kbingham/Mail/lore/linux-media/cur/a0ccb893eddef3d752b1f40=
9086ac321828ab901:2,S
Media Controller Support:
 - MEDIA_BUS_FMT_*                 : found
 - V4L2_SUBDEV_FL_HAS_DEVNODE      : found
 - MEDIA_ENT_F_CAM_SENSOR          : found

Mandatory Controls:
 - V4L2_CID_EXPOSURE               : found
 - V4L2_CID_HBLANK                 : --------
 - V4L2_CID_VBLANK                 : --------

>> We expect HBLANK/VBLANK to be handled to control the framerate
>> accurately. I think I've seen that you've already discussed this though.


 - V4L2_CID_PIXEL_RATE             : found
Failed to find some keys

Selection Controls and fwnode properties (will become mandatory):
 - V4L2_SEL_TGT_CROP_DEFAULT       : found
 - V4L2_SEL_TGT_CROP               : found
 - V4L2_SEL_TGT_CROP_BOUNDS        : found
 - .get_selection                  : found
 - v4l2_ctrl_new_fwnode_properties : --------

>> Using v4l2_ctrl_new_fwnode_properties will help parse common properties
>> from device tree and might be worth considering or looking at.

Failed to find some keys

Optional Controls:
 - V4L2_CID_TEST_PATTERN           : found
 - V4L2_CID_GAIN                   : --------
 - V4L2_CID_ANALOGUE_GAIN          : found

>> This just highlights which controls are implemented for gain, and I
>> suspect this is correct.

 - V4L2_CID_CAMERA_SENSOR_ROTATION : --------
 - V4L2_CID_CAMERA_ORIENTATION     : --------

>> And these can be handled by v4l2_ctrl_new_fwnode_properties.

Failed to find some keys

So I think only v4l2_ctrl_new_fwnode_properties and the blanking
controls worthy for consideration still if you get chance.



Quoting Spencer Hill (2024-06-28 22:17:01)
> Add a driver for the Sony IMX728 image sensor.
>=20
> Signed-off-by: Spencer Hill <shill@d3engineering.com>
> ---
>  drivers/media/i2c/Kconfig  |   11 +
>  drivers/media/i2c/Makefile |    1 +
>  drivers/media/i2c/imx728.c | 4660 ++++++++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 4672 insertions(+)
>=20
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index c6d3ee472d81..46b6463c558a 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -233,6 +233,17 @@ config VIDEO_IMX415
>           To compile this driver as a module, choose M here: the
>           module will be called imx415.
>=20
> +config VIDEO_IMX728
> +       tristate "Sony IMX728 sensor support"
> +       depends on OF_GPIO
> +       select V4L2_CCI_I2C
> +       help
> +         This is a Video4Linux2 sensor driver for the Sony
> +         IMX728 camera.
> +
> +         To compile this driver as a module, choose M here: the
> +         module will be called imx728.
> +
>  config VIDEO_MAX9271_LIB
>         tristate
>=20
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index dfbe6448b549..1188420ee1b4 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -56,6 +56,7 @@ obj-$(CONFIG_VIDEO_IMX335) +=3D imx335.o
>  obj-$(CONFIG_VIDEO_IMX355) +=3D imx355.o
>  obj-$(CONFIG_VIDEO_IMX412) +=3D imx412.o
>  obj-$(CONFIG_VIDEO_IMX415) +=3D imx415.o
> +obj-$(CONFIG_VIDEO_IMX728) +=3D imx728.o
>  obj-$(CONFIG_VIDEO_IR_I2C) +=3D ir-kbd-i2c.o
>  obj-$(CONFIG_VIDEO_ISL7998X) +=3D isl7998x.o
>  obj-$(CONFIG_VIDEO_KS0127) +=3D ks0127.o
> diff --git a/drivers/media/i2c/imx728.c b/drivers/media/i2c/imx728.c
> new file mode 100644
> index 000000000000..190f54aaf4e9
> --- /dev/null
> +++ b/drivers/media/i2c/imx728.c
> @@ -0,0 +1,4660 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Sony IMX728 CMOS Image Sensor Driver
> + *
> + * Copyright (c) 2024 Define Design Deploy Corp
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/clk.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/types.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/v4l2-mediabus.h>
> +#include <linux/videodev2.h>
> +#include <media/v4l2-subdev.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-cci.h>
> +
> +#define IMX728_FRAMERATE_MAX           30
> +#define IMX728_FRAMERATE_DEFAULT       30
> +#define IMX728_FRAMERATE_MIN           10
> +
> +#define IMX728_PIXEL_ARRAY_WIDTH       3857
> +#define IMX728_PIXEL_ARRAY_HEIGHT      2177
> +#define IMX728_PIXEL_ARRAY_MARGIN_TOP  9
> +#define IMX728_PIXEL_ARRAY_MARGIN_LEFT 8
> +#define IMX728_PIXEL_ARRAY_RECORDING_WIDTH     3840
> +#define IMX728_PIXEL_ARRAY_RECORDING_HEIGHT    2160
> +
> +#define IMX728_PIXEL_RATE              248832000
> +#define IMX728_LINK_FREQ               800000000
> +
> +#define IMX728_EXPOSURE_DEFAULT                10000
> +
> +#define IMX728_PM_IDLE_TIMEOUT         1000
> +
> +#define IMX728_REG_STATE       CCI_REG8(0x2CAC)

I think lowercase is preferred for hex values.

These can easily be fixed in a big sweep with=20

sed -re 's/(0x[0-9a-fA-F]+)/\L\1/g'


> +#define IMX728_REG_PG_00       CCI_REG16_LE(0x1A2A)
> +#define IMX728_REG_PG_01       CCI_REG24_LE(0x1A30)
> +#define IMX728_REG_PG_02       CCI_REG24_LE(0x1A38)
> +#define IMX728_REG_PG_03       CCI_REG8(0xB58F)
> +#define IMX728_REG_PG_04       CCI_REG8(0xB6C5)
> +#define IMX728_REG_PG_05       CCI_REG16_LE(0x1A2C)
> +#define IMX728_REG_PG_06       CCI_REG8(0xB58E)
> +#define IMX728_REG_PG_07       CCI_REG8(0xB6C4)
> +#define IMX728_REG_EXPOSURE_00 CCI_REG32_LE(0x98DC)
> +#define IMX728_REG_EXPOSURE_01 CCI_REG32_LE(0x98E4)
> +#define IMX728_REG_EXPOSURE_02 CCI_REG32_LE(0x98EC)
> +#define IMX728_REG_AGAIN_00    CCI_REG32_LE(0x98F8)
> +#define IMX728_REG_AGAIN_01    CCI_REG32_LE(0x98FC)
> +#define IMX728_REG_AGAIN_02    CCI_REG32_LE(0x9900)
> +#define IMX728_REG_AGAIN_03    CCI_REG32_LE(0x9904)
> +#define IMX728_REG_AGAIN_04    CCI_REG32_LE(0x9908)
> +#define IMX728_REG_FLIP                CCI_REG8(0x9651)
> +#define IMX728_REG_HFLIP       CCI_REG8(0xB67C)
> +#define IMX728_REG_VFLIP       CCI_REG8(0xB67D)
> +#define IMX728_REG_VMINOR      CCI_REG8(0x6000)
> +#define IMX728_REG_VMAJOR      CCI_REG8(0x6002)
> +#define IMX728_REG_RESET_0     CCI_REG8(0xB661)
> +#define IMX728_REG_RESET_1     CCI_REG8(0x95C5)
> +#define IMX728_REG_INCK_0      CCI_REG8(0x1B20)
> +#define IMX728_REG_INCK_1      CCI_REG8(0x1B1C)
> +#define IMX728_REG_SLEEP       CCI_REG8(0x1B05)
> +#define IMX728_REG_REGMAP      CCI_REG8(0xFFFF)
> +#define IMX728_REG_HDR_00      CCI_REG32_LE(0x9C60)
> +#define IMX728_REG_HDR_01      CCI_REG32_LE(0x9C6C)
> +#define IMX728_REG_HDR_02      CCI_REG32_LE(0x9C64)
> +#define IMX728_REG_HDR_03      CCI_REG32_LE(0x9C70)
> +#define IMX728_REG_HDR_04      CCI_REG16_LE(0x9C68)
> +#define IMX728_REG_HDR_05      CCI_REG16_LE(0x9C74)
> +#define IMX728_REG_HDR_06      CCI_REG16_LE(0x9C6A)
> +#define IMX728_REG_HDR_07      CCI_REG16_LE(0x9C76)
> +#define IMX728_REG_AE_MODE     CCI_REG8(0x98AC)
> +#define IMX728_REG_AWBMODE     CCI_REG8(0xA248)
> +#define IMX728_REG_AWB_EN      CCI_REG8(0x1808)
> +#define IMX728_REG_UNIT_00     CCI_REG8(0x98E0)
> +#define IMX728_REG_UNIT_01     CCI_REG8(0x98E8)
> +#define IMX728_REG_UNIT_02     CCI_REG8(0x98F0)
> +#define IMX728_REG_MD_00       CCI_REG8(0x1708)
> +#define IMX728_REG_MD_01       CCI_REG8(0x1709)
> +#define IMX728_REG_MD_02       CCI_REG8(0x170A)
> +#define IMX728_REG_MD_03       CCI_REG8(0x1B40)
> +#define IMX728_REG_MODE_SEL    CCI_REG16_LE(0x9728)
> +#define IMX728_REG_OUT_MODE    CCI_REG8(0xEC7E)
> +#define IMX728_REG_OB_0                CCI_REG16_LE(0xEC12)
> +#define IMX728_REG_OB_1                CCI_REG8(0xEC14)
> +#define IMX728_REG_SKEW                CCI_REG8(0x1761)
> +#define IMX728_REG_SUBP_0      CCI_REG8(0x9714)
> +#define IMX728_REG_SUBP_1      CCI_REG8(0xB684)
> +#define IMX728_REG_STREAM_00   CCI_REG8(0x9789)
> +#define IMX728_REG_STREAM_01   CCI_REG8(0x95C1)
> +#define IMX728_REG_STREAM_02   CCI_REG8(0x1B04)
> +
> +#define IMX728_REG_CTRL_POINT_X(i) CCI_REG32(0xA198 + (i) * 8)
> +#define IMX728_REG_CTRL_POINT_Y(i) (IMX728_REG_CTRL_POINT_X(i) + 4)
> +
> +enum imx728_sensor_state {
> +       IMX728_SENSOR_STATE_SLEEP               =3D 0x02,
> +       IMX728_SENSOR_STATE_STANDBY             =3D 0x04,
> +       IMX728_SENSOR_STATE_STREAMING           =3D 0x10,
> +       IMX728_SENSOR_STATE_SAFE                =3D 0x20,
> +};
> +
> +
> +enum imx728_remap_mode_id {
> +       IMX728_REMAP_MODE_STANDBY =3D 0x00,
> +       IMX728_REMAP_MODE_STANDBY_PIXEL_SHADING_COMPENSATION =3D 0x01,
> +       IMX728_REMAP_MODE_STANDBY_SPOT_PIXEL_COMPENSATION =3D 0x02,
> +       IMX728_REMAP_MODE_STREAMING =3D 0x04,
> +       IMX728_REMAP_MODE_STREAMING_PIXEL_SHADING_COMPENSATION =3D 0x05,
> +       IMX728_REMAP_MODE_STREAMING_SPOT_PIXEL_COMPENSATION =3D 0x06,
> +       IMX728_REMAP_MODE_SLEEP =3D 0x20,
> +};
> +
> +enum imx728_drive_mode {
> +       IMX728_MODE_3856x2176_45_4LANE_RAW10 =3D 0x01,
> +       IMX728_MODE_3856x2176_45_4LANE_RAW12 =3D 0x02,
> +       IMX728_MODE_3856x2176_45_4LANE_RAW16 =3D 0x03,
> +       IMX728_MODE_3856x2176_45_4LANE_RAW20 =3D 0x04,
> +       IMX728_MODE_3856x2176_45_4LANE_RAW12_HDR =3D 0x05,
> +       IMX728_MODE_3856x2176_40_4LANE_RAW10 =3D 0x11,
> +       IMX728_MODE_3856x2176_40_4LANE_RAW12 =3D 0x12,
> +       IMX728_MODE_3856x2176_40_4LANE_RAW16 =3D 0x13,
> +       IMX728_MODE_3856x2176_40_4LANE_RAW20 =3D 0x14,
> +       IMX728_MODE_3856x2176_40_4LANE_RAW12_HDR =3D 0x16,
> +};
> +
> +enum imx728_awbmode {
> +       IMX728_AWBMODE_ATW =3D 0,
> +       IMX728_AWBMODE_ALL_PULL_IN =3D 1,
> +       IMX728_AWBMODE_USER_PRESET =3D 2,
> +       IMX728_AWBMODE_FULL_MWB =3D 3,
> +       IMX728_AWBMODE_HOLD =3D 4,
> +};
> +
> +enum imx728_img_raw_mode {
> +       IMX728_IMG_MODE_LINEAR =3D 0x0,
> +       IMX728_IMG_MODE_LI =3D 0x1,
> +       IMX728_IMG_MODE_HDR =3D 0x2,
> +       IMX728_IMG_MODE_LI_HDR =3D 0x3,
> +};
> +
> +enum imx728_aemode {
> +       IMX728_AEMODE_AE_AUTO  =3D 0,
> +       IMX728_AEMODE_AE_HOLD  =3D 1,
> +       IMX728_AEMODE_SCALE_ME =3D 2,
> +       IMX728_AEMODE_FULL_ME  =3D 3,
> +};
> +
> +enum imx728_fme_shtval_unit {
> +       IMX728_FME_SHTVAL_UNIT_LINES            =3D 1,
> +       IMX728_FME_SHTVAL_UNIT_MICROSECONDS     =3D 3,
> +       IMX728_FME_SHTVAL_UNIT_FRAMES           =3D 4,
> +};
> +
> +enum imx728_linear_raw_sel {
> +       IMX728_RAW_SEL_SP1H =3D 0x0,
> +       IMX728_RAW_SEL_SP1L =3D 0x1,
> +       IMX728_RAW_SEL_SP1EC =3D 0x2,
> +       IMX728_RAW_SEL_SP2 =3D 0x3,
> +       IMX728_RAW_SEL_SP1VS =3D 0x4
> +};
> +
> +struct imx728_ctrl {
> +       struct v4l2_ctrl_handler handler;
> +       struct v4l2_ctrl *wdr;
> +       struct v4l2_ctrl *exposure;
> +       struct v4l2_ctrl *again;
> +       struct v4l2_ctrl *h_flip;
> +       struct v4l2_ctrl *v_flip;
> +       struct v4l2_ctrl *pg_mode;
> +       struct v4l2_ctrl *pixel_rate;
> +       struct v4l2_ctrl *link_freq;
> +};
> +
> +struct imx728_ctrl_point {
> +       int x, y;
> +};
> +
> +/*
> + * struct imx728 - imx728 device structure
> + * @dev: Device handle
> + * @clk: Pointer to imx728 clock
> + * @client: Pointer to I2C client
> + * @regmap: Pointer to regmap structure
> + * @reset_gpio: Pointer to XCLR gpio
> + * @subdev: V4L2 subdevice structure
> + * @format: V4L2 media bus frame format structure
> + *             (width and height are in sync with the compose rect)
> + * @pad: Media pad structure
> + * @ctrl: imx728 control structure
> + * @clk_rate: Frequency of imx728 clock
> + * @fps: Current frame rate of the sensor.
> + * @lock: Mutex structure for V4L2 ctrl handler
> + * @streaming: Flag to store streaming on/off status
> + */
> +struct imx728 {
> +       struct device *dev;
> +
> +       struct clk *clk;
> +       struct i2c_client *client;
> +       struct regmap *regmap;
> +       struct gpio_desc *reset_gpio;
> +
> +       struct v4l2_subdev subdev;
> +       struct v4l2_mbus_framefmt format;
> +       struct media_pad pad;
> +
> +       struct imx728_ctrl ctrl;
> +
> +       unsigned long clk_rate;
> +       u32 fps;
> +
> +       struct mutex lock;
> +       bool streaming;
> +};
> +
> +static const struct v4l2_area imx728_framesizes[] =3D {
> +       {
> +               .width =3D 3840,
> +               .height =3D 2160,
> +       },
> +};
> +
> +static const u32 imx728_mbus_formats[] =3D {
> +       MEDIA_BUS_FMT_SRGGB10_1X10,
> +};
> +
> +static const s64 imx728_link_freq_menu[] =3D {
> +       IMX728_LINK_FREQ,
> +};
> +
> +static const char *const imx728_ctrl_pg_qmenu[] =3D {
> +       "Disabled",
> +       "Horizontal Color Bars",
> +       "Vertical Color Bars",
> +};
> +
> +static struct imx728_ctrl_point imx728_hdr_20bit[] =3D {
> +       {0, 0},
> +       {1566 >> 4, 938},
> +       {105740 >> 4, 1863},
> +       {387380 >> 4, 2396},
> +       {3818601 >> 4, 3251},
> +       {16777215 >> 4, 4095},
> +       {-1, -1}
> +};
> +
> +static const struct cci_reg_sequence imx728_3840x2160_begin[] =3D {
> +       {CCI_REG8(0x1749), 0x01},
> +       {CCI_REG8(0x174B), 0x01},
> +       {CCI_REG8(0x2DD4), 0x00},
> +       {CCI_REG8(0x2DD5), 0x00},
> +       {CCI_REG8(0x2DD6), 0x00},
> +       {CCI_REG8(0x2DD7), 0x00},
> +       {CCI_REG8(0x2DD8), 0x00},
> +       {CCI_REG8(0x2DD9), 0x00},
> +       {CCI_REG8(0x2DDC), 0x00},
> +       {CCI_REG8(0x2DDD), 0x00},
> +       {CCI_REG8(0x2DE6), 0x00},
> +       {CCI_REG8(0x2DE7), 0x00},
> +       {CCI_REG8(0x2DE8), 0x00},
> +       {CCI_REG8(0x2DE9), 0x00},
> +       {CCI_REG8(0x2DEA), 0x00},
> +       {CCI_REG8(0x2DEB), 0x00},
> +       {CCI_REG8(0x2DEE), 0x00},
> +       {CCI_REG8(0x2DEF), 0x00},
> +       {CCI_REG8(0x2DF8), 0x00},
> +       {CCI_REG8(0x2DF9), 0x00},
> +       {CCI_REG8(0x2DFA), 0x00},
> +       {CCI_REG8(0x2DFB), 0x00},
> +       {CCI_REG8(0x2DFC), 0x00},
> +       {CCI_REG8(0x2DFD), 0x00},
> +       {CCI_REG8(0x2E00), 0x00},
> +       {CCI_REG8(0x2E01), 0x00},
> +       {CCI_REG8(0x2E3A), 0x05},
> +       {CCI_REG8(0x2E3B), 0x00},
> +       {CCI_REG8(0x2EA0), 0xEE},
> +       {CCI_REG8(0x2EA1), 0x31},
> +       {CCI_REG8(0x2EA2), 0x84},
> +       {CCI_REG8(0x2EA3), 0x86},
> +       {CCI_REG8(0x2EDD), 0x01},
> +       {CCI_REG8(0x2F4A), 0x20},
> +       {CCI_REG8(0x2F4B), 0x00},
> +       {CCI_REG8(0x2F56), 0x00},
> +       {CCI_REG8(0x2F57), 0x00},
> +       {CCI_REG8(0x2F98), 0x8D},
> +       {CCI_REG8(0x2F99), 0x00},
> +       {CCI_REG8(0x3018), 0x8D},
> +       {CCI_REG8(0x3019), 0x00},
> +       {CCI_REG8(0x306A), 0x00},
> +       {CCI_REG8(0x306B), 0x00},
> +       {CCI_REG8(0x306C), 0x00},
> +       {CCI_REG8(0x306D), 0x00},
> +       {CCI_REG8(0x306E), 0x01},
> +       {CCI_REG8(0x306F), 0x00},
> +       {CCI_REG8(0x3070), 0x06},
> +       {CCI_REG8(0x3071), 0x00},
> +       {CCI_REG8(0x3072), 0x07},
> +       {CCI_REG8(0x3073), 0x00},
> +       {CCI_REG8(0x3074), 0xC9},
> +       {CCI_REG8(0x3075), 0x08},
> +       {CCI_REG8(0x3082), 0xCC},
> +       {CCI_REG8(0x3083), 0x08},
> +       {CCI_REG8(0x3084), 0xCD},
> +       {CCI_REG8(0x3085), 0x08},
> +       {CCI_REG8(0x30ED), 0x11},
> +       {CCI_REG8(0x30EE), 0x1F},
> +       {CCI_REG8(0x30EF), 0x11},
> +       {CCI_REG8(0x30F0), 0x0D},
> +       {CCI_REG8(0x30F1), 0x1F},
> +       {CCI_REG8(0x30F2), 0x1F},
> +       {CCI_REG8(0x3142), 0x00},
> +       {CCI_REG8(0x315E), 0xD4},
> +       {CCI_REG8(0x315F), 0x01},
> +       {CCI_REG8(0x3176), 0xE0},
> +       {CCI_REG8(0x3177), 0x01},
> +       {CCI_REG8(0x31AA), 0x16},
> +       {CCI_REG8(0x31AB), 0x01},
> +       {CCI_REG8(0x31AE), 0x89},
> +       {CCI_REG8(0x31AF), 0x01},
> +       {CCI_REG8(0x31D4), 0xD5},
> +       {CCI_REG8(0x31D5), 0x01},
> +       {CCI_REG8(0x31EC), 0xE1},
> +       {CCI_REG8(0x31ED), 0x01},
> +       {CCI_REG8(0x3220), 0x17},
> +       {CCI_REG8(0x3221), 0x01},
> +       {CCI_REG8(0x3224), 0x8A},
> +       {CCI_REG8(0x3225), 0x01},
> +       {CCI_REG8(0x3256), 0xFF},
> +       {CCI_REG8(0x3257), 0x07},
> +       {CCI_REG8(0x326E), 0x05},
> +       {CCI_REG8(0x326F), 0x03},
> +       {CCI_REG8(0x32A2), 0xFF},
> +       {CCI_REG8(0x32A3), 0x07},
> +       {CCI_REG8(0x32BA), 0xFF},
> +       {CCI_REG8(0x32BB), 0x07},
> +       {CCI_REG8(0x32D0), 0xFF},
> +       {CCI_REG8(0x32D1), 0x07},
> +       {CCI_REG8(0x32D2), 0xFF},
> +       {CCI_REG8(0x32D3), 0x07},
> +       {CCI_REG8(0x32E8), 0xFF},
> +       {CCI_REG8(0x32E9), 0x07},
> +       {CCI_REG8(0x32EA), 0xFF},
> +       {CCI_REG8(0x32EB), 0x07},
> +       {CCI_REG8(0x331C), 0xFF},
> +       {CCI_REG8(0x331D), 0x07},
> +       {CCI_REG8(0x331E), 0xFF},
> +       {CCI_REG8(0x331F), 0x07},
> +       {CCI_REG8(0x3334), 0xFF},
> +       {CCI_REG8(0x3335), 0x07},
> +       {CCI_REG8(0x3336), 0xFF},
> +       {CCI_REG8(0x3337), 0x07},
> +       {CCI_REG8(0x334C), 0xFF},
> +       {CCI_REG8(0x334D), 0x07},
> +       {CCI_REG8(0x3398), 0xFF},
> +       {CCI_REG8(0x3399), 0x07},
> +       {CCI_REG8(0x33B0), 0xFF},
> +       {CCI_REG8(0x33B1), 0x07},
> +       {CCI_REG8(0x33C6), 0xFF},
> +       {CCI_REG8(0x33C7), 0x07},
> +       {CCI_REG8(0x33D2), 0x00},
> +       {CCI_REG8(0x33D3), 0x03},
> +       {CCI_REG8(0x3402), 0xFF},
> +       {CCI_REG8(0x3403), 0x07},
> +       {CCI_REG8(0x3412), 0xFF},
> +       {CCI_REG8(0x3413), 0x07},
> +       {CCI_REG8(0x3420), 0xFF},
> +       {CCI_REG8(0x3421), 0x07},
> +       {CCI_REG8(0x3422), 0xFF},
> +       {CCI_REG8(0x3423), 0x07},
> +       {CCI_REG8(0x3450), 0xFF},
> +       {CCI_REG8(0x3451), 0x07},
> +       {CCI_REG8(0x3452), 0xFF},
> +       {CCI_REG8(0x3453), 0x07},
> +       {CCI_REG8(0x346C), 0x28},
> +       {CCI_REG8(0x346D), 0x01},
> +       {CCI_REG8(0x3470), 0xFF},
> +       {CCI_REG8(0x3471), 0x07},
> +       {CCI_REG8(0x347C), 0x01},
> +       {CCI_REG8(0x347D), 0x03},
> +       {CCI_REG8(0x34A8), 0x6A},
> +       {CCI_REG8(0x34A9), 0x00},
> +       {CCI_REG8(0x34AC), 0xFF},
> +       {CCI_REG8(0x34AD), 0x07},
> +       {CCI_REG8(0x34BC), 0xFF},
> +       {CCI_REG8(0x34BD), 0x07},
> +       {CCI_REG8(0x3556), 0x03},
> +       {CCI_REG8(0x3557), 0x03},
> +       {CCI_REG8(0x3562), 0xFB},
> +       {CCI_REG8(0x3563), 0x02},
> +       {CCI_REG8(0x357A), 0x45},
> +       {CCI_REG8(0x357B), 0x02},
> +       {CCI_REG8(0x3586), 0x44},
> +       {CCI_REG8(0x3587), 0x02},
> +       {CCI_REG8(0x35B8), 0x04},
> +       {CCI_REG8(0x35B9), 0x03},
> +       {CCI_REG8(0x35C4), 0xFC},
> +       {CCI_REG8(0x35C5), 0x02},
> +       {CCI_REG8(0x35DC), 0x46},
> +       {CCI_REG8(0x35DD), 0x02},
> +       {CCI_REG8(0x35E8), 0x45},
> +       {CCI_REG8(0x35E9), 0x02},
> +       {CCI_REG8(0x35F4), 0xD6},
> +       {CCI_REG8(0x35F5), 0x01},
> +       {CCI_REG8(0x3608), 0x18},
> +       {CCI_REG8(0x3609), 0x01},
> +       {CCI_REG8(0x3636), 0xD5},
> +       {CCI_REG8(0x3637), 0x01},
> +       {CCI_REG8(0x364A), 0x17},
> +       {CCI_REG8(0x364B), 0x01},
> +       {CCI_REG8(0x37B0), 0xC1},
> +       {CCI_REG8(0x37B1), 0x00},
> +       {CCI_REG8(0x37B2), 0xDC},
> +       {CCI_REG8(0x37B3), 0x01},
> +       {CCI_REG8(0x37B4), 0x03},
> +       {CCI_REG8(0x37B5), 0x02},
> +       {CCI_REG8(0x37B6), 0x33},
> +       {CCI_REG8(0x37B7), 0x02},
> +       {CCI_REG8(0x3800), 0xDD},
> +       {CCI_REG8(0x3801), 0x01},
> +       {CCI_REG8(0x3802), 0xC0},
> +       {CCI_REG8(0x3803), 0x00},
> +       {CCI_REG8(0x3804), 0x34},
> +       {CCI_REG8(0x3805), 0x02},
> +       {CCI_REG8(0x3806), 0x02},
> +       {CCI_REG8(0x3807), 0x02},
> +       {CCI_REG8(0x3B10), 0xFF},
> +       {CCI_REG8(0x3B11), 0x07},
> +       {CCI_REG8(0x3B12), 0x00},
> +       {CCI_REG8(0x3B13), 0x00},
> +       {CCI_REG8(0x3B1A), 0x00},
> +       {CCI_REG8(0x3B1B), 0x00},
> +       {CCI_REG8(0x3B20), 0xFF},
> +       {CCI_REG8(0x3B21), 0x07},
> +       {CCI_REG8(0x3B22), 0x00},
> +       {CCI_REG8(0x3B23), 0x00},
> +       {CCI_REG8(0x3B40), 0x00},
> +       {CCI_REG8(0x3B41), 0x00},
> +       {CCI_REG8(0x3B42), 0xFF},
> +       {CCI_REG8(0x3B43), 0x07},
> +       {CCI_REG8(0x3B48), 0x00},
> +       {CCI_REG8(0x3B49), 0x00},
> +       {CCI_REG8(0x3B50), 0x00},
> +       {CCI_REG8(0x3B51), 0x00},
> +       {CCI_REG8(0x3B52), 0xFF},
> +       {CCI_REG8(0x3B53), 0x07},
> +       {CCI_REG8(0x3B66), 0xD4},
> +       {CCI_REG8(0x3B67), 0x01},
> +       {CCI_REG8(0x3BBA), 0x16},
> +       {CCI_REG8(0x3BBB), 0x01},
> +       {CCI_REG8(0x3BF4), 0xD5},
> +       {CCI_REG8(0x3BF5), 0x01},
> +       {CCI_REG8(0x3C48), 0x17},
> +       {CCI_REG8(0x3C49), 0x01},
> +       {CCI_REG8(0x3D0C), 0xFF},
> +       {CCI_REG8(0x3D0D), 0x07},
> +       {CCI_REG8(0x3D0E), 0xFF},
> +       {CCI_REG8(0x3D0F), 0x07},
> +       {CCI_REG8(0x3D5C), 0xFF},
> +       {CCI_REG8(0x3D5D), 0x07},
> +       {CCI_REG8(0x3D5E), 0xFF},
> +       {CCI_REG8(0x3D5F), 0x07},
> +       {CCI_REG8(0x3D7C), 0xCE},
> +       {CCI_REG8(0x3D7D), 0x01},
> +       {CCI_REG8(0x3DD8), 0x10},
> +       {CCI_REG8(0x3DD9), 0x01},
> +       {CCI_REG8(0x3DDA), 0x46},
> +       {CCI_REG8(0x3DDB), 0x01},
> +       {CCI_REG8(0x3DFC), 0x2C},
> +       {CCI_REG8(0x3DFD), 0x01},
> +       {CCI_REG8(0x3E34), 0x6E},
> +       {CCI_REG8(0x3E35), 0x00},
> +       {CCI_REG8(0x3EBA), 0xD7},
> +       {CCI_REG8(0x3EBB), 0x00},
> +       {CCI_REG8(0x3EBE), 0xFF},
> +       {CCI_REG8(0x3EBF), 0x07},
> +       {CCI_REG8(0x3EC2), 0xFF},
> +       {CCI_REG8(0x3EC3), 0x07},
> +       {CCI_REG8(0x3EEE), 0xFF},
> +       {CCI_REG8(0x3EEF), 0x07},
> +       {CCI_REG8(0x3EF2), 0xFF},
> +       {CCI_REG8(0x3EF3), 0x07},
> +       {CCI_REG8(0x3EFA), 0xD7},
> +       {CCI_REG8(0x3EFB), 0x00},
> +       {CCI_REG8(0x3EFE), 0xFF},
> +       {CCI_REG8(0x3EFF), 0x07},
> +       {CCI_REG8(0x3F02), 0xFF},
> +       {CCI_REG8(0x3F03), 0x07},
> +       {CCI_REG8(0x3F08), 0xD8},
> +       {CCI_REG8(0x3F09), 0x00},
> +       {CCI_REG8(0x3F0A), 0xDC},
> +       {CCI_REG8(0x3F0B), 0x00},
> +       {CCI_REG8(0x3F0C), 0xFF},
> +       {CCI_REG8(0x3F0D), 0x07},
> +       {CCI_REG8(0x3F0E), 0xFF},
> +       {CCI_REG8(0x3F0F), 0x07},
> +       {CCI_REG8(0x3F10), 0xFF},
> +       {CCI_REG8(0x3F11), 0x07},
> +       {CCI_REG8(0x3F12), 0xFF},
> +       {CCI_REG8(0x3F13), 0x07},
> +       {CCI_REG8(0x3F3C), 0xFF},
> +       {CCI_REG8(0x3F3D), 0x07},
> +       {CCI_REG8(0x3F3E), 0xFF},
> +       {CCI_REG8(0x3F3F), 0x07},
> +       {CCI_REG8(0x3F40), 0xFF},
> +       {CCI_REG8(0x3F41), 0x07},
> +       {CCI_REG8(0x3F42), 0xFF},
> +       {CCI_REG8(0x3F43), 0x07},
> +       {CCI_REG8(0x3F48), 0xD8},
> +       {CCI_REG8(0x3F49), 0x00},
> +       {CCI_REG8(0x3F4A), 0xDC},
> +       {CCI_REG8(0x3F4B), 0x00},
> +       {CCI_REG8(0x3F4C), 0xFF},
> +       {CCI_REG8(0x3F4D), 0x07},
> +       {CCI_REG8(0x3F4E), 0xFF},
> +       {CCI_REG8(0x3F4F), 0x07},
> +       {CCI_REG8(0x3F50), 0xFF},
> +       {CCI_REG8(0x3F51), 0x07},
> +       {CCI_REG8(0x3F52), 0xFF},
> +       {CCI_REG8(0x3F53), 0x07},
> +       {CCI_REG8(0x3F58), 0xDD},
> +       {CCI_REG8(0x3F59), 0x00},
> +       {CCI_REG8(0x3F5C), 0xFF},
> +       {CCI_REG8(0x3F5D), 0x07},
> +       {CCI_REG8(0x3F60), 0xFF},
> +       {CCI_REG8(0x3F61), 0x07},
> +       {CCI_REG8(0x3F8C), 0xFF},
> +       {CCI_REG8(0x3F8D), 0x07},
> +       {CCI_REG8(0x3F90), 0xFF},
> +       {CCI_REG8(0x3F91), 0x07},
> +       {CCI_REG8(0x3F98), 0xDD},
> +       {CCI_REG8(0x3F99), 0x00},
> +       {CCI_REG8(0x3F9C), 0xFF},
> +       {CCI_REG8(0x3F9D), 0x07},
> +       {CCI_REG8(0x3FA0), 0xFF},
> +       {CCI_REG8(0x3FA1), 0x07},
> +       {CCI_REG8(0x3FAA), 0xC7},
> +       {CCI_REG8(0x3FAB), 0x00},
> +       {CCI_REG8(0x3FAC), 0xE0},
> +       {CCI_REG8(0x3FAD), 0x00},
> +       {CCI_REG8(0x3FEA), 0xC7},
> +       {CCI_REG8(0x3FEB), 0x00},
> +       {CCI_REG8(0x3FEC), 0xE0},
> +       {CCI_REG8(0x3FED), 0x00},
> +       {CCI_REG8(0x3FF8), 0xC8},
> +       {CCI_REG8(0x3FF9), 0x00},
> +       {CCI_REG8(0x3FFA), 0xCC},
> +       {CCI_REG8(0x3FFB), 0x00},
> +       {CCI_REG8(0x4038), 0xC8},
> +       {CCI_REG8(0x4039), 0x00},
> +       {CCI_REG8(0x403A), 0xCC},
> +       {CCI_REG8(0x403B), 0x00},
> +       {CCI_REG8(0x4048), 0xCD},
> +       {CCI_REG8(0x4049), 0x00},
> +       {CCI_REG8(0x404E), 0xDF},
> +       {CCI_REG8(0x404F), 0x00},
> +       {CCI_REG8(0x4088), 0xCD},
> +       {CCI_REG8(0x4089), 0x00},
> +       {CCI_REG8(0x408E), 0xDF},
> +       {CCI_REG8(0x408F), 0x00},
> +       {CCI_REG8(0x4408), 0xFF},
> +       {CCI_REG8(0x4409), 0x07},
> +       {CCI_REG8(0x4410), 0xFF},
> +       {CCI_REG8(0x4411), 0x07},
> +       {CCI_REG8(0x4418), 0xFF},
> +       {CCI_REG8(0x4419), 0x07},
> +       {CCI_REG8(0x4420), 0xFF},
> +       {CCI_REG8(0x4421), 0x07},
> +       {CCI_REG8(0x4428), 0xFF},
> +       {CCI_REG8(0x4429), 0x07},
> +       {CCI_REG8(0x4430), 0xFF},
> +       {CCI_REG8(0x4431), 0x07},
> +       {CCI_REG8(0x4436), 0xFF},
> +       {CCI_REG8(0x4437), 0x07},
> +       {CCI_REG8(0x4444), 0xFF},
> +       {CCI_REG8(0x4445), 0x07},
> +       {CCI_REG8(0x4464), 0xFF},
> +       {CCI_REG8(0x4465), 0x07},
> +       {CCI_REG8(0x4474), 0xFF},
> +       {CCI_REG8(0x4475), 0x07},
> +       {CCI_REG8(0x44A7), 0x2E},
> +       {CCI_REG8(0x4594), 0x1B},
> +       {CCI_REG8(0x4596), 0x1F},
> +       {CCI_REG8(0x459B), 0x1B},
> +       {CCI_REG8(0x459D), 0x1F},
> +       {CCI_REG8(0x45A1), 0x14},
> +       {CCI_REG8(0x45A4), 0x16},
> +       {CCI_REG8(0x45A6), 0x14},
> +       {CCI_REG8(0x45AB), 0x16},
> +       {CCI_REG8(0x45AC), 0x11},
> +       {CCI_REG8(0x45AD), 0x11},
> +       {CCI_REG8(0x45AE), 0x0B},
> +       {CCI_REG8(0x45AF), 0x0B},
> +       {CCI_REG8(0x45B0), 0x0B},
> +       {CCI_REG8(0x45B1), 0x0B},
> +       {CCI_REG8(0x45B2), 0x1F},
> +       {CCI_REG8(0x45B3), 0x0B},
> +       {CCI_REG8(0x45B4), 0x0B},
> +       {CCI_REG8(0x45B5), 0x1F},
> +       {CCI_REG8(0x45B6), 0x1F},
> +       {CCI_REG8(0x45B7), 0x1F},
> +       {CCI_REG8(0x45B8), 0x1F},
> +       {CCI_REG8(0x45B9), 0x1F},
> +       {CCI_REG8(0x45BA), 0x1F},
> +       {CCI_REG8(0x45BB), 0x1F},
> +       {CCI_REG8(0x45BC), 0x1F},
> +       {CCI_REG8(0x45BD), 0x1F},
> +       {CCI_REG8(0x45BE), 0x0D},
> +       {CCI_REG8(0x45BF), 0x0D},
> +       {CCI_REG8(0x45C0), 0x0B},
> +       {CCI_REG8(0x45C1), 0x0B},
> +       {CCI_REG8(0x45C2), 0x0B},
> +       {CCI_REG8(0x45C3), 0x0B},
> +       {CCI_REG8(0x45C4), 0x1F},
> +       {CCI_REG8(0x45C5), 0x0B},
> +       {CCI_REG8(0x45C6), 0x0B},
> +       {CCI_REG8(0x460B), 0x01},
> +       {CCI_REG8(0x465A), 0x08},
> +       {CCI_REG8(0x465B), 0x00},
> +       {CCI_REG8(0x465C), 0x00},
> +       {CCI_REG8(0x465D), 0x00},
> +       {CCI_REG8(0x465E), 0x06},
> +       {CCI_REG8(0x4660), 0x00},
> +       {CCI_REG8(0x4661), 0x00},
> +       {CCI_REG8(0x4662), 0x00},
> +       {CCI_REG8(0x4663), 0x00},
> +       {CCI_REG8(0x4664), 0x00},
> +       {CCI_REG8(0x4665), 0x00},
> +       {CCI_REG8(0x4666), 0x00},
> +       {CCI_REG8(0x4667), 0x00},
> +       {CCI_REG8(0x4668), 0x00},
> +       {CCI_REG8(0x4669), 0x00},
> +       {CCI_REG8(0x466A), 0x04},
> +       {CCI_REG8(0x466C), 0x00},
> +       {CCI_REG8(0x466D), 0x00},
> +       {CCI_REG8(0x466E), 0x06},
> +       {CCI_REG8(0x4670), 0x00},
> +       {CCI_REG8(0x4671), 0x00},
> +       {CCI_REG8(0x4672), 0x00},
> +       {CCI_REG8(0x4673), 0x00},
> +       {CCI_REG8(0x4674), 0x00},
> +       {CCI_REG8(0x4675), 0x00},
> +       {CCI_REG8(0x4676), 0x00},
> +       {CCI_REG8(0x4677), 0x00},
> +       {CCI_REG8(0x4678), 0x00},
> +       {CCI_REG8(0x4679), 0x00},
> +       {CCI_REG8(0x46AE), 0xCA},
> +       {CCI_REG8(0x46AF), 0x00},
> +       {CCI_REG8(0x46B0), 0xB8},
> +       {CCI_REG8(0x46B1), 0x01},
> +       {CCI_REG8(0x46B6), 0x34},
> +       {CCI_REG8(0x46B7), 0x02},
> +       {CCI_REG8(0x46B8), 0x87},
> +       {CCI_REG8(0x46B9), 0x02},
> +       {CCI_REG8(0x46BA), 0x94},
> +       {CCI_REG8(0x46BB), 0x06},
> +       {CCI_REG8(0x46D2), 0xA0},
> +       {CCI_REG8(0x46D3), 0x04},
> +       {CCI_REG8(0x4778), 0x02},
> +       {CCI_REG8(0x4779), 0x02},
> +       {CCI_REG8(0x477A), 0x02},
> +       {CCI_REG8(0x477B), 0x02},
> +       {CCI_REG8(0x477C), 0x02},
> +       {CCI_REG8(0x477D), 0x02},
> +       {CCI_REG8(0x477E), 0x02},
> +       {CCI_REG8(0x477F), 0x02},
> +       {CCI_REG8(0x4782), 0x03},
> +       {CCI_REG8(0x4786), 0x03},
> +       {CCI_REG8(0x4788), 0x03},
> +       {CCI_REG8(0x4789), 0x03},
> +       {CCI_REG8(0x478A), 0x03},
> +       {CCI_REG8(0x478C), 0x03},
> +       {CCI_REG8(0x478D), 0x03},
> +       {CCI_REG8(0x478E), 0x03},
> +       {CCI_REG8(0x4792), 0x03},
> +       {CCI_REG8(0x4796), 0x03},
> +       {CCI_REG8(0x4798), 0x01},
> +       {CCI_REG8(0x4799), 0x02},
> +       {CCI_REG8(0x479A), 0x03},
> +       {CCI_REG8(0x479C), 0x03},
> +       {CCI_REG8(0x479D), 0x03},
> +       {CCI_REG8(0x479E), 0x03},
> +       {CCI_REG8(0x47A3), 0x01},
> +       {CCI_REG8(0x47AB), 0x00},
> +       {CCI_REG8(0x47AD), 0x00},
> +       {CCI_REG8(0x47F4), 0x12},
> +       {CCI_REG8(0x47F6), 0x0C},
> +       {CCI_REG8(0x47FA), 0x09},
> +       {CCI_REG8(0x47FB), 0x0B},
> +       {CCI_REG8(0x47FC), 0x0A},
> +       {CCI_REG8(0x4801), 0x05},
> +       {CCI_REG8(0x4802), 0x04},
> +       {CCI_REG8(0x4803), 0x06},
> +       {CCI_REG8(0x4804), 0x05},
> +       {CCI_REG8(0x4805), 0x04},
> +       {CCI_REG8(0x480A), 0x0D},
> +       {CCI_REG8(0x480B), 0x14},
> +       {CCI_REG8(0x480C), 0x10},
> +       {CCI_REG8(0x480D), 0x12},
> +       {CCI_REG8(0x480E), 0x16},
> +       {CCI_REG8(0x4815), 0x09},
> +       {CCI_REG8(0x4816), 0x05},
> +       {CCI_REG8(0x4817), 0x08},
> +       {CCI_REG8(0x481E), 0x09},
> +       {CCI_REG8(0x481F), 0x09},
> +       {CCI_REG8(0x4820), 0x0D},
> +       {CCI_REG8(0x4827), 0x09},
> +       {CCI_REG8(0x4828), 0x07},
> +       {CCI_REG8(0x4829), 0x0B},
> +       {CCI_REG8(0x482E), 0x0F},
> +       {CCI_REG8(0x482F), 0x0F},
> +       {CCI_REG8(0x4830), 0x0A},
> +       {CCI_REG8(0x4831), 0x0A},
> +       {CCI_REG8(0x48F6), 0xE2},
> +       {CCI_REG8(0x48F7), 0x00},
> +       {CCI_REG8(0x48F8), 0x84},
> +       {CCI_REG8(0x48F9), 0x00},
> +       {CCI_REG8(0x48FA), 0x80},
> +       {CCI_REG8(0x48FB), 0x00},
> +       {CCI_REG8(0x48FC), 0x45},
> +       {CCI_REG8(0x48FD), 0x00},
> +       {CCI_REG8(0x48FE), 0x70},
> +       {CCI_REG8(0x48FF), 0x00},
> +       {CCI_REG8(0x4902), 0xB9},
> +       {CCI_REG8(0x4903), 0x00},
> +       {CCI_REG8(0x4904), 0x45},
> +       {CCI_REG8(0x4905), 0x00},
> +       {CCI_REG8(0x4906), 0x1F},
> +       {CCI_REG8(0x4907), 0x1F},
> +       {CCI_REG8(0x4908), 0x18},
> +       {CCI_REG8(0x4909), 0x1F},
> +       {CCI_REG8(0x490A), 0x1E},
> +       {CCI_REG8(0x490C), 0x0A},
> +       {CCI_REG8(0x490D), 0x1F},
> +       {CCI_REG8(0x490E), 0x00},
> +       {CCI_REG8(0x490F), 0x00},
> +       {CCI_REG8(0x4910), 0x06},
> +       {CCI_REG8(0x4911), 0x00},
> +       {CCI_REG8(0x4912), 0x00},
> +       {CCI_REG8(0x4915), 0x00},
> +       {CCI_REG8(0x491C), 0x78},
> +       {CCI_REG8(0x491D), 0x78},
> +       {CCI_REG8(0x491E), 0x78},
> +       {CCI_REG8(0x491F), 0x78},
> +       {CCI_REG8(0x4924), 0x61},
> +       {CCI_REG8(0x4925), 0x61},
> +       {CCI_REG8(0x4926), 0x61},
> +       {CCI_REG8(0x4927), 0x61},
> +       {CCI_REG8(0x4928), 0x5F},
> +       {CCI_REG8(0x4929), 0x5F},
> +       {CCI_REG8(0x492A), 0x5F},
> +       {CCI_REG8(0x492B), 0x5F},
> +       {CCI_REG8(0x492C), 0x78},
> +       {CCI_REG8(0x492D), 0x78},
> +       {CCI_REG8(0x492E), 0x78},
> +       {CCI_REG8(0x492F), 0x78},
> +       {CCI_REG8(0x4930), 0x78},
> +       {CCI_REG8(0x4931), 0x78},
> +       {CCI_REG8(0x4932), 0x78},
> +       {CCI_REG8(0x4933), 0x78},
> +       {CCI_REG8(0x4934), 0x78},
> +       {CCI_REG8(0x4935), 0x78},
> +       {CCI_REG8(0x4936), 0x78},
> +       {CCI_REG8(0x4937), 0x78},
> +       {CCI_REG8(0x4938), 0x5F},
> +       {CCI_REG8(0x4939), 0x5F},
> +       {CCI_REG8(0x493A), 0x5F},
> +       {CCI_REG8(0x493B), 0x5F},
> +       {CCI_REG8(0x4942), 0x0A},
> +       {CCI_REG8(0x4943), 0x0A},
> +       {CCI_REG8(0x4944), 0x0A},
> +       {CCI_REG8(0x4945), 0x0A},
> +       {CCI_REG8(0x4947), 0x1F},
> +       {CCI_REG8(0x4948), 0x1F},
> +       {CCI_REG8(0x4949), 0x1F},
> +       {CCI_REG8(0x494A), 0x0C},
> +       {CCI_REG8(0x494B), 0x0C},
> +       {CCI_REG8(0x494C), 0x0C},
> +       {CCI_REG8(0x494D), 0x0C},
> +       {CCI_REG8(0x494E), 0x0E},
> +       {CCI_REG8(0x494F), 0x0E},
> +       {CCI_REG8(0x4950), 0x0E},
> +       {CCI_REG8(0x4951), 0x0E},
> +       {CCI_REG8(0x4952), 0x11},
> +       {CCI_REG8(0x4953), 0x11},
> +       {CCI_REG8(0x4954), 0x11},
> +       {CCI_REG8(0x4955), 0x11},
> +       {CCI_REG8(0x4956), 0x0E},
> +       {CCI_REG8(0x4957), 0x0E},
> +       {CCI_REG8(0x4958), 0x0E},
> +       {CCI_REG8(0x4959), 0x0E},
> +       {CCI_REG8(0x495A), 0x10},
> +       {CCI_REG8(0x495B), 0x10},
> +       {CCI_REG8(0x495C), 0x10},
> +       {CCI_REG8(0x495D), 0x10},
> +       {CCI_REG8(0x495E), 0x0E},
> +       {CCI_REG8(0x495F), 0x0E},
> +       {CCI_REG8(0x4960), 0x0E},
> +       {CCI_REG8(0x4961), 0x0E},
> +       {CCI_REG8(0x4970), 0x00},
> +       {CCI_REG8(0x4971), 0x00},
> +       {CCI_REG8(0x4972), 0x00},
> +       {CCI_REG8(0x4973), 0x00},
> +       {CCI_REG8(0x4974), 0x00},
> +       {CCI_REG8(0x4975), 0x00},
> +       {CCI_REG8(0x4976), 0x00},
> +       {CCI_REG8(0x4977), 0x00},
> +       {CCI_REG8(0x4978), 0x04},
> +       {CCI_REG8(0x4979), 0x04},
> +       {CCI_REG8(0x497A), 0x04},
> +       {CCI_REG8(0x497B), 0x04},
> +       {CCI_REG8(0x497C), 0x03},
> +       {CCI_REG8(0x497D), 0x03},
> +       {CCI_REG8(0x497E), 0x03},
> +       {CCI_REG8(0x497F), 0x03},
> +       {CCI_REG8(0x4980), 0x05},
> +       {CCI_REG8(0x4981), 0x05},
> +       {CCI_REG8(0x4982), 0x05},
> +       {CCI_REG8(0x4983), 0x05},
> +       {CCI_REG8(0x4984), 0x00},
> +       {CCI_REG8(0x4985), 0x00},
> +       {CCI_REG8(0x4986), 0x00},
> +       {CCI_REG8(0x4987), 0x00},
> +       {CCI_REG8(0x4A68), 0x72},
> +       {CCI_REG8(0x4A69), 0x00},
> +       {CCI_REG8(0x4A6A), 0x6E},
> +       {CCI_REG8(0x4A6B), 0x00},
> +       {CCI_REG8(0x4A9C), 0x6E},
> +       {CCI_REG8(0x4A9D), 0x00},
> +       {CCI_REG8(0x4BB8), 0x00},
> +       {CCI_REG8(0x4BB9), 0x00},
> +       {CCI_REG8(0x4BBA), 0xFF},
> +       {CCI_REG8(0x4BBB), 0x03},
> +       {CCI_REG8(0x4BC0), 0x00},
> +       {CCI_REG8(0x4BC1), 0x00},
> +       {CCI_REG8(0x4BC2), 0xFF},
> +       {CCI_REG8(0x4BC3), 0x03},
> +       {CCI_REG8(0x4C46), 0x6E},
> +       {CCI_REG8(0x4C47), 0x00},
> +       {CCI_REG8(0x4CDA), 0x28},
> +       {CCI_REG8(0x4CDB), 0x00},
> +       {CCI_REG8(0x4CDE), 0x7B},
> +       {CCI_REG8(0x4CDF), 0x00},
> +       {CCI_REG8(0x4CE2), 0x28},
> +       {CCI_REG8(0x4CE3), 0x00},
> +       {CCI_REG8(0x4EEA), 0x70},
> +       {CCI_REG8(0x4EEB), 0x00},
> +       {CCI_REG8(0x4F00), 0x6C},
> +       {CCI_REG8(0x4F01), 0x00},
> +       {CCI_REG8(0x5072), 0x6C},
> +       {CCI_REG8(0x5073), 0x00},
> +       {CCI_REG8(0x5086), 0x6C},
> +       {CCI_REG8(0x5087), 0x00},
> +       {CCI_REG8(0x55A0), 0x3A},
> +       {CCI_REG8(0x55A1), 0x00},
> +       {CCI_REG8(0x55A6), 0x7A},
> +       {CCI_REG8(0x55A7), 0x01},
> +       {CCI_REG8(0x55A8), 0x3A},
> +       {CCI_REG8(0x55A9), 0x00},
> +       {CCI_REG8(0x55AE), 0xBB},
> +       {CCI_REG8(0x55AF), 0x00},
> +       {CCI_REG8(0x55B2), 0x60},
> +       {CCI_REG8(0x55B3), 0x00},
> +       {CCI_REG8(0x55B4), 0x86},
> +       {CCI_REG8(0x55B5), 0x00},
> +       {CCI_REG8(0x55B6), 0xB7},
> +       {CCI_REG8(0x55B7), 0x00},
> +       {CCI_REG8(0x55B8), 0x17},
> +       {CCI_REG8(0x55B9), 0x00},
> +       {CCI_REG8(0x55BA), 0x5F},
> +       {CCI_REG8(0x55BB), 0x00},
> +       {CCI_REG8(0x55BC), 0x8D},
> +       {CCI_REG8(0x55BD), 0x00},
> +       {CCI_REG8(0x55BE), 0xBB},
> +       {CCI_REG8(0x55BF), 0x00},
> +       {CCI_REG8(0x594C), 0xFF},
> +       {CCI_REG8(0x594D), 0x03},
> +       {CCI_REG8(0x594E), 0xFF},
> +       {CCI_REG8(0x594F), 0x03},
> +       {CCI_REG8(0x5950), 0xFF},
> +       {CCI_REG8(0x5951), 0x03},
> +       {CCI_REG8(0x5952), 0xFF},
> +       {CCI_REG8(0x5953), 0x03},
> +       {CCI_REG8(0x961C), 0x00},
> +       {CCI_REG8(0x961D), 0x03},
> +       {CCI_REG8(0x9722), 0x09},
> +       {CCI_REG8(0x9788), 0x01},
> +       {CCI_REG8(0x9796), 0xD0},
> +       {CCI_REG8(0x9797), 0x0A},
> +       {CCI_REG8(0x9798), 0xE0},
> +       {CCI_REG8(0x9799), 0x00},
> +       {CCI_REG8(0x979C), 0xD0},
> +       {CCI_REG8(0x979D), 0x0A},
> +       {CCI_REG8(0x979E), 0xE0},
> +       {CCI_REG8(0x979F), 0x00},
> +       {CCI_REG8(0x97A0), 0xC0},
> +       {CCI_REG8(0x97A1), 0xDF},
> +       {CCI_REG8(0x97A2), 0x80},
> +       {CCI_REG8(0x97A3), 0xAC},
> +       {CCI_REG8(0x97A4), 0x80},
> +       {CCI_REG8(0x97A5), 0x7A},
> +       {CCI_REG8(0x97A6), 0x00},
> +       {CCI_REG8(0x97A7), 0x4B},
> +       {CCI_REG8(0x97A8), 0x00},
> +       {CCI_REG8(0x97A9), 0x50},
> +       {CCI_REG8(0x97AA), 0x20},
> +       {CCI_REG8(0x97AB), 0x35},
> +       {CCI_REG8(0x97C4), 0xC5},
> +       {CCI_REG8(0x97C5), 0x02},
> +       {CCI_REG8(0xB51D), 0x01},
> +       {CCI_REG8(0xB526), 0x00},
> +       {CCI_REG8(0xB527), 0x05},
> +       {CCI_REG8(0xB52A), 0xC0},
> +       {CCI_REG8(0xB52B), 0x03},
> +       {CCI_REG8(0xB644), 0x70},
> +       {CCI_REG8(0xB645), 0x03},
> +       {CCI_REG8(0xB646), 0x00},
> +       {CCI_REG8(0xB647), 0x00},
> +       {CCI_REG8(0xB68A), 0x00},
> +       {CCI_REG8(0xB68B), 0x03},
> +       {CCI_REG8(0xB6CC), 0x00},
> +       {CCI_REG8(0xB6CD), 0x05},
> +       {CCI_REG8(0xB6D0), 0xC0},
> +       {CCI_REG8(0xB6D1), 0x03},
> +       {CCI_REG8(0xB6E8), 0x51},
> +       {CCI_REG8(0xB6E9), 0x05},
> +       {CCI_REG8(0xB6EA), 0x51},
> +       {CCI_REG8(0xB6EB), 0x01},
> +       {CCI_REG8(0xB6EC), 0x40},
> +       {CCI_REG8(0xB6ED), 0x05},
> +       {CCI_REG8(0xB6EE), 0x55},
> +       {CCI_REG8(0xB6EF), 0x55},
> +       {CCI_REG8(0xB6F0), 0x55},
> +       {CCI_REG8(0xB6F1), 0x55},
> +       {CCI_REG8(0xB6F2), 0x55},
> +       {CCI_REG8(0xB6F3), 0x01},
> +       {CCI_REG8(0xB7DC), 0x01},
> +       {CCI_REG8(0xB7DD), 0x01},
> +       {CCI_REG8(0xB7DE), 0x01},
> +       {CCI_REG8(0xEC40), 0x70},
> +       {CCI_REG8(0xEC41), 0x03},
> +       {CCI_REG8(0xEC42), 0x00},
> +       {CCI_REG8(0xEC43), 0x00},
> +       {CCI_REG8(0xEC7E), 0x00},

// This seems to be IMX728_REG_OUT_MODE

> +       {CCI_REG8(0xEC81), 0x01},
> +       {CCI_REG8(0x9714), 0x00},

// This seems to be IMX728_REG_SUBP_0

> +       {CCI_REG8(0xB684), 0x00},

// This seems to be IMX728_REG_SUBP_1


Does anything in the datasheet indicate what each section of these big
tables does? Any additional comments to break the table up with
explainations would be beneficial here - as big raw data dumps are quite
painful to maintain / track for the future.

> +       {CCI_REG8(0x2DCC), 0xED},
> +       {CCI_REG8(0x2DCD), 0x07},
> +       {CCI_REG8(0x2DCE), 0xEC},
> +       {CCI_REG8(0x2DCF), 0x07},
> +       {CCI_REG8(0x2DDE), 0xE7},
> +       {CCI_REG8(0x2DDF), 0x07},
> +       {CCI_REG8(0x2DE0), 0xE6},
> +       {CCI_REG8(0x2DE1), 0x07},
> +       {CCI_REG8(0x2E02), 0xEC},
> +       {CCI_REG8(0x2E03), 0x07},
> +       {CCI_REG8(0x2E04), 0xED},
> +       {CCI_REG8(0x2E05), 0x07},
> +       {CCI_REG8(0x2E06), 0xE6},
> +       {CCI_REG8(0x2E07), 0x07},
> +       {CCI_REG8(0x2E08), 0xE7},
> +       {CCI_REG8(0x2E09), 0x07},
> +       {CCI_REG8(0x2E0E), 0xF0},
> +       {CCI_REG8(0x2E0F), 0x07},
> +       {CCI_REG8(0x2E10), 0xEA},
> +       {CCI_REG8(0x2E11), 0x07},
> +       {CCI_REG8(0x2E12), 0xEB},
> +       {CCI_REG8(0x2E13), 0x07},
> +       {CCI_REG8(0x2D98), 0x8A},
> +       {CCI_REG8(0x2D99), 0x00},
> +       {CCI_REG8(0x0000), 0xEE},
> +       {CCI_REG8(0x0001), 0x08},
> +       {CCI_REG8(0x0002), 0x00},
> +       {CCI_REG8(0xEC9E), 0x04},
> +       {CCI_REG8(0xEC9F), 0x01},
> +       {CCI_REG8(0x2E40), 0x27},
> +       {CCI_REG8(0x2E60), 0x57},
> +       {CCI_REG8(0x2E61), 0x00},
> +       {CCI_REG8(0x2E64), 0x17},
> +       {CCI_REG8(0x2E65), 0x00},
> +       {CCI_REG8(0x2E66), 0x1F},
> +       {CCI_REG8(0x2E67), 0x00},
> +       {CCI_REG8(0x2E68), 0x6F},
> +       {CCI_REG8(0x2E69), 0x00},
> +       {CCI_REG8(0x2E6A), 0x27},
> +       {CCI_REG8(0x2E6B), 0x00},
> +       {CCI_REG8(0x2E6C), 0x1F},
> +       {CCI_REG8(0x2E6D), 0x00},
> +       {CCI_REG8(0x2E6E), 0x37},
> +       {CCI_REG8(0x2E6F), 0x00},
> +       {CCI_REG8(0x2E70), 0x1F},
> +       {CCI_REG8(0x2E71), 0x00},
> +       {CCI_REG8(0x2E72), 0x17},
> +       {CCI_REG8(0x2E73), 0x00},
> +       {CCI_REG8(0x2E7A), 0x02},
> +       {CCI_REG8(0xEC08), 0x10},
> +       {CCI_REG8(0xEC09), 0x2B},
> +       {CCI_REG8(0xEC54), 0xB8},
> +       {CCI_REG8(0xEC55), 0xBB},
> +       {CCI_REG8(0xEC56), 0xFF},
> +       {CCI_REG8(0xEC57), 0xFF},
> +       {CCI_REG8(0x2E28), 0xD0},
> +       {CCI_REG8(0x2E29), 0x07},
> +       {CCI_REG8(0x2E2A), 0x00},
> +       {CCI_REG8(0x2E2C), 0xD0},
> +       {CCI_REG8(0x2E2D), 0x07},
> +       {CCI_REG8(0x2E2E), 0x00},
> +       {CCI_REG8(0x2DC0), 0xD5},
> +       {CCI_REG8(0x2DC1), 0x02},
> +       {CCI_REG8(0xB52C), 0x01},
> +       {CCI_REG8(0xB52E), 0x08},
> +       {CCI_REG8(0xB52F), 0x00},
> +       {CCI_REG8(0xB530), 0x00},
> +       {CCI_REG8(0xB531), 0x0F},
> +       {CCI_REG8(0xB532), 0x08},
> +       {CCI_REG8(0xB533), 0x00},
> +       {CCI_REG8(0xB534), 0x70},
> +       {CCI_REG8(0xB535), 0x08},
> +       {CCI_REG8(0xB6B9), 0x01},
> +       {CCI_REG8(0xB6BA), 0x08},
> +       {CCI_REG8(0xB6BB), 0x00},
> +       {CCI_REG8(0xB6BC), 0x00},
> +       {CCI_REG8(0xB6BD), 0x0F},
> +       {CCI_REG8(0xB6BE), 0x08},
> +       {CCI_REG8(0xB6BF), 0x00},
> +       {CCI_REG8(0xB6C0), 0x70},
> +       {CCI_REG8(0xB6C1), 0x08},
> +};
> +
> +static const struct cci_reg_sequence imx728_3840x2160_end[] =3D {
> +       {CCI_REG8(0x98B5), 0x00},
> +       {CCI_REG8(0x98B6), 0xD8},
> +       {CCI_REG8(0x98B7), 0xD8},
> +       {CCI_REG8(0x98B8), 0xEC},
> +       {CCI_REG8(0x98CA), 0x0F},
> +       {CCI_REG8(0x98CB), 0x55},
> +       {CCI_REG8(0x98CC), 0x0B},
> +       {CCI_REG8(0x98D2), 0xD8},
> +       {CCI_REG8(0x98D3), 0x27},
> +       {CCI_REG8(0x98EC), 0x38},
IMX728_REG_EXPOSURE_02

> +       {CCI_REG8(0x98ED), 0x00},
> +       {CCI_REG8(0x98EE), 0x00},
> +       {CCI_REG8(0x98EF), 0x00},
> +       {CCI_REG8(0x98F0), 0x03},

IMX728_REG_UNIT_02

> +       {CCI_REG8(0x98F8), 0xB4},

// IMX728_REG_AGAIN_00 seems to be here

> +       {CCI_REG8(0x98F9), 0x00},
> +       {CCI_REG8(0x98FA), 0x00},
> +       {CCI_REG8(0x98FC), 0x4B},

IMX728_REG_AGAIN_01

> +       {CCI_REG8(0x98FD), 0x00},
> +       {CCI_REG8(0x98FE), 0x00},
> +       {CCI_REG8(0x9900), 0x15},

IMX728_REG_AGAIN_02

And more AGAIN registers here. If these duplicate registers that are set
(more efficiently?) by the control set up phase - maybe it's a potential
optimisation to remove the duplicate writes.


> +       {CCI_REG8(0x9901), 0x00},
> +       {CCI_REG8(0x9902), 0x00},
> +       {CCI_REG8(0x9904), 0x21},

// IMX728_REG_AGAIN_03

> +       {CCI_REG8(0x9905), 0x00},
> +       {CCI_REG8(0x9906), 0x00},
> +       {CCI_REG8(0x9908), 0x54},

// IMX728_REG_AGAIN_04

> +       {CCI_REG8(0x9909), 0x00},
> +       {CCI_REG8(0x990A), 0x00},
> +       {CCI_REG8(0x9921), 0x04},
> +       {CCI_REG8(0x9923), 0x02},
> +       {CCI_REG8(0x9925), 0x28},
> +       {CCI_REG8(0x9926), 0x14},
> +       {CCI_REG8(0x9938), 0x4B},
> +       {CCI_REG8(0x993E), 0x15},
> +       {CCI_REG8(0x9960), 0x01},
> +       {CCI_REG8(0x9961), 0x03},
> +       {CCI_REG8(0x9963), 0x02},
> +       {CCI_REG8(0x9968), 0x40},
> +       {CCI_REG8(0x9969), 0x1F},
> +       {CCI_REG8(0x996A), 0x00},
> +       {CCI_REG8(0x996B), 0x00},
> +       {CCI_REG8(0x996C), 0xF8},
> +       {CCI_REG8(0x996D), 0x2A},
> +       {CCI_REG8(0x996E), 0x00},
> +       {CCI_REG8(0x996F), 0x00},
> +       {CCI_REG8(0x9970), 0x01},
> +       {CCI_REG8(0x9971), 0x00},
> +       {CCI_REG8(0x9972), 0x00},
> +       {CCI_REG8(0x9973), 0x00},
> +       {CCI_REG8(0x9975), 0x03},
> +       {CCI_REG8(0x9976), 0x04},
> +       {CCI_REG8(0x9982), 0xB4},
> +       {CCI_REG8(0x9983), 0x00},
> +       {CCI_REG8(0x999C), 0x78},
> +       {CCI_REG8(0x999D), 0x28},
> +       {CCI_REG8(0x99D8), 0x02},
> +       {CCI_REG8(0x99DE), 0x19},
> +       {CCI_REG8(0x99DF), 0x19},
> +       {CCI_REG8(0x99E0), 0x19},
> +       {CCI_REG8(0x99E1), 0x19},
> +       {CCI_REG8(0x99E2), 0x19},
> +       {CCI_REG8(0x99E3), 0x19},
> +       {CCI_REG8(0x99E4), 0x19},
> +       {CCI_REG8(0x99E5), 0x19},
> +       {CCI_REG8(0x99E6), 0x19},
> +       {CCI_REG8(0x99E7), 0x19},
> +       {CCI_REG8(0x99E8), 0x19},
> +       {CCI_REG8(0x99E9), 0x19},
> +       {CCI_REG8(0x99EA), 0x19},
> +       {CCI_REG8(0x99EB), 0x19},
> +       {CCI_REG8(0x99EC), 0x19},
> +       {CCI_REG8(0x99ED), 0x19},
> +       {CCI_REG8(0x99EE), 0x19},
> +       {CCI_REG8(0x99EF), 0x19},
> +       {CCI_REG8(0x99F0), 0x32},
> +       {CCI_REG8(0x99F1), 0x32},
> +       {CCI_REG8(0x99F2), 0x32},
> +       {CCI_REG8(0x99F3), 0x32},
> +       {CCI_REG8(0x99F4), 0x32},
> +       {CCI_REG8(0x99F5), 0x32},
> +       {CCI_REG8(0x99F6), 0x32},
> +       {CCI_REG8(0x99F7), 0x32},
> +       {CCI_REG8(0x99F8), 0x32},
> +       {CCI_REG8(0x99F9), 0x64},
> +       {CCI_REG8(0x99FA), 0x64},
> +       {CCI_REG8(0x99FB), 0x64},
> +       {CCI_REG8(0x99FC), 0x64},
> +       {CCI_REG8(0x99FD), 0x64},
> +       {CCI_REG8(0x99FE), 0x64},
> +       {CCI_REG8(0x99FF), 0x64},
> +       {CCI_REG8(0x9A00), 0x64},
> +       {CCI_REG8(0x9A01), 0x64},
> +       {CCI_REG8(0x9A02), 0x64},
> +       {CCI_REG8(0x9A03), 0x64},
> +       {CCI_REG8(0x9A04), 0x64},
> +       {CCI_REG8(0x9A05), 0x64},
> +       {CCI_REG8(0x9A07), 0x64},
> +       {CCI_REG8(0x9A08), 0x64},
> +       {CCI_REG8(0x9A09), 0x64},
> +       {CCI_REG8(0x9A0A), 0x64},
> +       {CCI_REG8(0x9A0B), 0x64},
> +       {CCI_REG8(0x9A0C), 0x64},
> +       {CCI_REG8(0x9A0D), 0x64},
> +       {CCI_REG8(0x9A0E), 0x64},
> +       {CCI_REG8(0x9A0F), 0x64},
> +       {CCI_REG8(0x9A10), 0x64},
> +       {CCI_REG8(0x9A11), 0x64},
> +       {CCI_REG8(0x9A12), 0x64},
> +       {CCI_REG8(0x9A13), 0x64},
> +       {CCI_REG8(0x9A14), 0x64},
> +       {CCI_REG8(0x9A15), 0x64},
> +       {CCI_REG8(0x9A16), 0x64},
> +       {CCI_REG8(0x9A17), 0x64},
> +       {CCI_REG8(0x9A18), 0x64},
> +       {CCI_REG8(0x9A19), 0x64},
> +       {CCI_REG8(0x9A1A), 0x64},
> +       {CCI_REG8(0x9A1B), 0x64},
> +       {CCI_REG8(0x9A1C), 0x64},
> +       {CCI_REG8(0x9A3A), 0x20},
> +       {CCI_REG8(0x9A3B), 0x00},
> +       {CCI_REG8(0x9A3C), 0x20},
> +       {CCI_REG8(0x9A3D), 0x00},
> +       {CCI_REG8(0x9A3E), 0x20},
> +       {CCI_REG8(0x9A3F), 0x00},
> +       {CCI_REG8(0x9A40), 0x20},
> +       {CCI_REG8(0x9A41), 0x00},
> +       {CCI_REG8(0x9A42), 0x20},
> +       {CCI_REG8(0x9A43), 0x00},
> +       {CCI_REG8(0x9A44), 0x20},
> +       {CCI_REG8(0x9A45), 0x00},
> +       {CCI_REG8(0x9A46), 0x20},
> +       {CCI_REG8(0x9A47), 0x00},
> +       {CCI_REG8(0x9A48), 0x20},
> +       {CCI_REG8(0x9A49), 0x00},
> +       {CCI_REG8(0x9A4A), 0x20},
> +       {CCI_REG8(0x9A4B), 0x00},
> +       {CCI_REG8(0x9A4C), 0x20},
> +       {CCI_REG8(0x9A4D), 0x00},
> +       {CCI_REG8(0x9A4E), 0x20},
> +       {CCI_REG8(0x9A4F), 0x00},
> +       {CCI_REG8(0x9A50), 0x20},
> +       {CCI_REG8(0x9A51), 0x00},
> +       {CCI_REG8(0x9A52), 0x20},
> +       {CCI_REG8(0x9A53), 0x00},
> +       {CCI_REG8(0x9A54), 0x20},
> +       {CCI_REG8(0x9A55), 0x00},
> +       {CCI_REG8(0x9A56), 0x20},
> +       {CCI_REG8(0x9A57), 0x00},
> +       {CCI_REG8(0x9A58), 0x20},
> +       {CCI_REG8(0x9A59), 0x00},
> +       {CCI_REG8(0x9A64), 0xFF},
> +       {CCI_REG8(0x9A65), 0xFF},
> +       {CCI_REG8(0x9A66), 0xFF},
> +       {CCI_REG8(0x9A67), 0xFF},
> +       {CCI_REG8(0x9BDE), 0xFF},
> +       {CCI_REG8(0x9BDF), 0x0F},
> +       {CCI_REG8(0x9BE4), 0x04},
> +       {CCI_REG8(0x9BE5), 0x00},
> +       {CCI_REG8(0x9BE6), 0x00},
> +       {CCI_REG8(0x9BE7), 0x00},
> +       {CCI_REG8(0x9BEA), 0x54},
> +       {CCI_REG8(0x9BEB), 0x00},
> +       {CCI_REG8(0x9BEC), 0x54},
> +       {CCI_REG8(0x9BED), 0x00},
> +       {CCI_REG8(0x9BFA), 0x01},
> +       {CCI_REG8(0x9C58), 0x21},
> +       {CCI_REG8(0x9C5A), 0xC0},
> +       {CCI_REG8(0x9C5B), 0x5D},
> +       {CCI_REG8(0x9C5C), 0x80},
> +       {CCI_REG8(0x9C5D), 0x57},
> +       {CCI_REG8(0x9C60), 0x00},

IMX728_REG_HDR_00

> +       {CCI_REG8(0x9C61), 0x30},
> +       {CCI_REG8(0x9C62), 0x00},
> +       {CCI_REG8(0x9C63), 0x00},
> +       {CCI_REG8(0x9C64), 0x00},

IMX728_REG_HDR_02

> +       {CCI_REG8(0x9C65), 0x50},
> +       {CCI_REG8(0x9C66), 0x00},
> +       {CCI_REG8(0x9C67), 0x00},
> +       {CCI_REG8(0x9C6A), 0x00},

IMX728_REG_HDR_06

> +       {CCI_REG8(0x9C6B), 0xE0},
> +       {CCI_REG8(0x9C6C), 0x00},

IMX728_REG_HDR_01

> +       {CCI_REG8(0x9C6D), 0x30},
> +       {CCI_REG8(0x9C6E), 0x00},
> +       {CCI_REG8(0x9C6F), 0x00},
> +       {CCI_REG8(0x9C70), 0x00},
> +       {CCI_REG8(0x9C71), 0x50},
> +       {CCI_REG8(0x9C72), 0x00},
> +       {CCI_REG8(0x9C73), 0x00},
> +       {CCI_REG8(0x9C76), 0x00},

IMX728_REG_HDR_07

> +       {CCI_REG8(0x9C77), 0xE0},
> +       {CCI_REG8(0x9D00), 0x00},
> +       {CCI_REG8(0x9D01), 0x10},
> +       {CCI_REG8(0x9D02), 0x00},
> +       {CCI_REG8(0x9D04), 0x00},
> +       {CCI_REG8(0x9D05), 0x10},
> +       {CCI_REG8(0x9D06), 0x00},
> +       {CCI_REG8(0x9D08), 0x00},
> +       {CCI_REG8(0x9D09), 0x10},
> +       {CCI_REG8(0x9D0A), 0x00},
> +       {CCI_REG8(0x9D0C), 0x00},
> +       {CCI_REG8(0x9D0D), 0x10},
> +       {CCI_REG8(0x9D0E), 0x00},
> +       {CCI_REG8(0x9D10), 0x00},
> +       {CCI_REG8(0x9D11), 0x10},
> +       {CCI_REG8(0x9D12), 0x00},
> +       {CCI_REG8(0x9D14), 0x00},
> +       {CCI_REG8(0x9D15), 0x10},
> +       {CCI_REG8(0x9D16), 0x00},
> +       {CCI_REG8(0x9D18), 0x00},
> +       {CCI_REG8(0x9D19), 0x10},
> +       {CCI_REG8(0x9D1A), 0x00},
> +       {CCI_REG8(0x9D1C), 0x00},
> +       {CCI_REG8(0x9D1D), 0x10},
> +       {CCI_REG8(0x9D1E), 0x00},
> +       {CCI_REG8(0x9D20), 0x00},
> +       {CCI_REG8(0x9D21), 0x10},
> +       {CCI_REG8(0x9D22), 0x00},
> +       {CCI_REG8(0x9D23), 0x00},
> +       {CCI_REG8(0x9D24), 0x00},
> +       {CCI_REG8(0x9D25), 0x10},
> +       {CCI_REG8(0x9D26), 0x00},
> +       {CCI_REG8(0x9D27), 0x00},
> +       {CCI_REG8(0x9D28), 0x00},
> +       {CCI_REG8(0x9D29), 0x10},
> +       {CCI_REG8(0x9D2A), 0x00},
> +       {CCI_REG8(0x9D2B), 0x00},
> +       {CCI_REG8(0x9D2C), 0x00},
> +       {CCI_REG8(0x9D2D), 0x10},
> +       {CCI_REG8(0x9D2E), 0x00},
> +       {CCI_REG8(0x9D2F), 0x00},
> +       {CCI_REG8(0x9D30), 0x01},
> +       {CCI_REG8(0x9D31), 0x00},
> +       {CCI_REG8(0x9D32), 0x00},
> +       {CCI_REG8(0x9D33), 0x00},
> +       {CCI_REG8(0x9D34), 0x00},
> +       {CCI_REG8(0x9D35), 0x00},
> +       {CCI_REG8(0x9D38), 0x01},
> +       {CCI_REG8(0x9D39), 0x00},
> +       {CCI_REG8(0x9D3A), 0x00},
> +       {CCI_REG8(0x9D3B), 0x00},
> +       {CCI_REG8(0x9D3C), 0x00},
> +       {CCI_REG8(0x9D3D), 0x00},
> +       {CCI_REG8(0x9D40), 0x01},
> +       {CCI_REG8(0x9D41), 0x00},
> +       {CCI_REG8(0x9D42), 0x00},
> +       {CCI_REG8(0x9D43), 0x00},
> +       {CCI_REG8(0x9D44), 0x00},
> +       {CCI_REG8(0x9D45), 0x00},
> +       {CCI_REG8(0x9D48), 0x01},
> +       {CCI_REG8(0x9D49), 0x00},
> +       {CCI_REG8(0x9D4A), 0x00},
> +       {CCI_REG8(0x9D4B), 0x00},
> +       {CCI_REG8(0x9D4C), 0x00},
> +       {CCI_REG8(0x9D4D), 0x00},
> +       {CCI_REG8(0xA2E4), 0x23},
> +       {CCI_REG8(0xA2E7), 0x01},
> +       {CCI_REG8(0xA3CC), 0xAA},
> +       {CCI_REG8(0xA3CD), 0x0F},
> +       {CCI_REG8(0xA3CE), 0x81},
> +       {CCI_REG8(0xA3CF), 0x0D},
> +       {CCI_REG8(0xA3D0), 0xFC},
> +       {CCI_REG8(0xA3D1), 0x00},
> +       {CCI_REG8(0xA3D2), 0xC5},
> +       {CCI_REG8(0xA3D3), 0x02},
> +       {CCI_REG8(0xA3B0), 0xE6},
> +       {CCI_REG8(0xA3B1), 0x00},
> +       {CCI_REG8(0xA3B2), 0xE6},
> +       {CCI_REG8(0xA3B3), 0x00},
> +       {CCI_REG8(0x9E7C), 0x87},
> +       {CCI_REG8(0x9E88), 0x6E},
> +       {CCI_REG8(0x9E89), 0x87},
> +       {CCI_REG8(0x9E8A), 0x9B},
> +       {CCI_REG8(0x9E8B), 0xAF},
> +       {CCI_REG8(0x9E8C), 0x6E},
> +       {CCI_REG8(0x9E8D), 0x87},
> +       {CCI_REG8(0x9E8E), 0x9B},
> +       {CCI_REG8(0x9E8F), 0xAF},
> +       {CCI_REG8(0x9E90), 0x28},
> +       {CCI_REG8(0x9E91), 0x00},
> +       {CCI_REG8(0x9E92), 0x50},
> +       {CCI_REG8(0x9E93), 0x00},
> +       {CCI_REG8(0x9E94), 0xB2},
> +       {CCI_REG8(0x9E95), 0x0C},
> +       {CCI_REG8(0x9E96), 0xA6},
> +       {CCI_REG8(0x9E97), 0x0E},
> +       {CCI_REG8(0x9E98), 0x28},
> +       {CCI_REG8(0x9E99), 0x00},
> +       {CCI_REG8(0x9E9A), 0x50},
> +       {CCI_REG8(0x9E9B), 0x00},
> +       {CCI_REG8(0x9E9C), 0xB2},
> +       {CCI_REG8(0x9E9D), 0x0C},
> +       {CCI_REG8(0x9E9E), 0xA6},
> +       {CCI_REG8(0x9E9F), 0x0E},
> +       {CCI_REG8(0x9EA0), 0x28},
> +       {CCI_REG8(0x9EA1), 0x00},
> +       {CCI_REG8(0x9EA2), 0x50},
> +       {CCI_REG8(0x9EA3), 0x00},
> +       {CCI_REG8(0x9EA4), 0xB2},
> +       {CCI_REG8(0x9EA5), 0x0C},
> +       {CCI_REG8(0x9EA6), 0xA6},
> +       {CCI_REG8(0x9EA7), 0x0E},
> +       {CCI_REG8(0x9EA8), 0x28},
> +       {CCI_REG8(0x9EA9), 0x00},
> +       {CCI_REG8(0x9EAA), 0x50},
> +       {CCI_REG8(0x9EAB), 0x00},
> +       {CCI_REG8(0x9EAC), 0xB2},
> +       {CCI_REG8(0x9EAD), 0x0C},
> +       {CCI_REG8(0x9EAE), 0xA6},
> +       {CCI_REG8(0x9EAF), 0x0E},
> +       {CCI_REG8(0x9EB0), 0x28},
> +       {CCI_REG8(0x9EB1), 0x00},
> +       {CCI_REG8(0x9EB2), 0x50},
> +       {CCI_REG8(0x9EB3), 0x00},
> +       {CCI_REG8(0x9EB4), 0xB2},
> +       {CCI_REG8(0x9EB5), 0x0C},
> +       {CCI_REG8(0x9EB6), 0xA6},
> +       {CCI_REG8(0x9EB7), 0x0E},
> +       {CCI_REG8(0x9EB8), 0x28},
> +       {CCI_REG8(0x9EB9), 0x00},
> +       {CCI_REG8(0x9EBA), 0x50},
> +       {CCI_REG8(0x9EBB), 0x00},
> +       {CCI_REG8(0x9EBC), 0xB2},
> +       {CCI_REG8(0x9EBD), 0x0C},
> +       {CCI_REG8(0x9EBE), 0xA6},
> +       {CCI_REG8(0x9EBF), 0x0E},
> +       {CCI_REG8(0x9EC0), 0x28},
> +       {CCI_REG8(0x9EC1), 0x00},
> +       {CCI_REG8(0x9EC2), 0x50},
> +       {CCI_REG8(0x9EC3), 0x00},
> +       {CCI_REG8(0x9EC4), 0xB2},
> +       {CCI_REG8(0x9EC5), 0x0C},
> +       {CCI_REG8(0x9EC6), 0xA6},
> +       {CCI_REG8(0x9EC7), 0x0E},
> +       {CCI_REG8(0x9ED2), 0x01},
> +       {CCI_REG8(0x9ED3), 0x01},
> +       {CCI_REG8(0x9ED4), 0x01},
> +       {CCI_REG8(0x9ED5), 0x01},
> +       {CCI_REG8(0x9ED6), 0x01},
> +       {CCI_REG8(0x9ED7), 0x01},
> +       {CCI_REG8(0x9ED8), 0x01},
> +       {CCI_REG8(0x9EDA), 0xB2},
> +       {CCI_REG8(0x9EDB), 0x0C},
> +       {CCI_REG8(0x9EDC), 0xB2},
> +       {CCI_REG8(0x9EDD), 0x0C},
> +       {CCI_REG8(0x9EDE), 0xB2},
> +       {CCI_REG8(0x9EDF), 0x0C},
> +       {CCI_REG8(0x9EE0), 0xB2},
> +       {CCI_REG8(0x9EE1), 0x0C},
> +       {CCI_REG8(0x9EE2), 0xA6},
> +       {CCI_REG8(0x9EE3), 0x0E},
> +       {CCI_REG8(0x9EE4), 0xA6},
> +       {CCI_REG8(0x9EE5), 0x0E},
> +       {CCI_REG8(0x9EE6), 0xA6},
> +       {CCI_REG8(0x9EE7), 0x0E},
> +       {CCI_REG8(0x9EE8), 0xA6},
> +       {CCI_REG8(0x9EE9), 0x0E},
> +       {CCI_REG8(0x9EEA), 0xB2},
> +       {CCI_REG8(0x9EEB), 0x0C},
> +       {CCI_REG8(0x9EEC), 0xB2},
> +       {CCI_REG8(0x9EED), 0x0C},
> +       {CCI_REG8(0x9EEE), 0xB2},
> +       {CCI_REG8(0x9EEF), 0x0C},
> +       {CCI_REG8(0x9EF0), 0xB2},
> +       {CCI_REG8(0x9EF1), 0x0C},
> +       {CCI_REG8(0x9EF2), 0xA6},
> +       {CCI_REG8(0x9EF3), 0x0E},
> +       {CCI_REG8(0x9EF4), 0xA6},
> +       {CCI_REG8(0x9EF5), 0x0E},
> +       {CCI_REG8(0x9EF6), 0xA6},
> +       {CCI_REG8(0x9EF7), 0x0E},
> +       {CCI_REG8(0x9EF8), 0xA6},
> +       {CCI_REG8(0x9EF9), 0x0E},
> +       {CCI_REG8(0x9EFA), 0xB2},
> +       {CCI_REG8(0x9EFB), 0x0C},
> +       {CCI_REG8(0x9EFC), 0xB2},
> +       {CCI_REG8(0x9EFD), 0x0C},
> +       {CCI_REG8(0x9EFE), 0xB2},
> +       {CCI_REG8(0x9EFF), 0x0C},
> +       {CCI_REG8(0x9F00), 0xB2},
> +       {CCI_REG8(0x9F01), 0x0C},
> +       {CCI_REG8(0x9F02), 0xA6},
> +       {CCI_REG8(0x9F03), 0x0E},
> +       {CCI_REG8(0x9F04), 0xA6},
> +       {CCI_REG8(0x9F05), 0x0E},
> +       {CCI_REG8(0x9F06), 0xA6},
> +       {CCI_REG8(0x9F07), 0x0E},
> +       {CCI_REG8(0x9F08), 0xA6},
> +       {CCI_REG8(0x9F09), 0x0E},
> +       {CCI_REG8(0x9F0A), 0xB2},
> +       {CCI_REG8(0x9F0B), 0x0C},
> +       {CCI_REG8(0x9F0C), 0xB2},
> +       {CCI_REG8(0x9F0D), 0x0C},
> +       {CCI_REG8(0x9F0E), 0xB2},
> +       {CCI_REG8(0x9F0F), 0x0C},
> +       {CCI_REG8(0x9F10), 0xB2},
> +       {CCI_REG8(0x9F11), 0x0C},
> +       {CCI_REG8(0x9F12), 0xA6},
> +       {CCI_REG8(0x9F13), 0x0E},
> +       {CCI_REG8(0x9F14), 0xA6},
> +       {CCI_REG8(0x9F15), 0x0E},
> +       {CCI_REG8(0x9F16), 0xA6},
> +       {CCI_REG8(0x9F17), 0x0E},
> +       {CCI_REG8(0x9F18), 0xA6},
> +       {CCI_REG8(0x9F19), 0x0E},
> +       {CCI_REG8(0x9F1A), 0xB2},
> +       {CCI_REG8(0x9F1B), 0x0C},
> +       {CCI_REG8(0x9F1C), 0xB2},
> +       {CCI_REG8(0x9F1D), 0x0C},
> +       {CCI_REG8(0x9F1E), 0xB2},
> +       {CCI_REG8(0x9F1F), 0x0C},
> +       {CCI_REG8(0x9F20), 0xB2},
> +       {CCI_REG8(0x9F21), 0x0C},
> +       {CCI_REG8(0x9F22), 0xA6},
> +       {CCI_REG8(0x9F23), 0x0E},
> +       {CCI_REG8(0x9F24), 0xA6},
> +       {CCI_REG8(0x9F25), 0x0E},
> +       {CCI_REG8(0x9F26), 0xA6},
> +       {CCI_REG8(0x9F27), 0x0E},
> +       {CCI_REG8(0x9F28), 0xA6},
> +       {CCI_REG8(0x9F29), 0x0E},
> +       {CCI_REG8(0x9F2A), 0xB2},
> +       {CCI_REG8(0x9F2B), 0x0C},
> +       {CCI_REG8(0x9F2C), 0xB2},
> +       {CCI_REG8(0x9F2D), 0x0C},
> +       {CCI_REG8(0x9F2E), 0xB2},
> +       {CCI_REG8(0x9F2F), 0x0C},
> +       {CCI_REG8(0x9F30), 0xB2},
> +       {CCI_REG8(0x9F31), 0x0C},
> +       {CCI_REG8(0x9F32), 0xA6},
> +       {CCI_REG8(0x9F33), 0x0E},
> +       {CCI_REG8(0x9F34), 0xA6},
> +       {CCI_REG8(0x9F35), 0x0E},
> +       {CCI_REG8(0x9F36), 0xA6},
> +       {CCI_REG8(0x9F37), 0x0E},
> +       {CCI_REG8(0x9F38), 0xA6},
> +       {CCI_REG8(0x9F39), 0x0E},
> +       {CCI_REG8(0x9F3A), 0xB2},
> +       {CCI_REG8(0x9F3B), 0x0C},
> +       {CCI_REG8(0x9F3C), 0xB2},
> +       {CCI_REG8(0x9F3D), 0x0C},
> +       {CCI_REG8(0x9F3E), 0xB2},
> +       {CCI_REG8(0x9F3F), 0x0C},
> +       {CCI_REG8(0x9F40), 0xB2},
> +       {CCI_REG8(0x9F41), 0x0C},
> +       {CCI_REG8(0x9F42), 0xA6},
> +       {CCI_REG8(0x9F43), 0x0E},
> +       {CCI_REG8(0x9F44), 0xA6},
> +       {CCI_REG8(0x9F45), 0x0E},
> +       {CCI_REG8(0x9F46), 0xA6},
> +       {CCI_REG8(0x9F47), 0x0E},
> +       {CCI_REG8(0x9F48), 0xA6},
> +       {CCI_REG8(0x9F49), 0x0E},
> +       {CCI_REG8(0x9F4A), 0xB2},
> +       {CCI_REG8(0x9F4B), 0x0C},
> +       {CCI_REG8(0x9F4C), 0xB2},
> +       {CCI_REG8(0x9F4D), 0x0C},
> +       {CCI_REG8(0x9F4E), 0xB2},
> +       {CCI_REG8(0x9F4F), 0x0C},
> +       {CCI_REG8(0x9F50), 0xB2},
> +       {CCI_REG8(0x9F51), 0x0C},
> +       {CCI_REG8(0x9F52), 0xA6},
> +       {CCI_REG8(0x9F53), 0x0E},
> +       {CCI_REG8(0x9F54), 0xA6},
> +       {CCI_REG8(0x9F55), 0x0E},
> +       {CCI_REG8(0x9F56), 0xA6},
> +       {CCI_REG8(0x9F57), 0x0E},
> +       {CCI_REG8(0x9F58), 0xA6},
> +       {CCI_REG8(0x9F59), 0x0E},
> +       {CCI_REG8(0x9F5A), 0xD0},
> +       {CCI_REG8(0x9F5B), 0x07},
> +       {CCI_REG8(0x9F5C), 0xD0},
> +       {CCI_REG8(0x9F5D), 0x07},
> +       {CCI_REG8(0x9F5E), 0xD0},
> +       {CCI_REG8(0x9F5F), 0x07},
> +       {CCI_REG8(0x9F60), 0xD0},
> +       {CCI_REG8(0x9F61), 0x07},
> +       {CCI_REG8(0x9F62), 0xC4},
> +       {CCI_REG8(0x9F63), 0x09},
> +       {CCI_REG8(0x9F64), 0xC4},
> +       {CCI_REG8(0x9F65), 0x09},
> +       {CCI_REG8(0x9F66), 0xC4},
> +       {CCI_REG8(0x9F67), 0x09},
> +       {CCI_REG8(0x9F68), 0xC4},
> +       {CCI_REG8(0x9F69), 0x09},
> +       {CCI_REG8(0x9F6A), 0xD0},
> +       {CCI_REG8(0x9F6B), 0x07},
> +       {CCI_REG8(0x9F6C), 0xD0},
> +       {CCI_REG8(0x9F6D), 0x07},
> +       {CCI_REG8(0x9F6E), 0xD0},
> +       {CCI_REG8(0x9F6F), 0x07},
> +       {CCI_REG8(0x9F70), 0xD0},
> +       {CCI_REG8(0x9F71), 0x07},
> +       {CCI_REG8(0x9F72), 0xC4},
> +       {CCI_REG8(0x9F73), 0x09},
> +       {CCI_REG8(0x9F74), 0xC4},
> +       {CCI_REG8(0x9F75), 0x09},
> +       {CCI_REG8(0x9F76), 0xC4},
> +       {CCI_REG8(0x9F77), 0x09},
> +       {CCI_REG8(0x9F78), 0xC4},
> +       {CCI_REG8(0x9F79), 0x09},
> +       {CCI_REG8(0x9F7A), 0xD0},
> +       {CCI_REG8(0x9F7B), 0x07},
> +       {CCI_REG8(0x9F7C), 0xD0},
> +       {CCI_REG8(0x9F7D), 0x07},
> +       {CCI_REG8(0x9F7E), 0xD0},
> +       {CCI_REG8(0x9F7F), 0x07},
> +       {CCI_REG8(0x9F80), 0xD0},
> +       {CCI_REG8(0x9F81), 0x07},
> +       {CCI_REG8(0x9F82), 0xC4},
> +       {CCI_REG8(0x9F83), 0x09},
> +       {CCI_REG8(0x9F84), 0xC4},
> +       {CCI_REG8(0x9F85), 0x09},
> +       {CCI_REG8(0x9F86), 0xC4},
> +       {CCI_REG8(0x9F87), 0x09},
> +       {CCI_REG8(0x9F88), 0xC4},
> +       {CCI_REG8(0x9F89), 0x09},
> +       {CCI_REG8(0x9F8A), 0xD0},
> +       {CCI_REG8(0x9F8B), 0x07},
> +       {CCI_REG8(0x9F8C), 0xD0},
> +       {CCI_REG8(0x9F8D), 0x07},
> +       {CCI_REG8(0x9F8E), 0xD0},
> +       {CCI_REG8(0x9F8F), 0x07},
> +       {CCI_REG8(0x9F90), 0xD0},
> +       {CCI_REG8(0x9F91), 0x07},
> +       {CCI_REG8(0x9F92), 0xC4},
> +       {CCI_REG8(0x9F93), 0x09},
> +       {CCI_REG8(0x9F94), 0xC4},
> +       {CCI_REG8(0x9F95), 0x09},
> +       {CCI_REG8(0x9F96), 0xC4},
> +       {CCI_REG8(0x9F97), 0x09},
> +       {CCI_REG8(0x9F98), 0xC4},
> +       {CCI_REG8(0x9F99), 0x09},
> +       {CCI_REG8(0x9F9A), 0xD0},
> +       {CCI_REG8(0x9F9B), 0x07},
> +       {CCI_REG8(0x9F9C), 0xD0},
> +       {CCI_REG8(0x9F9D), 0x07},
> +       {CCI_REG8(0x9F9E), 0xD0},
> +       {CCI_REG8(0x9F9F), 0x07},
> +       {CCI_REG8(0x9FA0), 0xD0},
> +       {CCI_REG8(0x9FA1), 0x07},
> +       {CCI_REG8(0x9FA2), 0xC4},
> +       {CCI_REG8(0x9FA3), 0x09},
> +       {CCI_REG8(0x9FA4), 0xC4},
> +       {CCI_REG8(0x9FA5), 0x09},
> +       {CCI_REG8(0x9FA6), 0xC4},
> +       {CCI_REG8(0x9FA7), 0x09},
> +       {CCI_REG8(0x9FA8), 0xC4},
> +       {CCI_REG8(0x9FA9), 0x09},
> +       {CCI_REG8(0x9FAA), 0xD0},
> +       {CCI_REG8(0x9FAB), 0x07},
> +       {CCI_REG8(0x9FAC), 0xD0},
> +       {CCI_REG8(0x9FAD), 0x07},
> +       {CCI_REG8(0x9FAE), 0xD0},
> +       {CCI_REG8(0x9FAF), 0x07},
> +       {CCI_REG8(0x9FB0), 0xD0},
> +       {CCI_REG8(0x9FB1), 0x07},
> +       {CCI_REG8(0x9FB2), 0xC4},
> +       {CCI_REG8(0x9FB3), 0x09},
> +       {CCI_REG8(0x9FB4), 0xC4},
> +       {CCI_REG8(0x9FB5), 0x09},
> +       {CCI_REG8(0x9FB6), 0xC4},
> +       {CCI_REG8(0x9FB7), 0x09},
> +       {CCI_REG8(0x9FB8), 0xC4},
> +       {CCI_REG8(0x9FB9), 0x09},
> +       {CCI_REG8(0x9FBA), 0xD0},
> +       {CCI_REG8(0x9FBB), 0x07},
> +       {CCI_REG8(0x9FBC), 0xD0},
> +       {CCI_REG8(0x9FBD), 0x07},
> +       {CCI_REG8(0x9FBE), 0xD0},
> +       {CCI_REG8(0x9FBF), 0x07},
> +       {CCI_REG8(0x9FC0), 0xD0},
> +       {CCI_REG8(0x9FC1), 0x07},
> +       {CCI_REG8(0x9FC2), 0xC4},
> +       {CCI_REG8(0x9FC3), 0x09},
> +       {CCI_REG8(0x9FC4), 0xC4},
> +       {CCI_REG8(0x9FC5), 0x09},
> +       {CCI_REG8(0x9FC6), 0xC4},
> +       {CCI_REG8(0x9FC7), 0x09},
> +       {CCI_REG8(0x9FC8), 0xC4},
> +       {CCI_REG8(0x9FC9), 0x09},
> +       {CCI_REG8(0x9FCA), 0xD0},
> +       {CCI_REG8(0x9FCB), 0x07},
> +       {CCI_REG8(0x9FCC), 0xD0},
> +       {CCI_REG8(0x9FCD), 0x07},
> +       {CCI_REG8(0x9FCE), 0xD0},
> +       {CCI_REG8(0x9FCF), 0x07},
> +       {CCI_REG8(0x9FD0), 0xD0},
> +       {CCI_REG8(0x9FD1), 0x07},
> +       {CCI_REG8(0x9FD2), 0xC4},
> +       {CCI_REG8(0x9FD3), 0x09},
> +       {CCI_REG8(0x9FD4), 0xC4},
> +       {CCI_REG8(0x9FD5), 0x09},
> +       {CCI_REG8(0x9FD6), 0xC4},
> +       {CCI_REG8(0x9FD7), 0x09},
> +       {CCI_REG8(0x9FD8), 0xC4},
> +       {CCI_REG8(0x9FD9), 0x09},
> +       {CCI_REG8(0x9FDA), 0xD0},
> +       {CCI_REG8(0x9FDB), 0x07},
> +       {CCI_REG8(0x9FDC), 0xD0},
> +       {CCI_REG8(0x9FDD), 0x07},
> +       {CCI_REG8(0x9FDE), 0xD0},
> +       {CCI_REG8(0x9FDF), 0x07},
> +       {CCI_REG8(0x9FE0), 0xD0},
> +       {CCI_REG8(0x9FE1), 0x07},
> +       {CCI_REG8(0x9FE2), 0xC4},
> +       {CCI_REG8(0x9FE3), 0x09},
> +       {CCI_REG8(0x9FE4), 0xC4},
> +       {CCI_REG8(0x9FE5), 0x09},
> +       {CCI_REG8(0x9FE6), 0xC4},
> +       {CCI_REG8(0x9FE7), 0x09},
> +       {CCI_REG8(0x9FE8), 0xC4},
> +       {CCI_REG8(0x9FE9), 0x09},
> +       {CCI_REG8(0x9FEA), 0xD0},
> +       {CCI_REG8(0x9FEB), 0x07},
> +       {CCI_REG8(0x9FEC), 0xD0},
> +       {CCI_REG8(0x9FED), 0x07},
> +       {CCI_REG8(0x9FEE), 0xD0},
> +       {CCI_REG8(0x9FEF), 0x07},
> +       {CCI_REG8(0x9FF0), 0xD0},
> +       {CCI_REG8(0x9FF1), 0x07},
> +       {CCI_REG8(0x9FF2), 0xC4},
> +       {CCI_REG8(0x9FF3), 0x09},
> +       {CCI_REG8(0x9FF4), 0xC4},
> +       {CCI_REG8(0x9FF5), 0x09},
> +       {CCI_REG8(0x9FF6), 0xC4},
> +       {CCI_REG8(0x9FF7), 0x09},
> +       {CCI_REG8(0x9FF8), 0xC4},
> +       {CCI_REG8(0x9FF9), 0x09},
> +       {CCI_REG8(0x9FFA), 0xD0},
> +       {CCI_REG8(0x9FFB), 0x07},
> +       {CCI_REG8(0x9FFC), 0xD0},
> +       {CCI_REG8(0x9FFD), 0x07},
> +       {CCI_REG8(0x9FFE), 0xD0},
> +       {CCI_REG8(0x9FFF), 0x07},
> +       {CCI_REG8(0xA000), 0xD0},
> +       {CCI_REG8(0xA001), 0x07},
> +       {CCI_REG8(0xA002), 0xC4},
> +       {CCI_REG8(0xA003), 0x09},
> +       {CCI_REG8(0xA004), 0xC4},
> +       {CCI_REG8(0xA005), 0x09},
> +       {CCI_REG8(0xA006), 0xC4},
> +       {CCI_REG8(0xA007), 0x09},
> +       {CCI_REG8(0xA008), 0xC4},
> +       {CCI_REG8(0xA009), 0x09},
> +       {CCI_REG8(0xA00A), 0xD0},
> +       {CCI_REG8(0xA00B), 0x07},
> +       {CCI_REG8(0xA00C), 0xD0},
> +       {CCI_REG8(0xA00D), 0x07},
> +       {CCI_REG8(0xA00E), 0xD0},
> +       {CCI_REG8(0xA00F), 0x07},
> +       {CCI_REG8(0xA010), 0xD0},
> +       {CCI_REG8(0xA011), 0x07},
> +       {CCI_REG8(0xA012), 0xC4},
> +       {CCI_REG8(0xA013), 0x09},
> +       {CCI_REG8(0xA014), 0xC4},
> +       {CCI_REG8(0xA015), 0x09},
> +       {CCI_REG8(0xA016), 0xC4},
> +       {CCI_REG8(0xA017), 0x09},
> +       {CCI_REG8(0xA018), 0xC4},
> +       {CCI_REG8(0xA019), 0x09},
> +       {CCI_REG8(0xA044), 0x4B},
> +       {CCI_REG8(0xA045), 0x00},
> +       {CCI_REG8(0xA046), 0x4B},
> +       {CCI_REG8(0xA047), 0x00},
> +       {CCI_REG8(0xA048), 0x4B},
> +       {CCI_REG8(0xA049), 0x00},
> +       {CCI_REG8(0xA04A), 0x4B},
> +       {CCI_REG8(0xA04B), 0x00},
> +       {CCI_REG8(0xA04C), 0x15},
> +       {CCI_REG8(0xA04D), 0x00},
> +       {CCI_REG8(0xA04E), 0x15},
> +       {CCI_REG8(0xA04F), 0x00},
> +       {CCI_REG8(0xA050), 0x15},
> +       {CCI_REG8(0xA051), 0x00},
> +       {CCI_REG8(0xA052), 0x15},
> +       {CCI_REG8(0xA053), 0x00},
> +       {CCI_REG8(0xA054), 0x28},
> +       {CCI_REG8(0xA055), 0x00},
> +       {CCI_REG8(0xA056), 0x28},
> +       {CCI_REG8(0xA057), 0x00},
> +       {CCI_REG8(0xA058), 0x28},
> +       {CCI_REG8(0xA059), 0x00},
> +       {CCI_REG8(0xA05A), 0x28},
> +       {CCI_REG8(0xA05B), 0x00},
> +       {CCI_REG8(0xA05C), 0x28},
> +       {CCI_REG8(0xA05D), 0x00},
> +       {CCI_REG8(0xA05E), 0x28},
> +       {CCI_REG8(0xA05F), 0x00},
> +       {CCI_REG8(0xA060), 0x28},
> +       {CCI_REG8(0xA061), 0x00},
> +       {CCI_REG8(0xA062), 0x28},
> +       {CCI_REG8(0xA063), 0x00},
> +       {CCI_REG8(0xA064), 0x21},
> +       {CCI_REG8(0xA065), 0x00},
> +       {CCI_REG8(0xA066), 0x21},
> +       {CCI_REG8(0xA067), 0x00},
> +       {CCI_REG8(0xA068), 0x21},
> +       {CCI_REG8(0xA069), 0x00},
> +       {CCI_REG8(0xA06A), 0x21},
> +       {CCI_REG8(0xA06B), 0x00},
> +       {CCI_REG8(0xA076), 0x21},
> +       {CCI_REG8(0xA077), 0x00},
> +       {CCI_REG8(0xA078), 0x21},
> +       {CCI_REG8(0xA079), 0x00},
> +       {CCI_REG8(0xA07A), 0x21},
> +       {CCI_REG8(0xA07B), 0x00},
> +       {CCI_REG8(0xA07C), 0x21},
> +       {CCI_REG8(0xA07D), 0x00},
> +       {CCI_REG8(0xA07E), 0x28},
> +       {CCI_REG8(0xA07F), 0x00},
> +       {CCI_REG8(0xA080), 0x28},
> +       {CCI_REG8(0xA081), 0x00},
> +       {CCI_REG8(0xA082), 0x28},
> +       {CCI_REG8(0xA083), 0x00},
> +       {CCI_REG8(0xA084), 0x28},
> +       {CCI_REG8(0xA085), 0x00},
> +       {CCI_REG8(0xA086), 0x54},
> +       {CCI_REG8(0xA087), 0x00},
> +       {CCI_REG8(0xA088), 0x54},
> +       {CCI_REG8(0xA089), 0x00},
> +       {CCI_REG8(0xA08A), 0x54},
> +       {CCI_REG8(0xA08B), 0x00},
> +       {CCI_REG8(0xA08C), 0x54},
> +       {CCI_REG8(0xA08D), 0x00},
> +       {CCI_REG8(0xA09A), 0xA6},
> +       {CCI_REG8(0xA09B), 0x0E},
> +       {CCI_REG8(0xA09C), 0xA6},
> +       {CCI_REG8(0xA09D), 0x0E},
> +       {CCI_REG8(0xA09E), 0xA6},
> +       {CCI_REG8(0xA09F), 0x0E},
> +       {CCI_REG8(0xA0A0), 0xA6},
> +       {CCI_REG8(0xA0A1), 0x0E},
> +       {CCI_REG8(0xA0A2), 0xA6},
> +       {CCI_REG8(0xA0A3), 0x0E},
> +       {CCI_REG8(0xA0A4), 0xA6},
> +       {CCI_REG8(0xA0A5), 0x0E},
> +       {CCI_REG8(0xA0A6), 0xA6},
> +       {CCI_REG8(0xA0A7), 0x0E},
> +       {CCI_REG8(0xA0A8), 0xA6},
> +       {CCI_REG8(0xA0A9), 0x0E},
> +       {CCI_REG8(0xA0AA), 0xA6},
> +       {CCI_REG8(0xA0AB), 0x0E},
> +       {CCI_REG8(0xA0AC), 0xA6},
> +       {CCI_REG8(0xA0AD), 0x0E},
> +       {CCI_REG8(0xA0AE), 0xA6},
> +       {CCI_REG8(0xA0AF), 0x0E},
> +       {CCI_REG8(0xA0B0), 0xA6},
> +       {CCI_REG8(0xA0B1), 0x0E},
> +       {CCI_REG8(0xA0BC), 0xFE},
> +       {CCI_REG8(0xA0BD), 0x01},
> +       {CCI_REG8(0xA0BE), 0xFE},
> +       {CCI_REG8(0xA0BF), 0x01},
> +       {CCI_REG8(0xA0C0), 0xFE},
> +       {CCI_REG8(0xA0C1), 0x01},
> +       {CCI_REG8(0xA0C2), 0xFE},
> +       {CCI_REG8(0xA0C3), 0x01},
> +       {CCI_REG8(0xA0C4), 0xFC},
> +       {CCI_REG8(0xA0C5), 0x03},
> +       {CCI_REG8(0xA0C6), 0xFC},
> +       {CCI_REG8(0xA0C7), 0x03},
> +       {CCI_REG8(0xA0C8), 0xFC},
> +       {CCI_REG8(0xA0C9), 0x03},
> +       {CCI_REG8(0xA0CA), 0xFC},
> +       {CCI_REG8(0xA0CB), 0x03},
> +       {CCI_REG8(0xA0CC), 0xFE},
> +       {CCI_REG8(0xA0CD), 0x01},
> +       {CCI_REG8(0xA0CE), 0xFE},
> +       {CCI_REG8(0xA0CF), 0x01},
> +       {CCI_REG8(0xA0D0), 0xFE},
> +       {CCI_REG8(0xA0D1), 0x01},
> +       {CCI_REG8(0xA0D2), 0xFE},
> +       {CCI_REG8(0xA0D3), 0x01},
> +       {CCI_REG8(0xA0D4), 0xFC},
> +       {CCI_REG8(0xA0D5), 0x03},
> +       {CCI_REG8(0xA0D6), 0xFC},
> +       {CCI_REG8(0xA0D7), 0x03},
> +       {CCI_REG8(0xA0D8), 0xFC},
> +       {CCI_REG8(0xA0D9), 0x03},
> +       {CCI_REG8(0xA0DA), 0xFC},
> +       {CCI_REG8(0xA0DB), 0x03},
> +       {CCI_REG8(0xA0DC), 0xFE},
> +       {CCI_REG8(0xA0DD), 0x01},
> +       {CCI_REG8(0xA0DE), 0xFE},
> +       {CCI_REG8(0xA0DF), 0x01},
> +       {CCI_REG8(0xA0E0), 0xFE},
> +       {CCI_REG8(0xA0E1), 0x01},
> +       {CCI_REG8(0xA0E2), 0xFE},
> +       {CCI_REG8(0xA0E3), 0x01},
> +       {CCI_REG8(0xA0E4), 0xFC},
> +       {CCI_REG8(0xA0E5), 0x03},
> +       {CCI_REG8(0xA0E6), 0xFC},
> +       {CCI_REG8(0xA0E7), 0x03},
> +       {CCI_REG8(0xA0E8), 0xFC},
> +       {CCI_REG8(0xA0E9), 0x03},
> +       {CCI_REG8(0xA0EA), 0xFC},
> +       {CCI_REG8(0xA0EB), 0x03},
> +       {CCI_REG8(0xA0EC), 0xFE},
> +       {CCI_REG8(0xA0ED), 0x01},
> +       {CCI_REG8(0xA0EE), 0xFE},
> +       {CCI_REG8(0xA0EF), 0x01},
> +       {CCI_REG8(0xA0F0), 0xFE},
> +       {CCI_REG8(0xA0F1), 0x01},
> +       {CCI_REG8(0xA0F2), 0xFE},
> +       {CCI_REG8(0xA0F3), 0x01},
> +       {CCI_REG8(0xA0F4), 0xFC},
> +       {CCI_REG8(0xA0F5), 0x03},
> +       {CCI_REG8(0xA0F6), 0xFC},
> +       {CCI_REG8(0xA0F7), 0x03},
> +       {CCI_REG8(0xA0F8), 0xFC},
> +       {CCI_REG8(0xA0F9), 0x03},
> +       {CCI_REG8(0xA0FA), 0xFC},
> +       {CCI_REG8(0xA0FB), 0x03},
> +       {CCI_REG8(0xA11C), 0x01},
> +       {CCI_REG8(0xA126), 0x00},
> +       {CCI_REG8(0xA127), 0x04},
> +       {CCI_REG8(0xA128), 0x00},
> +       {CCI_REG8(0xA129), 0x02},
> +       {CCI_REG8(0xA12A), 0x00},
> +       {CCI_REG8(0xA12B), 0x02},
> +       {CCI_REG8(0xA12C), 0x00},
> +       {CCI_REG8(0xA12D), 0x02},
> +       {CCI_REG8(0xA12E), 0x00},
> +       {CCI_REG8(0xA12F), 0x02},
> +       {CCI_REG8(0xA130), 0x00},
> +       {CCI_REG8(0xA131), 0x02},
> +       {CCI_REG8(0xA132), 0x00},
> +       {CCI_REG8(0xA133), 0x02},
> +       {CCI_REG8(0xA134), 0x00},
> +       {CCI_REG8(0xA135), 0x02},
> +       {CCI_REG8(0xA136), 0x00},
> +       {CCI_REG8(0xA137), 0x02},
> +       {CCI_REG8(0xA138), 0xA6},
> +       {CCI_REG8(0xA139), 0x0E},
> +       {CCI_REG8(0xA13A), 0xA6},
> +       {CCI_REG8(0xA13B), 0x0E},
> +       {CCI_REG8(0xA13C), 0xA6},
> +       {CCI_REG8(0xA13D), 0x0E},
> +       {CCI_REG8(0xA13E), 0xA6},
> +       {CCI_REG8(0xA13F), 0x0E},
> +       {CCI_REG8(0xA140), 0xA6},
> +       {CCI_REG8(0xA141), 0x0E},
> +       {CCI_REG8(0xA142), 0xA6},
> +       {CCI_REG8(0xA143), 0x0E},
> +       {CCI_REG8(0xA144), 0xA6},
> +       {CCI_REG8(0xA145), 0x0E},
> +       {CCI_REG8(0xA146), 0xA6},
> +       {CCI_REG8(0xA147), 0x0E},
> +       {CCI_REG8(0xA148), 0xA6},
> +       {CCI_REG8(0xA149), 0x0E},
> +       {CCI_REG8(0xA14A), 0xA6},
> +       {CCI_REG8(0xA14B), 0x0E},
> +       {CCI_REG8(0xA14C), 0xA6},
> +       {CCI_REG8(0xA14D), 0x0E},
> +       {CCI_REG8(0xA14E), 0xA6},
> +       {CCI_REG8(0xA14F), 0x0E},
> +       {CCI_REG8(0xA150), 0xA6},
> +       {CCI_REG8(0xA151), 0x0E},
> +       {CCI_REG8(0xA152), 0xA6},
> +       {CCI_REG8(0xA153), 0x0E},
> +       {CCI_REG8(0xA154), 0xA6},
> +       {CCI_REG8(0xA155), 0x0E},
> +       {CCI_REG8(0xA156), 0xA6},
> +       {CCI_REG8(0xA157), 0x0E},
> +       {CCI_REG8(0xA15E), 0x09},
> +       {CCI_REG8(0xA15F), 0x08},
> +       {CCI_REG8(0xA160), 0x10},
> +       {CCI_REG8(0xA161), 0x09},
> +       {CCI_REG8(0xA162), 0x01},
> +       {CCI_REG8(0xA163), 0x00},
> +       {CCI_REG8(0xA166), 0x2F},
> +       {CCI_REG8(0xA167), 0x00},
> +       {CCI_REG8(0xA168), 0x01},
> +       {CCI_REG8(0xA169), 0x00},
> +       {CCI_REG8(0xA16A), 0x00},
> +       {CCI_REG8(0xA16B), 0x00},
> +       {CCI_REG8(0xA16C), 0x00},
> +       {CCI_REG8(0xA16D), 0x00},
> +       {CCI_REG8(0xA16E), 0x00},
> +       {CCI_REG8(0xA16F), 0x00},
> +       {CCI_REG8(0xA170), 0x00},
> +       {CCI_REG8(0xA171), 0x00},
> +       {CCI_REG8(0xA172), 0x33},
> +       {CCI_REG8(0xA173), 0x00},
> +       {CCI_REG8(0xA174), 0x33},
> +       {CCI_REG8(0xA175), 0x00},
> +       {CCI_REG8(0xA176), 0x33},
> +       {CCI_REG8(0xA177), 0x00},
> +       {CCI_REG8(0xA178), 0x33},
> +       {CCI_REG8(0xA179), 0x00},
> +       {CCI_REG8(0xA17A), 0x01},
> +       {CCI_REG8(0xA17C), 0xDE},
> +       {CCI_REG8(0xA17D), 0x00},
> +       {CCI_REG8(0xA17E), 0xEA},
> +       {CCI_REG8(0xA17F), 0x00},
> +       {CCI_REG8(0xA180), 0xDE},
> +       {CCI_REG8(0xA181), 0x00},
> +       {CCI_REG8(0xA182), 0xEA},
> +       {CCI_REG8(0xA183), 0x00},
> +       {CCI_REG8(0xA184), 0xDE},
> +       {CCI_REG8(0xA185), 0x00},
> +       {CCI_REG8(0xA186), 0xEE},
> +       {CCI_REG8(0xA187), 0x00},
> +       {CCI_REG8(0xA18A), 0x87},
> +       {CCI_REG8(0xA18B), 0x87},
> +       {CCI_REG8(0xA414), 0x67},
> +       {CCI_REG8(0xA415), 0x09},
> +       {CCI_REG8(0xA416), 0xD8},
> +       {CCI_REG8(0xA417), 0x1A},
> +       {CCI_REG8(0xA418), 0xB4},
> +       {CCI_REG8(0xA419), 0x0C},
> +       {CCI_REG8(0xA41A), 0x7E},
> +       {CCI_REG8(0xA41B), 0x15},
> +       {CCI_REG8(0xA41C), 0x01},
> +       {CCI_REG8(0xA41D), 0x10},
> +       {CCI_REG8(0xA41E), 0x24},
> +       {CCI_REG8(0xA41F), 0x10},
> +       {CCI_REG8(0xA420), 0x1A},
> +       {CCI_REG8(0xA421), 0x14},
> +       {CCI_REG8(0xA422), 0x6A},
> +       {CCI_REG8(0xA423), 0x0E},
> +       {CCI_REG8(0xA424), 0xD5},
> +       {CCI_REG8(0xA425), 0x19},
> +       {CCI_REG8(0xA426), 0xD5},
> +       {CCI_REG8(0xA427), 0x0C},
> +       {CCI_REG8(0xA428), 0xA9},
> +       {CCI_REG8(0xA429), 0x0D},
> +       {CCI_REG8(0xA42A), 0xE1},
> +       {CCI_REG8(0xA42B), 0x13},
> +       {CCI_REG8(0xA42C), 0x10},
> +       {CCI_REG8(0xA42D), 0x0E},
> +       {CCI_REG8(0xA42E), 0x47},
> +       {CCI_REG8(0xA42F), 0x0F},
> +       {CCI_REG8(0xA6AC), 0x02},
> +       {CCI_REG8(0xA6AD), 0x02},
> +       {CCI_REG8(0xA6AE), 0x02},
> +       {CCI_REG8(0xA6AF), 0x02},
> +       {CCI_REG8(0xA6B0), 0x02},
> +       {CCI_REG8(0xA6B1), 0x01},
> +       {CCI_REG8(0xA6B2), 0x40},
> +       {CCI_REG8(0xA6B3), 0x40},
> +       {CCI_REG8(0xA6B6), 0x40},
> +       {CCI_REG8(0xA6B7), 0x40},
> +       {CCI_REG8(0xA6BA), 0x40},
> +       {CCI_REG8(0xA6BB), 0x40},
> +       {CCI_REG8(0xA6BE), 0x40},
> +       {CCI_REG8(0xA6BF), 0x40},
> +       {CCI_REG8(0xA6D3), 0x30},
> +       {CCI_REG8(0xA6DA), 0x23},
> +       {CCI_REG8(0xA6DB), 0x00},
> +       {CCI_REG8(0xA6DC), 0x20},
> +       {CCI_REG8(0xA6DD), 0x00},
> +       {CCI_REG8(0xA6DE), 0x1C},
> +       {CCI_REG8(0xA6DF), 0x00},
> +       {CCI_REG8(0xA6E0), 0x18},
> +       {CCI_REG8(0xA6E1), 0x00},
> +       {CCI_REG8(0xA6E2), 0x46},
> +       {CCI_REG8(0xA6E3), 0x00},
> +       {CCI_REG8(0xA6E4), 0x40},
> +       {CCI_REG8(0xA6E5), 0x00},
> +       {CCI_REG8(0xA6E6), 0x39},
> +       {CCI_REG8(0xA6E7), 0x00},
> +       {CCI_REG8(0xA6E8), 0x31},
> +       {CCI_REG8(0xA6E9), 0x00},
> +       {CCI_REG8(0xA6EA), 0x8C},
> +       {CCI_REG8(0xA6EB), 0x00},
> +       {CCI_REG8(0xA6EC), 0x7F},
> +       {CCI_REG8(0xA6ED), 0x00},
> +       {CCI_REG8(0xA6EE), 0x71},
> +       {CCI_REG8(0xA6EF), 0x00},
> +       {CCI_REG8(0xA6F0), 0x61},
> +       {CCI_REG8(0xA6F1), 0x00},
> +       {CCI_REG8(0xA6F2), 0x18},
> +       {CCI_REG8(0xA6F3), 0x01},
> +       {CCI_REG8(0xA6F4), 0xFF},
> +       {CCI_REG8(0xA6F5), 0x00},
> +       {CCI_REG8(0xA6F6), 0xE2},
> +       {CCI_REG8(0xA6F7), 0x00},
> +       {CCI_REG8(0xA6F8), 0xC2},
> +       {CCI_REG8(0xA6F9), 0x00},
> +       {CCI_REG8(0xA702), 0x02},
> +       {CCI_REG8(0xA703), 0x00},
> +       {CCI_REG8(0xA704), 0x02},
> +       {CCI_REG8(0xA705), 0x00},
> +       {CCI_REG8(0xA706), 0x02},
> +       {CCI_REG8(0xA707), 0x00},
> +       {CCI_REG8(0xA708), 0x02},
> +       {CCI_REG8(0xA709), 0x00},
> +       {CCI_REG8(0xA70A), 0x40},
> +       {CCI_REG8(0xA70B), 0x40},
> +       {CCI_REG8(0xA70E), 0x40},
> +       {CCI_REG8(0xA70F), 0x40},
> +       {CCI_REG8(0xA712), 0x40},
> +       {CCI_REG8(0xA713), 0x40},
> +       {CCI_REG8(0xA716), 0x40},
> +       {CCI_REG8(0xA717), 0x40},
> +       {CCI_REG8(0xA72B), 0x30},
> +       {CCI_REG8(0xA72E), 0x40},
> +       {CCI_REG8(0xA72F), 0x40},
> +       {CCI_REG8(0xA730), 0x40},
> +       {CCI_REG8(0xA731), 0x40},
> +       {CCI_REG8(0xA732), 0x05},
> +       {CCI_REG8(0xA733), 0x00},
> +       {CCI_REG8(0xA734), 0x05},
> +       {CCI_REG8(0xA735), 0x00},
> +       {CCI_REG8(0xA736), 0x05},
> +       {CCI_REG8(0xA737), 0x00},
> +       {CCI_REG8(0xA738), 0x05},
> +       {CCI_REG8(0xA739), 0x00},
> +       {CCI_REG8(0xA73A), 0x09},
> +       {CCI_REG8(0xA73B), 0x00},
> +       {CCI_REG8(0xA73C), 0x09},
> +       {CCI_REG8(0xA73D), 0x00},
> +       {CCI_REG8(0xA73E), 0x09},
> +       {CCI_REG8(0xA73F), 0x00},
> +       {CCI_REG8(0xA740), 0x09},
> +       {CCI_REG8(0xA741), 0x00},
> +       {CCI_REG8(0xA742), 0x13},
> +       {CCI_REG8(0xA743), 0x00},
> +       {CCI_REG8(0xA744), 0x13},
> +       {CCI_REG8(0xA745), 0x00},
> +       {CCI_REG8(0xA746), 0x13},
> +       {CCI_REG8(0xA747), 0x00},
> +       {CCI_REG8(0xA748), 0x13},
> +       {CCI_REG8(0xA749), 0x00},
> +       {CCI_REG8(0xA74A), 0x25},
> +       {CCI_REG8(0xA74B), 0x00},
> +       {CCI_REG8(0xA74C), 0x25},
> +       {CCI_REG8(0xA74D), 0x00},
> +       {CCI_REG8(0xA74E), 0x25},
> +       {CCI_REG8(0xA74F), 0x00},
> +       {CCI_REG8(0xA750), 0x25},
> +       {CCI_REG8(0xA751), 0x00},
> +       {CCI_REG8(0xA75A), 0x02},
> +       {CCI_REG8(0xA75B), 0x00},
> +       {CCI_REG8(0xA75C), 0x02},
> +       {CCI_REG8(0xA75D), 0x00},
> +       {CCI_REG8(0xA75E), 0x02},
> +       {CCI_REG8(0xA75F), 0x00},
> +       {CCI_REG8(0xA760), 0x02},
> +       {CCI_REG8(0xA761), 0x00},
> +       {CCI_REG8(0xA762), 0x40},
> +       {CCI_REG8(0xA763), 0x40},
> +       {CCI_REG8(0xA766), 0x40},
> +       {CCI_REG8(0xA767), 0x40},
> +       {CCI_REG8(0xA76A), 0x40},
> +       {CCI_REG8(0xA76B), 0x40},
> +       {CCI_REG8(0xA76E), 0x40},
> +       {CCI_REG8(0xA76F), 0x40},
> +       {CCI_REG8(0xA782), 0x40},
> +       {CCI_REG8(0xA783), 0x30},
> +       {CCI_REG8(0xA784), 0x40},
> +       {CCI_REG8(0xA785), 0x40},
> +       {CCI_REG8(0xA786), 0x40},
> +       {CCI_REG8(0xA787), 0x40},
> +       {CCI_REG8(0xA788), 0x40},
> +       {CCI_REG8(0xA789), 0x40},
> +       {CCI_REG8(0xA78A), 0x03},
> +       {CCI_REG8(0xA78B), 0x00},
> +       {CCI_REG8(0xA78C), 0x03},
> +       {CCI_REG8(0xA78D), 0x00},
> +       {CCI_REG8(0xA78E), 0x03},
> +       {CCI_REG8(0xA78F), 0x00},
> +       {CCI_REG8(0xA790), 0x03},
> +       {CCI_REG8(0xA791), 0x00},
> +       {CCI_REG8(0xA792), 0x06},
> +       {CCI_REG8(0xA793), 0x00},
> +       {CCI_REG8(0xA794), 0x06},
> +       {CCI_REG8(0xA795), 0x00},
> +       {CCI_REG8(0xA796), 0x06},
> +       {CCI_REG8(0xA797), 0x00},
> +       {CCI_REG8(0xA798), 0x06},
> +       {CCI_REG8(0xA799), 0x00},
> +       {CCI_REG8(0xA79A), 0x0C},
> +       {CCI_REG8(0xA79B), 0x00},
> +       {CCI_REG8(0xA79C), 0x0C},
> +       {CCI_REG8(0xA79D), 0x00},
> +       {CCI_REG8(0xA79E), 0x0C},
> +       {CCI_REG8(0xA79F), 0x00},
> +       {CCI_REG8(0xA7A0), 0x0C},
> +       {CCI_REG8(0xA7A1), 0x00},
> +       {CCI_REG8(0xA7A2), 0x19},
> +       {CCI_REG8(0xA7A3), 0x00},
> +       {CCI_REG8(0xA7A4), 0x19},
> +       {CCI_REG8(0xA7A5), 0x00},
> +       {CCI_REG8(0xA7A6), 0x19},
> +       {CCI_REG8(0xA7A7), 0x00},
> +       {CCI_REG8(0xA7A8), 0x19},
> +       {CCI_REG8(0xA7A9), 0x00},
> +       {CCI_REG8(0xA7B2), 0x02},
> +       {CCI_REG8(0xA7B3), 0x00},
> +       {CCI_REG8(0xA7B4), 0x02},
> +       {CCI_REG8(0xA7B5), 0x00},
> +       {CCI_REG8(0xA7B6), 0x02},
> +       {CCI_REG8(0xA7B7), 0x00},
> +       {CCI_REG8(0xA7B8), 0x02},
> +       {CCI_REG8(0xA7B9), 0x00},
> +       {CCI_REG8(0xA7BA), 0x40},
> +       {CCI_REG8(0xA7BB), 0x40},
> +       {CCI_REG8(0xA7BE), 0x40},
> +       {CCI_REG8(0xA7BF), 0x40},
> +       {CCI_REG8(0xA7C2), 0x40},
> +       {CCI_REG8(0xA7C3), 0x40},
> +       {CCI_REG8(0xA7C6), 0x40},
> +       {CCI_REG8(0xA7C7), 0x40},
> +       {CCI_REG8(0xA7DB), 0x30},
> +       {CCI_REG8(0xA7E2), 0x01},
> +       {CCI_REG8(0xA7E3), 0x00},
> +       {CCI_REG8(0xA7E4), 0x01},
> +       {CCI_REG8(0xA7E5), 0x00},
> +       {CCI_REG8(0xA7E6), 0x01},
> +       {CCI_REG8(0xA7E7), 0x00},
> +       {CCI_REG8(0xA7E8), 0x01},
> +       {CCI_REG8(0xA7E9), 0x00},
> +       {CCI_REG8(0xA7EA), 0x03},
> +       {CCI_REG8(0xA7EB), 0x00},
> +       {CCI_REG8(0xA7EC), 0x03},
> +       {CCI_REG8(0xA7ED), 0x00},
> +       {CCI_REG8(0xA7EE), 0x03},
> +       {CCI_REG8(0xA7EF), 0x00},
> +       {CCI_REG8(0xA7F0), 0x03},
> +       {CCI_REG8(0xA7F1), 0x00},
> +       {CCI_REG8(0xA7F2), 0x0B},
> +       {CCI_REG8(0xA7F3), 0x00},
> +       {CCI_REG8(0xA7F4), 0x0B},
> +       {CCI_REG8(0xA7F5), 0x00},
> +       {CCI_REG8(0xA7F6), 0x0B},
> +       {CCI_REG8(0xA7F7), 0x00},
> +       {CCI_REG8(0xA7F8), 0x0B},
> +       {CCI_REG8(0xA7F9), 0x00},
> +       {CCI_REG8(0xA7FA), 0x2E},
> +       {CCI_REG8(0xA7FB), 0x00},
> +       {CCI_REG8(0xA7FC), 0x2E},
> +       {CCI_REG8(0xA7FD), 0x00},
> +       {CCI_REG8(0xA7FE), 0x2E},
> +       {CCI_REG8(0xA7FF), 0x00},
> +       {CCI_REG8(0xA800), 0x2E},
> +       {CCI_REG8(0xA801), 0x00},
> +       {CCI_REG8(0xA80A), 0x0A},
> +       {CCI_REG8(0xA80B), 0x00},
> +       {CCI_REG8(0xA80C), 0x0A},
> +       {CCI_REG8(0xA80D), 0x00},
> +       {CCI_REG8(0xA80E), 0x0A},
> +       {CCI_REG8(0xA80F), 0x00},
> +       {CCI_REG8(0xA810), 0x0A},
> +       {CCI_REG8(0xA811), 0x00},
> +       {CCI_REG8(0xA832), 0x40},
> +       {CCI_REG8(0xA833), 0x40},
> +       {CCI_REG8(0xA834), 0x40},
> +       {CCI_REG8(0xA835), 0x40},
> +       {CCI_REG8(0xA836), 0x40},
> +       {CCI_REG8(0xA837), 0x40},
> +       {CCI_REG8(0xA838), 0x40},
> +       {CCI_REG8(0xA839), 0x40},
> +       {CCI_REG8(0xA83A), 0x05},
> +       {CCI_REG8(0xA83B), 0x00},
> +       {CCI_REG8(0xA83C), 0x05},
> +       {CCI_REG8(0xA83D), 0x00},
> +       {CCI_REG8(0xA83E), 0x05},
> +       {CCI_REG8(0xA83F), 0x00},
> +       {CCI_REG8(0xA840), 0x05},
> +       {CCI_REG8(0xA841), 0x00},
> +       {CCI_REG8(0xA842), 0x0A},
> +       {CCI_REG8(0xA843), 0x00},
> +       {CCI_REG8(0xA844), 0x0A},
> +       {CCI_REG8(0xA845), 0x00},
> +       {CCI_REG8(0xA846), 0x0A},
> +       {CCI_REG8(0xA847), 0x00},
> +       {CCI_REG8(0xA848), 0x0A},
> +       {CCI_REG8(0xA849), 0x00},
> +       {CCI_REG8(0xA84A), 0x13},
> +       {CCI_REG8(0xA84B), 0x00},
> +       {CCI_REG8(0xA84C), 0x13},
> +       {CCI_REG8(0xA84D), 0x00},
> +       {CCI_REG8(0xA84E), 0x13},
> +       {CCI_REG8(0xA84F), 0x00},
> +       {CCI_REG8(0xA850), 0x13},
> +       {CCI_REG8(0xA851), 0x00},
> +       {CCI_REG8(0xA852), 0x26},
> +       {CCI_REG8(0xA853), 0x00},
> +       {CCI_REG8(0xA854), 0x26},
> +       {CCI_REG8(0xA855), 0x00},
> +       {CCI_REG8(0xA856), 0x26},
> +       {CCI_REG8(0xA857), 0x00},
> +       {CCI_REG8(0xA858), 0x26},
> +       {CCI_REG8(0xA859), 0x00},
> +       {CCI_REG8(0xA862), 0x02},
> +       {CCI_REG8(0xA863), 0x00},
> +       {CCI_REG8(0xA864), 0x02},
> +       {CCI_REG8(0xA865), 0x00},
> +       {CCI_REG8(0xA866), 0x02},
> +       {CCI_REG8(0xA867), 0x00},
> +       {CCI_REG8(0xA868), 0x02},
> +       {CCI_REG8(0xA869), 0x00},
> +       {CCI_REG8(0xA455), 0x00},
> +       {CCI_REG8(0xA456), 0x01},
> +       {CCI_REG8(0xA465), 0x08},
> +       {CCI_REG8(0xA467), 0x0B},
> +       {CCI_REG8(0xA468), 0x0B},
> +       {CCI_REG8(0xA469), 0x0B},
> +       {CCI_REG8(0xA46A), 0x0B},
> +       {CCI_REG8(0xA46B), 0x0B},
> +       {CCI_REG8(0xA470), 0xAF},
> +       {CCI_REG8(0xA471), 0x9B},
> +       {CCI_REG8(0xA472), 0x87},
> +       {CCI_REG8(0xA473), 0x6E},
> +       {CCI_REG8(0xA474), 0xAF},
> +       {CCI_REG8(0xA475), 0x9B},
> +       {CCI_REG8(0xA476), 0x87},
> +       {CCI_REG8(0xA477), 0x6E},
> +       {CCI_REG8(0xA478), 0xAF},
> +       {CCI_REG8(0xA479), 0x9B},
> +       {CCI_REG8(0xA47A), 0x87},
> +       {CCI_REG8(0xA47B), 0x6E},
> +       {CCI_REG8(0xA4B4), 0x70},
> +       {CCI_REG8(0xA4B5), 0x70},
> +       {CCI_REG8(0xA4B6), 0x70},
> +       {CCI_REG8(0xA4B7), 0x70},
> +       {CCI_REG8(0xA4B9), 0x4A},
> +       {CCI_REG8(0xA4BA), 0x44},
> +       {CCI_REG8(0xA4BB), 0x3C},
> +       {CCI_REG8(0xA4BC), 0x19},
> +       {CCI_REG8(0xA4BD), 0x19},
> +       {CCI_REG8(0xA4BE), 0x19},
> +       {CCI_REG8(0xA4BF), 0x19},
> +       {CCI_REG8(0xA4C0), 0x07},
> +       {CCI_REG8(0xA4C1), 0x07},
> +       {CCI_REG8(0xA4C2), 0x07},
> +       {CCI_REG8(0xA4C3), 0x07},
> +       {CCI_REG8(0xA4C4), 0x0B},
> +       {CCI_REG8(0xA4C5), 0x0B},
> +       {CCI_REG8(0xA4C6), 0x0B},
> +       {CCI_REG8(0xA4C7), 0x0B},
> +       {CCI_REG8(0xA4C8), 0x1C},
> +       {CCI_REG8(0xA4C9), 0x1C},
> +       {CCI_REG8(0xA4CA), 0x1C},
> +       {CCI_REG8(0xA4CB), 0x1C},
> +       {CCI_REG8(0xB1E0), 0x80},
> +       {CCI_REG8(0xB1E1), 0x01},
> +       {CCI_REG8(0xB1E2), 0x80},
> +       {CCI_REG8(0xB1E3), 0x01},
> +       {CCI_REG8(0xB1E4), 0x80},
> +       {CCI_REG8(0xB1E5), 0x01},
> +       {CCI_REG8(0xB1E6), 0x80},
> +       {CCI_REG8(0xB1E7), 0x01},
> +       {CCI_REG8(0xB1E8), 0x80},
> +       {CCI_REG8(0xB1E9), 0x01},
> +       {CCI_REG8(0xB1EA), 0x80},
> +       {CCI_REG8(0xB1EB), 0x01},
> +       {CCI_REG8(0xB1EC), 0x80},
> +       {CCI_REG8(0xB1ED), 0x01},
> +       {CCI_REG8(0xB1EE), 0x80},
> +       {CCI_REG8(0xB1EF), 0x01},
> +       {CCI_REG8(0xB1F0), 0x80},
> +       {CCI_REG8(0xB1F1), 0x01},
> +       {CCI_REG8(0xB1F2), 0x80},
> +       {CCI_REG8(0xB1F3), 0x01},
> +       {CCI_REG8(0xB1F4), 0x80},
> +       {CCI_REG8(0xB1F5), 0x01},
> +       {CCI_REG8(0xB1F6), 0x80},
> +       {CCI_REG8(0xB1F7), 0x01},
> +       {CCI_REG8(0xB1F8), 0x80},
> +       {CCI_REG8(0xB1F9), 0x01},
> +       {CCI_REG8(0xB1FA), 0x80},
> +       {CCI_REG8(0xB1FB), 0x01},
> +       {CCI_REG8(0xB1FC), 0x80},
> +       {CCI_REG8(0xB1FD), 0x01},
> +       {CCI_REG8(0xB1FE), 0x80},
> +       {CCI_REG8(0xB1FF), 0x01},
> +       {CCI_REG8(0xB200), 0xC0},
> +       {CCI_REG8(0xB201), 0x00},
> +       {CCI_REG8(0xB202), 0xC0},
> +       {CCI_REG8(0xB203), 0x00},
> +       {CCI_REG8(0xB204), 0xC0},
> +       {CCI_REG8(0xB205), 0x00},
> +       {CCI_REG8(0xB206), 0xC0},
> +       {CCI_REG8(0xB207), 0x00},
> +       {CCI_REG8(0xB208), 0xC0},
> +       {CCI_REG8(0xB209), 0x00},
> +       {CCI_REG8(0xB20A), 0xC0},
> +       {CCI_REG8(0xB20B), 0x00},
> +       {CCI_REG8(0xB20C), 0xC0},
> +       {CCI_REG8(0xB20D), 0x00},
> +       {CCI_REG8(0xB20E), 0xC0},
> +       {CCI_REG8(0xB20F), 0x00},
> +       {CCI_REG8(0xB210), 0xC0},
> +       {CCI_REG8(0xB211), 0x00},
> +       {CCI_REG8(0xB212), 0xC0},
> +       {CCI_REG8(0xB213), 0x00},
> +       {CCI_REG8(0xB214), 0xC0},
> +       {CCI_REG8(0xB215), 0x00},
> +       {CCI_REG8(0xB216), 0xC0},
> +       {CCI_REG8(0xB217), 0x00},
> +       {CCI_REG8(0xB218), 0xC0},
> +       {CCI_REG8(0xB219), 0x00},
> +       {CCI_REG8(0xB21A), 0xC0},
> +       {CCI_REG8(0xB21B), 0x00},
> +       {CCI_REG8(0xB21C), 0xC0},
> +       {CCI_REG8(0xB21D), 0x00},
> +       {CCI_REG8(0xB21E), 0xC0},
> +       {CCI_REG8(0xB21F), 0x00},
> +       {CCI_REG8(0xB220), 0x80},
> +       {CCI_REG8(0xB221), 0x01},
> +       {CCI_REG8(0xB222), 0x80},
> +       {CCI_REG8(0xB223), 0x01},
> +       {CCI_REG8(0xB224), 0x80},
> +       {CCI_REG8(0xB225), 0x01},
> +       {CCI_REG8(0xB226), 0x80},
> +       {CCI_REG8(0xB227), 0x01},
> +       {CCI_REG8(0xB228), 0x80},
> +       {CCI_REG8(0xB229), 0x01},
> +       {CCI_REG8(0xB22A), 0x80},
> +       {CCI_REG8(0xB22B), 0x01},
> +       {CCI_REG8(0xB22C), 0x80},
> +       {CCI_REG8(0xB22D), 0x01},
> +       {CCI_REG8(0xB22E), 0x80},
> +       {CCI_REG8(0xB22F), 0x01},
> +       {CCI_REG8(0xB230), 0x80},
> +       {CCI_REG8(0xB231), 0x01},
> +       {CCI_REG8(0xB232), 0x80},
> +       {CCI_REG8(0xB233), 0x01},
> +       {CCI_REG8(0xB234), 0x80},
> +       {CCI_REG8(0xB235), 0x01},
> +       {CCI_REG8(0xB236), 0x80},
> +       {CCI_REG8(0xB237), 0x01},
> +       {CCI_REG8(0xB238), 0x80},
> +       {CCI_REG8(0xB239), 0x01},
> +       {CCI_REG8(0xB23A), 0x80},
> +       {CCI_REG8(0xB23B), 0x01},
> +       {CCI_REG8(0xB23C), 0x80},
> +       {CCI_REG8(0xB23D), 0x01},
> +       {CCI_REG8(0xB23E), 0x80},
> +       {CCI_REG8(0xB23F), 0x01},
> +       {CCI_REG8(0xB240), 0xC0},
> +       {CCI_REG8(0xB241), 0x00},
> +       {CCI_REG8(0xB242), 0xC0},
> +       {CCI_REG8(0xB243), 0x00},
> +       {CCI_REG8(0xB244), 0xC0},
> +       {CCI_REG8(0xB245), 0x00},
> +       {CCI_REG8(0xB246), 0xC0},
> +       {CCI_REG8(0xB247), 0x00},
> +       {CCI_REG8(0xB248), 0xC0},
> +       {CCI_REG8(0xB249), 0x00},
> +       {CCI_REG8(0xB24A), 0xC0},
> +       {CCI_REG8(0xB24B), 0x00},
> +       {CCI_REG8(0xB24C), 0xC0},
> +       {CCI_REG8(0xB24D), 0x00},
> +       {CCI_REG8(0xB24E), 0xC0},
> +       {CCI_REG8(0xB24F), 0x00},
> +       {CCI_REG8(0xB250), 0xC0},
> +       {CCI_REG8(0xB251), 0x00},
> +       {CCI_REG8(0xB252), 0xC0},
> +       {CCI_REG8(0xB253), 0x00},
> +       {CCI_REG8(0xB254), 0xC0},
> +       {CCI_REG8(0xB255), 0x00},
> +       {CCI_REG8(0xB256), 0xC0},
> +       {CCI_REG8(0xB257), 0x00},
> +       {CCI_REG8(0xB258), 0xC0},
> +       {CCI_REG8(0xB259), 0x00},
> +       {CCI_REG8(0xB25A), 0xC0},
> +       {CCI_REG8(0xB25B), 0x00},
> +       {CCI_REG8(0xB25C), 0xC0},
> +       {CCI_REG8(0xB25D), 0x00},
> +       {CCI_REG8(0xB25E), 0xC0},
> +       {CCI_REG8(0xB25F), 0x00},
> +       {CCI_REG8(0xB260), 0x80},
> +       {CCI_REG8(0xB261), 0x01},
> +       {CCI_REG8(0xB262), 0x80},
> +       {CCI_REG8(0xB263), 0x01},
> +       {CCI_REG8(0xB264), 0x80},
> +       {CCI_REG8(0xB265), 0x01},
> +       {CCI_REG8(0xB266), 0x80},
> +       {CCI_REG8(0xB267), 0x01},
> +       {CCI_REG8(0xB268), 0x80},
> +       {CCI_REG8(0xB269), 0x01},
> +       {CCI_REG8(0xB26A), 0x80},
> +       {CCI_REG8(0xB26B), 0x01},
> +       {CCI_REG8(0xB26C), 0x80},
> +       {CCI_REG8(0xB26D), 0x01},
> +       {CCI_REG8(0xB26E), 0x80},
> +       {CCI_REG8(0xB26F), 0x01},
> +       {CCI_REG8(0xB270), 0x80},
> +       {CCI_REG8(0xB271), 0x01},
> +       {CCI_REG8(0xB272), 0x80},
> +       {CCI_REG8(0xB273), 0x01},
> +       {CCI_REG8(0xB274), 0x80},
> +       {CCI_REG8(0xB275), 0x01},
> +       {CCI_REG8(0xB276), 0x80},
> +       {CCI_REG8(0xB277), 0x01},
> +       {CCI_REG8(0xB278), 0x80},
> +       {CCI_REG8(0xB279), 0x01},
> +       {CCI_REG8(0xB27A), 0x80},
> +       {CCI_REG8(0xB27B), 0x01},
> +       {CCI_REG8(0xB27C), 0x80},
> +       {CCI_REG8(0xB27D), 0x01},
> +       {CCI_REG8(0xB27E), 0x80},
> +       {CCI_REG8(0xB27F), 0x01},
> +       {CCI_REG8(0xB280), 0xC0},
> +       {CCI_REG8(0xB281), 0x00},
> +       {CCI_REG8(0xB282), 0xC0},
> +       {CCI_REG8(0xB283), 0x00},
> +       {CCI_REG8(0xB284), 0xC0},
> +       {CCI_REG8(0xB285), 0x00},
> +       {CCI_REG8(0xB286), 0xC0},
> +       {CCI_REG8(0xB287), 0x00},
> +       {CCI_REG8(0xB288), 0xC0},
> +       {CCI_REG8(0xB289), 0x00},
> +       {CCI_REG8(0xB28A), 0xC0},
> +       {CCI_REG8(0xB28B), 0x00},
> +       {CCI_REG8(0xB28C), 0xC0},
> +       {CCI_REG8(0xB28D), 0x00},
> +       {CCI_REG8(0xB28E), 0xC0},
> +       {CCI_REG8(0xB28F), 0x00},
> +       {CCI_REG8(0xB290), 0xC0},
> +       {CCI_REG8(0xB291), 0x00},
> +       {CCI_REG8(0xB292), 0xC0},
> +       {CCI_REG8(0xB293), 0x00},
> +       {CCI_REG8(0xB294), 0xC0},
> +       {CCI_REG8(0xB295), 0x00},
> +       {CCI_REG8(0xB296), 0xC0},
> +       {CCI_REG8(0xB297), 0x00},
> +       {CCI_REG8(0xB298), 0xC0},
> +       {CCI_REG8(0xB299), 0x00},
> +       {CCI_REG8(0xB29A), 0xC0},
> +       {CCI_REG8(0xB29B), 0x00},
> +       {CCI_REG8(0xB29C), 0xC0},
> +       {CCI_REG8(0xB29D), 0x00},
> +       {CCI_REG8(0xB29E), 0xC0},
> +       {CCI_REG8(0xB29F), 0x00},
> +       {CCI_REG8(0xB2A0), 0x80},
> +       {CCI_REG8(0xB2A1), 0x01},
> +       {CCI_REG8(0xB2A2), 0x80},
> +       {CCI_REG8(0xB2A3), 0x01},
> +       {CCI_REG8(0xB2A4), 0x80},
> +       {CCI_REG8(0xB2A5), 0x01},
> +       {CCI_REG8(0xB2A6), 0x80},
> +       {CCI_REG8(0xB2A7), 0x01},
> +       {CCI_REG8(0xB2A8), 0x80},
> +       {CCI_REG8(0xB2A9), 0x01},
> +       {CCI_REG8(0xB2AA), 0x80},
> +       {CCI_REG8(0xB2AB), 0x01},
> +       {CCI_REG8(0xB2AC), 0x80},
> +       {CCI_REG8(0xB2AD), 0x01},
> +       {CCI_REG8(0xB2AE), 0x80},
> +       {CCI_REG8(0xB2AF), 0x01},
> +       {CCI_REG8(0xB2B0), 0x80},
> +       {CCI_REG8(0xB2B1), 0x01},
> +       {CCI_REG8(0xB2B2), 0x80},
> +       {CCI_REG8(0xB2B3), 0x01},
> +       {CCI_REG8(0xB2B4), 0x80},
> +       {CCI_REG8(0xB2B5), 0x01},
> +       {CCI_REG8(0xB2B6), 0x80},
> +       {CCI_REG8(0xB2B7), 0x01},
> +       {CCI_REG8(0xB2B8), 0x80},
> +       {CCI_REG8(0xB2B9), 0x01},
> +       {CCI_REG8(0xB2BA), 0x80},
> +       {CCI_REG8(0xB2BB), 0x01},
> +       {CCI_REG8(0xB2BC), 0x80},
> +       {CCI_REG8(0xB2BD), 0x01},
> +       {CCI_REG8(0xB2BE), 0x80},
> +       {CCI_REG8(0xB2BF), 0x01},
> +       {CCI_REG8(0xB2C0), 0xC0},
> +       {CCI_REG8(0xB2C1), 0x00},
> +       {CCI_REG8(0xB2C2), 0xC0},
> +       {CCI_REG8(0xB2C3), 0x00},
> +       {CCI_REG8(0xB2C4), 0xC0},
> +       {CCI_REG8(0xB2C5), 0x00},
> +       {CCI_REG8(0xB2C6), 0xC0},
> +       {CCI_REG8(0xB2C7), 0x00},
> +       {CCI_REG8(0xB2C8), 0xC0},
> +       {CCI_REG8(0xB2C9), 0x00},
> +       {CCI_REG8(0xB2CA), 0xC0},
> +       {CCI_REG8(0xB2CB), 0x00},
> +       {CCI_REG8(0xB2CC), 0xC0},
> +       {CCI_REG8(0xB2CD), 0x00},
> +       {CCI_REG8(0xB2CE), 0xC0},
> +       {CCI_REG8(0xB2CF), 0x00},
> +       {CCI_REG8(0xB2D0), 0xC0},
> +       {CCI_REG8(0xB2D1), 0x00},
> +       {CCI_REG8(0xB2D2), 0xC0},
> +       {CCI_REG8(0xB2D3), 0x00},
> +       {CCI_REG8(0xB2D4), 0xC0},
> +       {CCI_REG8(0xB2D5), 0x00},
> +       {CCI_REG8(0xB2D6), 0xC0},
> +       {CCI_REG8(0xB2D7), 0x00},
> +       {CCI_REG8(0xB2D8), 0xC0},
> +       {CCI_REG8(0xB2D9), 0x00},
> +       {CCI_REG8(0xB2DA), 0xC0},
> +       {CCI_REG8(0xB2DB), 0x00},
> +       {CCI_REG8(0xB2DC), 0xC0},
> +       {CCI_REG8(0xB2DD), 0x00},
> +       {CCI_REG8(0xB2DE), 0xC0},
> +       {CCI_REG8(0xB2DF), 0x00},
> +       {CCI_REG8(0xB2E0), 0x00},
> +       {CCI_REG8(0xB2E1), 0x01},
> +       {CCI_REG8(0xB2E2), 0x00},
> +       {CCI_REG8(0xB2E3), 0x01},
> +       {CCI_REG8(0xB2E4), 0x00},
> +       {CCI_REG8(0xB2E5), 0x01},
> +       {CCI_REG8(0xB2E6), 0x00},
> +       {CCI_REG8(0xB2E7), 0x01},
> +       {CCI_REG8(0xB2E8), 0x00},
> +       {CCI_REG8(0xB2E9), 0x01},
> +       {CCI_REG8(0xB2EA), 0x00},
> +       {CCI_REG8(0xB2EB), 0x01},
> +       {CCI_REG8(0xB2EC), 0x00},
> +       {CCI_REG8(0xB2ED), 0x01},
> +       {CCI_REG8(0xB2EE), 0x00},
> +       {CCI_REG8(0xB2EF), 0x01},
> +       {CCI_REG8(0xB2F0), 0x00},
> +       {CCI_REG8(0xB2F1), 0x01},
> +       {CCI_REG8(0xB2F2), 0x00},
> +       {CCI_REG8(0xB2F3), 0x01},
> +       {CCI_REG8(0xB2F4), 0x00},
> +       {CCI_REG8(0xB2F5), 0x01},
> +       {CCI_REG8(0xB2F6), 0x00},
> +       {CCI_REG8(0xB2F7), 0x01},
> +       {CCI_REG8(0xB2F8), 0x00},
> +       {CCI_REG8(0xB2F9), 0x01},
> +       {CCI_REG8(0xB2FA), 0x00},
> +       {CCI_REG8(0xB2FB), 0x01},
> +       {CCI_REG8(0xB2FC), 0x00},
> +       {CCI_REG8(0xB2FD), 0x01},
> +       {CCI_REG8(0xB2FE), 0x00},
> +       {CCI_REG8(0xB2FF), 0x01},
> +       {CCI_REG8(0xB300), 0x80},
> +       {CCI_REG8(0xB301), 0x00},
> +       {CCI_REG8(0xB302), 0x80},
> +       {CCI_REG8(0xB303), 0x00},
> +       {CCI_REG8(0xB304), 0x80},
> +       {CCI_REG8(0xB305), 0x00},
> +       {CCI_REG8(0xB306), 0x80},
> +       {CCI_REG8(0xB307), 0x00},
> +       {CCI_REG8(0xB308), 0x80},
> +       {CCI_REG8(0xB309), 0x00},
> +       {CCI_REG8(0xB30A), 0x80},
> +       {CCI_REG8(0xB30B), 0x00},
> +       {CCI_REG8(0xB30C), 0x80},
> +       {CCI_REG8(0xB30D), 0x00},
> +       {CCI_REG8(0xB30E), 0x80},
> +       {CCI_REG8(0xB30F), 0x00},
> +       {CCI_REG8(0xB310), 0x80},
> +       {CCI_REG8(0xB311), 0x00},
> +       {CCI_REG8(0xB312), 0x80},
> +       {CCI_REG8(0xB313), 0x00},
> +       {CCI_REG8(0xB314), 0x80},
> +       {CCI_REG8(0xB315), 0x00},
> +       {CCI_REG8(0xB316), 0x80},
> +       {CCI_REG8(0xB317), 0x00},
> +       {CCI_REG8(0xB318), 0x80},
> +       {CCI_REG8(0xB319), 0x00},
> +       {CCI_REG8(0xB31A), 0x80},
> +       {CCI_REG8(0xB31B), 0x00},
> +       {CCI_REG8(0xB31C), 0x80},
> +       {CCI_REG8(0xB31D), 0x00},
> +       {CCI_REG8(0xB31E), 0x80},
> +       {CCI_REG8(0xB31F), 0x00},
> +       {CCI_REG8(0xB320), 0x40},
> +       {CCI_REG8(0xB321), 0x40},
> +       {CCI_REG8(0xB322), 0x40},
> +       {CCI_REG8(0xB323), 0x40},
> +       {CCI_REG8(0xB324), 0x40},
> +       {CCI_REG8(0xB325), 0x40},
> +       {CCI_REG8(0xB326), 0x40},
> +       {CCI_REG8(0xB327), 0x40},
> +       {CCI_REG8(0xB328), 0x40},
> +       {CCI_REG8(0xB329), 0x40},
> +       {CCI_REG8(0xB32A), 0x40},
> +       {CCI_REG8(0xB32B), 0x40},
> +       {CCI_REG8(0xB32C), 0x40},
> +       {CCI_REG8(0xB32D), 0x40},
> +       {CCI_REG8(0xB32E), 0x40},
> +       {CCI_REG8(0xB32F), 0x40},
> +       {CCI_REG8(0xB34C), 0x40},
> +       {CCI_REG8(0xB34D), 0x40},
> +       {CCI_REG8(0xB34E), 0x40},
> +       {CCI_REG8(0xB34F), 0x40},
> +       {CCI_REG8(0xB350), 0x40},
> +       {CCI_REG8(0xB351), 0x40},
> +       {CCI_REG8(0xB352), 0x40},
> +       {CCI_REG8(0xB353), 0x40},
> +       {CCI_REG8(0xB354), 0x40},
> +       {CCI_REG8(0xB355), 0x40},
> +       {CCI_REG8(0xB356), 0x40},
> +       {CCI_REG8(0xB357), 0x40},
> +       {CCI_REG8(0xB358), 0x40},
> +       {CCI_REG8(0xB359), 0x40},
> +       {CCI_REG8(0xB35A), 0x40},
> +       {CCI_REG8(0xB35B), 0x40},
> +       {CCI_REG8(0xB378), 0x40},
> +       {CCI_REG8(0xB379), 0x40},
> +       {CCI_REG8(0xB37A), 0x40},
> +       {CCI_REG8(0xB37B), 0x40},
> +       {CCI_REG8(0xB37C), 0x40},
> +       {CCI_REG8(0xB37D), 0x40},
> +       {CCI_REG8(0xB37E), 0x40},
> +       {CCI_REG8(0xB37F), 0x40},
> +       {CCI_REG8(0xB380), 0x40},
> +       {CCI_REG8(0xB381), 0x40},
> +       {CCI_REG8(0xB382), 0x40},
> +       {CCI_REG8(0xB383), 0x40},
> +       {CCI_REG8(0xB384), 0x40},
> +       {CCI_REG8(0xB385), 0x40},
> +       {CCI_REG8(0xB386), 0x40},
> +       {CCI_REG8(0xB387), 0x40},
> +       {CCI_REG8(0xB3A4), 0x40},
> +       {CCI_REG8(0xB3A5), 0x40},
> +       {CCI_REG8(0xB3A6), 0x40},
> +       {CCI_REG8(0xB3A7), 0x40},
> +       {CCI_REG8(0xB3A8), 0x40},
> +       {CCI_REG8(0xB3A9), 0x40},
> +       {CCI_REG8(0xB3AA), 0x40},
> +       {CCI_REG8(0xB3AB), 0x40},
> +       {CCI_REG8(0xB3AC), 0x40},
> +       {CCI_REG8(0xB3AD), 0x40},
> +       {CCI_REG8(0xB3AE), 0x40},
> +       {CCI_REG8(0xB3AF), 0x40},
> +       {CCI_REG8(0xB3B0), 0x40},
> +       {CCI_REG8(0xB3B1), 0x40},
> +       {CCI_REG8(0xB3B2), 0x40},
> +       {CCI_REG8(0xB3B3), 0x40},
> +       {CCI_REG8(0xB3D0), 0x40},
> +       {CCI_REG8(0xB3D1), 0x40},
> +       {CCI_REG8(0xB3D2), 0x40},
> +       {CCI_REG8(0xB3D3), 0x40},
> +       {CCI_REG8(0xB3D4), 0x40},
> +       {CCI_REG8(0xB3D5), 0x40},
> +       {CCI_REG8(0xB3D6), 0x40},
> +       {CCI_REG8(0xB3D7), 0x40},
> +       {CCI_REG8(0xB3D8), 0x40},
> +       {CCI_REG8(0xB3D9), 0x40},
> +       {CCI_REG8(0xB3DA), 0x40},
> +       {CCI_REG8(0xB3DB), 0x40},
> +       {CCI_REG8(0xB3DC), 0x40},
> +       {CCI_REG8(0xB3DD), 0x40},
> +       {CCI_REG8(0xB3DE), 0x40},
> +       {CCI_REG8(0xB3DF), 0x40},
> +       {CCI_REG8(0xA4DC), 0x02},
> +       {CCI_REG8(0xA4DD), 0x12},
> +       {CCI_REG8(0xA68C), 0x34},
> +       {CCI_REG8(0xA68D), 0x00},
> +       {CCI_REG8(0xA68E), 0x00},
> +       {CCI_REG8(0xA690), 0x02},
> +       {CCI_REG8(0xA694), 0x01},
> +       {CCI_REG8(0xA695), 0x01},
> +       {CCI_REG8(0xA696), 0x01},
> +       {CCI_REG8(0xA8C8), 0x19},
> +       {CCI_REG8(0xA8C9), 0x00},
> +       {CCI_REG8(0xA8CA), 0x17},
> +       {CCI_REG8(0xA8CB), 0x00},
> +       {CCI_REG8(0xA8CC), 0x14},
> +       {CCI_REG8(0xA8CD), 0x00},
> +       {CCI_REG8(0xA8CE), 0x11},
> +       {CCI_REG8(0xA8CF), 0x00},
> +       {CCI_REG8(0xA8D0), 0x23},
> +       {CCI_REG8(0xA8D1), 0x00},
> +       {CCI_REG8(0xA8D2), 0x20},
> +       {CCI_REG8(0xA8D3), 0x00},
> +       {CCI_REG8(0xA8D4), 0x1C},
> +       {CCI_REG8(0xA8D5), 0x00},
> +       {CCI_REG8(0xA8D6), 0x18},
> +       {CCI_REG8(0xA8D7), 0x00},
> +       {CCI_REG8(0xA8D8), 0x31},
> +       {CCI_REG8(0xA8D9), 0x00},
> +       {CCI_REG8(0xA8DA), 0x2D},
> +       {CCI_REG8(0xA8DB), 0x00},
> +       {CCI_REG8(0xA8DC), 0x28},
> +       {CCI_REG8(0xA8DD), 0x00},
> +       {CCI_REG8(0xA8DE), 0x22},
> +       {CCI_REG8(0xA8DF), 0x00},
> +       {CCI_REG8(0xA8E0), 0x46},
> +       {CCI_REG8(0xA8E1), 0x00},
> +       {CCI_REG8(0xA8E2), 0x40},
> +       {CCI_REG8(0xA8E3), 0x00},
> +       {CCI_REG8(0xA8E4), 0x39},
> +       {CCI_REG8(0xA8E5), 0x00},
> +       {CCI_REG8(0xA8E6), 0x31},
> +       {CCI_REG8(0xA8E7), 0x00},
> +       {CCI_REG8(0xA8E8), 0x63},
> +       {CCI_REG8(0xA8E9), 0x00},
> +       {CCI_REG8(0xA8EA), 0x5A},
> +       {CCI_REG8(0xA8EB), 0x00},
> +       {CCI_REG8(0xA8EC), 0x50},
> +       {CCI_REG8(0xA8ED), 0x00},
> +       {CCI_REG8(0xA8EE), 0x45},
> +       {CCI_REG8(0xA8EF), 0x00},
> +       {CCI_REG8(0xA8F0), 0x8C},
> +       {CCI_REG8(0xA8F1), 0x00},
> +       {CCI_REG8(0xA8F2), 0x7F},
> +       {CCI_REG8(0xA8F3), 0x00},
> +       {CCI_REG8(0xA8F4), 0x71},
> +       {CCI_REG8(0xA8F5), 0x00},
> +       {CCI_REG8(0xA8F6), 0x61},
> +       {CCI_REG8(0xA8F7), 0x00},
> +       {CCI_REG8(0xA8F8), 0xC6},
> +       {CCI_REG8(0xA8F9), 0x00},
> +       {CCI_REG8(0xA8FA), 0xB4},
> +       {CCI_REG8(0xA8FB), 0x00},
> +       {CCI_REG8(0xA8FC), 0xA0},
> +       {CCI_REG8(0xA8FD), 0x00},
> +       {CCI_REG8(0xA8FE), 0x89},
> +       {CCI_REG8(0xA8FF), 0x00},
> +       {CCI_REG8(0xA900), 0x18},
> +       {CCI_REG8(0xA901), 0x01},
> +       {CCI_REG8(0xA902), 0xFF},
> +       {CCI_REG8(0xA903), 0x00},
> +       {CCI_REG8(0xA904), 0xE2},
> +       {CCI_REG8(0xA905), 0x00},
> +       {CCI_REG8(0xA906), 0xC2},
> +       {CCI_REG8(0xA907), 0x00},
> +       {CCI_REG8(0xA908), 0x80},
> +       {CCI_REG8(0xA909), 0x01},
> +       {CCI_REG8(0xA90A), 0x80},
> +       {CCI_REG8(0xA90B), 0x01},
> +       {CCI_REG8(0xA90C), 0x80},
> +       {CCI_REG8(0xA90D), 0x01},
> +       {CCI_REG8(0xA90E), 0x80},
> +       {CCI_REG8(0xA90F), 0x01},
> +       {CCI_REG8(0xA910), 0x80},
> +       {CCI_REG8(0xA911), 0x01},
> +       {CCI_REG8(0xA912), 0x80},
> +       {CCI_REG8(0xA913), 0x01},
> +       {CCI_REG8(0xA914), 0x80},
> +       {CCI_REG8(0xA915), 0x01},
> +       {CCI_REG8(0xA916), 0x80},
> +       {CCI_REG8(0xA917), 0x01},
> +       {CCI_REG8(0xA918), 0x80},
> +       {CCI_REG8(0xA919), 0x01},
> +       {CCI_REG8(0xA91A), 0x80},
> +       {CCI_REG8(0xA91B), 0x01},
> +       {CCI_REG8(0xA91C), 0x80},
> +       {CCI_REG8(0xA91D), 0x01},
> +       {CCI_REG8(0xA91E), 0x80},
> +       {CCI_REG8(0xA91F), 0x01},
> +       {CCI_REG8(0xA920), 0x80},
> +       {CCI_REG8(0xA921), 0x01},
> +       {CCI_REG8(0xA922), 0x80},
> +       {CCI_REG8(0xA923), 0x01},
> +       {CCI_REG8(0xA924), 0x80},
> +       {CCI_REG8(0xA925), 0x01},
> +       {CCI_REG8(0xA926), 0x80},
> +       {CCI_REG8(0xA927), 0x01},
> +       {CCI_REG8(0xA928), 0x02},
> +       {CCI_REG8(0xA929), 0x00},
> +       {CCI_REG8(0xA92A), 0x02},
> +       {CCI_REG8(0xA92B), 0x00},
> +       {CCI_REG8(0xA92C), 0x02},
> +       {CCI_REG8(0xA92D), 0x00},
> +       {CCI_REG8(0xA92E), 0x02},
> +       {CCI_REG8(0xA92F), 0x00},
> +       {CCI_REG8(0xA930), 0x02},
> +       {CCI_REG8(0xA931), 0x00},
> +       {CCI_REG8(0xA932), 0x02},
> +       {CCI_REG8(0xA933), 0x00},
> +       {CCI_REG8(0xA934), 0x02},
> +       {CCI_REG8(0xA935), 0x00},
> +       {CCI_REG8(0xA936), 0x02},
> +       {CCI_REG8(0xA937), 0x00},
> +       {CCI_REG8(0xA938), 0x02},
> +       {CCI_REG8(0xA939), 0x00},
> +       {CCI_REG8(0xA93A), 0x02},
> +       {CCI_REG8(0xA93B), 0x00},
> +       {CCI_REG8(0xA93C), 0x02},
> +       {CCI_REG8(0xA93D), 0x00},
> +       {CCI_REG8(0xA93E), 0x02},
> +       {CCI_REG8(0xA93F), 0x00},
> +       {CCI_REG8(0xA940), 0x02},
> +       {CCI_REG8(0xA941), 0x00},
> +       {CCI_REG8(0xA942), 0x02},
> +       {CCI_REG8(0xA943), 0x00},
> +       {CCI_REG8(0xA944), 0x02},
> +       {CCI_REG8(0xA945), 0x00},
> +       {CCI_REG8(0xA946), 0x02},
> +       {CCI_REG8(0xA947), 0x00},
> +       {CCI_REG8(0xA948), 0x40},
> +       {CCI_REG8(0xA949), 0x40},
> +       {CCI_REG8(0xA94A), 0x40},
> +       {CCI_REG8(0xA94B), 0x40},
> +       {CCI_REG8(0xA94C), 0x40},
> +       {CCI_REG8(0xA94D), 0x40},
> +       {CCI_REG8(0xA94E), 0x40},
> +       {CCI_REG8(0xA94F), 0x40},
> +       {CCI_REG8(0xA950), 0x40},
> +       {CCI_REG8(0xA951), 0x40},
> +       {CCI_REG8(0xA952), 0x40},
> +       {CCI_REG8(0xA953), 0x40},
> +       {CCI_REG8(0xA954), 0x40},
> +       {CCI_REG8(0xA955), 0x40},
> +       {CCI_REG8(0xA956), 0x40},
> +       {CCI_REG8(0xA957), 0x40},
> +       {CCI_REG8(0xA960), 0x03},
> +       {CCI_REG8(0xA961), 0x00},
> +       {CCI_REG8(0xA962), 0x03},
> +       {CCI_REG8(0xA963), 0x00},
> +       {CCI_REG8(0xA964), 0x03},
> +       {CCI_REG8(0xA965), 0x00},
> +       {CCI_REG8(0xA966), 0x03},
> +       {CCI_REG8(0xA967), 0x00},
> +       {CCI_REG8(0xA968), 0x05},
> +       {CCI_REG8(0xA969), 0x00},
> +       {CCI_REG8(0xA96A), 0x05},
> +       {CCI_REG8(0xA96B), 0x00},
> +       {CCI_REG8(0xA96C), 0x05},
> +       {CCI_REG8(0xA96D), 0x00},
> +       {CCI_REG8(0xA96E), 0x05},
> +       {CCI_REG8(0xA96F), 0x00},
> +       {CCI_REG8(0xA970), 0x07},
> +       {CCI_REG8(0xA971), 0x00},
> +       {CCI_REG8(0xA972), 0x07},
> +       {CCI_REG8(0xA973), 0x00},
> +       {CCI_REG8(0xA974), 0x07},
> +       {CCI_REG8(0xA975), 0x00},
> +       {CCI_REG8(0xA976), 0x07},
> +       {CCI_REG8(0xA977), 0x00},
> +       {CCI_REG8(0xA978), 0x09},
> +       {CCI_REG8(0xA979), 0x00},
> +       {CCI_REG8(0xA97A), 0x09},
> +       {CCI_REG8(0xA97B), 0x00},
> +       {CCI_REG8(0xA97C), 0x09},
> +       {CCI_REG8(0xA97D), 0x00},
> +       {CCI_REG8(0xA97E), 0x09},
> +       {CCI_REG8(0xA97F), 0x00},
> +       {CCI_REG8(0xA980), 0x0D},
> +       {CCI_REG8(0xA981), 0x00},
> +       {CCI_REG8(0xA982), 0x0D},
> +       {CCI_REG8(0xA983), 0x00},
> +       {CCI_REG8(0xA984), 0x0D},
> +       {CCI_REG8(0xA985), 0x00},
> +       {CCI_REG8(0xA986), 0x0D},
> +       {CCI_REG8(0xA987), 0x00},
> +       {CCI_REG8(0xA988), 0x13},
> +       {CCI_REG8(0xA989), 0x00},
> +       {CCI_REG8(0xA98A), 0x13},
> +       {CCI_REG8(0xA98B), 0x00},
> +       {CCI_REG8(0xA98C), 0x13},
> +       {CCI_REG8(0xA98D), 0x00},
> +       {CCI_REG8(0xA98E), 0x13},
> +       {CCI_REG8(0xA98F), 0x00},
> +       {CCI_REG8(0xA990), 0x1A},
> +       {CCI_REG8(0xA991), 0x00},
> +       {CCI_REG8(0xA992), 0x1A},
> +       {CCI_REG8(0xA993), 0x00},
> +       {CCI_REG8(0xA994), 0x1A},
> +       {CCI_REG8(0xA995), 0x00},
> +       {CCI_REG8(0xA996), 0x1A},
> +       {CCI_REG8(0xA997), 0x00},
> +       {CCI_REG8(0xA998), 0x25},
> +       {CCI_REG8(0xA999), 0x00},
> +       {CCI_REG8(0xA99A), 0x25},
> +       {CCI_REG8(0xA99B), 0x00},
> +       {CCI_REG8(0xA99C), 0x25},
> +       {CCI_REG8(0xA99D), 0x00},
> +       {CCI_REG8(0xA99E), 0x25},
> +       {CCI_REG8(0xA99F), 0x00},
> +       {CCI_REG8(0xA9A0), 0x80},
> +       {CCI_REG8(0xA9A1), 0x01},
> +       {CCI_REG8(0xA9A2), 0x80},
> +       {CCI_REG8(0xA9A3), 0x01},
> +       {CCI_REG8(0xA9A4), 0x80},
> +       {CCI_REG8(0xA9A5), 0x01},
> +       {CCI_REG8(0xA9A6), 0x80},
> +       {CCI_REG8(0xA9A7), 0x01},
> +       {CCI_REG8(0xA9A8), 0x80},
> +       {CCI_REG8(0xA9A9), 0x01},
> +       {CCI_REG8(0xA9AA), 0x80},
> +       {CCI_REG8(0xA9AB), 0x01},
> +       {CCI_REG8(0xA9AC), 0x80},
> +       {CCI_REG8(0xA9AD), 0x01},
> +       {CCI_REG8(0xA9AE), 0x80},
> +       {CCI_REG8(0xA9AF), 0x01},
> +       {CCI_REG8(0xA9B0), 0x80},
> +       {CCI_REG8(0xA9B1), 0x01},
> +       {CCI_REG8(0xA9B2), 0x80},
> +       {CCI_REG8(0xA9B3), 0x01},
> +       {CCI_REG8(0xA9B4), 0x80},
> +       {CCI_REG8(0xA9B5), 0x01},
> +       {CCI_REG8(0xA9B6), 0x80},
> +       {CCI_REG8(0xA9B7), 0x01},
> +       {CCI_REG8(0xA9B8), 0x80},
> +       {CCI_REG8(0xA9B9), 0x01},
> +       {CCI_REG8(0xA9BA), 0x80},
> +       {CCI_REG8(0xA9BB), 0x01},
> +       {CCI_REG8(0xA9BC), 0x80},
> +       {CCI_REG8(0xA9BD), 0x01},
> +       {CCI_REG8(0xA9BE), 0x80},
> +       {CCI_REG8(0xA9BF), 0x01},
> +       {CCI_REG8(0xA9C0), 0x02},
> +       {CCI_REG8(0xA9C1), 0x00},
> +       {CCI_REG8(0xA9C2), 0x02},
> +       {CCI_REG8(0xA9C3), 0x00},
> +       {CCI_REG8(0xA9C4), 0x02},
> +       {CCI_REG8(0xA9C5), 0x00},
> +       {CCI_REG8(0xA9C6), 0x02},
> +       {CCI_REG8(0xA9C7), 0x00},
> +       {CCI_REG8(0xA9C8), 0x02},
> +       {CCI_REG8(0xA9C9), 0x00},
> +       {CCI_REG8(0xA9CA), 0x02},
> +       {CCI_REG8(0xA9CB), 0x00},
> +       {CCI_REG8(0xA9CC), 0x02},
> +       {CCI_REG8(0xA9CD), 0x00},
> +       {CCI_REG8(0xA9CE), 0x02},
> +       {CCI_REG8(0xA9CF), 0x00},
> +       {CCI_REG8(0xA9D0), 0x02},
> +       {CCI_REG8(0xA9D1), 0x00},
> +       {CCI_REG8(0xA9D2), 0x02},
> +       {CCI_REG8(0xA9D3), 0x00},
> +       {CCI_REG8(0xA9D4), 0x02},
> +       {CCI_REG8(0xA9D5), 0x00},
> +       {CCI_REG8(0xA9D6), 0x02},
> +       {CCI_REG8(0xA9D7), 0x00},
> +       {CCI_REG8(0xA9D8), 0x02},
> +       {CCI_REG8(0xA9D9), 0x00},
> +       {CCI_REG8(0xA9DA), 0x02},
> +       {CCI_REG8(0xA9DB), 0x00},
> +       {CCI_REG8(0xA9DC), 0x02},
> +       {CCI_REG8(0xA9DD), 0x00},
> +       {CCI_REG8(0xA9DE), 0x02},
> +       {CCI_REG8(0xA9DF), 0x00},
> +       {CCI_REG8(0xA9E0), 0x40},
> +       {CCI_REG8(0xA9E1), 0x40},
> +       {CCI_REG8(0xA9E2), 0x40},
> +       {CCI_REG8(0xA9E3), 0x40},
> +       {CCI_REG8(0xA9E4), 0x40},
> +       {CCI_REG8(0xA9E5), 0x40},
> +       {CCI_REG8(0xA9E6), 0x40},
> +       {CCI_REG8(0xA9E7), 0x40},
> +       {CCI_REG8(0xA9E8), 0x40},
> +       {CCI_REG8(0xA9E9), 0x40},
> +       {CCI_REG8(0xA9EA), 0x40},
> +       {CCI_REG8(0xA9EB), 0x40},
> +       {CCI_REG8(0xA9EC), 0x40},
> +       {CCI_REG8(0xA9ED), 0x40},
> +       {CCI_REG8(0xA9EE), 0x40},
> +       {CCI_REG8(0xA9EF), 0x40},
> +       {CCI_REG8(0xA9F8), 0x02},
> +       {CCI_REG8(0xA9F9), 0x00},
> +       {CCI_REG8(0xA9FA), 0x02},
> +       {CCI_REG8(0xA9FB), 0x00},
> +       {CCI_REG8(0xA9FC), 0x02},
> +       {CCI_REG8(0xA9FD), 0x00},
> +       {CCI_REG8(0xA9FE), 0x02},
> +       {CCI_REG8(0xA9FF), 0x00},
> +       {CCI_REG8(0xAA00), 0x03},
> +       {CCI_REG8(0xAA01), 0x00},
> +       {CCI_REG8(0xAA02), 0x03},
> +       {CCI_REG8(0xAA03), 0x00},
> +       {CCI_REG8(0xAA04), 0x03},
> +       {CCI_REG8(0xAA05), 0x00},
> +       {CCI_REG8(0xAA06), 0x03},
> +       {CCI_REG8(0xAA07), 0x00},
> +       {CCI_REG8(0xAA08), 0x04},
> +       {CCI_REG8(0xAA09), 0x00},
> +       {CCI_REG8(0xAA0A), 0x04},
> +       {CCI_REG8(0xAA0B), 0x00},
> +       {CCI_REG8(0xAA0C), 0x04},
> +       {CCI_REG8(0xAA0D), 0x00},
> +       {CCI_REG8(0xAA0E), 0x04},
> +       {CCI_REG8(0xAA0F), 0x00},
> +       {CCI_REG8(0xAA10), 0x06},
> +       {CCI_REG8(0xAA11), 0x00},
> +       {CCI_REG8(0xAA12), 0x06},
> +       {CCI_REG8(0xAA13), 0x00},
> +       {CCI_REG8(0xAA14), 0x06},
> +       {CCI_REG8(0xAA15), 0x00},
> +       {CCI_REG8(0xAA16), 0x06},
> +       {CCI_REG8(0xAA17), 0x00},
> +       {CCI_REG8(0xAA18), 0x09},
> +       {CCI_REG8(0xAA19), 0x00},
> +       {CCI_REG8(0xAA1A), 0x09},
> +       {CCI_REG8(0xAA1B), 0x00},
> +       {CCI_REG8(0xAA1C), 0x09},
> +       {CCI_REG8(0xAA1D), 0x00},
> +       {CCI_REG8(0xAA1E), 0x09},
> +       {CCI_REG8(0xAA1F), 0x00},
> +       {CCI_REG8(0xAA20), 0x0C},
> +       {CCI_REG8(0xAA21), 0x00},
> +       {CCI_REG8(0xAA22), 0x0C},
> +       {CCI_REG8(0xAA23), 0x00},
> +       {CCI_REG8(0xAA24), 0x0C},
> +       {CCI_REG8(0xAA25), 0x00},
> +       {CCI_REG8(0xAA26), 0x0C},
> +       {CCI_REG8(0xAA27), 0x00},
> +       {CCI_REG8(0xAA28), 0x12},
> +       {CCI_REG8(0xAA29), 0x00},
> +       {CCI_REG8(0xAA2A), 0x12},
> +       {CCI_REG8(0xAA2B), 0x00},
> +       {CCI_REG8(0xAA2C), 0x12},
> +       {CCI_REG8(0xAA2D), 0x00},
> +       {CCI_REG8(0xAA2E), 0x12},
> +       {CCI_REG8(0xAA2F), 0x00},
> +       {CCI_REG8(0xAA30), 0x19},
> +       {CCI_REG8(0xAA31), 0x00},
> +       {CCI_REG8(0xAA32), 0x19},
> +       {CCI_REG8(0xAA33), 0x00},
> +       {CCI_REG8(0xAA34), 0x19},
> +       {CCI_REG8(0xAA35), 0x00},
> +       {CCI_REG8(0xAA36), 0x19},
> +       {CCI_REG8(0xAA37), 0x00},
> +       {CCI_REG8(0xAA38), 0x80},
> +       {CCI_REG8(0xAA39), 0x01},
> +       {CCI_REG8(0xAA3A), 0x80},
> +       {CCI_REG8(0xAA3B), 0x01},
> +       {CCI_REG8(0xAA3C), 0x80},
> +       {CCI_REG8(0xAA3D), 0x01},
> +       {CCI_REG8(0xAA3E), 0x80},
> +       {CCI_REG8(0xAA3F), 0x01},
> +       {CCI_REG8(0xAA40), 0x80},
> +       {CCI_REG8(0xAA41), 0x01},
> +       {CCI_REG8(0xAA42), 0x80},
> +       {CCI_REG8(0xAA43), 0x01},
> +       {CCI_REG8(0xAA44), 0x80},
> +       {CCI_REG8(0xAA45), 0x01},
> +       {CCI_REG8(0xAA46), 0x80},
> +       {CCI_REG8(0xAA47), 0x01},
> +       {CCI_REG8(0xAA48), 0x80},
> +       {CCI_REG8(0xAA49), 0x01},
> +       {CCI_REG8(0xAA4A), 0x80},
> +       {CCI_REG8(0xAA4B), 0x01},
> +       {CCI_REG8(0xAA4C), 0x80},
> +       {CCI_REG8(0xAA4D), 0x01},
> +       {CCI_REG8(0xAA4E), 0x80},
> +       {CCI_REG8(0xAA4F), 0x01},
> +       {CCI_REG8(0xAA50), 0x80},
> +       {CCI_REG8(0xAA51), 0x01},
> +       {CCI_REG8(0xAA52), 0x80},
> +       {CCI_REG8(0xAA53), 0x01},
> +       {CCI_REG8(0xAA54), 0x80},
> +       {CCI_REG8(0xAA55), 0x01},
> +       {CCI_REG8(0xAA56), 0x80},
> +       {CCI_REG8(0xAA57), 0x01},
> +       {CCI_REG8(0xAA58), 0x02},
> +       {CCI_REG8(0xAA59), 0x00},
> +       {CCI_REG8(0xAA5A), 0x02},
> +       {CCI_REG8(0xAA5B), 0x00},
> +       {CCI_REG8(0xAA5C), 0x02},
> +       {CCI_REG8(0xAA5D), 0x00},
> +       {CCI_REG8(0xAA5E), 0x02},
> +       {CCI_REG8(0xAA5F), 0x00},
> +       {CCI_REG8(0xAA60), 0x02},
> +       {CCI_REG8(0xAA61), 0x00},
> +       {CCI_REG8(0xAA62), 0x02},
> +       {CCI_REG8(0xAA63), 0x00},
> +       {CCI_REG8(0xAA64), 0x02},
> +       {CCI_REG8(0xAA65), 0x00},
> +       {CCI_REG8(0xAA66), 0x02},
> +       {CCI_REG8(0xAA67), 0x00},
> +       {CCI_REG8(0xAA68), 0x02},
> +       {CCI_REG8(0xAA69), 0x00},
> +       {CCI_REG8(0xAA6A), 0x02},
> +       {CCI_REG8(0xAA6B), 0x00},
> +       {CCI_REG8(0xAA6C), 0x02},
> +       {CCI_REG8(0xAA6D), 0x00},
> +       {CCI_REG8(0xAA6E), 0x02},
> +       {CCI_REG8(0xAA6F), 0x00},
> +       {CCI_REG8(0xAA70), 0x02},
> +       {CCI_REG8(0xAA71), 0x00},
> +       {CCI_REG8(0xAA72), 0x02},
> +       {CCI_REG8(0xAA73), 0x00},
> +       {CCI_REG8(0xAA74), 0x02},
> +       {CCI_REG8(0xAA75), 0x00},
> +       {CCI_REG8(0xAA76), 0x02},
> +       {CCI_REG8(0xAA77), 0x00},
> +       {CCI_REG8(0xAA78), 0x40},
> +       {CCI_REG8(0xAA79), 0x40},
> +       {CCI_REG8(0xAA7A), 0x40},
> +       {CCI_REG8(0xAA7B), 0x40},
> +       {CCI_REG8(0xAA7C), 0x40},
> +       {CCI_REG8(0xAA7D), 0x40},
> +       {CCI_REG8(0xAA7E), 0x40},
> +       {CCI_REG8(0xAA7F), 0x40},
> +       {CCI_REG8(0xAA80), 0x40},
> +       {CCI_REG8(0xAA81), 0x40},
> +       {CCI_REG8(0xAA82), 0x40},
> +       {CCI_REG8(0xAA83), 0x40},
> +       {CCI_REG8(0xAA84), 0x40},
> +       {CCI_REG8(0xAA85), 0x40},
> +       {CCI_REG8(0xAA86), 0x40},
> +       {CCI_REG8(0xAA87), 0x40},
> +       {CCI_REG8(0xAA90), 0x00},
> +       {CCI_REG8(0xAA91), 0x00},
> +       {CCI_REG8(0xAA92), 0x00},
> +       {CCI_REG8(0xAA93), 0x00},
> +       {CCI_REG8(0xAA94), 0x00},
> +       {CCI_REG8(0xAA95), 0x00},
> +       {CCI_REG8(0xAA96), 0x00},
> +       {CCI_REG8(0xAA97), 0x00},
> +       {CCI_REG8(0xAA98), 0x01},
> +       {CCI_REG8(0xAA99), 0x00},
> +       {CCI_REG8(0xAA9A), 0x01},
> +       {CCI_REG8(0xAA9B), 0x00},
> +       {CCI_REG8(0xAA9C), 0x01},
> +       {CCI_REG8(0xAA9D), 0x00},
> +       {CCI_REG8(0xAA9E), 0x01},
> +       {CCI_REG8(0xAA9F), 0x00},
> +       {CCI_REG8(0xAAA0), 0x01},
> +       {CCI_REG8(0xAAA1), 0x00},
> +       {CCI_REG8(0xAAA2), 0x01},
> +       {CCI_REG8(0xAAA3), 0x00},
> +       {CCI_REG8(0xAAA4), 0x01},
> +       {CCI_REG8(0xAAA5), 0x00},
> +       {CCI_REG8(0xAAA6), 0x01},
> +       {CCI_REG8(0xAAA7), 0x00},
> +       {CCI_REG8(0xAAA8), 0x03},
> +       {CCI_REG8(0xAAA9), 0x00},
> +       {CCI_REG8(0xAAAA), 0x03},
> +       {CCI_REG8(0xAAAB), 0x00},
> +       {CCI_REG8(0xAAAC), 0x03},
> +       {CCI_REG8(0xAAAD), 0x00},
> +       {CCI_REG8(0xAAAE), 0x03},
> +       {CCI_REG8(0xAAAF), 0x00},
> +       {CCI_REG8(0xAAB0), 0x06},
> +       {CCI_REG8(0xAAB1), 0x00},
> +       {CCI_REG8(0xAAB2), 0x06},
> +       {CCI_REG8(0xAAB3), 0x00},
> +       {CCI_REG8(0xAAB4), 0x06},
> +       {CCI_REG8(0xAAB5), 0x00},
> +       {CCI_REG8(0xAAB6), 0x06},
> +       {CCI_REG8(0xAAB7), 0x00},
> +       {CCI_REG8(0xAAB8), 0x0B},
> +       {CCI_REG8(0xAAB9), 0x00},
> +       {CCI_REG8(0xAABA), 0x0B},
> +       {CCI_REG8(0xAABB), 0x00},
> +       {CCI_REG8(0xAABC), 0x0B},
> +       {CCI_REG8(0xAABD), 0x00},
> +       {CCI_REG8(0xAABE), 0x0B},
> +       {CCI_REG8(0xAABF), 0x00},
> +       {CCI_REG8(0xAAC0), 0x17},
> +       {CCI_REG8(0xAAC1), 0x00},
> +       {CCI_REG8(0xAAC2), 0x17},
> +       {CCI_REG8(0xAAC3), 0x00},
> +       {CCI_REG8(0xAAC4), 0x17},
> +       {CCI_REG8(0xAAC5), 0x00},
> +       {CCI_REG8(0xAAC6), 0x17},
> +       {CCI_REG8(0xAAC7), 0x00},
> +       {CCI_REG8(0xAAC8), 0x2E},
> +       {CCI_REG8(0xAAC9), 0x00},
> +       {CCI_REG8(0xAACA), 0x2E},
> +       {CCI_REG8(0xAACB), 0x00},
> +       {CCI_REG8(0xAACC), 0x2E},
> +       {CCI_REG8(0xAACD), 0x00},
> +       {CCI_REG8(0xAACE), 0x2E},
> +       {CCI_REG8(0xAACF), 0x00},
> +       {CCI_REG8(0xAAD0), 0x80},
> +       {CCI_REG8(0xAAD1), 0x01},
> +       {CCI_REG8(0xAAD2), 0x80},
> +       {CCI_REG8(0xAAD3), 0x01},
> +       {CCI_REG8(0xAAD4), 0x80},
> +       {CCI_REG8(0xAAD5), 0x01},
> +       {CCI_REG8(0xAAD6), 0x80},
> +       {CCI_REG8(0xAAD7), 0x01},
> +       {CCI_REG8(0xAAD8), 0x80},
> +       {CCI_REG8(0xAAD9), 0x01},
> +       {CCI_REG8(0xAADA), 0x80},
> +       {CCI_REG8(0xAADB), 0x01},
> +       {CCI_REG8(0xAADC), 0x80},
> +       {CCI_REG8(0xAADD), 0x01},
> +       {CCI_REG8(0xAADE), 0x80},
> +       {CCI_REG8(0xAADF), 0x01},
> +       {CCI_REG8(0xAAE0), 0x80},
> +       {CCI_REG8(0xAAE1), 0x01},
> +       {CCI_REG8(0xAAE2), 0x80},
> +       {CCI_REG8(0xAAE3), 0x01},
> +       {CCI_REG8(0xAAE4), 0x80},
> +       {CCI_REG8(0xAAE5), 0x01},
> +       {CCI_REG8(0xAAE6), 0x80},
> +       {CCI_REG8(0xAAE7), 0x01},
> +       {CCI_REG8(0xAAE8), 0x80},
> +       {CCI_REG8(0xAAE9), 0x01},
> +       {CCI_REG8(0xAAEA), 0x80},
> +       {CCI_REG8(0xAAEB), 0x01},
> +       {CCI_REG8(0xAAEC), 0x80},
> +       {CCI_REG8(0xAAED), 0x01},
> +       {CCI_REG8(0xAAEE), 0x80},
> +       {CCI_REG8(0xAAEF), 0x01},
> +       {CCI_REG8(0xAAF0), 0x0A},
> +       {CCI_REG8(0xAAF1), 0x00},
> +       {CCI_REG8(0xAAF2), 0x0A},
> +       {CCI_REG8(0xAAF3), 0x00},
> +       {CCI_REG8(0xAAF4), 0x0A},
> +       {CCI_REG8(0xAAF5), 0x00},
> +       {CCI_REG8(0xAAF6), 0x0A},
> +       {CCI_REG8(0xAAF7), 0x00},
> +       {CCI_REG8(0xAAF8), 0x0A},
> +       {CCI_REG8(0xAAF9), 0x00},
> +       {CCI_REG8(0xAAFA), 0x0A},
> +       {CCI_REG8(0xAAFB), 0x00},
> +       {CCI_REG8(0xAAFC), 0x0A},
> +       {CCI_REG8(0xAAFD), 0x00},
> +       {CCI_REG8(0xAAFE), 0x0A},
> +       {CCI_REG8(0xAAFF), 0x00},
> +       {CCI_REG8(0xAB00), 0x0A},
> +       {CCI_REG8(0xAB01), 0x00},
> +       {CCI_REG8(0xAB02), 0x0A},
> +       {CCI_REG8(0xAB03), 0x00},
> +       {CCI_REG8(0xAB04), 0x0A},
> +       {CCI_REG8(0xAB05), 0x00},
> +       {CCI_REG8(0xAB06), 0x0A},
> +       {CCI_REG8(0xAB07), 0x00},
> +       {CCI_REG8(0xAB08), 0x0A},
> +       {CCI_REG8(0xAB09), 0x00},
> +       {CCI_REG8(0xAB0A), 0x0A},
> +       {CCI_REG8(0xAB0B), 0x00},
> +       {CCI_REG8(0xAB0C), 0x0A},
> +       {CCI_REG8(0xAB0D), 0x00},
> +       {CCI_REG8(0xAB0E), 0x0A},
> +       {CCI_REG8(0xAB0F), 0x00},
> +       {CCI_REG8(0xAB10), 0x40},
> +       {CCI_REG8(0xAB11), 0x40},
> +       {CCI_REG8(0xAB12), 0x40},
> +       {CCI_REG8(0xAB13), 0x40},
> +       {CCI_REG8(0xAB14), 0x40},
> +       {CCI_REG8(0xAB15), 0x40},
> +       {CCI_REG8(0xAB16), 0x40},
> +       {CCI_REG8(0xAB17), 0x40},
> +       {CCI_REG8(0xAB18), 0x40},
> +       {CCI_REG8(0xAB19), 0x40},
> +       {CCI_REG8(0xAB1A), 0x40},
> +       {CCI_REG8(0xAB1B), 0x40},
> +       {CCI_REG8(0xAB1C), 0x40},
> +       {CCI_REG8(0xAB1D), 0x40},
> +       {CCI_REG8(0xAB1E), 0x40},
> +       {CCI_REG8(0xAB1F), 0x40},
> +       {CCI_REG8(0xAB28), 0x03},
> +       {CCI_REG8(0xAB29), 0x00},
> +       {CCI_REG8(0xAB2A), 0x03},
> +       {CCI_REG8(0xAB2B), 0x00},
> +       {CCI_REG8(0xAB2C), 0x03},
> +       {CCI_REG8(0xAB2D), 0x00},
> +       {CCI_REG8(0xAB2E), 0x03},
> +       {CCI_REG8(0xAB2F), 0x00},
> +       {CCI_REG8(0xAB30), 0x05},
> +       {CCI_REG8(0xAB31), 0x00},
> +       {CCI_REG8(0xAB32), 0x05},
> +       {CCI_REG8(0xAB33), 0x00},
> +       {CCI_REG8(0xAB34), 0x05},
> +       {CCI_REG8(0xAB35), 0x00},
> +       {CCI_REG8(0xAB36), 0x05},
> +       {CCI_REG8(0xAB37), 0x00},
> +       {CCI_REG8(0xAB38), 0x07},
> +       {CCI_REG8(0xAB39), 0x00},
> +       {CCI_REG8(0xAB3A), 0x07},
> +       {CCI_REG8(0xAB3B), 0x00},
> +       {CCI_REG8(0xAB3C), 0x07},
> +       {CCI_REG8(0xAB3D), 0x00},
> +       {CCI_REG8(0xAB3E), 0x07},
> +       {CCI_REG8(0xAB3F), 0x00},
> +       {CCI_REG8(0xAB40), 0x0A},
> +       {CCI_REG8(0xAB41), 0x00},
> +       {CCI_REG8(0xAB42), 0x0A},
> +       {CCI_REG8(0xAB43), 0x00},
> +       {CCI_REG8(0xAB44), 0x0A},
> +       {CCI_REG8(0xAB45), 0x00},
> +       {CCI_REG8(0xAB46), 0x0A},
> +       {CCI_REG8(0xAB47), 0x00},
> +       {CCI_REG8(0xAB48), 0x0E},
> +       {CCI_REG8(0xAB49), 0x00},
> +       {CCI_REG8(0xAB4A), 0x0E},
> +       {CCI_REG8(0xAB4B), 0x00},
> +       {CCI_REG8(0xAB4C), 0x0E},
> +       {CCI_REG8(0xAB4D), 0x00},
> +       {CCI_REG8(0xAB4E), 0x0E},
> +       {CCI_REG8(0xAB4F), 0x00},
> +       {CCI_REG8(0xAB50), 0x13},
> +       {CCI_REG8(0xAB51), 0x00},
> +       {CCI_REG8(0xAB52), 0x13},
> +       {CCI_REG8(0xAB53), 0x00},
> +       {CCI_REG8(0xAB54), 0x13},
> +       {CCI_REG8(0xAB55), 0x00},
> +       {CCI_REG8(0xAB56), 0x13},
> +       {CCI_REG8(0xAB57), 0x00},
> +       {CCI_REG8(0xAB58), 0x1B},
> +       {CCI_REG8(0xAB59), 0x00},
> +       {CCI_REG8(0xAB5A), 0x1B},
> +       {CCI_REG8(0xAB5B), 0x00},
> +       {CCI_REG8(0xAB5C), 0x1B},
> +       {CCI_REG8(0xAB5D), 0x00},
> +       {CCI_REG8(0xAB5E), 0x1B},
> +       {CCI_REG8(0xAB5F), 0x00},
> +       {CCI_REG8(0xAB60), 0x26},
> +       {CCI_REG8(0xAB61), 0x00},
> +       {CCI_REG8(0xAB62), 0x26},
> +       {CCI_REG8(0xAB63), 0x00},
> +       {CCI_REG8(0xAB64), 0x26},
> +       {CCI_REG8(0xAB65), 0x00},
> +       {CCI_REG8(0xAB66), 0x26},
> +       {CCI_REG8(0xAB67), 0x00},
> +       {CCI_REG8(0xAB68), 0x80},
> +       {CCI_REG8(0xAB69), 0x01},
> +       {CCI_REG8(0xAB6A), 0x80},
> +       {CCI_REG8(0xAB6B), 0x01},
> +       {CCI_REG8(0xAB6C), 0x80},
> +       {CCI_REG8(0xAB6D), 0x01},
> +       {CCI_REG8(0xAB6E), 0x80},
> +       {CCI_REG8(0xAB6F), 0x01},
> +       {CCI_REG8(0xAB70), 0x80},
> +       {CCI_REG8(0xAB71), 0x01},
> +       {CCI_REG8(0xAB72), 0x80},
> +       {CCI_REG8(0xAB73), 0x01},
> +       {CCI_REG8(0xAB74), 0x80},
> +       {CCI_REG8(0xAB75), 0x01},
> +       {CCI_REG8(0xAB76), 0x80},
> +       {CCI_REG8(0xAB77), 0x01},
> +       {CCI_REG8(0xAB78), 0x80},
> +       {CCI_REG8(0xAB79), 0x01},
> +       {CCI_REG8(0xAB7A), 0x80},
> +       {CCI_REG8(0xAB7B), 0x01},
> +       {CCI_REG8(0xAB7C), 0x80},
> +       {CCI_REG8(0xAB7D), 0x01},
> +       {CCI_REG8(0xAB7E), 0x80},
> +       {CCI_REG8(0xAB7F), 0x01},
> +       {CCI_REG8(0xAB80), 0x80},
> +       {CCI_REG8(0xAB81), 0x01},
> +       {CCI_REG8(0xAB82), 0x80},
> +       {CCI_REG8(0xAB83), 0x01},
> +       {CCI_REG8(0xAB84), 0x80},
> +       {CCI_REG8(0xAB85), 0x01},
> +       {CCI_REG8(0xAB86), 0x80},
> +       {CCI_REG8(0xAB87), 0x01},
> +       {CCI_REG8(0xAB88), 0x02},
> +       {CCI_REG8(0xAB89), 0x00},
> +       {CCI_REG8(0xAB8A), 0x02},
> +       {CCI_REG8(0xAB8B), 0x00},
> +       {CCI_REG8(0xAB8C), 0x02},
> +       {CCI_REG8(0xAB8D), 0x00},
> +       {CCI_REG8(0xAB8E), 0x02},
> +       {CCI_REG8(0xAB8F), 0x00},
> +       {CCI_REG8(0xAB90), 0x02},
> +       {CCI_REG8(0xAB91), 0x00},
> +       {CCI_REG8(0xAB92), 0x02},
> +       {CCI_REG8(0xAB93), 0x00},
> +       {CCI_REG8(0xAB94), 0x02},
> +       {CCI_REG8(0xAB95), 0x00},
> +       {CCI_REG8(0xAB96), 0x02},
> +       {CCI_REG8(0xAB97), 0x00},
> +       {CCI_REG8(0xAB98), 0x02},
> +       {CCI_REG8(0xAB99), 0x00},
> +       {CCI_REG8(0xAB9A), 0x02},
> +       {CCI_REG8(0xAB9B), 0x00},
> +       {CCI_REG8(0xAB9C), 0x02},
> +       {CCI_REG8(0xAB9D), 0x00},
> +       {CCI_REG8(0xAB9E), 0x02},
> +       {CCI_REG8(0xAB9F), 0x00},
> +       {CCI_REG8(0xABA0), 0x02},
> +       {CCI_REG8(0xABA1), 0x00},
> +       {CCI_REG8(0xABA2), 0x02},
> +       {CCI_REG8(0xABA3), 0x00},
> +       {CCI_REG8(0xABA4), 0x02},
> +       {CCI_REG8(0xABA5), 0x00},
> +       {CCI_REG8(0xABA6), 0x02},
> +       {CCI_REG8(0xABA7), 0x00},
> +       {CCI_REG8(0xABA8), 0x40},
> +       {CCI_REG8(0xABA9), 0x40},
> +       {CCI_REG8(0xABAA), 0x40},
> +       {CCI_REG8(0xABAB), 0x40},
> +       {CCI_REG8(0xABAC), 0x40},
> +       {CCI_REG8(0xABAD), 0x40},
> +       {CCI_REG8(0xABAE), 0x40},
> +       {CCI_REG8(0xABAF), 0x40},
> +       {CCI_REG8(0xABB0), 0x40},
> +       {CCI_REG8(0xABB1), 0x40},
> +       {CCI_REG8(0xABB2), 0x40},
> +       {CCI_REG8(0xABB3), 0x40},
> +       {CCI_REG8(0xABB4), 0x40},
> +       {CCI_REG8(0xABB5), 0x40},
> +       {CCI_REG8(0xABB6), 0x40},
> +       {CCI_REG8(0xABB7), 0x40},
> +       {CCI_REG8(0xA69C), 0x01},
> +       {CCI_REG8(0xA69D), 0x01},
> +       {CCI_REG8(0xA69E), 0x01},
> +       {CCI_REG8(0xA69F), 0x01},
> +       {CCI_REG8(0xA6A0), 0x01},
> +       {CCI_REG8(0xA6A1), 0x01},
> +       {CCI_REG8(0xB1B0), 0x00},
> +       {CCI_REG8(0xB1B1), 0xF0},
> +       {CCI_REG8(0x1808), 0x00},

IMX728_REG_AWB_EN

> +       {CCI_REG8(0x179C), 0x02},
> +       {CCI_REG8(0x179D), 0x03},
> +       {CCI_REG8(0x179E), 0x01},
> +       {CCI_REG8(0x179F), 0x03},
> +       {CCI_REG8(0x17A0), 0x03},
> +       {CCI_REG8(0x17A1), 0x01},
> +       {CCI_REG8(0x17A2), 0x03},
> +       {CCI_REG8(0x17A3), 0x03},
> +       {CCI_REG8(0x17A4), 0x01},
> +       {CCI_REG8(0x17A5), 0x03},
> +       {CCI_REG8(0x17A6), 0x03},
> +       {CCI_REG8(0x17A7), 0x01},
> +       {CCI_REG8(0x17A8), 0x03},
> +       {CCI_REG8(0x17A9), 0x03},
> +       {CCI_REG8(0x17AA), 0x01},
> +       {CCI_REG8(0x17AB), 0x03},
> +       {CCI_REG8(0x17F2), 0x01},
> +       {CCI_REG8(0x17F4), 0x01},
> +       {CCI_REG8(0x17F6), 0xFF},
> +       {CCI_REG8(0x17F7), 0x0F},
> +       {CCI_REG8(0x1792), 0x01},
> +       {CCI_REG8(0x1794), 0x01},
> +       {CCI_REG8(0x1796), 0x01},
> +       {CCI_REG8(0x1798), 0x01},
> +       {CCI_REG8(0x179A), 0x01},
> +       {CCI_REG8(0x16DD), 0x01},
> +       {CCI_REG8(0x16EC), 0x01},
> +       {CCI_REG8(0x16ED), 0x01},
> +       {CCI_REG8(0xA198), 0x00},
> +       {CCI_REG8(0xA199), 0x00},
> +       {CCI_REG8(0xA19A), 0x00},
> +       {CCI_REG8(0xA1A0), 0x3C},
> +       {CCI_REG8(0xA1A1), 0x0C},
> +       {CCI_REG8(0xA1A2), 0x00},
> +       {CCI_REG8(0xA1A8), 0x0C},
> +       {CCI_REG8(0xA1A9), 0x9D},
> +       {CCI_REG8(0xA1AA), 0x01},
> +       {CCI_REG8(0xA1B0), 0x34},
> +       {CCI_REG8(0xA1B1), 0xE9},
> +       {CCI_REG8(0xA1B2), 0x05},
> +       {CCI_REG8(0xA1B8), 0x69},
> +       {CCI_REG8(0xA1B9), 0x44},
> +       {CCI_REG8(0xA1BA), 0x3A},
> +       {CCI_REG8(0xA1C0), 0xFF},
> +       {CCI_REG8(0xA1C1), 0xFF},
> +       {CCI_REG8(0xA1C2), 0xFF},
> +       {CCI_REG8(0xA1C8), 0xFF},
> +       {CCI_REG8(0xA1C9), 0xFF},
> +       {CCI_REG8(0xA1CA), 0xFF},
> +       {CCI_REG8(0xA1D0), 0xFF},
> +       {CCI_REG8(0xA1D1), 0xFF},
> +       {CCI_REG8(0xA1D2), 0xFF},
> +       {CCI_REG8(0xA19C), 0x00},
> +       {CCI_REG8(0xA19D), 0x00},
> +       {CCI_REG8(0xA19E), 0x00},
> +       {CCI_REG8(0xA1A4), 0xAA},
> +       {CCI_REG8(0xA1A5), 0x03},
> +       {CCI_REG8(0xA1A6), 0x00},
> +       {CCI_REG8(0xA1AC), 0x3B},
> +       {CCI_REG8(0xA1AD), 0x07},
> +       {CCI_REG8(0xA1AE), 0x00},
> +       {CCI_REG8(0xA1B4), 0x5C},
> +       {CCI_REG8(0xA1B5), 0x09},
> +       {CCI_REG8(0xA1B6), 0x00},
> +       {CCI_REG8(0xA1BC), 0xB3},
> +       {CCI_REG8(0xA1BD), 0x0C},
> +       {CCI_REG8(0xA1BE), 0x00},
> +       {CCI_REG8(0xA1C4), 0xFF},
> +       {CCI_REG8(0xA1C5), 0x0F},
> +       {CCI_REG8(0xA1C6), 0x00},
> +       {CCI_REG8(0xA1CC), 0xFF},
> +       {CCI_REG8(0xA1CD), 0x0F},
> +       {CCI_REG8(0xA1CE), 0x00},
> +       {CCI_REG8(0xA1D4), 0xFF},
> +       {CCI_REG8(0xA1D5), 0x0F},
> +       {CCI_REG8(0xA1D6), 0x00},
> +       {CCI_REG8(0xA1DC), 0xFF},
> +       {CCI_REG8(0xA1DD), 0x0F},
> +       {CCI_REG8(0xA1DE), 0x00},
> +       {CCI_REG8(0xA1E4), 0xFF},
> +       {CCI_REG8(0xA1E5), 0x0F},
> +       {CCI_REG8(0xA1E6), 0x00},
> +       {CCI_REG8(0xA1EC), 0xFF},
> +       {CCI_REG8(0xA1ED), 0x0F},
> +       {CCI_REG8(0xA1EE), 0x00},
> +       {CCI_REG8(0xA1F4), 0xFF},
> +       {CCI_REG8(0xA1F5), 0x0F},
> +       {CCI_REG8(0xA1F6), 0x00},
> +       {CCI_REG8(0xA1FC), 0xFF},
> +       {CCI_REG8(0xA1FD), 0x0F},
> +       {CCI_REG8(0xA1FE), 0x00},
> +       {CCI_REG8(0xA204), 0xFF},
> +       {CCI_REG8(0xA205), 0x0F},
> +       {CCI_REG8(0xA206), 0x00},
> +       {CCI_REG8(0xA20C), 0xFF},
> +       {CCI_REG8(0xA20D), 0x0F},
> +       {CCI_REG8(0xA20E), 0x00},
> +       {CCI_REG8(0xA214), 0xFF},
> +       {CCI_REG8(0xA215), 0x0F},
> +       {CCI_REG8(0xA216), 0x00},
> +       {CCI_REG8(0xA21C), 0xFF},
> +       {CCI_REG8(0xA21D), 0x0F},
> +       {CCI_REG8(0xA21E), 0x00},
> +       {CCI_REG8(0xAC4D), 0x02},
> +       {CCI_REG8(0x1804), 0x00},
> +       {CCI_REG8(0xEC68), 0x8F},
> +       {CCI_REG8(0xEC69), 0x07},
> +       {CCI_REG8(0xEC6A), 0x4C},
> +       {CCI_REG8(0xEC6B), 0x04},
> +};
> +
> +static inline struct imx728 *to_imx728(struct v4l2_subdev *sd)
> +{
> +       return container_of(sd, struct imx728, subdev);
> +}
> +
> +static int imx728_wait_for_state(struct imx728 *imx728, enum imx728_sens=
or_state state)
> +{
> +       int ret =3D 0;
> +       int i;
> +       u64 val;
> +
> +       for (i =3D 0; i < 50; i++) {
> +               cci_read(imx728->regmap, IMX728_REG_STATE, &val, &ret);
> +               if (ret =3D=3D 0 && val =3D=3D state) {
> +                       dev_dbg(imx728->dev, "%s: Enter state %llu\n", __=
func__, val);
> +                       return 0;
> +               }
> +               usleep_range(1000, 10000);
> +       }
> +
> +       return -EBUSY;
> +}
> +
> +static void imx728_init_formats(struct v4l2_subdev_state *state)
> +{
> +       struct v4l2_mbus_framefmt *format;
> +
> +       format =3D v4l2_subdev_state_get_format(state, 0, 0);
> +       format->code =3D imx728_mbus_formats[0];
> +       format->width =3D imx728_framesizes[0].width;
> +       format->height =3D imx728_framesizes[0].height;
> +       format->field =3D V4L2_FIELD_NONE;
> +       format->colorspace =3D V4L2_COLORSPACE_RAW;
> +       format->quantization =3D V4L2_QUANTIZATION_FULL_RANGE;
> +       format->xfer_func =3D V4L2_XFER_FUNC_NONE;
> +       format->ycbcr_enc =3D V4L2_YCBCR_ENC_601;
> +}
> +
> +static int imx728_enum_mbus_code(struct v4l2_subdev *sd,
> +                                struct v4l2_subdev_state *state,
> +                                struct v4l2_subdev_mbus_code_enum *code)
> +{
> +
> +       if (code->index >=3D ARRAY_SIZE(imx728_mbus_formats))
> +               return -EINVAL;
> +
> +       code->code =3D imx728_mbus_formats[code->index];
> +
> +       return 0;
> +}
> +
> +static int imx728_enum_frame_sizes(struct v4l2_subdev *sd,
> +                                  struct v4l2_subdev_state *state,
> +                                  struct v4l2_subdev_frame_size_enum *fs=
e)
> +{
> +       unsigned int i;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(imx728_mbus_formats); ++i) {
> +               if (imx728_mbus_formats[i] =3D=3D fse->code)
> +                       break;
> +       }
> +
> +       if (i =3D=3D ARRAY_SIZE(imx728_mbus_formats))
> +               return -EINVAL;
> +
> +       if (fse->index >=3D ARRAY_SIZE(imx728_framesizes))
> +               return -EINVAL;
> +
> +       fse->min_width =3D imx728_framesizes[fse->index].width;
> +       fse->max_width =3D fse->min_width;
> +       fse->min_height =3D imx728_framesizes[fse->index].height;
> +       fse->max_height =3D fse->min_height;
> +
> +       return 0;
> +}
> +
> +static int imx728_get_selection(struct v4l2_subdev *sd,
> +                               struct v4l2_subdev_state *state,
> +                               struct v4l2_subdev_selection *sel)
> +{
> +       struct imx728 *imx728 =3D to_imx728(sd);
> +       struct v4l2_mbus_framefmt *format;
> +
> +       switch (sel->target) {
> +       case V4L2_SEL_TGT_CROP:
> +               format =3D v4l2_subdev_state_get_format(state, 0);
> +
> +               sel->r.top =3D IMX728_PIXEL_ARRAY_MARGIN_TOP
> +                       + (IMX728_PIXEL_ARRAY_RECORDING_HEIGHT - format->=
height) / 2
> +                       + imx728->ctrl.v_flip->val;
> +               sel->r.left =3D IMX728_PIXEL_ARRAY_MARGIN_LEFT
> +                       + (IMX728_PIXEL_ARRAY_RECORDING_WIDTH - format->w=
idth) / 2
> +                       + imx728->ctrl.h_flip->val;
> +               sel->r.height =3D format->height;
> +               sel->r.width =3D format->width;
> +               return 0;
> +       case V4L2_SEL_TGT_NATIVE_SIZE:
> +               sel->r.top =3D 0;
> +               sel->r.left =3D 0;
> +               sel->r.width =3D IMX728_PIXEL_ARRAY_WIDTH;
> +               sel->r.height =3D IMX728_PIXEL_ARRAY_HEIGHT;
> +               return 0;
> +       case V4L2_SEL_TGT_CROP_DEFAULT:
> +       case V4L2_SEL_TGT_CROP_BOUNDS:
> +               sel->r.top =3D IMX728_PIXEL_ARRAY_MARGIN_TOP;
> +               sel->r.left =3D IMX728_PIXEL_ARRAY_MARGIN_LEFT;
> +               sel->r.width =3D IMX728_PIXEL_ARRAY_RECORDING_WIDTH;
> +               sel->r.height =3D IMX728_PIXEL_ARRAY_RECORDING_HEIGHT;
> +               return 0;
> +       }
> +
> +       return -EINVAL;
> +}
> +
> +static int imx728_set_fmt(struct v4l2_subdev *sd,
> +                         struct v4l2_subdev_state *state,
> +                         struct v4l2_subdev_format *fmt)
> +{
> +       struct imx728 *imx728 =3D to_imx728(sd);
> +       struct v4l2_mbus_framefmt *format;
> +       const struct v4l2_area *fsize;
> +       unsigned int i;
> +       u32 code;
> +       int ret =3D 0;
> +
> +       if (fmt->pad !=3D 0)
> +               return -EINVAL;
> +
> +       if (fmt->stream !=3D 0)
> +               return -EINVAL;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(imx728_mbus_formats); ++i) {
> +               if (imx728_mbus_formats[i] =3D=3D fmt->format.code) {
> +                       code =3D fmt->format.code;
> +                       break;
> +               }
> +       }
> +
> +       if (i =3D=3D ARRAY_SIZE(imx728_mbus_formats))
> +               code =3D imx728_mbus_formats[0];
> +
> +       fsize =3D v4l2_find_nearest_size(imx728_framesizes,
> +                                      ARRAY_SIZE(imx728_framesizes), wid=
th,
> +                                      height, fmt->format.width,
> +                                      fmt->format.height);
> +
> +       mutex_lock(&imx728->lock);
> +
> +       fmt->format.field =3D V4L2_FIELD_NONE;
> +       fmt->format.colorspace =3D V4L2_COLORSPACE_RAW;
> +       fmt->format.ycbcr_enc =3D V4L2_YCBCR_ENC_601;
> +       fmt->format.quantization =3D V4L2_QUANTIZATION_FULL_RANGE;
> +       fmt->format.xfer_func =3D V4L2_XFER_FUNC_NONE;
> +
> +       fmt->format.width =3D fsize->width;
> +       fmt->format.height =3D fsize->height;
> +       fmt->format.code =3D code;
> +
> +       format =3D v4l2_subdev_state_get_format(state, fmt->pad, fmt->str=
eam);
> +
> +       if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE && imx728->stream=
ing) {
> +               ret =3D -EBUSY;
> +               goto done;
> +       }
> +
> +       *format =3D fmt->format;
> +
> +done:
> +       mutex_unlock(&imx728->lock);
> +
> +       return ret;
> +}
> +
> +static int imx728_get_frame_desc(struct v4l2_subdev *sd, unsigned int pa=
d,
> +                                struct v4l2_mbus_frame_desc *fd)
> +{
> +       struct v4l2_subdev_state *state;
> +       struct v4l2_mbus_framefmt *fmt;
> +       u32 bpp;
> +       int ret =3D 0;
> +
> +       if (pad !=3D 0)
> +               return -EINVAL;
> +
> +       state =3D v4l2_subdev_lock_and_get_active_state(sd);
> +
> +       fmt =3D v4l2_subdev_state_get_format(state, 0, 0);
> +       if (!fmt) {
> +               ret =3D -EPIPE;
> +               goto out;
> +       }
> +
> +       memset(fd, 0, sizeof(*fd));
> +
> +       fd->type =3D V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> +
> +       bpp =3D 10;
> +
> +       fd->entry[fd->num_entries].stream =3D 0;
> +
> +       fd->entry[fd->num_entries].flags =3D V4L2_MBUS_FRAME_DESC_FL_LEN_=
MAX;
> +       fd->entry[fd->num_entries].length =3D fmt->width * fmt->height * =
bpp / 8;
> +       fd->entry[fd->num_entries].pixelcode =3D fmt->code;
> +       fd->entry[fd->num_entries].bus.csi2.vc =3D 0;
> +       fd->entry[fd->num_entries].bus.csi2.dt =3D 0x2b;
> +
> +       fd->num_entries++;
> +
> +out:
> +
> +       v4l2_subdev_unlock_state(state);
> +
> +       return ret;
> +}
> +
> +static int imx728_set_routing(struct v4l2_subdev *sd,
> +                             struct v4l2_subdev_state *state,
> +                             enum v4l2_subdev_format_whence which,
> +                             struct v4l2_subdev_krouting *routing)
> +{
> +       int ret;
> +
> +       if (routing->num_routes =3D=3D 0 || routing->num_routes > 1)
> +               return -EINVAL;
> +
> +       struct v4l2_subdev_route routes[] =3D {
> +               {
> +                       .source_pad =3D 0,
> +                       .source_stream =3D 0,
> +                       .flags =3D V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> +               },
> +               {
> +                       .source_pad =3D 0,
> +                       .source_stream =3D 1,
> +               }
> +       };
> +
> +       struct v4l2_subdev_krouting route =3D {
> +               .num_routes =3D ARRAY_SIZE(routes),
> +               .routes =3D routes,
> +       };
> +
> +       ret =3D v4l2_subdev_set_routing(sd, state, &route);
> +       if (ret < 0)
> +               return ret;
> +
> +       imx728_init_formats(state);
> +
> +       return 0;
> +
> +       return ret;
> +}
> +
> +static int imx728_set_pg(struct imx728 *imx728, int val)
> +{
> +       int ret =3D 0;
> +
> +       switch (val) {
> +       case 0:
> +               break;
> +       case 1:
> +               // Horizontal Color Bars
> +               cci_write(imx728->regmap, IMX728_REG_PG_00, 8, &ret);
> +               cci_write(imx728->regmap, IMX728_REG_PG_01, 0, &ret);
> +               cci_write(imx728->regmap, IMX728_REG_PG_02, 1, &ret);
> +               cci_write(imx728->regmap, IMX728_REG_PG_03, 0x0, &ret);
> +               cci_write(imx728->regmap, IMX728_REG_PG_04, 0x0, &ret);
> +               break;
> +       case 2:
> +               // Vertical Color Bars
> +               cci_write(imx728->regmap, IMX728_REG_PG_05, 16, &ret);

I suspect this is fine, as it looks too intentional to be an
accident/typo - but 05 first here instead of 00 and 05 not being last?

(Presumably this is the sequence in the datasheet?)

> +               cci_write(imx728->regmap, IMX728_REG_PG_01, 0, &ret);
> +               cci_write(imx728->regmap, IMX728_REG_PG_02, 1, &ret);
> +               cci_write(imx728->regmap, IMX728_REG_PG_03, 0x1, &ret);
> +               cci_write(imx728->regmap, IMX728_REG_PG_04, 0x1, &ret);
> +               break;
> +       default:
> +               break;
> +       }
> +
> +       // Assume that everything except 'disabled' requires pattern gen =
enable
> +       if (imx728->ctrl.pg_mode->val !=3D 0) {
> +               cci_write(imx728->regmap, IMX728_REG_PG_06, 0x1, &ret);
> +               cci_write(imx728->regmap, IMX728_REG_PG_07, 0x1, &ret);

Should we have #define IMX728_PATTERN_GEN_ENABLE BIT(0); or such ?

> +
> +               if (ret < 0) {
> +                       dev_err(imx728->dev, "Failed to enable PG mode.");
> +                       return ret;
> +               }
> +       } else {
> +               cci_write(imx728->regmap, IMX728_REG_PG_06, 0x0, &ret);
> +               cci_write(imx728->regmap, IMX728_REG_PG_07, 0x0, &ret);
> +
> +               if (ret < 0) {
> +                       dev_err(imx728->dev, "Failed to disable PG mode."=
);
> +                       return ret;
> +               }
> +       }
> +
> +       return 0;
> +}
> +
> +static int imx728_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +       struct imx728 *imx728 =3D container_of(ctrl->handler,
> +                                       struct imx728, ctrl.handler);
> +       int ret =3D 0;
> +
> +       dev_dbg(imx728->dev, "%s: %s, value: %d\n",
> +                       __func__, ctrl->name, ctrl->val);
> +
> +       if (!pm_runtime_get_if_in_use(imx728->dev))
> +               return 0;
> +
> +       switch (ctrl->id) {
> +       case V4L2_CID_EXPOSURE:
> +               cci_write(imx728->regmap, IMX728_REG_EXPOSURE_00, ctrl->v=
al, &ret);
> +               break;
> +       case V4L2_CID_ANALOGUE_GAIN:
> +               cci_update_bits(imx728->regmap, IMX728_REG_AGAIN_00,
> +                               0x1FFFF, (ctrl->val * 10), &ret);

Why val * 10 instead of val ... does this mean users of this driver will
not get the expectations of the datasheet gain model?

What is the gain model? Is it linear/logarithmic ?


> +               break;
> +       case V4L2_CID_HFLIP:
> +               cci_update_bits(imx728->regmap, IMX728_REG_FLIP,
> +                                        0x1, ctrl->val, &ret);
> +               cci_update_bits(imx728->regmap, IMX728_REG_HFLIP,
> +                                         0x1, ctrl->val, &ret);
> +               break;
> +       case V4L2_CID_VFLIP:
> +               cci_update_bits(imx728->regmap, IMX728_REG_FLIP,
> +                                        0x2, ctrl->val << 1, &ret);
> +               cci_update_bits(imx728->regmap, IMX728_REG_VFLIP,
> +                                        0x1, ctrl->val, &ret);
> +               break;
> +       case V4L2_CID_WIDE_DYNAMIC_RANGE:
> +       case V4L2_CID_TEST_PATTERN:
> +               ret =3D imx728_set_pg(imx728, ctrl->val);
> +               break;
> +       default:
> +               ret =3D -EINVAL;
> +       }
> +
> +       pm_runtime_put_noidle(imx728->dev);
> +       return ret;
> +}
> +
> +static int imx728_detect(struct imx728 *imx728)
> +{
> +       int ret =3D 0;
> +       u64 minor, major;
> +
> +       cci_read(imx728->regmap, IMX728_REG_VMAJOR, &major, &ret);
> +       if (ret !=3D 0) {
> +               dev_err(imx728->dev, "Could not read PARAM_MAJOR_VER!");
> +               return ret;
> +       }
> +       cci_read(imx728->regmap, IMX728_REG_VMINOR, &minor, &ret);
> +       if (ret !=3D 0) {
> +               dev_err(imx728->dev, "Could not read PARAM_MINOR_VER!");
> +               return ret;
> +       }
> +       dev_dbg(imx728->dev, "Got version: %lld.%lld", major, minor);
> +
> +       return 0;
> +}
> +
> +static int imx728_reset(struct imx728 *imx728)
> +{
> +
> +       int ret =3D 0;
> +
> +       // Prefer hardware reset if available.
> +       if (!IS_ERR_OR_NULL(imx728->reset_gpio)) {
> +               gpiod_set_value_cansleep(imx728->reset_gpio, 1);
> +               usleep_range(1000, 10000);
> +               gpiod_set_value_cansleep(imx728->reset_gpio, 0);
> +               msleep(100);
> +       } else {
> +               // Software reset.
> +               cci_write(imx728->regmap, IMX728_REG_RESET_0, 0xC3, &ret);
> +               cci_update_bits(imx728->regmap, IMX728_REG_RESET_1, 0x1, =
0x1, &ret);

Can any of the bitfields be defined by name to make it explicit / remove
magic numbers? (Applies throughout)

> +               msleep(100);
> +       }
> +
> +       return ret;
> +}
> +
> +static int imx728_power_on(struct imx728 *imx728)
> +{
> +       int ret;
> +
> +       ret =3D clk_prepare_enable(imx728->clk);
> +       if (ret < 0)
> +               return ret;
> +
> +       imx728_reset(imx728);
> +       return 0;
> +}
> +
> +static int imx728_power_off(struct imx728 *imx728)
> +{
> +
> +       if (imx728->reset_gpio) {
> +               gpiod_set_value_cansleep(imx728->reset_gpio, 1);
> +
> +               usleep_range(1, 10);
> +       }
> +       clk_disable_unprepare(imx728->clk);
> +       return 0;
> +}
> +
> +static int imx728_get_frame_interval(struct v4l2_subdev *sd,
> +                                    struct v4l2_subdev_state *sd_state,
> +                                    struct v4l2_subdev_frame_interval *f=
i)
> +{
> +       struct imx728 *imx728 =3D to_imx728(sd);
> +
> +       fi->interval.numerator =3D 1;
> +       fi->interval.denominator =3D imx728->fps;
> +       return 0;
> +}
> +
> +static int imx728_set_frame_interval(struct v4l2_subdev *sd,
> +                                    struct v4l2_subdev_state *sd_state,
> +                                    struct v4l2_subdev_frame_interval *f=
i)
> +{
> +       struct imx728 *imx728 =3D to_imx728(sd);
> +       u32 req_fps;
> +
> +       mutex_lock(&imx728->lock);
> +
> +       if (fi->interval.numerator =3D=3D 0 || fi->interval.denominator =
=3D=3D 0) {
> +               fi->interval.denominator =3D IMX728_FRAMERATE_DEFAULT;
> +               fi->interval.numerator =3D 1;
> +       }
> +
> +       req_fps =3D clamp_val(DIV_ROUND_CLOSEST(fi->interval.denominator,
> +                                             fi->interval.numerator),
> +                           IMX728_FRAMERATE_MIN, IMX728_FRAMERATE_MAX);
> +
> +       fi->interval.numerator =3D 1;
> +       fi->interval.denominator =3D req_fps;
> +
> +       imx728->fps =3D req_fps;
> +
> +       mutex_unlock(&imx728->lock);
> +       dev_dbg(imx728->dev, "%s frame rate =3D %d\n", __func__, imx728->=
fps);
> +
> +       return 0;
> +}
> +
> +static int imx728_powerup_to_standby(struct imx728 *imx728)
> +{
> +       int ret =3D 0;
> +
> +       dev_dbg(imx728->dev, "powerup -> standby...");
> +
> +       ret =3D imx728_reset(imx728);
> +       if (ret) {
> +               dev_err(imx728->dev, "Error resetting: %i", ret);
> +               return ret;
> +       }
> +
> +       ret =3D imx728_wait_for_state(imx728, IMX728_SENSOR_STATE_SLEEP);
> +       if (ret < 0) {
> +               dev_err(imx728->dev, "Could not transition to Sleep state=
!");
> +               return ret;
> +       }
> +
> +       cci_write(imx728->regmap, IMX728_REG_INCK_0, imx728->clk_rate / 1=
000000, &ret);
> +       cci_write(imx728->regmap, IMX728_REG_INCK_1, 0x1, &ret);
> +       if (ret < 0) {
> +               dev_err(imx728->dev, "Couldn't write INCK frequency!");
> +               return ret;
> +       }
> +
> +       cci_write(imx728->regmap, IMX728_REG_SLEEP, 0xFF, &ret);
> +       if (ret < 0) {
> +               dev_err(imx728->dev, "Couldn't write to SLEEP!");
> +               return ret;
> +       }
> +
> +       ret =3D imx728_wait_for_state(imx728, IMX728_SENSOR_STATE_STANDBY=
);
> +       if (ret < 0) {
> +               dev_err(imx728->dev, "Couldn't transition from Sleep to S=
tandby state!");
> +               return ret;
> +       }
> +
> +       cci_write(imx728->regmap, IMX728_REG_REGMAP, IMX728_REMAP_MODE_ST=
ANDBY, &ret);
> +       if (ret < 0) {
> +               dev_err(imx728->dev, "Couldn't write regmap mode!");
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static int imx728_hdr_fixed_brightness(struct imx728 *imx728)
> +{
> +       int ret =3D 0;
> +
> +       // Sony recommended values
> +       unsigned int exposure_sp1_sp2_us =3D 10000;
> +       unsigned int exposure_sp1vs_us =3D 56;
> +       unsigned int sp1h_gain =3D 240;
> +       unsigned int sp1l_gain =3D 75;
> +       unsigned int sp1ec_gain =3D 21;
> +       unsigned int sp2_gain =3D 33;
> +       unsigned int sp1vs_gain =3D 84;
> +
> +       cci_write(imx728->regmap, IMX728_REG_EXPOSURE_00, exposure_sp1_sp=
2_us, &ret);
> +       cci_write(imx728->regmap, IMX728_REG_EXPOSURE_01, exposure_sp1_sp=
2_us, &ret);
> +       cci_write(imx728->regmap, IMX728_REG_EXPOSURE_02, exposure_sp1vs_=
us, &ret);
> +       if (ret < 0) {
> +               dev_err(imx728->dev, "Failed to write fixed exposure valu=
es.");
> +               return ret;
> +       }
> +
> +       cci_update_bits(imx728->regmap, IMX728_REG_AGAIN_00,
> +                         0x1FFFF,
> +                         sp1h_gain,
> +                         &ret);
> +       cci_update_bits(imx728->regmap, IMX728_REG_AGAIN_01,
> +                         0x1FFFF,
> +                         sp1l_gain,
> +                         &ret);
> +       cci_update_bits(imx728->regmap, IMX728_REG_AGAIN_02,
> +                         0x1FFFF,
> +                         sp1ec_gain,
> +                         &ret);
> +       cci_update_bits(imx728->regmap, IMX728_REG_AGAIN_03,
> +                         0x1FFFF,
> +                         sp2_gain,
> +                         &ret);
> +       cci_update_bits(imx728->regmap, IMX728_REG_AGAIN_04,
> +                         0x1FFFF,
> +                         sp1vs_gain,
> +                         &ret);
> +
> +       if (ret < 0) {
> +               dev_err(imx728->dev, "Failed to write fixed gain values."=
);
> +               return ret;
> +       }
> +
> +       dev_dbg(imx728->dev, "Wrote fixed brightness for HDR");
> +
> +       return 0;
> +}
> +
> +static int imx728_hdr_configure(
> +       struct imx728 *imx728,
> +       struct imx728_ctrl_point *points,
> +       int hdr_bits)
> +{
> +       u32 hdr_norm_x0;
> +       u32 hdr_norm_x1;
> +       u32 hdr_norm_y0;
> +       u32 hdr_norm_y1;
> +
> +       int ret =3D 0;
> +       int i;
> +
> +       switch (hdr_bits) {
> +       case 20:
> +               hdr_norm_x0 =3D 0x2000;
> +               hdr_norm_x1 =3D 0x5000;
> +
> +               hdr_norm_y0 =3D 0x0;
> +               hdr_norm_y1 =3D 0xd000;
> +               break;
> +       case 24:
> +               hdr_norm_x0 =3D 0x3000;
> +               hdr_norm_x1 =3D 0x5000;
> +
> +               hdr_norm_y0 =3D 0x0;
> +               hdr_norm_y1 =3D 0xe000;
> +               break;
> +       default:
> +               dev_err(imx728->dev, "%i bit HDR not supported.", hdr_bit=
s);
> +               break;
> +       }
> +
> +       cci_write(imx728->regmap, IMX728_REG_HDR_00, hdr_norm_x0, &ret);
> +       cci_write(imx728->regmap, IMX728_REG_HDR_01, hdr_norm_x0, &ret);
> +       cci_write(imx728->regmap, IMX728_REG_HDR_02, hdr_norm_x1, &ret);
> +       cci_write(imx728->regmap, IMX728_REG_HDR_03, hdr_norm_x1, &ret);
> +       cci_write(imx728->regmap, IMX728_REG_HDR_04, hdr_norm_y0, &ret);
> +       cci_write(imx728->regmap, IMX728_REG_HDR_05, hdr_norm_y0, &ret);
> +       cci_write(imx728->regmap, IMX728_REG_HDR_06, hdr_norm_y1, &ret);
> +       cci_write(imx728->regmap, IMX728_REG_HDR_07, hdr_norm_y1, &ret);
> +
> +       if (ret < 0) {
> +               dev_err(imx728->dev, "Failed when setting HDR Normalizati=
on gains: %i", ret);
> +               return ret;
> +       }
> +
> +       for (i =3D 0; i < 16; i++) {
> +               cci_write(imx728->regmap,
> +                         IMX728_REG_CTRL_POINT_X(i),
> +                         points->x, &ret);
> +
> +               cci_write(imx728->regmap,
> +                         IMX728_REG_CTRL_POINT_Y(i),
> +                         points->y, &ret);
> +
> +               if (ret < 0) {
> +                       dev_err(imx728->dev, "Failed to write control poi=
nt %i", i);
> +                       return ret;
> +               }
> +
> +               if ((points+1)->x >=3D 0 && (points+1)->y >=3D 0)
> +                       points++;
> +       }
> +
> +       return imx728_hdr_fixed_brightness(imx728);
> +}
> +
> +static int imx728_configure(struct imx728 *imx728)
> +{
> +       int ret =3D 0;
> +       bool hdr =3D imx728->ctrl.wdr->val;
> +       enum imx728_img_raw_mode img_out_mode;
> +       enum imx728_drive_mode mode_sel;
> +       enum imx728_aemode ae_mode;
> +
> +       if (hdr)
> +               img_out_mode =3D IMX728_IMG_MODE_HDR;
> +       else
> +               img_out_mode =3D IMX728_IMG_MODE_LINEAR;
> +
> +       mode_sel =3D IMX728_MODE_3856x2176_40_4LANE_RAW10;
> +       ae_mode =3D IMX728_AEMODE_FULL_ME;
> +
> +       cci_write(imx728->regmap, IMX728_REG_AE_MODE, ae_mode, &ret);
> +       if (ret < 0) {
> +               dev_err(imx728->dev, "Couldn't set AE mode!");
> +               return ret;
> +       }
> +
> +       cci_write(imx728->regmap, IMX728_REG_AWBMODE, IMX728_AWBMODE_FULL=
_MWB, &ret);
> +       if (ret < 0) {
> +               dev_err(imx728->dev, "Couldn't set full manual white bala=
nce mode!");
> +               return ret;
> +       }
> +
> +       cci_update_bits(imx728->regmap, IMX728_REG_AWB_EN, 0x1, 0x1, &ret=
);
> +       if (ret < 0) {
> +               dev_err(imx728->dev, "Couldn't enable full manual white b=
alance mode!");
> +               return ret;
> +       }
> +
> +       cci_write(imx728->regmap, IMX728_REG_UNIT_00, IMX728_FME_SHTVAL_U=
NIT_MICROSECONDS, &ret);
> +       cci_write(imx728->regmap, IMX728_REG_UNIT_01, IMX728_FME_SHTVAL_U=
NIT_MICROSECONDS, &ret);
> +       cci_write(imx728->regmap, IMX728_REG_UNIT_02, IMX728_FME_SHTVAL_U=
NIT_MICROSECONDS, &ret);
> +       if (ret < 0) {
> +               dev_err(imx728->dev, "Couldn't write exposure time unit t=
o microseconds!");
> +               return ret;
> +       }
> +
> +       if (hdr) {
> +               ret =3D imx728_hdr_configure(imx728, imx728_hdr_20bit, 20=
);
> +               if (ret < 0) {
> +                       dev_err(imx728->dev, "Couldn't configure sensor f=
or HDR mode: %i", ret);
> +                       return ret;
> +               }
> +       }
> +
> +       dev_dbg(imx728->dev, "Disabling metadata...");
> +       cci_write(imx728->regmap, IMX728_REG_MD_00, 0x00, &ret);
> +       cci_write(imx728->regmap, IMX728_REG_MD_01, 0x00, &ret);
> +       cci_write(imx728->regmap, IMX728_REG_MD_02, 0x00, &ret);
> +       cci_write(imx728->regmap, IMX728_REG_MD_03, 0x00, &ret);
> +       if (ret < 0) {
> +               dev_err(imx728->dev, "Error disabling metadata: %i", ret);
> +               return ret;
> +       }
> +
> +       cci_update_bits(imx728->regmap, IMX728_REG_MODE_SEL,
> +                         0x7FFF,
> +                         mode_sel,
> +                         &ret);
> +       if (ret < 0) {
> +               dev_err(imx728->dev, "Couldn't write mode select.");
> +               return ret;
> +       }
> +
> +       cci_update_bits(imx728->regmap, IMX728_REG_OUT_MODE,
> +                         0x7,
> +                         img_out_mode,
> +                         &ret);
> +       if (ret < 0) {
> +               dev_err(imx728->dev, "Couldn't select image out mode.");
> +               return ret;
> +       }
> +
> +       cci_write(imx728->regmap, IMX728_REG_OB_0, 0x28, &ret);
> +       cci_write(imx728->regmap, IMX728_REG_OB_1, 0x0, &ret);
> +       if (ret < 0) {
> +               dev_err(imx728->dev, "Error disabling OB output.");
> +               return ret;
> +       }
> +
> +       cci_write(imx728->regmap, IMX728_REG_SKEW, 0x0, &ret);
> +       if (ret < 0)
> +               dev_err(imx728->dev, "Error disabling skew calibration fr=
om sensor to SER");
> +
> +       cci_update_bits(imx728->regmap, IMX728_REG_SUBP_0,
> +                         0x7,
> +                         IMX728_RAW_SEL_SP1H,
> +                         &ret);
> +       cci_update_bits(imx728->regmap, IMX728_REG_SUBP_1,
> +                          0x7,
> +                          IMX728_RAW_SEL_SP1H,
> +                          &ret);
> +       if (ret < 0) {
> +               dev_err(imx728->dev, "Failed to set subpixel register");
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static int imx728_start_stream(struct imx728 *imx728)
> +{
> +       int ret;
> +
> +       ret =3D imx728_powerup_to_standby(imx728);
> +       if (ret < 0)
> +               return ret;
> +
> +       cci_write(imx728->regmap, IMX728_REG_REGMAP, 0x00, &ret);
> +       usleep_range(1000, 10000);
> +       cci_multi_reg_write(imx728->regmap, imx728_3840x2160_begin,
> +                    ARRAY_SIZE(imx728_3840x2160_begin), &ret);
> +       cci_write(imx728->regmap, IMX728_REG_STREAM_00, 0x01, &ret);
> +       usleep_range(1000, 10000);
> +       cci_write(imx728->regmap, IMX728_REG_STREAM_01, 0x01, &ret);
> +       usleep_range(1000, 10000);
> +       cci_write(imx728->regmap, IMX728_REG_REGMAP, 0x00, &ret);
> +       usleep_range(1000, 10000);
> +       cci_multi_reg_write(imx728->regmap, imx728_3840x2160_end,
> +                    ARRAY_SIZE(imx728_3840x2160_end), &ret);
> +       if (ret < 0)
> +               return ret;
> +
> +       msleep(100);
> +
> +       ret =3D imx728_configure(imx728);
> +       if (ret < 0)
> +               return ret;
> +
> +       ret =3D __v4l2_ctrl_handler_setup(imx728->subdev.ctrl_handler);
> +       if (ret < 0) {
> +               dev_err(imx728->dev,
> +                       "%s: failed to apply v4l2 ctrls: %d\n", __func__,=
 ret);
> +               return ret;
> +       }
> +
> +       cci_write(imx728->regmap, IMX728_REG_STREAM_02, 0x5C, &ret);
> +       if (ret < 0)
> +               return ret;
> +       cci_write(imx728->regmap, IMX728_REG_STREAM_02, 0xA3, &ret);
> +       if (ret < 0)
> +               return ret;
> +
> +       ret =3D imx728_wait_for_state(imx728, IMX728_SENSOR_STATE_STREAMI=
NG);
> +       if (ret < 0) {
> +               dev_err(imx728->dev, "Could not transition to Streaming!"=
);
> +               return ret;
> +       }
> +
> +       msleep(20);
> +
> +       return 0;
> +}
> +
> +static int imx728_stop_stream(struct imx728 *imx728)
> +{
> +       int ret;
> +
> +       cci_write(imx728->regmap, IMX728_REG_STREAM_02, 0xFF, &ret);
> +       if (ret < 0) {
> +               dev_err(imx728->dev, "Error sending stop stream command: =
%i", ret);
> +               return ret;
> +       }
> +
> +       imx728_wait_for_state(imx728, IMX728_SENSOR_STATE_STANDBY);
> +       if (ret < 0) {
> +               dev_err(imx728->dev, "Couldn't transition out of Streamin=
g mode!");
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static int imx728_set_stream(struct v4l2_subdev *sd, int enable)
> +{
> +       struct imx728 *imx728 =3D to_imx728(sd);
> +       int ret;
> +
> +       mutex_lock(&imx728->lock);
> +       if (imx728->streaming =3D=3D enable) {
> +               mutex_unlock(&imx728->lock);
> +               return 0;
> +       }
> +
> +       if (enable) {
> +               ret =3D pm_runtime_get_sync(imx728->dev);
> +               if (ret < 0) {
> +                       pm_runtime_put_noidle(imx728->dev);
> +                       goto err_unlock;
> +               }
> +
> +               ret =3D imx728_start_stream(imx728);
> +               if (ret < 0)
> +                       goto err_runtime_put;
> +       } else {
> +               ret =3D imx728_stop_stream(imx728);
> +               if (ret < 0)
> +                       goto err_runtime_put;
> +               pm_runtime_mark_last_busy(imx728->dev);
> +               pm_runtime_put_autosuspend(imx728->dev);
> +       }
> +
> +       imx728->streaming =3D enable;
> +
> +       __v4l2_ctrl_grab(imx728->ctrl.wdr, enable);
> +       __v4l2_ctrl_grab(imx728->ctrl.h_flip, enable);
> +       __v4l2_ctrl_grab(imx728->ctrl.v_flip, enable);
> +       __v4l2_ctrl_grab(imx728->ctrl.pg_mode, enable);
> +
> +       mutex_unlock(&imx728->lock);
> +       return 0;
> +
> +err_runtime_put:
> +       pm_runtime_put(imx728->dev);
> +
> +err_unlock:
> +       mutex_unlock(&imx728->lock);
> +       dev_err(imx728->dev,
> +               "%s: failed to setup streaming %d\n", __func__, ret);
> +       return ret;
> +}
> +
> +static const struct v4l2_subdev_core_ops imx728_core_ops =3D {
> +       .subscribe_event =3D v4l2_ctrl_subdev_subscribe_event,
> +       .unsubscribe_event =3D v4l2_event_subdev_unsubscribe,
> +};
> +
> +static const struct v4l2_subdev_video_ops imx728_subdev_video_ops =3D {
> +       .s_stream =3D imx728_set_stream,
> +};
> +
> +static const struct v4l2_subdev_pad_ops imx728_subdev_pad_ops =3D {
> +       .enum_mbus_code =3D imx728_enum_mbus_code,
> +       .enum_frame_size =3D imx728_enum_frame_sizes,
> +       .get_fmt =3D v4l2_subdev_get_fmt,
> +       .set_fmt =3D imx728_set_fmt,
> +       .get_frame_interval =3D imx728_get_frame_interval,
> +       .set_frame_interval =3D imx728_set_frame_interval,
> +       .set_routing =3D imx728_set_routing,
> +       .get_frame_desc =3D imx728_get_frame_desc,
> +       .get_selection =3D imx728_get_selection,
> +};
> +
> +static const struct v4l2_subdev_ops imx728_subdev_ops =3D {
> +       .core  =3D &imx728_core_ops,
> +       .video =3D &imx728_subdev_video_ops,
> +       .pad   =3D &imx728_subdev_pad_ops,
> +};
> +
> +static const struct v4l2_ctrl_ops imx728_ctrl_ops =3D {
> +       .s_ctrl =3D imx728_set_ctrl,
> +};
> +
> +static int imx728_probe(struct i2c_client *client)
> +{
> +       struct imx728 *imx728;
> +       struct v4l2_subdev *sd;
> +       struct v4l2_ctrl_handler *ctrl_hdr;
> +       int ret;
> +
> +       imx728 =3D devm_kzalloc(&client->dev, sizeof(*imx728), GFP_KERNEL=
);
> +       if (!imx728)
> +               return -ENOMEM;
> +
> +       imx728->dev =3D &client->dev;
> +
> +       imx728->regmap =3D devm_cci_regmap_init_i2c(client, 16);
> +       if (IS_ERR(imx728->regmap))
> +               return PTR_ERR(imx728->regmap);
> +
> +       imx728->reset_gpio =3D devm_gpiod_get_optional(imx728->dev,
> +                                            "reset", GPIOD_OUT_LOW);
> +       if (IS_ERR(imx728->reset_gpio))
> +               return PTR_ERR(imx728->reset_gpio);
> +
> +       imx728->clk =3D devm_clk_get(imx728->dev, "inck");
> +       if (IS_ERR(imx728->clk))
> +               return PTR_ERR(imx728->clk);
> +
> +       imx728->clk_rate =3D clk_get_rate(imx728->clk);
> +       dev_dbg(imx728->dev, "inck rate: %lu Hz\n", imx728->clk_rate);
> +
> +       if (imx728->clk_rate < 18000000 || imx728->clk_rate > 30000000)
> +               return -EINVAL;
> +
> +       ret =3D imx728_power_on(imx728);
> +       if (ret < 0)
> +               return ret;
> +
> +       ret =3D imx728_detect(imx728);
> +       if (ret < 0)
> +               return ret;
> +
> +       sd =3D &imx728->subdev;
> +       v4l2_i2c_subdev_init(sd, client, &imx728_subdev_ops);
> +
> +       sd->flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE |
> +                    V4L2_SUBDEV_FL_HAS_EVENTS |
> +                    V4L2_SUBDEV_FL_STREAMS;
> +
> +       imx728->pad.flags =3D MEDIA_PAD_FL_SOURCE;
> +       sd->entity.function =3D MEDIA_ENT_F_CAM_SENSOR;
> +       ret =3D media_entity_pads_init(&sd->entity, 1, &imx728->pad);
> +       if (ret < 0) {
> +               dev_err(imx728->dev,
> +                       "%s: media entity init failed %d\n", __func__, re=
t);
> +               return ret;
> +       }
> +
> +       ctrl_hdr =3D &imx728->ctrl.handler;
> +       ret =3D v4l2_ctrl_handler_init(ctrl_hdr, 8);
> +       if (ret < 0) {
> +               dev_err(imx728->dev,
> +                       "%s: ctrl handler init failed: %d\n", __func__, r=
et);
> +               goto err_media_cleanup;
> +       }
> +
> +       mutex_init(&imx728->lock);
> +       imx728->ctrl.handler.lock =3D &imx728->lock;
> +       imx728->fps =3D IMX728_FRAMERATE_DEFAULT;
> +
> +       imx728->ctrl.exposure =3D v4l2_ctrl_new_std(ctrl_hdr, &imx728_ctr=
l_ops,
> +                                                 V4L2_CID_EXPOSURE, 0,
> +                                                 33000, 1,
> +                                                 IMX728_EXPOSURE_DEFAULT=
);
> +
> +       imx728->ctrl.again =3D v4l2_ctrl_new_std(ctrl_hdr, &imx728_ctrl_o=
ps,
> +                                              V4L2_CID_ANALOGUE_GAIN, 0,
> +                                              102, 1,
> +                                              24);
> +
> +       imx728->ctrl.wdr =3D v4l2_ctrl_new_std(ctrl_hdr, &imx728_ctrl_ops,
> +                                            V4L2_CID_WIDE_DYNAMIC_RANGE,
> +                                            0, 1, 1, 1);
> +
> +       imx728->ctrl.h_flip =3D v4l2_ctrl_new_std(ctrl_hdr, &imx728_ctrl_=
ops,
> +                                               V4L2_CID_HFLIP, 0, 1, 1, =
0);
> +
> +       imx728->ctrl.v_flip =3D v4l2_ctrl_new_std(ctrl_hdr, &imx728_ctrl_=
ops,
> +                                               V4L2_CID_VFLIP, 0, 1, 1, =
0);
> +
> +       imx728->ctrl.pg_mode =3D v4l2_ctrl_new_std_menu_items(ctrl_hdr,
> +                                       &imx728_ctrl_ops, V4L2_CID_TEST_P=
ATTERN,
> +                                       ARRAY_SIZE(imx728_ctrl_pg_qmenu) =
- 1,
> +                                       0, 0, imx728_ctrl_pg_qmenu);
> +
> +       imx728->ctrl.pixel_rate =3D v4l2_ctrl_new_std(ctrl_hdr, &imx728_c=
trl_ops,
> +                                            V4L2_CID_PIXEL_RATE,
> +                                            IMX728_PIXEL_RATE,
> +                                            IMX728_PIXEL_RATE, 1,
> +                                            IMX728_PIXEL_RATE);
> +
> +       imx728->ctrl.link_freq =3D v4l2_ctrl_new_int_menu(ctrl_hdr, &imx7=
28_ctrl_ops,
> +                                                V4L2_CID_LINK_FREQ,
> +                                                ARRAY_SIZE(imx728_link_f=
req_menu) - 1, 0,
> +                                                imx728_link_freq_menu);
> +
> +       if (imx728->ctrl.link_freq)
> +               imx728->ctrl.link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ON=
LY;
> +
> +       imx728->subdev.ctrl_handler =3D ctrl_hdr;
> +       if (imx728->ctrl.handler.error) {
> +               ret =3D imx728->ctrl.handler.error;
> +               dev_err(imx728->dev,
> +                       "%s: failed to add the ctrls: %d\n", __func__, re=
t);
> +               goto err_ctrl_free;
> +       }
> +
> +       pm_runtime_set_active(imx728->dev);
> +       pm_runtime_enable(imx728->dev);
> +       pm_runtime_set_autosuspend_delay(imx728->dev, IMX728_PM_IDLE_TIME=
OUT);
> +       pm_runtime_use_autosuspend(imx728->dev);
> +       pm_runtime_get_noresume(imx728->dev);
> +
> +       ret =3D v4l2_subdev_init_finalize(sd);
> +       if (ret < 0)
> +               goto err_pm_disable;
> +
> +       ret =3D v4l2_async_register_subdev(sd);
> +       if (ret < 0) {
> +               dev_err(imx728->dev,
> +                       "%s: v4l2 subdev register failed %d\n", __func__,=
 ret);
> +               goto err_subdev_cleanup;
> +       }
> +
> +       pm_runtime_mark_last_busy(imx728->dev);
> +       pm_runtime_put_autosuspend(imx728->dev);
> +       return 0;
> +
> +err_subdev_cleanup:
> +       v4l2_subdev_cleanup(&imx728->subdev);
> +
> +err_pm_disable:
> +       pm_runtime_dont_use_autosuspend(imx728->dev);
> +       pm_runtime_put_noidle(imx728->dev);
> +       pm_runtime_disable(imx728->dev);
> +
> +err_ctrl_free:
> +       v4l2_ctrl_handler_free(ctrl_hdr);
> +       mutex_destroy(&imx728->lock);
> +
> +err_media_cleanup:
> +       media_entity_cleanup(&imx728->subdev.entity);
> +
> +       return ret;
> +}
> +
> +static int __maybe_unused imx728_runtime_resume(struct device *dev)
> +{
> +       struct i2c_client *client =3D to_i2c_client(dev);
> +       struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> +       struct imx728 *imx728 =3D to_imx728(sd);
> +       int ret;
> +
> +       ret =3D imx728_power_on(imx728);
> +       if (ret < 0)
> +               return ret;
> +
> +       return 0;
> +}
> +
> +static int __maybe_unused imx728_runtime_suspend(struct device *dev)
> +{
> +       struct i2c_client *client =3D to_i2c_client(dev);
> +       struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> +       struct imx728 *imx728 =3D to_imx728(sd);
> +
> +       imx728_power_off(imx728);
> +
> +       return 0;
> +}
> +
> +static int __maybe_unused imx728_suspend(struct device *dev)
> +{
> +       struct i2c_client *client =3D to_i2c_client(dev);
> +       struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> +       struct imx728 *imx728 =3D to_imx728(sd);
> +       int ret;
> +
> +       if (imx728->streaming)
> +               imx728_stop_stream(imx728);
> +
> +       ret =3D pm_runtime_force_suspend(dev);
> +       if (ret < 0)
> +               dev_warn(dev, "%s: failed to suspend: %i\n", __func__, re=
t);
> +
> +       return 0;
> +}
> +
> +static int __maybe_unused imx728_resume(struct device *dev)
> +{
> +       struct i2c_client *client =3D to_i2c_client(dev);
> +       struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> +       struct imx728 *imx728 =3D to_imx728(sd);
> +       int ret;
> +
> +       ret =3D pm_runtime_force_resume(dev);
> +       if (ret < 0)
> +               dev_warn(dev, "%s: failed to resume: %i\n", __func__, ret=
);
> +
> +       if (imx728->streaming)
> +               ret =3D imx728_start_stream(imx728);
> +
> +       if (ret < 0) {
> +               imx728_stop_stream(imx728);
> +               imx728->streaming =3D 0;
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static void imx728_remove(struct i2c_client *client)
> +{
> +       struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> +       struct imx728 *imx728 =3D to_imx728(sd);
> +
> +       v4l2_async_unregister_subdev(sd);
> +       v4l2_ctrl_handler_free(&imx728->ctrl.handler);
> +       v4l2_subdev_cleanup(&imx728->subdev);
> +       media_entity_cleanup(&sd->entity);
> +       mutex_destroy(&imx728->lock);
> +
> +       pm_runtime_disable(imx728->dev);
> +       pm_runtime_dont_use_autosuspend(imx728->dev);
> +       pm_runtime_set_suspended(imx728->dev);
> +}
> +
> +static const struct dev_pm_ops imx728_pm_ops =3D {
> +       SET_RUNTIME_PM_OPS(imx728_runtime_suspend,
> +                          imx728_runtime_resume, NULL)
> +       SET_SYSTEM_SLEEP_PM_OPS(imx728_suspend, imx728_resume)
> +};
> +
> +static const struct of_device_id imx728_dt_id[] =3D {
> +       { .compatible =3D "sony,imx728" },
> +       { /* sentinel */ }
> +};
> +
> +MODULE_DEVICE_TABLE(of, imx728_dt_id);
> +
> +static struct i2c_driver imx728_i2c_driver =3D {
> +       .driver =3D {
> +               .name =3D "imx728",
> +               .of_match_table =3D imx728_dt_id,
> +               .pm =3D &imx728_pm_ops,
> +       },
> +       .probe =3D imx728_probe,
> +       .remove =3D imx728_remove,
> +};
> +
> +module_i2c_driver(imx728_i2c_driver);
> +
> +MODULE_DESCRIPTION("Camera Sensor Driver for Sony IMX728");
> +MODULE_AUTHOR("Spencer Hill <shill@d3engineering.com>");
> +MODULE_LICENSE("GPL");
>=20
> --
> 2.43.0
>=20
> Please be aware that this email includes email addresses outside of the o=
rganization.

