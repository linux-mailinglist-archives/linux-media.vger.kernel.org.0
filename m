Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6473C2890C7
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 20:29:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390410AbgJIS3H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 14:29:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390409AbgJIS3H (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Oct 2020 14:29:07 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C6B9C0613D5
        for <linux-media@vger.kernel.org>; Fri,  9 Oct 2020 11:29:07 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id l24so10356604edj.8
        for <linux-media@vger.kernel.org>; Fri, 09 Oct 2020 11:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oVIvf//qjy+hkVJdi59awFrM6IZJ9JvpO2cbPx+MdNs=;
        b=iLTsuWlJpjQ9lEPve4/i/wPKY7/WDc/EpLX4/nS4Vs7XATh36CjNusW0cAwcZzYVKB
         zc2lO4Dz7JRsbYqzp49bDWt7Nj2zjd+nQ3ChgcqgyusxmNzv8xBi0X9an51ub82xSMED
         ypIlohpfnHirbuqkE/mXCCbfP8pd5KhfDsovroGKCzUs8q45yo4Fd6/w1fPvA40p9Zsk
         Fhj1k3kJxsDCiab+2o7o95nm9iELSt9Olz0BwNfHJpYbcdvZw4q4VKPfH3rzH+ZSLvin
         8ENlmZNYLWdWLsvLquEHYWK2U/S9AfZj3u8X6XmfQJoqlt/05+soeGykQWGSaZLnN0RZ
         i9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oVIvf//qjy+hkVJdi59awFrM6IZJ9JvpO2cbPx+MdNs=;
        b=tUE1BJUShI3t06sVQT2XJeJhqIDB1WiciVesGsHihFm1YQ/MMrv/HqFgFem4FianwG
         gimyxfKcl72ZyTDiW2DaiWiJeSSnS/vjoDrW0ZWk3c87CBdqEeIh1P/4K1PlZVvCmwWP
         91kRjixsErTySAJH7AmK3Cgr11in/mX6mIvWAMZe3o2wy0lm2M4cFKssGjr4dRhiphKH
         U6FJsCUMv5h6yHP9enJwxLKgPSLftEowbKYUiUdJSW/hmztf7K7IwF8qFQ8wWRgsNMfG
         z3POTqx1SbKyf0Qqv/ySapTHrIL4PA5XR7eb3yAoLul4/FY7SRNa4Ve6xSXxy624l5Wo
         MnfA==
X-Gm-Message-State: AOAM533lOUehAxVfWMm1DMCVAg4nQUz22xOW7ZoB9u3uW8Ak+Vlu0y67
        rb/Np4NLVXcOAWTMKaL5RrchoKr3LLjXvF+B3Lptbw==
X-Google-Smtp-Source: ABdhPJzWk7BhJg0T57QGadQcytTP33YarvnD8YMhqI7SBWAAOvIcMevxnSHZgp/bJXzdV8lpWps/qAzI6LdBImluO+E=
X-Received: by 2002:a50:d0d0:: with SMTP id g16mr559132edf.18.1602268145655;
 Fri, 09 Oct 2020 11:29:05 -0700 (PDT)
MIME-Version: 1.0
References: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
 <20201009075934.3509076-15-daniel.vetter@ffwll.ch> <20201009123109.GO5177@ziepe.ca>
 <CAKMK7uFpPP-Q0jC0vM7vYPEcg0m4NzTw+Ld=swdTF3BgMX5Qug@mail.gmail.com> <20201009143209.GS5177@ziepe.ca>
In-Reply-To: <20201009143209.GS5177@ziepe.ca>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Fri, 9 Oct 2020 11:28:54 -0700
Message-ID: <CAPcyv4j54O8ac6WB3LEeNud2r11V26gA0PRKK9bhyEMF67AXtQ@mail.gmail.com>
Subject: Re: [PATCH v2 14/17] resource: Move devmem revoke code to resource framework
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        KVM list <kvm@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Hildenbrand <david@redhat.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 9, 2020 at 7:32 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Fri, Oct 09, 2020 at 04:24:45PM +0200, Daniel Vetter wrote:
> > On Fri, Oct 9, 2020 at 2:31 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > >
> > > On Fri, Oct 09, 2020 at 09:59:31AM +0200, Daniel Vetter wrote:
> > >
> > > > +struct address_space *iomem_get_mapping(void)
> > > > +{
> > > > +     return iomem_inode->i_mapping;
> > >
> > > This should pair an acquire with the release below
> > >
> > > > +     /*
> > > > +      * Publish /dev/mem initialized.
> > > > +      * Pairs with smp_load_acquire() in revoke_iomem().
> > > > +      */
> > > > +     smp_store_release(&iomem_inode, inode);
> > >
> > > However, this seems abnormal, initcalls rarely do this kind of stuff
> > > with global data..
> > >
> > > The kernel crashes if this fs_initcall is raced with
> > > iomem_get_mapping() due to the unconditional dereference, so I think
> > > it can be safely switched to a simple assignment.
> >
> > Ah yes I checked this all, but forgot to correctly annotate the
> > iomem_get_mapping access. For reference, see b34e7e298d7a ("/dev/mem:
> > Add missing memory barriers for devmem_inode").
>
> Oh yikes, so revoke_iomem can run concurrently during early boot,
> tricky.

It runs early because request_mem_region() can run before fs_initcall.
Rather than add an unnecessary lock just arrange for the revoke to be
skipped before the inode is initialized. The expectation is that any
early resource reservations will block future userspace mapping
attempts.
