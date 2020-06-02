Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F9261EB8E1
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2020 11:52:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbgFBJvz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jun 2020 05:51:55 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:48275 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726139AbgFBJvy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Jun 2020 05:51:54 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id g3aFjWeMdCKzeg3aIjIdIB; Tue, 02 Jun 2020 11:51:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1591091512; bh=rbS5BwZABjDn6ZQb04atYwsKFjjjmIjIMi4MB3uaqmg=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=pJQn5zDpx582MBsb/DYJlUnMfz08QZq9mHxdad1lT2CismDuKKnGtkv5SZuuzoDcG
         3d83F9arLIFR7MaUyGDlliOu4r9ekzjy1TF0CzGa2GeuZOuUVaYPwln1XThbcK78VX
         ADfMh5mEtobHwJHCOlN5PbI5IjXthOztH5EujMaw7FMFTg5gYS/lb6yw+520ZL71Md
         DKt+Wxc6JX4YeSyO9Y5Ju3Lnh0vRkz4rO9mwPtkcpUcOhC4nZu8jqYDfZYypXpi6DX
         zoAtV0o9DuuB5Ga4hqjtMn+KDvD49iH5XkHPEbZLbPa8Ovi7XOmrSQu/Wm0e8BsPLE
         OHjQiArvpyWuQ==
Subject: Re: [PATCH v6 03/14] videobuf2: handle V4L2 buffer cache flags
To:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
References: <20200514160153.3646-1-sergey.senozhatsky@gmail.com>
 <20200514160153.3646-4-sergey.senozhatsky@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <b34ae09b-7c20-7255-6adc-3370680555cd@xs4all.nl>
Date:   Tue, 2 Jun 2020 11:51:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200514160153.3646-4-sergey.senozhatsky@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfD+Blikn96SaJGYXgMKqTTgl+zDvKJpnFo2EnVkbPy2CqEIGFInNvj39m6Xn9VMPomeg18zifi96xVg1btmcv5qyP6g+7NIKRI3iQEL5c2IOOhA4yy8r
 tZA5UNA25vCZM3YIYyNXVjUjAKR4jRrCUeQ3Ixh1hsm4lbA2J6zfDpaYXOYLeeRpFtjEdXLhuaecwujjPDXVIjmZvU+YarwzUpkIMYIM/jvJn1dlhuTtwYk3
 acwkk7qKYgdb/8RKZyr4SMDOq28MlT17uEcJYT3hIKTGVL9RVnnNgDkT3N45Xe4ZvkXh2j5tyqPXhL6TF3ESMl8auH4qF4je+eBpr7aI6DtjKz4Ph9uHp/rP
 39FL2EkRuqGVpdniP0+ucRNOIef+5gfRLL3kNwa9RIfHB/f4kvI=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sergey,

While doing final testing for this patch series (together with the v4l-utils patch)
I found one remaining issue:

On 14/05/2020 18:01, Sergey Senozhatsky wrote:
> From: Sergey Senozhatsky <senozhatsky@chromium.org>
> 
> Set video buffer cache management flags corresponding to V4L2 cache
> flags.
> 
> Both ->prepare() and ->finish() cache management hints should be
> passed during this stage (buffer preparation), because there is
> no other way for user-space to tell V4L2 to avoid ->finish() cache
> flush.
> 
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  .../media/common/videobuf2/videobuf2-v4l2.c   | 48 +++++++++++++++++++
>  include/media/videobuf2-core.h                | 11 +++++
>  2 files changed, 59 insertions(+)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index eb5d5db96552..f13851212cc8 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -337,6 +337,53 @@ static int vb2_fill_vb2_v4l2_buffer(struct vb2_buffer *vb, struct v4l2_buffer *b
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
> +	if (!vb2_queue_allows_cache_hints(q)) {
> +		/*
> +		 * Clear buffer cache flags if queue does not support user
> +		 * space hints. That's to indicate to userspace that these
> +		 * flags won't work.
> +		 */
> +		b->flags &= ~V4L2_BUF_FLAG_NO_CACHE_INVALIDATE;
> +		b->flags &= ~V4L2_BUF_FLAG_NO_CACHE_CLEAN;
> +		return;
> +	}

These two flags need to be cleared for VB2_MEMORY_DMABUF as well in the test above.
This bug is causing v4l2-compliance failures (use the test-media script in contrib/test
in v4l-utils: 'sudo test-media vim2m').

It's enough to post a v6.1 for this patch, everything else is fine.

Regards,

	Hans

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
> @@ -381,6 +428,7 @@ static int vb2_queue_or_prepare_buf(struct vb2_queue *q, struct media_device *md
>  	}
>  
>  	if (!vb->prepared) {
> +		set_buffer_cache_hints(q, vb, b);
>  		/* Copy relevant information provided by the userspace */
>  		memset(vbuf->planes, 0,
>  		       sizeof(vbuf->planes[0]) * vb->num_planes);
> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
> index 7f39d9fffc8c..ccc5c498d3e3 100644
> --- a/include/media/videobuf2-core.h
> +++ b/include/media/videobuf2-core.h
> @@ -635,6 +635,17 @@ struct vb2_queue {
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
> +	return q->allow_cache_hints && q->memory == VB2_MEMORY_MMAP;
> +}
> +
>  /**
>   * vb2_plane_vaddr() - Return a kernel virtual address of a given plane.
>   * @vb:		pointer to &struct vb2_buffer to which the plane in
> 

