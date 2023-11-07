Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81C957E4B89
	for <lists+linux-media@lfdr.de>; Tue,  7 Nov 2023 23:11:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235304AbjKGWLW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Nov 2023 17:11:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234389AbjKGWLJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Nov 2023 17:11:09 -0500
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com [IPv6:2607:f8b0:4864:20::935])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFED610FC
        for <linux-media@vger.kernel.org>; Tue,  7 Nov 2023 14:11:07 -0800 (PST)
Received: by mail-ua1-x935.google.com with SMTP id a1e0cc1a2514c-7b9dc92881eso2540505241.2
        for <linux-media@vger.kernel.org>; Tue, 07 Nov 2023 14:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699395067; x=1699999867; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GbbSAsuabIr4BwrZEqK8c8XYZufkR++Mr7B/MiPJA0o=;
        b=H2HecGuAWdWApGZBswfYfMpGXm37AHw0nDvVqm0SK9guPY+f0qGNJ0wkKZx8aLgTpo
         vBs3T24Ecqc0Wla336n8sIuuCmk1YdXARx9cbiod0i2TpLLJ7Nbkw8GApOJL16QliGH7
         FP9GGvHGIkMpUO15nRlrhFUyyLfiGzX2HpBos7EL/qmRRvxkLvHv8T0yGEOAh9PvqHs9
         Iq1B9Px5nVuxQ6JJp+2tone3XdgSZcvI3yM/DkdANDnWnk1FL3lVtXRgGTcT/UDbllZo
         91D44aUcO0xSc8+WM/cA0n0cNcar08uF69AgMMR9mRSw3ylGOJgpku2pqp9f3GQVGmT9
         N0pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699395067; x=1699999867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GbbSAsuabIr4BwrZEqK8c8XYZufkR++Mr7B/MiPJA0o=;
        b=ciTufI9BkTvO68U3QFwZvScYN/fADkQ3i2P6Bmw+mmskFMgW9XtLucdq5hLg10bdHb
         z8/zdsSyODXYhwcJ31IQX/BCurZj1qnVWxFUqDaJ356lJXsbtkzWGM0L0EhKUtlW73o/
         ZzV1PcHC2SSaUVa0ht29vfgzl9NQTS/uNWiC01BmE63hlI52adR/KwIAnseXatnldZgn
         OTBTVoinGmdCnI9l3vOpXxFVVFmR1rNkKcCOVvAi3gH1Alm/YwBm/khm1iS4C0pdj275
         5eFVnJV+jasJIbMC+8jDlf+4yEvEssnLHZnXrVwbu6yNFD5tvEhiLW1uVojuGNkfwAxN
         mv0g==
X-Gm-Message-State: AOJu0YyzdCT4MT6X0OCnwL/4rybs0LnsxPenY9Y6e4pzMoNvdGzc9MnO
        uSKS86O/LyPtQvCpCtZHC8X0nKlsNl4qolwGHkBrHA==
X-Google-Smtp-Source: AGHT+IGk2R54zWB6aRa4RbSeBT9Z8J5T4TXiyB4Vle9bwzR5GqISmJH2OZCPqY1SUXwwMEpn8Stt8en869yrOvH8V6Y=
X-Received: by 2002:a05:6102:474b:b0:45f:4e55:9c4b with SMTP id
 ej11-20020a056102474b00b0045f4e559c4bmr5313415vsb.31.1699395066619; Tue, 07
 Nov 2023 14:11:06 -0800 (PST)
MIME-Version: 1.0
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-6-almasrymina@google.com> <3b0d612c-e33b-48aa-a861-fbb042572fc9@kernel.org>
In-Reply-To: <3b0d612c-e33b-48aa-a861-fbb042572fc9@kernel.org>
From:   Mina Almasry <almasrymina@google.com>
Date:   Tue, 7 Nov 2023 14:10:52 -0800
Message-ID: <CAHS8izOHYx+oYnzksUDrK1S0+6CdMJmirApntP5W862yFumezw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 05/12] netdev: netdevice devmem allocator
To:     David Ahern <dsahern@kernel.org>
Cc:     netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Shakeel Butt <shakeelb@google.com>,
        Jeroen de Borst <jeroendb@google.com>,
        Praveen Kaligineedi <pkaligineedi@google.com>,
        Willem de Bruijn <willemb@google.com>,
        Kaiyuan Zhang <kaiyuanz@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 6, 2023 at 3:44=E2=80=AFPM David Ahern <dsahern@kernel.org> wro=
te:
>
> On 11/5/23 7:44 PM, Mina Almasry wrote:
> > diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
> > index eeeda849115c..1c351c138a5b 100644
> > --- a/include/linux/netdevice.h
> > +++ b/include/linux/netdevice.h
> > @@ -843,6 +843,9 @@ struct netdev_dmabuf_binding {
> >  };
> >
> >  #ifdef CONFIG_DMA_SHARED_BUFFER
> > +struct page_pool_iov *
> > +netdev_alloc_devmem(struct netdev_dmabuf_binding *binding);
> > +void netdev_free_devmem(struct page_pool_iov *ppiov);
>
> netdev_{alloc,free}_dmabuf?
>

Can do.

> I say that because a dmabuf can be host memory, at least I am not aware
> of a restriction that a dmabuf is device memory.
>

In my limited experience dma-buf is generally device memory, and
that's really its use case. CONFIG_UDMABUF is a driver that mocks
dma-buf with a memfd which I think is used for testing. But I can do
the rename, it's more clear anyway, I think.

On Mon, Nov 6, 2023 at 11:45=E2=80=AFPM Yunsheng Lin <linyunsheng@huawei.co=
m> wrote:
>
> On 2023/11/6 10:44, Mina Almasry wrote:
> > +
> > +void netdev_free_devmem(struct page_pool_iov *ppiov)
> > +{
> > +     struct netdev_dmabuf_binding *binding =3D page_pool_iov_binding(p=
piov);
> > +
> > +     refcount_set(&ppiov->refcount, 1);
> > +
> > +     if (gen_pool_has_addr(binding->chunk_pool,
> > +                           page_pool_iov_dma_addr(ppiov), PAGE_SIZE))
>
> When gen_pool_has_addr() returns false, does it mean something has gone
> really wrong here?
>

Yes, good eye. gen_pool_has_addr() should never return false, but then
again, gen_pool_free()  BUG_ON()s if it doesn't find the address,
which is an extremely severe reaction to what can be a minor bug in
the accounting. I prefer to leak rather than crash the machine. It's a
bit of defensive programming that is normally frowned upon, but I feel
like in this case it's maybe warranted due to the very severe reaction
(BUG_ON).

--=20
Thanks,
Mina
