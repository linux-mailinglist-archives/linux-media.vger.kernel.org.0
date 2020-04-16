Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 941671AC0D8
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2020 14:14:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2635180AbgDPMOA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Apr 2020 08:14:00 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:56865 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2635124AbgDPMN4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Apr 2020 08:13:56 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id P3Oxjcid87xncP3P0j7bs5; Thu, 16 Apr 2020 14:13:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1587039234; bh=F+K4cdVq08HBBl8QpFts4+Tv330OztlyLas7ZcdXImo=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Akz6oJbUK8lsqel0fCMca2SivYxWjsbVpmwmSa1cqjyELPBi5Jc3BE/4sYODYjemX
         izM+Vlm4lYVq+Mr7z8haBVZZQgbH5l/P8tbBQ893MTcXrWaBsdkqk6689JQ5vcjwUf
         QH6II73vYVNWMF0UeiFor0SEuNxQkFM4bA/PqsGtTPvtaTlFbAxcDWKTIggghH2BwO
         KEAlu36a1YG795jndFHLgYVyTnqNwHqnPNV2YBm12U5yyf+JWLGYlctx8BhXPgtHPK
         B8otA9pt+8wrPleu6nGW1vvk29dQ+SodCa7zD2ngk8tfM3fYAY+aXkZIh3JVVn2xY1
         rwWGRI+jvA6gg==
Subject: Re: [RFC][PATCH] media: v4l2-ctrls: add more NULL pointer checks
To:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200410103501.1083-1-sergey.senozhatsky@gmail.com>
 <c83c137b-b801-a06b-e324-09dd3bbc9daf@xs4all.nl>
 <20200416113249.GG30641@jagdpanzerIV.localdomain>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <f724e17d-51ae-ad20-6c78-4be21d39180b@xs4all.nl>
Date:   Thu, 16 Apr 2020 14:13:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200416113249.GG30641@jagdpanzerIV.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfK0IWwIBm1UhD1bC7T6kfB06YpW1YWFKTqxtE0O3553vKk9goK75YTEKwbaXzlIw8G3xPast7YxL+D/x1nHDGEqyQTn4CPGNXSNQwxIAwh9TsNfJR4Wg
 Zxk59URlOGRFprn+PaFVOQeIVi3LS5EsulEEM6DgZKZdygdb9xfDHz5VjvH9y8X+gNyw/8HaILe7yKe0NaFEmEJCmrXp2cMqdA+iyJEJ6kfkviT0LhGVBmwi
 F6T+KsQKFpn2g8pofyZHWAPiFoGHvLh7b4koEjcZhPke/QEiRS7z3XONkE83q1Um/T6j954mmaabHAGNCLCDYSETZefODWa1SeEFsCVakhg=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/04/2020 13:32, Sergey Senozhatsky wrote:
> On (20/04/16 10:53), Hans Verkuil wrote:
> [..]
>>> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
>>> @@ -2869,6 +2869,9 @@ EXPORT_SYMBOL(v4l2_ctrl_add_handler);
>>>  
>>>  bool v4l2_ctrl_radio_filter(const struct v4l2_ctrl *ctrl)
>>>  {
>>> +	if (WARN_ON(!ctrl))
>>> +		return false;
>>> +
>>>  	if (V4L2_CTRL_ID2WHICH(ctrl->id) == V4L2_CTRL_CLASS_FM_TX)
>>>  		return true;
>>>  	if (V4L2_CTRL_ID2WHICH(ctrl->id) == V4L2_CTRL_CLASS_FM_RX)
>>> @@ -3794,7 +3797,9 @@ s32 v4l2_ctrl_g_ctrl(struct v4l2_ctrl *ctrl)
>>>  	struct v4l2_ext_control c;
>>>  
>>>  	/* It's a driver bug if this happens. */
>>> -	WARN_ON(!ctrl->is_int);
>>> +	if (WARN_ON(!ctrl || !ctrl->is_int))
>>> +		return -EINVAL;
>>
>> Just return 0 here. The return value is the control's value, not an error code.
>> So all you can do here is return 0 in the absence of anything better.
> 
> OK.
> 
>>> +
>>>  	c.value = 0;
>>>  	get_ctrl(ctrl, &c);
>>>  	return c.value;
>>> @@ -4212,6 +4217,9 @@ EXPORT_SYMBOL(v4l2_s_ctrl);
>>>  
>>>  int __v4l2_ctrl_s_ctrl(struct v4l2_ctrl *ctrl, s32 val)
>>>  {
>>> +	if (!ctrl)
>>
>> Change this to 'if (WARN_ON(!ctrl))'
>>
>> I don't think NULL pointers should be silently ignored: it really
>> indicates a driver bug. It it certainly a good idea to WARN instead.
> 
> Should WARN_ON() be only in unlocked versions of ctrl API? It probably
> would make sense to add WARNs to both - e.g. to v4l2_ctrl_s_ctrl() and

Yes, it should be done for both.

> to __v4l2_ctrl_s_ctrl(). By the way, why don't locked and unlocked
> versions live together in v4l2-ctrls.c file? Any reason for, e.g.,
> v4l2_ctrl_s_ctrl() to be in header and __v4l2_ctrl_s_ctrl() to be C-file?

The v4l2_ctrl_s_ctrl() work fine as a static inline (only compiled if
they are actually used). But with an additional 'if (WARN_ON(!ctrl))'
it becomes a bit questionable. I would not be opposed if these static
inlines are now moved into the source code.

Regards,

	Hans

> 
>> The same is true for the functions below.
> 
> OK.
> 
> 	-ss
> 

