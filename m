Return-Path: <linux-media+bounces-48086-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D80ABC9BB40
	for <lists+linux-media@lfdr.de>; Tue, 02 Dec 2025 15:03:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4EBB24E3864
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 14:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78131322A15;
	Tue,  2 Dec 2025 14:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R9kSqZuZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9D2315D27
	for <linux-media@vger.kernel.org>; Tue,  2 Dec 2025 14:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764684197; cv=none; b=Q1xgCpB9wTsil9nGP91JQe2KWJGSueE335yNb44mp2Kj20H6dFC2eaJp7zLdSxBwFAJOjtZ9jwKv7nuIXa/8BObqHE0mQgwChCGkSl09Ft0zxuR1N+5nQX93rG4GeAW4gq/zXX4UGqbQgfnsktKX5w4pnXG7SNinQ341EEVh3yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764684197; c=relaxed/simple;
	bh=51HA4kszeefbLH/zdthS5lnS/8T7ynKQZgoCCZI4TKc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o1CLA+NWeoLblICQVlshDA7tH1gVTOFy3++CrMg6AHLxsuZKZer3irMr6uLY4fD19UpOAaRA4FFpOMv/66nDDQunIikG90vpBhQG9H9dUl07be0OoE+kIAVDJP6fla5fzY+h5RR5A52z4ppfjwfiIFDi/jnVVL1d6l5yrGUyDP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R9kSqZuZ; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5957f617ff0so6283454e87.2
        for <linux-media@vger.kernel.org>; Tue, 02 Dec 2025 06:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764684194; x=1765288994; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qv1K7J2piWEBLYsmYS5El8b8US/OwNpgXHLpQ7GMrlY=;
        b=R9kSqZuZyJLw9gcmKpvFSiz2VvEA4njON40Msc/9GljFQpGX50ZcgyeNOsHz+7rBxx
         EsV0Gj6R8cjkCbGaWOPyfwfILRjbqXzylWkPsoEaK3BqEFkTmlA8uf12F4QrXagxmf8l
         8ztGVpvPB+Ie+f/siSfMGVXYAD0ghWP7mhPJpu3XsOf8nxqGOiMuBH/BnGgm1pMbL/YP
         jzQXABJ15REh6Cw6jCA0rC03bnMRdLqDfdMAl9uPKwYsHbuIbzgJAI3bhNy2TA4dDbOb
         bWVU/F5Lv7ecWjoCuoazz0olO9+4yTtBKfhox5YLziNbaswDPu7FIOo2MosNtEmvspug
         nxBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764684194; x=1765288994;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qv1K7J2piWEBLYsmYS5El8b8US/OwNpgXHLpQ7GMrlY=;
        b=KDv3AYwoK3nH1+Nn6Zeswx4qqyEJ6wKqI/Ls0czgtYK3W4YW+garv+yHXdGnoG+S79
         czOsixSiCuljwrwvlQsOAZQZtJQQsoQYGplRBsCVUWd2b4Xco2DaUTiimHG03mdynBWi
         rR7zfK24i6Bc87jIpZ+0n0TLRXorcg+Nt7T7U/DGcaKreAqTbA/u4PqvViLLyl55yjpi
         Hi39BmgH4dwPMDdZfuECQKuUhr7gh0Azmc8vMcmTOE+iG7ougEe9jFL/Docq4wQ9cuDX
         yrR2C/4xBQ0h2q+53JK6ouJfPRvgXuybmDGE5uRRqopYyIsy+24rFum3NSiMe2TtWsJm
         fSsw==
X-Forwarded-Encrypted: i=1; AJvYcCWPJo0IVdruxguSrdn9CBFN4lfgB/0b4Zzfgf9dvgMNZXLcpqA6Hk9NG2xW2VtvAXCx70k/lpDWs5YoXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9J5dEsw7hbc8uPT62pzAtelVuqRX8TJ5GV+8Iom6B+AyoSMTx
	MM3F9kzWpOEc1QkwmJu74X6BXLLRxLswYekDHQ4ebwJBsc60Mxj1k4mC
