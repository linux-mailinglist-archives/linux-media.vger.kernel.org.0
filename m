Return-Path: <linux-media+bounces-15445-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F29193F3AD
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 13:10:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F380CB21A1B
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 11:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F328145A18;
	Mon, 29 Jul 2024 11:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WTm4G0wS"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D6A140E29;
	Mon, 29 Jul 2024 11:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722251432; cv=none; b=Csf8QKYxySiowkekrxxSdLCphI/HYoOeAdjoCMKqTEwkY+pzG7yH16epzKxplfW0sTKqppOXpIfEUWv1AZ4HFMU8gAx5sAvsdiyPYMmTwgWIA7pYjYogzB9aDgz3K+moSR9BQ7utT/ubHoKSyShnfcKN8vJyi/DZcmEOrPhrshU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722251432; c=relaxed/simple;
	bh=SEuC/9UvNiVqA5f+ouNdsY0rFiwy5vDaj50NndaMQnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mSv+Q9rG6NI8eVEce4HYoZ9nez6Yi+g3ZKDOKKJiJ9F4qkBLPFqkHbjjZmlwXqrFUKafSziU2i70eJUMDumYvjvWxnggOAw4HmQCguarq0YZuNWjwh+vRh/Tt5kQH1h36XaAwTi8+gX9cQs1bePWMi6ShGY+yuslGgJWKYwK/EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WTm4G0wS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 13C5845A;
	Mon, 29 Jul 2024 13:09:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722251383;
	bh=SEuC/9UvNiVqA5f+ouNdsY0rFiwy5vDaj50NndaMQnI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WTm4G0wSIBzUQEQaUWvY0C1Y2Tu8sPYNmdGt6cbYyCiDkiWjoX2xBVtxGiK7cXBet
	 ZgPrdXqblQP2UDyoIXyEYinHKw4o9v71sNyDvBe91/wdEnMLGDYM/iZnTpJt/mJUMB
	 c0TwJQw8rCo2m/sYXbqSvbR2qISoY9FYV9TtHpiE=
Date: Mon, 29 Jul 2024 14:10:06 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-media@vger.kernel.org, stable@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: imx335: Mention reset-gpio polarity
Message-ID: <20240729111006.GH2320@pendragon.ideasonboard.com>
References: <20240729110437.199428-1-umang.jain@ideasonboard.com>
 <20240729110437.199428-2-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240729110437.199428-2-umang.jain@ideasonboard.com>

Hi Umang,

Thank you for the patch.

On Mon, Jul 29, 2024 at 04:34:36PM +0530, Umang Jain wrote:
> Mention the reset-gpio polarity in the device tree bindings.
> It is GPIO_ACTIVE_LOW according to the datasheet.
> 
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>  Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
> index 106c36ee966d..fb4c9d42ed1c 100644
> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
> @@ -92,6 +92,8 @@ examples:
>              ovdd-supply = <&camera_vddo_1v8>;
>              dvdd-supply = <&camera_vddd_1v2>;
>  
> +            reset-gpios = <&gpio 50 GPIO_ACTIVE_LOW>;
> +

I think it's good to include this in the example, but it doesn't match
the commit message. I was expecting to see a change to the binding
rules, not to the example.

>              port {
>                  imx335: endpoint {
>                      remote-endpoint = <&cam>;

-- 
Regards,

Laurent Pinchart

