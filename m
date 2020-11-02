Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E44A2A2B69
	for <lists+linux-media@lfdr.de>; Mon,  2 Nov 2020 14:24:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728936AbgKBNYK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Nov 2020 08:24:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728414AbgKBNYK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Nov 2020 08:24:10 -0500
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 264FDC061A47
        for <linux-media@vger.kernel.org>; Mon,  2 Nov 2020 05:24:10 -0800 (PST)
Received: by mail-oi1-x241.google.com with SMTP id x1so14581854oic.13
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2020 05:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JGM5iJVe1/YS3RI7Ox6P0c/NeEFHo7I8woI64ttdcHw=;
        b=Redsc76//XOqhmrR47LrRhhRKZfVgrPgcKjaj3flUUV05IMeYYgYI96W5nS3FoZvN7
         n0yN3r95mirzqxFiZdIGicTdRpE+APj1YYPKDXlNxKd2lAM4+mMT2WniX47hjE9Yln3I
         Y2p0Ua++jSUdgHYquFbAF5VAHeKUIvWvGxWx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JGM5iJVe1/YS3RI7Ox6P0c/NeEFHo7I8woI64ttdcHw=;
        b=Q/tODQC3dXrxYaH+UtoWlI3KlDez7lB3F8lq7DjxbmZb5keiycLDO/9klwR0rF45az
         qr3RiAAr3MDUbFsLt8dQKXWFocJlkTrid378ao/l7pw3LtvK2lPH06UbUUS8PcQG2LLX
         0tSKWsjdTPj7x7C3p2XWAOsrKGKjJUfvWHl6nfALTEsLzVPNkPZmgAOkAW3CiV08lvYY
         Wtt7djGYPRgSo7iC6HHrKPSzOi9KW2ts8qqvjRsfDSBAAWOFs5qQv3QJ1tyMx47r3w09
         6sKd1oBV3pHKfXotF0+7z1n5S0En+5SF3GzGTFvSP6pcE1BvtOVJihHpGzEZ3g54dIkz
         q+Jg==
X-Gm-Message-State: AOAM531hGbwo99NnQusku4VXTB0DR1wEh3OvbAE5bSvWUtJJwPd/6pI+
        IVwbSclNfikrudJSvNLKUHf/Uv92K+pZzYf9qlDmew==
X-Google-Smtp-Source: ABdhPJz6z2w7hj9FcAzqiJvVAZYDEwQ1hz51TSyVs1UuhBMkzKJELH0Nji35ZsSbH8nvJRYlHjcaT+TvGc3KsVWMNe0=
X-Received: by 2002:aca:b141:: with SMTP id a62mr9289032oif.101.1604323449305;
 Mon, 02 Nov 2020 05:24:09 -0800 (PST)
MIME-Version: 1.0
References: <20201030100815.2269-1-daniel.vetter@ffwll.ch> <20201030100815.2269-9-daniel.vetter@ffwll.ch>
 <20201102072931.GA16419@infradead.org> <CAKMK7uEe5FQuukYU7RhL90ttC9XyWw6wvdQrZ2JpP0jpbYTO6g@mail.gmail.com>
 <20201102130115.GC36674@ziepe.ca>
In-Reply-To: <20201102130115.GC36674@ziepe.ca>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Mon, 2 Nov 2020 14:23:58 +0100
Message-ID: <CAKMK7uHeL=w7GoBaY4XrbRcpJabR9UWnP+oQ9Fg51OzL7=KxiA@mail.gmail.com>
Subject: Re: [PATCH v5 08/15] mm: Add unsafe_follow_pfn
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     Christoph Hellwig <hch@infradead.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        KVM list <kvm@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        "J??r??me Glisse" <jglisse@redhat.com>, Jan Kara <jack@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 2, 2020 at 2:01 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Mon, Nov 02, 2020 at 01:56:10PM +0100, Daniel Vetter wrote:
> > On Mon, Nov 2, 2020 at 8:29 AM Christoph Hellwig <hch@infradead.org> wrote:
> > >
> > > On Fri, Oct 30, 2020 at 11:08:08AM +0100, Daniel Vetter wrote:
> > > > Also mark up follow_pfn as EXPORT_SYMBOL_GPL. The only safe way to use
> > > > that by drivers/modules is together with an mmu_notifier, and that's
> > > > all _GPL stuff.
> > >
> > > I also think it also needs to be renamed to explicitly break any existing
> > > users out of tree or int the submission queue.
> >
> > Ok I looked at the mmu notifier locking again and noticed that
> > mm->subscriptions has its own spinlock. Since there usually shouldn't
> > be a huge pile of these I think it's feasible to check for the mmu
> > notifier in follow_pfn. And that would stuff this gap for good. I'll
> > throw that on top as a final patch and see what people think.
>
> Probably the simplest is to just check mm_has_notifiers() when in
> lockdep or something very simple like that

lockdep feels wrong, was locking more at CONFIG_DEBUG_VM. And since
generally you only have 1 mmu notifier (especially for kvm) I think we
can also pay the 2nd cacheline miss and actually check the right mmu
notifier is registered.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
