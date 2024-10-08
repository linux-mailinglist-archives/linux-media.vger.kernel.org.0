Return-Path: <linux-media+bounces-19257-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38553994F19
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 15:24:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F377E2829DE
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 13:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD4B61DFDB0;
	Tue,  8 Oct 2024 13:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dmqzzBKP"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3EF1DFDBD;
	Tue,  8 Oct 2024 13:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728393793; cv=none; b=h1ToY0AWkCfZ1Trxj31vy/C34TieodrAImjiFcim7ld3J8XF+5Ir2FbKOKCt7kbECrSK4Wqoa1BG7wITmOATEVE+rRNZ0ceixMnRsRerkED9rs+4ljwr2eJ0qdHg3jgMkto38OPpjc117heHrmDtxCzzqEZxnYNTSnV8Rpp7O6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728393793; c=relaxed/simple;
	bh=G6INLuaaIukQElfuCzHeq8WikAfpGMesESZCDNnEtBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZZDmF+AXTbMlD1Zi+0feH03XO0F8yTZUHJCne35IO/ILmWHJCM8T7mrYlUiEEOMYM3rmesQIzMVWJmDxUEclq5ARD36vLvdBlDHpdPooRTjrvgW+hPJdyIiPz3RZneBUAXJ1mm3ea6Aly1u+EnG0CJx7sU8I6Mkhllpizz4qilQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dmqzzBKP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15856C4CED7;
	Tue,  8 Oct 2024 13:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728393792;
	bh=G6INLuaaIukQElfuCzHeq8WikAfpGMesESZCDNnEtBs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dmqzzBKP85lR+8OXQtT+zykw7IugpJp6dCPdDHKscNFdzOPrOxNJP9si8ZNdroebx
	 iBVtvi/ulKfvbHUEQuQGR4vkxVd8FtL4xc2c0UUBaw7sx8rtyda2wB8f06hG0fmdY3
	 J7Y3ieUk9Ot21yIccVzLSqDFkW/KqmGyvS17D1gp4qiriMjESCi1crO192nDPy5FSH
	 EJH4eVsubhEZ/Ik+O4CWSbPxedoQQ3O4INDpMDKNGR5n8btNAv7lmQrECltMpsGnqV
	 cURiSl3dtqDQXdGEWfC4243IaSzuYlE0lzsA0gb20DY1mjS6eP+WmJYSmDf0qbaW0S
	 EoriZKgo3wsEQ==
Date: Tue, 8 Oct 2024 15:23:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: Hugues Fruchet <hugues.fruchet@foss.st.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 02/15] dt-bindings: media: addition of stm32 csi driver
 description
Message-ID: <c2askprap35pmyanrfvtk333oamjjrolbxhfkar2lgoow4gpcr@xfikinnrs42e>
References: <20241008-csi_dcmipp_mp25-v1-0-e3fd0ed54b31@foss.st.com>
 <20241008-csi_dcmipp_mp25-v1-2-e3fd0ed54b31@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241008-csi_dcmipp_mp25-v1-2-e3fd0ed54b31@foss.st.com>

On Tue, Oct 08, 2024 at 01:18:04PM +0200, Alain Volmat wrote:
> Addition of the stm32 csi controller driver

This is supposed to be about hardware, not driver. Missing full stop.

> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  .../devicetree/bindings/media/st,stm32-csi.yaml    | 129 +++++++++++++++++++++

Use compatible as filename.

>  1 file changed, 129 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/st,stm32-csi.yaml b/Documentation/devicetree/bindings/media/st,stm32-csi.yaml
> new file mode 100644
> index 000000000000..71e7c51be58c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/st,stm32-csi.yaml
> @@ -0,0 +1,129 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/st,stm32-csi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics STM32 CSI controller
> +
> +description:
> +  The STM32 CSI controller allows connecting a CSI based
> +  camera to the DCMIPP camera pipeline.
> +
> +maintainers:
> +  - Alain Volmat <alain.volmat@foss.st.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - st,stm32mp25-csi
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 3
> +
> +  clock-names:
> +    items:
> +      - const: pclk
> +      - const: txesc
> +      - const: csi2phy
> +
> +  resets:
> +    maxItems: 1
> +
> +  vdd-supply:
> +    description: Digital core power supply (0.91V)
> +
> +  vdda18-supply:
> +    description: System analog power supply (1.8V)
> +
> +  access-controllers:
> +    minItems: 1
> +    maxItems: 2
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port node
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                description:
> +                  Indicate the number of data-lanes and their mapping.
> +
> +                items:

Drop

... and test your patches. Mailing list is not the place to test them.
Your machine is.

> +                  minItems: 1
> +                  items:
> +                    - const: 1
> +                    - const: 2
> +
> +            required:
> +              - data-lanes
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Output port node
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - resets
> +  - ports

Best regards,
Krzysztof


