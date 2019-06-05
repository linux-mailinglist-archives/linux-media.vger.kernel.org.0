Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FE9235E5F
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2019 15:52:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728139AbfFENvw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jun 2019 09:51:52 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:37983 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727980AbfFENvw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jun 2019 09:51:52 -0400
Received: by mail-oi1-f193.google.com with SMTP id v186so3936539oie.5
        for <linux-media@vger.kernel.org>; Wed, 05 Jun 2019 06:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qSXKEpQzRaizBS7nt8I+mjHWO4fxvkjduAxYeszwXwg=;
        b=oE5btL1wVjN1wtq7YW3+hfeZZ8BG/b13cAJcAmO8YKfgnz0iW0AuWrycYsxnuOGd1v
         Qh88X1htr6SIww1my2M+JIRsHMVl38uQu/MTIjf69ZEyaZj/3+1Fa9uewoN5266/CaXd
         h1waLNObVEhGmnVqMQlGXyz1M0VLjM953FUX5Fz5ZHWDgCO3QHNqngNBVJJkhYiIND3u
         kHaLKqzo7+g91m9Pu15iJKN8ut3RMl9jEhrGgJLklfnjV/Kk5N6pHvp4aN/PHnWVB6U3
         4eF4W7i/LksHxIvSSm3c4sBK6cDtp2Y5BwLj+1E0djxvfj0/A3+tnYvpjwJSo/8K+L0T
         yBfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qSXKEpQzRaizBS7nt8I+mjHWO4fxvkjduAxYeszwXwg=;
        b=NixWyNfitjiY0ie7VHG/FprBAUbklBaemzfHyCKDvpBniZjlH+mt4s6F7o92doT3Gd
         AVq6bSWXILsvDFDo/hDOfaDaW0ihA6kyCv85A9sopuTP+DMotwTpCkInkhibl+JF88C+
         SDHKeacQZIhCkGy6rpMHphCXf5N4TEvxehzr2wHZQ0RIJO9FO0/5swc7wMxE/dHlHb9a
         tTT41gmpjv1bZtfdheAx8IkYOi+AZ62RcA8C0jNK3465CtWKT9DB/5uBCDr2hcSYTmrT
         Uv4WPXrRSDmZcDaBlj0Pd/gFm6I288q4tugyJ2QzPp24EyxfIfv5AY6o5fRjrYTv7tLO
         VyMQ==
X-Gm-Message-State: APjAAAX+lN4xPeUQ6VBQXeBBqKyXy6MqPR9ut1xj/+BwX1PDqyF11MFO
        gE2VjQZOA3VtUok8DLhZhmy826Om5kT/5BtZPHA=
X-Google-Smtp-Source: APXvYqyaZqj89tbIlF01aGyMBBpc+MUziy7pjeA2N/W7It/V90OLjb0ZJLA9OV7iX3872dfUP//jJVu1m51nWWbQtLY=
X-Received: by 2002:aca:5ad6:: with SMTP id o205mr3937312oib.92.1559742711357;
 Wed, 05 Jun 2019 06:51:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190418164414.29373-1-p.zabel@pengutronix.de>
 <20190529154431.11177-1-TheSven73@gmail.com> <CAOMZO5BeEMyEPUbPB8vAbJb1OoUuPxGLh=EBGif12uAMG4=qoQ@mail.gmail.com>
 <CAGngYiWdyzhmsRuAsH_35qdt1SLguh2sUxh=cAK58RWnhm2Y7A@mail.gmail.com>
 <4afffe3822026e23a55c05b7e18b43a2d6d0274e.camel@ndufresne.ca>
 <CAGngYiUZJCwg-VgOafU=gBgDtaSV++UVmNQawn6d5LunBFg1FQ@mail.gmail.com>
 <CAOMZO5AxL6MeOY=Pooq65B-Ly=t41JVp0Y_nXrYUKk03yh0KJQ@mail.gmail.com>
 <VE1PR04MB6638C5E75F797BD3114C467A89190@VE1PR04MB6638.eurprd04.prod.outlook.com>
 <CAGngYiX3xOHYw97VU-buuLLwu7vuMk23HEatDpk6vgieE7ozXg@mail.gmail.com>
 <VE1PR04MB663874C6BDAE5ED7B5A36A3F89150@VE1PR04MB6638.eurprd04.prod.outlook.com>
 <CAGngYiW9vqHXVt771P7tQvHwJ1ifr2qbtmxnVm7Ff6vY=DjKwg@mail.gmail.com> <VE1PR04MB663800AFCE7FF016DBE9EB7689160@VE1PR04MB6638.eurprd04.prod.outlook.com>
