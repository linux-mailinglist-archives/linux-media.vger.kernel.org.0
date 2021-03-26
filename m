Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01BA834AA61
	for <lists+linux-media@lfdr.de>; Fri, 26 Mar 2021 15:45:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230196AbhCZOoz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Mar 2021 10:44:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229779AbhCZOo0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Mar 2021 10:44:26 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D529EC0613AA;
        Fri, 26 Mar 2021 07:44:24 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 32BA51F46FE6
Subject: Re: [PATCH 1/2] media: videobuf2: use dmabuf size for length
To:     John Cox <jc@kynesim.co.uk>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        kernel@collabora.com, linux-kernel@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, dave.stevenson@raspberrypi.org,
        tfiga@chromium.org
References: <20210325001712.197837-1-helen.koike@collabora.com>
 <afno5g9a14fmf7tj1uq0e9pciflop2rv3k@4ax.com>
 <e67265d4-0641-e6d5-a939-9aa05f2214a6@collabora.com>
 <8omr5gd5r4qm7d9l6l5grhlgj3c2h7di88@4ax.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <88f114f0-96d1-7c9d-1c0f-19fc1f2a8220@collabora.com>
Date:   Fri, 26 Mar 2021 11:44:14 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <8omr5gd5r4qm7d9l6l5grhlgj3c2h7di88@4ax.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 3/26/21 10:03 AM, John Cox wrote:
> Hi Helen
> 
>> Hi John,
>>
>> On 3/25/21 7:20 AM, John Cox wrote:
>>> Hi
>>>
>>>> Always use dmabuf size when considering the length of the buffer.
>>>> Discard userspace provided length.
>>>> Fix length check error in _verify_length(), which was handling single and
>>>> multiplanar diferently, and also not catching the case where userspace
>>>> provides a bigger length and bytesused then the underlying buffer.
>>>>
>>>> Suggested-by: Hans Verkuil <hverkuil@xs4all.nl>
>>>> Signed-off-by: Helen Koike <helen.koike@collabora.com>
>>>> ---
>>>>
>>>> Hello,
>>>>
>>>> As discussed on
>>>> https://patchwork.linuxtv.org/project/linux-media/patch/gh5kef5bkeel3o6b2dkgc2dfagu9klj4c0@4ax.com/
>>>>
>>>> This patch also helps the conversion layer of the Ext API patchset,
>>>> where we are not exposing the length field.
>>>>
>>>> It was discussed that userspace might use a smaller length field to
>>>> limit the usage of the underlying buffer, but I'm not sure if this is
>>>> really usefull and just complicates things.
>>>>
>>>> If this is usefull, then we should also expose a length field in the Ext
>>>> API, and document this feature properly.
>>>>
>>>> What do you think?
>>>> ---
>>>> .../media/common/videobuf2/videobuf2-core.c   | 21 ++++++++++++++++---
>>>> .../media/common/videobuf2/videobuf2-v4l2.c   |  8 +++----
>>>> include/uapi/linux/videodev2.h                |  7 +++++--
>>>> 3 files changed, 27 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
>>>> index 02281d13505f..2cbde14af051 100644
>>>> --- a/drivers/media/common/videobuf2/videobuf2-core.c
>>>> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
>>>> @@ -1205,6 +1205,7 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
>>>>
>>>> 	for (plane = 0; plane < vb->num_planes; ++plane) {
>>>> 		struct dma_buf *dbuf = dma_buf_get(planes[plane].m.fd);
>>>> +		unsigned int bytesused;
>>>>
>>>> 		if (IS_ERR_OR_NULL(dbuf)) {
>>>> 			dprintk(q, 1, "invalid dmabuf fd for plane %d\n",
>>>> @@ -1213,9 +1214,23 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
>>>> 			goto err;
>>>> 		}
>>>>
>>>> -		/* use DMABUF size if length is not provided */
>>>> -		if (planes[plane].length == 0)
>>>> -			planes[plane].length = dbuf->size;
>>>> +		planes[plane].length = dbuf->size;
>>>> +		bytesused = planes[plane].bytesused ?
>>>> +			    planes[plane].bytesused : dbuf->size;
>>>> +
>>>> +		if (planes[plane].bytesused > planes[plane].length) {
>>>> +			dprintk(q, 1, "bytesused is bigger then dmabuf length for plane %d\n",
>>>> +				plane);
>>>> +			ret = -EINVAL;
>>>> +			goto err;
>>>> +		}
>>>> +
>>>> +		if (planes[plane].data_offset >= bytesused) {
>>>> +			dprintk(q, 1, "data_offset >= bytesused for plane %d\n",
>>>> +				plane);
>>>> +			ret = -EINVAL;
>>>> +			goto err;
>>>> +		}
>>>>
>>>> 		if (planes[plane].length < vb->planes[plane].min_length) {
>>>> 			dprintk(q, 1, "invalid dmabuf length %u for plane %d, minimum length %u\n",
>>>> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
>>>> index 7e96f67c60ba..ffc7ed46f74a 100644
>>>> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
>>>> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
>>>> @@ -98,14 +98,14 @@ static int __verify_length(struct vb2_buffer *vb, const struct v4l2_buffer *b)
>>>> 	unsigned int bytesused;
>>>> 	unsigned int plane;
>>>>
>>>> -	if (V4L2_TYPE_IS_CAPTURE(b->type))
>>>> +	/* length check for dmabuf is performed in _prepare_dmabuf() */
>>>> +	if (V4L2_TYPE_IS_CAPTURE(b->type) || b->memory == VB2_MEMORY_DMABUF)
>>>> 		return 0;
>>>>
>>>> 	if (V4L2_TYPE_IS_MULTIPLANAR(b->type)) {
>>>> 		for (plane = 0; plane < vb->num_planes; ++plane) {
>>>> -			length = (b->memory == VB2_MEMORY_USERPTR ||
>>>> -				  b->memory == VB2_MEMORY_DMABUF)
>>>> -			       ? b->m.planes[plane].length
>>>> +			length = b->memory == VB2_MEMORY_USERPTR
>>>> +				? b->m.planes[plane].length
>>>> 				: vb->planes[plane].length;
>>>> 			bytesused = b->m.planes[plane].bytesused
>>>> 				  ? b->m.planes[plane].bytesused : length;
>>>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>>>> index 8d15f6ccc4b4..79b3b2893513 100644
>>>> --- a/include/uapi/linux/videodev2.h
>>>> +++ b/include/uapi/linux/videodev2.h
>>>> @@ -968,7 +968,9 @@ struct v4l2_requestbuffers {
>>>> /**
>>>>    * struct v4l2_plane - plane info for multi-planar buffers
>>>>    * @bytesused:		number of bytes occupied by data in the plane (payload)
>>>> - * @length:		size of this plane (NOT the payload) in bytes
>>>> + * @length:		size of this plane (NOT the payload) in bytes. Filled
>>>> + *			by userspace for USERPTR and by the driver for DMABUF
>>>> + *			and MMAP.
>>>>    * @mem_offset:		when memory in the associated struct v4l2_buffer is
>>>>    *			V4L2_MEMORY_MMAP, equals the offset from the start of
>>>>    *			the device memory for this plane (or is a "cookie" that
>>>> @@ -1025,7 +1027,8 @@ struct v4l2_plane {
>>>>    * @m:		union of @offset, @userptr, @planes and @fd
>>>>    * @length:	size in bytes of the buffer (NOT its payload) for single-plane
>>>>    *		buffers (when type != *_MPLANE); number of elements in the
>>>> - *		planes array for multi-plane buffers
>>>> + *		planes array for multi-plane buffers. Filled by userspace for
>>>> + *		USERPTR and by the driver for DMABUF and MMAP.
>>>>    * @reserved2:	drivers and applications must zero this field
>>>>    * @request_fd: fd of the request that this buffer should use
>>>>    * @reserved:	for backwards compatibility with applications that do not know
>>>
>>> I think this does what I want. But I'm going to restate my usage desires
>>> and check that you agree that it covers them.
>>>
>>> I'm interested in passing compressed bitstreams to a decoder.  The size
>>> of these buffers can be very variable and the worst case will nearly
>>> always be much larger than the typical case and that size cannot be
>>> known in advance of usage.  It can be very wasteful to have to allocate
>>> buffers that are over an order of magnitude bigger than are likely to
>>> ever be used.  If you have a fixed pool of fixed size buffers allocated
>>> at the start of time this wastefulness is unavoidable, but dmabufs can
>>> be dynamically sized to be as big as required and so there should be no
>>> limitation on passing in buffers that are smaller than the maximum.  It
>>
>> Do you mean that the kernel should re-allocate the buffer dynamically
>> without userspace intervention?
>> I'm not entirely sure if this would be possible.
> 
> No - I didn't mean that at all.  Any reallocation would be done by the
> user.  I was just setting out why damabufs are different from (and more
> useful than) MMAP buffers for bitstream-like purposes.

Right, thanks for the clarification.

> 
> Regards
> 
> John Cox
> 
>> Regards,
>> Helen
>>
>>
>>> also seems plausible that dmabufs that are larger than the maximum
>>> should be allowed as long as their bytesused is smaller or equal.

If I understand correctly, the requirements would be:

(consider maximum being the length/boundary provided by userspace).

(1) bytesused <= maximum && bytesused <= dmabuf_length, this must always be true.
(2) maximum <= dmabuf_length is always ok.
(3) dmabuf_length <= maximum is ok as long (1) is still true.
if dmabuf_length <= maximum, but bytesused > maximum, then it is not ok.

Make sense?

We could save in vb2:
bytesused_max = maximum ? min(maximum, dmabuf_length) : dmabuf_length;

Then drivers could check if if bytesused <= bytesused_max,
and we don't need to check dma_length against the maximum value.

Or maybe there is little value in letting userspace define a maximum.

What do you think we should do? Remove the maximum (as implemented in this patch)?
Or just comparing against bytesused_max is enough (which would keeping the boundary
feature) ?

I would prefer to remove the maximum if there is no value for userspace, since
this would make things easier for the Ext API implementation.

>>>
>>> As an aside, even when using dynamically sized dmabufs they are often
>>> way larger than the data they contain and forcing cache flushes or maps
>>> of their entire length rather than just the used portion is also
>>> wasteful.  This might be a use for the incoming size field.

I guess this can be achieved using the bytesused field.

Regards,
Helen

>>>
>>> Regards
>>>
>>> John Cox
>>>
