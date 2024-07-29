Return-Path: <linux-media+bounces-15474-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A885393F8D4
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 16:57:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C80841C21B4C
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 14:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5176155A56;
	Mon, 29 Jul 2024 14:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QNksNyAl"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AED1149E09;
	Mon, 29 Jul 2024 14:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722265062; cv=none; b=q29vGscoa5r2DSkToTVVFO2GAQIjI8kxRJII7rb428mb2+P6D6OsmLsiX4wsQINsf03PUVagc2W3aX2kuyp5M3I6SB4KRZSdXk5ETvjwgpEv6atM9h1VrFxOpZ47m+ktoaqm0aWaBNJwiQkicUq7XYxL2wyddCt8qzwvNPhQEUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722265062; c=relaxed/simple;
	bh=rsbrbrY+ZojOsD44AFUkY+cL6nMTl1/dbKeOBbWPmgo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xya00Nu/DRH1Az7TcTsWib8CGa68sTdvbFDZL3y+hAcTbYXv+28Qw6fUA84SXSW9ghJbDJTe/3JQDkOAL9k3M879viMKIcQLYcANcVoIo+cxwXRvP0tz2INFKPlksP669W3sgRGtDpHA9wUoUfAlTAen+aQMq5etU1QvfdRWmV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QNksNyAl; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722265058;
	bh=rsbrbrY+ZojOsD44AFUkY+cL6nMTl1/dbKeOBbWPmgo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QNksNyAlvd4JeKhGKxbMriCXhVxsLpvaNwl0O6A92NX4TSl2ORV8mStSqCNhRuHup
	 Jvuira5ij7a3G989LUh5mXgMAUm47z0NqHYVuic0YvuitA7sRhbE1KZY2CIELAoOrS
	 nhyFJu70HeZhp0+esox5oNwr1jMy2/la6g3T8+uHOwnmRpIHXA3e8n1EmttbiSsSuz
	 qTJabTW7IV8YDzmJmBe9/xhgXEjuYX9V4tt0TvTzj22oC9iJihZ64dJjlP/JKmfMmb
	 dkvehD7EliKwA1v5QgIzMpQwgZalaeBlS69GWkmo2Dw6Fn/+zhlwg8dG/U3dGdlf2d
	 rdRwa87KK7ESg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2D9343780480;
	Mon, 29 Jul 2024 14:57:37 +0000 (UTC)
Message-ID: <ca502463-84d0-4c50-b684-f509bfe857fb@collabora.com>
Date: Mon, 29 Jul 2024 16:57:36 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] dt-bindings: media: add mediatek ISP3.0 camsv
To: Julien Stephan <jstephan@baylibre.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andy Hsieh <andy.hsieh@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Phi-bang Nguyen <pnguyen@baylibre.com>
References: <20240729-add-mtk-isp-3-0-support-v6-0-c374c9e0c672@baylibre.com>
 <20240729-add-mtk-isp-3-0-support-v6-2-c374c9e0c672@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240729-add-mtk-isp-3-0-support-v6-2-c374c9e0c672@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 29/07/24 16:48, Julien Stephan ha scritto:
> From: Phi-bang Nguyen <pnguyen@baylibre.com>
> 
> This adds the bindings, for the ISP3.0 camsv module embedded in
> some Mediatek SoC, such as the mt8365
> 
> Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>   .../bindings/media/mediatek,mt8365-camsv.yaml      | 109 +++++++++++++++++++++
>   MAINTAINERS                                        |   1 +
>   2 files changed, 110 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
> new file mode 100644
> index 000000000000..fdd076756459
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
> @@ -0,0 +1,109 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) 2023 MediaTek, BayLibre
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek,mt8365-camsv.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek CAMSV 3.0

Sorry, can we unroll the "CAMSV" acronym?

Is that CAMera Sensor V(what?) or anything similar?

Thanks,
Angelo

> +
> +maintainers:
> +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> +  - Julien Stephan <jstephan@baylibre.com>
> +  - Andy Hsieh <andy.hsieh@mediatek.com>
> +
> +description:
> +  The CAMSV is a video capture device that includes a DMA engine connected to
> +  the SENINF CSI-2 receivers. The number of CAMSVs depend on the SoC model.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8365-camsv
> +
> +  reg:
> +    items:
> +      - description: camsv base
> +      - description: img0 base
> +      - description: tg base
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: cam clock
> +      - description: camtg clock
> +      - description: camsv clock
> +
> +  clock-names:
> +    items:
> +      - const: cam
> +      - const: camtg
> +      - const: camsv
> +
> +  iommus:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Connection to the SENINF output
> +
> +    required:
> +      - port@0
> +
> +required:
> +  - compatible
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - iommus
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/clock/mediatek,mt8365-clk.h>
> +    #include <dt-bindings/memory/mediatek,mt8365-larb-port.h>
> +    #include <dt-bindings/power/mediatek,mt8365-power.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        camsv@15050000 {
> +            compatible = "mediatek,mt8365-camsv";
> +            reg = <0 0x15050000 0 0x0040>,
> +                  <0 0x15050208 0 0x0020>,
> +                  <0 0x15050400 0 0x0100>;
> +            interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_LOW>;
> +            clocks = <&camsys CLK_CAM>,
> +                     <&camsys CLK_CAMTG>,
> +                     <&camsys CLK_CAMSV0>;
> +            clock-names = "cam", "camtg", "camsv";
> +            iommus = <&iommu M4U_PORT_CAM_IMGO>;
> +            power-domains = <&spm MT8365_POWER_DOMAIN_CAM>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                port@0 {
> +                    reg = <0>;
> +                    camsv1_endpoint: endpoint {
> +                        remote-endpoint = <&seninf_camsv1_endpoint>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6bd7df1c3e08..9ac8c08ba692 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14163,6 +14163,7 @@ M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>   M:	Julien Stephan <jstephan@baylibre.com>
>   M:	Andy Hsieh <andy.hsieh@mediatek.com>
>   S:	Supported
> +F:	Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
>   F:	Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.yaml
>   
>   MEDIATEK SMI DRIVER
> 


