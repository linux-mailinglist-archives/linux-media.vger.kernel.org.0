Return-Path: <linux-media+bounces-16417-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2559A955E4A
	for <lists+linux-media@lfdr.de>; Sun, 18 Aug 2024 19:38:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C91E1C20B2D
	for <lists+linux-media@lfdr.de>; Sun, 18 Aug 2024 17:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AADDB147C86;
	Sun, 18 Aug 2024 17:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GQcNgKER"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CA8748F;
	Sun, 18 Aug 2024 17:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724002709; cv=none; b=sakdkXdcsC0PsaN/DJAJBfSUTiAojeUkev10ccZuI1Murf4zgPQEOUF+SVvj2L/GslWhlMai4MaIFrVMFQ/mpHESAI0JIMaATNXlMN17dD01M41/ETsb1o8KpwP2aJFGBdO9I11f47mGS6RmdE/KFU6eM2pDAA0Bk2rT3iUvB1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724002709; c=relaxed/simple;
	bh=qNREcpYc/mFMfPprRyDGsRNPXLVRDx6VSzdJK7ojpz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ikz3t3yISzqyzV6n3/AJeiyDIyWjikYdcFTpqHTMUxePcjWo10N1QHoCLXi2iT2m5McdkypEzpDB5vChSmiJPvDL+Tjl9GtI6vTv9o5RB8LaoBe1+O2hOxaYtfjlCrA5UVPzkg8hL1UxD8ux7sh70eo+fPIU19dm41T8M0vClBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GQcNgKER; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 85070541;
	Sun, 18 Aug 2024 19:37:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724002644;
	bh=qNREcpYc/mFMfPprRyDGsRNPXLVRDx6VSzdJK7ojpz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GQcNgKERv5IRSYCKIA+BUlMEoJ1TV1dapnrvpF6vrDMJEoClFlJsKxSFg8U2M8zj+
	 cuExb8zovEBMtC98uHTObux4XeJ0xFDyZip9LD4u2vs8ElxyhBENgxs1EHqhkEDbDA
	 BeJm+75nr9k2mNUDdO8EOoMJKB6BTkyL+Yx0uWtc=
Date: Sun, 18 Aug 2024 20:37:58 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: dt-bindings: renesas,fcp: add top-level
 constraints
Message-ID: <20240818173758.GA29465@pendragon.ideasonboard.com>
References: <20240818172937.121928-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240818172937.121928-1-krzysztof.kozlowski@linaro.org>

Hi Krzysztof,

Thank you for the patch.

On Sun, Aug 18, 2024 at 07:29:36PM +0200, Krzysztof Kozlowski wrote:
> Properties with variable number of items per each device are expected to
> have widest constraints in top-level "properties:" block and further
> customized (narrowed) in "if:then:".  Add missing top-level constraints
> for clocks and clock-names.

In this specific case I think it's fine, but generally speaking, how do
you handle that rule when different variants have completely different
clocks, not just lack some of the clocks ?

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/media/renesas,fcp.yaml    | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.yaml b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> index c6abe719881b..68c088821b22 100644
> --- a/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> @@ -34,9 +34,15 @@ properties:
>    reg:
>      maxItems: 1
>  
> -  clocks: true
> +  clocks:
> +    minItems: 1
> +    maxItems: 3
>  
> -  clock-names: true
> +  clock-names:
> +    items:
> +      - const: aclk
> +      - const: pclk
> +      - const: vclk
>  
>    iommus:
>      maxItems: 1
> @@ -71,11 +77,6 @@ allOf:
>              - description: Main clock
>              - description: Register access clock
>              - description: Video clock
> -        clock-names:
> -          items:
> -            - const: aclk
> -            - const: pclk
> -            - const: vclk

Any specific reason to move the clock names but not the descriptions ?
The assymetry bothers me.

>        required:
>          - clock-names
>      else:

-- 
Regards,

Laurent Pinchart

