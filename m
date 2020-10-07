Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EF30286893
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 21:47:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728509AbgJGTrz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 15:47:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727655AbgJGTrv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 15:47:51 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32250C0613D4
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 12:47:50 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id u126so3690236oif.13
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2020 12:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=orhfCBuFEmd+KVAmHbcaixIkjSSik8aIdF2Y5AlSlTI=;
        b=HqHL85aeU7x4vZRr8aFR2YVRrwspH04y26fUbXHdW1zHn9JiRP4t6c+95tolblKSFE
         g6rmEte7OQz0vHT+Gxy0F+wmZQx2vj40nuDXq6VEJEgecoLqF0as8JHJF/ZRBUJmFjHz
         fkLaTYyh9AGF6bz08/AxSynt04XwHMSoqg8zg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=orhfCBuFEmd+KVAmHbcaixIkjSSik8aIdF2Y5AlSlTI=;
        b=a6cQmjRpqkPQhsHq2dQUIjfhE/X8b5FmFfV13jRKy7jkKHOb8m3fdKEJldqclzcjUC
         gc6rDDNnIrUYqTd9/iSJKoJlc1VzAPj7q3+Ys35MGfqj6CKtoSSLSx0xRJ715bxC/WIQ
         Vm9i4cxDTohDR2htqFDtE75FLfTG4G+ToM0sHQBRFYLqsDDWmMtXnJFjsKBKrPIP4Auh
         S0GV43FYKs9u3zF8M7EbUpf/haJkYPWD3w0Co3h9MC3BP4Lqg7t+2dN2cvOMYGDrAGyF
         3bwnBoVvBoRiYc7g7cPaI2e3t5Z+b0MUg6BAXuDGkXlPeekDGOVjLag100KMUobuW7HN
         yREA==
X-Gm-Message-State: AOAM5300IWVVIr+yvbLSyI2iUGJ0vsP7DHG4TH32yeUbgiW2biVgOa1a
        OyGn+2LAC3iGH/jgyytrQ7YTfT8L1tnw/TddND7U7w==
X-Google-Smtp-Source: ABdhPJxToTx3ndOy1U0dVrBcYAKX9wm3X1TZHa+mGhrb1Py/rD32WJ5mouUCMFv7wj7Vm8hLjOzC1v6C7W/A3Mayy3I=
X-Received: by 2002:aca:6083:: with SMTP id u125mr2978051oib.14.1602100069344;
 Wed, 07 Oct 2020 12:47:49 -0700 (PDT)
MIME-Version: 1.0
References: <20201007164426.1812530-1-daniel.vetter@ffwll.ch>
 <20201007164426.1812530-11-daniel.vetter@ffwll.ch> <CAPcyv4hBL68A7CZa+YnooufDH2tevoxrx32DTJMQ6OHRnec7QQ@mail.gmail.com>
In-Reply-To: <CAPcyv4hBL68A7CZa+YnooufDH2tevoxrx32DTJMQ6OHRnec7QQ@mail.gmail.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Wed, 7 Oct 2020 21:47:37 +0200
Message-ID: <CAKMK7uFoxiPdjO-yhd-mKqumnTpjcENEReb1sOYhOwRRCL0wpQ@mail.gmail.com>
Subject: Re: [PATCH 10/13] PCI: revoke mappings like devmem
To:     Dan Williams <dan.j.williams@intel.com>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        KVM list <kvm@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>, Bjorn Helgaas <bhelgaas@google.com>,
        Linux PCI <linux-pci@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 7, 2020 at 9:33 PM Dan Williams <dan.j.williams@intel.com> wrote:
>
> On Wed, Oct 7, 2020 at 11:11 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >
> > Since 3234ac664a87 ("/dev/mem: Revoke mappings when a driver claims
> > the region") /dev/kmem zaps ptes when the kernel requests exclusive
> > acccess to an iomem region. And with CONFIG_IO_STRICT_DEVMEM, this is
> > the default for all driver uses.
> >
> > Except there's two more ways to access pci bars: sysfs and proc mmap
> > support. Let's plug that hole.
>
> Ooh, yes, lets.
>
> > For revoke_devmem() to work we need to link our vma into the same
> > address_space, with consistent vma->vm_pgoff. ->pgoff is already
> > adjusted, because that's how (io_)remap_pfn_range works, but for the
> > mapping we need to adjust vma->vm_file->f_mapping. Usually that's done
> > at ->open time, but that's a bit tricky here with all the entry points
> > and arch code. So instead create a fake file and adjust vma->vm_file.
>
> I don't think you want to share the devmem inode for this, this should
> be based off the sysfs inode which I believe there is already only one
> instance per resource. In contrast /dev/mem can have multiple inodes
> because anyone can just mknod a new character device file, the same
> problem does not exist for sysfs.

But then I need to find the right one, plus I also need to find the
right one for the procfs side. That gets messy, and I already have no
idea how to really test this. Shared address_space is the same trick
we're using in drm (where we have multiple things all pointing to the
same underlying resources, through different files), and it gets the
job done. So that's why I figured the shared address_space is the
cleaner solution since then unmap_mapping_range takes care of
iterating over all vma for us. I guess I could reimplement that logic
with our own locking and everything in revoke_devmem, but feels a bit
silly. But it would also solve the problem of having mutliple
different mknod of /dev/kmem with different address_space behind them.
Also because of how remap_pfn_range works, all these vma do use the
same pgoff already anyway.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
