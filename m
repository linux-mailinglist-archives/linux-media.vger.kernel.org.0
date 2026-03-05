Return-Path: <linux-media+bounces-54572-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPPpLZ48qWkd3QAAu9opvQ
	(envelope-from <linux-media+bounces-54572-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 09:19:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3208420D5CA
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 09:19:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC0DE30792EC
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 08:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B0FC367F53;
	Thu,  5 Mar 2026 08:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dAIpEvbj"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113E1366DD2;
	Thu,  5 Mar 2026 08:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772698523; cv=none; b=GZYzgraUh0zTlr8E0dAXVYQcItH3VQcfpPfgX4NmlwUnFlOrcs/9iNTDhjInVupVIZUkHtAJglpRfsgqI7d3o6mQiPFr1a8o7s/Z8WQRkki0cF+ZxPpNetjMHuQ8tpy7UjA54e7LOuEH+XPsa4oc/KaRwKDVBHZ9lcN1cG7Lc1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772698523; c=relaxed/simple;
	bh=8KPx2FOKvTSlvcR2tpuaBA7uVSpJ+rhvxD7w+CnbLQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cKTCfu5fYGlTaZuYmTF2/UX0BGez330BAhEh8AMFM1t7EzEKs9H7zpPxTnVcBCq4aZQ34aDT2ad099koYsqBvvbW3HOuCG1x8uYnFq1BINdzOY2j30E6TR+KfJANk3m2yw0bmY/WZLnU7JeUFQ35FNYv5soobSLrAAkSmmwbyc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dAIpEvbj; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772698522; x=1804234522;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8KPx2FOKvTSlvcR2tpuaBA7uVSpJ+rhvxD7w+CnbLQE=;
  b=dAIpEvbjMPEV0XYXMCR3vqZVlpqX/KgB5Xy+P2SSvF/9qg6IidccD29s
   9H+ncyQrWgeeMLHi6DQPNza8HDvgxdzlz60z5eo1xSSTTWwkUZFrYbs1s
   15FK4sVotNz9JBW/DF6d8qlBgmcLi+rd4f8Otf0lYa0yK4Sx7zr14SKA9
   lnVVUPe/7OLfpyiZmbB+lKghf3yGqJOIU95dNgv6tvZfYaxVtstPU+1jd
   TBOxaEYo/wGxcYdZBneDSg78SEd+oh0ZDyEdDpCuekNy4XCN2kcYYI+wm
   kMdCp1MiQrY1DFTeVNTdQwOYc3Efry+tCBIT7lpds36W+CMDor7/Zx5Np
   g==;
X-CSE-ConnectionGUID: VttncGR5TtmeaShx9m9zMA==
X-CSE-MsgGUID: gb0Nck54RfCiEyPky+juUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="76380872"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="76380872"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 00:15:21 -0800
X-CSE-ConnectionGUID: M2KleSAvT7S4HNnQrB642Q==
X-CSE-MsgGUID: wWvAKrerR9a9wcx48XuvSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="218616034"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.65])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 00:15:19 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 99B85120CA3;
	Thu, 05 Mar 2026 10:15:47 +0200 (EET)
Date: Thu, 5 Mar 2026 10:15:47 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bogdan Sandu <bogdanelsandu2011@gmail.com>
Cc: gregkh@linuxfoundation.org, bingbu.cao@intel.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, mchehab@kernel.org,
	tian.shu.qiu@intel.com
Subject: Re: [PATCH v2 1/4] media: ipu3: fix alignment
Message-ID: <aak7s0qFNf4xgNhZ@kekkonen.localdomain>
References: <2026020258-very-numbly-b36b@gregkh>
 <20260202175033.8640-1-bogdanelsandu2011@gmail.com>
 <20260202175033.8640-2-bogdanelsandu2011@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202175033.8640-2-bogdanelsandu2011@gmail.com>
X-Rspamd-Queue-Id: 3208420D5CA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-54572-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.983];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim,kekkonen.localdomain:mid]
X-Rspamd-Action: no action

Hi Bogdan,

