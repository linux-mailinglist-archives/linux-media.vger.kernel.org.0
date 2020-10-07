Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AE8A286548
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 18:53:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726348AbgJGQxX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 12:53:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727876AbgJGQxV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 12:53:21 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FBBDC061755
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 09:53:19 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id b69so3556450qkg.8
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2020 09:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aA5/IKqeJTcjHMODAliv+D9oxsXiJBjU0Q/RoQOchc4=;
        b=ThVHp0Bf6+g4+R33mQIvIX8CheiSQQTMUuTCia9X1IqJrBuFaGelh/l39LBTeYKkvK
         NaMOGfKlUrf0z4iE8OxQVYLuzZ/JlM7sUpAQwKcFn4cRIEuVLL6aIerNL35v1pmwUkj+
         wDrYDlD+5FNGiiz175SjQIUqXASz3MvdF3eYJh+ukkwcF83qjZnM9uioklIntUHKaRya
         Zg9rg6+eKKInIDWli/ZJm1h6yck77cdzU9Fs3bEWsRArMtEGioYwK8tfNazOHk/B4xtt
         Mf7AVxNkG0ee/JcnZSnMywZa9C4+2enXUIhuG1wGpzdJZvOcjJkPsfCeezTM2uT5xq7S
         MUrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aA5/IKqeJTcjHMODAliv+D9oxsXiJBjU0Q/RoQOchc4=;
        b=RRu9JMMUuwLdjJT5V5v7NX7mRTDSDUVAOLozElYM516roW9gGsshlmQerKk1W4+68j
         cZGlFqDj66MYMjPE+C31lC3WcsrCjhXb6AESSnx2k+HdZ0BAqJ+eUpIm0DwR5f+O3wHQ
         pQYcfGgMc2NrUfjXMa8OhrL4SB0YRMZ6ukOXgBY38xY+xpjZYfmH38WrKmDTZMwEv+y3
         Z/GesUy0qgMvvyx7SkzAJmRZxmDF/v9q7ZyvGUf8fEFePGflGTEalxrDHV9+m7OVpG3I
         iIdU4XHoCe+Q6j9RLhNgeubSm1w4bTRvMkzMynVpVYSNcGNDQlJy9whux+ntcDihFhMY
         ckug==
X-Gm-Message-State: AOAM530i2za87pD3pUjJRQ/P2BTXiYL2kyfXwp/UI8JxI4KQR7m9uAkZ
        pIp45v/FVoUibK3j+qhPA1knfQ==
X-Google-Smtp-Source: ABdhPJxixhkZJXYtJ75yqJVriDbZSDlnfap0MWWWiSIn4wzaboeX7oTS66SiExjVo2w4rTtFpjs6Eg==
X-Received: by 2002:a37:aec2:: with SMTP id x185mr3746059qke.73.1602089598574;
        Wed, 07 Oct 2020 09:53:18 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id x75sm232893qka.59.2020.10.07.09.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 09:53:17 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kQCgm-0010EB-Tr; Wed, 07 Oct 2020 13:53:16 -0300
Date:   Wed, 7 Oct 2020 13:53:16 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org,
        linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        linux-s390@vger.kernel.org,
        Daniel Vetter <daniel.vetter@intel.com>,
        Pawel Osciak <pawel@osciak.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH 05/13] mm/frame-vector: Use FOLL_LONGTERM
Message-ID: <20201007165316.GT5177@ziepe.ca>
References: <20201007164426.1812530-1-daniel.vetter@ffwll.ch>
 <20201007164426.1812530-6-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201007164426.1812530-6-daniel.vetter@ffwll.ch>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 07, 2020 at 06:44:18PM +0200, Daniel Vetter wrote:
>  
> -	/*
> -	 * While get_vaddr_frames() could be used for transient (kernel
> -	 * controlled lifetime) pinning of memory pages all current
> -	 * users establish long term (userspace controlled lifetime)
> -	 * page pinning. Treat get_vaddr_frames() like
> -	 * get_user_pages_longterm() and disallow it for filesystem-dax
> -	 * mappings.
> -	 */
> -	if (vma_is_fsdax(vma)) {
> -		ret = -EOPNOTSUPP;
> -		goto out;
> -	}
> -
> -	if (!(vma->vm_flags & (VM_IO | VM_PFNMAP))) {
> -		vec->got_ref = true;
> -		vec->is_pfns = false;
> -		ret = pin_user_pages_locked(start, nr_frames,
> -			gup_flags, (struct page **)(vec->ptrs), &locked);
> -		goto out;
> -	}

The vm_flags still need to be checked before going into the while
loop. If the break is taken then nothing would check vm_flags

Jason
