Return-Path: <linux-media+bounces-18013-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D6B971D5A
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 17:00:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F56A284CDD
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 15:00:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86EDC1BC077;
	Mon,  9 Sep 2024 14:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ggMVu3RU"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FC21BC06C
	for <linux-media@vger.kernel.org>; Mon,  9 Sep 2024 14:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725893999; cv=none; b=V41w94aDAtIBYhjw4izjciqegHsuDP6IsnRdRjt/lK1DCrN8W8LKgEmNOjpNqiGoXTqZPmR+FME9EtyuNItJ/fGI0q/MNrJbQPiaT6YlMD3/67uGdCPgfdfzlj6mZPnBoxz+wYpKKxn2rctC+BCiThzCetbLmuywSDIo7Kqddpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725893999; c=relaxed/simple;
	bh=K1fMnUPpTaCvzxNZSnkNdTE9+6/II6i4fiZ7YllTMrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WUJTzH+MqEfiu6icUJxcYZW57V8C9ikw90h19rVeuv2JLP/W9bCM6GTsuCOeMxWui4aQ/qdsjYXFyhHto8h/l2U0RKg7UyjNlfN+SrMhXxIVKjoObXJxVLPJR4VWt9Fq5o0Tw+LJ6YeiGhE/OjmrElqPDmYRShgu1JwvIkWusJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ggMVu3RU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (213-229-8-243.static.upcbusiness.at [213.229.8.243])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 00E265A4;
	Mon,  9 Sep 2024 16:58:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725893920;
	bh=K1fMnUPpTaCvzxNZSnkNdTE9+6/II6i4fiZ7YllTMrc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ggMVu3RU5TRe3jeKhBngBOYH/UId4B8dUGjFaR1lv0AjERxa7Uyzdnm+JzFkBM8+O
	 LGv/r2l1om8jMZMkouE7DsWY8kcYKIGwR4KYnDcw4sBVsdB2OHRGj0C+8zVLqgW4or
	 E7zBQKAabNmQjx9PWbVlDZr9+wHtC4wPPxixSN7Q=
Date: Mon, 9 Sep 2024 17:59:53 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH 8/9] media: vb2: vb2_core_queue_init(): sanity check lock
 and wait_prepare/finish
Message-ID: <20240909145953.GH27525@pendragon.ideasonboard.com>
References: <cover.1725285495.git.hverkuil-cisco@xs4all.nl>
 <8eb606d30e33ccee7256a329f9d4a31793864e29.1725285495.git.hverkuil-cisco@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8eb606d30e33ccee7256a329f9d4a31793864e29.1725285495.git.hverkuil-cisco@xs4all.nl>

Hi Hans,

Thank you for the patch.

On Mon, Sep 02, 2024 at 04:04:54PM +0200, Hans Verkuil wrote:
> Add two new checks:
> 
> 1) wait_prepare and wait_finish callbacks are either both present or
>    both unset, you can't mix.
> 2) if lock == NULL, then wait_prepare (and due to check 1 also
>    wait_finish) must be present.
> 
> These checks should prevent the case where lock == NULL, but there
> is no way to release/reacquire whatever lock is used when waiting
> for a buffer to arrive in VIDIOC_DQBUF.

Don't we use the video_device lock when the queue lock is NULL ?
Shouldn't it be valid to not set wait_prepare and wait_finish in that
case ?

> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/media/common/videobuf2/videobuf2-core.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index 29a8d876e6c2..6335ac7b771a 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -2644,6 +2644,14 @@ int vb2_core_queue_init(struct vb2_queue *q)
>  	if (WARN_ON(q->min_reqbufs_allocation > q->max_num_buffers))
>  		return -EINVAL;
>  
> +	/* Either both or none are set */
> +	if (WARN_ON(!q->ops->wait_prepare ^ !q->ops->wait_finish))
> +		return -EINVAL;
> +
> +	/* Warn if q->lock is NULL and no custom wait_prepare is provided */
> +	if (WARN_ON(!q->lock && !q->ops->wait_prepare))
> +		return -EINVAL;
> +
>  	INIT_LIST_HEAD(&q->queued_list);
>  	INIT_LIST_HEAD(&q->done_list);
>  	spin_lock_init(&q->done_lock);

-- 
Regards,

Laurent Pinchart

