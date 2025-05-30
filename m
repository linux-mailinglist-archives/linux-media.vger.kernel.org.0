Return-Path: <linux-media+bounces-33663-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 60145AC8FC3
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 15:19:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50D6CA44A9C
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 13:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0237231A32;
	Fri, 30 May 2025 13:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rgOSQMOd"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FBC22B8A8;
	Fri, 30 May 2025 13:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748610399; cv=none; b=YOfQm5lYlyxVzimkwfVR1dy75hu/uomz5X9Da7r6vTR8D3qOSRyhkFlpEKkSWfC87CpWdCkGfF4F3kfrWI+f7TFfSaNuYTu2LRp90KiW0yKTg3Pxw/6LdRS7DiEdia5hXuSmvTVEczcfezU+iVugb9LP9bedwBjKsgd/IXuLX1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748610399; c=relaxed/simple;
	bh=mbQcgrpkJN151DDG7zJ8d/BCkghxILhf25q36CdmOhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pNbXZZYZvL8mmWSbliSRN/xAio3TUV0nOZWQt5tqPIy53NUOvIF0EWR1WZ3z1UHhpzpzYewwjoO+1c40dWgfmgMPZBWTe1+bVPYRFjgSemAyCYDmnMh5GrX5gLrfxa78dOJS9VK0B0e/u7AXp/A7ElklpzycbnNkDFsb58KrRW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rgOSQMOd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7B01589A;
	Fri, 30 May 2025 15:06:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748610367;
	bh=mbQcgrpkJN151DDG7zJ8d/BCkghxILhf25q36CdmOhg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rgOSQMOd31Yf0r39wW2IsC59/Xwv0JEd5e7+by2LyBL5aDOHVzd4LjSXWnmOnygRR
	 9jPHevfK6Y1uFQjwBPJfUKUYw/WGfIKyi7xhYPHmot2OoxKZWbPzc6bDStEpMPlUkV
	 0DtzxPXGrh37ZBFt9ZgzA/eUIi5BSRlhGGqe0wb4=
Date: Fri, 30 May 2025 16:06:28 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] media: rcar-csi2: Rework macros to access AFE
 lanes
Message-ID: <20250530130628.GB18205@pendragon.ideasonboard.com>
References: <20250511174730.944524-1-niklas.soderlund+renesas@ragnatech.se>
 <20250511174730.944524-3-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250511174730.944524-3-niklas.soderlund+renesas@ragnatech.se>

On Sun, May 11, 2025 at 07:47:28PM +0200, Niklas Söderlund wrote:
> Each AFE lane have a set of control and offset registers. The registers

s/have/has/

