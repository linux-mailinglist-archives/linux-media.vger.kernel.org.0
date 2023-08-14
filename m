Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE4FE77AF1E
	for <lists+linux-media@lfdr.de>; Mon, 14 Aug 2023 03:12:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231538AbjHNBMZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Aug 2023 21:12:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231683AbjHNBMP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Aug 2023 21:12:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16DBFE6E
        for <linux-media@vger.kernel.org>; Sun, 13 Aug 2023 18:12:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9895160C91
        for <linux-media@vger.kernel.org>; Mon, 14 Aug 2023 01:12:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39D93C433C7;
        Mon, 14 Aug 2023 01:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691975533;
        bh=9VmNP//lo6krJ4UVemGc8B7elfG1YBal7KVLxUKr6oE=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=pzMQSV/deIuoT/LVXcBvjDat2UZZQokL0BkjbbHxeGGclUPOHwE6/VT6Vqr6TVmRc
         +v+Iq76yIImXcZT6+9KNOgE8dTMxSfpeQPN15p0FT65OVBbjnxrBpa9FA2ic5+2Rt1
         /Dpy/4+j+cGB3OR6slbD9hW7txwkOsV1siFW3xFeE141bz+O0bz6NVkqVMvVCgdeas
         Zcq2coo2Djw38mJmFA73TUAmUcki+jOk+aenNVFCRoRfVzaPdDdSEgcUHKretcNznB
         3PAG09eR6ALnTEv4xqyBpTxHehPiNS1Wweai7IGzvQaHLSFangn29l6HEcBRMF0o6U
         8BTfQaZdBKQTQ==
Message-ID: <7dc4427f-ee99-e401-9ff8-d554999e60ca@kernel.org>
Date:   Sun, 13 Aug 2023 19:12:11 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [RFC PATCH v2 00/11] Device Memory TCP
Content-Language: en-US
To:     Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Hari Ramakrishnan <rharix@google.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Andy Lutomirski <luto@kernel.org>, stephen@networkplumber.org,
        sdf@google.com
