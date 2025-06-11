Return-Path: <linux-media+bounces-34547-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D6943AD639B
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 01:09:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 806F61883B25
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 23:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73A1D24DD0A;
	Wed, 11 Jun 2025 23:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DqPJbtjR"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630E42376FD;
	Wed, 11 Jun 2025 23:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749683069; cv=none; b=dm+5HcT6TldnvZSvkdwweRG8WXrk6yg7Xx2zxDGhO/8WXOxrKhEtluHAXzb2xX5TFZ7XtpSgUbtMpipULKS5l6bMjvVxqpF3etrvNyX1qzCNiWeahmdEoatFpZtqWEeG2K60mb/eYhusZ7rF8lVHkdNXr8nqS2pKuNT03Qfh+zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749683069; c=relaxed/simple;
	bh=zUIdqFjWcpeOsPqBoYldO0ghVfuJCQ8JWJcKxAH7ph8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QyMLOPMsDSD8Meg8SEqVleWlV/6SjSuiTlKzOIm5WTMiNYs0VKqQKia5jO0Yyuhs57Rd6kVCPuPGEcgR5TY1QKr1bgUtQx46FNrlRVQUF9Nt7L5TuUqYZ1NGIM3JYp0EoIiJHUrQVUqcxHKTfMxZXHwkjWgmyMg4fFqcWFz7t0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DqPJbtjR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 546E41D5;
	Thu, 12 Jun 2025 01:04:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749683056;
	bh=zUIdqFjWcpeOsPqBoYldO0ghVfuJCQ8JWJcKxAH7ph8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DqPJbtjRACGYQ/DzQacCB41V7CBA6ClpQxa6LkamW5P6Wrp+R5T6nJ1/dugcU0nH5
	 415pxvEg06NTBQxggjm/wUMirk+4cjwudMp4G4wAKk5JfQ//FdRqw0+KfXi9XgiUv7
	 bUxXpQKQilt0p7QbOeAMkEDn+fNNuQoYUwt4jly4=
Date: Thu, 12 Jun 2025 02:04:12 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] media: rcar-csi2: Add D-PHY support for V4H
Message-ID: <20250611230412.GO24465@pendragon.ideasonboard.com>
References: <20250611154445.123412-1-niklas.soderlund+renesas@ragnatech.se>
 <20250611154445.123412-5-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250611154445.123412-5-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

Thank you for the patch.

On Wed, Jun 11, 2025 at 05:44:45PM +0200, Niklas Söderlund wrote:
> Add D-PHY support for V4H in addition to the already support C-PHY

s/support C-PHY support/supported C-PHY/

> support. The common start-up procedure for C-PHY and D-PHY are shared,

s/are shared/is shared/

