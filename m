Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C4E81EFB9F
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2020 16:41:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728176AbgFEOkz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Jun 2020 10:40:55 -0400
Received: from ste-pvt-msa2.bahnhof.se ([213.80.101.71]:43478 "EHLO
        ste-pvt-msa2.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727113AbgFEOkz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Jun 2020 10:40:55 -0400
X-Greylist: delayed 588 seconds by postgrey-1.27 at vger.kernel.org; Fri, 05 Jun 2020 10:40:53 EDT
Received: from localhost (localhost [127.0.0.1])
        by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id DD4433F6A7;
        Fri,  5 Jun 2020 16:31:03 +0200 (CEST)
Authentication-Results: ste-pvt-msa2.bahnhof.se;
        dkim=pass (1024-bit key; unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=P1NrJ9Ks;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
        DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Authentication-Results: ste-ftg-msa2.bahnhof.se (amavisd-new);
        dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
        by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ZzJm3QusKM0P; Fri,  5 Jun 2020 16:30:59 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
        (Authenticated sender: mb878879)
        by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 750183F628;
        Fri,  5 Jun 2020 16:30:57 +0200 (CEST)
Received: from localhost.localdomain (unknown [134.134.139.76])
        by mail1.shipmail.org (Postfix) with ESMTPSA id 7F8493601AD;
        Fri,  5 Jun 2020 16:30:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
        t=1591367457; bh=WmmKpNHpyNnLQkrBY2MHybJLK6DanaIpP6iniTFoQGE=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=P1NrJ9Ksaz/Mu6lOw3BCKxoGnXwlsK564hqTfU32mVfedyJmsS5c4seF5zeSaZ46q
         FuEfibE+fHQnpa/x39VHqeB3JqC21BmEctstREEAZPA7snFzoBcA/MTtT9uxkwoKDG
         yaqYCBUWv+y/aIgYJaCH0q5RNYvlG+HbUYplB8yE=
Subject: Re: [PATCH] dma-fence: basic lockdep annotations
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>
Cc:     linux-rdma@vger.kernel.org,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        amd-gfx@lists.freedesktop.org,
        Chris Wilson <chris@chris-wilson.co.uk>,
        linaro-mm-sig@lists.linaro.org,
        Thomas Hellstrom <thomas.hellstrom@intel.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        linux-media@vger.kernel.org,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Mika Kuoppala <mika.kuoppala@intel.com>
References: <20200604081224.863494-4-daniel.vetter@ffwll.ch>
 <20200605132953.899664-1-daniel.vetter@ffwll.ch>
From:   =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= 
        <thomas_os@shipmail.org>
Message-ID: <83805409-ad4a-65a3-d9cf-21878308dc92@shipmail.org>
Date:   Fri, 5 Jun 2020 16:30:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200605132953.899664-1-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 6/5/20 3:29 PM, Daniel Vetter wrote:
> Design is similar to the lockdep annotations for workers, but with
> some twists:
>
> - We use a read-lock for the execution/worker/completion side, so that
>    this explicit annotation can be more liberally sprinkled around.
>    With read locks lockdep isn't going to complain if the read-side
>    isn't nested the same way under all circumstances, so ABBA deadlocks
>    are ok. Which they are, since this is an annotation only.
>
> - We're using non-recursive lockdep read lock mode, since in recursive
>    read lock mode lockdep does not catch read side hazards. And we
>    _very_ much want read side hazards to be caught. For full details of
>    this limitation see
>
>    commit e91498589746065e3ae95d9a00b068e525eec34f
>    Author: Peter Zijlstra <peterz@infradead.org>
>    Date:   Wed Aug 23 13:13:11 2017 +0200
>
>        locking/lockdep/selftests: Add mixed read-write ABBA tests
>
> - To allow nesting of the read-side explicit annotations we explicitly
>    keep track of the nesting. lock_is_held() allows us to do that.
>
> - The wait-side annotation is a write lock, and entirely done within
>    dma_fence_wait() for everyone by default.
>
> - To be able to freely annotate helper functions I want to make it ok
>    to call dma_fence_begin/end_signalling from soft/hardirq context.
>    First attempt was using the hardirq locking context for the write
>    side in lockdep, but this forces all normal spinlocks nested within
>    dma_fence_begin/end_signalling to be spinlocks. That bollocks.
>
>    The approach now is to simple check in_atomic(), and for these cases
>    entirely rely on the might_sleep() check in dma_fence_wait(). That
>    will catch any wrong nesting against spinlocks from soft/hardirq
>    contexts.
>
> The idea here is that every code path that's critical for eventually
> signalling a dma_fence should be annotated with
> dma_fence_begin/end_signalling. The annotation ideally starts right
> after a dma_fence is published (added to a dma_resv, exposed as a
> sync_file fd, attached to a drm_syncobj fd, or anything else that
> makes the dma_fence visible to other kernel threads), up to and
> including the dma_fence_wait(). Examples are irq handlers, the
> scheduler rt threads, the tail of execbuf (after the corresponding
> fences are visible), any workers that end up signalling dma_fences and
> really anything else. Not annotated should be code paths that only
> complete fences opportunistically as the gpu progresses, like e.g.
> shrinker/eviction code.
>
> The main class of deadlocks this is supposed to catch are:
>
> Thread A:
>
> 	mutex_lock(A);
> 	mutex_unlock(A);
>
> 	dma_fence_signal();
>
> Thread B:
>
> 	mutex_lock(A);
> 	dma_fence_wait();
> 	mutex_unlock(A);
>
> Thread B is blocked on A signalling the fence, but A never gets around
> to that because it cannot acquire the lock A.
>
> Note that dma_fence_wait() is allowed to be nested within
> dma_fence_begin/end_signalling sections. To allow this to happen the
> read lock needs to be upgraded to a write lock, which means that any
> other lock is acquired between the dma_fence_begin_signalling() call and
> the call to dma_fence_wait(), and still held, this will result in an
> immediate lockdep complaint. The only other option would be to not
> annotate such calls, defeating the point. Therefore these annotations
> cannot be sprinkled over the code entirely mindless to avoid false
> positives.
>
> Originally I hope that the cross-release lockdep extensions would
> alleviate the need for explicit annotations:
>
> https://lwn.net/Articles/709849/
>
> But there's a few reasons why that's not an option:
>
> - It's not happening in upstream, since it got reverted due to too
>    many false positives:
>
> 	commit e966eaeeb623f09975ef362c2866fae6f86844f9
> 	Author: Ingo Molnar <mingo@kernel.org>
> 	Date:   Tue Dec 12 12:31:16 2017 +0100
>
> 	    locking/lockdep: Remove the cross-release locking checks
>
> 	    This code (CONFIG_LOCKDEP_CROSSRELEASE=y and CONFIG_LOCKDEP_COMPLETIONS=y),
> 	    while it found a number of old bugs initially, was also causing too many
> 	    false positives that caused people to disable lockdep - which is arguably
> 	    a worse overall outcome.
>
> - cross-release uses the complete() call to annotate the end of
>    critical sections, for dma_fence that would be dma_fence_signal().
>    But we do not want all dma_fence_signal() calls to be treated as
>    critical, since many are opportunistic cleanup of gpu requests. If
>    these get stuck there's still the main completion interrupt and
>    workers who can unblock everyone. Automatically annotating all
>    dma_fence_signal() calls would hence cause false positives.
>
> - cross-release had some educated guesses for when a critical section
>    starts, like fresh syscall or fresh work callback. This would again
>    cause false positives without explicit annotations, since for
>    dma_fence the critical sections only starts when we publish a fence.
>
> - Furthermore there can be cases where a thread never does a
>    dma_fence_signal, but is still critical for reaching completion of
>    fences. One example would be a scheduler kthread which picks up jobs
>    and pushes them into hardware, where the interrupt handler or
>    another completion thread calls dma_fence_signal(). But if the
>    scheduler thread hangs, then all the fences hang, hence we need to
>    manually annotate it. cross-release aimed to solve this by chaining
>    cross-release dependencies, but the dependency from scheduler thread
>    to the completion interrupt handler goes through hw where
>    cross-release code can't observe it.
>
> In short, without manual annotations and careful review of the start
> and end of critical sections, cross-relese dependency tracking doesn't
> work. We need explicit annotations.
>
> v2: handle soft/hardirq ctx better against write side and dont forget
> EXPORT_SYMBOL, drivers can't use this otherwise.
>
> v3: Kerneldoc.
>
> v4: Some spelling fixes from Mika
>
> v5: Amend commit message to explain in detail why cross-release isn't
> the solution.
>
> Cc: Mika Kuoppala <mika.kuoppala@intel.com>
> Cc: Thomas Hellstrom <thomas.hellstrom@intel.com>
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Cc: linux-rdma@vger.kernel.org
> Cc: amd-gfx@lists.freedesktop.org
> Cc: intel-gfx@lists.freedesktop.org
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Christian König <christian.koenig@amd.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---

Reviewed-by: Thomas Hellström <thomas.hellstrom@intel.com>


