Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B748D17168A
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2020 12:59:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728929AbgB0L6v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Feb 2020 06:58:51 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:49011 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728885AbgB0L6u (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Feb 2020 06:58:50 -0500
Received: from [IPv6:2001:420:44c1:2577:70b8:9d46:3264:f0c0]
 ([IPv6:2001:420:44c1:2577:70b8:9d46:3264:f0c0])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 7HoTjDkGNjmHT7HoWjiQjC; Thu, 27 Feb 2020 12:58:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1582804729; bh=ufyecWgBir3OvsxDwSOymkjuvFJ7p9wVW3aJhPqXCwM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Mp5LnjLsizSSSdD/IcAAnqxzeBRqCV3+bRsfjHNJfDBCyCltxugQfMQpAM6afFolJ
         5w1RThuphABDeutNLceRrB60sKTES0jJvue8xPeHnkEYqCBWmFDt20Z5Rkowgv4DiU
         MerubgmTxA2PKL58rzbVLiUTEbnReXjFZQqPFJQeFcLQfsiOXqEWhO796hjT4rLRk3
         BIEGtFV4qdTUl/9Y7KnKq/BxqWLv6tbt2ThzilTl+jsAdz+ot3iuVZph34aB9S36qr
         H7ptf6WVphsUCryHSTyaqnAlBv0MDH+U81iz2SQ8CIh6vyD+bliEniGCvnYZUyDHmp
         CWNg9vtAJ5VyA==
Subject: Re: [PATCHv3 02/11] videobuf2: handle V4L2 buffer cache flags
To:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200226111529.180197-1-senozhatsky@chromium.org>
 <20200226111529.180197-3-senozhatsky@chromium.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <8f48a4ab-8b8f-576d-9493-bfce7d01224d@xs4all.nl>
Date:   Thu, 27 Feb 2020 12:58:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200226111529.180197-3-senozhatsky@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJG9E6IkDFdsS/VYMUSbG1ehaUk+qklqcOiOi//1zrtbaWM1N55DH158sF686dZg9Z61y4C4gei7KZszu1kcImrPBbWAmn/cA3PR/B1qHA2KgZ4cN7lW
 S/w6Q4sJ/a5TikX7nZkVSpFd6/MgKSIEZ6DOiazqXDDRdiXCtE6ng9w9t8/g4ootBZRu3D9iLYGRs4cRo5LlZ9kuabi5Z32ezXoUODFpyV+8UO3cxtwfNWIT
 +Bawp4auK/ibu1PTZvaU2iRfBsdh2cb1hZnjq6O9g1QW8wuaz2vkK2mbXGmSPHPTyXJvmbMWFamwsOGhfdGKSaQ0ZDtz+AZkRlv9yYTiJrZlLy8YXMLnURZL
 YEJaIpfRn8Ig9l0VcMrC8GXZij1NQS7uOGNQuTGRv9wpr2wClPmaIKyl/y+kPDMLvFSaJIWCF5W1Yxb9R/5YswAQHKxQc+6aIPUjZZylkjUjVqU+Q/iPmIEF
 +SPbupIcFyAdU2+qb5OrdHoi5SlQlDSbUtu5a/wGz0E9w6YmmyjdAwvZ6C6ddhLLkOAOy/HuLONJbM+JPQhLHVYApEIzPNFijEbm4cVtc3a6WwLC/SeeQAeF
 eam81GpG5Tx1gI+dV4PEoX8HvFyHP7jtyyAZD4P4euXjfwggmfEaUBLteCDXkfsQ8t0=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2/26/20 12:15 PM, Sergey Senozhatsky wrote:
> Set video buffer cache management flags corresponding to V4L2 cache
> flags.
> 
> Both ->prepare() and ->finish() cache management hints should be
> passed during this stage (buffer preparation), because there is no
> other way for user-space to skip ->finish() cache flush.
> 
> There are two possible alternative approaches:
> - The first one is to move cache sync from ->finish() to dqbuf().
>   But this breaks some drivers, that need to fix-up buffers before
>   dequeueing them.
> 
> - The second one is to move ->finish() call from ->done() to dqbuf.

It's not clear what the purpose is of describing these alternative approaches.
I'd just drop that. It's a bit confusing.

> 
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  .../media/common/videobuf2/videobuf2-v4l2.c   | 49 +++++++++++++++++++
>  include/media/videobuf2-core.h                | 11 +++++
>  2 files changed, 60 insertions(+)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index eb5d5db96552..2a604bd7793a 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -199,6 +199,15 @@ static int vb2_fill_vb2_v4l2_buffer(struct vb2_buffer *vb, struct v4l2_buffer *b
>  	vbuf->request_fd = -1;
>  	vbuf->is_held = false;
>  
> +	/*
> +	 * Clear buffer cache flags if queue does not support user space hints.
> +	 * That's to indicate to userspace that these flags won't work.
> +	 */
> +	if (!vb2_queue_allows_cache_hints(q)) {
> +		b->flags &= ~V4L2_BUF_FLAG_NO_CACHE_INVALIDATE;
> +		b->flags &= ~V4L2_BUF_FLAG_NO_CACHE_CLEAN;
> +	}
> +
>  	if (V4L2_TYPE_IS_MULTIPLANAR(b->type)) {
>  		switch (b->memory) {
>  		case VB2_MEMORY_USERPTR:
> @@ -337,6 +346,45 @@ static int vb2_fill_vb2_v4l2_buffer(struct vb2_buffer *vb, struct v4l2_buffer *b
>  	return 0;
>  }
>  
> +static void set_buffer_cache_hints(struct vb2_queue *q,
> +				   struct vb2_buffer *vb,
> +				   struct v4l2_buffer *b)
> +{
> +	/*
> +	 * DMA exporter should take care of cache syncs, so we can avoid
> +	 * explicit ->prepare()/->finish() syncs. For other ->memory types
> +	 * we always need ->prepare() or/and ->finish() cache sync.
> +	 */
> +	if (q->memory == VB2_MEMORY_DMABUF) {
> +		vb->need_cache_sync_on_finish = 0;
> +		vb->need_cache_sync_on_prepare = 0;
> +		return;
> +	}
> +
> +	/*
> +	 * Cache sync/invalidation flags are set by default in order to
> +	 * preserve existing behaviour for old apps/drivers.
> +	 */
> +	vb->need_cache_sync_on_prepare = 1;
> +	vb->need_cache_sync_on_finish = 1;
> +
> +	if (!vb2_queue_allows_cache_hints(q))
> +		return;
> +
> +	/*
> +	 * ->finish() cache sync can be avoided when queue direction is
> +	 * TO_DEVICE.
> +	 */
> +	if (q->dma_dir == DMA_TO_DEVICE)
> +		vb->need_cache_sync_on_finish = 0;
> +
> +	if (b->flags & V4L2_BUF_FLAG_NO_CACHE_INVALIDATE)
> +		vb->need_cache_sync_on_finish = 0;
> +
> +	if (b->flags & V4L2_BUF_FLAG_NO_CACHE_CLEAN)
> +		vb->need_cache_sync_on_prepare = 0;
> +}
> +
>  static int vb2_queue_or_prepare_buf(struct vb2_queue *q, struct media_device *mdev,
>  				    struct v4l2_buffer *b, bool is_prepare,
>  				    struct media_request **p_req)
> @@ -381,6 +429,7 @@ static int vb2_queue_or_prepare_buf(struct vb2_queue *q, struct media_device *md
>  	}
>  
>  	if (!vb->prepared) {
> +		set_buffer_cache_hints(q, vb, b);
>  		/* Copy relevant information provided by the userspace */
>  		memset(vbuf->planes, 0,
>  		       sizeof(vbuf->planes[0]) * vb->num_planes);
> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
> index 4a19170672ac..d307869bfb15 100644
> --- a/include/media/videobuf2-core.h
> +++ b/include/media/videobuf2-core.h
> @@ -632,6 +632,17 @@ struct vb2_queue {
>  #endif
>  };
>  
> +/**
> + * vb2_queue_allows_cache_hints() - Return true if the queue allows cache
> + * and memory consistency hints.
> + *
> + * @q:		pointer to &struct vb2_queue with videobuf2 queue
> + */
> +static inline bool vb2_queue_allows_cache_hints(struct vb2_queue *q)
> +{
> +	return (q->allow_cache_hints != 0) && (q->memory == VB2_MEMORY_MMAP);

Simply to:

	return q->allow_cache_hints && q->memory == VB2_MEMORY_MMAP;

Regards,

	Hans

> +}
> +
>  /**
>   * vb2_plane_vaddr() - Return a kernel virtual address of a given plane.
>   * @vb:		pointer to &struct vb2_buffer to which the plane in
> 

