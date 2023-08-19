Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97268781A73
	for <lists+linux-media@lfdr.de>; Sat, 19 Aug 2023 18:12:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233845AbjHSQM4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 19 Aug 2023 12:12:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233786AbjHSQMz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 19 Aug 2023 12:12:55 -0400
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com [IPv6:2607:f8b0:4864:20::a29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A3B46195;
        Sat, 19 Aug 2023 09:12:54 -0700 (PDT)
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-48d0db157efso57271e0c.1;
        Sat, 19 Aug 2023 09:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692461573; x=1693066373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pHplbIquQyqQFzUN09CWVXVZgBdbvA0qztADJp9Jgt0=;
        b=d6P1pBvTIvQc1AKT2WN8J2FoWD+l0ohoQBoYerXwFkor+zfa86W9ZqpQ90qvKPA3Ks
         DmJ52VsTZDARZlP0oeB5PKiVeEdkMfDXs0tHKa+kQmjKn24t35RCBwKPHVq0h0m4UCGP
         kokXHppGzL3kc93CY4BGfzZeZ619W/yOWMlpPtvaTTPvjF+Odx9ZTTCNfoGdvoO7GDSi
         x2crI/qD/ih/RTTiQIYNazeXcfIjKzht6s17MLaKQMWv93FRMRe9QTHj9YOZcJAhuhLE
         0av4gHqPD73RCRD/SBUth3RM0RxUIlH268AhrcHA5N4McEWg1QEtKc6zruUWT6lBZjDB
         WSUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692461573; x=1693066373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pHplbIquQyqQFzUN09CWVXVZgBdbvA0qztADJp9Jgt0=;
        b=gaIIO7EYoH6N6HDRMu+kbn/NJkgMO6dBXjnBXItRNBaz9tMpPDUsVqgUv2Ck4oB0xI
         vKb+Rl9/47y9n52eiWMaYXrX9eSeXKmYxlGcj+Vfe6yDscgg7iKKtqFHek590Fpn/nqs
         Pk/MEfLlA9f/88cn5364Hpjo6r16l24y1dz/GvJ6pRfJcIfA9Ki4XzrspznEf7a/v3jq
         X4lw5DIATO5S9o+fdPwXF2FOIAaI3PWmaK9SLPKbbQ2KT8G4ow0sItKHApwGdlENV90S
         WNDM4WqT/YAdz9PQnQhuoti5tE1udyxlpY6aJpC1oSTV0+J1YBz6qA+4D3L2Izd6lNRe
         oJcg==
X-Gm-Message-State: AOJu0YwKVsgtqSqsNis6tRwgd5pAj16hAzmQYxaGtdxaY/ThdfM6X44o
        SYpmEDL0K99gxdSjQ5FDyJrszbIG9uT21jzxcbg=
X-Google-Smtp-Source: AGHT+IHml63XQJifUq6TukqroKgh1irkYJc5zutoZfWbNyCx6upCQCtONuf3+IVCRXH5C9AA39xbv5oXumN8Pz0ssMk=
X-Received: by 2002:a1f:c904:0:b0:48d:9a8:e2f0 with SMTP id
 z4-20020a1fc904000000b0048d09a8e2f0mr1012516vkf.5.1692461573080; Sat, 19 Aug
 2023 09:12:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230810015751.3297321-1-almasrymina@google.com>
 <20230810015751.3297321-7-almasrymina@google.com> <6adafb5d-0bc5-cb9a-5232-6836ab7e77e6@redhat.com>
 <CAF=yD-L0ajGVrexnOVvvhC-A7vw6XP9tq5T3HCDTjQMS0mXdTQ@mail.gmail.com>
 <8f4d276e-470d-6ce8-85d5-a6c08fa22147@redhat.com> <4f19143d-5975-05d4-3697-0218ed2881c6@kernel.org>
In-Reply-To: <4f19143d-5975-05d4-3697-0218ed2881c6@kernel.org>
From:   Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date:   Sat, 19 Aug 2023 12:12:16 -0400
Message-ID: <CAF=yD-+wXynvcntVccUAM2+PAumZbRE9E6f3MS6X6qkGrG7_Ow@mail.gmail.com>
Subject: Re: [RFC PATCH v2 06/11] page-pool: add device memory support
To:     David Ahern <dsahern@kernel.org>
Cc:     Jesper Dangaard Brouer <jbrouer@redhat.com>, brouer@redhat.com,
        Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Hari Ramakrishnan <rharix@google.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Andy Lutomirski <luto@kernel.org>, stephen@networkplumber.org,
        sdf@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Aug 19, 2023 at 11:49=E2=80=AFAM David Ahern <dsahern@kernel.org> w=
rote:
>
> On 8/19/23 9:22 AM, Jesper Dangaard Brouer wrote:
> >
> > I do see the problem of depending on having a struct page, as the
> > page_pool_iov isn't related to struct page.  Having "page" in the name
> > of "page_pool_iov" is also confusing (hardest problem is CS is naming,
> > as we all know).
> >
> > To support more allocator types, perhaps skb->pp_recycle bit need to
> > grow another bit (and be renamed skb->recycle), so we can tell allocato=
r
> > types apart, those that are page based and those whom are not.
> >
> >
> >> I think the feedback has been strong to not multiplex yet another
> >> memory type into that struct, that is not a real page. Which is why
> >> we went into this direction. This latest series limits the impact larg=
ely
> >> to networking structures and code.
> >>
> >
> > Some what related what I'm objecting to: the "page_pool_iov" is not a
> > real page, but this getting recycled into something called "page_pool",
> > which funny enough deals with struct-pages internally and depend on the
> > struct-page-refcnt.
> >
> > Given the approach changed way from using struct page, then I also don'=
t
> > see the connection with the page_pool. Sorry.
>
> I do not care for the page_pool_iov name either; I presumed it was least
> change to prove an idea and the name and details would evolve.
>
> How about something like buffer_pool or netdev_buf_pool that can operate
> with either pages, dma addresses, or something else in the future?

Sounds good. I suggested this name, but I see how using page in the
name is not very clear.

> >
> >> As for the LSB trick: that avoided adding a lot of boilerplate churn
> >> with new type and helper functions.
> >>
> >
> > Says the lazy programmer :-P ... sorry could not resist ;-)

:-) For the record, there is a prior version that added a separate type.

I did not like the churn it brought and asked for this.

>
> Use of the LSB (or bits depending on alignment expectations) is a common
> trick and already done in quite a few places in the networking stack.
> This trick is essential to any realistic change here to incorporate gpu
> memory; way too much code will have unnecessary churn without it.
>
> I do prefer my earlier suggestion though where the skb_frag_t has a
> union of relevant types though. Instead of `struct page *page` it could
> be `void *addr` with the helpers indicating page, iov, or other.

Okay. I think that is how we did it previously.
