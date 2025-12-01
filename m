Return-Path: <linux-media+bounces-48001-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A0BC994BB
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 23:06:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 09EE04E2A6D
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 22:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A2B8286409;
	Mon,  1 Dec 2025 22:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J4mEXyWY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B2F27E7EC
	for <linux-media@vger.kernel.org>; Mon,  1 Dec 2025 22:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764626772; cv=none; b=XH8dN7nJZCUbj36q7ueXkl90+V3brDEoMj3ylsJFhbGsOaMSFlTxMbOqxM2X6Tjk5bkhmQQ/LLripn6tHcI6GIAhHXns0Up6L+GXG/RifYy8gJTe2/qMcA8PkEFHkMVio4BZHiDlVzqpPvRuPzc5agVJmfckygK5gEwCLgky9J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764626772; c=relaxed/simple;
	bh=xqxJJRZ9tljT4qZj1nqXrRJEoIvmFS+6EI+/4ATnlo8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TOXQQ+SxNez+0WXoVqZuk5AP44n4F0C6UFSHuDDe64+dGyXwPBP9CiJhFREwi6Ma3fsh7Wh6wZINx0gqDGGaKBqNCrzVWl3H3+4xMueCDP6Mpf3rUraXNvwajTxQat3P+WaDC8hyVwZKe7hFxhAvC0z++Jp40zyTI8OOHxEi/OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J4mEXyWY; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-9351ed45fb8so1125391241.0
        for <linux-media@vger.kernel.org>; Mon, 01 Dec 2025 14:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764626768; x=1765231568; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RjsD19aCUMHa2E8WfpptbpfT6kxnKtjPzjy54H5oDQE=;
        b=J4mEXyWY21g0tbLMUresIGnR+iueAkuHrbPm2H8uPUtslRHrZ8viHBf3bjFKH4pO5q
         XYwZ8XUWtDhk38KtqMlRQV4PRpuA1SXgac6i7IL8nyq2Rvsv6ESWvBIAq01AsqVe0DSI
         HQR+g6Ei6flgndf3wuwl9nHKPLms8cuxN8DH0egm8S08tVW/llXc5oXqtjIWlh4no98O
         UdDJsT8yeGHUzi4v8apiEUqe71dZ1uFHNYXoByGZ/NePRv5sd6nNk4T+I1VQJFkCtPDE
         wVpJycqKzwQ2AfYBj+7IeEXLEOem24eNARr5A9qiLcmOVa+SrSa1dGyqFAD6TwmdvZps
         Pw/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764626768; x=1765231568;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RjsD19aCUMHa2E8WfpptbpfT6kxnKtjPzjy54H5oDQE=;
        b=dAerbGCITf1ntAnMAaCLAMbABUO7EtwiLBtqmcYIgjv86exv63+2zJpaipIvYZieV3
         XH96F2xb+uQxvVYb2ZcA7CBjDd4qWnkr7TpfSlZO4jMGtMEUyEddRBm4Ime3mmqYqSDE
         PEe0/pQigJX4BDPQpuA9r1iOsL2uAfaDrpPAl4LQwWc9jQbh48Lae0a+MuuobimMDGEo
         IgfWwwMM1VmYPWFPpL4BwCl+DNojhqYLDmQFzKqFf+z6of6zQlat5URuQCHpw5fDt7u8
         ap8Z34CSZ0qyWxGt/yz5A8CrNwYEtJ982qGU7cuafZ8uQRN3M8P5nqLPB+LtBbjgOAao
         sBgQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6B+9X8DlfhkvkQxo7Ly5vKCzbAmwxbRV51XaRQjC31S4+rvIXC/xCrzcsd3rIlJ+X+bzmelc7QOUIBA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7vei3lPjgjxOZ5xwzCjThSZhiGvCtP4BsbgA5L+R64CuH7J6d
	Bem86li67MMCxXsO/5tXBr9IMAyrS3zXGSEQmWB/TAAFlOxGoqCI73GIioXxOM+sLb4v3zeTc9j
	q2xWgurEbt9NqlcYUJSMbBjXNfcb6zwA=
X-Gm-Gg: ASbGncusVDUIqBz5J6FFRLt5tPmpN/TDkBLXz03qogQgixYksnkJUjuLoabeNS/gPGr
	Jo13WKEWA9nv7IWSr7J6xEeDUD7qKiTcz9OiQaE2mGoA6Gd0E/DIagvGWUK1tsjC0YYBo21X5B/
	sTW3Q9faNgSr0+4+dAMmdzfjpb4iWmZWA6esh70TTOXSPVXn5+6xi+Yvc/47NcvWK2h84K28FFm
	hZpiMvdN7L1I2793m9qbj/X9j818nYzeXKxwCLU9knNzbr4MEHCEWCSoZo/TQaB84Nenw==
X-Google-Smtp-Source: AGHT+IHy9MubOTLG2etzaabSpxtKy1Lb/AjgjOqAEtXPMeO1sBbpyDe9CCi6vq0uRyBGY3AdXltB4if2OEMaCAYo1tg=
X-Received: by 2002:a05:6102:5805:b0:5db:c987:d8f4 with SMTP id
 ada2fe7eead31-5e22421c58amr9629989137.7.1764626767957; Mon, 01 Dec 2025
 14:06:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251122090343.81243-1-21cnbao@gmail.com> <aSiB-UsunuE7u295@milan>
 <CAGsJ_4z21fN2KSg6jt_qveYgrKZw1Vsi_kb+uhed=RJAbujMHw@mail.gmail.com> <aS13J6U-QMOrwwbs@milan>
