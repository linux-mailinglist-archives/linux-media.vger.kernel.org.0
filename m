Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 748B477AF6A
	for <lists+linux-media@lfdr.de>; Mon, 14 Aug 2023 04:12:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231812AbjHNCLw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Aug 2023 22:11:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231696AbjHNCLR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Aug 2023 22:11:17 -0400
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AC22E63
        for <linux-media@vger.kernel.org>; Sun, 13 Aug 2023 19:11:16 -0700 (PDT)
Received: by mail-vs1-xe2d.google.com with SMTP id ada2fe7eead31-44756c21105so2530909137.1
        for <linux-media@vger.kernel.org>; Sun, 13 Aug 2023 19:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691979075; x=1692583875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gTisJfmxpiQjRZepraPBBUqLn8hEMFr6WrBeDd6EuoA=;
        b=F0iWnHAw+V1aSjQSG8od9J+DIiu1SgbyKMFElPfHVlHhrWQ1dpHkWFZxgK9EIYY7ey
         q5EXKZput4xCaBR6tL4xkQZjBNm9vE7bHBkhCgkXhXkpx4yo7rK75t4KDvUR7XZzHSk4
         4IB17VEnsGMDh1yCCADSRMzBOa2T0V9QSuNVKFVWUPXwJIiXyb4nNN/uzoGwegiL/lFS
         0g5JdALTntiHrpm1KSLVGu3hqOD6ArcklRiB1ZB6adnzkIhPivUNj8HZX9AcHn2jcPQb
         B4y5zWPPgqkalg+85T4kat7WtYeUTyYBDUoE3c5dX81EAXmglT3ThUmhb5ZJv1HFjrGQ
         py0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691979075; x=1692583875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gTisJfmxpiQjRZepraPBBUqLn8hEMFr6WrBeDd6EuoA=;
        b=W6jNrxTOX0VIwkGrG9l2bt5NDw3oSet2MNX5InPOeQ9XN9yMuDbujlG+fOy3vcBy5i
         2Mhf4elnnM9wrTUVeOHcvSR8pDazROwLU3iaEefdcpUZ/oJK5i6Tl8uMl9ANzE0XL5pe
         4jAa3ftr4xjclsyZ/HzMRj4NH5345bi1IoETLtmkdsVuS3n0CbKgwmIpzKRLK6fHWFLq
         LWz77azAlniPSUkL9UMWYJUXT2MU80In42icx4dptr5fbyGhDR1bEX1MAWRrABFXjM8l
         ZXZvCOcOo52tgrXSXcfB4J9S+9crWRy1KAA7tsGGzMJIvP/mN0Ylhf9xRaRkEcTzVjcU
         Mg4w==
X-Gm-Message-State: AOJu0Yx7uz2xoAyYTNWN0mrTJZEzukAmGpnJ3FMuoPlhnoe+axKO+zWb
        YBxH1ZHKrifroRl/dXXNmiQ1TXLZOyYIvoXLENgFpA==
X-Google-Smtp-Source: AGHT+IF1rPP9x6xLGMyBgWC+RTyq65mADE5uBMIBOqR3Bb/YApLc+KhXpnEEMzsyY2RXUTmG4ClbCwLYyw7MPbLOHJ0=
X-Received: by 2002:a05:6102:2759:b0:447:695c:75b8 with SMTP id
 p25-20020a056102275900b00447695c75b8mr9799892vsu.7.1691979074945; Sun, 13 Aug
 2023 19:11:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230810015751.3297321-1-almasrymina@google.com> <7dc4427f-ee99-e401-9ff8-d554999e60ca@kernel.org>
