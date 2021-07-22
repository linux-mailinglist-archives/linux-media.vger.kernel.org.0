Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B287F3D26F1
	for <lists+linux-media@lfdr.de>; Thu, 22 Jul 2021 17:42:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232488AbhGVPCC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Jul 2021 11:02:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231925AbhGVPCA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Jul 2021 11:02:00 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E7BCC061575;
        Thu, 22 Jul 2021 08:42:34 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id r11so6407979wro.9;
        Thu, 22 Jul 2021 08:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xwujliw37i4nL4NHiavWRXrnZYwru6cdneVGoRJHvdk=;
        b=vONwjOWAnqwZPgVHnWoc25b8Wj1QfXGXii/0g9L8XSGIqdlNvW1l2ps1Mhs+5TOrBU
         fCcyh9cgdUFo2ztUUsPeXaAv7Eu1z+04In4U9T8GxgjkXSxWKt/9eNACufrCSl3qRohZ
         uwHCxAAIjIr3IZHqh43Nm3MVxSR0+Q2DgRTuqORJDOjKA/AAdgew3wFgwLFF9gz00FAq
         8EQS4GNCSowzaFD5B0qzWSKSkeAd77OYjbitQW8GJtHPPmI4x/RutgtfQHcBYY1iLw1N
         WBE86hNGRIqqV5ttxbhLWidcQoSbBib/xY2Kr5IQR/G9r/ndov7S24VlRtHLWXarito7
         4Vnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xwujliw37i4nL4NHiavWRXrnZYwru6cdneVGoRJHvdk=;
        b=OSR6rQLlPhHbix6IDWvo0GhRa4UBsTHcQO8WxighDPTG3y/zLh1wdR5C6zevhiFIvJ
         Z5swljO6IPn45ZB5OWtspnTqxbvgpItXkU9D6us0eRKje77ZLtgFjtIiq6vhY0cxWLlk
         PMDoMdjDlh9nZj3U2LkpmgobG0+oheD36hp9T02kAtUVnkpirMD0AzwGzEUXtGemb4Ga
         SkGB9QackPPLK24NciU/tckfvwrea0AMyqkK3o/Zip+Vla5qTqaOclduGJrdMzAUVXU+
         98HiO2mHAq0g0NgX++ADGsq7K754OqDgFQlbq3Z/nlAVHCuZncBbeCl/b6B3MB6xOjA3
         rRWA==
X-Gm-Message-State: AOAM5306YPfwPCsA1C0RwLd844pxnMXTnsFEoD8RtwzRV+BBzkWV/7Ll
        28dkKiLX9iCE4DfnOvsTrQGrKoxk/UrxETwxQ/s=
X-Google-Smtp-Source: ABdhPJwDJ6g1ZzXe281PvcjiwofPNPXNvT1fjPlHUsBiLkV88ymkjK6u/j0w4wiQy9QGguzSTEKkEgrjIKZJ4Yo751E=
X-Received: by 2002:a5d:488a:: with SMTP id g10mr561619wrq.327.1626968552928;
 Thu, 22 Jul 2021 08:42:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210720150716.1213775-1-robdclark@gmail.com> <60ffb6f3-e932-d9af-3b90-81adf0c15250@gmail.com>
 <CAF6AEGtOW3EjZWo36ij8U1om=gAqvg8CSkJJq2GkyHFGWUH4kQ@mail.gmail.com>
 <CAKMK7uF1=Y6_9znGoWG8GrteXBBRmyW8C3bFE+eJQqOj0A1buA@mail.gmail.com>
 <CAF6AEGsOVPdMkXwU9C+nDfQpPThveJ2A0jbXi43RRkkJKtnz3w@mail.gmail.com>
 <CAKMK7uHMXFqic=9APJrSf6totB8nGZTDe4x8+sv-drmV4Q+4Bg@mail.gmail.com>
 <CAF6AEGsKoucxt4a2pcdQM9+L0+YU-6TcAt8eF=3ur169646Jhw@mail.gmail.com>
 <YPhvein5e8do2AR+@phenom.ffwll.local> <113b5858-9020-d1c1-292b-96b7f9cc717a@gmail.com>
 <YPk1izQFR+tRV8js@phenom.ffwll.local> <9c1e797b-8860-d1f5-e6f2-e06380ec9012@gmail.com>
In-Reply-To: <9c1e797b-8860-d1f5-e6f2-e06380ec9012@gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 22 Jul 2021 08:46:41 -0700
Message-ID: <CAF6AEGuHLPtJ99VOSaJEFqbSum_yWHn3cMPrwcNfRn2RU3ZB5g@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH] drm/msm: Add fence->wait() op
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, Sean Paul <sean@poorly.run>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jul 22, 2021 at 2:28 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 22.07.21 um 11:08 schrieb Daniel Vetter:
> > [SNIP]
> >> As far as I know wake_up_state() tries to run the thread on the CPU it=
 was
> >> scheduled last, while wait_event_* makes the thread run on the CPU who
> >> issues the wake by default.
> >>
> >> And yes I've also noticed this already and it was one of the reason wh=
y I
> >> suggested to use a wait_queue instead of the hand wired dma_fence_wait
> >> implementation.
> > The first versions had used wait_queue, but iirc we had some issues wit=
h
> > the callbacks and stuff and that was the reasons for hand-rolling. Or
> > maybe it was the integration of the lockless fastpath for
> > dma_fence_is_signalled().
> >
> >> [SNIP]
> >> Well it would have been nicer if we used the existing infrastructure i=
nstead
> >> of re-inventing stuff for dma_fence, but that chance is long gone.
> >>
> >> And you don't need a dma_fence_context base class, but rather just a f=
lag in
> >> the dma_fence_ops if you want to change the behavior.
> > If there's something broken we should just fix it, not force everyone t=
o
> > set a random flag. dma_fence work like special wait_queues, so if we
> > differ then we should go back to that.
>
> Wait a second with that, this is not broken. It's just different
> behavior and there are good arguments for both sides.
>
> If a wait is short you can have situations where you want to start the
> thread on the original CPU.
>      This is because you can assume that the caches on that CPU are
> still hot and heating up the caches on the local CPU would take longer
> than an inter CPU interrupt.
>
> But if the wait is long it makes more sense to run the thread on the CPU
> where you noticed the wake up event.
>      This is because you can assume that the caches are cold anyway and
> starting the thread on the current CPU (most likely from an interrupt
> handler) gives you the absolutely best latency.
>      In other words you usually return from the interrupt handler and
> just directly switch to the now running thread.
>
> I'm not sure if all drivers want the same behavior. Rob here seems to
> prefer number 2, but we have used 1 for dma_fence for a rather long time
> now and it could be that some people start to complain when we switch
> unconditionally.
>

Hmm, I wonder if it would make sense to have a dma_wait_fence() flag
to control the behavior, since it is maybe more about the waiter (and
perhaps how long the waiter expects to wait) than the signaler..

BR,
-R
