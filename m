Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27B02316D12
	for <lists+linux-media@lfdr.de>; Wed, 10 Feb 2021 18:44:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232908AbhBJRoL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Feb 2021 12:44:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232925AbhBJRnw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Feb 2021 12:43:52 -0500
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68E13C061756
        for <linux-media@vger.kernel.org>; Wed, 10 Feb 2021 09:43:12 -0800 (PST)
Received: by mail-ot1-x336.google.com with SMTP id s107so2561066otb.8
        for <linux-media@vger.kernel.org>; Wed, 10 Feb 2021 09:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LOwEXRdvVMZvfZEaxMVJf2OldGo/hEkLnws83/gy1v0=;
        b=aSVQeyO4q1SyZ99Fx7g8reh4zcI1aH3PnMoub+qk1TikH0aJexvkhIzg4srOUi51Pr
         b+AAPUlkcwrzbLD4NYqC4amBaspRGlM01Vo4Fkjax6nExQQ/Znn0hckIUG3tLzxeKD8V
         xFUNFSxUmoaeOlJbCq1EzPzfPxhFV3+GCpZZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LOwEXRdvVMZvfZEaxMVJf2OldGo/hEkLnws83/gy1v0=;
        b=lte0UjV/5nQJVYDMGmEUGFFQ7f8vOAPKB7QIvciJulR2Ocv/vrDbMGit1odeuwHmNS
         fmr+Rvsaq4gR3gFugkvte1ZxzYuev6FtrauDGgnz+szAdru3rc3H1Xig6TIIojZfsp/q
         ksETWDCeRn7vIkn4GHRUeDW8JjeF9dienIWCJ1M9UDkC7j2s1WkcOj/SlxKkKfCHDm8S
         xneTr+sXHIz86VNdaZPlg6qFpT+3tATVNrQI8iOFD6NO03bsGGG4SYnQrJR3uZswmZ5D
         OaTfkP4qmwPvp5sJ64tN1ffFZUlnDMd5RXwqIhFHcrxNYVz6ofgRxq6oSZda3GcC/0+3
         h1/A==
X-Gm-Message-State: AOAM531T5i2hhx7tGoQFNYJjtP6UDva8S4deHlXnsKJZyNejs/HBST9Q
        19pIaB79AhJ77O9o7MEIP62lsCUjF56+i3wk/HNuYg==
X-Google-Smtp-Source: ABdhPJyf0c/kQbPLFv9k7KYsyYq25CZR3JWicuNJgZ3n4s/yKoff44lu/fP6XuJ5GLjcgeB2grbmGucW3joUFNL7tbI=
X-Received: by 2002:a9d:2270:: with SMTP id o103mr2896760ota.303.1612978991821;
 Wed, 10 Feb 2021 09:43:11 -0800 (PST)
MIME-Version: 1.0
References: <20210205133632.2827730-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20210205133632.2827730-1-daniel.vetter@ffwll.ch>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Wed, 10 Feb 2021 18:43:00 +0100
Message-ID: <CAKMK7uFdR=SGD+LwH4nES0afYzuxzKr0EbHQ=Ea03appvVwD9Q@mail.gmail.com>
Subject: Re: [PATCH] PCI: Also set up legacy files only after sysfs init
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Linux PCI <linux-pci@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bjorn,

Can you ack this for merging through my topic branch with the other
follow_pfn/iomem revoke fixes for 5.12?

If not, what's the plan for getting this (or equivalent functionality)
in for 5.13? I have more of these follow_pfn/iomem revoke patches on
top, so I'd like to get the first cut merged sooner than later if
possible. And the other prep work has been in -next since -rc1.

Thanks, Daniel

On Fri, Feb 5, 2021 at 2:36 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote=
:
>
> We are already doing this for all the regular sysfs files on PCI
> devices, but not yet on the legacy io files on the PCI buses. Thus far
> no problem, but in the next patch I want to wire up iomem revoke
> support. That needs the vfs up and running already to make sure that
> iomem_get_mapping() works.
>
> Wire it up exactly like the existing code in
> pci_create_sysfs_dev_files(). Note that pci_remove_legacy_files()
> doesn't need a check since the one for pci_bus->legacy_io is
> sufficient.
>
> An alternative solution would be to implement a callback in sysfs to
> set up the address space from iomem_get_mapping() when userspace calls
> mmap(). This also works, but Greg didn't really like that just to work
> around an ordering issue when the kernel loads initially.
>
> v2: Improve commit message (Bjorn)
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: John Hubbard <jhubbard@nvidia.com>
> Cc: J=C3=A9r=C3=B4me Glisse <jglisse@redhat.com>
> Cc: Jan Kara <jack@suse.cz>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-mm@kvack.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: linux-pci@vger.kernel.org
> ---
>  drivers/pci/pci-sysfs.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
> index fb072f4b3176..0c45b4f7b214 100644
> --- a/drivers/pci/pci-sysfs.c
> +++ b/drivers/pci/pci-sysfs.c
> @@ -927,6 +927,9 @@ void pci_create_legacy_files(struct pci_bus *b)
>  {
>         int error;
>
> +       if (!sysfs_initialized)
> +               return;
> +
>         b->legacy_io =3D kcalloc(2, sizeof(struct bin_attribute),
>                                GFP_ATOMIC);
>         if (!b->legacy_io)
> @@ -1448,6 +1451,7 @@ void pci_remove_sysfs_dev_files(struct pci_dev *pde=
v)
>  static int __init pci_sysfs_init(void)
>  {
>         struct pci_dev *pdev =3D NULL;
> +       struct pci_bus *pbus =3D NULL;
>         int retval;
>
>         sysfs_initialized =3D 1;
> @@ -1459,6 +1463,9 @@ static int __init pci_sysfs_init(void)
>                 }
>         }
>
> +       while ((pbus =3D pci_find_next_bus(pbus)))
> +               pci_create_legacy_files(pbus);
> +
>         return 0;
>  }
>  late_initcall(pci_sysfs_init);
> --
> 2.30.0
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
