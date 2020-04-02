Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B849119CAC7
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2020 22:10:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388861AbgDBUK0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Apr 2020 16:10:26 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:54596 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726617AbgDBUK0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Apr 2020 16:10:26 -0400
Received: by mail-wm1-f67.google.com with SMTP id c81so4783038wmd.4;
        Thu, 02 Apr 2020 13:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5UitrtcQcLyUuypDd55yvaCM6NIpqOgNi0sTpbymWqI=;
        b=jLUnozkZzk4wHj1zfjABKiOeRlA+KmFZy7xnaV7k84+hygjsJgnWCGl9rdGgKYZBLD
         EcCtl/2F/L+6SK6Nkmj7cSBZpmfEVcfaE/qebmIW6CTRo2jxjsafOZlyF0jYEup9bFUi
         KGbP6hKKwQjR8wryIky2THe219oIq9qoE2XBaUV/36TfgDLK5yNsRDQgzifAv3x+0ide
         +dXZS9T6AvOWhnXvKDqTZUIA3tBWJH6ohCIqHEGb5gqscpHUgOoqqI2D1xRjMnZ8VFkn
         kwdj5LogxrcQpwPdW6Q4ABa1wP7PSaceNqWWFLzdpN2R7BSMNvMX0ui6JP1NzEy59lPA
         WSgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5UitrtcQcLyUuypDd55yvaCM6NIpqOgNi0sTpbymWqI=;
        b=aN9cyN/grFgV2lcrWJ/vRsGUcSrBVCtyqEG7A1wr/l1EqYxbYIQuB3hAxL+H9Ep5on
         HqMXfvm1FuT30sB+pn03uAAF0H1yiDa/5Nf/+2CSUVtQeHx2zAVJznc2sxp6eCoBnVwP
         XZUM4SBVq64XLeATbXPr7AgL1ibyCC2JsWVMWN3wly5XmlYTDyQmdKYeKWSmXTv0qlT6
         LI6W4kwleSXoOdOdi3r5IT1dVMaeM7OPFBD8VX+MQIry4rAqTS2R+6yFNXkww+ud1tK1
         LhPHE7AuUGp1QdOovHztdFTQSoo+TfkYPq1wHQL/rC4WRuqsHvQvkX3oTO6U/a9Wpm0X
         xTHg==
X-Gm-Message-State: AGi0PuYGcDXmctgu89ft0H4CsV9uRdJXrWxb/nYfZgOMNN7k7R+WHMnO
        lsqnwXioIZ2XKL4P4Pp0p4k=
X-Google-Smtp-Source: APiQypIbEEkJukJIMkBcjNC0Z/IpCLXYe/ZM6jvYBjXgKEX9jEuufWBxIiPSsGTTRPDqcUTlIC+mKg==
X-Received: by 2002:a1c:c257:: with SMTP id s84mr5274398wmf.9.1585858224173;
        Thu, 02 Apr 2020 13:10:24 -0700 (PDT)
Received: from [192.168.2.1] (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id r5sm8462481wmr.15.2020.04.02.13.10.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2020 13:10:23 -0700 (PDT)
Subject: Re: [PATCH 4/4] arm64: dts: rockchip: add isp0 node for rk3399
To:     Helen Koike <helen.koike@collabora.com>
Cc:     dafna.hirschfeld@collabora.com, devel@driverdev.osuosl.org,
        devicetree@vger.kernel.org, ezequiel@collabora.com,
        heiko@sntech.de, hverkuil-cisco@xs4all.nl,
        karthik.poduval@gmail.com, kernel@collabora.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, mark.rutland@arm.com,
        robh+dt@kernel.org
References: <20200402000234.226466-5-helen.koike@collabora.com>
 <1187d28a-6fb9-fd12-a422-8a4220a11e79@gmail.com>
 <d8b05dd4-1ece-9513-b2ec-0cb58f665c5e@collabora.com>
From:   Johan Jonker <jbx6244@gmail.com>
Message-ID: <20ae21a6-74b0-ff99-80d9-1a0ce2cc1aa5@gmail.com>
Date:   Thu, 2 Apr 2020 22:10:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <d8b05dd4-1ece-9513-b2ec-0cb58f665c5e@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 4/2/20 9:46 PM, Helen Koike wrote:
> 
> 
> On 4/2/20 2:20 PM, Johan Jonker wrote:
>> Hi Helen,
>>
>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>>> index fc0295d2a65a1..815099a0cd0dd 100644
>>> --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>>> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>>> @@ -1718,6 +1718,33 @@ vopb_mmu: iommu@ff903f00 {
>>>  		status = "disabled";
>>>  	};
>>>  
>>> +	isp0: isp0@ff910000 {
>>> +		compatible = "rockchip,rk3399-cif-isp";
>>> +		reg = <0x0 0xff910000 0x0 0x4000>;
>>> +		interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH 0>;
>>> +		clocks = <&cru SCLK_ISP0>,
>>> +			 <&cru ACLK_ISP0>, <&cru ACLK_ISP0_WRAPPER>,
>>> +			 <&cru HCLK_ISP0>, <&cru HCLK_ISP0_WRAPPER>;
>>> +		clock-names = "clk_isp",
>>> +			      "aclk_isp", "aclk_isp_wrap",
>>> +			      "hclk_isp", "hclk_isp_wrap";
>>
>>> +		power-domains = <&power RK3399_PD_ISP0>;
>>> +		iommus = <&isp0_mmu>;
>>> +		phys = <&mipi_dphy_rx0>;
>>> +		phy-names = "dphy";
>>
>> Maybe a little sort? But keep rest as it is. Also in example.
>>
>> 		iommus = <&isp0_mmu>;
>> 		phys = <&mipi_dphy_rx0>;
>> 		phy-names = "dphy";
>> 		power-domains = <&power RK3399_PD_ISP0>;
> 
> Are you proposing only to move power-domains after phy? And keep the rest?
> What is the main logic?

There is no hard rule... It mostly depend on Heiko...

For nodes:
Sort things without reg alphabetical first,
then sort the rest by reg address.

Inside nodes:
If exists on top: compatible, reg and interrupts.
In alphabetical order the required properties.
Then in alphabetical order the other properties.
And as last things that start with '#' in alphabetical order.

> 
> Thanks
> Helen
> 
>>
>>> +
>>> +		ports {
>>> +			#address-cells = <1>;
>>> +			#size-cells = <0>;
>>> +
>>> +			port@0 {
>>
>>> +				#address-cells = <1>;
>>> +				#size-cells = <0>;
>>> +				reg = <0>;
>>
>> Move reg above #address-cells. Change that in example as well.
>>
>> 				reg = <0>;
>> 				#address-cells = <1>;
>> 				#size-cells = <0>;
>>
>>> +			};
>>> +		};
>>> +	};
>>> +
>>>  	isp0_mmu: iommu@ff914000 {
>>>  		compatible = "rockchip,iommu";
>>>  		reg = <0x0 0xff914000 0x0 0x100>, <0x0 0xff915000 0x0 0x100>;
>>> -- 
>>> 2.26.0
>>

