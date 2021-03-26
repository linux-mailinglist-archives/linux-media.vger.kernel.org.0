Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA86034A9B0
	for <lists+linux-media@lfdr.de>; Fri, 26 Mar 2021 15:27:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229908AbhCZO0o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Mar 2021 10:26:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229986AbhCZO0W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Mar 2021 10:26:22 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B6EEC0613AA;
        Fri, 26 Mar 2021 07:26:20 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: benjamin.gaignard)
        with ESMTPSA id 98B0A1F46FC8
Subject: Re: [PATCH v6 02/13] dt-bindings: media: nxp,imx8mq-vpu: Update the
 bindings for G2 support
To:     Philipp Zabel <pza@pengutronix.de>
Cc:     ezequiel@collabora.com, mchehab@kernel.org, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        lee.jones@linaro.org, gregkh@linuxfoundation.org,
        mripard@kernel.org, paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, hverkuil-cisco@xs4all.nl,
        emil.l.velikov@gmail.com, kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        kernel@collabora.com
References: <20210318082046.51546-1-benjamin.gaignard@collabora.com>
 <20210318082046.51546-3-benjamin.gaignard@collabora.com>
 <20210326141156.GA8441@pengutronix.de>
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
Message-ID: <3c23bfb0-eed4-63ad-be70-58aa129b0e35@collabora.com>
Date:   Fri, 26 Mar 2021 15:26:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326141156.GA8441@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Le 26/03/2021 à 15:11, Philipp Zabel a écrit :
> On Thu, Mar 18, 2021 at 09:20:35AM +0100, Benjamin Gaignard wrote:
>> Introducing G2 hevc video decoder lead to modify the bindings to allow
>> to get one node per VPUs.
>> VPUs share one hardware control block which is provided as a phandle on
>> an syscon.
>> Each node got now one reg and one interrupt.
>> Add a compatible for G2 hardware block: nxp,imx8mq-vpu-g2.
>>
>> To be compatible with older DT the driver is still capable to use 'ctrl'
>> reg-name even if it is deprecated now.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> ---
>> version 5:
>> - This version doesn't break the backward compatibilty between kernel
>>    and DT.
>>
>>   .../bindings/media/nxp,imx8mq-vpu.yaml        | 53 ++++++++++++-------
>>   1 file changed, 34 insertions(+), 19 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
>> index 762be3f96ce9..79502fc8bde5 100644
>> --- a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
>> +++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
>> @@ -15,22 +15,18 @@ description:
>>   
>>   properties:
>>     compatible:
>> -    const: nxp,imx8mq-vpu
>> +    oneOf:
>> +      - const: nxp,imx8mq-vpu
>> +      - const: nxp,imx8mq-vpu-g2
>>   
>>     reg:
>> -    maxItems: 3
>> -
>> -  reg-names:
>> -    items:
>> -      - const: g1
>> -      - const: g2
>> -      - const: ctrl
>> +    maxItems: 1
>>   
>>     interrupts:
>> -    maxItems: 2
>> +    maxItems: 1
>>   
>>     interrupt-names:
>> -    items:
>> +    oneOf:
>>         - const: g1
>>         - const: g2
>>   
>> @@ -46,14 +42,18 @@ properties:
>>     power-domains:
>>       maxItems: 1
>>   
>> +  nxp,imx8mq-vpu-ctrl:
>> +    description: Specifies a phandle to syscon VPU hardware control block
>> +    $ref: "/schemas/types.yaml#/definitions/phandle"
>> +
> Should we drop the 'q' here, i.e. nxp,imx8m-vpu-ctrl so we can use the same
> binding for i.MX8MM later?

I don't know if the control block is the same or not on IMX8MM, so I have only
put a compatible targeting IMX8MQ.

>
>>   required:
>>     - compatible
>>     - reg
>> -  - reg-names
>>     - interrupts
>>     - interrupt-names
>>     - clocks
>>     - clock-names
>> +  - nxp,imx8mq-vpu-ctrl
>>   
>>   additionalProperties: false
>>   
>> @@ -62,18 +62,33 @@ examples:
>>           #include <dt-bindings/clock/imx8mq-clock.h>
>>           #include <dt-bindings/interrupt-controller/arm-gic.h>
>>   
>> -        vpu: video-codec@38300000 {
>> +        vpu_ctrl: syscon@38320000 {
>> +                 compatible = "nxp,imx8mq-vpu-ctrl", "syscon";
>> +                 reg = <0x38320000 0x10000>;
>> +        };
>> +
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
>> +                interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
>> +                interrupt-names = "g1";
>> +                clocks = <&clk IMX8MQ_CLK_VPU_G1_ROOT>,
>> +                         <&clk IMX8MQ_CLK_VPU_G2_ROOT>,
> Does the G1 VPU require the G2 clock and vice versa?

Yes either the control hardware block won't work.

Benjamin

>
> regards
> Philipp
>
