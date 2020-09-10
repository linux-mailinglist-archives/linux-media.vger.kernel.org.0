Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 229C226430B
	for <lists+linux-media@lfdr.de>; Thu, 10 Sep 2020 11:59:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730326AbgIJJ6v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Sep 2020 05:58:51 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:40971 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730585AbgIJJ5Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Sep 2020 05:57:16 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id GJKKkZ7LRPTBMGJKLkQjEX; Thu, 10 Sep 2020 11:57:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1599731833; bh=Pjm09VRMHAwXWG/kn+Ca+AdZepmnLrRLLzgFezfvBAk=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=rvdAnCfAhAqz8g834UriS1/zLRYWyal/U5rSMvQdO4jBOwXiezX2X3sU7SJuaNKtu
         ggr8NWAJ6dYojYxq1kJWdARBCRMzcyDVLQNEViYa7l4XykUmQjuRztUlE9DMpSxGrC
         b3vky4jmU0w3x+LVKTaocbm4pODvmvhUSGuRMHVm/m+Ueb0oCJ4ycVATYE/1NS14P4
         Iifbmr+5P7VbxkfWx8O3LWGeQuedCWte2yPiiFq431tTitosMmQ0R9xP/kjWs79luL
         cVcW9tj3fCOb1E0s1NoPRiLcbMOp8FIdJmEgXn+o/57QEFolmcm3u30icnvpYm9g58
         +dCJQfPIKzy+Q==
Subject: Re: [PATCH 05/28] media/v4l2: remove V4L2-FLAG-MEMORY-NON-CONSISTENT
To:     Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
References: <20200819135454.GA17098@lst.de>
 <CAAFQd5BuXP7t3d-Rwft85j=KTyXq7y4s24mQxLr=VoY9krEGZw@mail.gmail.com>
 <20200820044347.GA4533@lst.de> <20200820052004.GA5305@lst.de>
 <CAAFQd5CFiA2WBaaPQ9ezvMjYZfNw37c42UEy9Pk7kJyCi1mLzQ@mail.gmail.com>
 <20200820165407.GD12693@lst.de>
 <CAAFQd5D=NzgjosB51-O_cH27a8V6CPgCfaPSfHHz7nKJPbazgg@mail.gmail.com>
 <20200901110617.GA13232@lst.de>
 <CAAFQd5CmPVSxmZJVn7HnNUn8srZbAbnfzpNMYw3KcDzn7xD2cg@mail.gmail.com>
 <CAAFQd5BDh05DNPShr54opY2GyY-FcH7g8=V2t4xBwz0OwRu9xQ@mail.gmail.com>
 <20200910094921.GB97481@google.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <f92991e1-e0d7-69ca-9541-1546bb139dd3@xs4all.nl>
Date:   Thu, 10 Sep 2020 11:57:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200910094921.GB97481@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfIQ2qMJezgcQCm9DR+Wi0ZCirorfLLmWhi2ok5hOy7wsZrWpeXGm9ksinIhRxjrxf7V/aEQhfo+cqGr7TBVOeY9yXbAXtLs6dyUp2FbUvKt3JnSjg401
 b5ypH54XtrQtb5wgqraR/JljbRtFumGizVCE5+hKFWkYbtSOh80JNx0ZKfhJ3nMRxNqWFFqyACOFVHvLsU/le8r+7Nj8nWCLquy5qd6rF8udM3XQ5mVxrpN5
 s16bm2NXpah+J8kSW0VINCg428/+D9F/zLJv1WGhdE0mYwo+MPRgT+GNTzyQNC5SPhjqkTHGGdRBnAVlenvdZI8DycmpmPWzdEqQFJ7v1QZq5XVj577oGOAu
 A68ZzK+YE5m5oedqeYwgWYH8Gql1eOFohji2mzdeRCjy1Wy5frjhiseK7hoesVIK6134+Rlp27SBSxNAI23/833Wkf5vksiZxq5EFuHhqnKp1Za03TdO0CNb
 9Ft07715YvW4pFiT
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/09/2020 11:49, Sergey Senozhatsky wrote:
> Hi,
> 
> On (20/09/08 23:58), Tomasz Figa wrote:
>>
>> Given the above, we would like to make changes that affect the UAPI.
>> Would you still be able to revert this series?
>>
> 
> If we want to apply only "media/v4l2: remove V4L2-FLAG-MEMORY-NON-CONSISTENT"
> patch and keep the rest of the buffer cache hints series in the kernel, then
> I'd add one or two more patches. We don't need ->flags argument in
> create_bufs() and reqbufs() functions, that argument was introduced in order
> to pass in the requested coherency flag.
> 
> 
> Now.
> 
> Then we have a question - do we need flags member in struct
> v4l2_requestbuffers and v4l2_create_buffers or shall we just
> return back those 4 bytes to reserved[]? We pass BUF_FLAG_NO_CACHE_INVALIDATE
> and V4L2_BUF_FLAG_NO_CACHE_SYNC in struct v4l2_buffer.flags.

