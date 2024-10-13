Return-Path: <linux-media+bounces-19517-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 972D699BA72
	for <lists+linux-media@lfdr.de>; Sun, 13 Oct 2024 18:40:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDAFB1C20A15
	for <lists+linux-media@lfdr.de>; Sun, 13 Oct 2024 16:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC308148310;
	Sun, 13 Oct 2024 16:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oXIYWfiE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF63C12CDBA;
	Sun, 13 Oct 2024 16:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728837641; cv=none; b=IBRhAd3iW/2i8kLerHnt4e4lAXWStadVD9s7dhnl5A4IjalN8iOpXZYVGwW80Nrq1aTIwc+GJxO83WBt1Mahud7exxNKQLlHQpgsfrbbQjCXSCN1jUdeo0F8w2SdUWkwi/kvNEvTRumpWULg/sHMQLPUnBVvSHj+/xy//5UPma8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728837641; c=relaxed/simple;
	bh=mmZw7M9O1GIWt6P92qdT3sGi9Pe39NII7ZWkNZD/eSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oNWqxqv2jxsOnykQEEReE7LbmSsA6+7XgLNze7xyudqmpuqnSwqWcuxDfL8oqwg6/QUstQqgqkduj3O8ZRHyCoRFTGWm5RTmzIOyrF43JsaQyz+sU5g/oKrdjIrcxVLubduERe6hjmNtFtgtZYxQZ0VWPj6hiN/0s57joLweIu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oXIYWfiE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [23.233.251.139])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1322082E;
	Sun, 13 Oct 2024 18:38:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728837537;
	bh=mmZw7M9O1GIWt6P92qdT3sGi9Pe39NII7ZWkNZD/eSw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oXIYWfiEmhEpNUN6L+7eHgIvkXyS+r+xH7ARjVj7sLJauTkvROl2g5vkIWZbU6Zpn
	 e6J+vbzQfs65hGUuOmr1bW6z6e8XrY0SQFgWY4C1jDgQM391s0De92hQcBm6TpWSj4
	 KocXJQP845oWt52Olj2CK/8SUO+ozWcWHxS7c0HY=
Date: Sun, 13 Oct 2024 19:40:30 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: guoniu.zhou@oss.nxp.com
Cc: linux-media@vger.kernel.org, jacopo@jmondi.org, mchehab@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.d,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: nxp: imx8-isi: Add i.MX8ULP support
Message-ID: <20241013164030.GF5212@pendragon.ideasonboard.com>
References: <20241012084732.1036652-1-guoniu.zhou@oss.nxp.com>
 <20241012084732.1036652-2-guoniu.zhou@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241012084732.1036652-2-guoniu.zhou@oss.nxp.com>

Hi Guoniu,

Thank you for the patch.

On Sat, Oct 12, 2024 at 04:47:33PM +0800, guoniu.zhou@oss.nxp.com wrote:
> From: "Guoniu.zhou" <guoniu.zhou@nxp.com>
> 
> Add ISI support for i.MX8ULP.
> 
> Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 14 ++++++++++++++
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  1 +
>  2 files changed, 15 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index c2013995049c..528e723114d5 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -307,6 +307,19 @@ static const struct mxc_isi_plat_data mxc_imx8mp_data = {
>  	.has_36bit_dma		= true,
>  };
>  
> +static const struct mxc_isi_plat_data mxc_imx8ulp_data = {
> +	.model			= MXC_ISI_IMX8ULP,
> +	.num_ports		= 1,
> +	.num_channels		= 1,
> +	.reg_offset		= 0x0,
> +	.ier_reg		= &mxc_imx8_isi_ier_v2,
> +	.set_thd		= &mxc_imx8_isi_thd_v1,
> +	.clks			= mxc_imx8mn_clks,
> +	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
> +	.buf_active_reverse	= true,
> +	.has_36bit_dma		= false,
> +};
> +
>  static const struct mxc_isi_plat_data mxc_imx93_data = {
>  	.model			= MXC_ISI_IMX93,
>  	.num_ports		= 1,
> @@ -528,6 +541,7 @@ static void mxc_isi_remove(struct platform_device *pdev)
>  static const struct of_device_id mxc_isi_of_match[] = {
>  	{ .compatible = "fsl,imx8mn-isi", .data = &mxc_imx8mn_data },
>  	{ .compatible = "fsl,imx8mp-isi", .data = &mxc_imx8mp_data },
> +	{ .compatible = "fsl,imx8ulp-isi", .data = &mxc_imx8ulp_data },
>  	{ .compatible = "fsl,imx93-isi", .data = &mxc_imx93_data },
>  	{ /* sentinel */ },
>  };
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index 2810ebe9b5f7..9c7fe9e5f941 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -158,6 +158,7 @@ struct mxc_gasket_ops {
>  enum model {
>  	MXC_ISI_IMX8MN,
>  	MXC_ISI_IMX8MP,
> +	MXC_ISI_IMX8ULP,
>  	MXC_ISI_IMX93,
>  };
>  

-- 
Regards,

Laurent Pinchart

