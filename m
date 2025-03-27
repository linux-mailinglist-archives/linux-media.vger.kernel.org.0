Return-Path: <linux-media+bounces-28881-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E41A73EFD
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 20:47:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBDE9881067
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 19:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49B8921CC56;
	Thu, 27 Mar 2025 19:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="plHOSKhi"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090EA219A9D;
	Thu, 27 Mar 2025 19:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743104417; cv=none; b=h16tXbVzO3fa1G6pSi5zPE92VF0fo0xrKDaakhomQ/YPcH/fmqZpUVyUrLlhH/5hoeudcEt0VNhk7NUFHf44YY5JJPltiAUFGCeexxg97zCe3tOj0x4Wnkqb9v6JldWbOTAL3YXBNC/PKnm4dgxRlc+Cyhr5j5QBeZ7oDsdLmoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743104417; c=relaxed/simple;
	bh=sExg9F8y8vGlQy/7nA7zkKPHGm1kx8ymbfVtL2PE38A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LA5qqbqDGGUHpA03lZNpN+a/W3UzjnoabqgYVijH2+VyEXGeeohEdXQdwf5Pdu9NCOvUU8PWwwRTU0q40DDguI+SaR6yTFterKrNNaNHUpVIXJ1QLJBkHzYchlLKUQHeZLKN/hhcnbMtFi2FTFVSFwsqSQRRZgYFfkk3N+3C6VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=plHOSKhi; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6C0DA446;
	Thu, 27 Mar 2025 20:38:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743104305;
	bh=sExg9F8y8vGlQy/7nA7zkKPHGm1kx8ymbfVtL2PE38A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=plHOSKhi6KcECMrx+0gSCODQ0vqJGdU7L/Uu+YerzWTQYTmEqNYh76XmD/FrNZVD0
	 e12hkjaI5AV2PvOMlsUxjYOY0O/wjAAlR4H2nkJvKXoVaipBKQA8HQcOlXStQ9WH0O
	 E4r3BiGX2gKE3S6ndMahDXFx6fluDFjVyjOU36Jk=
Date: Thu, 27 Mar 2025 21:39:51 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	Robert Chiras <robert.chiras@nxp.com>,
	"Guoniu.zhou" <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v3 06/12] media: dt-bindings: nxp,imx8mq-mipi-csi2: Add
 i.MX8QM(QXP) compatible strings
Message-ID: <20250327193951.GF4861@pendragon.ideasonboard.com>
References: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com>
 <20250210-8qxp_camera-v3-6-324f5105accc@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250210-8qxp_camera-v3-6-324f5105accc@nxp.com>

Hi Frank,

Thank you for the patch.

On Mon, Feb 10, 2025 at 03:59:25PM -0500, Frank Li wrote:
> From: Robert Chiras <robert.chiras@nxp.com>
> 
> Add compatible strings for i.MX8QM/i.MX8QXP platform. Remove
> fsl,mipi-phy-gpr from required properties and add new reg space, since
> i.MX8QM and i.MX8QXP use dedicate control and status register(csr) space.
> 
> Keep the same restriction for other compatible strings.
> 
> Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change from v2 to v3
> - use dedicate csr register space
> change from v1 to v2
> - remove internal review tags
> - remove reg maxitems:1
> - remove 8ulp part
> - add 8qxp compatible string and make 8qm failback to 8qxp
> - limit reset and power domain number to 1 for 8qxp and 8qm
> - remove power-domains change because 8qm/8qxp only need 1 power domain
> ---
>  .../bindings/media/nxp,imx8mq-mipi-csi2.yaml       | 38 +++++++++++++++++++---
>  1 file changed, 34 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> index 2a14e3b0e0040..522449e50079e 100644
> --- a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> @@ -16,11 +16,19 @@ description: |-
>  
>  properties:
>    compatible:
> -    enum:
> -      - fsl,imx8mq-mipi-csi2
> +    oneOf:
> +      - enum:
> +          - fsl,imx8mq-mipi-csi2
> +          - fsl,imx8qxp-mipi-csi2
> +      - items:
> +          - const: fsl,imx8qm-mipi-csi2
> +          - const: fsl,imx8qxp-mipi-csi2
>  
>    reg:
> -    maxItems: 1
> +    items:
> +      - description: mipi csi2 rx host controller register.

s/mipi csi2 rx/MIPI CSI-2 RX/

> +      - description: mipi csi2 control and status register (csr).

Same here, and s/csr/CSR/

> +    minItems: 1
>  
>    clocks:
>      items:
> @@ -46,6 +54,7 @@ properties:
>        - description: CORE_RESET reset register bit definition
>        - description: PHY_REF_RESET reset register bit definition
>        - description: ESC_RESET reset register bit definition
> +    minItems: 1

Is this because on QM and QXP the three resets are handled by the SCU,
which exposes them as a single reset ? The reset description is then not
very accurate anymore, but I suppose we can live with that.

With the above small changes,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  
>    fsl,mipi-phy-gpr:
>      description: |
> @@ -113,9 +122,30 @@ required:
>    - clock-names
>    - power-domains
>    - resets
> -  - fsl,mipi-phy-gpr
>    - ports
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx8qxp-mipi-csi2
> +    then:
> +      properties:
> +        reg:
> +          minItems: 2
> +        resets:
> +          maxItems: 1
> +    else:
> +      properties:
> +        reg:
> +          maxItems: 1
> +        resets:
> +          minItems: 3
> +      required:
> +        - fsl,mipi-phy-gpr
> +
>  additionalProperties: false
>  
>  examples:

-- 
Regards,

Laurent Pinchart

