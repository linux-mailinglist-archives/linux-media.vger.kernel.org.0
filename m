Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9BEA79809A
	for <lists+linux-media@lfdr.de>; Fri,  8 Sep 2023 04:32:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240979AbjIHCcv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Sep 2023 22:32:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231597AbjIHCcu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Sep 2023 22:32:50 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BC581BD7
        for <linux-media@vger.kernel.org>; Thu,  7 Sep 2023 19:32:44 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-68c576d35feso1510713b3a.2
        for <linux-media@vger.kernel.org>; Thu, 07 Sep 2023 19:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=davidwei-uk.20230601.gappssmtp.com; s=20230601; t=1694140364; x=1694745164; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7T7TLNObXQiNEGhEr8WN8HFl5863egDYnYBVEREmRUk=;
        b=0xpOaiupcY3aWo9xI5bwBofw0dcG7VWXZ6ApE0ipVbi0NdYD0QG/u/w7UprOe3DffF
         HFQ9Gogu6OdyIUSumORlkWpyTgRQ13cxH4zfETNDsHctnVtay1pWgjHhYzpt59V/yW3T
         TzwbHd/4+7lSuDgz2gDpdPlU59rdnIWKmD/eoYiFTt38HihxG1hyN8CyaZ+R6/NHmRgm
         ZhgZicWsH/Uk01+J7b41CI5Trw/r/UhABFXMUTL2Fq60NdKLtpcGMNSYYwHq5YeRkVrc
         wfaTwuc5clYdJnWw2wkWRLsMW84/Es6rWTwfcnCT2xZodHgeomPfpY4flQTwpRbZ1HYc
         tuSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694140364; x=1694745164;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7T7TLNObXQiNEGhEr8WN8HFl5863egDYnYBVEREmRUk=;
        b=PUpfVI8NwFdqFScijpZCH3UvPe/8J+W12KaVqVZQQ0cshM/UrYbNi/MTDr/La80mGR
         qddxFTt2vCkq/EH1gOgGLdrljIIUi44RFLopJuVY+qgvTrUXfUQVAMUFl/PcwGgikrE3
         VLTOjzHc3NnjDYPltzg4T6f5PXEO8Zz9C6KG69zObl8PkEdX0d2a4BfUZQkVUIlHXB5X
         2NzTZOcvoybmFiPqGSgJFef7IMmqpQkC6X8Qjl6rEUQPutc9IwFZGY7rvQ4aFq8JKnBv
         /UzIV6ytoQginVf1fofnTPz3CzBzuGHPavEA26SCZk13YNIobrRSVWATdm2cG0mi4JHa
         6sRA==
X-Gm-Message-State: AOJu0Ywp1WLRpG7sjj0B8BEkvv7EQTwsvOkbz2FgO9L+yxSrn8IWxXXT
        B1dCz6RRP/rO2MpYQ05vKDRDWw==
X-Google-Smtp-Source: AGHT+IEaRuKVXdPeXRj8IC9Tk7cniNConExXxJ9NMMN6xZuvAxWByRTpgC4lRlXdm0vKAaYJmmxlEg==
X-Received: by 2002:a05:6a00:2393:b0:68b:eb3d:8030 with SMTP id f19-20020a056a00239300b0068beb3d8030mr1278165pfc.1.1694140363555;
        Thu, 07 Sep 2023 19:32:43 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1151:15:40a:5eb5:8916:33a4? ([2620:10d:c090:500::7:4620])
        by smtp.gmail.com with ESMTPSA id x8-20020aa79188000000b0068a4cd8b530sm338776pfa.139.2023.09.07.19.32.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Sep 2023 19:32:43 -0700 (PDT)
Message-ID: <8728ecc4-aefa-9f60-380c-94120fcc7146@davidwei.uk>
Date:   Thu, 7 Sep 2023 19:32:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [RFC PATCH v2 06/11] page-pool: add device memory support
To:     Mina Almasry <almasrymina@google.com>,
        Jesper Dangaard Brouer <jbrouer@redhat.com>
