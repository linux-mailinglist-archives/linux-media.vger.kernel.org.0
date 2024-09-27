Return-Path: <linux-media+bounces-18711-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23329988C01
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 23:51:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5FAD1F22277
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 21:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 900C318C01E;
	Fri, 27 Sep 2024 21:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nDBx667z"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9BB14BF8B;
	Fri, 27 Sep 2024 21:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727473857; cv=none; b=p8n4hSz4Uki9hX6Kxb1L9ZEMkyc7lvyb85mzXKTUy63n36b/u2BFnvvZ6UKy8FvS8Oq5D2alH4b4YG3I5j1vO9TshuhYguPIDcdRitplovJfPqPuTpvo/M65zGJ9nWYMpOQrhTVcNFvgfqECQcXc+feX92U+3gmydvDiUXy7Kgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727473857; c=relaxed/simple;
	bh=JxjCIhWE6gqloaqlLmdNyCYXnknkCaTq9ANMK1KebsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jc2PPoLUBu+wqU4Q7GHRVOGYWCysKyn86TTIjA5+Jw5BR+ZRNrF3UHXlq4V3SDtkxPmecHJ1Q4NxReTpfPgjAXQyBL8N63qL7jkG6DL+JeAsMk2UVFmgT3Ie6PuxilU/i5LujF13rOl4agHTroVn6ARJSm3mKz1bpps9XmbbI8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nDBx667z; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 53B7B83D;
	Fri, 27 Sep 2024 23:49:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727473764;
	bh=JxjCIhWE6gqloaqlLmdNyCYXnknkCaTq9ANMK1KebsI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nDBx667zRWYHdYqIjItXRW2gECGmU+URS9W9P7L8+qP4ykKjReIyFHfrbrR42RtUo
	 VjhlwS1xbTep9hFe9Ra03bNyba3ozr+vk2mIq9GCz6BqJc+YsPQarT28aFMr3EYzSD
	 PqVMYbUrsNJheJOgdTtFm6njDJVUEdqahPImXuzs=
Date: Sat, 28 Sep 2024 00:50:50 +0300
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
Subject: Re: [PATCH v2 01/16] media: platform: rzg2l-cru: rzg2l-ip: Use the
 RZG2L_CRU_IP_SINK/SOURCE enum entries
Message-ID: <20240927215050.GC12322@pendragon.ideasonboard.com>
References: <20240910175357.229075-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240910175357.229075-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240910175357.229075-2-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thank you for the patch.

On Tue, Sep 10, 2024 at 06:53:42PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Use enum values (`RZG2L_CRU_IP_SINK` and `RZG2L_CRU_IP_SOURCE`) instead
> of hardcoded array indices.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> index ac8ebae4ed07..9f0ea1de50da 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> @@ -217,8 +217,8 @@ int rzg2l_cru_ip_subdev_register(struct rzg2l_cru_dev *cru)
>  	ip->subdev.entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
>  	ip->subdev.entity.ops = &rzg2l_cru_ip_entity_ops;
>  
> -	ip->pads[0].flags = MEDIA_PAD_FL_SINK;
> -	ip->pads[1].flags = MEDIA_PAD_FL_SOURCE;
> +	ip->pads[RZG2L_CRU_IP_SINK].flags = MEDIA_PAD_FL_SINK;
> +	ip->pads[RZG2L_CRU_IP_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
>  
>  	ret = media_entity_pads_init(&ip->subdev.entity, 2, ip->pads);
>  	if (ret)

-- 
Regards,

Laurent Pinchart

