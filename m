Return-Path: <linux-media+bounces-30650-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 37750A956FE
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 22:05:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF05018950B8
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 20:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 217421EF37A;
	Mon, 21 Apr 2025 20:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tCgGrTy7"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083052F3E
	for <linux-media@vger.kernel.org>; Mon, 21 Apr 2025 20:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745265921; cv=none; b=YBBWzgBnfxx658qK8D3MZRmrGZfewAE6EbNGZMDftCPIUijtUFtdSjn2XYYP6XNBITRALmtlNeK5Dt+IjZUqmlOxVOw2jfg3MHdlvhygm4YzO6EqLL4hpTYxDrmoW5qqRTSshvYLFlx50iWxm8oLYpjeBOgdtOPtD+KUbvXdku4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745265921; c=relaxed/simple;
	bh=Uyo34b8vfdg423Az3aMAlKWrSDImQnOqYRU375cIPE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uGtAusooCWSvXwcD2QXjiDhva3A/PgDqm14P6E59oADvRYRVTZewjj3Iu9E+roMF6WDim3wy1XWaqvKXmLvdawFC/7uOmitpItBQUrBLUgEHDcN0aJZQ7MszA34EeP0hAEc84aw/4nVKkoJUcEMpWOLDo0cA9EIySMrlPNgwRGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tCgGrTy7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B935156D;
	Mon, 21 Apr 2025 22:03:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745265791;
	bh=Uyo34b8vfdg423Az3aMAlKWrSDImQnOqYRU375cIPE0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tCgGrTy7KO3y/+1qFJyChj0Odvf2Y3D/BxUgIEKRQc1SXxQiXwkNs+ssu9Vn0VRJJ
	 fTXROPmllXHRcSNEJCuw9Xe14v4eIQmC4sKFK0UUrH4h8RcQAR5saJNjOBXYw1FSU5
	 HKa2lB1RjbriB/i+vZnO7vGCs55LHeFBThynZyNs=
Date: Mon, 21 Apr 2025 23:05:16 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, dongcheng.yan@intel.com
Subject: Re: [PATCH v2 07/11] media: ccs-pll: Print missing PLL flags
Message-ID: <20250421200516.GH17813@pendragon.ideasonboard.com>
References: <20250417065354.311617-1-sakari.ailus@linux.intel.com>
 <20250417065354.311617-8-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250417065354.311617-8-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Thu, Apr 17, 2025 at 09:53:50AM +0300, Sakari Ailus wrote:
> Printing the OP_PIX_CLOCK_PER_LANE and NO_OP_CLOCKS CCS PLL flags were

s/were/is/

> missing, add them now.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/ccs-pll.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
> index 16eb09462c8b..ebbc5e323244 100644
> --- a/drivers/media/i2c/ccs-pll.c
> +++ b/drivers/media/i2c/ccs-pll.c
> @@ -124,7 +124,9 @@ static void print_pll(struct device *dev, const struct ccs_pll *pll)
>  	dev_dbg(dev, "pixel rate on CSI-2 bus:\t%u\n",
>  		pll->pixel_rate_csi);
>  
> -	dev_dbg(dev, "flags%s%s%s%s%s%s%s%s\n",
> +	dev_dbg(dev, "flags%s%s%s%s%s%s%s%s%s%s\n",
> +		pll->flags & PLL_FL(OP_PIX_CLOCK_PER_LANE) ? " op-pix-clock-per-lane" : "",
> +		pll->flags & PLL_FL(NO_OP_CLOCKS) ? " no-op-clocks" : "",
>  		pll->flags & PLL_FL(LANE_SPEED_MODEL) ? " lane-speed" : "",
>  		pll->flags & PLL_FL(EXT_IP_PLL_DIVIDER) ?
>  		" ext-ip-pll-divider" : "",

-- 
Regards,

Laurent Pinchart

