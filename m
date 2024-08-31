Return-Path: <linux-media+bounces-17277-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4B096723B
	for <lists+linux-media@lfdr.de>; Sat, 31 Aug 2024 16:39:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DDB21F2276D
	for <lists+linux-media@lfdr.de>; Sat, 31 Aug 2024 14:39:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57B481CD2F;
	Sat, 31 Aug 2024 14:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nPyaoyl1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EA2FC0E
	for <linux-media@vger.kernel.org>; Sat, 31 Aug 2024 14:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725115184; cv=none; b=SxFHpRnXGwNdBnT7Yw6bX+V+UYl00+c4R+VP7OZcWLYnRrAhlyweM67ZQaBPZgjTA9U1/S18pRcXSn5HFI6Jrj9Wm5uy40y0AQxsczrm3dInDxj7bQnTUkBe/WN9aSurzYUpe5VBkz71lOOVxbThpOHY2J+Zv92e1cZqVoIFu7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725115184; c=relaxed/simple;
	bh=oaG/mdsxVlGKMDpM5wMsYfiOkIe0uHvW+DySvVnZf6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z2j0AoP0bv34o1bcR16G/cQVCZLKmV1rDx2E5fWDZzhO8hdZAKMU8weUrEZcIvFj8stAMa+cVMsICUzeeLw2YXQp/OsF3kpG+za25QrCllMvOZYdPkYMNvu0n7TnPMgWFl9U6A/kgB8a36kpt+oX/vS+mA8E+7FZaaWZNA3hlNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nPyaoyl1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5CAC1667;
	Sat, 31 Aug 2024 16:38:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725115110;
	bh=oaG/mdsxVlGKMDpM5wMsYfiOkIe0uHvW+DySvVnZf6M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nPyaoyl1hk0o+j3pbpScu48khNrIdHRJ0IAsppwYjiNIbLhyX8dptKOBpbYQzLPJM
	 NGuYbCiofTbohC5mfP9hJJrmbFVnhzoU87+LCmVRjDbb40zk09DJG0sZKRKuoLMipz
	 qQZuV0gSeTW/SBQDsdctkadjbmJ2pgAXz3UHdC20=
Date: Sat, 31 Aug 2024 17:39:09 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Naushir Patuck <naush@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v3 3/4] media: pisp-be: Split jobs creation and scheduling
Message-ID: <20240831143909.GW3811@pendragon.ideasonboard.com>
References: <20240827074018.534354-1-jacopo.mondi@ideasonboard.com>
 <20240827074018.534354-4-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240827074018.534354-4-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Tue, Aug 27, 2024 at 09:40:17AM +0200, Jacopo Mondi wrote:
