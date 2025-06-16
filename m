Return-Path: <linux-media+bounces-34941-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FF1ADB433
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 16:43:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BFDEA7AA61D
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 14:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49B4921A92F;
	Mon, 16 Jun 2025 14:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uHZSVAIy"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989241F7060;
	Mon, 16 Jun 2025 14:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750084828; cv=none; b=ULf//xwMf+eKnDFB8DGHsSdQNMFtepxOp9/CT00zhV27gs04FLagPjHuJKFR4twuQ25SRwjPmMiaar+R5PpGDdLnJS1WRh4Nqq8b2SzF8mbPU3DOyOrqiB7j6WHlIGRnvRZ0LDDdlinbpWFaJqJRZ7tZRhg5tfi9CN65cv7iWkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750084828; c=relaxed/simple;
	bh=Ev9OD7R8xSymj2g9dK7afAcTs0Enq/Sq7ZNoTPCIkZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pWLN61Y8hTQ9s7TJeA+mVG0ic9AuwdOsx1VFxxO9W8vLSTXIZZX6pf/nfthV9MSF+xqvCF4f2wZKZP3WczsQYfvfSeptZ50Vr+XEdWwo0ohfzQQ0sToaWWXBMVoQo5h6DdhzYkFhLZ4iSZb/t8oIISxwEror55H/ttpKAc57Nbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uHZSVAIy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D9798346;
	Mon, 16 Jun 2025 16:40:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750084813;
	bh=Ev9OD7R8xSymj2g9dK7afAcTs0Enq/Sq7ZNoTPCIkZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uHZSVAIybVoWC9CSINPAtkM4dTJrIWmWdsrIuAjQBO+FW3LGbFCA5vJxhtyKy/I0f
	 nIaqeFGDBCnFVZ5XweccJuZFfnZF2YnUpyJH35XIEVjLm5KK6SqdpiHGkN15pWP0Wh
	 TRNE1rr8EtCeTxtKDbVFIsBokphATMkzYJL8mbW0=
Date: Mon, 16 Jun 2025 17:40:09 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Naushir Patuck <naush@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 3/4] media: pisp_be: Split jobs creation and scheduling
Message-ID: <20250616144009.GD32454@pendragon.ideasonboard.com>
References: <20250606-pispbe-mainline-split-jobs-handling-v6-v7-0-46169f0622b7@ideasonboard.com>
 <20250606-pispbe-mainline-split-jobs-handling-v6-v7-3-46169f0622b7@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250606-pispbe-mainline-split-jobs-handling-v6-v7-3-46169f0622b7@ideasonboard.com>

Hi Jacopo,

On Fri, Jun 06, 2025 at 12:29:23PM +0200, Jacopo Mondi wrote:
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

s/the executing/executing/

> context split the job creation and job scheduling in two distinct
> operations. When a well-formed job is created, append it to the
> newly introduced 'pispbe->job_queue' where it will be dequeued from
> by the scheduling routine.
> 
> As the per-node 'ready_queue' buffer list is only accessed in vb2
> ops callbacks, protected by a mutex, it is not necessary to guard it

"by the node->queue_lock mutex"

