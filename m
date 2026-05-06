Return-Path: <linux-media+bounces-60526-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKv6HL3r+mkZUQMAu9opvQ
	(envelope-from <linux-media+bounces-60526-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 09:20:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD804D7227
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 09:20:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3C8E303454F
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 07:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EB03373BE8;
	Wed,  6 May 2026 07:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="sUF0hiXn"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4B53033DF;
	Wed,  6 May 2026 07:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778051751; cv=pass; b=KCkxyKD7Isk0UU41DLwIbavlsYNilrKgq+x2FCgbVscABvvtXkQJWb9mc5/v5CVX7PI/Yj8IIPQ1AzHxOa643vV83IDptjon9i+EYS0cjMMMpyMhWZG2V1rh1SVV17oh3/cjmpPZfrO+ACCx8mDRoYoqseuxlws0o4kiqqBJ1Oo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778051751; c=relaxed/simple;
	bh=qn8TJvm72AKRSgUzEZudLP0tAYrhrp1bS2/b9zyqMuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EWNZHbKrPH0iaASJNi5kLDcy2/WaZGThVhIFMlc+ROtgoVt9i5eSKeGR4cBpnYLmsSlfw+83NdgqCjJ7Q3cKhrgjTWjmIJlFXGuH4DrtrH1gxbOTKkdViW75P3SEol7AMgkJtmbYDj4DZ6Q6/TCqHdKTt/5pMgJonSbO8IDl0f4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=sUF0hiXn; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4g9RNM4pCBz49Q7v;
	Wed, 06 May 2026 10:10:11 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1778051411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BuHMuCz1yfDR2Cxmn/eXetrcgz3sPcmVZlqYg/RS6CE=;
	b=sUF0hiXnyuilitQKCL4+nSty1rhxK5rqqNsMj6E74vnnvaPjbpqnLDnytxEvQDkU8/5TLG
	b04q+94EIW69NlJKCyzUgIVgb/Ya2sldwHUP7sx1g/IBbhQ5pZ54/dJNz2CgRdErrqIDB/
	H1KJy3ICsGLXyLQV4uskFuWSHrJjDCyA2KRc6WWZ5xYbqbf7RntnA9gYCH4l+WjOJPkRn8
	YLb/EHIYqM6HlE/uVhF8myySpznxRLrxOuXYQyjlHh7NSBFR978IOtjhbgqJBwXlPmR5lT
	Bzt/fSabQRXNT6WQELq3hXUApBg1NpHxEvmicib1TVVtaVAENDjQgAbgbQcVSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1778051411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BuHMuCz1yfDR2Cxmn/eXetrcgz3sPcmVZlqYg/RS6CE=;
	b=bEVDlNHhWTlyJMsUTEuGFsOBPpgVjHB7lNR7/YA7vUntH7MRP1DQbbKNPT7gdIf60HFFsV
	bbaBJgzGUW2s1hwVvhYHxMrq1ipmWOnjTmTq6Egk5huSnykKH6nAEvejrnIlFyTgKbT38F
	yq1Vvmx/jXfV/d+XuRCfS27QsnDrv/bYPfS2kfZmkqxvVbRd4+NW/JtsrZldswzM5t6ert
	pZ6jyJa6cfoueoiraLeEuvafSfVwhmGZ3i0Z8gTIxL0ZHv1BHyARyq0KmbwVmnOw8XaclE
	dkjbxmFL8IeNW80DrGBddYOB2FBpiPmdRmkdA22SpGdsCg/8DsteDe/A603RoA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1778051411;
	b=SBzdoXyJFFcZo0yyI7nWBWt6ilbz28dlrMRhG4XqK7PwFsqVCpy3s59ri55wsCiQVkdLKQ
	yhAjh3dZU+My3JU5QoLpo2RcZi09XcmkoFcuIAhN0VoI+c5F9LfK8xm3I+mYqnhb1tzATT
	RQH4BAkcvBjp0DPelhkt4MXlQNPb44i6GId53iXO/jGcfvuXRwQNx7SPYT5pvY5EtOQJJA
	AndQXLFhzjiwBk4Lkzx3GiL42M3MySCTyRBMnMRzmdtr8e7ju1Ua8AFDFLCnqMoKKGrKf9
	K9J+RVR0GJCyF1i2hf6RmvF/R09ItSrnS/5kq7/ak4l1ygxfQZ6iGuqiMThBpA==
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 86A0A634C4E;
	Wed, 06 May 2026 10:10:09 +0300 (EEST)
Date: Wed, 6 May 2026 10:10:09 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Kate Hsuan <hpa@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Serin Yeh <serin.yeh@intel.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: i2c: imx471: Add Sony IMX471 image sensor
 driver
Message-ID: <afrpUZBxIT5ugGQV@valkosipuli.retiisi.eu>
References: <20260505061327.286700-1-hpa@redhat.com>
 <20260505061327.286700-3-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260505061327.286700-3-hpa@redhat.com>
X-Rspamd-Queue-Id: 3AD804D7227
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[iki.fi:s=lahtoruutu];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[iki.fi:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60526-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[iki.fi];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@iki.fi,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,iki.fi:dkim]

Hi Kate,

Thanks for the update. Please see my comments below.

On Tue, May 05, 2026 at 02:13:27PM +0800, Kate Hsuan wrote:
> Add a new driver for Sony imx471 camera sensor. It is based on
> Jimmy Su <jimmy.su@intel.com> implementation and the driver can be found
> in the following URL.
> https://github.com/intel/ipu6-drivers/commits/master/drivers/media/i2c/imx471.c
> 
> This sensor can be found on Lenovo X9-14 and X9-15 laptop and it is a part
> of IPU7 solution. The driver was tested on Lenovo X9-14 and X9-15 laptops.
> 
> Link: https://github.com/intel/ipu6-drivers/blob/master/drivers/media/i2c/imx471.c
> Link: https://bugzilla.redhat.com/show_bug.cgi?id=2454119

I'm not sure we need these links. But the extra newline here should go in
any case.

> 
> Signed-off-by: Kate Hsuan <hpa@redhat.com>
> ---
>  MAINTAINERS                |   6 +
>  drivers/media/i2c/Kconfig  |  10 +
>  drivers/media/i2c/Makefile |   1 +
>  drivers/media/i2c/imx471.c | 992 +++++++++++++++++++++++++++++++++++++
>  4 files changed, 1009 insertions(+)
>  create mode 100644 drivers/media/i2c/imx471.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1126fdd639ad..d597337e7c24 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -24735,6 +24735,12 @@ T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
>  F:	drivers/media/i2c/imx415.c
>  
> +SONY IMX471 SENSOR DRIVER
> +M:	Kate Hsuan <hpa@redhat.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	drivers/media/i2c/imx471.c
> +
>  SONY MEMORYSTICK SUBSYSTEM
>  M:	Maxim Levitsky <maximlevitsky@gmail.com>
>  M:	Alex Dubov <oakad@yahoo.com>
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 5eb1e0e0a87a..1c28c498a9f1 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -287,6 +287,16 @@ config VIDEO_IMX415
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called imx415.
>  
> +config VIDEO_IMX471
> +		tristate "Sony IMX471 sensor support"
> +		select V4L2_CCI_I2C
> +		help
> +		  This is a Video4Linux2 sensor driver for the Sony
> +		  IMX471 camera.
> +
> +		  To compile this driver as a module, choose M here: the
> +		  module will be called imx471.
> +
>  config VIDEO_MAX9271_LIB
>  	tristate
>  
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index a3a6396df3c4..0539e9171030 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -61,6 +61,7 @@ obj-$(CONFIG_VIDEO_IMX335) += imx335.o
>  obj-$(CONFIG_VIDEO_IMX355) += imx355.o
>  obj-$(CONFIG_VIDEO_IMX412) += imx412.o
>  obj-$(CONFIG_VIDEO_IMX415) += imx415.o
> +obj-$(CONFIG_VIDEO_IMX471) += imx471.o
>  obj-$(CONFIG_VIDEO_IR_I2C) += ir-kbd-i2c.o
>  obj-$(CONFIG_VIDEO_ISL7998X) += isl7998x.o
>  obj-$(CONFIG_VIDEO_KS0127) += ks0127.o
> diff --git a/drivers/media/i2c/imx471.c b/drivers/media/i2c/imx471.c
> new file mode 100644
> index 000000000000..e340d803ca9d
> --- /dev/null
> +++ b/drivers/media/i2c/imx471.c
> @@ -0,0 +1,992 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (C) 2025 Intel Corporation
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/unaligned.h>
> +#include <media/v4l2-cci.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-fwnode.h>
> +
> +#define IMX471_REG_MODE_SELECT		CCI_REG8(0x0100)
> +#define IMX471_MODE_STANDBY		0x00
> +#define IMX471_MODE_STREAMING		0x01
> +
> +/* Chip ID */
> +#define IMX471_REG_CHIP_ID		CCI_REG16(0x0016)
> +#define IMX471_CHIP_ID			0x0471
> +
> +/* V_TIMING internal */
> +#define IMX471_REG_FLL			CCI_REG16(0x0340)
> +#define IMX471_FLL_MAX			0xffff
> +
> +/* Exposure control */
> +#define IMX471_REG_EXPOSURE		CCI_REG16(0x0202)
> +#define IMX471_EXPOSURE_MIN		1
> +#define IMX471_EXPOSURE_STEP		1
> +#define IMX471_EXPOSURE_DEFAULT		0x04f6
> +
> +/*
> + *  the digital control register for all color control looks like:
> + *  +-§----------------+------------------+
> + *  |      [7:0]      |       [15:8]     |
> + *  +-----------------+------------------+
> + *  |	  0x020f      |       0x020e     |
> + *  --------------------------------------
> + *  it is used to calculate the digital gain times value(integral + fractional)
> + *  the [15:8] bits is the fractional part and [7:0] bits is the integral
> + *  calculation equation is:
> + *      gain value (unit: times) = REG[15:8] + REG[7:0]/0x100
> + *  Only value in 0x0100 ~ 0x0FFF range is allowed.
> + *  Analog gain use 10 bits in the registers and allowed range is 0 ~ 960
> + */
> +/* Analog gain control */
> +#define IMX471_REG_ANALOG_GAIN			CCI_REG16(0x0204)
> +#define IMX471_ANA_GAIN_MIN			0
> +#define IMX471_ANA_GAIN_MAX			960
> +#define IMX471_ANA_GAIN_STEP			1
> +#define IMX471_ANA_GAIN_DEFAULT			0
> +
> +/* Digital gain control */
> +#define IMX471_REG_DPGA_USE_GLOBAL_GAIN		CCI_REG16(0x3ff9)
> +#define IMX471_REG_DIG_GAIN_GLOBAL		CCI_REG16(0x020e)
> +#define IMX471_DGTL_GAIN_MIN			256
> +#define IMX471_DGTL_GAIN_MAX			4095
> +#define IMX471_DGTL_GAIN_STEP			1
> +#define IMX471_DGTL_GAIN_DEFAULT		256
> +
> +#define IMX471_VALUE_08BIT			1
> +
> +/* HFLIP and VFLIP control */
> +#define IMX471_REG_ORIENTATION			CCI_REG8(0x0101)
> +#define IMX471_HFLIP_BIT			BIT(0)
> +#define IMX471_VFLIP_BIT			BIT(1)
> +
> +/* Default exposure margin */
> +#define IMX471_EXPOSURE_MARGIN			18
> +
> +/* Horizontal crop window offset */
> +#define IMX471_REG_H_WIN_OFFSET			CCI_REG8(0x0409)
> +
> +/* Vertical crop window offset */
> +#define IMX471_REG_V_WIN_OFFSET			CCI_REG8(0x034b)
> +
> +/* Test Pattern Control */
> +#define IMX471_REG_TEST_PATTERN			CCI_REG8(0x0600)
> +#define IMX471_TEST_PATTERN_DISABLED		0
> +#define IMX471_TEST_PATTERN_SOLID_COLOR		1
> +#define IMX471_TEST_PATTERN_COLOR_BARS		2
> +#define IMX471_TEST_PATTERN_GRAY_COLOR_BARS	3
> +#define IMX471_TEST_PATTERN_PN9			4
> +
> +/* default link frequency and external clock */
> +#define IMX471_LINK_FREQ_DEFAULT		200000000LL
> +#define IMX471_EXT_CLK				19200000
> +#define IMX471_LINK_FREQ_INDEX			0
> +
> +#define IMX471_NUM_SUPPLIES			1

There are more regulators, aren't there? Either use
ARRAY_SIZE(imx471_supply_name) or switch to use the non-bulk API.

> +
> +#define to_imx471_data(_sd) container_of_const(_sd, \
> +					       struct imx471_data, sd)

