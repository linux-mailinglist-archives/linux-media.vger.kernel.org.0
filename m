Return-Path: <linux-media+bounces-47943-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 43835C96CE7
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 12:08:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BD03E4E13F4
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 11:08:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65C133064B2;
	Mon,  1 Dec 2025 11:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LZLOia1r"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F58129E0E9
	for <linux-media@vger.kernel.org>; Mon,  1 Dec 2025 11:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764587309; cv=none; b=CB6q+0D07f/tucqmotDU4P+p8viY9lnly6G9aVHeH2ils286DU1XODSnq1Ud28ESLuRQRffLy6LHf3P9Tq71aBFHH7pkYAYoRPck10P4/YIFd+KbN7xi3ypaizg4yNbRPros7YPf77TY/oUpE8pgwl37Sg9QLnDOkxnAPBHa1xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764587309; c=relaxed/simple;
	bh=hdIAAEJwogwmZ9Pz1q+1QustFFAcLoa+OS+FSTnlAZ4=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cen+FXBppGEAZXI31UlhGyPWf+9rYDxRaSygqriIfluZsiCzQWX94Cn6U7LWJVRQodH90wn/XCyrq5xn2WKjCLc1XQV/zkcc9DJBYzFSjAtYNRXo41zdQ1w4Ncj2agAO/XeSddDiIt94ILRi+AG0o0RMiYJiCx1BuG1wvkOuvbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LZLOia1r; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-37a415a22ecso37739931fa.0
        for <linux-media@vger.kernel.org>; Mon, 01 Dec 2025 03:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764587306; x=1765192106; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=apPnjqLgYv5KFdQVAUozAIQDApH/iP9GbYj6xjZKpNk=;
        b=LZLOia1r0TdUPFB4dHVVkOlDMIBtzU0AknzbBoNKZFIDs+dgidrg5QdHMzpwZeYCKr
         K3JFI5fBRy6qkdKdjVrPDqSs2A8cpMMSXR88DBQJNvye3urmDh+/YG5KCu+J1NhsZMcF
         hnOQUrLJK4v7azoe2Jsv30yTkae9iaM7CEWChJj1G3jsOh8ZWeIO2aw50OqLO4PvxaoR
         ZUdwWNyrNkkks9Xm/kYThZAid0l2DRc7pnfipHKKJIgRfRuKjUtJnQnDyCCZ9m7quPVP
         33XLQx8Ly5L5B+kl8tmAxNtogr+mb1eC4TQLU9kFFnmtYdWp3mzoSNy9JNCilrz1HpW/
         laoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764587306; x=1765192106;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=apPnjqLgYv5KFdQVAUozAIQDApH/iP9GbYj6xjZKpNk=;
        b=HvhfheaEiG7EulJMeFakiQPKqAIyhBIQbGQscrl1LopJez6soeSkhNK8q4l51ayXyN
         EOf5n5LnVtnAQNRIkA4WtdaWAffWM59lPqLLHSc8h4Ztuh9AW+skPlJRP8VCspwn8gnK
         rDx5Bgn4+lF5jmxtwuGyh793xM7ClGv6Tzfw6KeooBq0RPqZjoSKA3yIF7JZtSH0Za07
         NxFbiUx0IRUW10E6GTSSLQpSYHQIdFQa9ZMjSXIsWQD9iDiiZQNzbiVEECpY/7sR7Ngw
         KkINaJQ3Z7P7dJoPG7d6bz102PDlID69GEIBTtrjMMCNmXpd0xPafk89QEE2HHpeRuRR
         YzMg==
X-Forwarded-Encrypted: i=1; AJvYcCUPmJBZDdsmx8oPglgJQK+Kw54rJrnpjTNpybXFzqE9Z+OxGzTlAK0UlWH4ckpaBSXGIcyTVLHrdOEWfw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3AL8IK8GKiqAU4WMNt7y1Aeq3SQYtetggE7TRQG45xnB9HYpn
	3poRbMd/CEwJbfnX1sJ4VprTL0NPLyNLzSE5Z1N9xpUkwMRijLbwvqd6
X-Gm-Gg: ASbGncueAj4Sh7aIuHlkWfOmEei+NPWPRn5FZOjW7+QpjkHD+23O9Wm8rIpad8YzaFu
	iRyWKzGLRayFzmiLktCrN1SYyiVPmUCGMgTgLOlhNI3sEKbcnz7M0LAWo2WuW/iGU5nNknD9YX+
	so27vFdbqSKzXQAVw6tAUdCCpSgqfgZTEx2f/PBeK/Mummo/kMAXXht7jaWq5Dgas8HZaH06J6b
	Shv+bJhWZgtyoSOBNa/NGzv3ewbZNOIJJEn30Rciw973+KQY00mcykmEbmyRrT/mEcMiWpea308
	0jIG2BetPhJoJtaRJ9EEz55TIkGV0YiCpPdu11ntmNVNAwmLu/Q8DfAR52IbTcsm+pn8o2QSWqs
	We3gR44j8nPEnBjK56MJT+T2KP1FX0MHnszYeNiBFLBfYjH11hgehsg==
