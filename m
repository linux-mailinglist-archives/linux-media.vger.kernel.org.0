Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD8E3784D5A
	for <lists+linux-media@lfdr.de>; Wed, 23 Aug 2023 01:33:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231639AbjHVXdn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Aug 2023 19:33:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231186AbjHVXdn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Aug 2023 19:33:43 -0400
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2C91CF
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 16:33:39 -0700 (PDT)
Received: by mail-vs1-xe32.google.com with SMTP id ada2fe7eead31-44d3e4ad403so1270853137.0
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 16:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692747219; x=1693352019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jrDWaCBQ1sWLUoVnt/HCli5/wouIl1yCYP/wbQLKWo4=;
        b=umHqhmqs0XKPhEqBSsHRPg3LaKwSf8YMcsdhG7UrN5wE3V3d8uOCo1rGKzKFfmghyR
         lJJgLzArNPSf/j005RDOc52IPjrW1i5O4ihEhqS83H5kXa4GXoRutPquvcrvadLIdscw
         6fneE3vQSexW5JjBo9M8bN0Q8dgkxv20TKMVrsbucpBLTsrumpCBdVV4GKmaqxuhaRht
         DHOjYMs4l6pZbYPSLjQMf0BSORiTi54r9QIS5aOGHxxupZkAsVR9owV1fvNgNfUd30cR
         RYjR7FFx3NpoHhOZhHBTMTRL2zKVCZEkXcE9VOV2GzOqAxR/Ox3/+NV4clkbBQr3ZUlI
         4DEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692747219; x=1693352019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jrDWaCBQ1sWLUoVnt/HCli5/wouIl1yCYP/wbQLKWo4=;
        b=Xc8LUYHLboFzMYgxhG9scZiFWT/3Hnjwq2QduY/ANNwIuYKxnJAFJ53IBDHYtIjcJE
         3pWjfbhBWT2XxTw1irXlaoeHAs3nQfIxiybYuaLzt6+ckaRk8QPmyWhyi9ve3SL51Y1v
         Iq4PeQLTrcEW7vFU+8GdUXR8JNCXXROF4NoU2pBBH4yLr/bGLajQb6cxUxWyYISEKoVQ
         d4qqZwIMfVNqSqfKxA53iwhs3bXPlYmavQI3W+Jz6k7D61cD9N548lGR6Ff9Z4xOp6tO
         /3owcsIyFDysQZCnOAHWH2Fa1dMcK6CRvceZSBxi/bgzUnUO79mSs30oiyO3+BEHFtfn
         dN/g==
X-Gm-Message-State: AOJu0YxRG14s1NsJPgRRVawGGzWYVzqWPbH/EImQmw/R4Deea6s+efoa
        fFzgCXFhv0H/JRp9gZAQgc2WhHyRv1biAFAOirE6PA==
X-Google-Smtp-Source: AGHT+IEbIpKzyM58YiqourBSkiz6n74NcVgIaFtnI5P/WCZpuUx1AqRdpsd74TbX1sw0f9QLei6Oiwd6yzf8tHoj6pM=
X-Received: by 2002:a67:f3c6:0:b0:44d:5105:b143 with SMTP id
 j6-20020a67f3c6000000b0044d5105b143mr5895400vsn.27.1692747218736; Tue, 22 Aug
 2023 16:33:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230810015751.3297321-1-almasrymina@google.com>
 <20230810015751.3297321-7-almasrymina@google.com> <6adafb5d-0bc5-cb9a-5232-6836ab7e77e6@redhat.com>
 <CAHS8izM4w2UETAwfnV7w+ZzTMxLkz+FKO+xTgRdtYKzV8RzqXw@mail.gmail.com> <7aedc5d5-0daf-63be-21bc-3b724cc1cab9@redhat.com>
