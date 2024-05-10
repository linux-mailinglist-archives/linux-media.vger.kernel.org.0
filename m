Return-Path: <linux-media+bounces-11302-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDC48C200E
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 10:51:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FC951C20E48
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 08:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95F2015ECD0;
	Fri, 10 May 2024 08:51:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C5613C827
	for <linux-media@vger.kernel.org>; Fri, 10 May 2024 08:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715331081; cv=none; b=VV7VuwH8w6JySawxmvgmAtsTUtdDzf29VyH39Ej6W/8ZR5gZAu5FEF15+74/A9IlfQsMPE4NJMBmTYccVLGxXXQQVR0feGyuqJQe4Ix0S5Ggxe+o82QuBa/7QpzTZXyI0DEmlXHwvkbYerNuqAMKMAjhgXqy/6BrtdftA5sndis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715331081; c=relaxed/simple;
	bh=WKZ91qCKrxBYI9apWIIcabLHIsn7aGeaoiRFBRm2QuQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=bEiYF/oNuu6NhHzkTtcSCFpLjiUQDXqlDx7NRpmJGX4d0/lcqMI9DA9ZOMIEhed35R74+csfG13UR0aDxZpMn0MELlz2CwByMq3zomYdlsNu0p7/vMfmupZLnPIS9+ratEgd6EgowFLqTvyLooAXtaJyxzINwl2GEz4OtDZNwSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56FAEC113CC;
	Fri, 10 May 2024 08:51:20 +0000 (UTC)
Message-ID: <f16c269a-8e12-41b1-ae67-cf2d406ab24f@xs4all.nl>
Date: Fri, 10 May 2024 10:51:19 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for v6.10] Revert "media: v4l2-ctrls: show all owned
 controls in log_status"
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>
References: <04b7c48c-eb68-44bb-8bd3-b85647dbbf91@xs4all.nl>
 <20240510082507.GE6407@pendragon.ideasonboard.com>
 <20240510082607.GF6407@pendragon.ideasonboard.com>
 <d2816459-8c78-4397-b05c-d3f140553609@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <d2816459-8c78-4397-b05c-d3f140553609@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/05/2024 10:40, Hans Verkuil wrote:
> On 10/05/2024 10:26, Laurent Pinchart wrote:
>> On Fri, May 10, 2024 at 11:25:09AM +0300, Laurent Pinchart wrote:
>>> Hi Hans,
>>>
>>> Thank you for the patch.
>>>
>>> On Fri, May 10, 2024 at 09:11:46AM +0200, Hans Verkuil wrote:
>>>> This reverts commit 9801b5b28c6929139d6fceeee8d739cc67bb2739.
>>>>
>>>> This patch introduced a potential deadlock scenario:
>>>>
>>>> [Wed May  8 10:02:06 2024]  Possible unsafe locking scenario:
>>>>
>>>> [Wed May  8 10:02:06 2024]        CPU0                    CPU1
>>>> [Wed May  8 10:02:06 2024]        ----                    ----
>>>> [Wed May  8 10:02:06 2024]   lock(vivid_ctrls:1620:(hdl_vid_cap)->_lock);
>>>> [Wed May  8 10:02:06 2024]                                lock(vivid_ctrls:1608:(hdl_user_vid)->_lock);
>>>> [Wed May  8 10:02:06 2024]                                lock(vivid_ctrls:1620:(hdl_vid_cap)->_lock);
>>>> [Wed May  8 10:02:06 2024]   lock(vivid_ctrls:1608:(hdl_user_vid)->_lock);
>>>>
>>>> For now just revert.
>>>>
>>>> Fixes: 9801b5b28c69 ("media: v4l2-ctrls: show all owned controls in log_status")
>>>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>>
>>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>
>> There should be a
>>
>> Cc: stable@vger.kernel.org
> 
> Isn't that automatic if there is a Fixes tag? I thought the stable team
> automatically processes commits with that tag.

