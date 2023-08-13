Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 051B377A62E
	for <lists+linux-media@lfdr.de>; Sun, 13 Aug 2023 13:27:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbjHML0y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Aug 2023 07:26:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjHML0y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Aug 2023 07:26:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FEBEE6A
        for <linux-media@vger.kernel.org>; Sun, 13 Aug 2023 04:26:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2E9C8622EA
        for <linux-media@vger.kernel.org>; Sun, 13 Aug 2023 11:26:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B695DC433C8;
        Sun, 13 Aug 2023 11:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691926015;
        bh=rlKj/mDDGKn6pmmyFelrGiNR0L9ITP4m+ZN6VYvbJrk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WolvVV7Zms7r1VD9RiBM/rRhIdlsuIc+RDBfAAsVZQOvqR8GFnNCviUepG/8k5esh
         cRDFzp0mefIay1+vX9Cp+hTbcM6uQ4XUtvijYAGwGxLRoPIVwg02EMPBClWK7YX1xE
         54mRg9S4jibe2lwVDP0maXvF7P+S4Z4tpVTVOu1lzekdL968uq8RcsanpDcZ+4ccQ2
         HqbGbZPx/eC/Z++o6cZPXHD4tPqHj+HXJ9SbxfUf+JikicgY7TFdaLEuxNf8tSZOGX
         iQ45e7TYh2ZhNerrY3mlc9bfYrVjsQ0bI5MPLOUXEYyAFcBYKaMZ1+V4+dSAWYLgzR
         GK2ozQYZzH0Kw==
Date:   Sun, 13 Aug 2023 14:26:50 +0300
From:   Leon Romanovsky <leon@kernel.org>
To:     Mina Almasry <almasrymina@google.com>
Cc:     netdev@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
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
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Hari Ramakrishnan <rharix@google.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Andy Lutomirski <luto@kernel.org>, stephen@networkplumber.org,
        sdf@google.com, Willem de Bruijn <willemb@google.com>,
        Kaiyuan Zhang <kaiyuanz@google.com>
Subject: Re: [RFC PATCH v2 02/11] netdev: implement netlink api to bind
 dma-buf to netdevice
Message-ID: <20230813112650.GK7707@unreal>
References: <20230810015751.3297321-1-almasrymina@google.com>
 <20230810015751.3297321-3-almasrymina@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230810015751.3297321-3-almasrymina@google.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Aug 09, 2023 at 06:57:38PM -0700, Mina Almasry wrote:
> Add a netdev_dmabuf_binding struct which represents the
> dma-buf-to-netdevice binding. The netlink API will bind the dma-buf to
> an rx queue on the netdevice. On the binding, the dma_buf_attach
> & dma_buf_map_attachment will occur. The entries in the sg_table from
> mapping will be inserted into a genpool to make it ready
> for allocation.
> 
> The chunks in the genpool are owned by a dmabuf_chunk_owner struct which
> holds the dma-buf offset of the base of the chunk and the dma_addr of
> the chunk. Both are needed to use allocations that come from this chunk.
> 
> We create a new type that represents an allocation from the genpool:
> page_pool_iov. We setup the page_pool_iov allocation size in the
> genpool to PAGE_SIZE for simplicity: to match the PAGE_SIZE normally
> allocated by the page pool and given to the drivers.
> 
> The user can unbind the dmabuf from the netdevice by closing the netlink
> socket that established the binding. We do this so that the binding is
> automatically unbound even if the userspace process crashes.
> 
> The binding and unbinding leaves an indicator in struct netdev_rx_queue
> that the given queue is bound, but the binding doesn't take effect until
> the driver actually reconfigures its queues, and re-initializes its page
> pool. This issue/weirdness is highlighted in the memory provider
> proposal[1], and I'm hoping that some generic solution for all
> memory providers will be discussed; this patch doesn't address that
> weirdness again.
> 
> The netdev_dmabuf_binding struct is refcounted, and releases its
> resources only when all the refs are released.
> 
> [1] https://lore.kernel.org/netdev/20230707183935.997267-1-kuba@kernel.org/
> 
> Signed-off-by: Willem de Bruijn <willemb@google.com>
> Signed-off-by: Kaiyuan Zhang <kaiyuanz@google.com>
> 
> Signed-off-by: Mina Almasry <almasrymina@google.com>
> ---
>  include/linux/netdevice.h |  57 ++++++++++++
>  include/net/page_pool.h   |  27 ++++++
>  net/core/dev.c            | 178 ++++++++++++++++++++++++++++++++++++++
>  net/core/netdev-genl.c    | 101 ++++++++++++++++++++-
>  4 files changed, 361 insertions(+), 2 deletions(-)

<...>

> +void __netdev_devmem_binding_free(struct netdev_dmabuf_binding *binding);
> +
> +static inline void
> +netdev_devmem_binding_get(struct netdev_dmabuf_binding *binding)
> +{
> +	refcount_inc(&binding->ref);
> +}
> +
> +static inline void
> +netdev_devmem_binding_put(struct netdev_dmabuf_binding *binding)
> +{
> +	if (!refcount_dec_and_test(&binding->ref))
> +		return;
> +
> +	__netdev_devmem_binding_free(binding);
> +}

Not a big deal, but it looks like reimplemented version of kref_get/kref_put to me.

Thanks
