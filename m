Return-Path: <linux-media+bounces-34077-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16333ACE5F4
	for <lists+linux-media@lfdr.de>; Wed,  4 Jun 2025 23:04:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5E841737F9
	for <lists+linux-media@lfdr.de>; Wed,  4 Jun 2025 21:04:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7C581FECBD;
	Wed,  4 Jun 2025 21:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h1mFWi87"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0788111BF;
	Wed,  4 Jun 2025 21:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749071088; cv=none; b=Gmav+1LU30zUNrmc9VmPbRP+ZwP+u+HkacYkh9QpZhBsT24z/o5AM0bfSc67e/IPis6sIFiMj5u4RAket21yxANDKnLygm1U56gxLuAe3WVq6lQEb/YPbMjDbipQRA3FJGQ1eVQUlYSvsjThq0YxcusV7reBH4FY8fkDYwjqcL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749071088; c=relaxed/simple;
	bh=Ax0LaVdVrMdodaXbxHS1uMp0e5JdIRTqR6F8VUnG4bM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hDZWp6vLA6CiiKsD+sfyEBwI4cuqlc4JleaVzCtPV0nXOo9j5p8VSgBkHNQKWqm5hJ5cXlMDt/IZz/3nKekiAMprRVtanL0Wi/LJjPBllFbZjbyqZjeROio4xMo6cm+CCpfATjUZfxRBD9XQ09PWxR31d1ZsAQvyMM4omgSzPwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h1mFWi87; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749071087; x=1780607087;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ax0LaVdVrMdodaXbxHS1uMp0e5JdIRTqR6F8VUnG4bM=;
  b=h1mFWi87s18vOb4PIqCEjWpfYxdD1hnRHOAFH8PZ5e5vus0Wekp2oJQr
   xaydTSfXv8Wbc3nZ0MaqIJBRLymzrrVgLTB2/knrdxlUD3guLrCP2DYxa
   C1VAY9eajzW49Ee6M1y1vY6n78NYdFcf3Y9kDXSACl0R09ZAfMLYoZDgD
   Uc52ymrO5zDBfxfJNJ4WVqV2rmQxcfIKGy/ToGhx2b09dJzGWbDhmr8a4
   KgfqToHpsEUVu5RC3Uc+KUHWzNPckxcrYDjGt1eGXcKbVVW9pnx8i/v/B
   G768VWYobL9BtMKcHn7IYKRQ+vm5+MApQlkto+/8p6uwoH3FiG6QhzBeo
   g==;
X-CSE-ConnectionGUID: G5gngbptS8eRN0WW/Ls5iQ==
X-CSE-MsgGUID: LxFS1ORZRSmvyBP3TOU8tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="54971356"
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; 
   d="scan'208";a="54971356"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 14:04:46 -0700
X-CSE-ConnectionGUID: 9nD5U/QeTjKVSwVuA2BoHA==
X-CSE-MsgGUID: o9yLbTW1Tli1Atn+6utNZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; 
   d="scan'208";a="150458314"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.208])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 14:04:42 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5809A11F83C;
	Thu,  5 Jun 2025 00:04:39 +0300 (EEST)
Date: Wed, 4 Jun 2025 21:04:39 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
Subject: Re: [PATCH v3 1/5] media: mc: add manual request completion
Message-ID: <aEC05991kEIIifDB@kekkonen.localdomain>
References: <20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-0-603db4749d90@collabora.com>
 <20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-1-603db4749d90@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-1-603db4749d90@collabora.com>

Hi Nicolas,

Thanks for the update.

