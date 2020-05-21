Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 652DF1DC356
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2020 02:10:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726748AbgEUAKS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 May 2020 20:10:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726619AbgEUAKS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 May 2020 20:10:18 -0400
Received: from Galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AD09C061A0E;
        Wed, 20 May 2020 17:10:18 -0700 (PDT)
Received: from [5.158.153.53] (helo=debian-buster-darwi.lab.linutronix.de)
        by Galois.linutronix.de with esmtpsa (TLS1.2:RSA_AES_256_CBC_SHA1:256)
        (Exim 4.80)
        (envelope-from <a.darwish@linutronix.de>)
        id 1jbYmC-0006mO-Af; Thu, 21 May 2020 02:09:32 +0200
Date:   Thu, 21 May 2020 02:09:30 +0200
From:   "Ahmed S. Darwish" <a.darwish@linutronix.de>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
        "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
        amd-gfx@lists.freedesktop.org,
        "Paul E. McKenney" <paulmck@kernel.org>,
        David Airlie <airlied@linux.ie>,
        "Sebastian A. Siewior" <bigeasy@linutronix.de>,
        LKML <linux-kernel@vger.kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        Alex Deucher <alexander.deucher@amd.com>,
        Felix Kuehling <Felix.Kuehling@amd.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v1 13/25] dma-buf: Use sequence counter with associated
 wound/wait mutex
Message-ID: <20200521000930.GA359643@debian-buster-darwi.lab.linutronix.de>
References: <20200519214547.352050-1-a.darwish@linutronix.de>
 <20200519214547.352050-14-a.darwish@linutronix.de>
 <e28c251e-5771-598c-37dd-c6be2de4b9e1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e28c251e-5771-598c-37dd-c6be2de4b9e1@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, May 20, 2020, Christian König wrote:
> Am 19.05.20 um 23:45 schrieb Ahmed S. Darwish:
> > A sequence counter write side critical section must be protected by some
> > form of locking to serialize writers. If the serialization primitive is
> > not disabling preemption implicitly, preemption has to be explicitly
> > disabled before entering the sequence counter write side critical
> > section.
> >
> > The dma-buf reservation subsystem uses plain sequence counters to manage
> > updates to reservations. Writer serialization is accomplished through a
> > wound/wait mutex.
> >
> > Acquiring a wound/wait mutex does not disable preemption, so this needs
> > to be done manually before and after the write side critical section.
> >
> > Use the newly-added seqcount_ww_mutex_t instead:
> >
> >    - It associates the ww_mutex with the sequence count, which enables
> >      lockdep to validate that the write side critical section is properly
> >      serialized.
> >
> >    - It removes the need to explicitly add preempt_disable/enable()
> >      around the write side critical section because the write_begin/end()
> >      functions for this new data type automatically do this.
> >
> > If lockdep is disabled this ww_mutex lock association is compiled out
> > and has neither storage size nor runtime overhead.
>
> Mhm, is the dma_resv object the only user of this new seqcount_ww_mutex
> variant ?
>
> If yes we are trying to get rid of this sequence counter for quite some
> time, so I would rather invest the additional time to finish this.
>

In this patch series, each extra "seqcount with associated lock" data
type costs us, exactly:

  - 1 typedef definition, seqcount_ww_mutex_t
  - 1 static initializer, SEQCNT_WW_MUTEX_ZERO()
  - 1 runtime initializer, seqcount_ww_mutex_init()

Definitions for the typedef and the 2 initializers above are
template-code one liners.

The logic which automatically disables preemption upon entering a
seqcount_ww_mutex_t write side critical section is also already shared
with seqcount_mutex_t and any future, preemptible, associated lock.

So, yes, dma-resv is the only user of seqcount_ww_mutex.

But even in that case, given the one liner template code nature of
seqcount_ww_mutex_t logic, it does not make sense to block the dma_resv
and amdgpu change until at some point in the future the sequence counter
is completely removed.

**If and when** the sequence counter gets removed, please just remove
the seqcount_ww_mutex_t data type with it. It will be extremely simple.

> Regards,
> Christian.
>

Thanks,

--
Ahmed S. Darwish
Linutronix GmbH
