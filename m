Return-Path: <linux-media+bounces-42852-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0C0B8E834
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 00:11:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C40BD16822E
	for <lists+linux-media@lfdr.de>; Sun, 21 Sep 2025 22:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF96E2C11EB;
	Sun, 21 Sep 2025 22:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="il58Bdov"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D2712F5A5;
	Sun, 21 Sep 2025 22:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758492687; cv=none; b=o/WSz4VdmHjbVI2lxbGVdUt3SrKebRECRzTbNfzQJ4jwm/lO9r8R3vXDXYDmJhcPdOEi0KEemDwazgjklzPpDkDwlVCakgIj2f6Bi1za4lEDH7++0LEheijzoJtTgmJp9HYVnB4uKcQ5lFmojCL68EYz4+u3QUg8zePuDv7xtoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758492687; c=relaxed/simple;
	bh=LAVT7fd94Dqyvggjb7HfswE4SogprjltEzomfWvmFqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TYTK6Y/eEzrGPCdKfxEDMGM/eZncH4OmsLvzX0PeHWO1phy9QY1gyEUJlHZkZOoDM9vu5G5SI/wbADqY+LEAXWzGebZaUQiwemw1/+Af++SExeWnx8pi1G9X+YnEIJpRiZTu6GFE+oxY2bpljKj2jeET99Wa4IQLT3DJVm2bPiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=il58Bdov; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 3A82910C4;
	Mon, 22 Sep 2025 00:09:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758492599;
	bh=LAVT7fd94Dqyvggjb7HfswE4SogprjltEzomfWvmFqE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=il58BdovW9wqLdI9J5VQ3MUe7NyCvg6VqG6B1dgcjzlpcqMPLbk0USxPOKK2NGoaS
	 605omlvMMFhiZ3tKn1QVSCg0F8FC2O9QSC2BEoGt6+oJJMlf09652v9iEgKlcNzEgx
	 p3rXbh4WpjG9b5cIjcS6we/Md6PcdL9gxoFbHcIY=
Date: Mon, 22 Sep 2025 01:10:50 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Alice Yuan <alice.yuan@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/5] media: dt-bindings: nxp,imx8-isi: Add i.MX91 ISI
 compatible string
Message-ID: <20250921221050.GA10540@pendragon.ideasonboard.com>
References: <20250905-isi_imx93-v2-0-37db5f768c57@nxp.com>
 <20250905-isi_imx93-v2-1-37db5f768c57@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250905-isi_imx93-v2-1-37db5f768c57@nxp.com>

On Fri, Sep 05, 2025 at 02:55:58PM +0800, Guoniu Zhou wrote:
> From: Alice Yuan <alice.yuan@nxp.com>
> 
> The ISI module on i.MX91 is reused from i.MX93 and implements one channel
> and one camera input which only can be connected to parallel camera input.
> So needn't to select camera source like i.MX93 in gasket ops.
> 
> Signed-off-by: Alice Yuan <alice.yuan@nxp.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> index f43b91984f0152fbbcf80db3b3bbad7e8ad6c11e..001a0d9b71e096db3f543adaad40b84af378d707 100644
> --- a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> @@ -22,6 +22,7 @@ properties:
>        - fsl,imx8mn-isi
>        - fsl,imx8mp-isi
>        - fsl,imx8ulp-isi
> +      - fsl,imx91-isi
>        - fsl,imx93-isi
>  
>    reg:
> @@ -66,7 +67,6 @@ required:
>    - interrupts
>    - clocks
>    - clock-names
> -  - fsl,blk-ctrl
>    - ports
>  
>  allOf:
> @@ -77,6 +77,7 @@ allOf:
>              enum:
>                - fsl,imx8mn-isi
>                - fsl,imx8ulp-isi
> +              - fsl,imx91-isi
>                - fsl,imx93-isi
>      then:
>        properties:
> @@ -109,6 +110,16 @@ allOf:
>              - port@0
>              - port@1
>  
> +  - if:
> +      properties:
> +        compatible:
> +          not:
> +            contains:
> +              const: fsl,imx91-isi
> +    then:
> +      required:
> +        - fsl,blk-ctrl
> +
>  additionalProperties: false
>  
>  examples:

-- 
Regards,

Laurent Pinchart

