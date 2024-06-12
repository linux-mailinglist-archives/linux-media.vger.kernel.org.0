Return-Path: <linux-media+bounces-13036-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6922C9053E0
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 15:35:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BF92EB21AD5
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 13:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D85517B511;
	Wed, 12 Jun 2024 13:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Wyq03PsJ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0161EF1A
	for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 13:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718199347; cv=none; b=i0T6E+WPIP4gu39Dw1D82UWZY3O5nwle064f5WpK/r/hUKtykH72wjlhZJK/jVQY2QYH7Xl4mmsdJKRkrkD1zJruQuCA+VjuP3D6XagpmoUmO/m1zDtbNrdmdwcyf2gfDq48Nl58CviFMDU8j/4ULwPgSFndQQOdDj56TyJ6OWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718199347; c=relaxed/simple;
	bh=Kavs5++ITHFQ9cgquZA80wgqOWeBQfpchdij7KmF94E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ESwtAFrqMW09gv12Bu2aPKuoGAF8qsUjAvniBminOjq+vZ0u05evD1DY5wusUwqi7aHWdqqgkrbZJBuOTYVWwfqQTsOziTFnEQe13xuwbIiu1iLXJ7iXazgiwA/mELNgMZpmG+P4XJbY/p5wUXnt3IcdHQxva3Qel19uoQ5aEqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Wyq03PsJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D5D2A4D0;
	Wed, 12 Jun 2024 15:35:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718199329;
	bh=Kavs5++ITHFQ9cgquZA80wgqOWeBQfpchdij7KmF94E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Wyq03PsJK+fgHh9Mx8xJAb5YTFclZrB+x5dPFJwTP0S00dQbg43HnLEFMRB/Cj17O
	 GUNAs90OkKKBdNljFYIn7yznEVbw65TmhCCYMBXmLZlgVMX8HYjCo87yT3K4tlkx/m
	 sHDGFyNGAb2gYWb64i2jL3mX0kQFdpSrxVCllHdU=
Message-ID: <109cc53d-fb84-4133-a8e1-5418eb29d352@ideasonboard.com>
Date: Wed, 12 Jun 2024 14:35:39 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] media: rkisp1: Propagate pre/post-config errors
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@iki.fi>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Stefan Klug <stefan.klug@ideasonboard.com>,
 Paul Elder <paul.elder@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Umang Jain <umang.jain@ideasonboard.com>,
 Dafna Hirschfeld <dafna@fastmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>
References: <20240605165434.432230-1-jacopo.mondi@ideasonboard.com>
 <20240605165434.432230-7-jacopo.mondi@ideasonboard.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
Autocrypt: addr=dan.scally@ideasonboard.com; keydata=
 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
In-Reply-To: <20240605165434.432230-7-jacopo.mondi@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jacopo - thanks for the patch. I think this probably should come before 5/8 in the series, and 
just hardcode return 0 in rkisp1_params_pre/post_configure() temporarily.

