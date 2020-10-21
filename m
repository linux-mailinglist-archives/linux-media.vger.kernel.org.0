Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72B79295039
	for <lists+linux-media@lfdr.de>; Wed, 21 Oct 2020 17:55:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2444216AbgJUPzI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Oct 2020 11:55:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2444209AbgJUPzH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Oct 2020 11:55:07 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E83DC0613D5
        for <linux-media@vger.kernel.org>; Wed, 21 Oct 2020 08:55:06 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id q136so2576762oic.8
        for <linux-media@vger.kernel.org>; Wed, 21 Oct 2020 08:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C6DKYnDfudq4L3jq8cgaqwhb0+5UPYI4hKd8ZXy4r2g=;
        b=bOKxdvhjgEKOtLPpVYj6Ijwh2mKSXVoQ+GQkd6y9om8AOiAaZ5BVOKtRbAIB6TOef6
         JViom2WHSbHDxfwbjTICNMKIpnUHoAO8RMBp0R1dGY04OeAqtrO7mA9xr7W57bhgZWkI
         m7xoz6/cv19qNKpiDTjcgK90UI0cWYA6F2WWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C6DKYnDfudq4L3jq8cgaqwhb0+5UPYI4hKd8ZXy4r2g=;
        b=iCfu6TKKthRr00pH9e8gWm9hk9mWojk9GZhaLmM9dfLE/X+EfqNeXQlYOSM6cSxJzB
         ClktPlP0CfzHkU7iZF9NN/IVxwydRmDAKTjcqnHfNLonBBcaRh3P/4NJZlXO7qdu5YUT
         KWVpg/OSy4YebXFqLPMw/MQFblMfJaiP/ZoFJ1+7DeMbs9dH+6WES95Lky7YFFE+Ga/J
         SvLIxIfXlR6PCE9riUrnT9UwgETA4kJommVCBTdiu9HP+zh0bfGoViYfPSphney0Cd5A
         xvCD5QGKv+JBVVEaDIZj5oAhwwhgegSa6VWZk3j2lA8FY7S8u20MSu0oEeeymWg464ft
         lNtQ==
X-Gm-Message-State: AOAM531J4F3DQyuYkH3Jlqf4eSBnWElRFH+OePjniQhQaUIGwiVT2b0X
        giJqe0tnz4wDqViK0zi3X+DjU8A79+lKTP90bw54DQ==
X-Google-Smtp-Source: ABdhPJzPCgyzodnSmRD9rGONXEuc3qJsREMQopHY6rQLHriRRIWOuQr4ZeQqsR42HntwRWBXJ/bxEHV/oXvYTFC/kGQ=
X-Received: by 2002:aca:52c4:: with SMTP id g187mr2521031oib.101.1603295705466;
 Wed, 21 Oct 2020 08:55:05 -0700 (PDT)
MIME-Version: 1.0
References: <20201021085655.1192025-1-daniel.vetter@ffwll.ch>
 <20201021085655.1192025-13-daniel.vetter@ffwll.ch> <20201021125030.GK36674@ziepe.ca>
 <CAKMK7uEWe8CaT7zjcZ6dJAKHxtxtqzjVB35fCFviwhcnqksDfw@mail.gmail.com> <20201021151352.GL36674@ziepe.ca>
In-Reply-To: <20201021151352.GL36674@ziepe.ca>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Wed, 21 Oct 2020 17:54:54 +0200
Message-ID: <CAKMK7uGq0=ks7Zj1Et44k7x9FwE9u_ua4zANSqrLRri0v01V+Q@mail.gmail.com>
Subject: Re: [PATCH v3 12/16] PCI: Obey iomem restrictions for procfs mmap
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        KVM list <kvm@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>, Bjorn Helgaas <bhelgaas@google.com>,
        Linux PCI <linux-pci@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 21, 2020 at 5:13 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Wed, Oct 21, 2020 at 04:42:11PM +0200, Daniel Vetter wrote:
>
> > Uh yes. In drivers/gpu this isn't a problem because we only install
> > ptes from the vm_ops->fault handler. So no races. And I don't think
> > you can fix this otherwise through holding locks: mmap_sem we can't
> > hold because before vma_link we don't even know which mm_struct is
> > involved, so can't solve the race. Plus this would be worse that
> > mm_take_all_locks used by mmu notifier. And the address_space
> > i_mmap_lock is also no good since it's not held during the ->mmap
> > callback, when we write the ptes. And the resource locks is even less
> > useful, since we're not going to hold that at vma_link() time for
> > sure.
> >
> > Hence delaying the pte writes after the vma_link, which means ->fault
> > time, looks like the only way to close this gap.
>
> > Trouble is I have no idea how to do this cleanly ...
>
> How about add a vm_ops callback 'install_pages'/'prefault_pages' ?
>
> Call it after vm_link() - basically just move the remap_pfn, under
> some other lock, into there.

Yeah, I think that would be useful. This might also be useful for
something entirely different: For legacy fbdev emulation on top of drm
kernel modesetting drivers we need to track dirty pages of VM_IO
mmaps. Right now that's a gross hack, and essentially we just pay the
price for entirely separate storage and an additional memcpy when this
is needed to emulate fbdev mmap on top of drm. But if we have
install_ptes callback or similar we could just wrap the native vm_ops
and add a mkwrite callback on top for that dirty tracking. For that
the hook would need to be after vm_set_page_prot so that we
write-protect the ptes by default, since that's where we compute
vma_wants_writenotify(). That's also after vma_link, so one hook for
two use-cases.

The trouble is that io_remap_pfn adjust vma->pgoff, so we'd need to
split that. So ideally ->mmap would never set up any ptes.

I guess one option would be if remap_pfn_range would steal the
vma->vm_ops pointer for itself, then it could set up the correct
->install_ptes hook. But there's tons of callers for that, so not sure
that's a bright idea.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