In-Reply-To: <7dc4427f-ee99-e401-9ff8-d554999e60ca@kernel.org>
From:   Mina Almasry <almasrymina@google.com>
Date:   Sun, 13 Aug 2023 19:11:03 -0700
Message-ID: <CAHS8izMHsipF1VEKUy4cGUNvVjXNLzOM1H470U_u1pCozH3m8A@mail.gmail.com>
Subject: Re: [RFC PATCH v2 00/11] Device Memory TCP
To:     David Ahern <dsahern@kernel.org>
Cc:     netdev@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
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
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Aug 13, 2023 at 6:12=E2=80=AFPM David Ahern <dsahern@kernel.org> wr=
ote:
>
> On 8/9/23 7:57 PM, Mina Almasry wrote:
> > Changes in RFC v2:
> > ------------------
> >
> > The sticking point in RFC v1[1] was the dma-buf pages approach we used =
to
> > deliver the device memory to the TCP stack. RFC v2 is a proof-of-concep=
t
> > that attempts to resolve this by implementing scatterlist support in th=
e
> > networking stack, such that we can import the dma-buf scatterlist
> > directly. This is the approach proposed at a high level here[2].
> >
> > Detailed changes:
> > 1. Replaced dma-buf pages approach with importing scatterlist into the
> >    page pool.
> > 2. Replace the dma-buf pages centric API with a netlink API.
> > 3. Removed the TX path implementation - there is no issue with
> >    implementing the TX path with scatterlist approach, but leaving
> >    out the TX path makes it easier to review.
> > 4. Functionality is tested with this proposal, but I have not conducted
> >    perf testing yet. I'm not sure there are regressions, but I removed
> >    perf claims from the cover letter until they can be re-confirmed.
> > 5. Added Signed-off-by: contributors to the implementation.
> > 6. Fixed some bugs with the RX path since RFC v1.
> >
> > Any feedback welcome, but specifically the biggest pending questions
> > needing feedback IMO are:
> >
> > 1. Feedback on the scatterlist-based approach in general.
> > 2. Netlink API (Patch 1 & 2).
> > 3. Approach to handle all the drivers that expect to receive pages from
> >    the page pool (Patch 6).
> >
> > [1] https://lore.kernel.org/netdev/dfe4bae7-13a0-3c5d-d671-f61b375cb0b4=
@gmail.com/T/
> > [2] https://lore.kernel.org/netdev/CAHS8izPm6XRS54LdCDZVd0C75tA1zHSu6jL=
VO8nzTLXCc=3DH7Nw@mail.gmail.com/
> >
> > ----------------------
> >
> > * TL;DR:
> >
> > Device memory TCP (devmem TCP) is a proposal for transferring data to a=
nd/or
> > from device memory efficiently, without bouncing the data to a host mem=
ory
> > buffer.
> >
> > * Problem:
> >
> > A large amount of data transfers have device memory as the source and/o=
r
> > destination. Accelerators drastically increased the volume of such tran=
sfers.
> > Some examples include:
> > - ML accelerators transferring large amounts of training data from stor=
age into
> >   GPU/TPU memory. In some cases ML training setup time can be as long a=
s 50% of
> >   TPU compute time, improving data transfer throughput & efficiency can=
 help
> >   improving GPU/TPU utilization.
> >
> > - Distributed training, where ML accelerators, such as GPUs on differen=
t hosts,
> >   exchange data among them.
> >
> > - Distributed raw block storage applications transfer large amounts of =
data with
> >   remote SSDs, much of this data does not require host processing.
> >
> > Today, the majority of the Device-to-Device data transfers the network =
are
> > implemented as the following low level operations: Device-to-Host copy,
> > Host-to-Host network transfer, and Host-to-Device copy.
> >
> > The implementation is suboptimal, especially for bulk data transfers, a=
nd can
> > put significant strains on system resources, such as host memory bandwi=
dth,
> > PCIe bandwidth, etc. One important reason behind the current state is t=
he
> > kernel=E2=80=99s lack of semantics to express device to network transfe=
rs.
> >
> > * Proposal:
> >
> > In this patch series we attempt to optimize this use case by implementi=
ng
> > socket APIs that enable the user to:
> >
> > 1. send device memory across the network directly, and
> > 2. receive incoming network packets directly into device memory.
> >
> > Packet _payloads_ go directly from the NIC to device memory for receive=
 and from
> > device memory to NIC for transmit.
> > Packet _headers_ go to/from host memory and are processed by the TCP/IP=
 stack
