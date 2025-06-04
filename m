Return-Path: <linux-media+bounces-34080-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7ABACE721
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 01:19:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A380189393B
	for <lists+linux-media@lfdr.de>; Wed,  4 Jun 2025 23:19:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E4CC2701CF;
	Wed,  4 Jun 2025 23:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="RMKiTRxs"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281D3224AF2;
	Wed,  4 Jun 2025 23:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749079175; cv=none; b=P7DeGoCnGAxagX6NUsKL4aQnBf06AMNewA2Ep6z1kDtiKu7rgLyn1mMguPm/tjcpvukK8RPVUMYEW2mQiWEIZTWvCnDtZBuQKL1Iu13pdUEIam7eaRr3tWBr0zPaX5i3AySMECsmtOhnLbIlQER3AieBWowUzGMFjrCjDDEjZDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749079175; c=relaxed/simple;
	bh=mTRCvc258jkudvZvomecwN9xV5gLl5CSYCwEsxmMdMM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BCceDa4jlYrQ2bYa40Rxe3QiHvoPtL2sfqZVE2sM0nf40ooQewm1hU4a+QoXw252xjjdKpBofK2wa8jHvSI+fgbF2+AIeF39RcKYaGZ04F01lWSufDEdyhVbZJDKj5+d3X8Bd8eeAjKj/IWoSoVZjRX+f+Eu8K7JRlDCeRPVN5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=RMKiTRxs; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749079170;
	bh=mTRCvc258jkudvZvomecwN9xV5gLl5CSYCwEsxmMdMM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=RMKiTRxsYuw/7GqgTwTKf2FGIC6xn9hC8jXJpdjWoeRNyZzpy4VWbA/EGF6h9TTMb
	 Ul+bq6Aawq37SBSD1Yod370/JmRXw4XG4Vrphip81LTQXi9DpeqgfcK0A/QDN/Il9x
	 RUy/nogkNeFbkdbEdJPxVRMc+i52pMEqKqSDVZdjCUxgAnpKNZvH58LKmVKuu3CnZX
	 8Nf3viuXiISMThnhBHtAjVtDpocVI1FdVA4EKYuMO3n3pNYY0dmdjth3ekn8jmiKwf
	 hT4bxc6zKtZ/XvocozUJb3CKLRlt7AL5/nbXjy/A6s/j9bsybJ+br7aw7sa9QTIRvt
	 RJdqC61qIuGxg==