In-Reply-To: <7aedc5d5-0daf-63be-21bc-3b724cc1cab9@redhat.com>
From:   Mina Almasry <almasrymina@google.com>
Date:   Tue, 22 Aug 2023 16:33:27 -0700
Message-ID: <CAHS8izMqHkPUma4WPr-Ao-foTzBY30vi-qH+BOFOrny5=Y0iKg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 06/11] page-pool: add device memory support
To:     Jesper Dangaard Brouer <jbrouer@redhat.com>
Cc:     brouer@redhat.com, netdev@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        David Ahern <dsahern@kernel.org>,
        Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Hari Ramakrishnan <rharix@google.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Andy Lutomirski <luto@kernel.org>, stephen@networkplumber.org,
        sdf@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Aug 22, 2023 at 5:24=E2=80=AFAM Jesper Dangaard Brouer
<jbrouer@redhat.com> wrote:
>
>
>
> On 22/08/2023 08.05, Mina Almasry wrote:
> > On Sat, Aug 19, 2023 at 2:51=E2=80=AFAM Jesper Dangaard Brouer
> > <jbrouer@redhat.com> wrote:
> >>
> >> On 10/08/2023 03.57, Mina Almasry wrote:
> >>> Overload the LSB of struct page* to indicate that it's a page_pool_io=
v.
> >>>
> >>> Refactor mm calls on struct page * into helpers, and add page_pool_io=
v
> >>> handling on those helpers. Modify callers of these mm APIs with calls=
 to
> >>> these helpers instead.
> >>>
> >>
> >> I don't like of this approach.
> >> This is adding code to the PP (page_pool) fast-path in multiple places=
.
> >>
> >> I've not had time to run my usual benchmarks, which are here:
> >>
> >> https://github.com/netoptimizer/prototype-kernel/blob/master/kernel/li=
b/bench_page_pool_simple.c
> >>
> >
> > I ported over this benchmark to my tree and ran it, my results:
> >
>
> What CPU is this and GHz?  (I guess 2.6 GHz based on results).
>
> (It looks like this CPU is more efficient, instructions per cycles, than
> my E5-1650 v4 @ 3.60GHz).
>

