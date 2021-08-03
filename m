Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69BF53DE7FC
	for <lists+linux-media@lfdr.de>; Tue,  3 Aug 2021 10:10:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234344AbhHCIKd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Aug 2021 04:10:33 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:36117 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234238AbhHCIKc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 3 Aug 2021 04:10:32 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id ApVDmT2IWXTlcApVEmkLTz; Tue, 03 Aug 2021 10:10:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1627978221; bh=FBUpuGVdHdipZbKQBlJmDYs9Xj5eIoTrrjzgo4mwn5M=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Q1q3YISDsSP9cPWEILits+Naedtnz52s5z8eJYNUYUsVEGKvzMYIcHnhRsoxGNoPV
         Bg3zP1X2jE8sNc81in64hCSg2MBkfSAvTESqLxDgBqk4h4QijjH78FDFV65hqq18MB
         u7HX5FI0k6ArMOGPidDnwaBsBT796vTrt95ZBnhHut/zxuRyQr7Ge8zgInEM4XJmy3
         Znp+oBgluQxvjj1XRr4pXF9PWG85GaE+PD8syyotoo0ZO8I48wd2v4uU8VfirGhbQ4
         9E/i7LKgPic2ZxkiA+0JE/Ejujye4YSBG3l3H5l63J+Nhe1ICmc88tDu6f8M+5SiKM
         uG0gd01qSbZAQ==
Subject: Re: [PATCHv4 3/8] videobuf2: split buffer cache_hints initialisation
To:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210727070517.443167-1-senozhatsky@chromium.org>
 <20210727070517.443167-4-senozhatsky@chromium.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <148b9d78-7515-eb1d-7e38-f8e1052d057c@xs4all.nl>
Date:   Tue, 3 Aug 2021 10:10:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210727070517.443167-4-senozhatsky@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfAM8DtLkuo6DSTPrzhg2tMxhW0MV0AdYHvNAMZY4vIUVFXQO9r48ZAgAF/+sxipxnZ/OVPK5FEh03unA/59iKPaajVDb3iTY8ze24vYlGDp/2srw095K
 eJHCtUYiUK13znbujQVCDLzwOZlF0XrkBxk01TphRg2sDb2k2pVdLm2RSulzIJsXwTURjQQ7DY5bpKfUUGvndUvj068E0roarim33PvpSNEE5OF6+DA/yGZk
 3yYgdZfXzdMzwewGQ4a+m4Oz286Gw8X1RTo9dguPDdmVUo37kFyPHyFsv0actcGaUb2mEVWngkFGmBFVQ8wWlkbzp6jURzkfe8puJpK6ZiMO6mUwt7X988rz
 kDrDSeoWi/KsPysUHLgQeAEXXgEMB3sEqe/UNGnvp3gP4jMN+KzCwpbYgl1EbP8MeKoSW/5aewVabVKeY3mtJLwD8PkdB+bVGqWIJRRzoM8T+EsoJB3nYJpm
 sIdN2eOiLZFhvdUfBQRhQKAlws64f2UlZO34oTeoknzJxYSqb03G38jN2CqiTXy2RLuuFQ2HAJmE6DfI
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27/07/2021 09:05, Sergey Senozhatsky wrote:
> V4L2 is not the perfect place to manage vb2 buffer cache hints.
> It works for V4L2 users, but there are backends that use vb2 core

use -> use the

> and don't use V4L2. Factor buffer cache hints init and call it

Factor? You mean Refactor?

Regards,

	Hans

> when we allocate vb2 buffer.
> 
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  .../media/common/videobuf2/videobuf2-core.c   | 22 +++++++++++++++++++
>  .../media/common/videobuf2/videobuf2-v4l2.c   | 18 ---------------
>  2 files changed, 22 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index 23e41fec9880..76210c006958 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -382,6 +382,27 @@ static void __setup_offsets(struct vb2_buffer *vb)
>  	}
>  }
>  
> +static void init_buffer_cache_hints(struct vb2_queue *q, struct vb2_buffer *vb)
> +{
> +	/*
> +	 * DMA exporter should take care of cache syncs, so we can avoid
> +	 * explicit ->prepare()/->finish() syncs. For other ->memory types
> +	 * we always need ->prepare() or/and ->finish() cache sync.
> +	 */
> +	if (q->memory == VB2_MEMORY_DMABUF) {
> +		vb->skip_cache_sync_on_finish = 1;
> +		vb->skip_cache_sync_on_prepare = 1;
> +		return;
> +	}
> +
> +	/*
> +	 * ->finish() cache sync can be avoided when queue direction is
> +	 * TO_DEVICE.
> +	 */
> +	if (q->dma_dir == DMA_TO_DEVICE)
> +		vb->skip_cache_sync_on_finish = 1;
> +}
> +
>  /*
>   * __vb2_queue_alloc() - allocate videobuf buffer structures and (for MMAP type)
>   * video buffer memory for all buffers/planes on the queue and initializes the
> @@ -415,6 +436,7 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
>  		vb->index = q->num_buffers + buffer;
>  		vb->type = q->type;
>  		vb->memory = memory;
> +		init_buffer_cache_hints(q, vb);
>  		for (plane = 0; plane < num_planes; ++plane) {
>  			vb->planes[plane].length = plane_sizes[plane];
>  			vb->planes[plane].min_length = plane_sizes[plane];
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index 454d58268602..2fbae9bd7b52 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -345,17 +345,6 @@ static void set_buffer_cache_hints(struct vb2_queue *q,
>  				   struct vb2_buffer *vb,
>  				   struct v4l2_buffer *b)
>  {
> -	/*
> -	 * DMA exporter should take care of cache syncs, so we can avoid
> -	 * explicit ->prepare()/->finish() syncs. For other ->memory types
> -	 * we always need ->prepare() or/and ->finish() cache sync.
> -	 */
> -	if (q->memory == VB2_MEMORY_DMABUF) {
> -		vb->skip_cache_sync_on_finish = 1;
> -		vb->skip_cache_sync_on_prepare = 1;
> -		return;
> -	}
> -
>  	if (!vb2_queue_allows_cache_hints(q)) {
>  		/*
>  		 * Clear buffer cache flags if queue does not support user
> @@ -367,13 +356,6 @@ static void set_buffer_cache_hints(struct vb2_queue *q,
>  		return;
>  	}
>  
> -	/*
> -	 * ->finish() cache sync can be avoided when queue direction is
> -	 * TO_DEVICE.
> -	 */
> -	if (q->dma_dir == DMA_TO_DEVICE)
> -		vb->skip_cache_sync_on_finish = 1;
> -
>  	if (b->flags & V4L2_BUF_FLAG_NO_CACHE_INVALIDATE)
>  		vb->skip_cache_sync_on_finish = 1;
>  
> 