Fits on a single line.

> +
> +static const char * const imx471_supply_name[] = {
> +	"avdd",
> +};
> +
> +/* Mode : resolution and related config&values */
> +struct imx471_mode {
> +	/* Frame width */
> +	u32 width;
> +	/* Frame height */
> +	u32 height;
> +
> +	/* V-timing */
> +	u32 fll_def;
> +	u32 fll_min;
> +
> +	/* H-timing */
> +	u32 llp;
> +
> +	/* index of link frequency */
> +	u32 link_freq_index;
> +
> +	/* Default register values */
> +	const struct cci_reg_sequence *default_mode_regs;
> +	const int default_mode_regs_length;
> +};
> +
> +struct imx471_data {
> +	struct v4l2_subdev sd;
> +	struct media_pad pad;
> +
> +	struct v4l2_ctrl_handler ctrl_handler;
> +	/* V4L2 Controls */
> +	struct v4l2_ctrl *link_freq;
> +	struct v4l2_ctrl *pixel_rate;
> +	struct v4l2_ctrl *vblank;
> +	struct v4l2_ctrl *hblank;
> +	struct v4l2_ctrl *vflip;
> +	struct v4l2_ctrl *hflip;
> +	struct v4l2_ctrl *exposure;
> +
> +	struct gpio_desc *reset_gpio;
> +	struct regulator_bulk_data supplies[IMX471_NUM_SUPPLIES];
> +	struct clk *img_clk;
> +
> +	struct device *dev;
> +	struct regmap *regmap;
> +
> +	int streaming;
> +
> +	/* True if the device has been identified */
> +	bool identified;
> +};
> +
> +static const struct cci_reg_sequence imx471_global_regs[] = {
> +	{ CCI_REG8(0x0136), 0x13 },
> +	{ CCI_REG8(0x0137), 0x33 },
> +	{ CCI_REG8(0x3c7e), 0x08 },
> +	{ CCI_REG8(0x3c7f), 0x05 },
> +	{ CCI_REG8(0x3e35), 0x00 },
> +	{ CCI_REG8(0x3e36), 0x00 },
> +	{ CCI_REG8(0x3e37), 0x00 },
> +	{ CCI_REG8(0x3f7f), 0x01 },

A lot of these appear to be 16-bit registers. It'd make sense to write them
to the sensor as such.

Quite a few of these registers also have a name, please use the names
instead of numerical values.

The sensor is probably CCS compliant to some (unknown?) degree.

> +	{ CCI_REG8(0x4431), 0x04 },
> +	{ CCI_REG8(0x531c), 0x01 },
> +	{ CCI_REG8(0x531d), 0x02 },
> +	{ CCI_REG8(0x531e), 0x04 },
> +	{ CCI_REG8(0x5928), 0x00 },
> +	{ CCI_REG8(0x5929), 0x2f },
> +	{ CCI_REG8(0x592a), 0x00 },
> +	{ CCI_REG8(0x592b), 0x85 },
> +	{ CCI_REG8(0x592c), 0x00 },
> +	{ CCI_REG8(0x592d), 0x32 },
> +	{ CCI_REG8(0x592e), 0x00 },
> +	{ CCI_REG8(0x592f), 0x88 },
> +	{ CCI_REG8(0x5930), 0x00 },
> +	{ CCI_REG8(0x5931), 0x3d },
> +	{ CCI_REG8(0x5932), 0x00 },
> +	{ CCI_REG8(0x5933), 0x93 },
> +	{ CCI_REG8(0x5938), 0x00 },
> +	{ CCI_REG8(0x5939), 0x24 },
> +	{ CCI_REG8(0x593a), 0x00 },
> +	{ CCI_REG8(0x593b), 0x7a },
> +	{ CCI_REG8(0x593c), 0x00 },
> +	{ CCI_REG8(0x593d), 0x24 },
> +	{ CCI_REG8(0x593e), 0x00 },
> +	{ CCI_REG8(0x593f), 0x7a },
> +	{ CCI_REG8(0x5940), 0x00 },
> +	{ CCI_REG8(0x5941), 0x2f },
> +	{ CCI_REG8(0x5942), 0x00 },
> +	{ CCI_REG8(0x5943), 0x85 },
> +	{ CCI_REG8(0x5f0e), 0x6e },
> +	{ CCI_REG8(0x5f11), 0xc6 },
> +	{ CCI_REG8(0x5f17), 0x5e },
> +	{ CCI_REG8(0x7990), 0x01 },
> +	{ CCI_REG8(0x7993), 0x5d },
> +	{ CCI_REG8(0x7994), 0x5d },
> +	{ CCI_REG8(0x7995), 0xa1 },
> +	{ CCI_REG8(0x799a), 0x01 },
> +	{ CCI_REG8(0x799d), 0x00 },
> +	{ CCI_REG8(0x8169), 0x01 },
> +	{ CCI_REG8(0x8359), 0x01 },
> +	{ CCI_REG8(0x9302), 0x1e },
> +	{ CCI_REG8(0x9306), 0x1f },
> +	{ CCI_REG8(0x930a), 0x26 },
> +	{ CCI_REG8(0x930e), 0x23 },
> +	{ CCI_REG8(0x9312), 0x23 },
> +	{ CCI_REG8(0x9316), 0x2c },
> +	{ CCI_REG8(0x9317), 0x19 },
> +	{ CCI_REG8(0xb046), 0x01 },
> +	{ CCI_REG8(0xb048), 0x01 },
> +};
> +
> +static const struct cci_reg_sequence mode_1928x1088_regs[] = {
> +	{ CCI_REG8(0x0101), 0x00 },
> +	{ CCI_REG8(0x0112), 0x0a },
> +	{ CCI_REG8(0x0113), 0x0a },
> +	{ CCI_REG8(0x0114), 0x03 },
> +	{ CCI_REG8(0x0342), 0x0a },
> +	{ CCI_REG8(0x0343), 0x00 },
> +	{ CCI_REG8(0x0340), 0x13 },
> +	{ CCI_REG8(0x0341), 0xb0 },
> +	{ CCI_REG8(0x0344), 0x00 },
> +	{ CCI_REG8(0x0345), 0x00 },
> +	{ CCI_REG8(0x0346), 0x01 },
> +	{ CCI_REG8(0x0347), 0xbc },
> +	{ CCI_REG8(0x0348), 0x12 },
> +	{ CCI_REG8(0x0349), 0x2f },
> +	{ CCI_REG8(0x034a), 0x0b },
> +	{ CCI_REG8(0x034b), 0xeb },
> +	{ CCI_REG8(0x0381), 0x01 },
> +	{ CCI_REG8(0x0383), 0x01 },
> +	{ CCI_REG8(0x0385), 0x01 },
> +	{ CCI_REG8(0x0387), 0x01 },
> +	{ CCI_REG8(0x0900), 0x01 },
> +	{ CCI_REG8(0x0901), 0x22 },
> +	{ CCI_REG8(0x0902), 0x08 },
> +	{ CCI_REG8(0x3f4c), 0x81 },
> +	{ CCI_REG8(0x3f4d), 0x81 },
> +	{ CCI_REG8(0x0408), 0x00 },
> +	{ CCI_REG8(0x0409), 0xc8 },
> +	{ CCI_REG8(0x040a), 0x00 },
> +	{ CCI_REG8(0x040b), 0x6c },
> +	{ CCI_REG8(0x040c), 0x07 },
> +	{ CCI_REG8(0x040d), 0x88 },
> +	{ CCI_REG8(0x040e), 0x04 },
> +	{ CCI_REG8(0x040f), 0x40 },
> +	{ CCI_REG8(0x034c), 0x07 },
> +	{ CCI_REG8(0x034d), 0x88 },
> +	{ CCI_REG8(0x034e), 0x04 },
> +	{ CCI_REG8(0x034f), 0x40 },
> +	{ CCI_REG8(0x0301), 0x06 },
> +	{ CCI_REG8(0x0303), 0x02 },
> +	{ CCI_REG8(0x0305), 0x02 },
> +	{ CCI_REG8(0x0306), 0x00 },
> +	{ CCI_REG8(0x0307), 0x79 },
> +	{ CCI_REG8(0x030b), 0x01 },
> +	{ CCI_REG8(0x030d), 0x02 },
> +	{ CCI_REG8(0x030e), 0x00 },
> +	{ CCI_REG8(0x030f), 0x53 },
> +	{ CCI_REG8(0x0310), 0x01 },
> +	{ CCI_REG8(0x0202), 0x13 },
> +	{ CCI_REG8(0x0203), 0x9e },
> +	{ CCI_REG8(0x0204), 0x00 },
> +	{ CCI_REG8(0x0205), 0x00 },
> +	{ CCI_REG8(0x020e), 0x01 },
> +	{ CCI_REG8(0x020f), 0x00 },
> +	{ CCI_REG8(0x3f78), 0x01 },
> +	{ CCI_REG8(0x3f79), 0x31 },
> +	{ CCI_REG8(0x3ffe), 0x00 },
> +	{ CCI_REG8(0x3fff), 0x8a },
> +	{ CCI_REG8(0x5f0a), 0xb6 },
> +};
> +
> +static const char * const imx471_test_pattern_menu[] = {
> +	"Disabled",
> +	"Solid Colour",
> +	"Eight Vertical Colour Bars",
> +	"Colour Bars With Fade to Grey",
> +	"Pseudorandom Sequence (PN9)",
> +};
> +
> +/*
> + * When adding more than the one below, make sure the disallowed ones will
> + * actually be disabled in the LINK_FREQ control.
> + */
> +static const s64 link_freq_menu_items[] = {
> +	IMX471_LINK_FREQ_DEFAULT,
> +};
> +
> +/*
> + * The Bayer formats for the flipping.
> + * - no flip
> + * - h flip
> + * - v flip
> + * - h and v flips
> + */
> +static const u32 imx471_mbus_formats[] = {
> +	MEDIA_BUS_FMT_SRGGB10_1X10,
> +	MEDIA_BUS_FMT_SGRBG10_1X10,
> +	MEDIA_BUS_FMT_SGBRG10_1X10,
> +	MEDIA_BUS_FMT_SBGGR10_1X10,
> +};
> +
> +/* Mode configs */
> +static const struct imx471_mode imx471_modes[] = {
> +	{
> +		.width = 1928,
> +		.height = 1088,
> +		.fll_def = 1308,
> +		.fll_min = 1308,
> +		.llp = 2328,
> +		.link_freq_index = IMX471_LINK_FREQ_INDEX,
> +		.default_mode_regs = mode_1928x1088_regs,
> +		.default_mode_regs_length = ARRAY_SIZE(mode_1928x1088_regs),
> +	},
> +};
> +
> +static int imx471_get_regulators(struct device *dev, struct imx471_data *sensor)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < IMX471_NUM_SUPPLIES; i++)

