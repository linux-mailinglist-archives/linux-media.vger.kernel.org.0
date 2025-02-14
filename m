Return-Path: <linux-media+bounces-26133-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A757A352E4
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 01:30:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E9C337A3D29
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 00:29:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD72A17E;
	Fri, 14 Feb 2025 00:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QK2q9O7u"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8641563B9;
	Fri, 14 Feb 2025 00:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739493007; cv=none; b=PmgOgPbAlxzrZ+XJp2lkkFDT8vkEsZVSVZxGAicc4YApbyJCAgTesCjyuKf+eDFX7UD7L4hhSUtJr7bhwGqzsIWSJXxAQfafvG7cg+VRLso7WzP4IKX2Qkv13Is3vqvy35MVasdQl/+fxuVaJv2bxYquJS3vvFufnI19l+djJW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739493007; c=relaxed/simple;
	bh=SD2Tp/bT1TSNnNbejk5XRqRa82P1R5Fvpsrw01+xrVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B7uZ2waD2ZfcRYKfJEsKizP9uaYmEj38tor/7VwlWi5kBpJA+l3WLb2BfHypsLLgRwEDZp8TL7CrY2xZ3/AzHoNqDB4F9cAtBjfBOermO4jf0QdStjBQuoOE8Quu0zHID8/jejSPyKwnazb5+K3LANyDHu+DKh65/YkbOKAiO88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QK2q9O7u; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7D94F6B5;
	Fri, 14 Feb 2025 01:28:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739492924;
	bh=SD2Tp/bT1TSNnNbejk5XRqRa82P1R5Fvpsrw01+xrVA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QK2q9O7uDmD5il2Cr2B9mEhOfGnTQE8I4t+4dnnAlClqR+wp3VJJTZVuUtNqrDT1f
	 K2WQoU374ztCkNO9LQVc9T5Yifmeo6El6Lt2Bsuc85OGvFl+38p2EXswHHhrt29zma
	 TThmN9mLLWUT4BqGL0CAzDh7VXeHH9p3+Xy7ZjvA=
Date: Fri, 14 Feb 2025 02:29:51 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tommaso Merciai <tomm.merciai@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/8] media: dt-bindings: renesas,rzg2l-csi2: Document
 Renesas RZ/V2H(P) SoC
Message-ID: <20250214002951.GB8393@pendragon.ideasonboard.com>
References: <20250210114540.524790-1-tommaso.merciai.xr@bp.renesas.com>
 <20250210114540.524790-3-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250210114540.524790-3-tommaso.merciai.xr@bp.renesas.com>

Hi Tommaso, Prabhakar,

Thank you for the patch.

On Mon, Feb 10, 2025 at 12:45:34PM +0100, Tommaso Merciai wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> The MIPI CSI-2 block on the Renesas RZ/V2H(P) SoC is similar to the one
> found on the Renesas RZ/G2L SoC, with the following differences:
> - A different D-PHY
> - Additional registers for the MIPI CSI-2 link
> - Only two clocks
> 
> Add a new compatible string, `renesas,r9a09g057-csi2`, for the RZ/V2H(P)
> SoC.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
>  .../bindings/media/renesas,rzg2l-csi2.yaml    | 63 ++++++++++++++-----
>  1 file changed, 48 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
> index 7faa12fecd5b..0d07c55a3f35 100644
> --- a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
> @@ -17,12 +17,15 @@ description:
>  
>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          - renesas,r9a07g043-csi2       # RZ/G2UL
> -          - renesas,r9a07g044-csi2       # RZ/G2{L,LC}
> -          - renesas,r9a07g054-csi2       # RZ/V2L
> -      - const: renesas,rzg2l-csi2
> +    oneOf:
> +      - items:
> +          - enum:
> +              - renesas,r9a07g043-csi2 # RZ/G2UL
> +              - renesas,r9a07g044-csi2 # RZ/G2{L,LC}
> +              - renesas,r9a07g054-csi2 # RZ/V2L
> +          - const: renesas,rzg2l-csi2
> +

I'd drop the empty line.

> +      - const: renesas,r9a09g057-csi2 # RZ/V2H(P)
>  
>    reg:
>      maxItems: 1
> @@ -31,16 +34,24 @@ properties:
>      maxItems: 1
>  
>    clocks:
> -    items:
> -      - description: Internal clock for connecting CRU and MIPI
> -      - description: CRU Main clock
> -      - description: CRU Register access clock
> +    oneOf:
> +      - items:
> +          - description: Internal clock for connecting CRU and MIPI
> +          - description: CRU Main clock
> +          - description: CRU Register access clock
> +      - items:
> +          - description: CRU Main clock
> +          - description: CRU Register access clock
>  
>    clock-names:
> -    items:
> -      - const: system
> -      - const: video
> -      - const: apb
> +    oneOf:
> +      - items:
> +          - const: system
> +          - const: video
> +          - const: apb
> +      - items:
> +          - const: video
> +          - const: apb

I would move the clocks and clock-names definitions to the conditional
below. Otherwise I think a device tree that has two clocks only but
incorrectly uses "system" and "video" instead of "video" and "apb" will
validate.

>  
>    power-domains:
>      maxItems: 1
> @@ -48,7 +59,7 @@ properties:
>    resets:
>      items:
>        - description: CRU_PRESETN reset terminal
> -      - description: CRU_CMN_RSTB reset terminal
> +      - description: CRU_CMN_RSTB reset terminal or D-PHY reset
>  
>    reset-names:
>      items:
> @@ -101,6 +112,28 @@ required:
>    - reset-names
>    - ports
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a09g057-csi2
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 2
> +
> +        clock-names:
> +          maxItems: 2
> +
> +    else:
> +      properties:
> +        clocks:
> +          maxItems: 3
> +
> +        clock-names:
> +          maxItems: 3
> +
>  additionalProperties: false
>  
>  examples:

-- 
Regards,

Laurent Pinchart

