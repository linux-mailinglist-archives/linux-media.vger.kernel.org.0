Return-Path: <linux-media+bounces-9-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E27F7E7EC1
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 18:47:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 515352815DB
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 17:47:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3BE33A29C;
	Fri, 10 Nov 2023 17:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wYXDWjn7"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B61D20B37
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 17:46:31 +0000 (UTC)
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2041D25087
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 01:45:44 -0800 (PST)
Received: by mail-vs1-xe30.google.com with SMTP id ada2fe7eead31-45dad6ece90so848459137.0
        for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 01:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699609543; x=1700214343; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7pUm/c3POcD26li8+Wke26dcOs+wqv0EJOUWvylNJQo=;
        b=wYXDWjn7U63zYTzMWT2KkWW3kr8rgGqbDhEyIZZ5Ty4YEcIia9r48p4Dy+2CpAYXB7
         l+/H/1gWi2YA6I13l4MSSKx7OpCK5aBvOUdy0a9KsF4UTae49Np2UUrswYYXoUhqrnE0
         8gKbE3zhta89j3NLl92qaHlyyjmWh3+4kPnJ4Jf3RS193wHSWKQBQ/G16Y3PzcFsfQI5
         iqrYZX93Jvm3B6Sz81vD44uR6HsFywTXRgUS0r/Sfl/Gy7aI9zXhn9gMnm8BCNGtm8+z
         u45Qgm4wKz9o197av3qEsTzpCIB3+N9cwR5YFs8wn4E3nYRLdvwK8NNSjkTy+9MREi5z
         E93w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699609543; x=1700214343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7pUm/c3POcD26li8+Wke26dcOs+wqv0EJOUWvylNJQo=;
        b=ISr0rYcFpPHMi7bmWga6zaHiAC3ZTEVO6dmSscV77Kq9omloXE0MU5ktcW45HPrbO5
         2IqLsksJyE0dKae7b3pZZIe6e7YxzPzSdXTVN/oMlvOlQGDYxAmSDP2r3Wd/mI6T22ue
         825FwNwqmtG9TjoKwFGTBsc4xgaLaabLanU1UWFRGfxEEWOftqEHXMYh+5lc54TEU4ay
         yt4CcfvLtfulaXW34kfdTShe7ASx03AAmn3FOAKMGyOnRQAnqhjrdWP/9bF0K1Z3YGVM
         B9uHshfXnaCDbQ05PhaNhO1oCFqIhukByESDRTJQzZEUzSUX5oMXK9js/IZQdM/sg1mG
         9caQ==
X-Gm-Message-State: AOJu0Yyg7AyIMj84UQCs2Z8GrDCjQLrmBlErwflB4RMcjopj+5ZUpe6R
	UXGoRyPtzzks3kp24rIuWIVP58P1Z0i9bwT8g9NimtN+BDck3hN9siK2pg==
X-Google-Smtp-Source: AGHT+IGwONXBFBpAhD15bfaIVPNRmPgG1R+yrVeei2EXlwNf647dy9292PLH34LJT3G6STTIfr9u5/CLo0iSwGhMU3o=
X-Received: by 2002:a67:c381:0:b0:45d:a4a6:6fae with SMTP id
 s1-20020a67c381000000b0045da4a66faemr6419953vsj.30.1699609542944; Fri, 10 Nov
 2023 01:45:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-5-almasrymina@google.com> <076fa6505f3e1c79cc8acdf9903809fad6c2fd31.camel@redhat.com>
 <CAHS8izOGSE-PJ1uShkH_Mr6kUoC1EjM_9P1J=_TO6nLFP9K53Q@mail.gmail.com> <aec0f586-c3b9-8da8-6a39-f313105267f8@huawei.com>
In-Reply-To: <aec0f586-c3b9-8da8-6a39-f313105267f8@huawei.com>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 10 Nov 2023 01:45:29 -0800
Message-ID: <CAHS8izP64Q3cP5vJ5ESQH9Y3fkSn8RCS+T84orKhK5=pzdJCLA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 04/12] netdev: support binding dma-buf to netdevice
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, David Ahern <dsahern@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Shakeel Butt <shakeelb@google.com>, Jeroen de Borst <jeroendb@google.com>, 
	Praveen Kaligineedi <pkaligineedi@google.com>, Willem de Bruijn <willemb@google.com>, 
	Kaiyuan Zhang <kaiyuanz@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 9, 2023 at 11:38=E2=80=AFPM Yunsheng Lin <linyunsheng@huawei.co=
m> wrote:
>
> On 2023/11/10 10:59, Mina Almasry wrote:
> > On Thu, Nov 9, 2023 at 12:30=E2=80=AFAM Paolo Abeni <pabeni@redhat.com>=
 wrote:
> >>
> >> I'm trying to wrap my head around the whole infra... the above line is
> >> confusing. Why do you increment dma_addr? it will be re-initialized in
> >> the next iteration.
> >>
> >
> > That is just a mistake, sorry. Will remove this increment.
>
> You seems to be combining comments in different thread and replying in
> one thread, I am not sure that is a good practice and I almost missed the
> reply below as I don't seem to be cc'ed.
>

Sorry about that.

