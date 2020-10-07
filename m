Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BE61286B78
	for <lists+linux-media@lfdr.de>; Thu,  8 Oct 2020 01:24:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727437AbgJGXYv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 19:24:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726219AbgJGXYv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 19:24:51 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E80F5C0613D4
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 16:24:50 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id t9so2749906qtp.9
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2020 16:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=grnZFDXCMGq7gJnj3rv4Eh6ohpICuLZnEtrVn22rZIo=;
        b=Bk3vyARb7iuiAU0SAUq2s6xtQRFkx0zrhk9G+DPyvRRbTItWJ6gpJPPsdXndWqM30C
         q+51nknw/1tIIM/cbEQqZbvmH3mHkhAx0ZhbONTIkwW+SkBnLf5drgGQk3B1JkUtZLQv
         md+QvQFk56zu60Z3GjZl1EqhU0rhhNSdsHAK30qke9EYBs5AaSpcAL2z/rCUCwa8FQqH
         2eNBU8guUIVdzfovxzjr065TJHAf7Ql5Nk2Q1fuOqG9vuautugZBwiS50HM9Bf6R7BJy
         wX6YvRVCp5ueNYkN+1r4/AuMm2/5dBOzuXJknmpl6H2z8DDtJhmovZxfsbStATmFT07H
         6VSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=grnZFDXCMGq7gJnj3rv4Eh6ohpICuLZnEtrVn22rZIo=;
        b=E+77q18S9boWHg6wTzBSE8rWVRCbqu6AzXe3xDXlrBosJ5aM45ZC4FAHvgLiB96AXB
         wViVf2Udi/Li7ZTtxuLxKY02sSEY87NSpDOIIgx+raWi9clv+X36UB2rYhbz7k80Pke6
         iNFS4UqCFCNQwaqo1CjRcU8Mq7sCpRGwVWQJXE/z3xoia3iaa/kDK9wq8aQGDk9kO8g6
         HYbCJbgCwIy3uRlSvXfEyyIUZQgCytcc7RBvKXV0LqgmWkqoSHQ/IkupZTpDTPw3Ssmp
         jhsVNOIWTNTqXoByVF8IzXiDQo1u02Zsaawm4pL2RBH+DYDRy6Ftpihls1a5oFN7s82l
         oAuQ==
X-Gm-Message-State: AOAM530ih+4wyWMYflM1iQPb+gu4Zd3yhcpm3LK+u/Fiu/JRLgELO1T3
        1zz4QOBweA8C1LCk/wYMWPOM9w==
X-Google-Smtp-Source: ABdhPJwQSs4RGdtelbtYNd2YLomE1YhjE8V063EOvVpVE89mpXbPIH2mKCjwjLbwP7cugbXVynYwbw==
X-Received: by 2002:aed:3282:: with SMTP id z2mr6021380qtd.375.1602113090013;
        Wed, 07 Oct 2020 16:24:50 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id r17sm2946100qtc.22.2020.10.07.16.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 16:24:49 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kQIng-001Ing-AW; Wed, 07 Oct 2020 20:24:48 -0300
Date:   Wed, 7 Oct 2020 20:24:48 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Dan Williams <dan.j.williams@intel.com>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        KVM list <kvm@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>, Bjorn Helgaas <bhelgaas@google.com>,
        linux-pci@vger.kernel.org
Subject: Re: [PATCH 10/13] PCI: revoke mappings like devmem
Message-ID: <20201007232448.GC5177@ziepe.ca>
References: <20201007164426.1812530-1-daniel.vetter@ffwll.ch>
 <20201007164426.1812530-11-daniel.vetter@ffwll.ch>
 <CAPcyv4hBL68A7CZa+YnooufDH2tevoxrx32DTJMQ6OHRnec7QQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPcyv4hBL68A7CZa+YnooufDH2tevoxrx32DTJMQ6OHRnec7QQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 07, 2020 at 12:33:06PM -0700, Dan Williams wrote:
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
> >
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

The inode does not come from the filesystem char/mem.c creates a
singular anon inode in devmem_init_inode()

Seems OK to use this more widely, but it feels a bit weird to live in
char/memory.c.

This is what got me thinking maybe this needs to be a bit bigger
generic infrastructure - eg enter this scheme from fops mmap and
everything else is in mm/user_iomem.c

Jason
