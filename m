Return-Path: <linux-media+bounces-33100-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 164D1AC0A38
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 13:00:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 419B89E412A
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 11:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D3E123CEF9;
	Thu, 22 May 2025 11:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lenKXPRW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945721A23A6
	for <linux-media@vger.kernel.org>; Thu, 22 May 2025 11:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747911649; cv=none; b=eLQ4B9xjkPNZECp+Qt1Dn6ydpwlugEVno1UJqHZDlL5UV5ZWalJ3Lc3io+0OFj9b/ZJxFq/+yxjNbxLhxBoS5VXv8PdA/9sVzrqo9PPfJtS74nSWgaWG7mJ/WGrmqD8aQIeBnpsFZtTx0rfRhxrB9BFTgQpEEyEWZwEZE/r+06I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747911649; c=relaxed/simple;
	bh=y+bAxWsy+PXqciATzIbgtxIaQNCdTqTZrPvmP33sgj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RPBnewHqHTfgOEwYOfZzZiGR418cVQVUkpBwZCMdt0b7o7+yEGzPDngpEF4Hiofivu6nTVHi9oF6keOTudNFJWT/ZFbogLmIL2Bnwnididrnn+0AEMXdMaWnKiJ6Tteiia7/Va2gcMNbk62AlZDEWlZvmtbjA+xuJikBufq6gMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lenKXPRW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 76270C59;
	Thu, 22 May 2025 13:00:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747911622;
	bh=y+bAxWsy+PXqciATzIbgtxIaQNCdTqTZrPvmP33sgj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lenKXPRWHLy/E+zjS61XsFRF4bc7YsrYqtk2t4nIxr9806f1jduf9eY21YCM4bvwM
	 RsprropkNbP8YZ/mqV6dROr0KCLwSSdFkHXwb6yn6rrgeSNiyye9rjJ6ccN/7WuuML
	 971sQNWK975awuVl+z+xO8xHH+YbaE9MtvSLzr1g=
Date: Thu, 22 May 2025 13:00:41 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com, 
	laurent.pinchart@ideasonboard.com, mchehab@kernel.org
Subject: Re: [PATCH 2/3] media: mc: Add media jobs framework
Message-ID: <wns3szkk5p2nfq2ad42ph3lzfg3iwdwz2iumumegfpzlijd7g5@fqes6vkqya26>
References: <20250519140403.443915-1-dan.scally@ideasonboard.com>
 <20250519140403.443915-3-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250519140403.443915-3-dan.scally@ideasonboard.com>

Hi Dan, back with more questions :)

