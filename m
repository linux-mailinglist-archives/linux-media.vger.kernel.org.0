Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0FF928E4E3
	for <lists+linux-media@lfdr.de>; Wed, 14 Oct 2020 18:52:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731323AbgJNQwv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Oct 2020 12:52:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726459AbgJNQwu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Oct 2020 12:52:50 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE463C061755;
        Wed, 14 Oct 2020 09:52:50 -0700 (PDT)
Received: from [IPv6:2804:14c:483:7f66::1004] (unknown [IPv6:2804:14c:483:7f66::1004])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 6B07F1F44C76;
        Wed, 14 Oct 2020 17:52:44 +0100 (BST)
Subject: Re: [PATCH v5 8/9] arm64: dts: rockchip: add isp0 node for rk3399
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     linux-devicetree <devicetree@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devel@driverdev.osuosl.org, Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>, kernel@collabora.com,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Mark Rutland <mark.rutland@arm.com>, karthik.poduval@gmail.com,
        jbx6244@gmail.com, Eddie Cai <eddie.cai.linux@gmail.com>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Robin Murphy <robin.murphy@arm.com>
References: <20200722155533.252844-1-helen.koike@collabora.com>
 <20200722155533.252844-9-helen.koike@collabora.com>
 <20200926130005.GC3781977@chromium.org>
 <905118dd-f108-6bc0-4cf0-9544fab51690@collabora.com>
 <CAAFQd5C4BcXyee58DpL4TfVJmaLQ-58_mwQucEm-df899va2Lw@mail.gmail.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <243b5257-0f94-a43d-e623-70ca54d0e9d9@collabora.com>
Date:   Wed, 14 Oct 2020 13:52:39 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <CAAFQd5C4BcXyee58DpL4TfVJmaLQ-58_mwQucEm-df899va2Lw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thank you Tomasz and Robin for your comments,

On 10/14/20 1:43 PM, Tomasz Figa wrote:
> On Wed, Oct 14, 2020 at 6:27 PM Helen Koike <helen.koike@collabora.com> wrote:
>>
>> Hi Tomasz,
>>
>> On 9/26/20 10:00 AM, Tomasz Figa wrote:
>>> Hi Helen,
>>>
>>> On Wed, Jul 22, 2020 at 12:55:32PM -0300, Helen Koike wrote:
>>>> From: Shunqian Zheng <zhengsq@rock-chips.com>
>>>>
>>>> RK3399 has two ISPs, but only isp0 was tested.
>>>> Add isp0 node in rk3399 dtsi
>>>>
>>>> Verified with:
>>>> make ARCH=arm64 dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/media/rockchip-isp1.yaml
>>>>
>>>> Signed-off-by: Shunqian Zheng <zhengsq@rock-chips.com>
>>>> Signed-off-by: Jacob Chen <jacob2.chen@rock-chips.com>
>>>> Signed-off-by: Helen Koike <helen.koike@collabora.com>
>>>>
>>>> ---
>>>>
>>>> V4:
>>>> - update clock names
>>>>
>>>> V3:
>>>> - clean up clocks
>>>>
>>>> V2:
>>>> - re-order power-domains property
>>>>
>>>> V1:
>>>> This patch was originally part of this patchset:
>>>>
>>>>     https://patchwork.kernel.org/patch/10267431/
>>>>
>>>> The only difference is:
>>>> - add phy properties
>>>> - add ports
>>>> ---
>>>>  arch/arm64/boot/dts/rockchip/rk3399.dtsi | 25 ++++++++++++++++++++++++
>>>>  1 file changed, 25 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>>>> index dba9641947a3a..ed8ba75dbbce8 100644
>>>> --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>>>> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>>>> @@ -1721,6 +1721,31 @@ vopb_mmu: iommu@ff903f00 {
>>>>              status = "disabled";
>>>>      };
>>>>
>>>> +    isp0: isp0@ff910000 {
>>>> +            compatible = "rockchip,rk3399-cif-isp";
>>>> +            reg = <0x0 0xff910000 0x0 0x4000>;
>>>> +            interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH 0>;
>>>> +            clocks = <&cru SCLK_ISP0>,
>>>> +                     <&cru ACLK_ISP0_WRAPPER>,
>>>> +                     <&cru HCLK_ISP0_WRAPPER>;
>>>> +            clock-names = "isp", "aclk", "hclk";
>>>> +            iommus = <&isp0_mmu>;
>>>> +            phys = <&mipi_dphy_rx0>;
>>>> +            phy-names = "dphy";
>>>> +            power-domains = <&power RK3399_PD_ISP0>;
>>>
>>> Should this have status = "disabled" too? The mipi_dphy_rx0 node is
>>> disabled by default too, so in the default configuration the driver
>>> would always fail to probe.
>>
>> I'm thinking what is the overall guideline here.
>> Since isp and mipi_dphy are always present in the rk3399, shouldn't they always be enabled?
>> Or since they are only useful if a sensor is present, we should let the dts of the board to
>> enable it?
> 
> I don't have a strong opinion. I'm fine with enabling both by default
> as well, as it shouldn't hurt.
> 
> That said, I recall some alternative CIF IP block being present on
> this SoC as well (and patches posted recently), which AFAIR can't be
> activated at the same time as the ISP, so perhaps both of the
> alternatives should be disabled by default?
> 
> Best regards,
> Tomasz
> 

Based on these two last emails, I think it make sense to disable them by default.

I'll just wait for feedback on patch 5/9 to submit an updated version.

Thanks
Helen
