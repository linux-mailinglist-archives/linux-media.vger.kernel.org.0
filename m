Return-Path: <linux-media+bounces-49593-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 18504CDF906
	for <lists+linux-media@lfdr.de>; Sat, 27 Dec 2025 12:32:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 202A2300B299
	for <lists+linux-media@lfdr.de>; Sat, 27 Dec 2025 11:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 305713128C1;
	Sat, 27 Dec 2025 11:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OxDr9PqS"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D673321CA03;
	Sat, 27 Dec 2025 11:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766835132; cv=none; b=p97rzONcqrFCV5H3B7n1fkOUq2raZKhM7Mh/oPEwqu0LLOZ2xkBTuC0Z0LTHsIJ09VjEzwPzesFz7j+1lLj6n5puKjdu6s7zJt+d7PkFPiVt4BpMk3MpX1VH4ywt9qkzwcDIHytYmeXUQB5Fd5RIPKqI68yuKhW+ram3th+tb6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766835132; c=relaxed/simple;
	bh=koZFI7bj5YyHZ5C8DkNnV4EEO2ZEeDsojhmPYoMLZeg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X6YULeG4UOxESfme++qUpDVYBV5XU1FR3XgmEi8ZJQTelg0cAQjp/g9AkUUkF0pK86a6Bq95uxQ4SnMt8q6Bwq0QuCtxQ5KOb4E1hQxG3ofC9RI1E+QHSfl51gA3gh6pWd4X3reNT9mdW2mUWtHbBkm5kPhDzdxKK9xX+ycS+kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OxDr9PqS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 015A7BB;
	Sat, 27 Dec 2025 12:31:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1766835113;
	bh=koZFI7bj5YyHZ5C8DkNnV4EEO2ZEeDsojhmPYoMLZeg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OxDr9PqSmcANyuwZzGQl1khEdL5tJzJyMlK0Vcd+VdBLFyvwelQ20r7vKS4WEfYA5
	 hjI/XU2h2SOA0XBLgPGE5fMrz4FecRqiHHw7vP29e6VREbEGhhsaLeXo9ogaGM1ynM
	 Kefs3gEUEUTIo94LhDsJTlODddXu+9BDiXp6d+gk=
Date: Sat, 27 Dec 2025 13:31:50 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: sakari.ailus@linux.intel.com, dave.stevenson@raspberrypi.com,
	jacopo@jmondi.org, mchehab@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com, hverkuil+cisco@kernel.org,
	johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl,
	jai.luthra@ideasonboard.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: i2c: ov5647: Convert to CCI register access
 helpers
Message-ID: <20251227113150.GH4094@pendragon.ideasonboard.com>
References: <20251226031311.2068414-1-xiaolei.wang@windriver.com>
 <20251226031311.2068414-2-xiaolei.wang@windriver.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251226031311.2068414-2-xiaolei.wang@windriver.com>

Hi Xiaolei,

Thank you for the patch.

On Fri, Dec 26, 2025 at 11:13:10AM +0800, Xiaolei Wang wrote:
> Use the new common CCI register access helpers to replace the private
> register access helpers in the ov5647 driver. This simplifies the driver
> by reducing the amount of code.
> 
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> ---
>  drivers/media/i2c/Kconfig  |   1 +
>  drivers/media/i2c/ov5647.c | 964 +++++++++++++++++--------------------
>  2 files changed, 454 insertions(+), 511 deletions(-)
> 
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 4b4db8c4f496..cce63349e71e 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -529,6 +529,7 @@ config VIDEO_OV5645
>  
>  config VIDEO_OV5647
>  	tristate "OmniVision OV5647 sensor support"
> +	select V4L2_CCI_I2C
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
>  	  OV5647 camera.
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index e193fef4fced..1f8e173417b8 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -28,6 +28,7 @@
>  #include <media/v4l2-fwnode.h>
>  #include <media/v4l2-image-sizes.h>
>  #include <media/v4l2-mediabus.h>
> +#include <media/v4l2-cci.h>

Alphabetical order please.

