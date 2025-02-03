Return-Path: <linux-media+bounces-25587-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEB0A25AED
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 14:32:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B03A91884DCE
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 13:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0525205AA2;
	Mon,  3 Feb 2025 13:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nxAkXTkk"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406AF25A631;
	Mon,  3 Feb 2025 13:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738589553; cv=none; b=sTi7iMGqA/5R5R+hQydsJROQ1IwChByhmS74VXIL+4yc9FfrCzHP/3ClndRD4PG/aSzuYzSooYCxn8yWy6+d+F9ttF/L0V540MhaWySvzS203+dzzIUlo+iX6zIaM4mjy/Rmy/ZfrKrZUGZI5izHiX1rEKkD49vW2KaC5/tGbOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738589553; c=relaxed/simple;
	bh=NWDhWtA0DUZLQLtHB543IZHP0ifSYiqe2MzuHajgCB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CTsbKfSpWvaif9rMYs8MaVPSxmNuIOpyRC5S8JJLyrirJMWRxNec+c4zi/SzE26cbpxlYLIvptwGV3QiC7utmKhDH4UAXqnjz2F9ix2v9Si9vzScW3w8dw9jwXaflgIyDah94iJJ95VI6GS9kB5A0tyv+YsjJlLkRvmuIXDqnDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nxAkXTkk; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 99AE0664;
	Mon,  3 Feb 2025 14:31:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1738589476;
	bh=NWDhWtA0DUZLQLtHB543IZHP0ifSYiqe2MzuHajgCB0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nxAkXTkktDL9U0Jbldw6M913VAtsNtZesiVK7ObpaOzNRlUfdIGrz9JUbzcdZ8aoJ
	 sxyeNvM9VEM3v2RpeOS4RCcmiocR2lrDc6GzU84yq15k8+cBql1rU5dteHWJ4C8AX6
	 t3Ba3YXnsHMxe6q9WKsasWozAlcO2QSoAr5v+Eb8=
Date: Mon, 3 Feb 2025 15:32:24 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mirela Rabulea <mirela.rabulea@nxp.com>, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
	robh@kernel.org, krzk+dt@kernel.org, bryan.odonoghue@linaro.org,
	laurentiu.palcu@nxp.com, robert.chiras@nxp.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	LnxRevLi@nxp.com, kieran.bingham@ideasonboard.com,
	hdegoede@redhat.com, dave.stevenson@raspberrypi.com,
	mike.rudenko@gmail.com, alain.volmat@foss.st.com,
	devicetree@vger.kernel.org, conor+dt@kernel.org,
	alexander.stein@ew.tq-group.com, umang.jain@ideasonboard.com,
	zhi.mao@mediatek.com, festevam@denx.de, julien.vuillaumier@nxp.com,
	alice.yuan@nxp.com
Subject: Re: [PATCH v3 2/4] media: ox05b1s: Add omnivision OX05B1S raw sensor
 driver
Message-ID: <20250203133224.GA22963@pendragon.ideasonboard.com>
References: <20250124001243.446511-1-mirela.rabulea@nxp.com>
 <20250124001243.446511-3-mirela.rabulea@nxp.com>
 <20250124-benevolent-rat-of-tolerance-3a7eea@krzk-bin>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250124-benevolent-rat-of-tolerance-3a7eea@krzk-bin>

