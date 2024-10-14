Return-Path: <linux-media+bounces-19542-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1D699C1C0
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 09:43:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADC011C2333B
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 07:43:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E872314D70F;
	Mon, 14 Oct 2024 07:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y2mVFGoc"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B24814B94B;
	Mon, 14 Oct 2024 07:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728891791; cv=none; b=d+yBKRbUyLVHYUEdaK5tOEF3LQpFnSZDlZu5tzU9hjGOtOVsEjexNErl/NOBtK+XXMBmS9S2hhTwW4R7v2mZl0w9C3YAAHJrwiPXtXHhHXwea/rQ3da9I6GNjaABa4REPsLZ/saAOvs7QZ7GcBB9y2VOsLn5wpfBOrkJ5GA9+AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728891791; c=relaxed/simple;
	bh=oavUwFbQO3ysiWU+yn80ymRagu1f0SfzLDNG6iu7L0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gOt6LuBviDZlIJQqyYxTUMNrd8TJTmJwqrh61/VQ0YgkzDgDJON6+q4KhTA1pojfr1+Gge0HYIpbINyeaqsAnUCtWGD6xirMpTM7HoRqouhIBwtnt+ARIfww3y7uT/6ZpSHjgJndcxTOX+9Q3qp1Dwe+bA3ol0hLHgv1npKFGZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y2mVFGoc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A06EC4CEC3;
	Mon, 14 Oct 2024 07:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728891790;
	bh=oavUwFbQO3ysiWU+yn80ymRagu1f0SfzLDNG6iu7L0Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y2mVFGoc+RQjdNU4PMEAPZnSHX0YWaE0AeAUFj6hlBmSGTV9xk/MrFZnpFrSQylRE
	 f+v80m4eIL33vujyfRc9ZIqnnD7lj9Roq/mnh0B9lfRIDewzaElttpTCmQsJsYMFGc
	 zWQ4OSPYaL+fJWpL7lZfxMbH2EX2YjEh+vUjwIHV7InDXlzapN8p4A0sIfWJDQdpMZ
	 Y6jYeQkqgL9pHdDPbNW2yWl21U3OEeT4K1W/H5+E7nIIAojLtyb2xh2qZaniKD8YEz
	 xtCNF6Hfbsk+2s22Xfr+kE4mqZHnxEgfPzrFFPv/qr3th0eRZV1c6xttlKqOuWps9Y
	 z4+WZ8f5Oh5+w==
Date: Mon, 14 Oct 2024 09:43:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>, "Paul J. Murphy" <paul.j.murphy@intel.com>, 
	Daniele Alessandrelli <daniele.alessandrelli@intel.com>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	Martin Hecht <martin.hecht@avnet.eu>, Zhi Mao <zhi.mao@mediatek.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Mikhail Rudenko <mike.rudenko@gmail.com>, 
	Ricardo Ribalda <ribalda@kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Umang Jain <umang.jain@ideasonboard.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Dongchun Zhu <dongchun.zhu@mediatek.com>, 
	Quentin Schulz <quentin.schulz@theobroma-systems.com>, Todor Tomov <todor.too@gmail.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] media: dt-bindings: Remove assigned-clock-* from
 various schema
Message-ID: <w4ta26svh34gojqpakrgp5cpsempedkewkmbllyvs5z5fm274z@jqs3tvunxq2s>
References: <20241012-b4-linux-next-202041004-i2c-media-yaml-fixes-v1-0-a2bb12a1796d@linaro.org>
 <20241012-b4-linux-next-202041004-i2c-media-yaml-fixes-v1-1-a2bb12a1796d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241012-b4-linux-next-202041004-i2c-media-yaml-fixes-v1-1-a2bb12a1796d@linaro.org>

