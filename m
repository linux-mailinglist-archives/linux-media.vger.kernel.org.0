Return-Path: <linux-media+bounces-59244-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 1tDyGgrc52nJBwIAu9opvQ
	(envelope-from <linux-media+bounces-59244-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 22:20:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA2743F5C4
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 22:20:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 293DB3029D6C
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 20:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D4053DA5BB;
	Tue, 21 Apr 2026 20:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="YgqFpHEj";
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="tcVwfYtr"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FBC2264A9;
	Tue, 21 Apr 2026 20:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776802820; cv=pass; b=I8FOUrtkfTut1LBX3/eBq4au69vHmdLCNVKq0+boFTV4KsagdWRd6Xfk1FMzecTtYKO5vRIIIu5PbXuJ1I/9//dpid7Ggz4mG572Q2OmqcJ3aVSZoMid6NIrg3azYjNwosU2Hkb1ZPs7nmQ73+Ee+AVcYevf9V0xJGWOIs0G7Zs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776802820; c=relaxed/simple;
	bh=9rRne6dRJmCc69HTJqUW00ZembYBzQxKIVzwxZcCit0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tA+WRIOB2XcKd+QE5Odlu3Gwv3j6wdqqWsZtTGO1Ub4PyAWzQsc/jY4zB03weYlhYK4v5qSa4js1Bw6D50fX2jaKwy1uB7pdPA3JkU7F2ZxlPV9dKb9scZhzJSuhm0xO6cxKUqhrd63q9krlnWefXVZCHOWaPhoPoYJm5k7SFGI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=YgqFpHEj; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=tcVwfYtr; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lahtoruutu.iki.fi (Postfix) with ESMTPS id 4g0Yck0mSrz49PxH;
	Tue, 21 Apr 2026 23:20:06 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1776802806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+Quk+6yL5S73tonW0p4lGYqnvA/Kd5ezRnjd7soGbLw=;
	b=YgqFpHEjKpW13+1K1srIx9i6UFD36B7I23sHlEi77FoKTWNGSLNt5pJkwxoo+FP5navqpN
	287rSSsxn1XGlEg+mB1S0EOaIKkNxoyKRlSbH8xXV3j4QEWtVnBi1CUc1POYlP+m+xnS3h
	Jn1oSPYLwDAJNjtJiRSSfcpGsu1xN4cJAFT+UbMHB633lj7Uqc+jy6JUv6bwgoEPeAFJCZ
	iZSObxBJtEE0g3E4v1v5rA/Ax7JdxgrnEYkV7mDSzHQDynGYoRqrB9Hwd91p2eYVdsYL8G
	+tmYDyV/kCbe4OJKR9mmYZtL4IK+D9fC08JHgkvhTd5EGhCi84uAeUbgIxfhyA==
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4g0YcX0YnszyW5;
	Tue, 21 Apr 2026 23:19:55 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1776802796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+Quk+6yL5S73tonW0p4lGYqnvA/Kd5ezRnjd7soGbLw=;
	b=tcVwfYtrDRgRhEQHxjznI4Y66v9n3FYtBhwYLXRP8kcWuLkj1LOJ217xq4FYWVxcACx+S4
	ehXA/jkjCBMfFTQnYXJ83XuPe5bC08p3ry5YE83rEkNIZl7hahXnjcu7gd+Y53DU+NOTWY
	EZqRIFwbJji6LLZR4F3ZENys6JTnLdI=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1776802796;
	b=ui30DNWuWq+AuC6bnS6C4bfy8Ih9olEuW+hH3TTWrRYkLQnVdoAHXHk8sREAXdcpB1zUo7
	CCF/rn16D3otN7AKVNy0+ZpwbE/tPo5mreY9ztXDUH076UVI8n83DISVL9tOHOsKrpRPtU
	CqXcplGBaSm6snumctcoQy1IjV+q1Ng=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1776802796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+Quk+6yL5S73tonW0p4lGYqnvA/Kd5ezRnjd7soGbLw=;
	b=MNa172NSypVTK21I4eYBHWeiltfwOUcBLQ929RvmZOnuJmF7UsyIlhBX2aSsLlUqUQF7fH
	qQjqgRU5pknnfORFuEDFizL+fh4BP/oeFa/TiwzMleRKO6f3eE2+qY5dJSK9xVJYF6cEgu
	O/8JLRBrXTGTRTvt0o2aT0swlwy0x+A=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 72181634C4E;
	Tue, 21 Apr 2026 23:19:55 +0300 (EEST)
Date: Tue, 21 Apr 2026 23:19:55 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: nekocwd@mainlining.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, david@ixit.cz,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
	Vitalii Skorkin <nikroks@mainlining.org>,
	Antonio Rische <nt8r@protonmail.com>
Subject: Re: [PATCH v5 2/3] media: i2c: Add driver for LC898217XC VCM
Message-ID: <aefb61B7QqdByNF4@valkosipuli.retiisi.eu>
References: <20260411-media-i2c-lc898217xc-initial-driver-v5-0-c71ddcf40bad@mainlining.org>
 <20260411-media-i2c-lc898217xc-initial-driver-v5-2-c71ddcf40bad@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260411-media-i2c-lc898217xc-initial-driver-v5-2-c71ddcf40bad@mainlining.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_DKIM_ALLOW(-0.20)[iki.fi:s=lahtoruutu,iki.fi:s=meesny];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59244-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[iki.fi];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,ixit.cz,vger.kernel.org,mainlining.org,protonmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[iki.fi:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@iki.fi,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EDA2743F5C4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Vasiliy,

Thanks for the set.

On Sat, Apr 11, 2026 at 04:13:09PM +0300, Vasiliy Doylov via B4 Relay wrote:
> From: Vasiliy Doylov <nekocwd@mainlining.org>
> 
> LC898217XC is a 11 bit DAC, designed for linear control
> of voice coil motor. This driver creates a V4L2 subdevice
> and provides control to set the desired focus.
> 
> Tested on Oneplus 6 (oneplus-enchilada)

Missing period.

> 
> Signed-off-by: Vasiliy Doylov <nekocwd@mainlining.org>
> ---
>  drivers/media/i2c/Kconfig      |   9 ++
>  drivers/media/i2c/Makefile     |   1 +
>  drivers/media/i2c/lc898217xc.c | 289 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 299 insertions(+)
> 
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 8f2ba4121586..346dd4a14105 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -926,6 +926,15 @@ config VIDEO_DW9807_VCM
>  	  capability. This is designed for linear control of
>  	  voice coil motors, controlled via I2C serial interface.
>  
> +config VIDEO_LC898217XC
> +	tristate "LC898217XC lens voice coil support"
> +	select V4L2_CCI_I2C
> +	help
> +	  This is a driver for the LC898217XC camera lens voice coil.
> +	  LC898217XC is a 11 bit DAC with 110mA output current sink
> +	  capability. This is designed for linear control of
> +	  voice coil motors, controlled via I2C serial interface.
> +
>  endif
>  
>  menu "Flash devices"
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index 90b276a7417a..f55c44feca53 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -64,6 +64,7 @@ obj-$(CONFIG_VIDEO_IMX415) += imx415.o
>  obj-$(CONFIG_VIDEO_IR_I2C) += ir-kbd-i2c.o
>  obj-$(CONFIG_VIDEO_ISL7998X) += isl7998x.o
>  obj-$(CONFIG_VIDEO_KS0127) += ks0127.o
> +obj-$(CONFIG_VIDEO_LC898217XC) += lc898217xc.o
>  obj-$(CONFIG_VIDEO_LM3560) += lm3560.o
>  obj-$(CONFIG_VIDEO_LM3646) += lm3646.o
>  obj-$(CONFIG_VIDEO_LT6911UXE) += lt6911uxe.o
> diff --git a/drivers/media/i2c/lc898217xc.c b/drivers/media/i2c/lc898217xc.c
> new file mode 100644
> index 000000000000..cfac7e7ce3d6
> --- /dev/null
> +++ b/drivers/media/i2c/lc898217xc.c
> @@ -0,0 +1,289 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright (c) 2025 Vasiliy Doylov <nekocwd@mainlining.org>
> +
> +#include <linux/delay.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <media/v4l2-async.h>
> +#include <media/v4l2-cci.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-fwnode.h>

Do you need this?

> +#include <media/v4l2-subdev.h>
> +#include <media/v4l2-event.h>

Alphabetical order, please.

> +
> +#define LC898217XC_NAME "lc898217xc"
> +/* Actuator has 11 bit resolution */
> +#define LC898217XC_MAX_FOCUS_POS (2048 - 1)
> +#define LC898217XC_MIN_FOCUS_POS 0
> +#define LC898217XC_FOCUS_STEPS 1
> +#define LC898217XC_DAC_ADDR CCI_REG16(0x84)
> +
> +static const char *const lc898217xc_supply_names[] = {
> +	"vdd",
> +	"vana",
> +};
> +
> +struct lc898217xc {
> +	struct regulator_bulk_data supplies[ARRAY_SIZE(lc898217xc_supply_names)];
> +	struct v4l2_ctrl_handler ctrls;
> +	struct v4l2_subdev sd;
> +	struct regmap *regmap;
> +};
> +
> +static inline struct lc898217xc *sd_to_lc898217xc(struct v4l2_subdev *subdev)
> +{
> +	return container_of(subdev, struct lc898217xc, sd);
> +}
> +
> +static int lc898217xc_set_dac(struct lc898217xc *lc898217xc, u16 val)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&lc898217xc->sd);

Please instead do:

	struct i2c_client *client = to_i2c_client(lc898217->sd.dev);

as in the long run we should get rid of v4l2_get_subdevdata().

> +	int ret;
> +
> +	ret = cci_write(lc898217xc->regmap, LC898217XC_DAC_ADDR, val, NULL);
> +	if (ret)
> +		dev_err(&client->dev, "failed to set DAC: %d\n", ret);
> +
> +	return ret;
> +}
> +
> +static int lc898217xc_power_on(struct lc898217xc *lc898217xc)
> +{
> +	int ret;
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(lc898217xc_supply_names),
> +				    lc898217xc->supplies);
> +	if (ret < 0)
> +		return ret;
> +
> +	usleep_range(8000, 10000);
> +	return 0;
> +}
> +
> +static int lc898217xc_power_off(struct lc898217xc *lc898217xc)
> +{
> +	regulator_bulk_disable(ARRAY_SIZE(lc898217xc_supply_names),
> +			       lc898217xc->supplies);
> +	return 0;
> +}
> +
> +static int __maybe_unused lc898217xc_runtime_suspend(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct lc898217xc *lc898217xc = sd_to_lc898217xc(sd);
> +
> +	lc898217xc_power_off(lc898217xc);
> +	return 0;
> +}
> +
> +static int __maybe_unused lc898217xc_runtime_resume(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct lc898217xc *lc898217xc = sd_to_lc898217xc(sd);
> +	int ret;
> +
> +	ret = lc898217xc_power_on(lc898217xc);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to enable regulators\n");
> +		return ret;
> +	}
> +
> +	__v4l2_ctrl_handler_setup(&lc898217xc->ctrls);
> +
> +	return ret;
> +}
> +
> +static int lc898217xc_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct lc898217xc *lc898217xc = container_of(ctrl->handler,
> +						     struct lc898217xc, ctrls);
> +
> +	if (ctrl->id == V4L2_CID_FOCUS_ABSOLUTE)
> +		return lc898217xc_set_dac(lc898217xc, ctrl->val);
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_ctrl_ops lc898217xc_ctrl_ops = {
> +	.s_ctrl = lc898217xc_set_ctrl,
> +};
> +
> +static int lc898217xc_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> +{
> +	return pm_runtime_resume_and_get(sd->dev);
> +}
> +
> +static int lc898217xc_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> +{
> +	pm_runtime_put_autosuspend(sd->dev);
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_subdev_internal_ops lc898217xc_int_ops = {
> +	.open = lc898217xc_open,
> +	.close = lc898217xc_close,
> +};
> +
> +static const struct v4l2_subdev_core_ops lc898217xc_core_ops = {
> +	.log_status = v4l2_ctrl_subdev_log_status,
> +};
> +
> +static const struct v4l2_subdev_ops lc898217xc_ops = {
> +	.core = &lc898217xc_core_ops,
> +};
> +
> +static int lc898217xc_init_controls(struct lc898217xc *lc898217xc)
> +{
> +	struct v4l2_ctrl_handler *hdl = &lc898217xc->ctrls;
> +	const struct v4l2_ctrl_ops *ops = &lc898217xc_ctrl_ops;
> +
> +	v4l2_ctrl_handler_init(hdl, 1);
> +
> +	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_FOCUS_ABSOLUTE,
> +			  LC898217XC_MIN_FOCUS_POS,
> +			  LC898217XC_MAX_FOCUS_POS,
> +			  LC898217XC_FOCUS_STEPS, 0);
> +
> +	if (hdl->error)
> +		return hdl->error;
> +
> +	lc898217xc->sd.ctrl_handler = hdl;
> +
> +	return 0;
> +}
> +
> +static int lc898217xc_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct lc898217xc *lc898217xc;
> +	unsigned int i;
> +	int ret;
> +
> +	lc898217xc = devm_kzalloc(dev, sizeof(*lc898217xc), GFP_KERNEL);
> +	if (!lc898217xc)
> +		return -ENOMEM;
> +
> +	lc898217xc->regmap = devm_cci_regmap_init_i2c(client, 8);
> +	if (IS_ERR(lc898217xc->regmap))
> +		return dev_err_probe(dev, PTR_ERR(lc898217xc->regmap),
> +				     "failed to initialize CCI\n");
> +
> +	/* Initialize subdev */
> +	v4l2_i2c_subdev_init(&lc898217xc->sd, client, &lc898217xc_ops);
> +
> +	for (i = 0; i < ARRAY_SIZE(lc898217xc_supply_names); i++)
> +		lc898217xc->supplies[i].supply = lc898217xc_supply_names[i];
> +
> +	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(lc898217xc_supply_names),
> +				      lc898217xc->supplies);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to get regulators\n");
> +
> +	ret = lc898217xc_power_on(lc898217xc);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to enable regulators\n");
> +
> +	ret = lc898217xc_init_controls(lc898217xc);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "failed to init v4l2 controls\n");
> +		goto err_power_off;
> +	}
> +
> +	/* Initialize subdev */
> +	lc898217xc->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	lc898217xc->sd.internal_ops = &lc898217xc_int_ops;
> +
> +	ret = media_entity_pads_init(&lc898217xc->sd.entity, 0, NULL);
> +	if (ret < 0) {
> +		dev_err_probe(dev, ret, "failed to init media entity pads");
> +		goto err_free_handler;
> +	}
> +
> +	lc898217xc->sd.entity.function = MEDIA_ENT_F_LENS;
> +
> +	/*
> +	 * Enable runtime PM. As the device has been powered manually, mark it
> +	 * as active, and increase the usage count without resuming the device.
> +	 */
> +	pm_runtime_set_active(dev);
> +	pm_runtime_get_noresume(dev);

