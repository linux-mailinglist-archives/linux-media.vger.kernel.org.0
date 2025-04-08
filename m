Return-Path: <linux-media+bounces-29620-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DC730A80C4A
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 15:31:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AD7957B47F5
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 13:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E165188915;
	Tue,  8 Apr 2025 13:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bK+eg/M/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB7F184524
	for <linux-media@vger.kernel.org>; Tue,  8 Apr 2025 13:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744118940; cv=none; b=BdYTyEyYVy9s3I5cNsBnwwP1reEGF2nQOLXLKTjBqkwo+CFppnHMj/LA+PRlw3BpsOJ8+gn57irZ+tTBiHSM3R1fhWtl2+NyvykcTbZxZr7nF1MqPvDyLv+AHLChnd+tG8rBnKlXGja4BPeY48cYENiuwaUy8y9nB+pKcZbF39k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744118940; c=relaxed/simple;
	bh=lp92M4ZMRL0XIN792/96i5Ero8lxj7Titagx5rgLawY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r1wLwUWdGACp54WXe38g5UfJTaA7UeAGdNUZHt/oMmlLYjYOrcjRDda6VFvXrcpeuq69drDZVTc+JUGpc7yspTKLnHEvJd+hqySciOU4gDN0NJlufEMaG1V98vj0P8T3gW15KMhm8KxkoM/YOOsn21gNPCgprK8Pi8Op8x+ehZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bK+eg/M/; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-2cc57330163so3067366fac.2
        for <linux-media@vger.kernel.org>; Tue, 08 Apr 2025 06:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744118938; x=1744723738; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/8oL4Wx/LFCNYSj8OeE9r8nBxp3KNb2RWFN4L2fcM5k=;
        b=bK+eg/M//2OefqF4Sm/Io6JS3dLOYlxDk9KkAQn6bcpWAJlV8udYjNdDQ+8MqPEInz
         ZmbChxujKdleE2gN8nq2geIBkF6JDs5cR4+nnhCX6JldEkKNXXcd6qSSLAUViKLhbci9
         vjZs5F4LGcXsL3uT4rWleQUc3jqf4VCS+/3qBgtm7fXJqk4S8Li6Hi5mfXmT94NwulOO
         pxOCcDT/a4pcY6gGc/IQ6jjBSCML+b90+/7sLE3qUSqdPAJbcgTPjc0+pbsBv7P98IQE
         Zvy3vQkptRIYdNkX0/sGC9FgRbaKYHbp8VmPKixPhWAtx5PgafdAx4umhOYcY1WBmIHM
         JSVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744118938; x=1744723738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/8oL4Wx/LFCNYSj8OeE9r8nBxp3KNb2RWFN4L2fcM5k=;
        b=HJT2vJX9uy5vmULbWYum//DLYTLUXRVJhZ7mKojNChRQ9CccY6d3GJHqMI7GJvC9YP
         z6b9Sz4gVRwtH273+d2EyrIA8QiChyJksol5lJTVGhhMCnyK+KPvTnVy6xyjDL+/dUzx
         3mKa27d8rTo46UnUxNTs0x2prIOco7Xg7Q1n8MK/s2uGX8ItGsEIQ4uK9IkMVO653CMH
         VZVJQO7pKoOsMKvsBGrKFmPUCrIlnsG9odfaLcxgtMeUuItn3qcHKaIb3MehBRirVI+O
         EcqYwJiZXh5FnsUs541UnWfQy38MkFryzFvJMHxVWy0oQNmFa6L6qpknAUlZgzoHxB2s
         t+Bg==
X-Forwarded-Encrypted: i=1; AJvYcCVQdAD++l5D+yo8/jpc/6UusOHcAy5d5A3G9EvQhJRU7WV6IFLffur1iSmpBLxs35o0nP96os/cky8s2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwU0ceu2ARJdP9JQIBb9HORCn6GV1oaxEv9JuDIH4MqnPSgbNY2
	9uh56g3sb8yf1byb9v44raYe0biGEkt/kNVkJxTXhQBsgVf6KTSV3EuPNUJeBc1MeMXQJrxZCcT
	y6pfKLodoj3HziaCGPdjkdug5eAAzL1KnCZLqlg==
X-Gm-Gg: ASbGncufYtQPtWJ4kShOIoyfIDv1RZTPnp2d8fJdk/vNMolpLZwIoPtEfkGx3oBEK0Y
	LakjxMrwDmLMgjdYB/UvywdSCNOI9im+YFLG8gy6zhqjB9uxoCly/Gv/H4ptVvFBcegjDzIdn/l
	yOzkzIcBGG4BogX9OE5PKnnj+SjF0=