You could declare i here.

> +		sensor->supplies[i].supply = imx471_supply_name[i];
> +
> +	return devm_regulator_bulk_get(dev, IMX471_NUM_SUPPLIES,
> +				       sensor->supplies);
> +}
> +
> +static int imx471_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct imx471_data *sensor = container_of(ctrl->handler,
> +						  struct imx471_data,
> +						  ctrl_handler);
> +	struct v4l2_subdev_state *state =
> +			v4l2_subdev_get_locked_active_state(&sensor->sd);
> +	const struct v4l2_mbus_framefmt *format =
> +			v4l2_subdev_state_get_format(state, 0);
> +	s64 exposure_max;
> +	int ret;
> +
> +	/* Propagate change of current control to all related controls */
> +	if (ctrl->id == V4L2_CID_VBLANK) {
> +		/* Update max exposure while meeting expected vblanking */
> +		exposure_max =
> +			format->height + ctrl->val - IMX471_EXPOSURE_MARGIN;
> +		__v4l2_ctrl_modify_range(sensor->exposure,
> +					 sensor->exposure->minimum,
> +					 exposure_max,
> +					 sensor->exposure->step,
> +					 exposure_max);
> +	}
> +
> +	/* V4L2 controls values will be applied only when power is already up */
> +	if (!pm_runtime_get_if_in_use(sensor->dev))
> +		return 0;
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_ANALOGUE_GAIN:
> +		cci_write(sensor->regmap, IMX471_REG_ANALOG_GAIN,
> +			  ctrl->val, &ret);
> +		break;
> +	case V4L2_CID_DIGITAL_GAIN:
> +		cci_write(sensor->regmap, IMX471_REG_DIG_GAIN_GLOBAL,
> +			  ctrl->val, &ret);
> +		break;
> +	case V4L2_CID_EXPOSURE:
> +		cci_write(sensor->regmap, IMX471_REG_EXPOSURE,
> +			  ctrl->val, &ret);

