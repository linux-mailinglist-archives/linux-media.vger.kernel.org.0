Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A58DE1DC30D
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2020 01:40:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728031AbgETXkh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 May 2020 19:40:37 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:42252 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726747AbgETXkh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 May 2020 19:40:37 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DE56B24D;
        Thu, 21 May 2020 01:40:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1590018035;
        bh=PkepgfIObXpxjO2jKXomny694GUGSZ+ia9lpedJ1Opw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=W6H3rXNX8oIglTMuZ1Na1YAoXYOGb3MCQ+HWnIhXmFLDcnaxQaAbur8JZ29CbZ0St
         eTH3pZOP3KAUdyD2znbgcmu8Q2N2pc+KO0kFMH6C56240k+vFjeOFHwDMKE0qBud7T
         uesdCiAgaSZNgDuSQBsVu852JFz5O98ZUsZl7F+A=
Date:   Thu, 21 May 2020 02:40:23 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Helen Koike <helen.koike@collabora.com>,
        linux-media@vger.kernel.org, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org
Subject: Re: [PATCH 3/5] media: staging: rkisp1: stats: use spin_lock_irqsave
 for irq_lock
Message-ID: <20200520234023.GC25474@pendragon.ideasonboard.com>
References: <20200512120522.25960-1-dafna.hirschfeld@collabora.com>
 <20200512120522.25960-4-dafna.hirschfeld@collabora.com>
 <2d3f52d2-73d7-1e8d-eee3-669012854491@collabora.com>
 <5c76ffe9-db3e-20a0-f280-75ded6c72e2c@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5c76ffe9-db3e-20a0-f280-75ded6c72e2c@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Wed, May 20, 2020 at 09:22:29PM +0200, Dafna Hirschfeld wrote:
> On 20.05.20 13:11, Helen Koike wrote:
> > On 5/12/20 9:05 AM, Dafna Hirschfeld wrote:
> >> Currently 'spin_lock' is used in order to lock the 'irq_lock'.
> >> This should be replaced with 'spin_lock_irqsave' since it is
> >> used in the irq handler.
> >>
> >> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> >> ---
> >>   drivers/staging/media/rkisp1/rkisp1-stats.c | 5 +++--
> >>   1 file changed, 3 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/staging/media/rkisp1/rkisp1-stats.c b/drivers/staging/media/rkisp1/rkisp1-stats.c
> >> index 12998db955e6..5578fdeb8a18 100644
> >> --- a/drivers/staging/media/rkisp1/rkisp1-stats.c
> >> +++ b/drivers/staging/media/rkisp1/rkisp1-stats.c
> >> @@ -403,9 +403,10 @@ void rkisp1_stats_isr(struct rkisp1_stats *stats, u32 isp_ris)
> >>   	struct rkisp1_device *rkisp1 = stats->rkisp1;
> >>   	struct rkisp1_isp_readout_work *work;
> >>   	unsigned int isp_mis_tmp = 0;
> >> +	unsigned long flags;
> >>   	u32 val;
> >>   
> >> -	spin_lock(&stats->irq_lock);
> >> +	spin_lock_irqsave(&stats->irq_lock, flags);
> > 
> > Since you are moving this function to a threaded irq handler, you won't be in interrupt context.
> > 
> > The spin_lock_irqsave() function disable interrupts for the critical section, are you sure this is
> > required?
>
> Hi,
> The lock is also used in the hard irq handler in the patch that moves the statistics to threaded interrupt.
> The code in the hard irq iterates the buffers queue to find the next buffer available and set the flags of
> the ready statistics on it.

The rules about spinlocks are as follows.

If the lock is never used in an interrupt handler context (or similar
context, such as a timer handler for instance), then you can use
spin_lock(). The reason is that, in such cases, a section covered by
spin_lock()/spin_unlock() will not be preempted on the same CPU by a
section that could try to take the same lock. This also applies to locks
that are only used in interrupt contexts where interrupts are guaranteed
to be disabled. To put it differently, if there's no risk that a
spinlock-covered section will be preempted by code that will try to take
the same lock, spin_lock() is enough.

Otherwise, you should use spin_lock() in code that is guaranteed to run
with interrupts disabled (such as hard IRQ handlers, or code that called
after another spin_lock_irq() or spin_lock_irqsave() on another lock),
spin_lock_irq() in code that is guaranteed to run with interrupts
enabled (such as code paths from userspace where you can guarantee
interrupts haven't been disabled by, for instance, a spin_lock_irq() in
the call stack), and spin_lock_irqsave() when you're not sure.

There's a tendency to always use spin_lock_irqsave() just to make sure,
and it can indeed avoid potential issues when code is later refactored
and assumptions that lead to the selection of the propery spin_lock*()
variant change. That's a bit idea in paths where latency is critical,
but should otherwise not be too much of a problem.

In this patch, as rkisp1_stats_isr() is run in a hard IRQ context with
interrupts disabled, there's no need to use spin_lock_irqsave(),
spin_lock() is totally fine.

> >>   	val = RKISP1_STATS_MEAS_MASK;
> >>   	rkisp1_write(rkisp1, val, RKISP1_CIF_ISP_ICR);
> >> @@ -435,7 +436,7 @@ void rkisp1_stats_isr(struct rkisp1_stats *stats, u32 isp_ris)
> >>   	}
> >>   
> >>   unlock:
> >> -	spin_unlock(&stats->irq_lock);
> >> +	spin_unlock_irqrestore(&stats->irq_lock, flags);
> >>   }
> >>   
> >>   static void rkisp1_init_stats(struct rkisp1_stats *stats)

-- 
Regards,

Laurent Pinchart
