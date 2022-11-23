Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0DC863659E
	for <lists+linux-media@lfdr.de>; Wed, 23 Nov 2022 17:23:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237965AbiKWQXI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Nov 2022 11:23:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236459AbiKWQXH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Nov 2022 11:23:07 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C0367340D
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 08:23:04 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id v8so14505212edi.3
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 08:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iTqTgZZVPcHur4ir72Zm6jriTBFysIHApeXSgPETKzY=;
        b=MdK7M0VzmZomTsVbTF5VbNsJh1nEKpsEXsHKhmrxjl/ibRYPHUUU639yOwXeAFFKE/
         d5+Yx24UTr8EuPay2xBO2QkSphdbrLFPSkqmd351ooGBqm+1CnMAD8DdMkfb7NerISxP
         7mkvjLZxrCmbInMgkOvRsf1/xXov6LDHvpROg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iTqTgZZVPcHur4ir72Zm6jriTBFysIHApeXSgPETKzY=;
        b=LCLNFXFNxyoj4CYiMbupcYYZT7AVdoj9o+BK4H11bJD4uGjJiGqrzzDZwCShrhCKfA
         g1z7/3sXRx4wDfIzv8uKqgPajPEUySOofE6RohHAFQn87TwK1ikG2xjkVUAV1lzpeZmi
         suATT0y8dccokPjSXhizi95HTv7McO7MqTv11qc4N6v7bIBnVrPsAu/m+6/TRiuDfStp
         X8RObL4wEDUKYgG8VHJMPZY1JsLIpRX5EAGyA/XU8XcvpXq64Z0uRCSKROlpY37AhqBY
         urB1Lj2n9J995XjAvle6AoGP3SPzHDOKUKoRto/z6tevZfT9s4Cj5z4QPVhZNi5DD7sf
         zaFA==
X-Gm-Message-State: ANoB5pmczbxMOzKmvlL9eS0h4ASbVQQh7GTsmqkkPbt2yqFVOKEhSJxs
        39Ov5JkCkAshAJigYbJJMTxK17T94zo2qF3EFEQTqQ==
X-Google-Smtp-Source: AA0mqf4uJK6xmmkcy0DbmopiWQIfYRWzSsGguvQ75ijiLZdjrbFVHaDuEpUfzy2ywAK59n9HUhAbmq2ai7zD1+42AAU=
X-Received: by 2002:a05:6402:d69:b0:46a:392b:2440 with SMTP id
 ec41-20020a0564020d6900b0046a392b2440mr2475553edb.341.1669220582842; Wed, 23
 Nov 2022 08:23:02 -0800 (PST)
MIME-Version: 1.0
References: <3d8607b4-973d-945d-c184-260157ade7c3@amd.com> <CAKMK7uHVGgGHTiXYOfseXXda2Ug992nYvhPsL+4z18ssqeHXHQ@mail.gmail.com>
 <b05e6091-4e07-1e32-773d-f603ac9ac98b@gmail.com> <CAKMK7uFjmzewqv3r4hL9hvLADwV536n2n6xbAWaUvmAcStr5KQ@mail.gmail.com>
 <Y34WI9SZdiH/p1tA@ziepe.ca> <f8f844a5-0910-d19a-5aea-df7a1d83b1d3@gmail.com>
 <Y34XvmtHfb4ZwopN@ziepe.ca> <dc2a9d7f-192b-e9d8-b1d1-3b868cb1fd44@gmail.com>
 <Y34gBUl0m+j1JdFk@ziepe.ca> <CAKMK7uHWyOcZ77-+GY7hxFUA65uQYFe0fw2rww6Y-rLXvHFAYw@mail.gmail.com>
 <Y342emkzKHXLQvsN@ziepe.ca>
In-Reply-To: <Y342emkzKHXLQvsN@ziepe.ca>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Wed, 23 Nov 2022 17:22:50 +0100
Message-ID: <CAKMK7uEXybD3iV7dDjcaP=joY-kE8aZZ5odCsjUBpatJe=Sd=Q@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] Re: [PATCH] dma-buf: Require VM_PFNMAP vma for mmap
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        John Stultz <john.stultz@linaro.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 23 Nov 2022 at 16:04, Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Wed, Nov 23, 2022 at 03:28:27PM +0100, Daniel Vetter wrote:
>
> > > This patch is known to be broken in so many ways. It also has a major
> > > security hole that it ignores the PTE flags making the page
> > > RO. Ignoring the special bit is somehow not surprising :(
> > >
> > > This probably doesn't work, but is the general idea of what KVM needs
> > > to do:
> >
> > Oh dear, when I dug around in there I entirely missed that
> > kvm_try_get_pfn exists, and it's very broken indeed. kvm really needs
> > to grow a proper mmu notifier.
> >
> > Another thing I'm wondering right now, the follow_pte();
> > fixup_user_fault(); follow_pte(); approach does not make any
> > guarantees of actually being right. If you're sufficiently unlucky you
> > might race against an immediate pte invalidate between the fixup and
> > the 2nd follow_pte(). But you can also not loop, because that would
> > fail to catch permanent faults.
>
> Yes, it is pretty broken.
>
> kvm already has support for mmu notifiers and uses it for other
> stuff. I can't remember what exactly this code path was for, IIRC
> Paolo talked about having a big rework/fix for it when we last talked
> about the missing write protect. I also vauagely recall he had some
> explanation why this might be safe.
>
> > I think the iommu fault drivers have a similar pattern.
>
> Where? It shouldn't
>
> The common code for SVA just calls handle_mm_fault() and restarts the
> PRI. Since the page table is physically shared there is no issue with
> a stale copy.
>
> > What am I missing here? Or is that also just broken. gup works around
> > this with the slow path that takes the mmap sem and walking the vma
> > tree, follow_pte/fixup_user_fautl users dont.
>
> follow_pte() is just fundamentally broken, things must not use it.
>
> > Maybe mmu notifier based restarting would help with this too, if
> > done properly.
>
> That is called hmm_range_fault()

Ah right I mixed that up on a quick grep, thanks for pointing me in
the right direction. Worries appeased.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
