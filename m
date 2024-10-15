Return-Path: <linux-media+bounces-19659-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A085699E3BC
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 12:23:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 594F02846B5
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 10:23:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACFD51E5727;
	Tue, 15 Oct 2024 10:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EmPzDh1f"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B971E412E;
	Tue, 15 Oct 2024 10:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728987771; cv=none; b=Rvq6FGRGlqefdlfORGh22deyyziN/T/yWJOlM5qS98OTZS/GIlZ2RFmHl6rkOecf/ws1ltVP5ZQq3ijPrmWNdm7CnMFvIiDo3uXEKfYuRnTyGHy1W5r/h6Mj443sHtcHCARMZR8mKrE4wBz8Ojj4TOWeif643O28SolI1JGdbb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728987771; c=relaxed/simple;
	bh=qEZCaxXw9/3lxgMI11DtoE1ui3h7Ubj5j1ASKwv8xIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pUu4iuVi+kWzfO8rtLCyruCBJjBkNQj5zk+RHmD1/snUPjdmawfrWRJJjrX3zjprNv8H58Z02TMMAYbeBhmzweSUyrURYLvwU1Lwe+8Jb3pIeylHYFS5Fo0DaDnTypp37oAXeAaU5WMWGiSDyk63IsYMOZwNzbwokmFavMN162E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EmPzDh1f; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [185.143.39.11])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6113EA98;
	Tue, 15 Oct 2024 12:21:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728987666;
	bh=qEZCaxXw9/3lxgMI11DtoE1ui3h7Ubj5j1ASKwv8xIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EmPzDh1fg3eXFzz6ExT9Q0pymJLPb3QpImqVivcZJaWKiGsi4zwykS9g7r+wfer+P
	 YtJRmv2K/PFoMoD7TZcbB1ZyK2Qxdb6liHtG0/Z3yt5GGdMV9JN6Q6rNnkRKaW3YW9
	 TEXDKay7DcLIQ7V6wred3MLOMzCCkS8Nk9ZJ3P2g=
Date: Tue, 15 Oct 2024 13:22:44 +0300
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
Subject: Re: [PATCH v5 12/22] media: rzg2l-cru: Inline calculating image size
Message-ID: <20241015102244.GH5682@pendragon.ideasonboard.com>
References: <20241011173052.1088341-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241011173052.1088341-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241011173052.1088341-13-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thank you for the patch.

On Fri, Oct 11, 2024 at 06:30:42PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> The `rzg2l_cru_format_sizeimage()` function has been inlined into the
> `rzg2l_cru_format_align()` function as it has a single caller.

The commit message should use the imperative mood:

Inline the `rzg2l_cru_format_sizeimage()` function into its single
caller as the function is trivial and is not expected to be called
anywhere else.

> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 37fea2bed00f..6a4f0455dc9c 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -839,11 +839,6 @@ static u32 rzg2l_cru_format_bytesperline(struct v4l2_pix_format *pix)
>  	return pix->width * fmt->bpp[0];
>  }
>  
> -static u32 rzg2l_cru_format_sizeimage(struct v4l2_pix_format *pix)
> -{
> -	return pix->bytesperline * pix->height;
> -}
> -
>  static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
>  				   struct v4l2_pix_format *pix)
>  {
> @@ -868,7 +863,7 @@ static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
>  			      &pix->height, 240, RZG2L_CRU_MAX_INPUT_HEIGHT, 2, 0);
>  
>  	pix->bytesperline = rzg2l_cru_format_bytesperline(pix);
> -	pix->sizeimage = rzg2l_cru_format_sizeimage(pix);
> +	pix->sizeimage = pix->bytesperline * pix->height;
>  
>  	dev_dbg(cru->dev, "Format %ux%u bpl: %u size: %u\n",
>  		pix->width, pix->height, pix->bytesperline, pix->sizeimage);

-- 
Regards,

Laurent Pinchart

