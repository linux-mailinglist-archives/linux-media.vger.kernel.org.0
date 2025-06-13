Return-Path: <linux-media+bounces-34787-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8B0AD9481
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 20:33:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1BD31BC2BC2
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 18:33:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5AB022F766;
	Fri, 13 Jun 2025 18:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tkYBlpf/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6470C757EA;
	Fri, 13 Jun 2025 18:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749839613; cv=none; b=IdT1SyXQKhc3TBm6TbbHLndyvfKTrMRmt574qYo+X7RjXF229LmkvEhDKs6JK6lXEngWROgEbFJ30X2wHosbJ4Xbrngb7jhhwE2rtDh7AYasSSZK5ARIMTV+OMyIQPsLzEQfI39T/mhHmPfKKFzkuN9wM9bmJStYmJIEXPTiZA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749839613; c=relaxed/simple;
	bh=VQg1PaKgC4+Jle4mgCHgk9o+fUB/R5EF6EsRKjLfjWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FxpWdWn7X94nT5TGfLx/xNfNeSlnEEKc+mo6VhrlQuKm0vcOp4MclLkPHs11447R70Z6yuJlxpiOIFagPIZP507IWNXJahs9NPQ/ZaP6hWxQJcSrRVqHs/zgVzut58+D8SPWqDZ+rmSNH3AmZEdMXI/2f7xAV6H7f5bzjC2EwcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tkYBlpf/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5126EED;
	Fri, 13 Jun 2025 20:33:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749839593;
	bh=VQg1PaKgC4+Jle4mgCHgk9o+fUB/R5EF6EsRKjLfjWc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tkYBlpf/P3s9a7Un0M4UhLAITRzsqH10kuehdssn0qKLS7VFkh5OMz56gABNTWrDR
	 6yKCTJqsvAPhWEBReJosA4EBShcxjd7CEwWzKc7bfwxf2EUiUKVGIt+vmonmtf/0+e
	 hpU3kO+8mp49nPDNb7xnL7r74zSGInMpmfBvZYXI=
Date: Fri, 13 Jun 2025 21:33:08 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v6 04/13] media: rcar-vin: Use error labels in probe
Message-ID: <20250613183308.GJ25137@pendragon.ideasonboard.com>
References: <20250613153434.2001800-1-niklas.soderlund+renesas@ragnatech.se>
 <20250613153434.2001800-5-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250613153434.2001800-5-niklas.soderlund+renesas@ragnatech.se>

On Fri, Jun 13, 2025 at 05:34:25PM +0200, Niklas Söderlund wrote:
> Prepare for more failed probe conditions that needs cleanup by
> converting the error path to use labels.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> * Changes since v5
> - New in v6
> ---
>  drivers/media/platform/renesas/rcar-vin/rcar-core.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> index 73d713868391..59751ec23a15 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> @@ -1405,15 +1405,18 @@ static int rcar_vin_probe(struct platform_device *pdev)
>  			vin->scaler = vin->info->scaler;
>  	}
>  
> -	if (ret) {
> -		rvin_dma_unregister(vin);
> -		return ret;
> -	}
> +	if (ret)
> +		goto err_dma;
>  
>  	pm_suspend_ignore_children(&pdev->dev, true);
>  	pm_runtime_enable(&pdev->dev);
>  
>  	return 0;
> +
> +err_dma:
> +	rvin_dma_unregister(vin);
> +
> +	return ret;
>  }
>  
>  static void rcar_vin_remove(struct platform_device *pdev)

-- 
Regards,

Laurent Pinchart

