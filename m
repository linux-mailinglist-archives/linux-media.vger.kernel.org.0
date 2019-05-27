Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87E5E2BAB6
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2019 21:30:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727145AbfE0TaU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 May 2019 15:30:20 -0400
Received: from vps.xff.cz ([195.181.215.36]:54592 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726817AbfE0TaT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 May 2019 15:30:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1558985416; bh=6GC/7M9kRKcpMXBdSuJ9FYLBvBuSDIGREJSay2jdqxA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=a2Z2uS+NnDmX59JzXj03pRXWrIeUUZZ5Nu8BZiOH39KZp90MxtbVlQPVxXBp9LN1k
         ig6W+9jM0LDldSta0RIuKuXcGIaHVEl4sSVxwZdW0/lkqAwE4ZnELmNdgfN00SCU09
         C2HQdAR+gL7deqbasq1jzqzhRPOxVpvAlfM6K12A=
Date:   Mon, 27 May 2019 21:30:16 +0200
From:   =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To:     =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2 00/10] Allwinner A64/H6 IR support
Message-ID: <20190527193016.yxngu5grsqnctx3z@core.my.home>
Mail-Followup-To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-media@vger.kernel.org
References: <20190526222536.10917-1-peron.clem@gmail.com>
 <20190527134805.j7t4ffstrnhdml47@core.my.home>
 <CAJiuCcdnQa0TArduT4yBbUyd+dOaM0cQ1JcRUQLXLR6s_5e8sA@mail.gmail.com>
 <20190527163117.hpealt6cttqzqdxz@core.my.home>
 <20190527172337.5qxh5qeqnul55gsb@core.my.home>
 <CAJiuCccnRCqez2uG-pU8XY4Z=5S8rDwFB3rgsBovPHY1Uxyazw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJiuCccnRCqez2uG-pU8XY4Z=5S8rDwFB3rgsBovPHY1Uxyazw@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Clément,

