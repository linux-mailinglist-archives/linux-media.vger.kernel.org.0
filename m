Return-Path: <linux-media+bounces-26398-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C930A3C2CA
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 15:57:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86C923B7A3E
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 14:53:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 158761F3BA9;
	Wed, 19 Feb 2025 14:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WSbOlnUw"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8441F30DD;
	Wed, 19 Feb 2025 14:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739976776; cv=none; b=OMWZYdi9LKs27x0f1eO66+U+dOBfDQ/yvqrd3P8U01+rHM6imc2dkc3RfNl/P8WxiopSvkNd5mKVSZqIUJxFXNJ3wXow5X2VQBkTWDqSHwxEydmFCKpxvnzBLAADEPUCg/MAB+HTD3ygxY4P8FrHJ240q9QSvBiTnd7uQAkk70Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739976776; c=relaxed/simple;
	bh=5fdkaYxmkiuS0O2wwH2fC6Bj9UIsx/wgYIAqJHd76ZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f/xzchMBwdmiV/TbpW3bApDtQW+vDXUzvHlMvZKZziab/ICjkjpy1bZY1d/ye5Lf0GbeNzffzZ93Fb1pJv7nTNrQDyVfW6k8spwvtUGPS+F14JwKQqvTl+WHtj8kIQ0Aj+qwIzSIKO5s3zqG11cSuFWZx/eqAJF85k0c1tV28l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WSbOlnUw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FD4FC4CEE7;
	Wed, 19 Feb 2025 14:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739976775;
	bh=5fdkaYxmkiuS0O2wwH2fC6Bj9UIsx/wgYIAqJHd76ZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WSbOlnUwbyx21Kk/13KAa/JxRDtuzPKpq1ztPse4WrCPyCst6Fw+tSGq0q5hmw34B
	 Nu0XGfVnc9RAYS36Qxzb4Vy+/E3CrEzwy+X3ya8wbyhFpGS1ZuHr+MIL0nzC1ky9mm
	 orMm5HqFKfbSkYtp7bMTQ8yuzSDgJKn5dUC0vuHSiPrOemOBVPjk2Z0w2/UC2cQopm
	 tIgkRj443UV7jvYcj/cYIuEPQzH2Qx66RCvRCXM7pJkckThQNrvE2a+L6cJMV++8wD
	 GVEQ7+p8yJeZo8Hr8NG7VTDJaVwZT/CEMFf1G0HDJkZSpJ//0HDQMwFndb8KvlDTHy
	 74MKVMAOifiuw==
Date: Wed, 19 Feb 2025 08:52:54 -0600
From: Rob Herring <robh@kernel.org>
To: Tommaso Merciai <tomm.merciai@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/8] media: dt-bindings: renesas,rzg2l-csi2: Document
 Renesas RZ/V2H(P) SoC
Message-ID: <20250219145254.GB2551711-robh@kernel.org>
References: <20250210114540.524790-1-tommaso.merciai.xr@bp.renesas.com>
 <20250210114540.524790-3-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210114540.524790-3-tommaso.merciai.xr@bp.renesas.com>

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

These are correct, but...

> +
> +    else:
> +      properties:
> +        clocks:
> +          maxItems: 3
> +
> +        clock-names:
> +          maxItems: 3

3 is already the max. You need 'minItems' here.

Rob

