Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33C6177852C
	for <lists+linux-media@lfdr.de>; Fri, 11 Aug 2023 03:56:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232940AbjHKB4T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Aug 2023 21:56:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232956AbjHKB4R (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Aug 2023 21:56:17 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64E8F2D65
        for <linux-media@vger.kernel.org>; Thu, 10 Aug 2023 18:56:15 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3a7d7de894bso761353b6e.3
        for <linux-media@vger.kernel.org>; Thu, 10 Aug 2023 18:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691718974; x=1692323774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mqDMd21x5Nw96iPHGkI0RJ5xZ0W3r4jhzlUa6V573CQ=;
        b=AhQxtYBJrsxK+7NKZqT1FFzg07DV6Zl5qR1axM8dEeSnftLyB5X8SQrgmunzDbsoxB
         pt548p3xvkZ6bcQjKoWZGfPB2ekRQzpLlzBI+M+7r1fVNQYFoyV5sSyYkjAJQ7GaKX5+
         pVD8pOnJHmyww1Ebm4vq5NncPbD1aW8Nrnc3wrGY9HhAyikAOsPICZSManPP7feVArVE
         wZSu/P+nN0mqXH//pE2oHM+WWTs/g/VDm2byxVIBz1BNhrVcdBk+6i1qUHwCFL4uVKf1
         qwqyN5yyxGefaBym1eGcyFLHKLxy3PNZ4A9Pq9V9LtSSRwZ6AZQT/crnbWx3X5ju4ncU
         b/iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691718974; x=1692323774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mqDMd21x5Nw96iPHGkI0RJ5xZ0W3r4jhzlUa6V573CQ=;
        b=ZyxaVi1/YSxphZ6ZyakFBrfl61NfelXfdFq3zR4MJrReoDPq/27gI/5f9ZDZSR/H03
         /6DJAjnQ0wVF20z2ZwC4RjbkMJfMB97k3DUMAstIycjeflxzd+C2O8lFbC/h180zGv5u
         xy6xzssgrevRRvbSsWTuPduCQ4fV2A2e3OLDufd6liAIqR9rlkUrOZ+UYQFuZYet1veB
         uhVNhfmWiMew+nQQdRRmkT2eaWEomXR+F2e6uYT/dlfm9QLECXY/uVgusTsVh5kxOdFG
         kU0C3yw2Q4doovJlPTDEh6aafZv8yn+xmzNwe+PjvGgR8nS6avfuY9gbIvbXKfscLFbM
         gepw==
X-Gm-Message-State: AOJu0YxPyeZDLy2hRx9m4N1EdnVFpISBnA5lvn448SMDcd9QsHGsGJ2a
        TB+qHcwcYJpves/sqiSD0MFeonvXhLM2lbz8UmYwDQ==
X-Google-Smtp-Source: AGHT+IFuPSnhcOaqYFbMM/zHZKGGPqTcsm1m5KN1goTpSJR/hQoINBSAEckVNTY2vFQlBNO+tdeRz/rEkoJkrYGWj08=
X-Received: by 2002:a05:6358:949d:b0:132:d448:7b78 with SMTP id
 i29-20020a056358949d00b00132d4487b78mr817733rwb.27.1691718974376; Thu, 10 Aug
 2023 18:56:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230810015751.3297321-1-almasrymina@google.com>
 <1009bd5b-d577-ca7b-8eff-192ee89ad67d@amd.com> <CAHS8izPrOcrJpE1ysCM7rwHhBMPvj0vQwzfOyVqdxsVux8oMww@mail.gmail.com>
 <ZNUzW3X3P0JvL4nI@ziepe.ca>
In-Reply-To: <ZNUzW3X3P0JvL4nI@ziepe.ca>
From:   Mina Almasry <almasrymina@google.com>
Date:   Thu, 10 Aug 2023 18:56:03 -0700
Message-ID: <CAHS8izOVJGJH5WF68OsRWFKJid1_huzzUK+hpKbLcL4pSOD1Jw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 00/11] Device Memory TCP
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        netdev@vger.kernel.org, linux-media@vger.kernel.org,
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

On Thu, Aug 10, 2023 at 11:58=E2=80=AFAM Jason Gunthorpe <jgg@ziepe.ca> wro=
te:
>
> On Thu, Aug 10, 2023 at 11:44:53AM -0700, Mina Almasry wrote:
>
> > Someone will correct me if I'm wrong but I'm not sure netlink itself
> > will do (sufficient) access control. However I meant for the netlink
> > API to bind dma-bufs to be a CAP_NET_ADMIN API, and I forgot to add
> > this check in this proof-of-concept, sorry. I'll add a CAP_NET_ADMIN
> > check in netdev_bind_dmabuf_to_queue() in the next iteration.
>
> Can some other process that does not have the netlink fd manage to
> recv packets that were stored into the dmabuf?
>

The process needs to have the dma-buf fd to receive packets, and not
necessarily the netlink fd. It should be possible for:

1. a CAP_NET_ADMIN process to create a dma-buf, bind it using a
netlink fd, then share the dma-buf with another normal process that
receives packets on it.
2. a normal process to create a dma-buf, share it with a privileged
CAP_NET_ADMIN process that creates the binding via the netlink fd,
then the owner of the dma-buf can receive data on the dma-buf fd.
3. a CAP_NET_ADMIN creates the dma-buf and creates the binding itself
and receives data.

We in particular plan to use devmem TCP in the first mode, but this
detail is specific to us so I've largely neglected from describing it
in the cover letter. If our setup is interesting:
the CAP_NET_ADMIN process I describe in #1 is a 'tcpdevmem daemon'
which allocates the GPU memory, creates a dma-buf, creates an RX queue
binding, and shares the dma-buf with the ML application(s) running on
our instance. The ML application receives data on the dma-buf via
recvmsg().

The 'tcpdevmem daemon' takes care of the binding but also configures
RSS & flow steering. The dma-buf fd sharing happens over a unix domain
socket.

--=20
Thanks,
Mina
