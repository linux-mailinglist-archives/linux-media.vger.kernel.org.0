Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C3502AFEF4
	for <lists+linux-media@lfdr.de>; Thu, 12 Nov 2020 06:42:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728270AbgKLFmB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Nov 2020 00:42:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728716AbgKLFjR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Nov 2020 00:39:17 -0500
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4765CC0617A6
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2020 21:39:17 -0800 (PST)
Received: by mail-lj1-x244.google.com with SMTP id b17so4665307ljf.12
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2020 21:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Yv2Pj9PDV7sIfV/tkESHXJ55GaWZncr9TsyJJzMjRV4=;
        b=F5OJ5El8ZBPyveOMEas7Dvy0Ybf3roUDGX9nSKt/GvFKemsoIoZ3H3nxTqaL11T8KR
         MlDVCiFBTFnmPeru3luSMFilW7RDlXBpncqfJ/ik8dtbAEV+uU9O4ykTLQ0vMTK4AK+e
         gH+latBs+/B9MQtZspFvwfvUpkrYDZxs2VGmkbeY0hnfW5RxPJj7CTXPwZB2VPw0J8Jt
         xxW3Q8U1TdLhmo9/qI2QgTpEUm5KMVBFgLjEV0keuVAIEtXCqLonk+rPhj94q4KGWsR4
         /REgtXQ7jepo3gGBO5gi+YAeXP6Wdk63zEsFPLdqWDoSEjIRVEjvUmNdPi91xk503wLa
         wPxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Yv2Pj9PDV7sIfV/tkESHXJ55GaWZncr9TsyJJzMjRV4=;
        b=bRtHgbo7UaMOkDK56Z6iJ1Ju33dOkXARS9A/2Xlu80rL3S/jJctBPIAExCc+3HtlCH
         Mgehtn+RtPbZk/sobH7Rwv5Nd9SKLpyKyIHBTc32P3vyE7cOjTGTEGagqTU1tH1Qj5MM
         /Gr6OvUQ0lY3nQFpICi6o70Q9zZAC1c4L7CofW9IgAOg3TUv4Aq2EVBuEW+jHgEABbWQ
         RQhA+a6Q/d+0rQF+bgkWkiWhLzEI2QDPd8ZZ9OhC/zPASMvk/p4ZDSD6dMBwtcYBg/4u
         taM/8mocUl7GLEqVP/ZxzHYhARgsQXIE/pfhBiEjPZnsKbEsmMmgFbJsJdE5n1QPoZ13
         VEaA==
X-Gm-Message-State: AOAM530CJndSjlTW4X/PhLsNpxIq7iGcm2TTNC2KGmftY3EhGoE/dWKT
        wp2OCJ3DXNpkqXf6eG3NpVAhqv1mZFMmfAlN/fiqmA==
X-Google-Smtp-Source: ABdhPJxSyeHxpGUg5+j/tG7KO7L13ECyFVZf7kpwDci8FU3UWauWNnoJj0AppaojWgSaIZqN7Vl9OOMbXqhxUKZdzIc=
X-Received: by 2002:a05:651c:506:: with SMTP id o6mr11013134ljp.249.1605159555688;
 Wed, 11 Nov 2020 21:39:15 -0800 (PST)
MIME-Version: 1.0
References: <20201110034934.70898-1-john.stultz@linaro.org>
In-Reply-To: <20201110034934.70898-1-john.stultz@linaro.org>
From:   Sumit Semwal <sumit.semwal@linaro.org>
Date:   Thu, 12 Nov 2020 11:09:04 +0530
Message-ID: <CAO_48GHNE6AyKv4k=3=2EVjfSZsgz4pjuMJ1xJojbuFU9a90EQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] dma-buf: Performance improvements for system heap
 & a system-uncached implementation
To:     John Stultz <john.stultz@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Christian Koenig <christian.koenig@amd.com>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Sandeep Patil <sspatil@google.com>,
        Daniel Mentz <danielmentz@google.com>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>,
        James Jones <jajones@nvidia.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        DRI mailing list <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi John,