On Sat, Oct 12, 2024 at 04:02:50PM +0100, Bryan O'Donoghue wrote:
> Remove extraneous assigned-clock* from media/i2c/* schemas, retain in the
> relevant examples.
> 
> Link: https://lore.kernel.org/linux-media/j7kgz2lyxnler5qwd7yiazdq6fmsv77kyozdrxf33h54ydakjz@uqjhwhoyv6re
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml | 8 --------
>  Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml | 8 --------
>  Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml | 8 --------
>  Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml | 4 ----
>  Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml | 4 ----
>  Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml | 4 ----
>  Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml | 4 ----
>  Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml | 4 ----
>  8 files changed, 44 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> index 60f19e1152b33128cf3baa15b8c70a874ca6d52e..d18ead8f7fc43bfacc291aed85b5ca9166c46edb 100644
> --- a/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> @@ -28,12 +28,6 @@ properties:
>      items:
>        - description: Reference to the mclk clock.
>  
> -  assigned-clocks:
> -    maxItems: 1
> -
> -  assigned-clock-rates:
> -    maxItems: 1
> -
>    reset-gpios:
>      description: Reference to the GPIO connected to the RESETB pin. Active low.
>      maxItems: 1
> @@ -82,8 +76,6 @@ required:
>    - compatible
>    - reg
>    - clocks
> -  - assigned-clocks
> -  - assigned-clock-rates

That's not extraneous, but has a meaning that without assigned-clocks
this device or driver will not operate.

File should rather stay as is.

>    - vddio-supply
>    - vdda-supply
>    - vddd-supply
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
> index 1f497679168c8395a94b3867beb49b251ef621fc..622243cae03caa5d14aa312df40ef5907e190d2c 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
> @@ -20,12 +20,6 @@ properties:
>      items:
>        - description: XVCLK Clock
>  
> -  assigned-clocks:
> -    maxItems: 1
> -
> -  assigned-clock-rates:
> -    maxItems: 1
> -
>    dvdd-supply:
>      description: Digital Domain Power Supply
>  
> @@ -68,8 +62,6 @@ required:
>    - compatible
>    - reg
>    - clocks
> -  - assigned-clocks
> -  - assigned-clock-rates

Same

>    - dvdd-supply
>    - dovdd-supply
>    - port
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
> index 8a70e23ba6abed67d8b61c33bd7a261089bddda2..382d7de7a89bcea11be384a2a3800512994f9346 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
> @@ -20,12 +20,6 @@ properties:
>      items:
>        - description: EXTCLK Clock
>  
> -  assigned-clocks:
> -    maxItems: 1
> -
> -  assigned-clock-rates:
> -    maxItems: 1
> -
>    dvdd-supply:
>      description: Digital Domain Power Supply
>  
> @@ -68,8 +62,6 @@ required:
>    - compatible
>    - reg
>    - clocks
> -  - assigned-clocks
> -  - assigned-clock-rates

Same

>    - dvdd-supply
>    - avdd-supply
>    - dovdd-supply
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
> index 79a7658f6d0547e4d6fb2267e5757eedf49fd416..38325cf318f7bd2cd60a4c7bbb6a65b54b855e26 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
> @@ -27,10 +27,6 @@ properties:
>      description: I2C address
>      maxItems: 1
>  
> -  assigned-clocks: true
> -  assigned-clock-parents: true
> -  assigned-clock-rates: true
> -

This is ok.

>    clocks:
>      description: Clock frequency from 6 to 27MHz
>      maxItems: 1
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
> index c978abc0cdb35cfe2b85069946cf1be435a58cb8..f0f9726a2add89492b8c56e17ed607841baa3a0d 100644
> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
> @@ -24,10 +24,6 @@ properties:
>        - sony,imx258
>        - sony,imx258-pdaf
>  
> -  assigned-clocks: true
> -  assigned-clock-parents: true
> -  assigned-clock-rates: true
> -

This is ok.

>    clocks:
>      description:
>        Clock frequency from 6 to 27 MHz.
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
> index bce57b22f7b63bd73f08d8831d9bb04858ef03e0..872b8288948b2bba743f2365a55165181df156ae 100644
> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
> @@ -24,10 +24,6 @@ properties:
>      description: I2C address
>      maxItems: 1
>  
> -  assigned-clocks: true
> -  assigned-clock-parents: true
> -  assigned-clock-rates: true
> -

This is ok.

>    clocks:
>      description: Clock frequency from 6 to 27 MHz, 37.125MHz, 74.25MHz
>      maxItems: 1
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
> index 77bf3a4ee89db3b5d16149470c0380ef8f1aeac1..38bd1c7304a59bb5fea90954c1e4e626a7c86f2f 100644
> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
> @@ -24,10 +24,6 @@ properties:
>      description: I2C address
>      maxItems: 1
>  
> -  assigned-clocks: true
> -  assigned-clock-parents: true
> -  assigned-clock-rates: true
> -

This is ok.

>    clocks:
>      description: Clock frequency from 6 to 27 MHz, 37.125MHz, 74.25MHz
>      maxItems: 1
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
> index d9b7815650fdb890418fc96c828acc9147dfb6e8..ece1e17fe34553671e61c965eb1833c5eb08131b 100644
> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
> @@ -26,10 +26,6 @@ properties:
>      description: I2C address
>      maxItems: 1
>  
> -  assigned-clocks: true
> -  assigned-clock-parents: true
> -  assigned-clock-rates: true
> -

This is ok.

Best regards,
Krzysztof


