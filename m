Return-Path: <linux-media+bounces-21164-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 930B99C1F7D
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 15:38:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D61A28206D
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 14:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21BDC1F4295;
	Fri,  8 Nov 2024 14:38:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6A0197A82
	for <linux-media@vger.kernel.org>; Fri,  8 Nov 2024 14:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731076710; cv=none; b=KrRpuP3jyR2quUMcH4y3ynjTqnT5Mx2ulDsHrmSx7B4bQgBAXclwcf+ARrUNQSKqTEdi2XFdVWDr46uau0nEXAKBkLF4V2ac6BsnRpRScoJ8Mgd3iQ3XqU7pMNKG9AhLJ6Vt1mWfnwgcWTxWpfc6EbOsVGu+ZoX6DoYuQuXgQh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731076710; c=relaxed/simple;
	bh=yuHeKM6CQrVR/mO7tB8yRhiOE3Qjn638bX70piufhtM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EtFFxuh4wgCaRMWJfS0LYFnxcvxNtBCKn/OgQdyH9THShCZ1w1WT4bhWK5y876UwnhSYqlwgnrPwUdpV6PWB1zVYgrQiBVojw6ERBh6xYyqVjY1dvIdjIazV6yKa+tfA0MLPauDSZKKIza75XyIIozAlsLbU8evkucAdVGWaKmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67C7DC4CECD;
	Fri,  8 Nov 2024 14:38:29 +0000 (UTC)
Message-ID: <7e2f9660-6ee7-4fa5-b949-77725feb25a9@xs4all.nl>
Date: Fri, 8 Nov 2024 15:38:27 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2] media: v4l2-core: v4l2-ctrls: check for handler_new_ref
 misuse
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
References: <ddb6e006-7440-41c5-8aaa-685b058418b4@xs4all.nl>
 <Zy3ktRUxfYoylLvB@valkosipuli.retiisi.eu>
 <ee6bcb24-2808-4025-91f2-2da945ce9d9c@xs4all.nl>
 <20241108132820.GB31396@pendragon.ideasonboard.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20241108132820.GB31396@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Laurent,

On 08/11/2024 14:28, Laurent Pinchart wrote:
> Hello,
> 
> On Fri, Nov 08, 2024 at 11:49:01AM +0100, Hans Verkuil wrote:
>> On 08/11/2024 11:15, Sakari Ailus wrote:
>>> On Tue, Nov 05, 2024 at 08:42:04AM +0100, Hans Verkuil wrote:
>>>> An out-of-tree driver created a control handler, added controls, then
>>>> called v4l2_ctrl_add_handler to add references to controls from another
>>>> handler, and finally added another control that happened to have the same
>>>> control ID as one of the controls from that other handler.
> 
> Naughty driver :-)
> 
>>>>
>>>> This caused a NULL pointer crash when an attempt was made to use that last
>>>> control.
>>>>
>>>> Besides the fact that two out-of-tree drivers used the same control ID for
>>>> different (private) controls, which is obviously a bug, this specific
>>>> scenario should have been caught. The root cause is the 'duplicate ID'
>>>> check in handler_new_ref(): it expects that drivers will first add all
>>>> controls to a control handler before calling v4l2_ctrl_add_handler. That
>>>> way the local controls will always override references to controls from
>>>> another handler.
>>>
>>> Do we support adding new controls after adding the handler or is there a
>>> valid use case for it? I'd rather say it's not supported and prevent it,
>>> for simplicity. Things like this will likely make it more difficult to move
>>> the controls to the device state.
>>
>> Blocking this completely is out of scope of this patch. I am not quite sure
>> if doing that wouldn't break some drivers (in or out of tree).
>>
>> If this turns out to be an issue when moving controls to the device state,
>> then we can revisit this.
> 
> I tend to agree with Sakari here. I believe the control framework is
> already complex enough, and I don't think we should allow drivers to add
> cnotrols after calling v4l2_ctrl_add_handler(). If there are any in-tree
> drivers doing so, we can probably fix them fairly easily.
> 
> As for generating a warning instead of crashing when the control is
> accessed, we could generate a warning if a control is added by the
> driver after calling v4l2_ctrl_add_handler(). That could even cause the
> control handler to flag an error, and that would be very visible to
> driver authors.

