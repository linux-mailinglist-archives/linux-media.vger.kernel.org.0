Return-Path: <linux-media+bounces-29999-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BA80EA85429
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 08:31:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0481F4A451E
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 06:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A89FD27CCEA;
	Fri, 11 Apr 2025 06:31:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9C81EA7C6;
	Fri, 11 Apr 2025 06:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744353067; cv=none; b=rth7KgTsX+i8fv4D889chFzCByYUxxxIWlEFq/hPBylyDXTrfswGdQG94VolBimHK/E7d29NoDw7kBhm2efwlP7voVWHZGwmQUQ0/Q985GpHA4KUjnFIXe4nXI+KJ4OAaugfyKeFHWlS8ezvbXHfX6LE93AAZIOpQKKAJY+9+I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744353067; c=relaxed/simple;
	bh=YDbjwQDJ6rZqk6LDKJQGg2hDkx1p66ZxgwlvbVINwbc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E/W9DOvpNGe5ddK/OxwVT5JTZgRVYvpo9n4XeZrU13IPDQz0NNlVcmyFLQVsgAsaQ+Iu2aoHQSxDp1Ok2qkDLqg69XvV3jMsDqwaPiy6aVSDK47qs7J67sXJOtTDaCSQTOgdu4DzEAUhx7U3XpUBRPfnwYmbRFU+Xv3r9SxJOlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FE51C4CEE5;
	Fri, 11 Apr 2025 06:31:03 +0000 (UTC)
Message-ID: <95cc14a7-bfcb-446b-869c-1a14edf01032@xs4all.nl>
Date: Fri, 11 Apr 2025 08:31:01 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] media: mc: add manual request completion
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com,
 linux-media@vger.kernel.org,
 Sebastian Fricke <sebastian.fricke@collabora.com>
References: <20250410-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v2-0-5b99ec0450e6@collabora.com>
 <20250410-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v2-1-5b99ec0450e6@collabora.com>
 <20250410175010.GF27870@pendragon.ideasonboard.com>
 <bb1f8d1581169bdf2e04be67883ee3ae03488680.camel@collabora.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <bb1f8d1581169bdf2e04be67883ee3ae03488680.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/04/2025 22:31, Nicolas Dufresne wrote:
