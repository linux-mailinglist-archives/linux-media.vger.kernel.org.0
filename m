Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DAB8125719
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2019 23:45:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbfLRWpL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Dec 2019 17:45:11 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:46392 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726636AbfLRWpK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Dec 2019 17:45:10 -0500
Received: by mail-lf1-f65.google.com with SMTP id f15so2852898lfl.13
        for <linux-media@vger.kernel.org>; Wed, 18 Dec 2019 14:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YrrQW+o6yoR9HJnH1mwKSC9v5iWno6eigHp0EBk4LR0=;
        b=bdF7Zv0VTafIoorJswX48t2yxXJBYxcvjHgrT2SGIIMh8SxTaUWksloPDk4hj8pN+b
         8Wy7ZGVYH0fWsHmH/IMJnBSfIeVts/sOmiy4I/nlOeq68AiZoaQ1Mqh2e43FlXq9gRLG
         KshnO+IUvlyZD7e2bgfiCpZOkUn91XMsyCwRx9hGVqlfs3W1si7CDXXM3vtqSXuMWY78
         Tae1sOhSYoNDJLrJgal+3cpj+/6xa05u+pWrMRgdVnIo9FZyRNB0aI0+sHon8/zGouR0
         pqwpw4LUVoV4NK9FktzSrs+SeQWsHdxx0QqmCUwextJEn9FOXazhfjjyb53FWNWWcUXk
         GNTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YrrQW+o6yoR9HJnH1mwKSC9v5iWno6eigHp0EBk4LR0=;
        b=ozQBjw2ng7rmBmMtM4P6QMU8OQHJrm8gdNIqYR4JA6OLyyJEEq5YK51YiFqEAINw+X
         mKIZy8iD2ZHYcH2mKhUEQeqouNQ1Nnub56MfGIs6hlJ+s62FZyPAOb87lW/INgsz93UD
         ZZMuHxamrUnBV4dJFmQ0iN5cRLVdfq6HH7JSK6BpJoJTW8QKBNGahgHRRCadBsT3c8eW
         SE/fEKnfxMczQmZySBbG1U4d8nlBOK8dzL8Tt0rWxp0xHl/5DuC7/GZJ1L9XFdXYNhhh
         yp7GYXJfBWy0T8vqsO/dT0y2e18FMrkAn7fYGnoyWfNiKWjMrToqLAMaO5Wrp7x1o2xw
         ukOg==
X-Gm-Message-State: APjAAAUsEOcrm43vqWd3wcyyFQwYMltwZuLe31Y4ECDKDC3CeVOsfBVo
        VfuvWU8zppi1o2VbEuVjXPMrBA==
X-Google-Smtp-Source: APXvYqwPbC3mnICecXB2mktdTfANDFTtD1oSKWMGw8lhRk6/u/eXjGq156/mWoszLGq/OpGErs59TQ==
X-Received: by 2002:a19:6a06:: with SMTP id u6mr3341913lfu.187.1576709107276;
        Wed, 18 Dec 2019 14:45:07 -0800 (PST)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id t6sm1792834ljj.62.2019.12.18.14.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 14:45:06 -0800 (PST)
Received: by box.localdomain (Postfix, from userid 1000)
        id 380451012E3; Thu, 19 Dec 2019 01:45:07 +0300 (+03)
Date:   Thu, 19 Dec 2019 01:45:07 +0300
From:   "Kirill A. Shutemov" <kirill@shutemov.name>
To:     John Hubbard <jhubbard@nvidia.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Alex Williamson <alex.williamson@redhat.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
        Christoph Hellwig <hch@infradead.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dave Chinner <david@fromorbit.com>,
        David Airlie <airlied@linux.ie>,
        "David S . Miller" <davem@davemloft.net>,
        Ira Weiny <ira.weiny@intel.com>, Jan Kara <jack@suse.cz>,
        Jason Gunthorpe <jgg@ziepe.ca>, Jens Axboe <axboe@kernel.dk>,
        Jonathan Corbet <corbet@lwn.net>,
        =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
        Magnus Karlsson <magnus.karlsson@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michal Hocko <mhocko@suse.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Paul Mackerras <paulus@samba.org>,
        Shuah Khan <shuah@kernel.org>,
        Vlastimil Babka <vbabka@suse.cz>, bpf@vger.kernel.org,
        dri-devel@lists.freedesktop.org, kvm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rdma@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org,
        linux-mm@kvack.org, LKML <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v11 01/25] mm/gup: factor out duplicate code from four
 routines
Message-ID: <20191218224507.nayxmx7vvsjvyzsc@box>
References: <20191216222537.491123-1-jhubbard@nvidia.com>
 <20191216222537.491123-2-jhubbard@nvidia.com>
 <20191218155211.emcegdp5uqgorfwe@box>
 <5719efc4-e560-b3d9-8d1f-3ae289bed289@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5719efc4-e560-b3d9-8d1f-3ae289bed289@nvidia.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Dec 18, 2019 at 02:15:53PM -0800, John Hubbard wrote:
> On 12/18/19 7:52 AM, Kirill A. Shutemov wrote:
> > On Mon, Dec 16, 2019 at 02:25:13PM -0800, John Hubbard wrote:
> > > +static void put_compound_head(struct page *page, int refs)
> > > +{
> > > +	/* Do a get_page() first, in case refs == page->_refcount */
> > > +	get_page(page);
> > > +	page_ref_sub(page, refs);
> > > +	put_page(page);
> > > +}
> > 
> > It's not terribly efficient. Maybe something like:
> > 
> > 	VM_BUG_ON_PAGE(page_ref_count(page) < ref, page);
> > 	if (refs > 2)
> > 		page_ref_sub(page, refs - 1);
> > 	put_page(page);
> > 
> > ?
> 
> OK, but how about this instead? I don't see the need for a "2", as that
> is a magic number that requires explanation. Whereas "1" is not a magic
> number--here it means: either there are "many" (>1) refs, or not.

Yeah, it's my thinko. Sure, it has to be '1' (or >= 2, which is less readable).

> And the routine won't be called with refs less than about 32 (2MB huge
> page, 64KB base page == 32 subpages) anyway.

It's hard to make predictions about future :P

> 	VM_BUG_ON_PAGE(page_ref_count(page) < refs, page);
> 	/*
> 	 * Calling put_page() for each ref is unnecessarily slow. Only the last
> 	 * ref needs a put_page().
> 	 */
> 	if (refs > 1)
> 		page_ref_sub(page, refs - 1);
> 	put_page(page);

Looks good to me.

-- 
 Kirill A. Shutemov
