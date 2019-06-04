Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06110346A9
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 14:27:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727810AbfFDM1R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 08:27:17 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:45557 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727804AbfFDM1R (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 08:27:17 -0400
Received: by mail-qt1-f195.google.com with SMTP id j19so9708854qtr.12
        for <linux-media@vger.kernel.org>; Tue, 04 Jun 2019 05:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wnsJg5IBUcpd0uvGih9L7zWjhXAHb1EJO0yOEExZSzo=;
        b=dcNC7UmtypwgYv25SVviVAOUG7URTCQh95rjKD+gc1HkGG0jrMjWKvaHqgOqnkLXCe
         CmoljchytuIVIDVbprMz3tL0S5wF3BfmVPwpXMEcKwEKuopvqQDwmPbpLySBrTe+5P0P
         +zjXSkVABYGjw15OrEI3UNK6X3hEEYJ5lmU4VodgY1OGgetHeu4xf6gu/Drrr5PoUFZD
         NGszqORq933qFqUy4wxVOf9PkDJzNBd6Vt6SxvMrx9KcQhBJruI+UAnsanyndNgyFsW8
         SfJHC+U7tiqZ4PP8CoYnZCXFGYoMymsmvspjQbzELX76TfLMwbqeFyJLFyTuqJIB4Dhp
         ZF+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wnsJg5IBUcpd0uvGih9L7zWjhXAHb1EJO0yOEExZSzo=;
        b=cv4h5CiBlVfocWlrBo82q0eay+FxOsnWLE76IeyMjGxi2l7qW/GCRrS7HV8QpINqiC
         3oDVj66ncWzUuyZDkDhzjkbBKn0CLUXi9laubAX1AdmCLkpoa2cXZQ255NWHtT+4OKuI
         ENSUQMxQeAz9TGDyJVD9groAMXj7LgIOy9nTZuEx4NmQ9BSFyFwMx2xIG0MgtlWYDs0T
         ZII/31cTJBoYmKhrR1PA9im1KRJ1bFP1ctUCgKw3ylTRFdRavwhD8kZp4FobAlj3M5GX
         66bD0GiAStfUKWxacvh+QXRDdiJ1+mPqHInEDAeh/YXlpVE/QbjqOkJyUa7n2iIDr5si
         xh4A==
X-Gm-Message-State: APjAAAWQYT2D6PdedpB3lLfIGdYuwGX8ujJ0uQJL43UdYBoGDWQVhFbs
        C++yofpTQBmx/lPpMMLOva0CMA==
X-Google-Smtp-Source: APXvYqyQKZsajkt/gWb5hfUpWdj5TzMt6KfoFh/bz/W6aTLwqi1dm4Rk21CH5MrcGrt3uoh1Lu64hg==
X-Received: by 2002:aed:3a87:: with SMTP id o7mr27583430qte.310.1559651236150;
        Tue, 04 Jun 2019 05:27:16 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.55.100])
        by smtp.gmail.com with ESMTPSA id c18sm4454633qkm.78.2019.06.04.05.27.15
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jun 2019 05:27:15 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1hY8X4-000416-LN; Tue, 04 Jun 2019 09:27:14 -0300
Date:   Tue, 4 Jun 2019 09:27:14 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        LKML <linux-kernel@vger.kernel.org>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-rdma@vger.kernel.org, linux-media@vger.kernel.org,
        kvm@vger.kernel.org,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kees Cook <keescook@chromium.org>,
        Yishai Hadas <yishaih@mellanox.com>,
        Felix Kuehling <Felix.Kuehling@amd.com>,
        Alexander Deucher <Alexander.Deucher@amd.com>,
        Christian Koenig <Christian.Koenig@amd.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Alex Williamson <alex.williamson@redhat.com>,
        Leon Romanovsky <leon@kernel.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Dave Martin <Dave.Martin@arm.com>,
        Khalid Aziz <khalid.aziz@oracle.com>, enh <enh@google.com>,
        Christoph Hellwig <hch@infradead.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Kevin Brodsky <kevin.brodsky@arm.com>,
        Szabolcs Nagy <Szabolcs.Nagy@arm.com>
Subject: Re: [PATCH v16 12/16] IB, arm64: untag user pointers in
 ib_uverbs_(re)reg_mr()
Message-ID: <20190604122714.GA15385@ziepe.ca>
References: <cover.1559580831.git.andreyknvl@google.com>
 <c829f93b19ad6af1b13be8935ce29baa8e58518f.1559580831.git.andreyknvl@google.com>
 <20190603174619.GC11474@ziepe.ca>
 <CAAeHK+xy-dx4dLDLLj9dRzRNSVG9H5nDPPnjpYF38qKZNNCh_g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAeHK+xy-dx4dLDLLj9dRzRNSVG9H5nDPPnjpYF38qKZNNCh_g@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 04, 2019 at 02:18:19PM +0200, Andrey Konovalov wrote:
> On Mon, Jun 3, 2019 at 7:46 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >
> > On Mon, Jun 03, 2019 at 06:55:14PM +0200, Andrey Konovalov wrote:
> > > This patch is a part of a series that extends arm64 kernel ABI to allow to
> > > pass tagged user pointers (with the top byte set to something else other
> > > than 0x00) as syscall arguments.
> > >
> > > ib_uverbs_(re)reg_mr() use provided user pointers for vma lookups (through
> > > e.g. mlx4_get_umem_mr()), which can only by done with untagged pointers.
> > >
> > > Untag user pointers in these functions.
> > >
> > > Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
> > >  drivers/infiniband/core/uverbs_cmd.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/drivers/infiniband/core/uverbs_cmd.c b/drivers/infiniband/core/uverbs_cmd.c
> > > index 5a3a1780ceea..f88ee733e617 100644
> > > +++ b/drivers/infiniband/core/uverbs_cmd.c
> > > @@ -709,6 +709,8 @@ static int ib_uverbs_reg_mr(struct uverbs_attr_bundle *attrs)
> > >       if (ret)
> > >               return ret;
> > >
> > > +     cmd.start = untagged_addr(cmd.start);
> > > +
> > >       if ((cmd.start & ~PAGE_MASK) != (cmd.hca_va & ~PAGE_MASK))
> > >               return -EINVAL;
> >
> > I feel like we shouldn't thave to do this here, surely the cmd.start
> > should flow unmodified to get_user_pages, and gup should untag it?
> >
> > ie, this sort of direction for the IB code (this would be a giant
> > patch, so I didn't have time to write it all, but I think it is much
> > saner):
> 
> Hi Jason,
> 
> ib_uverbs_reg_mr() passes cmd.start to mlx4_get_umem_mr(), which calls
> find_vma(), which only accepts untagged addresses. Could you explain
> how your patch helps?

That mlx4 is just a 'weird duck', it is not the normal flow, and I
don't think the core code should be making special consideration for
it.

Jason
