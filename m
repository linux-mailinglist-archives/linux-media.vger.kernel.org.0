Return-Path: <linux-media+bounces-26433-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A63A3D343
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 09:32:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB96E189D037
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 08:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 402851BD517;
	Thu, 20 Feb 2025 08:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ruTunRdq"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C1C1A9B4E;
	Thu, 20 Feb 2025 08:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740040331; cv=none; b=UEIpChST8j0iLxNikTAczbts+wTkmzj5qnewoFG3bXLp3y255EDVqB5q/o+3ZtPP+CdArMe+ABv2+B18nr2x3GJ9X1WwJZqlx525jG8x4z0z/ZHrDWmKhnpRQ3lFY1hsKYDmpX/1JEH5ovuH//uQll8IuYo/9dpXIIdJ053yzJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740040331; c=relaxed/simple;
	bh=L/LHvO/D+1uYypCe6Rsib5c/g0Q47UeKeXAtGNnGShI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NGfrBOs1kdeVwGsYnz9kADn43EAoZk3tnD1lwMpfG1JKJFlA/bgU8pu0ql2EmxNYw0VrV+MgGf5mDr8G//PCKUEzncxTEedZeZkxzLyY4MnTVVGXQfhZQgmQG5Oqya5sDUTPkiLtZEYd2NyX2rqe4JTCSEvIKmf41I5iYjugt/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ruTunRdq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26E27C4CED1;
	Thu, 20 Feb 2025 08:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740040331;
	bh=L/LHvO/D+1uYypCe6Rsib5c/g0Q47UeKeXAtGNnGShI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ruTunRdqISFlJSKFdw9+vOac+S+5tS5GWrwnWl7LsjQYMcubKQIa7vD3T0o9o9kcU
	 oB8wCEGjke+49Cp9avK9UDFUfr/WNeYTI/CIKxNf3KTDVUX0wU5mt/yGusHDJ3snlV
	 QWoUK/G9QFAx6GEJrJFTmH/TX67kkY6wsjLfjMjzueS6njyfB1EhPnVOK9sktTloDp
	 dkVf+L5UCKUTovw05NVgogA8bRpkOrn4wQ5HhwqBhPaV3LQvCAftv8RVGExVmVBttu
	 X2jpLlkMcnwy83hTRXa0vQ236vyrCegUnGYXCkoE7XgwMx3/2Y0KJiX4Xon9xEB7cC
	 NNkRDC8rqNkHA==
Message-ID: <e3403885-ca21-4e67-b117-f40a7a65418b@kernel.org>
Date: Thu, 20 Feb 2025 09:32:05 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] dt-bindings: media: nxp: Add Wave6 video codec device
To: Nas Chung <nas.chung@chipsnmedia.com>
Cc: "mchehab@kernel.org" <mchehab@kernel.org>,
 "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
 "sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "jackson.lee" <jackson.lee@chipsnmedia.com>,
 "lafley.kim" <lafley.kim@chipsnmedia.com>
References: <20250210090725.4580-1-nas.chung@chipsnmedia.com>
 <20250210090725.4580-4-nas.chung@chipsnmedia.com>
 <cb7937f5-2045-4903-825c-71ed70097efb@kernel.org>
 <SL2P216MB12460EDF6265459D11E2A5A9FBFF2@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
 <20250213-imaginary-shrimp-of-merriment-6ccb6f@krzk-bin>
 <SE1P216MB1242EBEEAA36BE73AD466FB6FBFA2@SE1P216MB1242.KORP216.PROD.OUTLOOK.COM>
 <ec58d467-baa3-4630-bfb0-f09d366a9be9@kernel.org>
 <SL2P216MB1246F270DDE8CC8E21EA1DDCFBC42@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <SL2P216MB1246F270DDE8CC8E21EA1DDCFBC42@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/02/2025 08:35, Nas Chung wrote:
> Hi, Krzysztof.
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzk@kernel.org>
>> Sent: Wednesday, February 19, 2025 9:32 PM
>> To: Nas Chung <nas.chung@chipsnmedia.com>
>> Cc: mchehab@kernel.org; hverkuil@xs4all.nl; sebastian.fricke@collabora.com;
>> robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org; linux-
>> media@vger.kernel.org; devicetree@vger.kernel.org; linux-
>> kernel@vger.kernel.org; linux-imx@nxp.com; linux-arm-
>> kernel@lists.infradead.org; jackson.lee <jackson.lee@chipsnmedia.com>;
>> lafley.kim <lafley.kim@chipsnmedia.com>
>> Subject: Re: [PATCH 3/8] dt-bindings: media: nxp: Add Wave6 video codec
>> device
>>
>> On 18/02/2025 10:21, Nas Chung wrote:
>>> For example:
>>> vpu: video-codec@4c480000 {
>>>         compatible = "nxp,imx95-vpu";
>>>         reg = <0x0 0x4c480000 0x0 0x50000>;
>>> 	ranges = <0x0 0x0 0x4c480000 0x50000>;
>>>
>>>         vpuctrl: vpu-ctrl@40000 {
>>>           compatible = "nxp,imx95-vpu-ctrl";
>>> 	  reg = <0x40000 0x10000>;
>>>         };
>>>
>>>         vpucore0: vpu-core@00000 {
>>>           compatible = "nxp,imx95-vpu-core";
>>>           reg = <0x00000 0x10000>;
>>>         };
>>>
>>>         vpucore1: vpu-core@10000 {
>>>           compatible = "nxp,imx95-vpu-core";
>>>           reg = <0x10000 0x10000>;
>>>         };
>>>
>>>         vpucore2: vpu-core@20000 {
>>>           compatible = "nxp,imx95-vpu-core";
>>>           reg = <0x20000 0x10000>;
>>>         };
>>>
>>>         vpucore3: vpu-core@30000 {
>>>           compatible = "nxp,imx95-vpu-core";
>>
>> Why do you need compatible here? Could it be anything else?
> 
> I will update the driver based on the final DT.
> 
>>
>>>           reg = <0x30000 0x10000>;
>>
>> Where is the rest of resources? You created children only for one
>> resource - address space?
> 
> Sorry for the confusion.
> I believe the final example looks like the one below.
> 
> vpu: video-codec@4c480000 {
>         compatible = "nxp,imx95-vpu";
>         reg = <0x0 0x4c480000 0x0 0x50000>;
>         ranges = <0x0 0x0 0x4c480000 0x50000>;
> 
>         vpuctrl: vpu-ctrl@40000 {
>           compatible = "nxp,imx95-vpu-ctrl";
>           reg = <0x40000 0x10000>;
>           clocks = <&scmi_clk 115>,
>                   <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;
>           clock-names = "vpu", "vpublk_wave";
>           power-domains = <&scmi_devpd 21>, <&scmi_perf 10>;
>           power-domain-names = "vpumix", "vpuperf";
>           memory-region = <&vpu_boot>;
>           #cooling-cells = <2>;
>           sram = <&sram1>;
>         };
> 
>         vpucore0: vpu-core@00000 {
>           compatible = "nxp,imx95-vpu-core";
>           reg = <0x00000 0x10000>;
>           interrupts = <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
>           clocks = <&scmi_clk 115>,
>                   <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;


These are the same resources for every block so for entire device. Why
they are no in top level node?

>           clock-names = "vpu", "vpublk_wave";
>           power-domains = <&scmi_devpd 21>;

Same here

Everything else also looks duplicated... All my previous comments - from
first email - stand. Don't design DT to match your Linu driver structure.

Best regards,
Krzysztof

