Return-Path: <linux-media+bounces-27296-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8FEA4B1F2
	for <lists+linux-media@lfdr.de>; Sun,  2 Mar 2025 14:45:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6EF73B27A2
	for <lists+linux-media@lfdr.de>; Sun,  2 Mar 2025 13:45:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCC441E5B99;
	Sun,  2 Mar 2025 13:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cP+sYxWh"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E79F9D6;
	Sun,  2 Mar 2025 13:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740923137; cv=none; b=YHV6o3c+TlkzkFmgSluqa1blyYRRoDgUxTMtsUW1LijFUp0Vm5wIvOGHq8kPmEv40525Tg51ad12V/bqVb+GIV2VmejI0nbXH3s+Z4NMskYOZQE17Hpx8qs/Icyvl1Iz0nArO2v/1pzOWQiNmVztwY+CtkER591wmt7lGSzxgTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740923137; c=relaxed/simple;
	bh=swg6YPFj75Nito2CmQSzJEfb6kLZRpqxXA0gjW50tXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PAD3vWENn94v4XCMZqUvodPPdhXBxlOOysmhAKOmx9BYdFA4XswvN2KZ0dRNoCPc7qk1JoOVj2fynVxtyYxx/dSHqp0bHKFFzP0pXb8SVoXyPO9UbFdMn8XbBvCkJ3+ZMk7DEADARBWpLzyO9OfU34rguvCSC1f458+vQfgOpjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cP+sYxWh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9A215670;
	Sun,  2 Mar 2025 14:44:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740923043;
	bh=swg6YPFj75Nito2CmQSzJEfb6kLZRpqxXA0gjW50tXE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cP+sYxWhq5fwzhIXobjiFVg1Deyk4EQ7SdsAwBaTGOL47AaPbFsRDOg702IVtAE0U
	 8TeBNmXX/LQwZQYfAh9ol/kVNgyKxHc+ZHJh5fWr5UAHfDpgJJ4iOYlXxyAdAZPiqR
	 EVZ52skssNgzZeVPggPRWW06FlX3NCTWZcqW6ZCc=
Date: Sun, 2 Mar 2025 15:45:16 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v2 3/6] media: vsp1: dl: Use singleshot DL for VSPX
Message-ID: <20250302134516.GK18557@pendragon.ideasonboard.com>
References: <20250224-v4h-iif-v2-0-0305e3c1fe2d@ideasonboard.com>
 <20250224-v4h-iif-v2-3-0305e3c1fe2d@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250224-v4h-iif-v2-3-0305e3c1fe2d@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Mon, Feb 24, 2025 at 09:19:43PM +0100, Jacopo Mondi wrote:
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
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
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

Drop the parentheses.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  	dlm->vsp1 = vsp1;
>  
>  	spin_lock_init(&dlm->lock);

-- 
Regards,

Laurent Pinchart

