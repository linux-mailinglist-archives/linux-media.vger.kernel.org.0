Return-Path: <linux-media+bounces-45595-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E83D9C0B830
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 01:06:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 95E2A4E21AC
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 00:06:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 522F9E571;
	Mon, 27 Oct 2025 00:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fLLij5vd"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B82C46B5;
	Mon, 27 Oct 2025 00:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761523555; cv=none; b=BLtGVMcdXamHVNvWi6fa23v4yi1Z/K7q7VveY5vyGVRj3gduY9KT5oIWaxnlAiPejjB8+lesraTzQZl8Q1KYW4X0jee0ZBM0CiazGEHk3ZgbRGlUOyGl93IVG2qPmJGE/V9RqG7++Wjug+D0XgEUXw8MYGKVE0cLbvq1bRttb0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761523555; c=relaxed/simple;
	bh=auHda76l+GnxC4l4AX5IUbUQ0/OD6TFUuSzzllIMoqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q/BI+7faxSSa4pq6qBXjIuo0Xt5R9m+9uwqWT6AYpJs4MNNKMhxwXcFDovsfqJF+OkxsX/PNGkxGSP8b3akulTviqYu/jtCpnuQH8HQ8LS4AEumy5N5LcY+PBPLAD13qhloGNR+Bel8BRp/xpatJkPyx0tifUJlAfCjBFHD625k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fLLij5vd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-161-16.bb.dnainternet.fi [82.203.161.16])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 22ABD1440;
	Mon, 27 Oct 2025 01:04:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761523444;
	bh=auHda76l+GnxC4l4AX5IUbUQ0/OD6TFUuSzzllIMoqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fLLij5vdwxx78VYqIbIQ13SNB7tBegPvOc5vBzcKSKHeZNO8Ess/4v88akdINieS5
	 c6XpNEGOBGxaCcazwaQQYVzLt1wT8w99Vs7rtI3rLMk6ImLsXMS9eje7T18tXylEZz
	 y5o0p/EeKkKbR9JVwvbDY4dSkQMcjFzCYIJvc8+o=
Date: Mon, 27 Oct 2025 02:05:37 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
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
	linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v7 1/5] media: dt-bindings: nxp,imx8mq-mipi-csi2: Add
 i.MX8ULP compatible string
Message-ID: <20251027000537.GM13023@pendragon.ideasonboard.com>
References: <20251023-csi2_imx8ulp-v7-0-5ecb081ce79b@nxp.com>
 <20251023-csi2_imx8ulp-v7-1-5ecb081ce79b@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251023-csi2_imx8ulp-v7-1-5ecb081ce79b@nxp.com>

Hi Guoniu,

On Thu, Oct 23, 2025 at 05:19:42PM +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
> 
> The CSI-2 receiver in the i.MX8ULP is almost identical to the version
> present in the i.MX8QXP/QM, but i.MX8ULP CSI-2 controller needs pclk
> clock as the input clock for its APB interface of Control and Status
> register(CSR). So add compatible string fsl,imx8ulp-mipi-csi2 and
> increase maxItems of Clocks (clock-names) to 4 from 3.  And keep the
> same restriction for existing compatible.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
>  .../bindings/media/nxp,imx8mq-mipi-csi2.yaml       | 41 ++++++++++++++++++++--
>  1 file changed, 39 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> index 3389bab266a9adbda313c8ad795b998641df12f3..da3978da1cab75292ada3f24837443f7f4ab6418 100644
> --- a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> @@ -20,6 +20,7 @@ properties:
>        - enum:
>            - fsl,imx8mq-mipi-csi2
>            - fsl,imx8qxp-mipi-csi2
> +          - fsl,imx8ulp-mipi-csi2
>        - items:
>            - const: fsl,imx8qm-mipi-csi2
>            - const: fsl,imx8qxp-mipi-csi2
> @@ -39,12 +40,16 @@ properties:
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
> @@ -130,19 +135,51 @@ allOf:
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

Do we need the clock-names constraint ? The DT schemas will enforce that
clocks and clock-names always have the same number of elements.

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
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

Could you please sort those conditional blocks by alphabetical order of
the compatible strings ?

-- 
Regards,

Laurent Pinchart

