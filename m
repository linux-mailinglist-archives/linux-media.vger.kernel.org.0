Return-Path: <linux-media+bounces-15376-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 099A093DCE3
	for <lists+linux-media@lfdr.de>; Sat, 27 Jul 2024 03:12:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96D751F240EA
	for <lists+linux-media@lfdr.de>; Sat, 27 Jul 2024 01:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 936A81FA1;
	Sat, 27 Jul 2024 01:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YLI6HYLT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E32E15C3;
	Sat, 27 Jul 2024 01:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722042714; cv=none; b=Gq77fbkDKu6qJrspzMEPWLYAptx09wYfroYwc6AcKzzwtSQ4pFnvBAX3qeSasb1gTIubJ835uYYEyXX6vzQ4UBOGRcni53qYVUHYGzgpVC2YLK8e9MXWnJzvC7f48lj+lBUjnsc7ozopfABOMdtyLGrsCl8fTIgzfdz5x1RmNKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722042714; c=relaxed/simple;
	bh=PLVBc1oRy7Br09cGro6H7t10wTLQqguxJldG0X8mxVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ied+hhZ2czBeWCUU7WWmNQhuciR2t3V3l0+5bgPtKAxdZa8tRI3AGulPATqkBtOuL4brYQ5NJ1jXuL+60XipyCsxZF5GtYWQ3Zg40ueJ5Uy9/zuZKkgDuYNgFfRFimqecoCg3vb7K3rMReuE+HZBydHkf5gFypDHRUEZxp0Q/lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YLI6HYLT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7FAC3720;
	Sat, 27 Jul 2024 03:11:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722042666;
	bh=PLVBc1oRy7Br09cGro6H7t10wTLQqguxJldG0X8mxVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YLI6HYLTSQg7WgV1Ovhxgssw6zXEqRMp8Cd5DnzTqr4R/3s0+pDA9ML/XivnZwQeV
	 Ujmhf5HIjhYU255SOr16+5ka5lucj/8s0GZDFkV3Hy4tCfywFUq/pa3OhxW7DPwCYw
	 dav+b1N1HMXsOK0mDdi/2PCqHcfWIgPgA4KWKmss=
Date: Sat, 27 Jul 2024 04:11:32 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH v2 8/9] arm64: dts: renesas: r9a07g043u: Add DU node
Message-ID: <20240727011132.GJ300@pendragon.ideasonboard.com>
References: <20240709135152.185042-1-biju.das.jz@bp.renesas.com>
 <20240709135152.185042-9-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240709135152.185042-9-biju.das.jz@bp.renesas.com>

Hi Biju,

Thank you for the patch.

On Tue, Jul 09, 2024 at 02:51:46PM +0100, Biju Das wrote:
> Add DU node to RZ/G2UL SoC DTSI.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * No change.
> ---
>  arch/arm64/boot/dts/renesas/r9a07g043u.dtsi | 25 +++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi b/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
> index d88bf23b0782..0a4f24d83791 100644
> --- a/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
> @@ -153,6 +153,31 @@ fcpvd: fcp@10880000 {
>  		resets = <&cpg R9A07G043_LCDC_RESET_N>;
>  	};
>  
> +	du: display@10890000 {
> +		compatible = "renesas,r9a07g043u-du";
> +		reg = <0 0x10890000 0 0x10000>;
> +		interrupts = <SOC_PERIPHERAL_IRQ(152) IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cpg CPG_MOD R9A07G043_LCDC_CLK_A>,
> +			 <&cpg CPG_MOD R9A07G043_LCDC_CLK_P>,
> +			 <&cpg CPG_MOD R9A07G043_LCDC_CLK_D>;
> +		clock-names = "aclk", "pclk", "vclk";
> +		power-domains = <&cpg>;
> +		resets = <&cpg R9A07G043_LCDC_RESET_N>;
> +		renesas,vsps = <&vspd 0>;
> +		status = "disabled";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@1 {
> +				reg = <1>;

This may need to change depending on the outcome of the DT bindings
discussion. Other than that,

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> +				du_out_rgb: endpoint {
> +				};
> +			};
> +		};
> +	};
> +
>  	irqc: interrupt-controller@110a0000 {
>  		compatible = "renesas,r9a07g043u-irqc",
>  			     "renesas,rzg2l-irqc";

-- 
Regards,

Laurent Pinchart

