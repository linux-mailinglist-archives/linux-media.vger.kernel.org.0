Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E9A11AC4AD
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2020 16:03:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2506793AbgDPOCv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Apr 2020 10:02:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2503979AbgDPOCo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Apr 2020 10:02:44 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9EAFC061A0C;
        Thu, 16 Apr 2020 07:02:43 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id c195so2617105wme.1;
        Thu, 16 Apr 2020 07:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NHqfdeNveULnM7vQAbJglacV+XZ4nJdoryqrPGPSWH0=;
        b=joAdCPp1vLkSbqtIwf3+wLlZtkPXrnifqtZ7/pDNKHE5OT01834YQYcWRvCorRphmA
         310gNbj+A8S3oahU7wcGkJiCOoBzmwTlZTl7uT+gehWEXbQHl3HJ/QnWzYMrKU1qjg3e
         zxGQD6Lc4IdSrNdSiAyKW4NKk3A/glK+jt3xv5gClHrFMfhDrmGOYSOzEmzxki3SWVpA
         MubOA85JiEnSOZBdfdWDSsudvebrjpXqzDY0fSvczrFXBRH6Y5aM5kZyO9zURhRH408N
         W7ZkmLOTf5gcVncU6pvW7GEFIETnpmo2r/utHGnjS4flkxmwX4hruSPYDXbuRADMQua5
         UTgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NHqfdeNveULnM7vQAbJglacV+XZ4nJdoryqrPGPSWH0=;
        b=ERMelN433tbcElDIGgZNXQXnsQkrmmgMh3CGNvwElOrnPApg6mOZthba3jJm5AV6wW
         aQzIvh1+kRlBHqdmU/azFrV8JBYRjjuMCFixxkJ6R/2HqlKOdclH+XuoSo3JNjvdwPek
         y5bYAYCSs5Oi7bjTxJyk/822zoBg/LkkINbwwS5Uh+LohRHkaBLLN8GNar/14DM1vqCQ
         mYjOMDDqhm5zzlOyk/dd3NO00QZsIc2LEg2VOeBINT9zC+lrIml8i4vcRHEwT98cDQqY
         BFqQCrnFS6o0dUv3sKw7a0g7aMvDv8FGVN8L8Oki+1EDbOJBOa9zcf1AAI97PHjzZ1PJ
         O4ng==
X-Gm-Message-State: AGi0PuaYTrDKu3E3JwgRioCl3s/7GQHzvphsFZeQHju9C1FnkUwFYzgV
        NXktowfjlayNapFb46sNdvI=
X-Google-Smtp-Source: APiQypJV2H42TwzOHO9PsPVCAA/RA8bXt0qbCwFdMXRNN2D2+xQOY5NEhSB4Y23QQTB8V/rxI3S6Yg==
X-Received: by 2002:a05:600c:2194:: with SMTP id e20mr5049382wme.22.1587045761652;
        Thu, 16 Apr 2020 07:02:41 -0700 (PDT)
