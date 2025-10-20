Return-Path: <linux-media+bounces-44983-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D37A4BEFAC4
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 09:30:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 985AF189C593
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 07:30:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 139462D77F7;
	Mon, 20 Oct 2025 07:30:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from rmisp-mx-out2.tele.net (rmisp-mx-out2.tele.net [194.208.23.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB3F2DC32A;
	Mon, 20 Oct 2025 07:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.208.23.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760945407; cv=none; b=fW9mdqOJ/mwoFssZ0C1MLr7aeODYMWsJ8goT3x728xof1y3HtigNRkeqwOajphwKUO8lYfZfxQknL7LHHKekdBwA3u1mLQPv5MwzTPTxgOj3YI9QUcmTjJbhsc+1Dm8Y6j7V4Og3a+CuUppLFkOEsX7C5c1Zp9deI57/tiWTKto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760945407; c=relaxed/simple;
	bh=9Kv38v3pXX1RQ2lUomC953RpK4CdfHZugSxrpBIqqRA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C7zbSzMP823vh17BJ4CHDWev4vUJtfK/A5GLhOf/hkhduW9DdVKDUBaOmNUe+DjSY1hYaKE+MKxTPGUR3/ZMIenOfmOc2J3xEVwbSFQx3Ah9jSbr0xovP1ff6DT8qPvj825ocfDNzceWun/W3n7pK5eDKSVDyUfh1OkT+dZhw4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=fail smtp.mailfrom=emfend.at; arc=none smtp.client-ip=194.208.23.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=emfend.at
Received: from [192.168.0.207] (194-208-208-245.tele.net [194.208.208.245])
	by rmisp-mx-out2.tele.net (Postfix) with ESMTPA id 0C28A10E3CAC;
	Mon, 20 Oct 2025 09:21:15 +0200 (CEST)
Message-ID: <c5406a18-0f2b-41c8-854c-e91e74225b61@emfend.at>
Date: Mon, 20 Oct 2025 09:21:10 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] media: i2c: add Himax HM1246 image sensor driver
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Hans de Goede
 <hansg@kernel.org>, Ricardo Ribalda <ribalda@chromium.org>,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Tarang Raval <tarang.raval@siliconsignals.io>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Dongcheng Yan <dongcheng.yan@intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Alan Stern <stern@rowland.harvard.edu>,
 Jingjing Xiong <jingjing.xiong@intel.com>,
 Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Hao Yao <hao.yao@intel.com>,
 bsp-development.geo@leica-geosystems.com
References: <20251017-hm1246-v4-0-e3388ea2f08c@emfend.at>
 <20251017-hm1246-v4-2-e3388ea2f08c@emfend.at>
 <aPP40yh7--VGpd0O@ashevche-desk.local>
Content-Language: de-DE
From: Matthias Fend <matthias.fend@emfend.at>
In-Reply-To: <aPP40yh7--VGpd0O@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andy,

thanks for your comment.

Am 18.10.2025 um 22:30 schrieb Andy Shevchenko:
> On Fri, Oct 17, 2025 at 12:49:39PM +0200, Matthias Fend wrote:
>> Add a V4L2 sub-device driver for Himax HM1246 image sensor.
>>
>> The Himax HM1246-AWD is a 1/3.7-Inch CMOS image sensor SoC with an active
>> array size of 1296 x 976. It is programmable through an I2C interface and
>> connected via parallel bus.
>>
>> The sensor has an internal ISP with a complete image processing pipeline
>> including control loops. However, this driver uses the sensor in raw mode
>> and the entire ISP is bypassed.
> 
> ...
> 
>> +	hm1246->reset_gpio =
>> +		devm_gpiod_get_optional(hm1246->dev, "reset", GPIOD_OUT_HIGH);
>> +	if (IS_ERR(hm1246->reset_gpio))
>> +		return dev_err_probe(hm1246->dev, PTR_ERR(hm1246->reset_gpio),
>> +				     "failed to get reset GPIO\n");
> 
> Rely on the reset-gpio driver instead of this.

Do you mean that I should use devm_reset_control_get_optional, for 
example, to handle the reset GPIO pin?
Unless I've missed something, no I2C image sensor seems to use that.
The recently added driver for the OV2735 also uses the standard GPIO 
framework for the reset pin.

For these reasons, I'm not quite sure if I've understood this correctly.

Thanks
  ~Matthias


