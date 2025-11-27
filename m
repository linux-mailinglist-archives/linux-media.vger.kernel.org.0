Return-Path: <linux-media+bounces-47841-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4A2C9022B
	for <lists+linux-media@lfdr.de>; Thu, 27 Nov 2025 21:44:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 238783A9F03
	for <lists+linux-media@lfdr.de>; Thu, 27 Nov 2025 20:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 691CD314D03;
	Thu, 27 Nov 2025 20:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IqCIinIG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632BF30AAB3
	for <linux-media@vger.kernel.org>; Thu, 27 Nov 2025 20:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764276248; cv=none; b=o16+T0H8bJKhPRlfUan89L/b+1lrPPmgfNxLwtSjdQitwoj6rtxUoagv5zoZBBK4EKM0EPvjzhS1pu5+rdH6YsYdL2nkd9izfVq91i385Q/VOS+M4wvyyqIMR9myK1bAKIPJI9JI8QEKlfH0AZaC/jYqhjEDg2NnsMvTUOIILqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764276248; c=relaxed/simple;
	bh=+q94ekbOkWlr5XHRAMBwHoZqmgtW6nF/flUzq2kN7/M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Czpjs7yH26Zt/Aqay2iDk8oAZCKk+mdE+UEHPqfxQcor0zENfl1S/Rseveh/qet2/tBjNC2JNGH1S+RWMl39pEH9ZGs6uA0Nhje8TJuDe84d3mZMLyJixLZUmJmkBjXpwr98eL53QrBespCsZQrMQ9P6ZgleH+LOKLPqXD7axRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IqCIinIG; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-88242fc32c9so13813146d6.1
        for <linux-media@vger.kernel.org>; Thu, 27 Nov 2025 12:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764276246; x=1764881046; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qwCD3atudzQaR/LDn9XgIygiEi/nCI5QmZX0e0EMwzk=;
        b=IqCIinIGOdZ61KCdIdAqdUe4mwCU7zB2x0LnjbLjnzijloCWr2U+BtUgGZ5CfxEnCC
         DvlPe3beVmP+lprePLXZc7YAVurUljkHLBcE4eNBmyYXaBiUQqtyC6YmEvGKUW3CkeJ/
         W7br7dRMtSf6TZ2rL+gB8EaS55KGHsVQlc9l7+9qcWPbHV83Hob67gh4ciIFaQjlIBMl
         D/vrUGlX/kCfdCOSofrYN2yFHMTpAjbK25atbuhoe4e8i9ZMKn10NNs4TrLrnXQqzV96
         WSs3neALbaZb2W1X29Gp/2yagb6sWGs4lrJ8jHtdX5mn4YUkxayjGGFfEZKor12uqJnB
         fViw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764276246; x=1764881046;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qwCD3atudzQaR/LDn9XgIygiEi/nCI5QmZX0e0EMwzk=;
        b=We+3AvLVcoYOn044w6Z+yia1C/ul0mml4HxACDpBzIXm90qGxzQ0KwjHp4+4ABbil7
         DN5FgLZokCtNtMMKsfZnZHFIxn+IUfR0fzQyQdxI+bkQgcUC2HOmhsv07EpfLG0NsYd8
         jDJb9BChvSkdMg9I0riB2ITtM8kSJF5nQtkCiWI65XtLYtrMtFyJl8/RB482Vw2/4Sdk
         C2w64O864C9XvHDeCqig3NDu6niajs2jjk+M4RqWvgHkpV9ygeLVp7B58j2Gse/EZuGf
         Q8EVr6DEmrW/PYje2EBEPxcgFWKNgTowvU8XWxQBQslL6FktOkWIK62EQ2k8sPw3kTpU
         j7RQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIKxMGxZPiWtBoJ9rpj+JDV2nyJ61ZR5ITf0gCcokv5Cqjkjvo5hznaUnlbStkg6fX7N84WRfoQqokzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1jwZvBRKE1mNA/iaYYi2EhW72PIDABAnZUBrJ4Ojf443iQ3L4
	AbDSrhi8r1qRyFbYlvxohJZ8aG8GWUnnYXBJcpH6QRTOPTcCf1w0XqP4Jb25jEulYKdYKNVBhO5
	sOeNIrJ9YNbMaRDy48HCHUbON31Xx4T6uakZM8lriWQ==
X-Gm-Gg: ASbGncuqpxoh8QqAnLoXqUL7zqCmEZRrejpY3fJKZC9K7QWrIWX2pPQGnmmwkIV07hi
	lwiNfHUf62nwylcMXXLoJR3XIj94lVYbkEjHVgqKmkJiDdIFfc7nWTyohNH3e6DyVwp/upz9BNJ
	uEVmNd4FJL5Fbu3pWNtTMkajwH1Cx+WglabPMwPSmJgoMMI3lqUl3KIMQ6UjF+SXpRQ0RYWJ55m
	7deMBs6MQHRueH9nYEcLVystrj8ivxqLK+VtnQCFUImOrwTfOSIxZj0PghCUmLS94Mw/A==