Fits on previous line.

> +		break;
> +	case V4L2_CID_VBLANK:
> +		/* Update FLL that meets expected vertical blanking */
> +		cci_write(sensor->regmap, IMX471_REG_FLL,
> +			  format->height + ctrl->val, &ret);
> +		break;
> +	case V4L2_CID_TEST_PATTERN:
> +		cci_write(sensor->regmap, IMX471_REG_TEST_PATTERN,
> +			  ctrl->val, &ret);
> +		break;
> +	case V4L2_CID_HFLIP:
> +	case V4L2_CID_VFLIP:
> +		if (sensor->streaming)

Please grab the controls when starting streaming and ungrab them when
stopping it.

> +			return -EBUSY;
> +
> +		cci_write(sensor->regmap, IMX471_REG_ORIENTATION,
> +			  sensor->hflip->val | sensor->vflip->val << 1, &ret);
> +		break;
> +	default:
> +		ret = -EINVAL;
> +		dev_info(sensor->dev, "ctrl(id:0x%x,val:0x%x) is not handled",
> +			 ctrl->id, ctrl->val);
> +		break;
> +	}
> +
> +	pm_runtime_put(sensor->dev);
> +
> +	return ret;
> +}
> +
> +static const struct v4l2_ctrl_ops imx471_ctrl_ops = {
> +	.s_ctrl = imx471_set_ctrl,
> +};
> +
> +static u32 imx471_get_format_code(struct imx471_data *seonsor)

