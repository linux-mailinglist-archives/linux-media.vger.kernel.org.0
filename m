Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A7EE5ED726
	for <lists+linux-media@lfdr.de>; Wed, 28 Sep 2022 10:09:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233938AbiI1IJr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Sep 2022 04:09:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233936AbiI1IJl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Sep 2022 04:09:41 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA1D2B4B9;
        Wed, 28 Sep 2022 01:09:37 -0700 (PDT)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28S7sRoI005109;
        Wed, 28 Sep 2022 10:09:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=zpp3fXmExbi4zuXL7G0pk9iHInFqa9wgnpuIripZZOY=;
 b=ZrjMK9k616bNbcptsOAzwBK/pJ3FzIzk93p26TXgvNFB8UEq4U86i4c5VBA+t5tD6ier
 tCRJuijTWMeRwcoCJ2xFb/7mA87nv8Jx91Afpp/yBrNJAdTL6ZBcKKo8SIu4S6ZwgLrM
 9clElgnyrLBKjKHxeJrj5Bp3CvOJ4Am7/ECAyQI97sYBhQTo7JZhGCoEH/nlY5t3YxX5
 q/wO43qG6uQlKcuNcSvnRgqkrwSZs3OA3IW2rjkw9Q2x1XYVoJP+OHfwCp1sTJ9KYvy9
 hQiYosfW5b20Bi1nGEGjDCefVu+BrBp0CuvVVyZ5wkpdTivD7YOU4mAAiDfo08fUJunb Rg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jsrsjqk3a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 28 Sep 2022 10:09:25 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 18EFF10002A;
        Wed, 28 Sep 2022 10:09:25 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 14814214D19;
        Wed, 28 Sep 2022 10:09:25 +0200 (CEST)
Received: from [10.252.26.214] (10.75.127.44) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Wed, 28 Sep
 2022 10:09:24 +0200
Message-ID: <9d2e9e86-f9fa-a019-8cb6-cf6ac9ee9ca8@foss.st.com>
Date:   Wed, 28 Sep 2022 10:09:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] dt-bindings: media: st,stmipid02: Convert the text
 bindings to YAML
Content-Language: en-US
To:     Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
CC:     Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20220927184657.291714-1-marex@denx.de>
From:   Benjamin MUGNIER <benjamin.mugnier@foss.st.com>
In-Reply-To: <20220927184657.291714-1-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-28_03,2022-09-27_01,2022-06-22_01
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marek,

Thank you for your patch.

On 9/27/22 20:46, Marek Vasut wrote:
> Convert the text STMIPID02 DT bindings to YAML DT format to permit
> validation of DTs using this I2C CSI-2 to CPI bridge.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>

Reviewed-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>


Regards,

Benjamin

> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sylvain Petinot <sylvain.petinot@foss.st.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
> V2: - Update YAML DT schema maintainers, add Benjamin and Sylvain, drop myself
>     - Update MAINTAINERS file, replace st,st-mipid02.txt to st,st-mipid02.yaml
>     - Fix bus-width to be 6,7,8,10,12 and drop default:
>     - Require port@2 and either or both port@0 or port@1
> ---
>  .../bindings/media/i2c/st,st-mipid02.txt      |  82 --------
>  .../bindings/media/i2c/st,st-mipid02.yaml     | 179 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 180 insertions(+), 83 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/st,st-mipid02.txt
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.txt b/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.txt
> deleted file mode 100644
> index 7976e6c40a80a..0000000000000
> --- a/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.txt
> +++ /dev/null
> @@ -1,82 +0,0 @@
> -STMicroelectronics MIPID02 CSI-2 to PARALLEL bridge
> -
> -MIPID02 has two CSI-2 input ports, only one of those ports can be active at a
> -time. Active port input stream will be de-serialized and its content outputted
> -through PARALLEL output port.
> -CSI-2 first input port is a dual lane 800Mbps per lane whereas CSI-2 second
> -input port is a single lane 800Mbps. Both ports support clock and data lane
> -polarity swap. First port also supports data lane swap.
> -PARALLEL output port has a maximum width of 12 bits.
> -Supported formats are RAW6, RAW7, RAW8, RAW10, RAW12, RGB565, RGB888, RGB444,
> -YUV420 8-bit, YUV422 8-bit and YUV420 10-bit.
> -
> -Required Properties:
> -- compatible: shall be "st,st-mipid02"
> -- clocks: reference to the xclk input clock.
> -- clock-names: shall be "xclk".
> -- VDDE-supply: sensor digital IO supply. Must be 1.8 volts.
> -- VDDIN-supply: sensor internal regulator supply. Must be 1.8 volts.
> -
> -Optional Properties:
> -- reset-gpios: reference to the GPIO connected to the xsdn pin, if any.
> -	       This is an active low signal to the mipid02.
> -
> -Required subnodes:
> -  - ports: A ports node with one port child node per device input and output
> -	   port, in accordance with the video interface bindings defined in
> -	   Documentation/devicetree/bindings/media/video-interfaces.txt. The
> -	   port nodes are numbered as follows:
> -
> -	   Port Description
> -	   -----------------------------
> -	   0    CSI-2 first input port
> -	   1    CSI-2 second input port
> -	   2    PARALLEL output
> -
> -Endpoint node required property for CSI-2 connection is:
> -- data-lanes: shall be <1> for Port 1. for Port 0 dual-lane operation shall be
> -<1 2> or <2 1>. For Port 0 single-lane operation shall be <1> or <2>.
> -Endpoint node optional property for CSI-2 connection is:
> -- lane-polarities: any lane can be inverted or not.
> -
> -Endpoint node required property for PARALLEL connection is:
> -- bus-width: shall be set to <6>, <7>, <8>, <10> or <12>.
> -Endpoint node optional properties for PARALLEL connection are:
> -- hsync-active: active state of the HSYNC signal, 0/1 for LOW/HIGH respectively.
> -LOW being the default.
> -- vsync-active: active state of the VSYNC signal, 0/1 for LOW/HIGH respectively.
> -LOW being the default.
> -
> -Example:
> -
> -mipid02: csi2rx@14 {
> -	compatible = "st,st-mipid02";
> -	reg = <0x14>;
> -	status = "okay";
> -	clocks = <&clk_ext_camera_12>;
> -	clock-names = "xclk";
> -	VDDE-supply = <&vdd>;
> -	VDDIN-supply = <&vdd>;
> -	ports {
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		port@0 {
> -			reg = <0>;
> -
> -			ep0: endpoint {
> -				data-lanes = <1 2>;
> -				remote-endpoint = <&mipi_csi2_in>;
> -			};
> -		};
> -		port@2 {
> -			reg = <2>;
> -
> -			ep2: endpoint {
> -				bus-width = <8>;
> -				hsync-active = <0>;
> -				vsync-active = <0>;
> -				remote-endpoint = <&parallel_out>;
> -			};
> -		};
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml b/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml
> new file mode 100644
> index 0000000000000..367f054fc5cb6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml
> @@ -0,0 +1,179 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/st,st-mipid02.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics MIPID02 CSI-2 to PARALLEL bridge
> +
> +maintainers:
> +  - Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> +  - Sylvain Petinot <sylvain.petinot@foss.st.com>
> +
> +description:
> +  MIPID02 has two CSI-2 input ports, only one of those ports can be
> +  active at a time. Active port input stream will be de-serialized
> +  and its content outputted through PARALLEL output port.
> +  CSI-2 first input port is a dual lane 800Mbps per lane whereas CSI-2
> +  second input port is a single lane 800Mbps. Both ports support clock
> +  and data lane polarity swap. First port also supports data lane swap.
> +  PARALLEL output port has a maximum width of 12 bits.
> +  Supported formats are RAW6, RAW7, RAW8, RAW10, RAW12, RGB565, RGB888,
> +  RGB444, YUV420 8-bit, YUV422 8-bit and YUV420 10-bit.
> +
> +properties:
> +  compatible:
> +    const: st,st-mipid02
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    description:
> +      Reference to the xclk input clock.
> +    items:
> +      - const: xclk
> +
> +  VDDE-supply:
> +    description:
> +      Sensor digital IO supply. Must be 1.8 volts.
> +
> +  VDDIN-supply:
> +    description:
> +      Sensor internal regulator supply. Must be 1.8 volts.
> +
> +  reset-gpios:
> +    description:
> +      Reference to the GPIO connected to the xsdn pin, if any.
> +      This is an active low signal to the mipid02.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: CSI-2 first input port
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                description:
> +                  Single-lane operation shall be <1> or <2> .
> +                  Dual-lane operation shall be <1 2> or <2 1> .
> +                minItems: 1
> +                maxItems: 2
> +              lane-polarity:
> +                description:
> +                  Any lane can be inverted or not.
> +                minItems: 1
> +                maxItems: 2
> +
> +            required:
> +              - data-lanes
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: CSI-2 second input port
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                description:
> +                  Single-lane operation shall be <1> or <2> .
> +                maxItems: 1
> +              lane-polarity:
> +                description:
> +                  Any lane can be inverted or not.
> +                maxItems: 1
> +
> +            required:
> +              - data-lanes
> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: Output port
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              bus-width:
> +                enum: [6, 7, 8, 10, 12]
> +              hsync-active: true
> +              vsync-active: true
> +
> +            required:
> +              - bus-width
> +
> +    anyOf:
> +      - required:
> +          - port@0
> +      - required:
> +          - port@1
> +
> +    required:
> +      - port@2
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - VDDE-supply
> +  - VDDIN-supply
> +  - ports
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        mipid02: csi2rx@14 {
> +            compatible = "st,st-mipid02";
> +            reg = <0x14>;
> +            status = "okay";
> +            clocks = <&clk_ext_camera_12>;
> +            clock-names = "xclk";
> +            VDDE-supply = <&vdd>;
> +            VDDIN-supply = <&vdd>;
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                port@0 {
> +                    reg = <0>;
> +
> +                    ep0: endpoint {
> +                        data-lanes = <1 2>;
> +                        remote-endpoint = <&mipi_csi2_in>;
> +                    };
> +                };
> +                port@2 {
> +                    reg = <2>;
> +
> +                    ep2: endpoint {
> +                        bus-width = <8>;
> +                        hsync-active = <0>;
> +                        vsync-active = <0>;
> +                        remote-endpoint = <&parallel_out>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a34ec41fbf7a9..0133f746fdf80 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19439,7 +19439,7 @@ M:	Sylvain Petinot <sylvain.petinot@foss.st.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  T:	git git://linuxtv.org/media_tree.git
> -F:	Documentation/devicetree/bindings/media/i2c/st,st-mipid02.txt
> +F:	Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml
>  F:	drivers/media/i2c/st-mipid02.c
>  
>  ST STM32 I2C/SMBUS DRIVER
