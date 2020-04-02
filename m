Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58F0919C48E
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2020 16:43:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388266AbgDBOmv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Apr 2020 10:42:51 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:43884 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726927AbgDBOmv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Apr 2020 10:42:51 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id B456128CF7C
Subject: Re: [PATCH 2/4] dt-bindings: media: rkisp1: move rockchip-isp1
 bindings out of staging
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     dafna.hirschfeld@collabora.com, devel@driverdev.osuosl.org,
        devicetree@vger.kernel.org, ezequiel@collabora.com,
        heiko@sntech.de, hverkuil-cisco@xs4all.nl,
        karthik.poduval@gmail.com, kernel@collabora.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, mark.rutland@arm.com,
        robh+dt@kernel.org
References: <20200402000234.226466-3-helen.koike@collabora.com>
 <7e53ec1e-33bd-3385-40a0-de3fd00ad1a1@gmail.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <faacd068-e722-4fa8-efab-c51c723b75c1@collabora.com>
Date:   Thu, 2 Apr 2020 11:42:39 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <7e53ec1e-33bd-3385-40a0-de3fd00ad1a1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Johan,

Thanks for your review.

On 4/2/20 8:35 AM, Johan Jonker wrote:
> Hi Helen,
> 
>> # SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> %YAML 1.2
>> ---
>> $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> $schema: http://devicetree.org/meta-schemas/core.yaml#
>>
> 
>> title: Rockchip SoC Image Signal Processing unit v1
> 
> Where do we need 'v1' for? Is there a 'v2'?

ISPv1 is the Rockchip's name for the IP block.

> 
>>
>> maintainers:
>>   - Helen Koike <helen.koike@collabora.com>
>>
>> description: |
>>   Rockchip ISP1 is the Camera interface for the Rockchip series of SoCs
>>   which contains image processing, scaling, and compression functions.
>>
>> properties:
>>   compatible:
>>     const: rockchip,rk3399-cif-isp
>>
>>   reg:
>>     maxItems: 1
>>
>>   interrupts:
>>     maxItems: 1
>>
>>   iommus:
>>     maxItems: 1
>>
>>   power-domains:
>>     maxItems: 1
>>
>>   phys:
>>     maxItems: 1
>>     description: phandle for the PHY port
>>
>>   phy-names:
>>     const: dphy
>>
>>   clocks:
>>     items:
>>       - description: ISP clock
>>       - description: ISP AXI clock clock
>>       - description: ISP AXI clock  wrapper clock
>>       - description: ISP AHB clock clock
>>       - description: ISP AHB wrapper clock
>>
>>   clock-names:
>>     items:
>>       - const: clk_isp
>>       - const: aclk_isp
>>       - const: aclk_isp_wrap
>>       - const: hclk_isp
>>       - const: hclk_isp_wrap
>>
>>   # See ./video-interfaces.txt for details
>>   ports:
>>     type: object
>>     additionalProperties: false
>>
>>     properties:
>>       "#address-cells":
>>         const: 1
>>
>>       "#size-cells":
>>         const: 0
>>
>>       port@0:
>>         type: object
>>         description: connection point for sensors at MIPI-DPHY RX0
> 
>>         additionalProperties: false
> 
> Nothing required here?

I was thinking that if there is no endpoint, then nothing is required.
But if there is, then #address-cells, #size-cells and reg are. I guess
I can just add them as required.

I'll add it in the patchseries.

> 
>>
>>         properties:
>>           "#address-cells":
>>             const: 1
>>
>>           "#size-cells":
>>             const: 0
>>
>>           reg:
>>             const: 0
>>
>>         patternProperties:
>>           endpoint:
>>             type: object
>>             additionalProperties: false
>>
>>             properties:
>>               reg:
>>                 maxItems: 1
>>
>>               data-lanes:
>>                 minItems: 1
>>                 maxItems: 4
>>
>>               remote-endpoint: true
>>
>>     required:
> 
>>       - port@0
> 
> The use of '@0' makes "#address-cells" and "#size-cells" also a requirement.
> 
> - "#address-cells"
> - "#size-cells"

Ok, I'll add it.

> 
>>
>> required:
>>   - compatible
> 
> How about 'reg'?
> 
> - reg

ack, I'll add another patch in the series fixing this.

> 
>>   - interrupts
>>   - clocks
>>   - clock-names
>>   - power-domains
>>   - iommus
>>   - phys
>>   - phy-names
>>   - ports
>>
>> additionalProperties: false
>>
>> examples:
>>   - |
>>
>>     #include <dt-bindings/clock/rk3399-cru.h>
>>     #include <dt-bindings/interrupt-controller/arm-gic.h>
>>     #include <dt-bindings/power/rk3399-power.h>
>>
>>     parent0: parent@0 {
>>         #address-cells = <2>;
>>         #size-cells = <2>;
>>
>>         isp0: isp0@ff910000 {
>>             compatible = "rockchip,rk3399-cif-isp";
>>             reg = <0x0 0xff910000 0x0 0x4000>;
>>             interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH 0>;
>>             clocks = <&cru SCLK_ISP0>,
>>                      <&cru ACLK_ISP0>, <&cru ACLK_ISP0_WRAPPER>,
>>                      <&cru HCLK_ISP0>, <&cru HCLK_ISP0_WRAPPER>;
>>             clock-names = "clk_isp",
>>                           "aclk_isp", "aclk_isp_wrap",
>>                           "hclk_isp", "hclk_isp_wrap";
>>             power-domains = <&power RK3399_PD_ISP0>;
>>             iommus = <&isp0_mmu>;
>>             phys = <&dphy>;
>>             phy-names = "dphy";
>>
>>             ports {
>>                 #address-cells = <1>;
>>                 #size-cells = <0>;
>>
>>                 port@0 {
>>                     #address-cells = <1>;
>>                     #size-cells = <0>;
>>                     reg = <0>;
>>
>>                     mipi_in_wcam: endpoint@0 {
>>                         reg = <0>;
>>                         remote-endpoint = <&wcam_out>;
>>                         data-lanes = <1 2>;
>>                     };
>>
>>                     mipi_in_ucam: endpoint@1 {
>>                         reg = <1>;
>>                         remote-endpoint = <&ucam_out>;
>>                         data-lanes = <1>;
>>                     };
>>                 };
>>             };
>>         };
>>
> 
>>         i2c7: i2c@ff160000 {
>>             clock-frequency = <400000>;
>>             #address-cells = <1>;
>>             #size-cells = <0>;
> 
> Incomplete example.
> From i2c-rk3x.yaml:
> 
> required:
>   - compatible
>   - reg
>   - interrupts
>   - clocks
>   - clock-names

The idea was to exemplify how to connect to the sensor nodes below.
But I don't see a problem adding a complete i2c example, I'll add it.

Thanks
Helen

> 
>>
>>             wcam: camera@36 {
>>                 compatible = "ovti,ov5695";
>>                 reg = <0x36>;
>>
>>                 port {
>>                     wcam_out: endpoint {
>>                         remote-endpoint = <&mipi_in_wcam>;
>>                         data-lanes = <1 2>;
>>                     };
>>                 };
>>             };
>>
>>             ucam: camera@3c {
>>                 compatible = "ovti,ov2685";
>>                 reg = <0x3c>;
>>
>>                   port {
>>                       ucam_out: endpoint {
>>                           remote-endpoint = <&mipi_in_ucam>;
>>                           data-lanes = <1>;
>>                       };
>>                   };
>>             };
>>         };
>>     };
