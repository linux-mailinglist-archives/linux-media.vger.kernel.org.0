Return-Path: <linux-media+bounces-8787-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF8989A96B
	for <lists+linux-media@lfdr.de>; Sat,  6 Apr 2024 08:42:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 85D2CB22128
	for <lists+linux-media@lfdr.de>; Sat,  6 Apr 2024 06:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABBE72110F;
	Sat,  6 Apr 2024 06:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b="WPhbq6ZE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-108-mta158.mxroute.com (mail-108-mta158.mxroute.com [136.175.108.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868D6816
	for <linux-media@vger.kernel.org>; Sat,  6 Apr 2024 06:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712385724; cv=none; b=eJU8HpRBjYpqIeiLibnbtjyWEkj6Gis6AOfBJ431eD0bsnO8FxZdagTcnY8iw34dEhg2jk94EpAB5EwZly9Pk1O2A8Z8Ira5iHhoYcWH0fMp92y0fkuPVFLc93CX4uGtBoF3IJtYK8HjdI1xJzNOK1b8xYl1VDOqvx7Bcfv1ExY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712385724; c=relaxed/simple;
	bh=OxraREhf6GRED2LQephjdnm0ObJkCkvoK147D6T36ys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hKcY127GBHJhY0mFMgQw0k0i9lNs+s1A1nbz+KGHE/JG43JPz6VGEIRjtMWC5uGPsX4s69i9mgzlHklnr4NPVYnYp/3CrwHMt0mYShVMOGcANpcFijw327a9/k22HwvnR/WpV1bmyHwP6Q9X/NlwFmZ7c5CykofcaeyDAKJ2fXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com; spf=pass smtp.mailfrom=luigi311.com; dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b=WPhbq6ZE; arc=none smtp.client-ip=136.175.108.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luigi311.com
Received: from filter006.mxroute.com ([136.175.111.2] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta158.mxroute.com (ZoneMTA) with ESMTPSA id 18eb21fcaf10003bea.011
 for <linux-media@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 06 Apr 2024 06:36:51 +0000
X-Zone-Loop: ec82345cf8a274a8b9a1121be544e353b74380e44112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=luigi311.com; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=P6oz8jLcfNyvGaOUeOoCwlqC8Ij6mtZ6/gKuz1gexug=; b=WPhbq6ZEa+mQTnijWaBY6xxs/H
	cfHYUnpSRs8fOhOb/O4yJffkApW8GbdCsZ9fgpCJBUMa3pysrcREVULO1R/UkyRqIiPc9mObnfXPv
	YmP7o/tAqB0ayOqkRLxs5fQtXrUia6yJroEUCCB+ckUFpQp8RHDB0YyE7tXXD9rJenqQZDa30Cqkj
	soLpFl0b5rnHDmjMNbaU+mvK6HOXuMsdAhCIuIT3xhAYVnT6i+9TrIfSP7p+3tjqrOm0eD3oFmOvb
	FE0z2dqpWXi9w++3zacDwlhzLX9akXx4T0C5yl6+Qkahp/SWJ/+9Q9RvAIcOuf71zbchDNERWMcas
	kIvWVcdg==;
Message-ID: <91621b30-dc6f-49cb-878c-96d39e38d994@luigi311.com>
Date: Sat, 6 Apr 2024 00:36:47 -0600
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/25] media: i2c: imx258: Add get_selection for pixel
 array information
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-media@vger.kernel.org, dave.stevenson@raspberrypi.com,
 jacopo.mondi@ideasonboard.com, mchehab@kernel.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 sakari.ailus@linux.intel.com, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20240403150355.189229-1-git@luigi311.com>
 <20240403150355.189229-12-git@luigi311.com> <Zg2kHYc6kdiZEAFD@duo.ucw.cz>
Content-Language: en-US
From: Luis Garcia <git@luigi311.com>
In-Reply-To: <Zg2kHYc6kdiZEAFD@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authenticated-Id: git@luigi311.com

On 4/3/24 12:46, Pavel Machek wrote:
> Hi!
> 
>> Libcamera requires the cropping information for each mode, so
>> add this information to the driver.
> 
>> @@ -116,6 +124,9 @@ struct imx258_mode {
>>  	u32 link_freq_index;
>>  	/* Default register values */
>>  	struct imx258_reg_list reg_list;
>> +
>> +	/* Analog crop rectangle. */
> 
> No need for "." at the end, as it is not above.
> 

Done

>> +	struct v4l2_rect crop;
>>  };
> 
> If the crop is same in all modes, should we have it in common place?
> 
> Best regards,
> 								Pavel

I see the imx219 made a similar change where it was changed from using
that .crop format to just setting it in the set_pad_format function
so we can do something similar here.

