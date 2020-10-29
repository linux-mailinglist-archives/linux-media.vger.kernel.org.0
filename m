Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B872329EC90
	for <lists+linux-media@lfdr.de>; Thu, 29 Oct 2020 14:15:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726353AbgJ2NPc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Oct 2020 09:15:32 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:54773 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725710AbgJ2NPc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Oct 2020 09:15:32 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Y7m0kLYAwAVOrY7m3kJ4H2; Thu, 29 Oct 2020 14:15:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1603977329; bh=V/xbU2rVO4ABVOpI/dOq7yN5zeS5/V68j9OSwidtzF0=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=XDOcxgMuznlZZHAhVodWyUyPZxkZbxKnpGAN3Eq6jsPc4w6WR9guV8r6JP+DC+IJl
         GU1o0DYERjrHG+afTromvg9hEoDOYhZjUGGQwxPgFzFwrd7u/Oql9lrJWn7H2QEINH
         3i0panH2F9s4XDpQtAVcT57pfTrn9iX/lxHkzLhsLVOPyNNw0SwKjCtm3MkAFnfyJp
         CguQl455RUFje7OhrlciLyv0lYh2axHTHgtDn8mwI4lklQuj5e0Y1jaSHJp6Oqk4OS
         Zf4TxWm+GnIUJi8aNKB5pJT0nMfsaf0UUZGQMQP+NHfU2jtDFz/Ky2rZFULwG1+SOP
         fZdf/2WlVLUhw==
Subject: Re: [PATCH] media: videobuf2: Fix length check for single plane
 dmabuf queueing
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     John Cox <jc@kynesim.co.uk>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <gh5kef5bkeel3o6b2dkgc2dfagu9klj4c0@4ax.com>
 <20201008015953.GA28158@pendragon.ideasonboard.com>
 <CAPY8ntA15jA_AViccQqK=4U_SW6snuBD=B1Km0ZvqEpf3ReBZQ@mail.gmail.com>
 <20201016122825.GL3829@pendragon.ideasonboard.com>
 <CAPY8ntAG0XijBb_+41N-tBM8SGM0T061jG2xghaR9SLROKKD=g@mail.gmail.com>
 <CAPY8ntBReryd+gD4YLn=Us5QrbRob5u8JrFvBHK2ca=iABOZBQ@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <010b4457-6816-9571-1e10-c82b277ea77c@xs4all.nl>
Date:   Thu, 29 Oct 2020 14:15:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAPY8ntBReryd+gD4YLn=Us5QrbRob5u8JrFvBHK2ca=iABOZBQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfCpAySkhD91hNHs8DpJH38PDtZJo7I8qhzdYFKDAx9gBMT9sfgXDaWqdeeiSBVdnQeSheiy2wLR4teXqSwFSx+Qi2zd9aCdqr3qBXRA6jeJvZ3D4YhKk
 +sI6lUikvOV9kGyWyW4YQYk7WXeQpYhjytf5KcbOigNJOTmKl1ke0tmSEYwLT2L863LX92c+mIwPkkV0j6D8UChMji39rg2GfbMgZuj1Go1ytq4Hn3JDk0PJ
 vKDYWp8JlCpYSg82zYGT5ofUgS0yaUu3F5Hrw4MKTh8w6Z3Lbw9zdoxaTECfrRBWyvfUJ7Fg7ypOolt4qb2uMg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

My apologies for the delay, I've been very busy in the past 3 weeks.

