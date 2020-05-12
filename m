Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC4AF1CEAA5
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 04:14:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728575AbgELCOe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 22:14:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727942AbgELCOd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 22:14:33 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87E3EC061A0C;
        Mon, 11 May 2020 19:14:33 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id yc10so7772708ejb.12;
        Mon, 11 May 2020 19:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6gJvFOJgRmCUuHQ9KCv0CAQBXJvMZ3ZEqpa1faKKd80=;
        b=D6meoNPiM/kyzO8itLiSOkXRVo2//1y42iO0SvsJphtgJc+98LNMkQyuYCgzAGZueb
         MCqVzNdD6z41HnSMAh6Nq4oQc+co5pwat8b0NK+qxYWE4hBAcuwkjPeFRL6eMIPtmsOc
         CHgXW0JqigelR2oxmJ6ZpGfv7ABk4iGu5Le9PUPfojeEZpjHcpl+bBDOqejGvLFgHLNP
         L64GyHrJFQ+dXLZeKuHP5qNfLXqcMotUKFo+0JjY+SeZ7aSKN+pky2j9aB2GCQxxYEOe
         0KK7mN6qN0ZprKspu11gTihjR5yE0Nts47MfgiP2KZjQInixK+KnscSeSP26B5iI+rT+
         KZKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6gJvFOJgRmCUuHQ9KCv0CAQBXJvMZ3ZEqpa1faKKd80=;
        b=PP02KZSjYSsLQyDBObydjsD4RxD4avLhg+xX7eSrCLklg3p0JOXfC1XW1dJT9h0Z47
         hMJgUbPpMSzp3753/hPBOyR7hH05+n7sTbRKAKV5DHumE4mVFlyzKQxgminFdxzjCmfL
         nXOXWkzHPMfw4dJvKRsk0EfGil58gxfvrdu+Szg8358BOdbn3ag/ssDI5Id3iizHkQIs
         3JjKjKN3fCKkMm8Q+8vEST5T4e/5HQLZmegIdoSMux9E0MvS8K6Sgfjw6wOMlZSitNXI
         18e5WzoXI+8/hqzrWX2Fz5M4Nh0OXk6BysbFjnJyDB+dGd4GKxMBec3YX8LAzFF8JWfu
         kTkA==
X-Gm-Message-State: AGi0PuaCMZOkrL8cfhYjQtGuyQWSJCIK+GcQClHxXKlmgQmio/YtksSO
        ImBtyLPZ0LRDn/o2o6nZyDRdHrf1rPEWWTQerUM=
X-Google-Smtp-Source: APiQypKvoGJ05XwMC2ywwTCNcJ1snijF1Y8YHOxuAycdEcZGBHIMpEuM9QUFeK3xCS81J/YmfWca02XITf2P9jmfZVw=
X-Received: by 2002:a17:907:2155:: with SMTP id rk21mr16482845ejb.163.1589249672229;
 Mon, 11 May 2020 19:14:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200511091142.208787-1-daniel.vetter@ffwll.ch>
 <20200511091142.208787-3-daniel.vetter@ffwll.ch> <CAFCwf10m14ModSuRbQAsWf5CSJvTeP7YRzcokD=o+m2Pa0TqKg@mail.gmail.com>
In-Reply-To: <CAFCwf10m14ModSuRbQAsWf5CSJvTeP7YRzcokD=o+m2Pa0TqKg@mail.gmail.com>
From:   Dave Airlie <airlied@gmail.com>
Date:   Tue, 12 May 2020 12:14:20 +1000
Message-ID: <CAPM=9tyukFdDiM6-Mxd+ouXCt9Z4t6LRZwxq7DGoX9drrHnMdQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 3/3] misc/habalabs: don't set default fence_ops->wait
To:     Oded Gabbay <oded.gabbay@gmail.com>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, Olof Johansson <olof@lixom.net>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 11 May 2020 at 19:37, Oded Gabbay <oded.gabbay@gmail.com> wrote:
>
> On Mon, May 11, 2020 at 12:11 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >
> > It's the default.
> Thanks for catching that.
>
> >
> > Also so much for "we're not going to tell the graphics people how to
> > review their code", dma_fence is a pretty core piece of gpu driver
> > infrastructure. And it's very much uapi relevant, including piles of
> > corresponding userspace protocols and libraries for how to pass these
> > around.
> >
> > Would be great if habanalabs would not use this (from a quick look
> > it's not needed at all), since open source the userspace and playing
> > by the usual rules isn't on the table. If that's not possible (because
> > it's actually using the uapi part of dma_fence to interact with gpu
> > drivers) then we have exactly what everyone promised we'd want to
> > avoid.
>
> We don't use the uapi parts, we currently only using the fencing and
> signaling ability of this module inside our kernel code. But maybe I
> didn't understand what you request. You want us *not* to use this
> well-written piece of kernel code because it is only used by graphics
> drivers ?
> I'm sorry but I don't get this argument, if this is indeed what you meant.

We would rather drivers using a feature that has requirements on
correct userspace implementations of the feature have a userspace that
is open source and auditable.

Fencing is tricky, cross-device fencing is really tricky, and having
the ability for a closed userspace component to mess up other people's
drivers, think i915 shared with closed habana userspace and shared
fences, decreases ability to debug things.

Ideally we wouldn't offer users known untested/broken scenarios, so
yes we'd prefer that drivers that intend to expose a userspace fencing
api around dma-fence would adhere to the rules of the gpu drivers.

I'm not say you have to drop using dma-fence, but if you move towards
cross-device stuff I believe other drivers would be correct in
refusing to interact with fences from here.

Dave.
