Return-Path: <linux-media+bounces-16418-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EF9955E4F
	for <lists+linux-media@lfdr.de>; Sun, 18 Aug 2024 19:40:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DCD8D1F21307
	for <lists+linux-media@lfdr.de>; Sun, 18 Aug 2024 17:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28FF0148FF6;
	Sun, 18 Aug 2024 17:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WBFJeSNd"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0115D1D551;
	Sun, 18 Aug 2024 17:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724002798; cv=none; b=BGJCmuUd84ZZXr+plhF6l/rzDUSdwg+IzrRGtC3ik0hbg8Xfoi7FSCUXYkgidjI54Gq0lwyglLiHE9XNpR0X+wBg4K3YbtE/r2LUR5J4v/ocrXOGWZf56GUMdzW+0SVGjuXUlc59BAhEVesnrwOps9TqlII+djhfAHeE6Wl3fhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724002798; c=relaxed/simple;
	bh=6NFleQQ8uoTsdRsgwjRfaHxpwgXMOkxjT/INLX4FEHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KESGRY+f58OLDM3q/7ja8D7S9rhmnlaT8vZbmRnYhZ2KlwZSeGaRRQ+csKBg2besEXB6V4UaeY5Nme1zCoj8GU4dxLJ1LZWrMllnh+5+ShB+MKI76L2vy0oJmG8ahjrldUogeRyp4hmLNz4obCZmeCHh/uFzV8xrKovwg+sidd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WBFJeSNd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 91413541;
	Sun, 18 Aug 2024 19:38:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724002734;
	bh=6NFleQQ8uoTsdRsgwjRfaHxpwgXMOkxjT/INLX4FEHg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WBFJeSNdxeVkvsAQG0gIGjpRNyaBOTuY7Gg2fKFLpUcaY85vJVmFkOwmVPfZNKpnq
	 eDbsgTka2/bBkMjn5ZYYRWgwF+E1r+UPk4K45Si+GQupuEY2mE2nhCrJ6C6QRnuYJ4
	 ogdB/UuNamSGrCVOT2F3w4RuCPs7koCD8uguDmkg=
Date: Sun, 18 Aug 2024 20:39:28 +0300
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
Subject: Re: [PATCH 2/2] media: dt-bindings: renesas,vsp1: add top-level
 constraints
Message-ID: <20240818173928.GB29465@pendragon.ideasonboard.com>
References: <20240818172937.121928-1-krzysztof.kozlowski@linaro.org>
 <20240818172937.121928-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240818172937.121928-2-krzysztof.kozlowski@linaro.org>

Hi Krzysztof,

Thank you for the patch.

On Sun, Aug 18, 2024 at 07:29:37PM +0200, Krzysztof Kozlowski wrote:
> Properties with variable number of items per each device are expected to
> have widest constraints in top-level "properties:" block and further
> customized (narrowed) in "if:then:".  Add missing top-level constraints
> for clocks and clock-names.

Same comments here as for patch 1/2.

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/media/renesas,vsp1.yaml  | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> index 3265e922647c..94c0ab9a5be2 100644
> --- a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> @@ -32,8 +32,15 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> -  clocks: true
> -  clock-names: true
> +  clocks:
> +    minItems: 1
> +    maxItems: 3
> +
> +  clock-names:
> +    items:
> +      - const: aclk
> +      - const: pclk
> +      - const: vclk
>  
>    power-domains:
>      maxItems: 1
> @@ -81,11 +88,6 @@ allOf:
>              - description: Main clock
>              - description: Register access clock
>              - description: Video clock
> -        clock-names:
> -          items:
> -            - const: aclk
> -            - const: pclk
> -            - const: vclk
>        required:
>          - clock-names
>      else:

-- 
Regards,

Laurent Pinchart

