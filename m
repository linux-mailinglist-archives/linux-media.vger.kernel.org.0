Return-Path: <linux-media+bounces-35784-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C80D7AE6615
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 15:20:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F01D1886C77
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 13:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E3EE2BE7AF;
	Tue, 24 Jun 2025 13:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rkkq7yvR"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AA81991B6;
	Tue, 24 Jun 2025 13:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750770972; cv=none; b=hmN27ybTQAbLn0oNQLyiBAmRK0ZjLIqctuThy2o2XJOQG0wz+4XMeiPYgBECSzCBOzqJ1WpKzfhOMjWK5WTLRIJNIoSt5oQnfpktdI/G1wUeVYQmjyk+CFqPDpjPJ/OzMbfssQiMSDILSI0VoDM3dr+5v568DSOKcpFySDmehAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750770972; c=relaxed/simple;
	bh=Gar2/i+Hfxan2c5cApv8i73bKu69bIsML6LmJV8jp/Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZdXlUjlqZc568z8WwkFOu1OOsYlVIeMYWxrxyGGCg3VMgDmmWScu1ou7RLGhfto+v1nltr9cMWDROZMS73yltn4zpsE39RFBFo/IMM8ni/yI2aLkKmYkfHx23W29iA3UMCgTn+UgvdrzV+WbpNtkBsftlbWguaP6e1a3VsDYHb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rkkq7yvR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FD93C4CEE3;
	Tue, 24 Jun 2025 13:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750770972;
	bh=Gar2/i+Hfxan2c5cApv8i73bKu69bIsML6LmJV8jp/Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rkkq7yvRvFa5AMMZh+DlNLgZ2AUDWX94+iopbtiJkUZuw+JOgkPhxqj+IjxfoUWDB
	 iaaTXgrGtusRbJPWZvznG+iQbJJvu2/QnoWAIfAvnBkrdS6BKTU22AKaOoQlzAyP4u
	 L4fyq+xYciMXSZXXLuoBs6fj6ihTOEpzdnqYDSFqXj/VpPpsTu2bSjAm4oIEjd/N5+
	 aF0gJgxF9flEXF1hbv7x5llsv+fDpWaxc5wUn1JK4MSZF50nZKOl1jXRGrTuYaNCqS
	 tSI5+4fqia0bqvc55BcjxrGJduvrQI1mJ3dGVBUrkjMlwt0WCj66kFeyhfju8lIhmv
	 9J2NapdFqTLpQ==
Message-ID: <cfc25ba6-753e-41bd-8cb6-f31ba57593a8@kernel.org>
Date: Tue, 24 Jun 2025 15:16:07 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: media: Add bindings for the RZ/V2H
 IVC block
To: Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 jacopo.mondi@ideasonboard.com, biju.das.jz@bp.renesas.com
References: <20250624-ivc-v2-0-e4ecdddb0a96@ideasonboard.com>
 <20250624-ivc-v2-1-e4ecdddb0a96@ideasonboard.com>
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
In-Reply-To: <20250624-ivc-v2-1-e4ecdddb0a96@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/06/2025 14:35, Daniel Scally wrote:
> The RZ/V2H SoC has a block called the Input Video Control block which
> feeds image data into the Image Signal Processor. Add dt bindings to
> describe the IVC.
> 
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> Changes in v2:
> 
> 	- compatible matches filename

This is not what I asked.

> 	- Added power-domains
> 	- Aligned clock and reset entries on opening "<"
> 	- Removed status = "okay"; from example
> ---
>  .../bindings/media/renesas,rzv2h-ivc.yaml          | 103 +++++++++++++++++++++
>  1 file changed, 103 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,rzv2h-ivc.yaml b/Documentation/devicetree/bindings/media/renesas,rzv2h-ivc.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..ee0849eeeaba840cf43c81d69449c631ad1c6a6a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/renesas,rzv2h-ivc.yaml
> @@ -0,0 +1,103 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/renesas,rzv2h-ivc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/V2H Input Video Control Block
> +
> +maintainers:
> +  - Daniel Scally <dan.scally@ideasonboard.com>
> +
> +description:
> +  The IVC block is a module that takes video frames from memory and feeds them
> +  to the Image Signal Processor for processing.
> +
> +properties:
> +  compatible:
> +    const: renesas,rzv2h-ivc

No, you cannot use generic compatibles. See writing bindings (or
basically every review from DT maintainers).

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Input Video Control block register access clock
> +      - description: Video input data AXI bus clock
> +      - description: ISP system clock
> +
> +  clock-names:
> +    items:
> +      - const: pclk
> +      - const: vin_aclk

aclk

vin is redundant. This cannot be anything else than vin.

> +      - const: sclk
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    items:
> +      - description: Input Video Control block register access reset
> +      - description: Video input data AXI bus reset
> +      - description: ISP core reset
> +
> +  reset-names:
> +    items:
> +      - const: presetn
> +      - const: vin_aresetn
> +      - const: sresetn


s/reset// because it is redundant... which would point to pretty
pointless names. Look at your description - one is core or registers,
second is vin and other is isp-core... although then I wonder why ISP
input resets ISP core?



Best regards,
Krzysztof