Received: from [192.168.2.1] (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id p10sm26933094wrm.6.2020.04.16.07.02.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2020 07:02:40 -0700 (PDT)
Subject: Re: [PATCH 2/4] arm64: dts: rockchip: Add RGA support to the PX30
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Jacob Chen <jacob-chen@iotwrt.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hansverk@cisco.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20200416115047.233720-1-paul.kocialkowski@bootlin.com>
 <20200416115047.233720-3-paul.kocialkowski@bootlin.com>
 <478f0a8b-f819-62f4-83b8-27918c4c2431@gmail.com>
 <20200416132442.GI125838@aptenodytes>
 <f4ad8ea4-7904-1458-e564-2d20c87ed417@gmail.com>
 <20200416135519.GJ125838@aptenodytes>
From:   Johan Jonker <jbx6244@gmail.com>
Message-ID: <f97d7661-834d-3fbf-2cd9-0b37c487e8f7@gmail.com>
Date:   Thu, 16 Apr 2020 16:02:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200416135519.GJ125838@aptenodytes>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 4/16/20 3:55 PM, Paul Kocialkowski wrote:
> Hi,
> 
> On Thu 16 Apr 20, 15:44, Johan Jonker wrote:
>> On 4/16/20 3:24 PM, Paul Kocialkowski wrote:
>>> Hi,
>>>
>>> On Thu 16 Apr 20, 15:02, Johan Jonker wrote:
>>>> Hi Paul,
>>>>
>>>> The conversion of rockchip-rga.txt to rockchip-rga.yaml by myself just
>>>> has been approved by robh.
>>>
>>> Huh, I looked around for ongoing related work but missed it.
>>> I'll definitely rebase on top of your series and use the yaml description
>>> instead. Thanks!
>>>
>>>> Maybe place dts patches at the end of a patch serie.
>>>> Could you include a &rga patch if your device is supported in mainline,
>>>> so we can test with:
>>>> make ARCH=arm64 dtbs_check
>>>> DT_SCHEMA_FILES=Documentation/devicetree/bindings/media/rockchip-rga.yaml
>>>
>>> I tested with the PX30 EVB so I can surely add a node there if that turns
>>> out necessary (see below).
>>>
>>>> Johan
>>>>
>>>> On 4/16/20 1:50 PM, Paul Kocialkowski wrote:
>>>>> The PX30 features a RGA block: add the necessary node to support it.
>>>>>
>>>>> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
>>>>> ---
>>>>>  arch/arm64/boot/dts/rockchip/px30.dtsi | 11 +++++++++++
>>>>>  1 file changed, 11 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
>>>>> index 75908c587511..4bfbee9d4123 100644
>>>>> --- a/arch/arm64/boot/dts/rockchip/px30.dtsi
>>>>> +++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
>>>>> @@ -1104,6 +1104,17 @@ vopl_mmu: iommu@ff470f00 {
>>>>>  		status = "disabled";
>>>>>  	};
>>>>>  
>>>>> +	rga: rga@ff480000 {
>>>>> +		compatible = "rockchip,px30-rga";
>>>>> +		reg = <0x0 0xff480000 0x0 0x10000>;
>>>>> +		interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH 0>;
>>>>> +		clocks = <&cru ACLK_RGA>, <&cru HCLK_RGA>, <&cru SCLK_RGA_CORE>;
>>>>> +		clock-names = "aclk", "hclk", "sclk";
>>>>> +		resets = <&cru SRST_RGA>, <&cru SRST_RGA_A>, <&cru SRST_RGA_H>;
>>>>> +		reset-names = "core", "axi", "ahb";
>>>>> +		power-domains = <&power PX30_PD_VO>;
>>>>
>>>> 		status = "disabled";
>>>
>>> As of 5.6, the rk3399 has the node enabled by default. Did that change?
>>
>> 'status' disappeared during review for rk3399 between v2 and v3, but
>> doesn't mention the reason. If someone can give more info here?
>>
>> https://lore.kernel.org/lkml/1500101920-24039-5-git-send-email-jacob-chen@iotwrt.com/
>>
>> https://lore.kernel.org/lkml/1501470460-12014-5-git-send-email-jacob-chen@iotwrt.com/
>>
>>>
>>> Since it's a standalone block that has no I/O dependency, I don't really see
>>> the point of disabling it by default.
>>
>> Vop, hdmi and other video devices are also disabled.
>> Follow the rest I think...
> 
> Well, these blocks do have related I/O ports so it makes sense not to enable
> them by default because of pinmux, or because there might be no connector
> populated/routed.
> 
> For a memory to memory internal block, I don't see any reason why.
> It's definitely not board-specific and having to add these nodes for every board
> that has them is kind of a pain and might be overlooked. This will easily result
> in the feature not being available for end users without having to change the
> dt.
> 
> Also, the vpu node is always enabled on rockchip (and sunxi) platforms.
> I think these are better examples to follow.

From PX30 TRM-Part1:

Power domain is shared by vop and dsi.
It's up to the user what blocks he/she enables and what power it uses.

PD_VO: VOP_M, VOP_S, RGA and DSI

> 
> Cheers,
> 
> Paul
> 
>>>
>>> What do you think?
>>>
>>> Cheers,
>>>
>>> Paul
>>>
>>>>> +	};
>>>>> +
>>>>>  	qos_gmac: qos@ff518000 {
>>>>>  		compatible = "syscon";
>>>>>  		reg = <0x0 0xff518000 0x0 0x20>;
>>>>>
>>>>
>>>
>>
> 

