Return-Path: <linux-media+bounces-18510-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EEF984788
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 16:21:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3A9B1C22BF1
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 14:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDE301A7AF9;
	Tue, 24 Sep 2024 14:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eTKbD/Ih"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1CC1A76AA
	for <linux-media@vger.kernel.org>; Tue, 24 Sep 2024 14:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727187669; cv=none; b=NYNEp0IzV7a1ameH/R8CbJ2tIr2iYMt15h4oturMcRJL1VZT4d7iAjsIbPr05ml2Gzmjul501FGEerWhc3fwogtwqEbGdophcTmfsmWwWi0C+AsESsmZiVL6gfMAbxZmfJZmbQnGkfBs80ka4VMdWUPkk/8xGpfpQZ0YzMUimkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727187669; c=relaxed/simple;
	bh=7efUYU1w1anJxZK2urDNpvBjDXCRn7I/RkM8vy5U93M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l85jhGIxWf0/0EMd154YUic6qTfEgtMPKFRCBUJb80qOd8voAz3OIiUdIZcvBdBmZzZ1Iwfyv1E5SVDoP6AmCkiuX/aFajndz5/Y+jQ1FTFPtR1LK5PrelKPNHC0cnjKdnrB3tvdnCfgMOFt74Hbii/W5EzD5ZOhb960Y/uaOeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eTKbD/Ih; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 37932A8F;
	Tue, 24 Sep 2024 16:19:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727187579;
	bh=7efUYU1w1anJxZK2urDNpvBjDXCRn7I/RkM8vy5U93M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eTKbD/Ih3Y32dS7cwYrpsXZiTGLyVIpJN5arxLWSEUWBTyLeCFe3UcOnYx1s64/1z
	 GEPPffz8eUul0J8pVVEiigDtlv7XVW0LWyWz181ynvMHlJU5+yd1/5XD7bIloEhvgr
	 +sY4h7MQA0g1QSEEMpsSogZSSTTYDMagCXi0BtfM=
Date: Tue, 24 Sep 2024 16:21:03 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl, 
	sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, Daniel Scally <dan.scally+renesas@ideasonboard.com>
Subject: Re: [PATCH 4/4] media: platform: rzg2l-cru: Add support for
 RAW10/12/14 data
Message-ID: <k6nxxivka2abylkncwrvukra5xr3wambnroop5wxe6dyg3gkci@au6kxu6oigkp>
References: <20240920124115.375748-1-dan.scally@ideasonboard.com>
 <20240920124115.375748-5-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240920124115.375748-5-dan.scally@ideasonboard.com>

Hi Dan

On Fri, Sep 20, 2024 at 01:41:15PM GMT, Daniel Scally wrote:
> From: Daniel Scally <dan.scally+renesas@ideasonboard.com>
>
> Add support to the rzg2l-cru driver to capture 10/12/14 bit bayer
> data and output it into the CRU's 64-bit packed pixel format.
>
> Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>

Maybe I'm missing something for some previous series, but I see
rzg2l_cru_csi2_setup() programming ICnMC with the UserDefined data
type ?


