Return-Path: <linux-media+bounces-26105-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 115B5A3389E
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2025 08:16:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96DD73A8242
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2025 07:16:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4467208974;
	Thu, 13 Feb 2025 07:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="YaOsXwBP"
X-Original-To: linux-media@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49742207DF6;
	Thu, 13 Feb 2025 07:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739430985; cv=none; b=Bq6EBD+78yVlvYBD/uC3sejCsP0qWs25LON3lgsAkVfRjBhw/21nX92AUxC7uAdW4Th48N0AhzyS7xsWItRNeuVAxg8RPsMKqgTvlYDrnKAQQRISfX+ekOi552o6GOgQknrZ+TkiidOz/fSQhp54PxrgbXVIHfAIHFH1w6ReVXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739430985; c=relaxed/simple;
	bh=4g0YcFvJiNDvP0Tbrjh+ugrWxi4e4FGW28ip5rElsbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=sBqaXD+0jD3P9BYgVFItKFNY8oqF3IdAf/dcSoresGfBcysQZaVAhdWaJufV/yjx6dy7+wdkOHcKE+3nW4CDLbjtajJznn/9//ZTUTDEVeJyKSTiQkzAfwaAKFehPYdB/Z/3tib/8LJNyxSyyzOqEBTAgd7eJP/57jtSDarty4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=YaOsXwBP; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51D7G9cG4066301
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Feb 2025 01:16:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739430969;
	bh=IV5E2TdCALodDslVQj3oINlqF/dh3l9yyuEjbKTChbk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=YaOsXwBP3zPvppL+8od7hbiAvRG9opSs9n122w4Jfi3Ly4bEq6yHaJV2s8L//le1U
	 6m/F7fx0/q0MPoeH3v50vP2K6HRKf2OchlQecNEj7Foa1qm3ANbeBPIwpt/lnBB9Rf
	 moC8yScih2s/vY2VDfm1I25iPIf3nhnAyQi+9zI8=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51D7G9fV129757
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 13 Feb 2025 01:16:09 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 13
 Feb 2025 01:16:08 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 13 Feb 2025 01:16:08 -0600
Received: from [172.24.227.115] (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51D7G4Tv103146;
	Thu, 13 Feb 2025 01:16:05 -0600
Message-ID: <94112ab7-5462-4a5b-90f3-636a7f8e5989@ti.com>
Date: Thu, 13 Feb 2025 12:46:03 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/3] dt-bindings: media: cdns,csi2rx.yaml: Add
 optional interrupts for cdns-csi2rx
To: Krzysztof Kozlowski <krzk@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <mripard@kernel.org>, <mchehab@kernel.org>, <jai.luthra@linux.dev>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devarsht@ti.com>, <vaishnav.a@ti.com>, <r-donadkar@ti.com>,
        <u-kumar1@ti.com>
References: <20250212131244.1397722-1-y-abhilashchandra@ti.com>
 <20250212131244.1397722-2-y-abhilashchandra@ti.com>
 <912dc0d1-6236-43cf-b423-54368eeed2e7@kernel.org>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <912dc0d1-6236-43cf-b423-54368eeed2e7@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 13/02/25 00:58, Krzysztof Kozlowski wrote:
> On 12/02/2025 14:12, Yemike Abhilash Chandra wrote:
>> The Cadence CSI2RX IP exposes 3 interrupts [0] 12.7 camera subsystem.
>> Enabling these interrupts will provide additional information about a CSI
>> packet or an individual frame. So, add support for optional interrupts
>> and interrupt-names properties.
>>
>> [0]: http://www.ti.com/lit/pdf/spruil1
> 
> 
> Why is this RFC?
>

I sent this as an RFC to gather input from different vendors using the 
cdns,csi2rx driver
and its device tree bindings. so I just wanted to get their feedback as 
well.
If there are no concerns from any of the them, I will proceed with 
sending this as v1.

>>
>> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
>> ---
>>   .../devicetree/bindings/media/cdns,csi2rx.yaml        | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml b/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
>> index 2008a47c0580..a3acf4f861c2 100644
>> --- a/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
>> +++ b/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
>> @@ -24,6 +24,17 @@ properties:
>>     reg:
>>       maxItems: 1
>>   
>> +  interrupts:
>> +    minItems: 1
>> +    maxItems: 3
> 
> I understand interrupts might be unused by driver, but are you sure they
> are optionally connected one-by-one? IOW, why is this flexible?
> 

I understand that this flexibility is not needed, and I will correct
that while sending v1.

Thanks and Regards,
Yemike Abhilash Chandra

> 
> Best regards,
> Krzysztof

