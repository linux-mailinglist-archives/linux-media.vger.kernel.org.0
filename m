Return-Path: <linux-media+bounces-25226-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A739EA1AC0A
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 22:45:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 975A4188D4B8
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 21:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E6A81CAA9D;
	Thu, 23 Jan 2025 21:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vev18NNB"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7701CAA61;
	Thu, 23 Jan 2025 21:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737668698; cv=none; b=gkb1UhBrwLEm4z88UGEtSTdkgyO6yyIRj4x8c5KM46JLa8aPefvbp62tVty2d5FjxJwAeuVy3Zi0d3hkVnwXfiICAbejkMm3WgYgOtxhXu6YK9mjXrPdiM8p5EjcH184SW3iFf5DBw/2JDkh8NrGrNDxyi3xe95NrDaS8Oo68BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737668698; c=relaxed/simple;
	bh=ULmxtCI1siIPrMdvCIIFBFn7neRx4cArpCbH0o5UyFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GqW3XAargaMXH8hMsgxsnJBhXOfTxFURnudfhKyGeaZD+K5VtOs/4uF8kLf+rPs+XHh7+QG8suca7SduzcvH87Jy0nl4n/ZC/PoFA67NOglNtjULEiK/vnFmlHtx5dFsuODved8fyf5m3w7nSxDIDqNJHhl3qf8z+KCI5ChEmrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vev18NNB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 76BE3D1F;
	Thu, 23 Jan 2025 22:43:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737668631;
	bh=ULmxtCI1siIPrMdvCIIFBFn7neRx4cArpCbH0o5UyFA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vev18NNBgtLqRLU+3XwbJYKmomzYl2PaXP0Hi+qb8ZDfZOxgw63GPs6UIpxxZPVd1
	 cEh1lCLiGaEEPUugpl6/UAQh6JlWK3e4aV/bPK8laXmXx7N4Qxs4rR4JSzUa7Ye0DC
	 4L4dhtvNfT69TAT46LMB10SSuTZOE/U+I/GxqXa0=
Date: Thu, 23 Jan 2025 23:44:45 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/6] media: vsp1: dl: Use singleshot DL for VSPX
Message-ID: <20250123214445.GC10642@pendragon.ideasonboard.com>
References: <20250123-v4h-iif-v1-0-7b4e5299939f@ideasonboard.com>
 <20250123-v4h-iif-v1-3-7b4e5299939f@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250123-v4h-iif-v1-3-7b4e5299939f@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Thu, Jan 23, 2025 at 06:04:04PM +0100, Jacopo Mondi wrote:
> The vsp1_dl library allows to program a display list and feed it
> continuously to the VSP2. As an alternative operation mode, the library
> allows to program the VSP2 in 'single shot' mode, where a display list
> is submitted to the VSP on request only.
> 
> Currently the 'single shot' mode is only available when the VSP2 is
> controlled by userspace, while it works in continuous mode when driven
> by DRM, as frames have to be submitted to the display continuously.
> 
> For the VSPX use case, where there is no uapi support, we should however
> work in single-shot mode as the ISP driver programs the VSPX on
> request.
> 
> Initialize the display lists in single shot mode in case the VSP1 is
> controlled by userspace or in case the pipeline features an IIF entity,
> as in the VSPX case.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/vsp1/vsp1_dl.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_dl.c b/drivers/media/platform/renesas/vsp1/vsp1_dl.c
> index ad3fa1c9cc737c92870c087dd7cb8cf584fce41b..b8f0398522257f2fb771b419f34b56e59707476b 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_dl.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_dl.c
> @@ -1099,7 +1099,12 @@ struct vsp1_dl_manager *vsp1_dlm_create(struct vsp1_device *vsp1,
>  		return NULL;
>  
>  	dlm->index = index;
> -	dlm->singleshot = vsp1->info->uapi;
> +	/*
> +	 * uapi = single shot mode;
> +	 * DRM = continuous mode;
> +	 * VSPX = single shot mode;
> +	 */
> +	dlm->singleshot = (vsp1->info->uapi || vsp1->iif);

I'm wondering if we should make this a bit more generic, and allow the
caller to select the mode of operation. It could be passed as a flag to
vsp1_dl_list_commit() and stored in the vsp1_dl_list.

There is however no use case at the moment to switch between singleshot
and continuous modes on a per display list basis. Implementing support
for that may be overkill, but on the other hand, the implementation
seems very simple, so it's not a big effort. The main and possibly only
reason why we may not want to do that now is because the display list
helpers haven't been tested to successfully switch between the modes, so
we may falsely advertise something as supported. Despite that, as no
caller would attempt switching, it wouldn't cause an issue.

What do you think ? What do you feel would be cleaner ?

>  	dlm->vsp1 = vsp1;
>  
>  	spin_lock_init(&dlm->lock);

-- 
Regards,

Laurent Pinchart

