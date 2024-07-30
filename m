Return-Path: <linux-media+bounces-15568-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D3794127C
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 14:51:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 920661C22FA0
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 12:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75A861AB502;
	Tue, 30 Jul 2024 12:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="blImoJAI"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B9B1A072B;
	Tue, 30 Jul 2024 12:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722343615; cv=none; b=L+5DqSOJVBaRBfdn/bPIJvh1FxDofm7Bc9CeTFNRvdS4PgAQJmxyrMzK+Q/dqvrKn1ow02kwJ9Se0BBgRoxnOvBmy6nBitG79/mm11c/BBHM9/ShNt7AiuNT9GFzh2fBtIO5owl9J5s3FLT7SBiRET6VSDUfCJGNPFW16N5k4d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722343615; c=relaxed/simple;
	bh=rLth2rt6HbHw+vgytlfn4FpXMSOett+WFGgp6FMxcCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z/Gt4w4FNjPDwGWJJrFJYuwqFSWbWc49mXzsvSvJcogJ1t0xYf6ksYyKr9HKngc6aIrlubaOEidhiDlMcL2kPN08Cp03bO8/6dgYFS2n4JaMf1HS7DBMTcDbZ5xtrzmro5gMW7hbSjWaYjC0K2tt+tOJMfCBneQ3wSqArMvkUZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=blImoJAI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 658FF743;
	Tue, 30 Jul 2024 14:46:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722343565;
	bh=rLth2rt6HbHw+vgytlfn4FpXMSOett+WFGgp6FMxcCk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=blImoJAI1q7mdYLHT/paJNKgz8FHY6RfIBFI8ZdV/Lj7ZS/E/SvVfJrTx6oWvz9np
	 qtGcfuuntpybL5WOKReAzI69xrTmsqW/aDdjF7dXr1spl4FSWoyr2fbRfC8HzKMvfa
	 R8Erc9FpG5taZkQrhC4EnjSDIWBiU351qJRK6yJ0=
Date: Tue, 30 Jul 2024 15:46:31 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Julien Stephan <jstephan@baylibre.com>,
	Andy Hsieh <andy.hsieh@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Phi-bang Nguyen <pnguyen@baylibre.com>
Subject: Re: [PATCH v6 2/5] dt-bindings: media: add mediatek ISP3.0 camsv
Message-ID: <20240730124631.GL1552@pendragon.ideasonboard.com>
References: <20240729-add-mtk-isp-3-0-support-v6-0-c374c9e0c672@baylibre.com>
 <20240729-add-mtk-isp-3-0-support-v6-2-c374c9e0c672@baylibre.com>
 <ca502463-84d0-4c50-b684-f509bfe857fb@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ca502463-84d0-4c50-b684-f509bfe857fb@collabora.com>

On Mon, Jul 29, 2024 at 04:57:36PM +0200, AngeloGioacchino Del Regno wrote:
> Il 29/07/24 16:48, Julien Stephan ha scritto:
> > From: Phi-bang Nguyen <pnguyen@baylibre.com>
> > 
> > This adds the bindings, for the ISP3.0 camsv module embedded in
> > some Mediatek SoC, such as the mt8365
> > 
> > Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
> > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > ---
> >   .../bindings/media/mediatek,mt8365-camsv.yaml      | 109 +++++++++++++++++++++
> >   MAINTAINERS                                        |   1 +
> >   2 files changed, 110 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
> > new file mode 100644
> > index 000000000000..fdd076756459
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
> > @@ -0,0 +1,109 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +# Copyright (c) 2023 MediaTek, BayLibre
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/mediatek,mt8365-camsv.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MediaTek CAMSV 3.0
> 
> Sorry, can we unroll the "CAMSV" acronym?
> 
> Is that CAMera Sensor V(what?) or anything similar?

If someone can tell us what CAMSV stands for, yes :-) I don't know
personally, and I don't think Julien knows either.

> > +
> > +maintainers:
> > +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > +  - Julien Stephan <jstephan@baylibre.com>
> > +  - Andy Hsieh <andy.hsieh@mediatek.com>
> > +
> > +description:
> > +  The CAMSV is a video capture device that includes a DMA engine connected to
> > +  the SENINF CSI-2 receivers. The number of CAMSVs depend on the SoC model.
> > +
> > +properties:
> > +  compatible:
> > +    const: mediatek,mt8365-camsv
> > +
> > +  reg:
> > +    items:
> > +      - description: camsv base
> > +      - description: img0 base
> > +      - description: tg base
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: cam clock
> > +      - description: camtg clock
> > +      - description: camsv clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: cam
> > +      - const: camtg
> > +      - const: camsv
> > +
> > +  iommus:
> > +    maxItems: 1
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Connection to the SENINF output
> > +
> > +    required:
> > +      - port@0
> > +
> > +required:
> > +  - compatible
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +  - power-domains
> > +  - iommus
> > +  - ports
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/clock/mediatek,mt8365-clk.h>
> > +    #include <dt-bindings/memory/mediatek,mt8365-larb-port.h>
> > +    #include <dt-bindings/power/mediatek,mt8365-power.h>
> > +
> > +    soc {
> > +        #address-cells = <2>;
> > +        #size-cells = <2>;
> > +
> > +        camsv@15050000 {
> > +            compatible = "mediatek,mt8365-camsv";
> > +            reg = <0 0x15050000 0 0x0040>,
> > +                  <0 0x15050208 0 0x0020>,
> > +                  <0 0x15050400 0 0x0100>;
> > +            interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_LOW>;
> > +            clocks = <&camsys CLK_CAM>,
> > +                     <&camsys CLK_CAMTG>,
> > +                     <&camsys CLK_CAMSV0>;
> > +            clock-names = "cam", "camtg", "camsv";
> > +            iommus = <&iommu M4U_PORT_CAM_IMGO>;
> > +            power-domains = <&spm MT8365_POWER_DOMAIN_CAM>;
> > +
> > +            ports {
> > +                #address-cells = <1>;
> > +                #size-cells = <0>;
> > +                port@0 {
> > +                    reg = <0>;
> > +                    camsv1_endpoint: endpoint {
> > +                        remote-endpoint = <&seninf_camsv1_endpoint>;
> > +                    };
> > +                };
> > +            };
> > +        };
> > +    };
> > +...
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 6bd7df1c3e08..9ac8c08ba692 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -14163,6 +14163,7 @@ M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >   M:	Julien Stephan <jstephan@baylibre.com>
> >   M:	Andy Hsieh <andy.hsieh@mediatek.com>
> >   S:	Supported
> > +F:	Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
> >   F:	Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.yaml
> >   
> >   MEDIATEK SMI DRIVER

-- 
Regards,

Laurent Pinchart

