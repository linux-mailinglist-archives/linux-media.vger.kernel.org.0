Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77ECE2FC39F
	for <lists+linux-media@lfdr.de>; Tue, 19 Jan 2021 23:40:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728634AbhASWhG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Jan 2021 17:37:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387693AbhASOhg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Jan 2021 09:37:36 -0500
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC1F5C061793
        for <linux-media@vger.kernel.org>; Tue, 19 Jan 2021 06:34:58 -0800 (PST)
Received: by mail-ot1-x332.google.com with SMTP id v1so1876687ott.10
        for <linux-media@vger.kernel.org>; Tue, 19 Jan 2021 06:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4e0CGYDHUfu279fyABP5Y+REbie5VpiNs9f4Knw2Cok=;
        b=VBqn8DUOGeynSeRg3k1zvnxZgxHVN/m4CmDY5MHMndd1hrRsvbsOlsUR+N5zIlZNjv
         I1JtDyXv8bu7TYIBeBou0qbqzOTX9l2l0clQMWnlaS5BEAD0UdAQ7SGwdm49iZ4AHegS
         P3+zFz0CEInVbSD6li/gqZsMR+ZONkqJPxGNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4e0CGYDHUfu279fyABP5Y+REbie5VpiNs9f4Knw2Cok=;
        b=Dt0tCAk3woteeg4sySbocrcilc4IaTd/z3dBBCM7dR1eUJPZZkDwMtFC2aQUACkcgC
         dE5jsC/xbed6JrxqCRp7tHmg7SJf0sAEHPtuLDDKRCpubplfG4gs2INKCmsiTunuBi2X
         ZbsMKZPyg+YrBPIEy81OsVM2CArWIIOClQd+/mW+f1l3+81ULYIky7FxyDfg4PvyveIO
         xm5Mb0MrJMtXBtJUCG6t2aoJ5u0l9ecOzHr9lV4ryPAlzXSA9G5SIXtyMplNtsUXb0z9
         FSaIs5fccy+2X+1DKv+SdhNd5PDcR+LnvfanrnQBASWv2NrjzakUYMnvNoO+gRmtsBo5
         Gmjw==
X-Gm-Message-State: AOAM5330ztTyS6NDPm3t6LtTtHrlMNmkG3+VpcW2HL1/y/ZdOFoaDfe7
        ZrEFUXkPlkuz4iTRY8yYGZUu7eH5n8vkAtdIwyZITA==
X-Google-Smtp-Source: ABdhPJxNAs6mhMviXMtFn7M206VEX/Eake/mU9seAOwtJ76LA2Emqx8YbNqRC8ThlQu1JNtpKUawwkeGr99A8LNHJEY=
X-Received: by 2002:a9d:ea6:: with SMTP id 35mr3626432otj.188.1611066898227;
 Tue, 19 Jan 2021 06:34:58 -0800 (PST)
MIME-Version: 1.0
References: <20201127164131.2244124-1-daniel.vetter@ffwll.ch>
 <20201127164131.2244124-13-daniel.vetter@ffwll.ch> <CAKMK7uGrdDrbtj0OyzqQc0CGrQwc2F3tFJU9vLfm2jjufAZ5YQ@mail.gmail.com>
 <YAbtZBU5PMr68q9E@kroah.com>
