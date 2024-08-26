Return-Path: <linux-media+bounces-16769-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 843E595ED73
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 11:38:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D58A1F2339B
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 09:38:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40C7F155324;
	Mon, 26 Aug 2024 09:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="g921qJy6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CC915532A
	for <linux-media@vger.kernel.org>; Mon, 26 Aug 2024 09:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724664974; cv=none; b=CZHnCLQeR0q0EyqtViqk2ybrKOdxitMF6Q0ffjqaETraUqCNfoF76Osw8/Ojmf2wXdq0RVA9iUSbZ9Bl7yK+t5q4S4psWdx+fXLWWzBZU3Pi6Fc8QDfx8Z4mYXti2lCoy7UYQcEH7kgB4eMMO96xlwT0UMT5u+P1JpFB8kfgCLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724664974; c=relaxed/simple;
	bh=5+1f3lVhcBXl9sBahuAuNptR06YiW+O12ril7VoWhpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TjJvESiAyJ3YEht6SolXO87GjgkTDC093GPDmADneP3W1CiOM6hIHc17knbATiJGQNraeI0OQbJZ2annYhFVEo+cNd3QGrUJfjTXxeSJTqf/xdxmhUQRhHCyYGdxSfqaq0Sb4AhOVNGHvWfl9jQ8uG90OUGzhJYnoWo5UtGthyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=g921qJy6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-142-90.net.vodafone.it [5.90.142.90])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A1610E4;
	Mon, 26 Aug 2024 11:35:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724664904;
	bh=5+1f3lVhcBXl9sBahuAuNptR06YiW+O12ril7VoWhpo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g921qJy6SIaJUba6ulbwJDb0TFdtY7OwaPiAzje4UhkqUjCRt+VEIJYU9P3LIvMeF
	 Xan9nyUzfHnJRpUroGTfmgxtrA8WHNz21HtgVu9LSiSsamylzz+0HUMXeO2Jz718vN
	 wg6BzVZDPkxOS2Op7ip4+GD5HcQoBkdZotiyy1rI=
Date: Mon, 26 Aug 2024 11:36:07 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Naushir Patuck <naush@raspberrypi.com>, Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>, 
	David Plowman <david.plowman@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	linux-media@vger.kernel.org
Subject: Re: [PATCH] media: pisp-be: Split jobs creation and scheduling
Message-ID: <xgrkq7gj2bujmnrwk3pzujzzzjypc4jpjfk7sew6kuphued6gt@pxc2d5r7ij34>
References: <20240806143652.917735-1-jacopo.mondi@ideasonboard.com>
 <20240811194141.GF9403@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240811194141.GF9403@pendragon.ideasonboard.com>

Hi Laurent

