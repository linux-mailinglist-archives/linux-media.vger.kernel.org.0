Return-Path: <linux-media+bounces-42076-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D063B4A57D
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 10:37:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2C2E1B217F8
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 08:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63341252906;
	Tue,  9 Sep 2025 08:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z4bDtymN"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36624A21;
	Tue,  9 Sep 2025 08:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757407008; cv=none; b=QfG9cw2S2Vx2PWB45NJoh4vXz3JuXCAHibDVqIqMTa3WALGhcsqSQZtGAYm9OW26QE4kqjK8niPZoVgs0gskJNngV2VjO507XnRg3LFrLu3KlcDFyWm/+oKkYF4KoH4K1/qZhBnDgBxY0J+AuP/XqdNHb72NtACCP74EBU0ft+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757407008; c=relaxed/simple;
	bh=CnKj39bSLxB+RVv30x1J6duqXf/w3LDu11XH/ZQmf50=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cuA/P51Nf2/sE+BPkcVuz5zIbxmDXz4ff6gi8a7Y/sBqooiCKODAHHg9lao0b+5ROM5g1VNdetRoYHEBXbThl2+c7hgM11riXUKQ5e6xsmGI0RFTgUmX7B1qlcIlFyz8XbsbyyC2xgIbrW9izFle0rJ5grkO5zCoPhasfOPe59E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z4bDtymN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB50AC4CEF4;
	Tue,  9 Sep 2025 08:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757407008;
	bh=CnKj39bSLxB+RVv30x1J6duqXf/w3LDu11XH/ZQmf50=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Z4bDtymN4sisxq79W0uhgvXXDymhaOuw1Uwji29jiP8ZodJEFbn9VeGhbtnjo9DqS
	 eJRA8YtEHSTlFzyV10FsujiVKEhPZ3MGOqNb6FFuBTJoWLjWvZCYJgCLXIqqNwxLZQ
	 DNsqbxfPVVpW6Y6XjDY2xPwulnDkYfowtio95qR8+z3q6t9VuY31gulkerM9oavbfk
	 G57faooOWUtqb6cfOUIKk+ifoEIsOkSaQ+mVrNbgE0wsXXsPx0ZHvWif6p0Tr+Dibu
	 lfRBpjPwXSnIzC8xz3Ppuheb5tCFpCUsaGjXcbVsXAD0LG7AKccjzAfQxMdfRuGh9N
	 Dps5E/GF0g5bQ==
Message-ID: <56a961c4-d11b-448c-81a6-a3a970627dda@kernel.org>
Date: Tue, 9 Sep 2025 10:36:43 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 4/5] dt-bindings: media: ti: vpe: Add support for Video
 Input Port
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 hverkuil+cisco@kernel.org
Cc: sakari.ailus@linux.intel.com, bparrot@ti.com,
 jai.luthra@ideasonboard.com, dale@farnsworth.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, u-kumar1@ti.com,
 Sukrut Bellary <sbellary@baylibre.com>