On Mon, May 27, 2019 at 08:49:59PM +0200, Clément Péron wrote:
> Hi Ondrej,
> 
> >
> > I'm testing on Orange Pi 3.
> >
> > With your patches, I get kernel lockup after ~1 minute of use (ssh stops
> > responding/serial console stops responding). I don't have RC controller to test
> > the CIR. But just enabling the CIR causes kernel to hang shortly after boot.
> >
> > I tried booting multiple times. Other results:
> >
> > boot 2:
> >
> > - ssh hangs even before connecting (ethernet crashes/is reset)
> >
> > INFO: rcu_sched detected stalls on CPUs/tasks:
> > rcu:    0-....: (1 GPs behind) idle=64a/0/0x3 softirq=4091/4091 fqs=2437
> > dwmac-sun8i 5020000.ethernet eth0: Reset adapter.
> > rcu: INFO: rcu_sched detected expedited stalls on CPUs/tasks: { 0-... } 5696 jiffies s: 81 root: 0x1/.
> > rcu: blocking rcu_node structures:
> >  rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> > rcu:    0-....: (1 GPs behind) idle=64a/0/0x3 softirq=4091/4091 fqs=9714
> > rcu: INFO: rcu_sched detected expedited stalls on CPUs/tasks: { 0-... } 21568 jiffies s: 81 root: 0x1/.
> > rcu: blocking rcu_node structures:
> > rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> > rcu:    0-....: (1 GPs behind) idle=64a/0/0x3 softirq=4091/4091 fqs=17203
> >
> > above messages appear regularly.
> >
> > boot 3:
> >
> > rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> > rcu:    0-....: (9 GPs behind) idle=992/0/0x3 softirq=6123/6123 fqs=2600
> >
> >
> > Sometimes serial console keeps working. Sometimes it locks up too (but not
> > frequently). Storage locks up always (any program that was not run before
> > the crash can't be started and lock up the kernel hard, programs that
> > were executed prior, can be run again).
> >
> >
> > Exactly the same kernel build on H5 seems to work (or at least I was not able to
> > trigger the crash). So this seems to be limited to H6 for now.
> >
> > I suspect that the crash occurs sooner if I vary the light (turn on/off the table
> > lamp light).
> >
> > Without your patches, everything works fine on H6, and I never see
> > crashes/lockups.
> >
> > I tired physically covering the IR receiver, and that helps preventing the
> > crash. As soon as I uncover it, the crash happens again in 1s or so:
> >
> > rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> > rcu:    0-....: (1 GPs behind) idle=4ea/0/0x3 softirq=4483/4484 fqs=2444
> > rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> > rcu:    0-....: (1 GPs behind) idle=4ea/0/0x3 softirq=4483/4484 fqs=9777
> >
> > This time I got the hung task and reboot: (probably not directly related)
> >
> > INFO: task find:560 blocked for more than 120 seconds.
> >       Not tainted 5.2.0-rc2+ #7
> > "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> > find            D    0   560    551 0x00000000
> > Call trace:
> >  __switch_to+0x6c/0x90
> >  __schedule+0x1f4/0x578
> >  schedule+0x28/0xa8
> >  io_schedule+0x18/0x38
> >  __lock_page+0x12c/0x208
> >  pagecache_get_page+0x238/0x2e8
> >  __get_node_page+0x6c/0x310
> >  f2fs_get_node_page+0x14/0x20
> >  f2fs_iget+0x70/0xc60
> >  f2fs_lookup+0xcc/0x218
> >  __lookup_slow+0x78/0x160
> >  lookup_slow+0x3c/0x60
> >  walk_component+0x1e4/0x2e0
> >  path_lookupat.isra.13+0x5c/0x1e0
> >  filename_lookup.part.23+0x6c/0xe8
> >  user_path_at_empty+0x4c/0x60
> >  vfs_statx+0x78/0xd8
> >  __se_sys_newfstatat+0x24/0x48
> >  __arm64_sys_newfstatat+0x18/0x20
> >  el0_svc_handler+0x9c/0x170
> >  el0_svc+0x8/0xc
> > Kernel panic - not syncing: hung_task: blocked tasks
> > CPU: 1 PID: 34 Comm: khungtaskd Not tainted 5.2.0-rc2+ #7
> > Hardware name: OrangePi 3 (DT)
> > Call trace:
> >  dump_backtrace+0x0/0xf8
> >  show_stack+0x14/0x20
> >  dump_stack+0xa8/0xcc
> >  panic+0x124/0x2dc
> >  proc_dohung_task_timeout_secs+0x0/0x40
> >  kthread+0x120/0x128
> >  ret_from_fork+0x10/0x18
> > SMP: stopping secondary CPUs
> > Kernel Offset: disabled
> > CPU features: 0x0002,20002000
> > Memory Limit: none
> > Rebooting in 3 seconds..
> >
> >
> > Meanwhile H5 based board now runs for 15 minutes without issues.
> >
> > So to sum up:
> >
> > - these crashes are definitely H6 IR related
> >   - the same kernel, on H5 works
> >   - covering the sensor prevents the crashes on H6
> >
> > So we should probably hold on with the series, until this is figured out.
> 
> Thanks for testing, but I think it's more hardware related.
> It seems that your IR is flooded or misconfigured for your board.
> Could you add a simple print in the "sunxi_ir_irq"

Yes, I get flood of IRQs with status = 0x30. (after I turn on the lamp,
but it persists even after I turn it off and cover the IR sensor).

That's weird, because on H6 in CIR_RXSTA, bit 5 is undefined but corresponding 
bit in CIR_RXINT is DRQ_EN (RX FIFO DMA Enable)

So I'm not sure what it could be flooded with and why IRQs keep being
fired, even with no sensor input after the FIFO is read.

regards,
	o.

> If it's confirmed, maybe tweak the threshold configuration or
> implement the new active_threshold will help.
> 
> With my hardware Beelink GS1 and on Jernej's board (A64) there is no issue.
> 
> I will disable all the other H6 boards until someone test it.
> 
> Regards,
> Clément
