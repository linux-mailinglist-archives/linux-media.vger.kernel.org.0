Return-Path: <linux-media+bounces-36188-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 20057AECEFF
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 19:21:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4AC2F170C8F
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 17:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8BFD2356D2;
	Sun, 29 Jun 2025 17:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="W35AEyGg"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D934E2DF68;
	Sun, 29 Jun 2025 17:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751217657; cv=none; b=kWkdZarNKIIp/h63ilOJxfut8zi4EqVVbbmcQR8vI/rXtoGjmW1ZUniY4Ny9H1mGcUVXevEpDCfCozt9YTLuL5Oswt3y0COkpHTQRzBRikD8fcHjG5U/YxoHqFyzED1H+GqWiHxjkBlgXuDN8idy3XJEmCWnTCebuJhsq2/SHtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751217657; c=relaxed/simple;
	bh=N0f5afAkzf1fqW3XQTQYnjI+xdJY4qlclUwKHzWbAXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jK/J9uIqjLWnpeMx9ofc0BK4q4bWFiPXc37sDIQ3XSr4xZpxC7sN5uZwAmA/EuS16svXpwcD0OgOZ8u+IMpzy/MQGxoCTihu/3I3bgwoaLQeAXGg2aU7j97SIVuj+GTLmeAZgwDzX9fWdRqKqc90jx3aNsuDHch31kW0BPLiLrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=W35AEyGg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id A02F61128;
	Sun, 29 Jun 2025 19:20:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751217631;
	bh=N0f5afAkzf1fqW3XQTQYnjI+xdJY4qlclUwKHzWbAXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W35AEyGgIUcqCHL/7PyNxv8RHww0sSvQ8RVq9urPRCSIUAjGyRZcO8Lauww0Q084C
	 2G8IOm70og486fHs7C1VXhEhnqMZDRyfeUruqeSjU2ee2z18orNyqRBRts2hTU7gB0
	 h7M+qN6DEXm3bpUrIrXB/PO9x71MSEYwyCeIy3lU=
Date: Sun, 29 Jun 2025 20:20:28 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: git@apitzsch.eu
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Ricardo Ribalda <ribalda@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] media: i2c: imx214: Separat legacy link frequency
 check from PLL calculation
Message-ID: <20250629172028.GM24912@pendragon.ideasonboard.com>
References: <20250629-imx214_fixes-v1-0-873eb94ad635@apitzsch.eu>
 <20250629-imx214_fixes-v1-5-873eb94ad635@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250629-imx214_fixes-v1-5-873eb94ad635@apitzsch.eu>

Hi André,

Thank you for the patch.

s/Separat/Separate/ in the subject line.

On Sun, Jun 29, 2025 at 04:49:24PM +0200, André Apitzsch via B4 Relay wrote:
> From: André Apitzsch <git@apitzsch.eu>
> 
> This makes it easier to drop this legacy support from the driver later.
> 
> Signed-off-by: André Apitzsch <git@apitzsch.eu>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/imx214.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index 63cf30acdc241de2f9ab3db339590da4af3d5102..52433775e9baddd8ab988e866a83387d53c1fd5c 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -1362,18 +1362,16 @@ static int imx214_parse_fwnode(struct imx214 *imx214)
>  		u64 freq = bus_cfg->link_frequencies[i];
>  		struct ccs_pll pll;
>  
> -		if (!imx214_pll_calculate(imx214, &pll, freq))
> -			break;
>  		if (freq == IMX214_DEFAULT_LINK_FREQ_LEGACY) {
>  			dev_warn(dev,
>  				 "link-frequencies %d not supported, please review your DT. Continuing anyway\n",
>  				 IMX214_DEFAULT_LINK_FREQ);
>  			freq = IMX214_DEFAULT_LINK_FREQ;
> -			if (imx214_pll_calculate(imx214, &pll, freq))
> -				continue;
>  			bus_cfg->link_frequencies[i] = freq;
> -			break;
>  		}
> +
> +		if (!imx214_pll_calculate(imx214, &pll, freq))
> +			break;
>  	}
>  
>  	if (i == bus_cfg->nr_of_link_frequencies)

-- 
Regards,

Laurent Pinchart

