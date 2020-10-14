Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5079528E4AE
	for <lists+linux-media@lfdr.de>; Wed, 14 Oct 2020 18:43:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727953AbgJNQm4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Oct 2020 12:42:56 -0400
Received: from foss.arm.com ([217.140.110.172]:53378 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727559AbgJNQm4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Oct 2020 12:42:56 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A2DFDD6E;
        Wed, 14 Oct 2020 09:42:55 -0700 (PDT)
Received: from [10.57.48.76] (unknown [10.57.48.76])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 939793F71F;
        Wed, 14 Oct 2020 09:42:52 -0700 (PDT)
Subject: Re: [PATCH v5 8/9] arm64: dts: rockchip: add isp0 node for rk3399
To:     Helen Koike <helen.koike@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, robh+dt@kernel.org, heiko@sntech.de,
        hverkuil-cisco@xs4all.nl, kernel@collabora.com,
        dafna.hirschfeld@collabora.com, ezequiel@collabora.com,
        mark.rutland@arm.com, karthik.poduval@gmail.com, jbx6244@gmail.com,
        eddie.cai.linux@gmail.com, zhengsq@rock-chips.com
References: <20200722155533.252844-1-helen.koike@collabora.com>
 <20200722155533.252844-9-helen.koike@collabora.com>
 <20200926130005.GC3781977@chromium.org>
 <905118dd-f108-6bc0-4cf0-9544fab51690@collabora.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <49005dd4-4467-2c93-a294-3760b98a7b92@arm.com>
Date:   Wed, 14 Oct 2020 17:42:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <905118dd-f108-6bc0-4cf0-9544fab51690@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2020-10-14 17:27, Helen Koike wrote:
> Hi Tomasz,
> 
> On 9/26/20 10:00 AM, Tomasz Figa wrote:
>> Hi Helen,
>>
>> On Wed, Jul 22, 2020 at 12:55:32PM -0300, Helen Koike wrote:
>>> From: Shunqian Zheng <zhengsq@rock-chips.com>
>>>
>>> RK3399 has two ISPs, but only isp0 was tested.
>>> Add isp0 node in rk3399 dtsi
>>>
>>> Verified with:
>>> make ARCH=arm64 dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/media/rockchip-isp1.yaml
>>>
>>> Signed-off-by: Shunqian Zheng <zhengsq@rock-chips.com>
>>> Signed-off-by: Jacob Chen <jacob2.chen@rock-chips.com>
>>> Signed-off-by: Helen Koike <helen.koike@collabora.com>
>>>
>>> ---
>>>
>>> V4:
>>> - update clock names
>>>
>>> V3:
>>> - clean up clocks
>>>
>>> V2:
>>> - re-order power-domains property
>>>
>>> V1:
>>> This patch was originally part of this patchset:
>>>
>>>      https://patchwork.kernel.org/patch/10267431/
>>>
>>> The only difference is:
>>> - add phy properties
>>> - add ports
>>> ---
>>>   arch/arm64/boot/dts/rockchip/rk3399.dtsi | 25 ++++++++++++++++++++++++
>>>   1 file changed, 25 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>>> index dba9641947a3a..ed8ba75dbbce8 100644
>>> --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>>> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>>> @@ -1721,6 +1721,31 @@ vopb_mmu: iommu@ff903f00 {
>>>   		status = "disabled";
>>>   	};
>>>   
>>> +	isp0: isp0@ff910000 {
>>> +		compatible = "rockchip,rk3399-cif-isp";
>>> +		reg = <0x0 0xff910000 0x0 0x4000>;
>>> +		interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH 0>;
>>> +		clocks = <&cru SCLK_ISP0>,
>>> +			 <&cru ACLK_ISP0_WRAPPER>,
>>> +			 <&cru HCLK_ISP0_WRAPPER>;
>>> +		clock-names = "isp", "aclk", "hclk";
>>> +		iommus = <&isp0_mmu>;
>>> +		phys = <&mipi_dphy_rx0>;
>>> +		phy-names = "dphy";
>>> +		power-domains = <&power RK3399_PD_ISP0>;
>>
>> Should this have status = "disabled" too? The mipi_dphy_rx0 node is
>> disabled by default too, so in the default configuration the driver
>> would always fail to probe.
> 
> I'm thinking what is the overall guideline here.
> Since isp and mipi_dphy are always present in the rk3399, shouldn't they always be enabled?
> Or since they are only useful if a sensor is present, we should let the dts of the board to
> enable it?

Yes, the usual pattern is that anything which needs additional hardware 
outside the SoC to be useful is disabled by default in the SoC DTSI, and 
enabled in individual board DTSs as appropriate. See USB, HDMI, etc. for 
instance.

There's probably a further debate about how much the board itself should 
enable if it only breaks out a connector for the user to add their own 
camera module, but hey, one step at a time ;)

Robin.
