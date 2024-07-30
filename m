Return-Path: <linux-media+bounces-15567-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AF594120C
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 14:39:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5012B1F21A5A
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 12:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67C8919FA6B;
	Tue, 30 Jul 2024 12:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kHSaWT0D"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD422757FC;
	Tue, 30 Jul 2024 12:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722343140; cv=none; b=eq1P3mcoGSaT4IGOCKrr+Ae4dNFlAVbizeXa6ZR7G26qV5k5guOucwD6SqQqzjVW7FDOjWLBNvRBzPf9ufbdD+x7bxKd5/mI1e4Nc2DAgNJ5nGP/8sCwYph3jRwp7PJv3x3+Irxu+YoJWUM2exDNAQlZjUg++5I2A52Ytii8QAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722343140; c=relaxed/simple;
	bh=lFTKPbFHREQpS123d9Xfv3BiBZqxvIzz/vBQn9ZUMo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HEn/ygimz9Riu1n24P5gvqAEgXQnSt5n3O8nwsvHxg/Iz9MuhBK0LVmNBzk0TczdUPeXY22ldr036+FmxWaFGQ6EKfzdodMidH84qW5cotwuJX1MzDk3oZRK8IQdxBvrPj7uuvmbnz5nKXBdDFpCJZXxs/SPjJseBWiFyf3gGhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kHSaWT0D; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2E4E48A9;
	Tue, 30 Jul 2024 14:38:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722343090;
	bh=lFTKPbFHREQpS123d9Xfv3BiBZqxvIzz/vBQn9ZUMo8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kHSaWT0DxrWSgByUaApIi/7GpZMWCI4lvmojRXulYNTmJiZ3QRLATjgFuPvbqKI2H
	 cjss6CjhV6/GBXrVpliUa1qxg+ghKk5UeVClOiXbtJyxRM8EivEx/XKVeJj+F4UnPl
	 3ERdj+4TvugoQxoDRTtiwby3bvbIXfWtvz4L/ebQ=
Date: Tue, 30 Jul 2024 15:38:36 +0300
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
	Louis Kuo <louis.kuo@mediatek.com>,
	Phi-Bang Nguyen <pnguyen@baylibre.com>
Subject: Re: [PATCH v6 1/5] dt-bindings: media: add mediatek ISP3.0 sensor
 interface
Message-ID: <20240730123836.GK1552@pendragon.ideasonboard.com>
References: <20240729-add-mtk-isp-3-0-support-v6-0-c374c9e0c672@baylibre.com>
 <20240729-add-mtk-isp-3-0-support-v6-1-c374c9e0c672@baylibre.com>
 <92b18918-979d-43f6-890d-888caea08561@collabora.com>
 <2a01a1b2-4da7-42a2-b215-a32b53082290@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2a01a1b2-4da7-42a2-b215-a32b53082290@collabora.com>

Hi Angelo,

