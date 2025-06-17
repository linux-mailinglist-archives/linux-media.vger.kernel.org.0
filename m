Return-Path: <linux-media+bounces-35088-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53281ADCEC6
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 16:08:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CF7A179D35
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 14:07:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A9502E88A0;
	Tue, 17 Jun 2025 14:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bFy8fQEv"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F9E2E7626;
	Tue, 17 Jun 2025 14:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750169181; cv=none; b=GBsKlp5fBlP2G6lczzRjPNdbEh8at8u5p/q7c3Ey8lynvaGLMBkVnskIaV9PswbWyl5FXRuXzDvb2UKIU41dwxEAT4YNC5AR2a+5gCrY9o/3cH/VCAzmDFDNvztFbq/zxppwvi2Z+rJjEXUNY5A35nMf9LN0YMQMnCip6ErdpwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750169181; c=relaxed/simple;
	bh=TE1LoohfbSvo4In/rsIE8KKMkdSqgAyF0a8491Yfw9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YQqjS+ycCr4k4U1jK1hz/bBLP0UdCdUZVHXU2oq/NKFAazc5hxWRCCFxJ9foxYi/hJ93IIscHfYDs0caUsmyZH4vPiig7w+ANVxZWbbSBU9VGU+ycK/C72cYYOagMtKss5LgoOTUHIH53w28GJKSZI3F2BwMLQDM6iBQN5DxaPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bFy8fQEv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3665A496;
	Tue, 17 Jun 2025 16:06:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750169165;
	bh=TE1LoohfbSvo4In/rsIE8KKMkdSqgAyF0a8491Yfw9o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bFy8fQEvT7PVOXg8T5VRA9LwM98zJY5Sux16dc+pjTIjqlxAP2/JLyySZAfzc/ILt
	 rX1qXEjEK1rVbQ1bVbdIvA5dHVAXrh5SIBJJctWlkGFgsre284uzUQciw6y034NETu
	 FFJkjF8d9euiUvjytZQOXzOlY/jrXKi3er/caCmM=
Date: Tue, 17 Jun 2025 16:06:14 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Naushir Patuck <naush@raspberrypi.com>, Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>, 
	David Plowman <david.plowman@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 3/4] media: pisp_be: Split jobs creation and scheduling
Message-ID: <dqswo6rosuqz6bfljcqn4lcaxekeffncfb6chekuitrpi2kejw@hysfnu2s75rw>
References: <20250606-pispbe-mainline-split-jobs-handling-v6-v7-0-46169f0622b7@ideasonboard.com>
 <20250606-pispbe-mainline-split-jobs-handling-v6-v7-3-46169f0622b7@ideasonboard.com>
 <20250616144009.GD32454@pendragon.ideasonboard.com>
 <bhvhvjr7ks3yokkaoexuhduxqtxpx6voow6govxtvvs5o4sbwi@crrbxkit3vli>
 <20250617135304.GC10006@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250617135304.GC10006@pendragon.ideasonboard.com>

