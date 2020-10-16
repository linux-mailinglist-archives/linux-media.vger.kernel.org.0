Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC50B2907B1
	for <lists+linux-media@lfdr.de>; Fri, 16 Oct 2020 16:48:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405432AbgJPOsk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Oct 2020 10:48:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405029AbgJPOsk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Oct 2020 10:48:40 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10827C061755
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2020 07:48:39 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id f21so2728807wml.3
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2020 07:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YZSSGuh58yYFXAQl6h5pqhg0vbtUCuGagVGAsIoU+j8=;
        b=gFWhTwE+tWJcvqJLx7I1XBNUGsMB0rNka3V2Yc5STCU74JzwcJDrXC7rnQkEF0eIp8
         w9R0BsCqKb7w764i3Fgr6BrbnT6TI8k5m1aNyHi6V8JOoQ52xCo9lql4JBPwDsaJTAV3
         aUYkHtZCTFk65SLL+BKmzBG7T14rbPbpKR/mDeMnhVY64AZ7awjpwO1JiwDoVT/tuYrq
         x08pGJBND91AQVh/HdLbqEVbWO9XrmymMo7wEMLtPo00iFfW6bjKzin4fTCN4FOpB1lt
         r8z1nETeTwr0S6j2egs/Xpaz2rs1kz9MdKE420aiIwAR/0Sa6GhTnsBMlei+d3o1AUQ2
         HVwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YZSSGuh58yYFXAQl6h5pqhg0vbtUCuGagVGAsIoU+j8=;
        b=PJ7FWF1I0DdH6uN9LlAAwP34ix/y2s7tzZQvMN6i4GU1olcVH/mXb5I2SzSVsKLFpD
         wOXiaaNG+7fUEgo9LarsFaOJyPwm0eyTpZyeBkY7C67q4e2qmyKNtw63ANv2nZrc7meV
         NBG7fiRA0allIhmKWXdXpUacM5iEqZu8nyuaR77Z3lz/zgLzDijNkqRh64JOAdjdUYaD
         4L9/wbSCJlUudSJ4oNksjyFZCpJsW8LDNIjSFvVDLouRTrIABdA57OecpqRR5NKET/xj
         26AGUSRryCmVnlPpXbJ+aRNu6+okpNyzN9rykyP6ffA/FVDd0+YFeOvyrBZLXh7bTaRM
         reCQ==
X-Gm-Message-State: AOAM532eSutbFmk8aYKMiQmnbXylWolvzZVsuQlHw3+ryuZPJ05V3JIC
        u2tZUEhLURd94PU5svJZlG6mlOqx32IrVipywVxRqw==
X-Google-Smtp-Source: ABdhPJxzKOouK7AvIHAnvw3P4Dm8KN1hazTChgk+gcL6U5ty8lioOqIOFhZiwca5PhUZ3aaNgyghNyRYm5fhszHdkrM=
X-Received: by 2002:a1c:9a10:: with SMTP id c16mr3960105wme.96.1602859717641;
 Fri, 16 Oct 2020 07:48:37 -0700 (PDT)
MIME-Version: 1.0
References: <gh5kef5bkeel3o6b2dkgc2dfagu9klj4c0@4ax.com> <20201008015953.GA28158@pendragon.ideasonboard.com>
 <CAPY8ntA15jA_AViccQqK=4U_SW6snuBD=B1Km0ZvqEpf3ReBZQ@mail.gmail.com> <20201016122825.GL3829@pendragon.ideasonboard.com>
In-Reply-To: <20201016122825.GL3829@pendragon.ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Fri, 16 Oct 2020 15:48:19 +0100
Message-ID: <CAPY8ntAG0XijBb_+41N-tBM8SGM0T061jG2xghaR9SLROKKD=g@mail.gmail.com>
Subject: Re: [PATCH] media: videobuf2: Fix length check for single plane
 dmabuf queueing
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     John Cox <jc@kynesim.co.uk>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

Thanks for the reply.

