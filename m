Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A89552866A7
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 20:14:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728836AbgJGSOW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 14:14:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727237AbgJGSOT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 14:14:19 -0400
Received: from mail-oo1-xc42.google.com (mail-oo1-xc42.google.com [IPv6:2607:f8b0:4864:20::c42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AF58C0613D4
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 11:14:17 -0700 (PDT)
Received: by mail-oo1-xc42.google.com with SMTP id g8so859717oov.0
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2020 11:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cQRYAtP+xjx5WuekS6OE0CV7kqmxj7BYflzO3gWdvvE=;
        b=lyjVFBq/8C4cx1xV9ChTXnV40ihqdqpwLDP0hKiWG7wMCAY1kcUxadTiFEkVrngi/w
         V9y6TiR2NUPQYfn7qatcnS2KH2rC4iURG1Imt+VcjCPG3gMt13p5HinunxSiaAfYb6mn
         oHrygbKnexw8amjrZlMfKtPR5lb/S9ssQU4cU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cQRYAtP+xjx5WuekS6OE0CV7kqmxj7BYflzO3gWdvvE=;
        b=sinDpU6rbg7XaZ6LYqSkKWIKKQZkvqJOqcj9/nPAfcQ9KHnnPaWXGoF5oQ33h9Vtlc
         P8fuFE3+IYkYxwsdEUjHCS2E1//+QP978pmX2CByRAwthgwJZKMbKL+0mFqHdWXPgdnf
         3x7OUKDPa6v3MvxR7TCJZOkki3/SPunM/ja1dwJnu19BpBDK9/4kn8H6mok0ZdUVk2a3
         alMRhPSJ3WcroN11gnWO5Erhbwz7q4WGj5E2o4O6JepdcBo4KQzF2YrpfUcCFwcJBu7C
         KVYpj3pY1oTYeUUW++La+WMRhzFgY1Ym9S39u07nWsG90aSL0LGTce8NEL9tlXKi4B8F
         3w1w==
X-Gm-Message-State: AOAM5308tsPjSeoEjKWc8AppAwn9cgN8wMoXTk0G0InLy0ZRRV6VciLG
        vc56zJwvWLAL/CFjFzGrJhcmlznBgRCCvpSMR2oidA==
X-Google-Smtp-Source: ABdhPJzjOjAMzRbSVSt+lqfvvsdq1EBjj80477iZlPA7zPuN7ej1AyuyFSKWwEDM91Ycyft1zzLM1yCXh0Q5piW4a7o=
X-Received: by 2002:a4a:e592:: with SMTP id o18mr2831112oov.28.1602094456975;
 Wed, 07 Oct 2020 11:14:16 -0700 (PDT)
MIME-Version: 1.0
References: <20201007164426.1812530-1-daniel.vetter@ffwll.ch>
 <20201007164426.1812530-14-daniel.vetter@ffwll.ch> <20201007173911.GX5177@ziepe.ca>
In-Reply-To: <20201007173911.GX5177@ziepe.ca>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Wed, 7 Oct 2020 20:14:06 +0200
Message-ID: <CAKMK7uEbAAJPPmv1yM_-V24Xg=S=NWxs2Yhi51kb-4AZLbFTTg@mail.gmail.com>
Subject: Re: [PATCH 13/13] vfio/type1: Mark follow_pfn as unsafe
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org,
        Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>, linux-s390@vger.kernel.org,
        Daniel Vetter <daniel.vetter@intel.com>,
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Alex Williamson <alex.williamson@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 7, 2020 at 7:39 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Wed, Oct 07, 2020 at 06:44:26PM +0200, Daniel Vetter wrote:
> > The code seems to stuff these pfns into iommu pts (or something like
> > that, I didn't follow), but there's no mmu_notifier to ensure that
> > access is synchronized with pte updates.
> >
> > Hence mark these as unsafe. This means that with
> > CONFIG_STRICT_FOLLOW_PFN, these will be rejected.
> >
> > Real fix is to wire up an mmu_notifier ... somehow. Probably means any
> > invalidate is a fatal fault for this vfio device, but then this
> > shouldn't ever happen if userspace is reasonable.
> >
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Jason Gunthorpe <jgg@ziepe.ca>
> > Cc: Kees Cook <keescook@chromium.org>
> > Cc: Dan Williams <dan.j.williams@intel.com>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: John Hubbard <jhubbard@nvidia.com>
> > Cc: J=C3=A9r=C3=B4me Glisse <jglisse@redhat.com>
> > Cc: Jan Kara <jack@suse.cz>
> > Cc: Dan Williams <dan.j.williams@intel.com>
> > Cc: linux-mm@kvack.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-samsung-soc@vger.kernel.org
> > Cc: linux-media@vger.kernel.org
> > Cc: Alex Williamson <alex.williamson@redhat.com>
> > Cc: Cornelia Huck <cohuck@redhat.com>
> > Cc: kvm@vger.kernel.org
> > ---
> >  drivers/vfio/vfio_iommu_type1.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_=
type1.c
> > index 5fbf0c1f7433..a4d53f3d0a35 100644
> > --- a/drivers/vfio/vfio_iommu_type1.c
> > +++ b/drivers/vfio/vfio_iommu_type1.c
> > @@ -421,7 +421,7 @@ static int follow_fault_pfn(struct vm_area_struct *=
vma, struct mm_struct *mm,
> >  {
> >       int ret;
> >
> > -     ret =3D follow_pfn(vma, vaddr, pfn);
> > +     ret =3D unsafe_follow_pfn(vma, vaddr, pfn);
> >       if (ret) {
> >               bool unlocked =3D false;
> >
> > @@ -435,7 +435,7 @@ static int follow_fault_pfn(struct vm_area_struct *=
vma, struct mm_struct *mm,
> >               if (ret)
> >                       return ret;
> >
> > -             ret =3D follow_pfn(vma, vaddr, pfn);
> > +             ret =3D unsafe_follow_pfn(vma, vaddr, pfn);
> >       }
>
> This is actually being commonly used, so it needs fixing.
>
> When I talked to Alex about this last we had worked out a patch series
> that adds a test on vm_ops that the vma came from vfio in the first
> place. The VMA's created by VFIO are 'safe' as the PTEs are never changed=
.

Hm, but wouldn't need that the semi-nasty vma_open trick to make sure
that vma doesn't untimely disappear? Or is the idea to look up the
underlying vfio object, and refcount that directly?
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