> themself are undocumented but later datasheets program more of them with
> magic values. Before exploding the driver with more defines to name them
> all rework the AFE ones to be able to address all controls and offsets.
> 
> Also move a stray define that is out of sequence.
> 
> There is no functional change.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> * Changes since v1
> - Adjust line length.
> ---
>  drivers/media/platform/renesas/rcar-csi2.c | 32 +++++++++++-----------
>  1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> index 358e7470befc..cdd358b4a973 100644
> --- a/drivers/media/platform/renesas/rcar-csi2.c
> +++ b/drivers/media/platform/renesas/rcar-csi2.c
> @@ -177,15 +177,14 @@ struct rcar_csi2;
>  #define V4H_PPI_RW_OFFSETCAL_CFG_0_REG			0x21ca0
>  
>  /* V4H CORE registers */
> -#define V4H_CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_REG(n)	(0x22040 + ((n) * 2)) /* n = 0 - 15 */
> -#define V4H_CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_REG(n)	(0x22440 + ((n) * 2)) /* n = 0 - 15 */
> -#define V4H_CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_REG(n)	(0x22840 + ((n) * 2)) /* n = 0 - 15 */
> -#define V4H_CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_2_REG(n)	(0x22c40 + ((n) * 2)) /* n = 0 - 15 */
> -#define V4H_CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_2_REG(n)	(0x23040 + ((n) * 2)) /* n = 0 - 15 */
> +
> +#define V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(l, n) (0x22040 + ((l) * 0x400) + ((n) * 2))
> +#define V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_3_REG(l, n) (0x22060 + ((l) * 0x400) + ((n) * 2))
> +#define V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_4_REG(l, n) (0x22080 + ((l) * 0x400) + ((n) * 2))
> +
>  #define V4H_CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_REG(n)	(0x23840 + ((n) * 2)) /* n = 0 - 11 */
>  #define V4H_CORE_DIG_RW_COMMON_REG(n)			(0x23880 + ((n) * 2)) /* n = 0 - 15 */
>  #define V4H_CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_REG(n)	(0x239e0 + ((n) * 2)) /* n = 0 - 3 */
> -#define V4H_CORE_DIG_CLANE_1_RW_HS_TX_6_REG		0x2a60c
>  
>  /* V4H C-PHY */
>  #define V4H_CORE_DIG_RW_TRIO0_REG(n)			(0x22100 + ((n) * 2)) /* n = 0 - 3 */
> @@ -197,6 +196,7 @@ struct rcar_csi2;
>  #define V4H_CORE_DIG_CLANE_1_RW_CFG_0_REG		0x2a400
>  #define V4H_CORE_DIG_CLANE_1_RW_LP_0_REG		0x2a480
>  #define V4H_CORE_DIG_CLANE_1_RW_HS_RX_REG(n)		(0x2a500 + ((n) * 2)) /* n = 0 - 6 */
> +#define V4H_CORE_DIG_CLANE_1_RW_HS_TX_6_REG		0x2a60c
>  #define V4H_CORE_DIG_CLANE_2_RW_CFG_0_REG		0x2a800
>  #define V4H_CORE_DIG_CLANE_2_RW_LP_0_REG		0x2a880
>  #define V4H_CORE_DIG_CLANE_2_RW_HS_RX_REG(n)		(0x2a900 + ((n) * 2)) /* n = 0 - 6 */
> @@ -1246,11 +1246,11 @@ static int rcsi2_c_phy_setting_v4h(struct rcar_csi2 *priv, int mbps)
>  	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_1_RW_HS_RX_REG(2), conf->rx2);
>  	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_2_RW_HS_RX_REG(2), conf->rx2);
>  
> -	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_REG(2), 0x0001);
> -	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_REG(2), 0);
> -	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_REG(2), 0x0001);
> -	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_2_REG(2), 0x0001);
> -	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_2_REG(2), 0);
> +	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(0, 2), 0x0001);
> +	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(1, 2), 0);
> +	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(2, 2), 0x0001);
> +	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(3, 2), 0x0001);
> +	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(4, 2), 0);
>  
>  	rcsi2_write16(priv, V4H_CORE_DIG_RW_TRIO0_REG(0), conf->trio0);
>  	rcsi2_write16(priv, V4H_CORE_DIG_RW_TRIO1_REG(0), conf->trio0);
> @@ -1267,13 +1267,13 @@ static int rcsi2_c_phy_setting_v4h(struct rcar_csi2 *priv, int mbps)
>  	/* Configure data line order. */
>  	rsci2_set_line_order(priv, priv->line_orders[0],
>  			     V4H_CORE_DIG_CLANE_0_RW_CFG_0_REG,
> -			     V4H_CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_REG(9));
> +			     V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(0, 9));
>  	rsci2_set_line_order(priv, priv->line_orders[1],
>  			     V4H_CORE_DIG_CLANE_1_RW_CFG_0_REG,
> -			     V4H_CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_REG(9));
> +			     V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(1, 9));
>  	rsci2_set_line_order(priv, priv->line_orders[2],
>  			     V4H_CORE_DIG_CLANE_2_RW_CFG_0_REG,
> -			     V4H_CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_REG(9));
> +			     V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(2, 9));
>  
>  	/* TODO: This registers is not documented. */
>  	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_1_RW_HS_TX_6_REG, 0x5000);
> @@ -1289,8 +1289,8 @@ static int rcsi2_c_phy_setting_v4h(struct rcar_csi2 *priv, int mbps)
>  	}
>  
>  	/* C-PHY setting - analog programing*/
> -	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_REG(9), conf->lane29);
> -	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_REG(7), conf->lane27);
> +	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(0, 9), conf->lane29);
> +	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(0, 7), conf->lane27);
>  
>  	return 0;
>  }

-- 
Regards,

Laurent Pinchart

