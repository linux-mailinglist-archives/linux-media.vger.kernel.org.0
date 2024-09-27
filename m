Return-Path: <linux-media+bounces-18714-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C0D988C6C
	for <lists+linux-media@lfdr.de>; Sat, 28 Sep 2024 00:24:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1380328384A
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 22:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83AD3187555;
	Fri, 27 Sep 2024 22:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QxswVe0q"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB22C139;
	Fri, 27 Sep 2024 22:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727475847; cv=none; b=dKG1LXp3430HtHpGOu5LCw6sdmb7gniCkLOBcjA18J8FfTXBMquhn1B3oNEs9o9kxJ3IjQa8+zBpaJzLw7coX875xtj0FWJ5J+l0DKwWU2qyvYuVJ/fS1ZtSxbO1Z8YrtENdWz8CbTagpu6ZelYsDCaSTssweryN/6rI1xqJ09o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727475847; c=relaxed/simple;
	bh=jA56HUhVSkiXKFY3Hmd5KTNKCQs8LDNujG9hEudNDKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cbu1R7IBM748/fiyL3ZLDtshviaYOC56LvU0lW4FggLtxUHR35N5E+gDOcDKHsWJrfBEwApnzsE5VxPHOj5F/oUbmXNxrnAtPBhGuj2AcrlEK3Y7HXdyLoVMoNmcUpesoteNlQKDf4E4+E+mtcX30YyGCXhjY4W7pql/OyqDIto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QxswVe0q; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 56825AD8;
	Sat, 28 Sep 2024 00:22:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727475754;
	bh=jA56HUhVSkiXKFY3Hmd5KTNKCQs8LDNujG9hEudNDKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QxswVe0qryYS2aleUg69nxWVCNyrU0om1tL0t1NBfriOddtevS/UMrh/50krnceOR
	 x0SqiVU+GnDkmCfMjhOE0D4HEX1M7ISD5HQenoIEBAYXBWIqswK34bNBdxEMPjsgL4
	 hbP7BmgUkRxcUqzyoiS+6Iq9Xe256/LKKghb5b7M=
Date: Sat, 28 Sep 2024 01:24:00 +0300
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
Subject: Re: [PATCH v2 03/16] media: platform: rzg2l-cru: rzg2l-csi2: Mark
 sink and source pad with MUST_CONNECT flag
Message-ID: <20240927222400.GE12322@pendragon.ideasonboard.com>
References: <20240910175357.229075-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240910175357.229075-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240910175357.229075-4-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thank you for the patch.

On Tue, Sep 10, 2024 at 06:53:44PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Mark the sink and source pad with the MEDIA_PAD_FL_MUST_CONNECT flag to
> ensure pipeline validation fails if it is not connected.

The MUST_CONNECT flag only affects sink pads. That's not documented
though, and it seems that most drivers using the flag sets it on both
sink and source pads. That's probably a good practice, and the fact that
the flag is only checked for sink pads is more of an implementation
detail. This patch is thus fine.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

However, I think you should then set the flag on the source pad of the
IP entity in patch 02/16. You can keep my Rb.

> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> index c7fdee347ac8..2f4c87ede8bf 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> @@ -795,13 +795,15 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
>  	csi2->subdev.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
>  	csi2->subdev.entity.ops = &rzg2l_csi2_entity_ops;
>  
> -	csi2->pads[RZG2L_CSI2_SINK].flags = MEDIA_PAD_FL_SINK;
> +	csi2->pads[RZG2L_CSI2_SINK].flags = MEDIA_PAD_FL_SINK |
> +					    MEDIA_PAD_FL_MUST_CONNECT;
>  	/*
>  	 * TODO: RZ/G2L CSI2 supports 4 virtual channels, as virtual
>  	 * channels should be implemented by streams API which is under
>  	 * development lets hardcode to VC0 for now.
>  	 */
> -	csi2->pads[RZG2L_CSI2_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
> +	csi2->pads[RZG2L_CSI2_SOURCE].flags = MEDIA_PAD_FL_SOURCE |
> +					      MEDIA_PAD_FL_MUST_CONNECT;
>  	ret = media_entity_pads_init(&csi2->subdev.entity, 2, csi2->pads);
>  	if (ret)
>  		goto error_pm;

-- 
Regards,

Laurent Pinchart

