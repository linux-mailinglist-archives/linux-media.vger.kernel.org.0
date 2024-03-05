Return-Path: <linux-media+bounces-6490-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DF4872527
	for <lists+linux-media@lfdr.de>; Tue,  5 Mar 2024 18:07:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E77941C22B3B
	for <lists+linux-media@lfdr.de>; Tue,  5 Mar 2024 17:07:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 667CE14AA3;
	Tue,  5 Mar 2024 17:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rHwSCCqs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5FD13FE7
	for <linux-media@vger.kernel.org>; Tue,  5 Mar 2024 17:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709658453; cv=none; b=GEhFgLipC43Edb2QRlXCAGD9zqEXbLoLlm2iI3obPfBboeLORPjnKCikWxPtzUsyhh7oguFTpeMTnMGMuBLzDZeNHvxgTY3DuzYR9fvixurSQP7CS9HpJt/XJEiyboyZu2rJ2GKBDbknc9e2GaZga/hfRQn7J8qytY7833S+Euk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709658453; c=relaxed/simple;
	bh=kDL0bKC/FdnbM5PFR+QeX7Z2TzJVZvMq9rDwAGIujaQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M/9Cw4ds9VhrxaLRqvql6xr8v/QZfny0GxJcaRLUKGDnt5iLY8MBiJBs4pvZ7sKH+0qD2vJ6EvFTTP6eWJk2DUWhqjj0HNafTERn5RGAAQ1uZh/nKrd79S1qAE/PO0xj1vh4Exmzjk1Uf5B2+ujuHi3McK0LYU8pm4UNjkGGYB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rHwSCCqs; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-d9b9adaf291so5344770276.1
        for <linux-media@vger.kernel.org>; Tue, 05 Mar 2024 09:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709658450; x=1710263250; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xf8U/YCUFimTwrJwKD9PvTi4VYclikCpHMhYCrDyA6M=;
        b=rHwSCCqs4KLSmTY1OsJmwcSvHVgRs0RtiIoeBzIH0+xT72IIQ9VepeT5xNjuJGXpYe
         pc1ao8M6axHpD25NK6oahNuk2tJek9N5kFfVcjaaUXxO8bRv8H4rKyWasrV8zC6Ypnb/
         SHz3GnQeXwVWmH38M8OK+b4n3rYVGAmRvkxI6fnJcoMUo0HVfvdjhq1yeY0p+mIt6Q8d
         cYvJbmjlJXvcee75M4HQWs7MvJeEtgtAHcrHPmw+BaH0Pn8+yk95vmPESfPVyPQeMJdg
         TjwGJKKpXMCe7pX7nkshV0OCHYtcpO1JNvqZ1cNjCNjKYdRD6pySeYPi56g2hcIHJYrD
         m/gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709658450; x=1710263250;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xf8U/YCUFimTwrJwKD9PvTi4VYclikCpHMhYCrDyA6M=;
        b=kcms1KXVTsSzuHM4qnrK6NGZI3V0f1I0xVQgPip/FV78fcB4vqRWLuTJhzpCCpWn/Y
         SeunmefIAuNba3AebXIenubaVF4l3IcaBpGL6IifQdV891y4uXZifLxeve0tM59dcmXK
         e5SzZ6Z9FyumKpORqhkWjLfENkqeOzrgDk1nUZyaPuAN2RO7lkQFbHYWj6LJZ6mKJsQA
         R6sJHGwZ+EDra+nRsy2zmvdz+Z1DQp6x1maQuXZOuqOh8ZsHwwUiODBB1gvqs97jI2/k
         kZ6bieDOYsXY5jkKymIrGtiG93lqXxsLErLn/TSWJctoGWgMeMPbDBmikgiHz91tHPvd
         fEGg==
X-Forwarded-Encrypted: i=1; AJvYcCXL1FDzTGc0yxAd56o4lxO+WD+aVaS6TsORaUAliwvl91fyzlKp7qYkYFqQW5+CYjQT35AZ0SMaU0yLsu+g72bIrMHYRhFM2iiZhQs=
X-Gm-Message-State: AOJu0YyIAfXBnMuutzUEi4wNUS6gmR0kxVhPzaNXROWgrqTk6I1r27e2
	UuSH4KSExqt0deTCDoilPBI+8ISPLYqNHmqwSf359zMJQbvB1WGxJKDNLVcGwl7AixVIbuIGnpb
	PyAbBUQwjAdj6E0+YXFsESRGz14kkgYQNrZFR
