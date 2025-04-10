Return-Path: <linux-media+bounces-29972-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08347A84C10
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 20:27:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B5831B62424
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 18:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB90E28D82F;
	Thu, 10 Apr 2025 18:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jPH7kwO5"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35BC1E8855;
	Thu, 10 Apr 2025 18:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744309607; cv=none; b=GbCSJnZWQ9dU5AVRwvjKifZ+xliPBlVhPzPZD6rODqts84R6NF1zkAn8cFlWLkE6wEMgibqSgrLAZ0cbE+s8ePcGCwo2ybcp/Ueui1nYMOwjcltED7Ax6NUIQ7q6FLtPH/4lgtyM/00Mrh9PeCXzlRbYlOO148KoD/SRr68lAyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744309607; c=relaxed/simple;
	bh=yzqukFcSBxfJvBMDE85nnf6QDx+CjY7dKZRbUL3ocIc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H1eY+VFIl0lEsoFPLy0VIvnLbXjybUqt1p/sV8loxJSStH6jvdjEGVzs72jQ7PyxW9V2qjzpr9ySHnIz3oMAlGAl9c0K6+zpygM3zRJHfZL6e+qQVLdJXv4hAnQFSn04dAmGSCX2EhkhhkTRDeqxc/J7BKNVT66T3Qp5WwoYyhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jPH7kwO5; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744309602;
	bh=yzqukFcSBxfJvBMDE85nnf6QDx+CjY7dKZRbUL3ocIc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=jPH7kwO51hhoq2EFhbWp/pYBGWZKHY6EvWafXJ/GN9q+AZObuMqE/tMN5EshcWGBD
	 rSgcFsCwP4g7Bmg53XFBMBo4NGxByUG9isoALf4gntgMp4cBoOGwIA1Ow1VFmmPRhI
	 J1SA/6Z3bHYPAnougc0I9dt3i/gPQxjlJTXTuO0ibowWzOLL3WNBUw1GI2H2NHOcVK
	 KkT1RkzGmQvOXvxJNaup6asw2ZY6I7GLBW0VJ1JWAL4lBu0JwG83lClGhZR3InA/Tz
	 n1kVsYEp7MnlZoOAFcmPP75TMozwccn1okbmdo/DChdEXJV19AdHcajQaX5WbZPAZI
	 2tLGqtHhDUc5w==