On Sun, Aug 11, 2024 at 10:41:41PM GMT, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Tue, Aug 06, 2024 at 04:36:51PM +0200, Jacopo Mondi wrote:
> > Currently the 'pispbe_schedule()' function does two things:
> >
> > 1) Tries to assemble a job by inspecting all the video node queues
> >    to make sure all the required buffers are available
> > 2) Submit the job to the hardware
> >
> > The pispbe_schedule() function is called at:
> >
> > - video device start_streaming() time
> > - video device qbuf() time
> > - irq handler
> >
> > As assembling a job requires inspecting all queues, it is a rather
> > time consuming operation which is better not run in IRQ context.
> >
> > To avoid executing the time consuming job creation in interrupt
> > context, split the job creation and job scheduling in two distinct
> > operations. When a well-formed job is created, append it to the
> > newly introduced 'pispbe->job_queue' where it will be dequeued from
> > by the scheduling routine.
> >
> > At start_streaming() and qbuf() time immediately try to schedule a job
> > if one has been created as the irq handler routine is only called when
> > a job has completed, and we can't solely rely on it for scheduling new
> > jobs.
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> >  .../platform/raspberrypi/pisp_be/pisp_be.c    | 98 +++++++++++++------
> >  1 file changed, 69 insertions(+), 29 deletions(-)
> >
> > diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> > index 65ff2382cffe..ae8b79530e72 100644
> > --- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> > +++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> > @@ -190,9 +190,11 @@ struct pispbe_hw_enables {
> >
> >  /* Records a job configuration and memory addresses. */
> >  struct pispbe_job_descriptor {
> > +	struct pispbe_buffer *buf[PISPBE_NUM_NODES];
>
> Maybe bufs instead of buf, or even buffers.
>
> >  	dma_addr_t hw_dma_addrs[N_HW_ADDRESSES];
> >  	struct pisp_be_tiles_config *config;
> >  	struct pispbe_hw_enables hw_enables;
> > +	struct list_head queue;
>
> I'd put this one at the top, it feels weird to have it here in the
> middle.
>
> >  	dma_addr_t tiles;
> >  };
> >
> > @@ -215,8 +217,10 @@ struct pispbe_dev {
> >  	unsigned int sequence;
> >  	u32 streaming_map;
> >  	struct pispbe_job queued_job, running_job;
> > -	spinlock_t hw_lock; /* protects "hw_busy" flag and streaming_map */
> > +	/* protects "hw_busy" flag, streaming_map and job queue*/
>
> s/job queue/job_queue /
>
> > +	spinlock_t hw_lock;
> >  	bool hw_busy; /* non-zero if a job is queued or is being started */
> > +	struct list_head job_queue;
> >  	int irq;
> >  	u32 hw_version;
> >  	u8 done, started;
> > @@ -443,27 +447,32 @@ static void pispbe_xlate_addrs(struct pispbe_dev *pispbe,
>
> While at it, in pispbe_xlate_addrs() there's a comment referencing
> pispbe_schedule_internal(). That function doesn't exist, could you fix
> it ?

Sure, I'll drop it

>
> >   * For Output0, Output1, Tdn and Stitch, a buffer only needs to be
> >   * available if the blocks are enabled in the config.
> >   *
> > - * Needs to be called with hw_lock held.
> > + * If all the buffers required to form a job are available, append the
> > + * job descriptor to the job queue to be later queued to the HW.
> >   *
> >   * Returns 0 if a job has been successfully prepared, < 0 otherwise.
> >   */
> > -static int pispbe_prepare_job(struct pispbe_dev *pispbe,
> > -			      struct pispbe_job_descriptor *job)
> > +static int pispbe_prepare_job(struct pispbe_dev *pispbe)
> >  {
> >  	struct pispbe_buffer *buf[PISPBE_NUM_NODES] = {};
> > +	struct pispbe_job_descriptor *job;
> > +	unsigned int streaming_map;
> >  	unsigned int config_index;
> >  	struct pispbe_node *node;
> >  	unsigned long flags;
> >
> > -	lockdep_assert_held(&pispbe->hw_lock);
> > -
> > -	memset(job, 0, sizeof(struct pispbe_job_descriptor));
> > +	spin_lock_irqsave(&pispbe->hw_lock, flags);
>
> Is _irqsave() the right version, now that this function isn't called
> from interrupt context anymore ?
>

Yeah, I should probably drop the _irqsave() version

> > +	streaming_map = pispbe->streaming_map;
> > +	spin_unlock_irqrestore(&pispbe->hw_lock, flags);
>
> Are you taking the lock here to honour the lock documentation, or is it
> actually needed ?
>

The lock protects pispbe->streaming_map which is accessed for writing
by start/stop_streaming which can be called on a video node
concurrently to a qbuf (which again calls pispbe_prepare_job() and
access pispbe->streaming_map) on a different video node. If I'm not
mistaken the lock is needed then

> >
> > -	if (((BIT(CONFIG_NODE) | BIT(MAIN_INPUT_NODE)) &
> > -		pispbe->streaming_map) !=
> > -			(BIT(CONFIG_NODE) | BIT(MAIN_INPUT_NODE)))
> > +	if (((BIT(CONFIG_NODE) | BIT(MAIN_INPUT_NODE)) & streaming_map) !=
> > +	    (BIT(CONFIG_NODE) | BIT(MAIN_INPUT_NODE)))
> >  		return -ENODEV;
>
> Another way to handle this could be
>
> 	scoped_guard(spinlock_irqsave)(&pispbe->hw_lock) {
> 		static const mask = BIT(CONFIG_NODE) | BIT(MAIN_INPUT_NODE);
>
> 		if (pispbe->streaming_map & mask != mask)
> 			return -ENODEV;
> 	}
>
> I think I'm starting to really like scoped guards.

It's a new construct to me, I'll use it as it seems nice

>
> I however wonder if we really need to keep this check. Isn't it enough
> that buffers have been queued ? I also think we need to revisit when to
> actually start and stop streaming, you remove queued jobs when all video
> devices have been stopped, but only prepare them when both the config
> and main input buffers are available. I think it would be better to take
> links into account.
>

Probably yes, if I'm not mistaken the same has been suggested for the
C55. However it can be done on top probably

> >
> > +	job = kzalloc(sizeof(*job), GFP_KERNEL);
> > +	if (!job)
> > +		return -ENOMEM;
> > +
> >  	node = &pispbe->node[CONFIG_NODE];
> >  	spin_lock_irqsave(&node->ready_lock, flags);
> >  	buf[CONFIG_NODE] = list_first_entry_or_null(&node->ready_queue,
> > @@ -471,13 +480,15 @@ static int pispbe_prepare_job(struct pispbe_dev *pispbe,
> >  						    ready_list);
> >  	if (buf[CONFIG_NODE]) {
> >  		list_del(&buf[CONFIG_NODE]->ready_list);
> > -		pispbe->queued_job.buf[CONFIG_NODE] = buf[CONFIG_NODE];
> > +		job->buf[CONFIG_NODE] = buf[CONFIG_NODE];
> >  	}
> >  	spin_unlock_irqrestore(&node->ready_lock, flags);
> >
> >  	/* Exit early if no config buffer has been queued. */
> > -	if (!buf[CONFIG_NODE])
> > +	if (!buf[CONFIG_NODE]) {
> > +		kfree(job);
> >  		return -ENODEV;
> > +	}
> >
> >  	config_index = buf[CONFIG_NODE]->vb.vb2_buf.index;
> >  	job->config = &pispbe->config[config_index];
> > @@ -498,7 +509,7 @@ static int pispbe_prepare_job(struct pispbe_dev *pispbe,
> >  			continue;
> >
> >  		buf[i] = NULL;
> > -		if (!(pispbe->streaming_map & BIT(i)))
> > +		if (!(streaming_map & BIT(i)))
> >  			continue;
> >
> >  		if ((!(rgb_en & PISP_BE_RGB_ENABLE_OUTPUT0) &&
> > @@ -531,7 +542,7 @@ static int pispbe_prepare_job(struct pispbe_dev *pispbe,
> >  						  ready_list);
> >  		if (buf[i]) {
> >  			list_del(&buf[i]->ready_list);
> > -			pispbe->queued_job.buf[i] = buf[i];
> > +			job->buf[i] = buf[i];
> >  		}
> >  		spin_unlock_irqrestore(&node->ready_lock, flags);
> >
> > @@ -539,11 +550,13 @@ static int pispbe_prepare_job(struct pispbe_dev *pispbe,
> >  			goto err_return_buffers;
> >  	}
> >
> > -	pispbe->queued_job.valid = true;
> > -
> >  	/* Convert buffers to DMA addresses for the hardware */
> >  	pispbe_xlate_addrs(pispbe, job, buf);
> >
> > +	spin_lock_irqsave(&pispbe->hw_lock, flags);
> > +	list_add_tail(&job->queue, &pispbe->job_queue);
> > +	spin_unlock_irqrestore(&pispbe->hw_lock, flags);
> > +
> >  	return 0;
> >
> >  err_return_buffers:
> > @@ -559,16 +572,15 @@ static int pispbe_prepare_job(struct pispbe_dev *pispbe,
> >  		spin_unlock_irqrestore(&n->ready_lock, flags);
> >  	}
> >
> > -	memset(&pispbe->queued_job, 0, sizeof(pispbe->queued_job));
> > +	kfree(job);
> >
> >  	return -ENODEV;
> >  }
> >
> >  static void pispbe_schedule(struct pispbe_dev *pispbe, bool clear_hw_busy)
> >  {
> > -	struct pispbe_job_descriptor job;
> > +	struct pispbe_job_descriptor *job;
> >  	unsigned long flags;
> > -	int ret;
> >
> >  	spin_lock_irqsave(&pispbe->hw_lock, flags);
> >
> > @@ -578,10 +590,18 @@ static void pispbe_schedule(struct pispbe_dev *pispbe, bool clear_hw_busy)
> >  	if (pispbe->hw_busy)
> >  		goto unlock_and_return;
> >
> > -	ret = pispbe_prepare_job(pispbe, &job);
> > -	if (ret)
> > +	job = list_first_entry_or_null(&pispbe->job_queue,
> > +				       struct pispbe_job_descriptor,
> > +				       queue);
> > +	if (!job)
> >  		goto unlock_and_return;
> >
> > +	list_del(&job->queue);
> > +
> > +	for (unsigned int i = 0; i < PISPBE_NUM_NODES; i++)
> > +		pispbe->queued_job.buf[i] = job->buf[i];
> > +	pispbe->queued_job.valid = true;
>
> Could queued_job and running_job be turned into pointers ?
>

I should probably unify struct pispbe_job and struct
pispbe_job_descriptor as the former contains a subset of the latter.
With this, I can make both queued_job and running_job pointers most
probably.

> > +
> >  	/*
> >  	 * We can kick the job off without the hw_lock, as this can
> >  	 * never run again until hw_busy is cleared, which will happen
> > @@ -591,9 +611,9 @@ static void pispbe_schedule(struct pispbe_dev *pispbe, bool clear_hw_busy)
> >  	pispbe->hw_busy = true;
> >  	spin_unlock_irqrestore(&pispbe->hw_lock, flags);
> >
> > -	if (job.config->num_tiles <= 0 ||
> > -	    job.config->num_tiles > PISP_BACK_END_NUM_TILES ||
> > -	    !((job.hw_enables.bayer_enables | job.hw_enables.rgb_enables) &
> > +	if (job->config->num_tiles <= 0 ||
> > +	    job->config->num_tiles > PISP_BACK_END_NUM_TILES ||
> > +	    !((job->hw_enables.bayer_enables | job->hw_enables.rgb_enables) &
> >  	      PISP_BE_BAYER_ENABLE_INPUT)) {
> >  		/*
> >  		 * Bad job. We can't let it proceed as it could lock up
> > @@ -605,11 +625,12 @@ static void pispbe_schedule(struct pispbe_dev *pispbe, bool clear_hw_busy)
> >  		 * but we seem to survive...
> >  		 */
> >  		dev_dbg(pispbe->dev, "Bad job: invalid number of tiles: %u\n",
> > -			job.config->num_tiles);
> > -		job.config->num_tiles = 0;
> > +			job->config->num_tiles);
> > +		job->config->num_tiles = 0;
> >  	}
>
> Does this need to be done at schedule time or can it be moved to prepare
> time ?

The num_tiles validation can even be moved to
pisp_be_validate_config() when a buffer is queued to the config node.

When it comes to the hw_enables mask validatation I think it already
is validated by

       	if (!(bayer_enables & PISP_BE_BAYER_ENABLE_INPUT) ==
	    !(rgb_enables & PISP_BE_RGB_ENABLE_INPUT)) {
		dev_dbg(dev, "%s: Not one input enabled\n", __func__);
		return -EIO;
	}

in pisp_be_validate_config() so it can probably be dropped from here


>
> >
> > -	pispbe_queue_job(pispbe, &job);
> > +	pispbe_queue_job(pispbe, job);
> > +	kfree(job);
> >
> >  	return;
> >
> > @@ -871,7 +892,8 @@ static void pispbe_node_buffer_queue(struct vb2_buffer *buf)
> >  	 * Every time we add a buffer, check if there's now some work for the hw
> >  	 * to do.
> >  	 */
> > -	pispbe_schedule(pispbe, false);
> > +	if (!pispbe_prepare_job(pispbe))
> > +		pispbe_schedule(pispbe, false);
> >  }
> >
> >  static int pispbe_node_start_streaming(struct vb2_queue *q, unsigned int count)
> > @@ -897,7 +919,8 @@ static int pispbe_node_start_streaming(struct vb2_queue *q, unsigned int count)
> >  		node->pispbe->streaming_map);
> >
> >  	/* Maybe we're ready to run. */
> > -	pispbe_schedule(pispbe, false);
> > +	if (!pispbe_prepare_job(pispbe))
> > +		pispbe_schedule(pispbe, false);
> >
> >  	return 0;
> >
> > @@ -949,6 +972,21 @@ static void pispbe_node_stop_streaming(struct vb2_queue *q)
> >
> >  	spin_lock_irqsave(&pispbe->hw_lock, flags);
> >  	pispbe->streaming_map &= ~BIT(node->id);
> > +
> > +	/* Release all jobs once all nodes have stopped streaming. */
> > +	if (pispbe->streaming_map == 0) {
> > +		struct pispbe_job_descriptor *job;
> > +
> > +		do {
> > +			job = list_first_entry_or_null(&pispbe->job_queue,
> > +						struct pispbe_job_descriptor,
> > +						queue);
> > +			if (job) {
> > +				list_del(&job->queue);
> > +				kfree(job);
> > +			}
> > +		} while (!list_empty(&pispbe->job_queue));
>
> How about a list_for_each_entry_safe() ?

probably better!

>
> > +	}
> >  	spin_unlock_irqrestore(&pispbe->hw_lock, flags);
> >
> >  	pm_runtime_mark_last_busy(pispbe->dev);
> > @@ -1691,6 +1729,8 @@ static int pispbe_probe(struct platform_device *pdev)
> >  	if (!pispbe)
> >  		return -ENOMEM;
> >
> > +	INIT_LIST_HEAD(&pispbe->job_queue);
> > +
> >  	dev_set_drvdata(&pdev->dev, pispbe);
> >  	pispbe->dev = &pdev->dev;
> >  	platform_set_drvdata(pdev, pispbe);
>
> --
> Regards,
>
> Laurent Pinchart

