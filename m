Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAFE4290509
	for <lists+linux-media@lfdr.de>; Fri, 16 Oct 2020 14:29:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407533AbgJPM3P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Oct 2020 08:29:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405601AbgJPM3O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Oct 2020 08:29:14 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E004C061755
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2020 05:29:14 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 65986528;
        Fri, 16 Oct 2020 14:29:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1602851352;
        bh=6TrR4nUuaaHMY1b69MXXSZDuu0mo6XiM3YPcxJRvHbA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uNWDtUqUFLmMpQh7qr8dTYS+/ZGkKlkbIBXCwy17umcDg1sCSrdAGcO7x3P3I6yXm
         32zjCpMQnQMN3SJzqVO89Bz8WHwzGoychBn27qUHWvETpULTu0ZEtVVq0SjPPi/MUG
         Pl7ZMQYTRDKkRzeWEJLd3hkmcFhw8JS57NenGiq8=
Date:   Fri, 16 Oct 2020 15:28:25 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     John Cox <jc@kynesim.co.uk>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH] media: videobuf2: Fix length check for single plane
 dmabuf queueing
Message-ID: <20201016122825.GL3829@pendragon.ideasonboard.com>
References: <gh5kef5bkeel3o6b2dkgc2dfagu9klj4c0@4ax.com>
 <20201008015953.GA28158@pendragon.ideasonboard.com>
 <CAPY8ntA15jA_AViccQqK=4U_SW6snuBD=B1Km0ZvqEpf3ReBZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntA15jA_AViccQqK=4U_SW6snuBD=B1Km0ZvqEpf3ReBZQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On Fri, Oct 16, 2020 at 11:20:36AM +0100, Dave Stevenson wrote:
> On Thu, 8 Oct 2020 at 03:00, Laurent Pinchart wrote:
> >
> > Hi John,
> >
> > Thank you for the patch.
> >
> > On Wed, Jun 17, 2020 at 02:21:52PM +0100, John Cox wrote:
> > > Check against length in v4l2_buffer rather than vb2_buffer when the
> > > buffer is a dmabuf. This makes the single plane test the same as the
> > > existing multiplanar test.
> > >
> > > Signed-off-by: John Cox <jc@kynesim.co.uk>
> > > ---
> > >  drivers/media/common/videobuf2/videobuf2-v4l2.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> > > index e652f4318284..731c7c99c971 100644
> > > --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> > > +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> > > @@ -114,7 +114,8 @@ static int __verify_length(struct vb2_buffer *vb, const struct v4l2_buffer *b)
> > >                                 return -EINVAL;
> > >                 }
> > >         } else {
> > > -               length = (b->memory == VB2_MEMORY_USERPTR)
> > > +               length = (b->memory == VB2_MEMORY_USERPTR ||
> > > +                         b->memory == VB2_MEMORY_DMABUF)
> > >                         ? b->length : vb->planes[0].length;
> >
> > I don't think this is correct, as it breaks DMABUF import. For USERPTR
> > the length needs to be passed by userspace, but for DMABUF, we allow
> > userspace to set length to 0, and use the length retrieved from the
> > dma_buf. With this change, b->length is 0, and the check fails.
> 
> I've just been discussing this with John  - he contracts for Raspberry
> Pi for the HEVC stateless decoder amongst other things, which is why
> this patch was created in the first place.
> 
> I can't find any reference in the docs to length = 0 && b->memory ==
> VB2_MEMORY_DMABUF being "use dmabuf size".

For the single-planar API,

https://linuxtv.org/downloads/v4l-dvb-apis/userspace-api/v4l/vidioc-qbuf.html

"To enqueue a user pointer buffer applications set the memory field to
V4L2_MEMORY_USERPTR, the m.userptr field to the address of the buffer
and length to its size."

There is no similar mention for V4L2_MEMORY_DMABUF.

And in https://linuxtv.org/downloads/v4l-dvb-apis/userspace-api/v4l/buffer.html#c.v4l2_buffer

"length		Size of the buffer (not the payload) in bytes for the
single-planar API.  This is set by the driver based on the calls to
ioctl VIDIOC_REQBUFS and/or ioctl VIDIOC_CREATE_BUFS."

While this could be clearer, the statement in the documentation of
v4l2_buffer isn't overridden by anything in the VIDIOC_QBUF
documentation for V4L2_MEMORY_DMABUF. The field should thus be set by
drivers, not applications.

> And certainly no mention of the single planar API being different from
> the multi-planar API (which it was until this patch).

I don't see a mention of that either.

> Reference to b->memory == VB2_MEMORY_USERPTR meaning that the
> b->length is in the description for VIDIOC_QBUF[1]
> 
> John's patch is matching Hans' original patch that did the same thing
> for multi-planar [2].
> From the commit text:
> - in __verify_length() it would use the application-provided length value
>   for USERPTR and the vb2 core length for other memory models, but it
>   should have used the application-provided length as well for DMABUF.
> 
> If you're saying that length==0 is "use the dmabuf size", then
> __verify_length is wrong in both single and multi-planar usage as it
> is comparing against vb->planes[X].length, not (struct dma_buf*)->size
> (the dma_buf_get isn't done until __prepare_dmabuf).

I think it is, and the changes break userspace :-(

> After the lookup __prepare_dmabuf does check that planes[plane].length
> < vb->planes[plane].min_length. So do both clauses in __verify_length
> just need to bypass the length check if length = 0 && b->memory ==
> VB2_MEMORY_DMABUF ?
> 
> I note we already have mismatched handling in libcamera in that
> multiplanar DMABUF sets length for each plane, but single planar
> DMABUF doesn't set buf.length [3]
> 
> For info, the use case all comes down to the old chestnut of "how big
> is a compressed frame?".
> Feeding encoded bitstream into the HEVC decoder using
> VB2_MEMORY_DMABUF, the size of the buffer against the format sizeimage
> doesn't matter. The only conditions are that the buffer description is
> valid (ie bytesused <= actual buffer size) and the hardware can map
> it. If you're using dmaheaps or similar to allocate the buffers
> externally and an unexpectedly large compressed frame comes through,
> reallocate through dmaheaps and pass it in.
> The same argument is true for USERPTR, and that's already accounted
> for by relying on the application provided length.

The key difference between DMABUF and USERPTR is that the kernel can
figure out the allocated buffer length internally in the first case, but
not the second case. I'm not sure to understand the use case for passing
a different length from userspace to the kernel.

> [1] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/vidioc-qbuf.html#vidioc-qbuf
> [2] https://github.com/torvalds/linux/commit/8a75ffb81
> [3] https://git.linuxtv.org/libcamera.git/tree/src/libcamera/v4l2_videodevice.cpp#n1385
> 
> > >
> > >                 if (b->bytesused > length)

-- 
Regards,

Laurent Pinchart