On Tue, 10 Nov 2020 at 09:19, John Stultz <john.stultz@linaro.org> wrote:
>
> Hey All,
>   So just wanted to send my last revision of my patch series
> of performance optimizations to the dma-buf system heap.

Thanks very much for your patches - I think the first 5 patches look good t=
o me.

I know there was a bit of discussion over adding a new system-uncached
heap v/s using a flag to identify that; I think I prefer the separate
heap idea, but lets ask one last time if any one else has any real
objections to it.

Daniel, Christian: any comments from your side on this?

I am planning to merge this series to drm-misc this week if I hear no
objections.
>
> This series reworks the system heap to use sgtables, and then
> consolidates the pagelist method from the heap-helpers into the
> CMA heap. After which the heap-helpers logic is removed (as it
> is unused). I'd still like to find a better way to avoid some of
> the logic duplication in implementing the entire dma_buf_ops
> handlers per heap. But unfortunately that code is tied somewhat
> to how the buffer's memory is tracked. As more heaps show up I
> think we'll have a better idea how to best share code, so for
> now I think this is ok.
>
> After this, the series introduces an optimization that
> =C3=98rjan Eide implemented for ION that avoids calling sync on
> attachments that don't have a mapping.
>
> Next, an optimization to use larger order pages for the system
> heap. This change brings us closer to the current performance
> of the ION allocation code (though there still is a gap due
> to ION using a mix of deferred-freeing and page pools, I'll be
> looking at integrating those eventually).
>
> Finally, a reworked version of my uncached system heap
> implementation I was submitting a few weeks back. Since it
> duplicated a lot of the now reworked system heap code, I
> realized it would be much simpler to add the functionality to
> the system_heap implementation itself.
>
> While not improving the core allocation performance, the
> uncached heap allocations do result in *much* improved
> performance on HiKey960 as it avoids a lot of flushing and
> invalidating buffers that the cpu doesn't touch often.
>
> Feedback on these would be great!
>
> thanks
> -john
>
> New in v5:
> * Added a comment explaining why the order sizes are
>   chosen as they are
>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Liam Mark <lmark@codeaurora.org>
> Cc: Laura Abbott <labbott@kernel.org>
> Cc: Brian Starkey <Brian.Starkey@arm.com>
> Cc: Hridya Valsaraju <hridya@google.com>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Sandeep Patil <sspatil@google.com>
> Cc: Daniel Mentz <danielmentz@google.com>
> Cc: Chris Goldsworthy <cgoldswo@codeaurora.org>
> Cc: =C3=98rjan Eide <orjan.eide@arm.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Ezequiel Garcia <ezequiel@collabora.com>
> Cc: Simon Ser <contact@emersion.fr>
> Cc: James Jones <jajones@nvidia.com>
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
>
> John Stultz (7):
>   dma-buf: system_heap: Rework system heap to use sgtables instead of
>     pagelists
>   dma-buf: heaps: Move heap-helper logic into the cma_heap
>     implementation
>   dma-buf: heaps: Remove heap-helpers code
>   dma-buf: heaps: Skip sync if not mapped
>   dma-buf: system_heap: Allocate higher order pages if available
>   dma-buf: dma-heap: Keep track of the heap device struct
>   dma-buf: system_heap: Add a system-uncached heap re-using the system
>     heap
>
>  drivers/dma-buf/dma-heap.c           |  33 +-
>  drivers/dma-buf/heaps/Makefile       |   1 -
>  drivers/dma-buf/heaps/cma_heap.c     | 324 +++++++++++++++---
>  drivers/dma-buf/heaps/heap-helpers.c | 270 ---------------
>  drivers/dma-buf/heaps/heap-helpers.h |  53 ---
>  drivers/dma-buf/heaps/system_heap.c  | 494 ++++++++++++++++++++++++---
>  include/linux/dma-heap.h             |   9 +
>  7 files changed, 753 insertions(+), 431 deletions(-)
>  delete mode 100644 drivers/dma-buf/heaps/heap-helpers.c
>  delete mode 100644 drivers/dma-buf/heaps/heap-helpers.h
>
> --
> 2.17.1
>
Thanks much,

Best,
Sumit.
