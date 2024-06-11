Return-Path: <linux-media+bounces-12947-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B586903B47
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 14:00:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C885288103
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 12:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5608D17D341;
	Tue, 11 Jun 2024 11:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="q4eK+AFP"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98B517CA18;
	Tue, 11 Jun 2024 11:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718107122; cv=none; b=RaNk91XIM9Hh2Sc31AH1pejuyBcJHYU+4Arw6zyRLd4tMPF7dfNofl2IeVMl3qh/6Xh4+HUqHYahCCyWsvD/LiyYpspYKg/G3Yh8B4lACPojMZYyiNlWDSmXc5pPDQIJGpVG1wzc9NlOZbEPlUYyIC17SWf4xaOcaUc8DMPaN2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718107122; c=relaxed/simple;
	bh=01nvPV5Dl/fOqoUUb6+fEA88ND8ivm3vk4fjxHP5wWw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=n2rr+C3bfTZjEntavYTzxZworWvIy1a07a3zwbWhttdLVs759aN7n5lDApswNFibUGVL6Dabpwk1vUKbR0KV46miXL7CLU+mxtqa0vZ9ZGnZVFBNSIQIrYb9A/o8yKGUhGsKbAGtirfWp+YnwITobxjhXQr5r59Nmj+IpLAMjd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=q4eK+AFP; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45B7jBAL017387;
	Tue, 11 Jun 2024 13:58:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	g2gH7m8nQ93PXE9TrCQmuPEf9+DwSRpG7LmUYCpp8x0=; b=q4eK+AFPLLk+tV2H
	6mEw5rWoKJYJGPMAAEdaf0ZIqVPmVGfYNmbhrQXvxBQbdiSostDSMmG1FjHL0eE+
	baiCIDm06t/NJAeZ6n1cAp5jTNkwVpWyT7kkgTefElxINQ6/Fk9Nt9ADr18yETYz
	2BW9bOqohcrJQLW56hLRHwGkqQd8gtnUlknYF2ZISw7oLxqBhf1vVTJTPNJ07kne
	BxJ0rr70fYdJivBaRMy83QpUXTEIwi+bd+RoCmBUq1O6RRtX1YKKjX8nCJWlbIrM
	7GLpHFHkFFEYBJHzTJhHSocotvfR8nRTjOLtRBsMcktZauPQXLzDh7YMCQ8FLsEb
	FkM8Xg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ypbp4aspw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 13:58:31 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1627E40048;
	Tue, 11 Jun 2024 13:58:27 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 64E3121513B;
	Tue, 11 Jun 2024 13:57:48 +0200 (CEST)
Received: from [10.130.72.241] (10.130.72.241) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 11 Jun
 2024 13:57:47 +0200
Message-ID: <458f8b1c-d750-424c-99dd-d31fde036314@foss.st.com>
Date: Tue, 11 Jun 2024 13:57:47 +0200
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
Content-Language: en-US
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <b7514285-7a05-4874-a0fd-59ef16d5bce1@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_07,2024-06-11_01,2024-05-17_01

Hi Sakari and Krzysztof,

On 6/11/24 10:38, Krzysztof Kozlowski wrote:
> On 11/06/2024 10:19, Sakari Ailus wrote:
>> Hi Krzysztof,
>>
>> On Tue, Jun 11, 2024 at 08:47:25AM +0200, Krzysztof Kozlowski wrote:
>>> On 10/06/2024 17:08, Benjamin Mugnier wrote:
>>>> As the driver has been renamed from 'st-vgxy61' to 'vgxy61', its
>>>> compatible string has been updated to reflect this change. Therefore old
>>>> device trees will not work anymore.
>>>> Add the old driver name as another compatible name to handle the
>>>> retro compatibility.
>>>>
>>>> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
>>>> ---
>>>>  drivers/media/i2c/vgxy61.c | 5 +++++
>>>>  1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/drivers/media/i2c/vgxy61.c b/drivers/media/i2c/vgxy61.c
>>>> index 30378e962016..ca3b43608dad 100644
>>>> --- a/drivers/media/i2c/vgxy61.c
>>>> +++ b/drivers/media/i2c/vgxy61.c
>>>> @@ -1867,6 +1867,11 @@ static void vgxy61_remove(struct i2c_client *client)
>>>>  }
>>>>  
>>>>  static const struct of_device_id vgxy61_dt_ids[] = {
>>>> +	{ .compatible = "st,vgxy61" },
>>>> +	/*
>>>> +	 * Previously the driver was named 'st-vgxy61' instead of simply
>>>> +	 * 'vgxy61', keep it for retrocompatibility purposes.
>>>
>>> NAK.
>>
>> Is that because the comment says "driver" rather than "device"?
>>

You're correct, I'll replace all occurrences for the series.

>> Please try to express clearer what you'd expect from the patch author.
> 
> There is almost never a need to rename compatible or add new compatible
> matching existing one. There are exceptions, like development or work in
> progress with no users at all (and really no users!).
> 
> The commit did not provide any rationale for binding change.
> 
> Additionally, it does not make any sense. There is no point in doing it
> at all. No benefit.
> 

Thanks, here is a draft of a new commit message for v2 highlighting the
rationale :

The previous binding 'st,st-vgxy61' did not reflect the actual device
name : vgxy61 (and not st-vgxy61 as ST is the vendor prefix), and was
changed to 'st,vgxy61'.
Still some device trees uses the old binding. This commit adds back the
'st,vgxy61' binding in addition to the new one to ensure retro
compatibility.

Will this be ok for you ? Tell me your thoughts.

> Best regards,
> Krzysztof
> 

-- 
Regards,

Benjamin

