Return-Path: <linux-media+bounces-30646-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E461A956F5
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 21:56:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 579F217080F
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 19:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 284C11EFF8F;
	Mon, 21 Apr 2025 19:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DhAs0o9S"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B7C1A83FB
	for <linux-media@vger.kernel.org>; Mon, 21 Apr 2025 19:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745265406; cv=none; b=KGeBZTq37EvVMd0kwXVedPjCGi0aOHJMwa5RfWJyrcfdSnSBACHVGjb/TfYc7v49oet1c72rgceqKF5inZ+Flp7QllyG3bthPUdlrzaz+YHUfd20A2EFfOV2+CkbkSFj6ni+jVbNViTKRJfdMBsWQf2e/Uv1OZVZjXMG+Icxwks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745265406; c=relaxed/simple;
	bh=YSABLTCjDSkmnaCXirgwUoxECLErkSzXxgEPbDOHdtg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GsQ0hZK5JA0VvgFGWYNkMSJBZg1Y7Ob7NwPkNhgHg9YatC+Q9yPgmN7JO9sZhbTwXLC3vvllJCG7j8/P4GZ63ZZ1DFCyT5wIzdBCF0SgsfyBwD55ER7dmE+6CyPtPzsmc2vJ3LQtxlvWWQ+bKLz+25Hm7groIo8RFJk5H5Kt1Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DhAs0o9S; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7F97E6D5;
	Mon, 21 Apr 2025 21:54:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745265276;
	bh=YSABLTCjDSkmnaCXirgwUoxECLErkSzXxgEPbDOHdtg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DhAs0o9S5rOjEz8qwuxqO3TGWP02hn+62d/ZzA+1wgNPDPjjExQOOrzDHKRJ4peeE
	 6w/olpl1xY3cdNqpkoxwJoZBAR2LXvkvb39ZsIN5VRX1SirZQvTvIe4UoM824yjuZb
	 ExUPgN4mCy+jWeGU9vLtFbCUG8R6q136mWZK4ADU=
Date: Mon, 21 Apr 2025 22:56:41 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, dongcheng.yan@intel.com
Subject: Re: [PATCH v2 03/11] media: ccs-pll: Check for too high VT PLL
 multiplier in dual PLL case
Message-ID: <20250421195641.GD17813@pendragon.ideasonboard.com>
References: <20250417065354.311617-1-sakari.ailus@linux.intel.com>
 <20250417065354.311617-4-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250417065354.311617-4-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Thu, Apr 17, 2025 at 09:53:46AM +0300, Sakari Ailus wrote:
> The check for VT PLL upper limit in dual PLL case was missing. Add it now.
> 
> Fixes: 6c7469e46b60 ("media: ccs-pll: Add trivial dual PLL support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/ccs-pll.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
> index 2399cd6509b7..266fcd160da6 100644
> --- a/drivers/media/i2c/ccs-pll.c
> +++ b/drivers/media/i2c/ccs-pll.c
> @@ -312,6 +312,11 @@ __ccs_pll_calculate_vt_tree(struct device *dev,
>  	dev_dbg(dev, "more_mul2: %u\n", more_mul);
>  
>  	pll_fr->pll_multiplier = mul * more_mul;
> +	if (pll_fr->pll_multiplier > lim_fr->max_pll_multiplier) {
> +		dev_dbg(dev, "pll multiplier %u too high\n",
> +			pll_fr->pll_multiplier);
> +		return -EINVAL;
> +	}
>  
>  	if (pll_fr->pll_multiplier * pll_fr->pll_ip_clk_freq_hz >
>  	    lim_fr->max_pll_op_clk_freq_hz)

-- 
Regards,

Laurent Pinchart

