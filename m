Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 748B76362EA
	for <lists+linux-media@lfdr.de>; Wed, 23 Nov 2022 16:10:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238282AbiKWPJ5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Nov 2022 10:09:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238404AbiKWPJg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Nov 2022 10:09:36 -0500
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 322EE6154
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 07:09:01 -0800 (PST)
Received: by mail-qv1-xf30.google.com with SMTP id df6so10085216qvb.0
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 07:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yl5EWh2LPGXKg4ZX+0uMGR+SP4+5g4wansDQ2racGIw=;
        b=UZ90yvpYHpAD2wJFcceeqxHp5n/1J/IMdboyjPLp9xSvgX7lhd9bIH3J7mYPJrCrgH
         tIUHI5mfCyqHqL/FPnEKA2O3D4UL7ejl7s4SZWtCiLkQMQ0C9Vp59OLuPUd9l9rtsP/H
         5KMfSJskvLx0jvavXd2BcujWMJkK2mF1Y/bBE2Auf5ZuOkr+OEzP+TYvNGzpLDMh1E/b
         /tk+XGOAsg1BHi8GoUKfhHIo0iTmbkce9zo9I7xuGjeffWnbCQMDz+hFZmGT49zCWuvX
         8So0XmT6Euoi53OroYVLDNKa4yZxbJs5xlXojPLsNHKLC7aadu52zmFmfAidIVRVxdfh
         /nVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yl5EWh2LPGXKg4ZX+0uMGR+SP4+5g4wansDQ2racGIw=;
        b=YmlFmCP6wb3XYkGPU3xTyW0/5CEeRe1zuVO0q4jpTPJlHYYc+t/mpQlBMskPKyZr4Y
         r5Q8XjaZrAe7swRox793LpxIGqbnZDSO9yu7d9HLCVCiRE+HsOfIFyPluJw9cZ2Ds0UR
         pJ5+iVwLJg6YjWHVr/VDRT/0Hb+Dyqrdz1SCEJmekCuRkDiAItU0rf3Y4Ae5ujp1ULZ8
         UO2TEOkZNN/l6xaL0Yvu8qcbrZEW+gis/NA7Tr+9q6VICABwFGqZ0agHEWErG5/cnSGO
         jE55W6SBS1FleSMzZbcERuM0eFMd49SP5dqgkAKTBberTet0qP7qb91auTvxE4cN1OkS
         n2Wg==
X-Gm-Message-State: ANoB5pnEP0zm/Nh6It1/tyskAE3da4NeWGGCvqQZ9KCrA+KUI8uvlzgb
        6ziJ/hR6f2JMllIOU/NEsI5CBoycMwAu3A==
X-Google-Smtp-Source: AA0mqf7e8Ogh/ZJOSZP+2cSLpyEbwDySY9r7p8UtFKlyBZNWj/XPJyjVbU2TWKfbCouXJyhbUXJI9w==
X-Received: by 2002:a0c:b405:0:b0:4bb:666c:384d with SMTP id u5-20020a0cb405000000b004bb666c384dmr27071486qve.91.1669216140695;
        Wed, 23 Nov 2022 07:09:00 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-47-55-122-23.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.122.23])
        by smtp.gmail.com with ESMTPSA id ca9-20020a05622a1f0900b00398a7c860c2sm10023130qtb.4.2022.11.23.07.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 07:08:59 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.95)
        (envelope-from <jgg@ziepe.ca>)
        id 1oxrMw-00AMdR-Vh;
        Wed, 23 Nov 2022 11:08:58 -0400
Date:   Wed, 23 Nov 2022 11:08:58 -0400
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
Message-ID: <Y343ijGoqyf73d+I@ziepe.ca>
References: <3d8607b4-973d-945d-c184-260157ade7c3@amd.com>
 <CAKMK7uHVGgGHTiXYOfseXXda2Ug992nYvhPsL+4z18ssqeHXHQ@mail.gmail.com>
 <b05e6091-4e07-1e32-773d-f603ac9ac98b@gmail.com>
 <CAKMK7uFjmzewqv3r4hL9hvLADwV536n2n6xbAWaUvmAcStr5KQ@mail.gmail.com>
 <Y34WI9SZdiH/p1tA@ziepe.ca>
 <f8f844a5-0910-d19a-5aea-df7a1d83b1d3@gmail.com>
 <Y34XvmtHfb4ZwopN@ziepe.ca>
 <dc2a9d7f-192b-e9d8-b1d1-3b868cb1fd44@gmail.com>
 <Y34gBUl0m+j1JdFk@ziepe.ca>
 <CAKMK7uEzaUjroODbWe4DtxHQ+gmr7_DVK+fUJjAgMsgP61uGSQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uEzaUjroODbWe4DtxHQ+gmr7_DVK+fUJjAgMsgP61uGSQ@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 23, 2022 at 03:34:54PM +0100, Daniel Vetter wrote:
> > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > index 1376a47fedeedb..4161241fc3228c 100644
> > --- a/virt/kvm/kvm_main.c
> > +++ b/virt/kvm/kvm_main.c
> > @@ -2598,6 +2598,19 @@ static int hva_to_pfn_remapped(struct vm_area_struct *vma,
> >                         return r;
> >         }
> >
> > +       /*
> > +        * Special PTEs are never convertible into a struct page, even if the
> > +        * driver that owns them might have put a PFN with a struct page into
> > +        * the PFNMAP. If the arch doesn't support special then we cannot
> > +        * safely process these pages.
> > +        */
> > +#ifdef CONFIG_ARCH_HAS_PTE_SPECIAL
> > +       if (pte_special(*ptep))
> > +               return -EINVAL;
> 
> On second thought this wont work, because it completely defeats the
> point of why this code here exists. remap_pfn_range() (which is what
> the various dma_mmap functions and the ioremap functions are built on
> top of too) sets VM_PFNMAP too, so this check would even catch the
> static mappings.

The problem with the way this code is designed is how it allows
returning the pfn without taking any reference based on things like
!pfn_valid or page_reserved. This allows it to then conditionally put
back the reference based on the same reasoning. It is impossible to
thread pte special into that since it is a PTE flag, not a property of
the PFN.

I don't entirely understand why it needs the page reference at all,
even if it is available - so I can't guess why it is OK to ignore the
page reference in other cases, or why it is OK to be racy..

Eg hmm_range_fault() does not obtain page references and implements a
very similar algorithm to kvm.

> Plus these static mappings aren't all that static either, e.g. pci
> access also can revoke bar mappings nowadays.

And there are already mmu notifiers to handle that, AFAIK.

Jason