> ---
>  .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 12 ++++
>  .../platform/renesas/rzg2l-cru/rzg2l-ip.c     | 72 +++++++++++++++++++
>  2 files changed, 84 insertions(+)
>
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> index 9609ca2a2f67..6b83f317919f 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> @@ -192,6 +192,18 @@ static const struct rzg2l_csi2_format rzg2l_csi2_formats[] = {
>  	{ .code = MEDIA_BUS_FMT_SGBRG8_1X8, .bpp = 8, },
>  	{ .code = MEDIA_BUS_FMT_SGRBG8_1X8, .bpp = 8, },
>  	{ .code = MEDIA_BUS_FMT_SRGGB8_1X8, .bpp = 8, },
> +	{ .code = MEDIA_BUS_FMT_SBGGR10_1X10, .bpp = 10, },
> +	{ .code = MEDIA_BUS_FMT_SGBRG10_1X10, .bpp = 10, },
> +	{ .code = MEDIA_BUS_FMT_SGRBG10_1X10, .bpp = 10, },
> +	{ .code = MEDIA_BUS_FMT_SRGGB10_1X10, .bpp = 10, },
> +	{ .code = MEDIA_BUS_FMT_SBGGR12_1X12, .bpp = 12, },
> +	{ .code = MEDIA_BUS_FMT_SGBRG12_1X12, .bpp = 12, },
> +	{ .code = MEDIA_BUS_FMT_SGRBG12_1X12, .bpp = 12, },
> +	{ .code = MEDIA_BUS_FMT_SRGGB12_1X12, .bpp = 12, },
> +	{ .code = MEDIA_BUS_FMT_SBGGR14_1X14, .bpp = 14, },
> +	{ .code = MEDIA_BUS_FMT_SGBRG14_1X14, .bpp = 14, },
> +	{ .code = MEDIA_BUS_FMT_SGRBG14_1X14, .bpp = 14, },
> +	{ .code = MEDIA_BUS_FMT_SRGGB14_1X14, .bpp = 14, },
>  };
>
>  static inline struct rzg2l_csi2 *sd_to_csi2(struct v4l2_subdev *sd)
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> index f2fea3a63444..65b1cf9e553f 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> @@ -42,6 +42,78 @@ static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
>  		.datatype = MIPI_CSI2_DT_RAW8,
>  		.icndmr = 0,
>  	},
> +	{
> +		.code = MEDIA_BUS_FMT_SBGGR10_1X10,
> +		.format = V4L2_PIX_FMT_CRU_SBGGR10,
> +		.datatype = MIPI_CSI2_DT_RAW10,
> +		.icndmr = 0,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SGBRG10_1X10,
> +		.format = V4L2_PIX_FMT_CRU_SGBRG10,
> +		.datatype = MIPI_CSI2_DT_RAW10,
> +		.icndmr = 0,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
> +		.format = V4L2_PIX_FMT_CRU_SGRBG10,
> +		.datatype = MIPI_CSI2_DT_RAW10,
> +		.icndmr = 0,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
> +		.format = V4L2_PIX_FMT_CRU_SRGGB10,
> +		.datatype = MIPI_CSI2_DT_RAW10,
> +		.icndmr = 0,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SBGGR12_1X12,
> +		.format = V4L2_PIX_FMT_CRU_SBGGR12,
> +		.datatype = MIPI_CSI2_DT_RAW12,
> +		.icndmr = 0,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SGBRG12_1X12,
> +		.format = V4L2_PIX_FMT_CRU_SGBRG12,
> +		.datatype = MIPI_CSI2_DT_RAW12,
> +		.icndmr = 0,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SGRBG12_1X12,
> +		.format = V4L2_PIX_FMT_CRU_SGRBG12,
> +		.datatype = MIPI_CSI2_DT_RAW12,
> +		.icndmr = 0,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SRGGB12_1X12,
> +		.format = V4L2_PIX_FMT_CRU_SRGGB12,
> +		.datatype = MIPI_CSI2_DT_RAW12,
> +		.icndmr = 0,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SBGGR14_1X14,
> +		.format = V4L2_PIX_FMT_CRU_SBGGR14,
> +		.datatype = MIPI_CSI2_DT_RAW14,
> +		.icndmr = 0,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SGBRG14_1X14,
> +		.format = V4L2_PIX_FMT_CRU_SGBRG14,
> +		.datatype = MIPI_CSI2_DT_RAW14,
> +		.icndmr = 0,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SGRBG14_1X14,
> +		.format = V4L2_PIX_FMT_CRU_SGRBG14,
> +		.datatype = MIPI_CSI2_DT_RAW14,
> +		.icndmr = 0,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SRGGB14_1X14,
> +		.format = V4L2_PIX_FMT_CRU_SRGGB14,
> +		.datatype = MIPI_CSI2_DT_RAW14,
> +		.icndmr = 0,
> +	},
>  };
>
>  const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int code)
> --
> 2.34.1
>
>