X-Gm-Gg: ASbGnctE4iwUK6dROkfB3mRipYbcy3+JxDM7SrAIA2sQ3wsAk0DkFyNDAu+mv6Xuwle
	yuiNyh19cTBqI1tMNFQq1YbPIuTO73oRqcSGv+xg63as5VyAdqPxBR38Xg3RZUgYF+B1JRhQt2m
	z7AgbKPNFzY0We/kDDEz/KS32Zwh0QncGsZxyeaX6lyhDO1ahK7uGiXb9wvz1lR7d+qpiysfIMO
	HAFNCGodUl4rSxrQ/ie73G/zNSlZCz8LIsz2VL9hgwiXgM1JpZO745eA/aYaI1voITnL+UWaiDT
	zlDRkZITiFvnxCowKmDeEH4P1HnSEUujVbfkwr3VtaVlbP68KNz6hBKpAB34UpUPaDCF522o/3T
	RhMCmBW7uth6Iplk/nj0jrHiNb198343mipY+jTSjpbUleS78LrnMnjYpNfQNHstpImAA2yexWo
	HFlmmgaMFEFU6g+IOIb7HoR/GMa6uuzHxr
X-Google-Smtp-Source: AGHT+IFMPwW4Ci4ma2kd/bf6E5zfBDbaLqbg0ejouUGZkkjz6Fd31OThqfP5IxcvJU8zZMZi6pGF4A==
X-Received: by 2002:a05:6512:1149:b0:595:90f9:b9d2 with SMTP id 2adb3069b0e04-596a3ea67c2mr17072594e87.3.1764684193847;
        Tue, 02 Dec 2025 06:03:13 -0800 (PST)
Received: from pc636 (host-95-203-3-14.mobileonline.telia.com. [95.203.3.14])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bfa48c5dsm4644152e87.77.2025.12.02.06.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 06:03:12 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Tue, 2 Dec 2025 15:03:10 +0100
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
Message-ID: <aS7xnhxNhJ71cJRb@pc636>
References: <20251122090343.81243-1-21cnbao@gmail.com>
 <aSiB-UsunuE7u295@milan>
 <CAGsJ_4z21fN2KSg6jt_qveYgrKZw1Vsi_kb+uhed=RJAbujMHw@mail.gmail.com>
 <aS13J6U-QMOrwwbs@milan>
 <CAGsJ_4yGLdhk84Ent8VRcE4_2Am_U=bXTVdV2LHDBtD2OZs8xg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGsJ_4yGLdhk84Ent8VRcE4_2Am_U=bXTVdV2LHDBtD2OZs8xg@mail.gmail.com>

