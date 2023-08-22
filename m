Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D00C783724
	for <lists+linux-media@lfdr.de>; Tue, 22 Aug 2023 02:58:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229487AbjHVA6m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Aug 2023 20:58:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjHVA6l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Aug 2023 20:58:41 -0400
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com [IPv6:2607:f8b0:4864:20::a29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D758DD7;
        Mon, 21 Aug 2023 17:58:38 -0700 (PDT)
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-48d0dbd62fbso685873e0c.0;
        Mon, 21 Aug 2023 17:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692665918; x=1693270718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=etbwJkjZ+47EGwO43n7nBgUqgoF0Y+SqornaZjC52hI=;
        b=Q2MCju5n2Fs0gJAbnAMSN/TSkiK5/IJ2nWz59TWWBqyOI60mBhj2IgPSq2JMb+hgV+
         zXo47RElxE+valBU6k7puzGdW6mMO6xi+ZOaeWuPRcPwEnyMEva0FxJDL8K6wUchnzW9
         f+DoWDlQl+F7D2BVJ9QKnEFfyKOgMQ6WM5xuxUg7tAmu8byNXEYyrxMo0v1oWjls/qok
         5FEg2ENmiksG86m49zNL+A3UAFn2JqegA0PIGCU5XxrgwAL4gcA/PyY3WJ9F+v/UnpJx
         6JZsMAYk9Gr90+NW6WSJdtz9qOTVb+X52xZ5G/GsQKoD0pgy+BThzKL12y/yLhjUFmLd
         Iujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692665918; x=1693270718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=etbwJkjZ+47EGwO43n7nBgUqgoF0Y+SqornaZjC52hI=;
        b=aq3evez8DfkFJZwhHAQefWJVzwQ13MdCCJQmn/8FPp2559HZmgaNZKXhu5xsATLUfr
         hPKLmE93Q80SYxIY2LbnoNUP4vAJ/TbBthtNflsDjq5ZCbcWwelFaUVJez4cfrrLSL6G
         WDwUcV8Y3CUEtFDbh6nuSq/L0fJ+9/s1Y+g31/qaHG9lRmQ1kO20meg8oqRIMP/W2WPB
         sVTDInabRIIfXbg1Cz71mBvvv6Z8gzj0N6pbsiMYfSMxBa8QRCzuU7tqtHbQKt6mfBqK
         kC/2q1w0oFuygV5+o1YNUvXiVeQkr8l3ssuLlNsl9MYm5Z+82VP0wj2tNf3mAaMjHEDh
         XkhQ==
X-Gm-Message-State: AOJu0YxTzYEVJA+zxE2mZE6t+fDU1Dz3J8LZJ3Ll5DsTk8hwF99Z8K+n
        vFCt5WWprI58DCVW2yzsxTbWsv9be86gMhQuL2U=
X-Google-Smtp-Source: AGHT+IFbiTGbud9q6eccm4P8fsg6Je3YqRd5e1SAJ+GMoopHX50V7bFswnzPZw2yl8U7370OXqMsItCFCtZl/DFPHOI=
X-Received: by 2002:a1f:e2c1:0:b0:488:23bc:6d0f with SMTP id
 z184-20020a1fe2c1000000b0048823bc6d0fmr6383439vkg.16.1692665917754; Mon, 21
 Aug 2023 17:58:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230810015751.3297321-1-almasrymina@google.com>
 <20230810015751.3297321-7-almasrymina@google.com> <6adafb5d-0bc5-cb9a-5232-6836ab7e77e6@redhat.com>
 <CAF=yD-L0ajGVrexnOVvvhC-A7vw6XP9tq5T3HCDTjQMS0mXdTQ@mail.gmail.com>
 <8f4d276e-470d-6ce8-85d5-a6c08fa22147@redhat.com> <4f19143d-5975-05d4-3697-0218ed2881c6@kernel.org>
 <CAF=yD-+wXynvcntVccUAM2+PAumZbRE9E6f3MS6X6qkGrG7_Ow@mail.gmail.com> <20230821143131.47de8f8f@kernel.org>
In-Reply-To: <20230821143131.47de8f8f@kernel.org>
From:   Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date:   Mon, 21 Aug 2023 20:58:00 -0400
Message-ID: <CAF=yD-LB1XCfihbFfGkn8seUCq9h6FLyMy94ZYQSTGsN2hVsjQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 06/11] page-pool: add device memory support
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     David Ahern <dsahern@kernel.org>,
        Jesper Dangaard Brouer <jbrouer@redhat.com>,
        brouer@redhat.com, Mina Almasry <almasrymina@google.com>,
        netdev@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
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

On Mon, Aug 21, 2023 at 5:31=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Sat, 19 Aug 2023 12:12:16 -0400 Willem de Bruijn wrote:
> > :-) For the record, there is a prior version that added a separate type=
.
> >
> > I did not like the churn it brought and asked for this.
>
> It does end up looking cleaner that I personally expected, FWIW.
>
> > > Use of the LSB (or bits depending on alignment expectations) is a com=
mon
> > > trick and already done in quite a few places in the networking stack.
> > > This trick is essential to any realistic change here to incorporate g=
pu
> > > memory; way too much code will have unnecessary churn without it.
>
> We'll end up needing the LSB trick either way, right? The only question
> is whether the "if" is part of page pool or the caller of page pool.

Indeed. Adding layering does not remove this.

> Having seen zctap I'm afraid if we push this out of pp every provider
> will end up re-implementing page pool's recycling/caching functionality
> :(
>
> Maybe we need to "fork" the API? The device memory "ifs" are only needed
> for data pages. Which means that we can retain a faster, "if-less" API
> for headers and XDP. Or is that too much duplication?

I don't think that would be faster. Just a different structuring of
the code. We still need to take one of multiple paths for, say, page
allocation (page_pool_alloc_pages).

If having a struct page_pool and struct mem_pool, there would still be
a type-based branch. But now either in every caller (yech), or in some
thin shim layer. Why not just have it behind the existing API? That is
what your memory provider does. The only difference now is that one of
the providers really does not deal with pages.

I think this multiplexing does not have to introduce performance
regressions with well placed static_branch. Benchmarks and
side-by-side comparison of assembly will have to verify that.

Indirect function calls need to be avoided, of course, in favor of a
type based switch. And unless the non_default_providers static branch
is enabled, the default path is taken unconditionally.

If it no longer is a pure page pool, maybe it can be renamed. I
personally don't care.
