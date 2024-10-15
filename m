Return-Path: <linux-media+bounces-19660-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DE34D99E3BF
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 12:23:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 324C1B22EEA
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 10:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5399D1E6DCD;
	Tue, 15 Oct 2024 10:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uX0T46cT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF691E47DB;
	Tue, 15 Oct 2024 10:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728987771; cv=none; b=mlS3hnQiUSEajxPG/Nar+hJTdDmqRlDSCmKY7YpJDYBQNimQiI0XzX6XI9EICtQoUfu9l9yhSGQGP6r2TibTxyGksQF8IW3+G2rCzu2KEx1Xhfb0Qv12d7CveSQydmoZIHFLcp1I08obyafK/mk4+WY4SgRfniWDwSHbFVQk8W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728987771; c=relaxed/simple;
	bh=npKtpGscAmSYEN3XFMJl0+OWOj6S2CxyCsga/B8QqsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vELFQ+jyiqNR4r6C07L575Y0HvDtxKcIkjEptDegENN9I5T9po+QEhemNaS8jkcERNvWyiMCSdbds5QyAOVxAj2CnX7s5FSIluuPFoSPPp2HoKhzdwroQwnJoaJt0VTPyA3juA74+q8fZLRZ6F/FYaObAG92bmPcqDlQdR+slZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uX0T46cT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [185.143.39.11])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AEDD0A34;
	Tue, 15 Oct 2024 12:21:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728987661;
	bh=npKtpGscAmSYEN3XFMJl0+OWOj6S2CxyCsga/B8QqsM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uX0T46cT/GmHZmPMXtcAszwCimUGN+RdLet+KM5TQz2LcqY5icLCEI80klmqfnh8O
	 Wo2Dbs+EzNNA4dHMIm89IS+U75IZAYn/0lZ3blirgYUGqte9MWWy4A5zhgDQT/9yXr
	 E/PfxREcaff0ojUYCfuro3JMBSn3evw9QJleOroM=
Date: Tue, 15 Oct 2024 13:22:40 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v5 11/22] media: rzg2l-cru: Simplify configuring input
 format for image processing
Message-ID: <20241015102240.GG5682@pendragon.ideasonboard.com>
References: <20241011173052.1088341-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241011173052.1088341-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241011173052.1088341-12-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thank you for the patch.

On Fri, Oct 11, 2024 at 06:30:41PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Move the `rzg2l_cru_ip_format` struct to `rzg2l-cru.h` for better
> accessibility and add a `datatype` member to it, allowing the
> configuration of the ICnMC register based on the MIPI CSI2 data type.
> 
> Also, move the `rzg2l_cru_ip_code_to_fmt()` function to `rzg2l-cru.h`
> to streamline format lookup and make it more accessible across the
> driver.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h    | 12 ++++++++++++
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c | 13 +++++++------
>  .../media/platform/renesas/rzg2l-cru/rzg2l-video.c  | 13 +++++++------
>  3 files changed, 26 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> index 4fe24bdde5b2..9b1ba015df3b 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> @@ -62,6 +62,16 @@ struct rzg2l_cru_ip {
>  	struct v4l2_subdev *remote;
>  };
>  
> +/**
> + * struct rzg2l_cru_ip_format - CRU IP format
> + * @code: Media bus code
> + * @datatype: MIPI CSI2 data type
> + */
> +struct rzg2l_cru_ip_format {
> +	u32 code;
> +	u32 datatype;
> +};
> +
>  /**
>   * struct rzg2l_cru_dev - Renesas CRU device structure
>   * @dev:		(OF) device
> @@ -150,4 +160,6 @@ int rzg2l_cru_ip_subdev_register(struct rzg2l_cru_dev *cru);
>  void rzg2l_cru_ip_subdev_unregister(struct rzg2l_cru_dev *cru);
>  struct v4l2_mbus_framefmt *rzg2l_cru_ip_get_src_fmt(struct rzg2l_cru_dev *cru);
>  
> +const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int code);
> +
>  #endif
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> index 7b006a0bfaae..8f9683bf31fa 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> @@ -6,17 +6,18 @@
>   */
>  
>  #include <linux/delay.h>
> -#include "rzg2l-cru.h"
> +#include <media/mipi-csi2.h>
>  
> -struct rzg2l_cru_ip_format {
> -	u32 code;
> -};
> +#include "rzg2l-cru.h"
>  
>  static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
> -	{ .code = MEDIA_BUS_FMT_UYVY8_1X16, },
> +	{
> +		.code = MEDIA_BUS_FMT_UYVY8_1X16,
> +		.datatype = MIPI_CSI2_DT_YUV422_8B,
> +	},
>  };
>  
> -static const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int code)
> +const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int code)
>  {
>  	unsigned int i;
>  
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 401ef7be58ec..37fea2bed00f 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -301,18 +301,17 @@ static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
>  }
>  
>  static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru, bool *input_is_yuv,
> -				 struct v4l2_mbus_framefmt *ip_sd_fmt, u8 csi_vc)
> +				 const struct rzg2l_cru_ip_format *ip_fmt,
> +				 u8 csi_vc)
>  {
> -	u32 icnmc;
> +	u32 icnmc = ICnMC_INF(ip_fmt->datatype);
>  
> -	switch (ip_sd_fmt->code) {
> +	switch (ip_fmt->code) {
>  	case MEDIA_BUS_FMT_UYVY8_1X16:
> -		icnmc = ICnMC_INF(MIPI_CSI2_DT_YUV422_8B);
>  		*input_is_yuv = true;
>  		break;
>  	default:
>  		*input_is_yuv = false;
> -		icnmc = ICnMC_INF(MIPI_CSI2_DT_USER_DEFINED(0));
>  		break;
>  	}
>  
> @@ -328,11 +327,13 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
>  					   struct v4l2_mbus_framefmt *ip_sd_fmt,
>  					   u8 csi_vc)
>  {
> +	const struct rzg2l_cru_ip_format *cru_ip_fmt;
>  	bool output_is_yuv = false;
>  	bool input_is_yuv = false;
>  	u32 icndmr;
>  
> -	rzg2l_cru_csi2_setup(cru, &input_is_yuv, ip_sd_fmt, csi_vc);
> +	cru_ip_fmt = rzg2l_cru_ip_code_to_fmt(ip_sd_fmt->code);
> +	rzg2l_cru_csi2_setup(cru, &input_is_yuv, cru_ip_fmt, csi_vc);
>  
>  	/* Output format */
>  	switch (cru->format.pixelformat) {
> 

-- 
Regards,

Laurent Pinchart