On 05/06/2024 17:54, Jacopo Mondi wrote:
> The support for the extensible parameters format introduces the
> possibility of failures in handling the parameters buffer.
>
> Errors in parsing the configuration parameters are not propagated
> to the rkisp1_config_isp() and the rkisp1_isp_start() functions.
>
> Propagate any possible errors to the callers to report it to userspace.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>   .../media/platform/rockchip/rkisp1/rkisp1-common.h | 10 +++++-----
>   .../media/platform/rockchip/rkisp1/rkisp1-isp.c    | 14 +++++++++-----
>   .../media/platform/rockchip/rkisp1/rkisp1-params.c | 14 +++++++++-----
>   3 files changed, 23 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> index 0bddae8dbdb1..f9df5ed96c98 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> @@ -591,10 +591,10 @@ const struct rkisp1_mbus_info *rkisp1_mbus_info_get_by_code(u32 mbus_code);
>    * It applies the initial ISP parameters from the first params buffer, but
>    * skips LSC as it needs to be configured after the ISP is started.
>    */
> -void rkisp1_params_pre_configure(struct rkisp1_params *params,
> -				 enum rkisp1_fmt_raw_pat_type bayer_pat,
> -				 enum v4l2_quantization quantization,
> -				 enum v4l2_ycbcr_encoding ycbcr_encoding);
> +int rkisp1_params_pre_configure(struct rkisp1_params *params,
> +				enum rkisp1_fmt_raw_pat_type bayer_pat,
> +				enum v4l2_quantization quantization,
> +				enum v4l2_ycbcr_encoding ycbcr_encoding);
>   
>   /*
>    * rkisp1_params_post_configure - Configure the params after stream start
> @@ -604,7 +604,7 @@ void rkisp1_params_pre_configure(struct rkisp1_params *params,
>    * This function is called by the ISP entity just after the ISP gets started.
>    * It applies the initial ISP LSC parameters from the first params buffer.
>    */
> -void rkisp1_params_post_configure(struct rkisp1_params *params);
> +int rkisp1_params_post_configure(struct rkisp1_params *params);
>   
>   /* rkisp1_params_disable - disable all parameters.
>    *			   This function is called by the isp entity upon stream start
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> index 91301d17d356..05227c6a16fe 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> @@ -310,12 +310,16 @@ static int rkisp1_config_isp(struct rkisp1_isp *isp,
>   		rkisp1_params_disable(&rkisp1->params);
>   	} else {
>   		const struct v4l2_mbus_framefmt *src_frm;
> +		int ret;
>   
>   		src_frm = v4l2_subdev_state_get_format(sd_state,
>   						       RKISP1_ISP_PAD_SOURCE_VIDEO);
> -		rkisp1_params_pre_configure(&rkisp1->params, sink_fmt->bayer_pat,
> -					    src_frm->quantization,
> -					    src_frm->ycbcr_enc);
> +		ret = rkisp1_params_pre_configure(&rkisp1->params,
> +						  sink_fmt->bayer_pat,
> +						  src_frm->quantization,
> +						  src_frm->ycbcr_enc);
> +		if (ret)
> +			return ret;
>   	}
>   
>   	isp->sink_fmt = sink_fmt;
> @@ -458,9 +462,9 @@ static int rkisp1_isp_start(struct rkisp1_isp *isp,
>   	src_info = rkisp1_mbus_info_get_by_code(src_fmt->code);
>   
>   	if (src_info->pixel_enc != V4L2_PIXEL_ENC_BAYER)
> -		rkisp1_params_post_configure(&rkisp1->params);
> +		ret = rkisp1_params_post_configure(&rkisp1->params);
>   
> -	return 0;
> +	return ret;

I think ret could be returned uninitialised in some circumstances in this function now - if it's not 
the IMX8MP version and the pixel encoding is bayer...or am I missing something?

>   }
>   
>   /* ----------------------------------------------------------------------------
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> index 3d78e643d0b8..c081fd490b2b 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> @@ -2123,10 +2123,10 @@ static const struct rkisp1_cif_isp_afc_config rkisp1_afc_params_default_config =
>   	14
>   };
>   
> -void rkisp1_params_pre_configure(struct rkisp1_params *params,
> -				 enum rkisp1_fmt_raw_pat_type bayer_pat,
> -				 enum v4l2_quantization quantization,
> -				 enum v4l2_ycbcr_encoding ycbcr_encoding)
> +int rkisp1_params_pre_configure(struct rkisp1_params *params,
> +				enum rkisp1_fmt_raw_pat_type bayer_pat,
> +				enum v4l2_quantization quantization,
> +				enum v4l2_ycbcr_encoding ycbcr_encoding)
>   {
>   	struct rkisp1_cif_isp_hst_config hst = rkisp1_hst_params_default_config;
>   	struct rkisp1_buffer *buf;
> @@ -2187,9 +2187,11 @@ void rkisp1_params_pre_configure(struct rkisp1_params *params,
>   
>   unlock:
>   	spin_unlock_irq(&params->config_lock);
> +
> +	return ret;
>   }
>   
> -void rkisp1_params_post_configure(struct rkisp1_params *params)
> +int rkisp1_params_post_configure(struct rkisp1_params *params)
>   {
>   	struct rkisp1_buffer *buf;
>   	int ret = 0;
> @@ -2227,6 +2229,8 @@ void rkisp1_params_post_configure(struct rkisp1_params *params)
>   
>   unlock:
>   	spin_unlock_irq(&params->config_lock);
> +
> +	return ret;
>   }
>   
>   /*

