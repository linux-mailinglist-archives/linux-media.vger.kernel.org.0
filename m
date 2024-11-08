Return-Path: <linux-media+bounces-21146-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A17439C1B0E
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 11:49:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EE720B24B16
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 10:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 907481E32A9;
	Fri,  8 Nov 2024 10:49:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3686747F69
	for <linux-media@vger.kernel.org>; Fri,  8 Nov 2024 10:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731062944; cv=none; b=QxxaMiJTv8Np0MB9cqZVRR0YuTeybBs1ut9bfmACMIyNHUPPEA+alFImSFhYwLUARRN2B6BKWegZyLS6pmuS92kV9GGCj9KUAKJuiQlgffxaYtTXRHYpzAreJz6vPWlghW+HddeDpRG10ELns4m3lqM+oDdzOSVp3hXGXMJPrYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731062944; c=relaxed/simple;
	bh=Jpys7tMdJwUX8QskzPeT3j38Wfptg5nPzftdFCnznIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l1HXtbvAtjpVFxuF6jNCktZKBudYGUW5+J/8bf8uBYbSWfclsDJVv9I3oKg5R5qKptv6myLq9fRX5XpGRxiYIPyy7ATtzYe4YQU6eTCvYCNA92GkrP4ZVu/2cS5/B8HL6igZ6WLTGAAy1nWCy5erTNjaYmriUNCmiEubwFLPAak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E488CC4CECD;
	Fri,  8 Nov 2024 10:49:02 +0000 (UTC)
Message-ID: <ee6bcb24-2808-4025-91f2-2da945ce9d9c@xs4all.nl>
Date: Fri, 8 Nov 2024 11:49:01 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2] media: v4l2-core: v4l2-ctrls: check for handler_new_ref
 misuse
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
References: <ddb6e006-7440-41c5-8aaa-685b058418b4@xs4all.nl>
 <Zy3ktRUxfYoylLvB@valkosipuli.retiisi.eu>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <Zy3ktRUxfYoylLvB@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/11/2024 11:15, Sakari Ailus wrote:
> Hi Hans,
> 
> On Tue, Nov 05, 2024 at 08:42:04AM +0100, Hans Verkuil wrote:
>> An out-of-tree driver created a control handler, added controls, then
>> called v4l2_ctrl_add_handler to add references to controls from another
>> handler, and finally added another control that happened to have the same
>> control ID as one of the controls from that other handler.
>>
>> This caused a NULL pointer crash when an attempt was made to use that last
>> control.
>>
>> Besides the fact that two out-of-tree drivers used the same control ID for
>> different (private) controls, which is obviously a bug, this specific
>> scenario should have been caught. The root cause is the 'duplicate ID'
>> check in handler_new_ref(): it expects that drivers will first add all
>> controls to a control handler before calling v4l2_ctrl_add_handler. That
>> way the local controls will always override references to controls from
>> another handler.
> 
> Do we support adding new controls after adding the handler or is there a
> valid use case for it? I'd rather say it's not supported and prevent it,
> for simplicity. Things like this will likely make it more difficult to move
> the controls to the device state.

Blocking this completely is out of scope of this patch. I am not quite sure
if doing that wouldn't break some drivers (in or out of tree).

If this turns out to be an issue when moving controls to the device state,
then we can revisit this.

Regards,

	Hans

> 
> Cc Laurent and Jacopo.
> 
>>
>> It never considered the case where new local controls were added after
>> calling v4l2_ctrl_add_handler. Add a check to handler_new_ref() to return
>> an error in the case that a new local control is added with the same ID as
>> an existing control reference. Also use WARN_ON since this is a driver bug.
>>
>> This situation can only happen when out-of-tree drivers are used or during
>> driver development, since mainlined drivers all have their own control
>> ranges reserved in v4l2-controls.h, thus preventing duplicate control IDs.
>>
>> Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
>> ---
>> Changes since v1:
>> Improved the comment.
>> ---
>>  drivers/media/v4l2-core/v4l2-ctrls-core.c | 34 +++++++++++++++++++----
>>  1 file changed, 28 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
>> index eeab6a5eb7ba..8fac12e78481 100644
>> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
>> @@ -1676,6 +1676,7 @@ int handler_new_ref(struct v4l2_ctrl_handler *hdl,
>>  	u32 class_ctrl = V4L2_CTRL_ID2WHICH(id) | 1;
>>  	int bucket = id % hdl->nr_of_buckets;	/* which bucket to use */
>>  	unsigned int size_extra_req = 0;
>> +	int ret = 0;
>>
>>  	if (ctrl_ref)
>>  		*ctrl_ref = NULL;
>> @@ -1719,13 +1720,32 @@ int handler_new_ref(struct v4l2_ctrl_handler *hdl,
>>  	list_for_each_entry(ref, &hdl->ctrl_refs, node) {
>>  		if (ref->ctrl->id < id)
>>  			continue;
>> -		/* Don't add duplicates */
>> -		if (ref->ctrl->id == id) {
>> -			kfree(new_ref);
>> -			goto unlock;
>> +		/* Check we're not adding a duplicate */
>> +		if (ref->ctrl->id != id) {
>> +			list_add(&new_ref->node, ref->node.prev);
>> +			break;
>>  		}
>> -		list_add(&new_ref->node, ref->node.prev);
>> -		break;
>> +
>> +		/*
>> +		 * If we add a new control to this control handler, and we find
>> +		 * that it is a duplicate, then that is a driver bug. Warn and
>> +		 * return an error.
>> +		 *
>> +		 * It can be caused by either adding the same control twice, or
>> +		 * by first calling v4l2_ctrl_add_handler, and then adding a new
>> +		 * control to this control handler.
>> +		 *
>> +		 * Either sequence is incorrect.
>> +		 *
>> +		 * However, if the control is owned by another handler, and
>> +		 * a control with that ID already exists in the list, then we
>> +		 * can safely skip it: in that case it the control is overridden
>> +		 * by the existing control.
>> +		 */
>> +		if (WARN_ON(hdl == ctrl->handler))
>> +			ret = -EEXIST;
>> +		kfree(new_ref);
>> +		goto unlock;
>>  	}
>>
>>  insert_in_hash:
>> @@ -1746,6 +1766,8 @@ int handler_new_ref(struct v4l2_ctrl_handler *hdl,
>>
>>  unlock:
>>  	mutex_unlock(hdl->lock);
>> +	if (ret)
>> +		return handler_set_err(hdl, ret);
>>  	return 0;
>>  }
>>
> 