>  
>  /*
>   * From the datasheet, "20ms after PWDN goes low or 20ms after RESETB goes
> @@ -41,24 +42,24 @@
>  #define MIPI_CTRL00_BUS_IDLE			BIT(2)
>  #define MIPI_CTRL00_CLOCK_LANE_DISABLE		BIT(0)
>  
> -#define OV5647_SW_STANDBY		0x0100
> -#define OV5647_SW_RESET			0x0103
> -#define OV5647_REG_CHIPID_H		0x300a
> -#define OV5647_REG_CHIPID_L		0x300b
> -#define OV5640_REG_PAD_OUT		0x300d
> -#define OV5647_REG_EXP_HI		0x3500
> -#define OV5647_REG_EXP_MID		0x3501
> -#define OV5647_REG_EXP_LO		0x3502
> -#define OV5647_REG_AEC_AGC		0x3503
> -#define OV5647_REG_GAIN_HI		0x350a
> -#define OV5647_REG_GAIN_LO		0x350b
> -#define OV5647_REG_VTS_HI		0x380e
> +#define OV5647_SW_STANDBY		CCI_REG8(0x0100)
> +#define OV5647_SW_RESET			CCI_REG8(0x0103)
> +#define OV5647_REG_CHIPID_H		CCI_REG8(0x300a)
> +#define OV5647_REG_CHIPID_L		CCI_REG8(0x300b)

You can use a 16-bit register here.

> +#define OV5640_REG_PAD_OUT		CCI_REG8(0x300d)
> +#define OV5647_REG_EXP_HI		CCI_REG8(0x3500)
> +#define OV5647_REG_EXP_MID		CCI_REG8(0x3501)
> +#define OV5647_REG_EXP_LO		CCI_REG8(0x3502)

And a 24-bit register here.

> +#define OV5647_REG_AEC_AGC		CCI_REG8(0x3503)
> +#define OV5647_REG_GAIN_HI		CCI_REG8(0x350a)
> +#define OV5647_REG_GAIN_LO		CCI_REG8(0x350b)

16-bit register.

> +#define OV5647_REG_VTS_HI		CCI_REG16(0x380e)
>  #define OV5647_REG_VTS_LO		0x380f

16-bit register.

> -#define OV5647_REG_FRAME_OFF_NUMBER	0x4202
> -#define OV5647_REG_MIPI_CTRL00		0x4800
> -#define OV5647_REG_MIPI_CTRL14		0x4814
> -#define OV5647_REG_AWB			0x5001
> -#define OV5647_REG_ISPCTRL3D		0x503d
> +#define OV5647_REG_FRAME_OFF_NUMBER	CCI_REG8(0x4202)
> +#define OV5647_REG_MIPI_CTRL00		CCI_REG8(0x4800)
> +#define OV5647_REG_MIPI_CTRL14		CCI_REG8(0x4814)
> +#define OV5647_REG_AWB			CCI_REG8(0x5001)
> +#define OV5647_REG_ISPCTRL3D		CCI_REG8(0x503d)
>  
>  #define REG_TERM 0xfffe
>  #define VAL_TERM 0xfe
> @@ -81,23 +82,19 @@
>  #define OV5647_EXPOSURE_DEFAULT		1000
>  #define OV5647_EXPOSURE_MAX		65535
>  
> -struct regval_list {
> -	u16 addr;
> -	u8 data;
> -};
> -
>  struct ov5647_mode {
>  	struct v4l2_mbus_framefmt	format;
>  	struct v4l2_rect		crop;
>  	u64				pixel_rate;
>  	int				hts;
>  	int				vts;
> -	const struct regval_list	*reg_list;
> +	const struct cci_reg_sequence	*reg_list;
>  	unsigned int			num_regs;
>  };
>  
>  struct ov5647 {
>  	struct v4l2_subdev		sd;
> +	struct regmap                   *regmap;
>  	struct media_pad		pad;
>  	struct mutex			lock;
>  	struct clk			*xclk;
> @@ -130,377 +127,377 @@ static const u8 ov5647_test_pattern_val[] = {
>  	0x81,	/* Random Data */
>  };
>  
> -static const struct regval_list sensor_oe_disable_regs[] = {
> -	{0x3000, 0x00},
> -	{0x3001, 0x00},
> -	{0x3002, 0x00},
> +static const struct cci_reg_sequence sensor_oe_disable_regs[] = {
> +	{CCI_REG8(0x3000), 0x00},
> +	{CCI_REG8(0x3001), 0x00},
> +	{CCI_REG8(0x3002), 0x00},

While at it, please add spaces within the curly braces:

	{ CCI_REG8(0x3000), 0x00 },
	{ CCI_REG8(0x3001), 0x00 },
	{ CCI_REG8(0x3002), 0x00 },

Same below.

>  };
>  
> -static const struct regval_list sensor_oe_enable_regs[] = {
> -	{0x3000, 0x0f},
> -	{0x3001, 0xff},
> -	{0x3002, 0xe4},
> +static const struct cci_reg_sequence sensor_oe_enable_regs[] = {
> +	{CCI_REG8(0x3000), 0x0f},
> +	{CCI_REG8(0x3001), 0xff},
> +	{CCI_REG8(0x3002), 0xe4},
>  };
>  
> -static struct regval_list ov5647_2592x1944_10bpp[] = {
> -	{0x0100, 0x00},
> -	{0x0103, 0x01},
> -	{0x3034, 0x1a},
> -	{0x3035, 0x21},
> -	{0x3036, 0x69},
> -	{0x303c, 0x11},
> -	{0x3106, 0xf5},
> -	{0x3821, 0x06},
> -	{0x3820, 0x00},
> -	{0x3827, 0xec},
> -	{0x370c, 0x03},
> -	{0x3612, 0x5b},
> -	{0x3618, 0x04},
> -	{0x5000, 0x06},
> -	{0x5002, 0x41},
> -	{0x5003, 0x08},
> -	{0x5a00, 0x08},
> -	{0x3000, 0x00},
> -	{0x3001, 0x00},
> -	{0x3002, 0x00},
> -	{0x3016, 0x08},
> -	{0x3017, 0xe0},
> -	{0x3018, 0x44},
> -	{0x301c, 0xf8},
> -	{0x301d, 0xf0},
> -	{0x3a18, 0x00},
> -	{0x3a19, 0xf8},
> -	{0x3c01, 0x80},
> -	{0x3b07, 0x0c},
> -	{0x380c, 0x0b},
> -	{0x380d, 0x1c},
> -	{0x3814, 0x11},
> -	{0x3815, 0x11},
> -	{0x3708, 0x64},
> -	{0x3709, 0x12},
> -	{0x3808, 0x0a},
> -	{0x3809, 0x20},
> -	{0x380a, 0x07},
> -	{0x380b, 0x98},
> -	{0x3800, 0x00},
> -	{0x3801, 0x00},
> -	{0x3802, 0x00},
> -	{0x3803, 0x00},
> -	{0x3804, 0x0a},
> -	{0x3805, 0x3f},
> -	{0x3806, 0x07},
> -	{0x3807, 0xa3},
> -	{0x3811, 0x10},
> -	{0x3813, 0x06},
> -	{0x3630, 0x2e},
> -	{0x3632, 0xe2},
> -	{0x3633, 0x23},
> -	{0x3634, 0x44},
> -	{0x3636, 0x06},
> -	{0x3620, 0x64},
> -	{0x3621, 0xe0},
> -	{0x3600, 0x37},
> -	{0x3704, 0xa0},
> -	{0x3703, 0x5a},
> -	{0x3715, 0x78},
> -	{0x3717, 0x01},
> -	{0x3731, 0x02},
> -	{0x370b, 0x60},
> -	{0x3705, 0x1a},
> -	{0x3f05, 0x02},
> -	{0x3f06, 0x10},
> -	{0x3f01, 0x0a},
> -	{0x3a08, 0x01},
> -	{0x3a09, 0x28},
> -	{0x3a0a, 0x00},
> -	{0x3a0b, 0xf6},
> -	{0x3a0d, 0x08},
> -	{0x3a0e, 0x06},
> -	{0x3a0f, 0x58},
> -	{0x3a10, 0x50},
> -	{0x3a1b, 0x58},
> -	{0x3a1e, 0x50},
> -	{0x3a11, 0x60},
> -	{0x3a1f, 0x28},
> -	{0x4001, 0x02},
> -	{0x4004, 0x04},
> -	{0x4000, 0x09},
> -	{0x4837, 0x19},
> -	{0x4800, 0x24},
> -	{0x3503, 0x03},
> -	{0x0100, 0x01},
> +static const struct cci_reg_sequence ov5647_2592x1944_10bpp[] = {
> +	{CCI_REG8(0x0100), 0x00},
> +	{CCI_REG8(0x0103), 0x01},
> +	{CCI_REG8(0x3034), 0x1a},
> +	{CCI_REG8(0x3035), 0x21},
> +	{CCI_REG8(0x3036), 0x69},
> +	{CCI_REG8(0x303c), 0x11},
> +	{CCI_REG8(0x3106), 0xf5},
> +	{CCI_REG8(0x3821), 0x06},
> +	{CCI_REG8(0x3820), 0x00},
> +	{CCI_REG8(0x3827), 0xec},
> +	{CCI_REG8(0x370c), 0x03},
> +	{CCI_REG8(0x3612), 0x5b},
> +	{CCI_REG8(0x3618), 0x04},
> +	{CCI_REG8(0x5000), 0x06},
> +	{CCI_REG8(0x5002), 0x41},
> +	{CCI_REG8(0x5003), 0x08},
> +	{CCI_REG8(0x5a00), 0x08},
> +	{CCI_REG8(0x3000), 0x00},
> +	{CCI_REG8(0x3001), 0x00},
> +	{CCI_REG8(0x3002), 0x00},
> +	{CCI_REG8(0x3016), 0x08},
> +	{CCI_REG8(0x3017), 0xe0},
> +	{CCI_REG8(0x3018), 0x44},
> +	{CCI_REG8(0x301c), 0xf8},
> +	{CCI_REG8(0x301d), 0xf0},
> +	{CCI_REG8(0x3a18), 0x00},
> +	{CCI_REG8(0x3a19), 0xf8},
> +	{CCI_REG8(0x3c01), 0x80},
> +	{CCI_REG8(0x3b07), 0x0c},
> +	{CCI_REG8(0x380c), 0x0b},
> +	{CCI_REG8(0x380d), 0x1c},
> +	{CCI_REG8(0x3814), 0x11},
> +	{CCI_REG8(0x3815), 0x11},
> +	{CCI_REG8(0x3708), 0x64},
> +	{CCI_REG8(0x3709), 0x12},
> +	{CCI_REG8(0x3808), 0x0a},
> +	{CCI_REG8(0x3809), 0x20},
> +	{CCI_REG8(0x380a), 0x07},
> +	{CCI_REG8(0x380b), 0x98},
> +	{CCI_REG8(0x3800), 0x00},
> +	{CCI_REG8(0x3801), 0x00},
> +	{CCI_REG8(0x3802), 0x00},
> +	{CCI_REG8(0x3803), 0x00},
> +	{CCI_REG8(0x3804), 0x0a},
> +	{CCI_REG8(0x3805), 0x3f},
> +	{CCI_REG8(0x3806), 0x07},
> +	{CCI_REG8(0x3807), 0xa3},
> +	{CCI_REG8(0x3811), 0x10},
> +	{CCI_REG8(0x3813), 0x06},
> +	{CCI_REG8(0x3630), 0x2e},
> +	{CCI_REG8(0x3632), 0xe2},
> +	{CCI_REG8(0x3633), 0x23},
> +	{CCI_REG8(0x3634), 0x44},
> +	{CCI_REG8(0x3636), 0x06},
> +	{CCI_REG8(0x3620), 0x64},
> +	{CCI_REG8(0x3621), 0xe0},
> +	{CCI_REG8(0x3600), 0x37},
> +	{CCI_REG8(0x3704), 0xa0},
> +	{CCI_REG8(0x3703), 0x5a},
> +	{CCI_REG8(0x3715), 0x78},
> +	{CCI_REG8(0x3717), 0x01},
> +	{CCI_REG8(0x3731), 0x02},
> +	{CCI_REG8(0x370b), 0x60},
> +	{CCI_REG8(0x3705), 0x1a},
> +	{CCI_REG8(0x3f05), 0x02},
> +	{CCI_REG8(0x3f06), 0x10},
> +	{CCI_REG8(0x3f01), 0x0a},
> +	{CCI_REG8(0x3a08), 0x01},
> +	{CCI_REG8(0x3a09), 0x28},
> +	{CCI_REG8(0x3a0a), 0x00},
> +	{CCI_REG8(0x3a0b), 0xf6},
> +	{CCI_REG8(0x3a0d), 0x08},
> +	{CCI_REG8(0x3a0e), 0x06},
> +	{CCI_REG8(0x3a0f), 0x58},
> +	{CCI_REG8(0x3a10), 0x50},
> +	{CCI_REG8(0x3a1b), 0x58},
> +	{CCI_REG8(0x3a1e), 0x50},
> +	{CCI_REG8(0x3a11), 0x60},
> +	{CCI_REG8(0x3a1f), 0x28},
> +	{CCI_REG8(0x4001), 0x02},
> +	{CCI_REG8(0x4004), 0x04},
> +	{CCI_REG8(0x4000), 0x09},
> +	{CCI_REG8(0x4837), 0x19},
> +	{CCI_REG8(0x4800), 0x24},
> +	{CCI_REG8(0x3503), 0x03},
> +	{CCI_REG8(0x0100), 0x01},
>  };
>  
> -static struct regval_list ov5647_1080p30_10bpp[] = {
> -	{0x0100, 0x00},
> -	{0x0103, 0x01},
> -	{0x3034, 0x1a},
> -	{0x3035, 0x21},
> -	{0x3036, 0x62},
> -	{0x303c, 0x11},
> -	{0x3106, 0xf5},
> -	{0x3821, 0x06},
> -	{0x3820, 0x00},
> -	{0x3827, 0xec},
> -	{0x370c, 0x03},
> -	{0x3612, 0x5b},
> -	{0x3618, 0x04},
> -	{0x5000, 0x06},
> -	{0x5002, 0x41},
> -	{0x5003, 0x08},
> -	{0x5a00, 0x08},
> -	{0x3000, 0x00},
> -	{0x3001, 0x00},
> -	{0x3002, 0x00},
> -	{0x3016, 0x08},
> -	{0x3017, 0xe0},
> -	{0x3018, 0x44},
> -	{0x301c, 0xf8},
> -	{0x301d, 0xf0},
> -	{0x3a18, 0x00},
> -	{0x3a19, 0xf8},
> -	{0x3c01, 0x80},
> -	{0x3b07, 0x0c},
> -	{0x380c, 0x09},
> -	{0x380d, 0x70},
> -	{0x3814, 0x11},
> -	{0x3815, 0x11},
> -	{0x3708, 0x64},
> -	{0x3709, 0x12},
> -	{0x3808, 0x07},
> -	{0x3809, 0x80},
> -	{0x380a, 0x04},
> -	{0x380b, 0x38},
> -	{0x3800, 0x01},
> -	{0x3801, 0x5c},
> -	{0x3802, 0x01},
> -	{0x3803, 0xb2},
> -	{0x3804, 0x08},
> -	{0x3805, 0xe3},
> -	{0x3806, 0x05},
> -	{0x3807, 0xf1},
> -	{0x3811, 0x04},
> -	{0x3813, 0x02},
> -	{0x3630, 0x2e},
> -	{0x3632, 0xe2},
> -	{0x3633, 0x23},
> -	{0x3634, 0x44},
> -	{0x3636, 0x06},
> -	{0x3620, 0x64},
> -	{0x3621, 0xe0},
> -	{0x3600, 0x37},
> -	{0x3704, 0xa0},
> -	{0x3703, 0x5a},
> -	{0x3715, 0x78},
> -	{0x3717, 0x01},
> -	{0x3731, 0x02},
> -	{0x370b, 0x60},
> -	{0x3705, 0x1a},
> -	{0x3f05, 0x02},
> -	{0x3f06, 0x10},
> -	{0x3f01, 0x0a},
> -	{0x3a08, 0x01},
> -	{0x3a09, 0x4b},
> -	{0x3a0a, 0x01},
> -	{0x3a0b, 0x13},
> -	{0x3a0d, 0x04},
> -	{0x3a0e, 0x03},
> -	{0x3a0f, 0x58},
> -	{0x3a10, 0x50},
> -	{0x3a1b, 0x58},
> -	{0x3a1e, 0x50},
> -	{0x3a11, 0x60},
> -	{0x3a1f, 0x28},
> -	{0x4001, 0x02},
> -	{0x4004, 0x04},
> -	{0x4000, 0x09},
> -	{0x4837, 0x19},
> -	{0x4800, 0x34},
> -	{0x3503, 0x03},
> -	{0x0100, 0x01},
> +static const struct cci_reg_sequence ov5647_1080p30_10bpp[] = {
> +	{CCI_REG8(0x0100), 0x00},
> +	{CCI_REG8(0x0103), 0x01},
> +	{CCI_REG8(0x3034), 0x1a},
> +	{CCI_REG8(0x3035), 0x21},
> +	{CCI_REG8(0x3036), 0x62},
> +	{CCI_REG8(0x303c), 0x11},
> +	{CCI_REG8(0x3106), 0xf5},
> +	{CCI_REG8(0x3821), 0x06},
> +	{CCI_REG8(0x3820), 0x00},
> +	{CCI_REG8(0x3827), 0xec},
> +	{CCI_REG8(0x370c), 0x03},
> +	{CCI_REG8(0x3612), 0x5b},
> +	{CCI_REG8(0x3618), 0x04},
> +	{CCI_REG8(0x5000), 0x06},
> +	{CCI_REG8(0x5002), 0x41},
> +	{CCI_REG8(0x5003), 0x08},
> +	{CCI_REG8(0x5a00), 0x08},
> +	{CCI_REG8(0x3000), 0x00},
> +	{CCI_REG8(0x3001), 0x00},
> +	{CCI_REG8(0x3002), 0x00},
> +	{CCI_REG8(0x3016), 0x08},
> +	{CCI_REG8(0x3017), 0xe0},
> +	{CCI_REG8(0x3018), 0x44},
> +	{CCI_REG8(0x301c), 0xf8},
> +	{CCI_REG8(0x301d), 0xf0},
> +	{CCI_REG8(0x3a18), 0x00},
> +	{CCI_REG8(0x3a19), 0xf8},
> +	{CCI_REG8(0x3c01), 0x80},
> +	{CCI_REG8(0x3b07), 0x0c},
> +	{CCI_REG8(0x380c), 0x09},
> +	{CCI_REG8(0x380d), 0x70},
> +	{CCI_REG8(0x3814), 0x11},
> +	{CCI_REG8(0x3815), 0x11},
> +	{CCI_REG8(0x3708), 0x64},
> +	{CCI_REG8(0x3709), 0x12},
> +	{CCI_REG8(0x3808), 0x07},
> +	{CCI_REG8(0x3809), 0x80},
> +	{CCI_REG8(0x380a), 0x04},
> +	{CCI_REG8(0x380b), 0x38},
> +	{CCI_REG8(0x3800), 0x01},
> +	{CCI_REG8(0x3801), 0x5c},
> +	{CCI_REG8(0x3802), 0x01},
> +	{CCI_REG8(0x3803), 0xb2},
> +	{CCI_REG8(0x3804), 0x08},
> +	{CCI_REG8(0x3805), 0xe3},
> +	{CCI_REG8(0x3806), 0x05},
> +	{CCI_REG8(0x3807), 0xf1},
> +	{CCI_REG8(0x3811), 0x04},
> +	{CCI_REG8(0x3813), 0x02},
> +	{CCI_REG8(0x3630), 0x2e},
> +	{CCI_REG8(0x3632), 0xe2},
> +	{CCI_REG8(0x3633), 0x23},
> +	{CCI_REG8(0x3634), 0x44},
> +	{CCI_REG8(0x3636), 0x06},
> +	{CCI_REG8(0x3620), 0x64},
> +	{CCI_REG8(0x3621), 0xe0},
> +	{CCI_REG8(0x3600), 0x37},
> +	{CCI_REG8(0x3704), 0xa0},
> +	{CCI_REG8(0x3703), 0x5a},
> +	{CCI_REG8(0x3715), 0x78},
> +	{CCI_REG8(0x3717), 0x01},
> +	{CCI_REG8(0x3731), 0x02},
> +	{CCI_REG8(0x370b), 0x60},
> +	{CCI_REG8(0x3705), 0x1a},
> +	{CCI_REG8(0x3f05), 0x02},
> +	{CCI_REG8(0x3f06), 0x10},
> +	{CCI_REG8(0x3f01), 0x0a},
> +	{CCI_REG8(0x3a08), 0x01},
> +	{CCI_REG8(0x3a09), 0x4b},
> +	{CCI_REG8(0x3a0a), 0x01},
> +	{CCI_REG8(0x3a0b), 0x13},
> +	{CCI_REG8(0x3a0d), 0x04},
> +	{CCI_REG8(0x3a0e), 0x03},
> +	{CCI_REG8(0x3a0f), 0x58},
> +	{CCI_REG8(0x3a10), 0x50},
> +	{CCI_REG8(0x3a1b), 0x58},
> +	{CCI_REG8(0x3a1e), 0x50},
> +	{CCI_REG8(0x3a11), 0x60},
> +	{CCI_REG8(0x3a1f), 0x28},
> +	{CCI_REG8(0x4001), 0x02},
> +	{CCI_REG8(0x4004), 0x04},
> +	{CCI_REG8(0x4000), 0x09},
> +	{CCI_REG8(0x4837), 0x19},
> +	{CCI_REG8(0x4800), 0x34},
> +	{CCI_REG8(0x3503), 0x03},
> +	{CCI_REG8(0x0100), 0x01},
>  };
>  
> -static struct regval_list ov5647_2x2binned_10bpp[] = {
> -	{0x0100, 0x00},
> -	{0x0103, 0x01},
> -	{0x3034, 0x1a},
> -	{0x3035, 0x21},
> -	{0x3036, 0x62},
> -	{0x303c, 0x11},
> -	{0x3106, 0xf5},
> -	{0x3827, 0xec},
> -	{0x370c, 0x03},
> -	{0x3612, 0x59},
> -	{0x3618, 0x00},
> -	{0x5000, 0x06},
> -	{0x5002, 0x41},
> -	{0x5003, 0x08},
> -	{0x5a00, 0x08},
> -	{0x3000, 0x00},
> -	{0x3001, 0x00},
> -	{0x3002, 0x00},
> -	{0x3016, 0x08},
> -	{0x3017, 0xe0},
> -	{0x3018, 0x44},
> -	{0x301c, 0xf8},
> -	{0x301d, 0xf0},
> -	{0x3a18, 0x00},
> -	{0x3a19, 0xf8},
> -	{0x3c01, 0x80},
> -	{0x3b07, 0x0c},
> -	{0x3800, 0x00},
> -	{0x3801, 0x00},
> -	{0x3802, 0x00},
> -	{0x3803, 0x00},
> -	{0x3804, 0x0a},
> -	{0x3805, 0x3f},
> -	{0x3806, 0x07},
> -	{0x3807, 0xa3},
> -	{0x3808, 0x05},
> -	{0x3809, 0x10},
> -	{0x380a, 0x03},
> -	{0x380b, 0xcc},
> -	{0x380c, 0x07},
> -	{0x380d, 0x68},
> -	{0x3811, 0x0c},
> -	{0x3813, 0x06},
> -	{0x3814, 0x31},
> -	{0x3815, 0x31},
> -	{0x3630, 0x2e},
> -	{0x3632, 0xe2},
> -	{0x3633, 0x23},
> -	{0x3634, 0x44},
> -	{0x3636, 0x06},
> -	{0x3620, 0x64},
> -	{0x3621, 0xe0},
> -	{0x3600, 0x37},
> -	{0x3704, 0xa0},
> -	{0x3703, 0x5a},
> -	{0x3715, 0x78},
> -	{0x3717, 0x01},
> -	{0x3731, 0x02},
> -	{0x370b, 0x60},
> -	{0x3705, 0x1a},
> -	{0x3f05, 0x02},
> -	{0x3f06, 0x10},
> -	{0x3f01, 0x0a},
> -	{0x3a08, 0x01},
> -	{0x3a09, 0x28},
> -	{0x3a0a, 0x00},
> -	{0x3a0b, 0xf6},
> -	{0x3a0d, 0x08},
> -	{0x3a0e, 0x06},
> -	{0x3a0f, 0x58},
> -	{0x3a10, 0x50},
> -	{0x3a1b, 0x58},
> -	{0x3a1e, 0x50},
> -	{0x3a11, 0x60},
> -	{0x3a1f, 0x28},
> -	{0x4001, 0x02},
> -	{0x4004, 0x04},
> -	{0x4000, 0x09},
> -	{0x4837, 0x16},
> -	{0x4800, 0x24},
> -	{0x3503, 0x03},
> -	{0x3820, 0x41},
> -	{0x3821, 0x07},
> -	{0x350a, 0x00},
> -	{0x350b, 0x10},
> -	{0x3500, 0x00},
> -	{0x3501, 0x1a},
> -	{0x3502, 0xf0},
> -	{0x3212, 0xa0},
> -	{0x0100, 0x01},
> +static const struct cci_reg_sequence ov5647_2x2binned_10bpp[] = {
> +	{CCI_REG8(0x0100), 0x00},
> +	{CCI_REG8(0x0103), 0x01},
> +	{CCI_REG8(0x3034), 0x1a},
> +	{CCI_REG8(0x3035), 0x21},
> +	{CCI_REG8(0x3036), 0x62},
> +	{CCI_REG8(0x303c), 0x11},
> +	{CCI_REG8(0x3106), 0xf5},
> +	{CCI_REG8(0x3827), 0xec},
> +	{CCI_REG8(0x370c), 0x03},
> +	{CCI_REG8(0x3612), 0x59},
> +	{CCI_REG8(0x3618), 0x00},
> +	{CCI_REG8(0x5000), 0x06},
> +	{CCI_REG8(0x5002), 0x41},
> +	{CCI_REG8(0x5003), 0x08},
> +	{CCI_REG8(0x5a00), 0x08},
> +	{CCI_REG8(0x3000), 0x00},
> +	{CCI_REG8(0x3001), 0x00},
> +	{CCI_REG8(0x3002), 0x00},
> +	{CCI_REG8(0x3016), 0x08},
> +	{CCI_REG8(0x3017), 0xe0},
> +	{CCI_REG8(0x3018), 0x44},
> +	{CCI_REG8(0x301c), 0xf8},
> +	{CCI_REG8(0x301d), 0xf0},
> +	{CCI_REG8(0x3a18), 0x00},
> +	{CCI_REG8(0x3a19), 0xf8},
> +	{CCI_REG8(0x3c01), 0x80},
> +	{CCI_REG8(0x3b07), 0x0c},
> +	{CCI_REG8(0x3800), 0x00},
> +	{CCI_REG8(0x3801), 0x00},
> +	{CCI_REG8(0x3802), 0x00},
> +	{CCI_REG8(0x3803), 0x00},
> +	{CCI_REG8(0x3804), 0x0a},
> +	{CCI_REG8(0x3805), 0x3f},
> +	{CCI_REG8(0x3806), 0x07},
> +	{CCI_REG8(0x3807), 0xa3},
> +	{CCI_REG8(0x3808), 0x05},
> +	{CCI_REG8(0x3809), 0x10},
> +	{CCI_REG8(0x380a), 0x03},
> +	{CCI_REG8(0x380b), 0xcc},
> +	{CCI_REG8(0x380c), 0x07},
> +	{CCI_REG8(0x380d), 0x68},
> +	{CCI_REG8(0x3811), 0x0c},
> +	{CCI_REG8(0x3813), 0x06},
> +	{CCI_REG8(0x3814), 0x31},
> +	{CCI_REG8(0x3815), 0x31},
> +	{CCI_REG8(0x3630), 0x2e},
> +	{CCI_REG8(0x3632), 0xe2},
> +	{CCI_REG8(0x3633), 0x23},
> +	{CCI_REG8(0x3634), 0x44},
> +	{CCI_REG8(0x3636), 0x06},
> +	{CCI_REG8(0x3620), 0x64},
> +	{CCI_REG8(0x3621), 0xe0},
> +	{CCI_REG8(0x3600), 0x37},
> +	{CCI_REG8(0x3704), 0xa0},
> +	{CCI_REG8(0x3703), 0x5a},
> +	{CCI_REG8(0x3715), 0x78},
> +	{CCI_REG8(0x3717), 0x01},
> +	{CCI_REG8(0x3731), 0x02},
> +	{CCI_REG8(0x370b), 0x60},
> +	{CCI_REG8(0x3705), 0x1a},
> +	{CCI_REG8(0x3f05), 0x02},
> +	{CCI_REG8(0x3f06), 0x10},
> +	{CCI_REG8(0x3f01), 0x0a},
> +	{CCI_REG8(0x3a08), 0x01},
> +	{CCI_REG8(0x3a09), 0x28},
> +	{CCI_REG8(0x3a0a), 0x00},
> +	{CCI_REG8(0x3a0b), 0xf6},
> +	{CCI_REG8(0x3a0d), 0x08},
> +	{CCI_REG8(0x3a0e), 0x06},
> +	{CCI_REG8(0x3a0f), 0x58},
> +	{CCI_REG8(0x3a10), 0x50},
> +	{CCI_REG8(0x3a1b), 0x58},
> +	{CCI_REG8(0x3a1e), 0x50},
> +	{CCI_REG8(0x3a11), 0x60},
> +	{CCI_REG8(0x3a1f), 0x28},
> +	{CCI_REG8(0x4001), 0x02},
> +	{CCI_REG8(0x4004), 0x04},
> +	{CCI_REG8(0x4000), 0x09},
> +	{CCI_REG8(0x4837), 0x16},
> +	{CCI_REG8(0x4800), 0x24},
> +	{CCI_REG8(0x3503), 0x03},
> +	{CCI_REG8(0x3820), 0x41},
> +	{CCI_REG8(0x3821), 0x07},
> +	{CCI_REG8(0x350a), 0x00},
> +	{CCI_REG8(0x350b), 0x10},
> +	{CCI_REG8(0x3500), 0x00},
> +	{CCI_REG8(0x3501), 0x1a},
> +	{CCI_REG8(0x3502), 0xf0},
> +	{CCI_REG8(0x3212), 0xa0},
> +	{CCI_REG8(0x0100), 0x01},
>  };
>  
> -static struct regval_list ov5647_640x480_10bpp[] = {
> -	{0x0100, 0x00},
> -	{0x0103, 0x01},
> -	{0x3035, 0x11},
> -	{0x3036, 0x46},
> -	{0x303c, 0x11},
> -	{0x3821, 0x07},
> -	{0x3820, 0x41},
> -	{0x370c, 0x03},
> -	{0x3612, 0x59},
> -	{0x3618, 0x00},
> -	{0x5000, 0x06},
> -	{0x5003, 0x08},
> -	{0x5a00, 0x08},
> -	{0x3000, 0xff},
> -	{0x3001, 0xff},
> -	{0x3002, 0xff},
> -	{0x301d, 0xf0},
> -	{0x3a18, 0x00},
> -	{0x3a19, 0xf8},
> -	{0x3c01, 0x80},
> -	{0x3b07, 0x0c},
> -	{0x380c, 0x07},
> -	{0x380d, 0x3c},
> -	{0x3814, 0x35},
> -	{0x3815, 0x35},
> -	{0x3708, 0x64},
> -	{0x3709, 0x52},
> -	{0x3808, 0x02},
> -	{0x3809, 0x80},
> -	{0x380a, 0x01},
> -	{0x380b, 0xe0},
> -	{0x3800, 0x00},
> -	{0x3801, 0x10},
> -	{0x3802, 0x00},
> -	{0x3803, 0x00},
> -	{0x3804, 0x0a},
> -	{0x3805, 0x2f},
> -	{0x3806, 0x07},
> -	{0x3807, 0x9f},
> -	{0x3630, 0x2e},
> -	{0x3632, 0xe2},
> -	{0x3633, 0x23},
> -	{0x3634, 0x44},
> -	{0x3620, 0x64},
> -	{0x3621, 0xe0},
> -	{0x3600, 0x37},
> -	{0x3704, 0xa0},
> -	{0x3703, 0x5a},
> -	{0x3715, 0x78},
> -	{0x3717, 0x01},
> -	{0x3731, 0x02},
> -	{0x370b, 0x60},
> -	{0x3705, 0x1a},
> -	{0x3f05, 0x02},
> -	{0x3f06, 0x10},
> -	{0x3f01, 0x0a},
> -	{0x3a08, 0x01},
> -	{0x3a09, 0x2e},
> -	{0x3a0a, 0x00},
> -	{0x3a0b, 0xfb},
> -	{0x3a0d, 0x02},
> -	{0x3a0e, 0x01},
> -	{0x3a0f, 0x58},
> -	{0x3a10, 0x50},
> -	{0x3a1b, 0x58},
> -	{0x3a1e, 0x50},
> -	{0x3a11, 0x60},
> -	{0x3a1f, 0x28},
> -	{0x4001, 0x02},
> -	{0x4004, 0x02},
> -	{0x4000, 0x09},
> -	{0x3000, 0x00},
> -	{0x3001, 0x00},
> -	{0x3002, 0x00},
> -	{0x3017, 0xe0},
> -	{0x301c, 0xfc},
> -	{0x3636, 0x06},
> -	{0x3016, 0x08},
> -	{0x3827, 0xec},
> -	{0x3018, 0x44},
> -	{0x3035, 0x21},
> -	{0x3106, 0xf5},
> -	{0x3034, 0x1a},
> -	{0x301c, 0xf8},
> -	{0x4800, 0x34},
> -	{0x3503, 0x03},
> -	{0x0100, 0x01},
> +static const struct cci_reg_sequence ov5647_640x480_10bpp[] = {
> +	{CCI_REG8(0x0100), 0x00},
> +	{CCI_REG8(0x0103), 0x01},
> +	{CCI_REG8(0x3035), 0x11},
> +	{CCI_REG8(0x3036), 0x46},
> +	{CCI_REG8(0x303c), 0x11},
> +	{CCI_REG8(0x3821), 0x07},
> +	{CCI_REG8(0x3820), 0x41},
> +	{CCI_REG8(0x370c), 0x03},
> +	{CCI_REG8(0x3612), 0x59},
> +	{CCI_REG8(0x3618), 0x00},
> +	{CCI_REG8(0x5000), 0x06},
> +	{CCI_REG8(0x5003), 0x08},
> +	{CCI_REG8(0x5a00), 0x08},
> +	{CCI_REG8(0x3000), 0xff},
> +	{CCI_REG8(0x3001), 0xff},
> +	{CCI_REG8(0x3002), 0xff},
> +	{CCI_REG8(0x301d), 0xf0},
> +	{CCI_REG8(0x3a18), 0x00},
> +	{CCI_REG8(0x3a19), 0xf8},
> +	{CCI_REG8(0x3c01), 0x80},
> +	{CCI_REG8(0x3b07), 0x0c},
> +	{CCI_REG8(0x380c), 0x07},
> +	{CCI_REG8(0x380d), 0x3c},
> +	{CCI_REG8(0x3814), 0x35},
> +	{CCI_REG8(0x3815), 0x35},
> +	{CCI_REG8(0x3708), 0x64},
> +	{CCI_REG8(0x3709), 0x52},
> +	{CCI_REG8(0x3808), 0x02},
> +	{CCI_REG8(0x3809), 0x80},
> +	{CCI_REG8(0x380a), 0x01},
> +	{CCI_REG8(0x380b), 0xe0},
> +	{CCI_REG8(0x3800), 0x00},
> +	{CCI_REG8(0x3801), 0x10},
> +	{CCI_REG8(0x3802), 0x00},
> +	{CCI_REG8(0x3803), 0x00},
> +	{CCI_REG8(0x3804), 0x0a},
> +	{CCI_REG8(0x3805), 0x2f},
> +	{CCI_REG8(0x3806), 0x07},
> +	{CCI_REG8(0x3807), 0x9f},
> +	{CCI_REG8(0x3630), 0x2e},
> +	{CCI_REG8(0x3632), 0xe2},
> +	{CCI_REG8(0x3633), 0x23},
> +	{CCI_REG8(0x3634), 0x44},
> +	{CCI_REG8(0x3620), 0x64},
> +	{CCI_REG8(0x3621), 0xe0},
> +	{CCI_REG8(0x3600), 0x37},
> +	{CCI_REG8(0x3704), 0xa0},
> +	{CCI_REG8(0x3703), 0x5a},
> +	{CCI_REG8(0x3715), 0x78},
> +	{CCI_REG8(0x3717), 0x01},
> +	{CCI_REG8(0x3731), 0x02},
> +	{CCI_REG8(0x370b), 0x60},
> +	{CCI_REG8(0x3705), 0x1a},
> +	{CCI_REG8(0x3f05), 0x02},
> +	{CCI_REG8(0x3f06), 0x10},
> +	{CCI_REG8(0x3f01), 0x0a},
> +	{CCI_REG8(0x3a08), 0x01},
> +	{CCI_REG8(0x3a09), 0x2e},
> +	{CCI_REG8(0x3a0a), 0x00},
> +	{CCI_REG8(0x3a0b), 0xfb},
> +	{CCI_REG8(0x3a0d), 0x02},
> +	{CCI_REG8(0x3a0e), 0x01},
> +	{CCI_REG8(0x3a0f), 0x58},
> +	{CCI_REG8(0x3a10), 0x50},
> +	{CCI_REG8(0x3a1b), 0x58},
> +	{CCI_REG8(0x3a1e), 0x50},
> +	{CCI_REG8(0x3a11), 0x60},
> +	{CCI_REG8(0x3a1f), 0x28},
> +	{CCI_REG8(0x4001), 0x02},
> +	{CCI_REG8(0x4004), 0x02},
> +	{CCI_REG8(0x4000), 0x09},
> +	{CCI_REG8(0x3000), 0x00},
> +	{CCI_REG8(0x3001), 0x00},
> +	{CCI_REG8(0x3002), 0x00},
> +	{CCI_REG8(0x3017), 0xe0},
> +	{CCI_REG8(0x301c), 0xfc},
> +	{CCI_REG8(0x3636), 0x06},
> +	{CCI_REG8(0x3016), 0x08},
> +	{CCI_REG8(0x3827), 0xec},
> +	{CCI_REG8(0x3018), 0x44},
> +	{CCI_REG8(0x3035), 0x21},
> +	{CCI_REG8(0x3106), 0xf5},
> +	{CCI_REG8(0x3034), 0x1a},
> +	{CCI_REG8(0x301c), 0xf8},
> +	{CCI_REG8(0x4800), 0x34},
> +	{CCI_REG8(0x3503), 0x03},
> +	{CCI_REG8(0x0100), 0x01},
>  };
>  
>  static const struct ov5647_mode ov5647_modes[] = {
> @@ -594,109 +591,35 @@ static const struct ov5647_mode ov5647_modes[] = {
>  #define OV5647_DEFAULT_MODE	(&ov5647_modes[3])
>  #define OV5647_DEFAULT_FORMAT	(ov5647_modes[3].format)
>  
> -static int ov5647_write16(struct v4l2_subdev *sd, u16 reg, u16 val)
> -{
> -	unsigned char data[4] = { reg >> 8, reg & 0xff, val >> 8, val & 0xff};
> -	struct i2c_client *client = v4l2_get_subdevdata(sd);
> -	int ret;
> -
> -	ret = i2c_master_send(client, data, 4);
> -	if (ret < 0) {
> -		dev_dbg(&client->dev, "%s: i2c write error, reg: %x\n",
> -			__func__, reg);
> -		return ret;
> -	}
> -
> -	return 0;
> -}
> -
> -static int ov5647_write(struct v4l2_subdev *sd, u16 reg, u8 val)
> -{
> -	unsigned char data[3] = { reg >> 8, reg & 0xff, val};
> -	struct i2c_client *client = v4l2_get_subdevdata(sd);
> -	int ret;
> -
> -	ret = i2c_master_send(client, data, 3);
> -	if (ret < 0) {
> -		dev_dbg(&client->dev, "%s: i2c write error, reg: %x\n",
> -				__func__, reg);
> -		return ret;
> -	}
> -
> -	return 0;
> -}
> -
> -static int ov5647_read(struct v4l2_subdev *sd, u16 reg, u8 *val)
> -{
> -	struct i2c_client *client = v4l2_get_subdevdata(sd);
> -	u8 buf[2] = { reg >> 8, reg & 0xff };
> -	struct i2c_msg msg[2];
> -	int ret;
> -
> -	msg[0].addr = client->addr;
> -	msg[0].flags = client->flags;
> -	msg[0].buf = buf;
> -	msg[0].len = sizeof(buf);
> -
> -	msg[1].addr = client->addr;
> -	msg[1].flags = client->flags | I2C_M_RD;
> -	msg[1].buf = buf;
> -	msg[1].len = 1;
> -
> -	ret = i2c_transfer(client->adapter, msg, 2);
> -	if (ret != 2) {
> -		dev_err(&client->dev, "%s: i2c read error, reg: %x = %d\n",
> -			__func__, reg, ret);
> -		return ret >= 0 ? -EINVAL : ret;
> -	}
> -
> -	*val = buf[0];
> -
> -	return 0;
> -}
> -
> -static int ov5647_write_array(struct v4l2_subdev *sd,
> -			      const struct regval_list *regs, int array_size)
> -{
> -	int i, ret;
> -
> -	for (i = 0; i < array_size; i++) {
> -		ret = ov5647_write(sd, regs[i].addr, regs[i].data);
> -		if (ret < 0)
> -			return ret;
> -	}
> -
> -	return 0;
> -}
> -
>  static int ov5647_set_virtual_channel(struct v4l2_subdev *sd, int channel)
>  {
> -	u8 channel_id;
> +	struct ov5647 *sensor = to_sensor(sd);
> +	u64 channel_id;
>  	int ret;
>  
> -	ret = ov5647_read(sd, OV5647_REG_MIPI_CTRL14, &channel_id);
> +	ret = cci_read(sensor->regmap, OV5647_REG_MIPI_CTRL14, &channel_id, NULL);
>  	if (ret < 0)
>  		return ret;
>  
>  	channel_id &= ~(3 << 6);
>  
> -	return ov5647_write(sd, OV5647_REG_MIPI_CTRL14,
> -			    channel_id | (channel << 6));
> +	return cci_write(sensor->regmap, OV5647_REG_MIPI_CTRL14,
> +				channel_id | (channel << 6), NULL);

Please fix the indentation, here and everywhere below.

	return cci_write(sensor->regmap, OV5647_REG_MIPI_CTRL14,
			 channel_id | (channel << 6), NULL);

>  }
>  
>  static int ov5647_set_mode(struct v4l2_subdev *sd)
>  {
>  	struct i2c_client *client = v4l2_get_subdevdata(sd);
>  	struct ov5647 *sensor = to_sensor(sd);
> -	u8 resetval, rdval;
> +	u64 resetval, rdval;
>  	int ret;
>  
> -	ret = ov5647_read(sd, OV5647_SW_STANDBY, &rdval);
> +	ret = cci_read(sensor->regmap, OV5647_SW_STANDBY, &rdval, NULL);
>  	if (ret < 0)
>  		return ret;
>  
> -	ret = ov5647_write_array(sd, sensor->mode->reg_list,
> -				 sensor->mode->num_regs);
> +	ret = cci_multi_reg_write(sensor->regmap, sensor->mode->reg_list,
> +					sensor->mode->num_regs, NULL);
>  	if (ret < 0) {
>  		dev_err(&client->dev, "write sensor default regs error\n");
>  		return ret;
> @@ -706,13 +629,13 @@ static int ov5647_set_mode(struct v4l2_subdev *sd)
>  	if (ret < 0)
>  		return ret;
>  
> -	ret = ov5647_read(sd, OV5647_SW_STANDBY, &resetval);
> +	ret = cci_read(sensor->regmap, OV5647_SW_STANDBY, &resetval, NULL);
>  	if (ret < 0)
>  		return ret;
>  
>  	if (!(resetval & 0x01)) {
>  		dev_err(&client->dev, "Device was in SW standby");
> -		ret = ov5647_write(sd, OV5647_SW_STANDBY, 0x01);
> +		ret = cci_write(sensor->regmap, OV5647_SW_STANDBY, 0x01, NULL);
>  		if (ret < 0)
>  			return ret;
>  	}
> @@ -742,32 +665,33 @@ static int ov5647_stream_on(struct v4l2_subdev *sd)
>  		val |= MIPI_CTRL00_CLOCK_LANE_GATE |
>  		       MIPI_CTRL00_LINE_SYNC_ENABLE;
>  
> -	ret = ov5647_write(sd, OV5647_REG_MIPI_CTRL00, val);
> +	ret = cci_write(sensor->regmap, OV5647_REG_MIPI_CTRL00, val, NULL);
>  	if (ret < 0)
>  		return ret;
>  
> -	ret = ov5647_write(sd, OV5647_REG_FRAME_OFF_NUMBER, 0x00);
> +	ret = cci_write(sensor->regmap, OV5647_REG_FRAME_OFF_NUMBER, 0x00, NULL);
>  	if (ret < 0)
>  		return ret;
>  
> -	return ov5647_write(sd, OV5640_REG_PAD_OUT, 0x00);
> +	return cci_write(sensor->regmap, OV5640_REG_PAD_OUT, 0x00, NULL);

Please make use of the error chaining capability provided by
cci_write():

	cci_write(sensor->regmap, OV5647_REG_MIPI_CTRL00, val, &ret);
	cci_write(sensor->regmap, OV5647_REG_FRAME_OFF_NUMBER, 0x00, &ret);
	cci_write(sensor->regmap, OV5640_REG_PAD_OUT, 0x00, &ret);

	return ret;

(make sure ret is initialized to 0 before any call to cci_write with
&ret as the last parameter).

>  }
>  
>  static int ov5647_stream_off(struct v4l2_subdev *sd)
>  {
> +	struct ov5647 *sensor = to_sensor(sd);
>  	int ret;
>  
> -	ret = ov5647_write(sd, OV5647_REG_MIPI_CTRL00,
> +	ret = cci_write(sensor->regmap, OV5647_REG_MIPI_CTRL00,
>  			   MIPI_CTRL00_CLOCK_LANE_GATE | MIPI_CTRL00_BUS_IDLE |
> -			   MIPI_CTRL00_CLOCK_LANE_DISABLE);
> +			   MIPI_CTRL00_CLOCK_LANE_DISABLE, NULL);
>  	if (ret < 0)
>  		return ret;
>  
> -	ret = ov5647_write(sd, OV5647_REG_FRAME_OFF_NUMBER, 0x0f);
> +	ret = cci_write(sensor->regmap, OV5647_REG_FRAME_OFF_NUMBER, 0x0f, NULL);
>  	if (ret < 0)
>  		return ret;
>  
> -	return ov5647_write(sd, OV5640_REG_PAD_OUT, 0x01);
> +	return cci_write(sensor->regmap, OV5640_REG_PAD_OUT, 0x01, NULL);
>  }
>  
>  static int ov5647_power_on(struct device *dev)
> @@ -788,8 +712,8 @@ static int ov5647_power_on(struct device *dev)
>  		goto error_pwdn;
>  	}
>  
> -	ret = ov5647_write_array(&sensor->sd, sensor_oe_enable_regs,
> -				 ARRAY_SIZE(sensor_oe_enable_regs));
> +	ret = cci_multi_reg_write(sensor->regmap, sensor_oe_enable_regs,
> +				 ARRAY_SIZE(sensor_oe_enable_regs), NULL);
>  	if (ret < 0) {
>  		dev_err(dev, "write sensor_oe_enable_regs error\n");
>  		goto error_clk_disable;
> @@ -815,23 +739,23 @@ static int ov5647_power_on(struct device *dev)
>  static int ov5647_power_off(struct device *dev)
>  {
>  	struct ov5647 *sensor = dev_get_drvdata(dev);
> -	u8 rdval;
> +	u64 rdval;
>  	int ret;
>  
>  	dev_dbg(dev, "OV5647 power off\n");
>  
> -	ret = ov5647_write_array(&sensor->sd, sensor_oe_disable_regs,
> -				 ARRAY_SIZE(sensor_oe_disable_regs));
> +	ret = cci_multi_reg_write(sensor->regmap, sensor_oe_disable_regs,
> +				 ARRAY_SIZE(sensor_oe_disable_regs), NULL);
>  	if (ret < 0)
>  		dev_dbg(dev, "disable oe failed\n");
>  
>  	/* Enter software standby */
> -	ret = ov5647_read(&sensor->sd, OV5647_SW_STANDBY, &rdval);
> +	ret = cci_read(sensor->regmap, OV5647_SW_STANDBY, &rdval, NULL);
>  	if (ret < 0)
>  		dev_dbg(dev, "software standby failed\n");
>  
>  	rdval &= ~0x01;
> -	ret = ov5647_write(&sensor->sd, OV5647_SW_STANDBY, rdval);
> +	ret = cci_write(sensor->regmap, OV5647_SW_STANDBY, rdval, NULL);
>  	if (ret < 0)
>  		dev_dbg(dev, "software standby failed\n");
>  
> @@ -845,10 +769,11 @@ static int ov5647_power_off(struct device *dev)
>  static int ov5647_sensor_get_register(struct v4l2_subdev *sd,
>  				      struct v4l2_dbg_register *reg)
>  {
> +	struct ov5647 *sensor = to_sensor(sd);
>  	int ret;
> -	u8 val;
> +	u64 val;
>  
> -	ret = ov5647_read(sd, reg->reg & 0xff, &val);
> +	ret = cci_read(sensor->regmap, reg->reg & 0xff, &val, NULL);
>  	if (ret < 0)
>  		return ret;
>  
> @@ -861,7 +786,10 @@ static int ov5647_sensor_get_register(struct v4l2_subdev *sd,
>  static int ov5647_sensor_set_register(struct v4l2_subdev *sd,
>  				      const struct v4l2_dbg_register *reg)
>  {
> -	return ov5647_write(sd, reg->reg & 0xff, reg->val & 0xff);
> +	struct ov5647 *sensor = to_sensor(sd);
> +	int ret;

Unused. Please compile the kernel with -Werror before submitting a
patch.

> +
> +	return cci_write(sensor->regmap, reg->reg & 0xff, reg->val & 0xff, NULL);
>  }
>  #endif
>  
> @@ -1089,33 +1017,34 @@ static const struct v4l2_subdev_ops ov5647_subdev_ops = {
>  
>  static int ov5647_detect(struct v4l2_subdev *sd)
>  {
> +	struct ov5647 *sensor = to_sensor(sd);
>  	struct i2c_client *client = v4l2_get_subdevdata(sd);
> -	u8 read;
> +	u64 read;
>  	int ret;
>  
> -	ret = ov5647_write(sd, OV5647_SW_RESET, 0x01);
> +	ret = cci_write(sensor->regmap, OV5647_SW_RESET, 0x01, NULL);
>  	if (ret < 0)
>  		return ret;
>  
> -	ret = ov5647_read(sd, OV5647_REG_CHIPID_H, &read);
> +	ret = cci_read(sensor->regmap, OV5647_REG_CHIPID_H, &read, NULL);
>  	if (ret < 0)
>  		return ret;
>  
>  	if (read != 0x56) {
> -		dev_err(&client->dev, "ID High expected 0x56 got %x", read);
> +		dev_err(&client->dev, "ID High expected 0x56 got %llx", read);
>  		return -ENODEV;
>  	}
>  
> -	ret = ov5647_read(sd, OV5647_REG_CHIPID_L, &read);
> +	ret = cci_read(sensor->regmap, OV5647_REG_CHIPID_L, &read, NULL);
>  	if (ret < 0)
>  		return ret;
>  
>  	if (read != 0x47) {
> -		dev_err(&client->dev, "ID Low expected 0x47 got %x", read);
> +		dev_err(&client->dev, "ID Low expected 0x47 got %llx", read);
>  		return -ENODEV;
>  	}
>  
> -	return ov5647_write(sd, OV5647_SW_RESET, 0x00);
> +	return cci_write(sensor->regmap, OV5647_SW_RESET, 0x00, NULL);
>  }
>  
>  static int ov5647_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> @@ -1140,70 +1069,76 @@ static const struct v4l2_subdev_internal_ops ov5647_subdev_internal_ops = {
>  
>  static int ov5647_s_auto_white_balance(struct v4l2_subdev *sd, u32 val)
>  {
> -	return ov5647_write(sd, OV5647_REG_AWB, val ? 1 : 0);
> +	struct ov5647 *sensor = to_sensor(sd);
> +
> +	return cci_write(sensor->regmap, OV5647_REG_AWB, val ? 1 : 0, NULL);
>  }
>  
>  static int ov5647_s_autogain(struct v4l2_subdev *sd, u32 val)
>  {
> +	struct ov5647 *sensor = to_sensor(sd);
>  	int ret;
> -	u8 reg;
> +	u64 reg;
>  
>  	/* Non-zero turns on AGC by clearing bit 1.*/
> -	ret = ov5647_read(sd, OV5647_REG_AEC_AGC, &reg);
> +	ret = cci_read(sensor->regmap, OV5647_REG_AEC_AGC, &reg, NULL);
>  	if (ret)
>  		return ret;
>  
> -	return ov5647_write(sd, OV5647_REG_AEC_AGC, val ? reg & ~BIT(1)
> -							: reg | BIT(1));
> +	return cci_write(sensor->regmap, OV5647_REG_AEC_AGC, val ? reg & ~BIT(1)
> +							: reg | BIT(1), NULL);
>  }
>  
>  static int ov5647_s_exposure_auto(struct v4l2_subdev *sd, u32 val)
>  {
> +	struct ov5647 *sensor = to_sensor(sd);
>  	int ret;
> -	u8 reg;
> +	u64 reg;
>  
>  	/*
>  	 * Everything except V4L2_EXPOSURE_MANUAL turns on AEC by
>  	 * clearing bit 0.
>  	 */
> -	ret = ov5647_read(sd, OV5647_REG_AEC_AGC, &reg);
> +	ret = cci_read(sensor->regmap, OV5647_REG_AEC_AGC, &reg, NULL);
>  	if (ret)
>  		return ret;
>  
> -	return ov5647_write(sd, OV5647_REG_AEC_AGC,
> +	return cci_write(sensor->regmap, OV5647_REG_AEC_AGC,
>  			    val == V4L2_EXPOSURE_MANUAL ? reg | BIT(0)
> -							: reg & ~BIT(0));
> +							: reg & ~BIT(0), NULL);
>  }
>  
>  static int ov5647_s_analogue_gain(struct v4l2_subdev *sd, u32 val)
>  {
> +	struct ov5647 *sensor = to_sensor(sd);
>  	int ret;
>  
>  	/* 10 bits of gain, 2 in the high register. */
> -	ret = ov5647_write(sd, OV5647_REG_GAIN_HI, (val >> 8) & 3);
> +	ret = cci_write(sensor->regmap, OV5647_REG_GAIN_HI, (val >> 8) & 3, NULL);
>  	if (ret)
>  		return ret;
>  
> -	return ov5647_write(sd, OV5647_REG_GAIN_LO, val & 0xff);
> +	return cci_write(sensor->regmap, OV5647_REG_GAIN_LO, val & 0xff, NULL);
>  }
>  
>  static int ov5647_s_exposure(struct v4l2_subdev *sd, u32 val)
>  {
> +	struct ov5647 *sensor = to_sensor(sd);
>  	int ret;
>  
>  	/*
>  	 * Sensor has 20 bits, but the bottom 4 bits are fractions of a line
>  	 * which we leave as zero (and don't receive in "val").
>  	 */
> -	ret = ov5647_write(sd, OV5647_REG_EXP_HI, (val >> 12) & 0xf);
> +	ret = cci_write(sensor->regmap, OV5647_REG_EXP_HI, (val >> 12) & 0xf, NULL);
>  	if (ret)
>  		return ret;
>  
> -	ret = ov5647_write(sd, OV5647_REG_EXP_MID, (val >> 4) & 0xff);
> +	ret = cci_write(sensor->regmap, OV5647_REG_EXP_MID, (val >> 4) & 0xff, NULL);
>  	if (ret)
>  		return ret;
>  
> -	return ov5647_write(sd, OV5647_REG_EXP_LO, (val & 0xf) << 4);
> +	return cci_write(sensor->regmap, OV5647_REG_EXP_LO, (val & 0xf) << 4, NULL);
>  }
>  
>  static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
> @@ -1254,12 +1189,12 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
>  		ret = ov5647_s_exposure(sd, ctrl->val);
>  		break;
>  	case V4L2_CID_VBLANK:
> -		ret = ov5647_write16(sd, OV5647_REG_VTS_HI,
> -				     sensor->mode->format.height + ctrl->val);
> +		ret = cci_write(sensor->regmap, OV5647_REG_VTS_HI,
> +					sensor->mode->format.height + ctrl->val, NULL);

That's a bug, the OV5647_REG_VTS_LO register isn't written anymore.
Switching to a 16-bit register for OV5647_REG_VTS as mentioned above
will fix it.

>  		break;
>  	case V4L2_CID_TEST_PATTERN:
> -		ret = ov5647_write(sd, OV5647_REG_ISPCTRL3D,
> -				   ov5647_test_pattern_val[ctrl->val]);
> +		ret = cci_write(sensor->regmap, OV5647_REG_ISPCTRL3D,
> +					ov5647_test_pattern_val[ctrl->val], NULL);
>  		break;
>  
>  	/* Read-only, but we adjust it based on mode. */
> @@ -1435,6 +1370,13 @@ static int ov5647_probe(struct i2c_client *client)
>  	if (ret < 0)
>  		goto ctrl_handler_free;
>  
> +	sensor->regmap = devm_cci_regmap_init_i2c(client, 16);
> +	if (IS_ERR(sensor->regmap)) {
> +		ret = PTR_ERR(sensor->regmap);
> +		dev_err(dev, "failed to initialize CCI: %d\n", ret);
> +		goto entity_cleanup;
> +	}
> +
>  	ret = ov5647_power_on(dev);
>  	if (ret)
>  		goto entity_cleanup;

-- 
Regards,

Laurent Pinchart