> Currently the 'pispbe_schedule()' function does two things:
> 
> 1) Tries to assemble a job by inspecting all the video node queues
>    to make sure all the required buffers are available
> 2) Submit the job to the hardware
> 
> The pispbe_schedule() function is called at:
> 
> - video device start_streaming() time
> - video device qbuf() time
> - irq handler
> 
> As assembling a job requires inspecting all queues, it is a rather
> time consuming operation which is better not run in IRQ context.
> 
> To avoid the executing the time consuming job creation in interrupt
> context split the job creation and job scheduling in two distinct
> operations. When a well-formed job is created, append it to the
> newly introduced 'pispbe->job_queue' where it will be dequeued from
> by the scheduling routine.
> 
> At start_streaming() and qbuf() time immediately try to schedule a job
> if one has been created as the irq handler routing is only called when
> a job has completed, and we can't solely rely on it for scheduling new
> jobs.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  .../platform/raspberrypi/pisp_be/pisp_be.c    | 137 +++++++++++-------
>  1 file changed, 83 insertions(+), 54 deletions(-)
> 
> diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> index 73a5c88e25d0..f42541bb4827 100644
> --- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> +++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> @@ -190,6 +190,8 @@ struct pispbe_hw_enables {
>  
>  /* Records a job configuration and memory addresses. */
>  struct pispbe_job_descriptor {
> +	struct list_head queue;
> +	struct pispbe_buffer *buffers[PISPBE_NUM_NODES];
>  	dma_addr_t hw_dma_addrs[N_HW_ADDRESSES];
>  	struct pisp_be_tiles_config *config;

A candidate for a separate patch, I think storage for
pisp_be_tiles_config should be moved from pisbbe_dev.config to
pispbe_buffer, like we do for the rkisp1 driver. The memory would be
allocated at buffer allocation time (for config node buffers only, of
course).

>  	struct pispbe_hw_enables hw_enables;
> @@ -215,8 +217,10 @@ struct pispbe_dev {
>  	unsigned int sequence;
>  	u32 streaming_map;
>  	struct pispbe_job queued_job, running_job;
> -	spinlock_t hw_lock; /* protects "hw_busy" flag and streaming_map */
> +	/* protects "hw_busy" flag, streaming_map and job_queue*/

s/job_queue/job_queue /

I don't think streaming_map needs to be protected by the spinlock
anymore. It is now accessed only from the qbuf, start_streaming and
stop_streaming operations, which are all protected by the vb2 queue
mutex... scratch that, we use a different mutex for different video
devices.

> +	spinlock_t hw_lock;
>  	bool hw_busy; /* non-zero if a job is queued or is being started */
> +	struct list_head job_queue;
>  	int irq;
>  	u32 hw_version;
>  	u8 done, started;
> @@ -440,41 +444,50 @@ static void pispbe_xlate_addrs(struct pispbe_dev *pispbe,
>   * For Output0, Output1, Tdn and Stitch, a buffer only needs to be
>   * available if the blocks are enabled in the config.
>   *
> - * Needs to be called with hw_lock held.
> + * If all the buffers required to form a job are available, append the
> + * job descriptor to the job queue to be later queued to the HW.
>   *
>   * Returns 0 if a job has been successfully prepared, < 0 otherwise.
>   */
> -static int pispbe_prepare_job(struct pispbe_dev *pispbe,
> -			      struct pispbe_job_descriptor *job)
> +static int pispbe_prepare_job(struct pispbe_dev *pispbe)
>  {
>  	struct pispbe_buffer *buf[PISPBE_NUM_NODES] = {};
> +	struct pispbe_job_descriptor *job;
> +	unsigned int streaming_map;
>  	unsigned int config_index;
>  	struct pispbe_node *node;
> -	unsigned long flags;
>  
> -	lockdep_assert_held(&pispbe->hw_lock);
> +	scoped_guard(spinlock_irqsave, &pispbe->hw_lock) {

Do you need the irqsave version ?

> +		static const u32 mask = BIT(CONFIG_NODE) | BIT(MAIN_INPUT_NODE);
>  
> -	memset(job, 0, sizeof(struct pispbe_job_descriptor));
> +		if ((pispbe->streaming_map & mask) != mask)
> +			return -ENODEV;
>  
> -	if (((BIT(CONFIG_NODE) | BIT(MAIN_INPUT_NODE)) &
> -		pispbe->streaming_map) !=
> -			(BIT(CONFIG_NODE) | BIT(MAIN_INPUT_NODE)))
> -		return -ENODEV;
> +		/*
> +		 * Take a copy of streaming_map: nodes activated after this
> +		 * point are ignored when preparing this job.
> +		 */
> +		streaming_map = pispbe->streaming_map;
> +	}
> +
> +	job = kzalloc(sizeof(*job), GFP_KERNEL);
> +	if (!job)
> +		return -ENOMEM;
>  
>  	node = &pispbe->node[CONFIG_NODE];
> -	spin_lock_irqsave(&node->ready_lock, flags);
> -	buf[CONFIG_NODE] = list_first_entry_or_null(&node->ready_queue,
> -						    struct pispbe_buffer,
> -						    ready_list);
> -	if (buf[CONFIG_NODE]) {
> +
> +	scoped_guard(spinlock_irqsave, &node->ready_lock) {

Same here.

> +		buf[CONFIG_NODE] = list_first_entry_or_null(&node->ready_queue,
> +							    struct pispbe_buffer,
> +							    ready_list);
> +		if (!buf[CONFIG_NODE]) {
> +			kfree(job);
> +			return -ENODEV;
> +		}
> +
>  		list_del(&buf[CONFIG_NODE]->ready_list);
> -		pispbe->queued_job.buf[CONFIG_NODE] = buf[CONFIG_NODE];
> +		job->buffers[CONFIG_NODE] = buf[CONFIG_NODE];
>  	}
> -	spin_unlock_irqrestore(&node->ready_lock, flags);
> -
> -	/* Exit early if no config buffer has been queued. */
> -	if (!buf[CONFIG_NODE])
> -		return -ENODEV;
>  
>  	config_index = buf[CONFIG_NODE]->vb.vb2_buf.index;
>  	job->config = &pispbe->config[config_index];
> @@ -495,7 +508,7 @@ static int pispbe_prepare_job(struct pispbe_dev *pispbe,
>  			continue;
>  
>  		buf[i] = NULL;
> -		if (!(pispbe->streaming_map & BIT(i)))
> +		if (!(streaming_map & BIT(i)))
>  			continue;
>  
>  		if ((!(rgb_en & PISP_BE_RGB_ENABLE_OUTPUT0) &&
> @@ -522,25 +535,27 @@ static int pispbe_prepare_job(struct pispbe_dev *pispbe,
>  		node = &pispbe->node[i];
>  
>  		/* Pull a buffer from each V4L2 queue to form the queued job */
> -		spin_lock_irqsave(&node->ready_lock, flags);
> +		spin_lock(&node->ready_lock);
>  		buf[i] = list_first_entry_or_null(&node->ready_queue,
>  						  struct pispbe_buffer,
>  						  ready_list);
>  		if (buf[i]) {
>  			list_del(&buf[i]->ready_list);
> -			pispbe->queued_job.buf[i] = buf[i];
> +			job->buffers[i] = buf[i];
>  		}
> -		spin_unlock_irqrestore(&node->ready_lock, flags);
> +		spin_unlock(&node->ready_lock);
>  
>  		if (!buf[i] && !ignore_buffers)

The ignore_buffers logic seems weird to me. I don't understand why we
take buffers out of the ready_queue for the nodes that are not used by
this job. The problem isn't related to this patch, so it can be fixed
separately.

>  			goto err_return_buffers;
>  	}
>  
> -	pispbe->queued_job.valid = true;
> -
>  	/* Convert buffers to DMA addresses for the hardware */
>  	pispbe_xlate_addrs(pispbe, job, buf);
>  
> +	spin_lock(&pispbe->hw_lock);
> +	list_add_tail(&job->queue, &pispbe->job_queue);
> +	spin_unlock(&pispbe->hw_lock);
> +
>  	return 0;
>  
>  err_return_buffers:
> @@ -551,33 +566,41 @@ static int pispbe_prepare_job(struct pispbe_dev *pispbe,
>  			continue;
>  
>  		/* Return the buffer to the ready_list queue */
> -		spin_lock_irqsave(&n->ready_lock, flags);
> +		spin_lock(&n->ready_lock);
>  		list_add(&buf[i]->ready_list, &n->ready_queue);
> -		spin_unlock_irqrestore(&n->ready_lock, flags);
> +		spin_unlock(&n->ready_lock);

Should pispbe_node_buffer_queue() and pispbe_node_stop_streaming()
switch away from spin_lock_irqsave() too then ? Actually, can't we drop
the lock completely, now that ready_queue is only accessed from vb2 ops
all protected by the vb2 queue lock ?

>  	}
>  
> -	memset(&pispbe->queued_job, 0, sizeof(pispbe->queued_job));
> +	kfree(job);
>  
>  	return -ENODEV;
>  }
>  
>  static void pispbe_schedule(struct pispbe_dev *pispbe, bool clear_hw_busy)
>  {
> -	struct pispbe_job_descriptor job;
> -	unsigned long flags;
> -	int ret;
> +	struct pispbe_job_descriptor *job;
>  
> -	spin_lock_irqsave(&pispbe->hw_lock, flags);
> +	scoped_guard(spinlock_irqsave, &pispbe->hw_lock) {
> +		if (clear_hw_busy)
> +			pispbe->hw_busy = false;
>  
> -	if (clear_hw_busy)
> -		pispbe->hw_busy = false;
> +		if (pispbe->hw_busy)
> +			return;
>  
> -	if (pispbe->hw_busy)
> -		goto unlock_and_return;
> +		job = list_first_entry_or_null(&pispbe->job_queue,
> +					       struct pispbe_job_descriptor,
> +					       queue);
> +		if (!job)
> +			return;
>  
> -	ret = pispbe_prepare_job(pispbe, &job);
> -	if (ret)
> -		goto unlock_and_return;
> +		list_del(&job->queue);
> +
> +		for (unsigned int i = 0; i < PISPBE_NUM_NODES; i++)
> +			pispbe->queued_job.buf[i] = job->buffers[i];
> +		 pispbe->queued_job.valid = true;

Ideally this should be replaced with a pointer to the job descriptor,
but it can be done in a second step.

Ideally also, this should go to pispbe_queue_job(). I however don't
understand the logic that handles queued_job in pispbe_isr() and why the
interrupt handler can complete the queued job in some circumstances, so
I'm not sure how it would interact with moving this code to the
pispbe_queue_job() function.

> +
> +		pispbe->hw_busy = true;
> +	}
>  
>  	/*
>  	 * We can kick the job off without the hw_lock, as this can
> @@ -585,16 +608,8 @@ static void pispbe_schedule(struct pispbe_dev *pispbe, bool clear_hw_busy)
>  	 * only when the following job has been queued and an interrupt
>  	 * is rised.
>  	 */
> -	pispbe->hw_busy = true;
> -	spin_unlock_irqrestore(&pispbe->hw_lock, flags);
> -
> -	pispbe_queue_job(pispbe, &job);
> -
> -	return;
> -
> -unlock_and_return:
> -	/* No job has been queued, just release the lock and return. */
> -	spin_unlock_irqrestore(&pispbe->hw_lock, flags);
> +	pispbe_queue_job(pispbe, job);
> +	kfree(job);
>  }
>  
>  static void pispbe_isr_jobdone(struct pispbe_dev *pispbe,
> @@ -857,7 +872,8 @@ static void pispbe_node_buffer_queue(struct vb2_buffer *buf)
>  	 * Every time we add a buffer, check if there's now some work for the hw
>  	 * to do.
>  	 */
> -	pispbe_schedule(pispbe, false);
> +	if (!pispbe_prepare_job(pispbe))
> +		pispbe_schedule(pispbe, false);
>  }
>  
>  static int pispbe_node_start_streaming(struct vb2_queue *q, unsigned int count)
> @@ -883,7 +899,8 @@ static int pispbe_node_start_streaming(struct vb2_queue *q, unsigned int count)
>  		node->pispbe->streaming_map);
>  
>  	/* Maybe we're ready to run. */
> -	pispbe_schedule(pispbe, false);
> +	if (!pispbe_prepare_job(pispbe))
> +		pispbe_schedule(pispbe, false);
>  
>  	return 0;
>  
> @@ -935,6 +952,16 @@ static void pispbe_node_stop_streaming(struct vb2_queue *q)
>  
>  	spin_lock_irqsave(&pispbe->hw_lock, flags);
>  	pispbe->streaming_map &= ~BIT(node->id);
> +
> +	/* Release all jobs once all nodes have stopped streaming. */
> +	if (pispbe->streaming_map == 0) {
> +		struct pispbe_job_descriptor *job, *temp;
> +
> +		list_for_each_entry_safe(job, temp, &pispbe->job_queue, queue) {
> +			list_del(&job->queue);
> +			kfree(job);
> +		}
> +	}
>  	spin_unlock_irqrestore(&pispbe->hw_lock, flags);
>  
>  	pm_runtime_mark_last_busy(pispbe->dev);
> @@ -1677,6 +1704,8 @@ static int pispbe_probe(struct platform_device *pdev)
>  	if (!pispbe)
>  		return -ENOMEM;
>  
> +	INIT_LIST_HEAD(&pispbe->job_queue);
> +
>  	dev_set_drvdata(&pdev->dev, pispbe);
>  	pispbe->dev = &pdev->dev;
>  	platform_set_drvdata(pdev, pispbe);

-- 
Regards,

Laurent Pinchart