> > normally. The NIC _must_ support header split to achieve this.
> >
> > Advantages:
> >
> > - Alleviate host memory bandwidth pressure, compared to existing
> >  network-transfer + device-copy semantics.
> >
> > - Alleviate PCIe BW pressure, by limiting data transfer to the lowest l=
evel
> >   of the PCIe tree, compared to traditional path which sends data throu=
gh the
> >   root complex.
> >
> > * Patch overview:
> >
> > ** Part 1: netlink API
> >
> > Gives user ability to bind dma-buf to an RX queue.
> >
> > ** Part 2: scatterlist support
> >
> > Currently the standard for device memory sharing is DMABUF, which doesn=
't
> > generate struct pages. On the other hand, networking stack (skbs, drive=
rs, and
> > page pool) operate on pages. We have 2 options:
> >
> > 1. Generate struct pages for dmabuf device memory, or,
> > 2. Modify the networking stack to process scatterlist.
> >
> > Approach #1 was attempted in RFC v1. RFC v2 implements approach #2.
> >
> > ** part 3: page pool support
> >
> > We piggy back on page pool memory providers proposal:
> > https://github.com/kuba-moo/linux/tree/pp-providers
> >
> > It allows the page pool to define a memory provider that provides the
> > page allocation and freeing. It helps abstract most of the device memor=
y
> > TCP changes from the driver.
> >
> > ** part 4: support for unreadable skb frags
> >
> > Page pool iovs are not accessible by the host; we implement changes
> > throughput the networking stack to correctly handle skbs with unreadabl=
e
> > frags.
> >
> > ** Part 5: recvmsg() APIs
> >
> > We define user APIs for the user to send and receive device memory.
> >
> > Not included with this RFC is the GVE devmem TCP support, just to
> > simplify the review. Code available here if desired:
> > https://github.com/mina/linux/tree/tcpdevmem
> >
> > This RFC is built on top of net-next with Jakub's pp-providers changes
> > cherry-picked.
> >
> > * NIC dependencies:
> >
> > 1. (strict) Devmem TCP require the NIC to support header split, i.e. th=
e
> >    capability to split incoming packets into a header + payload and to =
put
> >    each into a separate buffer. Devmem TCP works by using device memory
> >    for the packet payload, and host memory for the packet headers.
> >
> > 2. (optional) Devmem TCP works better with flow steering support & RSS =
support,
> >    i.e. the NIC's ability to steer flows into certain rx queues. This a=
llows the
> >    sysadmin to enable devmem TCP on a subset of the rx queues, and stee=
r
> >    devmem TCP traffic onto these queues and non devmem TCP elsewhere.
> >
> > The NIC I have access to with these properties is the GVE with DQO supp=
ort
> > running in Google Cloud, but any NIC that supports these features would=
 suffice.
> > I may be able to help reviewers bring up devmem TCP on their NICs.
> >
> > * Testing:
> >
> > The series includes a udmabuf kselftest that show a simple use case of
> > devmem TCP and validates the entire data path end to end without
> > a dependency on a specific dmabuf provider.
> >
> > ** Test Setup
> >
> > Kernel: net-next with this RFC and memory provider API cherry-picked
> > locally.
> >
> > Hardware: Google Cloud A3 VMs.
> >
> > NIC: GVE with header split & RSS & flow steering support.
>
> This set seems to depend on Jakub's memory provider patches and a netdev
> driver change which is not included. For the testing mentioned here, you
> must have a tree + branch with all of the patches. Is it publicly availab=
le?
>

Yes, the net-next based branch is right here:
https://github.com/mina/linux/tree/tcpdevmem

Here is the git log of that branch:
https://github.com/mina/linux/commits/tcpdevmem

FWIW, it's already linked from the (long) cover letter, at the end of
the '* Patch overview:' section.

The branch includes all you mentioned above. The netdev driver I'm
using in the GVE. It also includes patches to implement header split &
flow steering for GVE (being upstreamed separately), and some debug
changes.

> It would be interesting to see how well (easy) this integrates with
> io_uring. Besides avoiding all of the syscalls for receiving the iov and
> releasing the buffers back to the pool, io_uring also brings in the
> ability to seed a page_pool with registered buffers which provides a
> means to get simpler Rx ZC for host memory.
>
> Overall I like the intent and possibilities for extensions, but a lot of
> details are missing - perhaps some are answered by seeing an end-to-end
> implementation.

--=20
Thanks,
Mina
