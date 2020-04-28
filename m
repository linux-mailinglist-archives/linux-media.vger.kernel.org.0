Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D193F1BBB57
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2020 12:37:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbgD1Khj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Apr 2020 06:37:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726276AbgD1Khj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Apr 2020 06:37:39 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9934AC03C1A9
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2020 03:37:39 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id z25so31700273otq.13
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2020 03:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/lbZ/o7rViPH+y9TQc0SUKwOd3mSEgmUJullTUqZ1zw=;
        b=tV9Fikyh7laK//5LljoUi8361sRi9GDmRlXVfYSZ6r4s46shMh1d/KzEq65dHBa5u+
         AmJvWEWOBHp9NE75KHX/uuj6u1661O9qUR/nkyzTyZopxT2w9we+Fyja8tSQnpWVt+ax
         lmBPPhz0K+zNF26Qb3RBe5w9fSURekRbjz6DNevKZi/aVxUj3sItV2Mcvg5X04VDpC/g
         ZiR1hFp0dB2r6sA0BOQ8jnSs5wpy0hKTTonQJvFB9JjB8Zc/3jUXbqjAUTgM9jUv6tf6
         kq8gZkjR8xR9uZEtc97WS9vZ/diLVDf84zmnOl6YU0dOIrIQ2LfidnmXM2RRBwjW8N/6
         m9Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/lbZ/o7rViPH+y9TQc0SUKwOd3mSEgmUJullTUqZ1zw=;
        b=kxQqgiclfQGO11gkuS/TZGdtJwlk7HHRvTVNJbm71rdUb339AnkapR67n8+PZFw9Bw
         1cfoVBp5P0Jgmm2az5vmHPo4Qg0brs8ycF5v79rHtWLD51dBmEMrE9S6u3mYnW9BaOk4
         JtfJ45bWRBvRB53q/Qhk0+8EXQVlMOKQ5yvD0uRe5nxu3qU5BY5BA77/FtXy6U27zWKG
         FQuMY5OxHtJRhqIHbJ+HFLtQ6pogZhIFSy8/O8wq5gi1uwTABFHyQG640CBOl1g/gIoc
         oW0YcC+Jm0oaw2tlfAaQYtg2wHknrxFkoAaqW7X492lxRgwJ9V+hqU6L++A7peHlVBTY
         jONA==
X-Gm-Message-State: AGi0PuZAOg+MiTNFxPeygsjgwOHLDEBvDYm6Msw6bPxkNBtLqKg9xC4b
        326Lub3xv+rXUJONnMVaQ8S7Ni6zjzWLa2/nZ1/E/w==
X-Google-Smtp-Source: APiQypJBytTcB67KweAIRvJkCA/naVwdNTs/27EB0xHKNcKsZvMT52vq5eSodEdlOT00J33uHlOKEpmUvYzvjkOh7QY=
X-Received: by 2002:aca:d885:: with SMTP id p127mr2520841oig.76.1588070258849;
 Tue, 28 Apr 2020 03:37:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200407133002.3486387-1-daniel.vetter@ffwll.ch>
 <CAO_48GF5jM-L7bqnfvXSvbugAjYsYnE7rGokO7_LWQxHua0=wQ@mail.gmail.com> <20200423145122.GA17542@google.com>
In-Reply-To: <20200423145122.GA17542@google.com>
From:   Sumit Semwal <sumit.semwal@linaro.org>
Date:   Tue, 28 Apr 2020 16:07:27 +0530
Message-ID: <CAO_48GHcwZC2zisha9JVg5ifDdXrTLFOgrVL+yYyLuxw4j5JMQ@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Fix SET_NAME ioctl uapi
To:     Martin Liu <liumartin@google.com>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Chenbo Feng <fengc@google.com>,
        Greg Hackmann <ghackmann@google.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        Linaro MM SIG <linaro-mm-sig@lists.linaro.org>,
        minchan@kernel.org, Suren Baghdasaryan <surenb@google.com>,
        Jenhao Chen <jenhaochen@google.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Todd Kjos <tkjos@android.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks Daniel, Martin,

