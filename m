Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65F5B327A6A
	for <lists+linux-media@lfdr.de>; Mon,  1 Mar 2021 10:07:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233604AbhCAJGk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Mar 2021 04:06:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233537AbhCAJGW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Mar 2021 04:06:22 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E18C8C06174A
        for <linux-media@vger.kernel.org>; Mon,  1 Mar 2021 01:05:41 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id d15so2777wrv.5
        for <linux-media@vger.kernel.org>; Mon, 01 Mar 2021 01:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=cVbwaILawr8VFjKUKwesruDRur2V1zj4ivYNWTbHSSk=;
        b=BZfedt8pZjPTo5WI0bg6pW9A+sh/sGhTCalJ3ZYZK41IyQfNQcFaAUUpOcbKUO4MDM
         5W8Euj0XmnMnhOIZXWHMLTFMJzdhto7V00oQF/Ma14cTU98ee9/fUVZJy7Zg5FwX2TtA
         Go7BWlZnS0BoTZyrQ9sinmcNCgRkLtZnbTDpc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=cVbwaILawr8VFjKUKwesruDRur2V1zj4ivYNWTbHSSk=;
        b=dr7Z+MY3ep+OqtCkr1JpYAVRbPB57ZjYXKr4TpHXfbUAJEH/kULEtfniryouHCWjlL
         Rbr+uwagVCPJB72gmK3lJ1EYZWc0hHPdFrlT8AUQc9NGB5pj3IYwT1g5QY5BoHTHm2EU
         QbE2Mb1MdPX4Gs/RLTdEVPIOLkuPValbJhH58EbhlR3yTkHvp+MGkiAf4Wsq4ztQpND9
         Kjv6QS7O0U9ikjGPT3YpdhGVXKhelXw/chU3BrP34MN0yYb3cztLKUSrYMp12Senqogw
         lGNYWiTYXeFjwLz6T6bxOhCE+7Vz3j1vYTrqPSt8WsXGY1VofC8iZFFph1OXruilUt7o
         t1fg==
X-Gm-Message-State: AOAM530spRbJfRCl05wymkWlFI/Cun4B837tHux/ujbHXOYLprEYLMTw
        CNVChofAGHftz9tu2jbnQtsftA==
X-Google-Smtp-Source: ABdhPJwbxk9JTsmEAmPPb6Sdkee8KtxRRRHjT6lI6Dvpux7/UqbYuCRW2gXVLVTMIID9pGDYw8LWZQ==
X-Received: by 2002:adf:e8c9:: with SMTP id k9mr15735421wrn.315.1614589540614;
        Mon, 01 Mar 2021 01:05:40 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id j16sm1090049wmi.2.2021.03.01.01.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 01:05:40 -0800 (PST)
Date:   Mon, 1 Mar 2021 10:05:38 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thomas =?iso-8859-1?Q?Hellstr=F6m_=28Intel=29?= 
        <thomas_os@shipmail.org>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Matthew Wilcox <willy@infradead.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, Jason Gunthorpe <jgg@ziepe.ca>,
        John Stultz <john.stultz@linaro.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] dma-buf: Require VM_PFNMAP vma for
 mmap
Message-ID: <YDyuYk8x5QeX83s6@phenom.ffwll.local>
References: <f43311c8-a02a-1a29-a53b-88e599c92187@shipmail.org>
 <CAKMK7uE2UrOruQPWG9KPBQ781f9Bq9xpVRNserAC9BZ2VzDutQ@mail.gmail.com>
 <b30dacb0-edea-0a3c-6163-0f329e58ba61@gmail.com>
 <YDd/hlf8uM3+lxhr@phenom.ffwll.local>
 <CAKMK7uFezcV52oTZbHeve2HFFATeCGyK6zTT6nE1KVP69QRr0A@mail.gmail.com>
 <61c5c371-debe-4ca0-a067-ce306e51ef88@shipmail.org>
 <CAKMK7uFUiJyMP0E5JUzMOx=NyMW+ZObGsaFOh409x0LOvGbnzg@mail.gmail.com>
 <0d69bd00-e673-17cf-c9e3-ccbcd52649a6@shipmail.org>
 <CAKMK7uE=8+hj-MUFXHFoG_hAbz_Obi8a99+DE5_d1K+KZaG+tQ@mail.gmail.com>
 <b367b7e8-f202-4d23-d672-a5c9bc7fcec1@shipmail.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b367b7e8-f202-4d23-d672-a5c9bc7fcec1@shipmail.org>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Mar 01, 2021 at 09:39:53AM +0100, Thomas Hellström (Intel) wrote:
> Hi,
> 
> On 3/1/21 9:28 AM, Daniel Vetter wrote:
> > On Sat, Feb 27, 2021 at 9:06 AM Thomas Hellström (Intel)
> > <thomas_os@shipmail.org> wrote:
> > > On 2/26/21 2:28 PM, Daniel Vetter wrote:
> > > > So I think it stops gup. But I haven't verified at all. Would be good
> > > > if Christian can check this with some direct io to a buffer in system
> > > > memory.
> > > Hmm,
> > > 
> > > Docs (again vm_normal_page() say)
> > > 
> > >    * VM_MIXEDMAP mappings can likewise contain memory with or without "struct
> > >    * page" backing, however the difference is that _all_ pages with a struct
> > >    * page (that is, those where pfn_valid is true) are refcounted and
> > > considered
> > >    * normal pages by the VM. The disadvantage is that pages are refcounted
> > >    * (which can be slower and simply not an option for some PFNMAP
> > > users). The
> > >    * advantage is that we don't have to follow the strict linearity rule of
> > >    * PFNMAP mappings in order to support COWable mappings.
> > > 
> > > but it's true __vm_insert_mixed() ends up in the insert_pfn() path, so
> > > the above isn't really true, which makes me wonder if and in that case
> > > why there could any longer ever be a significant performance difference
> > > between MIXEDMAP and PFNMAP.
> > Yeah it's definitely confusing. I guess I'll hack up a patch and see
> > what sticks.
> > 
> > > BTW regarding the TTM hugeptes, I don't think we ever landed that devmap
> > > hack, so they are (for the non-gup case) relying on
> > > vma_is_special_huge(). For the gup case, I think the bug is still there.
> > Maybe there's another devmap hack, but the ttm_vm_insert functions do
> > use PFN_DEV and all that. And I think that stops gup_fast from trying
> > to find the underlying page.
> > -Daniel
> 
> Hmm perhaps it might, but I don't think so. The fix I tried out was to set
> 
> PFN_DEV | PFN_MAP for huge PTEs which causes pfn_devmap() to be true, and
> then
> 
> follow_devmap_pmd()->get_dev_pagemap() which returns NULL and gup_fast()
> backs off,
> 
> in the end that would mean setting in stone that "if there is a huge devmap
> page table entry for which we haven't registered any devmap struct pages
> (get_dev_pagemap returns NULL), we should treat that as a "special" huge
> page table entry".
> 
> From what I can tell, all code calling get_dev_pagemap() already does that,
> it's just a question of getting it accepted and formalizing it.

Oh I thought that's already how it works, since I didn't spot anything
else that would block gup_fast from falling over. I guess really would
need some testcases to make sure direct i/o (that's the easiest to test)
fails like we expect.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
