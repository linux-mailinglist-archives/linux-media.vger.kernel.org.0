Return-Path: <linux-media+bounces-44188-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85046BCEB38
	for <lists+linux-media@lfdr.de>; Sat, 11 Oct 2025 00:35:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F1671A67C69
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 22:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 664B6277CB6;
	Fri, 10 Oct 2025 22:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ShFlpnwa"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B112C277C88;
	Fri, 10 Oct 2025 22:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760135692; cv=none; b=d0y2yUeD6YCHGK726WRBp0issy7y9u0DAnPjkII7qbFP+KGQuPKOtEld2sOAGHFRjkC/6fIuKpxmyIIZZhWXxVrw+SwnBrd0HWX7N73eXAybpd3RmKh60WK1nS8j+VCzp5js5WigMe4FihMvJoOb3NHvetfCfci3xsZ9blm11YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760135692; c=relaxed/simple;
	bh=WROgCmZgtstKv4eITK/u78V+uzOkFLK31P8ASk/uNc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ckuqOpzMwbE3ldskyQBmDl3o7H3MdJMtL5N0pSeJ3rgDaKZukDuuL6RmGUbbFinEV7RnuAu7crCmxWyJ1W+Qoxiy2LrmfI2zrFqAE+Zqd8LNWIK47+vrGMarw2my4MH7xhQ5LmEsErC/zbwC9nVt4v2ZEU5dyShokGByFjR/Rbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ShFlpnwa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13F40C4CEF9;
	Fri, 10 Oct 2025 22:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760135692;
	bh=WROgCmZgtstKv4eITK/u78V+uzOkFLK31P8ASk/uNc8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ShFlpnwa+lPDPbhRLPLBmb6E8nJ/rJpw2X16SDp1057TrTCeFUjHMz8bhh/mPQk+A
	 RYdRu9li6jR2Im4gjJPrAAQR1dzy/xw61LhSwa4M7AUg+kqRENa2y9sTCZ8cECKxoK
	 8DIuUbKEYrh/p5qgFYe8H/OSv2tjmnOtAbF+CYXWWeJZb90cNWyeZFNNBLsk9o+NlB
	 LYD58f89xei9DFIHvVIArLppncAfZ1lfODqbnZMp6hKZ4prFkiuURpN9AqW/CYZ2Ox
	 +JDSLF7BWY9GUdsApmWRVZuvoC/GSo07c5bdLanU6hWl/cm06LhAt+J49lopjka6At
	 sICLBvRaaXIcQ==
Date: Fri, 10 Oct 2025 17:34:50 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tim Harvey <tharvey@gateworks.com>,
	"open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" <linux-media@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: media: convert nxp,tda1997x.txt to yaml
 format
Message-ID: <20251010223450.GA1293636-robh@kernel.org>
References: <20251010151637.2061727-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251010151637.2061727-1-Frank.Li@nxp.com>

On Fri, Oct 10, 2025 at 11:16:23AM -0400, Frank Li wrote:
> Convert nxp,tda1997x.txt to yaml format
> 
> Additional changes:
> - update audio width to 8, 16, 24, 32.
> - keep one example only.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/media/i2c/nxp,tda19971.yaml      | 158 ++++++++++++++++
>  .../bindings/media/i2c/nxp,tda1997x.txt       | 178 ------------------
>  2 files changed, 158 insertions(+), 178 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/nxp,tda19971.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/nxp,tda1997x.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/nxp,tda19971.yaml b/Documentation/devicetree/bindings/media/i2c/nxp,tda19971.yaml
> new file mode 100644
> index 0000000000000..7624391e1c1e8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/nxp,tda19971.yaml
> @@ -0,0 +1,158 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/nxp,tda19971.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP TDA1997x HDMI receiver
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +description: |
> +  The TDA19971/73 are HDMI video receivers.
> +
> +  The TDA19971 Video port output pins can be used as follows:
> +   - RGB 8bit per color (24 bits total): R[11:4] B[11:4] G[11:4]
> +   - YUV444 8bit per color (24 bits total): Y[11:4] Cr[11:4] Cb[11:4]
> +   - YUV422 semi-planar 8bit per component (16 bits total): Y[11:4] CbCr[11:4]
> +   - YUV422 semi-planar 10bit per component (20 bits total): Y[11:2] CbCr[11:2]
> +   - YUV422 semi-planar 12bit per component (24 bits total): - Y[11:0] CbCr[11:0]
> +   - YUV422 BT656 8bit per component (8 bits total): YCbCr[11:4] (2-cycles)
> +   - YUV422 BT656 10bit per component (10 bits total): YCbCr[11:2] (2-cycles)
> +   - YUV422 BT656 12bit per component (12 bits total): YCbCr[11:0] (2-cycles)
> +
> +  The TDA19973 Video port output pins can be used as follows:
> +   - RGB 12bit per color (36 bits total): R[11:0] B[11:0] G[11:0]
> +   - YUV444 12bit per color (36 bits total): Y[11:0] Cb[11:0] Cr[11:0]
> +   - YUV422 semi-planar 12bit per component (24 bits total): Y[11:0] CbCr[11:0]
> +   - YUV422 BT656 12bit per component (12 bits total): YCbCr[11:0] (2-cycles)
> +
> +  The Video port output pins are mapped via 4-bit 'pin groups' allowing
> +  for a variety of connection possibilities including swapping pin order within
> +  pin groups. The video_portcfg device-tree property consists of register mapping
> +  pairs which map a chip-specific VP output register to a 4-bit pin group. If
> +  the pin group needs to be bit-swapped you can use the *_S pin-group defines.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nxp,tda19971
> +      - nxp,tda19973

