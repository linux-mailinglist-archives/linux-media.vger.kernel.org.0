Return-Path: <linux-media+bounces-33200-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA31AC147A
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 21:14:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BE2CB7BBC7B
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 19:11:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D030129ACC9;
	Thu, 22 May 2025 19:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FfiDu6UP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26442C1797
	for <linux-media@vger.kernel.org>; Thu, 22 May 2025 19:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940685; cv=none; b=NE2pCtKh+MzDl7zfUHAB632IBZDZLnTvW+mjigXWWtKEIWlZ+YxiFQb/RG7ymFXTaLN8OiOAoUDdQITBGNonKTXZs3F1i81hORk8RD4aaL8eB3szcod/dchjOt+fM4ufM+YVmt5ipRVA9QtdrOA0jvyyQ8D1fdwtXtpLGguc56Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940685; c=relaxed/simple;
	bh=mRR9iQoor2uVA/h9h3nYrHSrjCLpraHCzYUob6z4A9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZKaXo1UILETdy7iqmX3am6+VFaO4vEaFciPN33e5mwcKkJZaQK4rl4tn8Pn/h7DN+/mys8uss9pjkN7LSbIWG61qldU60ZXp6nAy8rJYbDFJKoKoab6imG7dAW6yrGOUAXU3qrRwlRvKNtx3Js0RlDMVixG2NIYWacQzJixSLG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FfiDu6UP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1326A8FA;
	Thu, 22 May 2025 21:04:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747940657;
	bh=mRR9iQoor2uVA/h9h3nYrHSrjCLpraHCzYUob6z4A9c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FfiDu6UPBf3kCLbXbFPOMr1+UR31o0cPDYaS3M6fSkP6R+cZU2Gh/9G1zlBGeS09z
	 Pb825tz6U+SasRoKbmbgDnyzPt0ZhbbUxSbBha/A+u7IU5KPM2e0dHxrCj/cD9VOqz
	 QL25JXvIgi90/b7pdG9vG+Ljwd87zsnKDX9FrnRM=
Date: Thu, 22 May 2025 21:04:36 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Dan Scally <dan.scally@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	linux-media@vger.kernel.org, sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com, 
	mchehab@kernel.org
Subject: Re: [PATCH 2/3] media: mc: Add media jobs framework
Message-ID: <cxp3qf6hhjh2kasvkx6e2i2xov3afzclbtqa765qsdlaeonngb@pft2xg3xqndp>
References: <20250519140403.443915-1-dan.scally@ideasonboard.com>
 <20250519140403.443915-3-dan.scally@ideasonboard.com>
 <wns3szkk5p2nfq2ad42ph3lzfg3iwdwz2iumumegfpzlijd7g5@fqes6vkqya26>
 <6816a396-010a-4551-b20e-dc54b023c6cf@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6816a396-010a-4551-b20e-dc54b023c6cf@ideasonboard.com>

Hi Dan

