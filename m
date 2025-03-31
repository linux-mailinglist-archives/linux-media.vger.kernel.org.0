Return-Path: <linux-media+bounces-29054-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBD5A76620
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 14:36:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B66FA188B7C5
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 12:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 056021E7C03;
	Mon, 31 Mar 2025 12:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="KnU+BY1I"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC8F1DED4B;
	Mon, 31 Mar 2025 12:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743424555; cv=none; b=QtAf3elm0fxoMSW/y5sh9cYOsQfV3S+0wn9UHDjllbPgiE+k0euJXApSZXMK95nGzA5pPmHNx8O7hIOgywm1QMKSPc+P5PTVkcfe30yBCesl4+p3PO+ePKZljCRpoJc6o7Abg/heJoYpTt69y6VwjkhMa6wzr5bTapCCLvVmJlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743424555; c=relaxed/simple;
	bh=/LWQvYJHJQvzRwTpToozedDf4Rwh566PaoTjVDMd+Gk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Mpg1fGcXLz40OKEJqXxMApH46T3CpRJcA7DqgfjkFEOLwyIY7ldnXLMIsYJeRFkHXiH+Kaybp/8NMxYcnG4jaWWv0p57zrN5BwB+Dtor0F9JXFEAtgxlGbchWICcJDxDdujwJlOUQWbZ6PXxsCNLaUwLxzcQMypsEeihoN7FJqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=KnU+BY1I; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VB7U1o018939;
	Mon, 31 Mar 2025 14:35:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	xE/hUChwYiRZqoCKGksJkJaPeYpAMEtCB+9/+mp3xC4=; b=KnU+BY1IdU4je4+c
	lxtQAR9PXi4IfPMZYzR9xzPPCtMSLdjPuT+06zZV5SZ80j/jCQgGJpRAFuMktxPn
	ZS+VCWq92dzcDtrI/7xu0oB3vi7a74H3osXEQ010y+7XYlxrLxHHNXoY/xWaCaGE
	XBoJ20edKrvmCw2ptxnfy16eXZVDyOJ2Bb99ADllmxw4Z3a6S8BsDkeNjj0RblBh
	BN/9nBxvEkjfLa6FLwuZu+TwMJAwv0vgbLmdzSdwIkPolpVVgWWfh+js6l+9GEUq
	yNfdqA0ZY3joj0m8leQYd6fRiWcSCoOMdS9t7Q+EV/tNrGhbtZHkfNOSWJspD9dW
	85esHQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45p75q0bjs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Mar 2025 14:35:32 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E48094002D;
	Mon, 31 Mar 2025 14:34:42 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 37E69898252;
	Mon, 31 Mar 2025 14:34:10 +0200 (CEST)
Received: from [10.130.73.167] (10.130.73.167) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 31 Mar
 2025 14:34:09 +0200
Message-ID: <3cdc3771-c61e-427f-ad59-12bcb41e7e8d@foss.st.com>
Date: Mon, 31 Mar 2025 14:34:09 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: i2c: Add driver for ST VD55G1 camera sensor
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Sylvain Petinot
	<sylvain.petinot@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus
	<sakari.ailus@linux.intel.com>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250328-b4-vd55g1-v1-0-8d16b4a79f29@foss.st.com>
 <20250328-b4-vd55g1-v1-2-8d16b4a79f29@foss.st.com>
 <7556a0a8-47f3-4cf7-ae4d-9ea444d98c6b@kernel.org>
Content-Language: en-US
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <7556a0a8-47f3-4cf7-ae4d-9ea444d98c6b@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_05,2025-03-27_02,2024-11-22_01

Hi Krzysztof,

Thank you for your review.