References: <20250909080718.1381758-1-y-abhilashchandra@ti.com>
 <20250909080718.1381758-5-y-abhilashchandra@ti.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJoF1BKBQkWlnSaAAoJEBuTQ307
 QWKbHukP/3t4tRp/bvDnxJfmNdNVn0gv9ep3L39IntPalBFwRKytqeQkzAju0whYWg+R/rwp
 +r2I1Fzwt7+PTjsnMFlh1AZxGDmP5MFkzVsMnfX1lGiXhYSOMP97XL6R1QSXxaWOpGNCDaUl
 ajorB0lJDcC0q3xAdwzRConxYVhlgmTrRiD8oLlSCD5baEAt5Zw17UTNDnDGmZQKR0fqLpWy
 786Lm5OScb7DjEgcA2PRm17st4UQ1kF0rQHokVaotxRM74PPDB8bCsunlghJl1DRK9s1aSuN
 hL1Pv9VD8b4dFNvCo7b4hfAANPU67W40AaaGZ3UAfmw+1MYyo4QuAZGKzaP2ukbdCD/DYnqi
 tJy88XqWtyb4UQWKNoQqGKzlYXdKsldYqrLHGoMvj1UN9XcRtXHST/IaLn72o7j7/h/Ac5EL
 8lSUVIG4TYn59NyxxAXa07Wi6zjVL1U11fTnFmE29ALYQEXKBI3KUO1A3p4sQWzU7uRmbuxn
 naUmm8RbpMcOfa9JjlXCLmQ5IP7Rr5tYZUCkZz08LIfF8UMXwH7OOEX87Y++EkAB+pzKZNNd
 hwoXulTAgjSy+OiaLtuCys9VdXLZ3Zy314azaCU3BoWgaMV0eAW/+gprWMXQM1lrlzvwlD/k
 whyy9wGf0AEPpLssLVt9VVxNjo6BIkt6d1pMg6mHsUEVzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmgXUF8FCRaWWyoACgkQG5NDfTtBYptO0w//dlXJs5/42hAXKsk+PDg3wyEFb4NpyA1v
 qmx7SfAzk9Hf6lWwU1O6AbqNMbh6PjEwadKUk1m04S7EjdQLsj/MBSgoQtCT3MDmWUUtHZd5
 RYIPnPq3WVB47GtuO6/u375tsxhtf7vt95QSYJwCB+ZUgo4T+FV4hquZ4AsRkbgavtIzQisg
 Dgv76tnEv3YHV8Jn9mi/Bu0FURF+5kpdMfgo1sq6RXNQ//TVf8yFgRtTUdXxW/qHjlYURrm2
 H4kutobVEIxiyu6m05q3e9eZB/TaMMNVORx+1kM3j7f0rwtEYUFzY1ygQfpcMDPl7pRYoJjB
 dSsm0ZuzDaCwaxg2t8hqQJBzJCezTOIkjHUsWAK+tEbU4Z4SnNpCyM3fBqsgYdJxjyC/tWVT
 AQ18NRLtPw7tK1rdcwCl0GFQHwSwk5pDpz1NH40e6lU+NcXSeiqkDDRkHlftKPV/dV+lQXiu
 jWt87ecuHlpL3uuQ0ZZNWqHgZoQLXoqC2ZV5KrtKWb/jyiFX/sxSrodALf0zf+tfHv0FZWT2
 zHjUqd0t4njD/UOsuIMOQn4Ig0SdivYPfZukb5cdasKJukG1NOpbW7yRNivaCnfZz6dTawXw
 XRIV/KDsHQiyVxKvN73bThKhONkcX2LWuD928tAR6XMM2G5ovxLe09vuOzzfTWQDsm++9UKF a/A=
In-Reply-To: <20250909080718.1381758-5-y-abhilashchandra@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/09/2025 10:07, Yemike Abhilash Chandra wrote:
> From: Dale Farnsworth <dale@farnsworth.org>
> 
> Add device tree bindings for the Video Input Port. Video Input Port (VIP)
> can be found on devices such as DRA7xx and provides a parallel interface
> to a video source such as a sensor or TV decoder.
> 
> Signed-off-by: Dale Farnsworth <dale@farnsworth.org>
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> ---
> Change log:
> Changes in v3:
> - Remove redundant labels in bindings
> - Remove minItems in interrupts and mandate exactly 2 interrupts using items
> - Rename phandle from ti,vip-clk-polarity to ti,ctrl-module and explain why this is required by the device
> - Make the phandle verifiable instead of just descriptive
> - Drop entire sensor node from example DT
> - Fix ports hierarchy using appropriate references and descriptions
> - Use generic node names
> - Add two new properties ti,vip-pixel-mux and ti,vip-channels with appropriate types and descriptions
> 
>  .../devicetree/bindings/media/ti,vip.yaml     | 178 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 179 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/ti,vip.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/ti,vip.yaml b/Documentation/devicetree/bindings/media/ti,vip.yaml
> new file mode 100644
> index 000000000000..c0bce44725db
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/ti,vip.yaml
> @@ -0,0 +1,178 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2025 Texas Instruments Incorporated -  http://www.ti.com/
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/ti,vip.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments DRA7x VIDEO INPUT PORT (VIP).

Titles are not sentences.

Also, drop CAPS, WE DO NOT NEED TO EMPHASIZE THAT. It is a Video Input Port.


