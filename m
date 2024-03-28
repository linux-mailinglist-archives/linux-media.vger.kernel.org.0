Return-Path: <linux-media+bounces-6611-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E4A8748DA
	for <lists+linux-media@lfdr.de>; Thu,  7 Mar 2024 08:37:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B94811C21AE8
	for <lists+linux-media@lfdr.de>; Thu,  7 Mar 2024 07:37:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DEF363127;
	Thu,  7 Mar 2024 07:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S8Z9whF4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD0463110
	for <linux-media@vger.kernel.org>; Thu,  7 Mar 2024 07:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709797050; cv=none; b=oKHXQx/dn189ZsjUFXCMui0E9Kjbnn0FxkcVdTrhmGhhdi3sTTCfS8N/5lAoLy+WpjECn323/3YsLnK/bdo4GtuE9y1fVweYbhB2QKV6uo75KdhbwI/2wrk5JdLgfFyYVv+296AqNP5vw++0sTIMj/jGnb49pMotdvxpuGoSzWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709797050; c=relaxed/simple;
	bh=wMor+BeQBq5zWjjzqH7OTa0oyJ4srZyiumVjhOHw774=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FxI/eHvnYPAPhAVZDCLsMWgPdfP7yIOp/CBPhyMdR3sbePWGK1Y6dd4uvnqC5Kby3EX54uZ6urJWfLrMSCiON4YI60yrdMDXUD/RyxJldpr7s9gUVH0teLryuhADcOQeWLVr/3pMhLlrp0J/YT59bK6Zawb3Xn5OVFMIMvExQQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S8Z9whF4; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-55a5e7fa471so730123a12.1
        for <linux-media@vger.kernel.org>; Wed, 06 Mar 2024 23:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709797047; x=1710401847; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1kw0N/eOAnZk7gfPXfHIs1qJP19DGGStl8rmjj+wRpo=;
        b=S8Z9whF4gX8tIeB5a72SW7XXBayxFUWB44j/V2pLHFzKbWHDxUo7vH5Sbrdr0Odi28
         H/jzAwSI8+E4ujcG+IqwWVGQBejLg8bs/3RKz0Eq4QvFD+WGYEKTS1lEdYEbP7KB2qYb
         E6C+vFXDfOKFdLPuj/8bgPKUssFmmdrkfNsjfyuEFX/n/7vixE/MyQUI7EB+uIwWZQH0
         aDTqPrTlgx5IgBsL14GDzllLebA9Qauq7ePx33oYQs7id28wJvEfYSbu6rZHs2RI2eOp
         MY4HazJQteiDS2NaLBjDns7TTM/TlwPwsGt4DwB7oDUb6zdYiJ0Bkia3nYK/cpE3CxLJ
         GqLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709797047; x=1710401847;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1kw0N/eOAnZk7gfPXfHIs1qJP19DGGStl8rmjj+wRpo=;
        b=TRGtldEtqpEWfQCgtLWUhzqEsQveL0qJovcBt+cgmNO3uonsomrcDzmEoeQ8+tLsYM
         Dzd8m3N3iqSYSHyQ0F2WoMn2bsRW3s3U25G0tAHlT38QoRVnoWl4XmRCqqcwd76eaSAp
         rtVkZltDpHrnlJUirBb3CNQo9DR1Tx1Bb1sMAEhd0ZqJ0aoBKawq++13PK4M1TCb+UL2
         JiHpD90j6xL+MSq9ax6KbPGZ+9vuWlG5RBoZvVjFWZ/v2E/F/xyUfEa37g4fS1BcnlKT
         YlU/53LVUJiR8rR29H43hIXWABPDNAHLmBHNdSMuN92ScbFW3cEibmzmD00vSQ/QBcn9
         UG5w==
X-Forwarded-Encrypted: i=1; AJvYcCWS/CsNKByU6+MuH8p5V1LP9xqB9sC9QT8M4PRS/dZtsKWed+pgy2jzD0/B+gvkDsyAER7gbDth7Li0u+pi6Qag02s1LU/+uV1lMRI=
X-Gm-Message-State: AOJu0YyiuLpOJ/NYi94/TtS8eYX+tIZ8G7KBu5n9QYGmoIUagIZ8qOBt
	PUrulQD4hBxiajHH5+mj4ukWLpFyOP1k6gSpluGeIzc7dW4ub3VtxROs7RnP8B3WT5zQY4hqfKZ
	vzjkVheuDpUJSJ+xDY3Rb4Q9D8uHwNr9Zr9km/w==
X-Google-Smtp-Source: AGHT+IEanJhlxrJ0m3zCL0/FeuJM7oxCf5rvMMCu8nSAcar4vS1rMrFlRHpWwKJ8Ocvgn+dG5rIRCHc9Y5rV3Z2n5EY=
X-Received: by 2002:a05:6402:1ec9:b0:568:316:2616 with SMTP id
 g9-20020a0564021ec900b0056803162616mr1744389edg.15.1709797046953; Wed, 06 Mar
 2024 23:37:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240305-class_cleanup-drm-v1-0-94f82740525a@marliere.net>
 <20240305-class_cleanup-drm-v1-4-94f82740525a@marliere.net> <CABdmKX0VGyBdTo8gzEocyz2HFcqEtu_31PYVjWzioBdCbnXW6w@mail.gmail.com>
