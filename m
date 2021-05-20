Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C3A838B430
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 18:26:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233928AbhETQ1S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 12:27:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233899AbhETQ1Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 12:27:16 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2006FC061574
        for <linux-media@vger.kernel.org>; Thu, 20 May 2021 09:25:54 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id u25-20020a0568302319b02902ac3d54c25eso15415860ote.1
        for <linux-media@vger.kernel.org>; Thu, 20 May 2021 09:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=aBkhk3QDWbqSQxByb9B0QwU7XpNxQNo09cMdXpxbbl8=;
        b=ZTcJ2ZN5oiXQB5JixcdXLMUBNnapMtCPrrCADKk79kIX1HO7C6sJyH98HYPoLlmHsi
         aLwFtH/1sEk9TAJWoINwVFUCDVeDneG9y10WuHZCQkwnHAAC+wBLYozbvS6zxdJQjHnI
         0ygWlp5+o43N/ShvItsywwnmDq6K1Zrsxfo88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=aBkhk3QDWbqSQxByb9B0QwU7XpNxQNo09cMdXpxbbl8=;
        b=YZMpRptl86hPwdRd3yQmjDMzaoPqMdcF4jimc74ff9NMcQlkZQydu81vJIDK2OiYtG
         Rib0BTgNPBjgghqkJE+6sKOlA29U/gF7YINwiaxohmfSUdearUJgja/FxR7TuK7L06uX
         ano+k1dYstTQ1hVo7HgqOPGxKirb20ruGzaNPjvd30gREXDz54w/yWjUu7VoVdgke6MX
         AqrRusYFN+ohfnRGVhJpZn8iQF+zaC8jjd3cmuJvoc55L4WGvSbUTbSeWqFEeJc+o6tH
         q0jeK0T4oqxdwdvwGPSCpfJYwJ8V9A7BGL558BVVaVjvZ/iZhtxcv2HOUT6a7falj+gW
         f/HQ==
X-Gm-Message-State: AOAM533phIJ2FASerRqltYABVJJmDXlmdrUkF48kxPD0BRiW5qeretyu
        RXypv+gpJw44cugl6oCSt+b9kIUzy94SafppN36RVw==
X-Google-Smtp-Source: ABdhPJzdUcCTfi80bWr13zSZ/F0YDpb9U8rAzzxeFvH1KraofvvTAPHpWCxezFVXjEF5rDoRiuG7kW/hvb7nC0aahGE=
X-Received: by 2002:a9d:4101:: with SMTP id o1mr4653449ote.281.1621527953214;
 Thu, 20 May 2021 09:25:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210519183855.1523927-1-robdclark@gmail.com> <20210519183855.1523927-2-robdclark@gmail.com>
 <8dcdc8d5-176c-f0ad-0d54-6466e9e68a0a@amd.com> <CAF6AEGtg_VnxYrj94AfbAfViK1v8U0ZJyfJjS4taVLMF=YVy+w@mail.gmail.com>
In-Reply-To: <CAF6AEGtg_VnxYrj94AfbAfViK1v8U0ZJyfJjS4taVLMF=YVy+w@mail.gmail.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Thu, 20 May 2021 18:25:42 +0200
Message-ID: <CAKMK7uF9Uz6amffv=bbErbU4+PQ0NRqV0Az9woQfTTikrJSrFw@mail.gmail.com>
Subject: Re: [RFC 1/3] dma-fence: Add boost fence op
To:     Rob Clark <robdclark@gmail.com>,
        Matthew Brost <matthew.brost@intel.com>
Cc:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Rob Clark <robdclark@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 20, 2021 at 4:03 PM Rob Clark <robdclark@gmail.com> wrote:
>
> On Wed, May 19, 2021 at 11:47 PM Christian K=C3=B6nig
> <christian.koenig@amd.com> wrote:
> >
> > Uff, that looks very hardware specific to me.
>
> Howso?  I'm not sure I agree.. and even if it was not useful for some
> hw, it should be useful for enough drivers (and harm no drivers), so I
> still think it is a good idea
>
> The fallback plan is to go the i915 route and stop using atomic
> helpers and do the same thing inside the driver, but that doesn't help
> any of the cases where you have a separate kms and gpu driver.

Don't, because the i915 plan is to actually move towards drm/scheduler
and atomic helpers.

> > As far as I can see you can also implement completely inside the backen=
d
> > by starting a timer on enable_signaling, don't you?
>
> Not really.. I mean, the fact that something waited on a fence could
> be a useful input signal to gpu freq governor, but it is entirely
> insufficient..
>
> If the cpu is spending a lot of time waiting on a fence, cpufreq will
> clock down so you spend less time waiting.  And no problem has been
> solved.  You absolutely need the concept of a missed deadline, and a
> timer doesn't give you that.

Yup agreed.

Adding Matt Brost, since he's planning all this boostback work.
-Daniel

>
> BR,
> -R
>
> > Christian.
> >
> > Am 19.05.21 um 20:38 schrieb Rob Clark:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > Add a way to hint to the fence signaler that a fence waiter has misse=
d a
> > > deadline waiting on the fence.
> > >
> > > In some cases, missing a vblank can result in lower gpu utilization,
> > > when really we want to go in the opposite direction and boost gpu fre=
q.
> > > The boost callback gives some feedback to the fence signaler that we
> > > are missing deadlines, so it can take this into account in it's freq/
> > > utilization calculations.
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > >   include/linux/dma-fence.h | 26 ++++++++++++++++++++++++++
> > >   1 file changed, 26 insertions(+)
> > >
> > > diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> > > index 9f12efaaa93a..172702521acc 100644
> > > --- a/include/linux/dma-fence.h
> > > +++ b/include/linux/dma-fence.h
> > > @@ -231,6 +231,17 @@ struct dma_fence_ops {
> > >       signed long (*wait)(struct dma_fence *fence,
> > >                           bool intr, signed long timeout);
> > >
> > > +     /**
> > > +      * @boost:
> > > +      *
> > > +      * Optional callback, to indicate that a fence waiter missed a =
deadline.
> > > +      * This can serve as a signal that (if possible) whatever signa=
ls the
> > > +      * fence should boost it's clocks.
> > > +      *
> > > +      * This can be called in any context that can call dma_fence_wa=
it().
> > > +      */
> > > +     void (*boost)(struct dma_fence *fence);
> > > +
> > >       /**
> > >        * @release:
> > >        *
> > > @@ -586,6 +597,21 @@ static inline signed long dma_fence_wait(struct =
dma_fence *fence, bool intr)
> > >       return ret < 0 ? ret : 0;
> > >   }
> > >
> > > +/**
> > > + * dma_fence_boost - hint from waiter that it missed a deadline
> > > + *
> > > + * @fence: the fence that caused the missed deadline
> > > + *
> > > + * This function gives a hint from a fence waiter that a deadline wa=
s
> > > + * missed, so that the fence signaler can factor this in to device
> > > + * power state decisions
> > > + */
> > > +static inline void dma_fence_boost(struct dma_fence *fence)
> > > +{
> > > +     if (fence->ops->boost)
> > > +             fence->ops->boost(fence);
> > > +}
> > > +
> > >   struct dma_fence *dma_fence_get_stub(void);
> > >   u64 dma_fence_context_alloc(unsigned num);
> > >
> >



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