On Tue, Dec 02, 2025 at 06:05:56AM +0800, Barry Song wrote:
> On Mon, Dec 1, 2025 at 7:08 PM Uladzislau Rezki <urezki@gmail.com> wrote:
> >
> > On Fri, Nov 28, 2025 at 04:43:54AM +0800, Barry Song wrote:
> > > > >
> > > > > +     /*
> > > > > +      * Some users may allocate pages from high-order down to order 0.
> > > > > +      * We roughly check if the first page is a compound page. If so,
> > > > > +      * there is a chance to batch multiple pages together.
> > > > > +      */
> > > > >       if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
> > > > > -                     page_shift == PAGE_SHIFT)
> > > > > +                     (page_shift == PAGE_SHIFT && !PageCompound(pages[0])))
> > > > >
> > > > Do we support __GFP_COMP as vmalloc/vmap flag? As i see from latest:
> > >
> > > This is not the case for vmalloc, but applies to dma-bufs that are allocated
> > > using alloc_pages() with GFP_COMP.
> > >
> > > #define LOW_ORDER_GFP (GFP_HIGHUSER | __GFP_ZERO)
> > > #define HIGH_ORDER_GFP  (((GFP_HIGHUSER | __GFP_ZERO | __GFP_NOWARN \
> > >                                 | __GFP_NORETRY) & ~__GFP_RECLAIM) \
> > >                                 | __GFP_COMP)
> > >
> > > >
> > > > /*
> > > >  * See __vmalloc_node_range() for a clear list of supported vmalloc flags.
> > > >  * This gfp lists all flags currently passed through vmalloc. Currently,
> > > >  * __GFP_ZERO is used by BPF and __GFP_NORETRY is used by percpu. Both drm
> > > >  * and BPF also use GFP_USER. Additionally, various users pass
> > > >  * GFP_KERNEL_ACCOUNT. Xfs uses __GFP_NOLOCKDEP.
> > > >  */
> > > > #define GFP_VMALLOC_SUPPORTED (GFP_KERNEL | GFP_ATOMIC | GFP_NOWAIT |\
> > > >                                __GFP_NOFAIL |  __GFP_ZERO | __GFP_NORETRY |\
> > > >                                GFP_NOFS | GFP_NOIO | GFP_KERNEL_ACCOUNT |\
> > > >                                GFP_USER | __GFP_NOLOCKDEP)
> > > >
> > > > Could you please clarify when PageCompound(pages[0]) returns true?
> > > >
> > >
> > > In this case, dma-buf attempts to allocate as many compound high-order pages
> > > as possible, falling back to 0-order allocations if necessary.
> > >
> > OK, it is folio who uses it.
> >
> > > Then, dma_buf_vmap() is called by the GPU drivers:
> > >
> > >  1    404  drivers/accel/amdxdna/amdxdna_gem.c <<amdxdna_gem_obj_vmap>>
> > >              dma_buf_vmap(abo->dma_buf, map);
> > >    2   1568  drivers/dma-buf/dma-buf.c <<dma_buf_vmap_unlocked>>
> > >              ret = dma_buf_vmap(dmabuf, map);
> > >    3    354  drivers/gpu/drm/drm_gem_shmem_helper.c
> > > <<drm_gem_shmem_vmap_locked>>
> > >              ret = dma_buf_vmap(obj->import_attach->dmabuf, map);
> > >    4     85  drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> > > <<etnaviv_gem_prime_vmap_impl>>
> > >              ret = dma_buf_vmap(etnaviv_obj->base.import_attach->dmabuf, &map);
> > >    5    433  drivers/gpu/drm/vmwgfx/vmwgfx_blit.c <<map_external>>
> > >              ret = dma_buf_vmap(bo->tbo.base.dma_buf, map);
> > >    6     88  drivers/gpu/drm/vmwgfx/vmwgfx_gem.c <<vmw_gem_vmap>>
> > >              ret = dma_buf_vmap(obj->import_attach->dmabuf, map);
> > >
> > Thank you for clarification. That would be good to reflect it in the
> > commit message. Also, please note that:
> 
> Sure.
> 
> >
> > >       if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
> > > -                     page_shift == PAGE_SHIFT)
> > > +                     (page_shift == PAGE_SHIFT && !PageCompound(pages[0])))
> > >
> > we rely on page_shift == PAGE_SHIFT condition for the non-sleep vmalloc()
> > allocations(GFP_ATOMIC, GFP_NOWAIT), so we go via vmap_small_pages_range_noflush()
> > path. Your patch adds !PageCompound(pages[0]) also. It is not a problem
> > since it is vmap() path but we need to comment that.
> 
> Sure. Would the following work?
> 
>         /*
>          * For vmap(), users may allocate pages from high orders down
> to order 0,
>          * while always using PAGE_SHIFT as the page_shift.
>          * We first check whether the initial page is a compound page. If so,
>          * there may be an opportunity to batch multiple pages together.
>          */
>         if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
>                         (page_shift == PAGE_SHIFT && !PageCompound(pages[0])))
>                 return vmap_small_pages_range_noflush(addr, end, prot, pages);
> 
Sounds good!

Thank you.

--
Uladzislau Rezki

