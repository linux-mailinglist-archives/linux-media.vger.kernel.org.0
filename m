Return-Path: <linux-media+bounces-32161-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 97472AB1B68
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 19:13:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DAD4652458E
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 17:13:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5179239E6A;
	Fri,  9 May 2025 17:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JtL3G45W"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CBA22F76B
	for <linux-media@vger.kernel.org>; Fri,  9 May 2025 17:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746810807; cv=none; b=oWjNpd9qOOPqAVMH29yrc241XxWcWPFdwFHOew2gQSvjrkeQaHir8POfV+82JZvpgdxhUXwrMOoCna57Y5GbhMNEnJuuwDwqF2a87/ePUTeARd/zcAOMEWWuh/vv5Ib1j/jn3zuhLRCEy5q5nIxQqC+4URN57jmMrYZWEWyqh+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746810807; c=relaxed/simple;
	bh=D7WBZhpJi3uskwbj8ltGIQL3FHUXzrn4rGOoY6krjGc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ptiQks6pPEG3/Z+vd0zrky50/sUqF9SzUTddbXKmk8T9pkywI1mIvA92vo7LvfhAA/dw33dsNnnR7plZ76rJWteT9GO3KxUZ5zBiQ54rDZdqNKPJrwQAddDmYt/YdWyL404gkUn00Rqof9HIv9EKDwMJ7lgjxOAS3CNCT4oqBgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JtL3G45W; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cf3192d8bso1735e9.1
        for <linux-media@vger.kernel.org>; Fri, 09 May 2025 10:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746810803; x=1747415603; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fgW/S+IuQhDMqkGx/1B5fC/F8bX0uong/zoW2X+2nEA=;
        b=JtL3G45WWO0zQ242j1gcibAbgCuVclPj+ZAbs1BAj0TXz5Ds0BWVL3zT8ht8li5XBK
         oP40eca6mbRZ8UGnLV3EhlYA9AyTe956zIy2oGrb1+lL8iHsVTnzuuknVVEvC0+dNIdO
         uVb2Ch9iwR4HlNDnIyc9wrrVTbvfYPoQeT4JWcrPlDUMuusIa/g+tb939OJAA4G01RC7
         j1zvJrRLQOmb/Zk2P4nLJE3+l+ZsXEXM6Hh8eGIzS/WGuXPdnfvKiSjs5PUh0h8CqYr0
         Yf3wII+GCfTuYyXJD2SDe4iYFhSKSzSChLOcwG3pFfPV1kL/1hShZPHjzQ0l8Vz0oX+4
         Fzlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746810803; x=1747415603;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fgW/S+IuQhDMqkGx/1B5fC/F8bX0uong/zoW2X+2nEA=;
        b=lc6P3fyXGfj96Ygwn2/RvGSIbz6q0ZN5pneIXictOEJNOHvTyYfELIde5yJZVY+4bV
         94M3HubIvAHW0R9NAjzL/12PqqI49MAZuLj7pHDlgXKBVJEpHII/uPXi6kykuKTttIWI
         emWGkEWLejoy4be7azycQbtsaWb/RCk9tIyVbzgjUC0oXqQNrUnI4ii5DndqZjsSCpeB
         7UPkKTyaicZD9n6xtnKe5+29uQuqv5JI+KriUYXZWANpBTnvAb1GiC5khRvtPTBFkguF
         mWGBw0Z6juP8IUEmrEhYQUuEyhSrNI9XwRZqjU+TXE02AUuqobsVdehsqXPRmbMpvW4d
         ZvnA==
X-Forwarded-Encrypted: i=1; AJvYcCW3LFsllHdJvFhVdXju87r30SDVCDvD1PZPoZhgwSInKWu1f885u/8awCsaV2ueMLIYAjuRiDjCDTF+Tw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbNtuX2DPicUSSUc2RTYPlZn0XVUF9XDw2nbHHOsbRvv959+lG
	rfoLoZ8BnrM9YQHB2k646wbQ2RlBbq5BdQu4rkrQ868bc5h5kjdyDR6SQWgcPEfvXRgqE17OyA7
	7DhYKcB6RVQAB9a+4mtY9l1WBxXn4E8eGiPdz
X-Gm-Gg: ASbGnctCezAFnw/AIg24VeNnoGCpLmf/MUGw2se8ytztZziBjZZvNOM84+ooRwnzfov
	7Fp0bRqus5GG3bbau+4yTeDBHy/O5lHFF/HLMIo7MF/W6TdMNURVobpgGr5uzZOVDio7aeZPDwv
	4g/54KA2iuv+k0KnMXr98bkIfrgPXicrQ=
