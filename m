Return-Path: <linux-media+bounces-29212-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE469A78B46
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 11:40:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D62116EDB6
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 09:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBE36236426;
	Wed,  2 Apr 2025 09:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="QuBfI1hB"
X-Original-To: linux-media@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FF42356BE;
	Wed,  2 Apr 2025 09:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743586827; cv=none; b=FFKB/ZTIGoGVvUCNgx4AtgbHb/chT8i/j/bR+xJ107kBfj0lta01g1vBeGcjfjswE7hSakWvzdu1qi3/mlZJk2ShKoGZ7AG753FWnP0K3yIQsukBk907qn2ISKHgbsA2vSfF/VWEO7y5aMDBBjlK3E5G+9yWunV6lyCXGjmYbc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743586827; c=relaxed/simple;
	bh=DjrMlEk0NWBojiuwg0BSTZ8eio5kC51l3XiOG/v3D38=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LfT3JEe0coXJgwRe9IfHq4ZsdStusypg71tYuaDbbzPWX/Ji28mlHlqE6fdJ8vJTK0xK68d+oo9noBx+4eAYNmEQlJwjRIL02Y4HD7pjGkuyo/qyslXWtrbOTDObU7C+kdk/PChDLCU+rpoPMB4qSV4EphRyDSYeYTWB8y4NCtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=QuBfI1hB; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53299wvc024169;
	Wed, 2 Apr 2025 11:40:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	L5755YSGx4fXv+HeBYR+jRn7wQr+9kPgl7qTQ6N5t1Q=; b=QuBfI1hBQ5aCplZA
	n9KBNaSTrmIg05Sm1OSbvvqMUknizo1E8hmMLwgcN5uZh8OitLhEoF3DPYA+AAnm
	EDSOiuLK0hphKV6l+ie2r8r6bRey9y0zhOGSpWATRNqr1Pdk5r/OjOznkaVkadso
	qt+hl7x+aGqOQF9kvFQqZzl/5GBTWscC2AMGT2PZgieol1EsojmNjsu4rPHbiVpJ
	pK6GGP3Vh3zHttbWl5ed+z3yJSs1/guvGyBHa1vrgzvLLIkrgNVgA3wYx5OpnvqR
	OSGBF4B+fj5nxLKJWygzl8r2BX5Ti8dzF7DQzRVA/ta68+DXeBRyfiunFOWXQe+z
	KyBvzg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45s2c785ba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Apr 2025 11:40:12 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4A14340045;
	Wed,  2 Apr 2025 11:39:26 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 23F908903D6;
	Wed,  2 Apr 2025 11:38:28 +0200 (CEST)
Received: from [10.252.30.87] (10.252.30.87) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Apr
 2025 11:38:27 +0200
Message-ID: <a0c62797-3c4c-453c-938b-d43666f3b264@foss.st.com>
Date: Wed, 2 Apr 2025 11:38:26 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] media: dt-bindings: Add ST VD55G1 camera sensor
 binding
To: Krzysztof Kozlowski <krzk@kernel.org>
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
Content-Language: en-US
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <fd874f4d-d68c-4443-8bb6-115246f4407b@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_03,2025-04-01_01,2024-11-22_01

On 4/2/25 11:11, Krzysztof Kozlowski wrote:
> On 02/04/2025 10:34, Benjamin Mugnier wrote:
>> Hi Krzysztof,
>>
>> On 4/2/25 09:08, Krzysztof Kozlowski wrote:
>>> On Tue, Apr 01, 2025 at 01:05:58PM +0200, Benjamin Mugnier wrote:
>>>> +    properties:
>>>> +      endpoint:
>>>> +        $ref: /schemas/media/video-interfaces.yaml#
>>>> +        unevaluatedProperties: false
>>>> +
>>>> +        properties:
>>>> +          data-lanes:
>>>> +            items:
>>>> +              const: 1
>>>
>>> Not what I asked. Now you miss number of items. Just use the syntax I
>>> proposed. Or was there any issue with it?
>>
>> No issue I just misunderstood and thought const: 1 was impliying
>> maxItems: 1. I'll add maxItems back.
> 
> That's just longer way to express what I asked for. So I repeat the
> question: why not using the syntax I asked for?

I guess I didn't understand what you asked for.
May I ask you to write it ? That will help me a lot.

> 
> Best regards,
> Krzysztof

-- 
Regards,
Benjamin

