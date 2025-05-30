Return-Path: <linux-media+bounces-33662-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E9903AC8FC2
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 15:19:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23ACC3B9AFE
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 13:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4E8423184D;
	Fri, 30 May 2025 13:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZJvTEyAx"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA9622C331;
	Fri, 30 May 2025 13:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748610265; cv=none; b=TtDIosZAz865hctOMJeTI2DIsD7xkwGEyhEmkierFJeXYKTpBHNa2XFNhw/+9Gu1Vec+yjd/4+qy5AUHhHSY4c3bQze+eSbr+KdyGdPH+wwgG7+T7aj9ydmHm+oq8kB+BaQvxZ9QV0yRpcU7Wu/7hjOzxQXDjTto+8X9zB0u7Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748610265; c=relaxed/simple;
	bh=rxyy6MH+lICAnNMu40itNdqUAOMLFXcLUJqirFyTMu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PcEMdtszizsnDuSKTexP4PJ/y/L+VM7OLoioFAsECgk8PCRUi/nmAMz7rJVG/3opm3HBuXHBnuGadQdYcsbLHc5dQEbzFGEm+lw0zIKS8QPeUQBHGpP/4Yd1fX86dFfRaqeh1Uz49hstmKe7K7HD4qA/f1Z54yVr/VNA2i0Osk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZJvTEyAx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B1E3C89A;
	Fri, 30 May 2025 15:03:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748610233;
	bh=rxyy6MH+lICAnNMu40itNdqUAOMLFXcLUJqirFyTMu4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZJvTEyAxU4C2kcg6TfXf/Brhuz+7z82nr5ln9EESQO5xWrPtpKiaudzeB0f/kXBZr
	 TZGJ5laLljYvSPqMSULaKolWpXYjthOaXlNRVMpwmKuy5Ey5l66P2lyH7gNq+9qhZs
	 uImJc46k32329564g/O41Vvj4pKBcD4kHTWMXDmw=
Date: Fri, 30 May 2025 16:04:14 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] media: rcar-csi2: Clarify usage of mbps and msps
Message-ID: <20250530130414.GA18205@pendragon.ideasonboard.com>
References: <20250511174730.944524-1-niklas.soderlund+renesas@ragnatech.se>
 <20250511174730.944524-2-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250511174730.944524-2-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

Thank you for the patch.

On Sun, May 11, 2025 at 07:47:27PM +0200, Niklas Söderlund wrote:
> The helper function to deal with calculating the link speed is designed
> in such a way that it returns the correct type bps (bits per second) for
> D-PHY and sps (symbols per second) for C-PHY. And for historical reasons
> the function kept the name mbps.
> 
> This is confusing, fix it by having the function only deal with bps
> values as this is the most common use-case and convert bps to sps in the
> only function where it is needed to configure the C-PHY.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/renesas/rcar-csi2.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> index 9979de4f6ef1..358e7470befc 100644
> --- a/drivers/media/platform/renesas/rcar-csi2.c
> +++ b/drivers/media/platform/renesas/rcar-csi2.c
> @@ -975,10 +975,6 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp,
>  
>  	mbps = div_u64(freq * 2, MEGA);
>  
> -	/* Adjust for C-PHY, divide by 2.8. */
> -	if (priv->cphy)
> -		mbps = div_u64(mbps * 5, 14);
> -
>  	return mbps;
>  }
>  
> @@ -1203,9 +1199,13 @@ static int rcsi2_wait_phy_start_v4h(struct rcar_csi2 *priv, u32 match)
>  	return -ETIMEDOUT;
>  }
>  
> -static int rcsi2_c_phy_setting_v4h(struct rcar_csi2 *priv, int msps)
> +static int rcsi2_c_phy_setting_v4h(struct rcar_csi2 *priv, int mbps)
>  {
>  	const struct rcsi2_cphy_setting *conf;
> +	int msps;
> +
> +	/* Adjust for C-PHY symbols, divide by 2.8. */
> +	msps = div_u64(mbps * 5, 14);
>  
>  	for (conf = cphy_setting_table_r8a779g0; conf->msps != 0; conf++) {
>  		if (conf->msps > msps)
> @@ -1301,7 +1301,7 @@ static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv,
>  	const struct rcar_csi2_format *format;
>  	const struct v4l2_mbus_framefmt *fmt;
>  	unsigned int lanes;
> -	int msps;
> +	int mbps;
>  	int ret;
>  
>  	/* Use the format on the sink pad to compute the receiver config. */
> @@ -1314,9 +1314,9 @@ static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv,
>  	if (ret)
>  		return ret;
>  
> -	msps = rcsi2_calc_mbps(priv, format->bpp, lanes);
> -	if (msps < 0)
> -		return msps;
> +	mbps = rcsi2_calc_mbps(priv, format->bpp, lanes);
> +	if (mbps < 0)
> +		return mbps;
>  
>  	/* Reset LINK and PHY*/
>  	rcsi2_write(priv, V4H_CSI2_RESETN_REG, 0);
> @@ -1352,7 +1352,7 @@ static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv,
>  	rcsi2_write16(priv, V4H_PPI_RW_COMMON_CFG_REG, 0x0003);
>  
>  	/* C-PHY settings */
> -	ret = rcsi2_c_phy_setting_v4h(priv, msps);
> +	ret = rcsi2_c_phy_setting_v4h(priv, mbps);
>  	if (ret)
>  		return ret;
>  
> @@ -1363,7 +1363,7 @@ static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv,
>  	return 0;
>  }
>  
> -static int rcsi2_d_phy_setting_v4m(struct rcar_csi2 *priv, int data_rate)
> +static int rcsi2_d_phy_setting_v4m(struct rcar_csi2 *priv, int mbps)
>  {
>  	unsigned int timeout;
>  	int ret;

-- 
Regards,

Laurent Pinchart

