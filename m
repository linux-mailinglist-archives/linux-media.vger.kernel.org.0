Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C91DB6D3FD6
	for <lists+linux-media@lfdr.de>; Mon,  3 Apr 2023 11:14:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231843AbjDCJOi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Apr 2023 05:14:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231514AbjDCJOh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Apr 2023 05:14:37 -0400
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com [61.152.239.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40B4BA26A;
        Mon,  3 Apr 2023 02:14:33 -0700 (PDT)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
        (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
        by fd01.gateway.ufhost.com (Postfix) with ESMTP id 2965824E0EA;
        Mon,  3 Apr 2023 17:14:26 +0800 (CST)
Received: from EXMBX073.cuchost.com (172.16.6.83) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 3 Apr
 2023 17:14:26 +0800
Received: from [192.168.1.218] (180.164.60.184) by EXMBX073.cuchost.com
 (172.16.6.83) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 3 Apr
 2023 17:14:25 +0800
Message-ID: <b8d25a66-6464-78fe-b39b-ebb8a7f1a99c@starfivetech.com>
Date:   Mon, 3 Apr 2023 17:14:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v3 1/9] media: dt-bindings: Add bindings for JH7110 Camera
 Subsystem
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        "Todor Tomov" <todor.too@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Eugen Hristev <eugen.hristev@collabora.com>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <changhuang.liang@starfivetech.com>
References: <20230331121826.96973-1-jack.zhu@starfivetech.com>
 <20230331121826.96973-2-jack.zhu@starfivetech.com>
 <91874e63-553f-ced5-ce32-309ac2ebf6e5@linaro.org>
From:   Jack Zhu <jack.zhu@starfivetech.com>
In-Reply-To: <91874e63-553f-ced5-ce32-309ac2ebf6e5@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX073.cuchost.com
 (172.16.6.83)
X-YovoleRuleAgent: yovoleflag
X-Spam-Status: No, score=-1.4 required=5.0 tests=NICE_REPLY_A,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 2023/4/1 4:09, Krzysztof Kozlowski wrote:
> On 31/03/2023 14:18, Jack Zhu wrote:
>> Add the bindings documentation for Starfive JH7110 Camera Subsystem
>> which is used for handing image sensor data.
>> 
>> Signed-off-by: Jack Zhu <jack.zhu@starfivetech.com>
>> ---
>>  .../bindings/media/starfive,jh7110-camss.yaml | 159 ++++++++++++++++++
>>  MAINTAINERS                                   |   7 +
>>  2 files changed, 166 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/media/starfive,jh7110-camss.yaml
>> 
>> diff --git a/Documentation/devicetree/bindings/media/starfive,jh7110-camss.yaml b/Documentation/devicetree/bindings/media/starfive,jh7110-camss.yaml
>> new file mode 100644
>> index 000000000000..0235c70e7793
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/starfive,jh7110-camss.yaml
>> @@ -0,0 +1,159 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/starfive,jh7110-camss.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Starfive SoC CAMSS ISP
>> +
>> +maintainers:
>> +  - Jack Zhu <jack.zhu@starfivetech.com>
>> +  - Changhuang Liang <changhuang.liang@starfivetech.com>
>> +
>> +description:
>> +  The Starfive CAMSS ISP is a Camera interface for Starfive JH7110 SoC. It
>> +  consists of a VIN controller (Video In Controller, a top-level control until)
>> +  and an ISP.
>> +
>> +properties:
>> +  compatible:
>> +    const: starfive,jh7110-camss
>> +
>> +  reg:
>> +    maxItems: 2
>> +
>> +  reg-names:
>> +    items:
>> +      - const: syscon
>> +      - const: isp
>> +
>> +  clocks:
>> +    maxItems: 7
>> +
>> +  clock-names:
>> +    items:
>> +      - const: apb_func
>> +      - const: wrapper_clk_c
>> +      - const: dvp_inv
>> +      - const: axiwr
>> +      - const: mipi_rx0_pxl
>> +      - const: ispcore_2x
>> +      - const: isp_axi
>> +
>> +  resets:
>> +    maxItems: 6
>> +
>> +  reset-names:
>> +    items:
>> +      - const: wrapper_p
>> +      - const: wrapper_c
>> +      - const: axird
>> +      - const: axiwr
>> +      - const: isp_top_n
>> +      - const: isp_top_axi
>> +
>> +  power-domains:
>> +    items:
>> +      - description: JH7110 ISP Power Domain Switch Controller.
>> +
>> +  interrupts:
>> +    maxItems: 4
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        unevaluatedProperties: false
>> +        description:
>> +          Input port for receiving DVP data.
>> +
>> +        properties:
>> +          endpoint:
>> +            $ref: video-interfaces.yaml#
> 
> I don't think we use video-interfaces with port. Are you sure this works
> fine? Please extend the example with appropriate properties to check...
> 
Thank you for your review.
the following change, is it OK?

endpoint:
            $ref: video-interfaces.yaml#
            unevaluatedProperties: false
            
            properties:
              bus-width:
                const: 8

              data-shift:
                const: 2

in example:
	port@0 {
                reg = <0>;
                vin_from_sc2235: endpoint {
                    remote-endpoint = <&sc2235_to_vin>;
                    bus-width = <8>;
                    data-shift = <2>;
                    hsync-active = <1>;
                    vsync-active = <0>;
                    pclk-sample = <1>;
                };
	};


>> +            unevaluatedProperties: false
>> +
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        unevaluatedProperties: false
>> +        description:
>> +          Input port for receiving CSI data.
>> +
>> +        properties:
>> +          endpoint:
>> +            $ref: video-interfaces.yaml#
>> +            unevaluatedProperties: false
> 
> Same concerns here.
> 
for port@1, We don't use any properties as the allwinner,sun6i-a31-isp.yaml file.
Use the following modification, I don't know if it is ok?

port@1:
        $ref: /schemas/graph.yaml#/properties/port
        description: Input port for receiving CSI data.
> 
> Best regards,
> Krzysztof
> 
