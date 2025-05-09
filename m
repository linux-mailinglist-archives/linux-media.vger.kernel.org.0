Return-Path: <linux-media+bounces-32121-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CF7AB100A
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 12:12:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 42E857B78C8
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 10:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 770C528EA73;
	Fri,  9 May 2025 10:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OUPmnkkT"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89DB28E5F6;
	Fri,  9 May 2025 10:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746785515; cv=none; b=n6GQXExkOxDaSwogLKaJS8Qbp97AS6+H8/ftaX3HBxULh0YOGULNzapMFlcRuhOuDguAK63qIdQ1CRfvfAWPulcbMsYLMur/bubRwPIR4GTYTXeS3FyBCR/RXJB+mdFQ86CwGqX/LLZokCfHQNCE40aTwfdKTF45QPwR37kYiBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746785515; c=relaxed/simple;
	bh=RyRbJoQqShXjHqdPZDfdYWdVxMf5IuqJKffN44Ywzp4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZRQvDjAxPuu6Cp7+TzzwFxy9sFA17pdMVqZX0/fflhgHO5cXQNjOTRpKm56Gc68vFN6cM6Kshs4QGva4V2woqTvyhjPv/qcUMm9Zepn4v60/EhuuEqE2UGFPWenBg/cPm4wQDHTf/npAhVpbMcKM2+mRZ9/xvqIF9bhC6OJSAPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OUPmnkkT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E247AC4CEE4;
	Fri,  9 May 2025 10:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746785514;
	bh=RyRbJoQqShXjHqdPZDfdYWdVxMf5IuqJKffN44Ywzp4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OUPmnkkTtYGDwDaLKEkXkpO1Y7+sXdtrNHxrGy9xkwvNkFjrqJy8O11cnT+q1ES3o
	 4Y1/3eW29+MFL5dZacp7iSvT/sAHHYFa2O/8FClCvO3gF8LM/Slm/C0truwK5mZByv
	 GI183gv5r+thHGwQfRprn23csSaD/Cfo7NdfqVEooqPrHj7z806vQMcU9BjnvbbI/B
	 Z3dxvFSr4XpZ+SHSe3Cq5UYwkg6XnozVQcCB+5nHf3hy2Rz3P3GDm7WUa/LfrbBzXx
	 QYAMw3jdv1cSZF1CAET6oC9RLDtA1B18la8BiqbrOlUHO4gBFZz8UFGfi9iiZ1kxys
	 cPMWE3hSxNphA==
Message-ID: <f1073f21-0885-486f-80c8-00f91dfd7448@kernel.org>
Date: Fri, 9 May 2025 12:11:48 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] dt-bindings: media: nxp: Add Wave6 video codec
 device
To: Nas Chung <nas.chung@chipsnmedia.com>
Cc: "mchehab@kernel.org" <mchehab@kernel.org>,
 "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
 "sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>, "marex@denx.de" <marex@denx.de>,
 "jackson.lee" <jackson.lee@chipsnmedia.com>,
 "lafley.kim" <lafley.kim@chipsnmedia.com>
References: <20250422093119.595-1-nas.chung@chipsnmedia.com>
 <20250422093119.595-3-nas.chung@chipsnmedia.com>
 <20250425-romantic-truthful-dove-3ef949@kuoka>
 <SL2P216MB124656A87931B153F815820BFB8AA@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <SL2P216MB124656A87931B153F815820BFB8AA@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/05/2025 11:59, Nas Chung wrote:
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>> +    #include <dt-bindings/clock/nxp,imx95-clock.h>
>>> +
>>> +    soc {
>>> +      #address-cells = <2>;
>>> +      #size-cells = <2>;
>>> +
>>> +      vpu: video-codec {
>>
>> Why this device does not have MMIO? Sorry, but makes little sense and if
>> you posted and tested your entire DTS you would see why.
> 
> I initially thought that if the reg property is declared in the child,
> it would not need to be declared in the parent node.
> I based this approach on the mediatek,mt8195-jpegenc.yaml binding,
> where the parent node does not include MMIO.

Do you have access to mt8195 datasheet? What is the memory/register
layout there?

If you do not have access, why do you think these are similar devices?

> 
> But, if this structure is problematic, I will address it in patch v3.
> 
>>
>> Can we see the entire DTS?
> 
> Sure !
> Below is the cnm.wave633c.example.dts file created from dt_binding_check.

This is not the entire DTS.

> 
> /dts-v1/;
> /plugin/; // silence any missing phandle references

This is bindings example. I want to see entire DTS or DTSI of the SoC.
Once you see entire DTS, you will notice that your current split is just
not correct - it should be pretty obvious.

And that's why we should keep rejecting such works which do not bring
any DTS user, because the no one - neither we nor the contributors - see
big picture and if someone saw the big picture then immediately would
notice - it's just bollocks.

What you claim is:

soc@0 {
  // MMIO bus

  video-codec {
    // which is a non-MMIO device and clearly a no-go.

Just look how DTS is organized and learn from it.

> 
> /{
>     compatible = "foo";
>     model = "foo";
>     #address-cells = <1>;
>     #size-cells = <1>;
> 
> 
>     example-0 {
>         #address-cells = <1>;
>         #size-cells = <1>;
> 
>         
>         interrupt-parent = <&fake_intc0>;
>         fake_intc0: fake-interrupt-controller {
>             interrupt-controller;
>             #interrupt-cells = < 3 >;
>         };
> 

All of above are wrong for the SoC...

> 
>         #include <dt-bindings/interrupt-controller/arm-gic.h>
>         #include <dt-bindings/clock/nxp,imx95-clock.h>
>         
>         soc {
>           #address-cells = <2>;
>           #size-cells = <2>;
>         
>           vpu: video-codec {
>             compatible = "nxp,imx95-vpu", "cnm,wave633c";

What does this device represent? It is not "ctrl", because you made ctrl
separate device node. Your binding description suggests that is the VPU
control region.

>             clocks = <&scmi_clk 115>,
>                      <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;

For which sub devices these clocks are valid? For all of them?

>             clock-names = "vpu", "vpublk_wave";
>             power-domains = <&scmi_devpd 21>;
>             #address-cells = <2>;
>             #size-cells = <2>;
>             ranges;
>         
>             vpucore0: video-core@4c480000 {
>               compatible = "nxp,imx95-vpu-core";
>               reg = <0x0 0x4c480000 0x0 0x10000>;
>               interrupts = <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
>             };
>         
>             vpucore1: video-core@4c490000 {
>               compatible = "nxp,imx95-vpu-core";
>               reg = <0x0 0x4c490000 0x0 0x10000>;
>               interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
>             };
>         
>             vpucore2: video-core@4c4a0000 {
>               compatible = "nxp,imx95-vpu-core";
>               reg = <0x0 0x4c4a0000 0x0 0x10000>;
>               interrupts = <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>;
>             };
>         
>             vpucore3: video-core@4c4b0000 {
>               compatible = "nxp,imx95-vpu-core";
>               reg = <0x0 0x4c4b0000 0x0 0x10000>;
>               interrupts = <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>;
>             };
>         
>             vpuctrl: video-controller@4c4c0000 {
>               compatible = "nxp,imx95-vpu-ctrl";
>               reg = <0x0 0x4c4c0000 0x0 0x10000>;
>               memory-region = <&vpu_boot>;
>               power-domains = <&scmi_perf 10>;
>               #cooling-cells = <2>;
>               sram = <&sram1>;
>             };
>           };
>         };
> 
>     };
> };
> 
>>
>> Best regards,
>> Krzysztof
> 


Best regards,
Krzysztof

