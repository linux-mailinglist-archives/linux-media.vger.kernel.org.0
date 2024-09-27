Return-Path: <linux-media+bounces-18712-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F10D1988C59
	for <lists+linux-media@lfdr.de>; Sat, 28 Sep 2024 00:14:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9298D283775
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 22:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 870B91B1D71;
	Fri, 27 Sep 2024 22:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rjZRVXK2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A77188002;
	Fri, 27 Sep 2024 22:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727475244; cv=none; b=fxkIiC4UQZ5FxedEXvEHDSXaNa1IwuZ28fHp3/74hS0yzYfg22IvgmZQBJFQE/DoUOmwyF9VjrvOF2Pe2v/N2++AXPfCdYnPHqh0rUO3g+ZCqj9fj7x/PL44j8Ci2+lwhzU7fVO3HzZ3jerlcxjRC+3eSX6POg+uS4BKruXUw78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727475244; c=relaxed/simple;
	bh=D6YkRMNcc9I7x6tPyBz3AQZw7mi/udiqZ9Hnxl8f9LM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C8WgxbA9HIVTjAapZqXFI0bbhVz6MTlxYDF8HYErK64gGNY7D/X271rOFD4SDr5KyvfULHCaUm5XDzhPDj+vGGyE1jMEeVPp2ncmASUvqAtSjuWDl6jsKyfA2y+IWb5ZXLcVFPp2+l6LZlBOncax8mpls8RPkzKVZrtUzPsTY1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rjZRVXK2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A5779161;
	Sat, 28 Sep 2024 00:12:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727475151;
	bh=D6YkRMNcc9I7x6tPyBz3AQZw7mi/udiqZ9Hnxl8f9LM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rjZRVXK2kSZBlh3csjpvdhhaRDCid/3i1LazPhdcNhJ4eLLViafRqfdT/PGgScJMr
	 53jH5BacHg+aakVwDc/ACf/01Phb/GSP+JTne7jbMlwZ0CAonNkTq5qtXBaqqBd68h
	 7qH0Sn2OF9skjkXpgxXY8prHZ41Rh3P6qQbVHHfY=
Date: Sat, 28 Sep 2024 01:13:57 +0300
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
Subject: Re: [PATCH v2 02/16] media: platform: rzg2l-cru: Mark sink pads with
 MUST_CONNECT flag
Message-ID: <20240927221357.GD12322@pendragon.ideasonboard.com>
References: <20240910175357.229075-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240910175357.229075-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240910175357.229075-3-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thank you for the patch.

On Tue, Sep 10, 2024 at 06:53:43PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Mark the sink pads with the MEDIA_PAD_FL_MUST_CONNECT flag to ensure
> pipeline validation fails if it is not connected.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c | 2 +-
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c   | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> index 19e0ba9596c9..69cd45b26951 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> @@ -209,7 +209,7 @@ static int rzg2l_cru_media_init(struct rzg2l_cru_dev *cru)
>  	const struct of_device_id *match;
>  	int ret;
>  
> -	cru->pad.flags = MEDIA_PAD_FL_SINK;
> +	cru->pad.flags = MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_MUST_CONNECT;

The corresponding link is ENABLED and IMMUTABLE, so this will not have
any effect. It shouldn't cause any issue though, and makes things more
explicit.

>  	ret = media_entity_pads_init(&cru->vdev.entity, 1, &cru->pad);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> index 9f0ea1de50da..db48118fc817 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> @@ -217,7 +217,8 @@ int rzg2l_cru_ip_subdev_register(struct rzg2l_cru_dev *cru)
>  	ip->subdev.entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
>  	ip->subdev.entity.ops = &rzg2l_cru_ip_entity_ops;
>  
> -	ip->pads[RZG2L_CRU_IP_SINK].flags = MEDIA_PAD_FL_SINK;
> +	ip->pads[RZG2L_CRU_IP_SINK].flags = MEDIA_PAD_FL_SINK |
> +					    MEDIA_PAD_FL_MUST_CONNECT;

Same here. For this pad, the MUST_CONNECT flag will come handy when
adding support for the parallel input, as the link will not be immutable
anymore.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  	ip->pads[RZG2L_CRU_IP_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
>  
>  	ret = media_entity_pads_init(&ip->subdev.entity, 2, ip->pads);

-- 
Regards,

Laurent Pinchart

