Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC6DB14CE2E
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2020 17:23:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727159AbgA2QWv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jan 2020 11:22:51 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:17644 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727141AbgA2QWv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jan 2020 11:22:51 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e31b14b0000>; Wed, 29 Jan 2020 08:22:35 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 29 Jan 2020 08:22:50 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 29 Jan 2020 08:22:50 -0800
Received: from [10.2.164.115] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 29 Jan
 2020 16:22:49 +0000
Subject: Re: Re: [RFC PATCH v1 5/5] arm64: tegra: Add Tegra VI CSI suppport in
 device tree
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <1580235801-4129-1-git-send-email-skomatineni@nvidia.com>
 <1580235801-4129-6-git-send-email-skomatineni@nvidia.com>
 <20200129094624.GD2479935@ulmo>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <bd18711d-ce23-cbee-7824-37a8c78908e6@nvidia.com>
Date:   Wed, 29 Jan 2020 08:22:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200129094624.GD2479935@ulmo>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1580314955; bh=eLeON2MxtqTE1lp83s18wcsu20gMK+jZz18egxh1R4s=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=Pd4wjUdLK95tGQ+sjDU/adByintrMeBPwj9MI7AfSC7ItU9W8KcmRMs2IW9a40cIK
         nxLIKAheY1jQn6bDWzOAhi01ju6CVzZqiN4SFszHqe2fot8xwdld/ZqvcARBq13J3N
         +JqfEQdzjAoXvt+A7nXO5Ir696wEn+2dTAag3XAhD8U/kVyRTKOqNLktOyrem2TiDP
         aEgt1bZ0nV0C6UW4X3Dto41RM+QN+wfkRzR98c354oMqQk88cSSP0NkuC23kWxOCLT
         ye52CcISxwm17dKRA8SsOXzI6houcLgaWiDRa29sbIkZ87ZVVEQEq7Zy3gzOPHRvh7
         nBjmlxztZWGXg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 1/29/20 1:46 AM, Thierry Reding wrote:
> On Tue, Jan 28, 2020 at 10:23:21AM -0800, Sowjanya Komatineni wrote:
>> Tegra210 contains VI controller for video input capture from MIPI
>> CSI camera sensors and also supports built-in test pattern generator.
>>
>> CSI ports can be one-to-one mapped to VI channels for capturing from
>> an external sensor or from built-in test pattern generator.
>>
>> This patch adds support for VI and CSI and enables them in Tegra210
>> device tree.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>   arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi |  8 +++++++
>>   arch/arm64/boot/dts/nvidia/tegra210.dtsi       | 31 +++++++++++++++++++++++++-
>>   2 files changed, 38 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
>> index b0095072bc28..ec1b3033fa03 100644
>> --- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
>> +++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
>> @@ -10,6 +10,14 @@
>>   			status = "okay";
>>   		};
>>   
>> +		vi@54080000 {
>> +			status = "okay";
>> +		};
>> +
>> +		csi@0x54080838 {
>> +			status = "okay";
>> +		};
>> +
>>   		sor@54580000 {
>>   			status = "okay";
>>   
>> diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
>> index 48c63256ba7f..c6107ec03ad1 100644
>> --- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
>> +++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
>> @@ -136,9 +136,38 @@
>>   
>>   		vi@54080000 {
>>   			compatible = "nvidia,tegra210-vi";
>> -			reg = <0x0 0x54080000 0x0 0x00040000>;
>> +			reg = <0x0 0x54080000 0x0 0x808>;
>>   			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
>>   			status = "disabled";
>> +			assigned-clocks = <&tegra_car TEGRA210_CLK_VI>;
>> +			assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_C4_OUT0>;
>> +
>> +			clocks = <&tegra_car TEGRA210_CLK_VI>;
>> +			clock-names = "vi";
>> +			resets = <&tegra_car 20>;
>> +			reset-names = "vi";
>> +		};
>> +
>> +		csi@0x54080838 {
>> +			compatible = "nvidia,tegra210-csi";
>> +			reg = <0x0 0x54080838 0x0 0x2000>;
>> +			status = "disabled";
>> +			assigned-clocks = <&tegra_car TEGRA210_CLK_CILAB>,
>> +					  <&tegra_car TEGRA210_CLK_CILCD>,
>> +					  <&tegra_car TEGRA210_CLK_CILE>;
>> +			assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_P>,
>> +						 <&tegra_car TEGRA210_CLK_PLL_P>,
>> +						 <&tegra_car TEGRA210_CLK_PLL_P>;
>> +			assigned-clock-rates = <102000000>,
>> +					       <102000000>,
>> +					       <102000000>;
>> +
>> +			clocks = <&tegra_car TEGRA210_CLK_CSI>,
>> +				 <&tegra_car TEGRA210_CLK_CILAB>,
>> +				 <&tegra_car TEGRA210_CLK_CILCD>,
>> +				 <&tegra_car TEGRA210_CLK_CILE>;
>> +			clock-names = "csi", "cilab", "cilcd", "cile";
>> +
>>   		};
> Can this be a child of the vi node? Looking at the register ranges it
> seems like these are actually a single IP block. If they have separate
> blocks with clearly separate functionality, then it makes sense to have
> CSI be a child node of VI, though it may also be okay to merge both and
> have a single node with the driver doing all of the differentiation
> between what's VI and what's CSI.
>
> Looking at later chips, the split between VI and CSI is more explicit,
> so having the split in DT for Tegra210 may make sense for consistency.
>
> I know we've discussed this before, but for some reason I keep coming
> back to this. I'll go through the other patches to see if I can get a
> clearer picture of how this could all work together.
>
> Thierry

We can keep it separate as we discussed.

But as Tegra186 onwards, CSI is separate device to be all cosistent I 
kept CSI as separate node for Tegra210 as well.

