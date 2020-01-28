Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 565AC14B031
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2020 08:20:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725882AbgA1HUG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jan 2020 02:20:06 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:42236 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725776AbgA1HUG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jan 2020 02:20:06 -0500
Received: by mail-ed1-f65.google.com with SMTP id e10so13578544edv.9
        for <linux-media@vger.kernel.org>; Mon, 27 Jan 2020 23:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Sb+8J/7DuRGfGudhsScfamBXEMs+Mce/hybB6WnCHb0=;
        b=cBBOlTfYKE9YToJ7LwFQXUs38A+ojqRBnM0kt+rHMyNahEoDFA6easCZ0aFYOPtke3
         92ch4PzsGSCY5aLRhqTT/Efcfd4whgm9Naygy4kaj/kYGeA0+wOB21kgR8n0MWKNEDG5
         1uI51gw21EMHkPLWo/gWWMfXNCjXDlc2AC+1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Sb+8J/7DuRGfGudhsScfamBXEMs+Mce/hybB6WnCHb0=;
        b=biQDlZIPe3ffFQrIi2Kwn6y+Ms/BtVh74Gr8y8/WVs5kbXEWo+BEfYNrbLXiR4tFoX
         5w0qjURuRU1lmCVAtw/gTS6FmJvjGIV8vY9PucsjubzM4LX+BKAHHLD7prckODJV1xFJ
         gRGyt64KthKtD5rdpGwLLvAX6iX4lD3VzBsE4iVJJ08lB+YUzKCJ5ETCi1ijH79yXaX5
         8oHf9mtf0fUuj+zLV5bd4FDi8rI2l346lfLE+5HLQHRtB6o3OXww4KLEWErcvHK8KlEP
         YU+b4oQgEaGVFThpG/KmxJOG+ugYmWmf6G8aLSvGD2g6YpjFdxY21tq9q3lj4D20d62e
         L0uQ==
X-Gm-Message-State: APjAAAUWk39X6J96wSbkg5s5Oaa/8Yp03arHJoWr/t9MKUPyWJbCIBT0
        W+mT2j2SRK4DWimvc4QViofjlNicEHzl0A==
X-Google-Smtp-Source: APXvYqy5py8nEua8awfF5hyeTWTZwBPE+MfV9XVc+owxspndNsupUjDVw8oFl7BeQ1YV1XHjamzRUA==
X-Received: by 2002:a17:906:16d1:: with SMTP id t17mr2094548ejd.41.1580196003500;
        Mon, 27 Jan 2020 23:20:03 -0800 (PST)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id cw10sm475291ejb.56.2020.01.27.23.20.02
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2020 23:20:02 -0800 (PST)
Received: by mail-wm1-f42.google.com with SMTP id b2so1330808wma.0
        for <linux-media@vger.kernel.org>; Mon, 27 Jan 2020 23:20:02 -0800 (PST)
X-Received: by 2002:a05:600c:294a:: with SMTP id n10mr3195790wmd.11.1580196001394;
 Mon, 27 Jan 2020 23:20:01 -0800 (PST)
MIME-Version: 1.0
References: <20191217032034.54897-1-senozhatsky@chromium.org>
 <20191217032034.54897-14-senozhatsky@chromium.org> <2d0e1a9b-6c5e-ff70-9862-32c8b8aaf65f@xs4all.nl>
 <20200122050515.GB49953@google.com> <57f711a0-6183-74f6-ab24-ebe414cb6881@xs4all.nl>
In-Reply-To: <57f711a0-6183-74f6-ab24-ebe414cb6881@xs4all.nl>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 28 Jan 2020 16:19:50 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Dbw=B7kb-p8nkPN3GxwL0O-5q=y1HRAVUVOwv4eEAv-Q@mail.gmail.com>
Message-ID: <CAAFQd5Dbw=B7kb-p8nkPN3GxwL0O-5q=y1HRAVUVOwv4eEAv-Q@mail.gmail.com>
Subject: Re: [RFC][PATCH 13/15] videobuf2: do not sync buffers for DMABUF queues
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 23, 2020 at 8:35 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 1/22/20 6:05 AM, Sergey Senozhatsky wrote:
> > On (20/01/10 11:30), Hans Verkuil wrote:
> > [..]
> >>> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> >>> index 1762849288ae..2b9d3318e6fb 100644
> >>> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> >>> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> >>> @@ -341,8 +341,22 @@ static void set_buffer_cache_hints(struct vb2_queue *q,
> >>>                                struct vb2_buffer *vb,
> >>>                                struct v4l2_buffer *b)
> >>>  {
> >>> -   vb->need_cache_sync_on_prepare = 1;
> >>> +   /*
> >>> +    * DMA exporter should take care of cache syncs, so we can avoid
> >>> +    * explicit ->prepare()/->finish() syncs.
> >>> +    */
> >>> +   if (q->memory == VB2_MEMORY_DMABUF) {
> >>> +           vb->need_cache_sync_on_finish = 0;
> >>> +           vb->need_cache_sync_on_prepare = 0;
> >>> +           return;
> >>> +   }
> >>>
> >>> +   /*
> >>> +    * For other ->memory types we always need ->prepare() cache
> >>> +    * sync. ->finish() cache sync, however, can be avoided when queue
> >>> +    * direction is TO_DEVICE.
> >>> +    */
> >>> +   vb->need_cache_sync_on_prepare = 1;
> >>
> >> I'm trying to remember: what needs to be done in prepare()
> >> for a capture buffer? I thought that for capture you only
> >> needed to invalidate the cache in finish(), but nothing needs
> >> to be done in the prepare().
> >
> > Hmm. Not sure. A precaution in case if user-space wrote to that buffer?
>
> But whatever was written in the buffer is going to be overwritten anyway.
>
> Unless I am mistaken the current situation is that the cache syncs are done
> in both prepare and finish, regardless of the DMA direction.
>
> I would keep that behavior to avoid introducing any unexpected regressions.
>

It wouldn't be surprising if the buffer was first filled with default
values (e.g. all zeroes) on the CPU. That would make the cache lines
dirty and they could overwrite what the device writes. So we need to
flush (aka clean) the write-back caches on prepare for CAPTURE
buffers.

> Then, if q->allow_cache_hint is set, then default to a cache sync (cache clean)
> in the prepare for OUTPUT buffers and a cache sync (cache invalidate) in the
> finish for CAPTURE buffers.

I'd still default to the existing behavior even if allow_cache_hint is
set, because of what I wrote above. Then if the userspace doesn't ever
write to the buffers, it can request no flush/clean by setting the
V4L2_BUF_FLAG_NO_CACHE_CLEAN flag when queuing the buffer.

>
> This also means that any drivers that want to access a buffer in between the
> prepare...finish calls will need to do a begin/end_cpu_access. But that's a
> separate matter.

AFAIR with current design of the series, the drivers can opt-in for
userspace cache sync hints, so by default even if the userspace
requests sync to be skipped, it wouldn't have any effect unless the
driver allows so. Then I'd imagine migrating all the drivers to
request clean/invalidate explicitly. Note that the DMA-buf
begin/end_cpu_access isn't enough here. We'd need something like
vb2_begin/end_cpu_access() which also takes care of syncing
inconsistent MMAP and USERPTR buffers.

>
> Regards,
>
>         Hans
>
> >
> > +     if (q->dma_dir == DMA_FROM_DEVICE)
> > +             q->need_cache_sync_on_prepare = 0;
> >
> > ?
> >
> >       -ss
> >
>