In-Reply-To: <CABdmKX0VGyBdTo8gzEocyz2HFcqEtu_31PYVjWzioBdCbnXW6w@mail.gmail.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Thu, 7 Mar 2024 13:07:15 +0530
Message-ID: <CAO_48GH_RyeTkUsZ9Ad=o2D+Poh3DVQnXiOmyApuWy2Ycn5P5w@mail.gmail.com>
Subject: Re: [PATCH RESEND drm-misc 4/4] dma-buf: heaps: make dma_heap_class constant
To: "T.J. Mercier" <tjmercier@google.com>
Cc: "Ricardo B. Marliere" <ricardo@marliere.net>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Hans de Goede <hdegoede@redhat.com>, Helge Deller <deller@gmx.de>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Ricardo,

On Tue, 5 Mar 2024 at 22:37, T.J. Mercier <tjmercier@google.com> wrote:
>
> On Tue, Mar 5, 2024 at 3:34=E2=80=AFAM Ricardo B. Marliere <ricardo@marli=
ere.net> wrote:
> >
> > Since commit 43a7206b0963 ("driver core: class: make class_register() t=
ake
> > a const *"), the driver core allows for struct class to be in read-only
> > memory, so move the dma_heap_class structure to be declared at build ti=
me
> > placing it into read-only memory, instead of having to be dynamically
> > allocated at boot time.
> >
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
> > ---
> >  drivers/dma-buf/dma-heap.c | 26 ++++++++++++++------------
> >  1 file changed, 14 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> > index 84ae708fafe7..bcca6a2bbce8 100644
> > --- a/drivers/dma-buf/dma-heap.c
> > +++ b/drivers/dma-buf/dma-heap.c
> > @@ -43,10 +43,18 @@ struct dma_heap {
> >         struct cdev heap_cdev;
> >  };
> >
> > +static char *dma_heap_devnode(const struct device *dev, umode_t *mode)
> > +{
> > +       return kasprintf(GFP_KERNEL, "dma_heap/%s", dev_name(dev));
> > +}
> > +
> >  static LIST_HEAD(heap_list);
> >  static DEFINE_MUTEX(heap_list_lock);
> >  static dev_t dma_heap_devt;
> > -static struct class *dma_heap_class;
> > +static struct class dma_heap_class =3D {
> > +       .name =3D DEVNAME,
> > +       .devnode =3D dma_heap_devnode,
> > +};
> >  static DEFINE_XARRAY_ALLOC(dma_heap_minors);
> >
> >  static int dma_heap_buffer_alloc(struct dma_heap *heap, size_t len,
> > @@ -261,7 +269,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap=
_export_info *exp_info)
> >                 goto err1;
> >         }
> >
> > -       dev_ret =3D device_create(dma_heap_class,
> > +       dev_ret =3D device_create(&dma_heap_class,
> >                                 NULL,
> >                                 heap->heap_devt,
> >                                 NULL,
> > @@ -291,7 +299,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap=
_export_info *exp_info)
> >         return heap;
> >
> >  err3:
> > -       device_destroy(dma_heap_class, heap->heap_devt);
> > +       device_destroy(&dma_heap_class, heap->heap_devt);
> >  err2:
> >         cdev_del(&heap->heap_cdev);
> >  err1:
> > @@ -301,11 +309,6 @@ struct dma_heap *dma_heap_add(const struct dma_hea=
p_export_info *exp_info)
> >         return err_ret;
> >  }
> >
> > -static char *dma_heap_devnode(const struct device *dev, umode_t *mode)
> > -{
> > -       return kasprintf(GFP_KERNEL, "dma_heap/%s", dev_name(dev));
> > -}
> > -
> >  static int dma_heap_init(void)
> >  {
> >         int ret;
> > @@ -314,12 +317,11 @@ static int dma_heap_init(void)
> >         if (ret)
> >                 return ret;
> >
> > -       dma_heap_class =3D class_create(DEVNAME);
> > -       if (IS_ERR(dma_heap_class)) {
> > +       ret =3D class_register(&dma_heap_class);
> > +       if (ret) {
> >                 unregister_chrdev_region(dma_heap_devt, NUM_HEAP_MINORS=
);
> > -               return PTR_ERR(dma_heap_class);
> > +               return ret;
> >         }
> > -       dma_heap_class->devnode =3D dma_heap_devnode;
> >
> >         return 0;
> >  }
> >
> > --
> > 2.43.0
>
> Reviewed-by: T.J. Mercier <tjmercier@google.com>


FWIW, please free to add my
Acked-by: Sumit Semwal <sumit.semwal@linaro.org>

>
>
> Is this really a resend? I don't see anything on lore and I can't
> recall seeing this patch in my inbox before.


Best,
Sumit.

--=20
Thanks and regards,

Sumit Semwal (he / him)
Tech Lead - LCG, Vertical Technologies
Linaro.org =E2=94=82 Open source software for ARM SoCs

