Return-Path: <linux-media+bounces-16654-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BB81B95CE15
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 15:37:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 54CC7B22502
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 13:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 999A2187332;
	Fri, 23 Aug 2024 13:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="U1r0TMXF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB66168C20;
	Fri, 23 Aug 2024 13:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724420270; cv=none; b=i+7NNK/0oE6x6ykzDNUDwPfufALVjWvyiW2zpFonLldmAC75Cd0l0D2o6i9GTn85llI27/IkQgxjsVLIB4zd2sMZQL8mBr1Puyn8b5ql5kMz0DOHEVVseNgQ5aOrnh8AtsrTyEVfbeyccWvToke519LGd6Uc3Q18xHnlEigB0Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724420270; c=relaxed/simple;
	bh=JGL9YN2ofj1WiKZrMReG0+gEqmxuRcSoAjoVnuwnvSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E53vQrAUypDcO+5y8m4PVgQnefi5vS1+/9NzwxbDyjC8BE4drvkYfDB4BO95h2b05I0z4al4Wa1ZaLtIXQRN+V1fLOxDlkHQMkdCSbQIPxMXceJITLZHbAGsKBDfLGA/IXfLxkDpOMNwc3aHXMJ5i2yrvCPMdiQVn3nRP7IXpsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=U1r0TMXF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BE5B12D5;
	Fri, 23 Aug 2024 15:36:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724420202;
	bh=JGL9YN2ofj1WiKZrMReG0+gEqmxuRcSoAjoVnuwnvSA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U1r0TMXFaW4F4RJMz4M55lQapt/TjNbEi4b6inPH3Z+Oyn3W02ihHT0Jognfln5Dn
	 iMZwTJLdgRQMxDdlbe01zYVx6jfBmh9r9v+6jjltCXUG4SaQS37uXK4nqj+kRZz2m3
	 Y+T36i17idrsJccXmC1tNXwLW8sZuTdQoYXsqLoo=
Date: Fri, 23 Aug 2024 16:37:43 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 1/6] dt-bindings: media: renesas,vin: Add Gen4 family
 fallback
Message-ID: <20240823133743.GE26098@pendragon.ideasonboard.com>
References: <20240704161620.1425409-1-niklas.soderlund+renesas@ragnatech.se>
 <20240704161620.1425409-2-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240704161620.1425409-2-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

Thank you for the patch.

On Thu, Jul 04, 2024 at 06:16:15PM +0200, Niklas Söderlund wrote:
> The Gen4 SoCs V3U, V4H and V4M have a similar video capture pipelines.
> 
> The datasheets for the SoCs have small nuances around the Pre-Clip
> registers ELPrC and EPPrC in three use-cases, interlaced images,
> embedded data and RAW8 input. On V4H the values written to the registers
> are based on odd numbers while on V4M they are even numbers, values are
> based on the input image size. No board that uses these SoCs which also
> have the external peripherals to test these nuances exists. Most likely
> this is an issue in the datasheet.
> 
> Before adding bindings for V4M add a family compatible fallback for
> Gen4. That way the driver only needs to be updated once for Gen4, and we
> still have the option to fix any problems in the driver if any testable
> differences between the SoCs are found.
> 
> There are already DTS files using the V3U and V4H compatibles which
> needs to be updated to not produce a warning for DTS checks. The driver

s/needs/need/

> also needs to kept the compatible values to be backward compatible , but

s/kept/keep/

> for new Gen4 SoCs such as V4M we can avoid this.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> * Changes since v4
> - Added V3U to the list of Gen4 devices.
> 
> * Changes since v3
> - New in v4.
> ---
>  Documentation/devicetree/bindings/media/renesas,vin.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,vin.yaml b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> index 5539d0f8e74d..aa16f1528f2d 100644
> --- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> @@ -52,8 +52,11 @@ properties:
>                - renesas,vin-r8a77980 # R-Car V3H
>                - renesas,vin-r8a77990 # R-Car E3
>                - renesas,vin-r8a77995 # R-Car D3
> +      - items:
> +          - enum:
>                - renesas,vin-r8a779a0 # R-Car V3U
>                - renesas,vin-r8a779g0 # R-Car V4H
> +          - const: renesas,rcar-gen4-vin # Generic R-Car Gen4
>  
>    reg:
>      maxItems: 1

-- 
Regards,

Laurent Pinchart

