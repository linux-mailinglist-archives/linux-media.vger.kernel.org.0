Return-Path: <linux-media+bounces-40118-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFBBB29E05
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 11:35:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 193913BF73C
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 09:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81DCA30E856;
	Mon, 18 Aug 2025 09:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qFpZvREc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C49D221FDC;
	Mon, 18 Aug 2025 09:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755509657; cv=none; b=M+oFhntEkBI7Z2NsA2KW2KP7XztsLbZacZey8r4zcTq5kf3L2zDJLmbgTueN5b7Y59V0SndJQI0WM5TahDJYno4JE5UlT6c2xrKir4IqzENCmZgLaaidUc7SoNE8V1UMapDOqHvC3PWC7nS/gYcY40Rga13scEoEZQQHkWQwc4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755509657; c=relaxed/simple;
	bh=aXdSfAR4983BNp7JPSaitHLvzBXoEwpGjFaYcoiR100=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ph4VNcjmnntRuQIO6tdx9tnIzoHqm1FQGqMQpa5ldYtLTbADiCvdirm9VIP+dtCJOEfCzd06tpQHf3kHrGjswtqfmMJ0M42hUdtklgsneAvBat27gKfRAqU+IkgrAaaNvINMQEq8SGz8Exj+ndSU2uJ7K6TLXHATPJqlq3TBQ4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qFpZvREc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 820F12416;
	Mon, 18 Aug 2025 11:33:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755509594;
	bh=aXdSfAR4983BNp7JPSaitHLvzBXoEwpGjFaYcoiR100=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qFpZvREcnMuHPIGb3EM8skBbhb2ObaIU7jEuzNsB+cq8A5yVEnZH6ML/uK7/znBNF
	 ao4NfQQ/eQUGGOmHDSeL/+4mOxSY7VyVPD7WBv/oRu4Oc2z/c4FjolrY3X0WDKejMC
	 rbi9ExxsgMNJUcWGOMLNZrlaACJKMT0TQ3I4dz1s=
Date: Mon, 18 Aug 2025 12:33:49 +0300
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
Subject: Re: [PATCH v2 07/12] media: imx-mipi-csis: Add support to configure
 specific vc
Message-ID: <20250818093349.GC5862@pendragon.ideasonboard.com>
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
 <CGME20250814141036epcas5p1fc02cea3f97534303673eb8453b6a18f@epcas5p1.samsung.com>
 <20250814140943.22531-8-inbaraj.e@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250814140943.22531-8-inbaraj.e@samsung.com>

Hi Inbaraj,

On Thu, Aug 14, 2025 at 07:39:38PM +0530, Inbaraj E wrote:
> MIPI_CSIS_V3_3 and MIPI_CSIS_V3_6_3 support streaming only on VC0.

That doesn't appear to be true, at least for MIPI_CSIS_V3_6_3. I have a
patch series that adds VC support for v3.6.3 in the i.MX8MP, and it has
been susccessfully tested.

> The
> MIPI_CSIS_V4_3 present in the FSD SoC supports streaming on any one VC
> out of four VCs. To extend support for the FSD SoC, add the ability to
> configure a specific VC. The FSD CSI Rx can configure any one VC and
> start streaming.
> 
> Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index a3e2c8ae332f..4f6c417fdf58 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -54,7 +54,7 @@
>  
>  /* CSIS common control */
>  #define MIPI_CSIS_CMN_CTRL			0x04
> -#define MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW	BIT(16)
> +#define MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW(n)	BIT(((n) + 16))
>  #define MIPI_CSIS_CMN_CTRL_INTER_MODE		BIT(10)
>  #define MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW_CTRL	BIT(2)
>  #define MIPI_CSIS_CMN_CTRL_RESET		BIT(1)
> @@ -319,6 +319,7 @@ struct mipi_csis_device {
>  		u32 hs_settle;
>  		u32 clk_settle;
>  	} debug;
> +	unsigned int vc;
>  };
>  
>  /* -----------------------------------------------------------------------------
> @@ -544,9 +545,10 @@ static void __mipi_csis_set_format(struct mipi_csis_device *csis,
>  				   const struct csis_pix_format *csis_fmt)
>  {
>  	u32 val;
> +	unsigned int vc = csis->vc;
>  
>  	/* Color format */
> -	val = mipi_csis_read(csis, MIPI_CSIS_ISP_CONFIG_CH(0));
> +	val = mipi_csis_read(csis, MIPI_CSIS_ISP_CONFIG_CH(vc));
>  	val &= ~(MIPI_CSIS_ISPCFG_ALIGN_32BIT | MIPI_CSIS_ISPCFG_FMT_MASK
>  		| MIPI_CSIS_ISPCFG_PIXEL_MASK);
>  
> @@ -567,11 +569,11 @@ static void __mipi_csis_set_format(struct mipi_csis_device *csis,
>  		val |= MIPI_CSIS_ISPCFG_PIXEL_MODE_DUAL;
>  
>  	val |= MIPI_CSIS_ISPCFG_FMT(csis_fmt->data_type);
> -	mipi_csis_write(csis, MIPI_CSIS_ISP_CONFIG_CH(0), val);
> +	mipi_csis_write(csis, MIPI_CSIS_ISP_CONFIG_CH(vc), val);
>  
>  	/* Pixel resolution */
>  	val = format->width | (format->height << 16);
> -	mipi_csis_write(csis, MIPI_CSIS_ISP_RESOL_CH(0), val);
> +	mipi_csis_write(csis, MIPI_CSIS_ISP_RESOL_CH(vc), val);
>  }
>  
>  static int mipi_csis_calculate_params(struct mipi_csis_device *csis,
> @@ -631,6 +633,7 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
>  {
>  	int lanes = csis->bus.num_data_lanes;
>  	u32 val;
> +	unsigned int vc = csis->vc;
>  
>  	val = mipi_csis_read(csis, MIPI_CSIS_CMN_CTRL);
>  	val &= ~MIPI_CSIS_CMN_CTRL_LANE_NR_MASK;
> @@ -648,7 +651,7 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
>  	val = (0 << MIPI_CSIS_ISP_SYNC_HSYNC_LINTV_OFFSET)
>  	    | (0 << MIPI_CSIS_ISP_SYNC_VSYNC_SINTV_OFFSET)
>  	    | (0 << MIPI_CSIS_ISP_SYNC_VSYNC_EINTV_OFFSET);
> -	mipi_csis_write(csis, MIPI_CSIS_ISP_SYNC_CH(0), val);
> +	mipi_csis_write(csis, MIPI_CSIS_ISP_SYNC_CH(vc), val);
>  
>  	val = mipi_csis_read(csis, MIPI_CSIS_CLK_CTRL);
>  	val |= MIPI_CSIS_CLK_CTRL_WCLK_SRC;
> @@ -669,7 +672,7 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
>  	/* Update the shadow register. */
>  	val = mipi_csis_read(csis, MIPI_CSIS_CMN_CTRL);
>  	mipi_csis_write(csis, MIPI_CSIS_CMN_CTRL,
> -			val | MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW |
> +			val | MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW(vc) |
>  			MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW_CTRL);
>  }
>  
> @@ -945,6 +948,8 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
>  	struct v4l2_subdev_state *state;
>  	int ret;
>  
> +	csis->vc = 0;
> +

Dynamic VC selection belongs to this patch, not patch 09/12. 09/12 does
too many different things, it has to be split into one patch per
feature.

>  	if (!enable) {
>  		v4l2_subdev_disable_streams(csis->source.sd,
>  					    csis->source.pad->index, BIT(0));

-- 
Regards,

Laurent Pinchart

