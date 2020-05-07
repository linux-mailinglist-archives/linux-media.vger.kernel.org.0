Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 630AE1C9F3D
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2020 01:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbgEGXkM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 May 2020 19:40:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726464AbgEGXkM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 May 2020 19:40:12 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B22A3C05BD43;
        Thu,  7 May 2020 16:40:11 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id 188so8413764wmc.2;
        Thu, 07 May 2020 16:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LeEjSoC+KWHnDVL+GAb88TtcLPL+vxgTH1UqxiwLGBE=;
        b=jJI7iisBRN9lUPdFF2pIY3P84wTuq5rziNa8d2Njwyf5twXA4f2pAJ22picElxpgCN
         RyBGlJMHmqCVyGXHpafltfYuFvjwQjXLeErMK7RbRKwR4i+jSCyDu/Gm9UGj92UXGQQV
         4xuAE50GfM5+SUDeyXcWbvxi81C49veMoelfexh+sxYyvi6Xd3Hf9sHZwf2oJcdfqZ4c
         sj/MaurplX/+lA2Srv921WfXEfqyWGZrz6mDmuGsdFSU76YgtdC4NYP5L4n7Aew+1boG
         OaND5pJ0wkJhUVj19FxWH28LxXSvtdi1BUQOEzbpOOID4pvqpenZMTLZ0B7mDjS+3XJS
         cwzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LeEjSoC+KWHnDVL+GAb88TtcLPL+vxgTH1UqxiwLGBE=;
        b=jiZljHK0WfI1Gx9c+fGgGEToEg4nkelLgtW741GtzmGN/a1Tmd/g6VKGyb9ksNBTxd
         MVfRZFkURuOgzGDUs+G5p3LhZHt8ShnHBtbIaEqQkc9Lk+iDkmwUeq4kDX+HfHJcmoeX
         Nu9IgF5GEcQIjUbQAwYAV1VmsmTpq0H/B2JLgl1wh35MzA54BuQlytNL+wJWDlW+ASAG
         uy5EBg4H8d1DiNNOQ8qCywOYu5t+15IPl3BQ2bOqXfcSF16O38UTJ+nMTrd31iId0hMd
         DyxLgwzLt02Ty2FFBDqiAbKufMfTBX0RsL5buO5KqIPQ8XgaEu+DmGS/p5MVhksp2MqG
         qOOA==
X-Gm-Message-State: AGi0Pubgg2A1CxrntbnDiwrKeqNLIWDnP4pT5xmI8KJBvrsKsdpvchcN
        WTeMLbjK3QWN3dY6N+AHIuU=
X-Google-Smtp-Source: APiQypIMjl0Gv1T78MM/jPEcJHt9TQ1o4EZ7MA/8Dhv4FzUE6INX4d2J+WXVM11MeDplM6s2Vrwqbg==
X-Received: by 2002:a05:600c:22d3:: with SMTP id 19mr13644233wmg.110.1588894810321;
        Thu, 07 May 2020 16:40:10 -0700 (PDT)
Received: from [192.168.2.1] (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id c128sm10549504wma.42.2020.05.07.16.40.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2020 16:40:09 -0700 (PDT)
Subject: Re: [PATCH v3 2/4] arm64: dts: rockchip: Add RGA support to the PX30
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     devicetree@vger.kernel.org, ezequiel@collabora.com,
        hansverk@cisco.com, heiko@sntech.de,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, robh+dt@kernel.org,
        thomas.petazzoni@bootlin.com
References: <20200430164245.1630174-3-paul.kocialkowski@bootlin.com>
 <c3954924-c220-73ef-06dd-85b6876be819@gmail.com>
 <20200507202558.GK2422122@aptenodytes>
From:   Johan Jonker <jbx6244@gmail.com>
Message-ID: <7112d1fa-a872-c66f-0ece-a77ba1f852de@gmail.com>
Date:   Fri, 8 May 2020 01:40:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200507202558.GK2422122@aptenodytes>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

On 5/7/20 10:25 PM, Paul Kocialkowski wrote:
> Hi,
> 
> On Fri 01 May 20, 00:05, Johan Jonker wrote:
>> Hi Paul,
>>
>>> The PX30 features a RGA block: add the necessary node to support it.
>>>
>>> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
>>> ---
>>>  arch/arm64/boot/dts/rockchip/px30.dtsi | 11 +++++++++++
>>>  1 file changed, 11 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
>>> index f809dd6d5dc3..3de70aa4f1ce 100644
>>> --- a/arch/arm64/boot/dts/rockchip/px30.dtsi
>>> +++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
>>> @@ -1102,6 +1102,17 @@ vopl_mmu: iommu@ff470f00 {
>>>  		status = "disabled";
>>>  	};
>>>  
>>> +	rga: rga@ff480000 {
>>> +		compatible = "rockchip,px30-rga", "rockchip,rk3288-rga";
>>> +		reg = <0x0 0xff480000 0x0 0x10000>;
>>> +		interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH 0>;
>>> +		clocks = <&cru ACLK_RGA>, <&cru HCLK_RGA>, <&cru SCLK_RGA_CORE>;
>>> +		clock-names = "aclk", "hclk", "sclk";
>>
>>> +		resets = <&cru SRST_RGA>, <&cru SRST_RGA_A>, <&cru SRST_RGA_H>;
>>> +		reset-names = "core", "axi", "ahb";
>>> +		power-domains = <&power PX30_PD_VO>;
>>
>> sort
>>
>> 		power-domains = <&power PX30_PD_VO>;
>> 		resets = <&cru SRST_RGA>, <&cru SRST_RGA_A>, <&cru SRST_RGA_H>;
>> 		reset-names = "core", "axi", "ahb";
> 
> What's the rationale behind this (besides alphabetic sorting, which I don't
> believe is a rule for dt properties)? Some nodes above in the file have it in
> the same order that I do, and I like to see clocks followed by resets.

My short list.
There is no hard rule... It mostly depend on Heiko...

For nodes:
If exists on top: model, compatible and chosen.
Sort things without reg alphabetical first,
then sort the rest by reg address.

Inside nodes:
If exists on top: compatible, reg and interrupts.
In alphabetical order the required properties.
Then in alphabetical order the other properties.
And as last things that start with '#' in alphabetical order.
Add status below all other properties for soc internal components with
any board-specifics.
Keep an empty line between properties and nodes.

Exceptions:
Sort pinctrl-0 above pinctrl-names, so it stays in line with clock-names
and dma-names.
Sort simple-audio-card,name above other simple-audio-card properties.
Sort regulator-name above other regulator properties.
Sort regulator-min-microvolt above regulator-max-microvolt.

> 
> Cheers,
> 
> Paul
> 
>>
>>
>>> +	};
>>> +
>>>  	qos_gmac: qos@ff518000 {
>>>  		compatible = "syscon";
>>>  		reg = <0x0 0xff518000 0x0 0x20>;
>>> -- 
>>> 2.26.0
>>
> 

