Return-Path: <linux-media+bounces-34549-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E656BAD63D9
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 01:30:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3608189493D
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 23:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C40D2C17B6;
	Wed, 11 Jun 2025 23:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rLgZVNDT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0882580F9;
	Wed, 11 Jun 2025 23:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749684614; cv=none; b=LGIcCROmqjgfRsF4GS9VrZqkRMxvUiqFq8IPt1FsVxQJnzrId4C7xf3yEiZ/IeSHa/akvIHk0NVyz0rLhDLsipVWKGIzaQj9lz1bnr2deqkCvYwXzN6LiD+Myuq6fYycNxSZStC387AproGo49vgtNfDfZLjp57CoeoP8M9T/bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749684614; c=relaxed/simple;
	bh=rk/wbvoFIcTppPr0a3eZ8ASZcf9IWCLeFoK9GtUK6E8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fEMmdBop5SkOonx1URPidBbMXzHg+PLGW3YaSIJReUlWQ+MmvMTpHcao2s4QfAQrmffvkhPFw3MSoSUiY655ZhiFJaMECUSDv79WEE5kukMvLVcEXkeu6YokuakO4c0cg7/htoB4G7iyth2tA7qMmTUxY7Nve325Row+dSg/X+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rLgZVNDT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 04F16D52;
	Thu, 12 Jun 2025 01:30:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749684601;
	bh=rk/wbvoFIcTppPr0a3eZ8ASZcf9IWCLeFoK9GtUK6E8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rLgZVNDTBmZve6q5wyneXgnFm3w4/lVSdlCv6dly5+ZZLzYaBMvv6XoK4Uccpoj1E
	 LL3i/UFVvmpZRPFWEqwdvw9v6ns+5xIRHOp6H8PwAymA1TqaXz4NGP5uNqIjA4SvEs
	 2+//Qvc7HE2tyg8qLFcT8FtHhIM2hV4wXXp2mBFo=
Date: Thu, 12 Jun 2025 02:29:56 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
	LUU HOAI <hoai.luu.ub@renesas.com>
Subject: Re: [PATCH 2/3] media: vsp1: Reset FCP for VSPD
Message-ID: <20250611232956.GQ24465@pendragon.ideasonboard.com>
References: <20250609-vspx-reset-v1-0-9f17277ff1e2@ideasonboard.com>
 <20250609-vspx-reset-v1-2-9f17277ff1e2@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250609-vspx-reset-v1-2-9f17277ff1e2@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Mon, Jun 09, 2025 at 09:01:43PM +0200, Jacopo Mondi wrote:
> From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> 
> According to H/W manual v1.00, VSPD must be excecuted
> FCP_RST.SOFTRST after VI6_SRESET.SRST. So this patch adds it.
> VSPDL is not applicable.

According to the R-Car Gen3 H/W manual v1.00, the FCP must be reset
after resetting the VSPD, except for the VSPDL. Do so.

> Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/vsp1/vsp1_pipe.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> index 3cbb768cf6adc8cb182d8d31c5b9a9d3565785e7..a6e5e10f3ef275c1b081c3d957e6cf356332afce 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> @@ -13,6 +13,7 @@
>  #include <linux/wait.h>
>  
>  #include <media/media-entity.h>
> +#include <media/rcar-fcp.h>
>  #include <media/v4l2-subdev.h>
>  
>  #include "vsp1.h"
> @@ -22,6 +23,7 @@
>  #include "vsp1_hgo.h"
>  #include "vsp1_hgt.h"
>  #include "vsp1_pipe.h"
> +#include "vsp1_regs.h"
>  #include "vsp1_rwpf.h"
>  #include "vsp1_uds.h"
>  
> @@ -512,6 +514,11 @@ int vsp1_pipeline_stop(struct vsp1_pipeline *pipe)
>  			pipe->state = VSP1_PIPELINE_STOPPED;
>  			spin_unlock_irqrestore(&pipe->irqlock, flags);
>  		}
> +
> +		if ((vsp1->version & VI6_IP_VERSION_MODEL_MASK) ==
> +		    VI6_IP_VERSION_MODEL_VSPD_GEN3)
> +			ret |= rcar_fcp_soft_reset(vsp1->fcp);

Wouldn't this be better placed in vsp1_reset_wpf() ?

> +
>  	} else {
>  		/* Otherwise just request a stop and wait. */
>  		spin_lock_irqsave(&pipe->irqlock, flags);

-- 
Regards,

Laurent Pinchart

