Return-Path: <linux-media+bounces-29975-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A84AA84C8F
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 21:05:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4E26F7ADEEB
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 19:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90A5A28D841;
	Thu, 10 Apr 2025 19:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="n0mPLmb6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF391204684;
	Thu, 10 Apr 2025 19:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744311949; cv=none; b=Jc+q+1UtYtiXJmpBE2Gc/+0IRJq7EpfUjde7yjdTeWyYVrQVMgAdLpg9HtvBMEbChbnf73AMh68GtRd4pwFo0OjgqO304vCXoo8oVhn/lFrcVT3xSJ/rwG0AzM8/ElxmiPCSx5yk7ZBeikNShTBwWS+oQ1cId9barGDe9Hk17MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744311949; c=relaxed/simple;
	bh=vYdv1sVZtCqHJ1wS/BMmb7wbFQHJ09S7g/Am+7Bju3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qbn+rC+/yvOaChXnVyFqjCk0Al5RwFYoKc8MUduCj/s1wS9CPigGuPoga5hRQT73DQwZeFdcdst5c24nJmXdNlEsFfOHTBCgwBAvgTYznr1nxxgJSPR94QX367Mmqpr58socGykNDti41RttKREOg2gsiqau4ivz4kPkUjt4VF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=n0mPLmb6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D584C352;
	Thu, 10 Apr 2025 21:03:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744311826;
	bh=vYdv1sVZtCqHJ1wS/BMmb7wbFQHJ09S7g/Am+7Bju3Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n0mPLmb6VHt5+S1gTRqRercYFGK0nm80K2leTqRv7zdbUHYZ1HJ5Sh90M2YdC5I5t
	 rudXg1QkFxfngTi3w3ZbhYz2EJZQ+VM/5roNrPGS5QT34j/Kf3gjIChajtATlAGv8i
	 +A6KwvjTDkLpCf4s1ghRpi6auq3e+TeGtZlPLvjE=
Date: Thu, 10 Apr 2025 22:05:18 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com,
	linux-media@vger.kernel.org,
	Sebastian Fricke <sebastian.fricke@collabora.com>
Subject: Re: [PATCH v2 1/5] media: mc: add manual request completion
Message-ID: <20250410190518.GG27870@pendragon.ideasonboard.com>
References: <20250410-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v2-0-5b99ec0450e6@collabora.com>
 <20250410-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v2-1-5b99ec0450e6@collabora.com>
 <20250410175010.GF27870@pendragon.ideasonboard.com>
 <f6cd46032970dd696bbdb087b203b3bd49e7a161.camel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f6cd46032970dd696bbdb087b203b3bd49e7a161.camel@collabora.com>

On Thu, Apr 10, 2025 at 02:41:36PM -0400, Nicolas Dufresne wrote:
> Le jeudi 10 avril 2025 à 20:50 +0300, Laurent Pinchart a écrit :
> > On Thu, Apr 10, 2025 at 11:39:56AM -0400, Nicolas Dufresne wrote:
> > > From: Hans Verkuil <hverkuil@xs4all.nl>
> > > 
> > > By default when the last request object is completed, the whole
> > > request completes as well.
> > > 
> > > But sometimes you want to manually complete a request in a driver,
> > > so add a manual complete mode for this.
> > 
> > I didn't immediately understand this was about delaying completion of
> > the request. It would be nice to make that more explicit in the commit
> > message and in the documentation of
> > media_request_mark_manual_completion(). A sample use case would also
> > help.
> 
> I have never considered this a "delay", but an explicit completion
> function. In short you want to use that if you are not satisfied with
> the existing implicit logic that currently delays and complete the
> request based on the media_request_object attachments.

But you can only delay completion with this mechanism, not complete the
request earlier, right ? As far as I understand, this mechanism is about
telling the framework that the driver holds an extra "reference" to the
request, and that the request shouldn't be completed until that
"reference" is released.

If we think about this as an extra reference, do we need to forbid
dropping it while there are still objects in the request ? Could there
be use cases where driver may want to drop their "reference" earlier ?

> We can add this multi-core CODEC use case as an example.
> 
> The only alternative to that would have been to allocate a driver
> specific media_request_object and store it in request. This is a rather
> expensive and complicated way to do this. I even got to a point I
> considered having a media_request_object in the driver specific
> media_request, so avoid the runtime allocs, but found the explicit
> completion a lot easier to read and think about.