You can drop this...

> +	pm_runtime_enable(dev);
> +
> +	ret = v4l2_async_register_subdev(&lc898217xc->sd);
> +	if (ret < 0) {
> +		dev_err_probe(dev, ret, "failed to register V4L2 subdev\n");
> +		goto err_pm;
> +	}
> +
> +	/*
> +	 * Finally, enable autosuspend and decrease the usage count. The device
> +	 * will get suspended after the autosuspend delay, turning the power
> +	 * off.
> +	 */
> +	pm_runtime_set_autosuspend_delay(dev, 1000);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_put_autosuspend(dev);

and use

	pm_runtime_idle();

here to achieve the same.

> +
> +	return 0;
> +
> +err_pm:
> +	pm_runtime_disable(dev);
> +	pm_runtime_put_noidle(dev);

This can be then also dropped.

> +	media_entity_cleanup(&lc898217xc->sd.entity);
> +err_free_handler:
> +	v4l2_ctrl_handler_free(&lc898217xc->ctrls);
> +err_power_off:
> +	lc898217xc_power_off(lc898217xc);

A newline would be nice here, as would be empty lines above before labels.

> +	return ret;
> +}
> +
> +static void lc898217xc_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct lc898217xc *lc898217xc = sd_to_lc898217xc(sd);
> +	struct device *dev = &client->dev;
> +
> +	v4l2_async_unregister_subdev(&lc898217xc->sd);
> +	v4l2_ctrl_handler_free(&lc898217xc->ctrls);
> +	media_entity_cleanup(&lc898217xc->sd.entity);
> +
> +	/*
> +	 * Disable runtime PM. In case runtime PM is disabled in the kernel,
> +	 * make sure to turn power off manually.
> +	 */
> +	pm_runtime_disable(dev);
> +	if (!pm_runtime_status_suspended(dev))
> +		lc898217xc_power_off(lc898217xc);
> +	pm_runtime_set_suspended(dev);
> +}
> +
> +static const struct of_device_id lc898217xc_of_table[] = {
> +	{ .compatible = "onnn,lc898217xc" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, lc898217xc_of_table);
> +
> +static const struct dev_pm_ops lc898217xc_pm_ops = {
> +	SET_RUNTIME_PM_OPS(lc898217xc_runtime_suspend,
> +			   lc898217xc_runtime_resume, NULL)
> +};
> +
> +static struct i2c_driver lc898217xc_i2c_driver = {
> +	.driver = {
> +		.name = LC898217XC_NAME,
> +		.pm = &lc898217xc_pm_ops,
> +		.of_match_table = lc898217xc_of_table,
> +	},
> +	.probe = lc898217xc_probe,
> +	.remove = lc898217xc_remove,
> +};
> +module_i2c_driver(lc898217xc_i2c_driver);
> +
> +MODULE_AUTHOR("Vasiliy Doylov <nekocwd@mainlining.org>");
> +MODULE_DESCRIPTION("Onsemi LC898217XC VCM driver");
> +MODULE_LICENSE("GPL");
> 

-- 
Kind regards,

Sakari Ailus

