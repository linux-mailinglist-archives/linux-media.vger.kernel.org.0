Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1652A3339CB
	for <lists+linux-media@lfdr.de>; Wed, 10 Mar 2021 11:17:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231653AbhCJKRQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Mar 2021 05:17:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231161AbhCJKQs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Mar 2021 05:16:48 -0500
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87A1EC06174A
        for <linux-media@vger.kernel.org>; Wed, 10 Mar 2021 02:16:42 -0800 (PST)
Received: by mail-il1-x12b.google.com with SMTP id p10so15026284ils.9
        for <linux-media@vger.kernel.org>; Wed, 10 Mar 2021 02:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YnjTlCzPSM64YPwZtIYFy5lAVDG5f9v4P0vMMvdQJ4g=;
        b=d0SaJGU+8Urml23wTMTDfhpGRRTwD+zpckGUZVMl+sVOy1WZYmEJ452QYDEt+HEMPH
         IgYQZsfm5TUykrsjmeIEmLfHZGFzcwLIgOiDgolB3dDU+UugpwZSaiyTCDiqkBCrQWWh
         l7f5WKbbFlEUefe7S8uASrebDK0rSAdB2PHd0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YnjTlCzPSM64YPwZtIYFy5lAVDG5f9v4P0vMMvdQJ4g=;
        b=oJ04q81esLQh7CtKizuUsSCuE2fNZzNFZfzziRubSKMy0gj4QMpFOUnJgimQ+knHfq
         eCph3j+yZTY5kpCn5Ig1Jk9ojKVtXklDV9BZsydsGPWDa3c6tzgj1grRUa8urpWQ/4vt
         Hd7bsMDEnzzDi1rVNvIPt++JtfDN0uvGiQSTArnH4JoWwfFwsMdO0Er0U7mCXAaSpra+
         BSq0WZ+r4duQLBtbgGuHkAdsh1tbhJobNhOFSVfe3KbNwAMgtsDy088KjbkTQJ45pJpF
         nS8uh7U84jxCvdfS3UzmonJCgfWsFCHhWINpvB06TOuqPu/7mghTaZzwPo+dLk0ionkv
         WiKw==
X-Gm-Message-State: AOAM532BO3Z0ZNeCOFaJCwJVBPy6LUumWxkO36y6MX81NH2Ew0NLgR5/
        WwOO3bMBzRG6xlEia9E7Gco6rWQt9ix5JgaI
X-Google-Smtp-Source: ABdhPJzzoEZFz3WSoYKBCktiG9qHlPnCupOaH2Z8AYEdrUNjokSBIg+UIfmiRrjpH9NyL/4USjtZNA==
X-Received: by 2002:a92:50c:: with SMTP id q12mr1996899ile.59.1615371401834;
        Wed, 10 Mar 2021 02:16:41 -0800 (PST)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com. [209.85.166.175])
        by smtp.gmail.com with ESMTPSA id i8sm8648801ilv.57.2021.03.10.02.16.41
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Mar 2021 02:16:41 -0800 (PST)
Received: by mail-il1-f175.google.com with SMTP id c10so15031496ilo.8
        for <linux-media@vger.kernel.org>; Wed, 10 Mar 2021 02:16:41 -0800 (PST)
X-Received: by 2002:a05:6e02:194e:: with SMTP id x14mr2059514ilu.218.1615371400880;
 Wed, 10 Mar 2021 02:16:40 -0800 (PST)
MIME-Version: 1.0
References: <20210309234317.1021588-1-ribalda@chromium.org>
 <YEh6AIQPa75MzP+8@pendragon.ideasonboard.com> <CANiDSCuz76q0Ukq5UfrgeRH_JFWKQ9hCpMqZTHUtiwHxpEd4oQ@mail.gmail.com>
 <YEh/ZsfC34+aGI0Q@pendragon.ideasonboard.com>
In-Reply-To: <YEh/ZsfC34+aGI0Q@pendragon.ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 10 Mar 2021 11:16:30 +0100
X-Gmail-Original-Message-ID: <CANiDSCv7q1iY=QrtG2ssC_Y1Z1EiiWegfXmd=ha-=2vmngW_dQ@mail.gmail.com>
Message-ID: <CANiDSCv7q1iY=QrtG2ssC_Y1Z1EiiWegfXmd=ha-=2vmngW_dQ@mail.gmail.com>
Subject: Re: [PATCH] media: videobuf2: Fix integer overrun in allocation
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Wed, Mar 10, 2021 at 9:12 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> On Wed, Mar 10, 2021 at 08:58:39AM +0100, Ricardo Ribalda wrote:
> > On Wed, Mar 10, 2021 at 8:49 AM Laurent Pinchart wrote:
> > > On Wed, Mar 10, 2021 at 12:43:17AM +0100, Ricardo Ribalda wrote:
> > > > The plane_length is an unsigned integer. So, if we have a size of
> > > > 0xffffffff bytes we incorrectly allocate 0 bytes instead of 1 << 32.
> > > >
> > > > Cc: stable@vger.kernel.org
> > > > Fixes: 7f8414594e47 ("[media] media: videobuf2: fix the length check for mmap")
> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > ---
> > > >  drivers/media/common/videobuf2/videobuf2-core.c | 4 +++-
> > > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> > > > index 02281d13505f..543da515c761 100644
> > > > --- a/drivers/media/common/videobuf2/videobuf2-core.c
> > > > +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> > > > @@ -223,8 +223,10 @@ static int __vb2_buf_mem_alloc(struct vb2_buffer *vb)
> > > >        * NOTE: mmapped areas should be page aligned
> > > >        */
> > > >       for (plane = 0; plane < vb->num_planes; ++plane) {
> > > > +             unsigned long size = vb->planes[plane].length;
> > >
> > > unsigned long is still 32-bit on 32-bit platforms.
> > >
> > > > +
> > > >               /* Memops alloc requires size to be page aligned. */
> > > > -             unsigned long size = PAGE_ALIGN(vb->planes[plane].length);
> > > > +             size = PAGE_ALIGN(size);
> > > >
> > > >               /* Did it wrap around? */
> > > >               if (size < vb->planes[plane].length)
> > >
> > > Doesn't this address the issue already ?
> >
> > Yes and no. If you need to allocate 0xffffffff you are still affected
> > by the underrun. The core will return an error instead of doing the
> > allocation.
> >
> > (yes, I know it is a lot of memory for a buffer)
>
> That's my point, I don't think there's a need for this :-) Especially
> with v4l2_buffer.m.offset being a __u32, we are limited to 4GB for *all*
> buffers.

I guess I will convert this patch into a documentation patch, so we
explicitly know the limit of the API
(1<<32 - PAGE_SIZE).

Thanks!

>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
