Return-Path: <linux-media+bounces-29238-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AF6A79013
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 15:42:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C96907A3D3E
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 13:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB33023A9B4;
	Wed,  2 Apr 2025 13:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="DNQjBjHv"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC14C201271;
	Wed,  2 Apr 2025 13:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743601315; cv=none; b=HNZVeEt5i77z0QXt163mmiGlHBQgk3sPGS3bUerq6KwDQ8ClQ0xE4/rO2EWDjbtvgDfLKaGMxykP2jsfgz/GenBUyrmCfAkVonbKAVRVCD9PjGsDLyIcGbs7rxrfEvrC7H9RRUAdmR9HMajzTVFCydqtvPNlTrhBQwyo2zTK2Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743601315; c=relaxed/simple;
	bh=RlUxE1BH6NTHyg/TNSVKth95REvW2dDq2+0GHexae5I=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bPZfvZqsmz9Vbn2YduJbTgfyESM9pkbRUqoftiwx7MToCpnHqs20lFKCfRUdgFWL5rHNJQHbMX3aixEXHPn9F5wrdNL14PJPUYfwY4OMDF0W4jAZyWfg5+wAt+RpDuLr0Z+kyGIswpt/86UqvyYAQgctYa+qgxaTStQdXmN8tnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=DNQjBjHv; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532CcSaj008047;
	Wed, 2 Apr 2025 15:41:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	UapWujuoCP1cmnh3Upr64ky5/xFIxLVPaPTaREX+7jU=; b=DNQjBjHv8fS2U7sE
	fL/D3IDpFNX/FZdmjz1c9hWqgwdJ6mac1u89V/4hPOaxNtbbf3PGwH6YqwNUhcST
	K6YcngG74K/boLFf4ndBnWT6lgYe3Io852JBeUSBUuvNYxBD9L5WkvTo8zE/F7Hf
	2/7mLiRzaGHiG/LPs+ggWMIKMTAb1zYillZfcfHIPfk4nc0wAGnVQ/30Yz/Q/cnl
	lbGfZz20Uk4BM6bznGNtAzoEopWCkkz/V0mKqHbyUeRdij4YuiMaOJnndiGjE40/
	vruiu52+k4FlgdP8HeFddG+/FGfQx8Xe0cvpLkOPFaOfrRznU4FiNLkblEU6sbTh
	4OtPog==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45p9363dvc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Apr 2025 15:41:36 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id CE8B540048;
	Wed,  2 Apr 2025 15:40:43 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 567B083BD66;
	Wed,  2 Apr 2025 15:40:01 +0200 (CEST)
Received: from [10.252.30.87] (10.252.30.87) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Apr
 2025 15:40:00 +0200
Message-ID: <58e6a6a1-7f7c-4232-a212-59850ab03a41@foss.st.com>
Date: Wed, 2 Apr 2025 15:39:59 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] media: dt-bindings: Add ST VD55G1 camera sensor
 binding
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>
CC: Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus
	<sakari.ailus@linux.intel.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250401-b4-vd55g1-v2-0-0c8ab8a48c55@foss.st.com>
 <20250401-b4-vd55g1-v2-1-0c8ab8a48c55@foss.st.com>
 <20250402-curvy-seriema-of-blizzard-b1c4d9@krzk-bin>
 <228ddf41-e1d0-4d06-9e0e-9e0dad841688@foss.st.com>
 <fd874f4d-d68c-4443-8bb6-115246f4407b@kernel.org>
 <a0c62797-3c4c-453c-938b-d43666f3b264@foss.st.com>
 <7d501bf2-a017-4c02-a96f-184a7d648b6a@foss.st.com>
 <9f128ce9-6a26-435c-b133-0da80120de2d@kernel.org>
 <20250402124605.GB13181@pendragon.ideasonboard.com>
 <6f832ce4-03d3-46bc-afcc-86983b2ec47a@kernel.org>
Content-Language: en-US
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <6f832ce4-03d3-46bc-afcc-86983b2ec47a@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_05,2025-04-02_02,2024-11-22_01



On 4/2/25 14:55, Krzysztof Kozlowski wrote:
> On 02/04/2025 14:46, Laurent Pinchart wrote:
>> On Wed, Apr 02, 2025 at 12:27:08PM +0200, Krzysztof Kozlowski wrote:
>>> On 02/04/2025 11:41, Benjamin Mugnier wrote:
>>>> On 4/2/25 11:38, Benjamin Mugnier wrote:
>>>>> On 4/2/25 11:11, Krzysztof Kozlowski wrote:
>>>>>> On 02/04/2025 10:34, Benjamin Mugnier wrote:
>>>>>>> Hi Krzysztof,
>>>>>>>
>>>>>>> On 4/2/25 09:08, Krzysztof Kozlowski wrote:
>>>>>>>> On Tue, Apr 01, 2025 at 01:05:58PM +0200, Benjamin Mugnier wrote:
>>>>>>>>> +    properties:
>>>>>>>>> +      endpoint:
>>>>>>>>> +        $ref: /schemas/media/video-interfaces.yaml#
>>>>>>>>> +        unevaluatedProperties: false
>>>>>>>>> +
>>>>>>>>> +        properties:
>>>>>>>>> +          data-lanes:
>>>>>>>>> +            items:
>>>>>>>>> +              const: 1
>>>>>>>>
>>>>>>>> Not what I asked. Now you miss number of items. Just use the syntax I
>>>>>>>> proposed. Or was there any issue with it?
>>>>>>>
>>>>>>> No issue I just misunderstood and thought const: 1 was impliying
>>>>>>> maxItems: 1. I'll add maxItems back.
>>>>>>
>>>>>> That's just longer way to express what I asked for. So I repeat the
>>>>>> question: why not using the syntax I asked for?
>>>>>
>>>>> I guess I didn't understand what you asked for.
>>>>> May I ask you to write it ? That will help me a lot.
>>>>
>>>> By 'it' I mean the binding.
>>>
>>> I wrote it last time. I don't think that copying the same here would
>>> change anything. If I can look at v1, you can do as well.
>>
>> Reading your comment on v1, I would have come up with the exact same
>> result as Benjamin's v2. I can't figure out what alternative description
>> you meant.
> What do you mean by description? I pasted code. The *exact* code to use.
> Benjamin used different code. Two times I asked why you cannot use the
> code I pasted. Still no answer.

I'm sorry, thanks to the help over #linux-media we realized I missed the
'-' before const. I'm not very knowledgeable in device tree binding syntax.
I'll push a v4 with that.

> 
> Best regards,
> Krzysztof

-- 
Regards,
Benjamin

