Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0164F73181
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2019 16:21:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726709AbfGXOVH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jul 2019 10:21:07 -0400
Received: from foss.arm.com ([217.140.110.172]:41946 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726166AbfGXOVH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jul 2019 10:21:07 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4AFA328;
        Wed, 24 Jul 2019 07:21:06 -0700 (PDT)
Received: from fuggles.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 761323F71A;
        Wed, 24 Jul 2019 07:21:01 -0700 (PDT)
Date:   Wed, 24 Jul 2019 15:20:59 +0100
From:   Will Deacon <will.deacon@arm.com>
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     Will Deacon <will@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Mark Rutland <mark.rutland@arm.com>, kvm@vger.kernel.org,
        Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
        dri-devel@lists.freedesktop.org,
        Kostya Serebryany <kcc@google.com>,
        Khalid Aziz <khalid.aziz@oracle.com>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Felix Kuehling <Felix.Kuehling@amd.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
        amd-gfx@lists.freedesktop.org,
        Christoph Hellwig <hch@infradead.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Dave Martin <Dave.Martin@arm.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        linux-media@vger.kernel.org, Kevin Brodsky <kevin.brodsky@arm.com>,
        Kees Cook <keescook@chromium.org>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yishai Hadas <yishaih@mellanox.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Lee Smith <Lee.Smith@arm.com>,
        Alexander Deucher <Alexander.Deucher@amd.com>,
        enh <enh@google.com>, Robin Murphy <robin.murphy@arm.com>,
        Christian Koenig <Christian.Koenig@amd.com>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: Re: [PATCH v19 00/15] arm64: untag user pointers passed to the kernel
Message-ID: <20190724142059.GC21234@fuggles.cambridge.arm.com>
References: <cover.1563904656.git.andreyknvl@google.com>
 <CAAeHK+yc0D_nd7nTRsY4=qcSx+eQR0VLut3uXMf4NEiE-VpeCw@mail.gmail.com>
 <20190724140212.qzvbcx5j2gi5lcoj@willie-the-truck>
 <CAAeHK+xXzdQHpVXL7f1T2Ef2P7GwFmDMSaBH4VG8fT3=c_OnjQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAeHK+xXzdQHpVXL7f1T2Ef2P7GwFmDMSaBH4VG8fT3=c_OnjQ@mail.gmail.com>
User-Agent: Mutt/1.11.1+86 (6f28e57d73f2) ()
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jul 24, 2019 at 04:16:49PM +0200, Andrey Konovalov wrote:
> On Wed, Jul 24, 2019 at 4:02 PM Will Deacon <will@kernel.org> wrote:
> > On Tue, Jul 23, 2019 at 08:03:29PM +0200, Andrey Konovalov wrote:
> > > On Tue, Jul 23, 2019 at 7:59 PM Andrey Konovalov <andreyknvl@google.com> wrote:
> > > >
> > > > === Overview
> > > >
> > > > arm64 has a feature called Top Byte Ignore, which allows to embed pointer
> > > > tags into the top byte of each pointer. Userspace programs (such as
> > > > HWASan, a memory debugging tool [1]) might use this feature and pass
> > > > tagged user pointers to the kernel through syscalls or other interfaces.
> > > >
> > > > Right now the kernel is already able to handle user faults with tagged
> > > > pointers, due to these patches:
> > > >
> > > > 1. 81cddd65 ("arm64: traps: fix userspace cache maintenance emulation on a
> > > >              tagged pointer")
> > > > 2. 7dcd9dd8 ("arm64: hw_breakpoint: fix watchpoint matching for tagged
> > > >               pointers")
> > > > 3. 276e9327 ("arm64: entry: improve data abort handling of tagged
> > > >               pointers")
> > > >
> > > > This patchset extends tagged pointer support to syscall arguments.
> >
> > [...]
> >
> > > Do you think this is ready to be merged?
> > >
> > > Should this go through the mm or the arm tree?
> >
> > I would certainly prefer to take at least the arm64 bits via the arm64 tree
> > (i.e. patches 1, 2 and 15). We also need a Documentation patch describing
> > the new ABI.
> 
> Sounds good! Should I post those patches together with the
> Documentation patches from Vincenzo as a separate patchset?

Yes, please (although as you say below, we need a new version of those
patches from Vincenzo to address the feedback on v5). The other thing I
should say is that I'd be happy to queue the other patches in the series
too, but some of them are missing acks from the relevant maintainers (e.g.
the mm/ and fs/ changes).

Will
