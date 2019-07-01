Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 613EC3477D
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 15:02:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727574AbfFDNCK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 09:02:10 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:39423 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727552AbfFDNCK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 09:02:10 -0400
Received: by mail-qt1-f194.google.com with SMTP id i34so165497qta.6
        for <linux-media@vger.kernel.org>; Tue, 04 Jun 2019 06:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ROjiC3s0siagx/fi+MGJXNVgc6kDjODdOY/lcLdmBIY=;
        b=Yjg83FKmLcCoTK1qNZRWt/34Ia4Vlgl4OzEswRBoqTA1q96rWHjxDfVIh6O7xWTGYS
         eTwCJcntFH46Tx+/cfSa7gWeHuAwOuGBn+X1jMdn5S6DRrFvNPM6afZ9JtFGwDFoFWKd
         IItwYcOZFv/0waUdBmD+9vX5g+lauIFC8gWQwZqeWZqiLI8MWTWgKqH10ZguaFNyDwaJ
         a6BouIbR+z5GvWPUxO/910/OPmm0It1HqckTeip+hRX/UhVQAxatTT7lXUHm0zw2yFJW
         DkwJjMsTV0HME+BgheyUHlaQClPbcE8mHooI7fCmf534f4AYixHfdR0GOmoGClDBYuEf
         l/5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ROjiC3s0siagx/fi+MGJXNVgc6kDjODdOY/lcLdmBIY=;
        b=DQIXQ7dQreLSux4B3r/caldul8aaYympfjU9g+HWs7HMpVy35CI5Lrlq0RIyRd5i7/
         nP1Gzzzq0cVLQAlqaYxmyeX39VtO3csCa0waws6qabZLiWcqXmQ2PikmpXoC9mCauR/u
         flFsmq3PFUF+4gxM5JKaZR1U7psnYntuKrTlys/Y/xJnoYsv3MPTWM9hKd9jEswQSfjf
         6YSPkP+Egs0WakxYvSbFbyVCADBmiBfzuUofVJXAf8dfG1cV7o4F7RDnPQsXPvLGV4jP
         9B7OCIDtHNvNnH1csx2zHH4ic02+0ddQonyGTGFw4Cs2Uz/IBK5jcSs4CQHLC5F5PsA7
         gb7A==
X-Gm-Message-State: APjAAAX8VPjJS5kD9mZmfZCyqfpm/xtd72G9UWZbooU48H4Viw39HLT8
        Xz/VgEmf5QJjlL60caqfmMPMqg==
X-Google-Smtp-Source: APXvYqz5RimUEjNtxNzzaaY0SoKGmFHRAnKhf0PPTePbHdJhsA1MCZNciExOvF95WwVoO+r2X/Sqlw==
X-Received: by 2002:a0c:c94d:: with SMTP id v13mr706065qvj.211.1559653328976;
        Tue, 04 Jun 2019 06:02:08 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.55.100])
        by smtp.gmail.com with ESMTPSA id m5sm10984580qke.25.2019.06.04.06.02.08
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jun 2019 06:02:08 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1hY94p-0004U3-JD; Tue, 04 Jun 2019 10:02:07 -0300
Date:   Tue, 4 Jun 2019 10:02:07 -0300
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
Message-ID: <20190604130207.GD15385@ziepe.ca>
References: <cover.1559580831.git.andreyknvl@google.com>
 <c829f93b19ad6af1b13be8935ce29baa8e58518f.1559580831.git.andreyknvl@google.com>
 <20190603174619.GC11474@ziepe.ca>
 <CAAeHK+xy-dx4dLDLLj9dRzRNSVG9H5nDPPnjpYF38qKZNNCh_g@mail.gmail.com>
 <20190604122714.GA15385@ziepe.ca>
 <CAAeHK+xyqwuJyviGhvU7L1wPZQF7Mf9g2vgKSsYmML3fV6NrXg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAeHK+xyqwuJyviGhvU7L1wPZQF7Mf9g2vgKSsYmML3fV6NrXg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 04, 2019 at 02:45:32PM +0200, Andrey Konovalov wrote:
> On Tue, Jun 4, 2019 at 2:27 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >
> > On Tue, Jun 04, 2019 at 02:18:19PM +0200, Andrey Konovalov wrote:
> > > On Mon, Jun 3, 2019 at 7:46 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > > >
> > > > On Mon, Jun 03, 2019 at 06:55:14PM +0200, Andrey Konovalov wrote:
> > > > > This patch is a part of a series that extends arm64 kernel ABI to allow to
> > > > > pass tagged user pointers (with the top byte set to something else other
> > > > > than 0x00) as syscall arguments.
> > > > >
> > > > > ib_uverbs_(re)reg_mr() use provided user pointers for vma lookups (through
> > > > > e.g. mlx4_get_umem_mr()), which can only by done with untagged pointers.
> > > > >
> > > > > Untag user pointers in these functions.
> > > > >
> > > > > Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
> > > > >  drivers/infiniband/core/uverbs_cmd.c | 4 ++++
> > > > >  1 file changed, 4 insertions(+)
> > > > >
> > > > > diff --git a/drivers/infiniband/core/uverbs_cmd.c b/drivers/infiniband/core/uverbs_cmd.c
> > > > > index 5a3a1780ceea..f88ee733e617 100644
> > > > > +++ b/drivers/infiniband/core/uverbs_cmd.c
> > > > > @@ -709,6 +709,8 @@ static int ib_uverbs_reg_mr(struct uverbs_attr_bundle *attrs)
> > > > >       if (ret)
> > > > >               return ret;
> > > > >
> > > > > +     cmd.start = untagged_addr(cmd.start);
> > > > > +
> > > > >       if ((cmd.start & ~PAGE_MASK) != (cmd.hca_va & ~PAGE_MASK))
> > > > >               return -EINVAL;
> > > >
> > > > I feel like we shouldn't thave to do this here, surely the cmd.start
> > > > should flow unmodified to get_user_pages, and gup should untag it?
> > > >
> > > > ie, this sort of direction for the IB code (this would be a giant
> > > > patch, so I didn't have time to write it all, but I think it is much
> > > > saner):
> > >
> > > Hi Jason,
> > >
> > > ib_uverbs_reg_mr() passes cmd.start to mlx4_get_umem_mr(), which calls
> > > find_vma(), which only accepts untagged addresses. Could you explain
> > > how your patch helps?
> >
> > That mlx4 is just a 'weird duck', it is not the normal flow, and I
> > don't think the core code should be making special consideration for
> > it.
> 
> How do you think we should do untagging (or something else) to deal
> with this 'weird duck' case?

mlx4 should handle it around the call to find_vma like other patches
do, ideally as part of the cast from a void __user * to the unsigned
long that find_vma needs

Jason
