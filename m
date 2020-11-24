Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF8F22C2C0D
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 16:56:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389925AbgKXPzb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 10:55:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389653AbgKXPzb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 10:55:31 -0500
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99DC6C061A4E
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 07:55:29 -0800 (PST)
Received: by mail-qk1-x744.google.com with SMTP id z188so9420423qke.9
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 07:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oaa+hWx1KaHAmS3DtMmmCm5kDyFbE+baLseZRB4QB5M=;
        b=O5+yyy3ugn3/JU8d8MzJuhxMQSAXmFG+K4qLwFzZz9R/0yzGmphek8afsqJ5XmaX7K
         QFgr2UTIeMkWtrEUfgUgKbsoR4KB1EzCADhT2doRjFOEg0XNrQLFT7UfegvU6LtETQdH
         BNfxI2uepF2ckC2z3Hg3jdCWPASQ46yKLRwg1QiNwPCb0sAmz1+AfFialcU6UizGRLb/
         cFkrXVxqj0abamYnuOiwNBjY7IEIegPAbiNZQupZKDH6jzAd8pc/L3Rexp2KSypUx3WN
         r58Z5/hOA1lt5wCiVxmAus+J+0CeYWzJLI1kYadqPB7BHX4GvlOoLo7sQ3sz3WRenNdb
         j0ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oaa+hWx1KaHAmS3DtMmmCm5kDyFbE+baLseZRB4QB5M=;
        b=iEPKQdlz0rU8fld4rIcDngiCgPkdTFnTDX5PVhel0T+7mdJ0M96NG1WV20HRoiDweA
         192KHKrYFFykl3X6H9JPSnW/frZjtdEG/vVOZUCE+oAbPc7ZekvHxJYXmUpMoVbTUZgD
         LWfYOPMd5sEk5cUVQ17G5WPts8xc1NjlR8h1zHekT4oD6U7gUc6/Vlf/R9JjLuXCyx/h
         g8EezMSkUHBw60HDseug7mI7GRhH89vjNzsMO11EVLa6dK68qROtTMjkKn0WYWHrqOiQ
         GlBqI+Pv7WKNRUXJQsh9efIJ67QDoGZ43H4ksg3aPO58y3F07OFPzGhJ1FHaiMrt2OAC
         0tBA==
X-Gm-Message-State: AOAM533+V3qtEMSDlvPXELoWCPMosvb1qIKBfDfeYngF74fR1MzQ5CvS
        m1mWk4Dv6vACwgNl8GL2rzW45C4kKlZktr71
X-Google-Smtp-Source: ABdhPJzKvpnJwdDviRxMRDTdGK9+HHkdY7h1hzFeJT5r8VTnR/8g0865BSrf5PrqIcB8Qlf6akZbcQ==
X-Received: by 2002:a05:620a:2106:: with SMTP id l6mr5371085qkl.302.1606233328732;
        Tue, 24 Nov 2020 07:55:28 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id x24sm12795492qkx.23.2020.11.24.07.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 07:55:27 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1khaf8-000pJU-UM; Tue, 24 Nov 2020 11:55:26 -0400
Date:   Tue, 24 Nov 2020 11:55:26 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org,
        linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Daniel Vetter <daniel.vetter@intel.com>,
        Christoph Hellwig <hch@infradead.org>,
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>
Subject: Re: [PATCH v6 17/17] RFC: mm: add mmu_notifier argument to follow_pfn
Message-ID: <20201124155526.GH5487@ziepe.ca>
References: <20201119144146.1045202-1-daniel.vetter@ffwll.ch>
 <20201119144146.1045202-18-daniel.vetter@ffwll.ch>
 <20201120183029.GQ244516@ziepe.ca>
 <20201124142814.GM401619@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201124142814.GM401619@phenom.ffwll.local>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 24, 2020 at 03:28:14PM +0100, Daniel Vetter wrote:
> On Fri, Nov 20, 2020 at 02:30:29PM -0400, Jason Gunthorpe wrote:
> > On Thu, Nov 19, 2020 at 03:41:46PM +0100, Daniel Vetter wrote:
> > > @@ -4805,21 +4824,15 @@ EXPORT_SYMBOL(follow_pte_pmd);
> > >   * Return: zero and the pfn at @pfn on success, -ve otherwise.
> > >   */
> > >  int follow_pfn(struct vm_area_struct *vma, unsigned long address,
> > > -	unsigned long *pfn)
> > > +	unsigned long *pfn, struct mmu_notifier *subscription)
> > >  {
> > > -	int ret = -EINVAL;
> > > -	spinlock_t *ptl;
> > > -	pte_t *ptep;
> > > +	if (WARN_ON(!subscription->mm))
> > > +		return -EINVAL;
> > >  
> > > +	if (WARN_ON(subscription->mm != vma->vm_mm))
> > > +		return -EINVAL;
> > 
> > These two things are redundant right? vma->vm_mm != NULL?
> 
> Yup, will remove.
> 
> > BTW, why do we even have this for nommu? If the only caller is kvm,
> > can you even compile kvm on nommu??
> 
> Kinda makes sense, but I have no idea how to make sure with compile
> testing this is really the case. And I didn't see any hard evidence in
> Kconfig or Makefile that mmu notifiers requires CONFIG_MMU. So not sure
> what to do here.

It looks like only some arches have selectable CONFIG_MMU: arm,
m68k, microblaze, riscv, sh

If we look at arches that work with HAVE_KVM, I only see: arm64, mips,
powerpc, s390, x86

So my conclusion is there is no intersection between !MMU and HAVE_KVM?

> Should I just remove the nommu version of follow_pfn and see what happens?
> We can't remove it earlier since it's still used by other
> subsystems.

This is what I was thinking might work

Jason
