Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E65D616FAD6
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2020 10:36:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727451AbgBZJgi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Feb 2020 04:36:38 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:40774 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726764AbgBZJgi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Feb 2020 04:36:38 -0500
Received: by mail-oi1-f194.google.com with SMTP id a142so2371647oii.7
        for <linux-media@vger.kernel.org>; Wed, 26 Feb 2020 01:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9EMjKgVGuMRAVyfQZ2TPNgdMqtVLlcmfYPm5wDrYVb4=;
        b=ieab7pTpQvNA6A5wB4fPVXYkd+2XAp8iVczdxWZY1wGXIUApYjvZ1rJRbznNH0G0XK
         Crcabay1fZbXxHxl3XWKUkQ0/asPI+AvHoVGJ1Q+fvJq4h/PdzvZdAVgBnIwSKXuzH5I
         +SMlMalFbHRokfnBeGxt50sI8HF+fwocOFljE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9EMjKgVGuMRAVyfQZ2TPNgdMqtVLlcmfYPm5wDrYVb4=;
        b=H5ktLxc82W9vDneTKUb2bQj8uj4vmYnNZiZVHsLsXx//+QqTNcJ+WBg2QO3odr+9bP
         KpSAUUgYrWlw+/hv8/NbapxbVMWMhYchqPcICJV977BHtDGAIxOtpyKIZKSvkw+TW3Nk
         gvMAh3ORILIcqF2huP1143uRxcsmrqFU7pW16F/TwHOPyKsMeAEebItGxyDXuwMRGlIE
         kiOTb2haQfKQaQuQuQcdsdV/04sMq++lh6i9H7HbMchxxpI7u+K75IO0IlYLRcdf3SWF
         UoF2C6/L7c2WTJ6/ExdoCQv01vmYGlrxM1rFVghKS5e6A2b3W43kccmLaugXfrgmZ6ZY
         tGBA==
X-Gm-Message-State: APjAAAWwymHadROl4dOv8B7yAMqWeCMliix4H/UgXEVKIt/FtAkJitAD
        JiBdqe0QhQu+50BavXTTvmfteGwez6FqeD3UKfDn/Ijb
X-Google-Smtp-Source: APXvYqzNG7Ws71FuTQ4i01/b8TpaygUZY40lwrFlLYaZuIvLsUQMNHZxReC0Pv07qe+Oto6ehyiZLofQb+5DJyvz3RM=
X-Received: by 2002:a05:6808:10b:: with SMTP id b11mr2425468oie.110.1582709797566;
 Wed, 26 Feb 2020 01:36:37 -0800 (PST)
MIME-Version: 1.0
References: <20200203173311.6269a8be06a05e5a4aa08a93@linux-foundation.org>
 <20200226015504.7GW9ptoIA%akpm@linux-foundation.org> <CAO_48GFr9-aY4=kRqWB=UkEzPj5fQDip+G1tNZMsT0XoQpBC7Q@mail.gmail.com>
In-Reply-To: <CAO_48GFr9-aY4=kRqWB=UkEzPj5fQDip+G1tNZMsT0XoQpBC7Q@mail.gmail.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Wed, 26 Feb 2020 10:36:26 +0100
Message-ID: <CAKMK7uGvixQ2xoQMt3pvt0OpNXDjDGTvSWsaAppsKrmO_EP3Kg@mail.gmail.com>
Subject: Re: + dma-buf-free-dmabuf-name-in-dma_buf_release.patch added to -mm tree
To:     Sumit Semwal <sumit.semwal@linaro.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        mm-commits@vger.kernel.org, Chenbo Feng <fengc@google.com>,
        DRI mailing list <dri-devel@lists.freedesktop.org>,
        Greg Hackmann <ghackmann@google.com>,
        WANG Cong <xiyou.wangcong@gmail.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Feb 26, 2020 at 5:29 AM Sumit Semwal <sumit.semwal@linaro.org> wrote:
>
> Hello Andrew,
>
>
> On Wed, 26 Feb 2020 at 07:25, Andrew Morton <akpm@linux-foundation.org> wrote:
> >
> >
> > The patch titled
> >      Subject: dma-buf: free dmabuf->name in dma_buf_release()
> > has been added to the -mm tree.  Its filename is
> >      dma-buf-free-dmabuf-name-in-dma_buf_release.patch
>
> Thanks for taking this patch via -mm during my absence (I'm just
> returning from a bit of an illness). If there are other dma-buf
> patches on your radar that you'd like to take via the mm tree, please
> let me know and I can provide the necessary Acks.
> Else I will take them in via drm-misc as usual.

I thought at least that for cases like these -mm is the last resort
tree, so proper thing to do here is apply this fix to drm-misc-fixes
and get it out there. -mm rebases, so will fall out again.

Also maybe we should have had some tests for this, plus some
integration with the gem object name instead of duplicating buffer
object names everywhere for different reasons.
-Daniel

>
> >
> > This patch should soon appear at
> >     http://ozlabs.org/~akpm/mmots/broken-out/dma-buf-free-dmabuf-name-in-dma_buf_release.patch
> > and later at
> >     http://ozlabs.org/~akpm/mmotm/broken-out/dma-buf-free-dmabuf-name-in-dma_buf_release.patch
> >
> > Before you just go and hit "reply", please:
> >    a) Consider who else should be cc'ed
> >    b) Prefer to cc a suitable mailing list as well
> >    c) Ideally: find the original patch on the mailing list and do a
> >       reply-to-all to that, adding suitable additional cc's
> >
> > *** Remember to use Documentation/process/submit-checklist.rst when testing your code ***
> >
> > The -mm tree is included into linux-next and is updated
> > there every 3-4 working days
> >
> > ------------------------------------------------------
> > From: Cong Wang <xiyou.wangcong@gmail.com>
> > Subject: dma-buf: free dmabuf->name in dma_buf_release()
> >
> > dma-buff name can be set via DMA_BUF_SET_NAME ioctl, but once set
> > it never gets freed.
> >
> > Free it in dma_buf_release().
> >
> > Link: http://lkml.kernel.org/r/20200225204446.11378-1-xiyou.wangcong@gmail.com
> > Fixes: bb2bb9030425 ("dma-buf: add DMA_BUF_SET_NAME ioctls")
> > Reported-by: syzbot+b2098bc44728a4efb3e9@syzkaller.appspotmail.com
> > Signed-off-by: Cong Wang <xiyou.wangcong@gmail.com>
> > Reviewed-by: Andrew Morton <akpm@linux-foundation.org>
> > Acked-by: Chenbo Feng <fengc@google.com>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: Greg Hackmann <ghackmann@google.com>
> > Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> > ---
> >
> >  drivers/dma-buf/dma-buf.c |    1 +
> >  1 file changed, 1 insertion(+)
> >
> > --- a/drivers/dma-buf/dma-buf.c~dma-buf-free-dmabuf-name-in-dma_buf_release
> > +++ a/drivers/dma-buf/dma-buf.c
> > @@ -108,6 +108,7 @@ static int dma_buf_release(struct inode
> >                 dma_resv_fini(dmabuf->resv);
> >
> >         module_put(dmabuf->owner);
> > +       kfree(dmabuf->name);
> >         kfree(dmabuf);
> >         return 0;
> >  }
> > _
> >
> > Patches currently in -mm which might be from xiyou.wangcong@gmail.com are
> >
> > dma-buf-free-dmabuf-name-in-dma_buf_release.patch
> >
> Thanks and best regards,
> Sumit.
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
