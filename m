Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48BCF379A1B
	for <lists+linux-media@lfdr.de>; Tue, 11 May 2021 00:32:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231168AbhEJWdg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 May 2021 18:33:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230271AbhEJWde (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 May 2021 18:33:34 -0400
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D28FC061574;
        Mon, 10 May 2021 15:32:29 -0700 (PDT)
Received: by mail-il1-x135.google.com with SMTP id c3so15508502ils.5;
        Mon, 10 May 2021 15:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZXbKK4DwG4d0nDNXe4XSUJLg6tBFAiW/ctIz6HwNgJs=;
        b=GRKi1n7PBguuEjIQY8v8nUZMMgtRayd6W4jp02PDWD8r+hZPiLiR5k3UglpB1uOAWn
         nwf+gxbkRKP8APRNpA48YW+qnnEi1YjDftOCKpx3mdQX1P0L/qxqZFkgGPAuzVG/1gwO
         8xi//7nTvRYqK6Fv3daYUoQUvg/049ZiJd85EFooHniqhLvhgqMrZjc7rXAc4iY6ZZ51
         mbdaAqOtPe+g6IZp6YMuSHzoqWZQ7EIGQuH5aCHyuLK7PfGMsLPMUxliKC9Q8VOH09+y
         bsH0Oic79k480HcmpLleRVd5jsUx+OLHdddZSvG3tKE4nDsaBmreY/p4ImoJUlK170g0
         BHPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZXbKK4DwG4d0nDNXe4XSUJLg6tBFAiW/ctIz6HwNgJs=;
        b=TZhbdbLjIuXMJxadiRHQ8TmMn5bGKxyXNZu9IZIbTZaqIjDR8raCru+lOSkDR73L8x
         Gg6PFpQC+Vfi/LvQMHb38YqFWolUWlmtcG4A9i3mN3nrKqfx2NiS0DjkoreEhdfkQUXC
         Uz6jD0EqjKHisXsH6+PRo8j0E6FRXobymZdYMdMYjWP7iRqrrxqCsx+ADtaH7lHfLSf8
         wuocwMLxA5ELYIKiCvazmpVm1MmkxWE2KuYMydMyjGpsyQNkqZ3dl8WbV5jst8bDUNxI
         D/wFaymsfl58E1DSvL9U6lFFjNrc6UsmBGWCWT19KM4lTbmY7mNvWDsB/B4yY+TmAo7P
         0yhw==
X-Gm-Message-State: AOAM5333QCsA4o9HjX96qwfNvpKkYn2DNN8SdXgKPqZoNsGp/zmpPezK
        jynCzt6GEkT/Ucz9YyHHcuDGj6bxFRhFZFHod4Y=
X-Google-Smtp-Source: ABdhPJxnCuH9WS8pfYm0ojlQzqi0SlnZ+I3PaXsZkcGFoYGmmZkCnBpZwbOPW868ZeKgbJ6Uh4+vJvrqoqF0wr4xAxg=
X-Received: by 2002:a05:6e02:1002:: with SMTP id n2mr22491818ilj.260.1620685948558;
 Mon, 10 May 2021 15:32:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210424005206.261622-1-ztong0001@gmail.com> <b84e0b87-4753-0513-9803-0cda4ceb4adc@xs4all.nl>
In-Reply-To: <b84e0b87-4753-0513-9803-0cda4ceb4adc@xs4all.nl>
From:   Tong Zhang <ztong0001@gmail.com>
Date:   Mon, 10 May 2021 15:32:17 -0700
Message-ID: <CAA5qM4BtejMqUa+eJLV+9q26E3Du-MiTasB=knCh+Qsw3HjApg@mail.gmail.com>
Subject: Re: [PATCH] media: cobalt: fix null-ptr-deref when there is no PCI bridge
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, May 5, 2021 at 2:18 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 24/04/2021 02:52, Tong Zhang wrote:
> > the PCI bridge might be NULL, so we'd better check before use it
> >
> > [    1.870569] RIP: 0010:pcie_bus_link_get_lanes.isra.0+0x26/0x59 [cobalt]
> > [    1.875880] Call Trace:
> > [    1.876013]  cobalt_probe.cold+0x1be/0xc11 [cobalt]
> > [    1.876683]  pci_device_probe+0x10f/0x1c0
>
> How did you test this? With some virtualized PCI bus or something? I'm not sure
> how this can happen.
>
Hello Hans,
IMHO bus->self is pci bridge device and we can have a system
configuration that does not have such a bridge,
in this case, bus->self is NULL.
- Tong
> Regards,
>
>         Hans
>
> >
> > Signed-off-by: Tong Zhang <ztong0001@gmail.com>
> > ---
> >  drivers/media/pci/cobalt/cobalt-driver.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/media/pci/cobalt/cobalt-driver.c b/drivers/media/pci/cobalt/cobalt-driver.c
> > index 0695078ef812..5687ed4869ac 100644
> > --- a/drivers/media/pci/cobalt/cobalt-driver.c
> > +++ b/drivers/media/pci/cobalt/cobalt-driver.c
> > @@ -189,6 +189,8 @@ void cobalt_pcie_status_show(struct cobalt *cobalt)
> >       u32 capa;
> >       u16 stat, ctrl;
> >
> > +     if (!pci_bus_dev)
> > +             return;
> >       if (!pci_is_pcie(pci_dev) || !pci_is_pcie(pci_bus_dev))
> >               return;
> >
> > @@ -247,6 +249,8 @@ static unsigned pcie_bus_link_get_lanes(struct cobalt *cobalt)
> >       struct pci_dev *pci_dev = cobalt->pci_dev->bus->self;
> >       u32 link;
> >
> > +     if (!pci_dev)
> > +             return 0;
> >       if (!pci_is_pcie(pci_dev))
> >               return 0;
> >       pcie_capability_read_dword(pci_dev, PCI_EXP_LNKCAP, &link);
> >
>
