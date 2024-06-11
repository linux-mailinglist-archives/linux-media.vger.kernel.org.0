Return-Path: <linux-media+bounces-12950-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 95603903CC0
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 15:08:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E11C4B24CD0
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 13:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 126F617C7CD;
	Tue, 11 Jun 2024 13:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="DEuOBgTt"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30B017BB24;
	Tue, 11 Jun 2024 13:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718111325; cv=none; b=YeyBp3ZA/4n8Psx4sWo9pU4467nOsSR/wydmyE2Lj/Ap1QJK3UZ9O6ZDdFyUF2mUTVbDSLrG8wjcky8oGtcLoK6SKm+mYTfFF9JeSB3XDQbdqntguKGOsOAIFUvnFn9waxy/nW2BvY1nU8n8Zr7aAHHyFXpVdC0uRy42gr6IIio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718111325; c=relaxed/simple;
	bh=RBXIIMQFGgjhWjPSF2j6pQP/VP+rBTgY2xxLTrIS/iI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ag61a5dhM+iQkDQXZbv655bC6yTZCHki9LSZNN+cQ2mZZv5HdqzZSmornQrNVcTtcRFu/6sbW4uoqocGlMSIEsNcksAuCw8dvfPabFoWgOZWR7zCyXYa+wrGzOtTsMvmvIRwme2B13D2LVMlWJE87dGvhkHGr6DFND+ewCL/2Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=DEuOBgTt; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45BBZ44P016764;
	Tue, 11 Jun 2024 15:08:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	KPKiv/4s/k/v6qSTDKufLgo3SaRNC45wOYFv8SveObU=; b=DEuOBgTtMVWZXCab
	ZhBw2CY7dZanzEEyh8ErLRmvycHiFJlhXmIRakLWkOlJ7OeX5T71saq1tStbsZlR
	2bWjGQ8KTZVuIWpEC3Rpzevef4KCg7aNKFmsta3Qd/9N4d0FjFM8nM1ahcNvLQT8
	P9tLmbVLO1Hrexx5ZPexOWmZGPTSFxJKIDk5QxIRXlcJUb71FNvmk5JV53hnsef8
	wnlIZ+qB6YHG9BV0LyBlZSN6c0vAyuNZ6+ALJ0bEPTIPC74VtE+rKIEp9KldcXoI
	HKuwxril4C/uIeIhFtpFwlhFiMbYJL0fLMDFloLzrKkavO9kvI7AlT5c/UnXFBh/
	Y5A2Rw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ypbp4b332-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 15:08:34 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E4EBD4002D;
	Tue, 11 Jun 2024 15:08:25 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9DEEC216ECA;
	Tue, 11 Jun 2024 15:07:42 +0200 (CEST)
Received: from [10.130.72.241] (10.130.72.241) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 11 Jun
 2024 15:07:42 +0200
Message-ID: <11cb5143-3c0e-4e7d-bcdb-6e8371bb1c0c@foss.st.com>
Date: Tue, 11 Jun 2024 15:07:41 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] media: vgxy61: Add legacy compatible string
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Sakari Ailus
	<sakari.ailus@linux.intel.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20240610150815.228790-1-benjamin.mugnier@foss.st.com>
 <20240610150815.228790-3-benjamin.mugnier@foss.st.com>
 <b4de42ba-d884-44b1-9f0e-12f5818c6781@kernel.org>
 <ZmgIiaqJy1tWL4Yz@kekkonen.localdomain>
 <b7514285-7a05-4874-a0fd-59ef16d5bce1@kernel.org>
 <458f8b1c-d750-424c-99dd-d31fde036314@foss.st.com>
 <4fd73e81-4573-4e1c-9623-c2f7f153d43a@kernel.org>
Content-Language: en-US
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <4fd73e81-4573-4e1c-9623-c2f7f153d43a@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_07,2024-06-11_01,2024-05-17_01

Hi Krzysztof,

