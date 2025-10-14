Return-Path: <linux-media+bounces-44415-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C21BD970F
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 14:47:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87A36188554D
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 12:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C03F29BDAD;
	Tue, 14 Oct 2025 12:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P6WbZG9e"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7462D1DB54C
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 12:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760446026; cv=none; b=NZI4o3II+t1ISVH1fIAeSRDPP/fFX+D/zeNplyHRogFBbD2X0Db/AuEWkJUY+8q/mHou5xUon5fy6tRTA+tXrAcGPBSqNQ2cR4IAdc17u3CJVem8Qr2633pNJx9CzzhGNqDzAZCZSx75mIDYkf2RIC+3mlJTLda+s7UFnDZGQg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760446026; c=relaxed/simple;
	bh=pbQbG7JWWmgoGx67yM8S/CxoR8U1Pilw6U7sRm4EKR0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HoFezkLsHS0CBFlnNNZhLsI4WzBupfC5F0sgFrsMmIgdDebfLmIFMWu1b+mF+gTn4rMHwudPPgIXPa5xim8pDIUI83ZL6Y4t3I87RWi4f7Kdzb87LyTj7v45yPH4R/j7oWngbzGukSlOxFyaKS7AcpzMlbb0B6qXsNsyEfmJUJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P6WbZG9e; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-591b99cb0c4so231398e87.2
        for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 05:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760446023; x=1761050823; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OOYDAUUrPF9BNX7d43RB9kvFca4sRiuUrwceAzjG9h0=;
        b=P6WbZG9eKZFKKx2NPxrhIDc0n88Jr0OsMnY1XsciFMQK//cMp76+fMq0MnDuUMQBMw
         iQvMAtKpWMm/0hefb552lPLb+YgmrIMNtJhcD1762wFoDhZlYJOMvrTSqLQ3/Zv3eZbi
         M19CijDVBv3Tq6+ysSnkRzbePnQA7gc9u96A0qbxdD476efIQhQV9H28ZB6/v7Z/sNed
         5R2TWsHABKlUo+P9hw7UsXXEaUgpaEyhAWG5zOBSKEBqyb8+sIUNyRVnOKf5iWLpx3Rh
         m4X3vwZpNLBmAKaNbIJutyVNOUIJZGXY4l3xn99LowXRXW1DL54DsuZ2G/QJZ/iFntLi
         BXgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760446023; x=1761050823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OOYDAUUrPF9BNX7d43RB9kvFca4sRiuUrwceAzjG9h0=;
        b=ZWLnh+fJj+mAnnfbPKfaAmRelRV+pZZXoAyF+NnUr5dEJVXOPja1g/2yQW7IPvH4Jz
         xznxB3nzLoSamsu8xkwU21qsq3j84IVdCfrmx9360BrvAgSCWvyGrZDT/fmjZAWYHYxJ
         VchdeAJ3R9L7IA/P7lXzLX2dvyUqyMyFzEu0TLx/UgPIdpka1cTmoerZtagKEe70DTE+
         OnyrDkIh+65So91QqS5kiCIZ06NkLqm6uSmg/sqkbbUXxHRndJHnrjLcCGuOABwsajcZ
         FlJH4cNBYoF1Ldi53SyNOYe/eYmjvYGjtTnTo2DVhmVuxuCav3/SRjMtAJsBo+ckJye4
         Nu+g==
X-Forwarded-Encrypted: i=1; AJvYcCUxt3GQbPP+LmfxZMRiI83FWbZj1tvjQpWyGA5wYlmcH/V2Rwf90rQ05XVEWrTDmYyfTpO1j2rMhD5Ehg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMbQgAQ7hkkdv9H7KYomzxNDcrYDyuikbRFuGhNGZMrn2YZDad
	4uocJcHkJUBPZqX3m8jODXIxMAS/zzg2Iy3tqKiNAsWQMzZITJivewQnIC/+56DST/e/hmLtdEn
	zzZeMD04LvdlcNDCduJKS/WCJ9MnygQY=
X-Gm-Gg: ASbGnctQWHpQrkdG5bJGNsMyQICxE9NvG5VTATosmIu1joTb2tWwXUqEzTedRpRRbS4
	4sdDQ/ZCkyZrES/xMzuqxG0AfqP1BSckPUq1w1wmxJlQBfsVW5DesrH1uEoKuO1PFVE/Ca03/2o
	oQ2P3WXMJZhsMHZs/lK3h6mV3CwkPJLTs3NdF3Wg7OXFDRcBgERd/TIoh9BP3BmxZB0yUy6Up0W
	91CAqF/B+R2TQc34lnP2H3yp0Y=
