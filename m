Return-Path: <linux-media+bounces-30648-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1B4A956FB
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 22:02:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 976071707BF
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 20:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A72161E520F;
	Mon, 21 Apr 2025 20:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="g+9LrqLG"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9234D1442E8
	for <linux-media@vger.kernel.org>; Mon, 21 Apr 2025 20:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745265759; cv=none; b=aYP1yZhKbRLSYNLrUfRr2gxeI4f2ccVcLAqWsuFvwpYDvQoZrn2rtsYulFMMEHZIr84OgQAh0aEwyWk/PAK7ppIh/qn+HFBJXL5+u2EUyD+U8q8WT8UaUysOX5IzTU+WZHqx1tED1g6t4mFA/WA0TVpE9af1aBTGALQ3d5EMIxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745265759; c=relaxed/simple;
	bh=8iCXlXd2u2LSj2/70i4PQU8lWrLK6jy8n7iGYqkS+RQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TICn9x/UVTl0lsfTIqQ1PTuae1UFgWuEEAvW1T8XW54o8epwko8BMOd6KrOlfEoPdtDtW053Bs/EpfJA1Vhp/Go+5WhCKMzIRlkMlSuieZxDs1rJyiCYN1F5OeQvaoqgO6W1cJLUHsNZc4E4DI8H0bwPTw69W1bf43jx8FEjywI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=g+9LrqLG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 285866D5;
	Mon, 21 Apr 2025 22:00:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745265629;
	bh=8iCXlXd2u2LSj2/70i4PQU8lWrLK6jy8n7iGYqkS+RQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g+9LrqLGWPSSUGzPHuA5t3pjibzIOBgNL9rBV35P2M93uLW/RRDQ25/f4YAXJqzzb
	 v6laLq2rPTjYEey8qr57Jn4JG34/Y4n1tJ1MZ/Q7dK4rEWdsmohCbeTbTd8Y9tCnhf
	 hkXr0eakzuGsxzbVJYxyUzOTIJduC8wSxRCdNilk=
Date: Mon, 21 Apr 2025 23:02:32 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, dongcheng.yan@intel.com
Subject: Re: [PATCH v2 05/11] media: ccs-pll: Print a debug message on too
 high VT PLL OP clock
Message-ID: <20250421200232.GF17813@pendragon.ideasonboard.com>
References: <20250417065354.311617-1-sakari.ailus@linux.intel.com>
 <20250417065354.311617-6-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250417065354.311617-6-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Thu, Apr 17, 2025 at 09:53:48AM +0300, Sakari Ailus wrote:
> In general the CCS PLL calculator prints debugging information on the
> process to ease debugging. This case was not annotated, do that now.
> 
> Remove an extra multiplication while at it.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/ccs-pll.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
> index d985686b0a36..66d046d576f7 100644
> --- a/drivers/media/i2c/ccs-pll.c
> +++ b/drivers/media/i2c/ccs-pll.c
> @@ -318,12 +318,13 @@ __ccs_pll_calculate_vt_tree(struct device *dev,
>  		return -EINVAL;
>  	}
>  
> -	if (pll_fr->pll_multiplier * pll_fr->pll_ip_clk_freq_hz >
> -	    lim_fr->max_pll_op_clk_freq_hz)
> -		return -EINVAL;
> -
>  	pll_fr->pll_op_clk_freq_hz =
>  		pll_fr->pll_ip_clk_freq_hz * pll_fr->pll_multiplier;
> +	if (pll_fr->pll_op_clk_freq_hz > lim_fr->max_pll_op_clk_freq_hz) {
> +		dev_dbg(dev, "too high OP clock %u\n",
> +			pll_fr->pll_op_clk_freq_hz);
> +		return -EINVAL;
> +	}
>  
>  	vt_div = div * more_mul;
>  

-- 
Regards,

Laurent Pinchart

