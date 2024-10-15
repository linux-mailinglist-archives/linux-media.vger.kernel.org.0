Return-Path: <linux-media+bounces-19661-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D8599E3C1
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 12:23:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7DBDFB23138
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 10:23:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73FDF1E3DC4;
	Tue, 15 Oct 2024 10:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BWrnyDoE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E05F1E32D0;
	Tue, 15 Oct 2024 10:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728987795; cv=none; b=Ln3k2JV6m/cLAfiyuZE7yZbXuqr5m17E5K/M4RPXeA5K9a7nd/JWt5AyA24C4uuxL0IGob1kiAopoPyREDCZoHfhyMXCriBXuSxYB5jHSWtDlmqupMJ5jv21Cbx9TjLsBJGXIN6EWZt2OUdMs+sZ/JHqHFNVCFVAgSB7LdnJcDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728987795; c=relaxed/simple;
	bh=RIj1CqnnOmME8nn75UX5fnmRVWCbsnL67Sauh06lFL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=umhmCI806hJtWd4aC5ZXBmjH2Kxf75cUSTjHWoFpynZsWrjNZqpsOoEykRW/507vYQlqGYoewVwIeTdz/p6NXDeohJySk8MMFoFfX+QDIb2BdHjKV9j8siqel/q5VtyKoDaa0WaNYAkIjnh8TyQkSNTiNudeMlFmxmm4LYQgw/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BWrnyDoE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [185.143.39.11])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 385B4A27;
	Tue, 15 Oct 2024 12:21:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728987691;
	bh=RIj1CqnnOmME8nn75UX5fnmRVWCbsnL67Sauh06lFL8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BWrnyDoEKr2oaGXEG8HcD4zCRgU9vwWBR9DmqLg+7fNraUWZNsYynGo4tvJsY1EXI
	 IVjkZ4woNOlsCf/Rk4h469TSRvfzMc7BUoR9tIt6JXOGcEoZrkxp9sqFBGDI3ereec
	 gRxt5ompJiRE9zwn285Df2iLYeKUZIAFULjxsQtA=
Date: Tue, 15 Oct 2024 13:23:09 +0300
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
Subject: Re: [PATCH v5 13/22] media: rzg2l-cru: Simplify handling of
 supported formats
Message-ID: <20241015102309.GI5682@pendragon.ideasonboard.com>
References: <20241011173052.1088341-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241011173052.1088341-14-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241011173052.1088341-14-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thank you for the patch.

On Fri, Oct 11, 2024 at 06:30:43PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Refactor the handling of supported formats in the RZ/G2L CRU driver by
> moving the `rzg2l_cru_ip_format` struct to the common header for reuse
> across multiple files and adding `pixelformat` and `bpp` members to it.

The structure is already in a common header. You can write

Refactor the handling of supported formats in the RZ/G2L CRU driver by
adding `pixelformat` and `bpp` members to the `rzg2l_cru_ip_format`
structure.

