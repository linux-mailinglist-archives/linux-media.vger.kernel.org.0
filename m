Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2B532C299A
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 15:30:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389010AbgKXO2T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 09:28:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389006AbgKXO2T (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 09:28:19 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEFD7C061A4E
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 06:28:18 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id r17so22575689wrw.1
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 06:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=KSq6GECp1i25ezV0Y6T/3NvT3N3r3AJ5cEVxbDW0CLw=;
        b=M8OKVKLPb+FMINuPALRG9V3PVI91CXQvXh6el7xGRjUkVyzBaQH4KHu/tMBmJ5taDe
         59iDiQDNm2o3xbPwv0oSLio8yFOJvro7J42g63pWYI73IIHBT3JzdvD1M0d8OksY+kMI
         XGPBgQVF+ghp0Mqq2KbUaYPWwm0MKVO12MAPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=KSq6GECp1i25ezV0Y6T/3NvT3N3r3AJ5cEVxbDW0CLw=;
        b=EoCWwaycWBSa5B1pYSNA2mLUOwxI1pal1FGIiqxzf8825U40snNfupUVXQ1G6WwYFc
         /ylGEIn7fL/fAXhAf1FZ3GW4nukQSuuSJrMkc/3eXAhnWYE3Pd28/rSRMKkKS6ZG9wY3
         R42CivFpsexrDjx9dzvOfWn3Zi0+IFgMEOUc+iSEptXsmsl4kJNtJHhxKBQdH7U+fDGM
         Zxfpw1SFwW8D7f5PaCfczxji/UerL+/HlXhjyPOs6nNhRhD0b/HSaCISU9S+A/8c2OsN
         XCLy70EHMeJn74v1EkAijC0kdKedRcslIx7K9wfgr2NtzdF1RQykORHG5w1N1OGo2Q49
         GKkg==
X-Gm-Message-State: AOAM53367YUAPGyKV1MxwHf3VJDHWazLnxwUE5biVZ1aWnioFrL9xB+8
        CTJ/A/4Xo1ZZmkQLUaBGdLdMvg==
X-Google-Smtp-Source: ABdhPJzYIyfiFO7Qic0f+2tVMFNssr9Nw0LvMxY+vwY4ywKdlugcFp6ONKZKvUGFaWMjY1vmdCWa+w==
X-Received: by 2002:a5d:610d:: with SMTP id v13mr5595456wrt.425.1606228097589;
        Tue, 24 Nov 2020 06:28:17 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id 35sm27158318wro.71.2020.11.24.06.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 06:28:16 -0800 (PST)
Date:   Tue, 24 Nov 2020 15:28:14 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org,
        linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Daniel Vetter <daniel.vetter@intel.com>,
        Christoph Hellwig <hch@infradead.org>,
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>
Subject: Re: [PATCH v6 17/17] RFC: mm: add mmu_notifier argument to follow_pfn
Message-ID: <20201124142814.GM401619@phenom.ffwll.local>
Mail-Followup-To: Jason Gunthorpe <jgg@ziepe.ca>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org,
        linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Daniel Vetter <daniel.vetter@intel.com>,
        Christoph Hellwig <hch@infradead.org>,
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>
References: <20201119144146.1045202-1-daniel.vetter@ffwll.ch>
 <20201119144146.1045202-18-daniel.vetter@ffwll.ch>
 <20201120183029.GQ244516@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201120183029.GQ244516@ziepe.ca>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Nov 20, 2020 at 02:30:29PM -0400, Jason Gunthorpe wrote:
> On Thu, Nov 19, 2020 at 03:41:46PM +0100, Daniel Vetter wrote:
> > @@ -4805,21 +4824,15 @@ EXPORT_SYMBOL(follow_pte_pmd);
> >   * Return: zero and the pfn at @pfn on success, -ve otherwise.
> >   */
> >  int follow_pfn(struct vm_area_struct *vma, unsigned long address,
> > -	unsigned long *pfn)
> > +	unsigned long *pfn, struct mmu_notifier *subscription)
> >  {
> > -	int ret = -EINVAL;
> > -	spinlock_t *ptl;
> > -	pte_t *ptep;
> > +	if (WARN_ON(!subscription->mm))
> > +		return -EINVAL;
> >  
> > +	if (WARN_ON(subscription->mm != vma->vm_mm))
> > +		return -EINVAL;
> 
> These two things are redundant right? vma->vm_mm != NULL?

Yup, will remove.

> BTW, why do we even have this for nommu? If the only caller is kvm,
> can you even compile kvm on nommu??

Kinda makes sense, but I have no idea how to make sure with compile
testing this is really the case. And I didn't see any hard evidence in
Kconfig or Makefile that mmu notifiers requires CONFIG_MMU. So not sure
what to do here.

Should I just remove the nommu version of follow_pfn and see what happens?
We can't remove it earlier since it's still used by other subsystems.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
