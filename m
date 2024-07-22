Return-Path: <linux-media+bounces-15234-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E1D938B88
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 10:53:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C59EA1C21051
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 08:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E15316A94B;
	Mon, 22 Jul 2024 08:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HhWRQMj0"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8691684A6;
	Mon, 22 Jul 2024 08:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721638390; cv=none; b=XnZHLVpvjNp6PcrHCsyw1EGzLtNFpr06avk41XU0VQx9vk9cTr0ZYLF6uOPPrUCCW+IJCBaRkoXipt8f8aXtqWOKFBZ+kl1+a1NOK9321nOurwu7ClLGtn8wroM54/qvIt0hArD3fE+vtqAYBDiNtbJgHK2WjP5b83H5h07Lxcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721638390; c=relaxed/simple;
	bh=RABwcbuJTKGsJDAbco1inY1w99Id8/vZ+Lctjp24GqU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O0dTXoz4wmYbt7lISSQzYdqLhaVZFkX6DVF/vXef0CxHdD52CBRn8ZtoKIYX0sHnuY+vX8QXNi57Qok5OjYOjGq4JRPo0KalCJAmFpwpRFlyofOc7c15BV4pNbUms0Iq8PXURGda0RYPrzEYDXcyMqhSWlc8ersUqDSDVNsXlXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HhWRQMj0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-157-149-128.elisa-laajakaista.fi [91.157.149.128])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 217072B3;
	Mon, 22 Jul 2024 10:52:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1721638344;
	bh=RABwcbuJTKGsJDAbco1inY1w99Id8/vZ+Lctjp24GqU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HhWRQMj0lXomE4RPG6BITO9+26ShQx/W9CNXbQ2GH9poC6AOhnHdtRNTDhCw9OKs0
	 7/4LBMeJ77x09TBjFv+ys746Hm05TCxjcgikQXgE2kKT2RJwgGKD2RkhbogUoINP0t
	 zFZzzELyIV/PLnhF1YkIh1dSLpcm1S463dYykKOw=
Message-ID: <416ec496-a224-47d0-b092-6976aa039318@ideasonboard.com>
Date: Mon, 22 Jul 2024 11:53:02 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOWbnuWkjTogW1BBVENIIHYyIDIvNV0gbWVkaWE6IGNhZGVuY2U6?=
 =?UTF-8?Q?_csi2rx=3A_Add_system_PM_support?=
To: Changhuang Liang <changhuang.liang@starfivetech.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jack Zhu <jack.zhu@starfivetech.com>,
 Keith Zhao <keith.zhao@starfivetech.com>, Jayshri Pawar
 <jpawar@cadence.com>, Jai Luthra <j-luthra@ti.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>
References: <20240718032834.53876-1-changhuang.liang@starfivetech.com>
 <20240718032834.53876-3-changhuang.liang@starfivetech.com>
 <26af0977-8e38-47d0-a521-c5b1e505d564@ideasonboard.com>
 <ZQ0PR01MB13024828274542F14E89AD58F2A82@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <ZQ0PR01MB13024828274542F14E89AD58F2A82@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 22/07/2024 05:17, Changhuang Liang wrote:
> Hi, Tomi
> 
>> Hi,
>>
>> On 18/07/2024 06:28, Changhuang Liang wrote:
>>> Add system PM support make it stopping streaming at system suspend
>>> time, and restarting streaming at system resume time.
>>>
>>> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
>>> ---
>>>    drivers/media/platform/cadence/cdns-csi2rx.c | 32
>> ++++++++++++++++++++
>>>    1 file changed, 32 insertions(+)
>>>
>>> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c
>>> b/drivers/media/platform/cadence/cdns-csi2rx.c
>>> index 981819adbb3a..81e90b31e9f8 100644
>>> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
>>> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
>>> @@ -776,8 +776,40 @@ static int csi2rx_runtime_resume(struct device
>> *dev)
>>>    	return ret;
>>>    }
>>>
>>> +static int __maybe_unused csi2rx_suspend(struct device *dev) {
>>> +	struct csi2rx_priv *csi2rx = dev_get_drvdata(dev);
>>> +
>>> +	mutex_lock(&csi2rx->lock);
>>> +	if (csi2rx->count)
>>> +		csi2rx_stop(csi2rx);
>>> +	mutex_unlock(&csi2rx->lock);
>>> +
>>> +	pm_runtime_force_suspend(dev);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int __maybe_unused csi2rx_resume(struct device *dev) {
>>> +	struct csi2rx_priv *csi2rx = dev_get_drvdata(dev);
>>> +	int ret;
>>> +
>>> +	ret = pm_runtime_force_resume(dev);
>>> +	if (ret < 0)
>>> +		return ret;
>>> +
>>> +	mutex_lock(&csi2rx->lock);
>>> +	if (csi2rx->count)
>>> +		csi2rx_start(csi2rx);
>>> +	mutex_unlock(&csi2rx->lock);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>>    static const struct dev_pm_ops csi2rx_pm_ops = {
>>>    	SET_RUNTIME_PM_OPS(csi2rx_runtime_suspend,
>> csi2rx_runtime_resume,
>>> NULL)
>>> +	SET_SYSTEM_SLEEP_PM_OPS(csi2rx_suspend, csi2rx_resume)
>>>    };
>>>
>>>    static const struct of_device_id csi2rx_of_table[] = {
>>
>> If I'm not mistaken, this is a subdev driver, and is somewhere in the middle of
>> the pipeline. Afaiu, only the driver that handles the v4l2 video devices should
>> have system suspend hooks. The job of that driver is then to disable or enable
>> the pipeline using v4l2 functions, and for the rest of the pipeline system
>> suspend looks just like a normal pipeline disable.
>>
> 
> I see that the imx219 has a commit:
> 
> commit b8074db07429b845b805416d261b502f814a80fe
> Author: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Date:   Thu Sep 14 21:16:49 2023 +0300
> 
>      media: i2c: imx219: Drop system suspend and resume handlers
> 
>      Stopping streaming on a camera pipeline at system suspend time, and
>      restarting it at system resume time, requires coordinated action between
>      the bridge driver and the camera sensor driver. This is handled by the
>      bridge driver calling the sensor's .s_stream() handler at system suspend
>      and resume time. There is thus no need for the sensor to independently
>      implement system sleep PM operations. Drop them.
> 
>      The streaming field of the driver's private structure is now unused,
>      drop it as well.
> 
>      Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>      Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
>      Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>      Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> 
> Implement the system PM of sensor using bridge. This csi2rx is also a bridge.
> So I add system PM in this driver.

It is not a bridge in the sense that the commit message means. The 
system suspend should be handled in the last (or first, depending on 
which way you think about it) driver in the pipeline, the one that 
handles the VIDIOC_STREAMON.

  Tomi


