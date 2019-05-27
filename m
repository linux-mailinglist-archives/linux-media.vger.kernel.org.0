Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 423AD2B964
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2019 19:23:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726918AbfE0RXl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 May 2019 13:23:41 -0400
Received: from vps.xff.cz ([195.181.215.36]:53362 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726517AbfE0RXl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 May 2019 13:23:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1558977817; bh=n6UQQPwl0KozZa2WhaD8/EVMDMVjOJMtSSucQTQbTmY=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=WA9Gl8GFo7NFjSRoLcXDmRZ1ParhDNtoY0wnhmrsDXipxRKqf3YcOUJNoWqXESb67
         u/pyobPLyJh3yVB57I8/cQ9Sh+8KWgZDCiJ8Dx3g+iSDKuWAM+VHzXyIgx6aT1lAV8
         bAUcV05mdqigsAsAnxb+UYZGscKp8MkBmB+5BleE=
Date:   Mon, 27 May 2019 19:23:37 +0200
From:   =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To:     =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
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
Subject: Re: [PATCH v2 00/10] Allwinner A64/H6 IR support
Message-ID: <20190527172337.5qxh5qeqnul55gsb@core.my.home>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190527163117.hpealt6cttqzqdxz@core.my.home>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Clément,

On Mon, May 27, 2019 at 06:31:17PM +0200, verejna wrote:
> Hi Clément,
> 
> On Mon, May 27, 2019 at 04:59:35PM +0200, Clément Péron wrote:
> > Hi Ondřej,
> > 
> > On Mon, 27 May 2019 at 15:48, Ondřej Jirman <megous@megous.com> wrote:
> > >
> > > Hi Clément,
> > >
> > > On Mon, May 27, 2019 at 12:25:26AM +0200, Clément Péron wrote:
> > > > Hi,
> > > >
> > > > A64 IR support series[1] pointed out that an A31 bindings should be
> > > > introduced.
> > > >
> > > > This series introduce the A31 compatible bindings, then switch it on
> > > > the already existing board.
> > > >
> > > > Finally introduce A64 and H6 support.
> > >
> > > Does H6 support actually work? I don't see any driver changes and last time
> > > I tried with the exact same bindings, I got RCU stalls shortly after boot.
> > 
> > Actually, I have tested only on H6 on my Beelink GS1 with a "NEC" remote.
> > 
> > I have manually toggle the protocols and do a simple cat in /dev/input/event0
> > # echo nec > /sys/class/rc/rc0/protocols
> > # cat /dev/input/event0 | hexdump
> > 0000000 0093 0000 0000 0000 8bfb 0009 0000 0000
> > 0000010 0004 0004 8028 0000 0093 0000 0000 0000
> > 0000020 8bfb 0009 0000 0000 0000 0000 0000 0000
> > 0000030 0093 0000 0000 0000 55be 000a 0000 0000
> > 0000040 0004 0004 8028 0000 0093 0000 0000 0000
> > 0000050 55be 000a 0000 0000 0000 0000 0000 0000
> > 0000060 0093 0000 0000 0000 fa42 000d 0000 0000
> > 0000070 0004 0004 8028 0000 0093 0000 0000 0000
> > 0000080 fa42 000d 0000 0000 0000 0000 0000 0000
> > 0000090 0093 0000 0000 0000 c41a 000e 0000 0000
> > 00000a0 0004 0004 8028 0000 0093 0000 0000 0000
> > 00000b0 c41a 000e 0000 0000 0000 0000 0000 0000
> > 
> > 
> > Which kernel did you test with? Do you have any log?
> 
> I tested with my kernel (https://megous.com/git/linux/log/?h=opi3-5.2). I also
> tried with 5.1 and the same kernel build on H5, to exclude some early 5.2-rc
> bugs and to see if this is H6 specific.
> 
> I'll try testing again with your patches, and get you some logs. But last time
> they were not very informative.

I'm testing on Orange Pi 3.

With your patches, I get kernel lockup after ~1 minute of use (ssh stops
responding/serial console stops responding). I don't have RC controller to test
the CIR. But just enabling the CIR causes kernel to hang shortly after boot.

I tried booting multiple times. Other results:

boot 2:

- ssh hangs even before connecting (ethernet crashes/is reset)

INFO: rcu_sched detected stalls on CPUs/tasks:
rcu:    0-....: (1 GPs behind) idle=64a/0/0x3 softirq=4091/4091 fqs=2437
dwmac-sun8i 5020000.ethernet eth0: Reset adapter.
rcu: INFO: rcu_sched detected expedited stalls on CPUs/tasks: { 0-... } 5696 jiffies s: 81 root: 0x1/.
rcu: blocking rcu_node structures:
 rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
rcu:    0-....: (1 GPs behind) idle=64a/0/0x3 softirq=4091/4091 fqs=9714 
rcu: INFO: rcu_sched detected expedited stalls on CPUs/tasks: { 0-... } 21568 jiffies s: 81 root: 0x1/.
rcu: blocking rcu_node structures:
rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
rcu:    0-....: (1 GPs behind) idle=64a/0/0x3 softirq=4091/4091 fqs=17203 

above messages appear regularly.

boot 3:

rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
rcu:    0-....: (9 GPs behind) idle=992/0/0x3 softirq=6123/6123 fqs=2600 


Sometimes serial console keeps working. Sometimes it locks up too (but not
frequently). Storage locks up always (any program that was not run before
the crash can't be started and lock up the kernel hard, programs that
were executed prior, can be run again).


Exactly the same kernel build on H5 seems to work (or at least I was not able to
trigger the crash). So this seems to be limited to H6 for now.

I suspect that the crash occurs sooner if I vary the light (turn on/off the table
lamp light).

Without your patches, everything works fine on H6, and I never see
crashes/lockups.

I tired physically covering the IR receiver, and that helps preventing the
crash. As soon as I uncover it, the crash happens again in 1s or so:

rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
rcu:    0-....: (1 GPs behind) idle=4ea/0/0x3 softirq=4483/4484 fqs=2444
rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
rcu:    0-....: (1 GPs behind) idle=4ea/0/0x3 softirq=4483/4484 fqs=9777

This time I got the hung task and reboot: (probably not directly related)

INFO: task find:560 blocked for more than 120 seconds.
      Not tainted 5.2.0-rc2+ #7
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
find            D    0   560    551 0x00000000
Call trace:
 __switch_to+0x6c/0x90
 __schedule+0x1f4/0x578
 schedule+0x28/0xa8
 io_schedule+0x18/0x38
 __lock_page+0x12c/0x208
 pagecache_get_page+0x238/0x2e8
 __get_node_page+0x6c/0x310
 f2fs_get_node_page+0x14/0x20
 f2fs_iget+0x70/0xc60
 f2fs_lookup+0xcc/0x218
 __lookup_slow+0x78/0x160
 lookup_slow+0x3c/0x60
 walk_component+0x1e4/0x2e0
 path_lookupat.isra.13+0x5c/0x1e0
 filename_lookup.part.23+0x6c/0xe8
 user_path_at_empty+0x4c/0x60
 vfs_statx+0x78/0xd8
 __se_sys_newfstatat+0x24/0x48
 __arm64_sys_newfstatat+0x18/0x20
 el0_svc_handler+0x9c/0x170
 el0_svc+0x8/0xc
Kernel panic - not syncing: hung_task: blocked tasks
CPU: 1 PID: 34 Comm: khungtaskd Not tainted 5.2.0-rc2+ #7
Hardware name: OrangePi 3 (DT)
Call trace:
 dump_backtrace+0x0/0xf8
 show_stack+0x14/0x20
 dump_stack+0xa8/0xcc
 panic+0x124/0x2dc
 proc_dohung_task_timeout_secs+0x0/0x40
 kthread+0x120/0x128
 ret_from_fork+0x10/0x18
SMP: stopping secondary CPUs
Kernel Offset: disabled
CPU features: 0x0002,20002000
Memory Limit: none
Rebooting in 3 seconds..


Meanwhile H5 based board now runs for 15 minutes without issues.

So to sum up:

- these crashes are definitely H6 IR related
  - the same kernel, on H5 works
  - covering the sensor prevents the crashes on H6

So we should probably hold on with the series, until this is figured out.

I have tried searching for differences between H3 and H6 BSPs. And there are some:

                break;
        case IR_IRQ_FIFO_SIZE:
-               irq_reg = sunxi_smc_readl(IR_BASE+IR_RXINTE_REG);
-               irq_reg |= IR_FIFO_32;
+               irq_reg = readl(reg_base + IR_RXINTE_REG);
+               irq_reg |= IR_FIFO_20;
                break;
        }

        case IR_CLK_SAMPLE:
-#ifdef FPGA_SIM_CONFIG
-               sample_reg |= 0x3<<0;  /* Fsample = 24MHz/512 = 46875Hz (21.33us) */
-#else
-               sample_reg |= IR_SAMPLE_128;
-#endif
+               sample_reg |= IR_SAMPLE_DEV;
                break;

+       case IR_BOTH_PULSE_MODE:
+               ctrl_reg = readl(reg_base + IR_CTRL_REG);
+               ctrl_reg |= IR_BOTH_PULSE;
+               break;
+       case IR_LOW_PULSE_MODE:
+               ctrl_reg = readl(reg_base + IR_CTRL_REG);
+               ctrl_reg |= IR_LOW_PULSE;
+               break;
+       case IR_HIGH_PULSE_MODE:
+               ctrl_reg = readl(reg_base + IR_CTRL_REG);
+               ctrl_reg |= IR_HIGH_PULSE;
+               break;


0x0000 CIR_CTL

  new bit 8 - CGPO
    General Program Output (GPO) Control in CIR mode for TX Pin
    0: Low level
    1: High level

CIR_RXSTA 0x0030

  RAC is just 13:8 instead of 14:8


I haven't looked deeper, because I have no use for IR on H6. But I hope this
helps. I can help testing patches if you like.

thank you and regards,
	o.

> regards,
> 	o.
> 
> > Thanks,
> > Clément
> > 
> > >
> > > Enabling/disabling ir node was enough to trigger/stop the RCU stalls on H6.
> > >
> > > regards,
> > >         o.
> > >
> > > > Regards,
> > > > Clément
> > > >
> > > > [1] https://lore.kernel.org/patchwork/patch/1031390/#1221464
> > > >
> > > > Changes since v1:
> > > >  - Document reset lines as required since A31
> > > >  - Explain the memory mapping difference in commit log
> > > >  - Fix misspelling "Allwiner" to "Allwinner"
> > > >
> > > > Clément Péron (8):
> > > >   dt-bindings: media: sunxi-ir: add A31 compatible
> > > >   media: rc: sunxi: Add A31 compatible
> > > >   ARM: dts: sunxi: prefer A31 instead of A13 for ir
> > > >   dt-bindings: media: sunxi-ir: Add A64 compatible
> > > >   dt-bindings: media: sunxi-ir: Add H6 compatible
> > > >   arm64: dts: allwinner: h6: Add IR receiver node
> > > >   arm64: dts: allwinner: h6: Enable IR on H6 boards
> > > >   arm64: defconfig: enable IR SUNXI option
> > > >
> > > > Igors Makejevs (1):
> > > >   arm64: dts: allwinner: a64: Add IR node
> > > >
> > > > Jernej Skrabec (1):
> > > >   arm64: dts: allwinner: a64: Enable IR on Orange Pi Win
> > > >
> > > >  .../devicetree/bindings/media/sunxi-ir.txt    | 11 +++++++++--
> > > >  arch/arm/boot/dts/sun6i-a31.dtsi              |  2 +-
> > > >  arch/arm/boot/dts/sun8i-a83t.dtsi             |  2 +-
> > > >  arch/arm/boot/dts/sun9i-a80.dtsi              |  2 +-
> > > >  arch/arm/boot/dts/sunxi-h3-h5.dtsi            |  2 +-
> > > >  .../dts/allwinner/sun50i-a64-orangepi-win.dts |  4 ++++
> > > >  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 18 ++++++++++++++++++
> > > >  .../dts/allwinner/sun50i-h6-beelink-gs1.dts   |  4 ++++
> > > >  .../dts/allwinner/sun50i-h6-orangepi.dtsi     |  4 ++++
> > > >  .../boot/dts/allwinner/sun50i-h6-pine-h64.dts |  4 ++++
> > > >  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  | 19 +++++++++++++++++++
> > > >  arch/arm64/configs/defconfig                  |  1 +
> > > >  drivers/media/rc/sunxi-cir.c                  |  1 +
> > > >  13 files changed, 68 insertions(+), 6 deletions(-)
> > > >
> > > > --
> > > > 2.20.1
> > > >
> > > >
> > > > _______________________________________________
> > > > linux-arm-kernel mailing list
> > > > linux-arm-kernel@lists.infradead.org
> > > > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> > 
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
