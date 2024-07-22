Return-Path: <linux-media+bounces-15266-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E59EB9391AF
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 17:22:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66E451F21D98
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 15:22:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 707A416E897;
	Mon, 22 Jul 2024 15:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="E8h+Vy88"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259CF16E86E;
	Mon, 22 Jul 2024 15:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721661698; cv=none; b=hgQGqc4UQALGmRnOd+MIiDH+PCqRGBcm86q1cM6iruSxMEs6F4vs5783MmFvSM0Lf11ZsUF7bG6Zunq0vW4DUl73AQyDaUjbJDJqehkmaF6lCPFzItVstrMb5UEv0KhSdWvZff/fGFHqfujnUvEFlQy1qRj9+7BEPczAi/mJYKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721661698; c=relaxed/simple;
	bh=qmA/UB5BoDVUD8LihBkIsL5bMzIrgMopZxIAWpKq7V8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sSQlaAKXfFxxINp+xeQ1B7iWHvz9gbM+tuYkBiwJcjM5rz5pWF8lgnRnHoSaAOalGSmq6Imw/3IUdkL9G4Qua8JmYw7XvEEZ9H6jqVQuZfVnkcxuVkghE/O+ESlFMIRNlHgxhy8oPm+5wt/fQ+JcFhGeHax62vzxDXtTRLsWxLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=E8h+Vy88; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E703E2B3;
	Mon, 22 Jul 2024 17:20:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1721661654;
	bh=qmA/UB5BoDVUD8LihBkIsL5bMzIrgMopZxIAWpKq7V8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E8h+Vy882C2QOKuWVW4/padY0ED+52F77F/l/CMdnjgUqf2Vw3d4GgxDeNujZdGYB
	 uu9Jq+7xDLAZNJojPJ9GAsGdwlNt8vYDG2EWHV4ICNukv0JJGQGZBSCJfVv2uIfyt5
	 s5hbH1HXFh0713wnz+mcIb4z1R0G2Iv0ChG5dneI=
Date: Mon, 22 Jul 2024 18:21:17 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v11 1/6] dt-bindings: media: platform: visconti: Add
 Toshiba Visconti Video Input Interface
Message-ID: <20240722152117.GO13497@pendragon.ideasonboard.com>
References: <20240709000848.1108788-1-yuji2.ishikawa@toshiba.co.jp>
 <20240709000848.1108788-2-yuji2.ishikawa@toshiba.co.jp>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240709000848.1108788-2-yuji2.ishikawa@toshiba.co.jp>

Hello Ishikawa-san,

Thank you for the patch.

On Tue, Jul 09, 2024 at 09:08:43AM +0900, Yuji Ishikawa wrote:
> Adds the Device Tree binding documentation that allows to describe
> the Video Input Interface found in Toshiba Visconti SoCs.
> 
> Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
> Reviewed-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
>  .../media/toshiba,visconti5-viif.yaml         | 105 ++++++++++++++++++
>  1 file changed, 105 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/toshiba,visconti5-viif.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/toshiba,visconti5-viif.yaml b/Documentation/devicetree/bindings/media/toshiba,visconti5-viif.yaml
> new file mode 100644
> index 0000000000..97e8bda427
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/toshiba,visconti5-viif.yaml
> @@ -0,0 +1,105 @@
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
> +  Toshiba Visconti5 SoC Video Input Interface (VIIF) receives MIPI CSI2 video
> +  stream, processes the stream with image signal processors (L1ISP, L2ISP),
> +  then stores pictures to main memory.
> +
> +properties:
> +  compatible:
> +    const: toshiba,visconti5-viif
> +
> +  reg:
> +    items:
> +      - description: Registers for capture control
> +      - description: Registers for CSI2 receiver control
> +      - description: Registers for bus interface unit control
> +      - description: Registers for Memory Protection Unit

Is this part of the VIIF, or some sort of more standalone IOMMU ? In the
latter case, should it be handled by a separate driver ?

> +
> +  interrupts:
> +    items:
> +      - description: Sync Interrupt
> +      - description: Status (Error) Interrupt
> +      - description: CSI2 Receiver Interrupt
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
> +
> +          clock-noncontinuous: true
> +          link-frequencies: true
> +          remote-endpoint: true
> +
> +        required:
> +          - clock-noncontinuous

Does the hardware support the non-continuous clock mode only, or is it
configurable ? This is a boolean property, so if both mode are
supported, the property should not be required.

> +          - data-lanes
> +          - link-frequencies
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
> +                  <0 0x1c008000 0 0x400>,
> +                  <0 0x1c00e000 0 0x1000>,
> +                  <0 0x2417a000 0 0x1000>;
> +            interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
> +
> +            port {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                csi_in0: endpoint {
> +                    clock-noncontinuous;
> +                    data-lanes = <1 2>;
> +                    link-frequencies = /bits/ 64 <456000000>;
> +                    remote-endpoint = <&imx219_out0>;
> +                };
> +            };
> +        };
> +    };

-- 
Regards,

Laurent Pinchart