Cc:     Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
        brouer@redhat.com, netdev@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        David Ahern <dsahern@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Hari Ramakrishnan <rharix@google.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Andy Lutomirski <luto@kernel.org>, stephen@networkplumber.org,
        sdf@google.com
References: <20230810015751.3297321-1-almasrymina@google.com>
 <20230810015751.3297321-7-almasrymina@google.com>
 <6adafb5d-0bc5-cb9a-5232-6836ab7e77e6@redhat.com>
 <CAF=yD-L0ajGVrexnOVvvhC-A7vw6XP9tq5T3HCDTjQMS0mXdTQ@mail.gmail.com>
 <8f4d276e-470d-6ce8-85d5-a6c08fa22147@redhat.com>
 <CAHS8izMGY+_jBVmYzhYYZtyAf_Uy1GDX-U3zX=ea7f73ya4iQQ@mail.gmail.com>
From:   David Wei <dw@davidwei.uk>
In-Reply-To: <CAHS8izMGY+_jBVmYzhYYZtyAf_Uy1GDX-U3zX=ea7f73ya4iQQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 19/08/2023 13:24, Mina Almasry wrote:
> On Sat, Aug 19, 2023 at 8:22 AM Jesper Dangaard Brouer
> <jbrouer@redhat.com> wrote:
>>
>>
>>
>> On 19/08/2023 16.08, Willem de Bruijn wrote:
>>> On Sat, Aug 19, 2023 at 5:51 AM Jesper Dangaard Brouer
>>> <jbrouer@redhat.com> wrote:
>>>>
>>>>
>>>>
>>>> On 10/08/2023 03.57, Mina Almasry wrote:
>>>>> Overload the LSB of struct page* to indicate that it's a page_pool_iov.
>>>>>
>>>>> Refactor mm calls on struct page * into helpers, and add page_pool_iov
>>>>> handling on those helpers. Modify callers of these mm APIs with calls to
>>>>> these helpers instead.
>>>>>
>>>>
>>>> I don't like of this approach.
>>>> This is adding code to the PP (page_pool) fast-path in multiple places.
>>>>
>>>> I've not had time to run my usual benchmarks, which are here:
>>>>
>>>> https://github.com/netoptimizer/prototype-kernel/blob/master/kernel/lib/bench_page_pool_simple.c
>>>>
> 
> Thank you for linking that, I'll try to run these against the next submission.
> 
>>>> But I'm sure it will affect performance.
>>>>
>>>> Regardless of performance, this approach is using ptr-LSB-bits, to hide
>>>> that page-pointer are not really struct-pages, feels like force feeding
>>>> a solution just to use the page_pool APIs.
>>>>
>>>>
>>>>> In areas where struct page* is dereferenced, add a check for special
>>>>> handling of page_pool_iov.
>>>>>
>>>>> The memory providers producing page_pool_iov can set the LSB on the
>>>>> struct page* returned to the page pool.
>>>>>
>>>>> Note that instead of overloading the LSB of page pointers, we can
>>>>> instead define a new union between struct page & struct page_pool_iov and
>>>>> compact it in a new type. However, we'd need to implement the code churn
>>>>> to modify the page_pool & drivers to use this new type. For this POC
>>>>> that is not implemented (feedback welcome).
>>>>>
>>>>
>>>> I've said before, that I prefer multiplexing on page->pp_magic.
>>>> For your page_pool_iov the layout would have to match the offset of
>>>> pp_magic, to do this. (And if insisting on using PP infra the refcnt
>>>> would also need to align).
>>>
>>> Perhaps I misunderstand, but this suggests continuing to using
>>> struct page to demultiplex memory type?
>>>
>>
>> (Perhaps we are misunderstanding each-other and my use of the words
>> multiplexing and demultiplex are wrong, I'm sorry, as English isn't my
>> native language.)
>>
>> I do see the problem of depending on having a struct page, as the
>> page_pool_iov isn't related to struct page.  Having "page" in the name
>> of "page_pool_iov" is also confusing (hardest problem is CS is naming,
>> as we all know).
>>
>> To support more allocator types, perhaps skb->pp_recycle bit need to
>> grow another bit (and be renamed skb->recycle), so we can tell allocator
>> types apart, those that are page based and those whom are not.
>>
>>
>>> I think the feedback has been strong to not multiplex yet another
>>> memory type into that struct, that is not a real page. Which is why
>>> we went into this direction. This latest series limits the impact largely
>>> to networking structures and code.
>>>
>>
>> Some what related what I'm objecting to: the "page_pool_iov" is not a
>> real page, but this getting recycled into something called "page_pool",
>> which funny enough deals with struct-pages internally and depend on the
>> struct-page-refcnt.
>>
>> Given the approach changed way from using struct page, then I also don't
>> see the connection with the page_pool. Sorry.
>>
>>> One way or another, there will be a branch and multiplexing. Whether
>>> that is in struct page, the page pool or a new netdev mem type as you
>>> propose.
>>>
>>
>> I'm asking to have this branch/multiplexing done a the call sites.
>>
>> (IMHO not changing the drivers is a pipe-dream.)
>>
> 
> I think I understand what Jesper is saying. I think Jesper wants the
> page_pool to remain unchanged, and another layer on top of it to do
> the multiplexing, i.e.:
> 
> driver ---> new_layer (does multiplexing) ---> page_pool -------> mm layer
>                                 \------------------------------>
> devmem_pool --> dma-buf layer
> 
> But, I think, Jakub wants the page_pool to be the front end, and for
> the multiplexing to happen in the page pool (I think, Jakub did not
> write this in an email, but this is how I interpret his comments from
> [1], and his memory provider RFC). So I think Jakub wants:
> 
> driver --> page_pool ---> memory_provider (does multiplexing) --->
> basic_provider -------> mm layer
> 
> \----------------------------------------> devmem_provider --> dma-buf
> layer
> 
> That is the approach in this RFC.
> 
> I think proper naming that makes sense can be figured out, and is not
> a huge issue. I think in both cases we can minimize the changes to the
> drivers, maybe. In the first approach the driver will need to use the
> APIs created by the new layer. In the second approach, the driver
> continues to use page_pool APIs.
> 
> I think we need to converge on a path between the 2 approaches (or
> maybe 3rd approach to do). For me the pros/cons of each approach
> (please add):
> 
> multiplexing in new_layer:
> - Pro: maybe better for performance? Not sure if static_branch can
> achieve the same perf. I can verify with Jesper's perf tests.
> - Pro: doesn't add complexity in the page_pool (but adds complexity in
> terms of adding new pools like devmem_pool)
> - Con: the devmem_pool & page_pool will end up being duplicated code,
> I suspect, because they largely do similar things (both need to
> recycle memory for example).