Ah, I read up on it and:

"Note: Attaching a Fixes: tag does not subvert the stable kernel rules
process nor the requirement to Cc: stable@vger.kernel.org on all stable
patch candidates. For more information, please read
Documentation/process/stable-kernel-rules.rst."

So you are right, and I will also update my check ensuring that if there
is a fixes tag, then there should be a CC stable as well.

Regards,

	Hans

> 
> Regards,
> 
> 	Hans
> 
>>
>> too, as this should be backported to v6.9.x.
>>
>>>> ---
>>>>  drivers/media/v4l2-core/v4l2-ctrls-core.c | 18 +++++-------------
>>>>  1 file changed, 5 insertions(+), 13 deletions(-)
>>>>
>>>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
>>>> index c59dd691f79f6..eeab6a5eb7bac 100644
>>>> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
>>>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
>>>> @@ -2507,8 +2507,7 @@ int v4l2_ctrl_handler_setup(struct v4l2_ctrl_handler *hdl)
>>>>  EXPORT_SYMBOL(v4l2_ctrl_handler_setup);
>>>>
>>>>  /* Log the control name and value */
>>>> -static void log_ctrl(const struct v4l2_ctrl_handler *hdl,
>>>> -		     struct v4l2_ctrl *ctrl,
>>>> +static void log_ctrl(const struct v4l2_ctrl *ctrl,
>>>>  		     const char *prefix, const char *colon)
>>>>  {
>>>>  	if (ctrl->flags & (V4L2_CTRL_FLAG_DISABLED | V4L2_CTRL_FLAG_WRITE_ONLY))
>>>> @@ -2518,11 +2517,7 @@ static void log_ctrl(const struct v4l2_ctrl_handler *hdl,
>>>>
>>>>  	pr_info("%s%s%s: ", prefix, colon, ctrl->name);
>>>>
>>>> -	if (ctrl->handler != hdl)
>>>> -		v4l2_ctrl_lock(ctrl);
>>>>  	ctrl->type_ops->log(ctrl);
>>>> -	if (ctrl->handler != hdl)
>>>> -		v4l2_ctrl_unlock(ctrl);
>>>>
>>>>  	if (ctrl->flags & (V4L2_CTRL_FLAG_INACTIVE |
>>>>  			   V4L2_CTRL_FLAG_GRABBED |
>>>> @@ -2541,7 +2536,7 @@ static void log_ctrl(const struct v4l2_ctrl_handler *hdl,
>>>>  void v4l2_ctrl_handler_log_status(struct v4l2_ctrl_handler *hdl,
>>>>  				  const char *prefix)
>>>>  {
>>>> -	struct v4l2_ctrl_ref *ref;
>>>> +	struct v4l2_ctrl *ctrl;
>>>>  	const char *colon = "";
>>>>  	int len;
>>>>
>>>> @@ -2553,12 +2548,9 @@ void v4l2_ctrl_handler_log_status(struct v4l2_ctrl_handler *hdl,
>>>>  	if (len && prefix[len - 1] != ' ')
>>>>  		colon = ": ";
>>>>  	mutex_lock(hdl->lock);
>>>> -	list_for_each_entry(ref, &hdl->ctrl_refs, node) {
>>>> -		if (ref->from_other_dev ||
>>>> -		    (ref->ctrl->flags & V4L2_CTRL_FLAG_DISABLED))
>>>> -			continue;
>>>> -		log_ctrl(hdl, ref->ctrl, prefix, colon);
>>>> -	}
>>>> +	list_for_each_entry(ctrl, &hdl->ctrls, node)
>>>> +		if (!(ctrl->flags & V4L2_CTRL_FLAG_DISABLED))
>>>> +			log_ctrl(ctrl, prefix, colon);
>>>>  	mutex_unlock(hdl->lock);
>>>>  }
>>>>  EXPORT_SYMBOL(v4l2_ctrl_handler_log_status);
>>
> 
> 