On Thu, May 22, 2025 at 12:24:46PM +0100, Dan Scally wrote:
> Hi Jacopo
>
> On 22/05/2025 12:00, Jacopo Mondi wrote:
> > Hi Dan, back with more questions :)
> >
> > On Mon, May 19, 2025 at 03:04:02PM +0100, Daniel Scally wrote:
> > > Add a new framework to the media subsystem describing media jobs.
> > > This framework is intended to be able to model the interactions
> > > between multiple different drivers that need to be run in concert
> > > to fully control a media pipeline, for example an ISP driver and a
> > > driver controlling a DMA device that feeds data from memory in to
> > > that ISP.
> > >
> > > The new framework allows all drivers involved to add explicit steps
> > > that need to be performed, and to control the ordering of those steps
> > > precisely. Once the job with its steps has been created it's then
> > > scheduled to be run with a workqueue which executes each step in the
> > > defined order.
> > >
> > > Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> > > ---
> > >   drivers/media/mc/Makefile  |   2 +-
> > >   drivers/media/mc/mc-jobs.c | 446 +++++++++++++++++++++++++++++++++++++
> > >   include/media/media-jobs.h | 354 +++++++++++++++++++++++++++++
> > >   3 files changed, 801 insertions(+), 1 deletion(-)
> > >   create mode 100644 drivers/media/mc/mc-jobs.c
> > >   create mode 100644 include/media/media-jobs.h
> > >
> > > diff --git a/drivers/media/mc/Makefile b/drivers/media/mc/Makefile
> > > index 2b7af42ba59c..9148bbfd1578 100644
> > > --- a/drivers/media/mc/Makefile
> > > +++ b/drivers/media/mc/Makefile
> > > @@ -1,7 +1,7 @@
> > >   # SPDX-License-Identifier: GPL-2.0
> > >
> > >   mc-objs	:= mc-device.o mc-devnode.o mc-entity.o \
> > > -	   mc-request.o
> > > +	   mc-jobs.o mc-request.o
> > >
> > >   ifneq ($(CONFIG_USB),)
> > >   	mc-objs += mc-dev-allocator.o
> > > diff --git a/drivers/media/mc/mc-jobs.c b/drivers/media/mc/mc-jobs.c
> > > new file mode 100644
> > > index 000000000000..1f04cdf63d27
> > > --- /dev/null
> > > +++ b/drivers/media/mc/mc-jobs.c
> > > @@ -0,0 +1,446 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Media jobs framework
> > > + *
> > > + * Copyright 2025 Ideas on Board Oy
> > > + *
> > > + * Author: Daniel Scally <dan.scally@ideasonboard.com>
> > > + */
> > > +
> > > +#include <linux/cleanup.h>
> > > +#include <linux/kref.h>
> > > +#include <linux/list.h>
> > > +#include <linux/slab.h>
> > > +#include <linux/spinlock.h>
> > > +
> > > +#include <media/media-device.h>
> > > +#include <media/media-entity.h>
> > > +#include <media/media-jobs.h>
> > > +
> > > +int media_jobs_add_job_step(struct media_job *job, void (*run_step)(void *data),
> > > +			    void *data, unsigned int flags, unsigned int pos)
> > > +{
> > > +	struct media_job_step *step, *tmp;
> > > +	unsigned int num = flags;
> > > +	unsigned int count = 0;
> > > +
> > > +	guard(spinlock)(&job->lock);
> > > +
> > > +	if (!flags) {
> > > +		WARN_ONCE(1, "%s(): No flag bits set\n", __func__);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	/* Count the number of set flags; they're mutually exclusive. */
> > > +	while (num) {
> > > +		num &= (num - 1);
> > > +		count++;
> > > +	}
> > > +
> > > +	if (count > 1) {
> > > +		WARN_ONCE(1, "%s(): Multiple flag bits set\n", __func__);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	step = kzalloc(sizeof(*step), GFP_KERNEL);
> > > +	if (!step)
> > > +		return -ENOMEM;
> > > +
> > > +	step->run_step = run_step;
> > > +	step->data = data;
> > > +	step->flags = flags;
> > > +	step->pos = pos;
> > > +
> > > +	/*
> > > +	 * We need to decide where to place the step. If the list is empty that
> > > +	 * is really easy (and also the later code is much easier if the code is
> > > +	 * guaranteed not to be empty...)
> > > +	 */
> > > +	if (list_empty(&job->steps)) {
> > > +		list_add_tail(&step->list, &job->steps);
> > > +		return 0;
> > > +	}
> > > +
> > > +	/*
> > > +	 * If we've been asked to place it at a specific position from the end
> > > +	 * of the list, we cycle back through it until either we exhaust the
> > > +	 * list or find an entry that needs to go further from the back than the
> > > +	 * new one.
> > > +	 */
> > > +	if ((flags & MEDIA_JOBS_FL_STEP_FROM_BACK)) {
> > > +		list_for_each_entry_reverse(tmp, &job->steps, list) {
> > > +			if (tmp->flags == flags && tmp->pos == pos)
> > > +				return -EINVAL;
> > > +
> > > +			if (tmp->flags != MEDIA_JOBS_FL_STEP_FROM_BACK ||
> > > +			    tmp->pos > pos)
> > > +				break;
> > > +		}
> > > +
> > > +		/*
> > > +		 * If the entry we broke on is also one placed from the back and
> > > +		 * should be closer to the back than the new one, we place the
> > > +		 * new one in front of it...otherwise place the new one behind
> > > +		 * it.
> > > +		 */
> > > +		if (tmp->flags == flags && tmp->pos < pos)
> > > +			list_add_tail(&step->list, &tmp->list);
> > > +		else
> > > +			list_add(&step->list, &tmp->list);
> > > +
> > > +		return 0;
> > > +	}
> > > +
> > > +	/*
> > > +	 * If we've been asked to place it a specific position from the front of
> > > +	 * the list we do the same kind of operation, but going from the front
> > > +	 * instead.
> > > +	 */
> > > +	if (flags & MEDIA_JOBS_FL_STEP_FROM_FRONT) {
> > > +		list_for_each_entry(tmp, &job->steps, list) {
> > > +			if (tmp->flags == flags && tmp->pos == pos)
> > > +				return -EINVAL;
> > > +
> > > +			if (tmp->flags != MEDIA_JOBS_FL_STEP_FROM_FRONT ||
> > > +			    tmp->pos > pos)
> > > +				break;
> > > +		}
> > > +
> > > +		/*
> > > +		 * If the entry we broke on is also placed from the front and
> > > +		 * should be closed to the front than the new one, we place the
> > > +		 * new one behind it, otherwise in front of it.
> > > +		 */
> > > +		if (tmp->flags == flags && tmp->pos < pos)
> > > +			list_add(&step->list, &tmp->list);
> > > +		else
> > > +			list_add_tail(&step->list, &tmp->list);
> > > +
> > > +		return 0;
> > > +	}
> > > +
> > > +	/*
> > > +	 * If the step is flagged as "can go anywhere" we just need to try to
> > > +	 * find the first "from the back" entry and add it immediately before
> > > +	 * that. If we can't find one, add it after whatever we did find.
> > > +	 */
> > > +	if (flags & MEDIA_JOBS_FL_STEP_ANYWHERE) {
> > > +		list_for_each_entry(tmp, &job->steps, list)
> > > +			if ((tmp->flags & MEDIA_JOBS_FL_STEP_FROM_BACK))
> > > +				break;
> > > +
> > > +		if ((tmp->flags & MEDIA_JOBS_FL_STEP_FROM_BACK) ||
> > > +		    list_entry_is_head(tmp, &job->steps, list))
> > > +			list_add_tail(&step->list, &tmp->list);
> > > +		else
> > > +			list_add(&step->list, &tmp->list);
> > > +
> > > +		return 0;
> > > +	}
> > > +
> > > +	/* Shouldn't get here, unless the flag value is wrong. */
> > > +	WARN_ONCE(1, "%s(): Invalid flag value\n", __func__);
> > > +	return -EINVAL;
> > > +}
> > > +EXPORT_SYMBOL_GPL(media_jobs_add_job_step);
> > > +
> > > +int media_jobs_add_job_dep(struct media_job *job, struct media_job_dep_ops *ops,
> > > +			   void *data)
> > > +{
> > > +	struct media_job_dep *dep;
> > > +
> > > +	if (!ops || !ops->check_dep || !data)
> > > +		return -EINVAL;
> > > +
> > > +	guard(spinlock)(&job->lock);
> > > +
> > > +	/* Confirm the same dependency hasn't already been added */
> > > +	list_for_each_entry(dep, &job->deps, list)
> > > +		if (dep->ops == ops && dep->data == data)
> > > +			return -EINVAL;
> > > +
> > > +	dep = kzalloc(sizeof(*dep), GFP_KERNEL);
> > > +	if (!dep)
> > > +		return -ENOMEM;
> > > +
> > > +	dep->ops = ops;
> > > +	dep->data = data;
> > > +	list_add(&dep->list, &job->deps);
> > > +
> > > +	return 0;
> > > +}
> > > +EXPORT_SYMBOL_GPL(media_jobs_add_job_dep);
> > > +
> > > +static bool media_jobs_check_pending_job(struct media_job *job,
> > > +					 enum media_job_types type,
> > > +					 struct media_job_dep_ops *dep_ops,
> > > +					 void *data)
> > > +{
> > > +	struct media_job_dep *dep;
> > > +
> > > +	guard(spinlock)(&job->lock);
> > > +
> > > +	if (job->type != type)
> > > +		return false;
> > > +
> > > +	list_for_each_entry(dep, &job->deps, list) {
> > > +		if (dep->ops == dep_ops && dep->data == data) {
> > > +			if (dep->met)
> > > +				return false;
> > > +
> > > +			break;
> > > +		}
> > > +	}
> > > +
> > > +	dep->met = true;
> > > +	return true;
> > > +}
> > > +
> > > +static struct media_job *media_jobs_get_job(struct media_job_scheduler *sched,
> > > +					    enum media_job_types type,
> > > +					    struct media_job_dep_ops *dep_ops,
> > > +					    void *dep_data)
> > > +{
> > > +	struct media_job_setup_func *jsf;
> > > +	struct media_job *job;
> > > +	int ret;
> > > +
> > > +	list_for_each_entry(job, &sched->pending, list)
> > > +		if (media_jobs_check_pending_job(job, type, dep_ops, dep_data))
> > > +			return job;
> > > +
> > Thanks to your offline explanation, I got how this works now, however
> > some questions here
> >
> > The basic idea is that each driver that registers a 'setup' function
> > adds to a job, when its created, its list of dependencies.
> >
> > When a job is "try_queue" and we get here, to decide if a new job has
> > to be created or if we have to run one which is already in the pending
> > queue.
> >
> > How is this identification performed ? Each entry point (assume it's a
> > video device op) will populate the job with its own dependencies,
> > identified by the dep_ops and data address.
> >
> > We walk the 'pending' queue in the media_jobs_check_pending_job()
> > function and we search for one job not already visited from the same
> > entry point, identified by the dep_ops (the 'visited' state is kept by
> > the deps->met flag).
> >
> > Let's assume 2 video devices X and Y
> >
> > qbuf(x) -> try_queue_job() -> new job created on 'pending'
> > qbuf(x) -> try_queue_job() -> the job in the queue has 'deps->met' set, skip
> > it and create a new one
> > qbuf(y) -> try_queue_job() -> the first job in the queue has not
> > deps->set, so return it
> >
> > All in all I would describe this as: when requesting a job try to find
> > the first one not already visited by this entry point, if none is
> > available create a new one.
>
>
> Yep, all seems fine.
>
> > Now, we briefly discussed that when moving to multi-context comparing
> > dep_ops and data to identify an entry point won't be enough: buffers
> > from the same video device but from different contexts do not have to
> > be associated together. So we'll need to extend the identification
> > criteria. Also, I don't find the idea of using dep_ops and data for
> > this purpose particularly neat, as it makes mandatory to add
> > dependencies to a job in the setup function, something not all driver
> > might want to do ?
>
> I don't think it's mandatory for a driver to add dependencies to a job; the
> implication of lacking them is that whatever step the driver is running for
> the job takes no input (no buffers need to be available, no parameters need
> to have been set, no per-requisites need to have been met) in which case it
> can simply be ignored for the purposes of evaluating whether the job can be
> queued or not, because it's always ready by definition...does that make
> sense?

Yes, but what are the implications of not setting deps on
media_jobs_check_pending_job() ?

If I'm not mistaken

	if (dep->ops == dep_ops && dep->data == data) {

will now always return false, as there won't be any 'dep' that matches
with dep_ops as the driver has never called media_jobs_add_job_dep().

If so, if a video device that doesn't register deps (tbh I don't see
why it would, but..) will always match and we will overwrite the same job over
and over ? Anyway, a corner case I guess

>
> > There might be ways to handle this "track the entry point" thing that
> > could be separated by deps, making deps do what they actually are
> > described for: track dependencies to validate if a job can be run or
> > not. Before exploring options, I would like to know if this only mine
> > concern or is it shared by others.
>
>
> I do agree that a nicer way of tracking them rather than dep_ops and data
> would be better...perhaps tying it to the entry point as you've
> conceptualised here is the right thing to do, and the pointer to the
> function calling media_jobs_try_queue_job() should be passed, along with a
> context ID?
>

I think that's a possible way forward. For the time being I think
identifying a "user" of a job (iow any drivers that registers a
dependency or a step) with a pointer to the video device or to the
driver-specific types should be enough and we can easily
move it to use the video device context later.

I have patches to push if you want to see.

A bit more comments on the API below

>
> Thanks
>
> Dan
>
> >
> > > +	job = kzalloc(sizeof(*job), GFP_KERNEL);
> > > +	if (!job)
> > > +		return ERR_PTR(-ENOMEM);
> > > +
> > > +	spin_lock_init(&job->lock);
> > > +	INIT_LIST_HEAD(&job->deps);
> > > +	INIT_LIST_HEAD(&job->steps);
> > > +	job->type = type;
> > > +	job->sched = sched;
> > > +
> > > +	list_for_each_entry(jsf, &sched->setup_funcs, list) {
> > > +		if (jsf->type != type)
> > > +			continue;
> > > +
> > > +		ret = jsf->job_setup(job, jsf->data);
> > > +		if (ret) {
> > > +			kfree(job);
> > > +			return ERR_PTR(ret);
> > > +		}
> > > +	}
> > > +
> > > +	list_add_tail(&job->list, &sched->pending);
> > > +
> > > +	/* This marks the dependency as met */
> > > +	media_jobs_check_pending_job(job, type, dep_ops, dep_data);
> > > +
> > > +	return job;
> > > +}
> > > +
> > > +static void media_jobs_free_job(struct media_job *job, bool reset)
> > > +{
> > > +	struct media_job_step *step, *stmp;
> > > +	struct media_job_dep *dep, *dtmp;
> > > +
> > > +	scoped_guard(spinlock, &job->lock) {
> > > +		list_for_each_entry_safe(dep, dtmp, &job->deps, list) {
> > > +			if (reset && dep->ops->reset_dep)
> > > +				dep->ops->reset_dep(dep->data);
> > > +
> > > +			list_del(&dep->list);
> > > +			kfree(dep);
> > > +		}
> > > +
> > > +		list_for_each_entry_safe(step, stmp, &job->steps, list) {
> > > +			list_del(&step->list);
> > > +			kfree(step);
> > > +		}
> > > +	}
> > > +
> > > +	list_del(&job->list);
> > > +	kfree(job);
> > > +}
> > > +
> > > +int media_jobs_try_queue_job(struct media_job_scheduler *sched,
> > > +			     enum media_job_types type,
> > > +			     struct media_job_dep_ops *dep_ops, void *dep_data)
> > > +{
> > > +	struct media_job_dep *dep;
> > > +	struct media_job *job;
> > > +
> > > +	if (!sched)
> > > +		return 0;
> > > +
> > > +	guard(spinlock)(&sched->lock);
> > > +
> > > +	job = media_jobs_get_job(sched, type, dep_ops, dep_data);
> > > +	if (IS_ERR(job))
> > > +		return PTR_ERR(job);
> > > +
> > > +	list_for_each_entry(dep, &job->deps, list)
> > > +		if (!dep->ops->check_dep(dep->data))
> > > +			return 0; /* Not a failure */
> > > +
> > > +	list_for_each_entry(dep, &job->deps, list)
> > > +		if (dep->ops->clear_dep)
> > > +			dep->ops->clear_dep(dep->data);
> > > +
> > > +	list_move_tail(&job->list, &sched->queue);
> > > +	queue_work(sched->async_wq, &sched->work);
> > > +
> > > +	return 0;
> > > +}
> > > +EXPORT_SYMBOL_GPL(media_jobs_try_queue_job);
> > > +
> > > +static void __media_jobs_run_jobs(struct work_struct *work)
> > > +{
> > > +	struct media_job_scheduler *sched = container_of(work,
> > > +							 struct media_job_scheduler,
> > > +							 work);
> > > +	struct media_job_step *step;
> > > +	struct media_job *job;
> > > +
> > > +	while (true) {
> > > +		scoped_guard(spinlock, &sched->lock) {
> > > +			if (list_empty(&sched->queue))
> > > +				return;
> > > +
> > > +			job = list_first_entry(&sched->queue, struct media_job,
> > > +					       list);
> > > +		}
> > > +
> > > +		list_for_each_entry(step, &job->steps, list)
> > > +			step->run_step(step->data);
> > > +
> > > +		media_jobs_free_job(job, false);
> > > +	}
> > > +}
> > > +
> > > +void media_jobs_run_jobs(struct media_job_scheduler *sched)
> > > +{
> > > +	if (!sched)
> > > +		return;
> > > +
> > > +	queue_work(sched->async_wq, &sched->work);
> > > +}
> > > +EXPORT_SYMBOL_GPL(media_jobs_run_jobs);
> > > +
> > > +static void __media_jobs_cancel_jobs(struct media_job_scheduler *sched)
> > > +{
> > > +	struct media_job *job, *jtmp;
> > > +
> > > +	list_for_each_entry_safe(job, jtmp, &sched->pending, list)
> > > +		media_jobs_free_job(job, true);
> > > +
> > > +	list_for_each_entry_safe(job, jtmp, &sched->queue, list)
> > > +		media_jobs_free_job(job, true);
> > > +}
> > > +
> > > +void media_jobs_cancel_jobs(struct media_job_scheduler *sched)
> > > +{
> > > +	if (!sched)
> > > +		return;
> > > +
> > > +	guard(spinlock)(&sched->lock);
> > > +	__media_jobs_cancel_jobs(sched);
> > > +}
> > > +EXPORT_SYMBOL_GPL(media_jobs_cancel_jobs);
> > > +
> > > +int media_jobs_add_job_setup_func(struct media_job_scheduler *sched,
> > > +				  int (*job_setup)(struct media_job *job, void *data),
> > > +				  void *data, enum media_job_types type)
> > > +{
> > > +	struct media_job_setup_func *new_setup_func;
> > > +
> > > +	guard(spinlock)(&sched->lock);
> > > +
> > > +	new_setup_func = kzalloc(sizeof(*new_setup_func), GFP_KERNEL);
> > > +	if (!new_setup_func)
> > > +		return -ENOMEM;
> > > +
> > > +	new_setup_func->type = type;
> > > +	new_setup_func->job_setup = job_setup;
> > > +	new_setup_func->data = data;
> > > +	list_add_tail(&new_setup_func->list, &sched->setup_funcs);
> > > +
> > > +	return 0;
> > > +}
> > > +EXPORT_SYMBOL_GPL(media_jobs_add_job_setup_func);
> > > +
> > > +static void __media_jobs_put_scheduler(struct kref *kref)
> > > +{
> > > +	struct media_job_scheduler *sched =
> > > +		container_of(kref, struct media_job_scheduler, kref);
> > > +	struct media_job_setup_func *func, *ftmp;
> > > +
> > > +	cancel_work_sync(&sched->work);
> > > +	destroy_workqueue(sched->async_wq);
> > > +
> > > +	scoped_guard(spinlock, &sched->lock) {
> > > +		__media_jobs_cancel_jobs(sched);
> > > +
> > > +		list_for_each_entry_safe(func, ftmp, &sched->setup_funcs, list) {
> > > +			list_del(&func->list);
> > > +			kfree(func);
> > > +		}
> > > +	}
> > > +
> > > +	list_del(&sched->list);
> > > +	kfree(sched);
> > > +}
> > > +
> > > +void media_jobs_put_scheduler(struct media_job_scheduler *sched)
> > > +{
> > > +	kref_put(&sched->kref, __media_jobs_put_scheduler);
> > > +}
> > > +EXPORT_SYMBOL_GPL(media_jobs_put_scheduler);
> > > +
> > > +struct media_job_scheduler *media_jobs_get_scheduler(struct media_device *mdev)
> > > +{
> > > +	struct media_job_scheduler *sched;
> > > +	char workqueue_name[32];
> > > +	int ret;
> > > +
> > > +	guard(mutex)(&media_job_schedulers_lock);
> > > +
> > > +	list_for_each_entry(sched, &media_job_schedulers, list) {
> > > +		if (sched->mdev == mdev) {
> > > +			kref_get(&sched->kref);
> > > +			return sched;
> > > +		}
> > > +	}
> > > +
> > > +	ret = snprintf(workqueue_name, sizeof(workqueue_name),
> > > +		       "mc jobs (%s)", mdev->driver_name);
> > > +	if (!ret)
> > > +		return ERR_PTR(-EINVAL);
> > > +
> > > +	sched = kzalloc(sizeof(*sched), GFP_KERNEL);
> > > +	if (!sched)
> > > +		return ERR_PTR(-ENOMEM);
> > > +
> > > +	sched->async_wq = alloc_workqueue(workqueue_name, 0, 0);
> > > +	if (!sched->async_wq) {
> > > +		kfree(sched);
> > > +		return ERR_PTR(-EINVAL);
> > > +	}
> > > +
> > > +	sched->mdev = mdev;
> > > +	kref_init(&sched->kref);
> > > +	spin_lock_init(&sched->lock);
> > > +	INIT_LIST_HEAD(&sched->setup_funcs);
> > > +	INIT_LIST_HEAD(&sched->pending);
> > > +	INIT_LIST_HEAD(&sched->queue);
> > > +	INIT_WORK(&sched->work, __media_jobs_run_jobs);
> > > +
> > > +	list_add_tail(&sched->list, &media_job_schedulers);
> > > +
> > > +	return sched;
> > > +}
> > > +EXPORT_SYMBOL_GPL(media_jobs_get_scheduler);
> > > +
> > > +LIST_HEAD(media_job_schedulers);
> > > +
> > > +/* Synchronise access to the global schedulers list */
> > > +DEFINE_MUTEX(media_job_schedulers_lock);
> > > diff --git a/include/media/media-jobs.h b/include/media/media-jobs.h
> > > new file mode 100644
> > > index 000000000000..a97270861251
> > > --- /dev/null
> > > +++ b/include/media/media-jobs.h
> > > @@ -0,0 +1,354 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > +/*
> > > + * Media jobs framework
> > > + *
> > > + * Copyright 2025 Ideas on Board Oy
> > > + *
> > > + * Author: Daniel Scally <dan.scally@ideasonboard.com>
> > > + */
> > > +

Could you include the header in the .c file first to make sure it's
self-contained ?

> > > +#include <linux/kref.h>
> > > +#include <linux/list.h>
> > > +#include <linux/mutex.h>
> > > +#include <linux/spinlock.h>
> > > +#include <linux/types.h>
> > > +#include <linux/workqueue.h>
> > > +
> > > +#ifndef _MEDIA_JOBS_H
> > > +#define _MEDIA_JOBS_H

Place this at the beginning of the file

> > > +
> > > +struct media_device;
> > > +struct media_entity;
> > > +struct media_job;
> > > +struct media_job_dep;
> > > +
> > > +/**
> > > + * define MEDIA_JOBS_FL_STEP_ANYWHERE - \
> > > + *    Flag a media job step as able to run anytime
> > > + *
> > > + * This flag informs the framework that a job step does not need a particular
> > > + * position in the list of job steps and can be placed anywhere.
> > > + */
> > > +#define MEDIA_JOBS_FL_STEP_ANYWHERE			BIT(0)
> > > +
> > > +/**
> > > + * define MEDIA_JOBS_FL_STEP_FROM_FRONT - \
> > > + *    Flag a media job step as needing to be placed near the start of the list
> > > + *
> > > + * This flag informs the framework that a job step needs to be placed at a set
> > > + * position from the start of the list of job steps.
> > > + */
> > > +#define MEDIA_JOBS_FL_STEP_FROM_FRONT			BIT(1)
> > > +
> > > +/**
> > > + * define MEDIA_JOBS_FL_STEP_FROM_BACK - \
> > > + *    Flag a media job step as needing to be placed near the end of the list
> > > + *
> > > + * This flag informs the framework that a job step needs to be placed at a set
> > > + * position from the end of the list of job steps.
> > > + */
> > > +#define MEDIA_JOBS_FL_STEP_FROM_BACK			BIT(2)
> > > +
> > > +/**
> > > + * enum media_job_types - Type of media job
> > > + *
> > > + * @MEDIA_JOB_TYPE_PIPELINE_PULSE:	A data event moving through the media
> > > + *					pipeline
> > > + *
> > > + * This enumeration details different types of media jobs. The type can be used
> > > + * to differentiate between which steps and dependencies a driver needs to add
> > > + * to a job when it is created.
> > > + */
> > > +enum media_job_types {
> > > +	MEDIA_JOB_TYPE_PIPELINE_PULSE,
> > > +};

I'm wondering if we could omit type for the time being.
A little trick would be to use variadic macros to allow users to not
specify the type and default it to MEDIA_JOB_TYPE_PIPELINE_PULSE and
at the same time allow future users of other types to specify them
later on

Something like (not based on this version of the patch sorry)

-int media_jobs_try_queue_job(struct media_job_scheduler *sched,
-                            enum media_job_types type,
-                            void *cookie);
+int __media_jobs_try_queue_job(struct media_job_scheduler *sched,
+                              void *cookie, enum media_job_types type);
+
+#define __media_jobs_try_queue_job_notype(sched, cookie)       \
+       __media_jobs_try_queue_job(sched, cookie, MEDIA_JOB_TYPE_PIPELINE_PULSE)
+#define __media_jobs_try_queue_job_type(sched, cookie, type)   \
+       __media_jobs_try_queue_job(sched, cookie, type)

+#define MEDIA_JOBS_TRY_QUEUE_EXPAND(_1, _2, _3, FUNC, ...) FUNC
+#define media_jobs_try_queue_job(...)                                  \
+       MEDIA_JOBS_TRY_QUEUE_EXPAND(__VA_ARGS__,                        \
+                                   __media_jobs_try_queue_job_type,    \
+                                   __media_jobs_try_queue_job_notype)  \
+                                   (__VA_ARGS__)

Maybe not good looking but allows to call both

media_jobs_try_queue_job(sched, cookie, type) and
media_jobs_try_queue_job(sched, cookie)

(this could be done to all functions that accepts a type, apart the
job setup functions)

> > > +
> > > +/**
> > > + * struct media_job_scheduler - A job scheduler for a particular media device
> > > + *
> > > + * @mdev:		Media device this scheduler is for
> > > + * @list:		List head to attach to the global list of schedulers
> > > + * @kref:		Reference counter
> > > + * @lock:		Lock to protect access to the scheduler
> > > + * @setup_funcs:	List of &struct media_job_setup_func to populate jobs
> > > + * @pending:		List of &struct media_jobs created but not yet queued
> > > + * @queue:		List of &struct media_jobs queued to the scheduler
> > > + * @work:		Work item to run the jobs
> > > + * @async_wq:		Workqueue to run the work on
> > > + *
> > > + * This struct is the main job scheduler struct - drivers wanting to use this
> > > + * framework should acquire an instance through media_jobs_get_scheduler() and
> > > + * subsequently populate it with job setup functions.
> > > + */
> > > +struct media_job_scheduler {
> > > +	struct media_device *mdev;
> > > +	struct list_head list;
> > > +	struct kref kref;
> > > +
> > > +	spinlock_t lock; /* Synchronise access to the struct's lists */
> > > +	struct list_head setup_funcs;
> > > +	struct list_head pending;
> > > +	struct list_head queue;

Empty line please

> > > +	struct work_struct work;
> > > +	struct workqueue_struct *async_wq;
> > > +};

This type should be defined inside the .c file and not exposed ?

> > > +
> > > +/**
> > > + * struct media_job_setup_func - A function to populate a media job with steps
> > > + *				 and dependencies
> > > + *
> > > + * @list:	The list object to attach to the scheduler
> > > + * @type:	The &enum media_job_types that this function populates a job for
> > > + * @job_setup:	Function pointer to the driver's job setup function
> > > + * @data:	Pointer to the driver data for use with @job_setup
> > > + *
> > > + * This struct holds data about the functions a driver registers with the jobs
> > > + * framework in order to populate a new job with steps and dependencies.
> > > + */
> > > +struct media_job_setup_func {
> > > +	struct list_head list;
> > > +	enum media_job_types type;
> > > +	int (*job_setup)(struct media_job *job, void *data);

You could define a type and use it. I would do that for all functions
where it makes sense

> > > +	void *data;
> > > +};
> > > +
> > > +/**
> > > + * struct media_job - A representation of a job to be run through the pipeline
> > > + *
> > > + * @lock:	Lock to protect access to the job's lists
> > > + * @list:	List head to attach the job to &struct media_job_scheduler in
> > > + *		either the pending or queue lists
> > > + * @steps:	List of &struct media_job_step to run the job
> > > + * @deps:	List of &struct media_job_dep to check that the job can be
> > > + *		queued
> > > + * @sched:	Pointer to the media job scheduler
> > > + * @type:	The type of the job
> > > + *
> > > + * This struct holds lists of steps that need to be performed to carry out a
> > > + * job in the pipeline. A separate list of dependencies allows the queueing of
> > > + * the job to be delayed until all drivers are ready to carry it out.
> > > + */
> > > +struct media_job {
> > > +	spinlock_t lock; /* Synchronise access to the struct's lists 6*/
> > > +	struct list_head list;
> > > +	struct list_head steps;
> > > +	struct list_head deps;
> > > +	struct media_job_scheduler *sched;
> > > +	enum media_job_types type;

nit: list_head are usually at the end, at least it seems to to me.
Doesn't

	struct media_job_scheduler *sched;
	enum media_job_types type;

	spinlock_t lock; /* Synchronise access to the struct's lists 6*/
	struct list_head list;
	struct list_head steps;
	struct list_head deps;

look better ?

};
> > > +
> > > +/**
> > > + * struct media_job_step - A holder for a function to run as part of a job
> > > + *
> > > + * @list:	List head to attach the job step to a &struct media_job.steps
> > > + * @run_step:	The function to run to perform the step
> > > + * @data:	Data to pass to the .run_step() function
> > > + * @flags:	Flags to control how the step is ordered within the job's list
> > > + *		of steps
> > > + * @pos:	Position indicator to control how the step is ordered within the
> > > + *		job's list of steps
> > > + *
> > > + * This struct defines a function that needs to be run as part of the execution
> > > + * of a job in a media pipeline, along with information that help the scheduler
> > > + * determine what order it should be ran in in reference to the other steps that
> > > + * are part of the same job.
> > > + */
> > > +struct media_job_step {
> > > +	struct list_head list;
> > > +	void (*run_step)(void *data);
> > > +	void *data;
> > > +	unsigned int flags;
> > > +	unsigned int pos;
> > > +};
> > > +
> > > +/**
> > > + * struct media_job_dep_ops - Operations to manage a media job dependency

mmm are these dep_ops or job_ops ?

> > > + *
> > > + * @check_dep:	A function to ask the driver whether the dependency is met
> > > + * @clear_dep:	A function to tell the driver that the job has been queued

Took me a while to get this. check_dep asks the driver to check,
reset_dep asks the driver to reset, and then clear_dep asks the driver
to ... clear ?

I would call this something like job_ready (which could possibly be
paired with device_run and job_abort and we have an identical replica
of v4l2_m2m_ops. Does this hint something ?)

Anyway, not feeling strong about this naming thing, but yes, if
clear_dep could be changed it would be nice


> > > + * @reset_dep:	A function to tell the driver that the job has been cancelled
> > > + *
> > > + * Media jobs have dependencies, such as requiring buffers to be queued. These
> > > + * operations allow a driver to define how the media jobs framework should check
> > > + * whether or not those dependencies are met and how it should inform them that
> > > + * it is taking action based on the state of those dependencies.
> > > + */
> > > +struct media_job_dep_ops {
> > > +	bool (*check_dep)(void *data);
> > > +	void (*clear_dep)(void *data);
> > > +	void (*reset_dep)(void *data);
> > > +};
> > > +
> > > +/**
> > > + * struct media_job_dep - Representation of media job dependency
> > > + *
> > > + * @list:	List head to attach to a &struct media_job.deps
> > > + * @ops:	A pointer to the dependency's operations functions
> > > + * @met:	A flag to record whether or not the dependency is met
> > > + * @data:	Data to pass to the dependency's operations
> > > + *
> > > + * This struct represents a dependency of a media job. The operations member
> > > + * holds pointers to functions allowing the framework to interact with the
> > > + * driver to check whether or not the dependency is met.
> > > + */
> > > +struct media_job_dep {
> > > +	struct list_head list;
> > > +	struct media_job_dep_ops *ops;
> > > +	bool met;
> > > +	void *data;

	struct media_job_dep_ops *ops;
	void *data;
	bool met;

	struct list_head list;

> > > +};
> > > +
> > > +/**
> > > + * media_jobs_try_queue_job - Try to queue a &struct media_job
> > > + *
> > > + * @sched:	Pointer to the job scheduler
> > > + * @type:	The type of the media job
> > > + * @dep_ops:	A pointer to the dependency operations for this job
> > > + * @dep_data:	A pointer to the dependency data for this job
> > > + *
> > > + * Try to queue a media job with the scheduler. This function should be called
> > > + * by the drivers whenever a dependency for a media job is met - for example
> > > + * when a buffer is queued to the driver. The framework will check to see if an
> > > + * existing job on the scheduler's pending list shares the same type, dependency
> > > + * operations and dependency data. If it does then that existing job will be
> > > + * considered. If there is no extant job with those same parameters, a new job
> > > + * is allocated and populated by calling the setup functions registered with
> > > + * the framework.

This is about the internals, I wouldn't move part of the documentation
to the implementation.

> > > + *
> > > + * The function iterates over the dependencies that are registered with the job
> > > + * and checks to see if they are met. If they're all met, they're cleared and
> > > + * the job is placed onto the scheduler's queue.
> > > + *
> > > + * To help reduce conditionals in drivers where a driver supports both the use
> > > + * of the media jobs framework and operation without it, this function is a no
> > > + * op if @sched is NULL.

Wouldn't a driver written to use the media_jobs framework use the
framework regardless on the presence of other drivers that use the same
scheduler on the media device ? In what case sched would be null ?


> > > + *
> > > + * Return: 0 on success or a negative error number
> > > + */
> > > +int media_jobs_try_queue_job(struct media_job_scheduler *sched,
> > > +			     enum media_job_types type,
> > > +			     struct media_job_dep_ops *dep_ops, void *dep_data);
> > > +
> > > +/**
> > > + * media_jobs_add_job_step - Add a step to a media job
> > > + *
> > > + * @job:	Pointer to the &struct media_job
> > > + * @run_step:	Pointer to the function to run to execute the step
> > > + * @data:	Pointer to the data to pass to @run_ste
> > > + * @flags:	One of the MEDIA_JOBS_FL_STEP_* flags
> > > + * @pos:	A position indicator to use with @flags
> > > + *
> > > + * This function adds a step to the job and should be called from the drivers'
> > > + * job setup functions as registered with the framework through
> > > + * media_jobs_add_job_setup_func(). The @flags and @pos parameters are used
> > > + * to determine the ordering of the steps within the job:
> > > + *
> > > + * If @flags has the MEDIA_JOBS_FL_STEP_ANYWHERE bit set, the step is placed
> > > + * after all steps with MEDIA_JOBS_FL_STEP_FROM_FRONT and before all steps with
> > > + * MEDIA_JOBS_FL_STEP_FROM_BACK bit set, but otherwise in whatever order this
> > > + * function is called.
> > > + *
> > > + * If @flags has the MEDIA_JOBS_FL_STEP_FROM_FRONT bit set then the step is
> > > + * placed @pos steps from the front of the list. Attempting to place multiple
> > > + * steps in the same position will result in an error.
> > > + *
> > > + * If @flags has the MEDIA_JOBS_FL_STEP_FROM_BACK bit set then the step is
> > > + * placed @pos steps from the back of the list. Attempting to place multiple
> > > + * steps in the same position will result in an error.
> > > + *
> > > + * Return: 0 on success or a negative error number
> > > + */
> > > +int media_jobs_add_job_step(struct media_job *job, void (*run_step)(void *data),
> > > +			    void *data, unsigned int flags, unsigned int pos);
> > > +
> > > +/**
> > > + * media_jobs_add_job_dep - Add a dependency to a media job
> > > + *
> > > + * @job:	Pointer to the &struct media_job
> > > + * @ops:	Pointer to the &struct media_job_dep_ops
> > > + * @data:	Pointer to the data to pass to the dependency's operations
> > > + *
> > > + * This function adds a dependency to the job and should be called from the
> > > + * drivers job setup functions as registered with the framework through the
> > > + * media_jobs_add_job_setup_func() function.
> > > + *
> > > + * Return: 0 on success or a negative error number
> > > + */
> > > +int media_jobs_add_job_dep(struct media_job *job, struct media_job_dep_ops *ops,
> > > +			   void *data);
> > > +

We'll get back to this when discussing how to identify a dependency
user

> > > +/**
> > > + * media_jobs_add_job_setup_func - Add a function that populates a media job
> > > + *
> > > + * @sched:	Pointer to the media jobs scheduler
> > > + * @job_setup:	Pointer to the new job setup function
> > > + * @data:	Data to pass to the job setup function
> > > + * @type:	The type of job that this function should be called for
> > > + *
> > > + * Drivers that wish to utilise the framework need to use this function to
> > > + * register a callback that adds job steps and dependencies when one is created.
> > > + * The function must call media_jobs_add_job_step() and media_jobs_add_job_dep()
> > > + * to populate the job.
> > > + *
> > > + * Return: 0 on success or a negative error number
> > > + */
> > > +int media_jobs_add_job_setup_func(struct media_job_scheduler *sched,

If you move the scheduler to the media dev, then all these function
can operate on the media dev and the scheduler would be internal to
the media dev

> > > +				  int (*job_setup)(struct media_job *job, void *data),

define a type for this as well maybe

> > > +				  void *data, enum media_job_types type);
> > > +
> > > +/**
> > > + * media_jobs_put_scheduler - Put a reference to the media jobs scheduler
> > > + *
> > > + * @sched:	Pointer to the media jobs scheduler
> > > + *
> > > + * This function puts a reference to the media jobs scheduler, and is intended
> > > + * to be called in error and exit paths for consuming drivers
> > > + */
> > > +void media_jobs_put_scheduler(struct media_job_scheduler *sched);
> > > +
> > > +/**
> > > + * media_jobs_get_scheduler - Get a media jobs scheduler
> > > + *
> > > + * @mdev:	Pointer to the media device associated with the scheduler
> > > + *
> > > + * This function gets a pointer to a &struct media_job_scheduler associated with
> > > + * the media device passed to @mdev. If one is not available then it is
> > > + * allocated and returned. This allows multiple drivers sharing a media graph to
> > > + * work with the same media job scheduler.
> > > + *
> > > + * Return: 0 on success or a negative error number
> > > + */
> > > +struct media_job_scheduler *media_jobs_get_scheduler(struct media_device *mdev);
> > > +
> > > +/**
> > > + * media_jobs_run_jobs - Run any media jobs that are ready in the queue
> > > + *
> > > + * @sched:	Pointer to the media job scheduler
> > > + *
> > > + * This function triggers the workqueue that processes any jobs that have been
> > > + * queued, and should be called whenever the pipeline is ready to do so.
> > > + *
> > > + * To help reduce conditionals in drivers where a driver supports both the use
> > > + * of the media jobs framework and operation without it, this function is a no
> > > + * op if @sched is NULL.
> > > + */
> > > +void media_jobs_run_jobs(struct media_job_scheduler *sched);
> > > +
> > > +/**
> > > + * media_jobs_cancel_jobs - cancel all waiting jobs
> > > + *
> > > + * @sched:	Pointer to the media job scheduler
> > > + *
> > > + * This function iterates over any pending and queued jobs, resets their
> > > + * dependencies and frees the job
> > > + *
> > > + * To help reduce conditionals in drivers where a driver supports both the use
> > > + * of the media jobs framework and operation without it, this function is a no
> > > + * op if @sched is NULL.
> > > + */
> > > +void media_jobs_cancel_jobs(struct media_job_scheduler *sched);
> > > +
> > > +extern struct list_head media_job_schedulers;
> > > +extern struct mutex media_job_schedulers_lock;

These can (and should) be made static internal to mc-jobs.c

I've pushed a few patches for you to look at in the meantime, very
nice overall, I think even drivers without extenal dependencies could
use this framework and simplify the job (I've already seen in at
least 3 drivers) to maintain queues of jobs where to associate buffers
into. One step at the time :)

> > > +
> > > +#endif /* _MEDIA_JOBS_H */
> > > --
> > > 2.34.1
> > >
> > >

