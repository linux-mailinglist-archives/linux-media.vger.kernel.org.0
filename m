Return-Path: <linux-media+bounces-41387-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3F3B3D860
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 06:55:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 670551763C6
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 04:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A12023536C;
	Mon,  1 Sep 2025 04:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sb0PPBuy"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C14D1F5827;
	Mon,  1 Sep 2025 04:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756702522; cv=none; b=O9G2DwrfJquecieMbOSexVbC1cCijOePVhjLldElygVAujhD83Nw/WN46D+1zsAz1o0TmAP08Gwig/vj9VPTJrG059BJ6SKUAliKcVphLK9FYTigeG44oT6aguCSeMt09pnjBtSk6kgZDSf0YoZ/rAH7mxRInT7MQt1cHFWrTyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756702522; c=relaxed/simple;
	bh=FTdg3qQDLcLg/WJueya255ckIzqEnwBISq9UOPfgb1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dcgIIR9g4uS5TcfFj3SAAx8uwL+1voJ/ncJRXdirClWPk/VITXhx4olvBsrAp9iuLH9WdTtofq1LC/EmDpxT2gcI4mCrbiAac9qxsmxgB5tWpUHa99v5s/gJ6z/PgYNBuvaFAUYTjNVhAg6v9yajXX65F9pEht2bh9qj64cDIak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sb0PPBuy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F2FFC4CEF0;
	Mon,  1 Sep 2025 04:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756702521;
	bh=FTdg3qQDLcLg/WJueya255ckIzqEnwBISq9UOPfgb1g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sb0PPBuy4LNuawkiyKqy4flACZvPyACS2s8cmFCOIajbAtXsGkPnL8mGiy0wvQdwL
	 o5Y3OECor5b3FrN+UCofWsGFx3ncy6tVkRCmWH31FxH97bBVF32qAWiDO4jAmX41cL
	 OyivnUoIDI0EORzt0BmSvlxBhbIarAQSC6kxOmzrxYjOKLtdc2Vx+N7hchKZS7xtoX
	 lV0NWZbEMlLKuHPProj2luwqxlt/rN7vrVt0kRZ4iZXGhDyOG+ixZ7np2Hr6pTxeHN
	 0oxKYlxRjATQ0lp/XKAf7cbAMegR2KtPCYpozMXYlL/QMzTAgcP4bedjYjOTr9ePP3
	 v2gfk6h9iFdoA==
Date: Mon, 1 Sep 2025 06:55:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Inbaraj E <inbaraj.e@samsung.com>
Cc: rmfrfs@gmail.com, laurent.pinchart@ideasonboard.com, martink@posteo.de, 
	kernel@puri.sm, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com, 
	ravi.patel@samsung.com, shradha.t@samsung.com
Subject: Re: [PATCH v3 2/7] dt-bindings: media: fsd: Add CSIS video capture
 interface
Message-ID: <20250901-rousing-orange-crab-c05fdf@kuoka>
References: <20250828085911.81266-1-inbaraj.e@samsung.com>
 <CGME20250828085930epcas5p1719c7db08074bf1540dc85b71736a6c5@epcas5p1.samsung.com>
 <20250828085911.81266-3-inbaraj.e@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250828085911.81266-3-inbaraj.e@samsung.com>

On Thu, Aug 28, 2025 at 02:29:06PM +0530, Inbaraj E wrote:
> The Tesla FSD CSIS video capture interface is used to capture frames.
> 
> Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
> ---
>  .../bindings/media/tesla,fsd-csis-media.yaml  | 76 +++++++++++++++++++
>  1 file changed, 76 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/tesla,fsd-csis-media.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/tesla,fsd-csis-media.yaml b/Documentation/devicetree/bindings/media/tesla,fsd-csis-media.yaml
> new file mode 100644
> index 000000000000..f045094ae539
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/tesla,fsd-csis-media.yaml
> @@ -0,0 +1,76 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/tesla,fsd-csis-media.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Tesla FSD SoC MIPI CSI-2 video capture interface(Bridge device).

Drop final full stop. Also missing space before (


> +
> +maintainers:
> +  - Inbaraj E <inbaraj.e@samsung.com>
> +
> +description:
> +  The Tesla FSD CSIS has an internal video capture interface to capture
> +  frames originating from the sensor. The power supply for the IP is
> +  managed by custom firmware and is expected to remain enabled
> +  permanently, so power supply control is not added in linux.
> +
> +properties:
> +  compatible:
> +    const: tesla,fsd-csis-media
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
> +      - const: aclk
> +      - const: pclk
> +      - const: pll
> +
> +  iommus:
> +    maxItems: 1
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - iommus
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/fsd-clk.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    csis0: csis@12641000 {

Incorrect unit address.

> +        compatible = "tesla,fsd-csis-media";
> +        reg = <0x12661000 0x44c>;


Best regards,
Krzysztof