Hmm.

> +{
> +	unsigned int i;
> +
> +	i = (seonsor->vflip->val ? 2 : 0) | (seonsor->hflip->val ? 1 : 0);
> +
> +	return imx471_mbus_formats[i];
> +}
> +
> +static int imx471_enum_mbus_code(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_state *sd_state,
> +				 struct v4l2_subdev_mbus_code_enum *code)
> +{
> +	struct imx471_data *sensor = to_imx471_data(sd);
> +
> +	if (code->index >= (ARRAY_SIZE(imx471_mbus_formats) / 4))
> +		return -EINVAL;
> +
> +	code->code = imx471_get_format_code(sensor);
> +
> +	return 0;
> +}
> +static int imx471_enum_frame_size(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *sd_state,
> +				  struct v4l2_subdev_frame_size_enum *fse)
> +{
> +	if (fse->index >= ARRAY_SIZE(imx471_modes))
> +		return -EINVAL;
> +
> +	fse->min_width = imx471_modes[fse->index].width;
> +	fse->max_width = fse->min_width;
> +	fse->min_height = imx471_modes[fse->index].height;
> +	fse->max_height = fse->min_height;
> +
> +	return 0;
> +}
> +
> +static void imx471_update_pad_format(struct imx471_data *sensor,
> +				     const struct imx471_mode *mode,
> +				     struct v4l2_subdev_format *fmt)
> +{
> +	fmt->format.code = imx471_get_format_code(sensor);
> +	fmt->format.width = mode->width;
> +	fmt->format.height = mode->height;
> +	fmt->format.field = V4L2_FIELD_NONE;
> +}
> +
> +static int imx471_set_pad_format(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_state *sd_state,
> +				 struct v4l2_subdev_format *fmt)
> +{
> +	struct imx471_data *sensor = to_imx471_data(sd);
> +	const struct imx471_mode *mode;
> +
> +	mode = v4l2_find_nearest_size(imx471_modes,
> +				      ARRAY_SIZE(imx471_modes),
> +				      width, height,
> +				      fmt->format.width, fmt->format.height);
> +
> +	imx471_update_pad_format(sensor, mode, fmt);
> +
> +	*v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
> +
> +	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
> +		return 0;
> +
> +	if (media_entity_is_streaming(&sensor->sd.entity))
> +		return -EBUSY;
> +
> +	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {

You can omit this check.

> +		int h_blank;
> +		u64 pixel_rate;
> +
> +		pixel_rate = IMX471_LINK_FREQ_DEFAULT * 2 * 4;
> +		do_div(pixel_rate, 10);

You could use div_u64() here.

> +		__v4l2_ctrl_modify_range(sensor->pixel_rate,
> +					 V4L2_CID_PIXEL_RATE,
> +					 pixel_rate, 1, pixel_rate);
> +
> +		__v4l2_ctrl_modify_range(sensor->vblank,
> +					 mode->fll_min - mode->height,
> +					 IMX471_FLL_MAX - mode->height,
> +					 1,
> +					 mode->fll_def - mode->height);
> +
> +		h_blank = mode->llp - mode->width;
> +		/*
> +		 * Currently hblank is not changeable.
> +		 * So FPS control is done only by vblank.
> +		 */
> +		__v4l2_ctrl_modify_range(sensor->hblank, h_blank,
> +					 h_blank, 1, h_blank);
> +	}
> +
> +	return 0;
> +}
> +
> +static int imx471_init_state(struct v4l2_subdev *sd,
> +			     struct v4l2_subdev_state *sd_state)
> +{
> +	struct v4l2_subdev_format fmt = { };
> +
> +	fmt.which =
> +		sd_state ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;

sd_state is always non-NULL here.

> +	fmt.format.code = MEDIA_BUS_FMT_SRGGB10_1X10;
> +	fmt.format.width = imx471_modes[0].width;
> +	fmt.format.height = imx471_modes[0].height;

You can assign these in declaraion.

> +
> +	imx471_set_pad_format(sd, sd_state, &fmt);
> +
> +	return 0;
> +}
> +
> +static int imx471_identify_module(struct imx471_data *sensor)
> +{
> +	int ret;
> +	u64 val;
> +
> +	if (sensor->identified)
> +		return 0;
> +
> +	ret = cci_read(sensor->regmap, IMX471_REG_CHIP_ID, &val, NULL);
> +	if (ret)
> +		return dev_err_probe(sensor->dev, ret,
> +				     "failed to read chip id\n");
> +
> +	if (val != IMX471_CHIP_ID)
> +		return dev_err_probe(sensor->dev, -EIO,
> +				     "chip id mismatch: %x!=%llx\n",
> +				     IMX471_CHIP_ID, val);
> +
> +	sensor->identified = true;
> +
> +	return 0;
> +}
> +
> +static int imx471_power_off(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct imx471_data *sensor = to_imx471_data(sd);
> +
> +	clk_disable_unprepare(sensor->img_clk);
> +	gpiod_set_value_cansleep(sensor->reset_gpio, 1);
> +
> +	regulator_bulk_disable(IMX471_NUM_SUPPLIES, sensor->supplies);
> +
> +	return 0;
> +}
> +
> +static int imx471_power_on(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct imx471_data *sensor = to_imx471_data(sd);
> +	int ret;
> +
> +	ret = regulator_bulk_enable(IMX471_NUM_SUPPLIES, sensor->supplies);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to enable regulators: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(sensor->img_clk);
> +	if (ret < 0) {
> +		regulator_bulk_disable(IMX471_NUM_SUPPLIES, sensor->supplies);
> +		dev_err(dev, "failed to enable imaging clock: %d", ret);
> +		return ret;
> +	}
> +
> +	gpiod_set_value_cansleep(sensor->reset_gpio, 0);
> +
> +	usleep_range(10000, 15000);
> +
> +	return 0;
> +}
> +
> +/* Start streaming */
> +static int imx471_enable_stream(struct v4l2_subdev *sd,
> +				struct v4l2_subdev_state *state,
> +				u32 pad, u64 streams_mask)
> +{
> +	struct imx471_data *sensor = to_imx471_data(sd);
> +	const struct imx471_mode *mode;
> +	struct v4l2_mbus_framefmt *fmt;
> +	int ret;
> +
> +	ret = pm_runtime_resume_and_get(sensor->dev);
> +	if (ret)
> +		goto error_powerdown;

		return ret;

> +
> +	ret = imx471_identify_module(sensor);
> +	if (ret)
> +		return ret;
		goto error_powerdown;
> +
> +	/* Global Setting */
> +	cci_multi_reg_write(sensor->regmap, imx471_global_regs,
> +			    ARRAY_SIZE(imx471_global_regs), &ret);
> +	if (ret) {
> +		dev_err(sensor->dev, "failed to set global settings");
> +		goto error_powerdown;
> +	}
> +
> +	state = v4l2_subdev_get_locked_active_state(&sensor->sd);
> +	fmt = v4l2_subdev_state_get_format(state, 0);
> +	mode = v4l2_find_nearest_size(imx471_modes, ARRAY_SIZE(imx471_modes),
> +				      width, height, fmt->width, fmt->height);
> +
> +	/* Apply default values of current mode */
> +	cci_multi_reg_write(sensor->regmap, mode->default_mode_regs,
> +			    mode->default_mode_regs_length, &ret);
> +	if (ret) {
> +		dev_err(sensor->dev, "failed to set mode");
> +		goto error_powerdown;
> +	}
> +
> +	/* set digital gain control to all color mode */
> +	cci_write(sensor->regmap, IMX471_REG_DPGA_USE_GLOBAL_GAIN, 1, &ret);
> +	if (ret)
> +		goto error_powerdown;
> +
> +	/* Apply customized values from user */
> +	ret =  __v4l2_ctrl_handler_setup(&sensor->ctrl_handler);
> +	if (ret)
> +		goto error_powerdown;
> +
> +	cci_write(sensor->regmap, IMX471_REG_MODE_SELECT,
> +		  IMX471_MODE_STREAMING, &ret);
> +	if (ret)
> +		goto error_powerdown;
> +
> +	sensor->streaming = 1;
> +
> +	return ret;
> +
> +error_powerdown:
> +	pm_runtime_put(sensor->dev);
> +
> +	return ret;
> +}
> +
> +/* Stop streaming */
> +static int imx471_disable_stream(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_state *state,
> +				 u32 pad, u64 streams_mask)
> +{
> +	struct imx471_data *sensor = to_imx471_data(sd);
> +	int ret;
> +
> +	cci_write(sensor->regmap, IMX471_REG_MODE_SELECT,
> +		  IMX471_MODE_STANDBY, &ret);
> +	pm_runtime_put(sensor->dev);
> +	sensor->streaming = 0;
> +
> +	if (ret)
> +		dev_err(sensor->dev,
> +			"failed to disable stream with return value: %d\n",
> +			ret);
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_subdev_core_ops imx471_subdev_core_ops = {
> +	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
> +	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
> +};
> +
> +static const struct v4l2_subdev_video_ops imx471_video_ops = {
> +	.s_stream = v4l2_subdev_s_stream_helper,
> +};
> +
> +static const struct v4l2_subdev_pad_ops imx471_pad_ops = {
> +	.enum_mbus_code = imx471_enum_mbus_code,
> +	.get_fmt = v4l2_subdev_get_fmt,
> +	.set_fmt = imx471_set_pad_format,

I understand get_selection is needed to make libcamera
<URL:https://libcamera.org/sensor_driver_requirements.html> happy.

> +	.enum_frame_size = imx471_enum_frame_size,
> +	.enable_streams = imx471_enable_stream,
> +	.disable_streams = imx471_disable_stream,
> +};
> +
> +static const struct v4l2_subdev_ops imx471_subdev_ops = {
> +	.core = &imx471_subdev_core_ops,
> +	.video = &imx471_video_ops,
> +	.pad = &imx471_pad_ops,
> +};
> +
> +static const struct v4l2_subdev_internal_ops imx471_internal_ops = {
> +	.init_state = imx471_init_state,
> +};
> +
> +/* Initialize control handlers */
> +static int imx471_init_controls(struct imx471_data *sensor)
> +{
> +	const struct imx471_mode *mode = &imx471_modes[0];
> +	struct v4l2_ctrl_handler *ctrl_hdlr;
> +	struct v4l2_fwnode_device_properties props;
> +	s64 exposure_max;
> +	s64 hblank;

You could define the two on a single line.

> +	u64 pixel_rate;
> +	int ret;
> +

Extra newlien.

> +
> +	ctrl_hdlr = &sensor->ctrl_handler;
> +	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 10);
> +	if (ret)
> +		return ret;
> +
> +	ret = v4l2_fwnode_device_parse(sensor->dev, &props);
> +	if (ret) {
> +		dev_err(sensor->dev, "failed to parse fwnode: %d", ret);
> +		return ret;
> +	}
> +
> +	v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &imx471_ctrl_ops, &props);
> +	if (ctrl_hdlr->error)
> +		return ctrl_hdlr->error;

