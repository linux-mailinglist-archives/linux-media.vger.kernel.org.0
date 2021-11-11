Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE74844D7D6
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 15:08:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233227AbhKKOLM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 09:11:12 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:48426 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232033AbhKKOLL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 09:11:11 -0500
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5848CDEE;
        Thu, 11 Nov 2021 15:08:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1636639701;
        bh=AWoSFL+VrcjJAX13z2PEW+Zkm4nkbu/9r7V55/MUsXo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XJmXRnot8d/qiCrpzr8l5dZEH6+65UIcR10+fqYBHcHnVJVEa7aV6Eq1P9s0GFi8U
         bTD1ke1D0NhBJUxuwxAZDOrNEFqTR/5APdbtMoXdH38Y2Qujt3AQoCgol/N5kQdq+N
         S7Zi8eCHdbH6U1eJKS9vXOtMIuYNjkx2oFtxWmYc=
Date:   Thu, 11 Nov 2021 16:07:59 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH] vb2: warn for or disable the CMA + USERPTR combination
Message-ID: <YY0jv2x0DIAo8i6a@pendragon.ideasonboard.com>
References: <a8932f2c-5342-2cd8-9b98-1db0de756190@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a8932f2c-5342-2cd8-9b98-1db0de756190@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the patch.

On Thu, Nov 11, 2021 at 12:02:52PM +0100, Hans Verkuil wrote:
> If one or more pages of the user-allocated buffer memory were
> allocated in CMA memory, then when the buffer is prepared any
> attempt to pin such pages will fail since user-allocated pages
> in CMA memory are supposed to be moveable, and pinning them in
> place would defeat the purpose of CMA.
> 
> CONFIG_CMA is typically only used with embedded systems, and
> in that case the use of DMABUF is preferred.
> 
> So warn for this combination, and also add a new config option
> to disable USERPTR support altogether if CONFIG_CMA is set.
> 
> I've chosen to put this under a config option since disabling
> it unconditionally might cause userspace breakage.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
> Should USERPTR just be disabled unconditionally if CONFIG_CMA is set?
> Feedback would be welcome.

I've long advocated for deprecating USERPTR (if not universally, at
least in most use cases), so this would be my preference.

> I noticed this issue when testing on a VM instance which had CMA
> set and had 4 GB memory allocated to it. The test-media regression
> test started failing because of this issue. Increasing the memory
> to 16 GB 'solved' it, but that's just papering over the real problem.
> Hence this patch.
> ---
>  drivers/media/common/videobuf2/Kconfig         | 11 +++++++++++
>  .../media/common/videobuf2/videobuf2-core.c    | 18 ++++++++++++++++++
>  2 files changed, 29 insertions(+)
> 
> diff --git a/drivers/media/common/videobuf2/Kconfig b/drivers/media/common/videobuf2/Kconfig
> index d2223a12c95f..d89042cbb5cf 100644
> --- a/drivers/media/common/videobuf2/Kconfig
> +++ b/drivers/media/common/videobuf2/Kconfig
> @@ -7,6 +7,17 @@ config VIDEOBUF2_CORE
>  config VIDEOBUF2_V4L2
>  	tristate
> 
> +config VIDEOBUF2_DISABLE_USERPTR_AND_CMA
> +	bool "Disable use of V4L2 USERPTR streaming if CMA is enabled"
> +	depends on CMA
> +	depends on VIDEOBUF2_V4L2
> +	help
> +	  Say Y here to disable V4L2 USERPTR streaming mode if CMA is enabled.
> +	  If some of the pages of the buffer memory were allocated in CMA memory,
> +	  then attempting to pin those pages in place will fail with an error.
> +
> +	  When in doubt, say N.
> +
>  config VIDEOBUF2_MEMOPS
>  	tristate
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index 2266bbd239ab..17166d4212d0 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -662,6 +662,20 @@ static int __verify_userptr_ops(struct vb2_queue *q)
>  	    !q->mem_ops->put_userptr)
>  		return -EINVAL;
> 
> +#ifdef CONFIG_CMA
> +	/*
> +	 * If one or more pages of the user-allocated buffer memory were
> +	 * allocated in CMA memory, then when the buffer is prepared any
> +	 * attempt to pin such pages will fail since user-allocated pages
> +	 * in CMA memory are supposed to be moveable, and pinning them in
> +	 * place would defeat the purpose of CMA.
> +	 *
> +	 * CONFIG_CMA is typically only used with embedded systems, and
> +	 * in that case the use of DMABUF is preferred.
> +	 */
> +	pr_warn_once("The USERPTR I/O streaming mode is unreliable if CMA is enabled.\n");
> +	pr_warn_once("Use the DMABUF I/O streaming mode instead.\n");
> +#endif
>  	return 0;
>  }
> 
> @@ -2399,6 +2413,10 @@ int vb2_core_queue_init(struct vb2_queue *q)
>  	if (WARN_ON(q->supports_requests && q->min_buffers_needed))
>  		return -EINVAL;
> 
> +#ifdef CONFIG_VIDEOBUF2_DISABLE_USERPTR_AND_CMA
> +	q->io_modes &= ~VB2_USERPTR;
> +#endif
> +
>  	INIT_LIST_HEAD(&q->queued_list);
>  	INIT_LIST_HEAD(&q->done_list);
>  	spin_lock_init(&q->done_lock);

-- 
Regards,

Laurent Pinchart