X-Google-Smtp-Source: AGHT+IE7voQiHDKLB4NwV8zGSE3REVdUO0e8yn38MIWlpfXSI6ZQdpofqkZUcP8t3D35swjRjPiF80F/keI36AiYhgc=
X-Received: by 2002:a05:6214:4018:b0:880:4c02:c49 with SMTP id
 6a1803df08f44-8847c49a3ffmr351784406d6.23.1764276246078; Thu, 27 Nov 2025
 12:44:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251122090343.81243-1-21cnbao@gmail.com> <aSiB-UsunuE7u295@milan>
In-Reply-To: <aSiB-UsunuE7u295@milan>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 28 Nov 2025 04:43:54 +0800
X-Gm-Features: AWmQ_bn1BA-EHgk099B5JdrbxARNS1wqxvNFJMmU7BmZqAfXIiS6yKlNivY5AG4
Message-ID: <CAGsJ_4z21fN2KSg6jt_qveYgrKZw1Vsi_kb+uhed=RJAbujMHw@mail.gmail.com>
Subject: Re: [PATCH RFC] mm/vmap: map contiguous pages in batches whenever possible
To: Uladzislau Rezki <urezki@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, John Stultz <jstultz@google.com>, 
	Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="UTF-8"

> >
> > +     /*
> > +      * Some users may allocate pages from high-order down to order 0.
> > +      * We roughly check if the first page is a compound page. If so,
> > +      * there is a chance to batch multiple pages together.
> > +      */
> >       if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
> > -                     page_shift == PAGE_SHIFT)
> > +                     (page_shift == PAGE_SHIFT && !PageCompound(pages[0])))
> >
> Do we support __GFP_COMP as vmalloc/vmap flag? As i see from latest:

This is not the case for vmalloc, but applies to dma-bufs that are allocated
using alloc_pages() with GFP_COMP.

#define LOW_ORDER_GFP (GFP_HIGHUSER | __GFP_ZERO)
#define HIGH_ORDER_GFP  (((GFP_HIGHUSER | __GFP_ZERO | __GFP_NOWARN \
                                | __GFP_NORETRY) & ~__GFP_RECLAIM) \
                                | __GFP_COMP)

>
> /*
>  * See __vmalloc_node_range() for a clear list of supported vmalloc flags.
>  * This gfp lists all flags currently passed through vmalloc. Currently,
>  * __GFP_ZERO is used by BPF and __GFP_NORETRY is used by percpu. Both drm
>  * and BPF also use GFP_USER. Additionally, various users pass
>  * GFP_KERNEL_ACCOUNT. Xfs uses __GFP_NOLOCKDEP.
>  */
> #define GFP_VMALLOC_SUPPORTED (GFP_KERNEL | GFP_ATOMIC | GFP_NOWAIT |\
>                                __GFP_NOFAIL |  __GFP_ZERO | __GFP_NORETRY |\
>                                GFP_NOFS | GFP_NOIO | GFP_KERNEL_ACCOUNT |\
>                                GFP_USER | __GFP_NOLOCKDEP)
>
> Could you please clarify when PageCompound(pages[0]) returns true?
>

In this case, dma-buf attempts to allocate as many compound high-order pages
as possible, falling back to 0-order allocations if necessary.

Then, dma_buf_vmap() is called by the GPU drivers:

 1    404  drivers/accel/amdxdna/amdxdna_gem.c <<amdxdna_gem_obj_vmap>>
             dma_buf_vmap(abo->dma_buf, map);
   2   1568  drivers/dma-buf/dma-buf.c <<dma_buf_vmap_unlocked>>
             ret = dma_buf_vmap(dmabuf, map);
   3    354  drivers/gpu/drm/drm_gem_shmem_helper.c
<<drm_gem_shmem_vmap_locked>>
             ret = dma_buf_vmap(obj->import_attach->dmabuf, map);
   4     85  drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
<<etnaviv_gem_prime_vmap_impl>>
             ret = dma_buf_vmap(etnaviv_obj->base.import_attach->dmabuf, &map);
   5    433  drivers/gpu/drm/vmwgfx/vmwgfx_blit.c <<map_external>>
             ret = dma_buf_vmap(bo->tbo.base.dma_buf, map);
   6     88  drivers/gpu/drm/vmwgfx/vmwgfx_gem.c <<vmw_gem_vmap>>
             ret = dma_buf_vmap(obj->import_attach->dmabuf, map);

Thanks
Barry

