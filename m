Return-Path: <linux-media+bounces-28992-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA3AA759BD
	for <lists+linux-media@lfdr.de>; Sun, 30 Mar 2025 13:14:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 322903A9A53
	for <lists+linux-media@lfdr.de>; Sun, 30 Mar 2025 11:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4CA21C5489;
	Sun, 30 Mar 2025 11:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="k1lF7jaM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77CF1ADFFE;
	Sun, 30 Mar 2025 11:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743333259; cv=none; b=g1CMdNFuy0nzVS62wt6+yDFqS2C770EHbATuRBrcf2rTwjcT3SUYMliB4eKWs/ZUW0zzYXjXJjr7EmfpVdNfNolcYVZDm96O10AX6kkYuChvUA+GEm2KH8g6J0dkPYrEGRjofNINJeNcNISPLAiDN4IuZnGHI6UyMOUhAaYZWfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743333259; c=relaxed/simple;
	bh=pkAaQxeZThL6yKE8GyAy7EvmxXQBNj5BWpr48phqvqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=phLA97+ytzYBZKSDLu2anRrpFNMo/XYUCfs7xgiT6nZAKvsOE/chYn1ODSRA2dNizRhgFlgwaRg2HkRy0PkqiAHnDGxcDI1LMEbiOIZ24hVqDlgNeADF1wv5vr7S5oBiNydYLucWIIVi/gLAGSeu2BISZjSohGpo/nwulkL3szs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=k1lF7jaM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 30C8C4A4;
	Sun, 30 Mar 2025 13:12:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743333145;
	bh=pkAaQxeZThL6yKE8GyAy7EvmxXQBNj5BWpr48phqvqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k1lF7jaMZ+NLxMwJMpr/uR7n8c3BELNYPhX9epZ71gNgELLj7DPAKLsm0VdOGwsr8
	 Aq51ZW7rCrP/0AX7wCeRgazYrwvK40DfqrSxvWVr0eTLqsWi0zhuk5DK8TD/0uig04
	 iJH/dyksoQOQ/rCccHRcltwwTjxVszGAtBG2QDwE=
Date: Sun, 30 Mar 2025 14:13:51 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH] media: renesas: vsp1: Use %p4cc printk modifier to print
 FourCC codes
Message-ID: <20250330111351.GB8840@pendragon.ideasonboard.com>
References: <20250330091738.27052-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250330091738.27052-1-biju.das.jz@bp.renesas.com>

Hi Biju,

Thank you for the patch.

On Sun, Mar 30, 2025 at 10:17:35AM +0100, Biju Das wrote:
> Replace '%08x->%p4cc' printk modifier to print FourCC codes for pixel
> formats.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/renesas/vsp1/vsp1_drm.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> index b5d1f238f7be..f8a575f6188a 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> @@ -593,8 +593,8 @@ static int vsp1_du_pipeline_set_rwpf_format(struct vsp1_device *vsp1,
>  
>  	fmtinfo = vsp1_get_format_info(vsp1, pixelformat);
>  	if (!fmtinfo) {
> -		dev_dbg(vsp1->dev, "Unsupported pixel format %08x\n",
> -			pixelformat);
> +		dev_dbg(vsp1->dev, "Unsupported pixel format %p4cc\n",
> +			&pixelformat);
>  		return -EINVAL;
>  	}
>  
> @@ -849,11 +849,11 @@ int vsp1_du_atomic_update(struct device *dev, unsigned int pipe_index,
>  	}
>  
>  	dev_dbg(vsp1->dev,
> -		"%s: RPF%u: (%u,%u)/%ux%u -> (%u,%u)/%ux%u (%08x), pitch %u dma { %pad, %pad, %pad } zpos %u\n",
> +		"%s: RPF%u: (%u,%u)/%ux%u -> (%u,%u)/%ux%u (%p4cc), pitch %u dma { %pad, %pad, %pad } zpos %u\n",
>  		__func__, rpf_index,
>  		cfg->src.left, cfg->src.top, cfg->src.width, cfg->src.height,
>  		cfg->dst.left, cfg->dst.top, cfg->dst.width, cfg->dst.height,
> -		cfg->pixelformat, cfg->pitch, &cfg->mem[0], &cfg->mem[1],
> +		&cfg->pixelformat, cfg->pitch, &cfg->mem[0], &cfg->mem[1],
>  		&cfg->mem[2], cfg->zpos);
>  
>  	/*

-- 
Regards,

Laurent Pinchart

