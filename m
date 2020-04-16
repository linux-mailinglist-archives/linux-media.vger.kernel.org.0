Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE4171AC971
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2020 17:25:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2898464AbgDPNo4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Apr 2020 09:44:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2898433AbgDPNoa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Apr 2020 09:44:30 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B064C061A0C;
        Thu, 16 Apr 2020 06:44:30 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id v8so2574131wma.0;
        Thu, 16 Apr 2020 06:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WnOLlJGWjKKU4l6KU86petvNf/KeuBQfP8LASQRqnt8=;
        b=NKaFl00peRLsJRd1TCpOYzHetW8sbRA+/HJn6nXHcphRgYoHcE2As4Skpd/c5OOtl3
         aAJP6GhSIoz0w4NCFbSZJ6HKcTBmEX7IXKjNWRGHscVFHFO40s7l2Oij2g2owDoID0a5
         7/75cQ6pZ1aQ52kQoT65AaH1sagq0kwsSQQsKV6iAsy2BwSQXEQu+AZUDJEATTyjsEvW
         /dQmoQ710BctBOzQRsQWEq7qIyYJgrGIrl24rfwI89EL6oev6W3DzRYRUHoGWtgMTglM
         5DlQjWI5n+jybhbO+jO01+JAbMYihB8YdAnzppfOgx7wop42LLUkMnTRf0PV4zxzyq5i
         zrVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WnOLlJGWjKKU4l6KU86petvNf/KeuBQfP8LASQRqnt8=;
        b=lEubnyQ/cp6fLEeDfiOQMbHMzZiBd3aDNoa+AcT1Fi9XTQjA+d3zE0t/guRpbmmNTx
         kSXsmk8Kx7bqIYOjbFROmQ7OPLW2BBRpLkOYLJ8Wqmcfhxv4cG5NKieOqYZ92cj2ikpJ
         RDzdKktUhiLFywVL4st851X2HA+5/ao6KcioXMDfoXyFYmo7ZM5fHDuy73sjmNPLM6KP
         VF8EV6p7p8nic8l0X9Qn1S2GrUIZfXadFv0wXjONHLNcmsdIt8sjT0rUv1b1LcalBWrK
         l6ptRSPUQhERa6rPCoiM3+2MgygRR8Ojjau05E7PN1oHLx+cuHNsrsRTDJlP7dhV/QZ0
         sIBA==
X-Gm-Message-State: AGi0PuYh6giViBV7jL1UZxPwjcpeMX3S/xDX6bqsMWEOdI+qWbLzcQQl
        dTyjG5FaeklVpRtO63ZRcHs=
X-Google-Smtp-Source: APiQypKHstkks+d7QKXlK1Kx2K4FOqpUNOov9QzJnGobXCUEc76Hs0tyB7U8aK6EB9CSGnwIDUH4vw==
X-Received: by 2002:a7b:cd10:: with SMTP id f16mr5171636wmj.21.1587044668689;
        Thu, 16 Apr 2020 06:44:28 -0700 (PDT)
Received: from [192.168.2.1] (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id z18sm21457242wrw.41.2020.04.16.06.44.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2020 06:44:27 -0700 (PDT)
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
From:   Johan Jonker <jbx6244@gmail.com>
Message-ID: <f4ad8ea4-7904-1458-e564-2d20c87ed417@gmail.com>
Date:   Thu, 16 Apr 2020 15:44:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200416132442.GI125838@aptenodytes>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 4/16/20 3:24 PM, Paul Kocialkowski wrote:
> Hi,
> 
> On Thu 16 Apr 20, 15:02, Johan Jonker wrote:
>> Hi Paul,
>>
>> The conversion of rockchip-rga.txt to rockchip-rga.yaml by myself just
>> has been approved by robh.
> 
> Huh, I looked around for ongoing related work but missed it.
> I'll definitely rebase on top of your series and use the yaml description
> instead. Thanks!
> 
>> Maybe place dts patches at the end of a patch serie.
>> Could you include a &rga patch if your device is supported in mainline,
>> so we can test with:
>> make ARCH=arm64 dtbs_check
>> DT_SCHEMA_FILES=Documentation/devicetree/bindings/media/rockchip-rga.yaml
> 
> I tested with the PX30 EVB so I can surely add a node there if that turns
> out necessary (see below).
> 
>> Johan
>>
>> On 4/16/20 1:50 PM, Paul Kocialkowski wrote:
>>> The PX30 features a RGA block: add the necessary node to support it.
>>>
>>> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
>>> ---
>>>  arch/arm64/boot/dts/rockchip/px30.dtsi | 11 +++++++++++
>>>  1 file changed, 11 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
>>> index 75908c587511..4bfbee9d4123 100644
>>> --- a/arch/arm64/boot/dts/rockchip/px30.dtsi
>>> +++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
>>> @@ -1104,6 +1104,17 @@ vopl_mmu: iommu@ff470f00 {
>>>  		status = "disabled";
>>>  	};
>>>  
>>> +	rga: rga@ff480000 {
>>> +		compatible = "rockchip,px30-rga";
>>> +		reg = <0x0 0xff480000 0x0 0x10000>;
>>> +		interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH 0>;
>>> +		clocks = <&cru ACLK_RGA>, <&cru HCLK_RGA>, <&cru SCLK_RGA_CORE>;
>>> +		clock-names = "aclk", "hclk", "sclk";
>>> +		resets = <&cru SRST_RGA>, <&cru SRST_RGA_A>, <&cru SRST_RGA_H>;
>>> +		reset-names = "core", "axi", "ahb";
>>> +		power-domains = <&power PX30_PD_VO>;
>>
>> 		status = "disabled";
> 
> As of 5.6, the rk3399 has the node enabled by default. Did that change?

'status' disappeared during review for rk3399 between v2 and v3, but
doesn't mention the reason. If someone can give more info here?

https://lore.kernel.org/lkml/1500101920-24039-5-git-send-email-jacob-chen@iotwrt.com/

https://lore.kernel.org/lkml/1501470460-12014-5-git-send-email-jacob-chen@iotwrt.com/

> 
> Since it's a standalone block that has no I/O dependency, I don't really see
> the point of disabling it by default.

Vop, hdmi and other video devices are also disabled.
Follow the rest I think...

> 
> What do you think?
> 
> Cheers,
> 
> Paul
> 
>>> +	};
>>> +
>>>  	qos_gmac: qos@ff518000 {
>>>  		compatible = "syscon";
>>>  		reg = <0x0 0xff518000 0x0 0x20>;
>>>
>>
> 

