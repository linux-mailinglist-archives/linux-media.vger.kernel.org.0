Return-Path: <linux-media+bounces-40114-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AC6B29D9E
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 11:24:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EE7B2A3D09
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 09:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14F8A30DD2C;
	Mon, 18 Aug 2025 09:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MiNljGcw"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AA32F0C5D;
	Mon, 18 Aug 2025 09:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755508922; cv=none; b=ZO3bGk090MeI337HMMhhBUgTlw4zm49RztfHZ2Sd+Cve0ROjA/9FS+zSdobzYBxB/Vu5PYOIulhfy/ZCeXs0VZmQLs9+KXqVOiwYAUHHQTksEiSsSlwU06nNIggDZzJBUraaptCCqSlpXkQrI5zE55/peW5zlt5gZLdY2guTazI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755508922; c=relaxed/simple;
	bh=kqWkwpZeDd3/I+FFiy2R27j1WrvPesd6DRcrbiWwlas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cMWLZV+B4YM29ETV9SlzBfqaryV5OFD6hRDrMVN9uwldEl56X6eA5sheDKT/dcgtHHJL3IM/ayjApjB92c6/y2g/iIRWsGraeBZwB66g2aS3M/qalmO7e7OU7lWZtLW/HAObHIFRIkBZt0zwLaL/2BBYsHccUFwIQq0raFF9azk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MiNljGcw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9B7B417D1;
	Mon, 18 Aug 2025 11:20:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755508858;
	bh=kqWkwpZeDd3/I+FFiy2R27j1WrvPesd6DRcrbiWwlas=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MiNljGcwNxjzMcy1MqNDcTJD1GeWwOnpxjDNCVBmYPbX8wToXu5Dbi+7oatKDBds1
	 pJOX746hIzx1pUtfClWxjOehH97MfSZLhhOpJRpwsem6DIamO9EzhWWPeyaRvEMAOv
	 FMnsDM4Km1i9WLuos2TwoKQxhtibpk3R77xvujxo=
Date: Mon, 18 Aug 2025 12:21:33 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Inbaraj E <inbaraj.e@samsung.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org,
	s.nawrocki@samsung.com, s.hauer@pengutronix.de, shawnguo@kernel.org,
	cw00.choi@samsung.com, rmfrfs@gmail.com, martink@posteo.de,
	mchehab@kernel.org, linux-fsd@tesla.com, will@kernel.org,
	catalin.marinas@arm.com, pankaj.dubey@samsung.com,
	shradha.t@samsung.com, ravi.patel@samsung.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, alim.akhtar@samsung.com,
	linux-samsung-soc@vger.kernel.org, kernel@puri.sm,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 05/12] media: imx-mipi-csis: Move clk to
 mipi_csis_info structure
Message-ID: <20250818092133.GA5862@pendragon.ideasonboard.com>
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
 <CGME20250814141025epcas5p2b226c4eaab5d60d0e95f684e2ef930f2@epcas5p2.samsung.com>
 <20250814140943.22531-6-inbaraj.e@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250814140943.22531-6-inbaraj.e@samsung.com>

Hi Inbaraj,

On Thu, Aug 14, 2025 at 07:39:36PM +0530, Inbaraj E wrote:
> clock names in NXP SoC's is different from the FSD SoC. Inorder to

s/clock/Clock/
s/Inorder/In order/

Is the difference really a matter of SoCs, or is it because the FSD SoC
uses a different version of the IP ?

I also suspect that the "phy" clock was added by mistake, and isn't
needed in NXP SoCs. Could you please check and confirm if the v3.3 and
v3.6.3 versions of the IP have an input PHY clock ?

> extend this driver to use for FSD SoC. Move the clock names to
> mipi_csis_info structure.
> 
> Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index 2beb5f43c2c0..4afa75734f05 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -267,6 +267,8 @@ static const struct mipi_csis_event mipi_csis_events[] = {
>  
>  #define MIPI_CSIS_NUM_EVENTS ARRAY_SIZE(mipi_csis_events)
>  
> +#define MIPI_CSIS_MAX_CLOCKS	4
> +
>  enum mipi_csis_clk {
>  	MIPI_CSIS_CLK_PCLK,
>  	MIPI_CSIS_CLK_WRAP,
> @@ -274,13 +276,6 @@ enum mipi_csis_clk {
>  	MIPI_CSIS_CLK_AXI,
>  };
>  
> -static const char * const mipi_csis_clk_id[] = {
> -	"pclk",
> -	"wrap",
> -	"phy",
> -	"axi",
> -};
> -
>  enum mipi_csis_version {
>  	MIPI_CSIS_V3_3,
>  	MIPI_CSIS_V3_6_3,
> @@ -289,6 +284,7 @@ enum mipi_csis_version {
>  struct mipi_csis_info {
>  	enum mipi_csis_version version;
>  	unsigned int num_clocks;
> +	const char *clk_names[MIPI_CSIS_MAX_CLOCKS];
>  };
>  
>  struct mipi_csis_device {
> @@ -697,7 +693,7 @@ static int mipi_csis_clk_get(struct mipi_csis_device *csis)
>  		return -ENOMEM;
>  
>  	for (i = 0; i < csis->info->num_clocks; i++)
> -		csis->clks[i].id = mipi_csis_clk_id[i];
> +		csis->clks[i].id = csis->info->clk_names[i];
>  
>  	ret = devm_clk_bulk_get(csis->dev, csis->info->num_clocks,
>  				csis->clks);
> @@ -1539,12 +1535,14 @@ static const struct of_device_id mipi_csis_of_match[] = {
>  		.data = &(const struct mipi_csis_info){
>  			.version = MIPI_CSIS_V3_3,
>  			.num_clocks = 3,
> +			.clk_names = {"pclk", "wrap", "phy"},
>  		},
>  	}, {
>  		.compatible = "fsl,imx8mm-mipi-csi2",
>  		.data = &(const struct mipi_csis_info){
>  			.version = MIPI_CSIS_V3_6_3,
>  			.num_clocks = 4,
> +			.clk_names = {"pclk", "wrap", "phy", "axi"},
>  		},
>  	},
>  	{ /* sentinel */ },

-- 
Regards,

Laurent Pinchart