On 3/29/25 06:46, Krzysztof Kozlowski wrote:
> On 28/03/2025 14:40, Benjamin Mugnier wrote:
>> +
>> +static void vd55g1_subdev_cleanup(struct vd55g1 *sensor)
>> +{
>> +	v4l2_async_unregister_subdev(&sensor->sd);
>> +	v4l2_subdev_cleanup(&sensor->sd);
>> +	media_entity_cleanup(&sensor->sd.entity);
>> +	v4l2_ctrl_handler_free(sensor->sd.ctrl_handler);
>> +}
>> +
>> +static int vd55g1_err_probe(struct device *dev, int ret, char *msg)
> 
> Drop, it's really useless. Don't create own abstraction layers for other
> systems.
> 
>> +{
>> +	return dev_err_probe(dev, ret, msg);
>> +}
>> +
>> +static int vd55g1_probe(struct i2c_client *client)
>> +{
>> +	struct device *dev = &client->dev;
>> +	struct vd55g1 *sensor;
>> +	int ret;
>> +
>> +	sensor = devm_kzalloc(dev, sizeof(*sensor), GFP_KERNEL);
>> +	if (!sensor)
>> +		return -ENOMEM;
>> +
>> +	v4l2_i2c_subdev_init(&sensor->sd, client, &vd55g1_subdev_ops);
>> +	sensor->i2c_client = client;
>> +
>> +	ret = vd55g1_parse_dt(sensor);
>> +	if (ret)
>> +		return vd55g1_err_probe(dev, ret,
>> +					"Failed to parse Device Tree.");
>> +
>> +	/* Get (and check) resources : power regs, ext clock, reset gpio */
>> +	ret = vd55g1_get_regulators(sensor);
>> +	if (ret)
>> +		return vd55g1_err_probe(dev, ret, "Failed to get regulators.");
>> +
>> +	sensor->xclk = devm_clk_get(dev, NULL);
>> +	if (IS_ERR(sensor->xclk)) {
> 
> Drop {}
> 
> Please run scripts/checkpatch.pl on the patches and fix reported
> warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
> patches and (probably) fix more warnings. Some warnings can be ignored,
> especially from --strict run, but the code here looks like it needs a
> fix. Feel free to get in touch if the warning is not clear.
> 

While it should, checkpatch does not complain about that. Maybe because
the function call is on two lines ? Anyway thanks a lot for pointing
this. Fixed.

>> +		return vd55g1_err_probe(dev, PTR_ERR(sensor->xclk),
> 
> No. Syntax is return dev_err_probe, not some custom wrappers over single
> function.
> 
>> +					"Failed to get xclk.");
>> +	}
>> +	sensor->xclk_freq = clk_get_rate(sensor->xclk);
>> +	ret = vd55g1_prepare_clock_tree(sensor);
>> +	if (ret)
>> +		return ret;
>> +
>> +	sensor->reset_gpio =
>> +		devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
> 
> Odd wrapping. This should be one line with optionally wrapped last argument.
> 
>> +	if (IS_ERR(sensor->reset_gpio))
>> +		return vd55g1_err_probe(dev, PTR_ERR(sensor->reset_gpio),
>> +					"Failed to get reset gpio.");
>> +
>> +	sensor->regmap = devm_cci_regmap_init_i2c(client, 16);
>> +	if (IS_ERR(sensor->regmap))
>> +		return vd55g1_err_probe(dev, PTR_ERR(sensor->regmap),
>> +					"Failed to init regmap.");
>> +
>> +	/* Detect if sensor is present and if its revision is supported */
>> +	ret = vd55g1_power_on(dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = vd55g1_subdev_init(sensor);
>> +	if (ret) {
>> +		dev_err(dev, "V4l2 init failed : %d", ret);
>> +		goto err_power_off;
>> +	}
>> +
>> +	ret = v4l2_async_register_subdev(&sensor->sd);
>> +	if (ret) {
>> +		dev_err(dev, "async subdev register failed %d", ret);
>> +		goto err_subdev;
>> +	}
>> +
>> +	/* Enable pm_runtime and power off the sensor */
>> +	pm_runtime_set_active(dev);
>> +	pm_runtime_get_noresume(dev);
>> +	pm_runtime_enable(dev);
>> +	pm_runtime_set_autosuspend_delay(dev, 4000);
>> +	pm_runtime_use_autosuspend(dev);
>> +	pm_runtime_mark_last_busy(dev);
>> +
>> +	dev_dbg(dev, "vd55g1 probe successfully");
> 
> Drop. Kernel already provides you such debugging/tracing.

Interesting, do you know how to enable this kind of tracing ?

> 
> Best regards,
> Krzysztof

-- 
Regards,
Benjamin