On 29/10/2020 11:00, Dave Stevenson wrote:
> Gentle ping to Hans for his view.
> 
> Quick summary:
> For VB2_MEMORY_DMABUF single planar and multi planar APIs differed in
> behaviour as to whether userspace had to provide the length of the
> dmabuf or not. (Multi-planar it did, single planar it didn't). This
> patch made them both the same - userspace had to provide the length.
> Laurent has stated that the old behaviour for single planar was that
> length = 0  is "take the length of the underlying dmabuf", so we have
> a regression. It appears undocumented that multi-planar requires the
> length. All docs appear to say that the driver fills in this field
> (except in USERPTR mode). vb2_fill_vb2_v4l2_buffer specifically takes
> the user provided length field in VB2_MEMORY_DMABUF.

I'm not sure this analysis is correct.

Without this patch __verify_length() uses vb->planes[0].length as
the length to compare bytesused to. This is the length as provided
by the driver's queue_setup() op.

With this patch it uses the userspace provided b->length.

And indeed, this is a regression for the single planar API since the
kernel now expects that length is always set to something valid.

But b->length is the value that's copied to planes[0].length in
vb2_fill_vb2_v4l2_buffer() and that in turn is used by __prepare_dmabuf().
And yes, the flow of data is confusing, I had to look at this for some time
to figure it out...

In __prepare_dmabuf() you see this code:

                /* use DMABUF size if length is not provided */
                if (planes[plane].length == 0)
                        planes[plane].length = dbuf->size;

So the problem is really in __verify_length() which is not testing against
the right length value. I'd be inclined to just drop the length checks
altogether for DMABUF in that function and leave it to __prepare_dmabuf.

There you know the dmabuf size and you can do the correct check.

> 
> Question: Why are we not using dmabuf size instead of user provided
> length for both APIs under all conditions? Userspace doesn't need to
> provide the length as that is available from the dmabuf, and the main
> check ought to be that the bytesused is big enough against the
> underlying dmabuf, not the length that vb2 has.

I'm not sure if that wouldn't cause regressions somehow. Using length == 0
as an indicator to use the dmabuf size certainly makes sense, but if the
length is given explicitly, then perhaps that should be kept. That said,
just always using the dmabuf size would simplify matters quite a bit.

I'm leaning towards always using the dmabuf size.

> 
> Scenario:
> Allocate a dmabuf (eg using dmaheaps) that is smaller than V4L2 has asked for.
> QBUF with VB2_MEMORY_DMABUF, length >= V4L2's requested size,
> bytesused = length (ie more used than the dmabuf can take).
> 
> I don't believe any of the validation currently catches that. It
> nearly does in __prepare_dmabuf with planes[plane].length <
> vb->planes[plane].min_length, but in this scenario
> planes[plane].length is incorrectly high.

It's caught in the attach_dmabuf op. But I think it would be much better
if that check is moved up from the three attach_dmabuf implementations into
__prepare_dmabuf.

So, I think this should happen to solve this:

1) Drop the length checks for DMABUF in __verify_length()
2) Drop 'if (planes[plane].length == 0)' in __prepare_dmabuf
   This is tentative, if this can cause regressions then we shouldn't do this.
3) Add a 'if (planes[plane].bytesused > planes[plane].length)' check to __prepare_dmabuf,
   since this check no longer happens in __verify_length.
4) Move the dbuf->size check from the three memops implementations of
   the attach_dmabuf op into __prepare_dmabuf. Optional, but I think it is
   a good cleanup.
5) Update the documentation.

This would be for 5.11, for older kernels I think the original patch
should just be reverted to fix the regression. Unless someone can come
up with a minimal patch fixing this.

Regards,

	Hans