This check can be omitted.

> +
> +	sensor->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr,

Indentation.

> +					&imx471_ctrl_ops,
> +					V4L2_CID_LINK_FREQ,
> +					ARRAY_SIZE(link_freq_menu_items) - 1,
> +					0,
> +					link_freq_menu_items);
> +	if (sensor->link_freq)
> +		sensor->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
> +	/* pixel_rate = link_freq * 2 * nr_of_lanes / bits_per_sample */
> +	pixel_rate = IMX471_LINK_FREQ_DEFAULT * 2 * 4;
> +	do_div(pixel_rate, 10);
> +	/* By default, PIXEL_RATE is read only */
> +	sensor->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops,
> +					       V4L2_CID_PIXEL_RATE, pixel_rate,
> +					       pixel_rate, 1, pixel_rate);
> +
> +	/* Initial vblank/hblank/exposure parameters based on current mode */
> +	sensor->vblank = v4l2_ctrl_new_std(ctrl_hdlr,
> +					   &imx471_ctrl_ops,
> +					   V4L2_CID_VBLANK,
> +					   mode->fll_min - mode->height,
> +					   IMX471_FLL_MAX - mode->height,
> +					   1,
> +					   mode->fll_def - mode->height);
> +
> +	hblank = mode->llp - mode->width;
> +	sensor->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops,
> +					   V4L2_CID_HBLANK, hblank, hblank,
> +					   1, hblank);
> +	if (sensor->hblank)
> +		sensor->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
> +	/* fll >= exposure time + adjust parameter (default value is 18) */
> +	exposure_max = mode->fll_def - IMX471_EXPOSURE_MARGIN;
> +	sensor->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops,
> +					     V4L2_CID_EXPOSURE,
> +					     IMX471_EXPOSURE_MIN, exposure_max,
> +					     IMX471_EXPOSURE_STEP,
> +					     IMX471_EXPOSURE_DEFAULT);
> +
> +	v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
> +			  IMX471_ANA_GAIN_MIN, IMX471_ANA_GAIN_MAX,
> +			  IMX471_ANA_GAIN_STEP, IMX471_ANA_GAIN_DEFAULT);
> +
> +	/* Digital gain */
> +	v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
> +			  IMX471_DGTL_GAIN_MIN, IMX471_DGTL_GAIN_MAX,
> +			  IMX471_DGTL_GAIN_STEP, IMX471_DGTL_GAIN_DEFAULT);
> +
> +	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &imx471_ctrl_ops,
> +				     V4L2_CID_TEST_PATTERN,
> +				     ARRAY_SIZE(imx471_test_pattern_menu) - 1,
> +				     0, 0, imx471_test_pattern_menu);
> +
> +	/* HFLIP & VFLIP */
> +	sensor->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops,
> +					  V4L2_CID_HFLIP, 0, 1, 1, 0);
> +
> +	sensor->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops,
> +					  V4L2_CID_VFLIP, 0, 1, 1, 0);
> +
> +	sensor->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> +	sensor->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;

