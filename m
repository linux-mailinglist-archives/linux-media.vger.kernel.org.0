Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F9A31A0EDB
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2020 16:05:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729028AbgDGOFt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 10:05:49 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:36577 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728861AbgDGOFt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Apr 2020 10:05:49 -0400
Received: by mail-ot1-f68.google.com with SMTP id l23so3238454otf.3
        for <linux-media@vger.kernel.org>; Tue, 07 Apr 2020 07:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1NdsvHQeHu5QTk7zrN8HxtBhQoh7MwqSb5UgLwBlUkg=;
        b=BoMvFf/VkDwYpMORHYEN6VhZl9zkCF1rwYWePM3AbCC/5ff6rDQ6ThJrNVEODSt+bj
         C9hPTShy6YVufNgRs01+mvvOpfYGjOhTMAVGjrFoHQ/daQJ5oJwp2XokTIqZS1ksJFln
         pU3ISmF/3RY5/iz70Bp+Eer6w1lT14oepTW34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1NdsvHQeHu5QTk7zrN8HxtBhQoh7MwqSb5UgLwBlUkg=;
        b=Dbx+M13ZOXFTNvpjeC2Y1SekiJAkYecEyWKipV3AmsH06DesM/DCoUrfmEbF+k8V1G
         69GVkS2Kzoj3UEZCRz1WIZBy6D4Nu1ZHnV+9uk2MRMbI0oo6J35wTqsbkJN1DamweR7p
         k1PFQ+K87VuxJudMGq69m3QRZwQj1QgvNqlpq/bmV5t8rxRhrPoVQmaKpWD69vlrYhnw
         sJzAisdUOYQiKaUTm8+ap3/VpH72KMOOVnYoOltDgLmdQsuIv6+8sPI3xqnhzhR0iuUu
         aNey24DIhiKbNGrHmztn0q9/VtW5CiMmGwPNYWofP4tPSkpi7cJC/v46fVIjTQJm8mwS
         xfjg==
X-Gm-Message-State: AGi0PubkYF2UlON8RZ2Irxecf22/ZtGVQeviUiO+MX/UGVqOt7JrdjB1
        hMq2Fc3bagMqZkQXFf3DZqL1vWw/M2GxRlIpCS4/aQ==
X-Google-Smtp-Source: APiQypL/RlVT2i69RdrWi7CstJmXxSmQgsRErYEyJetTK19b3yru1qFqr6NV0uNNQhhnA48y6Mo8ViTg31pruJQoNjs=
X-Received: by 2002:a05:6830:15d4:: with SMTP id j20mr1666775otr.303.1586268346055;
 Tue, 07 Apr 2020 07:05:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200114134101.159194-1-liumartin@google.com> <20200224033941.GB211610@google.com>
 <CAO_48GEPKk64uepCqZEc=6XGiv4tZnPHv=RZdwzKPuUqOxjpow@mail.gmail.com>
In-Reply-To: <CAO_48GEPKk64uepCqZEc=6XGiv4tZnPHv=RZdwzKPuUqOxjpow@mail.gmail.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Tue, 7 Apr 2020 16:05:34 +0200
Message-ID: <CAKMK7uH9gxp79VPfG+yMp+65_-+=U2iV1UH-SfzRnOc=9T4cPw@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: support 32bit DMA_BUF_SET_NAME ioctl
To:     Sumit Semwal <sumit.semwal@linaro.org>
Cc:     Martin Liu <liumartin@google.com>,
        Minchan Kim <minchan@kernel.org>, surenb@google.com,
        Wei Wang <wvw@google.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        DRI mailing list <dri-devel@lists.freedesktop.org>,
        Linaro MM SIG <linaro-mm-sig@lists.linaro.org>,
        LKML <linux-kernel@vger.kernel.org>, jenhaochen@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Apr 7, 2020 at 3:26 PM Sumit Semwal <sumit.semwal@linaro.org> wrote=
:
>
> Hello,
>
> Daniel, your comments here, please?

