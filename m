Return-Path: <linux-media+bounces-36304-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 399A4AEE075
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 16:20:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F398E7A8B8A
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 14:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0F2A28BABA;
	Mon, 30 Jun 2025 14:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PUBQSZsQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7960C28C2BC
	for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 14:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751293209; cv=none; b=qTwi4twQ9dha5FxMI2nAX+32NGYGUsuVZqhyeNOf/1LkOxsVkNcNBQidGM0a33AJThnM8OtHyeLvrNXzLbvbOZ1NTv+EVx8Xqr645qzwSrBDTtuJ49HVE4fu5lmARNYX8MnvHGCSCiPWCOpZtIaiZbujHr/x3cyh3WI1jWQGWA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751293209; c=relaxed/simple;
	bh=G3L+gqaU9VylnCtDjecXABWNN2OsEPhShZNvPNaPJkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jtXBg9Jjx6HnprR3VBixi3ZLLHOWSsS2WlXBgqjINbKZR7UeW2FbJkd5P27OTRSaeTvtP/9D0tYJ33B5K1dEPltdp2FG01JQtFGmsKkHUZHaALHxl1OUWYPzUy2BCydmhrB6M+pQFl+jG6DhLvUsdokymtzFGdqhs8AnLpik7hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PUBQSZsQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-137-95.net.vodafone.it [5.90.137.95])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9002BC75;
	Mon, 30 Jun 2025 16:19:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751293183;
	bh=G3L+gqaU9VylnCtDjecXABWNN2OsEPhShZNvPNaPJkA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PUBQSZsQRRKEqBQuVhrm6BdOtYNiCpw9RChCMdgJBBGh6eZhzuCj+iHqsSD2Shg0g
	 EBTa1vuxRilmGW4mB1OwHVfSiN6ZMFXtSzd2MTgWrvnkHWfYUSMjxkM6jMpUzfNYUJ
	 BIazI9Gdu6Z/Pc3VxKn4K7L2PbCV5FtMH3+IZbeY=
Date: Mon, 30 Jun 2025 16:20:00 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	linux-media@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, jacopo.mondi@ideasonboard.com
Subject: Re: [PATCH v2 2/3] media: mc: Add media jobs framework
Message-ID: <suaf6s5zz7477kgdafb6czvesx6vuvpiqkzw37gri5zujz3jcc@h5apd56za6vb>
References: <20250624-media-jobs-v2-0-8e649b069a96@ideasonboard.com>
 <20250624-media-jobs-v2-2-8e649b069a96@ideasonboard.com>
 <99429f91-50db-4b78-9011-966c48aa5a7b@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <99429f91-50db-4b78-9011-966c48aa5a7b@linux.intel.com>

HI Dan