I agree that handling this with a "fake" media_request_object is
probably not nice solution, but that's an implementation detail anyway.
API-wise, I think it would be best to document the behaviour, and hide
the fact that it's implementated with an extra boolean flag.
media_request_mark_manual_completion() shouldn't mention
manual_completion, and drivers should never touch that field, so the
implementation could be reworked later if needed.

> My only remaining thought, is why do we keep the complicated explicit
> completion in the first place, perhaps because its a lot of work to
> undo ? The request_object still have a purpose, since we still need to
> store data in the request. And it has some benefit, that instead of
> silently never completing, the complete() call will warn if you have
> left over objects at an unexpected point in time.

I'm not following you when you write "keep the complicated explcit
completion". media_request_manual_complete() is the explicit completion,
isn't it ?

> > > In req_queue the driver marks the request for manual completion by
> > > calling media_request_mark_manual_completion, and when the driver
> > > wants to manually complete the request it calls
> > > media_request_manual_complete().
> > > 
> > > Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > > Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > > ---
> > >  drivers/media/mc/mc-request.c | 38 ++++++++++++++++++++++++++++++++++++--
> > >  include/media/media-request.h | 36 +++++++++++++++++++++++++++++++++++-
> > >  2 files changed, 71 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/media/mc/mc-request.c b/drivers/media/mc/mc-request.c
> > > index 5edfc2791ce7c7485def5db675bbf53ee223d837..398d0806d1d274eb8c454fc5c37b77476abe1e74 100644
> > > --- a/drivers/media/mc/mc-request.c
> > > +++ b/drivers/media/mc/mc-request.c
> > > @@ -54,6 +54,7 @@ static void media_request_clean(struct media_request *req)
> > >  	req->access_count = 0;
> > >  	WARN_ON(req->num_incomplete_objects);
> > >  	req->num_incomplete_objects = 0;
> > > +	req->manual_completion = false;
> > >  	wake_up_interruptible_all(&req->poll_wait);
> > >  }
> > >  
> > > @@ -313,6 +314,7 @@ int media_request_alloc(struct media_device *mdev, int *alloc_fd)
> > >  	req->mdev = mdev;
> > >  	req->state = MEDIA_REQUEST_STATE_IDLE;
> > >  	req->num_incomplete_objects = 0;
> > > +	req->manual_completion = false;
> > >  	kref_init(&req->kref);
> > >  	INIT_LIST_HEAD(&req->objects);
> > >  	spin_lock_init(&req->lock);
> > > @@ -459,7 +461,7 @@ void media_request_object_unbind(struct media_request_object *obj)
> > >  
> > >  	req->num_incomplete_objects--;
> > >  	if (req->state == MEDIA_REQUEST_STATE_QUEUED &&
> > > -	    !req->num_incomplete_objects) {
> > > +	    !req->num_incomplete_objects && !req->manual_completion) {
> > >  		req->state = MEDIA_REQUEST_STATE_COMPLETE;
> > >  		completed = true;
> > >  		wake_up_interruptible_all(&req->poll_wait);
> > > @@ -488,7 +490,7 @@ void media_request_object_complete(struct media_request_object *obj)
> > >  	    WARN_ON(req->state != MEDIA_REQUEST_STATE_QUEUED))
> > >  		goto unlock;
> > >  
> > > -	if (!--req->num_incomplete_objects) {
> > > +	if (!--req->num_incomplete_objects && !req->manual_completion) {
> > >  		req->state = MEDIA_REQUEST_STATE_COMPLETE;
> > >  		wake_up_interruptible_all(&req->poll_wait);
> > >  		completed = true;
> > > @@ -499,3 +501,35 @@ void media_request_object_complete(struct media_request_object *obj)
> > >  		media_request_put(req);
> > >  }
> > >  EXPORT_SYMBOL_GPL(media_request_object_complete);
> > > +
> > > +void media_request_manual_complete(struct media_request *req)
> > > +{
> > > +	unsigned long flags;
> > > +	bool completed = false;
> > > +
> > > +	if (WARN_ON(!req))
> > > +		return;
> > > +	if (WARN_ON(!req->manual_completion))
> > > +		return;
> > > +
> > > +	spin_lock_irqsave(&req->lock, flags);
> > > +	if (WARN_ON(req->state != MEDIA_REQUEST_STATE_QUEUED))
> > > +		goto unlock;
> > > +
> > > +	req->manual_completion = false;
> > > +	/*
> > > +	 * It is expected that all other objects in this request are
> > > +	 * completed when this function is called. WARN if that is
> > > +	 * not the case.
> > > +	 */
> > > +	if (!WARN_ON(req->num_incomplete_objects)) {
> > > +		req->state = MEDIA_REQUEST_STATE_COMPLETE;
> > > +		wake_up_interruptible_all(&req->poll_wait);
> > > +		completed = true;
> > > +	}
> > > +unlock:
> > > +	spin_unlock_irqrestore(&req->lock, flags);
> > > +	if (completed)
> > > +		media_request_put(req);
> > > +}
> > > +EXPORT_SYMBOL_GPL(media_request_manual_complete);
> > > diff --git a/include/media/media-request.h b/include/media/media-request.h
> > > index d4ac557678a78372222704400c8c96cf3150b9d9..645d18907be7148ca50dcc9248ff06bd8ccdf953 100644
> > > --- a/include/media/media-request.h
> > > +++ b/include/media/media-request.h
> > > @@ -56,6 +56,10 @@ struct media_request_object;
> > >   * @access_count: count the number of request accesses that are in progress
> > >   * @objects: List of @struct media_request_object request objects
> > >   * @num_incomplete_objects: The number of incomplete objects in the request
> > > + * @manual_completion: if true, then the request won't be marked as completed
> > > + * when @num_incomplete_objects reaches 0. Call media_request_manual_complete()
> > > + * to set this field to false and complete the request
> > 
> > I'd drop "set this field to false and " here.
> > 
> > > + * if @num_incomplete_objects == 0.
> > 
> >  * after @num_incomplete_objects reaches 0.
> > 
> > >   * @poll_wait: Wait queue for poll
> > >   * @lock: Serializes access to this struct
> > >   */
> > > @@ -68,6 +72,7 @@ struct media_request {
> > >  	unsigned int access_count;
> > >  	struct list_head objects;
> > >  	unsigned int num_incomplete_objects;
> > > +	bool manual_completion;
> > >  	wait_queue_head_t poll_wait;
> > >  	spinlock_t lock;
> > >  };
> > > @@ -218,6 +223,35 @@ media_request_get_by_fd(struct media_device *mdev, int request_fd);
> > >  int media_request_alloc(struct media_device *mdev,
> > >  			int *alloc_fd);
> > >  
> > > +/**
> > > + * media_request_mark_manual_completion - Set manual_completion to true
> > > + *
> > > + * @req: The request
> > > + *
> > > + * Mark that the request has to be manually completed by calling
> > > + * media_request_manual_complete().
> > > + *
> > > + * This function should be called in the req_queue callback.
> > 
> > s/should/shall/ unless it's not a hard requirement. Any way to catch
> > incorrect call patterns ?
> > 
> > > + */
> > > +static inline void
> > > +media_request_mark_manual_completion(struct media_request *req)
> > > +{
> > > +	req->manual_completion = true;
> > > +}
> > > +
> > > +/**
> > > + * media_request_manual_complete - Set manual_completion to false
> > 
> > The main purpose of the function is to complete the request, not setting
> > manual_completion to false.
> > 
> > > + *
> > > + * @req: The request
> > > + *
> > > + * Set @manual_completion to false, and if @num_incomplete_objects
> > > + * is 0, then mark the request as completed.
> > > + *
> > > + * If there are still incomplete objects in the request, then
> > > + * WARN for that since that suggests a driver error.
> > 
> > If that's an error then I'd document it more explicitly, as the first
> > sentence makes it sound that both cases are valid. Maybe
> > 
> >  * This function completes a request that was marked for manual completion by an
> >  * earlier call to media_request_mark_manual_completion(). The request's
> >  * @manual_completion flag is reset to false.
> >  *
> >  * All objects contained in the request must have been completed previously. It
> >  * is an error to call this function otherwise. The request will not be
> >  * completed in that case, and the function will WARN.
> > 
> > > + */
> > > +void media_request_manual_complete(struct media_request *req);
> > > +
> > >  #else
> > >  
> > >  static inline void media_request_get(struct media_request *req)
> > > @@ -336,7 +370,7 @@ void media_request_object_init(struct media_request_object *obj);
> > >   * @req: The media request
> > >   * @ops: The object ops for this object
> > >   * @priv: A driver-specific priv pointer associated with this object
> > > - * @is_buffer: Set to true if the object a buffer object.
> > > + * @is_buffer: Set to true if the object is a buffer object.
> > >   * @obj: The object
> > >   *
> > >   * Bind this object to the request and set the ops and priv values of

-- 
Regards,

Laurent Pinchart

