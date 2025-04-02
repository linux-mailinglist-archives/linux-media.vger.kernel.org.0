Return-Path: <linux-media+bounces-29202-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CD79AA78A1F
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 10:38:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7D0B188C0F2
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 08:38:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17AFA235375;
	Wed,  2 Apr 2025 08:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="OIfpcDOc"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B156D16BE17;
	Wed,  2 Apr 2025 08:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743583076; cv=none; b=iEcvcG/4F14sfpuDqqrzLmJyU+hAzw2tsUHzCY4CMkZr58+azovQmPmyVAkYr4wV4U+YztB83t8leSU/pJcw8/rdFI9xDY7Wgl5Ok6hBzGKgcFQZ8/5IGeYv138ta8bVSfjOIfQVJVH4+PusgTQ8itoWkPtXf0dlbvX/Ckad2g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743583076; c=relaxed/simple;
	bh=yDctradIe4zqjP7A5QDrgdagjOau/z8asowkNepwXeg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=osx+nOZxH7LBVG7hY2eAYhi+L2pMpyRduSKVpGLkxHvqOkV4B83cRLocqFZzwhHt8qEme+5SQUsx6SdND9/FQoX8JSUVfe+jJgVA1ZjbCt2b0hsL4IxGTfiPk9YcPh0FuwRLpH/hlXQx1uCf/+061V8Xz5zL27G4CheQQ/SfQ9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=OIfpcDOc; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5324cptZ010077;
	Wed, 2 Apr 2025 10:37:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	NNHR3YjaW7zDVlyL4yp5QsCMZPduZJ4h+U4jaf/4lpg=; b=OIfpcDOcTSHDMimh
	Zes0ZcWs3/1a6rGoDkERxK/D1fYA/v0OZsGPkGcGK3b1jOCSvP9W4i0ai2XstgjS
	Htn8uT5ejA3reYIlREUxibRmf5H9Q+QV3tlUQonbWC/6DXVj90+rA6rRYrbnxW1n
	3ivh49oOw+oQTguVHjYH8t3R++0Vusq/N5hxFXmYBE9VHUSPPk/p3yI7C2riknPK
	Cidr9WRqR5L3jdXEEaTFVtC6sEVvpolb+DVPpML2pFY/wLKs3jFlrGQYL3T7pajM
	HnIklS7rHkktuzac1kpS6OxlfMB2H5ScasVvXcg//gM4qKIPb/IOcmI+cr8aNTxO
	bzUgbg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45pua7y8by-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Apr 2025 10:37:40 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2EE384004A;
	Wed,  2 Apr 2025 10:36:28 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 986D98CEC80;
	Wed,  2 Apr 2025 10:34:18 +0200 (CEST)
Received: from [10.252.30.87] (10.252.30.87) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Apr
 2025 10:34:17 +0200
Message-ID: <228ddf41-e1d0-4d06-9e0e-9e0dad841688@foss.st.com>
Date: Wed, 2 Apr 2025 10:34:16 +0200
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
Content-Language: en-US
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <20250402-curvy-seriema-of-blizzard-b1c4d9@krzk-bin>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_03,2025-04-01_01,2024-11-22_01

Hi Krzysztof,

On 4/2/25 09:08, Krzysztof Kozlowski wrote:
> On Tue, Apr 01, 2025 at 01:05:58PM +0200, Benjamin Mugnier wrote:
>> +    properties:
>> +      endpoint:
>> +        $ref: /schemas/media/video-interfaces.yaml#
>> +        unevaluatedProperties: false
>> +
>> +        properties:
>> +          data-lanes:
>> +            items:
>> +              const: 1
> 
> Not what I asked. Now you miss number of items. Just use the syntax I
> proposed. Or was there any issue with it?

No issue I just misunderstood and thought const: 1 was impliying
maxItems: 1. I'll add maxItems back.

> 
>> +
>> +          link-frequencies:
>> +            maxItems: 1
>> +            items:
>> +              minimum: 125000000
>> +              maximum: 600000000
> 
> Best regards,
> Krzysztof
> 

-- 
Regards,
Benjamin

