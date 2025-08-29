Return-Path: <linux-media+bounces-41332-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4FCB3BCFE
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 15:57:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0E2B7C11A7
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 13:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3654931AF21;
	Fri, 29 Aug 2025 13:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mJikOCLn"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7957031CA4C;
	Fri, 29 Aug 2025 13:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756475849; cv=none; b=VC0r285W3GKOpzR4U32vYG43ZWrMSnXPE4KHQHAbSHx06M/tsnL5V5uvV4BFjOdpV6S1xM8x/yErFZyh5TDzOINbpSM0K8JhK6lwq1fva9JPvYorjfR8jnKdFMZQNhOdxVWTlGy58ztYUAzdC69LT+92dEfucGcRH5b0Cg5NKmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756475849; c=relaxed/simple;
	bh=GAx5ojnyAU2PokUcYuAkGcyrtKpN+pheoAbeyRpyqik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hUYLzIXQ66vJu6tG1YKP//sdoOre4gj1PNVm28vAT/upo5ENaSXjJe5J0iPEchW5WAqhUlmpoH6RLDfuzqT//XIjtt3lnmAH5qxjiRJZW8CunePLDt9EMcDUGOYvX8WMdcM2IUFmjCmYwI2gU9eAFvLh+6PmS1GMNC25G2Bw+xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mJikOCLn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23706C4CEF0;
	Fri, 29 Aug 2025 13:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756475848;
	bh=GAx5ojnyAU2PokUcYuAkGcyrtKpN+pheoAbeyRpyqik=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mJikOCLnluEdgC6BTd9BDS2cIzAcrssCcJk17sE1FShAUshCqpd1rW5mTNudfnz9t
	 Crj3vTdHSF6bk4WzuyhkvhKCTY7yTY/EvIL/n6lGwCwKSMpJJWJAcu+9zLGrNQsL63
	 a63l7hQWA/qi2CH2hmfT8jBUvEf2x90l1uXgljs6JLx3X/cspRfMsaIfn+4KkBgWQp
	 E0bM1ab7rezvcbxZpYdgQaOg3j9+VctKmEajPLpAmCVxD2s8pBv06Roqo00Bv2cZYQ
	 aWjcxLKH6Rg8ZDJlJhwpe99+vwP8CgbK6AQZvSWZHnixrK5gNauIyKlMKsRwpVSigk
	 FiAKdYoQZywBw==
Message-ID: <22379203-94f8-468d-a9b6-de67f8fba495@kernel.org>
Date: Fri, 29 Aug 2025 15:57:23 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/9] dt-bindings: media: nxp: Add Wave6 video codec
 device
To: Nas Chung <nas.chung@chipsnmedia.com>, mchehab@kernel.org,
 hverkuil@xs4all.nl, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-imx@nxp.com,
 linux-arm-kernel@lists.infradead.org, jackson.lee@chipsnmedia.com,
 lafley.kim@chipsnmedia.com
References: <20250829084649.359-1-nas.chung@chipsnmedia.com>
 <20250829084649.359-3-nas.chung@chipsnmedia.com>
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
In-Reply-To: <20250829084649.359-3-nas.chung@chipsnmedia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/08/2025 10:46, Nas Chung wrote:
> Add documents for the Wave6 video codec on NXP i.MX SoCs.
Pretty incomplete commit msg. Nothing explaining hardware, nothing
documenting resolution of previous discussions (where is all this
chip&media?).

...


> +
> +properties:
> +  compatible:
> +    enum:
> +      - nxp,imx95-vpu
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  memory-region:
> +    maxItems: 1
> +
> +  sram:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: phandle of the SRAM memory region node.
> +
> +  "#cooling-cells":
> +    const: 2
> +
> +  "#address-cells":
> +    const: 2
> +
> +  "#size-cells":
> +    const: 2
> +
> +  ranges: true
> +
> +patternProperties:
> +  "^video-core@[0-9a-f]+$":
> +    type: object

Missing description.

> +    additionalProperties: false
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - nxp,imx95-vpu-core

Why do you need here compatible? Can this child be anything else? Can it
be re-used? Is it actually a separate block?

Your example suggests that the only distinctive resource are the
interrupt and address space and that's on the edge of calling it a
separate device.

There is some tendency to call such "pseudo-cores" a separate devices in
case of video codec bindings and experience shows these are usually
fake. It's not the same as DP or HDMI sub-block of display pipeline.

That's why you should come here with strong argument what separate piece
of hardware this is.

> +
> +      reg:
> +        maxItems: 1
> +
> +      clocks:
> +        maxItems: 1
> +
> +      power-domains:
> +        maxItems: 1
> +
> +      interrupts:
> +        maxItems: 1
> +
> +    required:
> +      - compatible
> +      - reg
> +      - clocks
> +      - power-domains
> +      - interrupts
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - power-domains
> +  - memory-region
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/nxp,imx95-clock.h>
> +
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      vpu: video-codec@4c4c0000 {

Unused label, drop

> +        compatible = "nxp,imx95-vpu";
> +        reg = <0x0 0x4c4c0000 0x0 0x10000>;
> +        clocks = <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;
> +        power-domains = <&scmi_perf 10>;
> +        memory-region = <&vpu_boot>;
> +        sram = <&sram1>;
> +        #cooling-cells = <2>;
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +        ranges;
> +
> +        vpucore0: video-core@4c480000 {

None of these labels are used, drop.

> +          compatible = "nxp,imx95-vpu-core";
> +          reg = <0x0 0x4c480000 0x0 0x10000>;
> +          clocks = <&scmi_clk 115>;
> +          power-domains = <&scmi_devpd 21>;
> +          interrupts = <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
> +        };
> +
> +        vpucore1: video-core@4c490000 {
> +          compatible = "nxp,imx95-vpu-core";
> +          reg = <0x0 0x4c490000 0x0 0x10000>;
> +          clocks = <&scmi_clk 115>;
> +          power-domains = <&scmi_devpd 21>;
> +          interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
> +        };
> +



Best regards,
Krzysztof

