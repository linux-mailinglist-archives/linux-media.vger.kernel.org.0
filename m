Return-Path: <linux-media+bounces-60825-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPCWHLSo/GkNSgAAu9opvQ
	(envelope-from <linux-media+bounces-60825-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 16:59:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E097B4EAB38
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 16:58:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 987DE30ADC1C
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 14:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42ED43A1A3C;
	Thu,  7 May 2026 14:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nwZJCeON"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA2631715F;
	Thu,  7 May 2026 14:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778165388; cv=none; b=IIhMy2bO8YOR3E+T5TScCxQcXnl9F9cSfg7uCZTFc/anw99eP/PI1wesXtN9GyzEs8k6En6gEw4MIodfjdGyR5jT4OtOCgz0xR57VLYY+1nsHNeJqZD/LjxsRMvkOS6/dZ+lcSuCpVtQ3gKTaCr0B1bOnXGSJMdZ573UefH/GoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778165388; c=relaxed/simple;
	bh=3B854p8JDVUcW62cMJSoZIA0eBrt6541E8NHo2c58fQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IbtDp4UOmMCB/c6cigVBXt7ubJ898ox6+dlVZ8EKZVwe7BfqYfeoYuUp2l5W3Me7N83vW/J+lhr/hioVP9lAzz+tboHavgANFqfh0scqKsbo8cHeQ2OoLu1r2pP5mIhAC7afzj1tQzVw6NKBwdTN7LKluZLOOkc9+Vo6dKSS1Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nwZJCeON; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DE0C8664;
	Thu,  7 May 2026 16:49:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778165380;
	bh=3B854p8JDVUcW62cMJSoZIA0eBrt6541E8NHo2c58fQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nwZJCeONGGXJnd2gvDzWq4z4HhXqHF8Y80A4f78KnbNZzYqV/yY3HmRhSUGrHuiJ2
	 lskIJLnesth/lAvMeZhP30owWxvXTB64gExBuEHwkn55iFaqqWlJXKZ02XNiNLgKMC
	 EG8o98XDo839h/ZFupFIi3IgidFUh9Fx37ZHgmvQ=
Date: Thu, 7 May 2026 16:49:41 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
	20260414-imx355-24mhz-v1-1-9ae77bc6e7ec@ixit.cz
Subject: Re: [PATCH 12/13] media: imx355: Convert to new CCI register access
 helpers
Message-ID: <afylhGLYx713aRUQ@zed>
References: <20260506-media-imx355-v1-0-660685030455@raspberrypi.com>
 <20260506-media-imx355-v1-12-660685030455@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260506-media-imx355-v1-12-660685030455@raspberrypi.com>
X-Rspamd-Queue-Id: E097B4EAB38
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60825-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,raspberrypi.com:email,ideasonboard.com:dkim]
X-Rspamd-Action: no action

Hi Dave