blank line

> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  DOVDD-supply: true
> +
> +  DVDD-supply: true
> +
> +  AVDD-supply: true
> +
> +  '#sound-dai-cells':
> +    const: 0
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    unevaluatedProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +  nxp,vidout-portcfg:
> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +    minItems: 1
> +    maxItems: 4
> +    items:
> +      items:
> +        maxItems: 2

1 too many levels...

items:
  maxItems: 2

But really you need to describe what each of the 2 items are. And are 
there some constraints? I'd assume pins here is something like pin 1-N?

> +
> +    description:
> +      array of pairs mapping VP output pins to pin groups.
> +
> +  nxp,audout-format:
> +    enum:
> +      - i2s
> +      - spdif
> +
> +  nxp,audout-width:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [8, 16, 24, 32]
> +    description:
> +      width of audio output data bus.
> +
> +  nxp,audout-layout:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1]
> +    description:
> +      data layout (0=AP0 used, 1=AP0/AP1/AP2/AP3 used).
> +
> +  nxp,audout-mclk-fs:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Multiplication factor between stream rate and codec mclk.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - DOVDD-supply
> +  - AVDD-supply
> +  - DVDD-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/media/tda1997x.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        hdmi-receiver@48 {
> +            compatible = "nxp,tda19971";
> +            reg = <0x48>;
> +            pinctrl-names = "default";
> +            pinctrl-0 = <&pinctrl_tda1997x>;
> +            interrupt-parent = <&gpio1>;
> +            interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
> +            DOVDD-supply = <&reg_3p3v>;
> +            AVDD-supply = <&reg_1p8v>;
> +            DVDD-supply = <&reg_1p8v>;
> +            /* audio */
> +            #sound-dai-cells = <0>;
> +            nxp,audout-format = "i2s";
> +            nxp,audout-layout = <0>;
> +            nxp,audout-width = <16>;
> +            nxp,audout-mclk-fs = <128>;
> +            /*
> +             * The 8bpp YUV422 semi-planar mode outputs CbCr[11:4]
> +             * and Y[11:4] across 16bits in the same pixclk cycle.
> +             */
> +            nxp,vidout-portcfg =
> +                /* Y[11:8]<->VP[15:12]<->CSI_DATA[19:16] */
> +                < TDA1997X_VP24_V15_12 TDA1997X_G_Y_11_8 >,
> +                /* Y[7:4]<->VP[11:08]<->CSI_DATA[15:12] */
> +                < TDA1997X_VP24_V11_08 TDA1997X_G_Y_7_4 >,
> +                /* CbCc[11:8]<->VP[07:04]<->CSI_DATA[11:8] */
> +                < TDA1997X_VP24_V07_04 TDA1997X_R_CR_CBCR_11_8 >,
> +                /* CbCr[7:4]<->VP[03:00]<->CSI_DATA[7:4] */
> +                < TDA1997X_VP24_V03_00 TDA1997X_R_CR_CBCR_7_4 >;
> +
> +            port {
> +                endpoint {
> +                    remote-endpoint = <&ipu1_csi0_mux_from_parallel_sensor>;
> +                    bus-width = <16>;
> +                    hsync-active = <1>;
> +                    vsync-active = <1>;
> +                    data-active = <1>;
> +                };
> +            };
> +        };
> +    };

