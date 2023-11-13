Return-Path: <linux-media+bounces-183-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E82147E9695
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 07:05:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A960280EBA
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 06:05:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A420B11CA2;
	Mon, 13 Nov 2023 06:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="alD1Cbcf"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A521713FEF
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 06:05:46 +0000 (UTC)
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com [IPv6:2607:f8b0:4864:20::935])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C20E1729
	for <linux-media@vger.kernel.org>; Sun, 12 Nov 2023 22:05:45 -0800 (PST)
Received: by mail-ua1-x935.google.com with SMTP id a1e0cc1a2514c-7bb44339bf7so1105880241.0
        for <linux-media@vger.kernel.org>; Sun, 12 Nov 2023 22:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699855544; x=1700460344; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+O4c7eDef50yyoJSsJxpIFGb81PUKkG+p7ugALAq5oE=;
        b=alD1CbcfNklR2Y1bKOHRgTcq78zMhmatAMwwRl905bGP/73+ZEtpFjkrbxzrGeoRSt
         FqKk4KMcqKbRVfdEZnU1dlLJfV+F2w32rVS/e4tRyLS7gK8SszsQ3qKkaTqg2KtyS+DM
         rT0NWRkrHqlo2IykDMpHTk1Q/XqL+FhFgUx5QEFlmjuXTKSF7dYW5QnAaAJO6ePYvEhv
         uER+wzVw+kDe1AD4ZRIZcBaeeIAm1YaMn0Ef/6RcSIiw3+z/sl2WiPHq4kgWuCnkAzeP
         8yJOp5xUbXvL3jYeh3j/r9XBoCYQYBPgf0wgPLBVrqGCIVaFHj5ueLrVFUOHq17eYCeT
         hd7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699855544; x=1700460344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+O4c7eDef50yyoJSsJxpIFGb81PUKkG+p7ugALAq5oE=;
        b=OqWsUY9A/tOywXN4O65ji2HgKr4zuX0HE7ysu1aHvYHamTkay96zzqf8mn8iamdPNL
         6uCAWWZN/5G91LIKTOMw0THesPOKVtom4a5AIg4Ue0mahwTUB19NDaz9sGlJuOzbJvBt
         sel8kpVFh8/rZC4PEKwaEVkdVuxpoGne9kekOjC4aC4dFwxViuAkej8ZCGMrj0d7vspC
         v22GsvGmWQS18x7PYbYjP3wJJJSbixWIBrfb/K5/A6TD8vBNbZPWvmqUIyWggL4YtpWL
         C8aloNKsJatySQEW4D3Cz/MSf7XimjI/hEHtKdQaOgxzVV/5WQIXbmdbn94XbyhVU5Wx
         j2qA==
X-Gm-Message-State: AOJu0YzguiL3Q8aBm7WP3owG9TB/EXqFQqxgfEcdmDoFkHugjnOobnIq
	MO/QfsxH3mS1XTmbWTZjmT1XIzu0zdPyRr1xd0S1UA==
X-Google-Smtp-Source: AGHT+IEzmDvkwRkaQiM0DAzYdV0kX0ZDqS9InenhAVr/MpvpHQQqRmx4Go8bctNEzwdfIOZ4RbhEG1ddlIqUfdGfcuo=
X-Received: by 2002:a05:6102:2c04:b0:45e:f8af:79c1 with SMTP id
 ie4-20020a0561022c0400b0045ef8af79c1mr2667348vsb.31.1699855544082; Sun, 12
 Nov 2023 22:05:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-9-almasrymina@google.com> <20231110151935.0859fd7a@kernel.org>
In-Reply-To: <20231110151935.0859fd7a@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Sun, 12 Nov 2023 22:05:30 -0800
Message-ID: <CAHS8izN7MydkJPaHfj7Pw0V+xoDBkCmEVTc1TH24=hjXm98xnQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 08/12] net: support non paged skb frags
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, David Ahern <dsahern@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Shakeel Butt <shakeelb@google.com>, Jeroen de Borst <jeroendb@google.com>, 
	Praveen Kaligineedi <pkaligineedi@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 10, 2023 at 3:19=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Sun,  5 Nov 2023 18:44:07 -0800 Mina Almasry wrote:
> >  #include <net/net_debug.h>
> >  #include <net/dropreason-core.h>
> > +#include <net/page_pool/types.h>
> > +#include <net/page_pool/helpers.h>
>
> >  /**
> >   * DOC: skb checksums
> > @@ -3402,15 +3404,38 @@ static inline void skb_frag_off_copy(skb_frag_t=
 *fragto,
> >       fragto->bv_offset =3D fragfrom->bv_offset;
> >  }
> >
> > +/* Returns true if the skb_frag contains a page_pool_iov. */
> > +static inline bool skb_frag_is_page_pool_iov(const skb_frag_t *frag)
> > +{
> > +     return page_is_page_pool_iov(frag->bv_page);
> > +}
>
> Maybe we can create a new header? For skb + page pool.
>
> skbuff.h is included by 1/4th of the kernel objects, we should not
> be adding dependencies to this header, it really slows down incremental
> builds.
>

My issue here is that all these skb helpers call each other so I end
up having to move a lot of the unrelated skb helpers to this new
header (maybe that is acceptable but it feels weird).

What I could do here is move all the page_pool_page|iov_* helpers to a
minimal header, and include only that one from skbuff.h, rather than
including all of net/page_pool/helpers.h

--=20
Thanks,
Mina

