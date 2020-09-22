Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBE6E27436B
	for <lists+linux-media@lfdr.de>; Tue, 22 Sep 2020 15:42:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726576AbgIVNmj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 09:42:39 -0400
Received: from verein.lst.de ([213.95.11.211]:44716 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726473AbgIVNmj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 09:42:39 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 2A85167373; Tue, 22 Sep 2020 15:42:36 +0200 (CEST)
Date:   Tue, 22 Sep 2020 15:42:35 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: [git:media_tree/fixes] media: media/v4l2: remove
 V4L2_FLAG_MEMORY_NON_CONSISTENT flag
Message-ID: <20200922134235.GA22620@lst.de>
References: <E1kHoRT-009OMF-AW@www.linuxtv.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1kHoRT-009OMF-AW@www.linuxtv.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Sep 14, 2020 at 01:28:06PM +0000, Mauro Carvalho Chehab wrote:
> This is an automatic generated email to let you know that the following patch were queued:

did you intend to get this into Linus tree before 5.9?  I just checked
and didn't see it in mainline yet.

> 
> Subject: media: media/v4l2: remove V4L2_FLAG_MEMORY_NON_CONSISTENT flag
> Author:  Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
> Date:    Fri Sep 11 05:07:58 2020 +0200
> 
> The patch partially reverts some of the UAPI bits of the buffer
> cache management hints. Namely, the queue consistency (memory
> coherency) user-space hint because, as it turned out, the kernel
> implementation of this feature was misusing DMA_ATTR_NON_CONSISTENT.
> 
> The patch reverts both kernel and user space parts: removes the
> DMA consistency attr functions, rolls back changes to v4l2_requestbuffers,
> v4l2_create_buffers structures and corresponding UAPI functions
> (plus compat32 layer) and cleans up the documentation.
> 
> [hverkuil: fixed a few typos in the commit log]
> [hverkuil: fixed vb2_core_reqbufs call in drivers/media/dvb-core/dvb_vb2.c]
> [mchehab: fixed a typo in the commit log: revers->reverts]
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> 
>  Documentation/userspace-api/media/v4l/buffer.rst   | 17 --------
>  .../userspace-api/media/v4l/vidioc-create-bufs.rst |  6 +--
>  .../userspace-api/media/v4l/vidioc-reqbufs.rst     | 12 +-----
>  drivers/media/common/videobuf2/videobuf2-core.c    | 46 +++-------------------
>  .../media/common/videobuf2/videobuf2-dma-contig.c  | 19 ---------
>  drivers/media/common/videobuf2/videobuf2-dma-sg.c  |  3 +-
>  drivers/media/common/videobuf2/videobuf2-v4l2.c    | 18 +--------
>  drivers/media/dvb-core/dvb_vb2.c                   |  2 +-
>  drivers/media/v4l2-core/v4l2-compat-ioctl32.c      | 10 +----
>  drivers/media/v4l2-core/v4l2-ioctl.c               |  5 ++-
>  include/media/videobuf2-core.h                     |  7 +---
>  include/uapi/linux/videodev2.h                     | 13 +-----
>  12 files changed, 23 insertions(+), 135 deletions(-)
> 
> ---
> 
> diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Documentation/userspace-api/media/v4l/buffer.rst
> index 57e752aaf414..2044ed13cd9d 100644
> --- a/Documentation/userspace-api/media/v4l/buffer.rst
> +++ b/Documentation/userspace-api/media/v4l/buffer.rst
> @@ -701,23 +701,6 @@ Memory Consistency Flags
>      :stub-columns: 0
>      :widths:       3 1 4
>  
> -    * .. _`V4L2-FLAG-MEMORY-NON-CONSISTENT`:
> -
> -      - ``V4L2_FLAG_MEMORY_NON_CONSISTENT``
> -      - 0x00000001
> -      - A buffer is allocated either in consistent (it will be automatically
> -	coherent between the CPU and the bus) or non-consistent memory. The
> -	latter can provide performance gains, for instance the CPU cache
> -	sync/flush operations can be avoided if the buffer is accessed by the
> -	corresponding device only and the CPU does not read/write to/from that
> -	buffer. However, this requires extra care from the driver -- it must
> -	guarantee memory consistency by issuing a cache flush/sync when
> -	consistency is needed. If this flag is set V4L2 will attempt to
> -	allocate the buffer in non-consistent memory. The flag takes effect
> -	only if the buffer is used for :ref:`memory mapping <mmap>` I/O and the
> -	queue reports the :ref:`V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS
> -	<V4L2-BUF-CAP-SUPPORTS-MMAP-CACHE-HINTS>` capability.
> -
>  .. c:type:: v4l2_memory
>  
>  enum v4l2_memory
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst b/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst
> index f2a702870fad..12cf6b44f414 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst
> @@ -120,13 +120,9 @@ than the number requested.
>  	If you want to just query the capabilities without making any
>  	other changes, then set ``count`` to 0, ``memory`` to
>  	``V4L2_MEMORY_MMAP`` and ``format.type`` to the buffer type.
> -    * - __u32
> -      - ``flags``
> -      - Specifies additional buffer management attributes.
> -	See :ref:`memory-flags`.
>  
>      * - __u32
> -      - ``reserved``\ [6]
> +      - ``reserved``\ [7]
>        - A place holder for future extensions. Drivers and applications
>  	must set the array to zero.
>  
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
> index 75d894d9c36c..0e3e2fde65e8 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
> @@ -112,17 +112,10 @@ aborting or finishing any DMA in progress, an implicit
>  	``V4L2_MEMORY_MMAP`` and ``type`` set to the buffer type. This will
>  	free any previously allocated buffers, so this is typically something
>  	that will be done at the start of the application.
> -    * - union {
> -      - (anonymous)
> -    * - __u32
> -      - ``flags``
> -      - Specifies additional buffer management attributes.
> -	See :ref:`memory-flags`.
>      * - __u32
>        - ``reserved``\ [1]
> -      - Kept for backwards compatibility. Use ``flags`` instead.
> -    * - }
> -      -
> +      - A place holder for future extensions. Drivers and applications
> +	must set the array to zero.
>  
>  .. tabularcolumns:: |p{6.1cm}|p{2.2cm}|p{8.7cm}|
>  
> @@ -169,7 +162,6 @@ aborting or finishing any DMA in progress, an implicit
>        - This capability is set by the driver to indicate that the queue supports
>          cache and memory management hints. However, it's only valid when the
>          queue is used for :ref:`memory mapping <mmap>` streaming I/O. See
> -        :ref:`V4L2_FLAG_MEMORY_NON_CONSISTENT <V4L2-FLAG-MEMORY-NON-CONSISTENT>`,
>          :ref:`V4L2_BUF_FLAG_NO_CACHE_INVALIDATE <V4L2-BUF-FLAG-NO-CACHE-INVALIDATE>` and
>          :ref:`V4L2_BUF_FLAG_NO_CACHE_CLEAN <V4L2-BUF-FLAG-NO-CACHE-CLEAN>`.
>  
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index f544d3393e9d..4eab6d81cce1 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -721,39 +721,14 @@ int vb2_verify_memory_type(struct vb2_queue *q,
>  }
>  EXPORT_SYMBOL(vb2_verify_memory_type);
>  
> -static void set_queue_consistency(struct vb2_queue *q, bool consistent_mem)
> -{
> -	q->dma_attrs &= ~DMA_ATTR_NON_CONSISTENT;
> -
> -	if (!vb2_queue_allows_cache_hints(q))
> -		return;
> -	if (!consistent_mem)
> -		q->dma_attrs |= DMA_ATTR_NON_CONSISTENT;
> -}
> -
> -static bool verify_consistency_attr(struct vb2_queue *q, bool consistent_mem)
> -{
> -	bool queue_is_consistent = !(q->dma_attrs & DMA_ATTR_NON_CONSISTENT);
> -
> -	if (consistent_mem != queue_is_consistent) {
> -		dprintk(q, 1, "memory consistency model mismatch\n");
> -		return false;
> -	}
> -	return true;
> -}
> -
>  int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
> -		     unsigned int flags, unsigned int *count)
> +		     unsigned int *count)
>  {
>  	unsigned int num_buffers, allocated_buffers, num_planes = 0;
>  	unsigned plane_sizes[VB2_MAX_PLANES] = { };
> -	bool consistent_mem = true;
>  	unsigned int i;
>  	int ret;
>  
> -	if (flags & V4L2_FLAG_MEMORY_NON_CONSISTENT)
> -		consistent_mem = false;
> -
>  	if (q->streaming) {
>  		dprintk(q, 1, "streaming active\n");
>  		return -EBUSY;
> @@ -765,8 +740,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
>  	}
>  
>  	if (*count == 0 || q->num_buffers != 0 ||
> -	    (q->memory != VB2_MEMORY_UNKNOWN && q->memory != memory) ||
> -	    !verify_consistency_attr(q, consistent_mem)) {
> +	    (q->memory != VB2_MEMORY_UNKNOWN && q->memory != memory)) {
>  		/*
>  		 * We already have buffers allocated, so first check if they
>  		 * are not in use and can be freed.
> @@ -803,7 +777,6 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
>  	num_buffers = min_t(unsigned int, num_buffers, VB2_MAX_FRAME);
>  	memset(q->alloc_devs, 0, sizeof(q->alloc_devs));
>  	q->memory = memory;
> -	set_queue_consistency(q, consistent_mem);
>  
>  	/*
>  	 * Ask the driver how many buffers and planes per buffer it requires.
> @@ -888,18 +861,14 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
>  EXPORT_SYMBOL_GPL(vb2_core_reqbufs);
>  
>  int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
> -			 unsigned int flags, unsigned int *count,
> +			 unsigned int *count,
>  			 unsigned int requested_planes,
>  			 const unsigned int requested_sizes[])
>  {
>  	unsigned int num_planes = 0, num_buffers, allocated_buffers;
>  	unsigned plane_sizes[VB2_MAX_PLANES] = { };
> -	bool consistent_mem = true;
>  	int ret;
>  
> -	if (flags & V4L2_FLAG_MEMORY_NON_CONSISTENT)
> -		consistent_mem = false;
> -
>  	if (q->num_buffers == VB2_MAX_FRAME) {
>  		dprintk(q, 1, "maximum number of buffers already allocated\n");
>  		return -ENOBUFS;
> @@ -912,15 +881,12 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
>  		}
>  		memset(q->alloc_devs, 0, sizeof(q->alloc_devs));
>  		q->memory = memory;
> -		set_queue_consistency(q, consistent_mem);
>  		q->waiting_for_buffers = !q->is_output;
>  	} else {
>  		if (q->memory != memory) {
>  			dprintk(q, 1, "memory model mismatch\n");
>  			return -EINVAL;
>  		}
> -		if (!verify_consistency_attr(q, consistent_mem))
> -			return -EINVAL;
>  	}
>  
>  	num_buffers = min(*count, VB2_MAX_FRAME - q->num_buffers);
> @@ -2581,7 +2547,7 @@ static int __vb2_init_fileio(struct vb2_queue *q, int read)
>  	fileio->memory = VB2_MEMORY_MMAP;
>  	fileio->type = q->type;
>  	q->fileio = fileio;
> -	ret = vb2_core_reqbufs(q, fileio->memory, 0, &fileio->count);
> +	ret = vb2_core_reqbufs(q, fileio->memory, &fileio->count);
>  	if (ret)
>  		goto err_kfree;
>  
> @@ -2638,7 +2604,7 @@ static int __vb2_init_fileio(struct vb2_queue *q, int read)
>  
>  err_reqbufs:
>  	fileio->count = 0;
> -	vb2_core_reqbufs(q, fileio->memory, 0, &fileio->count);
> +	vb2_core_reqbufs(q, fileio->memory, &fileio->count);
>  
>  err_kfree:
>  	q->fileio = NULL;
> @@ -2658,7 +2624,7 @@ static int __vb2_cleanup_fileio(struct vb2_queue *q)
>  		vb2_core_streamoff(q, q->type);
>  		q->fileio = NULL;
>  		fileio->count = 0;
> -		vb2_core_reqbufs(q, fileio->memory, 0, &fileio->count);
> +		vb2_core_reqbufs(q, fileio->memory, &fileio->count);
>  		kfree(fileio);
>  		dprintk(q, 3, "file io emulator closed\n");
>  	}
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> index ec3446cc45b8..7b1b86ec942d 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> @@ -42,11 +42,6 @@ struct vb2_dc_buf {
>  	struct dma_buf_attachment	*db_attach;
>  };
>  
> -static inline bool vb2_dc_buffer_consistent(unsigned long attr)
> -{
> -	return !(attr & DMA_ATTR_NON_CONSISTENT);
> -}
> -
>  /*********************************************/
>  /*        scatterlist table functions        */
>  /*********************************************/
> @@ -341,13 +336,6 @@ static int
>  vb2_dc_dmabuf_ops_begin_cpu_access(struct dma_buf *dbuf,
>  				   enum dma_data_direction direction)
>  {
> -	struct vb2_dc_buf *buf = dbuf->priv;
> -	struct sg_table *sgt = buf->dma_sgt;
> -
> -	if (vb2_dc_buffer_consistent(buf->attrs))
> -		return 0;
> -
> -	dma_sync_sg_for_cpu(buf->dev, sgt->sgl, sgt->nents, buf->dma_dir);
>  	return 0;
>  }
>  
> @@ -355,13 +343,6 @@ static int
>  vb2_dc_dmabuf_ops_end_cpu_access(struct dma_buf *dbuf,
>  				 enum dma_data_direction direction)
>  {
> -	struct vb2_dc_buf *buf = dbuf->priv;
> -	struct sg_table *sgt = buf->dma_sgt;
> -
> -	if (vb2_dc_buffer_consistent(buf->attrs))
> -		return 0;
> -
> -	dma_sync_sg_for_device(buf->dev, sgt->sgl, sgt->nents, buf->dma_dir);
>  	return 0;
>  }
>  
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> index 0a40e00f0d7e..a86fce5d8ea8 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> @@ -123,8 +123,7 @@ static void *vb2_dma_sg_alloc(struct device *dev, unsigned long dma_attrs,
>  	/*
>  	 * NOTE: dma-sg allocates memory using the page allocator directly, so
>  	 * there is no memory consistency guarantee, hence dma-sg ignores DMA
> -	 * attributes passed from the upper layer. That means that
> -	 * V4L2_FLAG_MEMORY_NON_CONSISTENT has no effect on dma-sg buffers.
> +	 * attributes passed from the upper layer.
>  	 */
>  	buf->pages = kvmalloc_array(buf->num_pages, sizeof(struct page *),
>  				    GFP_KERNEL | __GFP_ZERO);
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index 30caad27281e..cfe197df970d 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -722,22 +722,12 @@ static void fill_buf_caps(struct vb2_queue *q, u32 *caps)
>  #endif
>  }
>  
> -static void clear_consistency_attr(struct vb2_queue *q,
> -				   int memory,
> -				   unsigned int *flags)
> -{
> -	if (!q->allow_cache_hints || memory != V4L2_MEMORY_MMAP)
> -		*flags &= ~V4L2_FLAG_MEMORY_NON_CONSISTENT;
> -}
> -
>  int vb2_reqbufs(struct vb2_queue *q, struct v4l2_requestbuffers *req)
>  {
>  	int ret = vb2_verify_memory_type(q, req->memory, req->type);
>  
>  	fill_buf_caps(q, &req->capabilities);
> -	clear_consistency_attr(q, req->memory, &req->flags);
> -	return ret ? ret : vb2_core_reqbufs(q, req->memory,
> -					    req->flags, &req->count);
> +	return ret ? ret : vb2_core_reqbufs(q, req->memory, &req->count);
>  }
>  EXPORT_SYMBOL_GPL(vb2_reqbufs);
>  
> @@ -769,7 +759,6 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
>  	unsigned i;
>  
>  	fill_buf_caps(q, &create->capabilities);
> -	clear_consistency_attr(q, create->memory, &create->flags);
>  	create->index = q->num_buffers;
>  	if (create->count == 0)
>  		return ret != -EBUSY ? ret : 0;
> @@ -813,7 +802,6 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
>  		if (requested_sizes[i] == 0)
>  			return -EINVAL;
>  	return ret ? ret : vb2_core_create_bufs(q, create->memory,
> -						create->flags,
>  						&create->count,
>  						requested_planes,
>  						requested_sizes);
> @@ -998,12 +986,11 @@ int vb2_ioctl_reqbufs(struct file *file, void *priv,
>  	int res = vb2_verify_memory_type(vdev->queue, p->memory, p->type);
>  
>  	fill_buf_caps(vdev->queue, &p->capabilities);
> -	clear_consistency_attr(vdev->queue, p->memory, &p->flags);
>  	if (res)
>  		return res;
>  	if (vb2_queue_is_busy(vdev, file))
>  		return -EBUSY;
> -	res = vb2_core_reqbufs(vdev->queue, p->memory, p->flags, &p->count);
> +	res = vb2_core_reqbufs(vdev->queue, p->memory, &p->count);
>  	/* If count == 0, then the owner has released all buffers and he
>  	   is no longer owner of the queue. Otherwise we have a new owner. */
>  	if (res == 0)
> @@ -1021,7 +1008,6 @@ int vb2_ioctl_create_bufs(struct file *file, void *priv,
>  
>  	p->index = vdev->queue->num_buffers;
>  	fill_buf_caps(vdev->queue, &p->capabilities);
> -	clear_consistency_attr(vdev->queue, p->memory, &p->flags);
>  	/*
>  	 * If count == 0, then just check if memory and type are valid.
>  	 * Any -EBUSY result from vb2_verify_memory_type can be mapped to 0.
> diff --git a/drivers/media/dvb-core/dvb_vb2.c b/drivers/media/dvb-core/dvb_vb2.c
> index 959d110407a4..6974f1731529 100644
> --- a/drivers/media/dvb-core/dvb_vb2.c
> +++ b/drivers/media/dvb-core/dvb_vb2.c
> @@ -342,7 +342,7 @@ int dvb_vb2_reqbufs(struct dvb_vb2_ctx *ctx, struct dmx_requestbuffers *req)
>  
>  	ctx->buf_siz = req->size;
>  	ctx->buf_cnt = req->count;
> -	ret = vb2_core_reqbufs(&ctx->vb_q, VB2_MEMORY_MMAP, 0, &req->count);
> +	ret = vb2_core_reqbufs(&ctx->vb_q, VB2_MEMORY_MMAP, &req->count);
>  	if (ret) {
>  		ctx->state = DVB_VB2_STATE_NONE;
>  		dprintk(1, "[%s] count=%d size=%d errno=%d\n", ctx->name,
> diff --git a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> index 593bcf6c3735..a99e82ec9ab6 100644
> --- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> +++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> @@ -246,9 +246,6 @@ struct v4l2_format32 {
>   * @memory:	buffer memory type
>   * @format:	frame format, for which buffers are requested
>   * @capabilities: capabilities of this buffer type.
> - * @flags:	additional buffer management attributes (ignored unless the
> - *		queue has V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS capability and
> - *		configured for MMAP streaming I/O).
>   * @reserved:	future extensions
>   */
>  struct v4l2_create_buffers32 {
> @@ -257,8 +254,7 @@ struct v4l2_create_buffers32 {
>  	__u32			memory;	/* enum v4l2_memory */
>  	struct v4l2_format32	format;
>  	__u32			capabilities;
> -	__u32			flags;
> -	__u32			reserved[6];
> +	__u32			reserved[7];
>  };
>  
>  static int __bufsize_v4l2_format(struct v4l2_format32 __user *p32, u32 *size)
> @@ -359,8 +355,7 @@ static int get_v4l2_create32(struct v4l2_create_buffers __user *p64,
>  {
>  	if (!access_ok(p32, sizeof(*p32)) ||
>  	    copy_in_user(p64, p32,
> -			 offsetof(struct v4l2_create_buffers32, format)) ||
> -	    assign_in_user(&p64->flags, &p32->flags))
> +			 offsetof(struct v4l2_create_buffers32, format)))
>  		return -EFAULT;
>  	return __get_v4l2_format32(&p64->format, &p32->format,
>  				   aux_buf, aux_space);
> @@ -422,7 +417,6 @@ static int put_v4l2_create32(struct v4l2_create_buffers __user *p64,
>  	    copy_in_user(p32, p64,
>  			 offsetof(struct v4l2_create_buffers32, format)) ||
>  	    assign_in_user(&p32->capabilities, &p64->capabilities) ||
> -	    assign_in_user(&p32->flags, &p64->flags) ||
>  	    copy_in_user(p32->reserved, p64->reserved, sizeof(p64->reserved)))
>  		return -EFAULT;
>  	return __put_v4l2_format32(&p64->format, &p32->format);
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index e3a25ea913ac..ccf947632a3b 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -2044,6 +2044,9 @@ static int v4l_reqbufs(const struct v4l2_ioctl_ops *ops,
>  
>  	if (ret)
>  		return ret;
> +
> +	CLEAR_AFTER_FIELD(p, capabilities);
> +
>  	return ops->vidioc_reqbufs(file, fh, p);
>  }
>  
> @@ -2083,7 +2086,7 @@ static int v4l_create_bufs(const struct v4l2_ioctl_ops *ops,
>  	if (ret)
>  		return ret;
>  
> -	CLEAR_AFTER_FIELD(create, flags);
> +	CLEAR_AFTER_FIELD(create, capabilities);
>  
>  	v4l_sanitize_format(&create->format);
>  
> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
> index 52ef92049073..bbb3f26fbde9 100644
> --- a/include/media/videobuf2-core.h
> +++ b/include/media/videobuf2-core.h
> @@ -744,8 +744,6 @@ void vb2_core_querybuf(struct vb2_queue *q, unsigned int index, void *pb);
>   * vb2_core_reqbufs() - Initiate streaming.
>   * @q:		pointer to &struct vb2_queue with videobuf2 queue.
>   * @memory:	memory type, as defined by &enum vb2_memory.
> - * @flags:	auxiliary queue/buffer management flags. Currently, the only
> - *		used flag is %V4L2_FLAG_MEMORY_NON_CONSISTENT.
>   * @count:	requested buffer count.
>   *
>   * Videobuf2 core helper to implement VIDIOC_REQBUF() operation. It is called
> @@ -770,13 +768,12 @@ void vb2_core_querybuf(struct vb2_queue *q, unsigned int index, void *pb);
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
> @@ -794,7 +791,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
>   * Return: returns zero on success; an error code otherwise.
>   */
>  int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
> -			 unsigned int flags, unsigned int *count,
> +			 unsigned int *count,
>  			 unsigned int requested_planes,
>  			 const unsigned int requested_sizes[]);
>  
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index c7b70ff53bc1..235db7754606 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -191,8 +191,6 @@ enum v4l2_memory {
>  	V4L2_MEMORY_DMABUF           = 4,
>  };
>  
> -#define V4L2_FLAG_MEMORY_NON_CONSISTENT		(1 << 0)
> -
>  /* see also http://vektor.theorem.ca/graphics/ycbcr/ */
>  enum v4l2_colorspace {
>  	/*
> @@ -949,10 +947,7 @@ struct v4l2_requestbuffers {
>  	__u32			type;		/* enum v4l2_buf_type */
>  	__u32			memory;		/* enum v4l2_memory */
>  	__u32			capabilities;
> -	union {
> -		__u32		flags;
> -		__u32		reserved[1];
> -	};
> +	__u32			reserved[1];
>  };
>  
>  /* capabilities for struct v4l2_requestbuffers and v4l2_create_buffers */
> @@ -2456,9 +2451,6 @@ struct v4l2_dbg_chip_info {
>   * @memory:	enum v4l2_memory; buffer memory type
>   * @format:	frame format, for which buffers are requested
>   * @capabilities: capabilities of this buffer type.
> - * @flags:	additional buffer management attributes (ignored unless the
> - *		queue has V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS capability
> - *		and configured for MMAP streaming I/O).
>   * @reserved:	future extensions
>   */
>  struct v4l2_create_buffers {
> @@ -2467,8 +2459,7 @@ struct v4l2_create_buffers {
>  	__u32			memory;
>  	struct v4l2_format	format;
>  	__u32			capabilities;
> -	__u32			flags;
> -	__u32			reserved[6];
> +	__u32			reserved[7];
>  };
>  
>  /*
---end quoted text---
