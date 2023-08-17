Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 304267800F6
	for <lists+linux-media@lfdr.de>; Fri, 18 Aug 2023 00:19:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355698AbjHQWS6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Aug 2023 18:18:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355700AbjHQWSs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Aug 2023 18:18:48 -0400
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94F6030C5
        for <linux-media@vger.kernel.org>; Thu, 17 Aug 2023 15:18:47 -0700 (PDT)
Received: by mail-vs1-xe2a.google.com with SMTP id ada2fe7eead31-44768e056e1so97081137.1
        for <linux-media@vger.kernel.org>; Thu, 17 Aug 2023 15:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692310726; x=1692915526;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i90jKdNjvYHfOh8lmPDp40Qdp095YCdh1Oy/+Cvt5J4=;
        b=nzRIbPr05yBxns7Ih/cfXcZJ30f+k1kQZlBxBe2yWnkmc9ysAOdx9pXxuvy5SYpvc3
         +u0MfgV71NhJualJhPYe5Xad/yI7An051nCYOvcshM/+JCtph42QKThML1xR1ERXrVZY
         2s5552xNfD1RblGd5AXsfUZ7n5qvSTZRRt/XBYLmDnMK/fG1nMyQvbYOVtS9QvXKNXGg
         BQjS8494d4cFQvMCgONrVePKljTc3VA88SfKjYSzbJrRYBZOLecuxu78FCpdwew70Kx1
         UxejfnKPH+oYpEzqUDKLHzrUqaTCuHDXvKolh445LRugaIAwVaRw2/Gr6+ssL9DLVr/0
         VeMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692310726; x=1692915526;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i90jKdNjvYHfOh8lmPDp40Qdp095YCdh1Oy/+Cvt5J4=;
        b=aP68TC4VW5o/Fn1UIGllW/wa0sWexxuYTn2EGZqfFhwjoifUks31UygzX5l+KNmnS/
         wW4K9ynU6K6d9SjsaRD/UsejYELIjJzJPll457QxTT87L5hy4K3QQakq2rUCIaMQdX91
         HqFeqzzHcPH18CS7LqUirWN5U63a7Ioq5lGRGo0IpJb+sHXAZE/aG0FFnRVOcm0Ay2eb
         gxiBaOLnA4/3WUhqrohnfOsMto9bLNyrs+2Jz9CU4/7di0ziS1RSVZJ889l33BpKzq4N
         iwpsMu0zK/q2EZm4dpOgcSY898GluG9YV1/c3sMIsJclA6jqLGH9a9oPKdRqsbdz2iFG
         r+yw==
X-Gm-Message-State: AOJu0Yxuanr8VcCaOeNG6Dkk8U1KO6TXqADdhbEb3/VO/VS7aKBtdNGC
        mNoUsJDJ5eWHPgDLZWj9WPc+QkAVFH/xcSR4dGulpA==
X-Google-Smtp-Source: AGHT+IHxiahQBibd9E5tQcywrVqF/Dce4Pc5zTgH7kI9+WMihsI2390MeC2HVHwqce1iFLC7pwbzbsRWAEGIIPh2JH8=
X-Received: by 2002:a67:f343:0:b0:447:4cb2:74fd with SMTP id
 p3-20020a67f343000000b004474cb274fdmr1190943vsm.8.1692310726590; Thu, 17 Aug
 2023 15:18:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230810015751.3297321-1-almasrymina@google.com>
 <7dc4427f-ee99-e401-9ff8-d554999e60ca@kernel.org> <7889b4f8-78d9-9a0a-e2cc-aae4ed8a80fd@gmail.com>
In-Reply-To: <7889b4f8-78d9-9a0a-e2cc-aae4ed8a80fd@gmail.com>
From:   Mina Almasry <almasrymina@google.com>
Date:   Thu, 17 Aug 2023 15:18:35 -0700
Message-ID: <CAHS8izNZ1pJAFqa-3FPiUdMWEPE_md2vP1-6t-KPT6CPbO03+g@mail.gmail.com>
Subject: Re: [RFC PATCH v2 00/11] Device Memory TCP
To:     Pavel Begunkov <asml.silence@gmail.com>
Cc:     David Ahern <dsahern@kernel.org>, netdev@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
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
        sdf@google.com, David Wei <dw@davidwei.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 17, 2023 at 11:04=E2=80=AFAM Pavel Begunkov <asml.silence@gmail=
.com> wrote:
>
> On 8/14/23 02:12, David Ahern wrote:
> > On 8/9/23 7:57 PM, Mina Almasry wrote:
> >> Changes in RFC v2:
> >> ------------------
> ...
> >> ** Test Setup
> >>
> >> Kernel: net-next with this RFC and memory provider API cherry-picked
> >> locally.
> >>
> >> Hardware: Google Cloud A3 VMs.
> >>
> >> NIC: GVE with header split & RSS & flow steering support.
> >
> > This set seems to depend on Jakub's memory provider patches and a netde=
v
> > driver change which is not included. For the testing mentioned here, yo=
u
> > must have a tree + branch with all of the patches. Is it publicly avail=
able?
> >
> > It would be interesting to see how well (easy) this integrates with
> > io_uring. Besides avoiding all of the syscalls for receiving the iov an=
d
> > releasing the buffers back to the pool, io_uring also brings in the
> > ability to seed a page_pool with registered buffers which provides a
> > means to get simpler Rx ZC for host memory.
>
> The patchset sounds pretty interesting. I've been working with David Wei
> (CC'ing) on io_uring zc rx (prototype polishing stage) all that is old
> similar approaches based on allocating an rx queue. It targets host
> memory and device memory as an extra feature, uapi is different, lifetime=
s
> are managed/bound to io_uring. Completions/buffers are returned to user v=
ia
> a separate queue instead of cmsg, and pushed back granularly to the kerne=
l
> via another queue. I'll leave it to David to elaborate
>
> It sounds like we have space for collaboration here, if not merging then
> reusing internals as much as we can, but we'd need to look into the
> details deeper.
>

I'm happy to look at your implementation and collaborate on something
that works for both use cases. Feel free to share unpolished prototype
so I can start having a general idea if possible.

> > Overall I like the intent and possibilities for extensions, but a lot o=
f
> > details are missing - perhaps some are answered by seeing an end-to-end
> > implementation.
>
> --
> Pavel Begunkov



--=20
Thanks,
Mina