Received: from [IPv6:2606:6d00:11:e976::5ac] (unknown [IPv6:2606:6d00:11:e976::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E059817E03B6;
	Thu, 10 Apr 2025 20:26:40 +0200 (CEST)
Message-ID: <829f05dc918a9a8a1848ecb68d175c8d7f892584.camel@collabora.com>
Subject: Re: [PATCH v2 1/5] media: mc: add manual request completion
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Tiffany Lin	
 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	kernel@collabora.com, linux-media@vger.kernel.org, Sebastian Fricke	
 <sebastian.fricke@collabora.com>
Date: Thu, 10 Apr 2025 14:26:39 -0400
In-Reply-To: <20250410175010.GF27870@pendragon.ideasonboard.com>
References: 
	<20250410-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v2-0-5b99ec0450e6@collabora.com>
	 <20250410-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v2-1-5b99ec0450e6@collabora.com>
	 <20250410175010.GF27870@pendragon.ideasonboard.com>
Organization: Collabora Canada
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Hans, 

another question for you below.

Le jeudi 10 avril 2025 à 20:50 +0300, Laurent Pinchart a écrit :
> Hi Nicolas,
> 
> Thank you for the patch.
> 
> On Thu, Apr 10, 2025 at 11:39:56AM -0400, Nicolas Dufresne wrote:
> > From: Hans Verkuil <hverkuil@xs4all.nl>
> > 
> > By default when the last request object is completed, the whole
> > request completes as well.
> > 
> > But sometimes you want to manually complete a request in a driver,
> > so add a manual complete mode for this.
> 
> I didn't immediately understand this was about delaying completion of
> the request. It would be nice to make that more explicit in the
> commit
> message and in the documentation of
> media_request_mark_manual_completion(). A sample use case would also
> help.
> 
> > In req_queue the driver marks the request for manual completion by
> > calling media_request_mark_manual_completion, and when the driver
> > wants to manually complete the request it calls
> > media_request_manual_complete().
> > 
> > Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

The CI is not happy that the Sob did not match the author, shall we
ignore the CI or edit one of the two ?

Nicolas

> > Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > ---
> >  drivers/media/mc/mc-request.c | 38
> > ++++++++++++++++++++++++++++++++++++--
> >  include/media/media-request.h | 36
> > +++++++++++++++++++++++++++++++++++-
> >  2 files changed, 71 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/media/mc/mc-request.c b/drivers/media/mc/mc-
> > request.c
> > index
> > 5edfc2791ce7c7485def5db675bbf53ee223d837..398d0806d1d274eb8c454fc5c
> > 37b77476abe1e74 100644
> > --- a/drivers/media/mc/mc-request.c
> > +++ b/drivers/media/mc/mc-request.c
> > @@ -54,6 +54,7 @@ static void media_request_clean(struct
> > media_request *req)
> >  	req->access_count = 0;
> >  	WARN_ON(req->num_incomplete_objects);
> >  	req->num_incomplete_objects = 0;
> > +	req->manual_completion = false;
> >  	wake_up_interruptible_all(&req->poll_wait);
> >  }
> >  
> > @@ -313,6 +314,7 @@ int media_request_alloc(struct media_device
> > *mdev, int *alloc_fd)
> >  	req->mdev = mdev;
> >  	req->state = MEDIA_REQUEST_STATE_IDLE;
> >  	req->num_incomplete_objects = 0;
> > +	req->manual_completion = false;
> >  	kref_init(&req->kref);
> >  	INIT_LIST_HEAD(&req->objects);
> >  	spin_lock_init(&req->lock);
> > @@ -459,7 +461,7 @@ void media_request_object_unbind(struct
> > media_request_object *obj)
> >  
> >  	req->num_incomplete_objects--;
> >  	if (req->state == MEDIA_REQUEST_STATE_QUEUED &&
> > -	    !req->num_incomplete_objects) {
> > +	    !req->num_incomplete_objects && !req-
> > >manual_completion) {
> >  		req->state = MEDIA_REQUEST_STATE_COMPLETE;
> >  		completed = true;
> >  		wake_up_interruptible_all(&req->poll_wait);
> > @@ -488,7 +490,7 @@ void media_request_object_complete(struct
> > media_request_object *obj)
> >  	    WARN_ON(req->state != MEDIA_REQUEST_STATE_QUEUED))
> >  		goto unlock;
> >  
> > -	if (!--req->num_incomplete_objects) {
> > +	if (!--req->num_incomplete_objects && !req-
> > >manual_completion) {
> >  		req->state = MEDIA_REQUEST_STATE_COMPLETE;
> >  		wake_up_interruptible_all(&req->poll_wait);
> >  		completed = true;
> > @@ -499,3 +501,35 @@ void media_request_object_complete(struct
> > media_request_object *obj)
> >  		media_request_put(req);
> >  }
> >  EXPORT_SYMBOL_GPL(media_request_object_complete);
> > +
> > +void media_request_manual_complete(struct media_request *req)
> > +{
> > +	unsigned long flags;
> > +	bool completed = false;
> > +
> > +	if (WARN_ON(!req))
> > +		return;
> > +	if (WARN_ON(!req->manual_completion))
> > +		return;
> > +
> > +	spin_lock_irqsave(&req->lock, flags);
> > +	if (WARN_ON(req->state != MEDIA_REQUEST_STATE_QUEUED))
> > +		goto unlock;
> > +
> > +	req->manual_completion = false;
> > +	/*
> > +	 * It is expected that all other objects in this request
> > are
> > +	 * completed when this function is called. WARN if that is
> > +	 * not the case.
> > +	 */
> > +	if (!WARN_ON(req->num_incomplete_objects)) {
> > +		req->state = MEDIA_REQUEST_STATE_COMPLETE;
> > +		wake_up_interruptible_all(&req->poll_wait);
> > +		completed = true;
> > +	}
> > +unlock:
> > +	spin_unlock_irqrestore(&req->lock, flags);
> > +	if (completed)
> > +		media_request_put(req);
> > +}
> > +EXPORT_SYMBOL_GPL(media_request_manual_complete);
> > diff --git a/include/media/media-request.h b/include/media/media-
> > request.h
> > index
> > d4ac557678a78372222704400c8c96cf3150b9d9..645d18907be7148ca50dcc924
> > 8ff06bd8ccdf953 100644
> > --- a/include/media/media-request.h
> > +++ b/include/media/media-request.h
> > @@ -56,6 +56,10 @@ struct media_request_object;
> >   * @access_count: count the number of request accesses that are in
> > progress
> >   * @objects: List of @struct media_request_object request objects
> >   * @num_incomplete_objects: The number of incomplete objects in
> > the request
> > + * @manual_completion: if true, then the request won't be marked
> > as completed
> > + * when @num_incomplete_objects reaches 0. Call
> > media_request_manual_complete()
> > + * to set this field to false and complete the request
> 
> I'd drop "set this field to false and " here.
> 
> > + * if @num_incomplete_objects == 0.
> 
>  * after @num_incomplete_objects reaches 0.
> 
> >   * @poll_wait: Wait queue for poll
> >   * @lock: Serializes access to this struct
> >   */
> > @@ -68,6 +72,7 @@ struct media_request {
> >  	unsigned int access_count;
> >  	struct list_head objects;
> >  	unsigned int num_incomplete_objects;
> > +	bool manual_completion;
> >  	wait_queue_head_t poll_wait;
> >  	spinlock_t lock;
> >  };
> > @@ -218,6 +223,35 @@ media_request_get_by_fd(struct media_device
> > *mdev, int request_fd);
> >  int media_request_alloc(struct media_device *mdev,
> >  			int *alloc_fd);
> >  
> > +/**
> > + * media_request_mark_manual_completion - Set manual_completion to
> > true
> > + *
> > + * @req: The request
> > + *
> > + * Mark that the request has to be manually completed by calling
> > + * media_request_manual_complete().
> > + *
> > + * This function should be called in the req_queue callback.
> 
> s/should/shall/ unless it's not a hard requirement. Any way to catch
> incorrect call patterns ?
> 
> > + */
> > +static inline void
> > +media_request_mark_manual_completion(struct media_request *req)
> > +{
> > +	req->manual_completion = true;
> > +}
> > +
> > +/**
> > + * media_request_manual_complete - Set manual_completion to false
> 
> The main purpose of the function is to complete the request, not
> setting
> manual_completion to false.
> 
> > + *
> > + * @req: The request
> > + *
> > + * Set @manual_completion to false, and if @num_incomplete_objects
> > + * is 0, then mark the request as completed.
> > + *
> > + * If there are still incomplete objects in the request, then
> > + * WARN for that since that suggests a driver error.
> 
> If that's an error then I'd document it more explicitly, as the first
> sentence makes it sound that both cases are valid. Maybe
> 
>  * This function completes a request that was marked for manual
> completion by an
>  * earlier call to media_request_mark_manual_completion(). The
> request's
>  * @manual_completion flag is reset to false.
>  *
>  * All objects contained in the request must have been completed
> previously. It
>  * is an error to call this function otherwise. The request will not
> be
>  * completed in that case, and the function will WARN.
> 
> > + */
> > +void media_request_manual_complete(struct media_request *req);
> > +
> >  #else
> >  
> >  static inline void media_request_get(struct media_request *req)
> > @@ -336,7 +370,7 @@ void media_request_object_init(struct
> > media_request_object *obj);
> >   * @req: The media request
> >   * @ops: The object ops for this object
> >   * @priv: A driver-specific priv pointer associated with this
> > object
> > - * @is_buffer: Set to true if the object a buffer object.
> > + * @is_buffer: Set to true if the object is a buffer object.
> >   * @obj: The object
> >   *
> >   * Bind this object to the request and set the ops and priv values
> > of

-- 
Nicolas Dufresne
Principal Engineer at Collabora

