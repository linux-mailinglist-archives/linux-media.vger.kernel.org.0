Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 188D31AD85C
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2020 10:14:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729678AbgDQINy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Apr 2020 04:13:54 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:38809 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729635AbgDQINy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Apr 2020 04:13:54 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id PM8CjhxNn7xncPM8Fj9mMH; Fri, 17 Apr 2020 10:13:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1587111231; bh=q8NYR4tyAXxdz07W8s6qeKGxIV5x1hCdmkoYOk/clHw=;
        h=Subject:From:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=ixurVZBK9PzfGphIcS6qkRb/MlTeQBGYYXC0ZUTH7wEYk0Ueb7Owttt4dYHqdQ6kr
         9wug2o0gtFkfqwmqLqZv0bC0Asjyh6ENLQyfLgrSmIFORkXwEC6JgJY2HDQ5GvvA5a
         H/B8XrcZ+QOxJaPZD8hqldRnEaqHdmHv3tgci/uUU6KvF9YztpahvXiD7ws8YljHU0
         4iCf6VU+zOUw+b0b9NV6mZj3psdln5LjxYmo1UPhbuD0T2wqb6XNVYq9JbbkgG1o8l
         abKgZx32yxBugiCaGGlxQA9ND7cwB0GdSCVGvoD6HZ2ivtpBLlMiVTrmoMqGEe0+N2
         2ybkchPgG/i+A==
Subject: Re: [RFC][PATCH] media: v4l2-ctrls: add more NULL pointer checks
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200410103501.1083-1-sergey.senozhatsky@gmail.com>
 <c83c137b-b801-a06b-e324-09dd3bbc9daf@xs4all.nl>
 <20200416113249.GG30641@jagdpanzerIV.localdomain>
 <f724e17d-51ae-ad20-6c78-4be21d39180b@xs4all.nl>
Message-ID: <3bf8712c-45fe-5539-f659-fafa861b8702@xs4all.nl>
Date:   Fri, 17 Apr 2020 10:13:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <f724e17d-51ae-ad20-6c78-4be21d39180b@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFYLNyJhvDwpyf29uR5h8j3sMZwt1QOuUImdludPImcJp5YjO4FCUr3Xrrk1gF6iYXfNd5v+rJy06wfpKjgbCqqH5lOuKkU1YJlX/T7BfnB3fk5YLLAp
 vefcx+OoJTohL4bFzaVrT+wybek/+DSYgqjtqXMIrEHA+EIgP4Hm+FoH5FrumHCMCObJLpq2cYbjsyHgfK0fiESjGOKy2OfQ07Fx+XkDWFTkwfL3z6aqbsHR
 /5nmagjBROZvigqws9+CsvmX9DOd09909QdG/TwVO/UdKmVw/z32q2Srs/bmFc56+e48IWmb8vcP9vPOHXK5je4nrNLftLMQdrm/EDNikbk=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sergey,

I recommend that you wait a bit until these two patches are merged:

https://patchwork.linuxtv.org/patch/61897/
https://patchwork.linuxtv.org/patch/61898/

I'm about to post a PR for these (and others), so hopefully these will
get merged soon.

Regards,

	Hans

On 16/04/2020 14:13, Hans Verkuil wrote:
> On 16/04/2020 13:32, Sergey Senozhatsky wrote:
>> On (20/04/16 10:53), Hans Verkuil wrote:
>> [..]
>>>> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
>>>> @@ -2869,6 +2869,9 @@ EXPORT_SYMBOL(v4l2_ctrl_add_handler);
>>>>  
>>>>  bool v4l2_ctrl_radio_filter(const struct v4l2_ctrl *ctrl)
>>>>  {
>>>> +	if (WARN_ON(!ctrl))
>>>> +		return false;
>>>> +
>>>>  	if (V4L2_CTRL_ID2WHICH(ctrl->id) == V4L2_CTRL_CLASS_FM_TX)
>>>>  		return true;
>>>>  	if (V4L2_CTRL_ID2WHICH(ctrl->id) == V4L2_CTRL_CLASS_FM_RX)
>>>> @@ -3794,7 +3797,9 @@ s32 v4l2_ctrl_g_ctrl(struct v4l2_ctrl *ctrl)
>>>>  	struct v4l2_ext_control c;
>>>>  
>>>>  	/* It's a driver bug if this happens. */
>>>> -	WARN_ON(!ctrl->is_int);
>>>> +	if (WARN_ON(!ctrl || !ctrl->is_int))
>>>> +		return -EINVAL;
>>>
>>> Just return 0 here. The return value is the control's value, not an error code.
>>> So all you can do here is return 0 in the absence of anything better.
>>
>> OK.
>>
>>>> +
>>>>  	c.value = 0;
>>>>  	get_ctrl(ctrl, &c);
>>>>  	return c.value;
>>>> @@ -4212,6 +4217,9 @@ EXPORT_SYMBOL(v4l2_s_ctrl);
>>>>  
>>>>  int __v4l2_ctrl_s_ctrl(struct v4l2_ctrl *ctrl, s32 val)
>>>>  {
>>>> +	if (!ctrl)
>>>
>>> Change this to 'if (WARN_ON(!ctrl))'
>>>
>>> I don't think NULL pointers should be silently ignored: it really
>>> indicates a driver bug. It it certainly a good idea to WARN instead.
>>
>> Should WARN_ON() be only in unlocked versions of ctrl API? It probably
>> would make sense to add WARNs to both - e.g. to v4l2_ctrl_s_ctrl() and
> 
> Yes, it should be done for both.
> 
>> to __v4l2_ctrl_s_ctrl(). By the way, why don't locked and unlocked
>> versions live together in v4l2-ctrls.c file? Any reason for, e.g.,
>> v4l2_ctrl_s_ctrl() to be in header and __v4l2_ctrl_s_ctrl() to be C-file?
> 
> The v4l2_ctrl_s_ctrl() work fine as a static inline (only compiled if
> they are actually used). But with an additional 'if (WARN_ON(!ctrl))'
> it becomes a bit questionable. I would not be opposed if these static
> inlines are now moved into the source code.
> 
> Regards,
> 
> 	Hans
> 
>>
>>> The same is true for the functions below.
>>
>> OK.
>>
>> 	-ss
>>
> 

