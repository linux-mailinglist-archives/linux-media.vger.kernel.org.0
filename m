Return-Path: <linux-media+bounces-26703-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 799E8A410AA
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 19:09:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E6D7170252
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 18:09:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 423BC15747C;
	Sun, 23 Feb 2025 18:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bjgz+UQ3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B603A8F7;
	Sun, 23 Feb 2025 18:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740334155; cv=none; b=UHv84ffB2INpFx8fsjAdK0PxiKnQs8feM3+tUC6r4oRTQ2gOfnYAI93jMqt8eR2pVkb7afifEU032v1g8tw4T1P5IQ5Go3DoOwsPvKxYfZqF3yySaZapQmpf6ILPt9NTT162HZoFCR5c4d9mtOfolZ/vAAjZJ9eTizbDkeY0tRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740334155; c=relaxed/simple;
	bh=8If/he3/Ufb6GzxJlC5qz9jCuFjwtlLMYqI6GW25NbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ci5ij13q1LlTO65W3kxKpJHKoPArPjdxSH5v07djSbWXcxvGWet9x22x0GdPG1KmjM0oZnhkakTVR2hr/FPCPO38+1B8THuM49F4ePrluWjUSNcaPRdi8/D0YmUo7aPWO90EeOZbEgi2ZSEi0c1qgRfP9EntZWwME+sht4jjQpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bjgz+UQ3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9692A496;
	Sun, 23 Feb 2025 19:07:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740334066;
	bh=8If/he3/Ufb6GzxJlC5qz9jCuFjwtlLMYqI6GW25NbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bjgz+UQ3nJWuDXXgPd1/MRjVDFRw/W8WNEIcvAZXX5Flkac5RP/C/KqIn/keWllIA
	 RnS0trk+8BJp623yWJQWB+HRjZ7sYbHD/1DHajRmQo1iSlSDcSvTKCmVMtCt45XjOM
	 N/T5bq9N32lNSuXpDa03FhKUhYRC+32x7+oHF9Co=
Date: Sun, 23 Feb 2025 20:08:55 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org, biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/18] media: dt-bindings: renesas,rzg2l-csi2:
 Document Renesas RZ/V2H(P) SoC
Message-ID: <20250223180855.GD15078@pendragon.ideasonboard.com>
References: <20250221155532.576759-1-tommaso.merciai.xr@bp.renesas.com>
 <20250221155532.576759-2-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250221155532.576759-2-tommaso.merciai.xr@bp.renesas.com>

Hi Tommaso,

Thank you for the patch.

On Fri, Feb 21, 2025 at 04:55:15PM +0100, Tommaso Merciai wrote:
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
> Changes since v1:
>  - Dropped empty line as suggested by LPinchart
>  - Fixed minItems into else conditional block as suggested by RHerring
> 
>  .../bindings/media/renesas,rzg2l-csi2.yaml    | 59 ++++++++++++++-----
>  1 file changed, 44 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
> index 7faa12fecd5b..1d7784e8af16 100644
> --- a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
> @@ -17,12 +17,14 @@ description:
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
> +      - const: renesas,r9a09g057-csi2 # RZ/V2H(P)
>  
>    reg:
>      maxItems: 1
> @@ -31,16 +33,24 @@ properties:
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
>  
>    power-domains:
>      maxItems: 1
> @@ -48,7 +58,7 @@ properties:
>    resets:
>      items:
>        - description: CRU_PRESETN reset terminal
> -      - description: CRU_CMN_RSTB reset terminal
> +      - description: CRU_CMN_RSTB reset terminal or D-PHY reset

I'd mention which SoCs these apply to:

      - description:
          CRU_CMN_RSTB reset terminal (all but RZ/V2H) or D-PHY reset (RZ/V2H)

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  
>    reset-names:
>      items:
> @@ -101,6 +111,25 @@ required:
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
> +        clock-names:
> +          maxItems: 2
> +    else:
> +      properties:
> +        clocks:
> +          minItems: 3
> +        clock-names:
> +          minItems: 3
> +
>  additionalProperties: false
>  
>  examples:

-- 
Regards,

Laurent Pinchart

