Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F98D284B30
	for <lists+linux-media@lfdr.de>; Tue,  6 Oct 2020 13:57:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726197AbgJFL5H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Oct 2020 07:57:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726087AbgJFL5H (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Oct 2020 07:57:07 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 447C7C0613D3
        for <linux-media@vger.kernel.org>; Tue,  6 Oct 2020 04:57:05 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id m13so12016758otl.9
        for <linux-media@vger.kernel.org>; Tue, 06 Oct 2020 04:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0/v0p3FvFQy6vefIiWkN5sABT9yaRl0KmB4aTLtFJ80=;
        b=lLhpfE52DsBTlXOZaNcfYtajrRM/cDqIwevRSBDcVW4qoPVbzEi7+sihe6YcHp2QOU
         hnAD2eoXIOk84DvIqJ2RTZpXb49sc13g/2RKsA0kTklQEV+Sykz8QqnvTSECPTErHsRx
         qsTQaNy+j6UOMtosFQSSws5ErF7y9aC00H4zo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0/v0p3FvFQy6vefIiWkN5sABT9yaRl0KmB4aTLtFJ80=;
        b=Y7tu0cX4noWcsoNn2ejvvfNiNJA3xRwRvD1FqLNuGT6wkYFGc6gXMQWPbExKQXTx+m
         9fsijUH8LqWpmTDjddSdqCHbQ9A/XGw7Pv02kAAzNABuvCXb/kSi4Yp9jMqF5NFUSDeq
         dMmBVEi7Jnf55tv7Kr96yz5lhc76HxpM7J1McX29bpSlKfUA95ZvK4HInn+p7w47Xo9l
         8kW+hg5FL7gWbVeN3KFXLDFHErCd8jUGs8THU7VRhWdMzSStkNh8hJiRnEV/zVU8HWQB
         yOi/aswV1uyeLM9w8/+xFT9Ta1P4nEY0yr/ZwflN60T6B0Vt3ojCjeelQo0RcHExwM8m
         Th/w==
X-Gm-Message-State: AOAM533YqflUKAogkzV4oyO0bbrIceX+byoWjeq4H/UjLlsqYd5oWqQg
        FoblLE809ka8Rc2G6MKgoXCiZ2MlXz+XYVu2ou1czA==
X-Google-Smtp-Source: ABdhPJyMG6+nB6zVd1RDfgIGK4/zu55vJ18yPOXo0KPUU4RdObE/Y3T3eJQEZZwVcpMDmw5VSMtR9OkGz5YHDq9+Jw8=
X-Received: by 2002:a05:6830:1c3c:: with SMTP id f28mr2857746ote.188.1601985424516;
 Tue, 06 Oct 2020 04:57:04 -0700 (PDT)
MIME-Version: 1.0
References: <0-v1-447bb60c11dd+174-frame_vec_fix_jgg@nvidia.com>
 <20201005175308.GI4225@quack2.suse.cz> <20201005175746.GA4734@nvidia.com>
In-Reply-To: <20201005175746.GA4734@nvidia.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Tue, 6 Oct 2020 13:56:53 +0200
Message-ID: <CAKMK7uGrQq6tb2hMUSC-=JkTNMC2DvdQkcZncmVBKZ-0x6S61Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
To:     Jason Gunthorpe <jgg@nvidia.com>
Cc:     Jan Kara <jack@suse.cz>, andrew Morton <akpm@linux-foundation.org>,
        Linux MM <linux-mm@kvack.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@osg.samsung.com>,
        Mel Gorman <mgorman@suse.de>, stable <stable@vger.kernel.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        John Hubbard <jhubbard@nvidia.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 5, 2020 at 7:58 PM Jason Gunthorpe <jgg@nvidia.com> wrote:
>
> On Mon, Oct 05, 2020 at 07:53:08PM +0200, Jan Kara wrote:
> > On Mon 05-10-20 14:38:54, Jason Gunthorpe wrote:
> > > When get_vaddr_frames() does its hacky follow_pfn() loop it should never
> > > be allowed to extract a struct page from a normal VMA. This could allow a
> > > serious use-after-free problem on any kernel memory.
> > >
> > > Restrict this to only work on VMA's with one of VM_IO | VM_PFNMAP
> > > set. This limits the use-after-free problem to only IO memory, which while
> > > still serious, is an improvement.
> > >
> > > Cc: stable@vger.kernel.org
> > > Fixes: 8025e5ddf9c1 ("[media] mm: Provide new get_vaddr_frames() helper")
> > > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> > >  mm/frame_vector.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/mm/frame_vector.c b/mm/frame_vector.c
> > > index 10f82d5643b6de..26cb20544b6c37 100644
> > > +++ b/mm/frame_vector.c
> > > @@ -99,6 +99,10 @@ int get_vaddr_frames(unsigned long start, unsigned int nr_frames,
> > >             if (ret >= nr_frames || start < vma->vm_end)
> > >                     break;
> > >             vma = find_vma_intersection(mm, start, start + 1);
> > > +           if (!(vma->vm_flags & (VM_IO | VM_PFNMAP))) {
> > > +                   ret = -EINVAL;
> > > +                   goto out;
> > > +           }
> > >     } while (vma && vma->vm_flags & (VM_IO | VM_PFNMAP));
> >
> > Hum, I fail to see how this helps. If vma has no VM_IO or VM_PFNMAP flag,
> > we'd exit the loop (to out: label) anyway due to the loop termination
> > condition and why not return the frames we already have? Furthermore
> > find_vma_intersection() can return NULL which would oops in your check
> > then. What am I missing?
>
> Oh, nothing, you are right. It just didn't read naturally because
> hitting the wrong kind of VMA should be an error condition :\

Also follow_pfn checks for this same conditionat already too, so this
isn't really stopping anything bad from happening.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
