Return-Path: <linux-media+bounces-41875-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 23809B46495
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 22:29:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCCB9564062
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 20:29:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEFA228689A;
	Fri,  5 Sep 2025 20:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EUCLY3kx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4115275AE9;
	Fri,  5 Sep 2025 20:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757104150; cv=none; b=CokQIQ3XPgD1DshqGXv1ZrlAG8SNIJRduXlS+xZsGVIYKz5aBQi+5KnXoAkEPDk5z6cG4VZB5bKQ4MrtPKBksnZSI5KKpGSaGagqw63eT/b76Nf+7ast3y9WeqHeI2BMyjl7bq5xIHF0hPVq82oz3IQB+/R0yI33TDyHHcJfDhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757104150; c=relaxed/simple;
	bh=B8vGk+fzOgyPOCMjY/4qqzPG7mrQ1ez1UO5ie3bDx9w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bPJ/nwnoQJwInZPp1zkWVVXbbEBH8twSOxpKwguPAwyvMOSMwXQohMyhS46aARF2mmYjqoydC+i+r0xIXjc2cEm9DSyKU4Ui1Lc5xmXK1bVKsYctSQQ366Y/YlXZmIDBH06eUqmgkpZ46MkB7P/JEE0UtbW62iEhrLTX0luu9hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EUCLY3kx; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-530cf611a7eso974760137.1;
        Fri, 05 Sep 2025 13:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757104147; x=1757708947; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WRYdzv2yLfwIl3yvxCdZmpVjhYDMK6+sb3jbu48r2xw=;
        b=EUCLY3kxD90Mabd5w2Ajh8Mx8/PqPdv4TiGqdLhRpmiXIw+XQHS58eQsoglTWuDXJ1
         4Fc66rVVV16Qs4XZ3w+lMNlWbjt4FXImPy/w7N7HWIR91UbQkpiH1oS5coKM0Te/UJZd
         1imUxQdE8HcaHzFtAGeJTBnMMqqW2Ha7hfX2xSJ7h9tnmaSfV6/QW6PifSnoAU9/rA2N
         xQwQs3ioMro5j6dOwy8DL78XWAXpSMvDNuBKZUSQ/uOighrmZDFBshvwyZILAW1VYji+
         CUj4wKdqlonihcW5/b0mqWCyDkqsBIs7IZDd/FRlg5cVjNRvF9gSdRobVsMxyUql/gop
         3iqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757104147; x=1757708947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WRYdzv2yLfwIl3yvxCdZmpVjhYDMK6+sb3jbu48r2xw=;
        b=EAOGpexGcyyXBxW/vZMlQOFVrSwJUoupcXx9k14K6j8/oda49y9x6mtBAd2n7Yvejm
         bmaBPQbiXZWJx1l4o4wiQ0Hh4o0BnLZiuzWWO++jm+CaOs0bWYe1YdhGLSzVSwBZAQSW
         gfO2ua8j0Mppt10R2j1hJRqjxPJSAM9adWWp16AeyH44+k6qvg2KQFksftU4PB1jq3Ys
         Cl7X/QEdTETuEDKV+VsR0fiWcKr5jfS5QKcokGf7pP/v/lemAEvzm02e79dhP6wg4JlJ
         7LDgwiOVAwrrcmyG7OC6m2WkrPkfJSIHDEIZTK7/22J6ThojoTqpY66zuRpswOVPwWK2
         GXrQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2DGSb9HzQV5AUpJkXxB+/KEhHGS/Y4J4bdBXm6wvB9AZvI5Mt5yIId/f39NgpqvQqGhIIOHm7NWY42vE=@vger.kernel.org, AJvYcCX5I33MRIytwDPdX9ch/IPp13YvBzrnH7bHDLVHU3FNOotvHMNzv0sfWpgHPu5/xhqgu9eI2yvNSd0N3qg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx61slBZDbmWYPmeJgHK2/8k1B9Qr0T1F17y7eClPm07agg/KpV
	ZNyC8CEgdEg3IgV0U+BYTd3XPmOOXCpCJ1K0wGRTe9uvM2Ob0Iv0gYfTGCOaI56N35mCMXXIH4Q
	HafZKED+eUXLTspgbJ9Nk941DYE8j2K4=
X-Gm-Gg: ASbGncsB+gP/AVPBQw/0QL0OrIYmgqYwwPb3gEgvfvdnq0PtpT09zQ1mTRND4UMSJjT
	0LN997ghMJ73clxXvozGAJ/3JSspMFSpLfbwL1sL3jZNjElbtYR23VKHcE5D/f6CelIPRct4WbZ
	cZJB/OO59J+sPa8zY6BIt9Jr25gg8QTf0Sckhc940PSBqFnS6dVjWLuuKxGfSxNrYCuz8GPZX9J
	mmDmJnvupYut7Sfhw==
