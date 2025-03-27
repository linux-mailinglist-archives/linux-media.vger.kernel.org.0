Return-Path: <linux-media+bounces-28904-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A8152A74171
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 00:15:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E7245189B747
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 23:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D80E1E51F4;
	Thu, 27 Mar 2025 23:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rxRxjvY7"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6331A1D63D6;
	Thu, 27 Mar 2025 23:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743117343; cv=none; b=chIMCn5abFoXj15jBOFtart3CAsYN3PqZKqkoYrZxmRCmxMnesLGLUtFfeCiGJbBr/uI5zs/IjF4KK4e9qHeuBH1BOU3m88hunEnkHQUy+sswWoZ7PSajJ+q/WR0Et7BNnFn9DTyYd/R2FuSe4PkE5HErcw1D/hsGLsyRXYj+tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743117343; c=relaxed/simple;
	bh=QR2nETTMX/94QTJLoO2pHQlYPRo2EC3yJU854Hu7fmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=COXMHRmiZc/gg1jUbFCSKSnCeY2gB/nGx/nHyyOndHk/mVEMEL4ejhGYjeW5L5FAt3YhlR2F1hCWoHQwuP31+gRTqmGlYl8igX3mIH9s77yjg5DcjpxJgfALqhbx/exDRKENRr0D9511Gr1Xbn8iqkA33OgkyHDij2cyLfOCrF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rxRxjvY7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0D28E3DA;
	Fri, 28 Mar 2025 00:13:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743117232;
	bh=QR2nETTMX/94QTJLoO2pHQlYPRo2EC3yJU854Hu7fmo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rxRxjvY7x1P1mACoIRjnCpIFsm/i4YJHzOZITpRIth3vVIf5+B0OAU4bkmgKRiCeN
	 A6kKmGk2P0li6TS0SaH1HKolwDYt55P5GcNNGTPBMbtG4WVfEFqXyn5lDzxPzy+FCQ
	 L0wavcXFzH+1giZvDCjmv6nfoOEh2aES1HarhjIk=
Date: Fri, 28 Mar 2025 01:15:18 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Benoit Parrot <bparrot@ti.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/3] media: ti: cal: Fix wrong goto on error path
Message-ID: <20250327231518.GM4861@pendragon.ideasonboard.com>
References: <20250326-cal-streams-v7-0-659df87ad231@ideasonboard.com>
 <20250326-cal-streams-v7-2-659df87ad231@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250326-cal-streams-v7-2-659df87ad231@ideasonboard.com>

Hi Tomi,

Thank you for the patch.

On Wed, Mar 26, 2025 at 01:34:02PM +0200, Tomi Valkeinen wrote:
> If pm_runtime_resume_and_get() fails, we should unprepare the context,
> but currently we skip that as we goto to a later line.
> 
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/ti/cal/cal-video.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/ti/cal/cal-video.c b/drivers/media/platform/ti/cal/cal-video.c
> index 4eb77f46f030..29c38bf8d7a1 100644
> --- a/drivers/media/platform/ti/cal/cal-video.c
> +++ b/drivers/media/platform/ti/cal/cal-video.c
> @@ -744,7 +744,7 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
>  
>  	ret = pm_runtime_resume_and_get(ctx->cal->dev);
>  	if (ret < 0)
> -		goto error_pipeline;
> +		goto error_unprepare;
>  
>  	cal_ctx_set_dma_addr(ctx, addr);
>  	cal_ctx_start(ctx);
> @@ -761,8 +761,8 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
>  error_stop:
>  	cal_ctx_stop(ctx);
>  	pm_runtime_put_sync(ctx->cal->dev);
> +error_unprepare:
>  	cal_ctx_unprepare(ctx);
> -
>  error_pipeline:
>  	video_device_pipeline_stop(&ctx->vdev);
>  error_release_buffers:

-- 
Regards,

Laurent Pinchart