Hi all, for our ZC RX into userspace host memory implementation, we opted for
the 1st approach [1] that was initially suggested by Kuba. The multiplexing was
added into a thin shim layer that we named "data_pool", but is functionally
identical to devmem_pool.

Seeing Mina's work in this patchset, I would also prefer the 2nd approach i.e.
multiplexing via memory_provider within a page_pool. In addition to the
pros/cons Mina mentioned, in our case the pages are actually pages so it makes
sense to me to put it inside the page_pool.

[1]: https://lore.kernel.org/io-uring/20230826011954.1801099-11-dw@davidwei.uk/

> 
> multiplexing via memory_provider:
> - Pro: no code duplication.
> - Pro: less changes to the drivers, I think. The drivers can continue
> to use the page_pool API, no need to introduce calls to 'new_layer'.
> - Con: adds complexity to the page_pool (needs to handle devmem).
> - Con: probably careful handling via static_branch needs to be done to
> achieve performance.
> 
> [1] https://lore.kernel.org/netdev/20230619110705.106ec599@kernel.org/
> 
>>> Any regression in page pool can be avoided in the common case that
>>> does not use device mem by placing that behind a static_branch. Would
>>> that address your performance concerns?
>>>
>>
>> No. This will not help.
>>
>> The problem is that every where in the page_pool code it is getting
>> polluted with:
>>
>>    if (page_is_page_pool_iov(page))
>>      call-some-iov-func-instead()
>>
>> Like: the very central piece of getting the refcnt:
>>
>> +static inline int page_pool_page_ref_count(struct page *page)
>> +{
>> +       if (page_is_page_pool_iov(page))
>> +               return page_pool_iov_refcount(page_to_page_pool_iov(page));
>> +
>> +       return page_ref_count(page);
>> +}
>>
>>
>> The fast-path of the PP is used for XDP_DROP scenarios, and is currently
>> around 14 cycles (tsc). Thus, any extra code in this code patch will
>> change the fast-path.
>>
>>
>>>>
>>>> On the allocation side, all drivers already use a driver helper
>>>> page_pool_dev_alloc_pages() or we could add another (better named)
>>>> helper to multiplex between other types of allocators, e.g. a devmem
>>>> allocator.
>>>>
>>>> On free/return/recycle the functions napi_pp_put_page or skb_pp_recycle
>>>> could multiplex on pp_magic and call another API.  The API could be an
>>>> extension to PP helpers, but it could also be a devmap allocator helper.
>>>>
>>>> IMHO forcing/piggy-bagging everything into page_pool is not the right
>>>> solution.  I really think netstack need to support different allocator
>>>> types.
>>>
>>> To me this is lifting page_pool into such a netstack alloctator pool.
>>>
>>
>> This is should be renamed as it is not longer dealing with pages.
>>
>>> Not sure adding another explicit layer of indirection would be cleaner
>>> or faster (potentially more indirect calls).
>>>
>>
>> It seems we are talking past each-other.  The layer of indirection I'm
>> talking about is likely a simple header file (e.g. named netmem.h) that
>> will get inline compiled so there is no overhead. It will be used by
>> driver, such that we can avoid touching driver again when introducing
>> new memory allocator types.
>>
>>
>>> As for the LSB trick: that avoided adding a lot of boilerplate churn
>>> with new type and helper functions.
>>>
>>
>> Says the lazy programmer :-P ... sorry could not resist ;-)
>>
>>>
>>>
>>>> The page pool have been leading the way, yes, but perhaps it is
>>>> time to add an API layer that e.g. could be named netmem, that gives us
>>>> the multiplexing between allocators.  In that process some of page_pool
>>>> APIs would be lifted out as common blocks and others remain.
>>>>
>>>> --Jesper
>>>>
>>>>> I have a sample implementation of adding a new page_pool_token type
>>>>> in the page_pool to give a general idea here:
>>>>> https://github.com/torvalds/linux/commit/3a7628700eb7fd02a117db036003bca50779608d
>>>>>
>>>>> Full branch here:
>>>>> https://github.com/torvalds/linux/compare/master...mina:linux:tcpdevmem-pp-tokens
>>>>>
>>>>> (In the branches above, page_pool_iov is called devmem_slice).
>>>>>
>>>>> Could also add static_branch to speed up the checks in page_pool_iov
>>>>> memory providers are being used.
>>>>>
>>>>> Signed-off-by: Mina Almasry <almasrymina@google.com>
>>>>> ---
>>>>>    include/net/page_pool.h | 74 ++++++++++++++++++++++++++++++++++-
>>>>>    net/core/page_pool.c    | 85 ++++++++++++++++++++++++++++-------------
>>>>>    2 files changed, 131 insertions(+), 28 deletions(-)
>>>>>
>>>>> diff --git a/include/net/page_pool.h b/include/net/page_pool.h
>>>>> index 537eb36115ed..f08ca230d68e 100644
>>>>> --- a/include/net/page_pool.h
>>>>> +++ b/include/net/page_pool.h
>>>>> @@ -282,6 +282,64 @@ static inline struct page_pool_iov *page_to_page_pool_iov(struct page *page)
>>>>>        return NULL;
>>>>>    }
>>>>>
>>>>> +static inline int page_pool_page_ref_count(struct page *page)
>>>>> +{
>>>>> +     if (page_is_page_pool_iov(page))
>>>>> +             return page_pool_iov_refcount(page_to_page_pool_iov(page));
>>>>> +
>>>>> +     return page_ref_count(page);
>>>>> +}
>>>>> +
>>>>> +static inline void page_pool_page_get_many(struct page *page,
>>>>> +                                        unsigned int count)
>>>>> +{
>>>>> +     if (page_is_page_pool_iov(page))
>>>>> +             return page_pool_iov_get_many(page_to_page_pool_iov(page),
>>>>> +                                           count);
>>>>> +
>>>>> +     return page_ref_add(page, count);
>>>>> +}
>>>>> +
>>>>> +static inline void page_pool_page_put_many(struct page *page,
>>>>> +                                        unsigned int count)
>>>>> +{
>>>>> +     if (page_is_page_pool_iov(page))
>>>>> +             return page_pool_iov_put_many(page_to_page_pool_iov(page),
>>>>> +                                           count);
>>>>> +
>>>>> +     if (count > 1)
>>>>> +             page_ref_sub(page, count - 1);
>>>>> +
>>>>> +     put_page(page);
>>>>> +}
>>>>> +
>>>>> +static inline bool page_pool_page_is_pfmemalloc(struct page *page)
>>>>> +{
>>>>> +     if (page_is_page_pool_iov(page))
>>>>> +             return false;
>>>>> +
>>>>> +     return page_is_pfmemalloc(page);
>>>>> +}
>>>>> +
>>>>> +static inline bool page_pool_page_is_pref_nid(struct page *page, int pref_nid)
>>>>> +{
>>>>> +     /* Assume page_pool_iov are on the preferred node without actually
>>>>> +      * checking...
>>>>> +      *
>>>>> +      * This check is only used to check for recycling memory in the page
>>>>> +      * pool's fast paths. Currently the only implementation of page_pool_iov
>>>>> +      * is dmabuf device memory. It's a deliberate decision by the user to
>>>>> +      * bind a certain dmabuf to a certain netdev, and the netdev rx queue
>>>>> +      * would not be able to reallocate memory from another dmabuf that
>>>>> +      * exists on the preferred node, so, this check doesn't make much sense
>>>>> +      * in this case. Assume all page_pool_iovs can be recycled for now.
>>>>> +      */
>>>>> +     if (page_is_page_pool_iov(page))
>>>>> +             return true;
>>>>> +
>>>>> +     return page_to_nid(page) == pref_nid;
>>>>> +}
>>>>> +
>>>>>    struct page_pool {
>>>>>        struct page_pool_params p;
>>>>>
>>>>> @@ -434,6 +492,9 @@ static inline long page_pool_defrag_page(struct page *page, long nr)
>>>>>    {
>>>>>        long ret;
>>>>>
>>>>> +     if (page_is_page_pool_iov(page))
>>>>> +             return -EINVAL;
>>>>> +
>>>>>        /* If nr == pp_frag_count then we have cleared all remaining
>>>>>         * references to the page. No need to actually overwrite it, instead
>>>>>         * we can leave this to be overwritten by the calling function.
>>>>> @@ -494,7 +555,12 @@ static inline void page_pool_recycle_direct(struct page_pool *pool,
>>>>>
>>>>>    static inline dma_addr_t page_pool_get_dma_addr(struct page *page)
>>>>>    {
>>>>> -     dma_addr_t ret = page->dma_addr;
>>>>> +     dma_addr_t ret;
>>>>> +
>>>>> +     if (page_is_page_pool_iov(page))
>>>>> +             return page_pool_iov_dma_addr(page_to_page_pool_iov(page));
>>>>> +
>>>>> +     ret = page->dma_addr;
>>>>>
>>>>>        if (PAGE_POOL_DMA_USE_PP_FRAG_COUNT)
>>>>>                ret |= (dma_addr_t)page->dma_addr_upper << 16 << 16;
>>>>> @@ -504,6 +570,12 @@ static inline dma_addr_t page_pool_get_dma_addr(struct page *page)
>>>>>
>>>>>    static inline void page_pool_set_dma_addr(struct page *page, dma_addr_t addr)
>>>>>    {
>>>>> +     /* page_pool_iovs are mapped and their dma-addr can't be modified. */
>>>>> +     if (page_is_page_pool_iov(page)) {
>>>>> +             DEBUG_NET_WARN_ON_ONCE(true);
>>>>> +             return;
>>>>> +     }
>>>>> +
>>>>>        page->dma_addr = addr;
>>>>>        if (PAGE_POOL_DMA_USE_PP_FRAG_COUNT)
>>>>>                page->dma_addr_upper = upper_32_bits(addr);
>>>>> diff --git a/net/core/page_pool.c b/net/core/page_pool.c
>>>>> index 0a7c08d748b8..20c1f74fd844 100644
>>>>> --- a/net/core/page_pool.c
>>>>> +++ b/net/core/page_pool.c
>>>>> @@ -318,7 +318,7 @@ static struct page *page_pool_refill_alloc_cache(struct page_pool *pool)
>>>>>                if (unlikely(!page))
>>>>>                        break;
>>>>>
>>>>> -             if (likely(page_to_nid(page) == pref_nid)) {
>>>>> +             if (likely(page_pool_page_is_pref_nid(page, pref_nid))) {
>>>>>                        pool->alloc.cache[pool->alloc.count++] = page;
>>>>>                } else {
>>>>>                        /* NUMA mismatch;
>>>>> @@ -363,7 +363,15 @@ static void page_pool_dma_sync_for_device(struct page_pool *pool,
>>>>>                                          struct page *page,
>>>>>                                          unsigned int dma_sync_size)
>>>>>    {
>>>>> -     dma_addr_t dma_addr = page_pool_get_dma_addr(page);
>>>>> +     dma_addr_t dma_addr;
>>>>> +
>>>>> +     /* page_pool_iov memory provider do not support PP_FLAG_DMA_SYNC_DEV */
>>>>> +     if (page_is_page_pool_iov(page)) {
>>>>> +             DEBUG_NET_WARN_ON_ONCE(true);
>>>>> +             return;
>>>>> +     }
>>>>> +
>>>>> +     dma_addr = page_pool_get_dma_addr(page);
>>>>>
>>>>>        dma_sync_size = min(dma_sync_size, pool->p.max_len);
>>>>>        dma_sync_single_range_for_device(pool->p.dev, dma_addr,
>>>>> @@ -375,6 +383,12 @@ static bool page_pool_dma_map(struct page_pool *pool, struct page *page)
>>>>>    {
>>>>>        dma_addr_t dma;
>>>>>
>>>>> +     if (page_is_page_pool_iov(page)) {
>>>>> +             /* page_pool_iovs are already mapped */
>>>>> +             DEBUG_NET_WARN_ON_ONCE(true);
>>>>> +             return true;
>>>>> +     }
>>>>> +
>>>>>        /* Setup DMA mapping: use 'struct page' area for storing DMA-addr
>>>>>         * since dma_addr_t can be either 32 or 64 bits and does not always fit
>>>>>         * into page private data (i.e 32bit cpu with 64bit DMA caps)
>>>>> @@ -398,14 +412,24 @@ static bool page_pool_dma_map(struct page_pool *pool, struct page *page)
>>>>>    static void page_pool_set_pp_info(struct page_pool *pool,
>>>>>                                  struct page *page)
>>>>>    {
>>>>> -     page->pp = pool;
>>>>> -     page->pp_magic |= PP_SIGNATURE;
>>>>> +     if (!page_is_page_pool_iov(page)) {
>>>>> +             page->pp = pool;
>>>>> +             page->pp_magic |= PP_SIGNATURE;
>>>>> +     } else {
>>>>> +             page_to_page_pool_iov(page)->pp = pool;
>>>>> +     }
>>>>> +
>>>>>        if (pool->p.init_callback)
>>>>>                pool->p.init_callback(page, pool->p.init_arg);
>>>>>    }
>>>>>
>>>>>    static void page_pool_clear_pp_info(struct page *page)
>>>>>    {
>>>>> +     if (page_is_page_pool_iov(page)) {
>>>>> +             page_to_page_pool_iov(page)->pp = NULL;
>>>>> +             return;
>>>>> +     }
>>>>> +
>>>>>        page->pp_magic = 0;
>>>>>        page->pp = NULL;
>>>>>    }
>>>>> @@ -615,7 +639,7 @@ static bool page_pool_recycle_in_cache(struct page *page,
>>>>>                return false;
>>>>>        }
>>>>>
>>>>> -     /* Caller MUST have verified/know (page_ref_count(page) == 1) */
>>>>> +     /* Caller MUST have verified/know (page_pool_page_ref_count(page) == 1) */
>>>>>        pool->alloc.cache[pool->alloc.count++] = page;
>>>>>        recycle_stat_inc(pool, cached);
>>>>>        return true;
>>>>> @@ -638,9 +662,10 @@ __page_pool_put_page(struct page_pool *pool, struct page *page,
>>>>>         * refcnt == 1 means page_pool owns page, and can recycle it.
>>>>>         *
>>>>>         * page is NOT reusable when allocated when system is under
>>>>> -      * some pressure. (page_is_pfmemalloc)
>>>>> +      * some pressure. (page_pool_page_is_pfmemalloc)
>>>>>         */
>>>>> -     if (likely(page_ref_count(page) == 1 && !page_is_pfmemalloc(page))) {
>>>>> +     if (likely(page_pool_page_ref_count(page) == 1 &&
>>>>> +                !page_pool_page_is_pfmemalloc(page))) {
>>>>>                /* Read barrier done in page_ref_count / READ_ONCE */
>>>>>
>>>>>                if (pool->p.flags & PP_FLAG_DMA_SYNC_DEV)
>>>>> @@ -741,7 +766,8 @@ static struct page *page_pool_drain_frag(struct page_pool *pool,
>>>>>        if (likely(page_pool_defrag_page(page, drain_count)))
>>>>>                return NULL;
>>>>>
>>>>> -     if (page_ref_count(page) == 1 && !page_is_pfmemalloc(page)) {
>>>>> +     if (page_pool_page_ref_count(page) == 1 &&
>>>>> +         !page_pool_page_is_pfmemalloc(page)) {
>>>>>                if (pool->p.flags & PP_FLAG_DMA_SYNC_DEV)
>>>>>                        page_pool_dma_sync_for_device(pool, page, -1);
>>>>>
>>>>> @@ -818,9 +844,9 @@ static void page_pool_empty_ring(struct page_pool *pool)
>>>>>        /* Empty recycle ring */
>>>>>        while ((page = ptr_ring_consume_bh(&pool->ring))) {
>>>>>                /* Verify the refcnt invariant of cached pages */
>>>>> -             if (!(page_ref_count(page) == 1))
>>>>> +             if (!(page_pool_page_ref_count(page) == 1))
>>>>>                        pr_crit("%s() page_pool refcnt %d violation\n",
>>>>> -                             __func__, page_ref_count(page));
>>>>> +                             __func__, page_pool_page_ref_count(page));
>>>>>
>>>>>                page_pool_return_page(pool, page);
>>>>>        }
>>>>> @@ -977,19 +1003,24 @@ bool page_pool_return_skb_page(struct page *page, bool napi_safe)
>>>>>        struct page_pool *pp;
>>>>>        bool allow_direct;
>>>>>
>>>>> -     page = compound_head(page);
>>>>> +     if (!page_is_page_pool_iov(page)) {
>>>>> +             page = compound_head(page);
>>>>>
>>>>> -     /* page->pp_magic is OR'ed with PP_SIGNATURE after the allocation
>>>>> -      * in order to preserve any existing bits, such as bit 0 for the
>>>>> -      * head page of compound page and bit 1 for pfmemalloc page, so
>>>>> -      * mask those bits for freeing side when doing below checking,
>>>>> -      * and page_is_pfmemalloc() is checked in __page_pool_put_page()
>>>>> -      * to avoid recycling the pfmemalloc page.
>>>>> -      */
>>>>> -     if (unlikely((page->pp_magic & ~0x3UL) != PP_SIGNATURE))
>>>>> -             return false;
>>>>> +             /* page->pp_magic is OR'ed with PP_SIGNATURE after the
>>>>> +              * allocation in order to preserve any existing bits, such as
>>>>> +              * bit 0 for the head page of compound page and bit 1 for
>>>>> +              * pfmemalloc page, so mask those bits for freeing side when
>>>>> +              * doing below checking, and page_pool_page_is_pfmemalloc() is
>>>>> +              * checked in __page_pool_put_page() to avoid recycling the
>>>>> +              * pfmemalloc page.
>>>>> +              */
>>>>> +             if (unlikely((page->pp_magic & ~0x3UL) != PP_SIGNATURE))
>>>>> +                     return false;
>>>>>
>>>>> -     pp = page->pp;
>>>>> +             pp = page->pp;
>>>>> +     } else {
>>>>> +             pp = page_to_page_pool_iov(page)->pp;
>>>>> +     }
>>>>>
>>>>>        /* Allow direct recycle if we have reasons to believe that we are
>>>>>         * in the same context as the consumer would run, so there's
>>>>> @@ -1273,9 +1304,9 @@ static bool mp_huge_busy(struct mp_huge *hu, unsigned int idx)
>>>>>
>>>>>        for (j = 0; j < (1 << MP_HUGE_ORDER); j++) {
>>>>>                page = hu->page[idx] + j;
>>>>> -             if (page_ref_count(page) != 1) {
>>>>> +             if (page_pool_page_ref_count(page) != 1) {
>>>>>                        pr_warn("Page with ref count %d at %u, %u. Can't safely destory, leaking memory!\n",
>>>>> -                             page_ref_count(page), idx, j);
>>>>> +                             page_pool_page_ref_count(page), idx, j);
>>>>>                        return true;
>>>>>                }
>>>>>        }
>>>>> @@ -1330,7 +1361,7 @@ static struct page *mp_huge_alloc_pages(struct page_pool *pool, gfp_t gfp)
>>>>>                        continue;
>>>>>
>>>>>                if ((page->pp_magic & ~0x3UL) == PP_SIGNATURE ||
>>>>> -                 page_ref_count(page) != 1) {
>>>>> +                 page_pool_page_ref_count(page) != 1) {
>>>>>                        atomic_inc(&mp_huge_ins_b);
>>>>>                        continue;
>>>>>                }
>>>>> @@ -1458,9 +1489,9 @@ static void mp_huge_1g_destroy(struct page_pool *pool)
>>>>>        free = true;
>>>>>        for (i = 0; i < MP_HUGE_1G_CNT; i++) {
>>>>>                page = hu->page + i;
>>>>> -             if (page_ref_count(page) != 1) {
>>>>> +             if (page_pool_page_ref_count(page) != 1) {
>>>>>                        pr_warn("Page with ref count %d at %u. Can't safely destory, leaking memory!\n",
>>>>> -                             page_ref_count(page), i);
>>>>> +                             page_pool_page_ref_count(page), i);
>>>>>                        free = false;
>>>>>                        break;
>>>>>                }
>>>>> @@ -1489,7 +1520,7 @@ static struct page *mp_huge_1g_alloc_pages(struct page_pool *pool, gfp_t gfp)
>>>>>                page = hu->page + page_i;
>>>>>
>>>>>                if ((page->pp_magic & ~0x3UL) == PP_SIGNATURE ||
>>>>> -                 page_ref_count(page) != 1) {
>>>>> +                 page_pool_page_ref_count(page) != 1) {
>>>>>                        atomic_inc(&mp_huge_ins_b);
>>>>>                        continue;
>>>>>                }
>>>>> --
>>>>> 2.41.0.640.ga95def55d0-goog
>>>>>
>>>>
>>>
>>
> 
> 
> --
> Thanks,
> Mina