In-Reply-To: <YAbtZBU5PMr68q9E@kroah.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Tue, 19 Jan 2021 15:34:47 +0100
Message-ID: <CAKMK7uGHSgetm7mDso6_vj+aGrR4u+ChwHb3k0QvgG0K6X2fPg@mail.gmail.com>
Subject: Re: [PATCH v7 12/17] PCI: Revoke mappings like devmem
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        KVM list <kvm@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>, Linux PCI <linux-pci@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jan 19, 2021 at 3:32 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Jan 19, 2021 at 09:17:55AM +0100, Daniel Vetter wrote:
> > On Fri, Nov 27, 2020 at 5:42 PM Daniel Vetter <daniel.vetter@ffwll.ch> =
wrote:
> > >
> > > Since 3234ac664a87 ("/dev/mem: Revoke mappings when a driver claims
> > > the region") /dev/kmem zaps ptes when the kernel requests exclusive
> > > acccess to an iomem region. And with CONFIG_IO_STRICT_DEVMEM, this is
> > > the default for all driver uses.
> > >
> > > Except there's two more ways to access PCI BARs: sysfs and proc mmap
> > > support. Let's plug that hole.
> > >
> > > For revoke_devmem() to work we need to link our vma into the same
> > > address_space, with consistent vma->vm_pgoff. ->pgoff is already
> > > adjusted, because that's how (io_)remap_pfn_range works, but for the
> > > mapping we need to adjust vma->vm_file->f_mapping. The cleanest way i=
s
> > > to adjust this at at ->open time:
> > >
> > > - for sysfs this is easy, now that binary attributes support this. We
> > >   just set bin_attr->mapping when mmap is supported
> > > - for procfs it's a bit more tricky, since procfs pci access has only
> > >   one file per device, and access to a specific resources first needs
> > >   to be set up with some ioctl calls. But mmap is only supported for
> > >   the same resources as sysfs exposes with mmap support, and otherwis=
e
> > >   rejected, so we can set the mapping unconditionally at open time
> > >   without harm.
> > >
> > > A special consideration is for arch_can_pci_mmap_io() - we need to
> > > make sure that the ->f_mapping doesn't alias between ioport and iomem
> > > space. There's only 2 ways in-tree to support mmap of ioports: generi=
c
> > > pci mmap (ARCH_GENERIC_PCI_MMAP_RESOURCE), and sparc as the single
> > > architecture hand-rolling. Both approach support ioport mmap through =
a
> > > special pfn range and not through magic pte attributes. Aliasing is
> > > therefore not a problem.
> > >
> > > The only difference in access checks left is that sysfs PCI mmap does
> > > not check for CAP_RAWIO. I'm not really sure whether that should be
> > > added or not.
> > >
> > > Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> > > Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > Cc: Jason Gunthorpe <jgg@ziepe.ca>
> > > Cc: Kees Cook <keescook@chromium.org>
> > > Cc: Dan Williams <dan.j.williams@intel.com>
> > > Cc: Andrew Morton <akpm@linux-foundation.org>
> > > Cc: John Hubbard <jhubbard@nvidia.com>
> > > Cc: J=C3=A9r=C3=B4me Glisse <jglisse@redhat.com>
> > > Cc: Jan Kara <jack@suse.cz>
> > > Cc: Dan Williams <dan.j.williams@intel.com>
> > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > Cc: linux-mm@kvack.org
> > > Cc: linux-arm-kernel@lists.infradead.org
> > > Cc: linux-samsung-soc@vger.kernel.org
> > > Cc: linux-media@vger.kernel.org
> > > Cc: Bjorn Helgaas <bhelgaas@google.com>
> > > Cc: linux-pci@vger.kernel.org
> > > Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > --
> > > v2:
> > > - Totally new approach: Adjust filp->f_mapping at open time. Note tha=
t
> > >   this now works on all architectures, not just those support
> > >   ARCH_GENERIC_PCI_MMAP_RESOURCE
> > > ---
> > >  drivers/pci/pci-sysfs.c | 4 ++++
> > >  drivers/pci/proc.c      | 1 +
> > >  2 files changed, 5 insertions(+)
> > >
> > > diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
> > > index d15c881e2e7e..3f1c31bc0b7c 100644
> > > --- a/drivers/pci/pci-sysfs.c
> > > +++ b/drivers/pci/pci-sysfs.c
> > > @@ -929,6 +929,7 @@ void pci_create_legacy_files(struct pci_bus *b)
> > >         b->legacy_io->read =3D pci_read_legacy_io;
> > >         b->legacy_io->write =3D pci_write_legacy_io;
> > >         b->legacy_io->mmap =3D pci_mmap_legacy_io;
> > > +       b->legacy_io->mapping =3D iomem_get_mapping();
> > >         pci_adjust_legacy_attr(b, pci_mmap_io);
> > >         error =3D device_create_bin_file(&b->dev, b->legacy_io);
> > >         if (error)
> > > @@ -941,6 +942,7 @@ void pci_create_legacy_files(struct pci_bus *b)
> > >         b->legacy_mem->size =3D 1024*1024;
> > >         b->legacy_mem->attr.mode =3D 0600;
> > >         b->legacy_mem->mmap =3D pci_mmap_legacy_mem;
> > > +       b->legacy_io->mapping =3D iomem_get_mapping();
> >
> > Unlike the normal pci stuff below, the legacy files here go boom
> > because they're set up much earlier in the boot sequence. This only
> > affects HAVE_PCI_LEGACY architectures, which aren't that many. So what
> > should we do here now:
> > - drop the devmem revoke for these
> > - rework the init sequence somehow to set up these files a lot later
> > - redo the sysfs patch so that it doesn't take an address_space
> > pointer, but instead a callback to get at that (since at open time
> > everything is set up). Imo rather ugly
> > - ditch this part of the series (since there's not really any takers
> > for the latter parts it might just not make sense to push for this)
> > - something else?
> >
> > Bjorn, Greg, thoughts?
>
> What sysfs patch are you referring to here?

Currently in linux-next:

commit 74b30195395c406c787280a77ae55aed82dbbfc7 (HEAD ->
topic/iomem-mmap-vs-gup, drm/topic/iomem-mmap-vs-gup)
Author: Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Fri Nov 27 17:41:25 2020 +0100

   sysfs: Support zapping of binary attr mmaps

Or the patch right before this one in this submission here:

https://lore.kernel.org/dri-devel/20201127164131.2244124-12-daniel.vetter@f=
fwll.ch/

Cheers, Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