> only PHY setup differ. Extend the V4H setup with D-PHY support as
> documented in the datasheet (Rev.1.21).
> 
> Most of the start-up procedure is only documented as magic values in
> tables, there is little documentation to make the settings more clear.
> Wherever possible formulas or lookup tables are used as they are
> documented in the datasheet.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Tested-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
> * Fixes since v2
> - Stire DESKEW settings in an array and loop over it instead of opene
>   coding it.
> 
> * Fixes since v1
> - Init cphy  variables to not trigger false -Wmaybe-uninitialized
>   warning.
> - Adjust line lengths.
> ---
>  drivers/media/platform/renesas/rcar-csi2.c | 240 ++++++++++++++++++++-
>  1 file changed, 230 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> index 7ba637d8683b..1fd36823c8e9 100644
> --- a/drivers/media/platform/renesas/rcar-csi2.c
> +++ b/drivers/media/platform/renesas/rcar-csi2.c
> @@ -172,6 +172,7 @@ struct rcar_csi2;
>  #define V4H_PPI_RW_LPDCOCAL_TWAIT_CONFIG_REG		0x21c0a
>  #define V4H_PPI_RW_LPDCOCAL_VT_CONFIG_REG		0x21c0c
>  #define V4H_PPI_RW_LPDCOCAL_COARSE_CFG_REG		0x21c10
> +#define V4H_PPI_RW_DDLCAL_CFG_n_REG(n)			(0x21c40 + ((n) * 2)) /* n = 0 - 7 */
>  #define V4H_PPI_RW_COMMON_CFG_REG			0x21c6c
>  #define V4H_PPI_RW_TERMCAL_CFG_0_REG			0x21c80
>  #define V4H_PPI_RW_OFFSETCAL_CFG_0_REG			0x21ca0
> @@ -185,6 +186,13 @@ struct rcar_csi2;
>  #define V4H_CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_REG(n)	(0x23840 + ((n) * 2)) /* n = 0 - 11 */
>  #define V4H_CORE_DIG_RW_COMMON_REG(n)			(0x23880 + ((n) * 2)) /* n = 0 - 15 */
>  #define V4H_CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_REG(n)	(0x239e0 + ((n) * 2)) /* n = 0 - 3 */
> +#define V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG	0x23fe0
> +
> +#define V4H_CORE_DIG_DLANE_l_RW_CFG_n_REG(l, n)		(0x26000 + ((l) * 0x400) + ((n) * 2))
> +#define V4H_CORE_DIG_DLANE_l_RW_LP_n_REG(l, n)		(0x26080 + ((l) * 0x400) + ((n) * 2))
> +#define V4H_CORE_DIG_DLANE_l_RW_HS_RX_n_REG(l, n)	(0x26100 + ((l) * 0x400) + ((n) * 2))
> +#define V4H_CORE_DIG_DLANE_CLK_RW_LP_n_REG(n)		V4H_CORE_DIG_DLANE_l_RW_LP_n_REG(4, (n))
> +#define V4H_CORE_DIG_DLANE_CLK_RW_HS_RX_n_REG(n)	V4H_CORE_DIG_DLANE_l_RW_HS_RX_n_REG(4, (n))
>  
>  /* V4H C-PHY */
>  #define V4H_CORE_DIG_RW_TRIO0_REG(n)			(0x22100 + ((n) * 2)) /* n = 0 - 3 */
> @@ -1282,11 +1290,203 @@ rcsi2_c_phy_setting_v4h(struct rcar_csi2 *priv, int mbps)
>  	return conf;
>  }
>  
> +struct rcsi2_d_phy_setting_v4h_lut_value {
> +	unsigned int mbps;
> +	unsigned char cfg_1;
> +	unsigned char cfg_5_94;
> +	unsigned char cfg_5_30;
> +	unsigned char lane_ctrl_2_8;
> +	unsigned char rw_hs_rx_3_83;
> +	unsigned char rw_hs_rx_3_20;
> +	unsigned char rw_hs_rx_6;
> +	unsigned char rw_hs_rx_1;
> +};
> +
> +static const struct rcsi2_d_phy_setting_v4h_lut_value *
> +rcsi2_d_phy_setting_v4h_lut_lookup(int mbps)
> +{
> +	static const struct rcsi2_d_phy_setting_v4h_lut_value values[] = {
> +		{ 4500, 0x3f, 0x07, 0x00, 0x01, 0x02, 0x01, 0x0d, 0x10 },
> +		{ 4000, 0x47, 0x08, 0x01, 0x01, 0x05, 0x01, 0x0f, 0x0d },
> +		{ 3600, 0x4f, 0x09, 0x01, 0x01, 0x06, 0x01, 0x10, 0x0b },
> +		{ 3230, 0x57, 0x0a, 0x01, 0x01, 0x06, 0x01, 0x12, 0x09 },
> +		{ 3000, 0x47, 0x08, 0x00, 0x00, 0x03, 0x01, 0x0f, 0x0c },
> +		{ 2700, 0x4f, 0x09, 0x01, 0x00, 0x06, 0x01, 0x10, 0x0b },
> +		{ 2455, 0x57, 0x0a, 0x01, 0x00, 0x06, 0x01, 0x12, 0x09 },
> +		{ 2250, 0x5f, 0x0b, 0x01, 0x00, 0x08, 0x01, 0x13, 0x08 },
> +		{ 2077, 0x67, 0x0c, 0x01, 0x00, 0x06, 0x02, 0x15, 0x0d },
> +		{ 1929, 0x6f, 0x0d, 0x02, 0x00, 0x06, 0x02, 0x17, 0x0d },
> +		{ 1800, 0x77, 0x0e, 0x02, 0x00, 0x06, 0x02, 0x18, 0x0d },
> +		{ 1688, 0x7f, 0x0f, 0x02, 0x00, 0x08, 0x02, 0x1a, 0x0d },
> +		{ 1588, 0x87, 0x10, 0x02, 0x00, 0x08, 0x02, 0x1b, 0x0d },
> +		{ 1500, 0x8f, 0x11, 0x03, 0x00, 0x08, 0x02, 0x1d, 0x0c },
> +	};
> +
> +	for (unsigned int i = 0; i < ARRAY_SIZE(values); i++)
> +		if (values[i].mbps >= mbps)

I think this should be <=. Or

		if (mbps >= values[i].mbps)

> +			return &values[i];
> +
> +	return NULL;
> +}
> +
> +static int rcsi2_d_phy_setting_v4h(struct rcar_csi2 *priv, int mbps)
> +{
> +	const struct rcsi2_d_phy_setting_v4h_lut_value *lut =
> +		rcsi2_d_phy_setting_v4h_lut_lookup(mbps);
> +	u16 val;
> +
> +	rcsi2_write16(priv, V4H_CORE_DIG_RW_COMMON_REG(7), 0x0000);
> +	rcsi2_write16(priv, V4H_PPI_STARTUP_RW_COMMON_DPHY_REG(7), mbps > 1500 ? 0x0028 : 0x0068);
> +	rcsi2_write16(priv, V4H_PPI_STARTUP_RW_COMMON_DPHY_REG(8), 0x0050);
> +	rcsi2_write16(priv, V4H_PPI_RW_DDLCAL_CFG_n_REG(0), 0x0063);
> +	rcsi2_write16(priv, V4H_PPI_RW_DDLCAL_CFG_n_REG(7), 0x1132);
> +	rcsi2_write16(priv, V4H_PPI_RW_DDLCAL_CFG_n_REG(1), 0x1340);
> +	rcsi2_write16(priv, V4H_PPI_RW_DDLCAL_CFG_n_REG(2), 0x4b13);
> +	rcsi2_write16(priv, V4H_PPI_RW_DDLCAL_CFG_n_REG(4), 0x000a);
> +	rcsi2_write16(priv, V4H_PPI_RW_DDLCAL_CFG_n_REG(6), 0x800a);
> +	rcsi2_write16(priv, V4H_PPI_RW_DDLCAL_CFG_n_REG(7), 0x1109);
> +
> +	if (mbps > 1500) {
> +		val = roundup(5 * mbps / 64, 1);

roundup(..., 1) seems weird. I think you meant

		val = DIV_ROUND_UP(5 * mbps, 64);

> +		rcsi2_write16(priv, V4H_PPI_RW_DDLCAL_CFG_n_REG(3), val);
> +	}
> +
> +	if (lut) {
> +		rcsi2_modify16(priv, V4H_PPI_RW_DDLCAL_CFG_n_REG(1),
> +			       lut->cfg_1, 0x00ff);
> +		rcsi2_modify16(priv, V4H_PPI_RW_DDLCAL_CFG_n_REG(5),
> +			       lut->cfg_5_94 << 4, 0x03f0);
> +		rcsi2_modify16(priv, V4H_PPI_RW_DDLCAL_CFG_n_REG(5),
> +			       lut->cfg_5_30 << 0, 0x000f);
> +
> +		for (unsigned int l = 0; l < 5; l++)
> +			rcsi2_modify16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(l, 8),
> +				       lut->lane_ctrl_2_8 << 12, 0x1000);
> +	}
> +
> +	for (unsigned int l = 0; l < 4; l++)
> +		rcsi2_write16(priv, V4H_CORE_DIG_DLANE_l_RW_LP_n_REG(l, 0), 0x463c);
> +
> +	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(0, 2), 0x0000);
> +	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(1, 2), 0x0000);
> +	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(2, 2), 0x0001);
> +	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(3, 2), 0x0000);
> +	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(4, 2), 0x0000);
> +
> +	rcsi2_write16(priv, V4H_CORE_DIG_RW_COMMON_REG(6), 0x0009);
> +
> +	val = mbps > 1500 ? 0x0800 : 0x0802;
> +	for (unsigned int l = 0; l < 5; l++)
> +		rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(l, 12), val);
> +
> +	val = mbps > 1500 ? 0x0000 : 0x0002;
> +	for (unsigned int l = 0; l < 5; l++)
> +		rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(l, 13), val);
> +
> +	if (mbps >= 80) {
> +		if (mbps >= 2560)
> +			val = 6;
> +		else if (mbps >= 1280)
> +			val = 5;
> +		else if (mbps >= 640)
> +			val = 4;
> +		else if (mbps >= 320)
> +			val = 3;
> +		else if (mbps >= 160)
> +			val = 2;
> +		else if (mbps >= 80)
> +			val = 1;

You could possibly replace this with

		val = ilog2(mbps / 80) + 1;

Up to you.

> +
> +		rcsi2_modify16(priv,
> +			       V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(2, 9),
> +			       val << 5, 0xe0);
> +	}
> +
> +	rcsi2_write16(priv, V4H_CORE_DIG_DLANE_CLK_RW_HS_RX_n_REG(0), 0x091c);
> +	rcsi2_write16(priv, V4H_CORE_DIG_DLANE_CLK_RW_HS_RX_n_REG(7), 0x3b06);
> +
> +	val = roundup(1200 / mbps, 1) + 12;

