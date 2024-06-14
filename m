Return-Path: <linux-media+bounces-13282-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0F2909214
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 20:00:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 390301C21C23
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 18:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5581C19DF55;
	Fri, 14 Jun 2024 18:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="iDSwZ7T8"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A1E1465A4
	for <linux-media@vger.kernel.org>; Fri, 14 Jun 2024 18:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718388040; cv=none; b=htVZQqrEeF+pDUD+/uoCrPtWXRdAdS4e94eGo1HlIMOfosSnUXSG2IBhBzvnS8hyCP+nFfEvnX0G9M93GDBhbwBxL1O3Sbl3M22o20q9zFKmOipxEldRyBOvSi1422yf7tn6WPvJ5rjGULwtCy7z5zh75n61vYM0SjPXYsvrRU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718388040; c=relaxed/simple;
	bh=3Egxs5Yr/kxiT+D/NCqgrXpDH+eEaEHuyWg/kjw4TcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WXlWmPz/oCvol8N4y2Qb4Z4jSKZYRYzo5WQCEhYeCy8c9C0K94nn0ihvsB7zFudNCOaiPFTweE1JxsA4HEaAi2deVUv2uqK//MqifmKJCbY1vIQR9GAE+nWhrtjhnLAprJ1Fif0epDzMS7vQnXnMAZwk+wto+3jrrxLUILWCM2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=iDSwZ7T8; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=/7OafIWp6zQ7Vg1U+vHmU/he9vRrmsqIBPMLBg9CMLA=; b=iDSwZ7T83cptFwKIxOv39C4+5A
	az+QIUyleHOihmo95oKvhn140wFs2q8/vv68+Mfrd1MjP1fu91Ptfhpxy4w8i2FSR1ns3yFJ2qcte
	zpAH/87TpSh/UDtzXwYWGBlBXvLq96wo7IsOyTLrQJw1OR6Y2VI/GaR8nJEJSciuhNC8BhtpEd6qt
	feQpVARdOuYfst+ToOftovOrhoJO2Wk/+Xa9SaQyG6e4eZDkhJ53/IzdZRKraMVY3ftzbr/ynqYvQ
	yNb29bAAfj1+vNTqKFRXss71bu5cmohSg0WIA+EZzh14uNlHQtiaa4hpJAO934P6eGSkUnHOTpjqp
	zhEXwBgQ==;
Received: from 179-125-75-216-dinamico.pombonet.net.br ([179.125.75.216] helo=quatroqueijos.cascardo.eti.br)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1sIBDm-003DjV-2H; Fri, 14 Jun 2024 20:00:19 +0200
Date: Fri, 14 Jun 2024 15:00:09 -0300
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
	Gustavo Padovan <gustavo@padovan.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	kernel-dev@igalia.com, Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
	Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH] dma-buf/sw_sync: Add a reference when adding fence to
 timeline list
Message-ID: <ZmyFKVuYvs59Oirt@quatroqueijos.cascardo.eti.br>
References: <20240324101533.3271056-1-cascardo@igalia.com>
 <fc68dce2-88e0-4055-a074-bd45f7e68912@igalia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc68dce2-88e0-4055-a074-bd45f7e68912@igalia.com>