On Sun, Jun 29, 2025 at 12:08:34PM +0300, Sakari Ailus wrote:
> Hi Daniel,
>
> Thanks for the update.
>
> On 6/24/25 10:59, Daniel Scally wrote:
> > Add a new framework to the media subsystem describing media jobs.
> > This framework is intended to be able to model the interactions
> > between multiple different drivers that need to be run in concert
> > to fully control a media pipeline, for example an ISP driver and a
> > driver controlling a DMA device that feeds data from memory in to
> > that ISP.
> >
> > The new framework allows all drivers involved to add explicit steps
> > that need to be performed, and to control the ordering of those steps
> > precisely. Once the job with its steps has been created it's then
> > scheduled to be run with a workqueue which executes each step in the
> > defined order.
> >
> > Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> > ---
> > Changes in v2:
> >
> > 	- Dropped the concept of distinct media job dependencies and
> > 	  setup functions. Instead drivers register one or more
> > 	  "contributor" structs which hold callbacks that fill in the
> > 	  steps for a job (replacing the job setup funcs) and
> > 	  additionally let the framework check whether a driver is
> > 	  ready to queue a new job (replacing the dependencies). This
> > 	  new model allows dropping the sched->pending queue entirely.
> > 	- Used hweight() instead of open-coding a flags counter
> > 	- Some minor style fixing
> > 	- Validated each media_job_step has a .run_step() function
> > 	  before attempting to call it
> > 	- Moved as much functionality as possible before taking the
> > 	  lock in multiple functions
> > 	- Tracked the scheduler's state such that queue_work() isn't
> > 	  called on media_job_try_queue_job() unless the scheduler is
> > 	  running.
> > 	- Call cancel_work_sync() on media_jobs_cancel_jobs()
> > ---
> >   drivers/media/mc/Makefile  |   2 +-
> >   drivers/media/mc/mc-jobs.c | 428 +++++++++++++++++++++++++++++++++++++++++++++
> >   include/media/media-jobs.h | 317 +++++++++++++++++++++++++++++++++
> >   3 files changed, 746 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/mc/Makefile b/drivers/media/mc/Makefile
> > index 2b7af42ba59c19670f51a5e726e707e638d3351a..9148bbfd1578f82b73d5b2aff53199321f4fa5e5 100644
> > --- a/drivers/media/mc/Makefile
> > +++ b/drivers/media/mc/Makefile
> > @@ -1,7 +1,7 @@
> >   # SPDX-License-Identifier: GPL-2.0
> >   mc-objs	:= mc-device.o mc-devnode.o mc-entity.o \
> > -	   mc-request.o
> > +	   mc-jobs.o mc-request.o
> >   ifneq ($(CONFIG_USB),)
> >   	mc-objs += mc-dev-allocator.o
> > diff --git a/drivers/media/mc/mc-jobs.c b/drivers/media/mc/mc-jobs.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..a390d9ebcb2472cebe6a6714212859ac710a338b
> > --- /dev/null
> > +++ b/drivers/media/mc/mc-jobs.c
> > @@ -0,0 +1,428 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Media jobs framework
> > + *
> > + * Copyright 2025 Ideas on Board Oy
> > + *
> > + * Author: Daniel Scally <dan.scally@ideasonboard.com>
> > + */
> > +
> > +#include <linux/cleanup.h>
> > +#include <linux/slab.h>
> > +
> > +#include <media/media-device.h>
> > +#include <media/media-entity.h>
> > +#include <media/media-jobs.h>
> > +
> > +/* Synchronise access to the global schedulers list */
> > +static DEFINE_MUTEX(media_job_schedulers_lock);
> > +static LIST_HEAD(media_job_schedulers);
> > +
> > +static struct media_job_contributor *
> > +__media_jobs_next_contributor(struct media_job_scheduler *sched,
> > +			      struct media_job_contributor *contributor,
> > +			      enum media_job_types type)
> > +{
> > +	contributor = contributor ? list_next_entry(contributor, list)
> > +		    : list_first_entry(&sched->contributors, typeof(*contributor), list);
> > +
> > +	list_for_each_entry_from(contributor, &sched->contributors, list)
> > +		if (contributor->type == type)
> > +			return contributor;
> > +
> > +	return NULL;
> > +}
> > +
> > +/**
> > + * for_each_media_job_contributor() - Iterate through an scheduler's job
> > + *				      contributors, filtering on type
> > + *
> > + * @sched:		Pointer to the &media_job_scheduler
> > + * @contributor:	Pointer to a &media_job_contributor to hold the values
> > + * @type:		Value from &media_job_types to filter on
> > + */
> > +#define for_each_media_job_contributor(sched, contributor, type)		\
> > +	for (contributor = __media_jobs_next_contributor(sched, NULL, type);	\
> > +	     contributor;							\
> > +	     contributor = __media_jobs_next_contributor(sched, contributor, type))
> > +
> > +
> > +int media_jobs_add_job_step(struct media_job *job, void (*run_step)(void *data),
> > +			    void *data, u32 flags, unsigned int pos)
> > +{
> > +	struct media_job_step *step, *tmp;
> > +	int ret;
> > +
> > +	if (!flags) {
> > +		WARN_ONCE(1, "%s(): No flag bits set\n", __func__);
> > +		return -EINVAL;
> > +	}
> > +
> > +	/* Check the number of set flags; they're mutually exclusive. */
> > +	if (hweight32(flags) > 1) {
> > +		WARN_ONCE(1, "%s(): Multiple flag bits set\n", __func__);
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (!run_step) {
> > +		WARN_ONCE(1, "%s(): No run_step function passed\n", __func__);
> > +		return -EINVAL;
> > +	}
> > +
> > +	guard(spinlock)(&job->lock);
> > +
> > +	step = kzalloc(sizeof(*step), GFP_KERNEL);
>
> Oops! This will sleep.
>
> How about using a mutex instead? You should probably also move this after
> memory allocation as there's nothing there where access needs to be
> serialised.
>

I suggest you compile with CONFIG_PROVE_LOCKING for such a core piece
of infrastructure. It will flag with a WARNING invalid lock usages
(like calling a function that could sleep while holding a spinlock) to
be caught early during development


> > +	if (!step)
> > +		return -ENOMEM;
> > +
> > +	step->run_step = run_step;
> > +	step->data = data;
> > +	step->flags = flags;
> > +	step->pos = pos;
> > +
> > +	/*
> > +	 * We need to decide where to place the step. If the list is empty that
> > +	 * is really easy (and also the later code is much easier if the code is
> > +	 * guaranteed not to be empty...)
> > +	 */
> > +	if (list_empty(&job->steps)) {
> > +		list_add_tail(&step->list, &job->steps);
> > +		return 0;
> > +	}
> > +
> > +	/*
> > +	 * If we've been asked to place it at a specific position from the end
> > +	 * of the list, we cycle back through it until either we exhaust the
> > +	 * list or find an entry that needs to go further from the back than the
> > +	 * new one.
> > +	 */
> > +	if (flags & MEDIA_JOBS_FL_STEP_FROM_BACK) {
> > +		list_for_each_entry_reverse(tmp, &job->steps, list) {
> > +			if (tmp->flags == flags && tmp->pos == pos) {
> > +				ret = -EINVAL;
> > +				goto err_free_step;
> > +			}
> > +
> > +			if (tmp->flags != MEDIA_JOBS_FL_STEP_FROM_BACK ||
> > +			    tmp->pos > pos)
> > +				break;
> > +		}
> > +
> > +		/*
> > +		 * If the entry we broke on is also one placed from the back and
> > +		 * should be closer to the back than the new one, we place the
> > +		 * new one in front of it...otherwise place the new one behind
> > +		 * it.
> > +		 */
> > +		if (tmp->flags == flags && tmp->pos < pos)
> > +			list_add_tail(&step->list, &tmp->list);
> > +		else
> > +			list_add(&step->list, &tmp->list);
> > +
> > +		return 0;
> > +	}
> > +
> > +	/*
> > +	 * If we've been asked to place it a specific position from the front of
> > +	 * the list we do the same kind of operation, but going from the front
> > +	 * instead.
> > +	 */
> > +	if (flags & MEDIA_JOBS_FL_STEP_FROM_FRONT) {
> > +		list_for_each_entry(tmp, &job->steps, list) {
> > +			if (tmp->flags == flags && tmp->pos == pos) {
> > +				ret = -EINVAL;
> > +				goto err_free_step;
> > +			}
> > +
> > +			if (tmp->flags != MEDIA_JOBS_FL_STEP_FROM_FRONT ||
> > +			    tmp->pos > pos)
> > +				break;
> > +		}
> > +
> > +		/*
> > +		 * If the entry we broke on is also placed from the front and
> > +		 * should be closed to the front than the new one, we place the
> > +		 * new one behind it, otherwise in front of it.
> > +		 */
> > +		if (tmp->flags == flags && tmp->pos < pos)
> > +			list_add(&step->list, &tmp->list);
> > +		else
> > +			list_add_tail(&step->list, &tmp->list);
> > +
> > +		return 0;
> > +	}
> > +
> > +	/*
> > +	 * If the step is flagged as "can go anywhere" we just need to try to
> > +	 * find the first "from the back" entry and add it immediately before
> > +	 * that. If we can't find one, add it after whatever we did find.
> > +	 */
> > +	if (flags & MEDIA_JOBS_FL_STEP_ANYWHERE) {
> > +		list_for_each_entry(tmp, &job->steps, list)
> > +			if ((tmp->flags & MEDIA_JOBS_FL_STEP_FROM_BACK))
> > +				break;
> > +
> > +		if ((tmp->flags & MEDIA_JOBS_FL_STEP_FROM_BACK) ||
> > +		    list_entry_is_head(tmp, &job->steps, list))
> > +			list_add_tail(&step->list, &tmp->list);
> > +		else
> > +			list_add(&step->list, &tmp->list);
> > +
> > +		return 0;
> > +	}
> > +
> > +	/* Shouldn't get here, unless the flag value is wrong. */
> > +	WARN_ONCE(1, "%s(): Invalid flag value\n", __func__);
> > +	ret = -EINVAL;
> > +
> > +err_free_step:
> > +	kfree(step);
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(media_jobs_add_job_step);
>
> I wonder if we should use a namespace. This is rather a question than a
> suggestion.
>
> > +
> > +static void media_jobs_free_job(struct media_job *job)
> > +{
> > +	struct media_job_step *step, *stmp;
> > +
> > +	scoped_guard(spinlock, &job->lock) {
>
> Nice use of the guard macros!
>
> > +		list_for_each_entry_safe(step, stmp, &job->steps, list) {
> > +			list_del(&step->list);
> > +			kfree(step);
> > +		}
> > +	}
> > +
> > +	kfree(job);
> > +}
> > +
> > +int media_jobs_try_queue_job(struct media_job_scheduler *sched,
> > +			     enum media_job_types type)
> > +{
> > +	struct media_job_contributor *contributor;
> > +	struct media_job *job;
> > +	int ret;
> > +
> > +	if (!sched)
> > +		return 0;
> > +
> > +	guard(spinlock)(&sched->lock);
> > +
> > +	for_each_media_job_contributor(sched, contributor, type) {
> > +		if (contributor->ops->ready &&
> > +		    !contributor->ops->ready(contributor->data))
> > +			return 0;
> > +	}
> > +
> > +	for_each_media_job_contributor(sched, contributor, type)
> > +		if (contributor->ops->queue)
> > +			contributor->ops->queue(contributor->data);
> > +
> > +	job = kzalloc(sizeof(*job), GFP_KERNEL);
>
> Here, too. Allocate before taking the lock?
>
> Is there a possibility to store the readiness of each contributor in struct
> media_job_scheduler? I think you needed an integer to tell the number of
> ready contributors and the total number of contributors. This should reduce
> churn related to this.
>
> > +	if (!job) {
> > +		ret = -ENOMEM;
> > +		goto err_abort_contributors;
> > +	}
> > +
> > +	spin_lock_init(&job->lock);
> > +	INIT_LIST_HEAD(&job->steps);
> > +	job->type = type;
> > +	job->sched = sched;
> > +
> > +	for_each_media_job_contributor(sched, contributor, type) {
> > +		if (contributor->ops->add_steps) {
> > +			ret = contributor->ops->add_steps(job, contributor->data);
> > +			if (ret)
> > +				goto err_free_job;
> > +		}
> > +	}
> > +
> > +	list_add_tail(&job->list, &sched->queue);
> > +
> > +	if (sched->running)
> > +		queue_work(sched->async_wq, &sched->work);
>
> I'd also do this after releasing the lock.
>
> > +
> > +	return 0;
> > +
> > +err_free_job:
> > +	media_jobs_free_job(job);
> > +err_abort_contributors:
> > +	for_each_media_job_contributor(sched, contributor, type)
> > +		if (contributor->ops->abort)
> > +			contributor->ops->abort(contributor->data);
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(media_jobs_try_queue_job);
> > +
> > +static void __media_jobs_run_jobs(struct work_struct *work)
> > +{
> > +	struct media_job_scheduler *sched = container_of(work,
>
> Break the line after '=' and this will look prettier.
>
> > +							 struct media_job_scheduler,
> > +							 work);
> > +	struct media_job_step *step;
> > +	struct media_job *job;
> > +
> > +	while (true) {
> > +		scoped_guard(spinlock, &sched->lock) {
> > +			if (list_empty(&sched->queue))
> > +				return;
> > +
> > +			job = list_first_entry(&sched->queue, struct media_job,
> > +					       list);
> > +
> > +			list_del(&job->list);
> > +		}
> > +
> > +		list_for_each_entry(step, &job->steps, list) {
> > +			/*
> > +			 * Theoretically impossible as this should have been
> > +			 * validated in media_jobs_add_job_step()
> > +			 */
> > +			if (!step->run_step)
> > +				WARN_ONCE(1, "%s(): No .run_step() operation\n",
> > +					  __func__);
> > +
> > +			step->run_step(step->data);
> > +		}
> > +
> > +		media_jobs_free_job(job);
> > +	}
> > +}
> > +
> > +void media_jobs_run_jobs(struct media_job_scheduler *sched)
> > +{
> > +	if (!sched)
> > +		return;
> > +
> > +	guard(spinlock)(&sched->lock);
> > +
> > +	sched->running = true;
> > +	queue_work(sched->async_wq, &sched->work);
>
> I'd avoid holding the lock while queueing the work: it's not necessary.
>
> > +}
> > +EXPORT_SYMBOL_GPL(media_jobs_run_jobs);
> > +
> > +static void __media_jobs_cancel_jobs(struct media_job_scheduler *sched)
> > +{
> > +	struct media_job_contributor *contributor;
> > +	struct media_job *job, *jtmp;
> > +
> > +	lockdep_assert_held(&sched->lock);
> > +	cancel_work_sync(&sched->work);
>
> cancel_work_sync() will sleep, won't it?
>
> > +
> > +	list_for_each_entry_safe(job, jtmp, &sched->queue, list) {
> > +		list_del(&job->list);
> > +
> > +		list_for_each_entry(contributor, &sched->contributors, list)
> > +			if (contributor->ops->abort)
> > +				contributor->ops->abort(contributor->data);
> > +
> > +		media_jobs_free_job(job);
> > +	}
> > +}
> > +
> > +void media_jobs_cancel_jobs(struct media_job_scheduler *sched)
> > +{
> > +	if (!sched)
> > +		return;
> > +
> > +	guard(spinlock)(&sched->lock);
> > +	sched->running = false;
> > +	__media_jobs_cancel_jobs(sched);
> > +}
> > +EXPORT_SYMBOL_GPL(media_jobs_cancel_jobs);
> > +
> > +int media_jobs_register_job_contributor(struct media_job_scheduler *sched,
> > +					struct media_job_contributor_ops *ops,
> > +					void *data, enum media_job_types type)
> > +{
> > +	struct media_job_contributor *contributor;
> > +
> > +	if (!ops || !data)
> > +		return -EINVAL;
> > +
> > +	contributor = kzalloc(sizeof(*contributor), GFP_KERNEL);
> > +	if (!contributor)
> > +		return -ENOMEM;
> > +
> > +	contributor->type = type;
> > +	contributor->ops = ops;
> > +	contributor->data = data;
> > +
> > +	guard(spinlock)(&sched->lock);
> > +	list_add_tail(&contributor->list, &sched->contributors);
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(media_jobs_register_job_contributor);
> > +
> > +static void __media_jobs_put_scheduler(struct kref *kref)
> > +{
> > +	struct media_job_scheduler *sched =
> > +		container_of(kref, struct media_job_scheduler, kref);
> > +	struct media_job_contributor *contributor, *tmp;
> > +
> > +	cancel_work_sync(&sched->work);
> > +	destroy_workqueue(sched->async_wq);
> > +
> > +	scoped_guard(spinlock, &sched->lock) {
> > +		__media_jobs_cancel_jobs(sched);
> > +
> > +		list_for_each_entry_safe(contributor, tmp, &sched->contributors,
> > +					 list) {
> > +			list_del(&contributor->list);
> > +			kfree(contributor);
> > +		}
> > +	}
> > +
> > +	list_del(&sched->list);
> > +	kfree(sched);
> > +}
> > +
> > +void media_jobs_put_scheduler(struct media_job_scheduler *sched)
> > +{
> > +	kref_put(&sched->kref, __media_jobs_put_scheduler);
> > +}
> > +EXPORT_SYMBOL_GPL(media_jobs_put_scheduler);
> > +
> > +struct media_job_scheduler *media_jobs_get_scheduler(struct media_device *mdev)
> > +{
> > +	struct media_job_scheduler *sched;
> > +	char workqueue_name[32];
> > +	int ret;
> > +
> > +	guard(mutex)(&media_job_schedulers_lock);
> > +
> > +	list_for_each_entry(sched, &media_job_schedulers, list) {
> > +		if (sched->mdev == mdev) {
> > +			kref_get(&sched->kref);
> > +			return sched;
> > +		}
> > +	}
> > +
> > +	ret = snprintf(workqueue_name, sizeof(workqueue_name),
> > +		       "mc jobs (%s)", mdev->driver_name);
> > +	if (!ret)
> > +		return ERR_PTR(-EINVAL);
> > +
> > +	sched = kzalloc(sizeof(*sched), GFP_KERNEL);
> > +	if (!sched)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	sched->async_wq = alloc_workqueue(workqueue_name, 0, 0);
> > +	if (!sched->async_wq) {
> > +		kfree(sched);
> > +		return ERR_PTR(-EINVAL);
> > +	}
> > +
> > +	sched->mdev = mdev;
> > +	kref_init(&sched->kref);
> > +	spin_lock_init(&sched->lock);
> > +	INIT_LIST_HEAD(&sched->contributors);
> > +	INIT_LIST_HEAD(&sched->queue);
> > +	INIT_WORK(&sched->work, __media_jobs_run_jobs);
> > +
> > +	list_add_tail(&sched->list, &media_job_schedulers);
> > +
> > +	return sched;
> > +}
> > +EXPORT_SYMBOL_GPL(media_jobs_get_scheduler);
> > diff --git a/include/media/media-jobs.h b/include/media/media-jobs.h
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..3faa3bc7f311ff987ecffa38a56ec2ddf8d6c034
> > --- /dev/null
> > +++ b/include/media/media-jobs.h
> > @@ -0,0 +1,317 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Media jobs framework
> > + *
> > + * Copyright 2025 Ideas on Board Oy
> > + *
> > + * Author: Daniel Scally <dan.scally@ideasonboard.com>
> > + */
> > +
> > +#ifndef _MEDIA_JOBS_H
> > +#define _MEDIA_JOBS_H
> > +
> > +#include <linux/kref.h>
> > +#include <linux/list.h>
> > +#include <linux/mutex.h>
> > +#include <linux/spinlock.h>
> > +#include <linux/types.h>
> > +#include <linux/workqueue.h>
> > +
> > +struct media_device;
> > +struct media_entity;
> > +struct media_job;
> > +
> > +/**
> > + * define MEDIA_JOBS_FL_STEP_ANYWHERE - \
> > + *    Flag a media job step as able to run anytime
> > + *
> > + * This flag informs the framework that a job step does not need a particular
> > + * position in the list of job steps and can be placed anywhere.
> > + */
> > +#define MEDIA_JOBS_FL_STEP_ANYWHERE			BIT(0)
> > +
> > +/**
> > + * define MEDIA_JOBS_FL_STEP_FROM_FRONT - \
> > + *    Flag a media job step as needing to be placed near the start of the list
> > + *
> > + * This flag informs the framework that a job step needs to be placed at a set
> > + * position from the start of the list of job steps.
> > + */
> > +#define MEDIA_JOBS_FL_STEP_FROM_FRONT			BIT(1)
> > +
> > +/**
> > + * define MEDIA_JOBS_FL_STEP_FROM_BACK - \
> > + *    Flag a media job step as needing to be placed near the end of the list
> > + *
> > + * This flag informs the framework that a job step needs to be placed at a set
> > + * position from the end of the list of job steps.
> > + */
> > +#define MEDIA_JOBS_FL_STEP_FROM_BACK			BIT(2)
> > +
> > +/**
> > + * enum media_job_types - Type of media job
> > + *
> > + * @MEDIA_JOB_TYPE_PIPELINE_PULSE:	A data event moving through the media
> > + *					pipeline
> > + *
> > + * This enumeration details different types of media jobs. The type can be used
> > + * to differentiate between which steps and dependencies a driver needs to add
> > + * to a job when it is created.
> > + */
> > +enum media_job_types {
> > +	MEDIA_JOB_TYPE_PIPELINE_PULSE,
> > +};
> > +
> > +/**
> > + * struct media_job_scheduler - A job scheduler for a particular media device
> > + *
> > + * @mdev:		Media device this scheduler is for
> > + * @list:		List head to attach to the global list of schedulers
> > + * @kref:		Reference counter
> > + * @lock:		Lock to protect access to the scheduler
> > + * @contributors:	List of &struct media_job_contributors
> > + * @pending:		List of &struct media_jobs created but not yet queued
> > + * @queue:		List of &struct media_jobs queued to the scheduler
> > + * @work:		Work item to run the jobs
> > + * @async_wq:		Workqueue to run the work on
> > + * @running:		Flag indicating whether the scheduler is running or not
> > + *
> > + * This struct is the main job scheduler struct - drivers wanting to use this
> > + * framework should acquire an instance through media_jobs_get_scheduler() and
> > + * subsequently populate it with job setup functions.
> > + */
> > +struct media_job_scheduler {
> > +	struct media_device *mdev;
> > +	struct list_head list;
> > +	struct kref kref;
> > +
> > +	spinlock_t lock; /* Synchronise access to the struct's lists */
> > +	struct list_head contributors;
> > +	struct list_head pending;
> > +	struct list_head queue;
> > +
> > +	struct work_struct work;
> > +	struct workqueue_struct *async_wq;
> > +	bool running;
> > +};
> > +
> > +/**
> > + * struct media_job_contributor_ops - Operations for a media job contributor
> > + *
> > + * @add_steps:	A function to ask the contributor to add its steps to the job
> > + * @ready:	A function to ask the contributor whether it's ready to run a job
> > + * @queue:	A function to tell the contributor that the job will be queued
> > + * @abort:	A function to tell the contributor that the job has been cancelled
> > + *
> > + * Media jobs have _contributors_ that may require certain conditions to be met
> > + * before running a job and may require certain steps to be taken on running
> > + * a job. For example, a video device may be a contributor and may require
> > + * buffers to have been queued before running a job, and upon running a job may
> > + * write the address of those buffers to hardware. These operations allow a
> > + * driver to define how the media jobs framework should check whether or not
> > + * those pre-conditions are met, what steps to take and how it should inform
> > + * the driver taking action based on the state of those preconditions.
> > + */
> > +struct media_job_contributor_ops {
> > +	int (*add_steps)(struct media_job *job, void *data);
> > +	bool (*ready)(void *data);
> > +	void (*queue)(void *data);
> > +	void (*abort)(void *data);
> > +};
> > +
> > +/**
> > + * struct media_job_contributor - A representation of a contributor to a job
> > + *
> > + * @ops:	The list of operations that this contributor provides
> > + * @type:	The &enum media_job_types that this contributor is for
> > + * @data:	Pointer to the driver data for use with @ops
> > + *
> > + * @list:	The list object to attach to the scheduler
> > + *
> > + * This struct is a representation of a contributor to a media job. The type
> > + * field is used to specify what type of job it contributes to. The @ops member
> > + * defines callbacks into the drivers that allow the framework to check whether
> > + * the contributor is ready to queue a job, inform it that one has been queued,
> > + * abort a queued job and to populate a job with steps that need to be performed
> > + */
> > +struct media_job_contributor {
> > +	struct media_job_contributor_ops *ops;
> > +	enum media_job_types type;
> > +	void *data;
> > +
> > +	struct list_head list;
> > +};
> > +
> > +/**
> > + * struct media_job - A representation of a job to be run through the pipeline
> > + *
> > + * @sched:	Pointer to the media job scheduler
> > + * @type:	The type of the job
> > + *
> > + * @lock:	Lock to protect access to the job's lists
> > + * @list:	List head to attach the job to &struct media_job_scheduler in
> > + *		either the pending or queue lists
> > + * @steps:	List of &struct media_job_step to run the job
> > + *
> > + * This struct holds lists of steps that need to be performed to carry out a
> > + * job in the pipeline.
> > + */
> > +struct media_job {
> > +	struct media_job_scheduler *sched;
> > +	enum media_job_types type;
> > +
> > +	spinlock_t lock; /* Synchronise access to the struct's lists */
> > +	struct list_head list;
> > +	struct list_head steps;
> > +};
> > +
> > +/**
> > + * struct media_job_step - A holder for a function to run as part of a job
> > + *
> > + * @list:	List head to attach the job step to a &struct media_job.steps
> > + * @run_step:	The function to run to perform the step
> > + * @data:	Data to pass to the .run_step() function
> > + * @flags:	Flags to control how the step is ordered within the job's list
> > + *		of steps
> > + * @pos:	Position indicator to control how the step is ordered within the
> > + *		job's list of steps
> > + *
> > + * This struct defines a function that needs to be run as part of the execution
> > + * of a job in a media pipeline, along with information that help the scheduler
> > + * determine what order it should be ran in in reference to the other steps that
> > + * are part of the same job.
> > + */
> > +struct media_job_step {
> > +	struct list_head list;
> > +	void (*run_step)(void *data);
> > +	void *data;
> > +	u32 flags;
> > +	unsigned int pos;
> > +};
> > +
> > +/**
> > + * media_jobs_try_queue_job - Try to queue a &struct media_job
> > + *
> > + * @sched:	Pointer to the job scheduler
> > + * @type:	The type of the media job
> > + *
> > + * Try to queue a media job with the scheduler. This function should be called
> > + * by the drivers whenever a precondition for a media job to be queued is met.
> > + * For example if a driver requires that a buffer be queued before running a job
> > + * then this function should be called when one is queued. The framework will
> > + * check to see if all the contributors to the given job type are ready to queue
> > + * one, and do so if so.
> > + *
> > + * To help reduce conditionals in drivers where a driver supports both the use
> > + * of the media jobs framework and operation without it, this function is a no
> > + * op if @sched is NULL.
> > + *
> > + * Return: 0 on success or a negative error number
> > + */
> > +int media_jobs_try_queue_job(struct media_job_scheduler *sched,
> > +			     enum media_job_types type);
> > +
> > +/**
> > + * media_jobs_add_job_step - Add a step to a media job
> > + *
> > + * @job:	Pointer to the &struct media_job
> > + * @run_step:	Pointer to the function to run to execute the step
> > + * @data:	Pointer to the data to pass to @run_step
> > + * @flags:	One of the MEDIA_JOBS_FL_STEP_* flags
> > + * @pos:	A position indicator to use with @flags
> > + *
> > + * This function adds a step to the job and should be called from the .add_steps
> > + * callbacks for each contributors' operations. The @flags and @pos parameters
> > + * are used to determine the ordering of the steps within the job:
> > + *
> > + * If @flags has the MEDIA_JOBS_FL_STEP_ANYWHERE bit set, the step is placed
> > + * after all steps with MEDIA_JOBS_FL_STEP_FROM_FRONT and before all steps with
> > + * MEDIA_JOBS_FL_STEP_FROM_BACK bit set, but otherwise in whatever order this
> > + * function is called.
> > + *
> > + * If @flags has the MEDIA_JOBS_FL_STEP_FROM_FRONT bit set then the step is
> > + * placed @pos steps from the front of the list. Attempting to place multiple
> > + * steps in the same position will result in an error.
> > + *
> > + * If @flags has the MEDIA_JOBS_FL_STEP_FROM_BACK bit set then the step is
> > + * placed @pos steps from the back of the list. Attempting to place multiple
> > + * steps in the same position will result in an error.
> > + *
> > + * Return: 0 on success or a negative error number
> > + */
> > +int media_jobs_add_job_step(struct media_job *job, void (*run_step)(void *data),
> > +			    void *data, unsigned int flags, unsigned int pos);
> > +
> > +/**
> > + * media_jobs_register_job_contributor - Registers a contributor for a type of
> > + *					 media job
> > + *
> > + * @sched:	Pointer to the media jobs scheduler
> > + * @ops:	Pointer to operations for this contributor
> > + * @data:	Data to pass to the ops functions
> > + * @type:	The type of job that this function should be called for
> > + *
> > + * Drivers that wish to utilise the framework need to use this function to
> > + * register contributors for a type of job. The contributor's operations are
> > + * used to populate the job with steps to perform and help the framework decide
> > + * when a job can be scheduled.
> > + *
> > + * Return: 0 on success or a negative error number
> > + */
> > +int media_jobs_register_job_contributor(struct media_job_scheduler *sched,
> > +					struct media_job_contributor_ops *ops,
> > +					void *data, enum media_job_types type);
> > +
> > +/**
> > + * media_jobs_put_scheduler - Put a reference to the media jobs scheduler
> > + *
> > + * @sched:	Pointer to the media jobs scheduler
> > + *
> > + * This function puts a reference to the media jobs scheduler, and is intended
> > + * to be called in error and exit paths for consuming drivers
> > + */
> > +void media_jobs_put_scheduler(struct media_job_scheduler *sched);
> > +
> > +/**
> > + * media_jobs_get_scheduler - Get a media jobs scheduler
> > + *
> > + * @mdev:	Pointer to the media device associated with the scheduler
> > + *
> > + * This function gets a pointer to a &struct media_job_scheduler associated with
> > + * the media device passed to @mdev. If one is not available then it is
> > + * allocated and returned. This allows multiple drivers sharing a media graph to
> > + * work with the same media job scheduler.
> > + *
> > + * Return: 0 on success or a negative error number
> > + */
> > +struct media_job_scheduler *media_jobs_get_scheduler(struct media_device *mdev);
> > +
> > +/**
> > + * media_jobs_run_jobs - Run any media jobs that are ready in the queue
> > + *
> > + * @sched:	Pointer to the media job scheduler
> > + *
> > + * This function triggers the workqueue that processes any jobs that have been
> > + * queued, and should be called whenever the pipeline is ready to do so.
> > + *
> > + * To help reduce conditionals in drivers where a driver supports both the use
> > + * of the media jobs framework and operation without it, this function is a no
> > + * op if @sched is NULL.
> > + */
> > +void media_jobs_run_jobs(struct media_job_scheduler *sched);
> > +
> > +/**
> > + * media_jobs_cancel_jobs - cancel all waiting jobs
> > + *
> > + * @sched:	Pointer to the media job scheduler
> > + *
> > + * This function iterates over any pending and queued jobs, resets their
> > + * dependencies and frees the job
> > + *
> > + * To help reduce conditionals in drivers where a driver supports both the use
> > + * of the media jobs framework and operation without it, this function is a no
> > + * op if @sched is NULL.
> > + */
> > +void media_jobs_cancel_jobs(struct media_job_scheduler *sched);
> > +
> > +#endif /* _MEDIA_JOBS_H */
> >
>
> --
> Kind regards,
>
> Sakari Ailus
>
>

