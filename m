Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37DF01466F9
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2020 12:41:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726743AbgAWLll (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jan 2020 06:41:41 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:53043 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726026AbgAWLll (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jan 2020 06:41:41 -0500
Received: from [IPv6:2001:983:e9a7:1:1bd:458:b834:7f13]
 ([IPv6:2001:983:e9a7:1:1bd:458:b834:7f13])
        by smtp-cloud9.xs4all.net with ESMTPA
        id uargiy3LyT6sRuariixcfg; Thu, 23 Jan 2020 12:41:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1579779699; bh=l+GLaXZ3+jKIF1vt3uUwv6QEx2XZ0EMfSxdzePuAE0I=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=JUcZfO/Vbkkn03WUKefGLcWIzlC3XX+YzSCtP08l8O23gyGjbUZoTU5EOPAKwVPKa
         TNPUkK7aHi9lvaYHR2YZifFf0tBKGZ9XONUDELtDsKbP5yFt6isGCcPQLlhlgutyLm
         CuUkHX8J3u6qSIedT3OwkFbxBIBxma1bQqFcv4tofJuSVU2kZWx5l/9+yi7vtQz220
         EcQOe7+pW0ttsnOqMe8yb0iJFmHHgMwHIAQ3EMJ66yT43sbm7tNRIy6aBnDJ3SthGG
         FbC8tiZ8y6EZrX4OjtmddpIsaS9YaTt2aQKrMIxnFhPqhdUQNLjdiny5P/Tv+cy+XD
         ubHgKp68wl54Q==
Subject: Re: [RFC][PATCH 06/15] videobuf2: handle
 V4L2_FLAG_MEMORY_NON_CONSISTENT in CREATE_BUFS
To:     Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191217032034.54897-1-senozhatsky@chromium.org>
 <20191217032034.54897-7-senozhatsky@chromium.org>
 <1fedab8f-e9a1-36b1-3dd0-8f1ed782ec4d@xs4all.nl>
 <20200123034118.GA158382@google.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <d9498772-d9f5-7b25-72af-04249619ce07@xs4all.nl>
Date:   Thu, 23 Jan 2020 12:41:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200123034118.GA158382@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfH9TtrCsQhbmdJ5nYSjoBpkKr7QZACWv/IJB9lPXki3JsibghyACdJGVjgDdvfen0iAfus9BVqsplz6pW4XWsSqS+eUlEPx6JgE2cBHbBsSr19bd0BAa
 dLhqb7n+OLzlWf25r6YLn7gW32+/KL4FtmZYn0hXIl4mHObyeS6g+m4QKhNRn7oM8wORzyFYp1cCiRdZurxpBB+uEsnqnIpL8gCFUi6F12ARzqnCDBC8fnFo
 HiOaOqbIBB4jRSgNogX2j3Juo+j0vm6tU3Y0isNF0iHiycIfblo1EdLpK0BKIrN9bTPJ9SgUO03ChXI2rx+jyrp1DgFDHNZHvF27sKmhDoaXebS/JH1MAYyM
 yyVSweADH7xVYA+w6c1GCYaQIvwvzx0pahZEEqczLcO/cdIDfNmDY4/XvD9Cjlt7r6c/bj3lhwrgVFQsIJSGNcfFhTwmIQbl3RUWiieBqjb83G0zQOhbO//+
 fDst/F063kC/2xNNz0GCbc+GpwLgs1o8+5Xh/V8cf8WrfSWPoN8PbjuTnFURSNADwuPlwQnRm000H7bdrlypyVC1KYPRivvfaWhpwZ3dCyFHr+RdPhbvX0x6
 FhDkyyRTe1/r+nOhI12qYvWMKyRlnrNEcFWJBUGTwZMedg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 1/23/20 4:41 AM, Sergey Senozhatsky wrote:
> On (20/01/10 10:59), Hans Verkuil wrote:
> [..]
>>>  
>>>  	num_buffers = min(*count, VB2_MAX_FRAME - q->num_buffers);
>>> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
>>> index 0eabb589684f..48d123a1ac2a 100644
>>> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
>>> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
>>> @@ -730,6 +730,7 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
>>>  	unsigned requested_sizes[VIDEO_MAX_PLANES];
>>>  	struct v4l2_format *f = &create->format;
>>>  	int ret = vb2_verify_memory_type(q, create->memory, f->type);
>>> +	bool consistent = true;
>>>  	unsigned i;
>>>  
>>>  	fill_buf_caps(q, &create->capabilities);
>>> @@ -775,7 +776,11 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
>>>  	for (i = 0; i < requested_planes; i++)
>>>  		if (requested_sizes[i] == 0)
>>>  			return -EINVAL;
>>> -	return ret ? ret : vb2_core_create_bufs(q, create->memory,
>>> +
>>> +	if (create->flags & V4L2_FLAG_MEMORY_NON_CONSISTENT)
>>> +		consistent = false;
>>> +
>>> +	return ret ? ret : vb2_core_create_bufs(q, create->memory, consistent,
>>>  		&create->count, requested_planes, requested_sizes);
>>
>> As mentioned before: we need a V4L2_BUF_CAP capability.
> 
> I can add V4L2_BUF_CAP for memory consistency. Isn't it just q->memory
> property though? User space may request MMAP consistent memory or MMAP
> inconsistent memory.

So instead of adding a flag we add a V4L2_MEMORY_MMAP_NON_CONSISTENT memory
type and add a V4L2_BUF_CAP_SUPPORTS_MMAP_NON_CONSISTENT to signal support
for this?

I like that better than a flag. It also automatically enforces that all
buffers must be of that type.

Regards,

	Hans

> 
> 	-ss
> 