On Fri, Jun 14, 2024 at 11:52:03AM +0100, Tvrtko Ursulin wrote:
> 
> On 24/03/2024 10:15, Thadeu Lima de Souza Cascardo wrote:
> > commit e531fdb5cd5e ("dma-buf/sw_sync: Avoid recursive lock during fence
> > signal") fixed a recursive locking when a signal callback released a fence.
> > It did it by taking an extra reference while traversing it on the list and
> > holding the timeline lock.
> > 
> > However, this is racy and may end up adding to a kref that is 0, triggering
> > a well deserved warning, as later that reference would be put again.
> > 
> > CPU 0					CPU 1
> > sync_file_release			sync_timeline_signal
> >    dma_fence_put
> >      timeline_fence_release
> > 					  spin_lock_irq(&obj->lock)
> > 					  dma_fence_get(&pt->base)
> >      spin_lock_irqsave(fence->lock, flags)
> > 
> > As shown above, it is possible for the last reference to be dropped, but
> > sync_timeline_signal take the lock before timeline_fence_release, which
> > will lead to a 0->1 kref transition, which is not allowed.
> > 
> > This is because there is still a pointer to the fence object in the list,
> > which should be accounted as a reference.
> > 
> > In previous discussions about this [3], it was called out that keeping such
> > a reference was not a good idea because the fence also holds a reference to
> > the timeline, hence leading to a loop. However, accounting for that
> > reference doesn't change that the loop already exists. And userspace holds
> > references in the form of file descriptors, so it is still possible to
> > avoid potential memory leaks.
> > 
> > This fix also avoids other issues. The nested locking is still possible to
> > trigger when closing the timeline, as sw_sync_debugfs_release also calls
> > dma_fence_signal_locked while holding the lock. By holding a reference and
> > releasing it only after doing the signal, that nested locking is avoided.
> > 
> > There are a few quirks about the reference counting here, though.
> > 
> > In the simple case when sync_pt_create adds a new fence to the list, it
> > returns with 2 references instead of 1. That is dealt with as
> > sw_sync_ioctl_create_fence always puts a reference after calling
> > sync_file_create. That is necessary for multiple reasons.
> > 
> > One is that it takes care of the error case when sync_file_create fails.
> > 
> > The extra reference is put, while the fence is still held on the list, so
> > its last reference will be put when it is removed from the list either in
> > sync_timeline_signal or sw_sync_debugfs_release.
> 
> So any fences where sync_file_create failed linger around until
> sw_sync_debugfs_release? Okay-ish I guess since it is a pathological case.
> 

The challenge here is to determine which one of the multiple cases we are
dealing with. Since we don't hold the lock while sync_file_create is
called, we are left with this situation. An alternative would be to fold
sync_pt_create into sw_sync_ioctl_create_fence, so at least we can
determine which case is which. That would also fix the case where we handle
userspace a file descriptor with a fence that is not even on the list.

> > It also avoids the race when a signal may come in between sync_pt_create
> > and sync_file_create as the lock is dropped. If that happens, the fence
> > will be removed from the list, but a reference will still be kept as
> > sync_file_create takes a reference.
> > 
> > Then, there is the case when a fence with the given seqno already exists.
> > sync_pt_create returns with an extra reference to it, that we later put.
> > Similar reasoning can be applied here. That one extra reference is
> > necessary to avoid a race with signaling (and release), and we later put
> > that extra reference.
> > 
> > Finally, there is the case when the fence is already signaled and not added
> > to the list. In such case, sync_pt_create must return with a single
> > reference as this fence has not been added to the timeline list. It will
> > either be freed in case sync_file_create fails or the file will keep its
> > reference, which is later put when the file is released.
> > 
> > This is based on Chris Wilson attempt [2] to fix recursive locking during
> > timeline signal. Hence, their signoff.
> > 
> > Link: https://lore.kernel.org/all/20200714154102.450826-1-bas@basnieuwenhuizen.nl/ [1]
> > Link: https://lore.kernel.org/all/20200715100432.13928-2-chris@chris-wilson.co.uk/ [2]
> > Link: https://lore.kernel.org/all/20230817213729.110087-1-robdclark@gmail.com/T/ [3]
> > Fixes: e531fdb5cd5e ("dma-buf/sw_sync: Avoid recursive lock during fence signal")
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
> > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> > Cc: Rob Clark <robdclark@chromium.org>
> > ---
> >   drivers/dma-buf/sw_sync.c | 42 ++++++++++++++++-----------------------
> >   1 file changed, 17 insertions(+), 25 deletions(-)
> > 
> > diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
> > index c353029789cf..83b624ac4faa 100644
> > --- a/drivers/dma-buf/sw_sync.c
> > +++ b/drivers/dma-buf/sw_sync.c
> > @@ -151,16 +151,7 @@ static const char *timeline_fence_get_timeline_name(struct dma_fence *fence)
> >   static void timeline_fence_release(struct dma_fence *fence)
> >   {
> > -	struct sync_pt *pt = dma_fence_to_sync_pt(fence);
> >   	struct sync_timeline *parent = dma_fence_parent(fence);
> > -	unsigned long flags;
> > -
> > -	spin_lock_irqsave(fence->lock, flags);
> > -	if (!list_empty(&pt->link)) {
> > -		list_del(&pt->link);
> > -		rb_erase(&pt->node, &parent->pt_tree);
> > -	}
> > -	spin_unlock_irqrestore(fence->lock, flags);
> >   	sync_timeline_put(parent);
> >   	dma_fence_free(fence);
> > @@ -229,7 +220,6 @@ static const struct dma_fence_ops timeline_fence_ops = {
> >    */
> >   static void sync_timeline_signal(struct sync_timeline *obj, unsigned int inc)
> >   {
> > -	LIST_HEAD(signalled);
> >   	struct sync_pt *pt, *next;
> >   	trace_sync_timeline(obj);
> > @@ -242,20 +232,14 @@ static void sync_timeline_signal(struct sync_timeline *obj, unsigned int inc)
> >   		if (!timeline_fence_signaled(&pt->base))
> >   			break;
> > -		dma_fence_get(&pt->base);
> > -
> > -		list_move_tail(&pt->link, &signalled);
> > +		list_del(&pt->link);
> >   		rb_erase(&pt->node, &obj->pt_tree);
> >   		dma_fence_signal_locked(&pt->base);
> > +		dma_fence_put(&pt->base);
> >   	}
> >   	spin_unlock_irq(&obj->lock);
> > -
> > -	list_for_each_entry_safe(pt, next, &signalled, link) {
> > -		list_del_init(&pt->link);
> > -		dma_fence_put(&pt->base);
> > -	}
> >   }
> >   /**
> > @@ -299,13 +283,11 @@ static struct sync_pt *sync_pt_create(struct sync_timeline *obj,
> >   			} else if (cmp < 0) {
> >   				p = &parent->rb_left;
> >   			} else {
> > -				if (dma_fence_get_rcu(&other->base)) {
> > -					sync_timeline_put(obj);
> > -					kfree(pt);
> > -					pt = other;
> > -					goto unlock;
> > -				}
> > -				p = &parent->rb_left;
> > +				/* This is later put in sw_sync_ioctl_create_fence. */
> > +				dma_fence_get(&other->base);
> > +				dma_fence_put(&pt->base);
> 
> Couldn't this have stayed a direct kfree given pt is not exposed to anywhere
> at this point, nor it will be? I know there would need to be an explicit
> sync_timeline_put(obj) too, as before, but perhaps that would read more
> obvious.
> 

Maybe this is a matter of opinion. I find it easier to read dma_fence_put
instead of doing what I just did which was checking that sync_timeline_put
and kfree was all left to do. And then I notice there is also tracing
involved in that path. Do we care about tracing such a case? Or do we want
it explicitly not traced? I would rather keep it as dma_fence_put.

> > +				pt = other;
> > +				goto unlock;
> >   			}
> >   		}
> >   		rb_link_node(&pt->node, parent, p);
> > @@ -314,6 +296,8 @@ static struct sync_pt *sync_pt_create(struct sync_timeline *obj,
> >   		parent = rb_next(&pt->node);
> >   		list_add_tail(&pt->link,
> >   			      parent ? &rb_entry(parent, typeof(*pt), node)->link : &obj->pt_list);
> > +		/* Adding to the list requires a reference. */
> > +		dma_fence_get(&pt->base);
> >   	}
> >   unlock:
> >   	spin_unlock_irq(&obj->lock);
> > @@ -354,6 +338,7 @@ static int sw_sync_debugfs_release(struct inode *inode, struct file *file)
> >   	list_for_each_entry_safe(pt, next, &obj->pt_list, link) {
> >   		dma_fence_set_error(&pt->base, -ENOENT);
> >   		dma_fence_signal_locked(&pt->base);
> > +		dma_fence_put(&pt->base);
> 
> Can't this be dropping one reference too many?
> 
> There is one reference for being on the list, and one for the owning file.
> Or there is another one?
> 
> If there isn't, dma_fence_signal_locked will drop the one for being on the
> list, and then we drop one more here. Is it the last one? Shouldn't
> sync_file_release still own one?

Does dma_fence_signal_locked drop a reference? A callback may drop a
reference because it was necessarily taken, but then it is an extra
reference. We are dropping this one here because we are done with the list.
We are not actually removing things from the list because it cannot be
referenced anymore, sw_sync is being released.

Now, I may not remember some of the details, and this might be related to
the circular references that is discussed in the commit message, but let's
assume that we still have an opened fd sync_file reference to this fence.
The only thing touching the list left is sync_timeline_signal, which is
called by an ioctl on the timeline fd which is not available anymore. We
can explicitly remove things from the list here and be on the safer side.
The issue exists already, it is just not possible to trigger it with the
current code.

I am not sure how easy it is to provide a different version that fixes both
the "useless fence on pt_list to which userspace has no fd" and "fence fd
that can never be signaled as it is not on the list because it was already
signaled". Perhaps this last one can be "fixed" with setting the signaled
bit on the fence, but I have the impression this is already done. So,
perhaps, not much worth doing it?

Thanks a lot.
Cascardo.

PS:

After a quick revisit here, we can easily fix the case when the fence is
not added to the list: return NULL (or rather, change it to an ERR_PTR)
when the fence is already signaled. Any preference for an error code here?
-EEXIST, perhaps?

As for the case where sync_file_create or copy_to_user fails and the fence
is left on the list, this wouldn't be different from creating the fence and
closing the file descriptor. The fence would still be left there until it
is either signaled or the timeline is released.


> 
> Regards,
> 
> Tvrtko
> 
> >   	}
> >   	spin_unlock_irq(&obj->lock);
> > @@ -386,7 +371,14 @@ static long sw_sync_ioctl_create_fence(struct sync_timeline *obj,
> >   	}
> >   	sync_file = sync_file_create(&pt->base);
> > +
> > +	/*
> > +	 * Puts the extra reference returned by sync_pt_create. This is necessary
> > +	 * to avoid a race where the fence is signaled, removed from the list and
> > +	 * released right after sync_pt_create releases the lock and returns.
> > +	 */
> >   	dma_fence_put(&pt->base);
> > +
> >   	if (!sync_file) {
> >   		err = -ENOMEM;
> >   		goto err;

