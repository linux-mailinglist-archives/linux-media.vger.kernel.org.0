Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EB5F92829
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2019 17:16:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727831AbfHSPQu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Aug 2019 11:16:50 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:36744 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727600AbfHSPQu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Aug 2019 11:16:50 -0400
Received: by mail-pl1-f196.google.com with SMTP id f19so708400plr.3
        for <linux-media@vger.kernel.org>; Mon, 19 Aug 2019 08:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GlFmsxpfwLpG5XFQZcDJGrUJIAXAnOONymKIPYeVWy4=;
        b=GASLs+yZnKXgCHGknNLNo71e6UtRt515EbzdpWYm/Hpg75x/UubNKrVS4Ph4uPK+8D
         Ti+bZvb7RwZ8Rgn5diZiCZOC7bC9H+dTrKcVTPMW/pFv9U1AucjO/hRKCCkTBhzRIaU3
         D9sPMjOcAkw+sn0WiouQhRmANU/HoJXNnBPivxMzU2mCd+1bqEU622XIt7CtOkyBUScf
         CddY5regO8tRNMImraZP3DECenQ45DhILnBAxk2TuQ3iyHoyjpEbXWuF3zSR6z/Z8e3z
         D8kAaqFBdLd66b1BOwiK9p1SMntN4cI0JAUQgHjwyJ5ye9BNp3phuuPzg6paxdjmOKUJ
         Bduw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GlFmsxpfwLpG5XFQZcDJGrUJIAXAnOONymKIPYeVWy4=;
        b=TZkt1S8h8KTNJ9iMoV+a9y2d/WLJ9cVjkDgX/OiwH1J/qQ7SAWgbUJa7O1dvrBWJpj
         CX5teE8QcCErfa+JdAn1MyGEhHytx+az0ZXtUaowDeK+SLP2Sgk139UiNol4omvMjy/9
         M737l82YIpA2gS913HGgGQxrbL+IU4qcZ9CRxpFP7f7G1vyU5tLk90vdY38ITU7GfIjJ
         8h09Li/038IlkuVouuzcYnQ4KVlXM4Wv6nNzVFmWOrk8cQ3xFK7H67tS1nlrDEnhVXZp
         QSuj/l1RdcSsaicQhz4JQBxJvTD9eUdakx8EL46lrILdw2YtLOlnpz8ncHXJDNcbKAr3
         IyuA==
X-Gm-Message-State: APjAAAWgqXCq5EMgQ4+9pMMddOf6yIDRPrSQJY5GsKgSyKnzRQP0T6cz
        e7b65oh03R/VgpWRy7Q/fJX2czNJW47i/UpfujRuYg==
X-Google-Smtp-Source: APXvYqxAVYv/X47htv2GfhrYLw10pOmVgC147AdMR4amTTESkgYjtOO9fvfN54mImyUI3YtolKb0GRqZDtWypE7Vt8Q=
X-Received: by 2002:a17:902:ab96:: with SMTP id f22mr23622721plr.147.1566227808825;
 Mon, 19 Aug 2019 08:16:48 -0700 (PDT)
MIME-Version: 1.0
References: <00eb8ba84205c59cac01b1b47615116a461c302c.1566220355.git.andreyknvl@google.com>
 <20190819150342.sxk3zzxvrxhkpp6j@willie-the-truck>
In-Reply-To: <20190819150342.sxk3zzxvrxhkpp6j@willie-the-truck>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Mon, 19 Aug 2019 17:16:37 +0200
Message-ID: <CAAeHK+xP6HnLJt_RKW67x8nbJLJp5A=av57BfwiFrA88eFn60w@mail.gmail.com>
Subject: Re: [PATCH ARM] selftests, arm64: fix uninitialized symbol in tags_test.c
To:     Will Deacon <will@kernel.org>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        LKML <linux-kernel@vger.kernel.org>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-rdma@vger.kernel.org, linux-media@vger.kernel.org,
        kvm@vger.kernel.org,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Will Deacon <will.deacon@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Kostya Serebryany <kcc@google.com>,
        Khalid Aziz <khalid.aziz@oracle.com>,
        Felix Kuehling <Felix.Kuehling@amd.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Leon Romanovsky <leon@kernel.org>,
        Christoph Hellwig <hch@infradead.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Dave Martin <Dave.Martin@arm.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Kevin Brodsky <kevin.brodsky@arm.com>,
        Kees Cook <keescook@chromium.org>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yishai Hadas <yishaih@mellanox.com>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Alexander Deucher <Alexander.Deucher@amd.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        enh <enh@google.com>, Robin Murphy <robin.murphy@arm.com>,
        Christian Koenig <Christian.Koenig@amd.com>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 19, 2019 at 5:03 PM Will Deacon <will@kernel.org> wrote:
>
> On Mon, Aug 19, 2019 at 03:14:42PM +0200, Andrey Konovalov wrote:
> > Fix tagged_ptr not being initialized when TBI is not enabled.
> >
> > Dan Carpenter <dan.carpenter@oracle.com>
>
> Guessing this was Reported-by, or has Dan introduced his own tag now? ;)

Oops, yes, Reported-by :)

>
> Got a link to the report?

https://www.spinics.net/lists/linux-kselftest/msg09446.html

>
> Will