And here

	val = DIV_ROUND_UP(1200, mbps) + 12;

> +	for (unsigned int l = 0; l < 4; l++)
> +		rcsi2_modify16(priv, V4H_CORE_DIG_DLANE_l_RW_HS_RX_n_REG(l, 0), val << 8, 0xf0);
> +
> +	val = mbps > 1500 ? 0x0004 : 0x0008;
> +	for (unsigned int l = 0; l < 4; l++)
> +		rcsi2_write16(priv, V4H_CORE_DIG_DLANE_l_RW_CFG_n_REG(l, 1), val);
> +
> +	val = mbps > 2500 ? 0x669a : mbps > 1500 ? 0xe69a : 0xe69b;
> +	for (unsigned int l = 0; l < 4; l++)
> +		rcsi2_write16(priv, V4H_CORE_DIG_DLANE_l_RW_HS_RX_n_REG(l, 2), val);
> +
> +	for (unsigned int l = 0; l < 4; l++)
> +		rcsi2_write16(priv, V4H_CORE_DIG_DLANE_l_RW_LP_n_REG(l, 0), 0x163c);
> +	rcsi2_write16(priv, V4H_CORE_DIG_DLANE_CLK_RW_LP_n_REG(0), 0x163c);
> +
> +	if (lut) {
> +		for (unsigned int l = 0; l < 4; l++)
> +			rcsi2_modify16(priv, V4H_CORE_DIG_DLANE_l_RW_HS_RX_n_REG(l, 1),
> +				       lut->rw_hs_rx_1, 0xff);
> +	}
> +
> +	for (unsigned int l = 0; l < 4; l++)
> +		rcsi2_write16(priv, V4H_CORE_DIG_DLANE_l_RW_HS_RX_n_REG(l, 3), 0x9209);
> +
> +	for (unsigned int l = 0; l < 4; l++)
> +		rcsi2_write16(priv, V4H_CORE_DIG_DLANE_l_RW_HS_RX_n_REG(l, 4), 0x0096);
> +
> +	for (unsigned int l = 0; l < 4; l++)
> +		rcsi2_write16(priv, V4H_CORE_DIG_DLANE_l_RW_HS_RX_n_REG(l, 5), 0x0100);
> +
> +	for (unsigned int l = 0; l < 4; l++)
> +		rcsi2_write16(priv, V4H_CORE_DIG_DLANE_l_RW_HS_RX_n_REG(l, 6), 0x2d02);
> +
> +	for (unsigned int l = 0; l < 4; l++)
> +		rcsi2_write16(priv, V4H_CORE_DIG_DLANE_l_RW_HS_RX_n_REG(l, 7), 0x1b06);
> +
> +	if (lut) {
> +		/* Documentation LUT have two values but document writing both

		/*
		 * Documentation LUT have two values but document writing both

> +		 * values in a single write.
> +		 */
> +		for (unsigned int l = 0; l < 4; l++)
> +			rcsi2_modify16(priv, V4H_CORE_DIG_DLANE_l_RW_HS_RX_n_REG(l, 3),
> +				       lut->rw_hs_rx_3_83 << 3 | lut->rw_hs_rx_3_20, 0x1ff);
> +
> +		for (unsigned int l = 0; l < 4; l++)
> +			rcsi2_modify16(priv, V4H_CORE_DIG_DLANE_l_RW_HS_RX_n_REG(l, 6),
> +				       lut->rw_hs_rx_6 << 8, 0xff00);
> +	}
> +
> +	static const u16 deskew_fine[] = {
> +		0x0404, 0x040c, 0x0414, 0x041c, 0x0423, 0x0429, 0x0430, 0x043a,
> +		0x0445, 0x044a, 0x0450, 0x045a, 0x0465, 0x0469, 0x0472, 0x047a,
> +		0x0485, 0x0489, 0x0490, 0x049a, 0x04a4, 0x04ac, 0x04b4, 0x04bc,
> +		0x04c4, 0x04cc, 0x04d4, 0x04dc, 0x04e4, 0x04ec, 0x04f4, 0x04fc,
> +		0x0504, 0x050c, 0x0514, 0x051c, 0x0523, 0x0529, 0x0530, 0x053a,
> +		0x0545, 0x054a, 0x0550, 0x055a, 0x0565, 0x0569, 0x0572, 0x057a,
> +		0x0585, 0x0589, 0x0590, 0x059a, 0x05a4, 0x05ac, 0x05b4, 0x05bc,
> +		0x05c4, 0x05cc, 0x05d4, 0x05dc, 0x05e4, 0x05ec, 0x05f4, 0x05fc,
> +		0x0604, 0x060c, 0x0614, 0x061c, 0x0623, 0x0629, 0x0632, 0x063a,
> +		0x0645, 0x064a, 0x0650, 0x065a, 0x0665, 0x0669, 0x0672, 0x067a,
> +		0x0685, 0x0689, 0x0690, 0x069a, 0x06a4, 0x06ac, 0x06b4, 0x06bc,
> +		0x06c4, 0x06cc, 0x06d4, 0x06dc, 0x06e4, 0x06ec, 0x06f4, 0x06fc,
> +		0x0704, 0x070c, 0x0714, 0x071c, 0x0723, 0x072a, 0x0730, 0x073a,
> +		0x0745, 0x074a, 0x0750, 0x075a, 0x0765, 0x0769, 0x0772, 0x077a,
> +		0x0785, 0x0789, 0x0790, 0x079a, 0x07a4, 0x07ac, 0x07b4, 0x07bc,
> +		0x07c4, 0x07cc, 0x07d4, 0x07dc, 0x07e4, 0x07ec, 0x07f4, 0x07fc,
> +	};
> +
> +	for (unsigned int i = 0; i < ARRAY_SIZE(deskew_fine); i++) {
> +		rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG,
> +			      deskew_fine[i]);
> +	}
> +
> +	return 0;
> +}
> +
>  static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv,
>  				    struct v4l2_subdev_state *state)
>  {
> +	const struct rcsi2_cphy_setting *cphy = NULL;
>  	const struct rcar_csi2_format *format;
> -	const struct rcsi2_cphy_setting *cphy;
>  	const struct v4l2_mbus_framefmt *fmt;
>  	unsigned int lanes;
>  	int mbps;
> @@ -1318,7 +1518,8 @@ static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv,
>  	rcsi2_write(priv, V4H_FLDC_REG, 0);
>  	rcsi2_write(priv, V4H_FLDD_REG, 0);
>  	rcsi2_write(priv, V4H_IDIC_REG, 0);
> -	rcsi2_write(priv, V4H_PHY_MODE_REG, V4H_PHY_MODE_CPHY);
> +	rcsi2_write(priv, V4H_PHY_MODE_REG,
> +		    priv->cphy ? V4H_PHY_MODE_CPHY : V4H_PHY_MODE_DPHY);
>  	rcsi2_write(priv, V4H_N_LANES_REG, lanes - 1);
>  
>  	rcsi2_write(priv, V4M_FRXM_REG,
> @@ -1361,9 +1562,15 @@ static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv,
>  	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_REG(5), 0x4000);
>  
>  	/* T3: PHY settings */
> -	cphy = rcsi2_c_phy_setting_v4h(priv, mbps);
> -	if (!cphy)
> -		return -ERANGE;
> +	if (priv->cphy) {
> +		cphy = rcsi2_c_phy_setting_v4h(priv, mbps);
> +		if (!cphy)
> +			return -ERANGE;
> +	} else {
> +		ret = rcsi2_d_phy_setting_v4h(priv, mbps);
> +		if (ret)
> +			return ret;
> +	}
>  
>  	/* T4: Leave Shutdown mode */
>  	rcsi2_write(priv, V4H_DPHY_RSTZ_REG, BIT(0));
> @@ -1376,11 +1583,23 @@ static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv,
>  	}
>  
>  	/* T6: Analog programming */
> -	for (unsigned int l = 0; l < 3; l++) {
> -		rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(l, 9),
> -			      cphy->lane29);
> -		rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(l, 7),
> -			      cphy->lane27);
> +	if (priv->cphy) {
> +		for (unsigned int l = 0; l < 3; l++) {
> +			rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(l, 9),
> +				      cphy->lane29);
> +			rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(l, 7),
> +				      cphy->lane27);
> +		}
> +	} else {
> +		u16 val_2_9 = mbps > 2500 ? 0x14 : mbps > 1500 ? 0x04 : 0x00;
> +		u16 val_2_15 = mbps > 1500 ? 0x03 : 0x00;
> +
> +		for (unsigned int l = 0; l < 5; l++) {
> +			rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(l, 9),
> +				      val_2_9);
> +			rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(l, 15),
> +				      val_2_15);
> +		}
>  	}
>  
>  	/* T7: Wait for stop state */
> @@ -2245,6 +2464,7 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a779g0 = {
>  	.start_receiver = rcsi2_start_receiver_v4h,
>  	.use_isp = true,
>  	.support_cphy = true,
> +	.support_dphy = true,
>  };
>  
>  static const struct rcsi2_register_layout rcsi2_registers_v4m = {

-- 
Regards,

Laurent Pinchart

