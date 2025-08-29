Return-Path: <linux-media+bounces-41301-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 354D8B3B462
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 09:33:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C913365D1A
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 07:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0036426FA54;
	Fri, 29 Aug 2025 07:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rXk7yO9N"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9841BC5C;
	Fri, 29 Aug 2025 07:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756452811; cv=none; b=lFMjvSG3VQsTkZNZQaMnRQDyjgldz5jECRn4gmtp/uTaJOb+FqYlYCC+NGozTPzWWeIvezrxpUGz0ua7JPHmYzzHJePN2bo1/dkLvbcLdJFDVxoT27BrnFGsfQo2fqP8bVz/9aa2p/sAF/Q7ZDnEmyCuGCvhWbar5w7tJha7pEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756452811; c=relaxed/simple;
	bh=8TexSc0wl00j3j42PZV1dsW44NzMt3gu/+fUqhZ4/Dc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mh0cOwTHLd889gd3vJWvifbtGDElLph0C8loEHu3xG89urojDaqWzrqfNbFKVj2w6MCHDLSBz2x36jpLg9odU89WEDLeQssUBjkNfX4WZdCRPhkHRUhaG6p8wJYgAtTeeL5m20GuHDXPMOSZYVXh0Dt+YgIzwK4W7HuwLphyfwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rXk7yO9N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29F1BC4CEF0;
	Fri, 29 Aug 2025 07:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756452809;
	bh=8TexSc0wl00j3j42PZV1dsW44NzMt3gu/+fUqhZ4/Dc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rXk7yO9NhWkTMmy2WbM3DEYNEuWtQwNh0nXtKzTQoAK873uiWrOWcX0F77IMIBIIp
	 dNkZrrokge65+5MFn1mMOMolK9MPc/rObGPfS+kxTAuqEbAQVH4diimVGN0Sea8D3R
	 QdUZlytFWA/TYSmYwotJBgEhs3faL3QxfQnXKpwngk1nn/QLUAZuvqGhUIp0A5u+di
	 IpHbi1EqhyizA21OSI8aHIsWdVVoJvD0nzl3Emz4lYmkmqhZ4qAncLfn2FLxa0VFHh
	 ZvUVt5IXqVrWd9IAeBc+Z2ItQrVvc+AXebIO/H7cH0IAT1R2cqLPZDkRPuzZERwa8W
	 iYSNmGU8EvALg==
Date: Fri, 29 Aug 2025 09:33:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Guoniu Zhou <guoniu.zhou@nxp.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Martin Kepplinger <martink@posteo.de>, 
	Purism Kernel Team <kernel@puri.sm>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Frank Li <Frank.Li@nxp.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] media: dt-bindings: nxp,imx8mq-mipi-csi2: Add
 i.MX8ULP compatible string
Message-ID: <20250829-impetuous-hysterical-hornet-d7f6c6@kuoka>
References: <20250828-csi2_imx8ulp-v4-0-a2f97b15bb98@nxp.com>
 <20250828-csi2_imx8ulp-v4-1-a2f97b15bb98@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250828-csi2_imx8ulp-v4-1-a2f97b15bb98@nxp.com>

On Thu, Aug 28, 2025 at 03:17:33PM +0800, Guoniu Zhou wrote:
>  allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx8ulp-mipi-csi2
> +    then:
> +      properties:
> +        reg:
> +          minItems: 2
> +        resets:
> +          minItems: 2
> +          maxItems: 2
> +        clocks:
> +          minItems: 4
> +        clock-names:
> +          minItems: 4
> +    else:
> +      properties:
> +        clocks:
> +          maxItems: 3
> +        clock-names:
> +          maxItems: 3
> +
>    - if:
>        properties:
>          compatible:
>            contains:
>              enum:
>                - fsl,imx8qxp-mipi-csi2
> +              - fsl,imx8qm-mipi-csi2
> +          not:
> +            contains:
> +              enum:
> +                - fsl,imx8ulp-mipi-csi2

That's a nice trick, but I think you should just list exact cases.

It's also easier to read if if:then: blocks are symmetrical. Your
previous one consgtrained reg+resetes+clocks. This one constrains only
reg+resets.

>      then:
>        properties:
>          reg:
>            minItems: 2
>          resets:
>            maxItems: 1
> -    else:
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx8mq-mipi-csi2
> +    then:
>        properties:
>          reg:
>            maxItems: 1

And this one constraints only "reg".

This stops being readable and maintainable.


Best regards,
Krzysztof


