Return-Path: <linux-media+bounces-26536-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D747A3EC07
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 06:02:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F41903B55BE
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 05:02:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F9741FBC9F;
	Fri, 21 Feb 2025 05:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="cDxxyE1H"
X-Original-To: linux-media@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF158F6E;
	Fri, 21 Feb 2025 05:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740114141; cv=none; b=FpyqqqQ0JcnXw9WsTfNRGY+07nY2rgfYEmAj1LDNBZOMNqAIvpb81gaWA8Rjff0avYJxS+M1Cgog99Vf/ccsPu+YfjmPwzlp6NhovBQoKHbHB9Yklj3JP6vREf3CkZKaGepTmTUHK1ApLfA7R2ffj3J1JMSSRpv9s/lbbqdzLZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740114141; c=relaxed/simple;
	bh=c0i9YKcxMAZSczsGbyv7PfTF7dO7v+vR2vxrFUcpWcI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=laNLAEOMm+DtlVAhPcR+hz/CBC82XA0lmzvE1FaTeHztcON8qcIFVQgJw+o7IfWIb3fDr/0I3IOCARRY4z2qlsOAqqTEjywuzBbyEB/ijD88V+EKWkqg4iK4mPR6kwegbPExG6M52sWP8jAOBWj+iL0jVmu+BF2tODl2iRtgB7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=cDxxyE1H; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51L51v4M213326
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Feb 2025 23:01:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740114117;
	bh=MkLdPAobDI226xV6MrDXZ/BCT77j0+a518w5n2XSOTE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=cDxxyE1HRPjxMhq3S6vKJ2ld3V9almRBCT1eusBDwdsWh2dXupZp4zvgBeGEsJp5M
	 0Fm5f+8kcbN0nMGwiLDfTERIQXGzNLmVMfz+bdNxRBB0tTKy2Z/2xAMpTUzuA8t0vq
	 Vl/6q8opOSOeKpkM3phBHJUl/Gje40A6/+cC8Cd4=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51L51vcS013703
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 20 Feb 2025 23:01:57 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Feb 2025 23:01:57 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Feb 2025 23:01:57 -0600
Received: from [172.24.227.115] (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51L51qaw092694;
	Thu, 20 Feb 2025 23:01:53 -0600
Message-ID: <998346fc-9228-49c3-bac7-9a701a0cc5e6@ti.com>
Date: Fri, 21 Feb 2025 10:31:51 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOWbnuWkjTogW1BBVENIIHYyIDEvMl0gZHQtYmluZGluZ3M6IG1l?=
 =?UTF-8?Q?dia=3A_cdns=2Ccsi2rx=2Eyaml=3A_Add_optional_interrupts_for_cdns-c?=
 =?UTF-8?Q?si2rx?=
To: Jai Luthra <jai.luthra@linux.dev>,
        Changhuang Liang
	<changhuang.liang@starfivetech.com>
CC: "mripard@kernel.org" <mripard@kernel.org>,
        "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "devarsht@ti.com" <devarsht@ti.com>,
        "vaishnav.a@ti.com" <vaishnav.a@ti.com>,
        "r-donadkar@ti.com" <r-donadkar@ti.com>,
        "u-kumar1@ti.com" <u-kumar1@ti.com>
References: <20250217130013.2802293-1-y-abhilashchandra@ti.com>
 <20250217130013.2802293-2-y-abhilashchandra@ti.com>
 <m6ijg5colbev6lyhiobblecb4wlvwezpccibnso26gd3dadrfh@twgul4eel6hg>
 <ZQ0PR01MB13022FE965643879D8794733F2FAA@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
 <swqtud4ohcsjjt4ofgrovsa5h7koriuvpmxb3hdemnndwems2a@nwiny4dvuzwg>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <swqtud4ohcsjjt4ofgrovsa5h7koriuvpmxb3hdemnndwems2a@nwiny4dvuzwg>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Jai,Changhuang,

Thanks for the reviews.

On 18/02/25 21:07, Jai Luthra wrote:
> On Tue, Feb 18, 2025 at 09:35:50AM +0000, Changhuang Liang wrote:
>> Hi Jai, Abhilash
>>
>>> Hi Abhilash,
>>>
>>> On Mon, Feb 17, 2025 at 06:30:12PM +0530, Yemike Abhilash Chandra wrote:
>>>> The Cadence CSI2RX IP exposes 3 interrupts [0] 12.7 camera subsystem.
>>>> Enabling these interrupts will provide additional information about a
>>>> CSI packet or an individual frame. So, add support for optional
>>>> interrupts and interrupt-names properties.
>>>>
>>>> [0]: http://www.ti.com/lit/pdf/spruil1
>>>>
>>>> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
>>>> ---
>>>>
>>>> Changes in v2:
>>>> - Address Krzysztof's review comment to remove flexibility while adding
>>>>    interrupts.
>>>>
>>>>   .../devicetree/bindings/media/cdns,csi2rx.yaml         | 10
>>> ++++++++++
>>>>   1 file changed, 10 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
>>>> b/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
>>>> index 2008a47c0580..f335429cbde9 100644
>>>> --- a/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
>>>> +++ b/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
>>>> @@ -24,6 +24,16 @@ properties:
>>>>     reg:
>>>>       maxItems: 1
>>>>
>>>> +  interrupts:
>>>> +    minItems: 3
>>>> +    maxItems: 3
>>>> +
>>>> +  interrupt-names:
>>>> +    items:
>>>> +      - const: info
>>>> +      - const: error
>>>> +      - const: monitor
>>>> +
>>>
>>> How many interrupt lines are actually exposed by the Cadence IP?
>>
>> I only see that the Cadence IP exposes two interrupt lines: irq and err_irq. If there are any mistakes,
>> please help correct them.
>>
> 
> Thank you Changhuang for the quick confirmation.
> This seems to match CSI_ERR_IRQ and CSI_IRQ in TI's integration.
> 
>>> It is not clear to me from the TRM [0]. From the "Table 12-1524. CSI_RX_IF
>>> Hardware Requests" it looks like there are three separate interrupt lines
>>> CSI_ERR_IRQ, CSI_IRQ and CSI_LEVEL, which are routed to the Arm core/GIC.
>>> And four lines for the ASF submodule (?) that are not routed to GIC.
>>>
> 
> Abhilash,
> 
> What is unclear to me is where the third CSI_LEVEL interrupt line is coming
> from?
> 
> The TRM description of the CSI_LEVEL interrupt says it is for PSI_L overflow
> or VP0/VP1 frame/line mismatch, both of which are outside the Cadence CSI2RX,
> instead belonging to the TI wrapper hardware, which has its own driver.

Yes, we will update the device tree bindings accordingly. We are 
planning to handle the TI-specific interrupt line separately in another 
series.

> 
>>> This does not match with the error, info and monitor line names mentioned
>>> here.
>>>
>>> In my understanding which interrupt lines are actually integrated will vary
>>> from SoC to SoC, so please check what are the actual interrupt line names
>>> exposed by the Cadence IP. Maybe Maxime knows more.
>>>
>>> But I don't think it is correct to make all 3 mandatory together, as some
>>> vendors may only integrate the error interrupt ignoring the rest.
>>
>> Agreed.
>>
> 
> I think by default there should only be two optional interrupt lines for
> cdns-csi2rx, "irq" and "err_irq" which is common across vendors.
> 
> If this third TI-specific CSI_LEVEL interrupt *has* to be handled by
> cdns-csi2rx driver, it would be better to create conditional bindings and
> match data in the driver such that the irq is only requested if
> "ti,j721e-csi2rx" compatible is present.

I will correct this in v3 by introducing bindings that allow vendors
the flexibility to use either two or three interrupt lines.

Thanks and Regards,
Yemike Abhilash Chandra

> 
>> Best Regards,
>> Changhuang
> 
> Thanks,
> Jai

