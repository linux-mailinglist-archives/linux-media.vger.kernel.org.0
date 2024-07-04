Return-Path: <linux-media+bounces-14666-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3E4927F1A
	for <lists+linux-media@lfdr.de>; Fri,  5 Jul 2024 00:52:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B79061F22BD4
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 22:52:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2514144306;
	Thu,  4 Jul 2024 22:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hGc9T6VS"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BB518AED;
	Thu,  4 Jul 2024 22:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720133547; cv=none; b=EKhiTWkO1o6dIGrjVaU9cIVixxrK8T74umJbNPasxIG8NJKze/vKeC4hTGVJhjt32pSZEBLBrLx4Hw3W0t5N4YhdR808HSDoj8iFeZJ1pZ0iVc8S/BKoIv+aOf8KXfHHDVDIq3o5TZzbrRaUFivOIdcEG8vJoFXNSHYKuwWvNHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720133547; c=relaxed/simple;
	bh=y3h2gKXI0vV9i7SOSp4xI9613pwuCp10bAPcjXEBKHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FqHcxriCfSlFLzSkRxSQsM5po+0nEMnRKlr0Nfdck90c/dLupGissSQxa8uOxMwP2TM0PTseENn3h+ZSJOKLwFXmoXqfb8Y8UliDfKqKa6QlyhjVQZta+rY0URObrrntKaPTtEgiEGvbFgcBXKmhRmuxSi2LisWrXNGqF4iGL20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hGc9T6VS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 788523A2;
	Fri,  5 Jul 2024 00:51:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1720133510;
	bh=y3h2gKXI0vV9i7SOSp4xI9613pwuCp10bAPcjXEBKHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hGc9T6VSPX4WRegWdrNNtNWqQE+iZY08IrUyP8rV9BuMI6rEilOJtMGOx5cBffN7+
	 3pZ8jmpXINXRxUixiMHS+/iQI3BG/BnxDxGPP2aL4Ck3ej88ZndpQ9A2WELPIV0bhv
	 xCXipUmTeO7jPssSQjx785zWKbHGvgCcskJRzVWk=
Date: Fri, 5 Jul 2024 01:51:56 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Conor Dooley <conor@kernel.org>
Cc: Julien Stephan <jstephan@baylibre.com>,
	Andy Hsieh <andy.hsieh@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Phi-bang Nguyen <pnguyen@baylibre.com>
Subject: Re: [PATCH v5 2/5] dt-bindings: media: add mediatek ISP3.0 camsv
Message-ID: <20240704225156.GE10099@pendragon.ideasonboard.com>
References: <20240704-add-mtk-isp-3-0-support-v5-0-bfccccc5ec21@baylibre.com>
 <20240704-add-mtk-isp-3-0-support-v5-2-bfccccc5ec21@baylibre.com>
 <20240704-unpopular-afraid-95f2cc570f14@spud>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240704-unpopular-afraid-95f2cc570f14@spud>

On Thu, Jul 04, 2024 at 05:29:59PM +0100, Conor Dooley wrote:
> On Thu, Jul 04, 2024 at 03:36:41PM +0200, Julien Stephan wrote:
> > From: Phi-bang Nguyen <pnguyen@baylibre.com>
> > 
> > This adds the bindings, for the ISP3.0 camsv module embedded in
> > some Mediatek SoC, such as the mt8365
> > 
> > Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
> > Link: https://lore.kernel.org/r/20230807094940.329165-4-jstephan@baylibre.com
> 
> Another confusing link tag, why is it here?
> 
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
> > +        camsv1: camsv@15050000 {
> 
> Didn't Krzysztof already comment about the node name here?
> Additionally, the "camsv1" label doest appear to be used, so should be
> dropped.

You're right about the label, it should be dropped. Regarding the name,
as far as I understand, Krzysztof was fine with specific names when no
generic alternative can be easily found, which I think is the case here.
If my understanding is incorrect, could someone help finding a better
name ?

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
> >  M:	Julien Stephan <jstephan@baylibre.com>
> >  M:	Andy Hsieh <andy.hsieh@mediatek.com>
> >  S:	Supported
> > +F:	Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
> >  F:	Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.yaml
> >  
> >  MEDIATEK SMI DRIVER


-- 
Regards,

Laurent Pinchart

