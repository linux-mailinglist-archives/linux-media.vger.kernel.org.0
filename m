Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7E73163E84
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2020 09:07:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727277AbgBSIHS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Feb 2020 03:07:18 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:52911 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726645AbgBSIHR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Feb 2020 03:07:17 -0500
Received: from [192.168.2.10] ([46.9.235.248])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 4KO0jz8rdP9a94KO3jnHDi; Wed, 19 Feb 2020 09:07:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1582099636; bh=4JszDvEP0ShkvbT7hmQQt4q+fEGdViCdhbC3vRlO4Zc=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=J38HY+0WBneQ44VTT0ydJAh7tKoDCurI75R2Yed5X3wSgFtGJ7LOIEtbFgZ0tn3b0
         Lqc3oWtItD82z1/UKatuw2brs5iUpjoZbyHfKn86OfVdKNYKkfsP7TpX+AMpB2maJ3
         kz4grIBnOwVLKhXUcqeKfLJlmqhxEeOAhPNFk4xbekOB5vR/3EvNMUEHyrJ2Htstw2
         RQ7Z46RMEzuAXX5H3d7o7KT9S498GjqF9ELEut+LU/iUpfD2Z/Vd6fO2TMWk1tPvxg
         pF1Pwm+h/96DlRZj5ar5ZOHHam1HgyOrjNVbcwwPyuvxE2ZWPHZjj0ZB/R4lyRDOxQ
         dv+vYxHShNnuA==
Subject: Re: [RFC][PATCHv2 02/12] videobuf2: handle V4L2 buffer cache flags
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
References: <20200204025641.218376-1-senozhatsky@chromium.org>
 <20200204025641.218376-3-senozhatsky@chromium.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <be430540-4b8e-6b44-1eee-9d7291a365be@xs4all.nl>
Date:   Wed, 19 Feb 2020 09:07:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200204025641.218376-3-senozhatsky@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDMh8ro/1Ej3uCr/B88xs9QSf1DQj6Cz3VMN0DFqayPtMFym6D6tk98LH/aCi2Bh25lrowBe6aZX7dTPe86vpCs33hxqiTaRY23yNDv1ipIaD+E93owU
 PdL6uUcLJA73sbKrM25qdpXV+42++eaA2z/wRCGInSmivia/wXNEW6K75Rtil9FnkP7G3q6eaFbx22n8YNeBhYIEvZATKgYBDZhG5Ng6nKEQ8Z37zKWexEJr
 XxKM3sMO43CXniSwceC+XIX/7c+JJmpllLk7XbGq+EEKB1cRi9JAI1i3AubHcjEdM8eWFkAylshmrHQvezK67wCh8MPGCurUlQbqXMTf7ITVvDXYdjp9rUi+
 gwhe2AT6CYdI3uJU752G7+Xkug/ozKOOgL+U3G9taERMMnRbvsH1Z3VArLq2A76jpjNT6KX60BfCzL4j6RIAjHBf0UQITr5aohD/QosDOkEeG3cNEOx9awcj
 caSQ3XZAxqikyQefmaOvlmw+NgyKEOWX9RhQPKZ5w4A8Owp5x8XyGdJd1TRxe5fHIGj/A1CBRfj0R71b
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2/4/20 3:56 AM, Sergey Senozhatsky wrote:
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
> 
> Change-Id: I3bef1d1fb93a5fba290ce760eaeecdc8e7d6885a
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  .../media/common/videobuf2/videobuf2-v4l2.c   | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index eb5d5db96552..2da06a2ad6c4 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -337,6 +337,41 @@ static int vb2_fill_vb2_v4l2_buffer(struct vb2_buffer *vb, struct v4l2_buffer *b
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
> +	if (!q->allow_cache_hints)
> +		return;
> +
> +	vb->need_cache_sync_on_prepare = 1;

This needs a comment explaining why prepare is set to 1 by default. I remember
we discussed this earlier, and the conclusion of that discussion needs to be
documented here in a comment.

Regards,

	Hans

> +	/*
> +	 * ->finish() cache sync can be avoided when queue direction is
> +	 * TO_DEVICE.
> +	 */
> +	if (q->dma_dir != DMA_TO_DEVICE)
> +		vb->need_cache_sync_on_finish = 1;
> +	else
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
> @@ -381,6 +416,7 @@ static int vb2_queue_or_prepare_buf(struct vb2_queue *q, struct media_device *md
>  	}
>  
>  	if (!vb->prepared) {
> +		set_buffer_cache_hints(q, vb, b);
>  		/* Copy relevant information provided by the userspace */
>  		memset(vbuf->planes, 0,
>  		       sizeof(vbuf->planes[0]) * vb->num_planes);
> 