> This change centralizes format handling, making it easier to manage and
> extend.
> 
> New helper functions, `rzg2l_cru_ip_format_to_fmt()` and
> `rzg2l_cru_ip_index_to_fmt()`, are added to retrieve format information
> based on 4CC format and index, respectively. These helpers allow the
> removal of the now redundant `rzg2l_cru_format_from_pixel()` function.
> 
> The new helpers are used in `rzg2l_cru_format_bytesperline()`,
> `rzg2l_cru_format_align()`, and `rzg2l_cru_enum_fmt_vid_cap()`,
> streamlining the handling of supported formats and improving code
> maintainability.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  6 ++++
>  .../platform/renesas/rzg2l-cru/rzg2l-ip.c     | 22 +++++++++++++
>  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 33 +++++--------------
>  3 files changed, 37 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> index 9b1ba015df3b..327516272e53 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> @@ -66,10 +66,14 @@ struct rzg2l_cru_ip {
>   * struct rzg2l_cru_ip_format - CRU IP format
>   * @code: Media bus code
>   * @datatype: MIPI CSI2 data type
> + * @format: 4CC format identifier (V4L2_PIX_FMT_*)
> + * @bpp: bytes per pixel
>   */
>  struct rzg2l_cru_ip_format {
>  	u32 code;
>  	u32 datatype;
> +	u32 format;
> +	u8 bpp;
>  };
>  
>  /**
> @@ -161,5 +165,7 @@ void rzg2l_cru_ip_subdev_unregister(struct rzg2l_cru_dev *cru);
>  struct v4l2_mbus_framefmt *rzg2l_cru_ip_get_src_fmt(struct rzg2l_cru_dev *cru);
>  
>  const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int code);
> +const struct rzg2l_cru_ip_format *rzg2l_cru_ip_format_to_fmt(u32 format);
> +const struct rzg2l_cru_ip_format *rzg2l_cru_ip_index_to_fmt(u32 index);
>  
>  #endif
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> index 8f9683bf31fa..a40b0184b955 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> @@ -14,6 +14,8 @@ static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
>  	{
>  		.code = MEDIA_BUS_FMT_UYVY8_1X16,
>  		.datatype = MIPI_CSI2_DT_YUV422_8B,
> +		.format = V4L2_PIX_FMT_UYVY,
> +		.bpp = 2,
>  	},
>  };
>  
> @@ -28,6 +30,26 @@ const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int code)
>  	return NULL;
>  }
>  
> +const struct rzg2l_cru_ip_format *rzg2l_cru_ip_format_to_fmt(u32 format)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(rzg2l_cru_ip_formats); i++) {
> +		if (rzg2l_cru_ip_formats[i].format == format)
> +			return &rzg2l_cru_ip_formats[i];
> +	}
> +
> +	return NULL;
> +}
> +
> +const struct rzg2l_cru_ip_format *rzg2l_cru_ip_index_to_fmt(u32 index)
> +{
> +	if (index >= ARRAY_SIZE(rzg2l_cru_ip_formats))
> +		return NULL;
> +
> +	return &rzg2l_cru_ip_formats[index];
> +}
> +
>  struct v4l2_mbus_framefmt *rzg2l_cru_ip_get_src_fmt(struct rzg2l_cru_dev *cru)
>  {
>  	struct v4l2_subdev_state *state;
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 6a4f0455dc9c..a0fa4542ac43 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -812,37 +812,19 @@ int rzg2l_cru_dma_register(struct rzg2l_cru_dev *cru)
>   * V4L2 stuff
>   */
>  
> -static const struct v4l2_format_info rzg2l_cru_formats[] = {
> -	{
> -		.format = V4L2_PIX_FMT_UYVY,
> -		.bpp[0] = 2,
> -	},
> -};
> -
> -const struct v4l2_format_info *rzg2l_cru_format_from_pixel(u32 format)
> -{
> -	unsigned int i;
> -
> -	for (i = 0; i < ARRAY_SIZE(rzg2l_cru_formats); i++)
> -		if (rzg2l_cru_formats[i].format == format)
> -			return rzg2l_cru_formats + i;
> -
> -	return NULL;
> -}
> -
>  static u32 rzg2l_cru_format_bytesperline(struct v4l2_pix_format *pix)
>  {
> -	const struct v4l2_format_info *fmt;
> +	const struct rzg2l_cru_ip_format *fmt;
>  
> -	fmt = rzg2l_cru_format_from_pixel(pix->pixelformat);
> +	fmt = rzg2l_cru_ip_format_to_fmt(pix->pixelformat);
>  
> -	return pix->width * fmt->bpp[0];
> +	return pix->width * fmt->bpp;
>  }
>  
>  static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
>  				   struct v4l2_pix_format *pix)
>  {
> -	if (!rzg2l_cru_format_from_pixel(pix->pixelformat))
> +	if (!rzg2l_cru_ip_format_to_fmt(pix->pixelformat))
>  		pix->pixelformat = RZG2L_CRU_DEFAULT_FORMAT;
>  
>  	switch (pix->field) {
> @@ -934,10 +916,13 @@ static int rzg2l_cru_g_fmt_vid_cap(struct file *file, void *priv,
>  static int rzg2l_cru_enum_fmt_vid_cap(struct file *file, void *priv,
>  				      struct v4l2_fmtdesc *f)
>  {
> -	if (f->index >= ARRAY_SIZE(rzg2l_cru_formats))
> +	const struct rzg2l_cru_ip_format *fmt;
> +
> +	fmt = rzg2l_cru_ip_index_to_fmt(f->index);
> +	if (!fmt)
>  		return -EINVAL;
>  
> -	f->pixelformat = rzg2l_cru_formats[f->index].format;
> +	f->pixelformat = fmt->format;
>  
>  	return 0;
>  }

-- 
Regards,

Laurent Pinchart

