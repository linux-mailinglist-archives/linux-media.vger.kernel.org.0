Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB5F7458586
	for <lists+linux-media@lfdr.de>; Sun, 21 Nov 2021 18:43:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238575AbhKURqh convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Sun, 21 Nov 2021 12:46:37 -0500
Received: from aposti.net ([89.234.176.197]:36184 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238564AbhKURqh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Nov 2021 12:46:37 -0500
Date:   Sun, 21 Nov 2021 17:43:20 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 11/15] iio: buffer-dma: Boost performance using
 write-combine cache setting
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     Alexandru Ardelean <ardeleanalex@gmail.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Michael Hennerich <Michael.Hennerich@analog.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?iso-8859-1?b?S/ZuaWc=?= <christian.koenig@amd.com>,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Message-Id: <8WNX2R.M4XE9MQC24W22@crapouillou.net>
In-Reply-To: <20211121150037.2a606be0@jic23-huawei>
References: <20211115141925.60164-1-paul@crapouillou.net>
        <20211115141925.60164-12-paul@crapouillou.net>
        <20211121150037.2a606be0@jic23-huawei>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jonathan,

Le dim., nov. 21 2021 at 15:00:37 +0000, Jonathan Cameron 
<jic23@kernel.org> a �crit :
> On Mon, 15 Nov 2021 14:19:21 +0000
> Paul Cercueil <paul@crapouillou.net> wrote:
> 
>>  We can be certain that the input buffers will only be accessed by
>>  userspace for reading, and output buffers will mostly be accessed by
>>  userspace for writing.
> 
> Mostly?  Perhaps a little more info on why that's not 'only'.

Just like with a framebuffer, it really depends on what the application 
does. Most of the cases it will just read sequentially an input buffer, 
or write sequentially an output buffer. But then you get the exotic 
application that will try to do something like alpha blending, which 
means read+write. Hence "mostly".

>> 
>>  Therefore, it makes more sense to use only fully cached input 
>> buffers,
>>  and to use the write-combine cache coherency setting for output 
>> buffers.
>> 
>>  This boosts performance, as the data written to the output buffers 
>> does
>>  not have to be sync'd for coherency. It will halve performance if 
>> the
>>  userspace application tries to read from the output buffer, but this
>>  should never happen.
>> 
>>  Since we don't need to sync the cache when disabling CPU access 
>> either
>>  for input buffers or output buffers, the .end_cpu_access() callback 
>> can
>>  be dropped completely.
> 
> We have an odd mix of coherent and non coherent DMA in here as you 
> noted,
> but are you sure this is safe on all platforms?

The mix isn't safe, but using only coherent or only non-coherent should 
be safe, yes.

> 
>> 
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> 
> Any numbers to support this patch?  The mapping types are performance
> optimisations so nice to know how much of a difference they make.

Output buffers are definitely faster in write-combine mode. On a 
ZedBoard with a AD9361 transceiver set to 66 MSPS, and buffer/size set 
to 8192, I would get about 185 MiB/s before, 197 MiB/s after.

Input buffers... early results are mixed. On ARM32 it does look like it 
is slightly faster to read from *uncached* memory than reading from 
cached memory. The cache sync does take a long time.

Other architectures might have a different result, for instance on MIPS 
invalidating the cache is a very fast operation, so using cached 
buffers would be a huge win in performance.

Setups where the DMA operations are coherent also wouldn't require any 
cache sync and this patch would give a huge win in performance.

I'll run some more tests next week to have some fresh numbers.

Cheers,
-Paul

