Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23E5F29FB9C
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 03:48:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725922AbgJ3Csj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Oct 2020 22:48:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbgJ3Csh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Oct 2020 22:48:37 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 342FBC0613CF
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2020 19:48:37 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 236499B7;
        Fri, 30 Oct 2020 03:48:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1604026113;
        bh=MjQiAmHU/x8EMkPhdO5TwAiMD5+GiVkv5BqsIt8Q3nM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ItZLu/F6yefRd2MlhktWBgDWoFVkNwE2XdZBlfAaAzQl344t73vF2V6dYtP+kniaB
         grO0uAEyWKY/2snpu38jZxvUAlNUJ967NdIuZGVOc3TNg1WJbgzsCJhxp995K6LXS3
         ItDKNOfldj+96u5HePeunsxTL1GN7mfc4xrLKLic=
Date:   Fri, 30 Oct 2020 04:47:44 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        John Cox <jc@kynesim.co.uk>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH] media: videobuf2: Fix length check for single plane
 dmabuf queueing
Message-ID: <20201030024744.GS15024@pendragon.ideasonboard.com>
References: <gh5kef5bkeel3o6b2dkgc2dfagu9klj4c0@4ax.com>
 <20201008015953.GA28158@pendragon.ideasonboard.com>
 <CAPY8ntA15jA_AViccQqK=4U_SW6snuBD=B1Km0ZvqEpf3ReBZQ@mail.gmail.com>
 <20201016122825.GL3829@pendragon.ideasonboard.com>
 <CAPY8ntAG0XijBb_+41N-tBM8SGM0T061jG2xghaR9SLROKKD=g@mail.gmail.com>
 <CAPY8ntBReryd+gD4YLn=Us5QrbRob5u8JrFvBHK2ca=iABOZBQ@mail.gmail.com>
 <010b4457-6816-9571-1e10-c82b277ea77c@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <010b4457-6816-9571-1e10-c82b277ea77c@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Thu, Oct 29, 2020 at 02:15:24PM +0100, Hans Verkuil wrote:
> Hi Dave,
> 
> My apologies for the delay, I've been very busy in the past 3 weeks.

But thank you for finally replying :-)