Don't :-)

I mean rule of thumb you should never need a compat_ioctl for a new
ioctl, that's just failure to read
https://www.kernel.org/doc/html/v5.4-preprc-cpu/ioctl/botching-up-ioctls.ht=
ml

Specifically the char * pointer in the ioctl definition is the
problem. Now we're somewhat lucky here, since the actual layout of the
data isn't different between 32 and 64 bit, it's only the ioctl. Which
is the 2nd issue, the type in there should be the type of the data in
userspace, not the type of the _pointer_ to the stuff in userspace. So
here actually variable-sized char[] array, which also doesn't work
really.

Anyway I've created a quick patch to have distinct ioctl number
defines and handle both in the main handler, that should work. Cc'ed
everyone from this thread, please test.
-Daniel

>
> On Mon, 24 Feb 2020 at 09:09, Martin Liu <liumartin@google.com> wrote:
> >
> > On Tue, Jan 14, 2020 at 09:41:01PM +0800, Martin Liu wrote:
> >
> > CC more MLs for winder review.
> >
> > > This commit adds SET_NAME ioctl coversion to
> > > support 32 bit ioctl.
> > >
> > > Signed-off-by: Martin Liu <liumartin@google.com>
> > > ---
> > >  drivers/dma-buf/dma-buf.c | 22 +++++++++++++++++++++-
> > >  1 file changed, 21 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > > index ce41cd9b758a..a73048b34843 100644
> > > --- a/drivers/dma-buf/dma-buf.c
> > > +++ b/drivers/dma-buf/dma-buf.c
> > > @@ -25,6 +25,7 @@
> > >  #include <linux/mm.h>
> > >  #include <linux/mount.h>
> > >  #include <linux/pseudo_fs.h>
> > > +#include <linux/compat.h>
> > >
> > >  #include <uapi/linux/dma-buf.h>
> > >  #include <uapi/linux/magic.h>
> > > @@ -409,13 +410,32 @@ static void dma_buf_show_fdinfo(struct seq_file=
 *m, struct file *file)
> > >       dma_resv_unlock(dmabuf->resv);
> > >  }
> > >
> > > +#ifdef CONFIG_COMPAT
> > > +static long dma_buf_ioctl_compat(struct file *file, unsigned int cmd=
,
> > > +                              unsigned long arg)
> > > +{
> > > +     switch (_IOC_NR(cmd)) {
> > > +     case _IOC_NR(DMA_BUF_SET_NAME):
> > > +             /* Fix up pointer size*/
> > > +             if (_IOC_SIZE(cmd) =3D=3D sizeof(compat_uptr_t)) {
> > > +                     cmd &=3D ~IOCSIZE_MASK;
> > > +                     cmd |=3D sizeof(void *) << IOCSIZE_SHIFT;
> > > +             }
> > > +             break;
> > > +     }
> > > +     return dma_buf_ioctl(file, cmd, (unsigned long)compat_ptr(arg))=
;
> > > +}
> > > +#endif
> > > +
> > >  static const struct file_operations dma_buf_fops =3D {
> > >       .release        =3D dma_buf_release,
> > >       .mmap           =3D dma_buf_mmap_internal,
> > >       .llseek         =3D dma_buf_llseek,
> > >       .poll           =3D dma_buf_poll,
> > >       .unlocked_ioctl =3D dma_buf_ioctl,
> > > -     .compat_ioctl   =3D compat_ptr_ioctl,
> > > +#ifdef CONFIG_COMPAT
> > > +     .compat_ioctl   =3D dma_buf_ioctl_compat,
> > > +#endif
> > >       .show_fdinfo    =3D dma_buf_show_fdinfo,
> > >  };
> > >
> > > --
> > > 2.25.0.rc1.283.g88dfdc4193-goog
> > >
>
>
>
> --
> Thanks and regards,
>
> Sumit Semwal
> Linaro Consumer Group - Kernel Team Lead
> Linaro.org =E2=94=82 Open source software for ARM SoCs



--=20
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