X-Google-Smtp-Source: AGHT+IFcqAf9bC17H0h/tfqRs3xLoCqraMHelviOyaD+ddhbqiDr1geTm3/Xp4CxcT44v3PUNnOU4ePnKKfLZOimpLI=
X-Received: by 2002:a05:6902:2012:b0:dc6:18d0:95b0 with SMTP id
 dh18-20020a056902201200b00dc618d095b0mr11090518ybb.8.1709658449653; Tue, 05
 Mar 2024 09:07:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240305-class_cleanup-drm-v1-0-94f82740525a@marliere.net> <20240305-class_cleanup-drm-v1-4-94f82740525a@marliere.net>
In-Reply-To: <20240305-class_cleanup-drm-v1-4-94f82740525a@marliere.net>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 5 Mar 2024 09:07:17 -0800
Message-ID: <CABdmKX0VGyBdTo8gzEocyz2HFcqEtu_31PYVjWzioBdCbnXW6w@mail.gmail.com>
Subject: Re: [PATCH RESEND drm-misc 4/4] dma-buf: heaps: make dma_heap_class constant
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Hans de Goede <hdegoede@redhat.com>, Helge Deller <deller@gmx.de>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 5, 2024 at 3:34=E2=80=AFAM Ricardo B. Marliere <ricardo@marlier=
e.net> wrote:
>
> Since commit 43a7206b0963 ("driver core: class: make class_register() tak=
e
> a const *"), the driver core allows for struct class to be in read-only
> memory, so move the dma_heap_class structure to be declared at build time
> placing it into read-only memory, instead of having to be dynamically
> allocated at boot time.
>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
> ---
>  drivers/dma-buf/dma-heap.c | 26 ++++++++++++++------------
>  1 file changed, 14 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> index 84ae708fafe7..bcca6a2bbce8 100644
> --- a/drivers/dma-buf/dma-heap.c
> +++ b/drivers/dma-buf/dma-heap.c
> @@ -43,10 +43,18 @@ struct dma_heap {
>         struct cdev heap_cdev;
>  };
>
> +static char *dma_heap_devnode(const struct device *dev, umode_t *mode)
> +{
> +       return kasprintf(GFP_KERNEL, "dma_heap/%s", dev_name(dev));
> +}
> +
>  static LIST_HEAD(heap_list);
>  static DEFINE_MUTEX(heap_list_lock);
>  static dev_t dma_heap_devt;
> -static struct class *dma_heap_class;
> +static struct class dma_heap_class =3D {
> +       .name =3D DEVNAME,
> +       .devnode =3D dma_heap_devnode,
> +};
>  static DEFINE_XARRAY_ALLOC(dma_heap_minors);
>
>  static int dma_heap_buffer_alloc(struct dma_heap *heap, size_t len,
> @@ -261,7 +269,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap_e=
xport_info *exp_info)
>                 goto err1;
>         }
>
> -       dev_ret =3D device_create(dma_heap_class,
> +       dev_ret =3D device_create(&dma_heap_class,
>                                 NULL,
>                                 heap->heap_devt,
>                                 NULL,
> @@ -291,7 +299,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap_e=
xport_info *exp_info)
>         return heap;
>
>  err3:
> -       device_destroy(dma_heap_class, heap->heap_devt);
> +       device_destroy(&dma_heap_class, heap->heap_devt);
>  err2:
>         cdev_del(&heap->heap_cdev);
>  err1:
> @@ -301,11 +309,6 @@ struct dma_heap *dma_heap_add(const struct dma_heap_=
export_info *exp_info)
>         return err_ret;
>  }
>
> -static char *dma_heap_devnode(const struct device *dev, umode_t *mode)
> -{
> -       return kasprintf(GFP_KERNEL, "dma_heap/%s", dev_name(dev));
> -}
> -
>  static int dma_heap_init(void)
>  {
>         int ret;
> @@ -314,12 +317,11 @@ static int dma_heap_init(void)
>         if (ret)
>                 return ret;
>
> -       dma_heap_class =3D class_create(DEVNAME);
> -       if (IS_ERR(dma_heap_class)) {
> +       ret =3D class_register(&dma_heap_class);
> +       if (ret) {
>                 unregister_chrdev_region(dma_heap_devt, NUM_HEAP_MINORS);
> -               return PTR_ERR(dma_heap_class);
> +               return ret;
>         }
> -       dma_heap_class->devnode =3D dma_heap_devnode;
>
>         return 0;
>  }
>
> --
> 2.43.0

Reviewed-by: T.J. Mercier <tjmercier@google.com>

Is this really a resend? I don't see anything on lore and I can't
recall seeing this patch in my inbox before.