> On 29/10/2020 11:00, Dave Stevenson wrote:
> > Gentle ping to Hans for his view.
> > 
> > Quick summary:
> > For VB2_MEMORY_DMABUF single planar and multi planar APIs differed in
> > behaviour as to whether userspace had to provide the length of the
> > dmabuf or not. (Multi-planar it did, single planar it didn't). This
> > patch made them both the same - userspace had to provide the length.
> > Laurent has stated that the old behaviour for single planar was that
> > length = 0  is "take the length of the underlying dmabuf", so we have
> > a regression. It appears undocumented that multi-planar requires the
> > length. All docs appear to say that the driver fills in this field
> > (except in USERPTR mode). vb2_fill_vb2_v4l2_buffer specifically takes
> > the user provided length field in VB2_MEMORY_DMABUF.
> 
> I'm not sure this analysis is correct.
> 
> Without this patch __verify_length() uses vb->planes[0].length as
> the length to compare bytesused to. This is the length as provided
> by the driver's queue_setup() op.
> 
> With this patch it uses the userspace provided b->length.
> 
> And indeed, this is a regression for the single planar API since the
> kernel now expects that length is always set to something valid.

Don't we also have an issue with the multi-planar API ? My understanding
of the specification is that we don't mandate length to be set by
userspace for DMABUF buffers, neither in the single-planar nor in the
multi-planar case. I think treating both cases the same way is best, as
it can otherwise cause confusion. If you think there are good reasons to
make providing length by userspace mandatory for multi-planar buffers,
then we should update the API specification.

> But b->length is the value that's copied to planes[0].length in
> vb2_fill_vb2_v4l2_buffer() and that in turn is used by __prepare_dmabuf().
> And yes, the flow of data is confusing, I had to look at this for some time
> to figure it out...

I can't disagree :-)

> In __prepare_dmabuf() you see this code:
> 
>                 /* use DMABUF size if length is not provided */
>                 if (planes[plane].length == 0)
>                         planes[plane].length = dbuf->size;
> 
> So the problem is really in __verify_length() which is not testing against
> the right length value. I'd be inclined to just drop the length checks
> altogether for DMABUF in that function and leave it to __prepare_dmabuf.

I think that's the only feasible option, as when __verify_length() is
called we haven't acquired the dmabuf yet. We however then need to audit
the code path between __verify_length() and __prepare_dmabuf() to make
sure nothing incorrectly relies on the unvalidated bytesused and
data_offset.

> There you know the dmabuf size and you can do the correct check.
> 
> > Question: Why are we not using dmabuf size instead of user provided
> > length for both APIs under all conditions? Userspace doesn't need to
> > provide the length as that is available from the dmabuf, and the main
> > check ought to be that the bytesused is big enough against the
> > underlying dmabuf, not the length that vb2 has.
> 
> I'm not sure if that wouldn't cause regressions somehow. Using length == 0
> as an indicator to use the dmabuf size certainly makes sense, but if the
> length is given explicitly, then perhaps that should be kept. That said,
> just always using the dmabuf size would simplify matters quite a bit.
> 
> I'm leaning towards always using the dmabuf size.

I can imagine cases where userspace would use a large dmabuf, but would
want the kernel to not exceed a certain length. This is probably mostly
relevant for compressed formats when userspace can't necessarily know
the upper boundary of the data written by the hardware in advance. There
could also be other use cases I can't think about now, that would cause
a regression somehow.

> > Scenario:
> > Allocate a dmabuf (eg using dmaheaps) that is smaller than V4L2 has asked for.
> > QBUF with VB2_MEMORY_DMABUF, length >= V4L2's requested size,
> > bytesused = length (ie more used than the dmabuf can take).
> > 
> > I don't believe any of the validation currently catches that. It
> > nearly does in __prepare_dmabuf with planes[plane].length <
> > vb->planes[plane].min_length, but in this scenario
> > planes[plane].length is incorrectly high.
> 
> It's caught in the attach_dmabuf op. But I think it would be much better
> if that check is moved up from the three attach_dmabuf implementations into
> __prepare_dmabuf.
> 
> So, I think this should happen to solve this:
> 
> 1) Drop the length checks for DMABUF in __verify_length()
> 2) Drop 'if (planes[plane].length == 0)' in __prepare_dmabuf
>    This is tentative, if this can cause regressions then we shouldn't do this.
> 3) Add a 'if (planes[plane].bytesused > planes[plane].length)' check to __prepare_dmabuf,
>    since this check no longer happens in __verify_length.
> 4) Move the dbuf->size check from the three memops implementations of
>    the attach_dmabuf op into __prepare_dmabuf. Optional, but I think it is
>    a good cleanup.
> 5) Update the documentation.
> 
> This would be for 5.11, for older kernels I think the original patch
> should just be reverted to fix the regression. Unless someone can come
> up with a minimal patch fixing this.

I don't think it can be minimal, so a revert for v5.10 and older seems
best to me. We also need to decide if the multi-planar case needs to be
fixed too.

John or Dave, would you like to send a revert patch, or should I do so ?