In-Reply-To: <aS13J6U-QMOrwwbs@milan>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 2 Dec 2025 06:05:56 +0800
X-Gm-Features: AWmQ_bmgxK1g1aP9fycsrkY4ZrS4yYO9pthpUyw8iDWG0FYFC6_bJ-WYcNubwhU
Message-ID: <CAGsJ_4yGLdhk84Ent8VRcE4_2Am_U=bXTVdV2LHDBtD2OZs8xg@mail.gmail.com>
Subject: Re: [PATCH RFC] mm/vmap: map contiguous pages in batches whenever possible
To: Uladzislau Rezki <urezki@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, John Stultz <jstultz@google.com>, 
	Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 1, 2025 at 7:08=E2=80=AFPM Uladzislau Rezki <urezki@gmail.com> =
wrote:
>
> On Fri, Nov 28, 2025 at 04:43:54AM +0800, Barry Song wrote:
> > > >
> > > > +     /*
> > > > +      * Some users may allocate pages from high-order down to orde=
r 0.
> > > > +      * We roughly check if the first page is a compound page. If =
so,
> > > > +      * there is a chance to batch multiple pages together.
> > > > +      */
> > > >       if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
> > > > -                     page_shift =3D=3D PAGE_SHIFT)
> > > > +                     (page_shift =3D=3D PAGE_SHIFT && !PageCompoun=
d(pages[0])))
> > > >
> > > Do we support __GFP_COMP as vmalloc/vmap flag? As i see from latest:
> >
> > This is not the case for vmalloc, but applies to dma-bufs that are allo=
cated
> > using alloc_pages() with GFP_COMP.
> >
> > #define LOW_ORDER_GFP (GFP_HIGHUSER | __GFP_ZERO)
> > #define HIGH_ORDER_GFP  (((GFP_HIGHUSER | __GFP_ZERO | __GFP_NOWARN \
> >                                 | __GFP_NORETRY) & ~__GFP_RECLAIM) \
> >                                 | __GFP_COMP)
> >
> > >
> > > /*
> > >  * See __vmalloc_node_range() for a clear list of supported vmalloc f=
lags.
> > >  * This gfp lists all flags currently passed through vmalloc. Current=
ly,
> > >  * __GFP_ZERO is used by BPF and __GFP_NORETRY is used by percpu. Bot=
h drm
> > >  * and BPF also use GFP_USER. Additionally, various users pass
> > >  * GFP_KERNEL_ACCOUNT. Xfs uses __GFP_NOLOCKDEP.
> > >  */
> > > #define GFP_VMALLOC_SUPPORTED (GFP_KERNEL | GFP_ATOMIC | GFP_NOWAIT |=
\
> > >                                __GFP_NOFAIL |  __GFP_ZERO | __GFP_NOR=
ETRY |\
> > >                                GFP_NOFS | GFP_NOIO | GFP_KERNEL_ACCOU=
NT |\
> > >                                GFP_USER | __GFP_NOLOCKDEP)
> > >
> > > Could you please clarify when PageCompound(pages[0]) returns true?
> > >
> >
> > In this case, dma-buf attempts to allocate as many compound high-order =
pages
> > as possible, falling back to 0-order allocations if necessary.
> >
> OK, it is folio who uses it.
>
> > Then, dma_buf_vmap() is called by the GPU drivers:
> >
> >  1    404  drivers/accel/amdxdna/amdxdna_gem.c <<amdxdna_gem_obj_vmap>>
> >              dma_buf_vmap(abo->dma_buf, map);
> >    2   1568  drivers/dma-buf/dma-buf.c <<dma_buf_vmap_unlocked>>
> >              ret =3D dma_buf_vmap(dmabuf, map);
> >    3    354  drivers/gpu/drm/drm_gem_shmem_helper.c
> > <<drm_gem_shmem_vmap_locked>>
> >              ret =3D dma_buf_vmap(obj->import_attach->dmabuf, map);
> >    4     85  drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> > <<etnaviv_gem_prime_vmap_impl>>
> >              ret =3D dma_buf_vmap(etnaviv_obj->base.import_attach->dmab=
uf, &map);
> >    5    433  drivers/gpu/drm/vmwgfx/vmwgfx_blit.c <<map_external>>
> >              ret =3D dma_buf_vmap(bo->tbo.base.dma_buf, map);
> >    6     88  drivers/gpu/drm/vmwgfx/vmwgfx_gem.c <<vmw_gem_vmap>>
> >              ret =3D dma_buf_vmap(obj->import_attach->dmabuf, map);
> >
> Thank you for clarification. That would be good to reflect it in the
> commit message. Also, please note that:

Sure.

>
> >       if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
> > -                     page_shift =3D=3D PAGE_SHIFT)
> > +                     (page_shift =3D=3D PAGE_SHIFT && !PageCompound(pa=
ges[0])))
> >
> we rely on page_shift =3D=3D PAGE_SHIFT condition for the non-sleep vmall=
oc()
> allocations(GFP_ATOMIC, GFP_NOWAIT), so we go via vmap_small_pages_range_=
noflush()
> path. Your patch adds !PageCompound(pages[0]) also. It is not a problem
> since it is vmap() path but we need to comment that.

Sure. Would the following work?

        /*
         * For vmap(), users may allocate pages from high orders down
to order 0,
         * while always using PAGE_SHIFT as the page_shift.
         * We first check whether the initial page is a compound page. If s=
o,
         * there may be an opportunity to batch multiple pages together.
         */
        if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
                        (page_shift =3D=3D PAGE_SHIFT && !PageCompound(page=
s[0])))
                return vmap_small_pages_range_noflush(addr, end, prot, page=
s);

Thanks
Barry

