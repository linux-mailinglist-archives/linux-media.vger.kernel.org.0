Return-Path: <linux-media+bounces-5801-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A008613BF
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 15:16:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B1D5EB21AA0
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 14:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 986EB8063A;
	Fri, 23 Feb 2024 14:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mCiJFOhc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2493D6FBF;
	Fri, 23 Feb 2024 14:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708697791; cv=none; b=r+5XBvM01paA8G7K5I1st4nMiHPOwVsDIGoYcaOzZ1q6qCOPWdj3lruY/usCR5M3BT70+pGKVRxDFTOsSbrWaOCgq0AKZf3aHmvgdyfb3QyXxVhFfsaLHoVfVPUVsU4SIE5IrToBxQrq8GmAkvL0ZRYCmtc27QeVhQ4189PXP5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708697791; c=relaxed/simple;
	bh=TqXkdzLDVhLjmfkgDlfUzyaXzwUQa8U/VRQmUdvZQtA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o+P2wnXui6MFgsuC8yObL/5+Ka6idrKPaUJGuhjcWuUhx0ENBqqhsYDcnqnw7uJ9HBbCGqDECbYHPt4oAsbjBfk0LwDYShPyUzF6h1n2qoGxD3NNzWGe3aM99avFA7fPcoDm04K+AdVn02LmKdOGQsRIY3JjNhQatUBl3wu9HhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mCiJFOhc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7C3679B6;
	Fri, 23 Feb 2024 15:16:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1708697777;
	bh=TqXkdzLDVhLjmfkgDlfUzyaXzwUQa8U/VRQmUdvZQtA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mCiJFOhcg1pDJeW8TqCLEovKv/psfDvLsKXVB9jlq6Ck4VK1tsU1gAvZu2N6AUvor
	 Nn8xHsHJKke7lTArFiT7rgFdwUv4WsjyTcsSQ8LY9GPPNZGAMRLPYPdxRnmVKSjj48
	 2VeqZMrAw68xnHAUitgrPuqN9Vzo0TPwmEN0AgjM=
Date: Fri, 23 Feb 2024 16:16:30 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] media: dt-bindings: nxp,imx8-isi: Allow single port
 for single pipeline models
Message-ID: <20240223141630.GA1313@pendragon.ideasonboard.com>
References: <20240223140445.1885083-1-alexander.stein@ew.tq-group.com>
 <20240223140445.1885083-3-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240223140445.1885083-3-alexander.stein@ew.tq-group.com>

Hi Alexander,

Thank you for the patch.

On Fri, Feb 23, 2024 at 03:04:44PM +0100, Alexander Stein wrote:
> In case the hardware only supports just one pipeline, allow using a
> single port node as well.

This is frowned upon in DT bindings, as it makes them more complicated
for little gain. The recommendation is to always use a ports node if a
device can have multiple ports for at least one of its compatibles.

> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  .../devicetree/bindings/media/nxp,imx8-isi.yaml    | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> index 4d5348d456a1f..f855f3cc91fea 100644
> --- a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> @@ -53,6 +53,12 @@ properties:
>    power-domains:
>      maxItems: 1
>  
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description: |
> +      Port representing the Pixel Link input to the ISI. Used for
> +      single-pipeline models. The port shall have a single endpoint.
> +
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>      description: |
> @@ -66,7 +72,6 @@ required:
>    - clocks
>    - clock-names
>    - fsl,blk-ctrl
> -  - ports
>  
>  allOf:
>    - if:
> @@ -87,6 +92,11 @@ allOf:
>              port@1: false
>            required:
>              - port@0
> +      oneOf:
> +        - required:
> +            - port
> +        - required:
> +            - ports
>  
>    - if:
>        properties:
> @@ -106,6 +116,8 @@ allOf:
>            required:
>              - port@0
>              - port@1
> +      required:
> +        - ports
>  
>  additionalProperties: false
>  

-- 
Regards,

Laurent Pinchart

