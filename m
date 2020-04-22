Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 308861B4BB3
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2020 19:26:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726904AbgDVR0X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Apr 2020 13:26:23 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:4472 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726363AbgDVR0X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Apr 2020 13:26:23 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ea07e000000>; Wed, 22 Apr 2020 10:25:20 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 22 Apr 2020 10:26:22 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 22 Apr 2020 10:26:22 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 22 Apr
 2020 17:26:22 +0000
Received: from [10.2.165.49] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 22 Apr
 2020 17:26:21 +0000
Subject: Re: [RFC PATCH v9 5/9] dt-binding: tegra: Add VI and CSI bindings
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <frankc@nvidia.com>, <hverkuil@xs4all.nl>, <sakari.ailus@iki.fi>,
        <helen.koike@collabora.com>, <digetx@gmail.com>,
        <sboyd@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1587536339-4030-1-git-send-email-skomatineni@nvidia.com>
 <1587536339-4030-6-git-send-email-skomatineni@nvidia.com>
 <20200422172047.GA18765@pendragon.ideasonboard.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <1ae63b2e-17f0-ca0e-23fa-9aa63eafe01b@nvidia.com>
Date:   Wed, 22 Apr 2020 10:26:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200422172047.GA18765@pendragon.ideasonboard.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
	t=1587576320; bh=HfkzuR+vYVLOjA/839zIGQQg1loQfsQ+IO+/Ii0+hVQ=;
	h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
	 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
	 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
	 Content-Language;
	b=mXG4pQ46mtw3JTRdiTAfbKIo8ocWIwYbDoR2GlvGZNfM++w8WWv2futApPFpQPDsn
	 DYKCKfLjQS6QMi9iado5yxDppXLzKNPSAh79WiOtZkDnxnYesOfrbPrR4NvX7uV1Mh
	 j8yBi3WYowY2ACc/ouLfLAY4GLLXdEDKQeIi7ztdEUZlqCHH9JdQYzt55yeXTSG7Ju
	 EdBSajJgI0RbyjAhZs9YwJ8/Sk5TpOrby6kmzk2gCzvkCYPp98U69bLnqRccI/uf4e
	 W6Urof3IfLm6MYH3rDE3nrQmGRMu713Us4o9WX+atKkaCQ+pZUZklqfm9KrCTAdrIL
	 Ba0krgo3iyjDQ==

On 4/22/20 10:20 AM, Laurent Pinchart wrote:
> External email: Use caution opening links or attachments
>
>
> Hi Sowjanya,
>
> Thank you for the patch.
>
> On Tue, Apr 21, 2020 at 11:18:55PM -0700, Sowjanya Komatineni wrote:
>> Tegra contains VI controller which can support up to 6 MIPI CSI
>> camera sensors.
>>
>> Each Tegra CSI port from CSI unit can be one-to-one mapper to
>> VI channel and can capture from an external camera sensor or
>> from built-in test pattern generator.
>>
>> This patch adds dt-bindings for Tegra VI and CSI.
>>
>> Acked-by: Thierry Reding <treding@nvidia.com>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>   .../display/tegra/nvidia,tegra20-host1x.txt        | 73 ++++++++++++++++++----
>>   1 file changed, 60 insertions(+), 13 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
>> index 9999255..4731921 100644
>> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
>> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
>> @@ -40,14 +40,30 @@ of the following host1x client modules:
>>
>>     Required properties:
>>     - compatible: "nvidia,tegra<chip>-vi"
>> -  - reg: Physical base address and length of the controller's registers.
>> +  - reg: Physical base address and length of the controller registers.
>>     - interrupts: The interrupt outputs from the controller.
>> -  - clocks: Must contain one entry, for the module clock.
>> +  - clocks: clocks: Must contain one entry, for the module clock.
>>       See ../clocks/clock-bindings.txt for details.
>> -  - resets: Must contain an entry for each entry in reset-names.
>> -    See ../reset/reset.txt for details.
>> -  - reset-names: Must include the following entries:
>> -    - vi
>> +  - Tegra20/Tegra30/Tegra114/Tegra124:
>> +    - resets: Must contain an entry for each entry in reset-names.
>> +      See ../reset/reset.txt for details.
>> +    - reset-names: Must include the following entries:
>> +      - vi
>> +  - Tegra210:
>> +    - power-domains: Must include venc powergate node as vi is in VE partition.
>> +  - Tegra210 has CSI part of VI sharing same host interface and register space.
>> +    So, VI device node should have CSI child node.
>> +
>> +    - csi: mipi csi interface to vi
>> +
>> +      Required properties:
>> +      - compatible: "nvidia,tegra210-csi"
>> +      - reg: Physical base address offset to parent and length of the controller
>> +        registers.
>> +      - clocks: Must contain entries csi, cilab, cilcd, cile, csi_tpg clocks.
>> +        See ../clocks/clock-bindings.txt for details.
>> +      - power-domains: Must include sor powergate node as csicil is in
>> +        SOR partition.
> A bit of a stupid question maybe, but why is this needed ? Can't the
> driver that handles the vi DT node ("nvidia,tegra20-vi") handle all the
> registers for all the sub-blocks ? Can't we move the clocks and power
> domains from the CSI node to the VI node ?

