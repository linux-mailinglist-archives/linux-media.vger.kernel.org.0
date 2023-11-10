Return-Path: <linux-media+bounces-8-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 309867E7EC0
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 18:47:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E040E2814D7
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 17:47:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3B363A29B;
	Fri, 10 Nov 2023 17:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Kf3FKP18"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC6938F95
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 17:46:33 +0000 (UTC)
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31D30824A
	for <linux-media@vger.kernel.org>; Thu,  9 Nov 2023 22:58:21 -0800 (PST)
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-66d0f945893so14859026d6.1
        for <linux-media@vger.kernel.org>; Thu, 09 Nov 2023 22:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699599500; x=1700204300; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHJDdNWZZ4tIwkHZEN1gC9OcT0HCJr1RVppBH6tmUws=;
        b=Kf3FKP18Bm0Yb7Xx4LgvPTtwficvBa29fHkd1dnD386Ec+Y62XbDQcXWhYzOxV9zte
         +VTEFUqaMHD35K1HZNbFBxPLqryOo/BI4YQGh4iKs42mdOsrf3KRve6NGV8StGgiFn6r
         sns8S8ioBsvBYZyH2Fx0CSs27gMH1sAZD9hYYoVE7ztjpBdfJnX2I3m4eXuGOih62XA5
         qmaQ4lNnCYEG2+tVOFupddghY8LGh5tFcuk42cfHqqoS4MyPf8KwDtcVvh+LfhIqPp9Q
         glWScSAy5mihFhac2Yd4zMhfrFXSCjcfGmyoGdFkT1qbFubTErKfdBBswdgY+/P7lEae
         9iag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699599500; x=1700204300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eHJDdNWZZ4tIwkHZEN1gC9OcT0HCJr1RVppBH6tmUws=;
        b=rKltsnuUqI/BhHJhxV+4+8uPkwOsg7fLi5rsAxuLI5xO8AqLZLEeoXPrkqZD4WkmMF
         Ue0uGHp/79h0cDlS84WxeQ6Lu1mEIXMobXlBdoen/5sj9yNoBbLa48JDltTbIRZCLFXk
         W5OPZOTaSSmUL4d9c4FCbZz7A+hyQuIpUr6G40mjFOkWL1Edh+tzQdIyBMHe0mm+rid/
         kznge9+9F5/GhVPQBT1iEqWgLiFB+GzaLdp8FS/bct6rKFJk81hqq4eo8BohZ8tY9KuU
         bm30EtdW8tDZcIh26mzv82LavysAFphzQkPmnDqeUijp0sx1yUWbrygy6NgD/4tdJsZ7
         7dQg==
X-Gm-Message-State: AOJu0Yzyp5uTKWz0LKAyshoQJUZ4ROZY3QS5g1X4v8cLQXjFxTX0Od8B
	4T3uHs49SqEaT/8+Jkx0pJB+8a6X4eMGaJa90Fsh1zXHh1A1HEGWouA=
X-Google-Smtp-Source: AGHT+IHV8+0MFbC/VQpqHkvElGy/RL/z/ISeA+lbF9gB7A+2xFrkzHZehvrtNrke+02jjGbQaJXjvKRk/eDFLYB8QzU=
X-Received: by 2002:a05:6102:3d8b:b0:44d:38d6:5cb8 with SMTP id
 h11-20020a0561023d8b00b0044d38d65cb8mr631035vsv.10.1699589171185; Thu, 09 Nov
 2023 20:06:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-9-almasrymina@google.com> <adde2b31fdd9e7bb4a09f0073580b840bea0bab1.camel@redhat.com>
In-Reply-To: <adde2b31fdd9e7bb4a09f0073580b840bea0bab1.camel@redhat.com>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 9 Nov 2023 20:06:00 -0800
Message-ID: <CAHS8izMrJVb0ESjFhqUWuxdZ8W5HDmg=yRj1J1sTeGoQjDcJog@mail.gmail.com>
Subject: Re: [RFC PATCH v3 08/12] net: support non paged skb frags
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, David Ahern <dsahern@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Shakeel Butt <shakeelb@google.com>, Jeroen de Borst <jeroendb@google.com>, 
	Praveen Kaligineedi <pkaligineedi@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 9, 2023 at 1:15=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wrot=
e:
>
> On Sun, 2023-11-05 at 18:44 -0800, Mina Almasry wrote:
> [...]
> > @@ -3421,7 +3446,7 @@ static inline struct page *skb_frag_page(const sk=
b_frag_t *frag)
> >   */
> >  static inline void __skb_frag_ref(skb_frag_t *frag)
> >  {
> > -     get_page(skb_frag_page(frag));
> > +     page_pool_page_get_many(frag->bv_page, 1);
>
> I guess the above needs #ifdef CONFIG_PAGE_POOL guards and explicit
> skb_frag_is_page_pool_iov() check ?
>

It doesn't actually. page_pool_page_* helpers are compiled in
regardless of CONFIG_PAGE_POOL, and handle both page_pool_iov* & page*
just fine (the checking happens inside the function).

You may yell at me that it's too confusing... I somewhat agree, but
I'm unsure of what is a better name or location for the helpers. The
helpers handle (page_pool_iov* || page*) gracefully, so they seem to
belong in the page pool for me, but it is indeed surprising/confusing
that these helpers are available even if !CONFIG_PAGE_POOL.

>
> Cheers,
>
> Paolo
>
>


--=20
Thanks,
Mina

