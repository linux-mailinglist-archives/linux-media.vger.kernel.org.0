Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CA9A2D71D
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 09:55:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726568AbfE2Hz4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 03:55:56 -0400
Received: from mail-yb1-f194.google.com ([209.85.219.194]:35458 "EHLO
        mail-yb1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726015AbfE2Hz4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 03:55:56 -0400
Received: by mail-yb1-f194.google.com with SMTP id s69so457703ybi.2;
        Wed, 29 May 2019 00:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Osn05iDZ9YCFVG1ZvG0QdOmP+zixCsnWvYuWdS++NU4=;
        b=iMD9Kwq2WvoN0BcWVK6saJsnqWZYziNtKrS/SyqMm0kUw/ROxdkvC9WZOr+bZWORMc
         uV0m//OEWkL4DLgIlHxt8upkxIiLVegk2oDhicTK/pXirfj/dY9NB+Odeb5jDVO6MuuY
         A2+Lh/z4sOvFaaOuf4TqINSk1EHCy17ANuw1HF6TBX0R4r4GNJcC/q2QJZlygfQkMGRO
         +A8o2ufbM2pnECngH4NJIbAhqUwWJiRCE3n0sF7IPzt5GArm5hVuSzNnwVw7cvY9RV0w
         EF+N/vRHL/2I1nbzpo+aO5le/c8GtrVtsmR6RCEH5Bo5MZZCDplfUu2ksRdfYB1HySLP
         EvCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Osn05iDZ9YCFVG1ZvG0QdOmP+zixCsnWvYuWdS++NU4=;
        b=pr+c3jiwrHfnfaMDr2CXdLNcNYWRXcMm2p+LwyFKg57LWpbyNaDkQnoNB35VH6flrA
         zhUYnN1pokbg5cRcagXBSNfkVS4UXV/VMR6X/kTsZjkLzcTYQeN9aBC+lZxHzZd6OGUn
         r8ecK8mcNxzP2kLBb9J/v8ZKfGv9N7PIsK4fskvE7LKVWv1073MP1s1B8bIwPjbhk/xX
         p7sjf4Nb8Qal13zfkrqardQ5/0dKdG9TCAgzZ2j2ZHne5h9u6sSyfDsS+2Bn2TavbW0G
         cxxfeymcukve1lZKV8Jwske20e7Lwh3BVpAChDyWjsQToPvg9LlW8gakaHVfU0wHHLn0
         zo+A==
X-Gm-Message-State: APjAAAV+XwqzMvrprzfECPui8TKGHxbEG2afSPIXwPnjZAyZnj0rj6m0
        nNRCQOmwdSkWeF2pskHYNT8646zLOHqY57rzMJU=
X-Google-Smtp-Source: APXvYqyGJzi6yznBfh/xZBx33+jcZ1K80IstRlOacxmR/ZeKXYZ51BBwHuo38owcJrO9U70Ny2c0AFM9ulI8unoKmrs=
X-Received: by 2002:a25:340e:: with SMTP id b14mr20130906yba.82.1559116554895;
 Wed, 29 May 2019 00:55:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190526222536.10917-1-peron.clem@gmail.com> <20190527134805.j7t4ffstrnhdml47@core.my.home>
 <CAJiuCcdnQa0TArduT4yBbUyd+dOaM0cQ1JcRUQLXLR6s_5e8sA@mail.gmail.com>
 <20190527163117.hpealt6cttqzqdxz@core.my.home> <20190527172337.5qxh5qeqnul55gsb@core.my.home>
 <CAJiuCccnRCqez2uG-pU8XY4Z=5S8rDwFB3rgsBovPHY1Uxyazw@mail.gmail.com>
 <20190527193016.yxngu5grsqnctx3z@core.my.home> <20190527195330.pugb7ypvnyv32fug@core.my.home>
 <CAJiuCccpnEqw_tGXST+WtGmZLbE+=wN1Hn9HKrk1+4WsW-abiA@mail.gmail.com>
 <20190528180447.zlrdfmn73fntnf4n@core.my.home> <20190529071945.mrbgurcvl2jvpm5r@flea>
In-Reply-To: <20190529071945.mrbgurcvl2jvpm5r@flea>
From:   =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date:   Wed, 29 May 2019 09:55:43 +0200
Message-ID: <CAJiuCcdAnwOO=uexmUMM2qSomxgOHfa432d-KxX-N7Jg+Ekipg@mail.gmail.com>
Subject: Re: [linux-sunxi] Re: [PATCH v2 00/10] Allwinner A64/H6 IR support
To:     Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Chen-Yu Tsai <wens@csie.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Wed, 29 May 2019 at 09:19, Maxime Ripard <maxime.ripard@bootlin.com> wro=
te:
>
> On Tue, May 28, 2019 at 08:04:47PM +0200, Ond=C5=99ej Jirman wrote:
> > Hello Cl=C3=A9ment,
> >
> > On Tue, May 28, 2019 at 06:21:19PM +0200, Cl=C3=A9ment P=C3=A9ron wrote=
:
> > > Hi Ond=C5=99ej,
> > >
> > > On Mon, 27 May 2019 at 21:53, 'Ond=C5=99ej Jirman' via linux-sunxi
> > > <linux-sunxi@googlegroups.com> wrote:
> > > >
> > > > Hi Cl=C3=A9ment,
> > > >
> > > > On Mon, May 27, 2019 at 09:30:16PM +0200, verejna wrote:
> > > > > Hi Cl=C3=A9ment,
> > > > >
> > > > > On Mon, May 27, 2019 at 08:49:59PM +0200, Cl=C3=A9ment P=C3=A9ron=
 wrote:
> > > > > > Hi Ondrej,
> > > > > >
> > > > > > >
> > > > > > > I'm testing on Orange Pi 3.
> > > > > > >
> > > > > > > With your patches, I get kernel lockup after ~1 minute of use=
 (ssh stops
> > > > > > > responding/serial console stops responding). I don't have RC =
controller to test
> > > > > > > the CIR. But just enabling the CIR causes kernel to hang shor=
tly after boot.
> > > > > > >
> > > > > > > I tried booting multiple times. Other results:
> > > > > > >
> > > > > > > boot 2:
> > > > > > >
> > > > > > > - ssh hangs even before connecting (ethernet crashes/is reset=
)
> > > > > > >
> > > > > > > INFO: rcu_sched detected stalls on CPUs/tasks:
> > > > > > > rcu:    0-....: (1 GPs behind) idle=3D64a/0/0x3 softirq=3D409=
1/4091 fqs=3D2437
> > > > > > > dwmac-sun8i 5020000.ethernet eth0: Reset adapter.
> > > > > > > rcu: INFO: rcu_sched detected expedited stalls on CPUs/tasks:=
 { 0-... } 5696 jiffies s: 81 root: 0x1/.
> > > > > > > rcu: blocking rcu_node structures:
> > > > > > >  rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> > > > > > > rcu:    0-....: (1 GPs behind) idle=3D64a/0/0x3 softirq=3D409=
1/4091 fqs=3D9714
> > > > > > > rcu: INFO: rcu_sched detected expedited stalls on CPUs/tasks:=
 { 0-... } 21568 jiffies s: 81 root: 0x1/.
> > > > > > > rcu: blocking rcu_node structures:
> > > > > > > rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> > > > > > > rcu:    0-....: (1 GPs behind) idle=3D64a/0/0x3 softirq=3D409=
1/4091 fqs=3D17203
> > > > > > >
> > > > > > > above messages appear regularly.
> > > > > > >
> > > > > > > boot 3:
> > > > > > >
> > > > > > > rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> > > > > > > rcu:    0-....: (9 GPs behind) idle=3D992/0/0x3 softirq=3D612=
3/6123 fqs=3D2600
> > > > > > >
> > > > > > >
> > > > > > > Sometimes serial console keeps working. Sometimes it locks up=
 too (but not
> > > > > > > frequently). Storage locks up always (any program that was no=
t run before
> > > > > > > the crash can't be started and lock up the kernel hard, progr=
ams that
> > > > > > > were executed prior, can be run again).
> > > > > > >
> > > > > > >
> > > > > > > Exactly the same kernel build on H5 seems to work (or at leas=
t I was not able to
> > > > > > > trigger the crash). So this seems to be limited to H6 for now=
.
> > > > > > >
> > > > > > > I suspect that the crash occurs sooner if I vary the light (t=
urn on/off the table
> > > > > > > lamp light).
> > > > > > >
> > > > > > > Without your patches, everything works fine on H6, and I neve=
r see
> > > > > > > crashes/lockups.
> > > > > > >
> > > > > > > I tired physically covering the IR receiver, and that helps p=
reventing the
> > > > > > > crash. As soon as I uncover it, the crash happens again in 1s=
 or so:
> > > > > > >
> > > > > > > rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> > > > > > > rcu:    0-....: (1 GPs behind) idle=3D4ea/0/0x3 softirq=3D448=
3/4484 fqs=3D2444
> > > > > > > rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> > > > > > > rcu:    0-....: (1 GPs behind) idle=3D4ea/0/0x3 softirq=3D448=
3/4484 fqs=3D9777
> > > > > > >
> > > > > > > This time I got the hung task and reboot: (probably not direc=
tly related)
> > > > > > >
> > > > > > > INFO: task find:560 blocked for more than 120 seconds.
> > > > > > >       Not tainted 5.2.0-rc2+ #7
> > > > > > > "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables t=
his message.
> > > > > > > find            D    0   560    551 0x00000000
> > > > > > > Call trace:
> > > > > > >  __switch_to+0x6c/0x90
> > > > > > >  __schedule+0x1f4/0x578
> > > > > > >  schedule+0x28/0xa8
> > > > > > >  io_schedule+0x18/0x38
> > > > > > >  __lock_page+0x12c/0x208
> > > > > > >  pagecache_get_page+0x238/0x2e8
> > > > > > >  __get_node_page+0x6c/0x310
> > > > > > >  f2fs_get_node_page+0x14/0x20
> > > > > > >  f2fs_iget+0x70/0xc60
> > > > > > >  f2fs_lookup+0xcc/0x218
> > > > > > >  __lookup_slow+0x78/0x160
> > > > > > >  lookup_slow+0x3c/0x60
> > > > > > >  walk_component+0x1e4/0x2e0
> > > > > > >  path_lookupat.isra.13+0x5c/0x1e0
> > > > > > >  filename_lookup.part.23+0x6c/0xe8
> > > > > > >  user_path_at_empty+0x4c/0x60
> > > > > > >  vfs_statx+0x78/0xd8
> > > > > > >  __se_sys_newfstatat+0x24/0x48
> > > > > > >  __arm64_sys_newfstatat+0x18/0x20
> > > > > > >  el0_svc_handler+0x9c/0x170
> > > > > > >  el0_svc+0x8/0xc
> > > > > > > Kernel panic - not syncing: hung_task: blocked tasks
> > > > > > > CPU: 1 PID: 34 Comm: khungtaskd Not tainted 5.2.0-rc2+ #7
> > > > > > > Hardware name: OrangePi 3 (DT)
> > > > > > > Call trace:
> > > > > > >  dump_backtrace+0x0/0xf8
> > > > > > >  show_stack+0x14/0x20
> > > > > > >  dump_stack+0xa8/0xcc
> > > > > > >  panic+0x124/0x2dc
> > > > > > >  proc_dohung_task_timeout_secs+0x0/0x40
> > > > > > >  kthread+0x120/0x128
> > > > > > >  ret_from_fork+0x10/0x18
> > > > > > > SMP: stopping secondary CPUs
> > > > > > > Kernel Offset: disabled
> > > > > > > CPU features: 0x0002,20002000
> > > > > > > Memory Limit: none
> > > > > > > Rebooting in 3 seconds..
> > > > > > >
> > > > > > >
> > > > > > > Meanwhile H5 based board now runs for 15 minutes without issu=
es.
> > > > > > >
> > > > > > > So to sum up:
> > > > > > >
> > > > > > > - these crashes are definitely H6 IR related
> > > > > > >   - the same kernel, on H5 works
> > > > > > >   - covering the sensor prevents the crashes on H6
> > > > > > >
> > > > > > > So we should probably hold on with the series, until this is =
figured out.
> > > > > >
> > > > > > Thanks for testing, but I think it's more hardware related.
> > > > > > It seems that your IR is flooded or misconfigured for your boar=
d.
> > > > > > Could you add a simple print in the "sunxi_ir_irq"
> > > > >
> > > > > Yes, I get flood of IRQs with status =3D 0x30. (after I turn on t=
he lamp,
> > > > > but it persists even after I turn it off and cover the IR sensor)=
.
> > > >
> > > > Interestingly, status also contains RAC, and it's 0 in this case. S=
o the
> > > > interrupt if firing with "No available data in RX FIFO" repeatedly.=
 Regardless
> > > > of input.
> > > >
> > > > So there's something else up.
> > >
> > > Really weird indeed...
> > >
> > > I have pushed a new version, where I didn't enabled the support for
> > > others H6 board and the cover letter include a link to this thread.
> > >
> > > It would be great if other sunxi users could test this series, to
> > > check if this issue in present in other OPi3 / Pine H64.
> >
> > I don't know if this is enough. I'd rather prefer if the driver has a w=
ay
> > of detecting this situation and shutting the module down, at the very l=
east,
> > instead of taking down the entire system with IRQ flood.
> >
> > It may be detectable by checking RAC =3D=3D 0 when RX FIFO available in=
terrupt
> > flag is set.
> >
> > Otherwise, this will eventually be forgotten (cover letters are not eve=
n stored
> > in git), and someone will fall into the trap again, after enabling r_ir=
 on
> > their board, and end up chasing their tail for a day. I've initially on=
ly found
> > this is IR driver issue after a long unpleasant debugging session, chas=
ing other
> > more obvious ideas (as when this happens there's absolutely nothing in =
the log
> > indicating this is IR issue).
>
> Returning IRQ_NONE in the handler will disable the interrupt line
> after 100,000 (I think?) occurences. That might be a good workaround,
> but we definitely want to have a comment there :)
>

Thanks for the suggestion,

I will propose a patch to return IRQ_NONE if Fifo is empty when RA is sette=
d.

Just a comment in the IRQ handling we are actually looking at the
RXSTA register and using the RXINT bit ?
Is there any reason for doing that ?

Thanks,
Cl=C3=A9ment


> Maxime
>
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
