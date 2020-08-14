Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B4EE2449A3
	for <lists+linux-media@lfdr.de>; Fri, 14 Aug 2020 14:13:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726360AbgHNMMx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Aug 2020 08:12:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726455AbgHNMMv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Aug 2020 08:12:51 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B613CC061384
        for <linux-media@vger.kernel.org>; Fri, 14 Aug 2020 05:12:50 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id a65so7371497otc.8
        for <linux-media@vger.kernel.org>; Fri, 14 Aug 2020 05:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pealV+VydqDZW06bmrAL2YWzJvMklEWwyLNagmsldhI=;
        b=SshzTGVTX9qSp4jXsV9wNHDUrUp0DTAC7I1wEKGvJcu+kWKbql/3afrqqWf5m0DhfS
         3AhB0fxrKzQLTMmhw8HURKJZeQYmZ2sRJjjMexL45rjDuZBGRxkaak+c74FTfGiWIL4N
         4osh+nq1UXZGhhgnSm7T9BepqjYyjWlQTKP4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pealV+VydqDZW06bmrAL2YWzJvMklEWwyLNagmsldhI=;
        b=HpOn1xWTus5NIdabBOPY066+fKk1irRMIlK54Hs+C0KDemVAf2VFc9KGGl1OggO4MA
         5ICnSKSlgpDXSFL3oP6fhx7+ngerSoypvIaxiAYM8C0TzHHHNgNGAIfEWL5BmR9vESDM
         TnhXX/7PSW09nsd4FShHd8kYFf+/ytwW2rZZ4rxYphb10oDEZ03zj1q5u04QwBuIXr5Q
         Rw4tzTquxJd6qk9ZaBRtjNDsdWqBr51Z5/fzfC6bnXfzaEkSJaOP/2w+5ODa0AmJicgN
         iFPStO8syU9Z2ZYwvVohC8RiFk2om8+7Rx/BIyTNiR9DCd3TbHSQVZ1xzej7s9OiWic/
         arXg==
X-Gm-Message-State: AOAM5310MaHhDWp21PDrGLblvQnU7DXdy3bbYLJqWdzrVZH7ve/sHdX6
        tS6Y0xjAD15IcNwnXrn4fSteD95JSfLlj3Lj86UxEA==
X-Google-Smtp-Source: ABdhPJzjIk+koLVPuyqLeA1q3XTupnXm3QaHEKeMDW+mnwE9sPDMUOhSRRI5znL0kjiqqjI+AojPRr1bQ3FPyNkRa/U=
X-Received: by 2002:a05:6830:1e71:: with SMTP id m17mr1780869otr.188.1597407169658;
 Fri, 14 Aug 2020 05:12:49 -0700 (PDT)
MIME-Version: 1.0
References: <57062477-30e7-a3de-6723-a50d03a402c4@kapsi.fi>
In-Reply-To: <57062477-30e7-a3de-6723-a50d03a402c4@kapsi.fi>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Fri, 14 Aug 2020 14:12:38 +0200
Message-ID: <CAKMK7uEatNdZ64QmGXLY3GCqDquAr0rcTFF0006K7+L_vySYzg@mail.gmail.com>
Subject: Re: Role of DMA Heaps vs GEM in allocation
To:     Mikko Perttunen <cyndis@kapsi.fi>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Aug 14, 2020 at 1:34 PM Mikko Perttunen <cyndis@kapsi.fi> wrote:
>
> Hi,
>
> I'm currently working on a new UAPI for Host1x/TegraDRM (see first draft
> in thread "[RFC] Host1x/TegraDRM UAPI"[1]). One question that has come
> up is regarding the buffer allocation mechanism. Traditionally, DRM
> drivers provide custom GEM allocation IOCTLs. However, we now have DMA
> Heaps, which would be sufficient for TegraDRM's needs, so we could skip
> implementing any GEM IOCTLs in the TegraDRM UAPI, and rely on importing
> DMA-BUFs. This would mean less code on TegraDRM's side.
>
> However, one complication with using DMA Heaps is that it only provides
> DMA-BUF FDs, so it is possible that a user application could run out of
> free file descriptors if it is not adjusting its soft FD limit. This
> would especially be a problem for existing applications that might have
> worked with the traditional GEM model and didn't need to adjust their FD
> limits, but would then fail in some situations with the increased FD
> usage of DMA-BUF FDs.
>
> My question is then: what is the role of DMA Heaps? If it is to be used
> as a central allocator, should the FD issue be left to the application,
> or addressed somehow? Should it be considered a potential alternative
> for GEM allocations?

Atm no one knows. What's for sure is that dma-buf fd are meant to
establish sharing, and then once imported everywhere, closed again.
dma-buf heaps might or might be useful for sharing the cross-device
memory allocator problem (the rough idea is that in sysfs every device
lists all the heaps it can use, and then you pick the common one that
works for all devices). But that's for shared buffers only.

For an acceleration driver you want drm gem ids, because yes fd
limits. Also constantly having to reimport dma-buf for every cs ioctl
doesn't sound like a bright idea either, there's a reason we have the
drm_prime cache and all that stuff.

I have also no idea why you wouldn't want to use the existing drm
infrastructure, it's all there.

Cheers, Daniel

>
> Thanks,
> Mikko
>
> [1] https://www.spinics.net/lists/dri-devel/msg262021.html
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
