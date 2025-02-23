Return-Path: <linux-media+bounces-26710-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F4DA410CB
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 19:24:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88E81171CEE
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 18:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0670C17084F;
	Sun, 23 Feb 2025 18:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cHKEEDtM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4AA5D8F0;
	Sun, 23 Feb 2025 18:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740335069; cv=none; b=o9thgT5WsIQWmbdrbj2Lhhk4oKFpHH/U2ipce2qlBUYylG7C/iBSSYoEOe6gXiRUPU4E7DRNO2GCc7VF2ZG/IsCUy9QVkA0LAXrp0R5bTVZocrzpAaWPfC3ZuUgkGvEOoDKWttiluby5NxYTShZbQPhhkjZp2iF1mXZKbUYHps4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740335069; c=relaxed/simple;
	bh=QdqvULVPP8/Hc1uZ9F+Q2qdyZ1vh1liZamlcqjcH9UA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qo40xNTVrjvPdpTkeem8ceHSWJ22Hd1vw409u5RRfHgMkc8y6xbXfsQLHIKailJ/C3tv//yTn/bjH/dofwNjleH+qT3vc7S40Xsw0KJDJR58UsGG//MPWYzDfl5SeFUM1OPiEzJuEqbYyxR0hKRmwqLGtGDrq/QzAbxJxXml8Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cHKEEDtM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1791D496;
	Sun, 23 Feb 2025 19:23:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740334980;
	bh=QdqvULVPP8/Hc1uZ9F+Q2qdyZ1vh1liZamlcqjcH9UA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cHKEEDtM3unUpRvIT+22uto80EmkFe+akzfks4VIELr5AUaKg3236VKMPouk5Ofz6
	 dPvmZJrULKd/H9bJk6HfMLnkNb53vdA76O1fMRc3w0dPlY0J8xJJQkC0PSIF49TAhv
	 nbYx9FntW+QURsoIVFOtDQFpJ/OTbmZ17/AVhhHY=
Date: Sun, 23 Feb 2025 20:24:09 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org, biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/18] media: rzg2l-cru: csi2: Add support for
 RZ/V2H(P) SoC
Message-ID: <20250223182409.GE8330@pendragon.ideasonboard.com>
References: <20250221155532.576759-1-tommaso.merciai.xr@bp.renesas.com>
 <20250221155532.576759-11-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250221155532.576759-11-tommaso.merciai.xr@bp.renesas.com>

Hi Tommaso,

Thank you for the patch.

