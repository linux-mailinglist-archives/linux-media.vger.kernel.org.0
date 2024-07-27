Return-Path: <linux-media+bounces-15374-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB1793DCD2
	for <lists+linux-media@lfdr.de>; Sat, 27 Jul 2024 03:08:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 416BC1C22530
	for <lists+linux-media@lfdr.de>; Sat, 27 Jul 2024 01:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D94701FA1;
	Sat, 27 Jul 2024 01:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iyOMvMTQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9ED631;
	Sat, 27 Jul 2024 01:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722042483; cv=none; b=V89hKpQUk0OT5MlhvLFK9YDUqWOgrDSPfW0ZWWp8vdZhrocAhBbZUM9ML5K6e0f/5Lnv/1Qu/OUNb07jZwK1LAuERpGEW2TeTwuuW3gacsS/WMrR1k7YpsiBNJVPfdcZgiRofdmAh39jGc+uPkiYe0+nlOeGsMlK/BtT0ldGNik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722042483; c=relaxed/simple;
	bh=4PKnJYbTQUvutpyXRpFNchVE+pnTdZBeWUxBO2khX/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l5nxKFrd4H2mk0Zo/bC1GfUhzF+z2dAGTMTKHKyFpNR+pP2qNuMrgxtZM+NhC2lB1MXeW+XoQgOrtm/GTX6ujmxx1Rc4RQhJymeXfA9n8Pbu5KQXy92fP//4weReu5mhej6yVycdyKazxCBLvCaL5j8qM6LH8rk1i7IUC4YU2k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iyOMvMTQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DD4F4720;
	Sat, 27 Jul 2024 03:07:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722042435;
	bh=4PKnJYbTQUvutpyXRpFNchVE+pnTdZBeWUxBO2khX/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iyOMvMTQdxg+RlSBqOepJ0xtfAuZ1H3o5ftahHWyKif+gEYl4DKZa6oNm/Z+wkldn
	 PN7BKv75UYwk7gc+YR4qmNmsSyml2vv9EQnLjMAzWH/JgnGnUwJV8BgBmq7T6a4Vt0
	 UF4mbDMyQ9tpWCXW5h7CHVqsNlvPzVbIxoJSbxuY=
Date: Sat, 27 Jul 2024 04:07:41 +0300
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
Subject: Re: [PATCH v2 6/9] arm64: dts: renesas: r9a07g043u: Add vspd node
Message-ID: <20240727010741.GH300@pendragon.ideasonboard.com>
References: <20240709135152.185042-1-biju.das.jz@bp.renesas.com>
 <20240709135152.185042-7-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240709135152.185042-7-biju.das.jz@bp.renesas.com>

Hi Biju,

Thank you for the patch.

On Tue, Jul 09, 2024 at 02:51:44PM +0100, Biju Das wrote:
> Add vspd node to RZ/G2UL SoC DTSI.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * No change.
> ---
>  arch/arm64/boot/dts/renesas/r9a07g043u.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi b/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
> index 18ef297db933..15e84a5428ef 100644
> --- a/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
> @@ -129,6 +129,19 @@ csi2cru: endpoint@0 {
>  		};
>  	};
>  
> +	vspd: vsp@10870000 {
> +		compatible = "renesas,r9a07g043u-vsp2", "renesas,r9a07g044-vsp2";
> +		reg = <0 0x10870000 0 0x10000>;
> +		interrupts = <SOC_PERIPHERAL_IRQ(149) IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cpg CPG_MOD R9A07G043_LCDC_CLK_A>,
> +			 <&cpg CPG_MOD R9A07G043_LCDC_CLK_P>,
> +			 <&cpg CPG_MOD R9A07G043_LCDC_CLK_D>;
> +		clock-names = "aclk", "pclk", "vclk";
> +		power-domains = <&cpg>;
> +		resets = <&cpg R9A07G043_LCDC_RESET_N>;
> +		renesas,fcp = <&fcpvd>;

This patch looks fine, but I would move it after 7/9, as here you
reference a node that doesn't exist yet.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> +	};
> +
>  	irqc: interrupt-controller@110a0000 {
>  		compatible = "renesas,r9a07g043u-irqc",
>  			     "renesas,rzg2l-irqc";

-- 
Regards,

Laurent Pinchart