X-Google-Smtp-Source: AGHT+IFlO5uSigu5dtEPUFsiPorGQT8JHKN9gDGfcyR2bXSQJaHthPRim/dru6Buj5TcNFP99XIzDYgEUyJNtMVBif8=
X-Received: by 2002:a2e:beab:0:b0:36b:d9d2:7352 with SMTP id
 38308e7fff4ca-37609cebacdmr36943081fa.1.1760446022264; Tue, 14 Oct 2025
 05:47:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014083230.1181072-1-zhaoyang.huang@unisoc.com>
 <20251014083230.1181072-2-zhaoyang.huang@unisoc.com> <20251014114124.145165bc@mordecai.tesarici.cz>
In-Reply-To: <20251014114124.145165bc@mordecai.tesarici.cz>
From: Zhaoyang Huang <huangzhaoyang@gmail.com>
Date: Tue, 14 Oct 2025 20:46:48 +0800
X-Gm-Features: AS18NWCZqvwBFj414D2SlPbku69nYjWV6cLatwbTi_BHqfCcVjP0WhD8gi8qGCk
Message-ID: <CAGWkznEPqsORQCiGqpjSp6XTvtHov76EGw830hxXmrUxd2U_4w@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm: call back alloc_pages_bulk_list since it is useful
To: Petr Tesarik <ptesarik@suse.com>
Cc: "zhaoyang.huang" <zhaoyang.huang@unisoc.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Matthew Wilcox <willy@infradead.org>, 
	Mel Gorman <mgorman@techsingularity.net>, Vlastimil Babka <vbabka@suse.cz>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, steve.kang@unisoc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 5:41=E2=80=AFPM Petr Tesarik <ptesarik@suse.com> wr=
