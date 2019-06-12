Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F6D3420E1
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 11:33:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437379AbfFLJcT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jun 2019 05:32:19 -0400
Received: from foss.arm.com ([217.140.110.172]:48494 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2436605AbfFLJcT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 05:32:19 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C99828;
        Wed, 12 Jun 2019 02:32:18 -0700 (PDT)
Received: from c02tf0j2hf1t.cambridge.arm.com (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C6AAD3F246;
        Wed, 12 Jun 2019 02:32:04 -0700 (PDT)
Date:   Wed, 12 Jun 2019 10:32:00 +0100
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc:     Andrey Konovalov <andreyknvl@google.com>,
        Mark Rutland <mark.rutland@arm.com>, kvm@vger.kernel.org,
        Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
        Khalid Aziz <khalid.aziz@oracle.com>,
        linux-kselftest@vger.kernel.org,
        Felix Kuehling <Felix.Kuehling@amd.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
        amd-gfx@lists.freedesktop.org,
        Christoph Hellwig <hch@infradead.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Dmitry Vyukov <dvyukov@google.com>,
        Dave Martin <Dave.Martin@arm.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        linux-media@vger.kernel.org, Kevin Brodsky <kevin.brodsky@arm.com>,
        Kees Cook <keescook@chromium.org>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Kostya Serebryany <kcc@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yishai Hadas <yishaih@mellanox.com>,
        linux-kernel@vger.kernel.org,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Lee Smith <Lee.Smith@arm.com>,
        Alexander Deucher <Alexander.Deucher@amd.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        enh <enh@google.com>, Robin Murphy <robin.murphy@arm.com>,
        Christian Koenig <Christian.Koenig@amd.com>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: Re: [PATCH v16 02/16] arm64: untag user pointers in access_ok and
 __uaccess_mask_ptr
Message-ID: <20190612093158.GG10165@c02tf0j2hf1t.cambridge.arm.com>
References: <cover.1559580831.git.andreyknvl@google.com>
 <4327b260fb17c4776a1e3c844f388e4948cfb747.1559580831.git.andreyknvl@google.com>
 <20190610175326.GC25803@arrakis.emea.arm.com>
 <20190611145720.GA63588@arrakis.emea.arm.com>
 <d3dc2b1f-e8c9-c60d-f648-0bc9b08f20e4@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d3dc2b1f-e8c9-c60d-f648-0bc9b08f20e4@arm.com>
User-Agent: Mutt/1.11.2 (2019-01-07)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Vincenzo,

On Tue, Jun 11, 2019 at 06:09:10PM +0100, Vincenzo Frascino wrote:
> > diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
> > index 3767fb21a5b8..69d0be1fc708 100644
> > --- a/arch/arm64/kernel/process.c
> > +++ b/arch/arm64/kernel/process.c
> > @@ -30,6 +30,7 @@
> >  #include <linux/kernel.h>
> >  #include <linux/mm.h>
> >  #include <linux/stddef.h>
> > +#include <linux/sysctl.h>
> >  #include <linux/unistd.h>
> >  #include <linux/user.h>
> >  #include <linux/delay.h>
> > @@ -323,6 +324,7 @@ void flush_thread(void)
> >  	fpsimd_flush_thread();
> >  	tls_thread_flush();
> >  	flush_ptrace_hw_breakpoint(current);
> > +	clear_thread_flag(TIF_TAGGED_ADDR);
> 
> Nit: in line we the other functions in thread_flush we could have something like
> "tagged_addr_thread_flush", maybe inlined.

The other functions do a lot more than clearing a TIF flag, so they
deserved their own place. We could do this when adding MTE support. I
think we also need to check what other TIF flags we may inadvertently
pass on execve(), maybe have a mask clearing.

> > diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
> > index 094bb03b9cc2..2e927b3e9d6c 100644
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
> >  #endif /* _LINUX_PRCTL_H */
> > diff --git a/kernel/sys.c b/kernel/sys.c
> > index 2969304c29fe..ec48396b4943 100644
> > --- a/kernel/sys.c
> > +++ b/kernel/sys.c
> > @@ -124,6 +124,12 @@
> >  #ifndef PAC_RESET_KEYS
> >  # define PAC_RESET_KEYS(a, b)	(-EINVAL)
> >  #endif
> > +#ifndef SET_TAGGED_ADDR_CTRL
> > +# define SET_TAGGED_ADDR_CTRL(a)	(-EINVAL)
> > +#endif
> > +#ifndef GET_TAGGED_ADDR_CTRL
> > +# define GET_TAGGED_ADDR_CTRL()		(-EINVAL)
> > +#endif
> >  
> >  /*
> >   * this is where the system-wide overflow UID and GID are defined, for
> > @@ -2492,6 +2498,16 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
> >  			return -EINVAL;
> >  		error = PAC_RESET_KEYS(me, arg2);
> >  		break;
> > +	case PR_SET_TAGGED_ADDR_CTRL:
> > +		if (arg3 || arg4 || arg5)
> > +			return -EINVAL;
> > +		error = SET_TAGGED_ADDR_CTRL(arg2);
> > +		break;
> > +	case PR_GET_TAGGED_ADDR_CTRL:
> > +		if (arg2 || arg3 || arg4 || arg5)
> > +			return -EINVAL;
> > +		error = GET_TAGGED_ADDR_CTRL();
> > +		break;
> 
> Why do we need two prctl here? We could have only one and use arg2 as set/get
> and arg3 as a parameter. What do you think?

This follows the other PR_* options, e.g. PR_SET_VL/GET_VL,
PR_*_FP_MODE. We will use other bits in arg2, for example to set the
precise vs imprecise MTE trapping.

-- 
Catalin
