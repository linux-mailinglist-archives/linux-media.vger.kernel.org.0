Return-Path: <linux-media+bounces-24205-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0169FF7B5
	for <lists+linux-media@lfdr.de>; Thu,  2 Jan 2025 10:56:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5038E1623EC
	for <lists+linux-media@lfdr.de>; Thu,  2 Jan 2025 09:56:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66A6D1AAA10;
	Thu,  2 Jan 2025 09:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vN7C9aQl"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B72A1A8F94;
	Thu,  2 Jan 2025 09:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735811763; cv=none; b=jCgeJI87fpkahsaqPeQjkVjGJof6QnvegH+HklmqPMUYMPvpDz+6ZQLbERVIBrqAwaEe+ghAATyedeqGGKe65CPZmFasYvVQis3MNgM+CHfKBYLHN7UWsFHEZpzOP85tRFMdUe2TwpOw5bJeZ7isjxwXuyKQeh8gjLxaLIPPjjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735811763; c=relaxed/simple;
	bh=SwKcsYldoVTlPiegaDxvUarCv6o2PSToU5HzUy3D6TA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Is6CSakHkacZz5SE3ws+prY1RcJmtkDd3tUTZh1np3HNt3rjAt9UextnRyCXqfHA45yeLPoI9Al8BJM3bjcNTBp8o/SUAYaBGKvXsg39U7LLmuspVycyAv6WIs0adX6dstJ0fCu5ILEfiiz+PGT8NTKMfWRKFedWfl2LSGRxMvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vN7C9aQl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DA94575A;
	Thu,  2 Jan 2025 10:55:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1735811712;
	bh=SwKcsYldoVTlPiegaDxvUarCv6o2PSToU5HzUy3D6TA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vN7C9aQlcBOVibGqhImQTW0YgjW3fNP6LtVD1Sp7FgEGQCE8vvIWTmq8TqO3AQPJu
	 +w2EqvPVvUBaQ5Es3IZqOpQ4gPFfpAii6kRK+jXnuiOigSsnvIdNI8oDvC6wjjoL8p
	 V6mFSjKwH30ky85452xP0lDSq+w3fQ1zD+0gis6E=
Date: Thu, 2 Jan 2025 11:56:00 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v12 2/8] dt-bindings: media: platform: visconti: Add
 Toshiba Visconti Video Input Interface
Message-ID: <20250102095600.GE554@pendragon.ideasonboard.com>
References: <20241125092146.1561901-1-yuji2.ishikawa@toshiba.co.jp>
 <20241125092146.1561901-3-yuji2.ishikawa@toshiba.co.jp>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241125092146.1561901-3-yuji2.ishikawa@toshiba.co.jp>

Hi Ishikawa-san,

Thank you for the patch.