ote:
>
> On Tue, 14 Oct 2025 16:32:29 +0800
> "zhaoyang.huang" <zhaoyang.huang@unisoc.com> wrote:
>
> > From: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
> >
> > commit c8b979530f27 ("mm: alloc_pages_bulk_noprof: drop page_list
> > argument") drops alloc_pages_bulk_list. This commit would like to call =
back
> > it since it is proved to be helpful to the drivers which allocate a bul=
k of
> > pages(see patch of 2 in this series ).
> > I do notice that Matthew's comment of the time cost of iterating a list=
.
> > However, I also observed in our test that the extra page_array's alloca=
tion
> > could be more expensive than cpu iteration when direct reclaiming happe=
ns
> > when ram is low[1]. IMHO, could we leave the API here to have the users
> > choose between the array or list according to their scenarios.
>
> OK, so this is more or less a revert of commit c8b979530f27 ("mm:
> alloc_pages_bulk_noprof: drop page_list argument")...
>
> I cannot comment on the performance gains, but I dislike the fact that
> the patch re-introduces alloc_pages_bulk_noprof() as a function with two
> signatures (either page_list is used, or page_array is used).
>
> If we can agree that allocations onto a linked list are useful, then I
> suggest to split the existing function so that the common bits end up
> in helper functions, called by both variants (one function using a
> list, one using an array).
Yes. That is also what I wanted to do in the beginning. I will
implement if dma-buf would like to take the change
>
> Petr T
>
> > [1]
> > android.hardwar-728     [002] .....   334.573875: system_heap_do_alloca=
te: Execution time: order 0 1 us
> > android.hardwar-728     [002] .....   334.573879: system_heap_do_alloca=
te: Execution time: order 0 2 us
> > android.hardwar-728     [002] .....   334.574239: system_heap_do_alloca=
te: Execution time: order 0 354 us
> > android.hardwar-728     [002] .....   334.574247: system_heap_do_alloca=
te: Execution time: order 0 4 us
> > android.hardwar-728     [002] .....   334.574250: system_heap_do_alloca=
te: Execution time: order 0 2 us
> >
> > Signed-off-by: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
> > ---
> >  include/linux/gfp.h |  9 +++++++--
> >  mm/mempolicy.c      | 14 +++++++-------
> >  mm/page_alloc.c     | 39 +++++++++++++++++++++++++++------------
> >  3 files changed, 41 insertions(+), 21 deletions(-)
> >
> > diff --git a/include/linux/gfp.h b/include/linux/gfp.h
> > index 5ebf26fcdcfa..f1540c9fcd87 100644
> > --- a/include/linux/gfp.h
> > +++ b/include/linux/gfp.h
> > @@ -231,6 +231,7 @@ struct folio *__folio_alloc_noprof(gfp_t gfp, unsig=
ned int order, int preferred_
> >
> >  unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
> >                               nodemask_t *nodemask, int nr_pages,
> > +                             struct list_head *page_list,
> >                               struct page **page_array);
> >  #define __alloc_pages_bulk(...)                      alloc_hooks(alloc=
_pages_bulk_noprof(__VA_ARGS__))
> >
> > @@ -242,7 +243,11 @@ unsigned long alloc_pages_bulk_mempolicy_noprof(gf=
p_t gfp,
> >
> >  /* Bulk allocate order-0 pages */
> >  #define alloc_pages_bulk(_gfp, _nr_pages, _page_array)               \
> > -     __alloc_pages_bulk(_gfp, numa_mem_id(), NULL, _nr_pages, _page_ar=
ray)
> > +     __alloc_pages_bulk(_gfp, numa_mem_id(), NULL, _nr_pages, NULL, _p=
age_array)
> > +
> > +#define alloc_pages_bulk_list(_gfp, _nr_pages, _list)                 =
       \
> > +     __alloc_pages_bulk(_gfp, numa_mem_id(), NULL, _nr_pages, _list, N=
ULL)
> > +
> >
> >  static inline unsigned long
> >  alloc_pages_bulk_node_noprof(gfp_t gfp, int nid, unsigned long nr_page=
s,
> > @@ -251,7 +256,7 @@ alloc_pages_bulk_node_noprof(gfp_t gfp, int nid, un=
signed long nr_pages,
> >       if (nid =3D=3D NUMA_NO_NODE)
> >               nid =3D numa_mem_id();
> >
> > -     return alloc_pages_bulk_noprof(gfp, nid, NULL, nr_pages, page_arr=
ay);
> > +     return alloc_pages_bulk_noprof(gfp, nid, NULL, nr_pages, NULL, pa=
ge_array);
> >  }
> >
> >  #define alloc_pages_bulk_node(...)                           \
> > diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> > index eb83cff7db8c..26274302ee01 100644
> > --- a/mm/mempolicy.c
> > +++ b/mm/mempolicy.c
> > @@ -2537,13 +2537,13 @@ static unsigned long alloc_pages_bulk_interleav=
e(gfp_t gfp,
> >               if (delta) {
> >                       nr_allocated =3D alloc_pages_bulk_noprof(gfp,
> >                                       interleave_nodes(pol), NULL,
> > -                                     nr_pages_per_node + 1,
> > +                                     nr_pages_per_node + 1, NULL,
> >                                       page_array);
> >                       delta--;
> >               } else {
> >                       nr_allocated =3D alloc_pages_bulk_noprof(gfp,
> >                                       interleave_nodes(pol), NULL,
> > -                                     nr_pages_per_node, page_array);
> > +                                     nr_pages_per_node, NULL, page_arr=
ay);
> >               }
> >
> >               page_array +=3D nr_allocated;
> > @@ -2593,7 +2593,7 @@ static unsigned long alloc_pages_bulk_weighted_in=
terleave(gfp_t gfp,
> >       if (weight && node_isset(node, nodes)) {
> >               node_pages =3D min(rem_pages, weight);
> >               nr_allocated =3D __alloc_pages_bulk(gfp, node, NULL, node=
_pages,
> > -                                               page_array);
> > +                                               NULL, page_array);
> >               page_array +=3D nr_allocated;
> >               total_allocated +=3D nr_allocated;
> >               /* if that's all the pages, no need to interleave */
> > @@ -2658,7 +2658,7 @@ static unsigned long alloc_pages_bulk_weighted_in=
terleave(gfp_t gfp,
> >               if (!node_pages)
> >                       break;
> >               nr_allocated =3D __alloc_pages_bulk(gfp, node, NULL, node=
_pages,
> > -                                               page_array);
> > +                                               NULL, page_array);
> >               page_array +=3D nr_allocated;
> >               total_allocated +=3D nr_allocated;
> >               if (total_allocated =3D=3D nr_pages)
> > @@ -2682,11 +2682,11 @@ static unsigned long alloc_pages_bulk_preferred=
_many(gfp_t gfp, int nid,
> >       preferred_gfp &=3D ~(__GFP_DIRECT_RECLAIM | __GFP_NOFAIL);
> >
> >       nr_allocated  =3D alloc_pages_bulk_noprof(preferred_gfp, nid, &po=
l->nodes,
> > -                                        nr_pages, page_array);
> > +                                        nr_pages, NULL, page_array);
> >
> >       if (nr_allocated < nr_pages)
> >               nr_allocated +=3D alloc_pages_bulk_noprof(gfp, numa_node_=
id(), NULL,
> > -                             nr_pages - nr_allocated,
> > +                             nr_pages - nr_allocated, NULL,
> >                               page_array + nr_allocated);
> >       return nr_allocated;
> >  }
> > @@ -2722,7 +2722,7 @@ unsigned long alloc_pages_bulk_mempolicy_noprof(g=
fp_t gfp,
> >       nid =3D numa_node_id();
> >       nodemask =3D policy_nodemask(gfp, pol, NO_INTERLEAVE_INDEX, &nid)=
;
> >       return alloc_pages_bulk_noprof(gfp, nid, nodemask,
> > -                                    nr_pages, page_array);
> > +                                    nr_pages, NULL, page_array);
> >  }
> >
> >  int vma_dup_policy(struct vm_area_struct *src, struct vm_area_struct *=
dst)
> > diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> > index d1d037f97c5f..a95bdd8cbf5b 100644
> > --- a/mm/page_alloc.c
> > +++ b/mm/page_alloc.c
> > @@ -4940,23 +4940,28 @@ static inline bool prepare_alloc_pages(gfp_t gf=
p_mask, unsigned int order,
> >  }
> >
> >  /*
> > - * __alloc_pages_bulk - Allocate a number of order-0 pages to an array
> > + * __alloc_pages_bulk - Allocate a number of order-0 pages to a list o=
r array
> >   * @gfp: GFP flags for the allocation
> >   * @preferred_nid: The preferred NUMA node ID to allocate from
> >   * @nodemask: Set of nodes to allocate from, may be NULL
> > - * @nr_pages: The number of pages desired in the array
> > - * @page_array: Array to store the pages
> > + * @nr_pages: The number of pages desired on the list or array
> > + * @page_list: Optional list to store the allocated pages
> > + * @page_array: Optional array to store the pages
> >   *
> >   * This is a batched version of the page allocator that attempts to
> > - * allocate nr_pages quickly. Pages are added to the page_array.
> > + * allocate nr_pages quickly. Pages are added to page_list if page_lis=
t
> > + * is not NULL, otherwise it is assumed that the page_array is valid.
> >   *
> > - * Note that only NULL elements are populated with pages and nr_pages
> > + * For lists, nr_pages is the number of pages that should be allocated=
.
> > + *
> > + * For arrays, only NULL elements are populated with pages and nr_page=
s
> >   * is the maximum number of pages that will be stored in the array.
> >   *
> > - * Returns the number of pages in the array.
> > + * Returns the number of pages on the list or array.
> >   */
> >  unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
> >                       nodemask_t *nodemask, int nr_pages,
> > +                     struct list_head *page_list,
> >                       struct page **page_array)
> >  {
> >       struct page *page;
> > @@ -4974,7 +4979,7 @@ unsigned long alloc_pages_bulk_noprof(gfp_t gfp, =
int preferred_nid,
> >        * Skip populated array elements to determine if any pages need
> >        * to be allocated before disabling IRQs.
> >        */
> > -     while (nr_populated < nr_pages && page_array[nr_populated])
> > +     while (page_array && nr_populated < nr_pages && page_array[nr_pop=
ulated])
> >               nr_populated++;
> >
> >       /* No pages requested? */
> > @@ -4982,7 +4987,7 @@ unsigned long alloc_pages_bulk_noprof(gfp_t gfp, =
int preferred_nid,
> >               goto out;
> >
> >       /* Already populated array? */
> > -     if (unlikely(nr_pages - nr_populated =3D=3D 0))
> > +     if (unlikely(page_array && nr_pages - nr_populated =3D=3D 0))
> >               goto out;
> >
> >       /* Bulk allocator does not support memcg accounting. */
> > @@ -5064,7 +5069,7 @@ unsigned long alloc_pages_bulk_noprof(gfp_t gfp, =
int preferred_nid,
> >       while (nr_populated < nr_pages) {
> >
> >               /* Skip existing pages */
> > -             if (page_array[nr_populated]) {
> > +             if (page_array && page_array[nr_populated]) {
> >                       nr_populated++;
> >                       continue;
> >               }
> > @@ -5083,7 +5088,11 @@ unsigned long alloc_pages_bulk_noprof(gfp_t gfp,=
 int preferred_nid,
> >
> >               prep_new_page(page, 0, gfp, 0);
> >               set_page_refcounted(page);
> > -             page_array[nr_populated++] =3D page;
> > +             if (page_list)
> > +                     list_add(&page->lru, page_list);
> > +             else
> > +                     page_array[nr_populated] =3D page;
> > +             nr_populated++;
> >       }
> >
> >       pcp_spin_unlock(pcp);
> > @@ -5100,8 +5109,14 @@ unsigned long alloc_pages_bulk_noprof(gfp_t gfp,=
 int preferred_nid,
> >
> >  failed:
> >       page =3D __alloc_pages_noprof(gfp, 0, preferred_nid, nodemask);
> > -     if (page)
> > -             page_array[nr_populated++] =3D page;
> > +     if (page) {
> > +             if (page_list)
> > +                     list_add(&page->lru, page_list);
> > +             else
> > +                     page_array[nr_populated] =3D page;
> > +             nr_populated++;
> > +     }
> > +
> >       goto out;
> >  }
> >  EXPORT_SYMBOL_GPL(alloc_pages_bulk_noprof);
>