While I agree with this, I don't want to do this without first doing
some analysis for existing drivers.

Would you be OK with me merging this patch, and that I do the analysis later
and post a follow-up patch?

This issue causes a somewhat hard-to-find crash and it hit me twice
within a week.

Regards,

	Hans

> 
>>> Cc Laurent and Jacopo.
>>>
>>>> It never considered the case where new local controls were added after
>>>> calling v4l2_ctrl_add_handler. Add a check to handler_new_ref() to return
>>>> an error in the case that a new local control is added with the same ID as
>>>> an existing control reference. Also use WARN_ON since this is a driver bug.
>>>>
>>>> This situation can only happen when out-of-tree drivers are used or during
>>>> driver development, since mainlined drivers all have their own control
>>>> ranges reserved in v4l2-controls.h, thus preventing duplicate control IDs.
>>>>
>>>> Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
>>>> ---
>>>> Changes since v1:
>>>> Improved the comment.
>>>> ---
>>>>  drivers/media/v4l2-core/v4l2-ctrls-core.c | 34 +++++++++++++++++++----
>>>>  1 file changed, 28 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
>>>> index eeab6a5eb7ba..8fac12e78481 100644
>>>> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
>>>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
>>>> @@ -1676,6 +1676,7 @@ int handler_new_ref(struct v4l2_ctrl_handler *hdl,
>>>>  	u32 class_ctrl = V4L2_CTRL_ID2WHICH(id) | 1;
>>>>  	int bucket = id % hdl->nr_of_buckets;	/* which bucket to use */
>>>>  	unsigned int size_extra_req = 0;
>>>> +	int ret = 0;
>>>>
>>>>  	if (ctrl_ref)
>>>>  		*ctrl_ref = NULL;
>>>> @@ -1719,13 +1720,32 @@ int handler_new_ref(struct v4l2_ctrl_handler *hdl,
>>>>  	list_for_each_entry(ref, &hdl->ctrl_refs, node) {
>>>>  		if (ref->ctrl->id < id)
>>>>  			continue;
>>>> -		/* Don't add duplicates */
>>>> -		if (ref->ctrl->id == id) {
>>>> -			kfree(new_ref);
>>>> -			goto unlock;
>>>> +		/* Check we're not adding a duplicate */
>>>> +		if (ref->ctrl->id != id) {
>>>> +			list_add(&new_ref->node, ref->node.prev);
>>>> +			break;
>>>>  		}
>>>> -		list_add(&new_ref->node, ref->node.prev);
>>>> -		break;
>>>> +
>>>> +		/*
>>>> +		 * If we add a new control to this control handler, and we find
>>>> +		 * that it is a duplicate, then that is a driver bug. Warn and
>>>> +		 * return an error.
>>>> +		 *
>>>> +		 * It can be caused by either adding the same control twice, or
>>>> +		 * by first calling v4l2_ctrl_add_handler, and then adding a new
>>>> +		 * control to this control handler.
>>>> +		 *
>>>> +		 * Either sequence is incorrect.
>>>> +		 *
>>>> +		 * However, if the control is owned by another handler, and
>>>> +		 * a control with that ID already exists in the list, then we
>>>> +		 * can safely skip it: in that case it the control is overridden
>>>> +		 * by the existing control.
>>>> +		 */
>>>> +		if (WARN_ON(hdl == ctrl->handler))
>>>> +			ret = -EEXIST;
>>>> +		kfree(new_ref);
>>>> +		goto unlock;
>>>>  	}
>>>>
>>>>  insert_in_hash:
>>>> @@ -1746,6 +1766,8 @@ int handler_new_ref(struct v4l2_ctrl_handler *hdl,
>>>>
>>>>  unlock:
>>>>  	mutex_unlock(hdl->lock);
>>>> +	if (ret)
>>>> +		return handler_set_err(hdl, ret);
>>>>  	return 0;
>>>>  }
>>>>
> 