In-Reply-To: <VE1PR04MB663800AFCE7FF016DBE9EB7689160@VE1PR04MB6638.eurprd04.prod.outlook.com>
From:   Sven Van Asbroeck <thesven73@gmail.com>
Date:   Wed, 5 Jun 2019 09:51:40 -0400
Message-ID: <CAGngYiWJ3u0NpP8Tji0oOJ4-9MFm1Ac1mzur_gL9+e8Jsj4EdA@mail.gmail.com>
Subject: Re: [v8] media: imx: add mem2mem device
To:     Robin Gong <yibin.gong@nxp.com>
Cc:     Fabio Estevam <festevam@gmail.com>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 5, 2019 at 6:08 AM Robin Gong <yibin.gong@nxp.com> wrote:
>
> Hi Sven,
>         I met below crash on v5.2-rc1 and found it's related with commit 728e0fbf263e, after googled,  the latest
> Linux-next should fix the issue, please check https://lkml.org/lkml/2019/6/3/1405.
> After I rebased to the latest linux-next, no such issue but still another crash issue after kernel bootup, I believe that's
> Caused by NFS, because the issue is gone if I mount to mmc rootfs instead of NFS. I don't think it's related with
> Sdma firmware download, but seems your issue is different with mine. Anyway, could you try the latest linux-next?

I tried the latest linux-next
(b2924447b98afa42f13f16b1a4786f0872a2fc37) but the same issue remains:
kernel crashes on boot if sdma firmware is loaded.
kernel boots normally if using sdma firmware in rom.

