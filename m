Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0542E3DB51A
	for <lists+linux-media@lfdr.de>; Fri, 30 Jul 2021 10:40:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237612AbhG3IkI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jul 2021 04:40:08 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:35649 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230335AbhG3IkH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jul 2021 04:40:07 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 9O3jmBPUfW9Qy9O3kmCJAR; Fri, 30 Jul 2021 10:40:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1627634401; bh=OK2/wR8i9sSghJEVl68FiWpEkiqonBYzKInvlesr9dI=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=nTdh04GF3TvsC9NS1mzrcAWIoN27GsV8xC5FCbo1bqzYdz4DCkMIM69fXrEDHHg3v
         IE6VRMcaabxBCmT9IXKACl8Y8JbDYIgspeB/EC88DRN1aRWSmHnVnrHpPNkU5lIagK
         dBc6vsqMKHv1zbsmy1f/NbgSAhG9SA5z0MrFxeOiDF0iSXnGG/jeLX3+aGUvw2S6Cp
         gNg/2VjnpVtjAH3cwAc52bnqB7IDLN8xrvbb+20jtZbt3CXy4UvQm0RsYpSBjtlSKA
         jSjrM70hSkL+kKfbSxqdn4uzFNEXl2W7H0e8e3GXdbI4hBnmajV3ihvxrzwNgagN9J
         6UpLm9zokcOhg==
Subject: Re: [PATCH for v5.14] videobuf2-core: dequeue if start_streaming
 fails
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <542319b4-387b-6e29-db72-998de02ae4b4@xs4all.nl>
 <YQK6kMhFBmxDN/Jc@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <b8d5e3a1-2ab7-eefd-3265-10621a28101c@xs4all.nl>
Date:   Fri, 30 Jul 2021 10:39:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YQK6kMhFBmxDN/Jc@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfGLIkzmWuDcBCHl8mBLCh7PLkkS2yTaWDFxro24CE+cayv3kDju8eJq4UU6SsrVOxH5vOCVl9YQpt9+jHFXfc8ibjnrcf5By6wZN5iTkWM71DimjjYo7
 /57X2gPVUXMAjo6p2cKEZwRxhzzio87bQ3yAcVQ/2wHO4DHeA9SvaebnB1LjVoF4MNtd/jGfTfw1uY9Jj3PVdxvCF6LUqDPM2Cu4Q3L1+SRC/QcSOKfk7RZF
 tEOHGNCuKx+hjKQfxU1MEIwWcRHfCa1ODzK8fVx/LWRryaqrDCC7Sq5yfCoaAZQo3bpW4wcX8b8VEZ7cglUUE2d8dC4tZLgmNq6dnUKLNSaJswPkPzhopSTl
 +o7gGtwKLn36Q1YR9leUaPHiJGuZ0OcrE7m1fzFUsj7nK2HvBlI=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 29/07/2021 16:26, Laurent Pinchart wrote:
> Hi Hans,
> 
> Thank you for the patch.
> 
> On Thu, Jul 29, 2021 at 10:35:33AM +0200, Hans Verkuil wrote:
>> If a vb2_queue sets q->min_buffers_needed then if the number of
>> queued buffers reaches that number vb2_core_qbuf() will call
>> the start_streaming() callback. If that returns an error, then that
>> was just returned, but that left the buffer still queued. But userspace
> 
> The three "that" in the sentence are confusing. Do you mean "If that
> function returns an error, the error code is just returned, but the
> buffer is left still queued." ?
> 
>> expects that if VIDIOC_QBUF fails, the buffer wasn't queued.
>>
>> So if start_streaming() fails, then remove the buffer from the queue,
>> thus avoiding this unwanted side-effect.
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> Tested-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
>> Fixes: b3379c6201bb ("[media] vb2: only call start_streaming if sufficient buffers are queued")
> 
> Possibly with the commit message updated,

This is the new commit message (not going to repost the patch, I'll just
update the PR):

If a vb2_queue sets q->min_buffers_needed then when the number of
queued buffers reaches q->min_buffers_needed, vb2_core_qbuf() will call
the start_streaming() callback. If start_streaming() returns an error,
then that error was just returned by vb2_core_qbuf(), but the buffer
was still queued. However, userspace expects that if VIDIOC_QBUF fails,
the buffer is returned dequeued.

So if start_streaming() fails, then remove the buffer from the queue,
thus avoiding this unwanted side-effect.

Regards,

	Hans

> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
>> ---
>>  drivers/media/common/videobuf2/videobuf2-core.c | 13 ++++++++++++-
>>  1 file changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
>> index 02281d13505f..508ac295eb06 100644
>> --- a/drivers/media/common/videobuf2/videobuf2-core.c
>> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
>> @@ -1573,6 +1573,7 @@ int vb2_core_qbuf(struct vb2_queue *q, unsigned int index, void *pb,
>>  		  struct media_request *req)
>>  {
>>  	struct vb2_buffer *vb;
>> +	enum vb2_buffer_state orig_state;
>>  	int ret;
>>
>>  	if (q->error) {
>> @@ -1673,6 +1674,7 @@ int vb2_core_qbuf(struct vb2_queue *q, unsigned int index, void *pb,
>>  	 * Add to the queued buffers list, a buffer will stay on it until
>>  	 * dequeued in dqbuf.
>>  	 */
>> +	orig_state = vb->state;
>>  	list_add_tail(&vb->queued_entry, &q->queued_list);
>>  	q->queued_count++;
>>  	q->waiting_for_buffers = false;
>> @@ -1703,8 +1705,17 @@ int vb2_core_qbuf(struct vb2_queue *q, unsigned int index, void *pb,
>>  	if (q->streaming && !q->start_streaming_called &&
>>  	    q->queued_count >= q->min_buffers_needed) {
>>  		ret = vb2_start_streaming(q);
>> -		if (ret)
>> +		if (ret) {
>> +			/*
>> +			 * Since vb2_core_qbuf will return with an error,
>> +			 * we should return it to state DEQUEUED since
>> +			 * the error indicates that the buffer wasn't queued.
>> +			 */
>> +			list_del(&vb->queued_entry);
>> +			q->queued_count--;
>> +			vb->state = orig_state;
>>  			return ret;
>> +		}
>>  	}
>>
>>  	dprintk(q, 2, "qbuf of buffer %d succeeded\n", vb->index);
> 

