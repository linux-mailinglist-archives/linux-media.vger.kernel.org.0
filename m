Return-Path: <linux-media+bounces-6274-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2829086EB8A
	for <lists+linux-media@lfdr.de>; Fri,  1 Mar 2024 22:59:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4963D1C2144F
	for <lists+linux-media@lfdr.de>; Fri,  1 Mar 2024 21:59:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E27E65917C;
	Fri,  1 Mar 2024 21:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KYkuHNZB"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6EE54273;
	Fri,  1 Mar 2024 21:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709330338; cv=none; b=Ck/07dE1OoY+NFBgrhoA05bwB6Nc8FRAAQYDK+JdlsKjqmvhs/lmsLc1mfXFyVWpatTRjsGi5vpaXS7Zv5l7FIMP77zR6A/hqzYGHSYO6wTmRMutj3kmrfIrFR7JbxufLPBw3+dB9DGmjJ/5O/dnI+oqMkHlmV6vXTnAir5rJL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709330338; c=relaxed/simple;
	bh=rpzufhBBWlnizeYu1YPoPTlBU0W7X0rYNgxoUx78zaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D9ks7LSYrs2afRZxD6rbFQ7bBiRmccEFVkE5FbyMkEBxwRArVjyu6TYisGGo4bgOHYS8mYXh6Y7Cutc5MJed/oE4a9x6pvbFrXDeDAjJjtyZol7HZukL4xMDGy+V/9dA6RSzEo1WICixE5+KD00A3mUR7HyTJ8Cd5jSVqN953qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KYkuHNZB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6405E673;
	Fri,  1 Mar 2024 22:58:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1709330320;
	bh=rpzufhBBWlnizeYu1YPoPTlBU0W7X0rYNgxoUx78zaU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KYkuHNZBS1+Vj5TCndthQQr4jD+3GRr1gTOwYfdsCdmbieLEqQK37UPIc3P1gtBrv
	 PCzGDn3FkQJcYcKHoDW0A3U6QKapE18Ad+eBRraIoTO9gjCB8OxLkDuVd9XrXk+W4Z
	 IDEfn4nMSbDR2ZWqMh9iMCEGuAiyiLKHV9sP0XB0=
Date: Fri, 1 Mar 2024 23:58:57 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Plowman <david.plowman@raspberrypi.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 7/9] media: dt-bindings: Add bindings for Raspberry Pi
 PiSP Back End
Message-ID: <20240301215857.GO30889@pendragon.ideasonboard.com>
References: <20240223163012.300763-1-jacopo.mondi@ideasonboard.com>
 <20240223163012.300763-8-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240223163012.300763-8-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Fri, Feb 23, 2024 at 05:30:09PM +0100, Jacopo Mondi wrote:
> Add bindings for the Raspberry Pi PiSP Back End memory-to-memory image
> signal processor.
> 
> Datasheet:
> https://datasheets.raspberrypi.com/camera/raspberry-pi-image-signal-processor-specification.pdf
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  .../bindings/media/raspberrypi,pispbe.yaml    | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml b/Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml
> new file mode 100644
> index 000000000000..d7839f32eabf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/raspberrypi,pispbe.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Raspberry Pi PiSP Image Signal Processor (ISP) Back End
> +
> +maintainers:
> +  - Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
> +  - Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> +
> +description: |
> +  The Raspberry Pi PiSP Image Signal Processor (ISP) Back End is an image
> +  processor that fetches images in Bayer or Grayscale format from DRAM memory
> +  in tiles and produces images consumable by application.

s/application/applications/

> +
> +  The full ISP documentation is available at:

s/:$//

> +  https://datasheets.raspberrypi.com/camera/raspberry-pi-image-signal-processor-specification.pdf
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - brcm,bcm2712-pispbe
> +      - const: raspberrypi,pispbe
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1

As this is a SoC IP with only memory and register interfaces, I would
expect two clocks to be present, one for the register interface (AHB ?
AXI4-Lite ?) and one for the memory interfaces (AXI4 ?). While the
register interface clock is likely always enabled (in all cases that
matter in practice) in the BCM2712, I'm not sure this can be guaranteed
for future integration in different SoCs. Should we plan for this, and
either define two clocks already (with one of them being optional), or
name the single clock ?

I know v1 named this clock "isp_be", and the name was dropped upon
Krzysztof's request, but I think naming the single clock "axi" or "aclk"
(assuming that one of them would be the right name) would be fine for
the reason explained above.

> +
> +  iommus:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        isp@880000  {
> +             compatible = "brcm,bcm2712-pispbe", "raspberrypi,pispbe";
> +             reg = <0x10 0x00880000  0x0 0x4000>;

Double space, I don't know if that's on purpose.

> +             interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
> +             clocks = <&firmware_clocks 7>;
> +             iommus = <&iommu2>;
> +        };
> +    };

-- 
Regards,

Laurent Pinchart

