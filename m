Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EE796362AF
	for <lists+linux-media@lfdr.de>; Wed, 23 Nov 2022 16:04:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236429AbiKWPEb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Nov 2022 10:04:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235955AbiKWPEa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Nov 2022 10:04:30 -0500
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8147BDB1
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 07:04:29 -0800 (PST)
Received: by mail-qv1-xf36.google.com with SMTP id d13so6584740qvj.8
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 07:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FBEH7FU3hds/tvKbXdMlXPtYdkYQK2zhDrcZFkrz0mE=;
        b=KbvhaD/OFUhW+1OPwGfqfp9mQ5zjYM5Yc3gcYSNfC0GNXLuvDL6Tt9tkh6TO6Q/M+e
         MPgnHS9/c+nXmkVvB0y+LvWp1Yg4X/GBbBaNettvziGu79P/qHdJWhmD1yDQsjIOPzfe
         HX1V+FBxFpvFta6LJiUWXtALCwxl1RaSpmdhNQUSaBXPCKJ7BUeKj8L5AfxcGhQYXt9r
         4Y0uneLWW86LvWjmM6Z8keD/8toP38iA5CPOlGq0eqX859PaMBK4R6S9XK+13DwqF0U2
         cIjGBN2XTpw58MVf2q4r64z5xLMIIFSO6I57I/RmQdleSVDnMQ1IAT+TJruJ+BHv3Cf5
         23uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FBEH7FU3hds/tvKbXdMlXPtYdkYQK2zhDrcZFkrz0mE=;
        b=c1Z2JRt7dF43PAYqS7QLy4FO/ciic/QY/gFZjs+GMULin+yWo+7dYmsdQ9IqK/XYWx
         26sSrm2LPvYO1oazFI8pDrGGTuqu3DzXZYdshxAm1SWJdZcc5Roy1dONcYDQ/edcJqLE
         A2ifZLdF+hqqtaf7cV4Y44DX2mfxvCq7GFZXc5rkAt5ikX3y8COtBDiHUI/a4KE0r/oL
         3CeoBMoGDp6ruBrRYOe/nhfO6TIMBzCIXPnPyEj5srluqP+GRARfx2oaowZN3nFrxzSH
         44w5WHN7FcEW6RCzCYYMwusGmeBOT2RmuHA2RNEyj4zWvIjQtRcZUwsoJqNU+bnHG1/N
         4wDg==
X-Gm-Message-State: ANoB5pkVRGdEDgzcFWsWczLoYpkkTrsATh/Ru8j0wNrBWCUNhvfne+NU
        4ogLhFpDjJEk5HTaebwhptuBcA==
X-Google-Smtp-Source: AA0mqf56pidAa3YTB06LY1QYSMl3063l/28XS7JhvQ9qi9gepPYorNcNhgDN/VcYdvMsrmMwORDsaQ==
X-Received: by 2002:ad4:5445:0:b0:4c6:62af:5e14 with SMTP id h5-20020ad45445000000b004c662af5e14mr10912011qvt.95.1669215868434;
        Wed, 23 Nov 2022 07:04:28 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-47-55-122-23.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.122.23])
        by smtp.gmail.com with ESMTPSA id ey10-20020a05622a4c0a00b003a5fb681ae7sm9891959qtb.3.2022.11.23.07.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 07:04:27 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.95)
        (envelope-from <jgg@ziepe.ca>)
        id 1oxrIY-00AMYp-BS;
        Wed, 23 Nov 2022 11:04:26 -0400
Date:   Wed, 23 Nov 2022 11:04:26 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        John Stultz <john.stultz@linaro.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [Linaro-mm-sig] Re: [PATCH] dma-buf: Require VM_PFNMAP vma for
 mmap
Message-ID: <Y342emkzKHXLQvsN@ziepe.ca>
References: <3d8607b4-973d-945d-c184-260157ade7c3@amd.com>
 <CAKMK7uHVGgGHTiXYOfseXXda2Ug992nYvhPsL+4z18ssqeHXHQ@mail.gmail.com>
 <b05e6091-4e07-1e32-773d-f603ac9ac98b@gmail.com>
 <CAKMK7uFjmzewqv3r4hL9hvLADwV536n2n6xbAWaUvmAcStr5KQ@mail.gmail.com>
 <Y34WI9SZdiH/p1tA@ziepe.ca>
 <f8f844a5-0910-d19a-5aea-df7a1d83b1d3@gmail.com>
 <Y34XvmtHfb4ZwopN@ziepe.ca>
 <dc2a9d7f-192b-e9d8-b1d1-3b868cb1fd44@gmail.com>
 <Y34gBUl0m+j1JdFk@ziepe.ca>
 <CAKMK7uHWyOcZ77-+GY7hxFUA65uQYFe0fw2rww6Y-rLXvHFAYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uHWyOcZ77-+GY7hxFUA65uQYFe0fw2rww6Y-rLXvHFAYw@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 23, 2022 at 03:28:27PM +0100, Daniel Vetter wrote:

> > This patch is known to be broken in so many ways. It also has a major
> > security hole that it ignores the PTE flags making the page
> > RO. Ignoring the special bit is somehow not surprising :(
> >
> > This probably doesn't work, but is the general idea of what KVM needs
> > to do:
> 
> Oh dear, when I dug around in there I entirely missed that
> kvm_try_get_pfn exists, and it's very broken indeed. kvm really needs
> to grow a proper mmu notifier.
> 
> Another thing I'm wondering right now, the follow_pte();
> fixup_user_fault(); follow_pte(); approach does not make any
> guarantees of actually being right. If you're sufficiently unlucky you
> might race against an immediate pte invalidate between the fixup and
> the 2nd follow_pte(). But you can also not loop, because that would
> fail to catch permanent faults.

Yes, it is pretty broken.

kvm already has support for mmu notifiers and uses it for other
stuff. I can't remember what exactly this code path was for, IIRC
Paolo talked about having a big rework/fix for it when we last talked
about the missing write protect. I also vauagely recall he had some
explanation why this might be safe.

> I think the iommu fault drivers have a similar pattern.

Where? It shouldn't

The common code for SVA just calls handle_mm_fault() and restarts the
PRI. Since the page table is physically shared there is no issue with
a stale copy.

> What am I missing here? Or is that also just broken. gup works around
> this with the slow path that takes the mmap sem and walking the vma
> tree, follow_pte/fixup_user_fautl users dont.

follow_pte() is just fundamentally broken, things must not use it.

> Maybe mmu notifier based restarting would help with this too, if
> done properly.

That is called hmm_range_fault()

Jason
