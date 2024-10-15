Return-Path: <linux-media+bounces-19662-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED39099E3C7
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 12:24:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9F29283063
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 10:24:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECDA61E379D;
	Tue, 15 Oct 2024 10:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="T0NJ+Yzc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5661E282C;
	Tue, 15 Oct 2024 10:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728987863; cv=none; b=YdyQUKO2hL+LJCkGhHKf3Zo/C0cgadcJZw+hn4Qad80fj52cz69SXC3JwKClVmeJ4VgbvYNbbErFvkH0zvmXxnsaZUHP31hHd7ZADpUtxHNDJxHXWwc/jGhqstS1y95mm5qahPAb3CjVS3wBkeZdp8QC15U/OYtZG4R/fdsV3ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728987863; c=relaxed/simple;
	bh=M0PmfAVWgVnsL9LOrta8g9LxKUtGd5IsoppQXp4hILE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B9dEDGNIB5rEoSB0JOmZzMkUOovQrDg+V0AonapnFikgryUnC+Rmaf757VAFYnZ63QQX2JegiPqGvK7lmjW8HYwSg1aXAo9xsHq2udO7DMKibJmeBe8GQPnv5K8UJ5OCwVIVEle0ZiMbDbcCL1q4blSwcRmja6vRUQnfqD8gcPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=T0NJ+Yzc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [185.143.39.11])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EB1649CE;
	Tue, 15 Oct 2024 12:22:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728987759;
	bh=M0PmfAVWgVnsL9LOrta8g9LxKUtGd5IsoppQXp4hILE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T0NJ+YzcgTw6mMWQfCcUGr1v/eT/hFpfIZDytfDPWJVWNfLrfY/f3aG1NaBIH+al9
	 KnTZfQDqrCM3M+iqFSM/zSHXriWqAe95QrsQBgSKKy3ursOfwlWcCpWyuI9PdPFOu5
	 Qccc1VeQV4g+JBCdU5PMCrbTCSuSSJ4AXy3Cl4qg=
Date: Tue, 15 Oct 2024 13:24:17 +0300
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
Subject: Re: [PATCH v5 14/22] media: rzg2l-cru: Inline calculating
 bytesperline
Message-ID: <20241015080121.GA20855@pendragon.ideasonboard.com>
References: <20241011173052.1088341-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241011173052.1088341-15-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241011173052.1088341-15-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thank you for the patch.

On Fri, Oct 11, 2024 at 06:30:44PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Remove the `rzg2l_cru_format_bytesperline()` function and inline the
> calculation of `bytesperline` directly in `rzg2l_cru_format_align()`.
> This simplifies the code by removing an unnecessary function call and
> directly multiplying the image width by the `bpp` (bytes per pixel)
> from the format structure.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  .../platform/renesas/rzg2l-cru/rzg2l-video.c     | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index a0fa4542ac43..8932fab7c656 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -812,20 +812,16 @@ int rzg2l_cru_dma_register(struct rzg2l_cru_dev *cru)
>   * V4L2 stuff
>   */
>  
> -static u32 rzg2l_cru_format_bytesperline(struct v4l2_pix_format *pix)
> +static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
> +				   struct v4l2_pix_format *pix)
>  {
>  	const struct rzg2l_cru_ip_format *fmt;
>  
>  	fmt = rzg2l_cru_ip_format_to_fmt(pix->pixelformat);
> -
> -	return pix->width * fmt->bpp;
> -}
> -
> -static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
> -				   struct v4l2_pix_format *pix)
> -{
> -	if (!rzg2l_cru_ip_format_to_fmt(pix->pixelformat))
> +	if (!fmt) {
>  		pix->pixelformat = RZG2L_CRU_DEFAULT_FORMAT;
> +		fmt = rzg2l_cru_ip_format_to_fmt(pix->pixelformat);
> +	}
>  
>  	switch (pix->field) {
>  	case V4L2_FIELD_TOP:
> @@ -844,7 +840,7 @@ static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
>  	v4l_bound_align_image(&pix->width, 320, RZG2L_CRU_MAX_INPUT_WIDTH, 1,
>  			      &pix->height, 240, RZG2L_CRU_MAX_INPUT_HEIGHT, 2, 0);
>  
> -	pix->bytesperline = rzg2l_cru_format_bytesperline(pix);
> +	pix->bytesperline = pix->width * fmt->bpp;
>  	pix->sizeimage = pix->bytesperline * pix->height;
>  
>  	dev_dbg(cru->dev, "Format %ux%u bpl: %u size: %u\n",

-- 
Regards,

Laurent Pinchart

