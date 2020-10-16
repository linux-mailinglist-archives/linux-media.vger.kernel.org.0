Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D90CA2902BA
	for <lists+linux-media@lfdr.de>; Fri, 16 Oct 2020 12:21:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395277AbgJPKVI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Oct 2020 06:21:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731141AbgJPKUz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Oct 2020 06:20:55 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7283EC061755
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2020 03:20:55 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id h7so2136066wre.4
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2020 03:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1wQ+QegbSMRK0PCmkL5ShUNT/wQ5dtDD3UIgNgbw5Lg=;
        b=mUa4kmfIaSoIqAOK4BR8YHlP26JwcB9IpvjA7mwlj3LI9+vcK5nHDuqP2LyIvEuk9B
         8TbeE6asz+ujOioXvvagwdnEh9O5RqirNX8gcY1qkWOs1vgX0AeSNU/UuKYFV44fCFSz
         Jqb/Jmvo4Tel3BtY1kXnJosk39EkfFETuPmai7KR9BhPf8Oti1gtn0A0Dhj7+GdNzVdN
         7y9TN5T7zwuTA7mk85cUsFByzQB634WFDOafRgQhj4qRBtKqUSjbt2rtTrYle3cEsjOG
         mFYNTZCaGtqROVWycHZRka2X1FxFUxfG+wiei9xjbcz5AO81yA/xB9hANCVV90mLhN+W
         MROg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1wQ+QegbSMRK0PCmkL5ShUNT/wQ5dtDD3UIgNgbw5Lg=;
        b=G2qWMwcFCEifmopQlNK3o8YE3pzkRd55WhNYOyH737312AhwE/C2FP2TdUO5qoqRKl
         u8rGPY1yNFxNbSzGL9OjP8HgTnnNgUGl29fikX8LExnL37x9pe1+0NYyOC4LmZZP4GGM
         elZkaZYyWA4qM7WTIuEieugEf2zLcxvdU0gcC885hIPkxdeMnoTa3vhwIN6D8Q7uvNsq
         wtYEUtHMbknj3iZXHf3xofBcsgWXXzQPGTewPV8QMYZO7CzC/jjR08s5qdJQXVCaPtq1
         dmr15BnYh3PkEfsS0jkmL/i1T05DMMjuBN0jwt2zS0nL3Rry9zEUpY1RlSM/e9TdzLeR
         J4Xg==
X-Gm-Message-State: AOAM532a7b+Nky7QjnGUCdtm1Sk+9ce54OUynKjpCrfPOuq5eYrjBME6
        t+IjVT58jbeUSQ9EpBBZlNDkFbHn6HY5g2tLW1gknw==
X-Google-Smtp-Source: ABdhPJzZ2quozkaAnveWG2208VWcGSfPtPC+DuVxuAb6vUTYG7PK+6z3b37InUWG9ihtr4XPjqLySxC+SdlmTTgmnTc=
X-Received: by 2002:adf:e806:: with SMTP id o6mr3111329wrm.42.1602843654039;
 Fri, 16 Oct 2020 03:20:54 -0700 (PDT)
MIME-Version: 1.0
References: <gh5kef5bkeel3o6b2dkgc2dfagu9klj4c0@4ax.com> <20201008015953.GA28158@pendragon.ideasonboard.com>
In-Reply-To: <20201008015953.GA28158@pendragon.ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Fri, 16 Oct 2020 11:20:36 +0100
Message-ID: <CAPY8ntA15jA_AViccQqK=4U_SW6snuBD=B1Km0ZvqEpf3ReBZQ@mail.gmail.com>
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

tHi Laurent

On Thu, 8 Oct 2020 at 03:00, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi John,
>
> Thank you for the patch.
>
> On Wed, Jun 17, 2020 at 02:21:52PM +0100, John Cox wrote:
> > Check against length in v4l2_buffer rather than vb2_buffer when the
> > buffer is a dmabuf. This makes the single plane test the same as the
> > existing multiplanar test.
> >
> > Signed-off-by: John Cox <jc@kynesim.co.uk>
> > ---
> >  drivers/media/common/videobuf2/videobuf2-v4l2.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> > index e652f4318284..731c7c99c971 100644
> > --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> > +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> > @@ -114,7 +114,8 @@ static int __verify_length(struct vb2_buffer *vb, const struct v4l2_buffer *b)
> >                                 return -EINVAL;
> >                 }
> >         } else {
> > -               length = (b->memory == VB2_MEMORY_USERPTR)
> > +               length = (b->memory == VB2_MEMORY_USERPTR ||
> > +                         b->memory == VB2_MEMORY_DMABUF)
> >                         ? b->length : vb->planes[0].length;
>
> I don't think this is correct, as it breaks DMABUF import. For USERPTR
> the length needs to be passed by userspace, but for DMABUF, we allow
> userspace to set length to 0, and use the length retrieved from the
> dma_buf. With this change, b->length is 0, and the check fails.

I've just been discussing this with John  - he contracts for Raspberry
Pi for the HEVC stateless decoder amongst other things, which is why
this patch was created in the first place.

I can't find any reference in the docs to length = 0 && b->memory ==
VB2_MEMORY_DMABUF being "use dmabuf size". And certainly no mention of
the single planar API being different from the multi-planar API (which
it was until this patch).
Reference to b->memory == VB2_MEMORY_USERPTR meaning that the
b->length is in the description for VIDIOC_QBUF[1]

John's patch is matching Hans' original patch that did the same thing
for multi-planar [2].
From the commit text:
- in __verify_length() it would use the application-provided length value
  for USERPTR and the vb2 core length for other memory models, but it
  should have used the application-provided length as well for DMABUF.

If you're saying that length==0 is "use the dmabuf size", then
__verify_length is wrong in both single and multi-planar usage as it
is comparing against vb->planes[X].length, not (struct dma_buf*)->size
(the dma_buf_get isn't done until __prepare_dmabuf).
After the lookup __prepare_dmabuf does check that planes[plane].length
< vb->planes[plane].min_length. So do both clauses in __verify_length
just need to bypass the length check if length = 0 && b->memory ==
VB2_MEMORY_DMABUF ?

I note we already have mismatched handling in libcamera in that
multiplanar DMABUF sets length for each plane, but single planar
DMABUF doesn't set buf.length [3]

For info, the use case all comes down to the old chestnut of "how big
is a compressed frame?".
Feeding encoded bitstream into the HEVC decoder using
VB2_MEMORY_DMABUF, the size of the buffer against the format sizeimage
doesn't matter. The only conditions are that the buffer description is
valid (ie bytesused <= actual buffer size) and the hardware can map
it. If you're using dmaheaps or similar to allocate the buffers
externally and an unexpectedly large compressed frame comes through,
reallocate through dmaheaps and pass it in.
The same argument is true for USERPTR, and that's already accounted
for by relying on the application provided length.

Cheers,
  Dave

[1] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/vidioc-qbuf.html#vidioc-qbuf
[2] https://github.com/torvalds/linux/commit/8a75ffb81
[3] https://git.linuxtv.org/libcamera.git/tree/src/libcamera/v4l2_videodevice.cpp#n1385

> >
> >                 if (b->bytesused > length)
>
> --
> Regards,
>
> Laurent Pinchart
