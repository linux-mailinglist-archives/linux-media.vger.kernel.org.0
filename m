Return-Path: <linux-media+bounces-31875-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1EAAACE6F
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 21:55:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F4C23BCEBC
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 19:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47D4F20E71D;
	Tue,  6 May 2025 19:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="m7HJo9jl"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740EF1FBCB1;
	Tue,  6 May 2025 19:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746561296; cv=none; b=igKSrEG6y6gErsF37Mm611x/LDoIITpWFA8bcJMKgthx5WazyXQUP1MFMLepzX4nAw2RzmuqjggG9CDcdl9uSMLAn+yvXzOw0m3+eZ2BYFqFYd9JLAKZSRqEfBPUa2vTMYuMgeHBay3ya42f4jeUs5O2yKYLHBxaYafpVCaD/Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746561296; c=relaxed/simple;
	bh=TX6fnqyOQLRCqud7L1fLcyM5ocSTEz2pblmDAnAzXbs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dKpgDmeDVQgqcNEQxUn7UAqMaAb3KhwUQV98FoPSN0BipgRwtZeO/uwboOnLWyyUkABpYUK/DGZvW+OA1NicFDe6cLzf21BFgA3Y6aA6kPTCXyY0TSTt/y4r22LX2eIxsCxVCKnPVlF2klpMyGUwhNFmLSXL/JQ4bOcks8K5qV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=m7HJo9jl; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746561292;
	bh=TX6fnqyOQLRCqud7L1fLcyM5ocSTEz2pblmDAnAzXbs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=m7HJo9jl86sLv4qpeTc+fxgIuJA6St3d9IyKACbTZaZC6aWIHO6SCnopb3UOR1HTf
	 LDl13EJMxzqGAz3J1wdnPXNK68paaGDnzQLhfbL8/IEhznNnrHp/VkeIv0WaDLSTYX
	 +iOuMFyVfxBmSWp+mzaO5hkMM707SKDij4F0hTegTHveJCMRXIw42+yGTNCefzvYmP
	 LhgTdC0f9v1sTf+e53HWJGNAkFqSfjZoOzRp/detfV1C6Zuxjdqbw9+ZkqVdhOr8do
	 8JCO++cM8Pt/3MURn4C9lN9JIskVvJs7huknkV2LCVDmXWhO33IJ7FtM/b0KTqFgzk
	 oIWV7O3oGfdIw==
Received: from [IPV6:2a05:1141:1cc:8600:1cd7:9a7e:17d7:cd2c] (unknown [IPv6:2a05:1141:1cc:8600:1cd7:9a7e:17d7:cd2c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4380E17E10D3;
	Tue,  6 May 2025 21:54:51 +0200 (CEST)
Message-ID: <82fd6088-2979-4a4b-8eb5-dd8da965369e@collabora.com>
Date: Tue, 6 May 2025 21:54:50 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/13] media: dt-bindings: add rockchip rk3568 mipi csi
 receiver
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
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
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>
References: <20240220-rk3568-vicap-v6-0-d2f5fbee1551@collabora.com>
 <20240220-rk3568-vicap-v6-5-d2f5fbee1551@collabora.com>
 <wxwzca4i36hdhdx5ehjqvq5ljpsb7lcvzermkhqyvufsr47au4@3qcth2vawwju>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <wxwzca4i36hdhdx5ehjqvq5ljpsb7lcvzermkhqyvufsr47au4@3qcth2vawwju>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mehdi,

On 5/6/25 14:09, Mehdi Djait wrote:
> Hi Michael,
> 
> thank you for the patch!
> 
> On Wed, Apr 30, 2025 at 11:15:54AM +0200, Michael Riesch via B4 Relay wrote:
>> From: Michael Riesch <michael.riesch@wolfvision.net>
>>
>> Add documentation for the Rockchip RK3568 MIPI CSI-2 Receiver.
>>
>> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
>> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
>> ---
>>  .../bindings/media/rockchip,rk3568-mipi-csi.yaml   | 113 +++++++++++++++++++++
>>  MAINTAINERS                                        |   1 +
>>  2 files changed, 114 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml
>> new file mode 100644
>> index 000000000000..d5004cb288dd
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml
>> @@ -0,0 +1,113 @@
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
>> +    const: rockchip,rk3568-mipi-csi
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  phys:
>> +    maxItems: 1
>> +    description: MIPI C-PHY or D-PHY.
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  resets:
>> +    maxItems: 1
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
> 
> shouldn't you add data-lanes property here ?

Yes, makes sense.

Thanks for pointing it out -- will be in v7.

Best regards,
Michael

> 
>                  data-lanes:
>                    minItems: 1
>                    maxItems: 4
>> +
>> +            required:
>> +              - bus-type
> 
> and add it to required:
>                  - data-lanes
> 
> you are actually checking for data-lanes when you enable the stream in:
> 
> rkcif-mipi-csi-receiver.c +226
> 
> 	u32 lanes = csi_dev->vep.bus.mipi_csi2.num_data_lanes;
> 
> 	if (lanes < 1 || lanes > 4)
> 		return -EINVAL;
> 
>> +
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: Output port connected to a RK3568 VICAP port.
>> +
>> +    required:
>> +      - port@0
>> +      - port@1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - phys
>> +  - phy-names
>> +  - ports
>> +  - power-domains
>> +  - resets
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/rk3568-cru.h>
>> +    #include <dt-bindings/power/rk3568-power.h>
>> +
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        csi: csi@fdfb0000 {
>> +            compatible = "rockchip,rk3568-mipi-csi";
>> +            reg = <0x0 0xfdfb0000 0x0 0x10000>;
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
> 
> --
> Kind Regards
> Mehdi Djait