Crash log:

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version
5.2.0-rc3-next-20190605-00042-g1a0686c7a5d2 (sva@svens-asus) (gcc
version 7.3.1 20180425 [linaro-7.3-2018.05 revision
d29120a424ecfbc167ef90065c0eeb7f91977701] (Linaro GCC 7.3-2018.05)) #1
SMP Wed Jun 5 09:33:56 EDT 2019
<snip>
[    1.337525] imx-sdma 20ec000.sdma: loaded firmware 3.3
[    1.339537] random: fast init done
[    1.346061] imx-pgc-pd imx-pgc-power-domain.0: DMA mask not set
[    1.346557] imx-pgc-pd imx-pgc-power-domain.1: DMA mask not set
[    1.411436] random: crng init done
[    1.455144] pfuze100-regulator 1-0008: unrecognized pfuze chip ID!
[    1.455874] pfuze100-regulator: probe of 1-0008 failed with error -110
[    1.458875] 2020000.serial: ttymxc0 at MMIO 0x2020000 (irq = 27,
base_baud = 5000000) is a IMX
[    2.332541] printk: console [ttymxc0] enabled
[    2.339484] imx-uart 21e8000.serial: has an ltc2870 combined
rs232/rs485 transceiver
[    2.347850] 21e8000.serial: ttymxc1 at MMIO 0x21e8000 (irq = 72,
base_baud = 5000000) is a IMX
[    2.357867] 21ec000.serial: ttymxc2 at MMIO 0x21ec000 (irq = 73,
base_baud = 5000000) is a IMX
[    2.368019] 21f0000.serial: ttymxc3 at MMIO 0x21f0000 (irq = 74,
base_baud = 5000000) is a IMX
[    2.400772] etnaviv etnaviv: bound 130000.gpu (ops gpu_ops)
[    2.407076] etnaviv etnaviv: bound 134000.gpu (ops gpu_ops)
[    2.413221] etnaviv etnaviv: bound 2204000.gpu (ops gpu_ops)
[    2.418977] etnaviv-gpu 130000.gpu: model: GC2000, revision: 5108
[    2.437166] etnaviv-gpu 130000.gpu: command buffer outside valid
memory window
[    2.445459] etnaviv-gpu 134000.gpu: model: GC320, revision: 5007
[    2.463082] etnaviv-gpu 134000.gpu: command buffer outside valid
memory window
[    2.471240] etnaviv-gpu 2204000.gpu: model: GC355, revision: 1215
[    2.477413] etnaviv-gpu 2204000.gpu: Ignoring GPU with VG and FE2.0
[    2.486360] [drm] Initialized etnaviv 1.2.0 20151214 for etnaviv on minor 0
[    2.497949] imx-ipuv3 2400000.ipu: IPUv3H probed
[    2.505316] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    2.512006] [drm] No driver support for vblank timestamp query.
[    2.519532] imx-drm display-subsystem: bound imx-ipuv3-crtc.2 (ops
ipu_crtc_ops)
[    2.527288] imx-drm display-subsystem: bound imx-ipuv3-crtc.3 (ops
ipu_crtc_ops)
[    2.535064] imx-drm display-subsystem: bound imx-ipuv3-crtc.6 (ops
ipu_crtc_ops)
[    2.542762] imx-drm display-subsystem: bound imx-ipuv3-crtc.7 (ops
ipu_crtc_ops)
[    2.550523] imx-drm display-subsystem: failed to bind 120000.hdmi
(ops dw_hdmi_imx_ops): -517
[    2.560505] imx-drm display-subsystem: master bind failed: -517
[    2.566609] imx-ipuv3 2800000.ipu: IPUv3H probed
[   27.324992] rcu: INFO: rcu_sched self-detected stall on CPU
[   27.330691] rcu: 0-....: (2599 ticks this GP) idle=532/0/0x3
softirq=36/36 fqs=1300
[   27.338654] (t=2601 jiffies g=-1147 q=29)
[   27.342771] NMI backtrace for cpu 0
[   27.346283] CPU: 0 PID: 0 Comm: swapper/0 Not tainted
5.2.0-rc3-next-20190605-00042-g1a0686c7a5d2 #1
[   27.355432] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
[   27.361996] [<c01127a0>] (unwind_backtrace) from [<c010cfb4>]
(show_stack+0x10/0x14)
[   27.369769] [<c010cfb4>] (show_stack) from [<c0c75010>]
(dump_stack+0xd8/0x110)
[   27.377106] [<c0c75010>] (dump_stack) from [<c0c7bb68>]
(nmi_cpu_backtrace+0xac/0xbc)
[   27.384959] [<c0c7bb68>] (nmi_cpu_backtrace) from [<c0c7bc58>]
(nmi_trigger_cpumask_backtrace+0xe0/0x134)
[   27.394556] [<c0c7bc58>] (nmi_trigger_cpumask_backtrace) from
[<c01b1850>] (rcu_dump_cpu_stacks+0xa0/0xd8)
[   27.404234] [<c01b1850>] (rcu_dump_cpu_stacks) from [<c01b0aa8>]
(rcu_sched_clock_irq+0x7ec/0xa44)
[   27.413220] [<c01b0aa8>] (rcu_sched_clock_irq) from [<c01b8a64>]
(update_process_times+0x30/0x5c)
[   27.422117] [<c01b8a64>] (update_process_times) from [<c01cd8f4>]
(tick_sched_timer+0x5c/0xc0)
[   27.430751] [<c01cd8f4>] (tick_sched_timer) from [<c01b978c>]
(__hrtimer_run_queues+0x198/0x590)
[   27.439560] [<c01b978c>] (__hrtimer_run_queues) from [<c01bab78>]
(hrtimer_interrupt+0x118/0x2e0)
[   27.448455] [<c01bab78>] (hrtimer_interrupt) from [<c01117c0>]
(twd_handler+0x2c/0x40)
[   27.456399] [<c01117c0>] (twd_handler) from [<c019bbd0>]
(handle_percpu_devid_irq+0xdc/0x36c)
[   27.464953] [<c019bbd0>] (handle_percpu_devid_irq) from
[<c01959ac>] (generic_handle_irq+0x20/0x34)
[   27.474022] [<c01959ac>] (generic_handle_irq) from [<c0195fac>]
(__handle_domain_irq+0x64/0xe0)
[   27.482750] [<c0195fac>] (__handle_domain_irq) from [<c052eb50>]
(gic_handle_irq+0x4c/0xa8)
[   27.491125] [<c052eb50>] (gic_handle_irq) from [<c0101a70>]
(__irq_svc+0x70/0x98)
[   27.498624] Exception stack(0xc1301e30 to 0xc1301e78)
[   27.503696] 1e20:                                     00000001
00000002 00000000 c130c600
[   27.511893] 1e40: ffffe000 00000000 c1308ce0 00000000 00000001
dc018400 00000282 c13f18e4
[   27.520089] 1e60: 00000000 c1301e80 c0189b08 c01022dc 60000113 ffffffff
[   27.526726] [<c0101a70>] (__irq_svc) from [<c01022dc>]
(__do_softirq+0xbc/0x528)
[   27.534144] [<c01022dc>] (__do_softirq) from [<c012f0ac>]
(irq_exit+0x12c/0x180)
[   27.541561] [<c012f0ac>] (irq_exit) from [<c0195fb4>]
(__handle_domain_irq+0x6c/0xe0)
[   27.549413] [<c0195fb4>] (__handle_domain_irq) from [<c052eb50>]
(gic_handle_irq+0x4c/0xa8)
[   27.557785] [<c052eb50>] (gic_handle_irq) from [<c0101a70>]
(__irq_svc+0x70/0x98)
[   27.565282] Exception stack(0xc1301f10 to 0xc1301f58)
[   27.570351] 1f00:                                     00000001
00000006 00000000 c130c600
[   27.578548] 1f20: ffffe000 c1308928 00000001 c1308964 00000000
00000000 c1308908 c1308978
[   27.586743] 1f40: 00000000 c1301f60 c0189b58 c0109490 20000013 ffffffff
[   27.593384] [<c0101a70>] (__irq_svc) from [<c0109490>]
(arch_cpu_idle+0x20/0x3c)
[   27.600806] [<c0109490>] (arch_cpu_idle) from [<c0160ae0>]
(do_idle+0x1b8/0x2c0)
[   27.608224] [<c0160ae0>] (do_idle) from [<c0160f7c>]
(cpu_startup_entry+0x18/0x1c)
[   27.615818] [<c0160f7c>] (cpu_startup_entry) from [<c1200e24>]
(start_kernel+0x410/0x4c0)
[   27.624017] [<c1200e24>] (start_kernel) from [<00000000>] (0x0)
