Return-Path: <linux-media+bounces-32861-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5AAABCFD3
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 08:49:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B635188758C
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 06:49:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ACDC211710;
	Tue, 20 May 2025 06:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hmrFE9OG"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2C325B693;
	Tue, 20 May 2025 06:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747723724; cv=none; b=nHiceZ1wYNz/0U1ik7zUBQi19jSjFGn7lTm2ArZSvWcPWvfti9BFxncoYJgR18i+brOaURPvhC3pHzKa/Lu8ZR+bkFUgzpSaQdOYstPu9+IPxcJ/CzGlzwNscU9jCEUMRLrJghP62zIGh9suYA4sND3/ICdWXdvAbp4dr8NasMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747723724; c=relaxed/simple;
	bh=BmtKNxCjCWseXkG581aa+pnhMf+lCbj5Ofh8619mTzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eob0mahqTEvyMCpKk8TSdWKRHrE7RDjLTQEGLd+EZoOwzBbjC88PSQzZGBJpXppUu+hwubKR9uCvKVsJ7wNATknicDvkePDYWat7EsejHQhhNwxdzmLfAxoZz1XjuFcFECwXs2HCT1cDqqOc4Hh1yUULhob9dU4i3iZQwiCTU5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hmrFE9OG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A435C4CEE9;
	Tue, 20 May 2025 06:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747723723;
	bh=BmtKNxCjCWseXkG581aa+pnhMf+lCbj5Ofh8619mTzs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hmrFE9OGp/RvAH5zItg7/SPX8L5EyvEJL7EbRWKNtYUjKaY5UAxXiLcMRA9TVOYtk
	 1mpqgHz2gtHcn5bA8T0zLDB46PffgXl5PhT1PKX1+8YWoDeQTXTtz86kAiY9QSNv9m
	 xQdRuN1P4HlpMGKBH9UuOrw0vVmOqpR+WgYIbwgfkNkOgg1x8EjiiltGFssljaIn/M
	 iWIq1dYf4hAnvMa1ivV0o6u0SbJIR9Vzk5R950Y5aQr1fzVfuSd75zRq/tdLJ8AQuc
	 SyyHHaD0xd0w4lmkejBL5d+1G4Y9Wpq8zP+w2/tfHtSCV6dNboVpMGkp0Yg4GMNQJu
	 S27gviS0/Sq1w==
Date: Tue, 20 May 2025 08:48:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	p.zabel@pengutronix.de, geert+renesas@glider.be, magnus.damm@gmail.com
Subject: Re: [PATCH 1/3] dt-bindings: media: Add bindings for the RZ/V2H IVC
 block
Message-ID: <20250520-awesome-wonderful-lizard-6efb4b@kuoka>
References: <20250519145754.454005-1-dan.scally@ideasonboard.com>
 <20250519145754.454005-2-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250519145754.454005-2-dan.scally@ideasonboard.com>

On Mon, May 19, 2025 at 03:57:52PM GMT, Daniel Scally wrote:
> The RZ/V2H SoC has a block called the Input Video Control block which
> feeds image data into the Image Signal Processor. Add dt bindings to
> describe the IVC.

A nit, subject: drop second/last, redundant "bindings for". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

> 
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
>  .../bindings/media/renesas,rzv2h-ivc.yaml     | 99 +++++++++++++++++++

This fails testing - expect Rob's bot report (or check DT patchwork) -
thus limited review.

>  1 file changed, 99 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/renesas,rzv2h-ivc.yaml

Filename matching compatible. You can also explain exception in the
commit msg.

> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,rzv2h-ivc.yaml b/Documentation/devicetree/bindings/media/renesas,rzv2h-ivc.yaml
> new file mode 100644
> index 000000000000..29d522f7d365
>

...


> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/renesas,r9a09g057-cpg.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    ivc: ivc@16040000 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

video-codec? video-encoder? video-engine? Or anything reasonable you
find.

Drop unused label

> +      compatible = "renesas,r9a09g057-ivc";
> +      reg = <0x16040000 0x230>;
> +
> +      clocks = <&cpg CPG_MOD R9A09G057_ISP0_PCLK>,
> +      <&cpg CPG_MOD R9A09G057_ISP0_VIN_ACLK>,
> +      <&cpg CPG_MOD R9A09G057_ISP0_SCLK>;

Misaligned, should be aligned to < (see DTS coding style).

> +      clock-names = "pclk", "vin_aclk", "sclk";
> +
> +      resets = <&cpg R9A09G057_ISP_0_PRESETN>,
> +      <&cpg R9A09G057_ISP_0_VIN_ARESETN>,

Same here

> +      <&cpg R9A09G057_ISP_0_ISP_SRESETN>;
> +      reset-names = "presetn", "vin_aresetn", "sresetn";
> +
> +      interrupts = <GIC_SPI 861 IRQ_TYPE_EDGE_RISING>;
> +
> +      status = "okay";

Drop

These are nits, so normally would qualify for review, but maybe I
missed something since it fails testing.

Best regards,
Krzysztof


