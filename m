Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1098830F701
	for <lists+linux-media@lfdr.de>; Thu,  4 Feb 2021 17:00:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237570AbhBDP7Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Feb 2021 10:59:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237584AbhBDPzl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Feb 2021 10:55:41 -0500
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2FC7C06178A;
        Thu,  4 Feb 2021 07:54:59 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id u66so2243575oig.9;
        Thu, 04 Feb 2021 07:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TE+20LCg4P7JDuDi9T+hP1y0ckG6wCABKFlMFLlaYRg=;
        b=I9K7YZxnalNA46Wh5Hx77j97EmE2tjIuMHosJXXvSw3CyZGysR/AJ/IBWQPzW44qW4
         erlX+94l1WSwG+/6XrZWbyZ9arxJmxCnM4PXgEbRYO4Drz109iHQ4dhFQv0R3eH+KETa
         UP/yIQL9L1KgoghJ92Ou9IqHzvzuBjvJZboPtUTdpLOyJEmxsW4InealPG0o0if7HvN0
         JfRVp1+UN2Tc5FI2T5zhrKuqCxBUmGXsIqeDEnTJaNrAj4B/PgDat1cbzb7WGGbUN1Bz
         wJy5inN4ewT1q6TRNC/gLPX5fyIzRFULylh2apOjMENakVXi+96KpaIP9zRmPRTe0BUT
         6U4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TE+20LCg4P7JDuDi9T+hP1y0ckG6wCABKFlMFLlaYRg=;
        b=fnAsiSlh3hIP6ROFx0E31hnt/1amPbH4FvqTULjhr5v2AC9pjCl88pOSsI+S3JZ3ik
         KiIEic0K9/18uqQhTLHgZM1RIg3dFPZ+ce4lAexq5fJm2v1lBYGvC876smsqG5id3/H0
         054kdwkdQE3zAn/EFu1cUCvm9vzxdC32OA8d+hrRNara8SPtPfh+378BXhmAYpImnYRR
         ztmvMrlAiTM79C5KHbHyPZP62UEGMhYHMJVXEpTpfQ7GZxzdlx7BQ5x4WGW7yYV4iLsa
         hzsN7v5T80D1EvHKfgF45JYXr/BVKQOWX04yTA2R3bK0a0fz9LY8m6SnFAVmfXpial2A
         Ppmw==
X-Gm-Message-State: AOAM530taWTZDojcDEyxRGlDPPLnfK5XY5/U9I5/k3frxUaUsWC2YzRH
        f2zsqIb9C3P0w8N0LFDKqqbrIADDY69TpLhBM1w=
X-Google-Smtp-Source: ABdhPJyHWaV6uURhsSn77dEppvf6IL/58QKDwEfT10ywtTObf87RA9Zbd2LVs5T02SCrHGMuhdJx0KX4chS3d+eTHNI=
X-Received: by 2002:aca:1a17:: with SMTP id a23mr50294oia.120.1612454099140;
 Thu, 04 Feb 2021 07:54:59 -0800 (PST)
MIME-Version: 1.0
References: <20210203003134.2422308-1-surenb@google.com> <20210203015553.GX308988@casper.infradead.org>
 <CAKMK7uHnNdjOYX5Rhj=uGMz7hSz12JhgkZJCfiqgkpjXnMfL4A@mail.gmail.com>
 <CAJuCfpG4GkVbeW=bB+Qrm5GPrZAwg0_rmyG05iwQmL7GrWAYHw@mail.gmail.com>
 <CAKMK7uHi+mG0z0HUmNt13QCCvutuRVjpcR0NjRL12k-WbWzkRg@mail.gmail.com>
 <CAKMK7uETu_m+=MHyPmqBbEP__qjMF_wmr4c2BiVTPcwE8c+5Mg@mail.gmail.com>
 <CAJuCfpHC6P5cJh-1hv=vjGHCCkM6mA_p19H6tCZmCDxhTuASkQ@mail.gmail.com> <ced1c1be-e731-946e-e9ce-919520fe935a@amd.com>
In-Reply-To: <ced1c1be-e731-946e-e9ce-919520fe935a@amd.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Thu, 4 Feb 2021 10:54:48 -0500
Message-ID: <CADnq5_Oi_To=9rpet=Q73FY2_-abV47XtXYVVz5TBnRyzwffng@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] mm: replace BUG_ON in vm_insert_page
 with a return of an error
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Suren Baghdasaryan <surenb@google.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Christoph Hellwig <hch@infradead.org>,
        Sandeep Patil <sspatil@google.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux MM <linux-mm@kvack.org>,
        Robin Murphy <robin.murphy@arm.com>,
        James Jones <jajones@nvidia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Matthew Wilcox <willy@infradead.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, Minchan Kim <minchan@kernel.org>,
        Liam Mark <lmark@codeaurora.org>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        Hridya Valsaraju <hridya@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Android Kernel Team <kernel-team@android.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Feb 4, 2021 at 3:16 AM Christian K=C3=B6nig <christian.koenig@amd.c=
om> wrote:
>
> Am 03.02.21 um 22:41 schrieb Suren Baghdasaryan:
> > [SNIP]
> >>> How many semi-unrelated buffer accounting schemes does google come up=
 with?
> >>>
> >>> We're at three with this one.
> >>>
> >>> And also we _cannot_ required that all dma-bufs are backed by struct
> >>> page, so requiring struct page to make this work is a no-go.
> >>>
> >>> Second, we do not want to all get_user_pages and friends to work on
> >>> dma-buf, it causes all kinds of pain. Yes on SoC where dma-buf are
> >>> exclusively in system memory you can maybe get away with this, but
> >>> dma-buf is supposed to work in more places than just Android SoCs.
> >> I just realized that vm_inser_page doesn't even work for CMA, it would
> >> upset get_user_pages pretty badly - you're trying to pin a page in
> >> ZONE_MOVEABLE but you can't move it because it's rather special.
> >> VM_SPECIAL is exactly meant to catch this stuff.
> > Thanks for the input, Daniel! Let me think about the cases you pointed =
out.
> >
> > IMHO, the issue with PSS is the difficulty of calculating this metric
> > without struct page usage. I don't think that problem becomes easier
> > if we use cgroups or any other API. I wanted to enable existing PSS
> > calculation mechanisms for the dmabufs known to be backed by struct
> > pages (since we know how the heap allocated that memory), but sounds
> > like this would lead to problems that I did not consider.
>
> Yeah, using struct page indeed won't work. We discussed that multiple
> times now and Daniel even has a patch to mangle the struct page pointers
> inside the sg_table object to prevent abuse in that direction.
>
> On the other hand I totally agree that we need to do something on this
> side which goes beyong what cgroups provide.
>
> A few years ago I came up with patches to improve the OOM killer to
> include resources bound to the processes through file descriptors. I
> unfortunately can't find them of hand any more and I'm currently to busy
> to dig them up.

https://lists.freedesktop.org/archives/dri-devel/2015-September/089778.html
I think there was a more recent discussion, but I can't seem to find it.

Alex

>
> In general I think we need to make it possible that both the in kernel
> OOM killer as well as userspace processes and handlers have access to
> that kind of data.
>
> The fdinfo approach as suggested in the other thread sounds like the
> easiest solution to me.
>
> Regards,
> Christian.
>
> > Thanks,
> > Suren.
> >
> >
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
