Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 313BE82346
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2019 18:56:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728760AbfHEQ4Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Aug 2019 12:56:16 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:58945 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728518AbfHEQ4Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 5 Aug 2019 12:56:16 -0400
Received: from [10.125.143.226] ([138.219.197.106])
        by smtp-cloud9.xs4all.net with ESMTPA
        id ugHDhXiQ5AffAugHIh0jrA; Mon, 05 Aug 2019 18:56:14 +0200
Subject: Re: [RFC PATCH 1/5] media: vb2: Add a helper to get the vb2 buffer
 attached to a request
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-media@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Alexandre Courbot <acourbot@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
References: <20190805094827.11205-1-boris.brezillon@collabora.com>
 <20190805094827.11205-2-boris.brezillon@collabora.com>
 <722ddb41-f7b8-afee-66a3-e99a571da5d7@xs4all.nl>
 <20190805161338.7df1e623@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <ef907940-c86b-efde-3092-1af8dfbf4c04@xs4all.nl>
Date:   Mon, 5 Aug 2019 13:56:02 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190805161338.7df1e623@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPXwDEIlOEqWH8XzgkhakcSXJr6zudCx0NKMENye8YiNLO7MORDEWOOGsjhhVXXhJTPHdYj1bTEG59e0M683lYHOUty6havXkJ5R41oj5RuTJ6TlBhT7
 7xQaOalYXQFp214WwL4J4VZl/Hyp8ZSmQ08dJ8VY9Epgq8c92RJLzhx3EegqAZLpZixt0tLgbnOVY0NQC44CQl//5icsl71Sns7FzhJSWPMij+1fv0Rc12/C
 3ihvBaAdgkV46HYGTwh3W+iyZ5875Ta4MR5zDmoC9Edei7g4czW3DcBkEwyy3pJbAdENdzyr0pSGV8cJoY4OLeS6X1nIOIXi6Y4iX11SM4oOX5/Ll4E0c5Am
 6BwUo9p8hf5OGkmxkONKoPbRUtxm9tAytBS7lHDOzMVqIcFsI2Sa7KMXsDaPJxY95q5DI0Cjz0Z5SxmPgzjDOiw+DqwWj7a9GDwDyYMQw8/YbNQZUreW7Oev
 szb4epxx2T/2XwHQ9zSef3mM4HATA+HO/le/OTCwIar+AoV7X/Gv1HFOkgz+Ck1D07JAk4kyuLcGD30GqwRpIyl25u9O9H5N4Izc37Ohh1UXhgLKUftBB9+G
 ACj3njo6Z0KMcv4w2fYa0MNdNGRPJiAZu+vT/cFrDOaTf9Qtqs7/S2CDglrr+jpnfsGZlWsLHla0b+VLYnlM5R9fU56iAezBVNNkxW18Nvbs7yZ9HDQWFPML
 rWlDeNgDWTHqJGtTqYU1YqE7eaq8c6ZWWO9Bp6JHCEddKmG5p/O34g==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/5/19 11:13 AM, Boris Brezillon wrote:
> On Mon, 5 Aug 2019 10:12:53 -0300
> Hans Verkuil <hverkuil@xs4all.nl> wrote:
> 
>> On 8/5/19 6:48 AM, Boris Brezillon wrote:
>>> vb2_request_get_buf() returns the N-th buffer attached to a media
>>> request.
>>>
>>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>>> ---
>>>    .../media/common/videobuf2/videobuf2-core.c   | 23 +++++++++++++++++++
>>>    include/media/videobuf2-core.h                | 11 +++++++++
>>>    2 files changed, 34 insertions(+)
>>>
>>> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
>>> index 4489744fbbd9..58769f0c8665 100644
>>> --- a/drivers/media/common/videobuf2/videobuf2-core.c
>>> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
>>> @@ -1416,6 +1416,29 @@ unsigned int vb2_request_buffer_cnt(struct media_request *req)
>>>    }
>>>    EXPORT_SYMBOL_GPL(vb2_request_buffer_cnt);
>>>    
>>> +struct vb2_buffer *vb2_request_get_buf(struct media_request *req,
>>> +				       unsigned int idx)
>>> +{
>>> +	struct media_request_object *obj;
>>> +	struct vb2_buffer *buf = NULL;
>>> +	unsigned int nbufs = 0;
>>> +	unsigned long flags;
>>> +
>>> +	spin_lock_irqsave(&req->lock, flags);
>>> +	list_for_each_entry(obj, &req->objects, list) {
>>> +		if (!vb2_request_object_is_buffer(obj) ||
>>> +		    nbufs++ < idx)
>>> +			continue;
>>> +
>>> +		buf = container_of(obj, struct vb2_buffer, req_obj);
>>> +		break;
>>> +	}
>>> +	spin_unlock_irqrestore(&req->lock, flags);
>>> +
>>> +	return buf;
>>> +}
>>> +EXPORT_SYMBOL_GPL(vb2_request_get_buf);
>>> +
>>>    int vb2_core_prepare_buf(struct vb2_queue *q, unsigned int index, void *pb)
>>>    {
>>>    	struct vb2_buffer *vb;
>>> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
>>> index 640aabe69450..febf3261a120 100644
>>> --- a/include/media/videobuf2-core.h
>>> +++ b/include/media/videobuf2-core.h
>>> @@ -1222,4 +1222,15 @@ bool vb2_request_object_is_buffer(struct media_request_object *obj);
>>>     */
>>>    unsigned int vb2_request_buffer_cnt(struct media_request *req);
>>>    
>>> +/**
>>> + * vb2_request_get_buf() - return the buffer at index @idx
>>> + *
>>> + * @req:	the request.
>>> + * @idx:	index of the buffer in the req object list
>>
>> This is confusing: it suggests that you are talking about the buffer
>> index itself (buf->index) instead of the nth buffer in the request.
> 
> How about:
> 
> @n: search for the Nth buffer in the req object list

That looks good to me.

	Hans

> 
>>
>> Looks good otherwise.
>>
>> Regards,
>>
>> 	Hans
>>
>>> + *
>>> + * Return a vb2 buffer or NULL if there's no buffer at the specified index
>>> + */
>>> +struct vb2_buffer *vb2_request_get_buf(struct media_request *req,
>>> +				       unsigned int idx);
>>> +
>>>    #endif /* _MEDIA_VIDEOBUF2_CORE_H */
>>>    
>>
> 

