Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52F2B31170D
	for <lists+linux-media@lfdr.de>; Sat,  6 Feb 2021 00:30:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230103AbhBEXXl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Feb 2021 18:23:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230527AbhBEKBA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Feb 2021 05:01:00 -0500
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0D6AC061793
        for <linux-media@vger.kernel.org>; Fri,  5 Feb 2021 02:00:01 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id k10so3980683otl.2
        for <linux-media@vger.kernel.org>; Fri, 05 Feb 2021 02:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+4u7LFNcU9hMwfgLTZmVYDnd+qbrvGiQY6Ud/lubleQ=;
        b=Sk2sbOl/YGsWHQ642ZxGsgnlPJp90k/MEp96MZd6QxXq2XXoVszajynNlPCU1EgwIp
         JrYz9Rfexw9ffo4+U+GP1iNsEpA+sPVI+m3dHYB8TlTcsM12z2lC0O1i/PT8lFYQ8t+b
         Vh8efEXHHiw+rh5OORJRedQ8kYAW8fFgoKVIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+4u7LFNcU9hMwfgLTZmVYDnd+qbrvGiQY6Ud/lubleQ=;
        b=ORxpbgFA2CoVtGbsvxIpEjRjqGnoBPAN11Q6yr1piWypvuDNLh6xeCGDp5BHkQeFyg
         el6X6RGMkArOFB29xtNYG7x3aFXDs3P2hYsv/d4EpmTVA8Hl5qku7fHrb6kXrPBMEwiw
         UYXreDlZ1G/tDC7CCaYwpchmId69G5oDnRihmqQhFbb7IwomJQlfni9+cm1Fz1KZF/e4
         VzTZlFwhXPz2bGQN/Vql3WGUjEj7XPFnhXlP1XWgmnXtbke/J2l1u6MZl0p9XTpu6sGw
         tENB+weDZizoVQfy8/pLbuTOiRHW8GWm4Gxj+ybRYWdidOvYtFDan6+1l70aV/t3fvEa
         bJbQ==
X-Gm-Message-State: AOAM5329xbiqOphSLc0kGXun2+uDE3j6bqKHZ26Z6afrmrtEnYsM6Swc
        oz/tWj7WGz+1Mq6KFywtA9a7HhlgrWrgFjKnrxs1oQ==
X-Google-Smtp-Source: ABdhPJzbngQ5SL0u3GVHbNMBJfQkQH0+gaX2wZqa80FFqtPMKC8sUU8IKX94LyS+DWVU6cSU7N0JCdCRKNzsiegRDCc=
X-Received: by 2002:a9d:b85:: with SMTP id 5mr2898890oth.281.1612519201295;
 Fri, 05 Feb 2021 02:00:01 -0800 (PST)
MIME-Version: 1.0
References: <20210204165831.2703772-2-daniel.vetter@ffwll.ch>
 <20210204215019.GA104698@bjorn-Precision-5520> <20210204222407.pkx7wvmcvugdwqdd@pali>
In-Reply-To: <20210204222407.pkx7wvmcvugdwqdd@pali>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Fri, 5 Feb 2021 10:59:50 +0100
Message-ID: <CAKMK7uFeZpc4oV2GNRdP_EXmYqacg5o3jPegqqaFZZYqqRutFA@mail.gmail.com>
Subject: Re: [PATCH 1/2] PCI: also set up legacy files only after sysfs init
To:     =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc:     Bjorn Helgaas <helgaas@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        Jan Kara <jack@suse.cz>, Kees Cook <keescook@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux PCI <linux-pci@vger.kernel.org>,
        Linux MM <linux-mm@kvack.org>, Jason Gunthorpe <jgg@ziepe.ca>,
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
        John Hubbard <jhubbard@nvidia.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        "Oliver O'Halloran" <oohall@gmail.com>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Feb 4, 2021 at 11:24 PM Pali Roh=C3=A1r <pali@kernel.org> wrote:
>
> On Thursday 04 February 2021 15:50:19 Bjorn Helgaas wrote:
> > [+cc Oliver, Pali, Krzysztof]
>
> Just to note that extending or using sysfs_initialized introduces
> another race condition into kernel code which results in PCI fatal
> errors. Details are in email discussion which Bjorn already sent.

Yeah I wondered why this doesn't race, but since the history goes back
to pre-git times I figured it would have been addressed somehow
already if it indeed does race.
-Daniel

> > s/also/Also/ in subject
> >
> > On Thu, Feb 04, 2021 at 05:58:30PM +0100, Daniel Vetter wrote:
> > > We are already doing this for all the regular sysfs files on PCI
> > > devices, but not yet on the legacy io files on the PCI buses. Thus fa=
r
> > > now problem, but in the next patch I want to wire up iomem revoke
> > > support. That needs the vfs up an running already to make so that
> > > iomem_get_mapping() works.
> >
> > s/now problem/no problem/
> > s/an running/and running/
> > s/so that/sure that/ ?
> >
> > iomem_get_mapping() doesn't exist; I don't know what that should be.
> >
> > > Wire it up exactly like the existing code. Note that
> > > pci_remove_legacy_files() doesn't need a check since the one for
> > > pci_bus->legacy_io is sufficient.
> >
> > I'm not sure exactly what you mean by "the existing code."  I could
> > probably figure it out, but it would save time to mention the existing
> > function here.
> >
> > This looks like another instance where we should really apply Oliver's
> > idea of converting these to attribute_groups [1].
> >
> > The cover letter mentions options discussed with Greg in [2], but I
> > don't think the "sysfs_initialized" hack vs attribute_groups was part
> > of that discussion.
> >
> > It's not absolutely a show-stopper, but it *is* a shame to extend the
> > sysfs_initialized hack if attribute_groups could do this more cleanly
> > and help solve more than one issue.
> >
> > Bjorn
> >
> > [1] https://lore.kernel.org/r/CAOSf1CHss03DBSDO4PmTtMp0tCEu5kScn704ZEwL=
KGXQzBfqaA@mail.gmail.com
> > [2] https://lore.kernel.org/dri-devel/CAKMK7uGrdDrbtj0OyzqQc0CGrQwc2F3t=
FJU9vLfm2jjufAZ5YQ@mail.gmail.com/
> >
> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > Cc: Stephen Rothwell <sfr@canb.auug.org.au>
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
> > > ---
> > >  drivers/pci/pci-sysfs.c | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >
> > > diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
> > > index fb072f4b3176..0c45b4f7b214 100644
> > > --- a/drivers/pci/pci-sysfs.c
> > > +++ b/drivers/pci/pci-sysfs.c
> > > @@ -927,6 +927,9 @@ void pci_create_legacy_files(struct pci_bus *b)
> > >  {
> > >     int error;
> > >
> > > +   if (!sysfs_initialized)
> > > +           return;
> > > +
> > >     b->legacy_io =3D kcalloc(2, sizeof(struct bin_attribute),
> > >                            GFP_ATOMIC);
> > >     if (!b->legacy_io)
> > > @@ -1448,6 +1451,7 @@ void pci_remove_sysfs_dev_files(struct pci_dev =
*pdev)
> > >  static int __init pci_sysfs_init(void)
> > >  {
> > >     struct pci_dev *pdev =3D NULL;
> > > +   struct pci_bus *pbus =3D NULL;
> > >     int retval;
> > >
> > >     sysfs_initialized =3D 1;
> > > @@ -1459,6 +1463,9 @@ static int __init pci_sysfs_init(void)
> > >             }
> > >     }
> > >
> > > +   while ((pbus =3D pci_find_next_bus(pbus)))
> > > +           pci_create_legacy_files(pbus);
> > > +
> > >     return 0;
> > >  }
> > >  late_initcall(pci_sysfs_init);
> > > --
> > > 2.30.0
> > >
> > >
> > > _______________________________________________
> > > linux-arm-kernel mailing list
> > > linux-arm-kernel@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
