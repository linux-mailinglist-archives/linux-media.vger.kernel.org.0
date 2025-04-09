Return-Path: <linux-media+bounces-29782-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A9CA82DC4
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 19:39:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E53D1B80B82
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 17:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6D6527605B;
	Wed,  9 Apr 2025 17:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dkpPqAhK"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892201BD517;
	Wed,  9 Apr 2025 17:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744220332; cv=none; b=hmFDlka2XrZWHJKsBgO3EgFr/SnqCtvwWhn2OIm3jUqLMzDZqLTXXz1xFY6EACeEVcF57Tvo+XNrrZDF0LcrA6aOSc2HNwJNFFrCYGYvdr+eO0i2NaGG2cu+lABDyFs4/1eeNGj9nVOG1K32QxAJqW1oVGSKdnHPpBj6suuv87Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744220332; c=relaxed/simple;
	bh=0n/+rgZUvO7/BkuZChZWWYvQxTZrFbpVt3+O4t33X4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F2PyxEVqz5bFwUL0vwrTFFNRFE7gWiDmtNATx2TXjkrQ02A5se8C2yp7kW931RmyM9MGQHu8ZT09DGXPGJEDwofnabLLWcpMPxgETByDqVevXvCBnXlu5tiYk/C8pJf600ZpkpqxT4Y9rAO5Q7urJsg85ZoI7rwGcH4mEy2jqF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dkpPqAhK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0532973B;
	Wed,  9 Apr 2025 19:36:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744220211;
	bh=0n/+rgZUvO7/BkuZChZWWYvQxTZrFbpVt3+O4t33X4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dkpPqAhK9JoVNjA+kjvyyp3E7C2ciWy6fCDK5XnWgELCR9NOf7ohwMpJ5IR305ofM
	 kjaCwf4vJQG8da1lQWe9I26NdN3qOKsvU1ty1Joa8lWCcijO6jVAGSWgmTXpLcV1LX
	 GCBqIgLAfwzizviWswtZUrNEXhRbqTtXZ7vnbjhQ=
Date: Wed, 9 Apr 2025 20:38:23 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 2/2] media: dt-bindings: media: renesas,fcp: Document
 RZ/V2H(P) SoC
Message-ID: <20250409173823.GE22519@pendragon.ideasonboard.com>
References: <20250408193158.80936-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250408193158.80936-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250408193158.80936-3-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thank you for the patch.

On Tue, Apr 08, 2025 at 08:31:58PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> The FCPVD block on the RZ/V2H(P) SoC is identical to the one found on the
> RZ/G2L SoC.
> 
> No driver changes are required, as `renesas,fcpv` will be used as a
> fallback compatible string on the RZ/V2H(P) SoC.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  Documentation/devicetree/bindings/media/renesas,fcp.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.yaml b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> index f94dacd96278..5ed9427fb757 100644
> --- a/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> @@ -30,6 +30,7 @@ properties:
>                - renesas,r9a07g043u-fcpvd # RZ/G2UL
>                - renesas,r9a07g044-fcpvd # RZ/G2{L,LC}
>                - renesas,r9a07g054-fcpvd # RZ/V2L
> +              - renesas,r9a09g057-fcpvd # RZ/V2H(P)
>            - const: renesas,fcpv         # Generic FCP for VSP fallback
>  
>    reg:
> @@ -66,6 +67,7 @@ allOf:
>                - renesas,r9a07g043u-fcpvd
>                - renesas,r9a07g044-fcpvd
>                - renesas,r9a07g054-fcpvd
> +              - renesas,r9a09g057-fcpvd
>      then:
>        properties:
>          clocks:

-- 
Regards,

Laurent Pinchart

