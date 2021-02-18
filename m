Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 072C131ECA4
	for <lists+linux-media@lfdr.de>; Thu, 18 Feb 2021 18:05:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234082AbhBRQ5T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Feb 2021 11:57:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231172AbhBROtM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Feb 2021 09:49:12 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38AA6C061574;
        Thu, 18 Feb 2021 06:48:31 -0800 (PST)
Received: from [IPv6:2a01:e0a:4cb:a870:851a:1dfb:a143:80e] (unknown [IPv6:2a01:e0a:4cb:a870:851a:1dfb:a143:80e])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id BDA2E1F44926;
        Thu, 18 Feb 2021 14:48:28 +0000 (GMT)
Subject: Re: [PATCH v1 17/18] dt-bindings: media: nxp,imx8mq-vpu: Update
 bindings
To:     Rob Herring <robh@kernel.org>
Cc:     ezequiel@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, gregkh@linuxfoundation.org,
        mripard@kernel.org, paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, krzk@kernel.org, shengjiu.wang@nxp.com,
        adrian.ratiu@collabora.com, aisheng.dong@nxp.com, peng.fan@nxp.com,
        Anson.Huang@nxp.com, hverkuil-cisco@xs4all.nl,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        kernel@collabora.com
References: <20210217080306.157876-1-benjamin.gaignard@collabora.com>
 <20210217080306.157876-18-benjamin.gaignard@collabora.com>
 <20210217224839.GA2888647@robh.at.kernel.org>
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
Message-ID: <0a12de91-e6c9-642a-9c43-207041996c22@collabora.com>
Date:   Thu, 18 Feb 2021 15:48:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210217224839.GA2888647@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Le 17/02/2021 à 23:48, Rob Herring a écrit :
> On Wed, Feb 17, 2021 at 09:03:05AM +0100, Benjamin Gaignard wrote:
>> The introduction on HEVC decoder lead to update the bindings
>> to support it.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
>> Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
>> ---
>>   .../bindings/media/nxp,imx8mq-vpu.yaml        | 54 ++++++++++++-------
>>   1 file changed, 36 insertions(+), 18 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
>> index 762be3f96ce9..468435c70eef 100644
>> --- a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
>> +++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
>> @@ -15,24 +15,25 @@ description:
>>   
>>   properties:
>>     compatible:
>> -    const: nxp,imx8mq-vpu
>> +    enum:
>> +      - nxp,imx8mq-vpu
>> +      - nxp,imx8mq-vpu-g2
>>   
>>     reg:
>> -    maxItems: 3
>> +    maxItems: 1
>>   
>>     reg-names:
>> -    items:
>> -      - const: g1
>> -      - const: g2
>> -      - const: ctrl
>> +    enum:
>> +      - g1
>> +      - g2
> This isn't a compatible change. You need to state why that's okay if it
> is okay.

I will change the commit message to this in the next version:
The current bindings seem to make the assumption that the
two VPUs hardware blocks (G1 and G2) are only one set of
registers.
After implementing the VPU reset driver and G2 decoder driver
it shows that all the VPUs are independent and don't need to
know about the registers of the other blocks.
Remove from the bindings the need to set all blocks register
but keep reg-names property because removing it from the driver
may affect other variants.

Benjamin

>
>>   
>>     interrupts:
>> -    maxItems: 2
>> +    maxItems: 1
>>   
>>     interrupt-names:
>> -    items:
>> -      - const: g1
>> -      - const: g2
>> +    enum:
>> +      - g1
>> +      - g2
>>   
>>     clocks:
>>       maxItems: 3
>> @@ -46,6 +47,9 @@ properties:
>>     power-domains:
>>       maxItems: 1
>>   
>> +  resets:
>> +    maxItems: 1
>> +
>>   required:
>>     - compatible
>>     - reg
>> @@ -54,6 +58,7 @@ required:
>>     - interrupt-names
>>     - clocks
>>     - clock-names
>> +  - resets
>>   
>>   additionalProperties: false
>>   
>> @@ -61,19 +66,32 @@ examples:
>>     - |
>>           #include <dt-bindings/clock/imx8mq-clock.h>
>>           #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +        #include <dt-bindings/reset/imx8mq-vpu-reset.h>
>>   
>> -        vpu: video-codec@38300000 {
>> +        vpu_g1: video-codec@38300000 {
>>                   compatible = "nxp,imx8mq-vpu";
>> -                reg = <0x38300000 0x10000>,
>> -                      <0x38310000 0x10000>,
>> -                      <0x38320000 0x10000>;
>> -                reg-names = "g1", "g2", "ctrl";
>> -                interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
>> -                             <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
>> -                interrupt-names = "g1", "g2";
>> +                reg = <0x38300000 0x10000>;
>> +                reg-names = "g1";
>> +                interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
>> +                interrupt-names = "g1";
>> +                clocks = <&clk IMX8MQ_CLK_VPU_G1_ROOT>,
>> +                         <&clk IMX8MQ_CLK_VPU_G2_ROOT>,
>> +                         <&clk IMX8MQ_CLK_VPU_DEC_ROOT>;
>> +                clock-names = "g1", "g2", "bus";
>> +                power-domains = <&pgc_vpu>;
>> +                resets = <&vpu_reset IMX8MQ_RESET_VPU_RESET_G1>;
>> +        };
>> +
>> +        vpu_g2: video-codec@38310000 {
>> +                compatible = "nxp,imx8mq-vpu-g2";
>> +                reg = <0x38310000 0x10000>;
>> +                reg-names = "g2";
>> +                interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
>> +                interrupt-names = "g2";
>>                   clocks = <&clk IMX8MQ_CLK_VPU_G1_ROOT>,
>>                            <&clk IMX8MQ_CLK_VPU_G2_ROOT>,
>>                            <&clk IMX8MQ_CLK_VPU_DEC_ROOT>;
>>                   clock-names = "g1", "g2", "bus";
>>                   power-domains = <&pgc_vpu>;
>> +                resets = <&vpu_reset IMX8MQ_RESET_VPU_RESET_G2>;
>>           };
>> -- 
>> 2.25.1
>>
