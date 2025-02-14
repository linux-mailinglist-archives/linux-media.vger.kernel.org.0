Return-Path: <linux-media+bounces-26134-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B4EA3532A
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 01:45:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E62A51890AA5
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 00:45:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F058315E97;
	Fri, 14 Feb 2025 00:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RohPuuXf"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD1A27540A;
	Fri, 14 Feb 2025 00:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739493915; cv=none; b=J4nAYNyU5NVE50qqyErtXoZDLTx+2HjqnYvoNPK1CAFz9AK8XSDbzaGFkba69S6Kil16ycXkxZ1Wk8wfQuVIHsvytRpX/tyaY8Xnhde3ggF7cUyRwugfy57NzmIiANTQuSp9cZZjpD7M7CUxc9F1m+JJkK1iVzw3i1G2J0ySpq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739493915; c=relaxed/simple;
	bh=oyjevGJ8IHhrCs9/8i/VZcSgCIOLD3gMW4ZvgQR+Rdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lUjreOr7TrIBCjfDu+46ujlxLWWjov6zJCjF/+nMc7Pg/8lKIvz069NfMg6n5au2peE2eGklNzbW4xsvLYcwhoPolAmTND3XSrsArawAOJNMf9HIaRgfgyvmSjPJ3ZxX/SCy+x4i2T3QsexFRa/kMoepfim8wfIuHEiDGasPko8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RohPuuXf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 186DF6B5;
	Fri, 14 Feb 2025 01:43:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739493833;
	bh=oyjevGJ8IHhrCs9/8i/VZcSgCIOLD3gMW4ZvgQR+Rdc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RohPuuXfeG2HxdHXs7zrM4XWUBksaywkLxtYC5ZADHEBE35VpBIW7ibSdNXlKQc+l
	 8uPNca8CJaGpvciTcQuICw+dfm9fBBjKj4MrrKdvWyJtvDA7SffsDJ5GqZv61V9q2Z
	 S6utJ32m4Glwb50IbdJd8nG/yGBK8K0ZXZDA2HPE=
Date: Fri, 14 Feb 2025 02:45:00 +0200
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
Subject: Re: [PATCH 4/8] media: dt-bindings: renesas,rzg2l-cru: Document
 Renesas RZ/G3E SoC
Message-ID: <20250214004500.GC8393@pendragon.ideasonboard.com>
References: <20250210114540.524790-1-tommaso.merciai.xr@bp.renesas.com>
 <20250210114540.524790-5-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250210114540.524790-5-tommaso.merciai.xr@bp.renesas.com>

Hi Tommaso,

Thank you for the patch.

On Mon, Feb 10, 2025 at 12:45:36PM +0100, Tommaso Merciai wrote:
> The CRU block found on the Renesas RZ/G3E ("R9A09G047") SoC has five
> interrups:
> 
>  - image_conv:    image_conv irq
>  - axi_mst_err:   AXI master error level irq
>  - vd_addr_wend:  Video data AXI master addr 0 write end irq
>  - sd_addr_wend:  Statistics data AXI master addr 0 write end irq
>  - vsd_addr_wend: Video statistics data AXI master addr 0 write end irq
> 
> This IP has only one input port 'port@1' similar to the RZ/G2UL CRU.
> 
> Document the CRU block found on the Renesas RZ/G3E ("R9A09G047") SoC.
> 
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
>  .../bindings/media/renesas,rzg2l-cru.yaml     | 33 ++++++++++++-------
>  1 file changed, 22 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml b/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
> index bc1245127025..7e4a7ed56378 100644
> --- a/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
> @@ -17,24 +17,34 @@ description:
>  
>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          - renesas,r9a07g043-cru       # RZ/G2UL
> -          - renesas,r9a07g044-cru       # RZ/G2{L,LC}
> -          - renesas,r9a07g054-cru       # RZ/V2L
> -      - const: renesas,rzg2l-cru
> +    oneOf:
> +      - items:
> +          - enum:
> +              - renesas,r9a07g043-cru       # RZ/G2UL
> +              - renesas,r9a07g044-cru       # RZ/G2{L,LC}
> +              - renesas,r9a07g054-cru       # RZ/V2L
> +          - const: renesas,rzg2l-cru
> +
> +      - const: renesas,r9a09g047-cru        # RZ/G3E
>  
>    reg:
>      maxItems: 1
>  
>    interrupts:
> -    maxItems: 3
> +    maxItems: 5
>  
>    interrupt-names:
> -    items:
> -      - const: image_conv
> -      - const: image_conv_err
> -      - const: axi_mst_err
> +    oneOf:
> +      - items:
> +          - const: image_conv
> +          - const: image_conv_err
> +          - const: axi_mst_err
> +      - items:
> +          - const: image_conv
> +          - const: axi_mst_err
> +          - const: vd_addr_wend
> +          - const: sd_addr_wend
> +          - const: vsd_addr_wend

This should move to a conditional block.

>  
>    clocks:
>      items:
> @@ -120,6 +130,7 @@ allOf:
>            contains:
>              enum:
>                - renesas,r9a07g043-cru
> +              - renesas,r9a09g047-cru
>      then:
>        properties:
>          ports:

-- 
Regards,

Laurent Pinchart

