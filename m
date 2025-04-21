Return-Path: <linux-media+bounces-30665-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 935A6A9597A
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 00:37:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7815D3B4CB1
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 22:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97DA422A4C5;
	Mon, 21 Apr 2025 22:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="A4AM4w+j"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4C3BA4A;
	Mon, 21 Apr 2025 22:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745275025; cv=none; b=cdRHhuy4I/kr0HCGnYkxd5kBwc4w28/M3cDdTtqfb1y4pLkjYwXBHiUcFgOPW8KSYz+QxF8DBIUB89aRcrA+mjUKKIxZ4QcGKDrlUnin9m4bXRL6FmgD73JckpygzZfLr+ReK10qSJPVCoefTYYgm0J1svPF/Q0LAOgaB82eWgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745275025; c=relaxed/simple;
	bh=ZO4xn37aM/ZDORnhJl0TobSG4164CL7rYBoELWyjVKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R4bOvHn5H000qRAtwvt1pc575yIqxHJ+3jKjKoHLbs+KhqkUNAv+0aUwotgJHPcxULaqyqolxmNZ2lfDwU3QCEFfLXm6PeBoUjc3jhg6yoXnz+PXQFDm3de3561jVFvFcHwJ6ts1cvErkfXBwnra7zseTV+KAbDdLHOEijMfpCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=A4AM4w+j; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A2CF4606;
	Tue, 22 Apr 2025 00:34:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745274894;
	bh=ZO4xn37aM/ZDORnhJl0TobSG4164CL7rYBoELWyjVKA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A4AM4w+jHiRfFAs1WZgZcxeRpBWg0LyA+s4oqN5+S/a00LpvFUwDGn/EJijslhsZF
	 5EBrN6SJw91APiFhkPDM0IFyl3d4RDviu7O+ZESZfHx3uJc1MFTO/xQfNgBN1Ka/Ec
	 H8OHSSKOnr8xJx10OeQWzrIbpA1bjn3seu4+VnWc=
Date: Tue, 22 Apr 2025 01:36:59 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/7] dt-bindings: media: renesas,isp: Add ISP core
 function block
Message-ID: <20250421223659.GZ17813@pendragon.ideasonboard.com>
References: <20250421111240.789510-1-niklas.soderlund+renesas@ragnatech.se>
 <20250421111240.789510-2-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250421111240.789510-2-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

Thank you for the patch.

On Mon, Apr 21, 2025 at 01:12:34PM +0200, Niklas Söderlund wrote:
> Some R-Car ISP instances have in addition to the channel selector (CS)
> an ISP core (CORE )to perform operations on an image stream. The core

s/ )/) /

> function is mapped to a different memory region and have a separate

s/have/has/

> interrupt then CS, extend the bindings to allow describing this.

s/then/than/

> 
> On the same SoC different instances of the ISP IP may have, or not have,
> the CORE functionality. The CS function on all instances on the SoC are
> the same and the documentation describes the full ISP (CS + CORE) as a
> single IP block. Where instances not having the CORE function simple
> lacking the functionality to modify the image data. There dependencies

s/simple lacking/simply lack/

s/There/There are/ ? Or did you mean something else ?

> on the CS functionality while operating the CORE functionality.
> 
> In order for the ISP core to function in memory-to-memory mode it needs
> to be feed input data from a Streaming Bridge interface. This interface
> is provided thru the VSP-X device. Add an optional new property
> "renesas,vspx" to provide a phandle to describe this relationship.
> 
> While adding mandatory reg-names and interrupt-names breaks existing
> bindings the driver itself remains backward compatible and provides CS
> functionality if a single unnamed reg and interrupt property is present.
> Furthermore all existing users of the bindings are updated in following
> work to add these new mandatory properties.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> * Changes since v1
> - Extend the commit message to make it explicit that different ISP
>   instances on the same SoC (same compatible value) can have, or not
>   have, a CORE function block attached.
> - Update documentation for renesas,vspx property.
> - Update example to cover all new properties.
> ---
>  .../bindings/media/renesas,isp.yaml           | 63 ++++++++++++++++---
>  1 file changed, 55 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,isp.yaml b/Documentation/devicetree/bindings/media/renesas,isp.yaml
> index c4de4555b753..927be02347e5 100644
> --- a/Documentation/devicetree/bindings/media/renesas,isp.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,isp.yaml
> @@ -25,19 +25,55 @@ properties:
>            - renesas,r8a779h0-isp # V4M
>        - const: renesas,rcar-gen4-isp # Generic R-Car Gen4
>    reg:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
> +
> +  reg-names:
> +    minItems: 1
> +    items:
> +      - const: cs
> +      - const: core
>  
>    interrupts:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
> +
> +  interrupt-names:
> +    minItems: 1
> +    items:
> +      - const: cs
> +      - const: core
>  
>    clocks:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    minItems: 1
> +    items:
> +      - const: cs
> +      - const: core
>  
>    power-domains:
>      maxItems: 1
>  
>    resets:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
> +
> +  reset-names:
> +    minItems: 1
> +    items:
> +      - const: cs
> +      - const: core
> +
> +  renesas,vspx:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      A phandle to the companion VSPX responsible for the Streaming Bridge
> +      functionality. The Streaming Bridge is responsible for feeding image
> +      and configuration data to the ISP when operating in memory-to-memory
> +      mode.
>  
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
> @@ -103,10 +139,14 @@ properties:
>  required:
>    - compatible
>    - reg
> +  - reg-names
>    - interrupts
> +  - interrupt-names
>    - clocks
> +  - clock-names
>    - power-domains
>    - resets
> +  - reset-names
>    - ports
>  
>  additionalProperties: false
> @@ -119,11 +159,18 @@ examples:
>  
>      isp1: isp@fed20000 {
>              compatible = "renesas,r8a779a0-isp", "renesas,rcar-gen4-isp";
> -            reg = <0xfed20000 0x10000>;
> -            interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
> -            clocks = <&cpg CPG_MOD 613>;
> +            reg = <0xfed20000 0x10000>, <0xfee00000 0x10000>;
> +            reg-names = "cs", "core";
> +            interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
> +            interrupt-names = "cs", "core";
> +            clocks = <&cpg CPG_MOD 613>, <&cpg CPG_MOD 17>;
> +            clock-names = "cs", "core";
>              power-domains = <&sysc R8A779A0_PD_A3ISP01>;
> -            resets = <&cpg 613>;
> +            resets = <&cpg 613>, <&cpg 17>;
> +            reset-names = "cs", "core";
> +
> +            renesas,vspx = <&vspx1>;
>  
>              ports {
>                      #address-cells = <1>;

-- 
Regards,

Laurent Pinchart

