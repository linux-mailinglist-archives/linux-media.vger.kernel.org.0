Return-Path: <linux-media+bounces-44059-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9713BBC836D
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 11:11:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 78DCD4EB012
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 09:11:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BA112D6409;
	Thu,  9 Oct 2025 09:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="m/mU67td"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F162D3EEB;
	Thu,  9 Oct 2025 09:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760000998; cv=none; b=sPi7Xvwz3LD3ikHRQUbn4rikSoWPboJHP5EmJ3p81OOu32Y469SAxC98HzL9agNv4ZJ0wxfy+VwWcAlqQ24EuScb62pYBqL2tTBSwA9YuG59x0UbRRd8QRXLdisnlPdWRCfYEAP9sWuGIUnqq073NjnotbYWrhmgTd2ixVhCenY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760000998; c=relaxed/simple;
	bh=AcqsttLfCgUKRY2r8lxvg8B5ELVPZ326fY9rGZgWLBk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VpTAi96kuGip5HaZC0E6yiwj6p/7LcIyOy1uJ0uKVfpBceYy+VpKGqqfsO9EDKRFOAUDZo5YuU0zn4gNV3KAZGx9CtKoQIht+mNd9ri4xxYKlWhPuXAEzO4bPFQ96vAqdEeIAhwPiSj4tjq+kzEivSyIOB848rkDgHhUUEc0Vjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=m/mU67td; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760000994;
	bh=AcqsttLfCgUKRY2r8lxvg8B5ELVPZ326fY9rGZgWLBk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=m/mU67tdjO3bz+vCLFSWfRxnNfwPHSAIihfAM8Vx/4cXTKE9Gwv5OyV7SsQ/uPFj4
	 sBs/NevXn8898ySOSvA1whDo/gxDWzOBnMpnxC6Grb51YuaI2Rf1G/d1GvoTp6XaIP
	 tMEBsH/6tNzydUa4b49Q5VRDA5YT7hqcSbHZXm5cS94ZiwKrCGIiTjBLUVlEwQOtJl
	 oi3dCJKUItFpqsEYUSOB5/M0GZTzD9KOz2UCAmVQWcy/bAbt2wR9LbLTiY3O90rhfF
	 w2bqDRewhtokrF2Q9EZwlMBuDxRf9dXMGy1ZHmcraumPgrUVX/1z91D83pcHMEP7qU
	 Grz/Igl6rgLWg==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1EC2B17E1060;
	Thu,  9 Oct 2025 11:09:53 +0200 (CEST)
Message-ID: <ed05be87-b1c5-4a73-8e68-521075eb080c@collabora.com>
Date: Thu, 9 Oct 2025 11:09:52 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 05/17] media: dt-bindings: add rockchip rk3568 mipi
 csi-2 receiver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Markus Elfring <Markus.Elfring@web.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Bryan O'Donoghue <bod@kernel.org>
References: <20240220-rk3568-vicap-v11-0-af0eada54e5d@collabora.com>
 <20240220-rk3568-vicap-v11-5-af0eada54e5d@collabora.com>
 <aOVxcQV-8c9m6Stg@kekkonen.localdomain>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <aOVxcQV-8c9m6Stg@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sakari,

