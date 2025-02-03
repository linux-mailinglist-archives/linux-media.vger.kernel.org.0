Return-Path: <linux-media+bounces-25608-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C214CA2666D
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 23:17:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46DA7161CC4
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 22:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2E3020FA9C;
	Mon,  3 Feb 2025 22:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O5SGTJYV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083041D5CD4;
	Mon,  3 Feb 2025 22:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738621021; cv=none; b=oxXZuEk8Nf4Iu9ligcUIrCev+Vib8mQWnrWz5SCzwA8GJ5+vB1vGkODiRcxl+IFvzh6ZQuVz7oK1HLUPmhmvVLlIX+KhMrAHHigS/pMRENsML08ySP+eSRvB8QxlIax/NkKb2aBz11sI5uEKlayHcYf7OZ/Bdh5vBvjpBZMD9m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738621021; c=relaxed/simple;
	bh=7svs+wKmG+cmpxhyFwkJOaZkFZ0sH/NMkYxSYvVASpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iiIB7H5J2NiP1BTOEzrqihl918HmVYpg7/BZtf6RRukDUYU58QIURCQ9cFnCdMQAcD0qxb/FnJu43aPO81CkRJDEF74ia+P9YcEaYBhOlGzlcrvDNISngdVhUvBLmsi16O32+5+tCEqcVEY6VfjjdgNLtOwyzdcKkKQhFgkUDu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O5SGTJYV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AE5EC4CED2;
	Mon,  3 Feb 2025 22:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738621020;
	bh=7svs+wKmG+cmpxhyFwkJOaZkFZ0sH/NMkYxSYvVASpA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O5SGTJYVHZPmJijhTIVkKFqBL/LQ+LXHOLoLZN6HyTVDQpvwslxaAt8rk/NQIKXRQ
	 rXzTeiz3f0E+oQJXbWPzUhUxigwKvrzwRbhwa5L4y2PqvHnN4SWwP4uS+KybParPIv
	 rAI2Olu+qiKqkx1t4yawMj7b1Yyg6P7MGel+divo5gTXDgUEtOMMFVuMs3pQ3e9UW0
	 br+V0YLQNoHYbM5YNVWH9g/i4lha4WmtmCmAkWsMqePah/WWMXriUEqxXBjZjzwvi4
	 b1SxTU9P/sm53pRcDsUEY0tycrSbHKil2dqhkeHUk8UkJAdN7tTlLB2CtO3azrAPPU
	 sJAMHHfY2MAZg==
Date: Mon, 3 Feb 2025 16:16:59 -0600
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, "Guoniu.zhou" <guoniu.zhou@nxp.com>,
	Robby Cai <robby.cai@nxp.com>,
	Robert Chiras <robert.chiras@nxp.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Subject: Re: [PATCH 05/14] media: dt-bindings: nxp,imx8-isi: Add i.MX8Q ISI
 compatible strings
Message-ID: <20250203221659.GA130749-robh@kernel.org>
References: <20250131-8qxp_camera-v1-0-319402ab606a@nxp.com>
 <20250131-8qxp_camera-v1-5-319402ab606a@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131-8qxp_camera-v1-5-319402ab606a@nxp.com>

On Fri, Jan 31, 2025 at 04:33:50PM -0500, Frank Li wrote:
> From: Robert Chiras <robert.chiras@nxp.com>
> 
> Add compatible strings for i.MX8QM and i.MX8QXP platforms.
> 
> Increase the number of max interrupts and clock to 8. i.MX8QM have 8
> channels and i.MX8QXP have 5 channels. Each channel requires one clock
> source and interrupt.
> 
> Remove fsl,blk-ctrl from required list because i.MX8Q needn't it.
> 
> i.MX8QM use port@2 and port@3. i.MX8QXP use port@2 and port@6.
> 
> Keep the same restriction for the other platform.
> 
> Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
> Reviewed-by: Robby Cai <robby.cai@nxp.com>
> Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> Reviewed-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/media/nxp,imx8-isi.yaml    | 87 +++++++++++++++++++---
>  1 file changed, 75 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> index f43b91984f015..b713c8ba79e39 100644
> --- a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> @@ -21,6 +21,8 @@ properties:
>      enum:
>        - fsl,imx8mn-isi
>        - fsl,imx8mp-isi
> +      - fsl,imx8qm-isi
> +      - fsl,imx8qxp-isi
>        - fsl,imx8ulp-isi
>        - fsl,imx93-isi
>  
> @@ -28,17 +30,12 @@ properties:
>      maxItems: 1
>  
>    clocks:
> -    items:
> -      - description: The AXI clock
> -      - description: The APB clock
> -      # TODO: Check if the per-channel ipg_proc_clk clocks need to be specified
> -      # as well, in case some SoCs have the ability to control them separately.
> -      # This may be the case of the i.MX8[DQ]X(P)
> +    minItems: 1
> +    maxItems: 8

Isn't the minimum still 2?

>  
>    clock-names:
> -    items:
> -      - const: axi
> -      - const: apb
> +    minItems: 1
> +    maxItems: 8
>  
>    fsl,blk-ctrl:
>      $ref: /schemas/types.yaml#/definitions/phandle
> @@ -49,10 +46,11 @@ properties:
>    interrupts:
>      description: Processing pipeline interrupts, one per pipeline
>      minItems: 1
> -    maxItems: 2
> +    maxItems: 8
>  
>    power-domains:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 8
>  
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
> @@ -66,7 +64,6 @@ required:
>    - interrupts
>    - clocks
>    - clock-names
> -  - fsl,blk-ctrl
>    - ports
>  
>  allOf:
> @@ -79,9 +76,17 @@ allOf:
>                - fsl,imx8ulp-isi
>                - fsl,imx93-isi
>      then:
> +      required:
> +        - fsl,blk-ctrl
>        properties:
>          interrupts:
>            maxItems: 1
> +        clocks:
> +          maxItems: 2
> +        clock-names:
> +          items:
> +            - const: axi
> +            - const: apb
>          ports:
>            properties:
>              port@0:
> @@ -96,9 +101,17 @@ allOf:
>            contains:
>              const: fsl,imx8mp-isi
>      then:
> +      required:
> +        - fsl,blk-ctrl
>        properties:
>          interrupts:
>            maxItems: 2
> +        clocks:
> +          maxItems: 2
> +        clock-names:
> +          items:
> +            - const: axi
> +            - const: apb
>          ports:
>            properties:
>              port@0:
> @@ -109,6 +122,56 @@ allOf:
>              - port@0
>              - port@1
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx8qm-isi
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 8
> +        clock-names:
> +          items:
> +            pattern: "^per[0-7]"
> +        interrupts:
> +          minItems: 8
> +        ports:
> +          properties:
> +            port@2:
> +              description: MIPI CSI-2 RX 0
> +            port@3:
> +              description: MIPI CSI-2 RX 1
> +          required:
> +            - port@2
> +            - port@3

This schema is completely missing proper schemas for port nodes. It 
needs to reference the port schema for each port. That should be at the 
top-level.

I think this addition is borderline whether it should be its own schema 
doc. The if/then schemas are larger than the main part. The ports are 
not even the same.

Rob