On Fri, Feb 21, 2025 at 04:55:24PM +0100, Tommaso Merciai wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> The D-PHY on the RZ/V2H(P) SoC is different from the D-PHY on the RZ/G2L
> SoC. To handle this difference, function pointers for D-PHY enable/disable
> have been added, and the `struct rzg2l_csi2_info` pointer is passed as OF
> data.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
>  .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 94 +++++++++++++++++++
>  1 file changed, 94 insertions(+)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> index 771fa35558be..cd452c84f101 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> @@ -85,6 +85,15 @@
>  					 CSIDPHYSKW0_UTIL_DL2_SKW_ADJ(1) | \
>  					 CSIDPHYSKW0_UTIL_DL3_SKW_ADJ(1))
>  
> +/* DPHY registers on RZ/V2H(P) SoC */
> +#define CRUm_S_TIMCTL			0x41c
> +#define CRUm_S_TIMCTL_S_HSSETTLECTL(x)	((x) << 8)
> +
> +#define CRUm_S_DPHYCTL_MSB		0x434
> +#define CRUm_S_DPHYCTL_MSB_DESKEW	BIT(1)
> +
> +#define CRUm_SWAPCTL			0x438
> +
>  #define VSRSTS_RETRIES			20
>  
>  #define RZG2L_CSI2_MIN_WIDTH		320
> @@ -139,6 +148,30 @@ struct rzg2l_csi2_timings {
>  	u32 max_hsfreq;
>  };
>  
> +struct rzv2h_csi2_s_hssettlectl {
> +	unsigned int hsfreq;
> +	u16 s_hssettlectl;
> +};
> +
> +static const struct rzv2h_csi2_s_hssettlectl rzv2h_s_hssettlectl[] = {
> +	{   90,  1 }, {  130,  2 }, {  180,  3 },
> +	{  220,  4 }, {  270,  5 }, {  310,  6 },
> +	{  360,  7 }, {  400,  8 }, {  450,  9 },
> +	{  490, 10 }, {  540, 11 }, {  580, 12 },
> +	{  630, 13 }, {  670, 14 }, {  720, 15 },
> +	{  760, 16 }, {  810, 17 }, {  850, 18 },
> +	{  900, 19 }, {  940, 20 }, {  990, 21 },
> +	{ 1030, 22 }, { 1080, 23 }, { 1120, 24 },
> +	{ 1170, 25 }, { 1220, 26 }, { 1260, 27 },
> +	{ 1310, 28 }, { 1350, 29 }, { 1400, 30 },
> +	{ 1440, 31 }, { 1490, 32 }, { 1530, 33 },
> +	{ 1580, 34 }, { 1620, 35 }, { 1670, 36 },
> +	{ 1710, 37 }, { 1760, 38 }, { 1800, 39 },
> +	{ 1850, 40 }, { 1890, 41 }, { 1940, 42 },
> +	{ 1980, 43 }, { 2030, 44 }, { 2070, 45 },
> +	{ 2100, 46 },
> +};
> +
>  static const struct rzg2l_csi2_timings rzg2l_csi2_global_timings[] = {
>  	{
>  		.max_hsfreq = 80,
> @@ -427,6 +460,58 @@ static int rzg2l_csi2_mipi_link_disable(struct rzg2l_csi2 *csi2)
>  	return 0;
>  }
>  
> +static int rzv2h_csi2_dphy_disable(struct rzg2l_csi2 *csi2)
> +{
> +	int ret;
> +
> +	/* Reset the CRU (D-PHY) */
> +	ret = reset_control_assert(csi2->cmn_rstb);
> +	if (ret)
> +		return ret;
> +
> +	csi2->dphy_enabled = false;
> +
> +	return 0;
> +}
> +
> +static int rzv2h_csi2_dphy_enable(struct rzg2l_csi2 *csi2)
> +{
> +	unsigned int i;
> +	u16 hssettle;
> +	int mbps;
> +
> +	mbps = rzg2l_csi2_calc_mbps(csi2);
> +	if (mbps < 0)
> +		return mbps;
> +
> +	csi2->hsfreq = mbps;
> +
> +	rzg2l_csi2_write(csi2, CRUm_SWAPCTL, 0);
> +

Maybe move this after the error check below to avoid writing any
register if an error occurs.

> +	for (i = 0; i < ARRAY_SIZE(rzv2h_s_hssettlectl); i++) {
> +		if (csi2->hsfreq <= rzv2h_s_hssettlectl[i].hsfreq)
> +			break;
> +	}
> +
> +	if (i == ARRAY_SIZE(rzv2h_s_hssettlectl))
> +		return -EINVAL;
> +
> +	hssettle = rzv2h_s_hssettlectl[i].s_hssettlectl;
> +	rzg2l_csi2_write(csi2, CRUm_S_TIMCTL,
> +			 CRUm_S_TIMCTL_S_HSSETTLECTL(hssettle));
> +
> +	if (csi2->hsfreq > 1500)
> +		rzg2l_csi2_set(csi2, CRUm_S_DPHYCTL_MSB,
> +			       CRUm_S_DPHYCTL_MSB_DESKEW);
> +	else
> +		rzg2l_csi2_clr(csi2, CRUm_S_DPHYCTL_MSB,
> +			       CRUm_S_DPHYCTL_MSB_DESKEW);
> +
> +	csi2->dphy_enabled = true;
> +
> +	return 0;
> +}
> +
>  static int rzg2l_csi2_mipi_link_setting(struct v4l2_subdev *sd, bool on)
>  {
>  	struct rzg2l_csi2 *csi2 = sd_to_csi2(sd);
> @@ -900,12 +985,21 @@ static const struct dev_pm_ops rzg2l_csi2_pm_ops = {
>  		       rzg2l_csi2_pm_runtime_resume, NULL)
>  };
>  
> +static const struct rzg2l_csi2_info rzv2h_csi2_info = {
> +	.dphy_enable = rzv2h_csi2_dphy_enable,
> +	.dphy_disable = rzv2h_csi2_dphy_disable,
> +};

Move this just after rzv2h_csi2_dphy_enable().

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> +
>  static const struct rzg2l_csi2_info rzg2l_csi2_info = {
>  	.dphy_enable = rzg2l_csi2_dphy_enable,
>  	.dphy_disable = rzg2l_csi2_dphy_disable,
>  };
>  
>  static const struct of_device_id rzg2l_csi2_of_table[] = {
> +	{
> +		.compatible = "renesas,r9a09g057-csi2",
> +		.data = &rzv2h_csi2_info,
> +	},
>  	{
>  		.compatible = "renesas,rzg2l-csi2",
>  		.data = &rzg2l_csi2_info,

-- 
Regards,

Laurent Pinchart

