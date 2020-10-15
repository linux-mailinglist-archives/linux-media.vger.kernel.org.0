Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A73F928E9FE
	for <lists+linux-media@lfdr.de>; Thu, 15 Oct 2020 03:29:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732265AbgJOB3j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Oct 2020 21:29:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732230AbgJOB3i (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Oct 2020 21:29:38 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29F95C002159
        for <linux-media@vger.kernel.org>; Wed, 14 Oct 2020 17:09:42 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id c2so997201qkf.10
        for <linux-media@vger.kernel.org>; Wed, 14 Oct 2020 17:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=D7q4upZx4LUmHy2sbcBxGXxr7CK8polpuI+TBJh2iFg=;
        b=VY1qyIeCcrX28JfPsmo/gMmvUMC4KhNWUx2AWTC7SFuNhKKNC7E5pi4i351EUrbB2J
         iQEeEBv2iqbPt4yG9cu9z6JKaTTcI0uH0ifbEwEuYd7uQ+JCfqlrCKPwMTRONzTIq1+2
         r10P6EtGAwdMqLqGZOKON3zvZUuPyniSm0E4b9X4QVYcKPq5x9sxgp/64dd/q9ifg4bh
         6h21xPcqmh90YO0WNB5wNN8lxy2kzpTs2joeQm0QgPxqx6k5VPT8scnHtsXoGOHGppiW
         EBkQ8XI+pghayLloQzkOY+ZWhXI0lRPbg5OXZafpWC/LHi0yuGDtirCrwS4LepbltR1w
         8p9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=D7q4upZx4LUmHy2sbcBxGXxr7CK8polpuI+TBJh2iFg=;
        b=UNWazAQOyfmmZ2YClfs7AAx4Vxc8geCK9+OGxhra+iuzuIOgVBjlMdd65tMqVhQh1g
         5uTMfHS532Upd7NcKGoqaCEx/EneDLUYH54CND1uuxyyQYiO7KkXSbsjjR63MHJ1MPqZ
         sQ7VFZps7OfC7v2X0fixfeD2AvbxRl1hME9je4GA4MVF+C1GGYQR7EJKG/k8saVx21dK
         E2eIbKwigb5q2PRl5ZW5qCEXkUNYY6HcyaIdx6jQh+Z2KZ3WZkTvofFmbvnjlDZDSLsp
         K95w2slfRtUnd0jj9NS8EBbWIJWi6RLJB3CEWUzlqf17WTi5rDDCL2HkMOf96+bdIb7g
         ju0w==
X-Gm-Message-State: AOAM533GwgpbgyZLpf84G2VYPseOB2ZeLymWLNtYuleo6hkAjDXx64CK
        0fqWlQBCYmU/5iDUnj0Abxd34w==
X-Google-Smtp-Source: ABdhPJz1YpfemWgv6ITHdO1cDHAUR6b7J4qWqW/ErSGbJ1yD3QFJwI22cUMtAvpN9oIOH7a/n3cIYg==
X-Received: by 2002:a05:620a:2e3:: with SMTP id a3mr1513988qko.117.1602720581354;
        Wed, 14 Oct 2020 17:09:41 -0700 (PDT)
Received: from ziepe.ca ([142.177.128.188])
        by smtp.gmail.com with ESMTPSA id y44sm525252qtb.50.2020.10.14.17.09.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Oct 2020 17:09:40 -0700 (PDT)
Received: from jgg by jggl.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1kSqpv-0002GP-8c; Wed, 14 Oct 2020 21:09:39 -0300
Date:   Wed, 14 Oct 2020 21:09:39 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Dan Williams <dan.j.williams@intel.com>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        KVM list <kvm@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Hildenbrand <david@redhat.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH v2 14/17] resource: Move devmem revoke code to resource
 framework
Message-ID: <20201015000939.GD6763@ziepe.ca>
References: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
 <20201009075934.3509076-15-daniel.vetter@ffwll.ch>
 <20201009123109.GO5177@ziepe.ca>
 <CAKMK7uFpPP-Q0jC0vM7vYPEcg0m4NzTw+Ld=swdTF3BgMX5Qug@mail.gmail.com>
 <20201009143209.GS5177@ziepe.ca>
 <CAPcyv4j54O8ac6WB3LEeNud2r11V26gA0PRKK9bhyEMF67AXtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPcyv4j54O8ac6WB3LEeNud2r11V26gA0PRKK9bhyEMF67AXtQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 09, 2020 at 11:28:54AM -0700, Dan Williams wrote:
> On Fri, Oct 9, 2020 at 7:32 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >
> > On Fri, Oct 09, 2020 at 04:24:45PM +0200, Daniel Vetter wrote:
> > > On Fri, Oct 9, 2020 at 2:31 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > > >
> > > > On Fri, Oct 09, 2020 at 09:59:31AM +0200, Daniel Vetter wrote:
> > > >
> > > > > +struct address_space *iomem_get_mapping(void)
> > > > > +{
> > > > > +     return iomem_inode->i_mapping;
> > > >
> > > > This should pair an acquire with the release below
> > > >
> > > > > +     /*
> > > > > +      * Publish /dev/mem initialized.
> > > > > +      * Pairs with smp_load_acquire() in revoke_iomem().
> > > > > +      */
> > > > > +     smp_store_release(&iomem_inode, inode);
> > > >
> > > > However, this seems abnormal, initcalls rarely do this kind of stuff
> > > > with global data..
> > > >
> > > > The kernel crashes if this fs_initcall is raced with
> > > > iomem_get_mapping() due to the unconditional dereference, so I think
> > > > it can be safely switched to a simple assignment.
> > >
> > > Ah yes I checked this all, but forgot to correctly annotate the
> > > iomem_get_mapping access. For reference, see b34e7e298d7a ("/dev/mem:
> > > Add missing memory barriers for devmem_inode").
> >
> > Oh yikes, so revoke_iomem can run concurrently during early boot,
> > tricky.
> 
> It runs early because request_mem_region() can run before fs_initcall.
> Rather than add an unnecessary lock just arrange for the revoke to be
> skipped before the inode is initialized. The expectation is that any
> early resource reservations will block future userspace mapping
> attempts.

Actually, on this point a simple WRITE_ONCE/READ_ONCE pairing is OK,
Paul once explained that the pointer chase on the READ_ONCE side is
required to be like an acquire - this is why rcu_dereference is just
READ_ONCE

Jason
