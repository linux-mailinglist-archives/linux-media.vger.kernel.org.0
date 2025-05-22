Return-Path: <linux-media+bounces-33175-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5B0AC11D8
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 19:07:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D8D917AFE6
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 17:07:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45BC518785D;
	Thu, 22 May 2025 17:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="g8lItOQa"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1883615A85A;
	Thu, 22 May 2025 17:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747933668; cv=none; b=ZahixwKoCULfOdZoy0l1MeahvdPvOeaBeAngh7WuAdoBVdfx5WjpQ3vQ23evMcBPG3O04W2FRYOoeOnUWOHXptP7vtmQpiCHOvxSVfFuqnuN40OeNRRLjtP+OX3VieUO14yQCc91UVUIN89SUqyrVjNdeM6Abms0IiuBdRLgKTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747933668; c=relaxed/simple;
	bh=xGm4gGN4zrT0UXQUtb8Q82nSx7dmZ58S0QFDxN4SRrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nZxuiGSQn8+lCbvHx9X/oz3PGZO79R00IbzV2Nl5l/iy0Xk2gtgloJ+gEhJQEnktybnfjfavKtfkoQlEj1J6Y0H2CRaRGnQLzfCRAMaPBZKTnUcZb1TypQfCyCRFMdlyLI41yx9hwzT4BpZ9Z+unOD2keaWRVA6G7rGRvjY/rqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=g8lItOQa; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (179.218-130-109.adsl-dyn.isp.belgacom.be [109.130.218.179])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 55C8D8FA;
	Thu, 22 May 2025 19:07:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747933641;
	bh=xGm4gGN4zrT0UXQUtb8Q82nSx7dmZ58S0QFDxN4SRrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g8lItOQaLgm7Hr4+9r7MBGx6km1W6nU55kF0PGEVDDq7BS/91knDhvLOw3WmjQh0S
	 M7PAn4PuoXTBqct/GknMEqaTbt46Jb138ErEkgfghTcFGyf7j3K5VHNj9zHk4h9m1S
	 cMm+emLnjaWu0PwBwKc7K30tig8XFZN1ta+IW/sk=
Date: Thu, 22 May 2025 19:07:36 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: git@apitzsch.eu
Cc: Ricardo Ribalda <ribalda@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 4/5] media: dt-bindings: sony,imx214: Deprecate
 property clock-frequency
Message-ID: <20250522170736.GW12514@pendragon.ideasonboard.com>
References: <20250521-imx214_ccs_pll-v3-0-bfb4a2b53d14@apitzsch.eu>
 <20250521-imx214_ccs_pll-v3-4-bfb4a2b53d14@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250521-imx214_ccs_pll-v3-4-bfb4a2b53d14@apitzsch.eu>

Hi André,

Thank you for the patch.

On Wed, May 21, 2025 at 09:34:27PM +0200, André Apitzsch via B4 Relay wrote:
> From: André Apitzsch <git@apitzsch.eu>
> 
> Deprecate the clock-frequency property in favor of assigned-clock-rates.
> 
> While at it, re-order properties according to coding style and fix the
> link-frequency in the example.  See commit acc294519f17 ("media: i2c:
> imx214: Fix link frequency validation").
> 
> Signed-off-by: André Apitzsch <git@apitzsch.eu>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../devicetree/bindings/media/i2c/sony,imx214.yaml | 29 ++++++++++++----------
>  1 file changed, 16 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
> index 0162eec8ca993a7614d29908f89fa9fe6d4b545d..aea99ebf8e9ed15f8066841228d9fdecc822b553 100644
> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
> @@ -33,20 +33,21 @@ properties:
>  
>    clock-frequency:
>      description: Frequency of the xclk clock in Hz.
> +    deprecated: true
>  
>    enable-gpios:
>      description: GPIO descriptor for the enable pin.
>      maxItems: 1
>  
> -  vdddo-supply:
> -    description: Chip digital IO regulator (1.8V).
> -
>    vdda-supply:
>      description: Chip analog regulator (2.7V).
>  
>    vddd-supply:
>      description: Chip digital core regulator (1.12V).
>  
> +  vdddo-supply:
> +    description: Chip digital IO regulator (1.8V).
> +
>    flash-leds: true
>    lens-focus: true
>  
> @@ -84,11 +85,10 @@ required:
>    - compatible
>    - reg
>    - clocks
> -  - clock-frequency
>    - enable-gpios
> -  - vdddo-supply
>    - vdda-supply
>    - vddd-supply
> +  - vdddo-supply
>    - port
>  
>  unevaluatedProperties: false
> @@ -104,22 +104,25 @@ examples:
>          camera-sensor@1a {
>              compatible = "sony,imx214";
>              reg = <0x1a>;
> -            vdddo-supply = <&pm8994_lvs1>;
> -            vddd-supply = <&camera_vddd_1v12>;
> +
> +            clocks = <&camera_clk>;
> +            assigned-clocks = <&camera_clk>;
> +            assigned-clock-rates = <24000000>;
> +
> +            enable-gpios = <&msmgpio 25 GPIO_ACTIVE_HIGH>;
> +
>              vdda-supply = <&pm8994_l17>;
> +            vddd-supply = <&camera_vddd_1v12>;
> +            vdddo-supply = <&pm8994_lvs1>;
> +
>              lens-focus = <&ad5820>;
> -            enable-gpios = <&msmgpio 25 GPIO_ACTIVE_HIGH>;
> -            clocks = <&camera_clk>;
> -            clock-frequency = <24000000>;
>  
>              port {
>                  imx214_ep: endpoint {
>                      data-lanes = <1 2 3 4>;
> -                    link-frequencies = /bits/ 64 <480000000>;
> +                    link-frequencies = /bits/ 64 <600000000>;
>                      remote-endpoint = <&csiphy0_ep>;
>                  };
>              };
>          };
>      };
> -
> -...

-- 
Regards,

Laurent Pinchart