X-Google-Smtp-Source: AGHT+IHAG/ejTbg5vA3Vos54fD/tOWqlevkuF4IcqFNjsV/ID7Wtar2qRZ5cZm99uR1FeZB4/PY/aA5SmWOjkV3d+8Q=
X-Received: by 2002:a05:6870:8185:b0:2c2:4eb0:41f3 with SMTP id
 586e51a60fabf-2cc9e50b24emr9010028fac.3.1744118938200; Tue, 08 Apr 2025
 06:28:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
 <20250305130634.1850178-6-jens.wiklander@linaro.org> <Z-JOPgcWlpTlskgd@sumit-X1>
 <CAHUa44GjpHT5Nqo+Ar5jNYNPV-YJQYpLTCf=7oJ1o0VjP-t0nA@mail.gmail.com>
 <Z-ucuPzwz4IqVTgb@sumit-X1> <CAHUa44FpsCVrbwj1=nsJVJFVJSF1kzKdWAkAMXRu6EdLrLvh8g@mail.gmail.com>
 <Z_To9V-JOKZ7ChhE@sumit-X1>
In-Reply-To: <Z_To9V-JOKZ7ChhE@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 8 Apr 2025 15:28:45 +0200
X-Gm-Features: ATxdqUHzionenqJkD4YMHdkp7sUKPz9WrHUIS_ghqCFpfmFZzX0EbynUuoPZUrs
Message-ID: <CAHUa44EGWuVPjoxpG-S66he=6dkvkwzxNewaGKVKXUxrO41ztg@mail.gmail.com>
Subject: Re: [PATCH v6 05/10] tee: implement restricted DMA-heap
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 11:14=E2=80=AFAM Sumit Garg <sumit.garg@kernel.org> =
wrote:
>
> On Tue, Apr 01, 2025 at 10:33:04AM +0200, Jens Wiklander wrote:
> > On Tue, Apr 1, 2025 at 9:58=E2=80=AFAM Sumit Garg <sumit.garg@kernel.or=
g> wrote:
> > >
> > > On Tue, Mar 25, 2025 at 11:55:46AM +0100, Jens Wiklander wrote:
> > > > Hi Sumit,
> > > >
> > >
> > > <snip>
> > >
> > > >
> > > > >
> > > > > > +
> > > > > > +#include "tee_private.h"
> > > > > > +
> > > > > > +struct tee_dma_heap {
> > > > > > +     struct dma_heap *heap;
> > > > > > +     enum tee_dma_heap_id id;
> > > > > > +     struct tee_rstmem_pool *pool;
> > > > > > +     struct tee_device *teedev;
> > > > > > +     /* Protects pool and teedev above */
> > > > > > +     struct mutex mu;
> > > > > > +};
> > > > > > +
> > > > > > +struct tee_heap_buffer {
> > > > > > +     struct tee_rstmem_pool *pool;
> > > > > > +     struct tee_device *teedev;
> > > > > > +     size_t size;
> > > > > > +     size_t offs;
> > > > > > +     struct sg_table table;
> > > > > > +};
> > > > > > +
> > > > > > +struct tee_heap_attachment {
> > > > > > +     struct sg_table table;
> > > > > > +     struct device *dev;
> > > > > > +};
> > > > > > +
> > > > > > +struct tee_rstmem_static_pool {
> > > > > > +     struct tee_rstmem_pool pool;
> > > > > > +     struct gen_pool *gen_pool;
> > > > > > +     phys_addr_t pa_base;
> > > > > > +};
> > > > > > +
> > > > > > +#if !IS_MODULE(CONFIG_TEE) && IS_ENABLED(CONFIG_DMABUF_HEAPS)
> > > > >
> > > > > Can this dependency rather be better managed via Kconfig?
> > > >
> > > > This was the easiest yet somewhat flexible solution I could find. I=
f
> > > > you have something better, let's use that instead.
> > > >
> > >
> > > --- a/drivers/tee/optee/Kconfig
> > > +++ b/drivers/tee/optee/Kconfig
> > > @@ -5,6 +5,7 @@ config OPTEE
> > >         depends on HAVE_ARM_SMCCC
> > >         depends on MMU
> > >         depends on RPMB || !RPMB
> > > +       select DMABUF_HEAPS
> > >         help
> > >           This implements the OP-TEE Trusted Execution Environment (T=
EE)
> > >           driver.
> >
> > I wanted to avoid that since there are plenty of use cases where
> > DMABUF_HEAPS aren't needed.
>
> Yeah, but how the users will figure out the dependency to enable DMA
> heaps with TEE subsystem.

I hope, without too much difficulty. They are after all looking for a
way to allocate memory from a DMA heap.

> So it's better we provide a generic kernel
> Kconfig which enables all the default features.

I disagree, it should be possible to configure without DMABUF_HEAPS if desi=
red.

>
> > This seems to do the job:
> > +config TEE_DMABUF_HEAP
> > + bool
> > + depends on TEE =3D y && DMABUF_HEAPS
> >
> > We can only use DMABUF_HEAPS if the TEE subsystem is compiled into the =
kernel.
>
> Ah, I see. So we aren't exporting the DMA heaps APIs for TEE subsystem
> to use. We should do that such that there isn't a hard dependency to
> compile them into the kernel.

I was saving that for a later patch set as a later problem. We may
save some time by not doing it now.

Cheers,
Jens

>
> -Sumit
>
> >
> > Cheers,
> > Jens