You'll first need to check the control handler's error status.

Please move setting the rest of the control flags here, too.

> +
> +	if (ctrl_hdlr->error) {
> +		ret = ctrl_hdlr->error;
> +		dev_err(sensor->dev, "%s control init failed: %d",
> +			__func__, ret);
> +		goto error;
> +	}
> +
> +	sensor->sd.ctrl_handler = ctrl_hdlr;
> +
> +	return 0;
> +
> +error:
> +	v4l2_ctrl_handler_free(ctrl_hdlr);
> +
> +	return ret;

You can return ctrl_hdlr->error instead of ret here.

> +}
> +
> +static int imx471_check_hwcfg(struct imx471_data *sensor)
> +{
> +	struct v4l2_fwnode_endpoint bus_cfg = {
> +		.bus_type = V4L2_MBUS_CSI2_DPHY,
> +	};
> +	struct fwnode_handle *ep, *fwnode = dev_fwnode(sensor->dev);
> +	struct clk *clk;
> +	unsigned long link_freq_bitmap;
> +	int ret;
> +
> +	clk = devm_v4l2_sensor_clk_get(sensor->dev, NULL);
> +	if (IS_ERR(clk))
> +		return dev_err_probe(sensor->dev, ret,
> +				     "can't get clock frequency\n");
> +
> +	if (clk_get_rate(clk) != IMX471_EXT_CLK)
> +		return dev_err_probe(sensor->dev, -EINVAL,
> +				     "external clock %lu is not supported\n",
> +				     clk_get_rate(clk));
> +
> +	ep = fwnode_graph_get_endpoint_by_id(fwnode, 0, 0, 0);
> +	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> +	fwnode_handle_put(ep);
> +	if (ret)
> +		return dev_err_probe(sensor->dev, ret,
> +				     "parsing endpoint failed");
> +
> +	ret = v4l2_link_freq_to_bitmap(sensor->dev, bus_cfg.link_frequencies,
> +				       bus_cfg.nr_of_link_frequencies,
> +				       link_freq_menu_items,
> +				       ARRAY_SIZE(link_freq_menu_items),
> +				       &link_freq_bitmap);
> +
> +	if (ret == -ENOENT)
> +		goto error_endpoint_free;
> +
> +	if (ret == -ENODATA)
> +		goto error_endpoint_free;

These error checks are redundant.

> +
> +error_endpoint_free:
> +	v4l2_fwnode_endpoint_free(&bus_cfg);
> +
> +	return ret;
> +}
> +
> +static int imx471_probe(struct i2c_client *client)
> +{
> +	struct imx471_data *sensor;
> +	int ret;
> +
> +	sensor = devm_kzalloc(&client->dev, sizeof(*sensor), GFP_KERNEL);
> +	if (!sensor)
> +		return dev_err_probe(&client->dev, -ENOMEM,
> +				     "failed to allocate memory\n");
> +
> +	sensor->dev = &client->dev;
> +
> +	/* Check HW config */
> +	ret = imx471_check_hwcfg(sensor);
> +	if (ret)
> +		return dev_err_probe(sensor->dev, ret,
> +				     "failed to check hwcfg: %d\n", ret);
> +
> +	ret = imx471_get_regulators(sensor->dev, sensor);
> +	if (ret)
> +		return dev_err_probe(sensor->dev, ret,
> +				     "failed to get regulators\n");
> +
> +	sensor->reset_gpio = devm_gpiod_get_optional(sensor->dev, "reset",
> +						     GPIOD_OUT_HIGH);
> +	if (IS_ERR(sensor->reset_gpio))
> +		return dev_err_probe(sensor->dev, PTR_ERR(sensor->reset_gpio),
> +				     "failed to get reset gpio\n");
> +
> +	sensor->img_clk = devm_clk_get_optional(sensor->dev, NULL);
> +	if (IS_ERR(sensor->img_clk))
> +		return dev_err_probe(sensor->dev, PTR_ERR(sensor->img_clk),
> +				     "failed to get imaging clock\n");
> +
> +	/* Initialize subdev */
> +	v4l2_i2c_subdev_init(&sensor->sd, client, &imx471_subdev_ops);
> +
> +	/* Initialize regmap */
> +	sensor->regmap = devm_cci_regmap_init_i2c(client, 16);
> +	if (IS_ERR(sensor->regmap))
> +		return PTR_ERR(sensor->regmap);
> +
> +	ret = imx471_power_on(sensor->dev);
> +	if (ret)
> +		return dev_err_probe(sensor->dev, ret,
> +				     "failed to power on\n");
> +
> +	/* Check module identity */
> +	ret = imx471_identify_module(sensor);

As you're identifying the rensor here unconditionally, you can drop the
identified field in struct imx471_data. I might call it just "imx471"
actually.

> +	if (ret) {
> +		dev_err(&client->dev, "failed to find sensor: %d", ret);
> +		goto error_power_off;
> +	}
> +
> +	ret = imx471_init_controls(sensor);
> +	if (ret) {
> +		dev_err(sensor->dev, "failed to init controls: %d", ret);
> +		goto error_power_off;
> +	}
> +
> +	/* Initialize subdev */
> +	sensor->sd.internal_ops = &imx471_internal_ops;
> +	sensor->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> +			    V4L2_SUBDEV_FL_HAS_EVENTS;
> +	sensor->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> +
> +	/* Initialize source pad */
> +	sensor->pad.flags = MEDIA_PAD_FL_SOURCE;
> +	ret = media_entity_pads_init(&sensor->sd.entity, 1, &sensor->pad);
> +	if (ret) {
> +		dev_err(&client->dev, "failed to init entity pads: %d", ret);
> +		goto error_v4l2_ctrl_handler_free;
> +	}
> +
> +	sensor->sd.state_lock = sensor->ctrl_handler.lock;
> +	ret = v4l2_subdev_init_finalize(&sensor->sd);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "failed to init subdev: %d", ret);
> +		goto error_media_entity_pm;
> +	}
> +
> +	pm_runtime_set_active(sensor->dev);
> +	pm_runtime_enable(sensor->dev);
> +	pm_runtime_idle(sensor->dev);
> +
> +	ret = v4l2_async_register_subdev_sensor(&sensor->sd);
> +	if (ret < 0)
> +		goto error_v4l2_subdev_cleanup;
> +
> +	return 0;
> +
> +error_v4l2_subdev_cleanup:
> +	pm_runtime_disable(sensor->dev);
> +	pm_runtime_set_suspended(sensor->dev);
> +	v4l2_subdev_cleanup(&sensor->sd);
> +
> +error_media_entity_pm:
> +	media_entity_cleanup(&sensor->sd.entity);
> +
> +error_v4l2_ctrl_handler_free:
> +	v4l2_ctrl_handler_free(sensor->sd.ctrl_handler);
> +
> +error_power_off:
> +	imx471_power_off(sensor->dev);
> +
> +	return ret;
> +}
> +
> +static void imx471_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct imx471_data *sensor = to_imx471_data(sd);
> +
> +	v4l2_async_unregister_subdev(sd);
> +	v4l2_subdev_cleanup(sd);
> +	media_entity_cleanup(&sd->entity);
> +	v4l2_ctrl_handler_free(sd->ctrl_handler);
> +
> +	pm_runtime_disable(&client->dev);
> +
> +	if (!pm_runtime_status_suspended(sensor->dev)) {
> +		imx471_power_off(sensor->dev);
> +		pm_runtime_set_suspended(sensor->dev);
> +	}
> +}
> +
> +static DEFINE_RUNTIME_DEV_PM_OPS(imx471_pm_ops, imx471_power_off,
> +				 imx471_power_on, NULL);
> +
> +static const struct acpi_device_id imx471_acpi_ids[] __maybe_unused = {
> +	{ "SONY471A" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(acpi, imx471_acpi_ids);
> +
> +static struct i2c_driver imx471_i2c_driver = {
> +	.driver = {
> +		.name = "imx471",
> +		.acpi_match_table = ACPI_PTR(imx471_acpi_ids),
> +		.pm = pm_sleep_ptr(&imx471_pm_ops),
> +	},
> +	.probe = imx471_probe,
> +	.remove = imx471_remove,
> +};
> +module_i2c_driver(imx471_i2c_driver);
> +
> +MODULE_AUTHOR("Jimmy Su <jimmy.su@intel.com>");
> +MODULE_AUTHOR("Serin Yeh <serin.yeh@intel.com>");
> +MODULE_AUTHOR("Kate Hsuan <hpa@redhat.com>");
> +MODULE_DESCRIPTION("Sony imx471 sensor driver");
> +MODULE_LICENSE("GPL");

-- 
Kind regards,

Sakari Ailus