> The driver gets passed a buffer that is likely only partially mapped,
> and hardware may access memory it shouldn't.
> 
> 
> The use case that triggered this is for decoding compressed
> bitstreams, therefore the size of the buffer doesn't need to match any
> value that V4L2 and vb2 thinks of, as long as the size of the
> underlying dmabuf is larger than bytesused. If the driver underneath
> can accept any length buffer via VB2_MEMORY_DMABUF, then it gets
> around the issue of "how big is the biggest compressed frame in this
> stream that I've never seen before?". Should you get a new frame that
> is bigger than you predicted, then allocate a new dmabuf that is
> bigger and pass that in instead.
> 
> Thanks
>   Dave
> 
> On Fri, 16 Oct 2020 at 15:48, Dave Stevenson
> <dave.stevenson@raspberrypi.com> wrote:
>>
>> Hi Laurent
>>
>> Thanks for the reply.
>>
>> On Fri, 16 Oct 2020 at 13:29, Laurent Pinchart
>> <laurent.pinchart@ideasonboard.com> wrote:
>>>
>>> Hi Dave,
>>>
>>> On Fri, Oct 16, 2020 at 11:20:36AM +0100, Dave Stevenson wrote:
>>>> On Thu, 8 Oct 2020 at 03:00, Laurent Pinchart wrote:
>>>>>
>>>>> Hi John,
>>>>>
>>>>> Thank you for the patch.
>>>>>
>>>>> On Wed, Jun 17, 2020 at 02:21:52PM +0100, John Cox wrote:
>>>>>> Check against length in v4l2_buffer rather than vb2_buffer when the
>>>>>> buffer is a dmabuf. This makes the single plane test the same as the
>>>>>> existing multiplanar test.
>>>>>>
>>>>>> Signed-off-by: John Cox <jc@kynesim.co.uk>
>>>>>> ---
>>>>>>  drivers/media/common/videobuf2/videobuf2-v4l2.c | 3 ++-
>>>>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
>>>>>> index e652f4318284..731c7c99c971 100644
>>>>>> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
>>>>>> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
>>>>>> @@ -114,7 +114,8 @@ static int __verify_length(struct vb2_buffer *vb, const struct v4l2_buffer *b)
>>>>>>                                 return -EINVAL;
>>>>>>                 }
>>>>>>         } else {
>>>>>> -               length = (b->memory == VB2_MEMORY_USERPTR)
>>>>>> +               length = (b->memory == VB2_MEMORY_USERPTR ||
>>>>>> +                         b->memory == VB2_MEMORY_DMABUF)
>>>>>>                         ? b->length : vb->planes[0].length;
>>>>>
>>>>> I don't think this is correct, as it breaks DMABUF import. For USERPTR
>>>>> the length needs to be passed by userspace, but for DMABUF, we allow
>>>>> userspace to set length to 0, and use the length retrieved from the
>>>>> dma_buf. With this change, b->length is 0, and the check fails.
>>>>
>>>> I've just been discussing this with John  - he contracts for Raspberry
>>>> Pi for the HEVC stateless decoder amongst other things, which is why
>>>> this patch was created in the first place.
>>>>
>>>> I can't find any reference in the docs to length = 0 && b->memory ==
>>>> VB2_MEMORY_DMABUF being "use dmabuf size".
>>>
>>> For the single-planar API,
>>>
>>> https://linuxtv.org/downloads/v4l-dvb-apis/userspace-api/v4l/vidioc-qbuf.html
>>>
>>> "To enqueue a user pointer buffer applications set the memory field to
>>> V4L2_MEMORY_USERPTR, the m.userptr field to the address of the buffer
>>> and length to its size."
>>>
>>> There is no similar mention for V4L2_MEMORY_DMABUF.
>>>
>>> And in https://linuxtv.org/downloads/v4l-dvb-apis/userspace-api/v4l/buffer.html#c.v4l2_buffer
>>>
>>> "length         Size of the buffer (not the payload) in bytes for the
>>> single-planar API.  This is set by the driver based on the calls to
>>> ioctl VIDIOC_REQBUFS and/or ioctl VIDIOC_CREATE_BUFS."
>>>
>>> While this could be clearer, the statement in the documentation of
>>> v4l2_buffer isn't overridden by anything in the VIDIOC_QBUF
>>> documentation for V4L2_MEMORY_DMABUF. The field should thus be set by
>>> drivers, not applications.
>>
>> I know this is userspace API documentation, but the waters are further
>> muddied by it being set by videobuf2 and not the driver itself.
>>
>>>> And certainly no mention of the single planar API being different from
>>>> the multi-planar API (which it was until this patch).
>>>
>>> I don't see a mention of that either.
>>>
>>>> Reference to b->memory == VB2_MEMORY_USERPTR meaning that the
>>>> b->length is in the description for VIDIOC_QBUF[1]
>>>>
>>>> John's patch is matching Hans' original patch that did the same thing
>>>> for multi-planar [2].
>>>> From the commit text:
>>>> - in __verify_length() it would use the application-provided length value
>>>>   for USERPTR and the vb2 core length for other memory models, but it
>>>>   should have used the application-provided length as well for DMABUF.
>>>>
>>>> If you're saying that length==0 is "use the dmabuf size", then
>>>> __verify_length is wrong in both single and multi-planar usage as it
>>>> is comparing against vb->planes[X].length, not (struct dma_buf*)->size
>>>> (the dma_buf_get isn't done until __prepare_dmabuf).
>>>
>>> I think it is, and the changes break userspace :-(
>>
>> Just so I'm clear, you're agreeing that it's wrong in both cases?
>>
>> Altering both paths to ignore length fields for DMABUF under all
>> circumstances and check the dmabuf size later in __prepare_dmabuf
>> instead shouldn't change userspace behaviour at all compared to before
>> this patch. It also removes the potential for userspace in the
>> multiplanar API getting things wrong by providing a length that is
>> bigger than the underlying dmabuf, which I believe will currently go
>> undetected.
>>
>> Actually the check in __prepare_dmabuf ought to be corrected to always
>> take dbuf->size, not just if planes[N].length == 0 [1], and there
>> appear to be other places where the multi-planar API code is
>> specifically copying the plane length from the user v4l2_buffer and
>> not using the driver provided values (eg [2])
>>
>> [1] https://elixir.free-electrons.com/linux/latest/source/drivers/media/common/videobuf2/videobuf2-core.c#L1206
>> [2] https://elixir.free-electrons.com/linux/latest/source/drivers/media/common/videobuf2/videobuf2-v4l2.c#L220
>>
>>> After the lookup __prepare_dmabuf does check that planes[plane].length
>>>> < vb->planes[plane].min_length. So do both clauses in __verify_length
>>>> just need to bypass the length check if length = 0 && b->memory ==
>>>> VB2_MEMORY_DMABUF ?
>>>>
>>>> I note we already have mismatched handling in libcamera in that
>>>> multiplanar DMABUF sets length for each plane, but single planar
>>>> DMABUF doesn't set buf.length [3]
>>>>
>>>> For info, the use case all comes down to the old chestnut of "how big
>>>> is a compressed frame?".
>>>> Feeding encoded bitstream into the HEVC decoder using
>>>> VB2_MEMORY_DMABUF, the size of the buffer against the format sizeimage
>>>> doesn't matter. The only conditions are that the buffer description is
>>>> valid (ie bytesused <= actual buffer size) and the hardware can map
>>>> it. If you're using dmaheaps or similar to allocate the buffers
>>>> externally and an unexpectedly large compressed frame comes through,
>>>> reallocate through dmaheaps and pass it in.
>>>> The same argument is true for USERPTR, and that's already accounted
>>>> for by relying on the application provided length.
>>>
>>> The key difference between DMABUF and USERPTR is that the kernel can
>>> figure out the allocated buffer length internally in the first case, but
>>> not the second case. I'm not sure to understand the use case for passing
>>> a different length from userspace to the kernel.
>>
>> The use case is a different length between that which videobuf2
>> believes is correct, and the actual size of the dmabuf.
>>
>> The situation is feeding in encoded bitstream to a decoder via the OUTPUT queue.
>> - Make a first guess that the buffers need to be 512kB each
>> - Use an external allocator (eg dmaheaps) to create those buffers
>> - Feed them in via VIDIOC_QBUF of type V4L2_MEMORY_DMABUF.
>> - Decode a load of frames and come across one that is >512kB.
>> Either you:
>> - have to tear everything down and resume from a suitable point in the past
>> or
>> - allocate a bigger buffer with the external allocator and pass that
>> in via a new dmabuf handle.
>>
>> Some drivers won't be able to handle a bigger buffer as they may pass
>> the bitstream via other internal buffers that are now too small,
>> however they have all the information to know that and bail out. John
>> created the patch (a) to match multi-planar, and (b) because videobuf2
>> was blocking it due to checking the length against an arbitrary
>> internal value rather than the actual dmabuf size. At least after the
>> patch you could convey the correct length.
>> Shifting to always taking the dmabuf length from the dma buf framework
>> still allows the above to work without breaking your length==0 path
>> (which now becomes the only path).
>>
>> Is it API abuse? Possibly, but the details in the spec are a little
>> sketchy about what is and isn't permitted (and I know most of us hate
>> having to write documentation).
>>
>> I guess the follow up becomes, if using DMABUF with differently sized
>> buffers to that which videobuf2 believes in, and then set bytesuesd =
>> 0 (which is documented to mean take the buffer size), do we go through
>> the right paths to get the buffer size based on the correct thing?
>>
>> I wonder what Hans' view is here.
>>
>> Cheers,
>>   Dave
>>
>>>> [1] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/vidioc-qbuf.html#vidioc-qbuf
>>>> [2] https://github.com/torvalds/linux/commit/8a75ffb81
>>>> [3] https://git.linuxtv.org/libcamera.git/tree/src/libcamera/v4l2_videodevice.cpp#n1385
>>>>
>>>>>>
>>>>>>                 if (b->bytesused > length)
>>>
>>> --
>>> Regards,
>>>
>>> Laurent Pinchart

