Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BE41781A62
	for <lists+linux-media@lfdr.de>; Sat, 19 Aug 2023 17:49:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233480AbjHSPtb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 19 Aug 2023 11:49:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231128AbjHSPta (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 19 Aug 2023 11:49:30 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 262D793D2
        for <linux-media@vger.kernel.org>; Sat, 19 Aug 2023 08:49:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 890D96153B
        for <linux-media@vger.kernel.org>; Sat, 19 Aug 2023 15:49:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFD7DC433C8;
        Sat, 19 Aug 2023 15:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692460167;
        bh=4qO2TKe+JtxdYEN0vYLbOUcl+03xb9YiWQE8u45JpRQ=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=BBlRLjBN8ssR+RRdtfiEde1Sku5C9uMcwzHMaTT9BzNuMe/v/p0M3iTif3Ksb/8VJ
         PJmkxX5VfxW4/ygnF1aLqS/Jw+ddR9IYtAD/gbvpgfi41B2MSCPfl7RMtM+Q1/lY6i
         wdiHQHPnBS49C4L6GyfJd83CED819QS4J+Q0IMi3JvSzDCE6ebvV/WpqXLyWsVCmHf
         saGXYyaNMGx/bgDsHdf402S7UpzZf9IbrsexeYLz73KtFffQgdUKLQzxYLSAl8LiRS
         IAQ6F1smE/Wr5UoQaz9MALmCpDJebPyXVelo7b5mNzHQ/nX8q6X1f5k2vHG+ZCkQVt
         U+isT+CXuoQlQ==
Message-ID: <4f19143d-5975-05d4-3697-0218ed2881c6@kernel.org>
Date:   Sat, 19 Aug 2023 09:49:25 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [RFC PATCH v2 06/11] page-pool: add device memory support
Content-Language: en-US
To:     Jesper Dangaard Brouer <jbrouer@redhat.com>,
        Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc:     brouer@redhat.com, Mina Almasry <almasrymina@google.com>,
        netdev@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
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
From:   David Ahern <dsahern@kernel.org>
In-Reply-To: <8f4d276e-470d-6ce8-85d5-a6c08fa22147@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/19/23 9:22 AM, Jesper Dangaard Brouer wrote:
> 
> I do see the problem of depending on having a struct page, as the
> page_pool_iov isn't related to struct page.  Having "page" in the name
> of "page_pool_iov" is also confusing (hardest problem is CS is naming,
> as we all know).
> 
> To support more allocator types, perhaps skb->pp_recycle bit need to
> grow another bit (and be renamed skb->recycle), so we can tell allocator
> types apart, those that are page based and those whom are not.
> 
> 
>> I think the feedback has been strong to not multiplex yet another
>> memory type into that struct, that is not a real page. Which is why
>> we went into this direction. This latest series limits the impact largely
>> to networking structures and code.
>>
> 
> Some what related what I'm objecting to: the "page_pool_iov" is not a
> real page, but this getting recycled into something called "page_pool",
> which funny enough deals with struct-pages internally and depend on the
> struct-page-refcnt.
> 
> Given the approach changed way from using struct page, then I also don't
> see the connection with the page_pool. Sorry.

I do not care for the page_pool_iov name either; I presumed it was least
change to prove an idea and the name and details would evolve.

How about something like buffer_pool or netdev_buf_pool that can operate
with either pages, dma addresses, or something else in the future?

> 
>> As for the LSB trick: that avoided adding a lot of boilerplate churn
>> with new type and helper functions.
>>
> 
> Says the lazy programmer :-P ... sorry could not resist ;-)

Use of the LSB (or bits depending on alignment expectations) is a common
trick and already done in quite a few places in the networking stack.
This trick is essential to any realistic change here to incorporate gpu
memory; way too much code will have unnecessary churn without it.

I do prefer my earlier suggestion though where the skb_frag_t has a
union of relevant types though. Instead of `struct page *page` it could
be `void *addr` with the helpers indicating page, iov, or other.

