Return-Path: <linux-media+bounces-4097-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC068392C6
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 16:33:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3CAF1B268C0
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 15:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5A5560241;
	Tue, 23 Jan 2024 15:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BKRqlDmU"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A4E5FEEF;
	Tue, 23 Jan 2024 15:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706023989; cv=none; b=j3bkJIm/hZKaaqIGcnlEUWGcY9Genr0ACEMHHnopqf8XEyGwztSUqmaRu5lR7DYmX5Xrk0NsWUVw+e3dwOwCe3xVQZO0g79w7xdM2nzHK0ezZsQdZvg5fV2T9ZUr3djvi/5SaDA+Wnd2zzdMqAPssMEisdtbTCB3jE5rJg7gqWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706023989; c=relaxed/simple;
	bh=LrTucT+QjT5J5+8Wh5ZTwgnyIrX3DAzExqgTQurNW7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QUaDvezFXmE3aO0p3wJrA3jffkm7bpisP6/a7sKpjmIRDCXDbZb2bETQ0RBLKJ9bd8QGLvhHcrCvD2E6spjyyBZLikTU4LXDrGGv/YGpVfgHn995hBhzZE9MxvdRj5+x2dmBq95rJi2HXaW53tzta0V7j85EeBF8R0C00brNyTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BKRqlDmU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2DDBF1B9A;
	Tue, 23 Jan 2024 16:31:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1706023912;
	bh=LrTucT+QjT5J5+8Wh5ZTwgnyIrX3DAzExqgTQurNW7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BKRqlDmUPVTV9yThehPicu4ZbsxfKurulSw2LfBOT/pHZr8yriD/PMCP2VeKCS3Sk
	 tNWqWl4A3HGjXs4dCZgHXbbqTmMG2s7DgtZPKNbJ99K2R1yEohfXwRS2OlMyc5Mq55
	 Gm4P2n885LO9z42UkXQN/zkyvZqZMATROphR2cTc=
Date: Tue, 23 Jan 2024 17:33:04 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-media@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/4] media: platform: rzg2l-cru: rzg2l-video: Fix image
 processing initialization
Message-ID: <20240123153304.GS10679@pendragon.ideasonboard.com>
References: <20240123115821.292787-1-biju.das.jz@bp.renesas.com>
 <20240123115821.292787-4-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240123115821.292787-4-biju.das.jz@bp.renesas.com>

Hi Biju,

Thank you for the patch.

On Tue, Jan 23, 2024 at 11:58:20AM +0000, Biju Das wrote:
> As per section 35.3.1 Starting Reception for the MIPI CSI-2 Input on the
> latest hardware manual(R01UH0914EJ0140 Rev.1.40) it is mentioned that

s/manual/manual /

> initialize the AXI master first and then initialize the image processing.
> Fix the start procedure as per the hardware manual.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index d0ffa90bc656..a7d6fe831d54 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -430,13 +430,6 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
>  
>  	spin_lock_irqsave(&cru->qlock, flags);
>  
> -	/* Initialize image convert */
> -	ret = rzg2l_cru_initialize_image_conv(cru, fmt);
> -	if (ret) {
> -		spin_unlock_irqrestore(&cru->qlock, flags);
> -		return ret;
> -	}
> -
>  	/* Select a video input */
>  	rzg2l_cru_write(cru, CRUnCTRL, CRUnCTRL_VINSEL(0));
>  
> @@ -450,6 +443,13 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
>  	/* Initialize the AXI master */
>  	rzg2l_cru_initialize_axi(cru);
>  
> +	/* Initialize image convert */
> +	ret = rzg2l_cru_initialize_image_conv(cru, fmt);
> +	if (ret) {
> +		spin_unlock_irqrestore(&cru->qlock, flags);
> +		return ret;
> +	}
> +
>  	/* Enable interrupt */
>  	rzg2l_cru_write(cru, CRUnIE, CRUnIE_EFE);
>  

-- 
Regards,

Laurent Pinchart