On Wed, Jun 04, 2025 at 04:09:35PM -0400, Nicolas Dufresne wrote:
> From: Hans Verkuil <hverkuil@xs4all.nl>
> 
> By default when the last request object is completed, the whole
> request completes as well.
> 
> But sometimes you want to delay this completion to an arbitrary point in
> time so add a manual complete mode for this.
> 
> In req_queue the driver marks the request for manual completion by
> calling media_request_mark_manual_completion, and when the driver
> wants to manually complete the request it calls
> media_request_manual_complete().
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
>  drivers/media/mc/mc-request.c | 38 ++++++++++++++++++++++++++++++++++++--
>  include/media/media-request.h | 38 +++++++++++++++++++++++++++++++++++++-
>  2 files changed, 73 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/mc/mc-request.c b/drivers/media/mc/mc-request.c
> index 5edfc2791ce7c7485def5db675bbf53ee223d837..398d0806d1d274eb8c454fc5c37b77476abe1e74 100644
> --- a/drivers/media/mc/mc-request.c
> +++ b/drivers/media/mc/mc-request.c
> @@ -54,6 +54,7 @@ static void media_request_clean(struct media_request *req)
>  	req->access_count = 0;
>  	WARN_ON(req->num_incomplete_objects);
>  	req->num_incomplete_objects = 0;
> +	req->manual_completion = false;
>  	wake_up_interruptible_all(&req->poll_wait);
>  }
>  
> @@ -313,6 +314,7 @@ int media_request_alloc(struct media_device *mdev, int *alloc_fd)
>  	req->mdev = mdev;
>  	req->state = MEDIA_REQUEST_STATE_IDLE;
>  	req->num_incomplete_objects = 0;
> +	req->manual_completion = false;
>  	kref_init(&req->kref);
>  	INIT_LIST_HEAD(&req->objects);
>  	spin_lock_init(&req->lock);
> @@ -459,7 +461,7 @@ void media_request_object_unbind(struct media_request_object *obj)
>  
>  	req->num_incomplete_objects--;
>  	if (req->state == MEDIA_REQUEST_STATE_QUEUED &&
> -	    !req->num_incomplete_objects) {
> +	    !req->num_incomplete_objects && !req->manual_completion) {
>  		req->state = MEDIA_REQUEST_STATE_COMPLETE;
>  		completed = true;
>  		wake_up_interruptible_all(&req->poll_wait);
> @@ -488,7 +490,7 @@ void media_request_object_complete(struct media_request_object *obj)
>  	    WARN_ON(req->state != MEDIA_REQUEST_STATE_QUEUED))
>  		goto unlock;
>  
> -	if (!--req->num_incomplete_objects) {
> +	if (!--req->num_incomplete_objects && !req->manual_completion) {
>  		req->state = MEDIA_REQUEST_STATE_COMPLETE;
>  		wake_up_interruptible_all(&req->poll_wait);
>  		completed = true;
> @@ -499,3 +501,35 @@ void media_request_object_complete(struct media_request_object *obj)
>  		media_request_put(req);
>  }
>  EXPORT_SYMBOL_GPL(media_request_object_complete);
> +
> +void media_request_manual_complete(struct media_request *req)
> +{
> +	unsigned long flags;

I'd declare flags as last.

> +	bool completed = false;
> +
> +	if (WARN_ON(!req))
> +		return;
> +	if (WARN_ON(!req->manual_completion))
> +		return;

I think I'd use WARN_ON_ONCE() consistently: this is a driver (or
framework) bug and telling once about it is very probably enough.

> +
> +	spin_lock_irqsave(&req->lock, flags);
> +	if (WARN_ON(req->state != MEDIA_REQUEST_STATE_QUEUED))
> +		goto unlock;
> +
> +	req->manual_completion = false;
> +	/*
> +	 * It is expected that all other objects in this request are
> +	 * completed when this function is called. WARN if that is
> +	 * not the case.
> +	 */
> +	if (!WARN_ON(req->num_incomplete_objects)) {
> +		req->state = MEDIA_REQUEST_STATE_COMPLETE;
> +		wake_up_interruptible_all(&req->poll_wait);
> +		completed = true;
> +	}

A newline would be nice here.

> +unlock:
> +	spin_unlock_irqrestore(&req->lock, flags);
> +	if (completed)
> +		media_request_put(req);
> +}
> +EXPORT_SYMBOL_GPL(media_request_manual_complete);
> diff --git a/include/media/media-request.h b/include/media/media-request.h
> index d4ac557678a78372222704400c8c96cf3150b9d9..7f9af68ef19ac6de0184bbb0c0827dc59777c6dc 100644
> --- a/include/media/media-request.h
> +++ b/include/media/media-request.h
> @@ -56,6 +56,9 @@ struct media_request_object;
>   * @access_count: count the number of request accesses that are in progress
>   * @objects: List of @struct media_request_object request objects
>   * @num_incomplete_objects: The number of incomplete objects in the request
> + * @manual_completion: if true, then the request won't be marked as completed
> + * when @num_incomplete_objects reaches 0. Call media_request_manual_complete()
> + * to complete the request after @num_incomplete_objects == 0.
>   * @poll_wait: Wait queue for poll
>   * @lock: Serializes access to this struct
>   */
> @@ -68,6 +71,7 @@ struct media_request {
>  	unsigned int access_count;
>  	struct list_head objects;
>  	unsigned int num_incomplete_objects;
> +	bool manual_completion;
>  	wait_queue_head_t poll_wait;
>  	spinlock_t lock;
>  };
> @@ -218,6 +222,38 @@ media_request_get_by_fd(struct media_device *mdev, int request_fd);
>  int media_request_alloc(struct media_device *mdev,
>  			int *alloc_fd);
>  
> +/**
> + * media_request_mark_manual_completion - Enable manual completion
> + *
> + * @req: The request
> + *
> + * Mark that the request has to be manually completed by calling
> + * media_request_manual_complete().
> + *
> + * This function shall be called in the req_queue callback.
> + */
> +static inline void
> +media_request_mark_manual_completion(struct media_request *req)
> +{
> +	req->manual_completion = true;
> +}
> +
> +/**
> + * media_request_manual_complete - Mark the request as completed
> + *
> + * @req: The request
> + *
> + * This function completes a request that was marked for manual completion by an
> + * earlier call to media_request_mark_manual_completion(). The request's
> + * @manual_completion flag is reset to false.

s/flag/field/

> + *
> + * All objects contained in the request must have been completed previously. It
> + * is an error to call this function otherwise. If such an error occurred, the
> + * function will WARN and the object completion will be delayed until
> + * @num_incomplete_objects is 0.
> + */
> +void media_request_manual_complete(struct media_request *req);
> +
>  #else
>  
>  static inline void media_request_get(struct media_request *req)
> @@ -336,7 +372,7 @@ void media_request_object_init(struct media_request_object *obj);
>   * @req: The media request
>   * @ops: The object ops for this object
>   * @priv: A driver-specific priv pointer associated with this object
> - * @is_buffer: Set to true if the object a buffer object.
> + * @is_buffer: Set to true if the object is a buffer object.
>   * @obj: The object
>   *
>   * Bind this object to the request and set the ops and priv values of
> 

-- 
Regards,

Sakari Ailus