On Wed, May 06, 2026 at 07:23:50PM +0100, Dave Stevenson wrote:
> Use the new comon CCI register access helpers to replace the private
> register access helpers in the imx355 driver.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/Kconfig  |   1 +
>  drivers/media/i2c/imx355.c | 502 ++++++++++++++++++---------------------------
>  2 files changed, 196 insertions(+), 307 deletions(-)
>
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 8f2ba4121586..38f23306722c 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -259,6 +259,7 @@ config VIDEO_IMX335
>
>  config VIDEO_IMX355
>  	tristate "Sony IMX355 sensor support"
> +	select V4L2_CCI_I2C
>  	help
>  	  This is a Video4Linux2 sensor driver for the Sony
>  	  IMX355 camera.
> diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> index c6fcd649c32a..d0e0e81d1e7c 100644
> --- a/drivers/media/i2c/imx355.c
> +++ b/drivers/media/i2c/imx355.c
> @@ -9,78 +9,80 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/unaligned.h>
>
> +#include <media/v4l2-cci.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-event.h>
>  #include <media/v4l2-fwnode.h>
>
> -#define IMX355_REG_MODE_SELECT		0x0100
> +#define IMX355_REG_MODE_SELECT		CCI_REG8(0x0100)
>  #define IMX355_MODE_STANDBY		0x00
>  #define IMX355_MODE_STREAMING		0x01
>
>  /* Chip ID */
> -#define IMX355_REG_CHIP_ID		0x0016
> +#define IMX355_REG_CHIP_ID		CCI_REG16(0x0016)
>  #define IMX355_CHIP_ID			0x0355
>
>  /* PLL registers that depend on the external clock frequency */
> -#define IMX355_REG_EXTCLK_FREQ		0x0136
> -#define IMX355_REG_PLL_VT_MUL		0x0306
> -#define IMX355_REG_PLL_OP_MUL		0x030e
> +#define IMX355_REG_EXTCLK_FREQ		CCI_REG16(0x0136)
> +#define IMX355_REG_PLL_VT_MUL		CCI_REG16(0x0306)
> +#define IMX355_REG_PLL_OP_MUL		CCI_REG16(0x030e)
>
>  /* V_TIMING internal */
> -#define IMX355_REG_FLL			0x0340
> +#define IMX355_REG_FLL			CCI_REG16(0x0340)
>  #define IMX355_FLL_MAX			0xffff
>  /* Number of lines above frame height that are required. */
>  #define IMX355_FLL_OFFSET		20
>
> -#define IMX355_REG_LLP			0x0342
> +#define IMX355_REG_LLP			CCI_REG16(0x0342)
>  #define IMX355_LLP_MAX			0xffff
>
> -#define IMX355_REG_X_ADD_START		0x0344
> -#define IMX355_REG_Y_ADD_START		0x0346
> -#define IMX355_REG_X_ADD_END		0x0348
> -#define IMX355_REG_Y_ADD_END		0x034a
> -#define IMX355_REG_X_OUT_SIZE		0x034c
> -#define IMX355_REG_Y_OUT_SIZE		0x034e
> +#define IMX355_REG_X_ADD_START		CCI_REG16(0x0344)
> +#define IMX355_REG_Y_ADD_START		CCI_REG16(0x0346)
> +#define IMX355_REG_X_ADD_END		CCI_REG16(0x0348)
> +#define IMX355_REG_Y_ADD_END		CCI_REG16(0x034a)
> +#define IMX355_REG_X_OUT_SIZE		CCI_REG16(0x034c)
> +#define IMX355_REG_Y_OUT_SIZE		CCI_REG16(0x034e)
>
>  /* Exposure control */
> -#define IMX355_REG_EXPOSURE		0x0202
> +#define IMX355_REG_EXPOSURE		CCI_REG16(0x0202)
>  #define IMX355_EXPOSURE_MIN		1
>  #define IMX355_EXPOSURE_STEP		1
>  #define IMX355_EXPOSURE_DEFAULT		0x0282
>
>  /* Analog gain control */
> -#define IMX355_REG_ANALOG_GAIN		0x0204
> +#define IMX355_REG_ANALOG_GAIN		CCI_REG16(0x0204)
>  #define IMX355_ANA_GAIN_MIN		0
>  #define IMX355_ANA_GAIN_MAX		960
>  #define IMX355_ANA_GAIN_STEP		1
>  #define IMX355_ANA_GAIN_DEFAULT		0
>
>  /* Digital gain control */
> -#define IMX355_REG_DPGA_USE_GLOBAL_GAIN	0x3070
> -#define IMX355_REG_DIG_GAIN_GLOBAL	0x020e
> +#define IMX355_REG_DPGA_USE_GLOBAL_GAIN	CCI_REG8(0x3070)
> +#define IMX355_REG_DIG_GAIN_GLOBAL	CCI_REG16(0x020e)
>  #define IMX355_DGTL_GAIN_MIN		256
>  #define IMX355_DGTL_GAIN_MAX		4095
>  #define IMX355_DGTL_GAIN_STEP		1
>  #define IMX355_DGTL_GAIN_DEFAULT	256
>
>  /* Test Pattern Control */
> -#define IMX355_REG_TEST_PATTERN		0x0600
> +#define IMX355_REG_TEST_PATTERN		CCI_REG8(0x0600)
>  #define IMX355_TEST_PATTERN_DISABLED		0
>  #define IMX355_TEST_PATTERN_SOLID_COLOR		1
>  #define IMX355_TEST_PATTERN_COLOR_BARS		2
>  #define IMX355_TEST_PATTERN_GRAY_COLOR_BARS	3
>  #define IMX355_TEST_PATTERN_PN9			4
>
> -#define IMX355_REG_BINNING_MODE		0x0900
> -#define IMX355_REG_BINNING_TYPE		0x0901
> -#define IMX355_REG_BINNING_WEIGHTING	0x0902
> +#define IMX355_REG_BINNING_MODE		CCI_REG8(0x0900)
> +#define IMX355_REG_BINNING_TYPE		CCI_REG8(0x0901)
> +#define IMX355_REG_BINNING_WEIGHTING	CCI_REG8(0x0902)
>
>  /* Flip Control */
> -#define IMX355_REG_ORIENTATION		0x0101
> +#define IMX355_REG_ORIENTATION		CCI_REG8(0x0101)
>
>  /* default link frequency and external clock */
>  #define IMX355_LINK_FREQ_DEFAULT	360000000LL
> @@ -93,14 +95,9 @@
>  #define IMX355_PIXEL_ARRAY_WIDTH	3280
>  #define IMX355_PIXEL_ARRAY_HEIGHT	2464
>
> -struct imx355_reg {
> -	u16 address;
> -	u8 val;
> -};
> -
>  struct imx355_reg_list {
>  	u32 num_of_regs;
> -	const struct imx355_reg *regs;
> +	const struct cci_reg_sequence *regs;
>  };
>
>  /* Mode : resolution and related config&values */
> @@ -160,6 +157,7 @@ struct imx355_hwcfg {
>  struct imx355 {
>  	struct device *dev;
>  	struct clk *clk;
> +	struct regmap *regmap;
>
>  	struct v4l2_subdev sd;
>  	struct media_pad pad;
> @@ -196,152 +194,147 @@ static const struct regulator_bulk_data imx355_supplies[] = {
>  	{ .supply = "dovdd" },
>  };
>
> -static const struct imx355_reg imx355_global_regs[] = {
> -	{ 0x304e, 0x03 },
> -	{ 0x4348, 0x16 },
> -	{ 0x4350, 0x19 },
> -	{ 0x4408, 0x0a },
> -	{ 0x440c, 0x0b },
> -	{ 0x4411, 0x5f },
> -	{ 0x4412, 0x2c },
> -	{ 0x4623, 0x00 },
> -	{ 0x462c, 0x0f },
> -	{ 0x462d, 0x00 },
> -	{ 0x462e, 0x00 },
> -	{ 0x4684, 0x54 },
> -	{ 0x480a, 0x07 },
> -	{ 0x4908, 0x07 },
> -	{ 0x4909, 0x07 },
> -	{ 0x490d, 0x0a },
> -	{ 0x491e, 0x0f },
> -	{ 0x4921, 0x06 },
> -	{ 0x4923, 0x28 },
> -	{ 0x4924, 0x28 },
> -	{ 0x4925, 0x29 },
> -	{ 0x4926, 0x29 },
> -	{ 0x4927, 0x1f },
> -	{ 0x4928, 0x20 },
> -	{ 0x4929, 0x20 },
> -	{ 0x492a, 0x20 },
> -	{ 0x492c, 0x05 },
> -	{ 0x492d, 0x06 },
> -	{ 0x492e, 0x06 },
> -	{ 0x492f, 0x06 },
> -	{ 0x4930, 0x03 },
> -	{ 0x4931, 0x04 },
> -	{ 0x4932, 0x04 },
> -	{ 0x4933, 0x05 },
> -	{ 0x595e, 0x01 },
> -	{ 0x5963, 0x01 },
> -	{ 0x3030, 0x01 },
> -	{ 0x3031, 0x01 },
> -	{ 0x3045, 0x01 },
> -	{ 0x4010, 0x00 },
> -	{ 0x4011, 0x00 },
> -	{ 0x4012, 0x00 },
> -	{ 0x4013, 0x01 },
> -	{ 0x68a8, 0xfe },
> -	{ 0x68a9, 0xff },
> -	{ 0x6888, 0x00 },
> -	{ 0x6889, 0x00 },
> -	{ 0x68b0, 0x00 },
> -	{ 0x3058, 0x00 },
> -	{ 0x305a, 0x00 },
> -	{ 0x0112, 0x0a },
> -	{ 0x0113, 0x0a },
> -	{ 0x0114, 0x03 },
> -	{ 0x0301, 0x05 },
> -	{ 0x0303, 0x01 },
> -	{ 0x0305, 0x02 },
> -	{ 0x030d, 0x02 },
> -	{ 0x0310, 0x00 },
> -	{ 0x0220, 0x00 },
> -	{ 0x0222, 0x01 },
> -	{ 0x0820, 0x0b },
> -	{ 0x0821, 0x40 },
> -	{ 0x3088, 0x04 },
> -	{ 0x6813, 0x02 },
> -	{ 0x6835, 0x07 },
> -	{ 0x6836, 0x01 },
> -	{ 0x6837, 0x04 },
> -	{ 0x684d, 0x07 },
> -	{ 0x684e, 0x01 },
> -	{ 0x684f, 0x04 },
> +static const struct cci_reg_sequence imx355_global_regs[] = {
> +	{ CCI_REG8(0x304e), 0x03 },
> +	{ CCI_REG8(0x4348), 0x16 },
> +	{ CCI_REG8(0x4350), 0x19 },
> +	{ CCI_REG8(0x4408), 0x0a },
> +	{ CCI_REG8(0x440c), 0x0b },
> +	{ CCI_REG8(0x4411), 0x5f },
> +	{ CCI_REG8(0x4412), 0x2c },
> +	{ CCI_REG8(0x4623), 0x00 },
> +	{ CCI_REG8(0x462c), 0x0f },
> +	{ CCI_REG8(0x462d), 0x00 },
> +	{ CCI_REG8(0x462e), 0x00 },
> +	{ CCI_REG8(0x4684), 0x54 },
> +	{ CCI_REG8(0x480a), 0x07 },
> +	{ CCI_REG8(0x4908), 0x07 },
> +	{ CCI_REG8(0x4909), 0x07 },
> +	{ CCI_REG8(0x490d), 0x0a },
> +	{ CCI_REG8(0x491e), 0x0f },
> +	{ CCI_REG8(0x4921), 0x06 },
> +	{ CCI_REG8(0x4923), 0x28 },
> +	{ CCI_REG8(0x4924), 0x28 },
> +	{ CCI_REG8(0x4925), 0x29 },
> +	{ CCI_REG8(0x4926), 0x29 },
> +	{ CCI_REG8(0x4927), 0x1f },
> +	{ CCI_REG8(0x4928), 0x20 },
> +	{ CCI_REG8(0x4929), 0x20 },
> +	{ CCI_REG8(0x492a), 0x20 },
> +	{ CCI_REG8(0x492c), 0x05 },
> +	{ CCI_REG8(0x492d), 0x06 },
> +	{ CCI_REG8(0x492e), 0x06 },
> +	{ CCI_REG8(0x492f), 0x06 },
> +	{ CCI_REG8(0x4930), 0x03 },
> +	{ CCI_REG8(0x4931), 0x04 },
> +	{ CCI_REG8(0x4932), 0x04 },
> +	{ CCI_REG8(0x4933), 0x05 },
> +	{ CCI_REG8(0x595e), 0x01 },
> +	{ CCI_REG8(0x5963), 0x01 },
> +	{ CCI_REG8(0x3030), 0x01 },
> +	{ CCI_REG8(0x3031), 0x01 },
> +	{ CCI_REG8(0x3045), 0x01 },
> +	{ CCI_REG8(0x4010), 0x00 },
> +	{ CCI_REG8(0x4011), 0x00 },
> +	{ CCI_REG8(0x4012), 0x00 },
> +	{ CCI_REG8(0x4013), 0x01 },
> +	{ CCI_REG8(0x68a8), 0xfe },
> +	{ CCI_REG8(0x68a9), 0xff },
> +	{ CCI_REG8(0x6888), 0x00 },
> +	{ CCI_REG8(0x6889), 0x00 },
> +	{ CCI_REG8(0x68b0), 0x00 },
> +	{ CCI_REG8(0x3058), 0x00 },
> +	{ CCI_REG8(0x305a), 0x00 },
> +	{ CCI_REG8(0x0112), 0x0a },
> +	{ CCI_REG8(0x0113), 0x0a },
> +	{ CCI_REG8(0x0114), 0x03 },
> +	{ CCI_REG8(0x0301), 0x05 },
> +	{ CCI_REG8(0x0303), 0x01 },
> +	{ CCI_REG8(0x0305), 0x02 },
> +	{ CCI_REG8(0x030d), 0x02 },
> +	{ CCI_REG8(0x0310), 0x00 },
> +	{ CCI_REG8(0x0220), 0x00 },
> +	{ CCI_REG8(0x0222), 0x01 },
> +	{ CCI_REG8(0x0820), 0x0b },
> +	{ CCI_REG8(0x0821), 0x40 },
> +	{ CCI_REG8(0x3088), 0x04 },
> +	{ CCI_REG8(0x6813), 0x02 },
> +	{ CCI_REG8(0x6835), 0x07 },
> +	{ CCI_REG8(0x6836), 0x01 },
> +	{ CCI_REG8(0x6837), 0x04 },
> +	{ CCI_REG8(0x684d), 0x07 },
> +	{ CCI_REG8(0x684e), 0x01 },
> +	{ CCI_REG8(0x684f), 0x04 },
>  };

I admit I haven't gone through the registers to check their effective
sizes

>
> -static const struct imx355_reg_list imx355_global_setting = {
> -	.num_of_regs = ARRAY_SIZE(imx355_global_regs),
> -	.regs = imx355_global_regs,
> +static const struct cci_reg_sequence mode_3268x2448_regs[] = {
> +	{ CCI_REG8(0x0700), 0x00 },
> +	{ CCI_REG8(0x0701), 0x10 },
>  };
>
> -static const struct imx355_reg mode_3268x2448_regs[] = {
> -	{ 0x0700, 0x00 },
> -	{ 0x0701, 0x10 },
> +static const struct cci_reg_sequence mode_3264x2448_regs[] = {
> +	{ CCI_REG8(0x0700), 0x00 },
> +	{ CCI_REG8(0x0701), 0x10 },
>  };
>
> -static const struct imx355_reg mode_3264x2448_regs[] = {
> -	{ 0x0700, 0x00 },
> -	{ 0x0701, 0x10 },
> +static const struct cci_reg_sequence mode_3280x2464_regs[] = {
> +	{ CCI_REG8(0x0700), 0x00 },
> +	{ CCI_REG8(0x0701), 0x10 },
>  };
>
> -static const struct imx355_reg mode_3280x2464_regs[] = {
> -	{ 0x0700, 0x00 },
> -	{ 0x0701, 0x10 },
> +static const struct cci_reg_sequence mode_1940x1096_regs[] = {
> +	{ CCI_REG8(0x0700), 0x00 },
> +	{ CCI_REG8(0x0701), 0x10 },
>  };
>
> -static const struct imx355_reg mode_1940x1096_regs[] = {
> -	{ 0x0700, 0x00 },
> -	{ 0x0701, 0x10 },
> +static const struct cci_reg_sequence mode_1936x1096_regs[] = {
> +	{ CCI_REG8(0x0700), 0x00 },
> +	{ CCI_REG8(0x0701), 0x10 },
>  };
>
> -static const struct imx355_reg mode_1936x1096_regs[] = {
> -	{ 0x0700, 0x00 },
> -	{ 0x0701, 0x10 },
> +static const struct cci_reg_sequence mode_1924x1080_regs[] = {
> +	{ CCI_REG8(0x0700), 0x00 },
> +	{ CCI_REG8(0x0701), 0x10 },
>  };
>
> -static const struct imx355_reg mode_1924x1080_regs[] = {
> -	{ 0x0700, 0x00 },
> -	{ 0x0701, 0x10 },
> +static const struct cci_reg_sequence mode_1920x1080_regs[] = {
> +	{ CCI_REG8(0x0700), 0x00 },
> +	{ CCI_REG8(0x0701), 0x10 },
>  };
>
> -static const struct imx355_reg mode_1920x1080_regs[] = {
> -	{ 0x0700, 0x00 },
> -	{ 0x0701, 0x10 },
> +static const struct cci_reg_sequence mode_1640x1232_regs[] = {
> +	{ CCI_REG8(0x0700), 0x00 },
> +	{ CCI_REG8(0x0701), 0x10 },
>  };
>
> -static const struct imx355_reg mode_1640x1232_regs[] = {
> -	{ 0x0700, 0x00 },
> -	{ 0x0701, 0x10 },
> +static const struct cci_reg_sequence mode_1640x922_regs[] = {
> +	{ CCI_REG8(0x0700), 0x00 },
> +	{ CCI_REG8(0x0701), 0x10 },
>  };
>
> -static const struct imx355_reg mode_1640x922_regs[] = {
> -	{ 0x0700, 0x00 },
> -	{ 0x0701, 0x10 },
> +static const struct cci_reg_sequence mode_1300x736_regs[] = {
> +	{ CCI_REG8(0x0700), 0x00 },
> +	{ CCI_REG8(0x0701), 0x10 },
>  };
>
> -static const struct imx355_reg mode_1300x736_regs[] = {
> -	{ 0x0700, 0x00 },
> -	{ 0x0701, 0x10 },
> +static const struct cci_reg_sequence mode_1296x736_regs[] = {
> +	{ CCI_REG8(0x0700), 0x00 },
> +	{ CCI_REG8(0x0701), 0x10 },
>  };
>
> -static const struct imx355_reg mode_1296x736_regs[] = {
> -	{ 0x0700, 0x00 },
> -	{ 0x0701, 0x10 },
> +static const struct cci_reg_sequence mode_1284x720_regs[] = {
> +	{ CCI_REG8(0x0700), 0x00 },
> +	{ CCI_REG8(0x0701), 0x10 },
>  };
>
> -static const struct imx355_reg mode_1284x720_regs[] = {
> -	{ 0x0700, 0x00 },
> -	{ 0x0701, 0x10 },
> +static const struct cci_reg_sequence mode_1280x720_regs[] = {
> +	{ CCI_REG8(0x0700), 0x00 },
> +	{ CCI_REG8(0x0701), 0x10 },
>  };
>
> -static const struct imx355_reg mode_1280x720_regs[] = {
> -	{ 0x0700, 0x00 },
> -	{ 0x0701, 0x10 },
> -};
> -
> -static const struct imx355_reg mode_820x616_regs[] = {
> -	{ 0x0700, 0x02 },
> -	{ 0x0701, 0x78 },
> +static const struct cci_reg_sequence mode_820x616_regs[] = {
> +	{ CCI_REG8(0x0700), 0x02 },
> +	{ CCI_REG8(0x0701), 0x78 },
>  };
>
>  static const char * const imx355_test_pattern_menu[] = {
> @@ -598,78 +591,6 @@ static u32 imx355_get_format_code(struct imx355 *imx355)
>  	return code;
>  }
>
> -/* Read registers up to 4 at a time */
> -static int imx355_read_reg(struct imx355 *imx355, u16 reg, u32 len, u32 *val)
> -{
> -	struct i2c_client *client = v4l2_get_subdevdata(&imx355->sd);
> -	struct i2c_msg msgs[2];
> -	u8 addr_buf[2];
> -	u8 data_buf[4] = { 0 };
> -	int ret;
> -
> -	if (len > 4)
> -		return -EINVAL;
> -
> -	put_unaligned_be16(reg, addr_buf);
> -	/* Write register address */
> -	msgs[0].addr = client->addr;
> -	msgs[0].flags = 0;
> -	msgs[0].len = ARRAY_SIZE(addr_buf);
> -	msgs[0].buf = addr_buf;
> -
> -	/* Read data from register */
> -	msgs[1].addr = client->addr;
> -	msgs[1].flags = I2C_M_RD;
> -	msgs[1].len = len;
> -	msgs[1].buf = &data_buf[4 - len];
> -
> -	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
> -	if (ret != ARRAY_SIZE(msgs))
> -		return -EIO;
> -
> -	*val = get_unaligned_be32(data_buf);
> -
> -	return 0;
> -}
> -
> -/* Write registers up to 4 at a time */
> -static int imx355_write_reg(struct imx355 *imx355, u16 reg, u32 len, u32 val)
> -{
> -	struct i2c_client *client = v4l2_get_subdevdata(&imx355->sd);
> -	u8 buf[6];
> -
> -	if (len > 4)
> -		return -EINVAL;
> -
> -	put_unaligned_be16(reg, buf);
> -	put_unaligned_be32(val << (8 * (4 - len)), buf + 2);
> -	if (i2c_master_send(client, buf, len + 2) != len + 2)
> -		return -EIO;
> -
> -	return 0;
> -}
> -
> -/* Write a list of registers */
> -static int imx355_write_regs(struct imx355 *imx355,
> -			     const struct imx355_reg *regs, u32 len)
> -{
> -	int ret;
> -	u32 i;
> -
> -	for (i = 0; i < len; i++) {
> -		ret = imx355_write_reg(imx355, regs[i].address, 1, regs[i].val);
> -		if (ret) {
> -			dev_err_ratelimited(imx355->dev,
> -					    "write reg 0x%4.4x return err %d",
> -					    regs[i].address, ret);
> -
> -			return ret;
> -		}
> -	}
> -
> -	return 0;
> -}
> -
>  /* Open sub-device */
>  static int imx355_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
>  {
> @@ -724,31 +645,31 @@ static int imx355_set_ctrl(struct v4l2_ctrl *ctrl)
>  	switch (ctrl->id) {
>  	case V4L2_CID_ANALOGUE_GAIN:
>  		/* Analog gain = 1024/(1024 - ctrl->val) times */
> -		ret = imx355_write_reg(imx355, IMX355_REG_ANALOG_GAIN, 2,
> -				       ctrl->val);
> +		ret = cci_write(imx355->regmap, IMX355_REG_ANALOG_GAIN,
> +				ctrl->val, NULL);
>  		break;
>  	case V4L2_CID_DIGITAL_GAIN:
> -		ret = imx355_write_reg(imx355, IMX355_REG_DIG_GAIN_GLOBAL, 2,
> -				       ctrl->val);
> +		ret = cci_write(imx355->regmap, IMX355_REG_DIG_GAIN_GLOBAL,
> +				ctrl->val, NULL);
>  		break;
>  	case V4L2_CID_EXPOSURE:
> -		ret = imx355_write_reg(imx355, IMX355_REG_EXPOSURE, 2,
> -				       ctrl->val);
> +		ret = cci_write(imx355->regmap, IMX355_REG_EXPOSURE,
> +				ctrl->val, NULL);
>  		break;
>  	case V4L2_CID_VBLANK:
>  		/* Update FLL that meets expected vertical blanking */
> -		ret = imx355_write_reg(imx355, IMX355_REG_FLL, 2,
> -				       imx355->cur_mode->height + ctrl->val);
> +		ret = cci_write(imx355->regmap, IMX355_REG_FLL,
> +				imx355->cur_mode->height + ctrl->val, NULL);
>  		break;
>  	case V4L2_CID_TEST_PATTERN:
> -		ret = imx355_write_reg(imx355, IMX355_REG_TEST_PATTERN,
> -				       2, ctrl->val);
> +		ret = cci_write(imx355->regmap, IMX355_REG_TEST_PATTERN,
> +				ctrl->val, NULL);
>  		break;
>  	case V4L2_CID_HFLIP:
>  	case V4L2_CID_VFLIP:
> -		ret = imx355_write_reg(imx355, IMX355_REG_ORIENTATION, 1,
> -				       imx355->hflip->val |
> -				       imx355->vflip->val << 1);
> +		ret = cci_write(imx355->regmap, IMX355_REG_ORIENTATION,
> +				imx355->hflip->val | imx355->vflip->val << 1,
> +				NULL);
>  		break;
>  	default:
>  		ret = -EINVAL;
> @@ -948,103 +869,64 @@ static int imx355_start_streaming(struct imx355 *imx355)
>  {
>  	const struct imx355_reg_list *reg_list;
>  	const struct imx355_mode *mode;
> -	int ret;
> +	int ret = 0;
>
>  	/* Global Setting */
> -	reg_list = &imx355_global_setting;
> -	ret = imx355_write_regs(imx355, reg_list->regs, reg_list->num_of_regs);
> -	if (ret) {
> -		dev_err(imx355->dev, "failed to set global settings");
> -		return ret;
> -	}
> +	cci_multi_reg_write(imx355->regmap, imx355_global_regs,
> +			    ARRAY_SIZE(imx355_global_regs), &ret);
>
>  	/* Apply default values of current mode */
>  	mode = imx355->cur_mode;
>  	reg_list = &mode->reg_list;
> -	ret = imx355_write_regs(imx355, reg_list->regs, reg_list->num_of_regs);
> -	if (ret) {
> -		dev_err(imx355->dev, "failed to set mode");
> -		return ret;
> -	}
> +	cci_multi_reg_write(imx355->regmap, reg_list->regs,
> +			    reg_list->num_of_regs, &ret);

I wonder if it makes sense to continue if this fails

>
>  	/* Set readout crop and size registers  */
> -	ret = imx355_write_reg(imx355, IMX355_REG_X_ADD_START, 2,
> -			       mode->x_add_start);
> -	if (ret)
> -		return ret;
> -	ret = imx355_write_reg(imx355, IMX355_REG_Y_ADD_START, 2,
> -			       mode->y_add_start);
> -	if (ret)
> -		return ret;
> -	ret = imx355_write_reg(imx355, IMX355_REG_X_ADD_END, 2,
> -			       mode->x_add_end);
> -	if (ret)
> -		return ret;
> -	ret = imx355_write_reg(imx355, IMX355_REG_Y_ADD_END, 2,
> -			       mode->y_add_end);
> -	if (ret)
> -		return ret;
> -	ret = imx355_write_reg(imx355, IMX355_REG_X_OUT_SIZE, 2,
> -			       mode->width);
> -	if (ret)
> -		return ret;
> -	ret = imx355_write_reg(imx355, IMX355_REG_Y_OUT_SIZE, 2,
> -			       mode->height);
> -	if (ret)
> -		return ret;
> -
> -	ret = imx355_write_reg(imx355, IMX355_REG_BINNING_MODE, 1,
> -			       mode->binning_mode == 0x11 ? 0x00 : 0x01);
> -	if (ret)
> -		return ret;
> -	ret = imx355_write_reg(imx355, IMX355_REG_BINNING_TYPE, 1,
> -			       mode->binning_mode);
> -	if (ret)
> -		return ret;
> -	ret = imx355_write_reg(imx355, IMX355_REG_BINNING_WEIGHTING, 1, 0x00);
> -	if (ret)
> -		return ret;
> +	cci_write(imx355->regmap, IMX355_REG_X_ADD_START, mode->x_add_start,
> +		  &ret);
> +	cci_write(imx355->regmap, IMX355_REG_Y_ADD_START, mode->y_add_start,
> +		  &ret);
> +	cci_write(imx355->regmap, IMX355_REG_X_ADD_END, mode->x_add_end, &ret);
> +	cci_write(imx355->regmap, IMX355_REG_Y_ADD_END, mode->y_add_end, &ret);
> +	cci_write(imx355->regmap, IMX355_REG_X_OUT_SIZE, mode->width, &ret);
> +	cci_write(imx355->regmap, IMX355_REG_Y_OUT_SIZE, mode->height, &ret);
> +	cci_write(imx355->regmap, IMX355_REG_BINNING_MODE,
> +		  mode->binning_mode == 0x11 ? 0x00 : 0x01, &ret);
> +	cci_write(imx355->regmap, IMX355_REG_BINNING_TYPE, mode->binning_mode,
> +		  &ret);
> +	cci_write(imx355->regmap, IMX355_REG_BINNING_WEIGHTING, 0x00, &ret);
>
>  	/* Set PLL registers for the external clock frequency */
> -	ret = imx355_write_reg(imx355, IMX355_REG_EXTCLK_FREQ, 2,
> -			       imx355->clk_params->extclk_freq);
> -	if (ret)
> -		return ret;
> -	ret = imx355_write_reg(imx355, IMX355_REG_PLL_VT_MUL, 2,
> -			       imx355->clk_params->pll_vt_mpy);
> -	if (ret)
> -		return ret;
> -	ret = imx355_write_reg(imx355, IMX355_REG_PLL_OP_MUL, 2,
> -			       imx355->clk_params->pll_op_mpy);
> -	if (ret)
> -		return ret;
> +	cci_write(imx355->regmap, IMX355_REG_EXTCLK_FREQ,
> +		  imx355->clk_params->extclk_freq, &ret);
> +	cci_write(imx355->regmap, IMX355_REG_PLL_VT_MUL,
> +		  imx355->clk_params->pll_vt_mpy, &ret);
> +	cci_write(imx355->regmap, IMX355_REG_PLL_OP_MUL,
> +		  imx355->clk_params->pll_op_mpy, &ret);
>
>  	/* set digital gain control to all color mode */
> -	ret = imx355_write_reg(imx355, IMX355_REG_DPGA_USE_GLOBAL_GAIN, 1, 1);
> -	if (ret)
> -		return ret;
> +	cci_write(imx355->regmap, IMX355_REG_DPGA_USE_GLOBAL_GAIN, 1, &ret);
>
>  	/* set line length */
> -	ret = imx355_write_reg(imx355, IMX355_REG_LLP,
> -			       imx355->hblank->val + imx355->cur_mode->width,
> -			       2);
> -	if (ret)
> -		return ret;
> +	cci_write(imx355->regmap, IMX355_REG_LLP,
> +		  imx355->hblank->val + imx355->cur_mode->width, &ret);
>
>  	/* Apply customized values from user */
> -	ret =  __v4l2_ctrl_handler_setup(imx355->sd.ctrl_handler);
> +	__v4l2_ctrl_handler_setup(imx355->sd.ctrl_handler);

This now looks a bit weird

	/* set line length */
	cci_write(imx355->regmap, IMX355_REG_LLP,
		  imx355->hblank->val + imx355->cur_mode->width, &ret);

	/* Apply customized values from user */
	__v4l2_ctrl_handler_setup(imx355->sd.ctrl_handler);
	if (ret)
		return ret;


>  	if (ret)
>  		return ret;
>
> -	return imx355_write_reg(imx355, IMX355_REG_MODE_SELECT,
> -				1, IMX355_MODE_STREAMING);
> +	cci_write(imx355->regmap, IMX355_REG_MODE_SELECT, IMX355_MODE_STREAMING,
> +		  &ret);
> +
> +	return ret;
>  }
>
>  /* Stop streaming */
>  static int imx355_stop_streaming(struct imx355 *imx355)
>  {
> -	return imx355_write_reg(imx355, IMX355_REG_MODE_SELECT,
> -				1, IMX355_MODE_STANDBY);
> +	return cci_write(imx355->regmap, IMX355_REG_MODE_SELECT,
> +			 IMX355_MODE_STANDBY, NULL);
>  }
>
>  static int imx355_set_stream(struct v4l2_subdev *sd, int enable)
> @@ -1091,14 +973,14 @@ static int imx355_set_stream(struct v4l2_subdev *sd, int enable)
>  static int imx355_identify_module(struct imx355 *imx355)
>  {
>  	int ret;
> -	u32 val;
> +	u64 val;
>
> -	ret = imx355_read_reg(imx355, IMX355_REG_CHIP_ID, 2, &val);
> +	ret = cci_read(imx355->regmap, IMX355_REG_CHIP_ID, &val, NULL);
>  	if (ret)
>  		return ret;
>
>  	if (val != IMX355_CHIP_ID) {
> -		dev_err(imx355->dev, "chip id mismatch: %x!=%x",
> +		dev_err(imx355->dev, "chip id mismatch: %x!=%llx",
>  			IMX355_CHIP_ID, val);
>  		return -EIO;
>  	}
> @@ -1345,6 +1227,12 @@ static int imx355_probe(struct i2c_client *client)
>
>  	mutex_init(&imx355->mutex);
>
> +	imx355->regmap = devm_cci_regmap_init_i2c(client, 16);
> +	if (IS_ERR(imx355->regmap)) {
> +		dev_err(imx355->dev, "Unable to initialize I2C\n");
> +		return -ENODEV;
> +	}
> +
>  	imx355->clk = devm_v4l2_sensor_clk_get(imx355->dev, NULL);
>  	if (IS_ERR(imx355->clk))
>  		return dev_err_probe(imx355->dev, PTR_ERR(imx355->clk),
>
> --
> 2.34.1
>
>