On Fri, 16 Oct 2020 at 13:29, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Dave,
>
> On Fri, Oct 16, 2020 at 11:20:36AM +0100, Dave Stevenson wrote:
> > On Thu, 8 Oct 2020 at 03:00, Laurent Pinchart wrote:
> > >
> > > Hi John,
> > >
> > > Thank you for the patch.
> > >
> > > On Wed, Jun 17, 2020 at 02:21:52PM +0100, John Cox wrote:
> > > > Check against length in v4l2_buffer rather than vb2_buffer when the
> > > > buffer is a dmabuf. This makes the single plane test the same as the
> > > > existing multiplanar test.
> > > >
> > > > Signed-off-by: John Cox <jc@kynesim.co.uk>
> > > > ---
> > > >  drivers/media/common/videobuf2/videobuf2-v4l2.c | 3 ++-
> > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> > > > index e652f4318284..731c7c99c971 100644
> > > > --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> > > > +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> > > > @@ -114,7 +114,8 @@ static int __verify_length(struct vb2_buffer *vb, const struct v4l2_buffer *b)
> > > >                                 return -EINVAL;
> > > >                 }
> > > >         } else {
> > > > -               length = (b->memory == VB2_MEMORY_USERPTR)
> > > > +               length = (b->memory == VB2_MEMORY_USERPTR ||
> > > > +                         b->memory == VB2_MEMORY_DMABUF)
> > > >                         ? b->length : vb->planes[0].length;
> > >
> > > I don't think this is correct, as it breaks DMABUF import. For USERPTR
> > > the length needs to be passed by userspace, but for DMABUF, we allow
> > > userspace to set length to 0, and use the length retrieved from the
> > > dma_buf. With this change, b->length is 0, and the check fails.
> >
> > I've just been discussing this with John  - he contracts for Raspberry
> > Pi for the HEVC stateless decoder amongst other things, which is why
> > this patch was created in the first place.
> >
> > I can't find any reference in the docs to length = 0 && b->memory ==
> > VB2_MEMORY_DMABUF being "use dmabuf size".
>
> For the single-planar API,
>
> https://linuxtv.org/downloads/v4l-dvb-apis/userspace-api/v4l/vidioc-qbuf.html
>
> "To enqueue a user pointer buffer applications set the memory field to
> V4L2_MEMORY_USERPTR, the m.userptr field to the address of the buffer
> and length to its size."
>
> There is no similar mention for V4L2_MEMORY_DMABUF.
>
> And in https://linuxtv.org/downloads/v4l-dvb-apis/userspace-api/v4l/buffer.html#c.v4l2_buffer
>
> "length         Size of the buffer (not the payload) in bytes for the
> single-planar API.  This is set by the driver based on the calls to
> ioctl VIDIOC_REQBUFS and/or ioctl VIDIOC_CREATE_BUFS."
>
> While this could be clearer, the statement in the documentation of
> v4l2_buffer isn't overridden by anything in the VIDIOC_QBUF
> documentation for V4L2_MEMORY_DMABUF. The field should thus be set by
> drivers, not applications.

I know this is userspace API documentation, but the waters are further
muddied by it being set by videobuf2 and not the driver itself.

> > And certainly no mention of the single planar API being different from
> > the multi-planar API (which it was until this patch).
>
> I don't see a mention of that either.
>
> > Reference to b->memory == VB2_MEMORY_USERPTR meaning that the
> > b->length is in the description for VIDIOC_QBUF[1]
> >
> > John's patch is matching Hans' original patch that did the same thing
> > for multi-planar [2].
> > From the commit text:
> > - in __verify_length() it would use the application-provided length value
> >   for USERPTR and the vb2 core length for other memory models, but it
> >   should have used the application-provided length as well for DMABUF.
> >
> > If you're saying that length==0 is "use the dmabuf size", then
> > __verify_length is wrong in both single and multi-planar usage as it
> > is comparing against vb->planes[X].length, not (struct dma_buf*)->size
> > (the dma_buf_get isn't done until __prepare_dmabuf).
>
> I think it is, and the changes break userspace :-(

Just so I'm clear, you're agreeing that it's wrong in both cases?

Altering both paths to ignore length fields for DMABUF under all
circumstances and check the dmabuf size later in __prepare_dmabuf
instead shouldn't change userspace behaviour at all compared to before
this patch. It also removes the potential for userspace in the
multiplanar API getting things wrong by providing a length that is
bigger than the underlying dmabuf, which I believe will currently go
undetected.

Actually the check in __prepare_dmabuf ought to be corrected to always
take dbuf->size, not just if planes[N].length == 0 [1], and there
appear to be other places where the multi-planar API code is
specifically copying the plane length from the user v4l2_buffer and
not using the driver provided values (eg [2])

[1] https://elixir.free-electrons.com/linux/latest/source/drivers/media/common/videobuf2/videobuf2-core.c#L1206
[2] https://elixir.free-electrons.com/linux/latest/source/drivers/media/common/videobuf2/videobuf2-v4l2.c#L220

> After the lookup __prepare_dmabuf does check that planes[plane].length
> > < vb->planes[plane].min_length. So do both clauses in __verify_length
> > just need to bypass the length check if length = 0 && b->memory ==
> > VB2_MEMORY_DMABUF ?
> >
> > I note we already have mismatched handling in libcamera in that
> > multiplanar DMABUF sets length for each plane, but single planar
> > DMABUF doesn't set buf.length [3]
> >
> > For info, the use case all comes down to the old chestnut of "how big
> > is a compressed frame?".
> > Feeding encoded bitstream into the HEVC decoder using
> > VB2_MEMORY_DMABUF, the size of the buffer against the format sizeimage
> > doesn't matter. The only conditions are that the buffer description is
> > valid (ie bytesused <= actual buffer size) and the hardware can map
> > it. If you're using dmaheaps or similar to allocate the buffers
> > externally and an unexpectedly large compressed frame comes through,
> > reallocate through dmaheaps and pass it in.
> > The same argument is true for USERPTR, and that's already accounted
> > for by relying on the application provided length.
>
> The key difference between DMABUF and USERPTR is that the kernel can
> figure out the allocated buffer length internally in the first case, but
> not the second case. I'm not sure to understand the use case for passing
> a different length from userspace to the kernel.

The use case is a different length between that which videobuf2
believes is correct, and the actual size of the dmabuf.

The situation is feeding in encoded bitstream to a decoder via the OUTPUT queue.
- Make a first guess that the buffers need to be 512kB each
- Use an external allocator (eg dmaheaps) to create those buffers
- Feed them in via VIDIOC_QBUF of type V4L2_MEMORY_DMABUF.
- Decode a load of frames and come across one that is >512kB.
Either you:
- have to tear everything down and resume from a suitable point in the past
or
- allocate a bigger buffer with the external allocator and pass that
in via a new dmabuf handle.

Some drivers won't be able to handle a bigger buffer as they may pass
the bitstream via other internal buffers that are now too small,
however they have all the information to know that and bail out. John
created the patch (a) to match multi-planar, and (b) because videobuf2
was blocking it due to checking the length against an arbitrary
internal value rather than the actual dmabuf size. At least after the
patch you could convey the correct length.
Shifting to always taking the dmabuf length from the dma buf framework
still allows the above to work without breaking your length==0 path
(which now becomes the only path).

Is it API abuse? Possibly, but the details in the spec are a little
sketchy about what is and isn't permitted (and I know most of us hate
having to write documentation).

I guess the follow up becomes, if using DMABUF with differently sized
buffers to that which videobuf2 believes in, and then set bytesuesd =
0 (which is documented to mean take the buffer size), do we go through
the right paths to get the buffer size based on the correct thing?

I wonder what Hans' view is here.

Cheers,
  Dave

> > [1] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/vidioc-qbuf.html#vidioc-qbuf
> > [2] https://github.com/torvalds/linux/commit/8a75ffb81
> > [3] https://git.linuxtv.org/libcamera.git/tree/src/libcamera/v4l2_videodevice.cpp#n1385
> >
> > > >
> > > >                 if (b->bytesused > length)
>
> --
> Regards,
>
> Laurent Pinchart