>>  ---
>>   drivers/iio/buffer/industrialio-buffer-dma.c | 82 
>> +++++++++++++-------
>>   1 file changed, 54 insertions(+), 28 deletions(-)
>> 
>>  diff --git a/drivers/iio/buffer/industrialio-buffer-dma.c 
>> b/drivers/iio/buffer/industrialio-buffer-dma.c
>>  index 92356ee02f30..fb39054d8c15 100644
>>  --- a/drivers/iio/buffer/industrialio-buffer-dma.c
>>  +++ b/drivers/iio/buffer/industrialio-buffer-dma.c
>>  @@ -229,8 +229,33 @@ static int iio_buffer_dma_buf_mmap(struct 
>> dma_buf *dbuf,
>>   	if (vma->vm_ops->open)
>>   		vma->vm_ops->open(vma);
>> 
>>  -	return dma_mmap_pages(dev, vma, vma->vm_end - vma->vm_start,
>>  -			      virt_to_page(block->vaddr));
>>  +	if (block->queue->buffer.direction == IIO_BUFFER_DIRECTION_IN) {
>>  +		/*
>>  +		 * With an input buffer, userspace will only read the data and
>>  +		 * never write. We can mmap the buffer fully cached.
>>  +		 */
>>  +		return dma_mmap_pages(dev, vma, vma->vm_end - vma->vm_start,
>>  +				      virt_to_page(block->vaddr));
>>  +	} else {
>>  +		/*
>>  +		 * With an output buffer, userspace will only write the data
>>  +		 * and should rarely (if never) read from it. It is better to
>>  +		 * use write-combine in this case.
>>  +		 */
>>  +		return dma_mmap_wc(dev, vma, block->vaddr, block->phys_addr,
>>  +				   vma->vm_end - vma->vm_start);
>>  +	}
>>  +}
>>  +
>>  +static void iio_dma_buffer_free_dmamem(struct iio_dma_buffer_block 
>> *block)
>>  +{
>>  +	struct device *dev = block->queue->dev;
>>  +	size_t size = PAGE_ALIGN(block->size);
>>  +
>>  +	if (block->queue->buffer.direction == IIO_BUFFER_DIRECTION_IN)
>>  +		dma_free_coherent(dev, size, block->vaddr, block->phys_addr);
>>  +	else
>>  +		dma_free_wc(dev, size, block->vaddr, block->phys_addr);
>>   }
>> 
>>   static void iio_buffer_dma_buf_release(struct dma_buf *dbuf)
>>  @@ -243,9 +268,7 @@ static void iio_buffer_dma_buf_release(struct 
>> dma_buf *dbuf)
>> 
>>   	mutex_lock(&queue->lock);
>> 
>>  -	dma_free_coherent(queue->dev, PAGE_ALIGN(block->size),
>>  -			  block->vaddr, block->phys_addr);
>>  -
>>  +	iio_dma_buffer_free_dmamem(block);
>>   	kfree(block);
>> 
>>   	queue->num_blocks--;
>>  @@ -268,19 +291,6 @@ static int 
>> iio_buffer_dma_buf_begin_cpu_access(struct dma_buf *dbuf,
>>   	return 0;
>>   }
>> 
>>  -static int iio_buffer_dma_buf_end_cpu_access(struct dma_buf *dbuf,
>>  -					     enum dma_data_direction dma_dir)
>>  -{
>>  -	struct iio_dma_buffer_block *block = dbuf->priv;
>>  -	struct device *dev = block->queue->dev;
>>  -
>>  -	/* We only need to sync the cache for output buffers */
>>  -	if (block->queue->buffer.direction == IIO_BUFFER_DIRECTION_OUT)
>>  -		dma_sync_single_for_device(dev, block->phys_addr, block->size, 
>> dma_dir);
>>  -
>>  -	return 0;
>>  -}
>>  -
>>   static const struct dma_buf_ops iio_dma_buffer_dmabuf_ops = {
>>   	.attach			= iio_buffer_dma_buf_attach,
>>   	.map_dma_buf		= iio_buffer_dma_buf_map,
>>  @@ -288,9 +298,28 @@ static const struct dma_buf_ops 
>> iio_dma_buffer_dmabuf_ops = {
>>   	.mmap			= iio_buffer_dma_buf_mmap,
>>   	.release		= iio_buffer_dma_buf_release,
>>   	.begin_cpu_access	= iio_buffer_dma_buf_begin_cpu_access,
>>  -	.end_cpu_access		= iio_buffer_dma_buf_end_cpu_access,
>>   };
>> 
>>  +static int iio_dma_buffer_alloc_dmamem(struct iio_dma_buffer_block 
>> *block)
>>  +{
>>  +	struct device *dev = block->queue->dev;
>>  +	size_t size = PAGE_ALIGN(block->size);
>>  +
>>  +	if (block->queue->buffer.direction == IIO_BUFFER_DIRECTION_IN) {
>>  +		block->vaddr = dma_alloc_coherent(dev, size,
>>  +						  &block->phys_addr,
>>  +						  GFP_KERNEL);
>>  +	} else {
>>  +		block->vaddr = dma_alloc_wc(dev, size,
>>  +					    &block->phys_addr,
>>  +					    GFP_KERNEL);
>>  +	}
>>  +	if (!block->vaddr)
>>  +		return -ENOMEM;
>>  +
>>  +	return 0;
>>  +}
>>  +
>>   static struct iio_dma_buffer_block *iio_dma_buffer_alloc_block(
>>   	struct iio_dma_buffer_queue *queue, size_t size, bool fileio)
>>   {
>>  @@ -303,12 +332,12 @@ static struct iio_dma_buffer_block 
>> *iio_dma_buffer_alloc_block(
>>   	if (!block)
>>   		return ERR_PTR(-ENOMEM);
>> 
>>  -	block->vaddr = dma_alloc_coherent(queue->dev, PAGE_ALIGN(size),
>>  -		&block->phys_addr, GFP_KERNEL);
>>  -	if (!block->vaddr) {
>>  -		err = -ENOMEM;
>>  +	block->size = size;
>>  +	block->queue = queue;
>>  +
>>  +	err = iio_dma_buffer_alloc_dmamem(block);
>>  +	if (err)
>>   		goto err_free_block;
>>  -	}
>> 
>>   	einfo.ops = &iio_dma_buffer_dmabuf_ops;
>>   	einfo.size = PAGE_ALIGN(size);
>>  @@ -322,10 +351,8 @@ static struct iio_dma_buffer_block 
>> *iio_dma_buffer_alloc_block(
>>   	}
>> 
>>   	block->dmabuf = dmabuf;
>>  -	block->size = size;
>>   	block->bytes_used = size;
>>   	block->state = IIO_BLOCK_STATE_DONE;
>>  -	block->queue = queue;
>>   	block->fileio = fileio;
>>   	INIT_LIST_HEAD(&block->head);
>> 
>>  @@ -338,8 +365,7 @@ static struct iio_dma_buffer_block 
>> *iio_dma_buffer_alloc_block(
>>   	return block;
>> 
>>   err_free_dma:
>>  -	dma_free_coherent(queue->dev, PAGE_ALIGN(size),
>>  -			  block->vaddr, block->phys_addr);
>>  +	iio_dma_buffer_free_dmamem(block);
>>   err_free_block:
>>   	kfree(block);
>>   	return ERR_PTR(err);
> 


