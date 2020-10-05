Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41372284304
	for <lists+linux-media@lfdr.de>; Tue,  6 Oct 2020 01:41:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726643AbgJEXlH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Oct 2020 19:41:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725947AbgJEXlH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Oct 2020 19:41:07 -0400
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com [IPv6:2607:f8b0:4864:20::f41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1D6DC0613CE
        for <linux-media@vger.kernel.org>; Mon,  5 Oct 2020 16:41:06 -0700 (PDT)
Received: by mail-qv1-xf41.google.com with SMTP id ev17so2760286qvb.3
        for <linux-media@vger.kernel.org>; Mon, 05 Oct 2020 16:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=leFIXUGGn9SrvRUt+tSmZlGo2xUCkAybN0CLyh7hEVg=;
        b=WQTRkabULDUNXgUOMkqWCf8k/DuyDViVSLHiUwqLBS7jFU4O4kB9U8Yezw3zLkcX+0
         N74emMID/Nf/tIrzUG3xn5IudsmLDLLSfJSFNjC86EZW2YCNxrAJ6Va1u5MyccDsjLiF
         PgIrU2vJ9V3he09nNerOKw2ijrvUXY3LxxxlUgWu78keT9R0r1XG2jEorE9lghUJYBq0
         HDLVZIOGBufu8D7pIs8xJwLhuITDMBS+p/adlJyEPM0KYtmP3MPKnG7vX+ZYICLgx/+H
         9Y3UojthIzYzht7NXCY0SCY8mLxjKGEXcgRu9Wjs6CR48TRqBN9ftH6xE+L/pIZNkLOu
         J6cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=leFIXUGGn9SrvRUt+tSmZlGo2xUCkAybN0CLyh7hEVg=;
        b=gK5Mh7Z3Nd4QzmBuBalkNFVcvKhV6xxPb3SFIRee0M3Wf/9hD+pbggXzCAuN6KFFwb
         2GluxE9X7e2MNFd/T4+PLFmVRwS6rEzVQPkUwHDmQyrqfuz5hdZK4Geh+Qiuivhmo6V2
         XdCKYip98gfGvBI+bej2Syu/dsjLGfpjfdVfvm+s3vhdoeRnHkEcqxcyWY/tJBnOFwKu
         s1EPxXWXGpLutvPFAhy2b50QfzpzZfgGZk3PpTq6WCmJg5kvpBYIX7h03nLdk84+tjPZ
         zNgivxugfMAq/TMlXdTbrCFy+GIWmSwGx+5xHj6/8s7Or2rSzZ/zwVZjq7EioZNXlaia
         BrCQ==
X-Gm-Message-State: AOAM533IDcNGqAtZVBUUbB5UVNypdluCasDUckBjMgq6cRpxuoS999ls
        wPxMgkRYeZ6xuxdKQZknQn+4mg==
X-Google-Smtp-Source: ABdhPJyH6Hj9DkTwkBpIGRlKmZqLkjKrSkdKR0kLJjsKJY55CJeobeIMUeExf41YR/ICDJqmfiJ9Hw==
X-Received: by 2002:a05:6214:136f:: with SMTP id c15mr2074483qvw.57.1601941266028;
        Mon, 05 Oct 2020 16:41:06 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id v30sm1069485qtj.52.2020.10.05.16.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 16:41:05 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kPa6K-000DCJ-94; Mon, 05 Oct 2020 20:41:04 -0300
Date:   Mon, 5 Oct 2020 20:41:04 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Dan Williams <dan.j.williams@intel.com>,
        Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Pawel Osciak <pawel@osciak.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>, Oded Gabbay <oded.gabbay@gmail.com>
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
Message-ID: <20201005234104.GD5177@ziepe.ca>
References: <CAKMK7uGF+y-r4swLXmodhduRMy0NPa=ASBY8JOXS_g=9Rq9XQw@mail.gmail.com>
 <20201002233118.GM9916@ziepe.ca>
 <CAKMK7uFP-XQHUPYeRhPx7tjvjARQiF-os9z9jx6WANV6sgSf6g@mail.gmail.com>
 <20201004125059.GP9916@ziepe.ca>
 <CAKMK7uF0AfuYGsHzKXhF=k-mAW=Wx_APf9fY9M9ormnwypoxZA@mail.gmail.com>
 <20201005172854.GA5177@ziepe.ca>
 <CAKMK7uFzxWF7V=7vkeNC-8shsPZRgdz9fYTsn0ayENv2BpnFEg@mail.gmail.com>
 <20201005183704.GC5177@ziepe.ca>
 <CAKMK7uH97Yb2JFviG_ynGC1hbQ69h9hcyFVFd2PFYHCDzfBN6g@mail.gmail.com>
 <CAKMK7uHRxK3yNrvX=+n-XpSv7PDCz8w+mwof3pkUUJq3TpmiuQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uHRxK3yNrvX=+n-XpSv7PDCz8w+mwof3pkUUJq3TpmiuQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 06, 2020 at 12:43:31AM +0200, Daniel Vetter wrote:

> > iow I think I can outright delete the frame vector stuff.
> 
> Ok this doesn't work, because dma_mmap always uses a remap_pfn_range,
> which is a VM_IO | VM_PFNMAP vma and so even if it's cma backed and
> not a carveout, we can't get the pages.

If CMA memory has struct pages it probably should be mmap'd with
different flags, and the lifecycle of the CMA memory needs to respect
the struct page refcount?

> Plus trying to move the cma pages out of cma for FOLL_LONGTERM would
> be kinda bad when they've been allocated as a contig block by
> dma_alloc_coherent :-)

Isn't holding a long term reference to a CMA page one of those really
scary use-after-free security issues I've been talking about?

I know nothing about CMA, so can't say too much, sorry

Jason
