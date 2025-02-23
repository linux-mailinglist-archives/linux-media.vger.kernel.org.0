Return-Path: <linux-media+bounces-26709-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 51849A410C3
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 19:20:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B93CF1892ACC
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 18:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A07B1632D9;
	Sun, 23 Feb 2025 18:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oc3P/TjG"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5305D8F0;
	Sun, 23 Feb 2025 18:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740334815; cv=none; b=VuvxfwP5VnaetUw+byW3Vv1Hviwa7ZB8sE/pdI2teipz6dqNODDO8CD3VpavihJqTG4tNXRKm4kU2tY/rrLk9dfsugXfhCAe722avJWA5EmHBJiE4AZKKvLie2zbBxH6gBkudmkhSMhoPbobd7yDHzdcH12y94oKUhZCSKg8bek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740334815; c=relaxed/simple;
	bh=HBp4QA1jlzDHb6KvcKL52rItPm2mUXcyrVknpGq1yIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bUXU8Uh9Obf5ODVO/5pI1yjntJWTo5ok6avIZfGemU47aHw0mwAIJ6C+Kb+Se3E27F+Sng8z+8kxl+MSM8TJLycX1ctOJ5qLWfOfy+aPVaafL2XHLgsoES7e923Anmdhtb1Chc5f683HHVoLDcLKK4eE430n9O5G3DH0FrkAYgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oc3P/TjG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 14AAA496;
	Sun, 23 Feb 2025 19:18:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740334726;
	bh=HBp4QA1jlzDHb6KvcKL52rItPm2mUXcyrVknpGq1yIs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oc3P/TjGjXw9OuGLRhGu7f0SHOSAVSpSb1DNpwpw2AQSXpGBQ2ZSqHvaRrrxy3rTA
	 jnQaYPjku9uFO2axV7zDgvUTAXU75LxodJtyUwn68dpF0LWilEM9ToHXVEP7HaymgD
	 vnQpmR/NOvA6xrGqN7ScaxivGwVBSkIjFZ3SWhHk=
Date: Sun, 23 Feb 2025 20:19:55 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org, biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/18] media: rzg2l-cru: csi2: Make system clock
 optional for RZ/V2H(P) SoC
Message-ID: <20250223181955.GD8330@pendragon.ideasonboard.com>
References: <20250221155532.576759-1-tommaso.merciai.xr@bp.renesas.com>
 <20250221155532.576759-10-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250221155532.576759-10-tommaso.merciai.xr@bp.renesas.com>

Hi Tommaso,

Thank you for the patch.

On Fri, Feb 21, 2025 at 04:55:23PM +0100, Tommaso Merciai wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> The RZ/V2H(P) SoC does not provide a `system` clock for the CSI-2
> interface. To accommodate this, use `devm_clk_get_optional()` instead
> of `devm_clk_get()` when retrieving the clock.

The clock shouldn't be optional. On all SoCs but V2H it should remain
mandatory, and on V2H you shouldn't call clk_get() at all.

I'd recommend adding a flag to the rzg2l_csi2_info structure.

> This patch is in preparation for adding support for RZ/V2H(P) SoC.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> index 3a4e720ba732..771fa35558be 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> @@ -796,7 +796,7 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, PTR_ERR(csi2->presetn),
>  				     "Failed to get cpg presetn\n");
>  
> -	csi2->sysclk = devm_clk_get(dev, "system");
> +	csi2->sysclk = devm_clk_get_optional(dev, "system");
>  	if (IS_ERR(csi2->sysclk))
>  		return dev_err_probe(dev, PTR_ERR(csi2->sysclk),
>  				     "Failed to get system clk\n");

-- 
Regards,

Laurent Pinchart

