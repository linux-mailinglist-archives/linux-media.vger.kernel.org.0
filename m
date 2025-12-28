Return-Path: <linux-media+bounces-49607-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EABCE4D68
	for <lists+linux-media@lfdr.de>; Sun, 28 Dec 2025 13:51:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 83A28300EA1D
	for <lists+linux-media@lfdr.de>; Sun, 28 Dec 2025 12:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 497E030ACE3;
	Sun, 28 Dec 2025 12:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="g3FP6LHv"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FC8292918;
	Sun, 28 Dec 2025 12:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766926274; cv=none; b=Yv9Y/wIRFMRjtk1le88ljhzHYgTBXV2uVGlCxmm0yXpMuLv4D06rg34urn55WLtlQGG8vFx5RMYpt5es2KXP+jKQPoy8bHJQK+9WiV8oKmH+lQtgvAyK+Jd9kuAyFBA7pAw2qsEZlPafIiJW3I0E0a6qFGRBFNcKZHcmqd79W0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766926274; c=relaxed/simple;
	bh=ekHHVZjnkLrxs8cVLRfy8XVY5hJNwnJGvYXfeor/dpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fgjuQmeUcQgVNK6McstZigEfxgHbMzVRS00gdZlJpXgow5+MYodC8V52MBNeHQrYFoUcHU5HZpJ3sC8g7VlAJQIGZJMr0Gk2pIN07vQumhw/yr1umViWNJKx9YszgAsHoE1Y09RJEr0GteLAx5/VCfZITj9NAYxFvoU6b5mP64c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=g3FP6LHv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 70EBD4BB;
	Sun, 28 Dec 2025 13:50:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1766926248;
	bh=ekHHVZjnkLrxs8cVLRfy8XVY5hJNwnJGvYXfeor/dpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g3FP6LHv+HqXv82DzqCiq7Si/8S6xoLifcrJQGOAbtgW1Y+BEnYWLdzpd/SYXWP0T
	 hCVyyRiNc7BEwTqLJfrJQ5Dc0BYcgaCtUqUP/tJaPZBI/SshRl0iKOwIwAfJJvlVmT
	 do12nn9GTx0l6556zeVB8M7j+EdBoDDBAJM6mZzw=
Date: Sun, 28 Dec 2025 14:50:44 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 02/15] media: aptina-pll: Add comment documenting the
 PLL chain
Message-ID: <20251228125044.GD21104@pendragon.ideasonboard.com>
References: <20251224-mt9m114-atomisp-v4-0-60b25da7a1bc@oss.qualcomm.com>
 <20251224-mt9m114-atomisp-v4-2-60b25da7a1bc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251224-mt9m114-atomisp-v4-2-60b25da7a1bc@oss.qualcomm.com>

On Wed, Dec 24, 2025 at 01:31:11PM +0100, Hans de Goede wrote:
> Add a code-comment documenting the PLL chain, this is a verbatim
> copy of Laurent's ASCII-art PLL chain from the mailinglist.
> 
> Link: https://lore.kernel.org/linux-media/20250629204655.GA2059@pendragon.ideasonboard.com/
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---
> Suggested-by: should really be Co-authored-by since I just copy and
> pasted Laurent's comment from the list, but that requires Laurent's S-o-B.
> 
> Laurent can you give your S-o-B for adding a Co-authored-by ?

If you insist,

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

but it's such a small patch that it doesn't matter much to me.

> ---
> Changes in v4:
> - New patch in v4 of this series
> ---
>  drivers/media/i2c/aptina-pll.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/media/i2c/aptina-pll.c b/drivers/media/i2c/aptina-pll.c
> index cd2ed4583c97ec87e516acfd249fdccf2f9efbb8..4a519ab587ba4cfb9945a1bb05e87a3b5e6d28c9 100644
> --- a/drivers/media/i2c/aptina-pll.c
> +++ b/drivers/media/i2c/aptina-pll.c
> @@ -12,6 +12,16 @@
>  
>  #include "aptina-pll.h"
>  
> +/*
> + * Based on the docs the PLL is believed to have the following setup:
> + *
> + *         +-----+     +-----+     +-----+     +-----+     +-----+
> + * Fin --> | / N | --> | x M | --> | x 2 | --> | / P | --> | / 2 | -->
> + *         +-----+     +-----+     +-----+     +-----+     +-----+
> + *                                         fBit       fWord       fSensor
> + * ext_clock    int_clock   out_clock                             pix_clock
> + */

I think this belongs to mt9m114.c. The other sensor that uses
aptina-pll, MT9P031, does not include the x2 multiplier or /2 divider,
and has no concept of fBit as it has a parallel output only.

Could you please also capture that the datasheet has a constraint on
fBit, which we translate to a constraint on out_clock for the PLL
calculator by dividing it by 2 ?

> +
>  int aptina_pll_calculate(struct device *dev,
>  			 const struct aptina_pll_limits *limits,
>  			 struct aptina_pll *pll)

-- 
Regards,

Laurent Pinchart

