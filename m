Return-Path: <linux-media+bounces-49807-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F018CEC0A6
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 14:48:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 90865301E5A4
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 13:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38EA03246EC;
	Wed, 31 Dec 2025 13:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="ZSHiMJ99"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-25.smtpout.orange.fr [80.12.242.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43F0219A79;
	Wed, 31 Dec 2025 13:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767188906; cv=none; b=jQM+SWRb3GtwnSAhz+LjEnxg3hAIoY+fOYJjp3aIHhTbRkD2mIMx0kMgyE9VROPtYSQ3qI8rjQys9a9V1dP0j9Gg6ymAvlNY86nDN3YyVqf5ZbDJcF1j3MBTe4JK5buQ05jdo2atNTygGxaQONjVJn0Cfy8W9OpoFJiZ12COXD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767188906; c=relaxed/simple;
	bh=34Pv+DAbA1+ucMOfOi91nq+Jvbj/1CllKZJ7LoOnuVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MFqIEVyVuV5pjTuiwiaJuh0+bbdExRG+84S2XYj4x8tBddQrFQN4e67dAZbUwd80BTUm1dEXtWF+yQmRK1iy2JR0uLpgpkvkAkmVUyHs9lsBEN2qKnUR+q4sLGIyn4B2QlHjgiiILDSFgzOTcsJ/NGAELNRgeuNI/8thFVpig6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=ZSHiMJ99; arc=none smtp.client-ip=80.12.242.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
 ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id awYcveomr3PvLawYcvqbU7; Wed, 31 Dec 2025 14:48:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1767188893;
	bh=uHKZXKm6A2sTaQft9NinGZUBPoQYOBV/hEfgcz91BOo=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=ZSHiMJ99bSwEG1MZP59/oGYw6oLS49vIRym1AuQZscltKh6Q5FWCveP/db8MJXlC6
	 HWx54o12vSyMW7A0Rx9QMMEVwoKbap7Zv03jQ2O7w1mEmq0qNwK8lnaU9qbGT1kzyJ
	 gvRR47JMQwSSy6m6EnrFaYZ0chJxMCmLquQLdn94rzxwBO+7ZeXMOgH0msz8yrdMZh
	 cTMJ+b3S+8RckrDkUCTH/JHG2kEkZ0yPWQsJvY4gs/7vs7Rpg9RoU2+3pIdQ5otqcV
	 taDlXKM8ILk6pIggP3+PrZQ2DgF3DCjAy0yq4DvEfnZ3M0Jt2kz5R533mUHsde5Jph
	 +7d1IX5t5mxuQ==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 31 Dec 2025 14:48:13 +0100
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
Message-ID: <c905f11a-671f-428c-83a9-00485f507c0a@wanadoo.fr>
Date: Wed, 31 Dec 2025 14:48:08 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] media: i2c: add os05b10 image sensor driver
To: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, robh@kernel.org,
 krzk+dt@kernel.org, sakari.ailus@linux.intel.com
Cc: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>,
 Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?=
 <git@apitzsch.eu>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dongcheng Yan <dongcheng.yan@intel.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 Jingjing Xiong <jingjing.xiong@intel.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251231070645.16434-1-himanshu.bhavani@siliconsignals.io>
 <20251231070645.16434-3-himanshu.bhavani@siliconsignals.io>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20251231070645.16434-3-himanshu.bhavani@siliconsignals.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 31/12/2025 à 08:06, Himanshu Bhavani a écrit :
> Add a v4l2 subdevice driver for the Omnivision OS05B10 sensor.
> 
> The Omnivision OS05B10 image sensor with an active
> array size of 2592 x 1944.
> 
> The following features are supported:
> - Manual exposure an gain control support
> - vblank/hblank control support
> - Supported resolution: 2592 x 1944 @ 60fps (SBGGR10)

Hi,

2 nitpicks, should there be a v8.

> +static int os05b10_parse_endpoint(struct os05b10 *os05b10)
> +{
> +	struct v4l2_fwnode_endpoint bus_cfg = {
> +		.bus_type = V4L2_MBUS_CSI2_DPHY
> +	};
> +	unsigned long link_freq_bitmap;
> +	struct fwnode_handle *ep;
> +	int ret;
> +
> +	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(os05b10->dev), 0, 0, 0);
> +	if (!ep) {
> +		dev_err(os05b10->dev, "Failed to get next endpoint\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> +	fwnode_handle_put(ep);
> +	if (ret)
> +		return ret;
> +
> +	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 4) {
> +		ret = dev_err_probe(os05b10->dev, -EINVAL,
> +				    "only 4 data lanes are supported\n");
> +		goto error_out;
> +	}
> +
> +	ret = v4l2_link_freq_to_bitmap(os05b10->dev, bus_cfg.link_frequencies,
> +				       bus_cfg.nr_of_link_frequencies,
> +				       link_frequencies,
> +				       ARRAY_SIZE(link_frequencies),
> +				       &link_freq_bitmap);
> +

Nitpick: blanck line can be removed.

> +	if (ret)
> +		dev_err(os05b10->dev, "only 600MHz frequency is available\n");
> +
> +error_out:
> +	v4l2_fwnode_endpoint_free(&bus_cfg);
> +
> +	return ret;
> +}

...

> +static const struct of_device_id os05b10_id[] = {
> +	{ .compatible = "ovti,os05b10" },
> +	{ /* sentinel */ },

Nitpick: No need for trailing , after a terminator.

CJ

> +};
> +
> +MODULE_DEVICE_TABLE(of, os05b10_id);
> +
> +static struct i2c_driver os05b10_driver = {
> +	.driver = {
> +		.name = "os05b10",
> +		.pm = pm_ptr(&os05b10_pm_ops),
> +		.of_match_table = os05b10_id,
> +	},
> +	.probe = os05b10_probe,
> +	.remove = os05b10_remove,
> +};
> +
> +module_i2c_driver(os05b10_driver);
> +
> +MODULE_DESCRIPTION("OS05B10 Camera Sensor Driver");
> +MODULE_AUTHOR("Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>");
> +MODULE_AUTHOR("Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>");
> +MODULE_LICENSE("GPL");
> --
> 2.34.1
> 



