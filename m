Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 494553D7960
	for <lists+linux-media@lfdr.de>; Tue, 27 Jul 2021 17:08:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236978AbhG0PIk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jul 2021 11:08:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232634AbhG0PIj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jul 2021 11:08:39 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63F9FC061760;
        Tue, 27 Jul 2021 08:08:38 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id a80-20020a1c98530000b0290245467f26a4so2598348wme.0;
        Tue, 27 Jul 2021 08:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jcrbQyHbij430xaq02MbLiHj13M2J5t4Q3rA2r97S1M=;
        b=ePJAi2hbsieHla1MODd/uh8GFZVMnIlRscK3zkhUSDAUseRyYpSPaurjOwZmuhWBGO
         MVLE9fUHyMXt38vPDmeRkKhaXHcbOsKJPWXRAhyKmcE03F+3VylPtx87Fs6hlKFBwsGN
         ZQldGQHrQfR/QhlHKTR5J98f6um8tBLzTrOq26kC6v9/unY0IJjLyZRvx1fMOKwTo1c8
         kGQ75QJ9sHCE6+Pj6M0aPcLcaGILjjJlrWOOSluledtAN51fWnsi/3b9Y/GjSwiJleRa
         HFM9TAo5gLzMOIlXlRNOcdfTUoK+7JCdlv/FgSV4wHP0m5WcUD205WybKF592XZppJh+
         eIRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jcrbQyHbij430xaq02MbLiHj13M2J5t4Q3rA2r97S1M=;
        b=hzOZOGrYUL0QLVrBKy4i17fw+kuYMbVGb/5F5BhjcQa2A29xMRylZjrMjYoMjKQOJl
         f038yYZkJQxake8D7RA9el87/WmegqLGl69CNE/SQAIh0HEX5lumH8w7PSjaDwofhZR7
         nL80ZJaLMFQRu1Xu4kNult14ieDcEdlLMrVk/NkxMu8Pqjkef+8J8Ku1HUvI9i3vGXod
         NgikdAfxuJE/KqXJbSdjMFXoB9R4C8ULX7qDV4tpmaahGFFKytErSnJ8ezUpOOWn5beb
         NHBYlT3y0b2WmJSNN5tMb92omGU21ZCbaIz8omG+5fSUWYKibfXf4B1ggEFXu845uwtR
         IRLw==
X-Gm-Message-State: AOAM532Pe8uGORWJJgeWN/ibTeCy7Yja1359qLauFz+Z3rygpRbITfxg
        1yzXthVUKzqEVmUndBMTK62ErKdyXev/iDGLfeE=
X-Google-Smtp-Source: ABdhPJyQHd8UqT9Ia3PL8c7l+eagsABe2zXZgvxuJGgX3d4FyLbIEBs//Pnd3H0g36dbX41lxRF0XyssNj+CA1b4ir4=
X-Received: by 2002:a7b:cc8b:: with SMTP id p11mr4622066wma.164.1627398516915;
 Tue, 27 Jul 2021 08:08:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210726233854.2453899-1-robdclark@gmail.com> <28ca4167-4a65-0ccc-36be-5fb017f6f49d@daenzer.net>
In-Reply-To: <28ca4167-4a65-0ccc-36be-5fb017f6f49d@daenzer.net>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 27 Jul 2021 08:12:45 -0700
Message-ID: <CAF6AEGuhQ2=DSDaGGVwBz5O+FoZEjpgoVJOcFecpd--a9yDY1w@mail.gmail.com>
Subject: Re: [RFC 0/4] dma-fence: Deadline awareness
To:     =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
Cc:     Matthew Brost <matthew.brost@intel.com>,
        Rob Clark <robdclark@chromium.org>,
        Jack Zhang <Jack.Zhang1@amd.com>, Roy Sun <Roy.Sun@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Luben Tuikov <luben.tuikov@amd.com>,
        Gustavo Padovan <gustavo@padovan.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Tian Tao <tiantao6@hisilicon.com>,
        Lee Jones <lee.jones@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 27, 2021 at 7:50 AM Michel D=C3=A4nzer <michel@daenzer.net> wro=
te:
>
> On 2021-07-27 1:38 a.m., Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Based on discussion from a previous series[1] to add a "boost" mechanis=
m
> > when, for example, vblank deadlines are missed.  Instead of a boost
> > callback, this approach adds a way to set a deadline on the fence, by
> > which the waiter would like to see the fence signalled.
> >
> > I've not yet had a chance to re-work the drm/msm part of this, but
> > wanted to send this out as an RFC in case I don't have a chance to
> > finish the drm/msm part this week.
> >
> > Original description:
> >
> > In some cases, like double-buffered rendering, missing vblanks can
> > trick the GPU into running at a lower frequence, when really we
> > want to be running at a higher frequency to not miss the vblanks
> > in the first place.
> >
> > This is partially inspired by a trick i915 does, but implemented
> > via dma-fence for a couple of reasons:
> >
> > 1) To continue to be able to use the atomic helpers
> > 2) To support cases where display and gpu are different drivers
> >
> > [1] https://patchwork.freedesktop.org/series/90331/
>
> Unfortunately, none of these approaches will have the full intended effec=
t once Wayland compositors start waiting for client buffers to become idle =
before using them for an output frame (to prevent output frames from gettin=
g delayed by client work). See https://gitlab.gnome.org/GNOME/mutter/-/merg=
e_requests/1880 (shameless plug :) for a proof of concept of this for mutte=
r. The boost will only affect the compositor's own GPU work, not the client=
 work (which means no effect at all for fullscreen apps where the composito=
r can scan out the client buffers directly).
>

I guess you mean "no effect at all *except* for fullscreen..."?  Games
are usually running fullscreen, it is a case I care about a lot ;-)

I'd perhaps recommend that wayland compositors, in cases where only a
single layer is changing, not try to be clever and just push the
update down to the kernel.

BR,
-R

>
> --
> Earthling Michel D=C3=A4nzer               |               https://redhat=
.com
> Libre software enthusiast             |             Mesa and X developer