cat /proc/cpuinfo
...
vendor_id       : GenuineIntel
cpu family      : 6
model           : 143
model name      : Intel(R) Xeon(R) Platinum 8481C CPU @ 2.70GHz
stepping        : 8
microcode       : 0xffffffff
cpu MHz         : 2699.998
```

This is a vCPU on the Google Cloud A3 VMs.

> > net-next @ b44693495af8
> > https://pastebin.com/raw/JuU7UQXe
> >
> > + Jakub's memory-provider APIs:
> > https://pastebin.com/raw/StMBhetn
> >
> > + devmem TCP changes:
> > https://pastebin.com/raw/mY1L6U4r
> >
>
> Only a single cycle slowdown for "page_pool01_fast_path".
>  From 10 cycles to 11 cycles.
>
> > + intentional regression just to make sure the benchmark is working:
> > https://pastebin.com/raw/wqWhcJdG
> >
> > I don't seem to be able to detect a regression with this series as-is,
> > but I'm not that familiar with the test and may be doing something
> > wrong or misinterpreting the results. Does this look ok to you?
> >
>
> The performance results are better than I expected.  The small
> regression from 10 cycles to 11 cycles is actually 10%, but I expect
> with some likely/unlikely instrumentation we can "likely" remove this aga=
in.
>

So the patch is already optimized carefully (I hope) to put all the
devmem processing in the default unlikely path. Willem showed me that:

if (page_pool_iov())
   return handle_page_pool_iov();

return handle_page();

The handle_page() will be 'likely' by default, which removes the need
for explicit likely/unlikely. I'm not sure we can get better perf with
explicit likely/unlikey, but I can try.

> So, this change actually looks acceptable from a performance PoV.
> I still think this page_pool_iov is very invasive to page_pool, but
> maybe it is better to hide this "uglyness" inside page_pool.
>
> The test primarily tests fast-path, and you also add "if" statements to
> all the DMA operations, which is not part of this benchmark.  Perhaps we
> can add unlikely statements, or inspect (objdump) the ASM to check code
> priorities the original page based "provider".
>
> >> But I'm sure it will affect performance.
> >>
>
> Guess, I was wrong ;-)
>
> --Jesper
>
>
> >> Regardless of performance, this approach is using ptr-LSB-bits, to hid=
e
> >> that page-pointer are not really struct-pages, feels like force feedin=
g
> >> a solution just to use the page_pool APIs.
> >>
> >>
> >>> In areas where struct page* is dereferenced, add a check for special
> >>> handling of page_pool_iov.
> >>>
> >>> The memory providers producing page_pool_iov can set the LSB on the
> >>> struct page* returned to the page pool.
> >>>
> >>> Note that instead of overloading the LSB of page pointers, we can
> >>> instead define a new union between struct page & struct page_pool_iov=
 and
> >>> compact it in a new type. However, we'd need to implement the code ch=
urn
> >>> to modify the page_pool & drivers to use this new type. For this POC
> >>> that is not implemented (feedback welcome).
> >>>
> >>
> >> I've said before, that I prefer multiplexing on page->pp_magic.
> >> For your page_pool_iov the layout would have to match the offset of
> >> pp_magic, to do this. (And if insisting on using PP infra the refcnt
> >> would also need to align).
> >>
> >> On the allocation side, all drivers already use a driver helper
> >> page_pool_dev_alloc_pages() or we could add another (better named)
> >> helper to multiplex between other types of allocators, e.g. a devmem
> >> allocator.
> >>
> >> On free/return/recycle the functions napi_pp_put_page or skb_pp_recycl=
e
> >> could multiplex on pp_magic and call another API.  The API could be an
> >> extension to PP helpers, but it could also be a devmap allocator helpe=
r.
> >>
> >> IMHO forcing/piggy-bagging everything into page_pool is not the right
> >> solution.  I really think netstack need to support different allocator
> >> types. The page pool have been leading the way, yes, but perhaps it is
> >> time to add an API layer that e.g. could be named netmem, that gives u=
s
> >> the multiplexing between allocators.  In that process some of page_poo=
l
> >> APIs would be lifted out as common blocks and others remain.
> >>
> >> --Jesper
> >>
> >>> I have a sample implementation of adding a new page_pool_token type
> >>> in the page_pool to give a general idea here:
> >>> https://github.com/torvalds/linux/commit/3a7628700eb7fd02a117db036003=
bca50779608d
> >>>
> >>> Full branch here:
> >>> https://github.com/torvalds/linux/compare/master...mina:linux:tcpdevm=
em-pp-tokens
> >>>
> >>> (In the branches above, page_pool_iov is called devmem_slice).
> >>>
> >>> Could also add static_branch to speed up the checks in page_pool_iov
> >>> memory providers are being used.
> >>>
> >>> Signed-off-by: Mina Almasry <almasrymina@google.com>
> >>> ---
> >>>    include/net/page_pool.h | 74 ++++++++++++++++++++++++++++++++++-
> >>>    net/core/page_pool.c    | 85 ++++++++++++++++++++++++++++---------=
----
> >>>    2 files changed, 131 insertions(+), 28 deletions(-)
> >>>
> >>> diff --git a/include/net/page_pool.h b/include/net/page_pool.h
> >>> index 537eb36115ed..f08ca230d68e 100644
> >>> --- a/include/net/page_pool.h
> >>> +++ b/include/net/page_pool.h
> >>> @@ -282,6 +282,64 @@ static inline struct page_pool_iov *page_to_page=
_pool_iov(struct page *page)
> >>>        return NULL;
> >>>    }
> >>>
> >>> +static inline int page_pool_page_ref_count(struct page *page)
> >>> +{
> >>> +     if (page_is_page_pool_iov(page))
> >>> +             return page_pool_iov_refcount(page_to_page_pool_iov(pag=
e));
> >>> +
> >>> +     return page_ref_count(page);
> >>> +}
> >>> +
> >>> +static inline void page_pool_page_get_many(struct page *page,
> >>> +                                        unsigned int count)
> >>> +{
> >>> +     if (page_is_page_pool_iov(page))
> >>> +             return page_pool_iov_get_many(page_to_page_pool_iov(pag=
e),
> >>> +                                           count);
> >>> +
> >>> +     return page_ref_add(page, count);
> >>> +}
> >>> +
> >>> +static inline void page_pool_page_put_many(struct page *page,
> >>> +                                        unsigned int count)
> >>> +{
> >>> +     if (page_is_page_pool_iov(page))
> >>> +             return page_pool_iov_put_many(page_to_page_pool_iov(pag=
e),
> >>> +                                           count);
> >>> +
> >>> +     if (count > 1)
> >>> +             page_ref_sub(page, count - 1);
> >>> +
> >>> +     put_page(page);
> >>> +}
> >>> +
> >>> +static inline bool page_pool_page_is_pfmemalloc(struct page *page)
> >>> +{
> >>> +     if (page_is_page_pool_iov(page))
> >>> +             return false;
> >>> +
> >>> +     return page_is_pfmemalloc(page);
> >>> +}
> >>> +
> >>> +static inline bool page_pool_page_is_pref_nid(struct page *page, int=
 pref_nid)
> >>> +{
> >>> +     /* Assume page_pool_iov are on the preferred node without actua=
lly
> >>> +      * checking...
> >>> +      *
> >>> +      * This check is only used to check for recycling memory in the=
 page
> >>> +      * pool's fast paths. Currently the only implementation of page=
_pool_iov
> >>> +      * is dmabuf device memory. It's a deliberate decision by the u=
ser to
> >>> +      * bind a certain dmabuf to a certain netdev, and the netdev rx=
 queue
> >>> +      * would not be able to reallocate memory from another dmabuf t=
hat
> >>> +      * exists on the preferred node, so, this check doesn't make mu=
ch sense
> >>> +      * in this case. Assume all page_pool_iovs can be recycled for =
now.
> >>> +      */
> >>> +     if (page_is_page_pool_iov(page))
> >>> +             return true;
> >>> +
> >>> +     return page_to_nid(page) =3D=3D pref_nid;
> >>> +}
> >>> +
> >>>    struct page_pool {
> >>>        struct page_pool_params p;
> >>>
> >>> @@ -434,6 +492,9 @@ static inline long page_pool_defrag_page(struct p=
age *page, long nr)
> >>>    {
> >>>        long ret;
> >>>
> >>> +     if (page_is_page_pool_iov(page))
> >>> +             return -EINVAL;
> >>> +
> >>>        /* If nr =3D=3D pp_frag_count then we have cleared all remaini=
ng
> >>>         * references to the page. No need to actually overwrite it, i=
nstead
> >>>         * we can leave this to be overwritten by the calling function=
.
> >>> @@ -494,7 +555,12 @@ static inline void page_pool_recycle_direct(stru=
ct page_pool *pool,
> >>>
> >>>    static inline dma_addr_t page_pool_get_dma_addr(struct page *page)
> >>>    {
> >>> -     dma_addr_t ret =3D page->dma_addr;
> >>> +     dma_addr_t ret;
> >>> +
> >>> +     if (page_is_page_pool_iov(page))
> >>> +             return page_pool_iov_dma_addr(page_to_page_pool_iov(pag=
e));
> >>> +
> >>> +     ret =3D page->dma_addr;
> >>>
> >>>        if (PAGE_POOL_DMA_USE_PP_FRAG_COUNT)
> >>>                ret |=3D (dma_addr_t)page->dma_addr_upper << 16 << 16;
> >>> @@ -504,6 +570,12 @@ static inline dma_addr_t page_pool_get_dma_addr(=
struct page *page)
> >>>
> >>>    static inline void page_pool_set_dma_addr(struct page *page, dma_a=
ddr_t addr)
> >>>    {
> >>> +     /* page_pool_iovs are mapped and their dma-addr can't be modifi=
ed. */
> >>> +     if (page_is_page_pool_iov(page)) {
> >>> +             DEBUG_NET_WARN_ON_ONCE(true);
> >>> +             return;
> >>> +     }
> >>> +
> >>>        page->dma_addr =3D addr;
> >>>        if (PAGE_POOL_DMA_USE_PP_FRAG_COUNT)
> >>>                page->dma_addr_upper =3D upper_32_bits(addr);
> >>> diff --git a/net/core/page_pool.c b/net/core/page_pool.c
> >>> index 0a7c08d748b8..20c1f74fd844 100644
> >>> --- a/net/core/page_pool.c
> >>> +++ b/net/core/page_pool.c
> >>> @@ -318,7 +318,7 @@ static struct page *page_pool_refill_alloc_cache(=
struct page_pool *pool)
> >>>                if (unlikely(!page))
> >>>                        break;
> >>>
> >>> -             if (likely(page_to_nid(page) =3D=3D pref_nid)) {
> >>> +             if (likely(page_pool_page_is_pref_nid(page, pref_nid)))=
 {
> >>>                        pool->alloc.cache[pool->alloc.count++] =3D pag=
e;
> >>>                } else {
> >>>                        /* NUMA mismatch;
> >>> @@ -363,7 +363,15 @@ static void page_pool_dma_sync_for_device(struct=
 page_pool *pool,
> >>>                                          struct page *page,
> >>>                                          unsigned int dma_sync_size)
> >>>    {
> >>> -     dma_addr_t dma_addr =3D page_pool_get_dma_addr(page);
> >>> +     dma_addr_t dma_addr;
> >>> +
> >>> +     /* page_pool_iov memory provider do not support PP_FLAG_DMA_SYN=
C_DEV */
> >>> +     if (page_is_page_pool_iov(page)) {
> >>> +             DEBUG_NET_WARN_ON_ONCE(true);
> >>> +             return;
> >>> +     }
> >>> +
> >>> +     dma_addr =3D page_pool_get_dma_addr(page);
> >>>
> >>>        dma_sync_size =3D min(dma_sync_size, pool->p.max_len);
> >>>        dma_sync_single_range_for_device(pool->p.dev, dma_addr,
> >>> @@ -375,6 +383,12 @@ static bool page_pool_dma_map(struct page_pool *=
pool, struct page *page)
> >>>    {
> >>>        dma_addr_t dma;
> >>>
> >>> +     if (page_is_page_pool_iov(page)) {
> >>> +             /* page_pool_iovs are already mapped */
> >>> +             DEBUG_NET_WARN_ON_ONCE(true);
> >>> +             return true;
> >>> +     }
> >>> +
> >>>        /* Setup DMA mapping: use 'struct page' area for storing DMA-a=
ddr
> >>>         * since dma_addr_t can be either 32 or 64 bits and does not a=
lways fit
> >>>         * into page private data (i.e 32bit cpu with 64bit DMA caps)
> >>> @@ -398,14 +412,24 @@ static bool page_pool_dma_map(struct page_pool =
*pool, struct page *page)
> >>>    static void page_pool_set_pp_info(struct page_pool *pool,
> >>>                                  struct page *page)
> >>>    {
> >>> -     page->pp =3D pool;
> >>> -     page->pp_magic |=3D PP_SIGNATURE;
> >>> +     if (!page_is_page_pool_iov(page)) {
> >>> +             page->pp =3D pool;
> >>> +             page->pp_magic |=3D PP_SIGNATURE;
> >>> +     } else {
> >>> +             page_to_page_pool_iov(page)->pp =3D pool;
> >>> +     }
> >>> +
> >>>        if (pool->p.init_callback)
> >>>                pool->p.init_callback(page, pool->p.init_arg);
> >>>    }
> >>>
> >>>    static void page_pool_clear_pp_info(struct page *page)
> >>>    {
> >>> +     if (page_is_page_pool_iov(page)) {
> >>> +             page_to_page_pool_iov(page)->pp =3D NULL;
> >>> +             return;
> >>> +     }
> >>> +
> >>>        page->pp_magic =3D 0;
> >>>        page->pp =3D NULL;
> >>>    }
> >>> @@ -615,7 +639,7 @@ static bool page_pool_recycle_in_cache(struct pag=
e *page,
> >>>                return false;
> >>>        }
> >>>
> >>> -     /* Caller MUST have verified/know (page_ref_count(page) =3D=3D =
1) */
> >>> +     /* Caller MUST have verified/know (page_pool_page_ref_count(pag=
e) =3D=3D 1) */
> >>>        pool->alloc.cache[pool->alloc.count++] =3D page;
> >>>        recycle_stat_inc(pool, cached);
> >>>        return true;
> >>> @@ -638,9 +662,10 @@ __page_pool_put_page(struct page_pool *pool, str=
uct page *page,
> >>>         * refcnt =3D=3D 1 means page_pool owns page, and can recycle =
it.
> >>>         *
> >>>         * page is NOT reusable when allocated when system is under
> >>> -      * some pressure. (page_is_pfmemalloc)
> >>> +      * some pressure. (page_pool_page_is_pfmemalloc)
> >>>         */
> >>> -     if (likely(page_ref_count(page) =3D=3D 1 && !page_is_pfmemalloc=
(page))) {
> >>> +     if (likely(page_pool_page_ref_count(page) =3D=3D 1 &&
> >>> +                !page_pool_page_is_pfmemalloc(page))) {
> >>>                /* Read barrier done in page_ref_count / READ_ONCE */
> >>>
> >>>                if (pool->p.flags & PP_FLAG_DMA_SYNC_DEV)
> >>> @@ -741,7 +766,8 @@ static struct page *page_pool_drain_frag(struct p=
age_pool *pool,
> >>>        if (likely(page_pool_defrag_page(page, drain_count)))
> >>>                return NULL;
> >>>
> >>> -     if (page_ref_count(page) =3D=3D 1 && !page_is_pfmemalloc(page))=
 {
> >>> +     if (page_pool_page_ref_count(page) =3D=3D 1 &&
> >>> +         !page_pool_page_is_pfmemalloc(page)) {
> >>>                if (pool->p.flags & PP_FLAG_DMA_SYNC_DEV)
> >>>                        page_pool_dma_sync_for_device(pool, page, -1);
> >>>
> >>> @@ -818,9 +844,9 @@ static void page_pool_empty_ring(struct page_pool=
 *pool)
> >>>        /* Empty recycle ring */
> >>>        while ((page =3D ptr_ring_consume_bh(&pool->ring))) {
> >>>                /* Verify the refcnt invariant of cached pages */
> >>> -             if (!(page_ref_count(page) =3D=3D 1))
> >>> +             if (!(page_pool_page_ref_count(page) =3D=3D 1))
> >>>                        pr_crit("%s() page_pool refcnt %d violation\n"=
,
> >>> -                             __func__, page_ref_count(page));
> >>> +                             __func__, page_pool_page_ref_count(page=
));
> >>>
> >>>                page_pool_return_page(pool, page);
> >>>        }
> >>> @@ -977,19 +1003,24 @@ bool page_pool_return_skb_page(struct page *pa=
ge, bool napi_safe)
> >>>        struct page_pool *pp;
> >>>        bool allow_direct;
> >>>
> >>> -     page =3D compound_head(page);
> >>> +     if (!page_is_page_pool_iov(page)) {
> >>> +             page =3D compound_head(page);
> >>>
> >>> -     /* page->pp_magic is OR'ed with PP_SIGNATURE after the allocati=
on
> >>> -      * in order to preserve any existing bits, such as bit 0 for th=
e
> >>> -      * head page of compound page and bit 1 for pfmemalloc page, so
> >>> -      * mask those bits for freeing side when doing below checking,
> >>> -      * and page_is_pfmemalloc() is checked in __page_pool_put_page(=
)
> >>> -      * to avoid recycling the pfmemalloc page.
> >>> -      */
> >>> -     if (unlikely((page->pp_magic & ~0x3UL) !=3D PP_SIGNATURE))
> >>> -             return false;
> >>> +             /* page->pp_magic is OR'ed with PP_SIGNATURE after the
> >>> +              * allocation in order to preserve any existing bits, s=
uch as
> >>> +              * bit 0 for the head page of compound page and bit 1 f=
or
> >>> +              * pfmemalloc page, so mask those bits for freeing side=
 when
> >>> +              * doing below checking, and page_pool_page_is_pfmemall=
oc() is
> >>> +              * checked in __page_pool_put_page() to avoid recycling=
 the
> >>> +              * pfmemalloc page.
> >>> +              */
> >>> +             if (unlikely((page->pp_magic & ~0x3UL) !=3D PP_SIGNATUR=
E))
> >>> +                     return false;
> >>>
> >>> -     pp =3D page->pp;
> >>> +             pp =3D page->pp;
> >>> +     } else {
> >>> +             pp =3D page_to_page_pool_iov(page)->pp;
> >>> +     }
> >>>
> >>>        /* Allow direct recycle if we have reasons to believe that we =
are
> >>>         * in the same context as the consumer would run, so there's
> >>> @@ -1273,9 +1304,9 @@ static bool mp_huge_busy(struct mp_huge *hu, un=
signed int idx)
> >>>
> >>>        for (j =3D 0; j < (1 << MP_HUGE_ORDER); j++) {
> >>>                page =3D hu->page[idx] + j;
> >>> -             if (page_ref_count(page) !=3D 1) {
> >>> +             if (page_pool_page_ref_count(page) !=3D 1) {
> >>>                        pr_warn("Page with ref count %d at %u, %u. Can=
't safely destory, leaking memory!\n",
> >>> -                             page_ref_count(page), idx, j);
> >>> +                             page_pool_page_ref_count(page), idx, j)=
;
> >>>                        return true;
> >>>                }
> >>>        }
> >>> @@ -1330,7 +1361,7 @@ static struct page *mp_huge_alloc_pages(struct =
page_pool *pool, gfp_t gfp)
> >>>                        continue;
> >>>
> >>>                if ((page->pp_magic & ~0x3UL) =3D=3D PP_SIGNATURE ||
> >>> -                 page_ref_count(page) !=3D 1) {
> >>> +                 page_pool_page_ref_count(page) !=3D 1) {
> >>>                        atomic_inc(&mp_huge_ins_b);
> >>>                        continue;
> >>>                }
> >>> @@ -1458,9 +1489,9 @@ static void mp_huge_1g_destroy(struct page_pool=
 *pool)
> >>>        free =3D true;
> >>>        for (i =3D 0; i < MP_HUGE_1G_CNT; i++) {
> >>>                page =3D hu->page + i;
> >>> -             if (page_ref_count(page) !=3D 1) {
> >>> +             if (page_pool_page_ref_count(page) !=3D 1) {
> >>>                        pr_warn("Page with ref count %d at %u. Can't s=
afely destory, leaking memory!\n",
> >>> -                             page_ref_count(page), i);
> >>> +                             page_pool_page_ref_count(page), i);
> >>>                        free =3D false;
> >>>                        break;
> >>>                }
> >>> @@ -1489,7 +1520,7 @@ static struct page *mp_huge_1g_alloc_pages(stru=
ct page_pool *pool, gfp_t gfp)
> >>>                page =3D hu->page + page_i;
> >>>
> >>>                if ((page->pp_magic & ~0x3UL) =3D=3D PP_SIGNATURE ||
> >>> -                 page_ref_count(page) !=3D 1) {
> >>> +                 page_pool_page_ref_count(page) !=3D 1) {
> >>>                        atomic_inc(&mp_huge_ins_b);
> >>>                        continue;
> >>>                }
> >>> --
> >>> 2.41.0.640.ga95def55d0-goog
> >>>
> >>
> >
> >
> > --
> > Thanks,
> > Mina
> >
>


--
Thanks,
Mina