CSI is separate device driver and VI is separate device driver.

For T210, CSI shares register space under VI but for later Tegras its 
separate register space.

So CSI and VI drivers are separate with their corresponding clocks and 
power domains in their nodes.

>
> Regardless of the answer to this question, I think this is missing port
> nodes for the physical CSI-2 inputs, to connect them to sensors. I
> haven't seen anywhere in this series how a CSI-2 sensor is linked to the
> VI.

This patch series is only for Tegra internal TPG and tegra video driver 
creates hard media links between CSI and VI,

Sensor support will be in Series-2 where port nodes will be used for 
real sensor <-> csi <-> vi endpoints

>
>>   - epp: encoder pre-processor
>>
>> @@ -309,13 +325,44 @@ Example:
>>                        reset-names = "mpe";
>>                };
>>
>> -             vi {
>> -                     compatible = "nvidia,tegra20-vi";
>> -                     reg = <0x54080000 0x00040000>;
>> -                     interrupts = <0 69 0x04>;
>> -                     clocks = <&tegra_car TEGRA20_CLK_VI>;
>> -                     resets = <&tegra_car 100>;
>> -                     reset-names = "vi";
>> +             vi@54080000 {
>> +                     compatible = "nvidia,tegra210-vi";
>> +                     reg = <0x0 0x54080000 0x0 0x700>;
>> +                     interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
>> +                     assigned-clocks = <&tegra_car TEGRA210_CLK_VI>;
>> +                     assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_C4_OUT0>;
>> +
>> +                     clocks = <&tegra_car TEGRA210_CLK_VI>;
>> +                     power-domains = <&pd_venc>;
>> +
>> +                     #address-cells = <1>;
>> +                     #size-cells = <1>;
>> +
>> +                     ranges = <0x0 0x0 0x54080000 0x2000>;
>> +
>> +                     csi@838 {
>> +                             compatible = "nvidia,tegra210-csi";
>> +                             reg = <0x838 0x1300>;
>> +                             assigned-clocks = <&tegra_car TEGRA210_CLK_CILAB>,
>> +                                               <&tegra_car TEGRA210_CLK_CILCD>,
>> +                                               <&tegra_car TEGRA210_CLK_CILE>,
>> +                                               <&tegra_car TEGRA210_CLK_CSI_TPG>;
>> +                             assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_P>,
>> +                                                      <&tegra_car TEGRA210_CLK_PLL_P>,
>> +                                                      <&tegra_car TEGRA210_CLK_PLL_P>;
>> +                             assigned-clock-rates = <102000000>,
>> +                                                    <102000000>,
>> +                                                    <102000000>,
>> +                                                    <972000000>;
>> +
>> +                             clocks = <&tegra_car TEGRA210_CLK_CSI>,
>> +                                      <&tegra_car TEGRA210_CLK_CILAB>,
>> +                                      <&tegra_car TEGRA210_CLK_CILCD>,
>> +                                      <&tegra_car TEGRA210_CLK_CILE>,
>> +                                      <&tegra_car TEGRA210_CLK_CSI_TPG>;
>> +                             clock-names = "csi", "cilab", "cilcd", "cile", "csi_tpg";
>> +                             power-domains = <&pd_sor>;
>> +                     };
>>                };
>>
>>                epp {
> --
> Regards,
>
> Laurent Pinchart