Drop the now unused flags member in v4l2_requestbuffers and v4l2_create_buffers.

> 
> If we decide to remove v4l2_requestbuffers and v4l2_create_buffers ->flags,
> then we also need to rollback documentation changes.

Correct.

> 
> Then we need to change CLEAR_AFTER_FIELD(foo, capabilities) in
> v4l2-ioctl to zero out reserved[] areas in v4l2_requestbuffers
> and v4l2_create_buffers. I think v4l2_create_buffers is fine,
> but requstbuffers has flags and reversed[1] in the union so for
> requestbuffers we simply removed the CLEAR_AFTER_FIELD() and
> hence dropped the corresponding check from v4l-compliance.
> 
> So, do we plan on using .flags in v4l2_requestbuffers and
> v4l2_create_buffers?

Perhaps, but this patch is meant to revert *all* changes relating to
V4L2_FLAG_MEMORY_NON_CONSISTENT. We don't want to have unused fields
in the public API.

Regards,

	Hans

> 
> 
> - create_bufs()/reqbufs() flags argument removal patch
> (no struct-s/documentation cleanup yet).
> 
> ====8<====
> Subject: [PATCH] remove redundant flags argument
> 
> ---
>  drivers/media/common/videobuf2/videobuf2-core.c | 10 +++++-----
>  drivers/media/common/videobuf2/videobuf2-v4l2.c |  6 ++----
>  include/media/videobuf2-core.h                  |  6 ++----
>  3 files changed, 9 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index 66a41cef33c1..4eab6d81cce1 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -722,7 +722,7 @@ int vb2_verify_memory_type(struct vb2_queue *q,
>  EXPORT_SYMBOL(vb2_verify_memory_type);
>  
>  int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
> -		     unsigned int flags, unsigned int *count)
> +		     unsigned int *count)
>  {
>  	unsigned int num_buffers, allocated_buffers, num_planes = 0;
>  	unsigned plane_sizes[VB2_MAX_PLANES] = { };
> @@ -861,7 +861,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
>  EXPORT_SYMBOL_GPL(vb2_core_reqbufs);
>  
>  int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
> -			 unsigned int flags, unsigned int *count,
> +			 unsigned int *count,
>  			 unsigned int requested_planes,
>  			 const unsigned int requested_sizes[])
>  {
> @@ -2547,7 +2547,7 @@ static int __vb2_init_fileio(struct vb2_queue *q, int read)
>  	fileio->memory = VB2_MEMORY_MMAP;
>  	fileio->type = q->type;
>  	q->fileio = fileio;
> -	ret = vb2_core_reqbufs(q, fileio->memory, 0, &fileio->count);
> +	ret = vb2_core_reqbufs(q, fileio->memory, &fileio->count);
>  	if (ret)
>  		goto err_kfree;
>  
> @@ -2604,7 +2604,7 @@ static int __vb2_init_fileio(struct vb2_queue *q, int read)
>  
>  err_reqbufs:
>  	fileio->count = 0;
> -	vb2_core_reqbufs(q, fileio->memory, 0, &fileio->count);
> +	vb2_core_reqbufs(q, fileio->memory, &fileio->count);
>  
>  err_kfree:
>  	q->fileio = NULL;
> @@ -2624,7 +2624,7 @@ static int __vb2_cleanup_fileio(struct vb2_queue *q)
>  		vb2_core_streamoff(q, q->type);
>  		q->fileio = NULL;
>  		fileio->count = 0;
> -		vb2_core_reqbufs(q, fileio->memory, 0, &fileio->count);
> +		vb2_core_reqbufs(q, fileio->memory, &fileio->count);
>  		kfree(fileio);
>  		dprintk(q, 3, "file io emulator closed\n");
>  	}
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index d2879f53455b..96d3b2b2aa31 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -728,8 +728,7 @@ int vb2_reqbufs(struct vb2_queue *q, struct v4l2_requestbuffers *req)
>  	int ret = vb2_verify_memory_type(q, req->memory, req->type);
>  
>  	fill_buf_caps(q, &req->capabilities);
> -	return ret ? ret : vb2_core_reqbufs(q, req->memory,
> -					    req->flags, &req->count);
> +	return ret ? ret : vb2_core_reqbufs(q, req->memory, &req->count);
>  }
>  EXPORT_SYMBOL_GPL(vb2_reqbufs);
>  
> @@ -804,7 +803,6 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
>  		if (requested_sizes[i] == 0)
>  			return -EINVAL;
>  	return ret ? ret : vb2_core_create_bufs(q, create->memory,
> -						create->flags,
>  						&create->count,
>  						requested_planes,
>  						requested_sizes);
> @@ -993,7 +991,7 @@ int vb2_ioctl_reqbufs(struct file *file, void *priv,
>  		return res;
>  	if (vb2_queue_is_busy(vdev, file))
>  		return -EBUSY;
> -	res = vb2_core_reqbufs(vdev->queue, p->memory, p->flags, &p->count);
> +	res = vb2_core_reqbufs(vdev->queue, p->memory, &p->count);
>  	/* If count == 0, then the owner has released all buffers and he
>  	   is no longer owner of the queue. Otherwise we have a new owner. */
>  	if (res == 0)
> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
> index 4c7f25b07e93..bbb3f26fbde9 100644
> --- a/include/media/videobuf2-core.h
> +++ b/include/media/videobuf2-core.h
> @@ -744,7 +744,6 @@ void vb2_core_querybuf(struct vb2_queue *q, unsigned int index, void *pb);
>   * vb2_core_reqbufs() - Initiate streaming.
>   * @q:		pointer to &struct vb2_queue with videobuf2 queue.
>   * @memory:	memory type, as defined by &enum vb2_memory.
> - * @flags:	auxiliary queue/buffer management flags.
>   * @count:	requested buffer count.
>   *
>   * Videobuf2 core helper to implement VIDIOC_REQBUF() operation. It is called
> @@ -769,13 +768,12 @@ void vb2_core_querybuf(struct vb2_queue *q, unsigned int index, void *pb);
>   * Return: returns zero on success; an error code otherwise.
>   */
>  int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
> -		    unsigned int flags, unsigned int *count);
> +		    unsigned int *count);
>  
>  /**
>   * vb2_core_create_bufs() - Allocate buffers and any required auxiliary structs
>   * @q: pointer to &struct vb2_queue with videobuf2 queue.
>   * @memory: memory type, as defined by &enum vb2_memory.
> - * @flags: auxiliary queue/buffer management flags.
>   * @count: requested buffer count.
>   * @requested_planes: number of planes requested.
>   * @requested_sizes: array with the size of the planes.
> @@ -793,7 +791,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
>   * Return: returns zero on success; an error code otherwise.
>   */
>  int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
> -			 unsigned int flags, unsigned int *count,
> +			 unsigned int *count,
>  			 unsigned int requested_planes,
>  			 const unsigned int requested_sizes[]);
>  
> 