> > The driver gets passed a buffer that is likely only partially mapped,
> > and hardware may access memory it shouldn't.
> > 
> > 
> > The use case that triggered this is for decoding compressed
> > bitstreams, therefore the size of the buffer doesn't need to match any
> > value that V4L2 and vb2 thinks of, as long as the size of the
> > underlying dmabuf is larger than bytesused. If the driver underneath
> > can accept any length buffer via VB2_MEMORY_DMABUF, then it gets
> > around the issue of "how big is the biggest compressed frame in this
> > stream that I've never seen before?". Should you get a new frame that
> > is bigger than you predicted, then allocate a new dmabuf that is
> > bigger and pass that in instead.
> > 
> > On Fri, 16 Oct 2020 at 15:48, Dave Stevenson wrote:
> >> On Fri, 16 Oct 2020 at 13:29, Laurent Pinchart wrote:
> >>> On Fri, Oct 16, 2020 at 11:20:36AM +0100, Dave Stevenson wrote:
> >>>> On Thu, 8 Oct 2020 at 03:00, Laurent Pinchart wrote:
> >>>>>
> >>>>> Hi John,
> >>>>>
> >>>>> Thank you for the patch.
> >>>>>
> >>>>> On Wed, Jun 17, 2020 at 02:21:52PM +0100, John Cox wrote:
> >>>>>> Check against length in v4l2_buffer rather than vb2_buffer when the
> >>>>>> buffer is a dmabuf. This makes the single plane test the same as the
> >>>>>> existing multiplanar test.
> >>>>>>
> >>>>>> Signed-off-by: John Cox <jc@kynesim.co.uk>
> >>>>>> ---
> >>>>>>  drivers/media/common/videobuf2/videobuf2-v4l2.c | 3 ++-
> >>>>>>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>>>>>
> >>>>>> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> >>>>>> index e652f4318284..731c7c99c971 100644
> >>>>>> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> >>>>>> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> >>>>>> @@ -114,7 +114,8 @@ static int __verify_length(struct vb2_buffer *vb, const struct v4l2_buffer *b)
> >>>>>>                                 return -EINVAL;
> >>>>>>                 }
> >>>>>>         } else {
> >>>>>> -               length = (b->memory == VB2_MEMORY_USERPTR)
> >>>>>> +               length = (b->memory == VB2_MEMORY_USERPTR ||
> >>>>>> +                         b->memory == VB2_MEMORY_DMABUF)
> >>>>>>                         ? b->length : vb->planes[0].length;
> >>>>>
> >>>>> I don't think this is correct, as it breaks DMABUF import. For USERPTR
> >>>>> the length needs to be passed by userspace, but for DMABUF, we allow
> >>>>> userspace to set length to 0, and use the length retrieved from the
> >>>>> dma_buf. With this change, b->length is 0, and the check fails.
> >>>>
> >>>> I've just been discussing this with John  - he contracts for Raspberry
> >>>> Pi for the HEVC stateless decoder amongst other things, which is why
> >>>> this patch was created in the first place.
> >>>>
> >>>> I can't find any reference in the docs to length = 0 && b->memory ==
> >>>> VB2_MEMORY_DMABUF being "use dmabuf size".
> >>>
> >>> For the single-planar API,
> >>>
> >>> https://linuxtv.org/downloads/v4l-dvb-apis/userspace-api/v4l/vidioc-qbuf.html
> >>>
> >>> "To enqueue a user pointer buffer applications set the memory field to
> >>> V4L2_MEMORY_USERPTR, the m.userptr field to the address of the buffer
> >>> and length to its size."
> >>>
> >>> There is no similar mention for V4L2_MEMORY_DMABUF.
> >>>
> >>> And in https://linuxtv.org/downloads/v4l-dvb-apis/userspace-api/v4l/buffer.html#c.v4l2_buffer
> >>>
> >>> "length         Size of the buffer (not the payload) in bytes for the
> >>> single-planar API.  This is set by the driver based on the calls to
> >>> ioctl VIDIOC_REQBUFS and/or ioctl VIDIOC_CREATE_BUFS."
> >>>
> >>> While this could be clearer, the statement in the documentation of
> >>> v4l2_buffer isn't overridden by anything in the VIDIOC_QBUF
> >>> documentation for V4L2_MEMORY_DMABUF. The field should thus be set by
> >>> drivers, not applications.
> >>
> >> I know this is userspace API documentation, but the waters are further
> >> muddied by it being set by videobuf2 and not the driver itself.
> >>
> >>>> And certainly no mention of the single planar API being different from
> >>>> the multi-planar API (which it was until this patch).
> >>>
> >>> I don't see a mention of that either.
> >>>
> >>>> Reference to b->memory == VB2_MEMORY_USERPTR meaning that the
> >>>> b->length is in the description for VIDIOC_QBUF[1]
> >>>>
> >>>> John's patch is matching Hans' original patch that did the same thing
> >>>> for multi-planar [2].
> >>>> From the commit text:
> >>>> - in __verify_length() it would use the application-provided length value
> >>>>   for USERPTR and the vb2 core length for other memory models, but it
> >>>>   should have used the application-provided length as well for DMABUF.
> >>>>
> >>>> If you're saying that length==0 is "use the dmabuf size", then
> >>>> __verify_length is wrong in both single and multi-planar usage as it
> >>>> is comparing against vb->planes[X].length, not (struct dma_buf*)->size
> >>>> (the dma_buf_get isn't done until __prepare_dmabuf).
> >>>
> >>> I think it is, and the changes break userspace :-(
> >>
> >> Just so I'm clear, you're agreeing that it's wrong in both cases?
> >>
> >> Altering both paths to ignore length fields for DMABUF under all
> >> circumstances and check the dmabuf size later in __prepare_dmabuf
> >> instead shouldn't change userspace behaviour at all compared to before
> >> this patch. It also removes the potential for userspace in the
> >> multiplanar API getting things wrong by providing a length that is
> >> bigger than the underlying dmabuf, which I believe will currently go
> >> undetected.
> >>
> >> Actually the check in __prepare_dmabuf ought to be corrected to always
> >> take dbuf->size, not just if planes[N].length == 0 [1], and there
> >> appear to be other places where the multi-planar API code is
> >> specifically copying the plane length from the user v4l2_buffer and
> >> not using the driver provided values (eg [2])
> >>
> >> [1] https://elixir.free-electrons.com/linux/latest/source/drivers/media/common/videobuf2/videobuf2-core.c#L1206
> >> [2] https://elixir.free-electrons.com/linux/latest/source/drivers/media/common/videobuf2/videobuf2-v4l2.c#L220
> >>
> >>> After the lookup __prepare_dmabuf does check that planes[plane].length
> >>>> < vb->planes[plane].min_length. So do both clauses in __verify_length
> >>>> just need to bypass the length check if length = 0 && b->memory ==
> >>>> VB2_MEMORY_DMABUF ?
> >>>>
> >>>> I note we already have mismatched handling in libcamera in that
> >>>> multiplanar DMABUF sets length for each plane, but single planar
> >>>> DMABUF doesn't set buf.length [3]
> >>>>
> >>>> For info, the use case all comes down to the old chestnut of "how big
> >>>> is a compressed frame?".
> >>>> Feeding encoded bitstream into the HEVC decoder using
> >>>> VB2_MEMORY_DMABUF, the size of the buffer against the format sizeimage
> >>>> doesn't matter. The only conditions are that the buffer description is
> >>>> valid (ie bytesused <= actual buffer size) and the hardware can map
> >>>> it. If you're using dmaheaps or similar to allocate the buffers
> >>>> externally and an unexpectedly large compressed frame comes through,
> >>>> reallocate through dmaheaps and pass it in.
> >>>> The same argument is true for USERPTR, and that's already accounted
> >>>> for by relying on the application provided length.
> >>>
> >>> The key difference between DMABUF and USERPTR is that the kernel can
> >>> figure out the allocated buffer length internally in the first case, but
> >>> not the second case. I'm not sure to understand the use case for passing
> >>> a different length from userspace to the kernel.
> >>
> >> The use case is a different length between that which videobuf2
> >> believes is correct, and the actual size of the dmabuf.
> >>
> >> The situation is feeding in encoded bitstream to a decoder via the OUTPUT queue.
> >> - Make a first guess that the buffers need to be 512kB each
> >> - Use an external allocator (eg dmaheaps) to create those buffers
> >> - Feed them in via VIDIOC_QBUF of type V4L2_MEMORY_DMABUF.
> >> - Decode a load of frames and come across one that is >512kB.
> >> Either you:
> >> - have to tear everything down and resume from a suitable point in the past
> >> or
> >> - allocate a bigger buffer with the external allocator and pass that
> >> in via a new dmabuf handle.
> >>
> >> Some drivers won't be able to handle a bigger buffer as they may pass
> >> the bitstream via other internal buffers that are now too small,
> >> however they have all the information to know that and bail out. John
> >> created the patch (a) to match multi-planar, and (b) because videobuf2
> >> was blocking it due to checking the length against an arbitrary
> >> internal value rather than the actual dmabuf size. At least after the
> >> patch you could convey the correct length.
> >> Shifting to always taking the dmabuf length from the dma buf framework
> >> still allows the above to work without breaking your length==0 path
> >> (which now becomes the only path).
> >>
> >> Is it API abuse? Possibly, but the details in the spec are a little
> >> sketchy about what is and isn't permitted (and I know most of us hate
> >> having to write documentation).
> >>
> >> I guess the follow up becomes, if using DMABUF with differently sized
> >> buffers to that which videobuf2 believes in, and then set bytesuesd =
> >> 0 (which is documented to mean take the buffer size), do we go through
> >> the right paths to get the buffer size based on the correct thing?
> >>
> >> I wonder what Hans' view is here.
> >>
> >>>> [1] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/vidioc-qbuf.html#vidioc-qbuf
> >>>> [2] https://github.com/torvalds/linux/commit/8a75ffb81
> >>>> [3] https://git.linuxtv.org/libcamera.git/tree/src/libcamera/v4l2_videodevice.cpp#n1385
> >>>>
> >>>>>>
> >>>>>>                 if (b->bytesused > length)
> 

-- 
Regards,

Laurent Pinchart