> >
> > On Thu, Nov 9, 2023 at 1:29=E2=80=AFAM Yunsheng Lin <linyunsheng@huawei=
.com> wrote:> >>>
> >>>>> gen_pool_destroy BUG_ON() if it's not empty at the time of destroyi=
ng.
> >>>>> Technically that should never happen, because
> >>>>> __netdev_devmem_binding_free() should only be called when the refco=
unt
> >>>>> hits 0, so all the chunks have been freed back to the gen_pool. But=
,
> >>>>> just in case, I don't want to crash the server just because I'm
> >>>>> leaking a chunk... this is a bit of defensive programming that is
> >>>>> typically frowned upon, but the behavior of gen_pool is so severe I
> >>>>> think the WARN() + check is warranted here.
> >>>>
> >>>> It seems it is pretty normal for the above to happen nowadays becaus=
e of
> >>>> retransmits timeouts, NAPI defer schemes mentioned below:
> >>>>
> >>>> https://lkml.kernel.org/netdev/168269854650.2191653.8465259808498269=
815.stgit@firesoul/
> >>>>
> >>>> And currently page pool core handles that by using a workqueue.
> >>>
> >>> Forgive me but I'm not understanding the concern here.
> >>>
> >>> __netdev_devmem_binding_free() is called when binding->ref hits 0.
> >>>
> >>> binding->ref is incremented when an iov slice of the dma-buf is
> >>> allocated, and decremented when an iov is freed. So,
> >>> __netdev_devmem_binding_free() can't really be called unless all the
> >>> iovs have been freed, and gen_pool_size() =3D=3D gen_pool_avail(),
> >>> regardless of what's happening on the page_pool side of things, right=
?
> >>
> >> I seems to misunderstand it. In that case, it seems to be about
> >> defensive programming like other checking.
> >>
> >> By looking at it more closely, it seems napi_frag_unref() call
> >> page_pool_page_put_many() directly=EF=BC=8C which means devmem seems t=
o
> >> be bypassing the napi_safe optimization.
> >>
> >> Can napi_frag_unref() reuse napi_pp_put_page() in order to reuse
> >> the napi_safe optimization?
> >>
> >
> > I think it already does. page_pool_page_put_many() is only called if
> > !recycle or !napi_pp_put_page(). In that case
> > page_pool_page_put_many() is just a replacement for put_page(),
> > because this 'page' may be an iov.
>
> Is there a reason why not calling napi_pp_put_page() for devmem too
> instead of calling page_pool_page_put_many()? mem provider has a
> 'release_page' ops, calling page_pool_page_put_many() directly here
> seems to be bypassing the 'release_page' ops, which means devmem is
> bypassing most of the main features of page pool.
>

I think we're still calling napi_pp_put_page() as normal:

 /**
@@ -3441,13 +3466,13 @@ bool napi_pp_put_page(struct page *page, bool
napi_safe);
 static inline void
 napi_frag_unref(skb_frag_t *frag, bool recycle, bool napi_safe)
 {
-       struct page *page =3D skb_frag_page(frag);
-
 #ifdef CONFIG_PAGE_POOL
-       if (recycle && napi_pp_put_page(page, napi_safe))
+       if (recycle && napi_pp_put_page(frag->bv_page, napi_safe))
                return;
+       page_pool_page_put_many(frag->bv_page, 1);
+#else
+       put_page(skb_frag_page(frag));
 #endif
-       put_page(page);
 }

The code change here is to replace put_page() with
page_pool_page_put_many(), only, because bv_page may be a
page_pool_iov, so we need to use page_pool_page_put_many() which
handles page_pool_iov correcly. I did not change whether or not
napi_pp_put_page() is called. It's still called if recycle=3D=3Dtrue.

> As far as I can tell, the main features of page pool:
> 1. Allow lockless allocation and freeing in pool->alloc cache by
>    utilizing NAPI non-concurrent context.
> 2. Allow concurrent allocation and freeing in pool->ring cache by
>    utilizing ptr_ring.
> 3. Allow dma map/unmap and cache sync optimization.
> 4. Allow detailed stats logging and tracing.
> 5. Allow some bulk allocation and freeing.
> 6. support both skb packet and xdp frame.
>
> I am wondering what is the main features that devmem is utilizing
> by intergrating into page pool?
>
> It seems the driver can just call netdev_alloc_devmem() and
> napi_frag_unref() can call netdev_free_devmem() directly without
> intergrating into page pool and it should just works too?
>
> Maybe we should consider creating a new thin layer, in order to
> demux to page pool, devmem or other mem type if my suggestion does
> not work out too?
>

I went through this discussion with Jesper on RFC v2 in this thread:

https://lore.kernel.org/netdev/CAHS8izOVJGJH5WF68OsRWFKJid1_huzzUK+hpKbLcL4=
pSOD1Jw@mail.gmail.com/T/#ma9285d53735d82cc315717db67a1796477c89d86

which culminates with that email where he seems on board with the
change from a performance POV, and seems on board with hiding the
memory type implementation from the drivers. That thread fully goes
over the tradeoffs of integrating over the page pool or creating new
ones. Integrating with the page pool abstracts most of the devmem
implementation (and other memory types) from the driver. It reuses
page pool features like page recycling for example.

--=20
Thanks,
Mina