On Fri, Jan 24, 2025 at 09:07:01AM +0100, Krzysztof Kozlowski wrote:
> On Fri, Jan 24, 2025 at 02:12:41AM +0200, Mirela Rabulea wrote:
> > +
> > +static int ox05b1s_read_chip_id(struct ox05b1s *sensor)
> > +{
> > +	struct device *dev = &sensor->i2c_client->dev;
> > +	u64 chip_id = 0;
> > +	char *camera_name;
> > +	int ret = 0;
> > +
> > +	ret = cci_read(sensor->regmap, OX05B1S_REG_CHIP_ID, &chip_id, NULL);
> 
> This suggests these are compatible devices. But in the binding you said
> they are not... so your binding is not correct. Express compatibility
> with proper fallback.

Unfortunately we can't do that for camera sensors. It's important for
drivers to be able to identify the camera sensor model without having to
power up the device at probe time, depending on what device the sensor
is integrated in. For instance, with camera sensors found in laptops,
the privacy LED is often connected to the sensor power supply, and a
flashing privacy light when booting scares users.

Reading the ID register at probe time is fine when running on a platform
where the sensor can be powered up when probing, so the driver isn't
wrong doing so. It's also fine for drivers to not implement the no-power
probe right away. DT bindings however need to be ready for this, so a
fallback string can't be used.

> > +	if (ret) {
> > +		dev_err(dev, "Camera chip_id read error\n");
> > +		return -ENODEV;
> > +	}
> > +
> > +	switch (chip_id) {
> > +	case 0x580542:
> > +		camera_name = "ox05b1s";
> > +		break;
> > +	default:
> > +		camera_name = "unknown";
> > +		break;
> > +	}
> > +
> > +	if (chip_id == sensor->model->chip_id) {
> > +		dev_dbg(dev, "Camera %s detected, chip_id=%llx\n", camera_name, chip_id);
> > +	} else {
> > +		dev_err(dev, "Detected %s camera (chip_id=%llx), but expected %s (chip_id=%x)\n",
> > +			camera_name, chip_id, sensor->model->name, sensor->model->chip_id);
> > +		ret = -ENODEV;
> > +	}
> > +
> > +	return ret;
> > +}
> 
> ...
> 
> > +
> > +static const struct of_device_id ox05b1s_of_match[] = {
> > +	{
> > +		.compatible = "ovti,ox05b1s",
> 
> And this is incomplete, according to current binding, so it seems you
> wanted to make them compatible just did not write the binding like that?
> 
> Confusing.
> 
> > +		.data = &ox05b1s_data,
> > +	},
> > +	{ /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, ox05b1s_of_match);
> > +
> > +static struct i2c_driver ox05b1s_i2c_driver = {
> > +	.driver = {
> > +		.name  = "ox05b1s",
> > +		.pm = pm_ptr(&ox05b1s_pm_ops),
> > +		.of_match_table	= ox05b1s_of_match,
> > +	},
> > +	.probe	= ox05b1s_probe,
> > +	.remove = ox05b1s_remove,
> > +};
> > +
> > +module_i2c_driver(ox05b1s_i2c_driver);
> > +MODULE_DESCRIPTION("Omnivision OX05B1S MIPI Camera Subdev Driver");
> > +MODULE_AUTHOR("Mirela Rabulea <mirela.rabulea@nxp.com>");
> > +MODULE_LICENSE("GPL");
> > diff --git a/drivers/media/i2c/ox05b1s/ox05b1s_modes.c b/drivers/media/i2c/ox05b1s/ox05b1s_modes.c
> > new file mode 100644
> > index 000000000000..1f3b822d4482
> > --- /dev/null
> > +++ b/drivers/media/i2c/ox05b1s/ox05b1s_modes.c
> > @@ -0,0 +1,63 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Register configurations for all sensor supported modes
> > + * Copyright (C) 2024, NXP
> > + * Copyright (C) 2024, Omnivision
> > + * Copyright (C) 2024, Verisilicon
> > + *
> > + */
> > +
> > +#include "ox05b1s.h"
> > +
> > +/*
> > + * Register configuration for Omnivision OX05B1S raw camera
> > + * 2592X1944_30FPS_FULL_RGBIr 2592 1944
> > + */
> > +struct ox05b1s_reg ovx5b_init_setting_2592x1944[] = {
> 
> Why this is not const? I commented last time with the same.
> 
> > +	{ 0x0107, 0x01 },
> > +	{ 0x0307, 0x02 },
> > +	{ 0x034a, 0x05 },
> > +	{ 0x040b, 0x5c },
> > +	{ 0x040c, 0xcd },
> > +	{ 0x3009, 0x2e },
> > +	{ 0x3219, 0x08 },
> > +	{ 0x3684, 0x6d },
> > +	{ 0x3685, 0x6d },
> > +	{ 0x3686, 0x6d },
> > +	{ 0x3687, 0x6d },
> > +	{ 0x368c, 0x07 },
> > +	{ 0x368d, 0x07 },
> > +	{ 0x368e, 0x07 },
> > +	{ 0x368f, 0x00 },
> > +	{ 0x3690, 0x04 },
> > +	{ 0x3691, 0x04 },
> > +	{ 0x3692, 0x04 },
> > +	{ 0x3693, 0x04 },
> > +	{ 0x3698, 0x00 },
> > +	{ 0x36a0, 0x05 },
> > +	{ 0x36a2, 0x16 },
> > +	{ 0x36a3, 0x03 },
> > +	{ 0x36a4, 0x07 },
> > +	{ 0x36a5, 0x24 },
> > +	{ 0x36e3, 0x09 },
> > +	{ 0x3702, 0x0a },
> > +	{ 0x3821, 0x04 }, /* mirror */
> > +	{ 0x3822, 0x10 },
> > +	{ 0x382b, 0x03 },
> > +	{ 0x3866, 0x10 },
> > +	{ 0x386c, 0x46 },
> > +	{ 0x386d, 0x08 },
> > +	{ 0x386e, 0x7b },
> > +	{ 0x4802, 0x00 },
> > +	{ 0x481b, 0x3c },
> > +	{ 0x4837, 0x19 },
> > +	{ /* sentinel*/ },
> > +};
> > +
> > +struct ox05b1s_reglist ox05b1s_reglist_2592x1944[] = {
> 
> Why not const?
> 
> Best regards,
> Krzysztof
> 

-- 
Regards,

Laurent Pinchart

