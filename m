Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 683CC781A71
	for <lists+linux-media@lfdr.de>; Sat, 19 Aug 2023 18:12:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233839AbjHSQMV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 19 Aug 2023 12:12:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233786AbjHSQMU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 19 Aug 2023 12:12:20 -0400
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com [IPv6:2607:f8b0:4864:20::932])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 532597EF7;
        Sat, 19 Aug 2023 09:12:18 -0700 (PDT)
Received: by mail-ua1-x932.google.com with SMTP id a1e0cc1a2514c-7919342c456so373744241.2;
        Sat, 19 Aug 2023 09:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692461537; x=1693066337;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B0DClhRtATWEjW5SsuPs3moh95yotSUJv5ef14wvRow=;
        b=Dy7/yh009XnqKLPfY7ID0NFuShQEayhHBRARlc7Qhd+EFGAbpNUBcDpLSRI4As0Dm8
         RT/k3F+Ae6/FY0Hvkwo0CW+GkgXyGwG0XScb7cwcKAFeTnYqW8hnj+jqSkYsF/1DSXdi
         B1QxpM3TvKspZZ5Jyy829ds72MeWTFHKyVeqH+ZuhbSgat2s/DfAxqc9Y7jeRKh5xwxv
         fIDWTh8AyNs3TU5UG/tAKMc4NKr322ktQ6CD8ObC55za7tqWADHrkmvboi5+ABVaPch3
         a6juojGO+W7F9W1OLpJfSaYBjQMjxerhTFXrnSEHXbqW/ewDA0b4WKu3IsKD70iJqBea
         Y28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692461537; x=1693066337;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B0DClhRtATWEjW5SsuPs3moh95yotSUJv5ef14wvRow=;
        b=k39Mb6JVQySUc//fg60/xEv6iXJFT8DsPZfxgs9wLzoN9IKsHwO+a6sDbM71JgYemH
         EO7Dj+uQqiaflQ8MldoCHo8Rz8DOeTPiYi4RvCshHsx1SJuYjs/YQQZvgrsROvfBEkbq
         FrQKb1dhqtaJBXDFJNHWhusUxPteY7tPrCPuYr9EF+0DpS57sBnrXoqpmhHhKjh+4bTr
         ir+bifw8+nP3JqQLkUEf8YWAoEtyybmhDv1qoMfjhWarX7lRy1R1FB+vMgWod8UcurTF
         aGK5uNk+oFxduR5pjkcwZ6w90Y/FdL8U4sPOGyosST0/MuB3CHO6jBqvWFuMxcPvp4pj
         LbAA==
X-Gm-Message-State: AOJu0Ywk2+aJEvVg57kSHyb5ub5kYYVHWW4NDYjoeHYmoPdz+ES0bbgY
        LvGbzujJ+G1lbblAqMvOsVldmmN3IEW+gsMJZsQ=
X-Google-Smtp-Source: AGHT+IFh0m4BQXMRNTaUxW3V40OrJMwg6EKPDFDV3ZolowmJV63SBq1rU/HbuSjB7lD1RB2tr30yAKIM++bjPAynnfU=
X-Received: by 2002:a05:6102:3a6a:b0:449:6e2c:56f9 with SMTP id
 bf10-20020a0561023a6a00b004496e2c56f9mr1245257vsb.2.1692461537221; Sat, 19
 Aug 2023 09:12:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230810015751.3297321-1-almasrymina@google.com>
 <20230810015751.3297321-7-almasrymina@google.com> <6adafb5d-0bc5-cb9a-5232-6836ab7e77e6@redhat.com>
 <CAF=yD-L0ajGVrexnOVvvhC-A7vw6XP9tq5T3HCDTjQMS0mXdTQ@mail.gmail.com> <8f4d276e-470d-6ce8-85d5-a6c08fa22147@redhat.com>
In-Reply-To: <8f4d276e-470d-6ce8-85d5-a6c08fa22147@redhat.com>
From:   Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date:   Sat, 19 Aug 2023 12:11:40 -0400
Message-ID: <CAF=yD-LiR1J7iaGCfc+YKNB7W7QO3XvZGfgOSKjpGur_JZFsGQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 06/11] page-pool: add device memory support
To:     Jesper Dangaard Brouer <jbrouer@redhat.com>
Cc:     brouer@redhat.com, Mina Almasry <almasrymina@google.com>,
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
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Hari Ramakrishnan <rharix@google.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Andy Lutomirski <luto@kernel.org>, stephen@networkplumber.org,
        sdf@google.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> > Any regression in page pool can be avoided in the common case that
> > does not use device mem by placing that behind a static_branch. Would
> > that address your performance concerns?
> >
>
> No. This will not help.
>
> The problem is that every where in the page_pool code it is getting
> polluted with:
>
>    if (page_is_page_pool_iov(page))
>      call-some-iov-func-instead()
>
> Like: the very central piece of getting the refcnt:
>
> +static inline int page_pool_page_ref_count(struct page *page)
> +{
> +       if (page_is_page_pool_iov(page))
> +               return page_pool_iov_refcount(page_to_page_pool_iov(page));
> +
> +       return page_ref_count(page);
> +}
>
>
> The fast-path of the PP is used for XDP_DROP scenarios, and is currently
> around 14 cycles (tsc). Thus, any extra code in this code patch will
> change the fast-path.

With static_branch disabled, it would only insert a NOP?
