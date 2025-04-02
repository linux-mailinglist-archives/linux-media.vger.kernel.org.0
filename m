Return-Path: <linux-media+bounces-29213-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 40033A78B73
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 11:43:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 66DA07A4F5D
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 09:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02BC4236A66;
	Wed,  2 Apr 2025 09:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="oPD1odEV"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81F7235BF0;
	Wed,  2 Apr 2025 09:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743586983; cv=none; b=Duw3LpzIozV1u6uljuVKJXGNFEvHXI8x1EgfcQjGS7GRWMnYMFyPiH6G0upo27VbsbA57CX7TdPzZRLzdPxgjF08jyVH9pqEQZi5T8iUnpdLV9BVyEbGSrfs1pAkckykzOCSXZdvzB7Mqt+jqcMuODasMKeG5MbXV2fNLbM3CdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743586983; c=relaxed/simple;
	bh=aNG+jrxFlonmhDgmPxRzvRwJIMZz5s0z+WZcxhuZUwI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=BGAGYprnJwH9xUOpva5Hjwa2T0IeQqF05iEiGBwrTFqR5rp4bn9SpR6A8UpW7NksiJ16UuKQ880k3yynSkqkBwDnOUDIvuIPF39c07faXajT855JkGI4JDr+4qlHIjicEZSSY+z/o8mNsDg+K/lVU7/HS4+vSDn1Wafbb0UUZEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=oPD1odEV; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5328CrcH010752;
	Wed, 2 Apr 2025 11:42:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	3rNfCsM7ceeWvKyul5GHwiFF6qapfQZjGVJxNuVdVbU=; b=oPD1odEVldP1owBg
	cMUQui198Zm+92F5iaH64PgvtuPXe+AGG5tP9HNHjWt1K4PQq3W4wC7g5FdnxyQp
	3nU69ijGGDYMTBArUa4v+kyknZxqgpvvUZFWIZOIWX+fiJqh4xbqDZK1l2jsdUK2
	TdJ+G2iF1n5s36vCw8Hbcw6bKbmbWT7F7df0wv6iXQCJQjR+guuallMPX/Vfuulm
	lK8yGd/kj0URjM22qPo2waPRQRwV1xBQAlqN0dXlRBYt0GMddcRVP/9MaP4Sb1fM
	+ID+Il4EFD7glnViz4KnDgBwRR8r7608vh78zLwRORHRClkxeGIucJccFvaSTGmu
	Wd2dZQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45p75qadm7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Apr 2025 11:42:53 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 79EAF4004C;
	Wed,  2 Apr 2025 11:42:02 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2612D8A1420;
	Wed,  2 Apr 2025 11:41:27 +0200 (CEST)
Received: from [10.252.30.87] (10.252.30.87) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Apr
 2025 11:41:26 +0200
Message-ID: <7d501bf2-a017-4c02-a96f-184a7d648b6a@foss.st.com>
Date: Wed, 2 Apr 2025 11:41:25 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] media: dt-bindings: Add ST VD55G1 camera sensor
 binding
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
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
 <a0c62797-3c4c-453c-938b-d43666f3b264@foss.st.com>
Content-Language: en-US
In-Reply-To: <a0c62797-3c4c-453c-938b-d43666f3b264@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_03,2025-04-01_01,2024-11-22_01



On 4/2/25 11:38, Benjamin Mugnier wrote:
> On 4/2/25 11:11, Krzysztof Kozlowski wrote:
>> On 02/04/2025 10:34, Benjamin Mugnier wrote:
>>> Hi Krzysztof,
>>>
>>> On 4/2/25 09:08, Krzysztof Kozlowski wrote:
>>>> On Tue, Apr 01, 2025 at 01:05:58PM +0200, Benjamin Mugnier wrote:
>>>>> +    properties:
>>>>> +      endpoint:
>>>>> +        $ref: /schemas/media/video-interfaces.yaml#
>>>>> +        unevaluatedProperties: false
>>>>> +
>>>>> +        properties:
>>>>> +          data-lanes:
>>>>> +            items:
>>>>> +              const: 1
>>>>
>>>> Not what I asked. Now you miss number of items. Just use the syntax I
>>>> proposed. Or was there any issue with it?
>>>
>>> No issue I just misunderstood and thought const: 1 was impliying
>>> maxItems: 1. I'll add maxItems back.
>>
>> That's just longer way to express what I asked for. So I repeat the
>> question: why not using the syntax I asked for?
> 
> I guess I didn't understand what you asked for.
> May I ask you to write it ? That will help me a lot.

By 'it' I mean the binding.

> 
>>
>> Best regards,
>> Krzysztof
> 

-- 
Regards,
Benjamin

