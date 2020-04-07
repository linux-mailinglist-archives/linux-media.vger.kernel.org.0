Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAFD61A0E4F
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2020 15:26:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728904AbgDGN0i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 09:26:38 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:40783 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726562AbgDGN0i (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Apr 2020 09:26:38 -0400
Received: by mail-ot1-f67.google.com with SMTP id q2so307650otk.7
        for <linux-media@vger.kernel.org>; Tue, 07 Apr 2020 06:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=chd5WzCy0W5BZwZMM5n5siOhfZK7euPR7nF8zWDeFKg=;
        b=de06OTPjR8XQn557+eG8TJFSc2cmK5ZXvu3hkZ/51UvlISseAXqJcWlh4n3jupOgug
         JbmcwNB8WQ/LP5DNePw7HGRnEH+y/l7ZxsTFDPJ2q1S8/CyjWMt1+y1prk0vHZIXUl/D
         46tXIf8fo9m1uFv3yA2xtyCikAPviSXgWrz8p9jlOuiBnVMVjagm8rnyLiSwpFXm91UI
         TGDjW1vyHIg0CVVzn94GA8ja75Nenr9GMkuW5A12+WLm7p8Pn0lRNgM5urrXepv96557
         knql0La/884zBwDExkSzw9/P3413EzeL6j/kTr4JM4qZnqaeoTkQPVtvYh/pzX+vDLK3
         Ka7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=chd5WzCy0W5BZwZMM5n5siOhfZK7euPR7nF8zWDeFKg=;
        b=mixfSEHvJQw4zEK15H3bkgOGRyigQOWtnW3qMJ9zaDey/3keOwpaB9s8NKeykeHGIi
         ztOEWihTjYtjyrQDIySr6ON/xGrNjhOUT0gHMU4SnMlXGzAgVk6Q++QX5WV1XDiKlroZ
         G6uyl1MMWfW6wFmGe+UjGeCvKQ1cZxN98DMsC0p6hieMi98aF9drzriTqc1IW0EcMivx
         aPAYJI82s0GKWYnPh5T7MFASvaebOlaSujjojxZGA+YCl3Wc5W3Z5IMNImvoiomqvlH+
         DD0+ojEGvKth7t7PBqxEQ1NqMlmoWzs2rjQ3RSJDCenfHrNumWpQlBuy4zDp9ndlF5k9
         xKPg==
X-Gm-Message-State: AGi0PubZJWzLrNXxklgjhVRudwrcpSJ3yi4YbPYqq1Y/J7eBl7eRqlGq
        GHU2q/u24eeQ4ful/QFO76ciQx8/S/xK+347t4082g==
X-Google-Smtp-Source: APiQypJZWdNWLCr8c7kvNmiyUNyP8+q2DylC9N8N3tNEL0K144FrAEg+MPdooShGhw/fVijitpe8PMglbX8QxeHfbSU=
X-Received: by 2002:a9d:6c19:: with SMTP id f25mr1553187otq.371.1586265997194;
 Tue, 07 Apr 2020 06:26:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200114134101.159194-1-liumartin@google.com> <20200224033941.GB211610@google.com>
In-Reply-To: <20200224033941.GB211610@google.com>
From:   Sumit Semwal <sumit.semwal@linaro.org>
Date:   Tue, 7 Apr 2020 18:56:25 +0530
Message-ID: <CAO_48GEPKk64uepCqZEc=6XGiv4tZnPHv=RZdwzKPuUqOxjpow@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: support 32bit DMA_BUF_SET_NAME ioctl
To:     Martin Liu <liumartin@google.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     minchan@kernel.org, surenb@google.com, wvw@google.com,
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

Hello,

Daniel, your comments here, please?

On Mon, 24 Feb 2020 at 09:09, Martin Liu <liumartin@google.com> wrote:
>
> On Tue, Jan 14, 2020 at 09:41:01PM +0800, Martin Liu wrote:
>
> CC more MLs for winder review.
>
> > This commit adds SET_NAME ioctl coversion to
> > support 32 bit ioctl.
> >
> > Signed-off-by: Martin Liu <liumartin@google.com>
> > ---
> >  drivers/dma-buf/dma-buf.c | 22 +++++++++++++++++++++-
> >  1 file changed, 21 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index ce41cd9b758a..a73048b34843 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -25,6 +25,7 @@
> >  #include <linux/mm.h>
> >  #include <linux/mount.h>
> >  #include <linux/pseudo_fs.h>
> > +#include <linux/compat.h>
> >
> >  #include <uapi/linux/dma-buf.h>
> >  #include <uapi/linux/magic.h>
> > @@ -409,13 +410,32 @@ static void dma_buf_show_fdinfo(struct seq_file *=
m, struct file *file)
> >       dma_resv_unlock(dmabuf->resv);
> >  }
> >
> > +#ifdef CONFIG_COMPAT
> > +static long dma_buf_ioctl_compat(struct file *file, unsigned int cmd,
> > +                              unsigned long arg)
> > +{
> > +     switch (_IOC_NR(cmd)) {
> > +     case _IOC_NR(DMA_BUF_SET_NAME):
> > +             /* Fix up pointer size*/
> > +             if (_IOC_SIZE(cmd) =3D=3D sizeof(compat_uptr_t)) {
> > +                     cmd &=3D ~IOCSIZE_MASK;
> > +                     cmd |=3D sizeof(void *) << IOCSIZE_SHIFT;
> > +             }
> > +             break;
> > +     }
> > +     return dma_buf_ioctl(file, cmd, (unsigned long)compat_ptr(arg));
> > +}
> > +#endif
> > +
> >  static const struct file_operations dma_buf_fops =3D {
> >       .release        =3D dma_buf_release,
> >       .mmap           =3D dma_buf_mmap_internal,
> >       .llseek         =3D dma_buf_llseek,
> >       .poll           =3D dma_buf_poll,
> >       .unlocked_ioctl =3D dma_buf_ioctl,
> > -     .compat_ioctl   =3D compat_ptr_ioctl,
> > +#ifdef CONFIG_COMPAT
> > +     .compat_ioctl   =3D dma_buf_ioctl_compat,
> > +#endif
> >       .show_fdinfo    =3D dma_buf_show_fdinfo,
> >  };
> >
> > --
> > 2.25.0.rc1.283.g88dfdc4193-goog
> >



--=20
Thanks and regards,

Sumit Semwal
Linaro Consumer Group - Kernel Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
