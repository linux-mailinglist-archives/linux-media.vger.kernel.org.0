Return-Path: <linux-media+bounces-33665-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D852FAC9072
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 15:42:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 816C23AFD07
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 13:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4E61221714;
	Fri, 30 May 2025 13:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XSV4yv1q"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC3F15E97;
	Fri, 30 May 2025 13:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748612535; cv=none; b=pkP9qwIRDVmICr1BcWgeOMgBlPBUUPpWhRcc2LOIoaJ/PAd6XuKgMLRFTufUQ2IAd+9JoItzCX7ExUZG3ti854ObhiyznFMDiPlAh0qzetTLrTz09XZKaxLGj6j0Ht9KgQ6D5/3sRkvcB6k59jR+hM3xXaBq4q5OG68mOyGm3Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748612535; c=relaxed/simple;
	bh=l897+blZqfp6lHq7oPmV82vE9YXF8sO0IMwsdGVMgfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KEHPe9roQ5g31xKMspSIb0LUD7WuQt+UIgVfGsSgVhwmZ5ITr/14SZRfRt3oH7F7n2HS0G0YUWqzNyWWVV8gqp+lPKZVb3hxnSLy0h3hIUQ9risWjoFEfgimVVKBpbRSYNI0cc0kpW8ngLKfm4j8WyIbFtv8z+VD/2/MOBlqD7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XSV4yv1q; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 82BAF89A;
	Fri, 30 May 2025 15:41:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748612503;
	bh=l897+blZqfp6lHq7oPmV82vE9YXF8sO0IMwsdGVMgfk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XSV4yv1qQjrJ77+JZB6cwiP4IxgE0+apBm5FkL4qKtcKGO5qMHsOVoCP4BiNhJNB/
	 tSGua5HCOU47xwwSHo5jUhRq6PfNY02vbgSVJ5i/RQc9h0Bs8/6matyIsvWTTC3pJK
	 BNGSIJpwaKpAOTSLy1QzyT6X3NHyFv7uryR+Fp3o=
Date: Fri, 30 May 2025 16:42:04 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] media: rcar-csi2: Update start procedure for V4H
Message-ID: <20250530134204.GD18205@pendragon.ideasonboard.com>
References: <20250511174730.944524-1-niklas.soderlund+renesas@ragnatech.se>
 <20250511174730.944524-4-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250511174730.944524-4-niklas.soderlund+renesas@ragnatech.se>