On Mon, May 19, 2025 at 03:04:02PM +0100, Daniel Scally wrote:
> Add a new framework to the media subsystem describing media jobs.
> This framework is intended to be able to model the interactions
> between multiple different drivers that need to be run in concert
> to fully control a media pipeline, for example an ISP driver and a
> driver controlling a DMA device that feeds data from memory in to
> that ISP.
>
> The new framework allows all drivers involved to add explicit steps
> that need to be performed, and to control the ordering of those steps
> precisely. Once the job with its steps has been created it's then
> scheduled to be run with a workqueue which executes each step in the
> defined order.
>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
>  drivers/media/mc/Makefile  |   2 +-
>  drivers/media/mc/mc-jobs.c | 446 +++++++++++++++++++++++++++++++++++++
>  include/media/media-jobs.h | 354 +++++++++++++++++++++++++++++
>  3 files changed, 801 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/media/mc/mc-jobs.c
>  create mode 100644 include/media/media-jobs.h
>
> diff --git a/drivers/media/mc/Makefile b/drivers/media/mc/Makefile
> index 2b7af42ba59c..9148bbfd1578 100644
> --- a/drivers/media/mc/Makefile
> +++ b/drivers/media/mc/Makefile
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>
>  mc-objs	:= mc-device.o mc-devnode.o mc-entity.o \
> -	   mc-request.o
> +	   mc-jobs.o mc-request.o
>
>  ifneq ($(CONFIG_USB),)
>  	mc-objs += mc-dev-allocator.o
> diff --git a/drivers/media/mc/mc-jobs.c b/drivers/media/mc/mc-jobs.c
> new file mode 100644
> index 000000000000..1f04cdf63d27
> --- /dev/null
> +++ b/drivers/media/mc/mc-jobs.c
> @@ -0,0 +1,446 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Media jobs framework
> + *
> + * Copyright 2025 Ideas on Board Oy
> + *
> + * Author: Daniel Scally <dan.scally@ideasonboard.com>
> + */
> +
> +#include <linux/cleanup.h>
> +#include <linux/kref.h>
> +#include <linux/list.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +
> +#include <media/media-device.h>
> +#include <media/media-entity.h>
> +#include <media/media-jobs.h>
> +
> +int media_jobs_add_job_step(struct media_job *job, void (*run_step)(void *data),
> +			    void *data, unsigned int flags, unsigned int pos)
> +{
> +	struct media_job_step *step, *tmp;
> +	unsigned int num = flags;
> +	unsigned int count = 0;
> +
> +	guard(spinlock)(&job->lock);
> +
> +	if (!flags) {
> +		WARN_ONCE(1, "%s(): No flag bits set\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	/* Count the number of set flags; they're mutually exclusive. */
> +	while (num) {
> +		num &= (num - 1);
> +		count++;
> +	}
> +
> +	if (count > 1) {
> +		WARN_ONCE(1, "%s(): Multiple flag bits set\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	step = kzalloc(sizeof(*step), GFP_KERNEL);
> +	if (!step)
> +		return -ENOMEM;
> +
> +	step->run_step = run_step;
> +	step->data = data;
> +	step->flags = flags;
> +	step->pos = pos;
> +
> +	/*
> +	 * We need to decide where to place the step. If the list is empty that
> +	 * is really easy (and also the later code is much easier if the code is
> +	 * guaranteed not to be empty...)
> +	 */
> +	if (list_empty(&job->steps)) {
> +		list_add_tail(&step->list, &job->steps);
> +		return 0;
> +	}
> +
> +	/*
> +	 * If we've been asked to place it at a specific position from the end
> +	 * of the list, we cycle back through it until either we exhaust the
> +	 * list or find an entry that needs to go further from the back than the
> +	 * new one.
> +	 */
> +	if ((flags & MEDIA_JOBS_FL_STEP_FROM_BACK)) {
> +		list_for_each_entry_reverse(tmp, &job->steps, list) {
> +			if (tmp->flags == flags && tmp->pos == pos)
> +				return -EINVAL;
> +
> +			if (tmp->flags != MEDIA_JOBS_FL_STEP_FROM_BACK ||
> +			    tmp->pos > pos)
> +				break;
> +		}
> +
> +		/*
> +		 * If the entry we broke on is also one placed from the back and
> +		 * should be closer to the back than the new one, we place the
> +		 * new one in front of it...otherwise place the new one behind
> +		 * it.
> +		 */
> +		if (tmp->flags == flags && tmp->pos < pos)
> +			list_add_tail(&step->list, &tmp->list);
> +		else
> +			list_add(&step->list, &tmp->list);
> +
> +		return 0;
> +	}
> +
> +	/*
> +	 * If we've been asked to place it a specific position from the front of
> +	 * the list we do the same kind of operation, but going from the front
> +	 * instead.
> +	 */
> +	if (flags & MEDIA_JOBS_FL_STEP_FROM_FRONT) {
> +		list_for_each_entry(tmp, &job->steps, list) {
> +			if (tmp->flags == flags && tmp->pos == pos)
> +				return -EINVAL;
> +
> +			if (tmp->flags != MEDIA_JOBS_FL_STEP_FROM_FRONT ||
> +			    tmp->pos > pos)
> +				break;
> +		}
> +
> +		/*
> +		 * If the entry we broke on is also placed from the front and
> +		 * should be closed to the front than the new one, we place the
> +		 * new one behind it, otherwise in front of it.
> +		 */
> +		if (tmp->flags == flags && tmp->pos < pos)
> +			list_add(&step->list, &tmp->list);
> +		else
> +			list_add_tail(&step->list, &tmp->list);
> +
> +		return 0;
> +	}
> +
> +	/*
> +	 * If the step is flagged as "can go anywhere" we just need to try to
> +	 * find the first "from the back" entry and add it immediately before
> +	 * that. If we can't find one, add it after whatever we did find.
> +	 */
> +	if (flags & MEDIA_JOBS_FL_STEP_ANYWHERE) {
> +		list_for_each_entry(tmp, &job->steps, list)
> +			if ((tmp->flags & MEDIA_JOBS_FL_STEP_FROM_BACK))
> +				break;
> +
> +		if ((tmp->flags & MEDIA_JOBS_FL_STEP_FROM_BACK) ||
> +		    list_entry_is_head(tmp, &job->steps, list))
> +			list_add_tail(&step->list, &tmp->list);
> +		else
> +			list_add(&step->list, &tmp->list);
> +
> +		return 0;
> +	}
> +
> +	/* Shouldn't get here, unless the flag value is wrong. */
> +	WARN_ONCE(1, "%s(): Invalid flag value\n", __func__);
> +	return -EINVAL;
> +}
> +EXPORT_SYMBOL_GPL(media_jobs_add_job_step);
> +
> +int media_jobs_add_job_dep(struct media_job *job, struct media_job_dep_ops *ops,
> +			   void *data)
> +{
> +	struct media_job_dep *dep;
> +
> +	if (!ops || !ops->check_dep || !data)
> +		return -EINVAL;
> +
> +	guard(spinlock)(&job->lock);
> +
> +	/* Confirm the same dependency hasn't already been added */
> +	list_for_each_entry(dep, &job->deps, list)
> +		if (dep->ops == ops && dep->data == data)
> +			return -EINVAL;
> +
> +	dep = kzalloc(sizeof(*dep), GFP_KERNEL);
> +	if (!dep)
> +		return -ENOMEM;
> +
> +	dep->ops = ops;
> +	dep->data = data;
> +	list_add(&dep->list, &job->deps);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(media_jobs_add_job_dep);
> +
> +static bool media_jobs_check_pending_job(struct media_job *job,
> +					 enum media_job_types type,
> +					 struct media_job_dep_ops *dep_ops,
> +					 void *data)
> +{
> +	struct media_job_dep *dep;
> +
> +	guard(spinlock)(&job->lock);
> +
> +	if (job->type != type)
> +		return false;
> +
> +	list_for_each_entry(dep, &job->deps, list) {
> +		if (dep->ops == dep_ops && dep->data == data) {
> +			if (dep->met)
> +				return false;
> +
> +			break;
> +		}
> +	}
> +
> +	dep->met = true;
> +	return true;
> +}
> +
> +static struct media_job *media_jobs_get_job(struct media_job_scheduler *sched,
> +					    enum media_job_types type,
> +					    struct media_job_dep_ops *dep_ops,
> +					    void *dep_data)
> +{
> +	struct media_job_setup_func *jsf;
> +	struct media_job *job;
> +	int ret;
> +
> +	list_for_each_entry(job, &sched->pending, list)
> +		if (media_jobs_check_pending_job(job, type, dep_ops, dep_data))
> +			return job;
> +

Thanks to your offline explanation, I got how this works now, however
some questions here

The basic idea is that each driver that registers a 'setup' function
adds to a job, when its created, its list of dependencies.

When a job is "try_queue" and we get here, to decide if a new job has
to be created or if we have to run one which is already in the pending
queue.

How is this identification performed ? Each entry point (assume it's a
video device op) will populate the job with its own dependencies,
identified by the dep_ops and data address.

We walk the 'pending' queue in the media_jobs_check_pending_job()
function and we search for one job not already visited from the same
entry point, identified by the dep_ops (the 'visited' state is kept by
the deps->met flag).

Let's assume 2 video devices X and Y

qbuf(x) -> try_queue_job() -> new job created on 'pending'
qbuf(x) -> try_queue_job() -> the job in the queue has 'deps->met' set, skip
it and create a new one
qbuf(y) -> try_queue_job() -> the first job in the queue has not
deps->set, so return it

All in all I would describe this as: when requesting a job try to find
the first one not already visited by this entry point, if none is
available create a new one.

Now, we briefly discussed that when moving to multi-context comparing
dep_ops and data to identify an entry point won't be enough: buffers
from the same video device but from different contexts do not have to
be associated together. So we'll need to extend the identification
criteria. Also, I don't find the idea of using dep_ops and data for
this purpose particularly neat, as it makes mandatory to add
dependencies to a job in the setup function, something not all driver
might want to do ?

There might be ways to handle this "track the entry point" thing that
could be separated by deps, making deps do what they actually are
described for: track dependencies to validate if a job can be run or
not. Before exploring options, I would like to know if this only mine
concern or is it shared by others.

> +	job = kzalloc(sizeof(*job), GFP_KERNEL);
> +	if (!job)
> +		return ERR_PTR(-ENOMEM);
> +
> +	spin_lock_init(&job->lock);
> +	INIT_LIST_HEAD(&job->deps);
> +	INIT_LIST_HEAD(&job->steps);
> +	job->type = type;
> +	job->sched = sched;
> +
> +	list_for_each_entry(jsf, &sched->setup_funcs, list) {
> +		if (jsf->type != type)
> +			continue;
> +
> +		ret = jsf->job_setup(job, jsf->data);
> +		if (ret) {
> +			kfree(job);
> +			return ERR_PTR(ret);
> +		}
> +	}
> +
> +	list_add_tail(&job->list, &sched->pending);
> +
> +	/* This marks the dependency as met */
> +	media_jobs_check_pending_job(job, type, dep_ops, dep_data);
> +
> +	return job;
> +}
> +
> +static void media_jobs_free_job(struct media_job *job, bool reset)
> +{
> +	struct media_job_step *step, *stmp;
> +	struct media_job_dep *dep, *dtmp;
> +
> +	scoped_guard(spinlock, &job->lock) {
> +		list_for_each_entry_safe(dep, dtmp, &job->deps, list) {
> +			if (reset && dep->ops->reset_dep)
> +				dep->ops->reset_dep(dep->data);
> +
> +			list_del(&dep->list);
> +			kfree(dep);
> +		}
> +
> +		list_for_each_entry_safe(step, stmp, &job->steps, list) {
> +			list_del(&step->list);
> +			kfree(step);
> +		}
> +	}
> +
> +	list_del(&job->list);
> +	kfree(job);
> +}
> +
> +int media_jobs_try_queue_job(struct media_job_scheduler *sched,
> +			     enum media_job_types type,
> +			     struct media_job_dep_ops *dep_ops, void *dep_data)
> +{
> +	struct media_job_dep *dep;
> +	struct media_job *job;
> +
> +	if (!sched)
> +		return 0;
> +
> +	guard(spinlock)(&sched->lock);
> +
> +	job = media_jobs_get_job(sched, type, dep_ops, dep_data);
> +	if (IS_ERR(job))
> +		return PTR_ERR(job);
> +
> +	list_for_each_entry(dep, &job->deps, list)
> +		if (!dep->ops->check_dep(dep->data))
> +			return 0; /* Not a failure */
> +
> +	list_for_each_entry(dep, &job->deps, list)
> +		if (dep->ops->clear_dep)
> +			dep->ops->clear_dep(dep->data);
> +
> +	list_move_tail(&job->list, &sched->queue);
> +	queue_work(sched->async_wq, &sched->work);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(media_jobs_try_queue_job);
> +
> +static void __media_jobs_run_jobs(struct work_struct *work)
> +{
> +	struct media_job_scheduler *sched = container_of(work,
> +							 struct media_job_scheduler,
> +							 work);
> +	struct media_job_step *step;
> +	struct media_job *job;
> +
> +	while (true) {
> +		scoped_guard(spinlock, &sched->lock) {
> +			if (list_empty(&sched->queue))
> +				return;
> +
> +			job = list_first_entry(&sched->queue, struct media_job,
> +					       list);
> +		}
> +
> +		list_for_each_entry(step, &job->steps, list)
> +			step->run_step(step->data);
> +
> +		media_jobs_free_job(job, false);
> +	}
> +}
> +
> +void media_jobs_run_jobs(struct media_job_scheduler *sched)
> +{
> +	if (!sched)
> +		return;
> +
> +	queue_work(sched->async_wq, &sched->work);
> +}
> +EXPORT_SYMBOL_GPL(media_jobs_run_jobs);
> +
> +static void __media_jobs_cancel_jobs(struct media_job_scheduler *sched)
> +{
> +	struct media_job *job, *jtmp;
> +
> +	list_for_each_entry_safe(job, jtmp, &sched->pending, list)
> +		media_jobs_free_job(job, true);
> +
> +	list_for_each_entry_safe(job, jtmp, &sched->queue, list)
> +		media_jobs_free_job(job, true);
> +}
> +
> +void media_jobs_cancel_jobs(struct media_job_scheduler *sched)
> +{
> +	if (!sched)
> +		return;
> +
> +	guard(spinlock)(&sched->lock);
> +	__media_jobs_cancel_jobs(sched);
> +}
> +EXPORT_SYMBOL_GPL(media_jobs_cancel_jobs);
> +
> +int media_jobs_add_job_setup_func(struct media_job_scheduler *sched,
> +				  int (*job_setup)(struct media_job *job, void *data),
> +				  void *data, enum media_job_types type)
> +{
> +	struct media_job_setup_func *new_setup_func;
> +
> +	guard(spinlock)(&sched->lock);
> +
> +	new_setup_func = kzalloc(sizeof(*new_setup_func), GFP_KERNEL);
> +	if (!new_setup_func)
> +		return -ENOMEM;
> +
> +	new_setup_func->type = type;
> +	new_setup_func->job_setup = job_setup;
> +	new_setup_func->data = data;
> +	list_add_tail(&new_setup_func->list, &sched->setup_funcs);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(media_jobs_add_job_setup_func);
> +
> +static void __media_jobs_put_scheduler(struct kref *kref)
> +{
> +	struct media_job_scheduler *sched =
> +		container_of(kref, struct media_job_scheduler, kref);
> +	struct media_job_setup_func *func, *ftmp;
> +
> +	cancel_work_sync(&sched->work);
> +	destroy_workqueue(sched->async_wq);
> +
> +	scoped_guard(spinlock, &sched->lock) {
> +		__media_jobs_cancel_jobs(sched);
> +
> +		list_for_each_entry_safe(func, ftmp, &sched->setup_funcs, list) {
> +			list_del(&func->list);
> +			kfree(func);
> +		}
> +	}
> +
> +	list_del(&sched->list);
> +	kfree(sched);
> +}
> +
> +void media_jobs_put_scheduler(struct media_job_scheduler *sched)
> +{
> +	kref_put(&sched->kref, __media_jobs_put_scheduler);
> +}
> +EXPORT_SYMBOL_GPL(media_jobs_put_scheduler);
> +
> +struct media_job_scheduler *media_jobs_get_scheduler(struct media_device *mdev)
> +{
> +	struct media_job_scheduler *sched;
> +	char workqueue_name[32];
> +	int ret;
> +
> +	guard(mutex)(&media_job_schedulers_lock);
> +
> +	list_for_each_entry(sched, &media_job_schedulers, list) {
> +		if (sched->mdev == mdev) {
> +			kref_get(&sched->kref);
> +			return sched;
> +		}
> +	}
> +
> +	ret = snprintf(workqueue_name, sizeof(workqueue_name),
> +		       "mc jobs (%s)", mdev->driver_name);
> +	if (!ret)
> +		return ERR_PTR(-EINVAL);
> +
> +	sched = kzalloc(sizeof(*sched), GFP_KERNEL);
> +	if (!sched)
> +		return ERR_PTR(-ENOMEM);
> +
> +	sched->async_wq = alloc_workqueue(workqueue_name, 0, 0);
> +	if (!sched->async_wq) {
> +		kfree(sched);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	sched->mdev = mdev;
> +	kref_init(&sched->kref);
> +	spin_lock_init(&sched->lock);
> +	INIT_LIST_HEAD(&sched->setup_funcs);
> +	INIT_LIST_HEAD(&sched->pending);
> +	INIT_LIST_HEAD(&sched->queue);
> +	INIT_WORK(&sched->work, __media_jobs_run_jobs);
> +
> +	list_add_tail(&sched->list, &media_job_schedulers);
> +
> +	return sched;
> +}
> +EXPORT_SYMBOL_GPL(media_jobs_get_scheduler);
> +
> +LIST_HEAD(media_job_schedulers);
> +
> +/* Synchronise access to the global schedulers list */
> +DEFINE_MUTEX(media_job_schedulers_lock);
> diff --git a/include/media/media-jobs.h b/include/media/media-jobs.h
> new file mode 100644
> index 000000000000..a97270861251
> --- /dev/null
> +++ b/include/media/media-jobs.h
> @@ -0,0 +1,354 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Media jobs framework
> + *
> + * Copyright 2025 Ideas on Board Oy
> + *
> + * Author: Daniel Scally <dan.scally@ideasonboard.com>
> + */
> +
> +#include <linux/kref.h>
> +#include <linux/list.h>
> +#include <linux/mutex.h>
> +#include <linux/spinlock.h>
> +#include <linux/types.h>
> +#include <linux/workqueue.h>
> +
> +#ifndef _MEDIA_JOBS_H
> +#define _MEDIA_JOBS_H
> +
> +struct media_device;
> +struct media_entity;
> +struct media_job;
> +struct media_job_dep;
> +
> +/**
> + * define MEDIA_JOBS_FL_STEP_ANYWHERE - \
> + *    Flag a media job step as able to run anytime
> + *
> + * This flag informs the framework that a job step does not need a particular
> + * position in the list of job steps and can be placed anywhere.
> + */
> +#define MEDIA_JOBS_FL_STEP_ANYWHERE			BIT(0)
> +
> +/**
> + * define MEDIA_JOBS_FL_STEP_FROM_FRONT - \
> + *    Flag a media job step as needing to be placed near the start of the list
> + *
> + * This flag informs the framework that a job step needs to be placed at a set
> + * position from the start of the list of job steps.
> + */
> +#define MEDIA_JOBS_FL_STEP_FROM_FRONT			BIT(1)
> +
> +/**
> + * define MEDIA_JOBS_FL_STEP_FROM_BACK - \
> + *    Flag a media job step as needing to be placed near the end of the list
> + *
> + * This flag informs the framework that a job step needs to be placed at a set
> + * position from the end of the list of job steps.
> + */
> +#define MEDIA_JOBS_FL_STEP_FROM_BACK			BIT(2)
> +
> +/**
> + * enum media_job_types - Type of media job
> + *
> + * @MEDIA_JOB_TYPE_PIPELINE_PULSE:	A data event moving through the media
> + *					pipeline
> + *
> + * This enumeration details different types of media jobs. The type can be used
> + * to differentiate between which steps and dependencies a driver needs to add
> + * to a job when it is created.
> + */
> +enum media_job_types {
> +	MEDIA_JOB_TYPE_PIPELINE_PULSE,
> +};
> +
> +/**
> + * struct media_job_scheduler - A job scheduler for a particular media device
> + *
> + * @mdev:		Media device this scheduler is for
> + * @list:		List head to attach to the global list of schedulers
> + * @kref:		Reference counter
> + * @lock:		Lock to protect access to the scheduler
> + * @setup_funcs:	List of &struct media_job_setup_func to populate jobs
> + * @pending:		List of &struct media_jobs created but not yet queued
> + * @queue:		List of &struct media_jobs queued to the scheduler
> + * @work:		Work item to run the jobs
> + * @async_wq:		Workqueue to run the work on
> + *
> + * This struct is the main job scheduler struct - drivers wanting to use this
> + * framework should acquire an instance through media_jobs_get_scheduler() and
> + * subsequently populate it with job setup functions.
> + */
> +struct media_job_scheduler {
> +	struct media_device *mdev;
> +	struct list_head list;
> +	struct kref kref;
> +
> +	spinlock_t lock; /* Synchronise access to the struct's lists */
> +	struct list_head setup_funcs;
> +	struct list_head pending;
> +	struct list_head queue;
> +	struct work_struct work;
> +	struct workqueue_struct *async_wq;
> +};
> +
> +/**
> + * struct media_job_setup_func - A function to populate a media job with steps
> + *				 and dependencies
> + *
> + * @list:	The list object to attach to the scheduler
> + * @type:	The &enum media_job_types that this function populates a job for
> + * @job_setup:	Function pointer to the driver's job setup function
> + * @data:	Pointer to the driver data for use with @job_setup
> + *
> + * This struct holds data about the functions a driver registers with the jobs
> + * framework in order to populate a new job with steps and dependencies.
> + */
> +struct media_job_setup_func {
> +	struct list_head list;
> +	enum media_job_types type;
> +	int (*job_setup)(struct media_job *job, void *data);
> +	void *data;
> +};
> +
> +/**
> + * struct media_job - A representation of a job to be run through the pipeline
> + *
> + * @lock:	Lock to protect access to the job's lists
> + * @list:	List head to attach the job to &struct media_job_scheduler in
> + *		either the pending or queue lists
> + * @steps:	List of &struct media_job_step to run the job
> + * @deps:	List of &struct media_job_dep to check that the job can be
> + *		queued
> + * @sched:	Pointer to the media job scheduler
> + * @type:	The type of the job
> + *
> + * This struct holds lists of steps that need to be performed to carry out a
> + * job in the pipeline. A separate list of dependencies allows the queueing of
> + * the job to be delayed until all drivers are ready to carry it out.
> + */
> +struct media_job {
> +	spinlock_t lock; /* Synchronise access to the struct's lists 6*/
> +	struct list_head list;
> +	struct list_head steps;
> +	struct list_head deps;
> +	struct media_job_scheduler *sched;
> +	enum media_job_types type;
> +};
> +
> +/**
> + * struct media_job_step - A holder for a function to run as part of a job
> + *
> + * @list:	List head to attach the job step to a &struct media_job.steps
> + * @run_step:	The function to run to perform the step
> + * @data:	Data to pass to the .run_step() function
> + * @flags:	Flags to control how the step is ordered within the job's list
> + *		of steps
> + * @pos:	Position indicator to control how the step is ordered within the
> + *		job's list of steps
> + *
> + * This struct defines a function that needs to be run as part of the execution
> + * of a job in a media pipeline, along with information that help the scheduler
> + * determine what order it should be ran in in reference to the other steps that
> + * are part of the same job.
> + */
> +struct media_job_step {
> +	struct list_head list;
> +	void (*run_step)(void *data);
> +	void *data;
> +	unsigned int flags;
> +	unsigned int pos;
> +};
> +
> +/**
> + * struct media_job_dep_ops - Operations to manage a media job dependency
> + *
> + * @check_dep:	A function to ask the driver whether the dependency is met
> + * @clear_dep:	A function to tell the driver that the job has been queued
> + * @reset_dep:	A function to tell the driver that the job has been cancelled
> + *
> + * Media jobs have dependencies, such as requiring buffers to be queued. These
> + * operations allow a driver to define how the media jobs framework should check
> + * whether or not those dependencies are met and how it should inform them that
> + * it is taking action based on the state of those dependencies.
> + */
> +struct media_job_dep_ops {
> +	bool (*check_dep)(void *data);
> +	void (*clear_dep)(void *data);
> +	void (*reset_dep)(void *data);
> +};
> +
> +/**
> + * struct media_job_dep - Representation of media job dependency
> + *
> + * @list:	List head to attach to a &struct media_job.deps
> + * @ops:	A pointer to the dependency's operations functions
> + * @met:	A flag to record whether or not the dependency is met
> + * @data:	Data to pass to the dependency's operations
> + *
> + * This struct represents a dependency of a media job. The operations member
> + * holds pointers to functions allowing the framework to interact with the
> + * driver to check whether or not the dependency is met.
> + */
> +struct media_job_dep {
> +	struct list_head list;
> +	struct media_job_dep_ops *ops;
> +	bool met;
> +	void *data;
> +};
> +
> +/**
> + * media_jobs_try_queue_job - Try to queue a &struct media_job
> + *
> + * @sched:	Pointer to the job scheduler
> + * @type:	The type of the media job
> + * @dep_ops:	A pointer to the dependency operations for this job
> + * @dep_data:	A pointer to the dependency data for this job
> + *
> + * Try to queue a media job with the scheduler. This function should be called
> + * by the drivers whenever a dependency for a media job is met - for example
> + * when a buffer is queued to the driver. The framework will check to see if an
> + * existing job on the scheduler's pending list shares the same type, dependency
> + * operations and dependency data. If it does then that existing job will be
> + * considered. If there is no extant job with those same parameters, a new job
> + * is allocated and populated by calling the setup functions registered with
> + * the framework.
> + *
> + * The function iterates over the dependencies that are registered with the job
> + * and checks to see if they are met. If they're all met, they're cleared and
> + * the job is placed onto the scheduler's queue.
> + *
> + * To help reduce conditionals in drivers where a driver supports both the use
> + * of the media jobs framework and operation without it, this function is a no
> + * op if @sched is NULL.
> + *
> + * Return: 0 on success or a negative error number
> + */
> +int media_jobs_try_queue_job(struct media_job_scheduler *sched,
> +			     enum media_job_types type,
> +			     struct media_job_dep_ops *dep_ops, void *dep_data);
> +
> +/**
> + * media_jobs_add_job_step - Add a step to a media job
> + *
> + * @job:	Pointer to the &struct media_job
> + * @run_step:	Pointer to the function to run to execute the step
> + * @data:	Pointer to the data to pass to @run_ste
> + * @flags:	One of the MEDIA_JOBS_FL_STEP_* flags
> + * @pos:	A position indicator to use with @flags
> + *
> + * This function adds a step to the job and should be called from the drivers'
> + * job setup functions as registered with the framework through
> + * media_jobs_add_job_setup_func(). The @flags and @pos parameters are used
> + * to determine the ordering of the steps within the job:
> + *
> + * If @flags has the MEDIA_JOBS_FL_STEP_ANYWHERE bit set, the step is placed
> + * after all steps with MEDIA_JOBS_FL_STEP_FROM_FRONT and before all steps with
> + * MEDIA_JOBS_FL_STEP_FROM_BACK bit set, but otherwise in whatever order this
> + * function is called.
> + *
> + * If @flags has the MEDIA_JOBS_FL_STEP_FROM_FRONT bit set then the step is
> + * placed @pos steps from the front of the list. Attempting to place multiple
> + * steps in the same position will result in an error.
> + *
> + * If @flags has the MEDIA_JOBS_FL_STEP_FROM_BACK bit set then the step is
> + * placed @pos steps from the back of the list. Attempting to place multiple
> + * steps in the same position will result in an error.
> + *
> + * Return: 0 on success or a negative error number
> + */
> +int media_jobs_add_job_step(struct media_job *job, void (*run_step)(void *data),
> +			    void *data, unsigned int flags, unsigned int pos);
> +
> +/**
> + * media_jobs_add_job_dep - Add a dependency to a media job
> + *
> + * @job:	Pointer to the &struct media_job
> + * @ops:	Pointer to the &struct media_job_dep_ops
> + * @data:	Pointer to the data to pass to the dependency's operations
> + *
> + * This function adds a dependency to the job and should be called from the
> + * drivers job setup functions as registered with the framework through the
> + * media_jobs_add_job_setup_func() function.
> + *
> + * Return: 0 on success or a negative error number
> + */
> +int media_jobs_add_job_dep(struct media_job *job, struct media_job_dep_ops *ops,
> +			   void *data);
> +
> +/**
> + * media_jobs_add_job_setup_func - Add a function that populates a media job
> + *
> + * @sched:	Pointer to the media jobs scheduler
> + * @job_setup:	Pointer to the new job setup function
> + * @data:	Data to pass to the job setup function
> + * @type:	The type of job that this function should be called for
> + *
> + * Drivers that wish to utilise the framework need to use this function to
> + * register a callback that adds job steps and dependencies when one is created.
> + * The function must call media_jobs_add_job_step() and media_jobs_add_job_dep()
> + * to populate the job.
> + *
> + * Return: 0 on success or a negative error number
> + */
> +int media_jobs_add_job_setup_func(struct media_job_scheduler *sched,
> +				  int (*job_setup)(struct media_job *job, void *data),
> +				  void *data, enum media_job_types type);
> +
> +/**
> + * media_jobs_put_scheduler - Put a reference to the media jobs scheduler
> + *
> + * @sched:	Pointer to the media jobs scheduler
> + *
> + * This function puts a reference to the media jobs scheduler, and is intended
> + * to be called in error and exit paths for consuming drivers
> + */
> +void media_jobs_put_scheduler(struct media_job_scheduler *sched);
> +
> +/**
> + * media_jobs_get_scheduler - Get a media jobs scheduler
> + *
> + * @mdev:	Pointer to the media device associated with the scheduler
> + *
> + * This function gets a pointer to a &struct media_job_scheduler associated with
> + * the media device passed to @mdev. If one is not available then it is
> + * allocated and returned. This allows multiple drivers sharing a media graph to
> + * work with the same media job scheduler.
> + *
> + * Return: 0 on success or a negative error number
> + */
> +struct media_job_scheduler *media_jobs_get_scheduler(struct media_device *mdev);
> +
> +/**
> + * media_jobs_run_jobs - Run any media jobs that are ready in the queue
> + *
> + * @sched:	Pointer to the media job scheduler
> + *
> + * This function triggers the workqueue that processes any jobs that have been
> + * queued, and should be called whenever the pipeline is ready to do so.
> + *
> + * To help reduce conditionals in drivers where a driver supports both the use
> + * of the media jobs framework and operation without it, this function is a no
> + * op if @sched is NULL.
> + */
> +void media_jobs_run_jobs(struct media_job_scheduler *sched);
> +
> +/**
> + * media_jobs_cancel_jobs - cancel all waiting jobs
> + *
> + * @sched:	Pointer to the media job scheduler
> + *
> + * This function iterates over any pending and queued jobs, resets their
> + * dependencies and frees the job
> + *
> + * To help reduce conditionals in drivers where a driver supports both the use
> + * of the media jobs framework and operation without it, this function is a no
> + * op if @sched is NULL.
> + */
> +void media_jobs_cancel_jobs(struct media_job_scheduler *sched);
> +
> +extern struct list_head media_job_schedulers;
> +extern struct mutex media_job_schedulers_lock;
> +
> +#endif /* _MEDIA_JOBS_H */
> --
> 2.34.1
>
>

