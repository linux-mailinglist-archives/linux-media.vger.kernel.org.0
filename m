Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49057136B04
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2020 11:24:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727364AbgAJKYc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jan 2020 05:24:32 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:49467 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727168AbgAJKYc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jan 2020 05:24:32 -0500
Received: from [IPv6:2001:420:44c1:2577:c967:e1d3:183a:b8ef]
 ([IPv6:2001:420:44c1:2577:c967:e1d3:183a:b8ef])
        by smtp-cloud8.xs4all.net with ESMTPA
        id prSsilw4kpLtbprSviPwG2; Fri, 10 Jan 2020 11:24:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1578651870; bh=oJOruGOI/Y+hFDMsJUJEz5BVUPQc/eBntsATfXiA7PE=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=VZhVtot9C3ctHD3oxwDihsjcC5QhQ/xbXvsqgatFT4cCUe6Z6Mh834QE3pSz0ZyVP
         3r80VIXXOOhuVUgcS3DUyqedx+MrUHXdH/bqKSeRaha+xjoeUhxkt/rRpX/ElfqtiY
         r6PhKgvIXA/L5NFTxayLlYvLjBAs8d4xlaO10nS2wECzWo4EiUDpK3EMFgjBFeut0p
         UjMtuZiVykKinlknbITrDX4kZSwFWR12et/hyJHwJEDGq/hhrKRaquZoMVlNx57rCF
         WcMgDMaqV118cV8drmlQcwZnyqNUADkSSyCzwkeAiWmN6E38gIB2UhmFrjULIvxrzC
         eOD/ieKx2r2AA==
Subject: Re: [RFC][PATCH 02/15] videobuf2: handle V4L2 buffer cache flags
To:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191217032034.54897-1-senozhatsky@chromium.org>
 <20191217032034.54897-3-senozhatsky@chromium.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <ada2381c-2c1c-17c3-c190-48439ae1657a@xs4all.nl>
Date:   Fri, 10 Jan 2020 11:24:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191217032034.54897-3-senozhatsky@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJ0SRNrWZnnf7QXyvMOEx3ymNUl2gdlEC5cFu0Qh9z7JR2EsnbXtT4MJnmLPsM93U135VuGtYRqy04ueiqADgivPuL5CH1GqcOObxBhnN5RcVSm4YQEB
 LnO5iXLq4lrLjOJUubyxLJBaYlSeLc5YJ/3PVVsK41Owz2qkj6jlfka0ocCaL8btdzMZ4TigWRDdnKal2EW8hfGJybgME8bm09fycf2txJNxTgdz7DURVS+4
 /0rmXQXmLm1NSRSjINM9PwX3btxpE5V9D46s0mlRpTbzVtvrXOglspB4VeHyGwb90RF0Kmc5c7Kyuh90Rpa0n3dd9BtO17vYqgfGtfq8tU08gTggyhK4xDCj
 jKoucD4jsLYAs01uISET79ouSsJ0K0m1sDSR/xsUOXajld09NJf2O5X07WBIUrkFvqA7iBMBdC5uGIiiRKJigKS88ciPbRozp6pJhNDSgN20LhtDEL6JXQo9
 eTSrVqkBZYGPLxm/3nNOFvFE1IM0GFXD7T1QDTWiVqQR7wPxMZi9Bw6XpJ+nfxlTKXFaSF9Xtk7H0wPOPCBeLVkg3tWn18ClCxyDdKbRICij/zrW7Np5jHZE
 hh9gfNGBlpgiwDIrVeFqiO+rM48ZWb1GgCG2V+pw4AtpNdhcCcmB/WImtMSBp6JQnfM=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/17/19 4:20 AM, Sergey Senozhatsky wrote:
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

Please combine this patch with patch 13/15!

> 
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  .../media/common/videobuf2/videobuf2-v4l2.c   | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index e652f4318284..2fccfe2a57f8 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -337,6 +337,27 @@ static int vb2_fill_vb2_v4l2_buffer(struct vb2_buffer *vb, struct v4l2_buffer *b
>  	return 0;
>  }
>  
> +static void set_buffer_cache_hints(struct vb2_queue *q,
> +				   struct vb2_buffer *vb,
> +				   struct v4l2_buffer *b)
> +{
> +	vb->need_cache_sync_on_prepare = 1;
> +
> +	if (q->dma_dir != DMA_TO_DEVICE)

What should be done when dma_dir == DMA_BIDIRECTIONAL?

> +		vb->need_cache_sync_on_finish = 1;
> +	else
> +		vb->need_cache_sync_on_finish = 0;
> +
> +	if (!q->allow_cache_hints)
> +		return;
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
> @@ -381,6 +402,7 @@ static int vb2_queue_or_prepare_buf(struct vb2_queue *q, struct media_device *md
>  	}
>  
>  	if (!vb->prepared) {
> +		set_buffer_cache_hints(q, vb, b);
>  		/* Copy relevant information provided by the userspace */
>  		memset(vbuf->planes, 0,
>  		       sizeof(vbuf->planes[0]) * vb->num_planes);
> 

Regards,

	Hans
