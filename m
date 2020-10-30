Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C69C2A0EB3
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 20:33:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727690AbgJ3TYp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 15:24:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727706AbgJ3TXK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 15:23:10 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CFD9C0613D6
        for <linux-media@vger.kernel.org>; Fri, 30 Oct 2020 12:23:10 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id s15so10072441ejf.8
        for <linux-media@vger.kernel.org>; Fri, 30 Oct 2020 12:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cL9WOPO2zHT1vQiE1Idu/YzBY6AJ1/e6GyUyFPMSPBE=;
        b=lEC/i/HaCAbfQosRN4vmMobfCxVR+WZvnS6eUCNPlKWH+DM9vHMj7SqJcRXOIjY3gR
         X7fqNKkZHnLb3MSxwodUICF97jfOsHKnuDyEcvSjhdLdPJDHWyuIEcOT1bdngZUgm+fB
         LnvKGjcJua2dQA5V5B17tvYJrJ6z/kJG7BObCa8rMFSzoI2LQncz5V1J1hPiz0LBLrhB
         ehP68u5wwlkkRu5765qgLOCoQ/hOKUaoLOB0RlxdEAi5wNF8262oDo5KcRXIkHzdad7I
         P2+qsjLodK5zSNdL+ykfiARoWE6cSX7jXnihb6GRYo+FQOn/ZAgy9c4PIkYJzVJruoKu
         pI/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cL9WOPO2zHT1vQiE1Idu/YzBY6AJ1/e6GyUyFPMSPBE=;
        b=ehepTiSQ8dLf2jaHLdDRs+uRgksD3p6XZKe7/9aFXg0tdHBwL3PyQOO+Kvgb+ir/Ed
         cV9Ujk9BQdnP0aT4XWIb6oGnPuTYGiTAkGP1E/4MZW3qw775jctGtwIlZraFnc5dQTbN
         tW2wOnczvs3Z3mPhhj0D3BVXc50QQRNBWPo3SwiSTUfLb9OiXlydgtJJuRCYqaP6WBcQ
         86XwGCobKJwM7obIH1v0RbZFJ7jj+KIe1BmzcFfAN5XySxzd+DQ4Y/Mw1q4osDnK1MYp
         s22/x7fBcJjmuBxv3VXG/iTueqaDqhqzbM9vtROn2uA0p/735xrXFh8mwmzt/s49qp+V
         k7Og==
X-Gm-Message-State: AOAM531OSmFx9BttdO9kkKMBETURIhnddh0Meg9LaGEfOpKT10iZozgo
        dGxr4W3tk6/z61HFnOuSZPklHFL4zHPVmuPFgsSSfg==
X-Google-Smtp-Source: ABdhPJzvRDFG7BoOZiy9coBum22wqezGCSC0O+U29RY5lD3y+GuATCwmUn+7GqLGOYRtTucrFFIslPSSuBYGYUaG5e4=
X-Received: by 2002:a17:906:70cf:: with SMTP id g15mr3935941ejk.323.1604085788862;
 Fri, 30 Oct 2020 12:23:08 -0700 (PDT)
MIME-Version: 1.0
References: <20201030100815.2269-1-daniel.vetter@ffwll.ch> <20201030100815.2269-16-daniel.vetter@ffwll.ch>
In-Reply-To: <20201030100815.2269-16-daniel.vetter@ffwll.ch>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Fri, 30 Oct 2020 12:22:54 -0700
Message-ID: <CAPcyv4gg=x=M-WEv62=K+MUFsYm-yZ_ndgaTULv7LyHYKHWrzA@mail.gmail.com>
Subject: Re: [PATCH v5 15/15] PCI: Revoke mappings like devmem
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        KVM list <kvm@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Linux PCI <linux-pci@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 30, 2020 at 3:09 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrot=
e:
>
> Since 3234ac664a87 ("/dev/mem: Revoke mappings when a driver claims
> the region") /dev/kmem zaps ptes when the kernel requests exclusive
> acccess to an iomem region. And with CONFIG_IO_STRICT_DEVMEM, this is
> the default for all driver uses.
>
> Except there's two more ways to access PCI BARs: sysfs and proc mmap
> support. Let's plug that hole.
>
> For revoke_devmem() to work we need to link our vma into the same
> address_space, with consistent vma->vm_pgoff. ->pgoff is already
> adjusted, because that's how (io_)remap_pfn_range works, but for the
> mapping we need to adjust vma->vm_file->f_mapping. The cleanest way is
> to adjust this at at ->open time:
>
> - for sysfs this is easy, now that binary attributes support this. We
>   just set bin_attr->mapping when mmap is supported
> - for procfs it's a bit more tricky, since procfs pci access has only
>   one file per device, and access to a specific resources first needs
>   to be set up with some ioctl calls. But mmap is only supported for
>   the same resources as sysfs exposes with mmap support, and otherwise
>   rejected, so we can set the mapping unconditionally at open time
>   without harm.
>
> A special consideration is for arch_can_pci_mmap_io() - we need to
> make sure that the ->f_mapping doesn't alias between ioport and iomem
> space. There's only 2 ways in-tree to support mmap of ioports: generic
> pci mmap (ARCH_GENERIC_PCI_MMAP_RESOURCE), and sparc as the single
> architecture hand-rolling. Both approach support ioport mmap through a
> special pfn range and not through magic pte attributes. Aliasing is
> therefore not a problem.
>
> The only difference in access checks left is that sysfs PCI mmap does
> not check for CAP_RAWIO. I'm not really sure whether that should be
> added or not.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: John Hubbard <jhubbard@nvidia.com>
> Cc: J=C3=A9r=C3=B4me Glisse <jglisse@redhat.com>
> Cc: Jan Kara <jack@suse.cz>
> Cc: Dan Williams <dan.j.williams@intel.com>

Looks good to me:

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
