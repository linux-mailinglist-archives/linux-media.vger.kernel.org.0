Return-Path: <linux-media+bounces-30854-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E561A99706
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 19:50:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 251F71B82E48
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 17:51:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1CD628CF74;
	Wed, 23 Apr 2025 17:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UTB9cU/u"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F4D28CF6E
	for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 17:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745430635; cv=none; b=gY/YQ9UgWLYkgA02v/ZND2vFA/aN9VZskBYhoPVKEJ2a7O+z6+UAKmHHWjtAGmjZUDVN1cEFBYvPCrRRhBdsTT4loa/EtUcL7XWGTa8K6z6AeNd9LPNKbNdcNa9LtAaaub2genmDpTVUqukc/5YobYzBRmIEqpy+eV5N+rae6qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745430635; c=relaxed/simple;
	bh=bk5wXM9qbTFKUxvv6tv6ldW7nAMq+nNIhsjGwGXNWcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UHZ6EOywR2IvaCVEZpFO7/w2gzUdj9BRT404h8c/pn/54gYFcbufslDJ5xNg3tw6xPPjo0KJQCSQ4eLbT4AZENq8+KynVmP4HBt9ff1571hrIpBpj7JsyeqV6QbjAXthgLKFKyCH+eAZhpzpTB5aOHp5bP5KySr7Xw16qYhZfNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UTB9cU/u; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 662B7198D;
	Wed, 23 Apr 2025 19:50:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745430629;
	bh=bk5wXM9qbTFKUxvv6tv6ldW7nAMq+nNIhsjGwGXNWcU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UTB9cU/u7VT2G/zdCTJtu1Q5iWksVsQAwIcql9wVfKzpLmzrDH2CnkWcnRGhAPFq8
	 Wz6hvYQnscC6ewZvSsoUos/P5M5/wQElvaNmhi+MQgXmM+NB8cHPeMdeoQSqwbxntG
	 vyq1HjvJ/eJAmY/V/U4vVuzCaqWy29gledandX9g=
Date: Wed, 23 Apr 2025 20:50:29 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, dongcheng.yan@intel.com
Subject: Re: [PATCH v4 11/11] media: ccs-pll: Document the CCS PLL flags
Message-ID: <20250423175029.GH17813@pendragon.ideasonboard.com>
References: <20250423124322.GG17813@pendragon.ideasonboard.com>
 <20250423153719.1801956-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250423153719.1801956-1-sakari.ailus@linux.intel.com>

On Wed, Apr 23, 2025 at 06:37:19PM +0300, Sakari Ailus wrote:
> Document the CCS PLL flags with short comments. The CCS spec has more
> information on them while the added documentation helps finding the
> relevant information in the CCS spec.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> since v3:
> 
> - Refer to pixels in CCS_PLL_FLAG_OP_PIX_DDR comment.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  drivers/media/i2c/ccs-pll.c |  2 +-
>  drivers/media/i2c/ccs-pll.h | 27 ++++++++++++++++++++++++---
>  2 files changed, 25 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
> index 87798616b76d..8f9a695bd9e5 100644
> --- a/drivers/media/i2c/ccs-pll.c
> +++ b/drivers/media/i2c/ccs-pll.c
> @@ -129,8 +129,8 @@ static void print_pll_flags(struct device *dev, struct ccs_pll *pll)
>  {
>  	dev_dbg(dev, "PLL flags%s%s%s%s%s%s%s%s%s%s%s\n",
>  		pll->flags & PLL_FL(OP_PIX_CLOCK_PER_LANE) ? " op-pix-clock-per-lane" : "",
> -		pll->flags & PLL_FL(NO_OP_CLOCKS) ? " no-op-clocks" : "",
>  		pll->flags & PLL_FL(EVEN_PLL_MULTIPLIER) ? " even-pll-multiplier" : "",
> +		pll->flags & PLL_FL(NO_OP_CLOCKS) ? " no-op-clocks" : "",
>  		pll->flags & PLL_FL(LANE_SPEED_MODEL) ? " lane-speed" : "",
>  		pll->flags & PLL_FL(EXT_IP_PLL_DIVIDER) ?
>  		" ext-ip-pll-divider" : "",
> diff --git a/drivers/media/i2c/ccs-pll.h b/drivers/media/i2c/ccs-pll.h
> index 754eb5f52cc4..e22903931e72 100644
> --- a/drivers/media/i2c/ccs-pll.h
> +++ b/drivers/media/i2c/ccs-pll.h
> @@ -18,19 +18,40 @@
>  #define CCS_PLL_BUS_TYPE_CSI2_DPHY				0x00
>  #define CCS_PLL_BUS_TYPE_CSI2_CPHY				0x01
>  
> -/* Old SMIA and implementation specific flags */
> -/* op pix clock is for all lanes in total normally */
> +/* Old SMIA and implementation specific flags. */
> +/* OP PIX clock is for all lanes in total normally. */
>  #define CCS_PLL_FLAG_OP_PIX_CLOCK_PER_LANE			BIT(0)
> -#define CCS_PLL_FLAG_NO_OP_CLOCKS				BIT(1)
> +/* If set, the PLL multipliers are required to be even. */
>  #define CCS_PLL_FLAG_EVEN_PLL_MULTIPLIER			BIT(3)
> +
>  /* CCS PLL flags */
> +
> +/* The sensor doesn't have OP clocks at all. */
> +#define CCS_PLL_FLAG_NO_OP_CLOCKS				BIT(1)
> +/* System speed model if this flag is unset. */
>  #define CCS_PLL_FLAG_LANE_SPEED_MODEL				BIT(2)
> +/* If set, the pre-PLL divider may have odd values, too. */
>  #define CCS_PLL_FLAG_EXT_IP_PLL_DIVIDER				BIT(4)
> +/*
> + * If set, the OP PIX clock doesn't have to exactly match with data rate, it may
> + * be higher. See "OP Domain Formulas" in MIPI CCS 1.1 spec.
> + */
>  #define CCS_PLL_FLAG_FLEXIBLE_OP_PIX_CLK_DIV			BIT(5)
> +/* If set, the VT domain may run faster than the OP domain. */
>  #define CCS_PLL_FLAG_FIFO_DERATING				BIT(6)
> +/* If set, the VT domain may run slower than the OP domain. */
>  #define CCS_PLL_FLAG_FIFO_OVERRATING				BIT(7)
> +/* If set, the PLL tree has two PLLs instead of one. */
>  #define CCS_PLL_FLAG_DUAL_PLL					BIT(8)
> +/*
> + * If set, the OP SYS clock is a dual data rate clock, transferring two bits per
> + * cycle instead of one.
> + */
>  #define CCS_PLL_FLAG_OP_SYS_DDR					BIT(9)
> +/*
> + * If set, the OP PIX clock is a dual data rate clock, transferring two pixels
> + * per cycle instead of one.
> + */
>  #define CCS_PLL_FLAG_OP_PIX_DDR					BIT(10)
>  
>  /**

-- 
Regards,

Laurent Pinchart

