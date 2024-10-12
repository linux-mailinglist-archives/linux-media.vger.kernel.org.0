Return-Path: <linux-media+bounces-19503-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A1E99B63A
	for <lists+linux-media@lfdr.de>; Sat, 12 Oct 2024 19:24:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D0C61F21F89
	for <lists+linux-media@lfdr.de>; Sat, 12 Oct 2024 17:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0850E78B60;
	Sat, 12 Oct 2024 17:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="e/mY8B9Y"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C2B5FEE4;
	Sat, 12 Oct 2024 17:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728753891; cv=none; b=sDrVDNjacZZfuC/JElcef0e20IuIBMpnwyRk3yYSyZapLd2H+tkhSD4H1XaxjWQfN6/BWDMus6O/AV+chBm1qIOdsuJJUfzv+3ZVcaKzg+Rcn0ySGztHM8RuM33BIsHHdBw7GElS2Xk6km7gpjrguxIb3Mg4qfsVvlPfJMunjKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728753891; c=relaxed/simple;
	bh=/0qUtB/X1QeFYuMXBYgTtniMi+l9quvLBDXPRdvLo8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XQKcWXw2ShkptgTSOGOO/JgDHEx1/DD/cl9YUKrNQZWZ7uW43PWPG7dYXb3sbNm9qQKLc265gTar1iEqQUtzxONnDMcOpofyg+7XYuxPvGYvp2MXRmZ3MpNtdrag+4+3snG5NTbLyQVTItBfjflUyQ1qbpbNK/Ib9q7x0zakqyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=e/mY8B9Y; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [23.233.251.139])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EBFE38BF;
	Sat, 12 Oct 2024 19:22:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728753780;
	bh=/0qUtB/X1QeFYuMXBYgTtniMi+l9quvLBDXPRdvLo8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e/mY8B9YqA2rNzW0k7uaRA0rgy5a/ao/5VmANTe2HctXOtwADmOGNGoJE71xiNCxf
	 WKq6yuWeuYKPLNNJySyVPW8W/2n+rxb52z3iSoC3zsHtAtzb6qkFenruvZsSo71UIk
	 pbJZtjICQn9yV3r7WLH86xEgXJyIJotLXk7CxEM8=
Date: Sat, 12 Oct 2024 20:24:30 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	"Paul J. Murphy" <paul.j.murphy@intel.com>,
	Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Martin Hecht <martin.hecht@avnet.eu>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Ricardo Ribalda <ribalda@kernel.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Dongchun Zhu <dongchun.zhu@mediatek.com>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Todor Tomov <todor.too@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] media: dt-bindings: Remove assigned-clock-* from
 various schema
Message-ID: <20241012172430.GB5212@pendragon.ideasonboard.com>
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

Hi Bryan,

Thank you for the patch.

On Sat, Oct 12, 2024 at 04:02:50PM +0100, Bryan O'Donoghue wrote:
> Remove extraneous assigned-clock* from media/i2c/* schemas, retain in the
> relevant examples.

You may want to explain in the commit message *why* you're doing this.
The reason may not be straightforward for everybody. With that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

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
>    clocks:
>      description: Clock frequency 6MHz, 12MHz, 18MHz, 24MHz or 27MHz
>      maxItems: 1

-- 
Regards,

Laurent Pinchart