X-Google-Smtp-Source: AGHT+IHGfe/tXiaZqmJana79QrqFFike9FzFdHOfCIOTaVJ+13CLjx45F20TFT7eQCOyZ/XfQXSyYaW53E9ARHmgIFs=
X-Received: by 2002:a05:600c:3c95:b0:43b:c2cc:5075 with SMTP id
 5b1f17b1804b1-442d7c3bfd6mr1645325e9.5.1746810802780; Fri, 09 May 2025
 10:13:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250508182025.2961555-1-tjmercier@google.com>
 <20250508182025.2961555-3-tjmercier@google.com> <CAPhsuW6cTCEwnbfRNX0KDGGs7M+N3xf+EP9FfS5Y_OHyXqs_Qw@mail.gmail.com>
In-Reply-To: <CAPhsuW6cTCEwnbfRNX0KDGGs7M+N3xf+EP9FfS5Y_OHyXqs_Qw@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 9 May 2025 10:13:10 -0700
X-Gm-Features: AX0GCFseXwp9JI9wID6QRkim2g6TRuMaRHnwPleWxRyNB1BiSXAGkZCVkEOBhEc
Message-ID: <CABdmKX1gxShJu3L11D0-hNMwRArJrzy1UMpuKJY-CSZvAfDh-Q@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4 2/5] bpf: Add dmabuf iterator
To: Song Liu <song@kernel.org>
Cc: sumit.semwal@linaro.org, christian.koenig@amd.com, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	skhan@linuxfoundation.org, alexei.starovoitov@gmail.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, android-mm@google.com, 
	simona@ffwll.ch, eddyz87@gmail.com, yonghong.song@linux.dev, 
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
	jolsa@kernel.org, mykolal@fb.com, shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 5:27=E2=80=AFPM Song Liu <song@kernel.org> wrote:
>
> On Thu, May 8, 2025 at 11:20=E2=80=AFAM T.J. Mercier <tjmercier@google.co=
m> wrote:
> >
> > The dmabuf iterator traverses the list of all DMA buffers.
> >
> > DMA buffers are refcounted through their associated struct file. A
> > reference is taken on each buffer as the list is iterated to ensure eac=
h
> > buffer persists for the duration of the bpf program execution without
> > holding the list mutex.
> >
> > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> > Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> Acked-by: Song Liu <song@kernel.org>
>
> With one nitpick below.

Thanks!

> > ---
> [...]
> > diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> > index 8ff4add71f88..7af2ea839f58 100644
> > --- a/include/linux/dma-buf.h
> > +++ b/include/linux/dma-buf.h
> > @@ -634,4 +634,6 @@ int dma_buf_vmap(struct dma_buf *dmabuf, struct ios=
ys_map *map);
> >  void dma_buf_vunmap(struct dma_buf *dmabuf, struct iosys_map *map);
> >  int dma_buf_vmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *ma=
p);
> >  void dma_buf_vunmap_unlocked(struct dma_buf *dmabuf, struct iosys_map =
*map);
> > +struct dma_buf *dma_buf_iter_begin(void);
> > +struct dma_buf *dma_buf_iter_next(struct dma_buf *dmbuf);
> >  #endif /* __DMA_BUF_H__ */
> > diff --git a/kernel/bpf/Makefile b/kernel/bpf/Makefile
> > index 70502f038b92..3a335c50e6e3 100644
> > --- a/kernel/bpf/Makefile
> > +++ b/kernel/bpf/Makefile
> > @@ -53,6 +53,9 @@ obj-$(CONFIG_BPF_SYSCALL) +=3D relo_core.o
> >  obj-$(CONFIG_BPF_SYSCALL) +=3D btf_iter.o
> >  obj-$(CONFIG_BPF_SYSCALL) +=3D btf_relocate.o
> >  obj-$(CONFIG_BPF_SYSCALL) +=3D kmem_cache_iter.o
> > +ifeq ($(CONFIG_DMA_SHARED_BUFFER),y)
> > +obj-$(CONFIG_BPF_SYSCALL) +=3D dmabuf_iter.o
> > +endif
> >
> >  CFLAGS_REMOVE_percpu_freelist.o =3D $(CC_FLAGS_FTRACE)
> >  CFLAGS_REMOVE_bpf_lru_list.o =3D $(CC_FLAGS_FTRACE)
> > diff --git a/kernel/bpf/dmabuf_iter.c b/kernel/bpf/dmabuf_iter.c
> > new file mode 100644
> > index 000000000000..96b4ba7f0b2c
> > --- /dev/null
> > +++ b/kernel/bpf/dmabuf_iter.c
> > @@ -0,0 +1,102 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/* Copyright (c) 2025 Google LLC */
> > +#include <linux/bpf.h>
> > +#include <linux/btf_ids.h>
> > +#include <linux/dma-buf.h>
> > +#include <linux/kernel.h>
> > +#include <linux/seq_file.h>
> > +
> > +BTF_ID_LIST_SINGLE(bpf_dmabuf_btf_id, struct, dma_buf)
> > +DEFINE_BPF_ITER_FUNC(dmabuf, struct bpf_iter_meta *meta, struct dma_bu=
f *dmabuf)
>
> nit: It is better to move these two lines later, to where they
> are about to be used.

I've moved them both to just before dmabuf_iter_init() farther down.