> +
> +maintainers:
> +  - Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> +
> +description: |-
> +  Video Input Port (VIP) can be found on devices such as DRA7xx and
> +  provides the system interface and the processing capability to
> +  connect parallel image-sensor as well as BT.656/1120 capable encoder
> +  chip to DRA7x device.
> +
> +  Each VIP instance supports 2 independently configurable external
> +  video input capture slices (Slice 0 and Slice 1) each providing
> +  up to two video input ports (Port A and Port B).
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,dra7-vip
> +
> +  reg:
> +    items:
> +      - description: The VIP main register region
> +      - description: Video Data Parser (PARSER) register region for Slice0
> +      - description: Color Space Conversion (CSC) register region for Slice0
> +      - description: Scaler (SC) register region for Slice0
> +      - description: Video Data Parser (PARSER) register region for Slice1
> +      - description: Color Space Conversion (CSC) register region for Slice1
> +      - description: Scaler (SC) register region for Slice1
> +      - description: Video Port Direct Memory Access (VPDMA) register region
> +
> +  reg-names:
> +    items:
> +      - const: vip
> +      - const: parser0
> +      - const: csc0
> +      - const: sc0
> +      - const: parser1
> +      - const: csc1
> +      - const: sc1
> +      - const: vpdma
> +
> +  interrupts:
> +    items:
> +      - description: IRQ index 0 is used for Slice0 interrupts
> +      - description: IRQ index 1 is used for Slice1 interrupts
> +
> +  ti,ctrl-module:
> +    description:
> +      Reference to the device control module that provides clock-edge
> +      inversion control for VIP ports. These controls allow the
> +      VIP to sample pixel data on the correct clock edge.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      items:
> +        - description: phandle to device control module
> +        - description: offset to the CTRL_CORE_SMA_SW_1 register
> +        - description: Bit field to slice 0 port A
> +        - description: Bit field to slice 0 port B
> +        - description: Bit field to slice 1 port A
> +        - description: Bit field to slice 1 port B
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    patternProperties:
> +      '^port@[0-3]$':
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: |
> +          Each VIP instance supports 2 independently configurable external video
> +          input capture slices (Slice 0 and Slice 1) each providing up to two video
> +          input ports (Port A and Port B). These ports represent the following
> +          port@0 -> Slice 0 Port A
> +          port@1 -> Slice 0 Port B
> +          port@2 -> Slice 1 Port A
> +          port@3 -> Slice 1 Port B
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              bus-width:
> +                enum: [8, 16, 24]
> +                default: 8
> +
> +              ti,vip-pixel-mux:
> +                type: boolean
> +                description:
> +                  In BT656/1120 mode, this will enable pixel-muxing if
> +                  the number of channels is either 1, 2 or 4. If this
> +                  property is present then pixel-muxing is enabled
> +                  otherwise it will use line-muxing.

This feels like runtime choice.

> +
> +              ti,vip-channels:
> +                $ref: /schemas/types.yaml#/definitions/uint8-array
> +                minItems: 1
> +                maxItems: 16
> +                description:
> +                  In BT656/1120 mode, list of channel ids to be captured.
> +                  If the property is not present then 1 channel is assumed.

Also feels like runtime.

> +
> +              remote-endpoint: true

Drop

> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - ti,ctrl-module
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    vip1: video@48970000 {
> +        compatible = "ti,dra7-vip";
> +        reg = <0x48970000 0x114>,
> +              <0x48975500 0xD8>,
> +              <0x48975700 0x18>,
> +              <0x48975800 0x80>,
> +              <0x48975a00 0xD8>,
> +              <0x48975c00 0x18>,
> +              <0x48975d00 0x80>,

Are you really, REALLY sure these are separate address spaces? Some
people thing that gaps means address space finishes...


How does your datasheet define these?

> +              <0x4897d000 0x400>;
> +        reg-names = "vip",
> +                    "parser0",
> +                    "csc0",
> +                    "sc0",
> +                    "parser1",
> +                    "csc1",
> +                    "sc1",
> +                    "vpdma";
> +        interrupts = <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 392 IRQ_TYPE_LEVEL_HIGH>;
> +        ti,ctrl-module = <&scm_conf 0x534 0x0 0x2 0x1 0x3>;
> +
> +        ports {
> +              #address-cells = <1>;
> +              #size-cells = <0>;
> +
> +              vin1a: port@0 {
> +                    reg = <0>;
> +
> +                    vin1a_ep: endpoint {
> +                           remote-endpoint = <&camera1>;
> +                           hsync-active = <1>;
> +                           vsync-active = <1>;
> +                           pclk-sample = <0>;
> +                           bus-width = <8>;

Make example complete, also other properties.

> +                    };
> +              };
> +              vin1b: port@1 {
> +                    reg = <1>;

Why no endpoints?

> +              };
> +              vin2a: port@2 {
> +                    reg = <2>;
> +              };
> +              vin2b: port@3 {
> +                    reg = <3>;



Best regards,
Krzysztof