X-Google-Smtp-Source: AGHT+IFYuTqVq/XXzpVDPZNlji0QpaJTMsgY/VJiO3ObVzX6tMfBu+vPiuyhJLxl2QXQDIY11tZWpg==
X-Received: by 2002:a2e:bc26:0:b0:376:41f5:a6ca with SMTP id 38308e7fff4ca-37cc8213bf3mr101258641fa.0.1764587306127;
        Mon, 01 Dec 2025 03:08:26 -0800 (PST)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37d240981cbsm27895361fa.24.2025.12.01.03.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 03:08:25 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Mon, 1 Dec 2025 12:08:23 +0100
To: Barry Song <21cnbao@gmail.com>
Cc: Uladzislau Rezki <urezki@gmail.com>, akpm@linux-foundation.org,
	linux-mm@kvack.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	John Stultz <jstultz@google.com>,
	Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH RFC] mm/vmap: map contiguous pages in batches whenever
 possible
Message-ID: <aS13J6U-QMOrwwbs@milan>
References: <20251122090343.81243-1-21cnbao@gmail.com>
 <aSiB-UsunuE7u295@milan>
 <CAGsJ_4z21fN2KSg6jt_qveYgrKZw1Vsi_kb+uhed=RJAbujMHw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGsJ_4z21fN2KSg6jt_qveYgrKZw1Vsi_kb+uhed=RJAbujMHw@mail.gmail.com>

On Fri, Nov 28, 2025 at 04:43:54AM +0800, Barry Song wrote:
> > >
> > > +     /*
> > > +      * Some users may allocate pages from high-order down to order 0.
> > > +      * We roughly check if the first page is a compound page. If so,
> > > +      * there is a chance to batch multiple pages together.
> > > +      */
> > >       if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
> > > -                     page_shift == PAGE_SHIFT)
> > > +                     (page_shift == PAGE_SHIFT && !PageCompound(pages[0])))
> > >
> > Do we support __GFP_COMP as vmalloc/vmap flag? As i see from latest:
> 
> This is not the case for vmalloc, but applies to dma-bufs that are allocated
> using alloc_pages() with GFP_COMP.
> 
> #define LOW_ORDER_GFP (GFP_HIGHUSER | __GFP_ZERO)
> #define HIGH_ORDER_GFP  (((GFP_HIGHUSER | __GFP_ZERO | __GFP_NOWARN \
>                                 | __GFP_NORETRY) & ~__GFP_RECLAIM) \
>                                 | __GFP_COMP)
> 
> >
> > /*
> >  * See __vmalloc_node_range() for a clear list of supported vmalloc flags.
> >  * This gfp lists all flags currently passed through vmalloc. Currently,
> >  * __GFP_ZERO is used by BPF and __GFP_NORETRY is used by percpu. Both drm
> >  * and BPF also use GFP_USER. Additionally, various users pass
> >  * GFP_KERNEL_ACCOUNT. Xfs uses __GFP_NOLOCKDEP.
> >  */
> > #define GFP_VMALLOC_SUPPORTED (GFP_KERNEL | GFP_ATOMIC | GFP_NOWAIT |\
> >                                __GFP_NOFAIL |  __GFP_ZERO | __GFP_NORETRY |\
> >                                GFP_NOFS | GFP_NOIO | GFP_KERNEL_ACCOUNT |\
> >                                GFP_USER | __GFP_NOLOCKDEP)
> >
> > Could you please clarify when PageCompound(pages[0]) returns true?
> >
> 
> In this case, dma-buf attempts to allocate as many compound high-order pages
> as possible, falling back to 0-order allocations if necessary.
> 
OK, it is folio who uses it.

> Then, dma_buf_vmap() is called by the GPU drivers:
> 
>  1    404  drivers/accel/amdxdna/amdxdna_gem.c <<amdxdna_gem_obj_vmap>>
>              dma_buf_vmap(abo->dma_buf, map);
>    2   1568  drivers/dma-buf/dma-buf.c <<dma_buf_vmap_unlocked>>
>              ret = dma_buf_vmap(dmabuf, map);
>    3    354  drivers/gpu/drm/drm_gem_shmem_helper.c
> <<drm_gem_shmem_vmap_locked>>
>              ret = dma_buf_vmap(obj->import_attach->dmabuf, map);
>    4     85  drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> <<etnaviv_gem_prime_vmap_impl>>
>              ret = dma_buf_vmap(etnaviv_obj->base.import_attach->dmabuf, &map);
>    5    433  drivers/gpu/drm/vmwgfx/vmwgfx_blit.c <<map_external>>
>              ret = dma_buf_vmap(bo->tbo.base.dma_buf, map);
>    6     88  drivers/gpu/drm/vmwgfx/vmwgfx_gem.c <<vmw_gem_vmap>>
>              ret = dma_buf_vmap(obj->import_attach->dmabuf, map);
> 
Thank you for clarification. That would be good to reflect it in the
commit message. Also, please note that:

>       if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
> -                     page_shift == PAGE_SHIFT)
> +                     (page_shift == PAGE_SHIFT && !PageCompound(pages[0])))
>
we rely on page_shift == PAGE_SHIFT condition for the non-sleep vmalloc()
allocations(GFP_ATOMIC, GFP_NOWAIT), so we go via vmap_small_pages_range_noflush()
path. Your patch adds !PageCompound(pages[0]) also. It is not a problem
since it is vmap() path but we need to comment that.

--
Uladzislau Rezki

