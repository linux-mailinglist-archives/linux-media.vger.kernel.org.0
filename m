Return-Path: <linux-media+bounces-18724-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 17845988CEE
	for <lists+linux-media@lfdr.de>; Sat, 28 Sep 2024 01:21:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 76C6BB21B34
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 23:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF70D1B4C30;
	Fri, 27 Sep 2024 23:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qU5QN6Vy"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384B92C1AE;
	Fri, 27 Sep 2024 23:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727479267; cv=none; b=Z5xVST1sZ5jr7YCTpLuXixYw1Auzb87b/n//c2BqqG5ctnaIxhA7hJCQ4WASg/YbFox3B2I95fvYB9q4ELagtjoP6aKysZMKkRLYskrhylmx/K3ov/G3ECYnc7XDkbVDf+AJh506HJPAtO+PuMWqA55JFXHdWt70RREgaTvoszU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727479267; c=relaxed/simple;
	bh=MXTmM/6hoUuoq4jtSC/E/tyOSKXa25gKalesn62mkfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=luIvz70cz5UCGJYoo7hEPFg6hCDEyCf0DgYx5UAiJ7mmejq2Couz84SWDgMJBjzKErtxwhEopJ2o88ogAbgbVnm+exQWt3bzEf5QxEfjPPzQR47BJH9AHgQ1Sv2MCHO9FSGW5stGUZhSJC2cxPol96I0rf+fwed8oNe5rCzxFsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qU5QN6Vy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CB5E06DE;
	Sat, 28 Sep 2024 01:19:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727479171;
	bh=MXTmM/6hoUuoq4jtSC/E/tyOSKXa25gKalesn62mkfg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qU5QN6VyjNdkpZBIskfJxwggqrPjMmRiCs0+7kyf/vNttyu/q/FaQhaLeZNUI7KbZ
	 T4ZZusv1lFwQcIS1QoEcU6YvDWGSZryxncRIlwsMwWVDacnwpl1ZgpsAFlF3Vcz9h7
	 T3bNRuSBZ3XXV0ZmgCehmG/yPnlCimixlh0JU9/4=
Date: Sat, 28 Sep 2024 02:20:57 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 15/16] media: renesas: rzg2l-cru: Refactor ICnDMR
 register configuration
Message-ID: <20240927232057.GO12322@pendragon.ideasonboard.com>
References: <20240910175357.229075-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240910175357.229075-16-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240910175357.229075-16-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thank you for the patch.

On Tue, Sep 10, 2024 at 06:53:56PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Refactor the ICnDMR register configuration in
> `rzg2l_cru_initialize_image_conv()` by adding a new member `icndmr` in the
> `rzg2l_cru_ip_format` structure. This change introduces a new function
> `rzg2l_cru_ip_pix_fmt_to_icndmr()` to map the pixel format to its
> corresponding ICnDMR value.

Skip this new function, use the function thar returns a
rzg2l_cru_ip_format pointer, and access the icndmr field from there.
rzg2l_cru_initialize_image_conv() already gets the format info pointer,
so the code will be simpler and more efficient.

> 
> Suggested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h |  5 +++++
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c  | 12 ++++++++++++
>  .../media/platform/renesas/rzg2l-cru/rzg2l-video.c   | 10 ++++------
>  3 files changed, 21 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> index 24097df14881..3da9e8e7025a 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> @@ -31,6 +31,8 @@
>  #define RZG2L_CRU_MIN_INPUT_HEIGHT	240
>  #define RZG2L_CRU_MAX_INPUT_HEIGHT	4095
>  
> +#define ICnDMR_YCMODE_UYVY		(1 << 4)

Not a candidate for this patch, but I would recommend moving all the
register definitions to this file, or to a rzg2l-cru-regs.h file.

> +
>  enum rzg2l_csi2_pads {
>  	RZG2L_CRU_IP_SINK = 0,
>  	RZG2L_CRU_IP_SOURCE,
> @@ -68,12 +70,14 @@ struct rzg2l_cru_ip {
>   * @format: 4CC format identifier (V4L2_PIX_FMT_*)
>   * @datatype: MIPI CSI2 data type
>   * @bpp: bytes per pixel
> + * @icndmr: ICnDMR register value
>   */
>  struct rzg2l_cru_ip_format {
>  	u32 code;
>  	u32 format;
>  	u32 datatype;
>  	u8 bpp;
> +	u32 icndmr;
>  };
>  
>  /**
> @@ -165,5 +169,6 @@ struct v4l2_mbus_framefmt *rzg2l_cru_ip_get_src_fmt(struct rzg2l_cru_dev *cru);
>  const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int code);
>  u8 rzg2l_cru_ip_pix_fmt_to_bpp(u32 format);
>  int rzg2l_cru_ip_index_to_pix_fmt(u32 index);
> +int rzg2l_cru_ip_pix_fmt_to_icndmr(u32 format);
>  
>  #endif
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> index c7bc82bf3f14..9b0563198b50 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> @@ -17,6 +17,7 @@ static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
>  		.format = V4L2_PIX_FMT_UYVY,
>  		.datatype = MIPI_CSI2_DT_YUV422_8B,
>  		.bpp = 2,
> +		.icndmr = ICnDMR_YCMODE_UYVY,
>  	},
>  };
>  
> @@ -50,6 +51,17 @@ int rzg2l_cru_ip_index_to_pix_fmt(u32 index)
>  	return rzg2l_cru_ip_formats[index].format;
>  }
>  
> +int rzg2l_cru_ip_pix_fmt_to_icndmr(u32 format)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(rzg2l_cru_ip_formats); i++)
> +		if (rzg2l_cru_ip_formats[i].format == format)
> +			return rzg2l_cru_ip_formats[i].icndmr;
> +
> +	return -EINVAL;
> +}
> +
>  struct v4l2_mbus_framefmt *rzg2l_cru_ip_get_src_fmt(struct rzg2l_cru_dev *cru)
>  {
>  	struct v4l2_subdev_state *state;
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index c32608c557a3..1f25dcff2515 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -88,7 +88,6 @@
>  
>  /* CRU Data Output Mode Register */
>  #define ICnDMR				0x26c
> -#define ICnDMR_YCMODE_UYVY		(1 << 4)
>  
>  #define RZG2L_TIMEOUT_MS		100
>  #define RZG2L_RETRIES			10
> @@ -316,6 +315,7 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
>  	const struct v4l2_format_info *src_finfo, *dst_finfo;
>  	const struct rzg2l_cru_ip_format *cru_ip_fmt;
>  	u32 icndmr;
> +	int ret;
>  
>  	cru_ip_fmt = rzg2l_cru_ip_code_to_fmt(ip_sd_fmt->code);
>  	if (!cru_ip_fmt)
> @@ -327,15 +327,13 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
>  	dst_finfo = v4l2_format_info(cru->format.pixelformat);
>  
>  	/* Output format */
> -	switch (cru->format.pixelformat) {
> -	case V4L2_PIX_FMT_UYVY:
> -		icndmr = ICnDMR_YCMODE_UYVY;
> -		break;
> -	default:
> +	ret = rzg2l_cru_ip_pix_fmt_to_icndmr(cru->format.pixelformat);
> +	if (ret < 0) {
>  		dev_err(cru->dev, "Invalid pixelformat (0x%x)\n",
>  			cru->format.pixelformat);
>  		return -EINVAL;
>  	}
> +	icndmr = ret;
>  
>  	/* If input and output use same colorspace, do bypass mode */
>  	if (v4l2_is_format_yuv(src_finfo) && v4l2_is_format_yuv(dst_finfo))

-- 
Regards,

Laurent Pinchart

