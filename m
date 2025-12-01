Return-Path: <linux-media+bounces-47933-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 094F5C96B08
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 11:39:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1E11F341C8B
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 10:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CC4D302CC4;
	Mon,  1 Dec 2025 10:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GNh+5vzg"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CB7296BD8;
	Mon,  1 Dec 2025 10:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764585542; cv=none; b=aSL7HQNtQPDxxt5QtElH6PcaLL+6u76jJFfp2Qlj4mhoJySDAgKt5v0ZlHlPt4LMvporNfR2INKvjasV/n6+5C30aIB+/pqTkqoVq/7y44aUt+4pmu3sHam1k36L5+u+MKFtq0WLYMe1PL1psQG8ZoNDCe76k7W0zdqdige8M1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764585542; c=relaxed/simple;
	bh=7otL5ZpSjHqKVAsGUZwGGCooAKXLD8oQRR5TSq1M7g0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=pqUUKLZT9kvHSrajtzTVi+5VuMZz1Rz9VP6Cxv82cjKoZbHwXbVIKuNozSVO/gEMrqtzfqspdHZK4QXeRqmO6KXhrOPo3E41HTRVhN8dWVX+P1FzpKinNxjXzp5DnvjJjPzMBV/QjSKUaK4nVIiM/rRrNkIzp6naYDNZEF+fGhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GNh+5vzg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C41D4C4CEF1;
	Mon,  1 Dec 2025 10:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764585541;
	bh=7otL5ZpSjHqKVAsGUZwGGCooAKXLD8oQRR5TSq1M7g0=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=GNh+5vzg472/kaEpWox0DRBdneMiT3C2i8SgfXRGwMw3DD2KHUHEX2z8498ySfcDp
	 W418/y6q7dHvLL5B/IlTdldGOrVCvZoNhFWGd7Y1RAo3ngAORaGqw8wVRSZu8o5bS1
	 oPuYcK5H4mP9AZlziA+Nhd55DBHkZFx/ISJBqZcudW/ypsRUiNgRSMLIX7oCPI+qK8
	 6ugzS31Es6VgXhhNJSKPyoBNUzYMsrELG+6KD5AYgR9PO2FBGoy9kwKmV1/11Ty3ka
	 XMgu0sUb5R/VC2e5Qe9hGiQqkZCAgE4JJek365j8gBB7L3DbOIDO2OaOnZeNeia0k3
	 ZenPh0/xUb0fg==
Message-ID: <fcfe2672-b546-4f3f-8418-71ee8ce1fb5d@kernel.org>
Date: Mon, 1 Dec 2025 11:38:56 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v4 1/5] media: mc: add manual request completion
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com,
 linux-media@vger.kernel.org,
 Sebastian Fricke <sebastian.fricke@collabora.com>
References: <20251128-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v4-0-c166bdd4625c@collabora.com>
 <20251128-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v4-1-c166bdd4625c@collabora.com>
Content-Language: en-US, nl
In-Reply-To: <20251128-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v4-1-c166bdd4625c@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Nicolas,

On 28/11/2025 20:16, Nicolas Dufresne wrote:
> From: Hans Verkuil <hverkuil@kernel.org>
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

For this patch and the other patches with this xs4all SoB, can you replace it with:

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>

Much appreciated,

	Hans

> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
>  drivers/media/mc/mc-request.c | 41 +++++++++++++++++++++++++++++++++++++++--
>  include/media/media-request.h | 38 +++++++++++++++++++++++++++++++++++++-
>  2 files changed, 76 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/mc/mc-request.c b/drivers/media/mc/mc-request.c
> index f66f728b1b43dcd1cf51de46e828bf806f014f8d..512e6969152792558537dd8a0736df82847ae210 100644
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
> @@ -499,3 +501,38 @@ void media_request_object_complete(struct media_request_object *obj)
>  		media_request_put(req);
>  }
>  EXPORT_SYMBOL_GPL(media_request_object_complete);
> +
> +void media_request_manual_complete(struct media_request *req)
> +{
> +	bool completed = false;
> +	unsigned long flags;
> +
> +	if (WARN_ON_ONCE(!req))
> +		return;
> +
> +	spin_lock_irqsave(&req->lock, flags);
> +
> +	if (WARN_ON_ONCE(!req->manual_completion))
> +		goto unlock;
> +
> +	if (WARN_ON_ONCE(req->state != MEDIA_REQUEST_STATE_QUEUED))
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
> +
> +unlock:
> +	spin_unlock_irqrestore(&req->lock, flags);
> +	if (completed)
> +		media_request_put(req);
> +}
> +EXPORT_SYMBOL_GPL(media_request_manual_complete);
> diff --git a/include/media/media-request.h b/include/media/media-request.h
> index bb500b2f9da46f5a9a84272759a137720b094a80..3256fcf3709da58878a59d90722bee3224d97af6 100644
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
> + * @manual_completion field is reset to false.
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


