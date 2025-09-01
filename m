Return-Path: <linux-media+bounces-41466-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0464B3EB48
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 17:47:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9E9407A636C
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 15:45:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2E442D5957;
	Mon,  1 Sep 2025 15:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZD5WCl6g"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87EE202997;
	Mon,  1 Sep 2025 15:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756741594; cv=none; b=hRktzUZGGpBMbLj6b32ckA7dYP1N9LR2gkKVXrGaENz6N4DeNvgLa8RjAwFMUg6VrjnRk2BllnRwgPxrfudKoTPHT2hQXp/ha1F7e4KPZF/Wq3vAgOlAb+Tp8k2CZGlVl1TNGXTB6VDbGgvfPYssWWHT82pNZTs3cqyUZ16h4Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756741594; c=relaxed/simple;
	bh=Rtorms0Y8xcxRezMkXYYQWv9ZH000JtLph0sJAKDMHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GefwJGqYTCo5JjsV++TViMRPN8aItBp/aiIyl+Gn5NN4ApNcHQoPpoMlY5iYv/48sJSLbB/NsPeOAEL3RckdSwcZasUcoQbVfyQpHrRjpSImC6l+1qFluZ1SiPJhsBSeiz5ahOgwA8XOt8eScx1447QSXmrPaBURg9MDO1W+g7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZD5WCl6g; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id BA526E8A;
	Mon,  1 Sep 2025 17:45:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756741523;
	bh=Rtorms0Y8xcxRezMkXYYQWv9ZH000JtLph0sJAKDMHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZD5WCl6gznFYbvwUnNzz6vwIBq/2t0l0g6ae24Zq9w7aovOcQIf7uMu1roOSB85Ro
	 fTUq+4fYoQJxfzny+jG68ZsmAx1HW42143vtbIYZaqbItIZ3Ri5O2RHSXrGq6xy77p
	 kygdRmzqc9FYVNA0XjwoOPHqTJNG6bhtSV6U9LLA=
Date: Mon, 1 Sep 2025 17:46:10 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@nxp.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/4] media: dt-bindings: nxp,imx8mq-mipi-csi2: Add
 i.MX8ULP compatible string
Message-ID: <20250901154610.GB13448@pendragon.ideasonboard.com>
References: <20250901-csi2_imx8ulp-v5-0-67964d1471f3@nxp.com>
 <20250901-csi2_imx8ulp-v5-1-67964d1471f3@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250901-csi2_imx8ulp-v5-1-67964d1471f3@nxp.com>

Hi Guoniu,

Thank you for the patch.

On Mon, Sep 01, 2025 at 02:25:29PM +0800, Guoniu Zhou wrote:
> The CSI-2 receiver in the i.MX8ULP is almost identical to the version
> present in the i.MX8QXP/QM, but i.MX8ULP CSI-2 controller needs pclk
> clock as the input clock for its APB interface of Control and Status
> register(CSR). So add compatible string fsl,imx8ulp-mipi-csi2 and
> increase maxItems of Clocks (clock-names) to 4 from 3.  And keep the
> same restriction for existed compatible.

s/existed/existing/

> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
>  .../bindings/media/nxp,imx8mq-mipi-csi2.yaml       | 46 ++++++++++++++++++++--
>  1 file changed, 43 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> index 3389bab266a9adbda313c8ad795b998641df12f3..412cedddb0efee1a49d1b90b02baa7a625c797ec 100644
> --- a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> @@ -21,7 +21,9 @@ properties:
>            - fsl,imx8mq-mipi-csi2
>            - fsl,imx8qxp-mipi-csi2
>        - items:
> -          - const: fsl,imx8qm-mipi-csi2
> +          - enum:
> +              - fsl,imx8qm-mipi-csi2
> +              - fsl,imx8ulp-mipi-csi2
>            - const: fsl,imx8qxp-mipi-csi2

According to this, the ULP version is compatible with the QXP version.

>  
>    reg:
> @@ -39,12 +41,16 @@ properties:
>                       clock that the RX DPHY receives.
>        - description: ui is the pixel clock (phy_ref up to 333Mhz).
>                       See the reference manual for details.
> +      - description: pclk is clock for csr APB interface.
> +    minItems: 3
>  
>    clock-names:
>      items:
>        - const: core
>        - const: esc
>        - const: ui
> +      - const: pclk
> +    minItems: 3
>  
>    power-domains:
>      maxItems: 1
> @@ -130,19 +136,53 @@ allOf:
>          compatible:
>            contains:
>              enum:
> -              - fsl,imx8qxp-mipi-csi2
> +              - fsl,imx8ulp-mipi-csi2
> +    then:
> +      properties:
> +        reg:
> +          minItems: 2
> +        resets:
> +          minItems: 2
> +          maxItems: 2
> +        clocks:
> +          minItems: 4
> +        clock-names:
> +          minItems: 4

But according to this, the ULP version requires more clocks than the QXP
version.

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx8qm-mipi-csi2

QM is compatible with the QXP, so you don't need to list it here.

          contains:
            const: fsl,imx8qxp-mipi-csi2

is enough to cover both.

> +            const: fsl,imx8qxp-mipi-csi2
>      then:
>        properties:
>          reg:
>            minItems: 2
>          resets:
>            maxItems: 1
> -    else:
> +        clocks:
> +          maxItems: 3
> +        clock-names:
> +          maxItems: 3
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx8mq-mipi-csi2
> +    then:
>        properties:
>          reg:
>            maxItems: 1
>          resets:
>            minItems: 3
> +        clocks:
> +          maxItems: 3
> +        clock-names:
> +          maxItems: 3
>        required:
>          - fsl,mipi-phy-gpr
>  

-- 
Regards,

Laurent Pinchart

