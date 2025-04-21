Return-Path: <linux-media+bounces-30653-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB3DA95751
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 22:25:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6C5E3B30AC
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 20:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB1821F03FD;
	Mon, 21 Apr 2025 20:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BxvwpeCp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC44719F127
	for <linux-media@vger.kernel.org>; Mon, 21 Apr 2025 20:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745267142; cv=none; b=mV1sCkXU1wGeEScTLGHR+ufhAKWrCGfFqVdY3sAkELc9PJxsQhbH9UqnWRAmYW2ZEBUX1j+aw0WZQn7eOtTv7wa6LX+krU0jnvaLSot+GykxPh1ZodJig67onf8lCY5gkLzCBPlAj/x42HrnpLlqT3cCwAbCCCwWl/mKdUXxl14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745267142; c=relaxed/simple;
	bh=6stOgPo5s2EXjapQfHsfXf01OJYrO4mL/QL2A5ZwDfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qg1SK9yeaqdUq661ahLslKUXoqqbrJNzJaZHsffoJOv/rryTMs6ua27tojHgpL16ucLUkkWpXTd1QoB/bWBq9hz0CXpsWyDzLfyXHxYeQ+GlUS1C608CiyMGRXtEq1IgDFlokJE+bn9kkduRZvk3jVNyIDh8EfAuIFK868gat3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BxvwpeCp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2B39C6D6;
	Mon, 21 Apr 2025 22:23:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745267012;
	bh=6stOgPo5s2EXjapQfHsfXf01OJYrO4mL/QL2A5ZwDfo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BxvwpeCpX/ZHSUqPk5wRQ1jBWCHEcv3qFAVfPf7yW/ZK1bdDW2pUgd8JB+yPRPmHx
	 vhW+lEx6pFSYrxoXpJptMC2U8x6t/p/oKYcPu9dVmBS5UlnljgSazNMze0gv9r9EK4
	 8eEGw/Fl/PPDCQH79som1YrnQCziHaibIIOX5Hyg=
Date: Mon, 21 Apr 2025 23:25:37 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, dongcheng.yan@intel.com
Subject: Re: [PATCH v2 10/11] media: ccs-pll: Print PLL calculator flags in
 the beginning
Message-ID: <20250421202537.GK17813@pendragon.ideasonboard.com>
References: <20250417065354.311617-1-sakari.ailus@linux.intel.com>
 <20250417065354.311617-11-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250417065354.311617-11-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Thu, Apr 17, 2025 at 09:53:53AM +0300, Sakari Ailus wrote:
> Print the PLL calculator flags right away when the PLL calculator is
> called. Previously this was done only in a successful case and that didn't
> really help solving a problem when one happened.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/ccs-pll.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
> index fc6f8aff5fd8..8e01be4b0785 100644
> --- a/drivers/media/i2c/ccs-pll.c
> +++ b/drivers/media/i2c/ccs-pll.c
> @@ -123,8 +123,11 @@ static void print_pll(struct device *dev, const struct ccs_pll *pll)
>  		pll->pixel_rate_pixel_array);
>  	dev_dbg(dev, "pixel rate on CSI-2 bus:\t%u\n",
>  		pll->pixel_rate_csi);
> +}
>  
> -	dev_dbg(dev, "flags%s%s%s%s%s%s%s%s%s%s%s\n",
> +static void print_pll_flags(struct device *dev, struct ccs_pll *pll)
> +{
> +	dev_dbg(dev, "PLL flags%s%s%s%s%s%s%s%s%s%s%s\n",
>  		pll->flags & PLL_FL(OP_PIX_CLOCK_PER_LANE) ? " op-pix-clock-per-lane" : "",
>  		pll->flags & PLL_FL(NO_OP_CLOCKS) ? " no-op-clocks" : "",
>  		pll->flags & PLL_FL(EVEN_PLL_MULTIPLIER) ? " even-pll-multiplier" : "",
> @@ -738,6 +741,8 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
>  	u32 i;
>  	int rval = -EINVAL;
>  
> +	print_pll_flags(dev, pll);
> +
>  	if (!(pll->flags & CCS_PLL_FLAG_LANE_SPEED_MODEL)) {
>  		pll->op_lanes = 1;
>  		pll->vt_lanes = 1;

-- 
Regards,

Laurent Pinchart

