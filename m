Return-Path: <linux-media+bounces-33489-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BF1AC6147
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 07:36:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C2011BC2604
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 05:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACA5820458A;
	Wed, 28 May 2025 05:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="u6ZJGhZx"
X-Original-To: linux-media@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE442143C61;
	Wed, 28 May 2025 05:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748410587; cv=none; b=Sa8MDjdrlnWgOhu9T8FsSkGukJvrlwibT3R5X6w6iKAzvwwoaqpuIH7iv3vZgpZZCCFM5UAagLxN7ugclXMvPuXQSEVzcZEU+6Am7G83PMmhjwVd+ZnA7PFiwD5w2lI8suWk94pjTaqNpXFo7PSR4r7GeNY7P1tcYx7Q0VzHRPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748410587; c=relaxed/simple;
	bh=pne1TTfnZPdAQCFxseAndDOGOZ6uYICwRuY9HJM6vvo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bNfEtApniwsGEMX9dFzUVME3Q8W3YCm6hsjmpHJ6IOnU0o6Wgm7mzY5aPYxlM4E3yinftN0KjXkpTkEeC3jnoBzbwwxR5iN0pj/VfZCfQUIesFqiZQha0r3EijF2F2WiqTcozZDwY9cq+MiqEsVpoWMDogVevj5gFAByc3eGHUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=u6ZJGhZx; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54S5Zu8J3163423;
	Wed, 28 May 2025 00:35:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748410556;
	bh=81TpiA1++zjByF2HZlGUBzrVS6AnGvuIzILUPystUk8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=u6ZJGhZxic6Qx7udNEomeDnmhbguiXuxjg7Cnb9ZpB2Ev9EELQta7p0s2PPaoj+XJ
	 bOeDLocvOD4ivzK90+P3PFtTs93e+JTD1+w9S1uwBC8j/0nvYAzcqjB24EtKp241xv
	 6vchNK0+ae8gdVdKE+5N+ztccj9ri/qMsZAfZWJA=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54S5ZtGh3200000
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 28 May 2025 00:35:55 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 28
 May 2025 00:35:55 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 28 May 2025 00:35:55 -0500
Received: from [172.24.227.115] (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54S5ZoIk4021202;
	Wed, 28 May 2025 00:35:51 -0500
Message-ID: <d02d7c3f-adb7-4dda-8178-19af188ff90a@ti.com>
Date: Wed, 28 May 2025 11:05:50 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: dt-bindings: ti,ds90ub960: Add bindings for
 DS90UB954-Q1
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
CC: <hverkuil@xs4all.nl>, <sakari.ailus@linux.intel.com>,
        <laurent.pinchart@ideasonboard.com>, <vaishnav.a@ti.com>,
        <u-kumar1@ti.com>, <jai.luthra@linux.dev>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <mchehab@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
References: <20250523083655.3876005-1-y-abhilashchandra@ti.com>
 <20250523083655.3876005-2-y-abhilashchandra@ti.com>
 <b74ebab7-371e-4bc5-a069-8c72e1eb9161@ideasonboard.com>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <b74ebab7-371e-4bc5-a069-8c72e1eb9161@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Tomi,

Thanks for the review.

On 27/05/25 10:30, Tomi Valkeinen wrote:
> Hi,
> 
> On 23/05/2025 11:36, Yemike Abhilash Chandra wrote:
>> DS90UB954-Q1 is an FPDLink-III deserializer that is mostly register
>> compatible with DS90UB960-Q1. The main difference is that it supports
>> half of the RX and TX ports, i.e. 2x FPDLink RX ports and 1x CSI TX
>> port. Therefore, add support for DS90UB954 within the existing bindings.
>>
>> Link: https://www.ti.com/lit/gpn/ds90ub954-q1
>> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
>> ---
>>   Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
>> index 4dcbd2b039a5..b2d4300d7846 100644
>> --- a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
>> +++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
>> @@ -19,6 +19,7 @@ allOf:
>>   properties:
>>     compatible:
>>       enum:
>> +      - ti,ds90ub954-q1
>>         - ti,ds90ub960-q1
>>         - ti,ds90ub9702-q1
>>   
> 
> Does this pass the dt checks? The binding lists ports 0-5 as required.

Thanks for pointing this out. It is passing DT checks since we have marked
port 4 and port 5 as disabled in DT, but I now understand that approach is
not acceptable.

Ports 0–3 are documented as FPD-Link inputs, but on UB954, only ports 0 
and 1 are inputs,
while port 2 is CSI TX. Should I conditionally modify required ports for 
UB954(0-2) and
UB960/UB9702 (0-5), even though port 2's description would mismatch?
(In bindings it would be described as FPD-Link input but it will be 
modeled as CSI TX in DT).

Alternatively, we can describe the ports block separately for each 
compatible to
ensure correctness. Please let me know which approach you prefer.

Thanks and Regards,
Abhilash Chandra


> 
>   Tomi
> 