On Tue, Jun 17, 2025 at 04:53:04PM +0300, Laurent Pinchart wrote:
> > > > -static int pispbe_prepare_job(struct pispbe_dev *pispbe,
> > > > -			      struct pispbe_job_descriptor *job)
> > > > +static int pispbe_prepare_job(struct pispbe_dev *pispbe)
> > > >  {
> > > >  	struct pispbe_buffer *buf[PISPBE_NUM_NODES] = {};
> > > > +	struct pispbe_job_descriptor *job;
> > >
> > > You could use
> > >
> > > 	struct pispbe_job_descriptor __free(kfree) *job = NULL;
> > >
> > > and drop the kfree() in the error paths to simplify error handling and
> > > make it more robust. Don't forget to set job to NULL just after adding
> > > it to the job_queue.
> > >
> >
> > Only if I
> >
> > 	no_free_ptr(job);
>
> That's setting it to NULL, yes.
>

I realized my comment was unparsable, sorry. I meant I wanted to use
no_free_ptr(job) which is equivalent to job = NULL; but more explicit,
but media-ci reported that I'm not meant to ignore its return value so
I went for job = NULL in the end.

> > before returning as job as to stay valid until it gets consumed.
> >
> > I'm not sure it's worth it just to save two "kfree(job);" in error
> > paths
>
> Up to you.
>

I'm in two minds here. It makes cleanup paths easier but requires an
ad-hoc handling before returning. Oh well, let's use this new fancy
features and be done with that. That's what I've done in v8

Thanks
  j

> > > > +	unsigned int streaming_map;
> > > >  	unsigned int config_index;
> > > >  	struct pispbe_node *node;
> > > > -	unsigned long flags;
> > > >
> > > > -	lockdep_assert_held(&pispbe->hw_lock);
> > >
> > > You could replace this with
> > >
> > > 	lockdep_assert_irqs_enabled();
> > >
> > > Up to you.
> > >
> > > > +	scoped_guard(spinlock_irq, &pispbe->hw_lock) {
> > > > +		static const u32 mask = BIT(CONFIG_NODE) | BIT(MAIN_INPUT_NODE);
> > > >
> > > > -	memset(job, 0, sizeof(struct pispbe_job_descriptor));
> > > > +		if ((pispbe->streaming_map & mask) != mask)
> > > > +			return -ENODEV;
> > > >
> > > > -	if (((BIT(CONFIG_NODE) | BIT(MAIN_INPUT_NODE)) &
> > > > -		pispbe->streaming_map) !=
> > > > -			(BIT(CONFIG_NODE) | BIT(MAIN_INPUT_NODE)))
> > > > -		return -ENODEV;
> > > > +		/*
> > > > +		 * Take a copy of streaming_map: nodes activated after this
> > > > +		 * point are ignored when preparing this job.
> > > > +		 */
> > > > +		streaming_map = pispbe->streaming_map;
> > > > +	}
> > > > +
> > > > +	job = kzalloc(sizeof(*job), GFP_KERNEL);
> > > > +	if (!job)
> > > > +		return -ENOMEM;
> > > >
> > > >  	node = &pispbe->node[CONFIG_NODE];
> > > > -	spin_lock_irqsave(&node->ready_lock, flags);
> > > >  	buf[CONFIG_NODE] = list_first_entry_or_null(&node->ready_queue,
> > > >  						    struct pispbe_buffer,
> > > >  						    ready_list);
> > > > -	if (buf[CONFIG_NODE]) {
> > > > -		list_del(&buf[CONFIG_NODE]->ready_list);
> > > > -		pispbe->queued_job.buf[CONFIG_NODE] = buf[CONFIG_NODE];
> > > > +	if (!buf[CONFIG_NODE]) {
> > > > +		kfree(job);
> > > > +		return -ENODEV;
> > > >  	}
> > > > -	spin_unlock_irqrestore(&node->ready_lock, flags);
> > > >
> > > > -	/* Exit early if no config buffer has been queued. */
> > > > -	if (!buf[CONFIG_NODE])
> > > > -		return -ENODEV;
> > > > +	list_del(&buf[CONFIG_NODE]->ready_list);
> > > > +	job->buffers[CONFIG_NODE] = buf[CONFIG_NODE];
> > > >
> > > >  	config_index = buf[CONFIG_NODE]->vb.vb2_buf.index;
> > > >  	job->config = &pispbe->config[config_index];
> > > > @@ -495,7 +503,7 @@ static int pispbe_prepare_job(struct pispbe_dev *pispbe,
> > > >  			continue;
> > > >
> > > >  		buf[i] = NULL;
> > > > -		if (!(pispbe->streaming_map & BIT(i)))
> > > > +		if (!(streaming_map & BIT(i)))
> > > >  			continue;
> > > >
> > > >  		if ((!(rgb_en & PISP_BE_RGB_ENABLE_OUTPUT0) &&
> > > > @@ -522,25 +530,25 @@ static int pispbe_prepare_job(struct pispbe_dev *pispbe,
> > > >  		node = &pispbe->node[i];
> > > >
> > > >  		/* Pull a buffer from each V4L2 queue to form the queued job */
> > > > -		spin_lock_irqsave(&node->ready_lock, flags);
> > > >  		buf[i] = list_first_entry_or_null(&node->ready_queue,
> > > >  						  struct pispbe_buffer,
> > > >  						  ready_list);
> > > >  		if (buf[i]) {
> > > >  			list_del(&buf[i]->ready_list);
> > > > -			pispbe->queued_job.buf[i] = buf[i];
> > > > +			job->buffers[i] = buf[i];
> > > >  		}
> > > > -		spin_unlock_irqrestore(&node->ready_lock, flags);
> > > >
> > > >  		if (!buf[i] && !ignore_buffers)
> > > >  			goto err_return_buffers;
> > > >  	}
> > > >
> > > > -	pispbe->queued_job.valid = true;
> > > > -
> > > >  	/* Convert buffers to DMA addresses for the hardware */
> > > >  	pispbe_xlate_addrs(pispbe, job, buf);
> > > >
> > > > +	scoped_guard(spinlock_irq, &pispbe->hw_lock) {
> > > > +		list_add_tail(&job->queue, &pispbe->job_queue);
> > > > +	}
> > > > +
> > > >  	return 0;
> > > >
> > > >  err_return_buffers:
> > > > @@ -551,33 +559,39 @@ static int pispbe_prepare_job(struct pispbe_dev *pispbe,
> > > >  			continue;
> > > >
> > > >  		/* Return the buffer to the ready_list queue */
> > > > -		spin_lock_irqsave(&n->ready_lock, flags);
> > > >  		list_add(&buf[i]->ready_list, &n->ready_queue);
> > > > -		spin_unlock_irqrestore(&n->ready_lock, flags);
> > > >  	}
> > > >
> > > > -	memset(&pispbe->queued_job, 0, sizeof(pispbe->queued_job));
> > > > +	kfree(job);
> > > >
> > > >  	return -ENODEV;
> > > >  }
> > > >
> > > >  static void pispbe_schedule(struct pispbe_dev *pispbe, bool clear_hw_busy)
> > > >  {
> > > > -	struct pispbe_job_descriptor job;
> > > > -	unsigned long flags;
> > > > -	int ret;
> > > > +	struct pispbe_job_descriptor *job;
> > > > +
> > > > +	scoped_guard(spinlock_irqsave, &pispbe->hw_lock) {
> > > > +		if (clear_hw_busy)
> > > > +			pispbe->hw_busy = false;
> > > > +
> > > > +		if (pispbe->hw_busy)
> > > > +			return;
> > > >
> > > > -	spin_lock_irqsave(&pispbe->hw_lock, flags);
> > > > +		job = list_first_entry_or_null(&pispbe->job_queue,
> > > > +					       struct pispbe_job_descriptor,
> > > > +					       queue);
> > > > +		if (!job)
> > > > +			return;
> > > >
> > > > -	if (clear_hw_busy)
> > > > -		pispbe->hw_busy = false;
> > > > +		list_del(&job->queue);
> > > >
> > > > -	if (pispbe->hw_busy)
> > > > -		goto unlock_and_return;
> > > > +		for (unsigned int i = 0; i < PISPBE_NUM_NODES; i++)
> > > > +			pispbe->queued_job.buf[i] = job->buffers[i];
> > > > +		pispbe->queued_job.valid = true;
> > > >
> > > > -	ret = pispbe_prepare_job(pispbe, &job);
> > > > -	if (ret)
> > > > -		goto unlock_and_return;
> > > > +		pispbe->hw_busy = true;
> > > > +	}
> > > >
> > > >  	/*
> > > >  	 * We can kick the job off without the hw_lock, as this can
> > > > @@ -585,16 +599,8 @@ static void pispbe_schedule(struct pispbe_dev *pispbe, bool clear_hw_busy)
> > > >  	 * only when the following job has been queued and an interrupt
> > > >  	 * is rised.
> > > >  	 */
> > > > -	pispbe->hw_busy = true;
> > > > -	spin_unlock_irqrestore(&pispbe->hw_lock, flags);
> > > > -
> > > > -	pispbe_queue_job(pispbe, &job);
> > > > -
> > > > -	return;
> > > > -
> > > > -unlock_and_return:
> > > > -	/* No job has been queued, just release the lock and return. */
> > > > -	spin_unlock_irqrestore(&pispbe->hw_lock, flags);
> > > > +	pispbe_queue_job(pispbe, job);
> > > > +	kfree(job);
> > > >  }
> > > >
> > > >  static void pispbe_isr_jobdone(struct pispbe_dev *pispbe,
> > > > @@ -846,18 +852,16 @@ static void pispbe_node_buffer_queue(struct vb2_buffer *buf)
> > > >  		container_of(vbuf, struct pispbe_buffer, vb);
> > > >  	struct pispbe_node *node = vb2_get_drv_priv(buf->vb2_queue);
> > > >  	struct pispbe_dev *pispbe = node->pispbe;
> > > > -	unsigned long flags;
> > > >
> > > >  	dev_dbg(pispbe->dev, "%s: for node %s\n", __func__, NODE_NAME(node));
> > > > -	spin_lock_irqsave(&node->ready_lock, flags);
> > > >  	list_add_tail(&buffer->ready_list, &node->ready_queue);
> > > > -	spin_unlock_irqrestore(&node->ready_lock, flags);
> > > >
> > > >  	/*
> > > >  	 * Every time we add a buffer, check if there's now some work for the hw
> > > >  	 * to do.
> > > >  	 */
> > > > -	pispbe_schedule(pispbe, false);
> > > > +	if (!pispbe_prepare_job(pispbe))
> > > > +		pispbe_schedule(pispbe, false);
> > > >  }
> > > >
> > > >  static int pispbe_node_start_streaming(struct vb2_queue *q, unsigned int count)
> > > > @@ -865,17 +869,16 @@ static int pispbe_node_start_streaming(struct vb2_queue *q, unsigned int count)
> > > >  	struct pispbe_node *node = vb2_get_drv_priv(q);
> > > >  	struct pispbe_dev *pispbe = node->pispbe;
> > > >  	struct pispbe_buffer *buf, *tmp;
> > > > -	unsigned long flags;
> > > >  	int ret;
> > > >
> > > >  	ret = pm_runtime_resume_and_get(pispbe->dev);
> > > >  	if (ret < 0)
> > > >  		goto err_return_buffers;
> > > >
> > > > -	spin_lock_irqsave(&pispbe->hw_lock, flags);
> > > > -	node->pispbe->streaming_map |=  BIT(node->id);
> > > > -	node->pispbe->sequence = 0;
> > > > -	spin_unlock_irqrestore(&pispbe->hw_lock, flags);
> > > > +	scoped_guard(spinlock_irq, &pispbe->hw_lock) {
> > > > +		node->pispbe->streaming_map |=  BIT(node->id);
> > > > +		node->pispbe->sequence = 0;
> > > > +	}
> > > >
> > > >  	dev_dbg(pispbe->dev, "%s: for node %s (count %u)\n",
> > > >  		__func__, NODE_NAME(node), count);
> > > > @@ -883,17 +886,16 @@ static int pispbe_node_start_streaming(struct vb2_queue *q, unsigned int count)
> > > >  		node->pispbe->streaming_map);
> > > >
> > > >  	/* Maybe we're ready to run. */
> > > > -	pispbe_schedule(pispbe, false);
> > > > +	if (!pispbe_prepare_job(pispbe))
> > > > +		pispbe_schedule(pispbe, false);
> > > >
> > > >  	return 0;
> > > >
> > > >  err_return_buffers:
> > > > -	spin_lock_irqsave(&pispbe->hw_lock, flags);
> > > >  	list_for_each_entry_safe(buf, tmp, &node->ready_queue, ready_list) {
> > > >  		list_del(&buf->ready_list);
> > > >  		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_QUEUED);
> > > >  	}
> > > > -	spin_unlock_irqrestore(&pispbe->hw_lock, flags);
> > > >
> > > >  	return ret;
> > > >  }
> > > > @@ -903,7 +905,6 @@ static void pispbe_node_stop_streaming(struct vb2_queue *q)
> > > >  	struct pispbe_node *node = vb2_get_drv_priv(q);
> > > >  	struct pispbe_dev *pispbe = node->pispbe;
> > > >  	struct pispbe_buffer *buf;
> > > > -	unsigned long flags;
> > > >
> > > >  	/*
> > > >  	 * Now this is a bit awkward. In a simple M2M device we could just wait
> > > > @@ -915,11 +916,7 @@ static void pispbe_node_stop_streaming(struct vb2_queue *q)
> > > >  	 * This may return buffers out of order.
> > > >  	 */
> > > >  	dev_dbg(pispbe->dev, "%s: for node %s\n", __func__, NODE_NAME(node));
> > > > -	spin_lock_irqsave(&pispbe->hw_lock, flags);
> > > >  	do {
> > > > -		unsigned long flags1;
> > > > -
> > > > -		spin_lock_irqsave(&node->ready_lock, flags1);
> > > >  		buf = list_first_entry_or_null(&node->ready_queue,
> > > >  					       struct pispbe_buffer,
> > > >  					       ready_list);
> > > > @@ -927,15 +924,23 @@ static void pispbe_node_stop_streaming(struct vb2_queue *q)
> > > >  			list_del(&buf->ready_list);
> > > >  			vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
> > > >  		}
> > > > -		spin_unlock_irqrestore(&node->ready_lock, flags1);
> > > >  	} while (buf);
> > > > -	spin_unlock_irqrestore(&pispbe->hw_lock, flags);
> > > >
> > > >  	vb2_wait_for_all_buffers(&node->queue);
> > > >
> > > > -	spin_lock_irqsave(&pispbe->hw_lock, flags);
> > > > +	spin_lock_irq(&pispbe->hw_lock);
> > > >  	pispbe->streaming_map &= ~BIT(node->id);
> > > > -	spin_unlock_irqrestore(&pispbe->hw_lock, flags);
> > > > +
> > > > +	/* Release all jobs once all nodes have stopped streaming. */
> > > > +	if (pispbe->streaming_map == 0) {
> > > > +		struct pispbe_job_descriptor *job, *temp;
> > > > +
> > > > +		list_for_each_entry_safe(job, temp, &pispbe->job_queue, queue) {
> > > > +			list_del(&job->queue);
> > > > +			kfree(job);
> > > > +		}
> > > > +	}
> > >
> > > Please splice pispbe->job_queue to a local list with the lock held, and
> > > then iterate over the local list without the lock held to free the jobs.
> > >
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > >
> > > > +	spin_unlock_irq(&pispbe->hw_lock);
> > > >
> > > >  	pm_runtime_mark_last_busy(pispbe->dev);
> > > >  	pm_runtime_put_autosuspend(pispbe->dev);
> > > > @@ -1393,7 +1398,6 @@ static int pispbe_init_node(struct pispbe_dev *pispbe, unsigned int id)
> > > >  	mutex_init(&node->node_lock);
> > > >  	mutex_init(&node->queue_lock);
> > > >  	INIT_LIST_HEAD(&node->ready_queue);
> > > > -	spin_lock_init(&node->ready_lock);
> > > >
> > > >  	node->format.type = node->buf_type;
> > > >  	pispbe_node_def_fmt(node);
> > > > @@ -1677,6 +1681,8 @@ static int pispbe_probe(struct platform_device *pdev)
> > > >  	if (!pispbe)
> > > >  		return -ENOMEM;
> > > >
> > > > +	INIT_LIST_HEAD(&pispbe->job_queue);
> > > > +
> > > >  	dev_set_drvdata(&pdev->dev, pispbe);
> > > >  	pispbe->dev = &pdev->dev;
> > > >  	platform_set_drvdata(pdev, pispbe);
>
> --
> Regards,
>
> Laurent Pinchart