On 6/11/24 14:17, Krzysztof Kozlowski wrote:
> On 11/06/2024 13:57, Benjamin Mugnier wrote:
>> Hi Sakari and Krzysztof,
>>
>> On 6/11/24 10:38, Krzysztof Kozlowski wrote:
>>> On 11/06/2024 10:19, Sakari Ailus wrote:
>>>> Hi Krzysztof,
>>>>
>>>> On Tue, Jun 11, 2024 at 08:47:25AM +0200, Krzysztof Kozlowski wrote:
>>>>> On 10/06/2024 17:08, Benjamin Mugnier wrote:
>>>>>> As the driver has been renamed from 'st-vgxy61' to 'vgxy61', its
>>>>>> compatible string has been updated to reflect this change. Therefore old
>>>>>> device trees will not work anymore.
>>>>>> Add the old driver name as another compatible name to handle the
>>>>>> retro compatibility.
>>>>>>
>>>>>> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
>>>>>> ---
>>>>>>  drivers/media/i2c/vgxy61.c | 5 +++++
>>>>>>  1 file changed, 5 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/media/i2c/vgxy61.c b/drivers/media/i2c/vgxy61.c
>>>>>> index 30378e962016..ca3b43608dad 100644
>>>>>> --- a/drivers/media/i2c/vgxy61.c
>>>>>> +++ b/drivers/media/i2c/vgxy61.c
>>>>>> @@ -1867,6 +1867,11 @@ static void vgxy61_remove(struct i2c_client *client)
>>>>>>  }
>>>>>>  
>>>>>>  static const struct of_device_id vgxy61_dt_ids[] = {
>>>>>> +	{ .compatible = "st,vgxy61" },
>>>>>> +	/*
>>>>>> +	 * Previously the driver was named 'st-vgxy61' instead of simply
>>>>>> +	 * 'vgxy61', keep it for retrocompatibility purposes.
>>>>>
>>>>> NAK.
>>>>
>>>> Is that because the comment says "driver" rather than "device"?
>>>>
>>
>> You're correct, I'll replace all occurrences for the series.
>>
>>>> Please try to express clearer what you'd expect from the patch author.
>>>
>>> There is almost never a need to rename compatible or add new compatible
>>> matching existing one. There are exceptions, like development or work in
>>> progress with no users at all (and really no users!).
>>>
>>> The commit did not provide any rationale for binding change.
>>>
>>> Additionally, it does not make any sense. There is no point in doing it
>>> at all. No benefit.
>>>
>>
>> Thanks, here is a draft of a new commit message for v2 highlighting the
>> rationale :
>>
>> The previous binding 'st,st-vgxy61' did not reflect the actual device
>> name : vgxy61 (and not st-vgxy61 as ST is the vendor prefix), and was
>> changed to 'st,vgxy61'.
> 
> That's not really a reason to change binding.
> 
>> Still some device trees uses the old binding. This commit adds back the
>> 'st,vgxy61' binding in addition to the new one to ensure retro
>> compatibility.
> 
> "Adds back"? This means it was there but was removed, so please document
> it with commit references.
> 

My bad, patch 1/3 on this series changes the binding, only to be added
back by this one (2/3).
I'll do it the other way around : patch 1/3 will *not* change the
binding, and patch 2/3 will add the new binding instead. Way cleaner.

>>
>> Will this be ok for you ? Tell me your thoughts.
> 
> It seems you are making some changes assuming there is some error to be
> fixed, but there is none. Compatible is just some unique string, so the
> original compatible, although unfortunate, is okay and must not be
> changed. I already explained that adding new compatibles for such cases
> is only for exceptions. Is this exception? No. You provided no rationale
> to make it an exception.

Thank you. I think I failed to provide some details :

The change is motivated by a will of consistency in naming.
As you correctly mentioned in the vd56g3 series [1], bindings should be
'vendor,device'. This will be changed for the vd56g3 series v3 by
Sylvain, but the vgxy61 binding is already badly named.
We will then have these 2 bindings in the wild : st,vd56g3 and
st,st-vgxy61, for very similar sensors. Hence the will to add a
st,vgxy61 binding for consistency.
This also prepares the ground for new camera sensor drivers we plan to
submit later on, and that will respect the st,device binding naming scheme.

Is it the correct way to go ?

I will add something along these lines to the commit message.


[1] https://lkml.org/lkml/2024/5/27/670

> 
> Best regards,
> Krzysztof
> 

-- 
Regards,

Benjamin