> Replying on the code comment, sorry for missing some bit earlier ...
> 
> Le jeudi 10 avril 2025 à 20:50 +0300, Laurent Pinchart a écrit :
>> Hi Nicolas,
>>
>> Thank you for the patch.
>>
>> On Thu, Apr 10, 2025 at 11:39:56AM -0400, Nicolas Dufresne wrote:
>>> From: Hans Verkuil <hverkuil@xs4all.nl>
>>>
>>> By default when the last request object is completed, the whole
>>> request completes as well.
>>>
>>> But sometimes you want to manually complete a request in a driver,
>>> so add a manual complete mode for this.
>>
>> I didn't immediately understand this was about delaying completion of
>> the request. It would be nice to make that more explicit in the commit
>> message and in the documentation of
>> media_request_mark_manual_completion(). A sample use case would also
>> help.
>>
>>> In req_queue the driver marks the request for manual completion by
>>> calling media_request_mark_manual_completion, and when the driver
>>> wants to manually complete the request it calls
>>> media_request_manual_complete().
>>>
>>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>>> ---
>>>  drivers/media/mc/mc-request.c | 38 ++++++++++++++++++++++++++++++++++++--
>>>  include/media/media-request.h | 36 +++++++++++++++++++++++++++++++++++-
>>>  2 files changed, 71 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/media/mc/mc-request.c b/drivers/media/mc/mc-request.c
>>> index 5edfc2791ce7c7485def5db675bbf53ee223d837..398d0806d1d274eb8c454fc5c37b77476abe1e74 100644
>>> --- a/drivers/media/mc/mc-request.c
>>> +++ b/drivers/media/mc/mc-request.c
>>> @@ -54,6 +54,7 @@ static void media_request_clean(struct media_request *req)
>>>  	req->access_count = 0;
>>>  	WARN_ON(req->num_incomplete_objects);
>>>  	req->num_incomplete_objects = 0;
>>> +	req->manual_completion = false;
>>>  	wake_up_interruptible_all(&req->poll_wait);
>>>  }
>>>  
>>> @@ -313,6 +314,7 @@ int media_request_alloc(struct media_device *mdev, int *alloc_fd)
>>>  	req->mdev = mdev;
>>>  	req->state = MEDIA_REQUEST_STATE_IDLE;
>>>  	req->num_incomplete_objects = 0;
>>> +	req->manual_completion = false;
>>>  	kref_init(&req->kref);
>>>  	INIT_LIST_HEAD(&req->objects);
>>>  	spin_lock_init(&req->lock);
>>> @@ -459,7 +461,7 @@ void media_request_object_unbind(struct media_request_object *obj)
>>>  
>>>  	req->num_incomplete_objects--;
>>>  	if (req->state == MEDIA_REQUEST_STATE_QUEUED &&
>>> -	    !req->num_incomplete_objects) {
>>> +	    !req->num_incomplete_objects && !req->manual_completion) {
>>>  		req->state = MEDIA_REQUEST_STATE_COMPLETE;
>>>  		completed = true;
>>>  		wake_up_interruptible_all(&req->poll_wait);
>>> @@ -488,7 +490,7 @@ void media_request_object_complete(struct media_request_object *obj)
>>>  	    WARN_ON(req->state != MEDIA_REQUEST_STATE_QUEUED))
>>>  		goto unlock;
>>>  
>>> -	if (!--req->num_incomplete_objects) {
>>> +	if (!--req->num_incomplete_objects && !req->manual_completion) {
>>>  		req->state = MEDIA_REQUEST_STATE_COMPLETE;
>>>  		wake_up_interruptible_all(&req->poll_wait);
>>>  		completed = true;
>>> @@ -499,3 +501,35 @@ void media_request_object_complete(struct media_request_object *obj)
>>>  		media_request_put(req);
>>>  }
>>>  EXPORT_SYMBOL_GPL(media_request_object_complete);
>>> +
>>> +void media_request_manual_complete(struct media_request *req)
>>> +{
>>> +	unsigned long flags;
>>> +	bool completed = false;
>>> +
>>> +	if (WARN_ON(!req))
>>> +		return;
>>> +	if (WARN_ON(!req->manual_completion))
>>> +		return;
>>> +
>>> +	spin_lock_irqsave(&req->lock, flags);
>>> +	if (WARN_ON(req->state != MEDIA_REQUEST_STATE_QUEUED))
>>> +		goto unlock;
>>> +
>>> +	req->manual_completion = false;
>>> +	/*
>>> +	 * It is expected that all other objects in this request are
>>> +	 * completed when this function is called. WARN if that is
>>> +	 * not the case.
>>> +	 */
>>> +	if (!WARN_ON(req->num_incomplete_objects)) {
>>> +		req->state = MEDIA_REQUEST_STATE_COMPLETE;
>>> +		wake_up_interruptible_all(&req->poll_wait);
>>> +		completed = true;
>>> +	}
>>> +unlock:
>>> +	spin_unlock_irqrestore(&req->lock, flags);
>>> +	if (completed)
>>> +		media_request_put(req);
>>> +}
>>> +EXPORT_SYMBOL_GPL(media_request_manual_complete);
>>> diff --git a/include/media/media-request.h b/include/media/media-request.h
>>> index d4ac557678a78372222704400c8c96cf3150b9d9..645d18907be7148ca50dcc9248ff06bd8ccdf953 100644
>>> --- a/include/media/media-request.h
>>> +++ b/include/media/media-request.h
>>> @@ -56,6 +56,10 @@ struct media_request_object;
>>>   * @access_count: count the number of request accesses that are in progress
>>>   * @objects: List of @struct media_request_object request objects
>>>   * @num_incomplete_objects: The number of incomplete objects in the request
>>> + * @manual_completion: if true, then the request won't be marked as completed
>>> + * when @num_incomplete_objects reaches 0. Call media_request_manual_complete()
>>> + * to set this field to false and complete the request
>>
>> I'd drop "set this field to false and " here.
> 
> I agree, it sounds like an invitation to write it directly, we don't
> really want this. If Hans is fine I'll drop it.

Yes, that's better. Just drop that part.

> 
>>
>>> + * if @num_incomplete_objects == 0.
>>
>>  * after @num_incomplete_objects reaches 0.
>>
>>>   * @poll_wait: Wait queue for poll
>>>   * @lock: Serializes access to this struct
>>>   */
>>> @@ -68,6 +72,7 @@ struct media_request {
>>>  	unsigned int access_count;
>>>  	struct list_head objects;
>>>  	unsigned int num_incomplete_objects;
>>> +	bool manual_completion;
>>>  	wait_queue_head_t poll_wait;
>>>  	spinlock_t lock;
>>>  };
>>> @@ -218,6 +223,35 @@ media_request_get_by_fd(struct media_device *mdev, int request_fd);
>>>  int media_request_alloc(struct media_device *mdev,
>>>  			int *alloc_fd);
>>>  
>>> +/**
>>> + * media_request_mark_manual_completion - Set manual_completion to true
>>> + *
>>> + * @req: The request
>>> + *
>>> + * Mark that the request has to be manually completed by calling
>>> + * media_request_manual_complete().
>>> + *
>>> + * This function should be called in the req_queue callback.
>>
>> s/should/shall/ unless it's not a hard requirement. Any way to catch
>> incorrect call patterns ?
> 
> I think we should be more strict, I can edit to shall.

Yes, that should be 'shall'.

> 
> About ways to check, perhaps I can add a lockdep_assert_held() on the
> mdev->req_queue_mutex along with checking that the state is QUEUED. The
> state check would catch trying to do so in req_validate().

A WARN_ON doesn't hurt.

> 
>>
>>> + */
>>> +static inline void
>>> +media_request_mark_manual_completion(struct media_request *req)
>>> +{
>>> +	req->manual_completion = true;
>>> +}
>>> +
>>> +/**
>>> + * media_request_manual_complete - Set manual_completion to false
>>
>> The main purpose of the function is to complete the request, not setting
>> manual_completion to false.
> 
> Indeed, that's documenting an implementation detail.

Change to: "Enable manual completion"

> 
>>
>>> + *
>>> + * @req: The request
>>> + *
>>> + * Set @manual_completion to false, and if @num_incomplete_objects
>>> + * is 0, then mark the request as completed.
>>> + *
>>> + * If there are still incomplete objects in the request, then
>>> + * WARN for that since that suggests a driver error.
>>
>> If that's an error then I'd document it more explicitly, as the first
>> sentence makes it sound that both cases are valid. Maybe
> 
> Its a programming error, I should rephrase this in the next version.

suggests -> is

> 
>>
>>  * This function completes a request that was marked for manual completion by an
>>  * earlier call to media_request_mark_manual_completion(). The request's
>>  * @manual_completion flag is reset to false.
>>  *
>>  * All objects contained in the request must have been completed previously. It
>>  * is an error to call this function otherwise. The request will not be
>>  * completed in that case, and the function will WARN.
>>
>>> + */
>>> +void media_request_manual_complete(struct media_request *req);
>>> +
>>>  #else
>>>  
>>>  static inline void media_request_get(struct media_request *req)
>>> @@ -336,7 +370,7 @@ void media_request_object_init(struct media_request_object *obj);
>>>   * @req: The media request
>>>   * @ops: The object ops for this object
>>>   * @priv: A driver-specific priv pointer associated with this object
>>> - * @is_buffer: Set to true if the object a buffer object.
>>> + * @is_buffer: Set to true if the object is a buffer object.
>>>   * @obj: The object
>>>   *
>>>   * Bind this object to the request and set the ops and priv values of
> 
> thanks a lot for the review,
> 

Regards,

	Hans

