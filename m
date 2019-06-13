Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC9D743B32
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2019 17:27:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727671AbfFMP0x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jun 2019 11:26:53 -0400
Received: from foss.arm.com ([217.140.110.172]:42552 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727351AbfFMP0u (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jun 2019 11:26:50 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A46BD3EF;
        Thu, 13 Jun 2019 08:26:49 -0700 (PDT)
Received: from C02TF0J2HF1T.local (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3FA233F718;
        Thu, 13 Jun 2019 08:26:36 -0700 (PDT)
Date:   Thu, 13 Jun 2019 16:26:32 +0100
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Dave Martin <Dave.Martin@arm.com>
Cc:     Andrey Konovalov <andreyknvl@google.com>,
        linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
        linux-media@vger.kernel.org, kvm@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Kostya Serebryany <kcc@google.com>,
        Khalid Aziz <khalid.aziz@oracle.com>,
        Felix Kuehling <Felix.Kuehling@amd.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Leon Romanovsky <leon@kernel.org>,
        Christoph Hellwig <hch@infradead.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Evgeniy Stepanov <eugenis@google.com>,
        Kevin Brodsky <kevin.brodsky@arm.com>,
        Kees Cook <keescook@chromium.org>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yishai Hadas <yishaih@mellanox.com>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Lee Smith <Lee.Smith@arm.com>,
        Alexander Deucher <Alexander.Deucher@amd.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        enh <enh@google.com>, Robin Murphy <robin.murphy@arm.com>,
        Christian Koenig <Christian.Koenig@amd.com>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: Re: [PATCH v17 03/15] arm64: Introduce prctl() options to control
 the tagged user addresses ABI
Message-ID: <20190613152632.GT28951@C02TF0J2HF1T.local>
References: <cover.1560339705.git.andreyknvl@google.com>
 <a7a2933bea5fe57e504891b7eec7e9432e5e1c1a.1560339705.git.andreyknvl@google.com>
 <20190613110235.GW28398@e103592.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190613110235.GW28398@e103592.cambridge.arm.com>
User-Agent: Mutt/1.11.2 (2019-01-07)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On Thu, Jun 13, 2019 at 12:02:35PM +0100, Dave P Martin wrote:
> On Wed, Jun 12, 2019 at 01:43:20PM +0200, Andrey Konovalov wrote:
> > +/*
> > + * Global sysctl to disable the tagged user addresses support. This control
> > + * only prevents the tagged address ABI enabling via prctl() and does not
> > + * disable it for tasks that already opted in to the relaxed ABI.
> > + */
> > +static int zero;
> > +static int one = 1;
> 
> !!!
> 
> And these can't even be const without a cast.  Yuk.
> 
> (Not your fault though, but it would be nice to have a proc_dobool() to
> avoid this.)

I had the same reaction. Maybe for another patch sanitising this pattern
across the kernel.

> > --- a/include/uapi/linux/prctl.h
> > +++ b/include/uapi/linux/prctl.h
> > @@ -229,4 +229,9 @@ struct prctl_mm_map {
> >  # define PR_PAC_APDBKEY			(1UL << 3)
> >  # define PR_PAC_APGAKEY			(1UL << 4)
> >  
> > +/* Tagged user address controls for arm64 */
> > +#define PR_SET_TAGGED_ADDR_CTRL		55
> > +#define PR_GET_TAGGED_ADDR_CTRL		56
> > +# define PR_TAGGED_ADDR_ENABLE		(1UL << 0)
> > +
> 
> Do we expect this prctl to be applicable to other arches, or is it
> strictly arm64-specific?

I kept it generic, at least the tagged address part. The MTE bits later
on would be arm64-specific.

> > @@ -2492,6 +2498,16 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
> >  			return -EINVAL;
> >  		error = PAC_RESET_KEYS(me, arg2);
> >  		break;
> > +	case PR_SET_TAGGED_ADDR_CTRL:
> > +		if (arg3 || arg4 || arg5)
> 
> <bikeshed>
> 
> How do you anticipate these arguments being used in the future?

I don't expect them to be used at all. But since I'm not sure, I'd force
them as zero for now rather than ignored. The GET is supposed to return
the SET arg2, hence I'd rather not used the other arguments.

> For the SVE prctls I took the view that "get" could only ever mean one
> thing, and "put" already had a flags argument with spare bits for future
> expansion anyway, so forcing the extra arguments to zero would be
> unnecessary.
> 
> Opinions seem to differ on whether requiring surplus arguments to be 0
> is beneficial for hygiene, but the glibc prototype for prctl() is
> 
> 	int prctl (int __option, ...);
> 
> so it seemed annoying to have to pass extra arguments to it just for the
> sake of it.  IMHO this also makes the code at the call site less
> readable, since it's not immediately apparent that all those 0s are
> meaningless.

It's fine by me to ignore the other arguments. I just followed the
pattern of some existing prctl options. I don't have a strong opinion
either way.

> > +			return -EINVAL;
> > +		error = SET_TAGGED_ADDR_CTRL(arg2);
> > +		break;
> > +	case PR_GET_TAGGED_ADDR_CTRL:
> > +		if (arg2 || arg3 || arg4 || arg5)
> > +			return -EINVAL;
> > +		error = GET_TAGGED_ADDR_CTRL();
> 
> Having a "get" prctl is probably a good idea, but is there a clear
> usecase for it?

Not sure, maybe some other library (e.g. a JIT compiler) would like to
check whether tagged addresses have been enabled during application
start and decide to generate tagged pointers for itself. It seemed
pretty harmless, unless we add more complex things to the prctl() that
cannot be returned in one request).

-- 
Catalin
