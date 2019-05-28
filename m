Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E249F2CC1D
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 18:34:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726982AbfE1QeJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 12:34:09 -0400
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:60968 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726600AbfE1QeJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 12:34:09 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D37F1341;
        Tue, 28 May 2019 09:34:08 -0700 (PDT)
Received: from arrakis.emea.arm.com (arrakis.cambridge.arm.com [10.1.196.78])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2754A3F59C;
        Tue, 28 May 2019 09:34:03 -0700 (PDT)
Date:   Tue, 28 May 2019 17:34:00 +0100
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Dave Martin <Dave.Martin@arm.com>
Cc:     Andrew Murray <andrew.murray@arm.com>,
        Mark Rutland <mark.rutland@arm.com>, kvm@vger.kernel.org,
        Christian Koenig <Christian.Koenig@amd.com>,
        Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
        Lee Smith <Lee.Smith@arm.com>, linux-kselftest@vger.kernel.org,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
        amd-gfx@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        Evgeniy Stepanov <eugenis@google.com>,
        linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Kevin Brodsky <kevin.brodsky@arm.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felix Kuehling <Felix.Kuehling@amd.com>,
        linux-kernel@vger.kernel.org,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Alexander Deucher <Alexander.Deucher@amd.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Yishai Hadas <yishaih@mellanox.com>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: Re: [PATCH v15 05/17] arms64: untag user pointers passed to memory
 syscalls
Message-ID: <20190528163400.GE32006@arrakis.emea.arm.com>
References: <cover.1557160186.git.andreyknvl@google.com>
 <00eb4c63fefc054e2c8d626e8fedfca11d7c2600.1557160186.git.andreyknvl@google.com>
 <20190527143719.GA59948@MBP.local>
 <20190528145411.GA709@e119886-lin.cambridge.arm.com>
 <20190528154057.GD32006@arrakis.emea.arm.com>
 <20190528155644.GD28398@e103592.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190528155644.GD28398@e103592.cambridge.arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 28, 2019 at 04:56:45PM +0100, Dave P Martin wrote:
> On Tue, May 28, 2019 at 04:40:58PM +0100, Catalin Marinas wrote:
> 
> [...]
> 
> > My thoughts on allowing tags (quick look):
> >
> > brk - no
> 
> [...]
> 
> > mlock, mlock2, munlock - yes
> > mmap - no (we may change this with MTE but not for TBI)
> 
> [...]
> 
> > mprotect - yes
> 
> I haven't following this discussion closely... what's the rationale for
> the inconsistencies here (feel free to refer me back to the discussion
> if it's elsewhere).

_My_ rationale (feel free to disagree) is that mmap() by default would
not return a tagged address (ignoring MTE for now). If it gets passed a
tagged address or a "tagged NULL" (for lack of a better name) we don't
have clear semantics of whether the returned address should be tagged in
this ABI relaxation. I'd rather reserve this specific behaviour if we
overload the non-zero tag meaning of mmap() for MTE. Similar reasoning
for mremap(), at least on the new_address argument (not entirely sure
about old_address).

munmap() should probably follow the mmap() rules.

As for brk(), I don't see why the user would need to pass a tagged
address, we can't associate any meaning to this tag.

For the rest, since it's likely such addresses would have been tagged by
malloc() in user space, we should allow tagged pointers.

-- 
Catalin