X-Google-Smtp-Source: AGHT+IHLSvJaZfMeUcdGrvlV/zH2BNv6jVe/NLyK9DH4UMQ+m7FQAP82CV7ckcxxGuAOoTuxkp531KXZ1ncTj66uGwM=
X-Received: by 2002:a05:6102:f0e:b0:52a:f858:14a6 with SMTP id
 ada2fe7eead31-53d0ce6b73amr100443137.11.1757104147552; Fri, 05 Sep 2025
 13:29:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250830235838.58067-1-21cnbao@gmail.com> <CANDhNCqcoR3USLG0Ys2WBQmEdS0u6gdaHGCVsftMk3OC5Vhjpw@mail.gmail.com>
In-Reply-To: <CANDhNCqcoR3USLG0Ys2WBQmEdS0u6gdaHGCVsftMk3OC5Vhjpw@mail.gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Sat, 6 Sep 2025 04:28:56 +0800
X-Gm-Features: Ac12FXxSvETwT5SBYpmX3Lewm2vmP7y6oHoeUDfaqLEOtqhI45SlH7AV_3VHTQg
Message-ID: <CAGsJ_4wMn490tJgSOseA+6UMOdUuyPUT=Sy==FUYkRnHxQ8Afg@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: system_heap: use larger contiguous mappings
 instead of per-page mmap
To: John Stultz <jstultz@google.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	"T . J . Mercier" <tjmercier@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	zhengtangquan@oppo.com, Barry Song <v-songbaohua@oppo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 4, 2025 at 8:07=E2=80=AFAM John Stultz <jstultz@google.com> wro=
te:
>
> On Sat, Aug 30, 2025 at 4:58=E2=80=AFPM Barry Song <21cnbao@gmail.com> wr=
ote:
> >
> > From: Barry Song <v-songbaohua@oppo.com>
> >
> > We can allocate high-order pages, but mapping them one by
> > one is inefficient. This patch changes the code to map
> > as large a chunk as possible. The code looks somewhat
> > complicated mainly because supporting mmap with a
> > non-zero offset is a bit tricky.
> >
> > Using the micro-benchmark below, we see that mmap becomes
> > 3.5X faster:
> ...
>
> It's been awhile since I've done mm things, so take it with a pinch of
> salt, but this seems reasonable to me.
>
> Though, one thought below...
>
> > diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heap=
s/system_heap.c
> > index bbe7881f1360..4c782fe33fd4 100644
> > --- a/drivers/dma-buf/heaps/system_heap.c
> > +++ b/drivers/dma-buf/heaps/system_heap.c
> > @@ -186,20 +186,35 @@ static int system_heap_mmap(struct dma_buf *dmabu=
f, struct vm_area_struct *vma)
> >         struct system_heap_buffer *buffer =3D dmabuf->priv;
> >         struct sg_table *table =3D &buffer->sg_table;
> >         unsigned long addr =3D vma->vm_start;
> > -       struct sg_page_iter piter;
> > -       int ret;
> > +       unsigned long pgoff =3D vma->vm_pgoff;
> > +       struct scatterlist *sg;
> > +       int i, ret;
> > +
> > +       for_each_sgtable_sg(table, sg, i) {
> > +               unsigned long n =3D sg->length >> PAGE_SHIFT;
> >
> > -       for_each_sgtable_page(table, &piter, vma->vm_pgoff) {
> > -               struct page *page =3D sg_page_iter_page(&piter);
> > +               if (pgoff < n)
> > +                       break;
> > +               pgoff -=3D n;
> > +       }
> > +
> > +       for (; sg && addr < vma->vm_end; sg =3D sg_next(sg)) {
> > +               unsigned long n =3D (sg->length >> PAGE_SHIFT) - pgoff;
> > +               struct page *page =3D sg_page(sg) + pgoff;
> > +               unsigned long size =3D n << PAGE_SHIFT;
> > +
> > +               if (addr + size > vma->vm_end)
> > +                       size =3D vma->vm_end - addr;
> >
> > -               ret =3D remap_pfn_range(vma, addr, page_to_pfn(page), P=
AGE_SIZE,
> > -                                     vma->vm_page_prot);
> > +               ret =3D remap_pfn_range(vma, addr, page_to_pfn(page),
> > +                               size, vma->vm_page_prot);
>
> It feels like this sort of mapping loop for higher order pages
> wouldn't be a unique pattern to just this code.  Would this be better
> worked into a helper so it would be more generally usable?

Another case is vmap, but that would require extending vmap_sg and
related code, with little chance to share code with mmap. It also seems
hard to find other drivers that use mmap with sg. If it turns out that
others are making similar changes, we could ask to extract our current
modifications into a common helper.

>
> Otherwise,
> Acked-by: John Stultz <jstultz@google.com>

Thanks!

>

Best regards,
Barry