On Mon, Nov 25, 2024 at 06:21:40PM +0900, Yuji Ishikawa wrote:
> Adds the Device Tree binding documentation that allows to describe
> the Video Input Interface found in Toshiba Visconti SoCs.
> 
> Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
> Reviewed-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> ---
> Changelog v2:
> - no change
> 
> Changelog v3:
> - no change
> 
> Changelog v4:
> - fix style problems at the v3 patch
> - remove "index" member
> - update example
> 
> Changelog v5:
> - no change
> 
> Changelog v6:
> - add register definition of BUS-IF and MPU
> 
> Changelog v7:
> - remove trailing "bindings" from commit header message
> - remove trailing "Device Tree Bindings" from title
> - fix text wrapping of description
> - change compatible to visconti5-viif
> - explicitly define allowed properties for port::endpoint
> 
> Changelog v8:
> - Suggestion from Krzysztof Kozlowski
>   - rename bindings description file
>   - use block style array instead of inline style
>   - remove clock-lane (as it is fixed at position 0)
>   - update sample node's name
>   - use lowercase hex for literals
> - Suggestion from Laurent Pinchart
>   - update description message port::description
>   - remove port::endpoint::bus-type as it is fixed to <4>
>   - remove port::endpoint::clock-lanes from example
>   - add port::endpoint::data-lanes to required parameters list
>   - fix sequence of data-lanes: <1 2 3 4> because current driver does not support data reordering
>   - update port::endpoint::data-lanes::description
>   - remove redundant type definition for port::endpoint::data-lanes
> 
> Changelog v9:
> - place "required" after "properties"
> - dictionary ordering of properties
> 
> Changelog v10:
> - no change
> 
> Changelog v11:
> - no change
> 
> Changelog v12:
> - remove property "clock-noncontinuous" as VIIF switches both modes automatically
> - remove property "link-frequencies" as VIIF does not use the information
> - remove reg[2] and interrupts[3] which are used for CSI2RX driver
> - update example to refer csi2rx for remote-endpoint
> 
>  .../media/toshiba,visconti5-viif.yaml         | 95 +++++++++++++++++++
>  1 file changed, 95 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/toshiba,visconti5-viif.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/toshiba,visconti5-viif.yaml b/Documentation/devicetree/bindings/media/toshiba,visconti5-viif.yaml
> new file mode 100644
> index 000000000000..ef0452a47e98
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/toshiba,visconti5-viif.yaml
> @@ -0,0 +1,95 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/toshiba,visconti5-viif.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Toshiba Visconti5 SoC Video Input Interface
> +
> +maintainers:
> +  - Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> +
> +description: |-
> +  Toshiba Visconti5 SoC Video Input Interface (VIIF) receives videostream
> +  from MIPI CSI-2 receiver device, processes the stream with image signal
> +  processors (L1ISP, L2ISP), then stores pictures to main memory.
> +
> +properties:
> +  compatible:
> +    const: toshiba,visconti5-viif
> +
> +  reg:
> +    items:
> +      - description: Registers for capture control
> +      - description: Registers for bus interface unit control
> +      - description: Registers for Memory Protection Unit

I'm a bit surprised by the lack of clocks.

> +
> +  interrupts:
> +    items:
> +      - description: Sync Interrupt
> +      - description: Status (Error) Interrupt
> +      - description: L1ISP Interrupt
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    unevaluatedProperties: false
> +    description: CSI-2 input port, with a single endpoint connected to the CSI-2 transmitter.
> +
> +    properties:
> +      endpoint:
> +        $ref: video-interfaces.yaml#
> +        additionalProperties: false
> +
> +        properties:
> +          data-lanes:
> +            description: VIIF supports 1, 2, 3 or 4 data lanes
> +            minItems: 1
> +            items:
> +              - const: 1
> +              - const: 2
> +              - const: 3
> +              - const: 4

Now that the CSI-2 receiver is modeled as a separate DT node, I don't
think data-lanes is applicable anymore. The interface between the CSI-2
receiver and the VIIF isn't a CSI-2 bus.

I think you can simplify the bindings by switching from port-base to
port, as you don't need to specify additional properties for the
endpoint:

  port:
    $ref: /schemas/graph.yaml#/$defs/port
    description:
      CSI-2 input port, with a single endpoint connected to the CSI-2
      transmitter.

Please test this though (by running the DT bindings checks).

> +
> +          remote-endpoint: true
> +
> +        required:
> +          - data-lanes
> +          - remote-endpoint
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        video@1c000000 {
> +            compatible = "toshiba,visconti5-viif";
> +            reg = <0 0x1c000000 0 0x6000>,
> +                  <0 0x1c00e000 0 0x1000>,
> +                  <0 0x2417a000 0 0x1000>;
> +            interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
> +
> +            port {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                csi_in0: endpoint {
> +                    data-lanes = <1 2>;
> +                    remote-endpoint = <&csi2rx_out0>;
> +                };
> +            };
> +        };
> +    };

-- 
Regards,

Laurent Pinchart