Received: from [IPv6:2606:6d00:10:5285::c41] (unknown [IPv6:2606:6d00:10:5285::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B824F17E0C87;
	Thu,  5 Jun 2025 01:19:28 +0200 (CEST)
Message-ID: <1ccaaec7f782afc71bae5c3b0f60a786a907555c.camel@collabora.com>
Subject: Re: [PATCH v3 1/5] media: mc: add manual request completion
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Tiffany Lin
	 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	kernel@collabora.com, linux-media@vger.kernel.org, Sebastian Fricke	
 <sebastian.fricke@collabora.com>
Date: Wed, 04 Jun 2025 19:19:27 -0400
In-Reply-To: <aEC05991kEIIifDB@kekkonen.localdomain>
References: 
	<20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-0-603db4749d90@collabora.com>
	 <20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-1-603db4749d90@collabora.com>
	 <aEC05991kEIIifDB@kekkonen.localdomain>
Organization: Collabora Canada
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Le mercredi 04 juin 2025 à 21:04 +0000, Sakari Ailus a écrit :
> Hi Nicolas,
> 
> Thanks for the update.
> 
> On Wed, Jun 04, 2025 at 04:09:35PM -0400, Nicolas Dufresne wrote:
> > From: Hans Verkuil <hverkuil@xs4all.nl>
> > 
> > By default when the last request object is completed, the whole
> > request completes as well.
> > 
> > But sometimes you want to delay this completion to an arbitrary point in
> > time so add a manual complete mode for this.
> > 
> > In req_queue the driver marks the request for manual completion by
> > calling media_request_mark_manual_completion, and when the driver
> > wants to manually complete the request it calls
> > media_request_manual_complete().
> > 
> > Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > ---
> >  drivers/media/mc/mc-request.c | 38 ++++++++++++++++++++++++++++++++++++--
> >  include/media/media-request.h | 38 +++++++++++++++++++++++++++++++++++++-
> >  2 files changed, 73 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/media/mc/mc-request.c b/drivers/media/mc/mc-request.c
> > index 5edfc2791ce7c7485def5db675bbf53ee223d837..398d0806d1d274eb8c454fc5c37b77476abe1e74 100644
> > --- a/drivers/media/mc/mc-request.c
> > +++ b/drivers/media/mc/mc-request.c
> > @@ -54,6 +54,7 @@ static void media_request_clean(struct media_request *req)
> >  	req->access_count = 0;
> >  	WARN_ON(req->num_incomplete_objects);
> >  	req->num_incomplete_objects = 0;
> > +	req->manual_completion = false;
> >  	wake_up_interruptible_all(&req->poll_wait);
> >  }
> >  
> > @@ -313,6 +314,7 @@ int media_request_alloc(struct media_device *mdev, int *alloc_fd)
> >  	req->mdev = mdev;
> >  	req->state = MEDIA_REQUEST_STATE_IDLE;
> >  	req->num_incomplete_objects = 0;
> > +	req->manual_completion = false;
> >  	kref_init(&req->kref);
> >  	INIT_LIST_HEAD(&req->objects);
> >  	spin_lock_init(&req->lock);
> > @@ -459,7 +461,7 @@ void media_request_object_unbind(struct media_request_object *obj)
> >  
> >  	req->num_incomplete_objects--;
> >  	if (req->state == MEDIA_REQUEST_STATE_QUEUED &&
> > -	    !req->num_incomplete_objects) {
> > +	    !req->num_incomplete_objects && !req->manual_completion) {
> >  		req->state = MEDIA_REQUEST_STATE_COMPLETE;
> >  		completed = true;
> >  		wake_up_interruptible_all(&req->poll_wait);
> > @@ -488,7 +490,7 @@ void media_request_object_complete(struct media_request_object *obj)
> >  	    WARN_ON(req->state != MEDIA_REQUEST_STATE_QUEUED))
> >  		goto unlock;
> >  
> > -	if (!--req->num_incomplete_objects) {
> > +	if (!--req->num_incomplete_objects && !req->manual_completion) {
> >  		req->state = MEDIA_REQUEST_STATE_COMPLETE;
> >  		wake_up_interruptible_all(&req->poll_wait);
> >  		completed = true;
> > @@ -499,3 +501,35 @@ void media_request_object_complete(struct media_request_object *obj)
> >  		media_request_put(req);
> >  }
> >  EXPORT_SYMBOL_GPL(media_request_object_complete);
> > +
> > +void media_request_manual_complete(struct media_request *req)
> > +{
> > +	unsigned long flags;
> 
> I'd declare flags as last.
> 
> > +	bool completed = false;
> > +
> > +	if (WARN_ON(!req))
> > +		return;
> > +	if (WARN_ON(!req->manual_completion))
> > +		return;
> 
> I think I'd use WARN_ON_ONCE() consistently: this is a driver (or
> framework) bug and telling once about it is very probably enough.

Just to be sure, you only mean for the two checks above ? Or did
you mean for the entire function ?

> 
> > +
> > +	spin_lock_irqsave(&req->lock, flags);

In practice, if you call this specific function from two places at the same
time you have a bug, but I realize that moving the the warning on the check
manual_completion inside that lock would massively help detect that case.

What do you think ?

> > +	if (WARN_ON(req->state != MEDIA_REQUEST_STATE_QUEUED))
> > +		goto unlock;
> > +
> > +	req->manual_completion = false;
> > +	/*
> > +	 * It is expected that all other objects in this request are
> > +	 * completed when this function is called. WARN if that is
> > +	 * not the case.
> > +	 */
> > +	if (!WARN_ON(req->num_incomplete_objects)) {
> > +		req->state = MEDIA_REQUEST_STATE_COMPLETE;
> > +		wake_up_interruptible_all(&req->poll_wait);
> > +		completed = true;
> > +	}
> 
> A newline would be nice here.
> 
> > +unlock:
> > +	spin_unlock_irqrestore(&req->lock, flags);
> > +	if (completed)
> > +		media_request_put(req);
> > +}
> > +EXPORT_SYMBOL_GPL(media_request_manual_complete);
> > diff --git a/include/media/media-request.h b/include/media/media-request.h
> > index d4ac557678a78372222704400c8c96cf3150b9d9..7f9af68ef19ac6de0184bbb0c0827dc59777c6dc 100644
> > --- a/include/media/media-request.h
> > +++ b/include/media/media-request.h
> > @@ -56,6 +56,9 @@ struct media_request_object;
> >   * @access_count: count the number of request accesses that are in progress
> >   * @objects: List of @struct media_request_object request objects
> >   * @num_incomplete_objects: The number of incomplete objects in the request
> > + * @manual_completion: if true, then the request won't be marked as completed
> > + * when @num_incomplete_objects reaches 0. Call media_request_manual_complete()
> > + * to complete the request after @num_incomplete_objects == 0.
> >   * @poll_wait: Wait queue for poll
> >   * @lock: Serializes access to this struct
> >   */
> > @@ -68,6 +71,7 @@ struct media_request {
> >  	unsigned int access_count;
> >  	struct list_head objects;
> >  	unsigned int num_incomplete_objects;
> > +	bool manual_completion;
> >  	wait_queue_head_t poll_wait;
> >  	spinlock_t lock;
> >  };
> > @@ -218,6 +222,38 @@ media_request_get_by_fd(struct media_device *mdev, int request_fd);
> >  int media_request_alloc(struct media_device *mdev,
> >  			int *alloc_fd);
> >  
> > +/**
> > + * media_request_mark_manual_completion - Enable manual completion
> > + *
> > + * @req: The request
> > + *
> > + * Mark that the request has to be manually completed by calling
> > + * media_request_manual_complete().
> > + *
> > + * This function shall be called in the req_queue callback.
> > + */
> > +static inline void
> > +media_request_mark_manual_completion(struct media_request *req)
> > +{
> > +	req->manual_completion = true;
> > +}
> > +
> > +/**
> > + * media_request_manual_complete - Mark the request as completed
> > + *
> > + * @req: The request
> > + *
> > + * This function completes a request that was marked for manual completion by an
> > + * earlier call to media_request_mark_manual_completion(). The request's
> > + * @manual_completion flag is reset to false.
> 
> s/flag/field/
> 
> > + *
> > + * All objects contained in the request must have been completed previously. It
> > + * is an error to call this function otherwise. If such an error occurred, the
> > + * function will WARN and the object completion will be delayed until
> > + * @num_incomplete_objects is 0.
> > + */
> > +void media_request_manual_complete(struct media_request *req);
> > +
> >  #else
> >  
> >  static inline void media_request_get(struct media_request *req)
> > @@ -336,7 +372,7 @@ void media_request_object_init(struct media_request_object *obj);
> >   * @req: The media request
> >   * @ops: The object ops for this object
> >   * @priv: A driver-specific priv pointer associated with this object
> > - * @is_buffer: Set to true if the object a buffer object.
> > + * @is_buffer: Set to true if the object is a buffer object.
> >   * @obj: The object
> >   *
> >   * Bind this object to the request and set the ops and priv values of
> > 

