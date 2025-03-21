Return-Path: <linux-media+bounces-28562-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8B4A6BA35
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 12:59:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38F604871E8
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 11:59:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E145F2253E8;
	Fri, 21 Mar 2025 11:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sM23YSNb"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA671E7C27;
	Fri, 21 Mar 2025 11:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742558377; cv=none; b=SJMeS1qvhIyukFx3OGWmDV+zFAtbegtno4MKdXha/EeK17qXTcm8d+SoIlB0FozmjNavXhk/oinFn6P/KwAHXU+rtetDDCE/f4oU+8/TwSUHj72WPhFZZyxxp7F04XS+drbqvtVUhoyvm6PeRvbifYXOAqFFOADr8r4kdW6GAX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742558377; c=relaxed/simple;
	bh=oGvz3k8LBIe38TPWT/uh0M30dGfNLtDrv3HQTfczeXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L5qSqbHvrHaXYoS0OvukHoVR6g4NFqNNzGYyi5QUb6Repp5tPSkBpum5vrKFwxi6BjHRSmetJAr5XjRnmUEUn4l2Z56SqAg6CiFVg2FR5+uJO7BYxBK9pmOAAARq2eyMb3BKBcAxyCUtc1h/uoL3Msj2bdMTPgMNVi3PQz4d76o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sM23YSNb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [157.231.223.213])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6143EF6;
	Fri, 21 Mar 2025 12:57:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742558269;
	bh=oGvz3k8LBIe38TPWT/uh0M30dGfNLtDrv3HQTfczeXg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sM23YSNbNPdKBs0as59XVRS6bBNOhOkBbs56mabpZz/6GoYzO9T3gEsD13j9vmXf5
	 4+OzD7AmHejIrOoi7Z5KT/Mk7q/WqiRpQWmXM9OEImu2Ne0XH+Vhr4McTHgiQA2iEG
	 l/NgC9J7cY8tyfu1it+ELvUo8Rsjovf6OLMiL0OM=
Date: Fri, 21 Mar 2025 13:59:11 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 4/7] media: vsp1: wpf: Propagate vsp1_rwpf_init_ctrls()
Message-ID: <20250321115911.GA1752@pendragon.ideasonboard.com>
References: <20250319-v4h-iif-v5-0-0a10456d792c@ideasonboard.com>
 <20250319-v4h-iif-v5-4-0a10456d792c@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250319-v4h-iif-v5-4-0a10456d792c@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Wed, Mar 19, 2025 at 12:28:17PM +0100, Jacopo Mondi wrote:
> vsp1_wpf.c calls vsp1_rwpf_init_ctrls() to initialize controls that
> are common between RPF and WPF.
> 
> However, the vsp1_wpf.c implementation does not check for the function
> call return value. Fix this by propagating to the caller the return
> value.
> 
> While at it, drop a duplicated error message in wpf_init_controls() as
> the caller already report it.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> 
> ---
> v2->v3:
>   - New patch
> ---
>  drivers/media/platform/renesas/vsp1/vsp1_wpf.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
> index f176750ccd9847fdb8d51f7f51a6bd5092b70197..da651a882bbb7e4d58f2dfea9dcea60a41f4f79c 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
> @@ -133,6 +133,7 @@ static int wpf_init_controls(struct vsp1_rwpf *wpf)
>  {
>  	struct vsp1_device *vsp1 = wpf->entity.vsp1;
>  	unsigned int num_flip_ctrls;
> +	int ret;
>  
>  	spin_lock_init(&wpf->flip.lock);
>  
> @@ -156,7 +157,9 @@ static int wpf_init_controls(struct vsp1_rwpf *wpf)
>  		num_flip_ctrls = 0;
>  	}
>  
> -	vsp1_rwpf_init_ctrls(wpf, num_flip_ctrls);
> +	ret = vsp1_rwpf_init_ctrls(wpf, num_flip_ctrls);
> +	if (ret < 0)
> +		return ret;
>  
>  	if (num_flip_ctrls >= 1) {
>  		wpf->flip.ctrls.vflip =
> @@ -174,11 +177,8 @@ static int wpf_init_controls(struct vsp1_rwpf *wpf)
>  		v4l2_ctrl_cluster(3, &wpf->flip.ctrls.vflip);
>  	}
>  
> -	if (wpf->ctrls.error) {
> -		dev_err(vsp1->dev, "wpf%u: failed to initialize controls\n",
> -			wpf->entity.index);
> +	if (wpf->ctrls.error)
>  		return wpf->ctrls.error;
> -	}
>  
>  	return 0;
>  }

-- 
Regards,

Laurent Pinchart