On Mon, Jul 29, 2024 at 05:08:35PM +0200, AngeloGioacchino Del Regno wrote:
> Il 29/07/24 16:57, AngeloGioacchino Del Regno ha scritto:
> > Il 29/07/24 16:48, Julien Stephan ha scritto:
> >> From: Louis Kuo <louis.kuo@mediatek.com>
> >>
> >> This adds the bindings, for the mediatek ISP3.0 SENINF module embedded in
> >> some Mediatek SoC, such as the mt8365
> >>
> >> Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
> >> Signed-off-by: Phi-Bang Nguyen <pnguyen@baylibre.com>
> >> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> >> ---
> >>   .../bindings/media/mediatek,mt8365-seninf.yaml     | 259 +++++++++++++++++++++
> >>   MAINTAINERS                                        |   7 +
> >>   2 files changed, 266 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.yaml 
> >> b/Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.yaml
> >> new file mode 100644
> >> index 000000000000..8bd78ef424ac
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.yaml
> >> @@ -0,0 +1,259 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +# Copyright (c) 2023 MediaTek, BayLibre
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/media/mediatek,mt8365-seninf.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: MediaTek Sensor Interface 3.0
> >> +
> > 
> > ..snip..
> > 
> >> +additionalProperties: false
> >> +
> >> +examples:
> >> +  - |
> >> +    #include <dt-bindings/clock/mediatek,mt8365-clk.h>
> >> +    #include <dt-bindings/interrupt-controller/irq.h>
> >> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> >> +    #include <dt-bindings/phy/phy.h>
> >> +    #include <dt-bindings/power/mediatek,mt8365-power.h>
> >> +
> >> +    soc {
> >> +        #address-cells = <2>;
> >> +        #size-cells = <2>;
> >> +
> >> +        csi@15040000 {
> >> +            compatible = "mediatek,mt8365-seninf";
> >> +            reg = <0 0x15040000 0 0x6000>;
> >> +            interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_LOW>;
> >> +            clocks = <&camsys CLK_CAM_SENIF>,
> >> +                     <&topckgen CLK_TOP_SENIF_SEL>;
> >> +            clock-names = "camsys", "top_mux";
> >> +
> >> +            power-domains = <&spm MT8365_POWER_DOMAIN_CAM>;
> >> +
> >> +            phys = <&mipi_csi0 PHY_TYPE_DPHY>, <&mipi_csi1>;
> >> +            phy-names = "csi0", "csi1";
> >> +
> >> +            ports {
> >> +                #address-cells = <1>;
> >> +                #size-cells = <0>;
> >> +
> >> +                port@0 {
> >> +                    reg = <0>;
> >> +                    seninf_in1: endpoint {
> >> +                        clock-lanes = <2>;
> >> +                        data-lanes = <1 3 0 4>;
> >> +                        remote-endpoint = <&isp1_out>;
> >> +                    };
> >> +                };
> >> +
> >> +                port@1 {
> >> +                    reg = <1>;
> >> +                };
> >> +
> >> +                port@2 {
> >> +                    reg = <2>;
> >> +                };
> >> +
> >> +                port@3 {
> >> +                    reg = <3>;
> >> +                };
> > 
> > I don't really get why you got all those empty ports here, as you could simply
> > avoid adding all of the empty nodes instead.
> > 
> > I don't have strong opinions about that anyway so, regardless of that....
> > 
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Wait a minute. No. The ports are all required?! Why?!

Because they exist at the hardware level, even if not all of them are
supported in drivers in this series. Ports 6 to 9, for instance, are
connected to ISPs that have no current mainline support, but they exist
in the hardware.

> >> +
> >> +                port@4 {
> >> +                    reg = <4>;
> >> +                    seninf_camsv1_endpoint: endpoint {
> >> +                        remote-endpoint = <&camsv1_endpoint>;
> >> +                    };
> >> +                };
> >> +
> >> +                port@5 {
> >> +                    reg = <5>;
> >> +                    seninf_camsv2_endpoint: endpoint {
> >> +                        remote-endpoint = <&camsv2_endpoint>;
> >> +                    };
> >> +                };
> >> +
> >> +                port@6 {
> >> +                    reg = <6>;
> >> +                };
> >> +
> >> +                port@7 {
> >> +                    reg = <7>;
> >> +                };
> >> +
> >> +                port@8 {
> >> +                    reg = <8>;
> >> +                };
> >> +
> >> +                port@9 {
> >> +                    reg = <9>;
> >> +                };
> >> +            };
> >> +        };
> >> +    };
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index d6c90161c7bf..6bd7df1c3e08 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -14158,6 +14158,13 @@ M:    Sean Wang <sean.wang@mediatek.com>
> >>   S:    Maintained
> >>   F:    drivers/char/hw_random/mtk-rng.c
> >> +MEDIATEK ISP3.0 DRIVER
> >> +M:    Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >> +M:    Julien Stephan <jstephan@baylibre.com>
> >> +M:    Andy Hsieh <andy.hsieh@mediatek.com>
> >> +S:    Supported
> >> +F:    Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.yaml
> >> +
> >>   MEDIATEK SMI DRIVER
> >>   M:    Yong Wu <yong.wu@mediatek.com>
> >>   L:    linux-mediatek@lists.infradead.org (moderated for non-subscribers)
> >>

-- 
Regards,

Laurent Pinchart