> with a dedicated spinlock so drop it. Also use the spin_lock_irq()
> variant in all functions not called from an IRQ context where the
> spin_lock_irqsave() version was used.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  .../media/platform/raspberrypi/pisp_be/pisp_be.c   | 152 +++++++++++----------
>  1 file changed, 79 insertions(+), 73 deletions(-)
> 
> diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> index 92c452891d6c..c25f7d9b404c 100644
> --- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> +++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> @@ -161,8 +161,6 @@ struct pispbe_node {
>  	struct mutex node_lock;
>  	/* vb2_queue lock */
>  	struct mutex queue_lock;
> -	/* Protect pispbe_node->ready_queue and pispbe_buffer->ready_list */
> -	spinlock_t ready_lock;
>  	struct list_head ready_queue;
>  	struct vb2_queue queue;
>  	struct v4l2_format format;
> @@ -190,6 +188,8 @@ struct pispbe_hw_enables {
>  
>  /* Records a job configuration and memory addresses. */
>  struct pispbe_job_descriptor {
> +	struct list_head queue;
> +	struct pispbe_buffer *buffers[PISPBE_NUM_NODES];
>  	dma_addr_t hw_dma_addrs[N_HW_ADDRESSES];
>  	struct pisp_be_tiles_config *config;
>  	struct pispbe_hw_enables hw_enables;
> @@ -215,8 +215,10 @@ struct pispbe_dev {
>  	unsigned int sequence;
>  	u32 streaming_map;
>  	struct pispbe_job queued_job, running_job;
> -	spinlock_t hw_lock; /* protects "hw_busy" flag and streaming_map */
> +	/* protects "hw_busy" flag, streaming_map and job_queue */
> +	spinlock_t hw_lock;
>  	bool hw_busy; /* non-zero if a job is queued or is being started */
> +	struct list_head job_queue;
>  	int irq;
>  	u32 hw_version;
>  	u8 done, started;
> @@ -440,41 +442,47 @@ static void pispbe_xlate_addrs(struct pispbe_dev *pispbe,
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

You could use

	struct pispbe_job_descriptor __free(kfree) *job = NULL;

and drop the kfree() in the error paths to simplify error handling and
make it more robust. Don't forget to set job to NULL just after adding
it to the job_queue.

> +	unsigned int streaming_map;
>  	unsigned int config_index;
>  	struct pispbe_node *node;
> -	unsigned long flags;
>  
> -	lockdep_assert_held(&pispbe->hw_lock);

You could replace this with

	lockdep_assert_irqs_enabled();

Up to you.

> +	scoped_guard(spinlock_irq, &pispbe->hw_lock) {
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
>  	buf[CONFIG_NODE] = list_first_entry_or_null(&node->ready_queue,
>  						    struct pispbe_buffer,
>  						    ready_list);
> -	if (buf[CONFIG_NODE]) {
> -		list_del(&buf[CONFIG_NODE]->ready_list);
> -		pispbe->queued_job.buf[CONFIG_NODE] = buf[CONFIG_NODE];
> +	if (!buf[CONFIG_NODE]) {
> +		kfree(job);
> +		return -ENODEV;
>  	}
> -	spin_unlock_irqrestore(&node->ready_lock, flags);
>  
> -	/* Exit early if no config buffer has been queued. */
> -	if (!buf[CONFIG_NODE])
> -		return -ENODEV;
> +	list_del(&buf[CONFIG_NODE]->ready_list);
> +	job->buffers[CONFIG_NODE] = buf[CONFIG_NODE];
>  
>  	config_index = buf[CONFIG_NODE]->vb.vb2_buf.index;
>  	job->config = &pispbe->config[config_index];
> @@ -495,7 +503,7 @@ static int pispbe_prepare_job(struct pispbe_dev *pispbe,
>  			continue;
>  
>  		buf[i] = NULL;
> -		if (!(pispbe->streaming_map & BIT(i)))
> +		if (!(streaming_map & BIT(i)))
>  			continue;
>  
>  		if ((!(rgb_en & PISP_BE_RGB_ENABLE_OUTPUT0) &&
> @@ -522,25 +530,25 @@ static int pispbe_prepare_job(struct pispbe_dev *pispbe,
>  		node = &pispbe->node[i];
>  
>  		/* Pull a buffer from each V4L2 queue to form the queued job */
> -		spin_lock_irqsave(&node->ready_lock, flags);
>  		buf[i] = list_first_entry_or_null(&node->ready_queue,
>  						  struct pispbe_buffer,
>  						  ready_list);
>  		if (buf[i]) {
>  			list_del(&buf[i]->ready_list);
> -			pispbe->queued_job.buf[i] = buf[i];
> +			job->buffers[i] = buf[i];
>  		}
> -		spin_unlock_irqrestore(&node->ready_lock, flags);
>  
>  		if (!buf[i] && !ignore_buffers)
>  			goto err_return_buffers;
>  	}
>  
> -	pispbe->queued_job.valid = true;
> -
>  	/* Convert buffers to DMA addresses for the hardware */
>  	pispbe_xlate_addrs(pispbe, job, buf);
>  
> +	scoped_guard(spinlock_irq, &pispbe->hw_lock) {
> +		list_add_tail(&job->queue, &pispbe->job_queue);
> +	}
> +
>  	return 0;
>  
>  err_return_buffers:
> @@ -551,33 +559,39 @@ static int pispbe_prepare_job(struct pispbe_dev *pispbe,
>  			continue;
>  
>  		/* Return the buffer to the ready_list queue */
> -		spin_lock_irqsave(&n->ready_lock, flags);
>  		list_add(&buf[i]->ready_list, &n->ready_queue);
> -		spin_unlock_irqrestore(&n->ready_lock, flags);
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
> +
> +	scoped_guard(spinlock_irqsave, &pispbe->hw_lock) {
> +		if (clear_hw_busy)
> +			pispbe->hw_busy = false;
> +
> +		if (pispbe->hw_busy)
> +			return;
>  
> -	spin_lock_irqsave(&pispbe->hw_lock, flags);
> +		job = list_first_entry_or_null(&pispbe->job_queue,
> +					       struct pispbe_job_descriptor,
> +					       queue);
> +		if (!job)
> +			return;
>  
> -	if (clear_hw_busy)
> -		pispbe->hw_busy = false;
> +		list_del(&job->queue);
>  
> -	if (pispbe->hw_busy)
> -		goto unlock_and_return;
> +		for (unsigned int i = 0; i < PISPBE_NUM_NODES; i++)
> +			pispbe->queued_job.buf[i] = job->buffers[i];
> +		pispbe->queued_job.valid = true;
>  
> -	ret = pispbe_prepare_job(pispbe, &job);
> -	if (ret)
> -		goto unlock_and_return;
> +		pispbe->hw_busy = true;
> +	}
>  
>  	/*
>  	 * We can kick the job off without the hw_lock, as this can
> @@ -585,16 +599,8 @@ static void pispbe_schedule(struct pispbe_dev *pispbe, bool clear_hw_busy)
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
> @@ -846,18 +852,16 @@ static void pispbe_node_buffer_queue(struct vb2_buffer *buf)
>  		container_of(vbuf, struct pispbe_buffer, vb);
>  	struct pispbe_node *node = vb2_get_drv_priv(buf->vb2_queue);
>  	struct pispbe_dev *pispbe = node->pispbe;
> -	unsigned long flags;
>  
>  	dev_dbg(pispbe->dev, "%s: for node %s\n", __func__, NODE_NAME(node));
> -	spin_lock_irqsave(&node->ready_lock, flags);
>  	list_add_tail(&buffer->ready_list, &node->ready_queue);
> -	spin_unlock_irqrestore(&node->ready_lock, flags);
>  
>  	/*
>  	 * Every time we add a buffer, check if there's now some work for the hw
>  	 * to do.
>  	 */
> -	pispbe_schedule(pispbe, false);
> +	if (!pispbe_prepare_job(pispbe))
> +		pispbe_schedule(pispbe, false);
>  }
>  
>  static int pispbe_node_start_streaming(struct vb2_queue *q, unsigned int count)
> @@ -865,17 +869,16 @@ static int pispbe_node_start_streaming(struct vb2_queue *q, unsigned int count)
>  	struct pispbe_node *node = vb2_get_drv_priv(q);
>  	struct pispbe_dev *pispbe = node->pispbe;
>  	struct pispbe_buffer *buf, *tmp;
> -	unsigned long flags;
>  	int ret;
>  
>  	ret = pm_runtime_resume_and_get(pispbe->dev);
>  	if (ret < 0)
>  		goto err_return_buffers;
>  
> -	spin_lock_irqsave(&pispbe->hw_lock, flags);
> -	node->pispbe->streaming_map |=  BIT(node->id);
> -	node->pispbe->sequence = 0;
> -	spin_unlock_irqrestore(&pispbe->hw_lock, flags);
> +	scoped_guard(spinlock_irq, &pispbe->hw_lock) {
> +		node->pispbe->streaming_map |=  BIT(node->id);
> +		node->pispbe->sequence = 0;
> +	}
>  
>  	dev_dbg(pispbe->dev, "%s: for node %s (count %u)\n",
>  		__func__, NODE_NAME(node), count);
> @@ -883,17 +886,16 @@ static int pispbe_node_start_streaming(struct vb2_queue *q, unsigned int count)
>  		node->pispbe->streaming_map);
>  
>  	/* Maybe we're ready to run. */
> -	pispbe_schedule(pispbe, false);
> +	if (!pispbe_prepare_job(pispbe))
> +		pispbe_schedule(pispbe, false);
>  
>  	return 0;
>  
>  err_return_buffers:
> -	spin_lock_irqsave(&pispbe->hw_lock, flags);
>  	list_for_each_entry_safe(buf, tmp, &node->ready_queue, ready_list) {
>  		list_del(&buf->ready_list);
>  		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_QUEUED);
>  	}
> -	spin_unlock_irqrestore(&pispbe->hw_lock, flags);
>  
>  	return ret;
>  }
> @@ -903,7 +905,6 @@ static void pispbe_node_stop_streaming(struct vb2_queue *q)
>  	struct pispbe_node *node = vb2_get_drv_priv(q);
>  	struct pispbe_dev *pispbe = node->pispbe;
>  	struct pispbe_buffer *buf;
> -	unsigned long flags;
>  
>  	/*
>  	 * Now this is a bit awkward. In a simple M2M device we could just wait
> @@ -915,11 +916,7 @@ static void pispbe_node_stop_streaming(struct vb2_queue *q)
>  	 * This may return buffers out of order.
>  	 */
>  	dev_dbg(pispbe->dev, "%s: for node %s\n", __func__, NODE_NAME(node));
> -	spin_lock_irqsave(&pispbe->hw_lock, flags);
>  	do {
> -		unsigned long flags1;
> -
> -		spin_lock_irqsave(&node->ready_lock, flags1);
>  		buf = list_first_entry_or_null(&node->ready_queue,
>  					       struct pispbe_buffer,
>  					       ready_list);
> @@ -927,15 +924,23 @@ static void pispbe_node_stop_streaming(struct vb2_queue *q)
>  			list_del(&buf->ready_list);
>  			vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
>  		}
> -		spin_unlock_irqrestore(&node->ready_lock, flags1);
>  	} while (buf);
> -	spin_unlock_irqrestore(&pispbe->hw_lock, flags);
>  
>  	vb2_wait_for_all_buffers(&node->queue);
>  
> -	spin_lock_irqsave(&pispbe->hw_lock, flags);
> +	spin_lock_irq(&pispbe->hw_lock);
>  	pispbe->streaming_map &= ~BIT(node->id);
> -	spin_unlock_irqrestore(&pispbe->hw_lock, flags);
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

Please splice pispbe->job_queue to a local list with the lock held, and
then iterate over the local list without the lock held to free the jobs.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	spin_unlock_irq(&pispbe->hw_lock);
>  
>  	pm_runtime_mark_last_busy(pispbe->dev);
>  	pm_runtime_put_autosuspend(pispbe->dev);
> @@ -1393,7 +1398,6 @@ static int pispbe_init_node(struct pispbe_dev *pispbe, unsigned int id)
>  	mutex_init(&node->node_lock);
>  	mutex_init(&node->queue_lock);
>  	INIT_LIST_HEAD(&node->ready_queue);
> -	spin_lock_init(&node->ready_lock);
>  
>  	node->format.type = node->buf_type;
>  	pispbe_node_def_fmt(node);
> @@ -1677,6 +1681,8 @@ static int pispbe_probe(struct platform_device *pdev)
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