On Sun, May 11, 2025 at 07:47:29PM +0200, Niklas Söderlund wrote:
> Prepare for adding D-PHY support to the driver by first updating the
> generic startup procedure that covers both C-PHY and D-PHY operations.
> The starting procedure where updated in later versions of the datasheet.
> 
> Most of the configuration is only documented as tables of magic values
> in the documentation. Each step is however marked with a T<n> marker,
> inject these markers in the comments to make it easier to map driver to
> documentation.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/renesas/rcar-csi2.c | 84 +++++++++++++++-------
>  1 file changed, 58 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> index cdd358b4a973..7ba637d8683b 100644
> --- a/drivers/media/platform/renesas/rcar-csi2.c
> +++ b/drivers/media/platform/renesas/rcar-csi2.c
> @@ -1199,7 +1199,8 @@ static int rcsi2_wait_phy_start_v4h(struct rcar_csi2 *priv, u32 match)
>  	return -ETIMEDOUT;
>  }
>  
> -static int rcsi2_c_phy_setting_v4h(struct rcar_csi2 *priv, int mbps)
> +static const struct rcsi2_cphy_setting *
> +rcsi2_c_phy_setting_v4h(struct rcar_csi2 *priv, int mbps)
>  {
>  	const struct rcsi2_cphy_setting *conf;
>  	int msps;
> @@ -1214,7 +1215,7 @@ static int rcsi2_c_phy_setting_v4h(struct rcar_csi2 *priv, int mbps)
>  
>  	if (!conf->msps) {
>  		dev_err(priv->dev, "Unsupported PHY speed for msps setting (%u Msps)", msps);
> -		return -ERANGE;
> +		return NULL;
>  	}
>  
>  	/* C-PHY specific */
> @@ -1278,27 +1279,14 @@ static int rcsi2_c_phy_setting_v4h(struct rcar_csi2 *priv, int mbps)
>  	/* TODO: This registers is not documented. */
>  	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_1_RW_HS_TX_6_REG, 0x5000);
>  
> -	/* Leave Shutdown mode */
> -	rcsi2_write(priv, V4H_DPHY_RSTZ_REG, BIT(0));
> -	rcsi2_write(priv, V4H_PHY_SHUTDOWNZ_REG, BIT(0));
> -
> -	/* Wait for calibration */
> -	if (rcsi2_wait_phy_start_v4h(priv, V4H_ST_PHYST_ST_PHY_READY)) {
> -		dev_err(priv->dev, "PHY calibration failed\n");
> -		return -ETIMEDOUT;
> -	}
> -
> -	/* C-PHY setting - analog programing*/
> -	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(0, 9), conf->lane29);
> -	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(0, 7), conf->lane27);
> -
> -	return 0;
> +	return conf;
>  }
>  
>  static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv,
>  				    struct v4l2_subdev_state *state)
>  {
>  	const struct rcar_csi2_format *format;
> +	const struct rcsi2_cphy_setting *cphy;
>  	const struct v4l2_mbus_framefmt *fmt;
>  	unsigned int lanes;
>  	int mbps;
> @@ -1318,24 +1306,35 @@ static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv,
>  	if (mbps < 0)
>  		return mbps;
>  
> -	/* Reset LINK and PHY*/
> +	/* T0: Reset LINK and PHY*/
>  	rcsi2_write(priv, V4H_CSI2_RESETN_REG, 0);
>  	rcsi2_write(priv, V4H_DPHY_RSTZ_REG, 0);
>  	rcsi2_write(priv, V4H_PHY_SHUTDOWNZ_REG, 0);
>  
> -	/* PHY static setting */
> -	rcsi2_write(priv, V4H_PHY_EN_REG, V4H_PHY_EN_ENABLE_CLK);
> +	/* T1: PHY static setting */
> +	rcsi2_write(priv, V4H_PHY_EN_REG, V4H_PHY_EN_ENABLE_CLK |
> +		    V4H_PHY_EN_ENABLE_0 | V4H_PHY_EN_ENABLE_1 |
> +		    V4H_PHY_EN_ENABLE_2 | V4H_PHY_EN_ENABLE_3);
>  	rcsi2_write(priv, V4H_FLDC_REG, 0);
>  	rcsi2_write(priv, V4H_FLDD_REG, 0);
>  	rcsi2_write(priv, V4H_IDIC_REG, 0);
>  	rcsi2_write(priv, V4H_PHY_MODE_REG, V4H_PHY_MODE_CPHY);
>  	rcsi2_write(priv, V4H_N_LANES_REG, lanes - 1);
>  
> -	/* Reset CSI2 */
> +	rcsi2_write(priv, V4M_FRXM_REG,
> +		    V4M_FRXM_FORCERXMODE_0 | V4M_FRXM_FORCERXMODE_1 |
> +		    V4M_FRXM_FORCERXMODE_2 | V4M_FRXM_FORCERXMODE_3);
> +	rcsi2_write(priv, V4M_OVR1_REG,
> +		    V4M_OVR1_FORCERXMODE_0 | V4M_OVR1_FORCERXMODE_1 |
> +		    V4M_OVR1_FORCERXMODE_2 | V4M_OVR1_FORCERXMODE_3);
> +
> +	/* T2: Reset CSI2 */
>  	rcsi2_write(priv, V4H_CSI2_RESETN_REG, BIT(0));
>  
>  	/* Registers static setting through APB */
>  	/* Common setting */
> +	rcsi2_write16(priv, V4H_PPI_STARTUP_RW_COMMON_DPHY_REG(10), 0x0030);
> +	rcsi2_write16(priv, V4H_CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_REG(2), 0x1444);
>  	rcsi2_write16(priv, V4H_CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_REG(0), 0x1bfd);
>  	rcsi2_write16(priv, V4H_PPI_STARTUP_RW_COMMON_STARTUP_1_1_REG, 0x0233);
>  	rcsi2_write16(priv, V4H_PPI_STARTUP_RW_COMMON_DPHY_REG(6), 0x0027);
> @@ -1350,15 +1349,48 @@ static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv,
>  	rcsi2_write16(priv, V4H_PPI_RW_LPDCOCAL_COARSE_CFG_REG, 0x0105);
>  	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_REG(6), 0x1000);
>  	rcsi2_write16(priv, V4H_PPI_RW_COMMON_CFG_REG, 0x0003);
> +	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_REG(0), 0x0000);
> +	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_REG(1), 0x0400);
> +	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_REG(3), 0x41f6);
> +	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_REG(0), 0x0000);
> +	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_REG(3), 0x43f6);
> +	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_REG(6), 0x3000);
> +	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_REG(7), 0x0000);
> +	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_REG(6), 0x7000);
> +	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_REG(7), 0x0000);
> +	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_REG(5), 0x4000);
>  
> -	/* C-PHY settings */
> -	ret = rcsi2_c_phy_setting_v4h(priv, mbps);
> -	if (ret)
> -		return ret;
> +	/* T3: PHY settings */
> +	cphy = rcsi2_c_phy_setting_v4h(priv, mbps);
> +	if (!cphy)
> +		return -ERANGE;
>  
> +	/* T4: Leave Shutdown mode */
> +	rcsi2_write(priv, V4H_DPHY_RSTZ_REG, BIT(0));
> +	rcsi2_write(priv, V4H_PHY_SHUTDOWNZ_REG, BIT(0));
> +
> +	/* T5: Wait for calibration */
> +	if (rcsi2_wait_phy_start_v4h(priv, V4H_ST_PHYST_ST_PHY_READY)) {
> +		dev_err(priv->dev, "PHY calibration failed\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	/* T6: Analog programming */
> +	for (unsigned int l = 0; l < 3; l++) {
> +		rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(l, 9),
> +			      cphy->lane29);
> +		rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(l, 7),
> +			      cphy->lane27);
> +	}
> +
> +	/* T7: Wait for stop state */
>  	rcsi2_wait_phy_start_v4h(priv, V4H_ST_PHYST_ST_STOPSTATE_0 |
>  				 V4H_ST_PHYST_ST_STOPSTATE_1 |
> -				 V4H_ST_PHYST_ST_STOPSTATE_2);
> +				 V4H_ST_PHYST_ST_STOPSTATE_2 |
> +				 V4H_ST_PHYST_ST_STOPSTATE_3);
> +
> +	/* T8: De-assert FRXM */
> +	rcsi2_write(priv, V4M_FRXM_REG, 0);
>  
>  	return 0;
>  }

-- 
Regards,

Laurent Pinchart