References: <20230810015751.3297321-1-almasrymina@google.com>
From:   David Ahern <dsahern@kernel.org>
In-Reply-To: <20230810015751.3297321-1-almasrymina@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-11.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/9/23 7:57 PM, Mina Almasry wrote:
> Changes in RFC v2:
> ------------------
> 
> The sticking point in RFC v1[1] was the dma-buf pages approach we used to
> deliver the device memory to the TCP stack. RFC v2 is a proof-of-concept
> that attempts to resolve this by implementing scatterlist support in the
> networking stack, such that we can import the dma-buf scatterlist
> directly. This is the approach proposed at a high level here[2].
> 
> Detailed changes:
> 1. Replaced dma-buf pages approach with importing scatterlist into the
>    page pool.
> 2. Replace the dma-buf pages centric API with a netlink API.
> 3. Removed the TX path implementation - there is no issue with
>    implementing the TX path with scatterlist approach, but leaving
>    out the TX path makes it easier to review.
> 4. Functionality is tested with this proposal, but I have not conducted
>    perf testing yet. I'm not sure there are regressions, but I removed
>    perf claims from the cover letter until they can be re-confirmed.
> 5. Added Signed-off-by: contributors to the implementation.
> 6. Fixed some bugs with the RX path since RFC v1.
> 
> Any feedback welcome, but specifically the biggest pending questions
> needing feedback IMO are:
> 
> 1. Feedback on the scatterlist-based approach in general.
> 2. Netlink API (Patch 1 & 2).
> 3. Approach to handle all the drivers that expect to receive pages from
>    the page pool (Patch 6).
> 
> [1] https://lore.kernel.org/netdev/dfe4bae7-13a0-3c5d-d671-f61b375cb0b4@gmail.com/T/
> [2] https://lore.kernel.org/netdev/CAHS8izPm6XRS54LdCDZVd0C75tA1zHSu6jLVO8nzTLXCc=H7Nw@mail.gmail.com/
> 
> ----------------------
> 
> * TL;DR:
> 
> Device memory TCP (devmem TCP) is a proposal for transferring data to and/or
> from device memory efficiently, without bouncing the data to a host memory
> buffer.
> 
> * Problem:
> 
> A large amount of data transfers have device memory as the source and/or
> destination. Accelerators drastically increased the volume of such transfers.
> Some examples include:
> - ML accelerators transferring large amounts of training data from storage into
>   GPU/TPU memory. In some cases ML training setup time can be as long as 50% of
>   TPU compute time, improving data transfer throughput & efficiency can help
>   improving GPU/TPU utilization.
> 
> - Distributed training, where ML accelerators, such as GPUs on different hosts,
>   exchange data among them.
> 
> - Distributed raw block storage applications transfer large amounts of data with
>   remote SSDs, much of this data does not require host processing.
> 
> Today, the majority of the Device-to-Device data transfers the network are
> implemented as the following low level operations: Device-to-Host copy,
> Host-to-Host network transfer, and Host-to-Device copy.
> 
> The implementation is suboptimal, especially for bulk data transfers, and can
> put significant strains on system resources, such as host memory bandwidth,
> PCIe bandwidth, etc. One important reason behind the current state is the
> kernel’s lack of semantics to express device to network transfers.
> 
> * Proposal:
> 
> In this patch series we attempt to optimize this use case by implementing
> socket APIs that enable the user to:
> 
> 1. send device memory across the network directly, and
> 2. receive incoming network packets directly into device memory.
> 
> Packet _payloads_ go directly from the NIC to device memory for receive and from
> device memory to NIC for transmit.
> Packet _headers_ go to/from host memory and are processed by the TCP/IP stack
> normally. The NIC _must_ support header split to achieve this.
> 
> Advantages:
> 
> - Alleviate host memory bandwidth pressure, compared to existing
>  network-transfer + device-copy semantics.
> 
> - Alleviate PCIe BW pressure, by limiting data transfer to the lowest level
>   of the PCIe tree, compared to traditional path which sends data through the
>   root complex.
> 
> * Patch overview:
> 
> ** Part 1: netlink API
> 
> Gives user ability to bind dma-buf to an RX queue.
> 
> ** Part 2: scatterlist support
> 
> Currently the standard for device memory sharing is DMABUF, which doesn't
> generate struct pages. On the other hand, networking stack (skbs, drivers, and
> page pool) operate on pages. We have 2 options:
> 
> 1. Generate struct pages for dmabuf device memory, or,
> 2. Modify the networking stack to process scatterlist.
> 
> Approach #1 was attempted in RFC v1. RFC v2 implements approach #2.
> 
> ** part 3: page pool support
> 
> We piggy back on page pool memory providers proposal:
> https://github.com/kuba-moo/linux/tree/pp-providers
> 
> It allows the page pool to define a memory provider that provides the
> page allocation and freeing. It helps abstract most of the device memory
> TCP changes from the driver.
> 
> ** part 4: support for unreadable skb frags
> 
> Page pool iovs are not accessible by the host; we implement changes
> throughput the networking stack to correctly handle skbs with unreadable
> frags.
> 
> ** Part 5: recvmsg() APIs
> 
> We define user APIs for the user to send and receive device memory.
> 
> Not included with this RFC is the GVE devmem TCP support, just to
> simplify the review. Code available here if desired:
> https://github.com/mina/linux/tree/tcpdevmem
> 
> This RFC is built on top of net-next with Jakub's pp-providers changes
> cherry-picked.
> 
> * NIC dependencies:
> 
> 1. (strict) Devmem TCP require the NIC to support header split, i.e. the
>    capability to split incoming packets into a header + payload and to put
>    each into a separate buffer. Devmem TCP works by using device memory
>    for the packet payload, and host memory for the packet headers.
> 
> 2. (optional) Devmem TCP works better with flow steering support & RSS support,
>    i.e. the NIC's ability to steer flows into certain rx queues. This allows the
>    sysadmin to enable devmem TCP on a subset of the rx queues, and steer
>    devmem TCP traffic onto these queues and non devmem TCP elsewhere.
> 
> The NIC I have access to with these properties is the GVE with DQO support
> running in Google Cloud, but any NIC that supports these features would suffice.
> I may be able to help reviewers bring up devmem TCP on their NICs.
> 
> * Testing:
> 
> The series includes a udmabuf kselftest that show a simple use case of
> devmem TCP and validates the entire data path end to end without
> a dependency on a specific dmabuf provider.
> 
> ** Test Setup
> 
> Kernel: net-next with this RFC and memory provider API cherry-picked
> locally.
> 
> Hardware: Google Cloud A3 VMs.
> 
> NIC: GVE with header split & RSS & flow steering support.

This set seems to depend on Jakub's memory provider patches and a netdev
driver change which is not included. For the testing mentioned here, you
must have a tree + branch with all of the patches. Is it publicly available?

It would be interesting to see how well (easy) this integrates with
io_uring. Besides avoiding all of the syscalls for receiving the iov and
releasing the buffers back to the pool, io_uring also brings in the
ability to seed a page_pool with registered buffers which provides a
means to get simpler Rx ZC for host memory.

Overall I like the intent and possibilities for extensions, but a lot of
details are missing - perhaps some are answered by seeing an end-to-end
implementation.
