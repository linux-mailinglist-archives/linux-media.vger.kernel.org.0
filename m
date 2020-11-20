Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33E802BAF3C
	for <lists+linux-media@lfdr.de>; Fri, 20 Nov 2020 16:45:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729929AbgKTPpO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Nov 2020 10:45:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728699AbgKTPpO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Nov 2020 10:45:14 -0500
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99608C0613CF
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2020 07:45:11 -0800 (PST)
Received: by mail-oi1-x243.google.com with SMTP id l206so10830747oif.12
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2020 07:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Id0PLSSDAy7IJx/4b1nt//hEs7fdMVA6YPiIkR5zClg=;
        b=dfRfRtqDF1RrZwS/1drnyGXFKRYG5zPQqdVzf4oNa4Km4m+WAgPk+uu7TX/an2oDZ2
         vBVLU/Buv8L5yJxUzKzQqx57WMgV3BOEQu6XrPSxvCgoD7tiafoeKNJTaeHl6caT1Y4y
         wW2aFKG1iJ1Hj3bcVkn0J1Hf8qog45qEjZLYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Id0PLSSDAy7IJx/4b1nt//hEs7fdMVA6YPiIkR5zClg=;
        b=fCerMNUNRrBdgH7tSl/yY04RL3wYN9scqmyklkQjyfqwyCKQ53ToaAFhkIrvbfxqoF
         on5VlgpNMFgNSUTPiz27BDTDyfZe0epnZ0D7S8IDIDwYezPUakUihNCGC3HSKBmFKT8E
         kee2ZPsAoWPoiyL7fXRusrsPlu7pg+vDQksllrgowDl/kWh4Sxlo49o3e8aff+4VcAAI
         lpKlQUFFDf2hGOuyzcMl+pLY5EtbsYhSnEeO2u1XQErprLqyV37ROZPNOMAkSPLcxPhe
         uRP8fnb13KOSaoNVzDoqS16dEcc0arSopl+qM4dmUN4o/TIWTdgwVMhN5QXa8cfRdKOM
         6riw==
X-Gm-Message-State: AOAM531Q1A5Umjz8mOPX0fVU/J5hDHKTsIg04S9uQpLTdzlJewYtrMgD
        FGzCpKR2/Szbrf++o5g+AOuyfXMgbAB/fQPA6iIY4tVz+4U=
X-Google-Smtp-Source: ABdhPJxZSOR3YzYlAKw2cDHpm+laMCMM24uLZLKA5lft7iigCepfxe2uQ21R2KlDjhY86FMJ7oZu/z5k8KghnWux0Yo=
X-Received: by 2002:aca:4f14:: with SMTP id d20mr6827257oib.14.1605887111047;
 Fri, 20 Nov 2020 07:45:11 -0800 (PST)
MIME-Version: 1.0
References: <20201119144146.1045202-1-daniel.vetter@ffwll.ch>
 <20201119144146.1045202-17-daniel.vetter@ffwll.ch> <cd56eb8a-fbec-e81f-9c14-d1256a193b68@redhat.com>
In-Reply-To: <cd56eb8a-fbec-e81f-9c14-d1256a193b68@redhat.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Fri, 20 Nov 2020 16:44:59 +0100
Message-ID: <CAKMK7uHDrPDcsWyMgFgjf0+hdebSUT4hX5hKR=CnTH=soLU-Kg@mail.gmail.com>
Subject: Re: [PATCH v6 16/17] RFC: kvm: pass kvm argument to follow_pfn callsites
To:     Paolo Bonzini <pbonzini@redhat.com>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        KVM list <kvm@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Christoph Hellwig <hch@infradead.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Nov 20, 2020 at 4:33 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 19/11/20 15:41, Daniel Vetter wrote:
> > Both Christoph Hellwig and Jason Gunthorpe suggested that usage of
> > follow_pfn by modules should be locked down more. To do so callers
> > need to be able to pass the mmu_notifier subscription corresponding
> > to the mm_struct to follow_pfn().
> >
> > This patch does the rote work of doing that in the kvm subsystem. In
> > most places this is solved by passing struct kvm * down the call
> > stacks as an additional parameter, since that contains the
> > mmu_notifier.
> >
> > Compile tested on all affected arch.
>
> It's a bit of a pity, it's making an API more complex (the point of
> gfn_to_pfn_memslot vs gfn_to_pfn is exactly that you don't need a
> "struct kvm*" and it's clear that you've already done the lookup into
> that struct kvm.

Yeah I noticed that, I think pushing the lookups down should work, but
that's a fairly large-scale change. I didn't want to do that for the
RFC since it would distract from the actual change/goal.
-Daniel

> But it's not a big deal, and the rationale at least makes sense.  So,
>
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
>
> Paolo



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
