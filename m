Return-Path: <linux-media+bounces-35202-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DA739ADF230
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 18:11:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D00C1BC1707
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 16:11:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ACEB2F0032;
	Wed, 18 Jun 2025 16:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="N/jO84hp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1972ED159;
	Wed, 18 Jun 2025 16:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750263090; cv=none; b=NaLxu3DCTcv1q6MzmfSoK26ASZt4Qzt9lEc88Zegn0txLInOzsLM7pfXL8X1vJQZKqvVGHx68m6irJo/EqryZp78/HTmm8FBR9VHvBTdHoYhauBvcCthnV03aIRqRn7Pv2iATkqFeS4T4tBqnRhlMxICjDV4QrJNvsGXKLwfXKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750263090; c=relaxed/simple;
	bh=vIWMG3n/2wjGriOMukJ4NbSZUhwXvQrp6a1oB2WSyGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a/VpkRlknhDbO0IeQfEP9Oa6tHgIkIrOXZZ882TsEXn8OPMHtrYUoiocxJYf4XRrBl88O6xDDPuhtdxxXb2FOgCFj+Z7ym10p2UntbZKkqBdZ9KaPwj7N1yM97Ugtep/7UkVCYCDWuNDi0amXD9MInSLAmKY6X+IgRBQC2/v9uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=N/jO84hp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0E0BE752;
	Wed, 18 Jun 2025 18:11:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750263074;
	bh=vIWMG3n/2wjGriOMukJ4NbSZUhwXvQrp6a1oB2WSyGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N/jO84hpjkLiUnBn4pDPPfzd7C+s18wA65ZSE8GPjyLDSPRyYybNU8W4QlbMM4SWo
	 TR+MH1obh8+QbwP1Yz3E9ZO7MKmxXMagH1b68JSsqoqk7xDG24CLg2DbprrN9O1+wm
	 WntLGAy1uHNIiLJYfQuYpwghr7k7Dmvga3t0lMk0=
Date: Wed, 18 Jun 2025 18:11:23 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH] media: vsp1: Use lockdep assertions to enforce
 documented conventions
Message-ID: <uavxxji4amplptulcligbw2uy64d5tlvx2yscaz2pnqgx5pkwz@rm3ljuui7p3z>
References: <20250618020150.9863-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250618020150.9863-1-laurent.pinchart@ideasonboard.com>

Hi Laurent

On Wed, Jun 18, 2025 at 05:01:49AM +0300, Laurent Pinchart wrote:
> A few functions have documented locking conventions. Documentation is
> nice, but runtime checks are better. Enforce the conventions with
> lockdep assertions.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/vsp1/vsp1_dl.c   | 5 +++++
>  drivers/media/platform/renesas/vsp1/vsp1_pipe.c | 3 +++
>  2 files changed, 8 insertions(+)
>
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_dl.c b/drivers/media/platform/renesas/vsp1/vsp1_dl.c
> index c660f8539ff5..d732b4ed1180 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_dl.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_dl.c
> @@ -10,6 +10,7 @@
>  #include <linux/device.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/gfp.h>
> +#include <linux/lockdep.h>
>  #include <linux/refcount.h>
>  #include <linux/slab.h>
>  #include <linux/workqueue.h>
> @@ -612,6 +613,8 @@ struct vsp1_dl_list *vsp1_dl_list_get(struct vsp1_dl_manager *dlm)
>  	struct vsp1_dl_list *dl = NULL;
>  	unsigned long flags;
>
> +	lockdep_assert_not_held(&dlm->lock);
> +
>  	spin_lock_irqsave(&dlm->lock, flags);
>
>  	if (!list_empty(&dlm->free)) {
> @@ -639,6 +642,8 @@ static void __vsp1_dl_list_put(struct vsp1_dl_list *dl)
>  	if (!dl)
>  		return;
>
> +	lockdep_assert_held(&dl->dlm->lock);
> +

Is it intentional to place this after the !dl check ? Is this to avoid
a lockdep warning in case !dl ?

Anyway
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

>  	/*
>  	 * Release any linked display-lists which were chained for a single
>  	 * hardware operation.
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> index 3cbb768cf6ad..5d769cc42fe1 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> @@ -9,6 +9,7 @@
>
>  #include <linux/delay.h>
>  #include <linux/list.h>
> +#include <linux/lockdep.h>
>  #include <linux/sched.h>
>  #include <linux/wait.h>
>
> @@ -473,6 +474,8 @@ void vsp1_pipeline_run(struct vsp1_pipeline *pipe)
>  {
>  	struct vsp1_device *vsp1 = pipe->output->entity.vsp1;
>
> +	lockdep_assert_held(&pipe->irqlock);
> +
>  	if (pipe->state == VSP1_PIPELINE_STOPPED) {
>  		vsp1_write(vsp1, VI6_CMD(pipe->output->entity.index),
>  			   VI6_CMD_STRCMD);
>
> base-commit: d20469375306163719ee458dd83b7d6c1c93d4d1
> --
> Regards,
>
> Laurent Pinchart
>