On Mon, Feb 02, 2026 at 07:50:30PM +0200, Bogdan Sandu wrote:
> Fix alignment with parentheses.
> 
> Signed-off-by: Bogdan Sandu <bogdanelsandu2011@gmail.com>
> ---
>  drivers/staging/media/ipu3/ipu3-css.c  | 22 +++++++++++-----------
>  drivers/staging/media/ipu3/ipu3-v4l2.c | 11 +++++------
>  drivers/staging/media/ipu3/ipu3.c      |  4 ++--
>  3 files changed, 18 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/staging/media/ipu3/ipu3-css.c b/drivers/staging/media/ipu3/ipu3-css.c
> index 777cac1c2..145501e90 100644
> --- a/drivers/staging/media/ipu3/ipu3-css.c
> +++ b/drivers/staging/media/ipu3/ipu3-css.c
> @@ -118,7 +118,8 @@ static const struct {
>  
>  /* Initialize queue based on given format, adjust format as needed */
>  static int imgu_css_queue_init(struct imgu_css_queue *queue,
> -			       struct v4l2_pix_format_mplane *fmt, u32 flags)
> +			       struct v4l2_pix_format_mplane *fmt,
> +			       u32 flags)

Why?

>  {
>  	struct v4l2_pix_format_mplane *const f = &queue->fmt.mpix;
>  	unsigned int i;
> @@ -1241,6 +1242,7 @@ static int imgu_css_binary_setup(struct imgu_css *css, unsigned int pipe)
>  	css_pipe->aux_frames[IPU3_CSS_AUX_FRAME_REF].height =
>  				ALIGN(css_pipe->rect[IPU3_CSS_RECT_BDS].height,
>  				      IMGU_DVS_BLOCK_H) + 2 * IMGU_GDC_BUF_Y;
> +
>  	h = css_pipe->aux_frames[IPU3_CSS_AUX_FRAME_REF].height;
>  	w = ALIGN(css_pipe->rect[IPU3_CSS_RECT_BDS].width,
>  		  2 * IPU3_UAPI_ISP_VEC_ELEMS) + 2 * IMGU_GDC_BUF_X;
> @@ -1248,10 +1250,9 @@ static int imgu_css_binary_setup(struct imgu_css *css, unsigned int pipe)
>  		css_pipe->aux_frames[IPU3_CSS_AUX_FRAME_REF].bytesperpixel * w;
>  	size = w * h * BYPC + (w / 2) * (h / 2) * BYPC * 2;
>  	for (i = 0; i < IPU3_CSS_AUX_FRAMES; i++)
> -		if (imgu_css_dma_buffer_resize(
> -			imgu,
> -			&css_pipe->aux_frames[IPU3_CSS_AUX_FRAME_REF].mem[i],
> -			size))
> +		if (imgu_css_dma_buffer_resize(imgu,
> +					       &css_pipe->aux_frames[IPU3_CSS_AUX_FRAME_REF].mem[i],
> +					       size))
>  			goto out_of_memory;
>  
>  	/* TNR frames for temporal noise reduction, FRAME_FORMAT_YUV_LINE */
> @@ -1269,10 +1270,9 @@ static int imgu_css_binary_setup(struct imgu_css *css, unsigned int pipe)
>  	h = css_pipe->aux_frames[IPU3_CSS_AUX_FRAME_TNR].height;
>  	size = w * ALIGN(h * 3 / 2 + 3, 2);	/* +3 for vf_pp prefetch */
>  	for (i = 0; i < IPU3_CSS_AUX_FRAMES; i++)
> -		if (imgu_css_dma_buffer_resize(
> -			imgu,
> -			&css_pipe->aux_frames[IPU3_CSS_AUX_FRAME_TNR].mem[i],
> -			size))
> +		if (imgu_css_dma_buffer_resize(imgu,
> +					       &css_pipe->aux_frames[IPU3_CSS_AUX_FRAME_TNR].mem[i],
> +					       size))
>  			goto out_of_memory;
>  
>  	return 0;
> @@ -2036,7 +2036,7 @@ struct imgu_css_buffer *imgu_css_buf_dequeue(struct imgu_css *css)
>  				     struct imgu_css_buffer, list);
>  		if (queue != b->queue ||
>  		    daddr != css_pipe->abi_buffers
> -			[b->queue][b->queue_pos].daddr) {
> +		    [b->queue][b->queue_pos].daddr) {
>  			spin_unlock(&css_pipe->qlock);
>  			dev_err(css->dev, "dequeued bad buffer 0x%x\n", daddr);
>  			return ERR_PTR(-EIO);
> @@ -2169,7 +2169,7 @@ int imgu_css_set_parameters(struct imgu_css *css, unsigned int pipe,
>  		map = imgu_css_pool_last(&css_pipe->pool.acc, 1);
>  		/* user acc */
>  		r = imgu_css_cfg_acc(css, pipe, use, acc, map->vaddr,
> -			set_params ? &set_params->acc_param : NULL);
> +				     set_params ? &set_params->acc_param : NULL);
>  		if (r < 0)
>  			goto fail;
>  	}
> diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
> index 2f6041d34..8ebfcddab 100644
> --- a/drivers/staging/media/ipu3/ipu3-v4l2.c
> +++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
> @@ -245,9 +245,9 @@ static int imgu_subdev_set_selection(struct v4l2_subdev *sd,
>  	struct v4l2_rect *rect;
>  
>  	dev_dbg(&imgu->pci_dev->dev,
> -		 "set subdev %u sel which %u target 0x%4x rect [%ux%u]",
> -		 imgu_sd->pipe, sel->which, sel->target,
> -		 sel->r.width, sel->r.height);
> +		"set subdev %u sel which %u target 0x%4x rect [%ux%u]",
> +		imgu_sd->pipe, sel->which, sel->target,
> +		sel->r.width, sel->r.height);
>  
>  	if (sel->pad != IMGU_NODE_IN)
>  		return -EINVAL;
> @@ -288,7 +288,7 @@ static int imgu_link_setup(struct media_entity *entity,
>  	WARN_ON(pad >= IMGU_NODE_NUM);
>  
>  	dev_dbg(&imgu->pci_dev->dev, "pipe %u pad %u is %s", pipe, pad,
> -		 str_enabled_disabled(flags & MEDIA_LNK_FL_ENABLED));
> +		str_enabled_disabled(flags & MEDIA_LNK_FL_ENABLED));
>  
>  	imgu_pipe = &imgu->imgu_pipe[pipe];
>  	imgu_pipe->nodes[pad].enabled = flags & MEDIA_LNK_FL_ENABLED;
> @@ -303,7 +303,7 @@ static int imgu_link_setup(struct media_entity *entity,
>  		__clear_bit(pipe, imgu->css.enabled_pipes);
>  
>  	dev_dbg(&imgu->pci_dev->dev, "pipe %u is %s", pipe,
> -		 str_enabled_disabled(flags & MEDIA_LNK_FL_ENABLED));
> +		str_enabled_disabled(flags & MEDIA_LNK_FL_ENABLED));
>  
>  	return 0;
>  }
> @@ -750,7 +750,6 @@ static int imgu_fmt(struct imgu_device *imgu, unsigned int pipe, int node,
>  		} else {
>  			fmts[i] = &imgu_pipe->nodes[inode].vdev_fmt.fmt.pix_mp;
>  		}
> -
>  	}
>  
>  	if (!try) {
> diff --git a/drivers/staging/media/ipu3/ipu3.c b/drivers/staging/media/ipu3/ipu3.c
> index bdf5a4577..c33186208 100644
> --- a/drivers/staging/media/ipu3/ipu3.c
> +++ b/drivers/staging/media/ipu3/ipu3.c
> @@ -151,7 +151,7 @@ static int imgu_dummybufs_init(struct imgu_device *imgu, unsigned int pipe)
>  
>  /* May be called from atomic context */
>  static struct imgu_css_buffer *imgu_dummybufs_get(struct imgu_device *imgu,
> -						   int queue, unsigned int pipe)
> +						  int queue, unsigned int pipe)
>  {
>  	unsigned int i;
>  	struct imgu_media_pipe *imgu_pipe = &imgu->imgu_pipe[pipe];
> @@ -774,7 +774,7 @@ static int __maybe_unused imgu_suspend(struct device *dev)
>  	synchronize_irq(pci_dev->irq);
>  	/* Wait until all buffers in CSS are done. */
>  	if (!wait_event_timeout(imgu->buf_drain_wq,
> -	    imgu_css_queue_empty(&imgu->css), msecs_to_jiffies(1000)))
> +				imgu_css_queue_empty(&imgu->css), msecs_to_jiffies(1000)))
>  		dev_err(dev, "wait buffer drain timeout.\n");
>  
>  	imgu_css_stop_streaming(&imgu->css);

-- 
Regards,

Sakari Ailus

