Return-Path: <linux-media+bounces-33659-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39827AC8DB9
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 14:32:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E7D2318848F7
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 12:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9EA122B5AD;
	Fri, 30 May 2025 12:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eyLKp/bs"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99488EACD;
	Fri, 30 May 2025 12:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748608306; cv=none; b=lNChdWrtlmvlHyypGdJUSqdEJsN6t5li1dEbAAZhleS1PFx8BVmzknfJdzHG0zrvtKNZ9tE0YXHYNiIXSRykTtsrxV3ef2ue7fHZo9ZyQhY0CBzcaSSLJQKRg+TYWH1sXwnioaYpY/9zJ/vdsLjIW5+3a72kclmsdRVgPusCZnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748608306; c=relaxed/simple;
	bh=BAY44QjCBDFX7mnuiCogvS5wrINuqMgfmrcW2vgKub0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=JFl0SHiUpralEZ59/r/zFn63/G1lEZfpKXfzN0t2JaXuUcUY/Y8SjyUj6GTabvHHDJc+iGAj7Q4q6w6Xo4+HadkaXWgqQf11uTfKy0SY53kVsTXHI7d7nBBdZqbnftpRf58f5zb8K+D8otGQN29Yn3sFBwk4lIxYNq2qpg3DSGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eyLKp/bs; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2E5DC82E;
	Fri, 30 May 2025 14:31:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748608275;
	bh=BAY44QjCBDFX7mnuiCogvS5wrINuqMgfmrcW2vgKub0=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=eyLKp/bsJ6T4LFInHYYXGNdzv+H+E8OJlIvM7yBhwpvXs9BxKLY7CyKeOwQ3Job2X
	 3k8htqwZJTjjIWJYgX3rigQvRf3ToXtbZRQaFOFPOZ6esybGQb5/VLtv51HuvW8pYK
	 hQKoVPk4wYM+adxH+YQG5EbbnCPgIvnqoGbxkf/Q=
Message-ID: <5c3bdd6e-c88a-4621-8d14-ccf4346c7bc6@ideasonboard.com>
Date: Fri, 30 May 2025 15:31:39 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] media: rcar-csi2: Clarify usage of mbps and msps
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250511174730.944524-1-niklas.soderlund+renesas@ragnatech.se>
 <20250511174730.944524-2-niklas.soderlund+renesas@ragnatech.se>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <20250511174730.944524-2-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 11/05/2025 20:47, Niklas Söderlund wrote:
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

Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

 Tomi