On Thu, 23 Apr 2020 at 20:21, Martin Liu <liumartin@google.com> wrote:
>
> On Thu, Apr 09, 2020 at 09:28:16AM +0530, Sumit Semwal wrote:
> > Thanks for the patch, Daniel!
> >
> >
> > On Tue, 7 Apr 2020 at 19:00, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > >
> > > The uapi is the same on 32 and 64 bit, but the number isnt. Everyone
> > > who botched this please re-read:
> > >
> > > https://www.kernel.org/doc/html/v5.4-preprc-cpu/ioctl/botching-up-ioctls.html
> > >
> > > Also, the type argument for the ioctl macros is for the type the void
> > > __user *arg pointer points at, which in this case would be the
> > > variable-sized char[] of a 0 terminated string. So this was botched in
> > > more than just the usual ways.
> >
> > Yes, it shouldn't have passed through the cracks; my apologies!
> >
> > >
> > > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > > Cc: Chenbo Feng <fengc@google.com>
> > > Cc: Greg Hackmann <ghackmann@google.com>
> > > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > Cc: linux-media@vger.kernel.org
> > > Cc: linaro-mm-sig@lists.linaro.org
> > > Cc: minchan@kernel.org
> > > Cc: surenb@google.com
> > > Cc: jenhaochen@google.com
> > > Cc: Martin Liu <liumartin@google.com>
> >
> > Martin,
> > Could I request you to test this one with the 4 combinations of 32-bit
> > / 64-bit userspace and kernel, and let us know that all 4 are working
> > alright? If yes, please consider giving your tested-by here.
> >
> Hi Sumit, Daniel,
> Sorry for being late to the tests. I finished the tests on 32/64 apps
> with 64 bit kernel and they were fine. Unfortunately, I couldn't have a 32
> bit kernel to run the tests somehow. However, this should work from the
> code logic. Hope this is okay to you and thanks for Todd's help.
>
> Tested-by: Martin Liu <liumartin@google.com>
> Reviewed-by: Martin Liu <liumartin@google.com>

Applied to drm-misc-fixes.
>
> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > ---
> > >  drivers/dma-buf/dma-buf.c    | 3 ++-
> > >  include/uapi/linux/dma-buf.h | 4 ++++
> > >  2 files changed, 6 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > > index 570c923023e6..1d923b8e4c59 100644
> > > --- a/drivers/dma-buf/dma-buf.c
> > > +++ b/drivers/dma-buf/dma-buf.c
> > > @@ -388,7 +388,8 @@ static long dma_buf_ioctl(struct file *file,
> > >
> > >                 return ret;
> > >
> > > -       case DMA_BUF_SET_NAME:
> > > +       case DMA_BUF_SET_NAME_A:
> > > +       case DMA_BUF_SET_NAME_B:
> > >                 return dma_buf_set_name(dmabuf, (const char __user *)arg);
> > >
> > >         default:
> > > diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
> > > index dbc7092e04b5..21dfac815dc0 100644
> > > --- a/include/uapi/linux/dma-buf.h
> > > +++ b/include/uapi/linux/dma-buf.h
> > > @@ -39,6 +39,10 @@ struct dma_buf_sync {
> > >
> > >  #define DMA_BUF_BASE           'b'
> > >  #define DMA_BUF_IOCTL_SYNC     _IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
> > > +/* 32/64bitness of this uapi was botched in android, there's no difference
> > > + * between them in actual uapi, they're just different numbers. */
> > >  #define DMA_BUF_SET_NAME       _IOW(DMA_BUF_BASE, 1, const char *)
> > > +#define DMA_BUF_SET_NAME_A     _IOW(DMA_BUF_BASE, 1, u32)
> > > +#define DMA_BUF_SET_NAME_B     _IOW(DMA_BUF_BASE, 1, u64)
> > >
> > >  #endif
> > > --
> > > 2.25.1
> > >
> > Best,
> > Sumit.
Best,
Sumit.
