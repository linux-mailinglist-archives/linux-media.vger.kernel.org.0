Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FA792A2EA5
	for <lists+linux-media@lfdr.de>; Mon,  2 Nov 2020 16:53:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726559AbgKBPw7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Nov 2020 10:52:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726520AbgKBPw6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Nov 2020 10:52:58 -0500
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com [IPv6:2607:f8b0:4864:20::f43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F4AEC061A47
        for <linux-media@vger.kernel.org>; Mon,  2 Nov 2020 07:52:58 -0800 (PST)
Received: by mail-qv1-xf43.google.com with SMTP id b11so6305241qvr.9
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2020 07:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=f4bAkyYQ5JW+w3wAB0B3Wuqs9gDAq+dCKVKb1szgdTE=;
        b=hqSP56ncN1Xesc0LR+LCBrLcoSGV6TopG9RG3GGTAjXZawK07x4FedOxx8+KwVozhh
         yTaXjjMacA7HSrB+GRFpwykUXEgHjYuiJRUfTBK6bxwzQkDVZZxpNeA6oR5zy06hcsRr
         +OWzKfZs32d+rXtNU6sG16vNSbBVRNjen0md3oJEh5m3qEuLJBFDAZd22drwYUhFMUM8
         jihAo1Zpdxicjpm3k0zP51jRIixb81HpWfJ8CKClqtFak5XKxto5Xo7s7pUz3s+srShN
         1BUfFqWebwl5tOah1zDSpMj6M1bL9GXyO8wQDz9s59OVdbT9CJgBaBWOD1bIDFUY/B+7
         N2fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=f4bAkyYQ5JW+w3wAB0B3Wuqs9gDAq+dCKVKb1szgdTE=;
        b=j0B8gfYYn8Bho60gvVb080kXAwGrGLHDKPnNx5mqrp8q7KB2VfHWKXH4oiUDBs7U5t
         Cr43iIETiWql/y/H3m5vjZlu6vetCDoMSqZsv4Enyy4DxDu0z+havxBv6PRFkklGbgAc
         +7SYXLkdqtjZANzYTGY0NBkktDWI7QV7PB9GDJRTatM6oe5rWuPiZsygo6ogp9BjMV+y
         +tMJr9oumKcQbKHfwudYTho5HUySu/kas0O2cxFVkpjx32y8P9ZaWZkJIGe2Ne2+u4WO
         R5v4gWLFWlbsfINNaESy8W0wKFp7s8bhePK83/eOn3SnsdVklcAY778IQhOiAeXvWwMy
         M7og==
X-Gm-Message-State: AOAM531lISoqJI6CLyGWx1XJ+HAE9L0m4bdFumMz3tH5/Rqx7hFZK95/
        hvY9dmcDRd10KsJJwAq2vj/Jww==
X-Google-Smtp-Source: ABdhPJywaNhw5aFpN/pYIk6/MJ/bkf/gh0tZ3udL0VlE8QqDUlZAs/BeSFGHSpJn56VGOhuQYMqcFg==
X-Received: by 2002:a0c:a261:: with SMTP id f88mr23351432qva.56.1604332377746;
        Mon, 02 Nov 2020 07:52:57 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id v92sm8169357qte.33.2020.11.02.07.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 07:52:56 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kZc8e-00F975-6s; Mon, 02 Nov 2020 11:52:56 -0400
Date:   Mon, 2 Nov 2020 11:52:56 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     Christoph Hellwig <hch@infradead.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        KVM list <kvm@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        J??r??me Glisse <jglisse@redhat.com>, Jan Kara <jack@suse.cz>
Subject: Re: [PATCH v5 08/15] mm: Add unsafe_follow_pfn
Message-ID: <20201102155256.GG36674@ziepe.ca>
References: <20201030100815.2269-1-daniel.vetter@ffwll.ch>
 <20201030100815.2269-9-daniel.vetter@ffwll.ch>
 <20201102072931.GA16419@infradead.org>
 <CAKMK7uEe5FQuukYU7RhL90ttC9XyWw6wvdQrZ2JpP0jpbYTO6g@mail.gmail.com>
 <20201102130115.GC36674@ziepe.ca>
 <CAKMK7uHeL=w7GoBaY4XrbRcpJabR9UWnP+oQ9Fg51OzL7=KxiA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uHeL=w7GoBaY4XrbRcpJabR9UWnP+oQ9Fg51OzL7=KxiA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 02, 2020 at 02:23:58PM +0100, Daniel Vetter wrote:
> On Mon, Nov 2, 2020 at 2:01 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >
> > On Mon, Nov 02, 2020 at 01:56:10PM +0100, Daniel Vetter wrote:
> > > On Mon, Nov 2, 2020 at 8:29 AM Christoph Hellwig <hch@infradead.org> wrote:
> > > >
> > > > On Fri, Oct 30, 2020 at 11:08:08AM +0100, Daniel Vetter wrote:
> > > > > Also mark up follow_pfn as EXPORT_SYMBOL_GPL. The only safe way to use
> > > > > that by drivers/modules is together with an mmu_notifier, and that's
> > > > > all _GPL stuff.
> > > >
> > > > I also think it also needs to be renamed to explicitly break any existing
> > > > users out of tree or int the submission queue.
> > >
> > > Ok I looked at the mmu notifier locking again and noticed that
> > > mm->subscriptions has its own spinlock. Since there usually shouldn't
> > > be a huge pile of these I think it's feasible to check for the mmu
> > > notifier in follow_pfn. And that would stuff this gap for good. I'll
> > > throw that on top as a final patch and see what people think.
> >
> > Probably the simplest is to just check mm_has_notifiers() when in
> > lockdep or something very simple like that
> 
> lockdep feels wrong, was locking more at CONFIG_DEBUG_VM. And since
> generally you only have 1 mmu notifier (especially for kvm) I think we
> can also pay the 2nd cacheline miss and actually check the right mmu
> notifier is registered.

Need to hold the lock to check that and there are two ways to register
notifiers these days, so it feels to expensive to me.

CH's 'export symbol only for kvm' really does seem the most robust way
to handle this though.

Jason