On 10/7/25 22:00, Sakari Ailus wrote:
> Hi Michael,
> 
> On Wed, Sep 17, 2025 at 05:38:45PM +0200, Michael Riesch via B4 Relay wrote:
>> From: Michael Riesch <michael.riesch@collabora.com>
>>
>> Add documentation for the Rockchip RK3568 MIPI CSI-2 Receiver.
>>
>> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
>> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
>> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
>> ---
>>  .../bindings/media/rockchip,rk3568-mipi-csi.yaml   | 144 +++++++++++++++++++++
>>  MAINTAINERS                                        |   6 +
>>  2 files changed, 150 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml
>> new file mode 100644
>> index 000000000000..8cbab93b4b85
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml
>> @@ -0,0 +1,144 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Rockchip RK3568 MIPI CSI-2 Receiver
>> +
>> +maintainers:
>> +  - Michael Riesch <michael.riesch@collabora.com>
>> +
>> +description:
>> +  The Rockchip RK3568 MIPI CSI-2 Receiver is a CSI-2 bridge with one input port
>> +  and one output port. It receives the data with the help of an external
>> +  MIPI PHY (C-PHY or D-PHY) and passes it to the Rockchip RK3568 Video Capture
>> +  (VICAP) block.
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - items:
>> +          - enum:
>> +              - rockchip,rk3588-mipi-csi
>> +          - const: rockchip,rk3568-mipi-csi
>> +      - const: rockchip,rk3568-mipi-csi
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    items:
>> +      - description: Interrupt that signals changes in CSI2HOST_ERR1.
>> +      - description: Interrupt that signals changes in CSI2HOST_ERR2.
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: irq1
>> +      - const: irq2
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  phys:
>> +    maxItems: 1
>> +    description: MIPI C-PHY or D-PHY.
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        unevaluatedProperties: false
>> +        description: Input port node. Connect to e.g., a MIPI CSI-2 image sensor.
>> +
>> +        properties:
>> +          endpoint:
>> +            $ref: video-interfaces.yaml#
>> +            unevaluatedProperties: false
>> +
>> +            properties:
>> +              bus-type:
>> +                enum: [1, 4]
>> +
>> +              data-lanes:
>> +                minItems: 1
>> +                maxItems: 4
>> +
>> +            required:
>> +              - bus-type
>> +              - data-lanes
>> +
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: Output port connected to a RK3568 VICAP port.
> 
> As the VICAP port appears to be a DVP/Bt.565 receiver, also this output can
> presumably be connected elsewhere, too.

Not quite. One VICAP port is the DVP (and can receive BT.656, amongst
others), but there may be one or more ports that are connected to the
MIPI CSI-2 receiver(s). See the VICAP binding.

> Either way, aren't signal polarity or sampling related properties relevant
> here, too, and perhaps more so for the VICAP bindings?

No, I don't think so. This is some internal HW connection. No idea how
Rockchip glued the MIPI CSI-2 receiver(s) to the corresponding VICAP
port(s), and there is nothing one could tweak or adjust or configure...

Best regards,
Michael

> See e.g.
> Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml .
> 
>> +
>> +    required:
>> +      - port@0
>> +      - port@1
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - phys
>> +  - ports
>> +  - power-domains
>> +  - resets
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/rk3568-cru.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/media/video-interfaces.h>
>> +    #include <dt-bindings/power/rk3568-power.h>
>> +
>> +    soc {
>> +        interrupt-parent = <&gic>;
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        csi: csi@fdfb0000 {
>> +            compatible = "rockchip,rk3568-mipi-csi";
>> +            reg = <0x0 0xfdfb0000 0x0 0x10000>;
>> +            interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
>> +            interrupt-names = "irq1", "irq2";
>> +            clocks = <&cru PCLK_CSI2HOST1>;
>> +            phys = <&csi_dphy>;
>> +            power-domains = <&power RK3568_PD_VI>;
>> +            resets = <&cru SRST_P_CSI2HOST1>;
>> +
>> +            ports {
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +
>> +                csi_in: port@0 {
>> +                    reg = <0>;
>> +
>> +                    csi_input: endpoint {
>> +                        bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
>> +                        data-lanes = <1 2 3 4>;
>> +                        remote-endpoint = <&imx415_output>;
>> +                    };
>> +                };
>> +
>> +                csi_out: port@1 {
>> +                    reg = <1>;
>> +
>> +                    csi_output: endpoint {
>> +                        remote-endpoint = <&vicap_mipi_input>;
>> +                    };
>> +                };
>> +            };
>> +        };
>> +    };
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 4c39b9fd80bb..2ac4b7a5b255 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -21797,6 +21797,12 @@ F:	Documentation/userspace-api/media/v4l/metafmt-rkisp1.rst
>>  F:	drivers/media/platform/rockchip/rkisp1
>>  F:	include/uapi/linux/rkisp1-config.h
>>  
>> +ROCKCHIP MIPI CSI-2 RECEIVER DRIVER
>> +M:	Michael Riesch <michael.riesch@collabora.com>
>> +L:	linux-media@vger.kernel.org
>> +S:	Maintained
>> +F:	Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml
>> +
>>  ROCKCHIP RK3568 RANDOM NUMBER GENERATOR SUPPORT
>>  M:	Daniel Golle <daniel@makrotopia.org>
>>  M:	Aurelien Jarno <aurelien@aurel32.net>
>>
> 


