Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9B49405BB3
	for <lists+linux-media@lfdr.de>; Thu,  9 Sep 2021 19:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239891AbhIIRFH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Sep 2021 13:05:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234524AbhIIRFG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Sep 2021 13:05:06 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5C94C061574;
        Thu,  9 Sep 2021 10:03:56 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id x6so3526387wrv.13;
        Thu, 09 Sep 2021 10:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IbPPNqobPmWZ9MF50JtcVBJ+K5zUi+K+HgQrnexV6is=;
        b=BE/y2bL/mHyRfUxGmarxT/nWkFdJyoDiJQtSLvbtElf2UESCirtPhVWa0xURMyE5tF
         rYTmwmayvMNAV77nMn8OnSbsQBXKaho0Mf7sx1UJRiNp/0zyvd2vEvD1ZcsOP6Idyh8I
         nJMdkiJveWXI8MXP3/S+LHsYohhkLiI5HAvtYoDeM1SJxY7AIldHjSqxxEhtIkYmYB84
         5QNzYwGK3ubwMbqUocdIOoNCwQeHafOucLmkD0NJibGsl58DOIzZPkxc1wHSjsdtDsMX
         7FbfsGNMPGgQl1HAh6ggsseaIz9cj2Sa7YnMJe1vCa6t0dT04seBaMEuTQ7jh5W87Jol
         XAQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IbPPNqobPmWZ9MF50JtcVBJ+K5zUi+K+HgQrnexV6is=;
        b=rxQGOUzpOgv47146cQYjpF4xtGug1sWiwAr19bMy8DjEiTOj0V5jQjOGKgJI3WHzWb
         BoWXoUdNa7zu37A/KagANAV1yZciXq21GhVyjRBIeVq1Cb9H/Ml++770UTQo6ijkK/Ty
         v1xT0FyVt2f0yJuq0RoqREbcbe88eh7F5z0B803ZEOx6Dk2av2L3GWAxrxVPWJfjBer6
         6i0goL30lKALNTHlFBAnQ6jruxiw5Hi5T9Kfjc5KGIAut2wtd1gLRQG6cEj8orcNYK/2
         CUEX3oDm6GNDH0DHYiPGuueUQaKEVL4Iip/5qcJC9kDZQ8zWX1JFfO9nSNR8JoFd8lKN
         8iTg==
X-Gm-Message-State: AOAM530DG6I3HpxTS6rhlNJAf/OJ40YvpEFLIpfYFN05/Iz9Ef8Fz3WX
        QFCBaIIJQpJPF7MMFdsab7a6J6o5TluPUpzSr90=
X-Google-Smtp-Source: ABdhPJxhkpYn5lOEWS5HH3Rm8m0d/wuvw1EtxFJjV07j/rVitgQQ8dAircwjT8ySc+dDGJd0RC694oWjtFnG4vZItxk=
X-Received: by 2002:a05:6000:178b:: with SMTP id e11mr4750688wrg.151.1631207035454;
 Thu, 09 Sep 2021 10:03:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210903184806.1680887-1-robdclark@gmail.com> <i-XmBd_5J3_d8cdm-IT6Ery2kHN0FPZCX968aU5idvxQxNlvDJguLLThtF2NF15LF8gGsH4uI2w0s0CL_39KGpzoGpuCgcz2_-4Wjf3AYEM=@emersion.fr>
 <CAF6AEGuD2bnFpmSWtGxU5+AFj1HVKtnOZmLKRr-pDVbLn0nPVw@mail.gmail.com> <CZ2qg4SOe8RnrJpAfZtag_GZTFRt6wAdspKbP4RqpFQCE9Wiuf4xyHTUyKIkaXGu6LfKpSALrmOC3jxgfPdMRjgIAkrkvTnNd9stjXqnPNI=@emersion.fr>
In-Reply-To: <CZ2qg4SOe8RnrJpAfZtag_GZTFRt6wAdspKbP4RqpFQCE9Wiuf4xyHTUyKIkaXGu6LfKpSALrmOC3jxgfPdMRjgIAkrkvTnNd9stjXqnPNI=@emersion.fr>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 9 Sep 2021 10:08:22 -0700
Message-ID: <CAF6AEGseoCzbYXUjsJNo7q-_g3FBmn0+BPMKf=QX5gunhOeKKA@mail.gmail.com>
Subject: Re: [PATCH v3 0/9] dma-fence: Deadline awareness
To:     Simon Ser <contact@emersion.fr>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
        =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        freedreno <freedreno@lists.freedesktop.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>, Luben Tuikov <luben.tuikov@amd.com>,
        Melissa Wen <mwen@igalia.com>,
        Steven Price <steven.price@arm.com>,
        Tian Tao <tiantao6@hisilicon.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 9, 2021 at 9:42 AM Simon Ser <contact@emersion.fr> wrote:
>
> On Thursday, September 9th, 2021 at 18:31, Rob Clark <robdclark@gmail.com> wrote:
>
> > Yes, I think it would.. and "dma-buf/sync_file: Add SET_DEADLINE
> > ioctl" adds such an ioctl.. just for the benefit of igt tests at this
> > point, but the thought was it would be also used by compositors that
> > are doing such frame scheduling. Ofc danvet is a bit grumpy that
> > there isn't a more real (than igt) userspace for the ioctl yet ;-)
>
> Ah, very nice, I somehow missed it.
>
> I guess one issue is that explicit sync isn't quite plumbed through
> compositors yet, so without Jason's DMA-BUF to sync_file IOCTL it'd be
> a bit difficult to use.
>
> Can anybody set the deadline? I wonder if clients should be allowed to.

In its current form, anyone who has the fd can.. I'm not sure how (or
even if) we could limit it beyond that.  I suppose hypothetically you
could use this for completely non-compositor related things, like
compute jobs where you want the result by some deadline.  (OTOH, it
could be the driver using this internally when the app is stalling on
a result)

> What happens if the deadline is exceeded? I'd assume nothing in
> particular, the deadline being just a hint?

Nothing in particular, it is just a hint.  The main intention is to
provide a feedback hint to the drivers in scenarios like vblank
deadlines, where being 1ms late is just as bad as being
$frame_duration-1ms late.  From my experiments and profiling it is
useful in a couple scenarios:

1) input latency, ie. go from idle to fullscreen animation, where GPU
has been idle for a while and not busy enough *yet* for devfreq to
kick in and start ramping up the freq before we miss the first vblank
2) double buffering, for ex. if you are 1ms late you end up stalling
15ms before the gpu can start rendering the next frame.. in the
absence of feedback, devfreq would ramp down in this scenario instead
of up

BR,
-R
