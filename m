Return-Path: <linux-media+bounces-26737-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E26FFA41166
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 20:55:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6C261642A9
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 19:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39A4A20B213;
	Sun, 23 Feb 2025 19:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WltDWwA0"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F015920ADFB;
	Sun, 23 Feb 2025 19:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740340550; cv=none; b=foxLJWXZWsmxRs1Oa+WDwmkFauCYsKkMtJ5fZUyasz41hv6851Rb3Enas/pn8GPjpHNTsYlQ9DqGpFQTebw4a1ijYKa0t3Yt7Cf7hYUSYkShIgLyPdR8wx+e2t8RJJ+hqmyOL3kl3HjBwIjndySzuR6FX3X8Cdanxd2m+oTGspM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740340550; c=relaxed/simple;
	bh=VF0zaetu44yJpCJ2dHbAUCGdQ+LqT97EGA8Tkw2qyIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AP16RbsitDPy/fSlk1h2qUapYnRYFGKRduLOijh6s+nuD+CLH+DcCSr9UTSnfvd3v/yioJKd5rKyb8/pbcqQAVhm/kyDqBpaxn22ra4betRzpLgkkDdkcb99lvm+RDgpMAEcsvgVBe5kL8nJC2bPhwT68UFuL2vGt6cys0Hv4Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WltDWwA0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A3E3E4DC;
	Sun, 23 Feb 2025 20:54:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740340461;
	bh=VF0zaetu44yJpCJ2dHbAUCGdQ+LqT97EGA8Tkw2qyIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WltDWwA0S+vvkk1hQoPhTf3CZRVPNUoY5797CKsLfpyuB4ZO0fdRMbKNn2jcb0+jh
	 VMwqJ4RGlhBXOiPt65vbYNWxkjSzuLW5a3bUJyE6OYHFgIsIRqTFfcEOJe2upCszPF
	 nWmPnYpokTlXtt0bJNHa4du4ZZ+TDdrTgMLyxGBA=
Date: Sun, 23 Feb 2025 21:55:31 +0200
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
Subject: Re: [PATCH v2 14/18] media: rzg2l-cru: Add IRQ handler to OF data
Message-ID: <20250223195531.GA15344@pendragon.ideasonboard.com>
References: <20250221155532.576759-1-tommaso.merciai.xr@bp.renesas.com>
 <20250221155532.576759-15-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250221155532.576759-15-tommaso.merciai.xr@bp.renesas.com>

Hi Tommaso,

Thank you for the patch.

On Fri, Feb 21, 2025 at 04:55:28PM +0100, Tommaso Merciai wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add `irq_handler` to the `rzg2l_cru_info` structure and pass it as part of
> the OF data. This prepares for supporting RZ/G3E and RZ/V2H(P) SoCs, which
> require a different IRQ handler. Update the IRQ request code to use the
> handler from the OF data.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c | 3 ++-
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h  | 1 +
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> index 7e94ae803967..510e55496e8e 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> @@ -278,7 +278,7 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
>  	if (irq < 0)
>  		return irq;
>  
> -	ret = devm_request_irq(dev, irq, rzg2l_cru_irq, 0,
> +	ret = devm_request_irq(dev, irq, cru->info->irq_handler, 0,
>  			       KBUILD_MODNAME, cru);
>  	if (ret)
>  		return dev_err_probe(dev, ret, "failed to request irq\n");
> @@ -359,6 +359,7 @@ static const struct rzg2l_cru_info rzgl2_cru_info = {
>  	.max_height = 4095,
>  	.image_conv = ICnMC,
>  	.regs = rzg2l_cru_regs,
> +	.irq_handler = rzg2l_cru_irq,
>  };
>  
>  static const struct of_device_id rzg2l_cru_of_id_table[] = {
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> index ca156772b949..32bea35c8c1f 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> @@ -83,6 +83,7 @@ struct rzg2l_cru_info {
>  	unsigned int max_height;
>  	u16 image_conv;
>  	const u16 *regs;
> +	irqreturn_t (*irq_handler)(int irq, void *data);
>  };
>  
>  /**

-- 
Regards,

Laurent Pinchart

