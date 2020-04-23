Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED64B1B5E52
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2020 16:51:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728789AbgDWOve (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 10:51:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726380AbgDWOvd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 10:51:33 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69429C08E934
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2020 07:51:33 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id z6so2429664plk.10
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2020 07:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=n9579OtTCLif5IsmjfaMugY+P4SRRpDn94COWW+rKC8=;
        b=Dta1r0S+h83gJZETxTuyaZcdtvwtvSMGYQIGZAa5p9AhAeqWF9hi/95cNnPMUf9qdT
         YJ0iWpHfyS5L+KMY6SPuWSUjXrgjDGHfm+CQWuLWQRuXNz0jzQhq1fbj/Ud0WWev9Tmg
         FuRU7zZEZf1Uy7eoByc2VxOi+r3Ai9ZrKPxNqzsqt7faxTeriSXl8+L2s6vXsagGow5w
         wRisB3CT37V8JbkM8Rd+9wJptjaQapNWPG1mRJGeQ2aowpVEP/tiwlX8BCZHWv5KMNRf
         NpcryrWTjP0ofsKoTuqRMOON+ZrJC0w8xyXfGAf0hV/gQNaozihip7ENc9DMBkCscmaa
         hT6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=n9579OtTCLif5IsmjfaMugY+P4SRRpDn94COWW+rKC8=;
        b=A8c++cHtEVTTfQ0xW5+C7k7JwUIvSico9Ec4T7RA4W6vhHOKuC7/AioMCxATbmfMfP
         UXBeSqfPjOOb5J7R2Yd9nKepg1u0xPlZc7ze6K5YOlvrHOconJB5m6LhZqOVjrwvuU9L
         MVUiZ6rhsLJZblNB9ratTtA7ufQF/cM2JWh2H84yNBC/v2V1eUoDsW9XJ9IAfP8u31am
         ola4U8DwpKuSl9pV53ozHnaeYHSAUQuLE7qPedVjj/E3gc/w70VmIjTvOeOWS15VQ1Sz
         XjuUoonqARRovJ5VhWP5YIOgjBbbSf/thYtD/cEy3UsqFbd4oj/6QohlbsmU96ergH0Y
         PIew==
X-Gm-Message-State: AGi0Puaf88fz/J4wbnzeVzIVEKXR2rxlgzMSDBO58CMW5GInygl0a7UB
        0EtcYJU4GgKgm6rSRbwoF3ZIhA==
X-Google-Smtp-Source: APiQypIJPerMho/SwnFvX4bBmyPrOipYJLcCQKHKClc0G3/oxnjytm19nNfUINndfzodE7hR9nqT/w==
X-Received: by 2002:a17:90a:6fe4:: with SMTP id e91mr1116823pjk.28.1587653492470;
        Thu, 23 Apr 2020 07:51:32 -0700 (PDT)
Received: from google.com ([2401:fa00:fc:1:28b:9f23:d296:c845])
        by smtp.gmail.com with ESMTPSA id p189sm2835561pfp.135.2020.04.23.07.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 07:51:31 -0700 (PDT)
Date:   Thu, 23 Apr 2020 22:51:22 +0800
From:   Martin Liu <liumartin@google.com>
To:     Sumit Semwal <sumit.semwal@linaro.org>
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
Subject: Re: [PATCH] dma-buf: Fix SET_NAME ioctl uapi
Message-ID: <20200423145122.GA17542@google.com>
References: <20200407133002.3486387-1-daniel.vetter@ffwll.ch>
 <CAO_48GF5jM-L7bqnfvXSvbugAjYsYnE7rGokO7_LWQxHua0=wQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO_48GF5jM-L7bqnfvXSvbugAjYsYnE7rGokO7_LWQxHua0=wQ@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Apr 09, 2020 at 09:28:16AM +0530, Sumit Semwal wrote:
> Thanks for the patch, Daniel!
> 
> 
> On Tue, 7 Apr 2020 at 19:00, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >
> > The uapi is the same on 32 and 64 bit, but the number isnt. Everyone
> > who botched this please re-read:
> >
> > https://www.kernel.org/doc/html/v5.4-preprc-cpu/ioctl/botching-up-ioctls.html
> >
> > Also, the type argument for the ioctl macros is for the type the void
> > __user *arg pointer points at, which in this case would be the
> > variable-sized char[] of a 0 terminated string. So this was botched in
> > more than just the usual ways.
> 
> Yes, it shouldn't have passed through the cracks; my apologies!
> 
> >
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: Chenbo Feng <fengc@google.com>
> > Cc: Greg Hackmann <ghackmann@google.com>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: linux-media@vger.kernel.org
> > Cc: linaro-mm-sig@lists.linaro.org
> > Cc: minchan@kernel.org
> > Cc: surenb@google.com
> > Cc: jenhaochen@google.com
> > Cc: Martin Liu <liumartin@google.com>
> 
> Martin,
> Could I request you to test this one with the 4 combinations of 32-bit
> / 64-bit userspace and kernel, and let us know that all 4 are working
> alright? If yes, please consider giving your tested-by here.
>
Hi Sumit, Daniel,
Sorry for being late to the tests. I finished the tests on 32/64 apps
with 64 bit kernel and they were fine. Unfortunately, I couldn't have a 32
bit kernel to run the tests somehow. However, this should work from the
code logic. Hope this is okay to you and thanks for Todd's help.

Tested-by: Martin Liu <liumartin@google.com>
Reviewed-by: Martin Liu <liumartin@google.com>

> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > ---
> >  drivers/dma-buf/dma-buf.c    | 3 ++-
> >  include/uapi/linux/dma-buf.h | 4 ++++
> >  2 files changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index 570c923023e6..1d923b8e4c59 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -388,7 +388,8 @@ static long dma_buf_ioctl(struct file *file,
> >
> >                 return ret;
> >
> > -       case DMA_BUF_SET_NAME:
> > +       case DMA_BUF_SET_NAME_A:
> > +       case DMA_BUF_SET_NAME_B:
> >                 return dma_buf_set_name(dmabuf, (const char __user *)arg);
> >
> >         default:
> > diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
> > index dbc7092e04b5..21dfac815dc0 100644
> > --- a/include/uapi/linux/dma-buf.h
> > +++ b/include/uapi/linux/dma-buf.h
> > @@ -39,6 +39,10 @@ struct dma_buf_sync {
> >
> >  #define DMA_BUF_BASE           'b'
> >  #define DMA_BUF_IOCTL_SYNC     _IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
> > +/* 32/64bitness of this uapi was botched in android, there's no difference
> > + * between them in actual uapi, they're just different numbers. */
> >  #define DMA_BUF_SET_NAME       _IOW(DMA_BUF_BASE, 1, const char *)
> > +#define DMA_BUF_SET_NAME_A     _IOW(DMA_BUF_BASE, 1, u32)
> > +#define DMA_BUF_SET_NAME_B     _IOW(DMA_BUF_BASE, 1, u64)
> >
> >  #endif
> > --
> > 2.25.1
> >
> Best,
> Sumit.
