Return-Path: <linux-media+bounces-24203-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F2C9FF764
	for <lists+linux-media@lfdr.de>; Thu,  2 Jan 2025 10:29:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B004518813EB
	for <lists+linux-media@lfdr.de>; Thu,  2 Jan 2025 09:29:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5EFE1991DD;
	Thu,  2 Jan 2025 09:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AS9RF9/H"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F46817996;
	Thu,  2 Jan 2025 09:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735810169; cv=none; b=lNBzTGb+5G3YX3YI5FRCRWvJt8rsIwoC8J3Qg7AALysk1IQOIE9QacgegiP06StiVdqBmlyyt2yKSTcqjnApY5+JF3RuzvUOKjjYM1seTeGJotD6d3pt9NKu+VdkCyl+n34JtkoS2jmSR+r7i8P9JwMKAIsGEYy19dG8cGtYaNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735810169; c=relaxed/simple;
	bh=onqrZ9NPwzzCIC8p3BjmM6gfrgM7fWW/E8p+1b0xA1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PbDTgV1NvWj5pMFSR2iQ21SRUzf0L53zDwRXPntJfU4P+bwup+9npKXtwRhAkBR5nUCxibx9Ob1A8/rwF1fv0cec2haTkJo7AQuHG5S1xH5pY9C2flJ18T7MvqRe9SQpXWOipVY0S+sikaUAu1G35ah5XR/QHyF4/Gq8qSGv8AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AS9RF9/H; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D246A75A;
	Thu,  2 Jan 2025 10:28:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1735810117;
	bh=onqrZ9NPwzzCIC8p3BjmM6gfrgM7fWW/E8p+1b0xA1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AS9RF9/HaMlA5Tm0IJ0+t1rKXA8AV3vlNu4qb5Ox5C3VQ3Vzf2lL6J25vSESE9bbV
	 qmORlUtuDDUS8ObgfdOj9eWbdu7McLMrxw6c5sf3uB98U7g/pYc7Fs5gSKQxS7//VU
	 IyHEV/ffrtKK7gwa3C5K+OB+DvUVR/Zl7n/0mS2k=
Date: Thu, 2 Jan 2025 11:29:25 +0200
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
Subject: Re: [PATCH v12 1/8] dt-bindings: media: platform: visconti: Add
 Toshiba Visconti MIPI CSI-2 Receiver
Message-ID: <20250102092925.GC554@pendragon.ideasonboard.com>
References: <20241125092146.1561901-1-yuji2.ishikawa@toshiba.co.jp>
 <20241125092146.1561901-2-yuji2.ishikawa@toshiba.co.jp>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241125092146.1561901-2-yuji2.ishikawa@toshiba.co.jp>

Hello Ishikawa-san,

Thank you for the patch.

On Mon, Nov 25, 2024 at 06:21:39PM +0900, Yuji Ishikawa wrote:
> Adds the Device Tree binding documentation that allows to describe
> the MIPI CSI-2 Receiver found in Toshiba Visconti SoCs.
> 
> Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
> Reviewed-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> ---
> 
> Changelog v12:
> - Newly add bindings for CSI2RX driver 
> 
>  .../media/toshiba,visconti5-csi2rx.yaml       | 104 ++++++++++++++++++
>  1 file changed, 104 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/toshiba,visconti5-csi2rx.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/toshiba,visconti5-csi2rx.yaml b/Documentation/devicetree/bindings/media/toshiba,visconti5-csi2rx.yaml
> new file mode 100644
> index 000000000000..5488072bc82a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/toshiba,visconti5-csi2rx.yaml
> @@ -0,0 +1,104 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/toshiba,visconti5-csi2rx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Toshiba Visconti5 SoC MIPI CSI-2 receiver
> +
> +maintainers:
> +  - Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> +
> +description: |-

As Krzysztof mentioned, '|-' isn't needed. See
https://yaml-multiline.info/ for more information. The literal block
style indicator ('|') is only needed when line breaks need to be
preserved, e.g. when the description contains ASCII art.

> +  Toshiba Visconti5 SoC MIPI CSI-2 receiver device receives MIPI CSI-2 video
> +  stream. Use with VIIF device. T.B.D

T.B.D ?

> +
> +properties:
> +  compatible:
> +    const: toshiba,visconti5-csi2rx
> +
> +  reg:
> +    items:
> +      - description: Registers for CSI2 receiver control
> +
> +  interrupts:
> +    items:
> +      - description: CSI2 Receiver Interrupt
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port node, single endpoint describing the CSI-2 transmitter.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#

Please use a full path for the ref:

            $ref: /schemas/media/video-interfaces.yaml#

> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                description: CSI2 receiver supports 1, 2, 3 or 4 data lanes

You can drop the description. The video-interfaces.yaml schema has a
more complete description, and the fact that the receiver supports
between 1 and 4 lanes is conveyed by minItems and items below.

> +                minItems: 1
> +                items:
> +                  - const: 1
> +                  - const: 2
> +                  - const: 3
> +                  - const: 4
> +            required:
> +              - data-lanes
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Output port node, single endpoint describing the Visconti VIIF.
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - ports
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
> +        csi2rx@1c008000 {

Node names should describe the function of the node, not the precise
model of the device. "csi2" would be a more appropriate name.

> +            compatible = "toshiba,visconti5-csi2rx";
> +            reg = <0 0x1c008000 0 0x400>;
> +            interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                port@0 {
> +                    reg = <0>;
> +                    csi2rx_in0: endpoint {
> +                        data-lanes = <1 2>;
> +                        remote-endpoint = <&imx219_out0>;
> +                    };
> +                };
> +                port@1 {
> +                    reg = <1>;
> +                    csi2rx_out0: endpoint {
> +                        remote-endpoint = <&csi_in0>;
> +                    };
> +                };
> +            };
> +        };
> +    };

-- 
Regards,

Laurent Pinchart

