Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FDC12CBBA
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 18:21:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726876AbfE1QVb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 12:21:31 -0400
Received: from mail-yw1-f65.google.com ([209.85.161.65]:36342 "EHLO
        mail-yw1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726668AbfE1QVb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 12:21:31 -0400
Received: by mail-yw1-f65.google.com with SMTP id e68so8141939ywf.3;
        Tue, 28 May 2019 09:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=MmnmmjS/U+RWNF/Hr0scTDk3DkBZp7sbjnxe0L1QEMc=;
        b=HPt+dHPa6YLeN2MtWlGQswIU9hU+wq6YJUPSz+0HdJjKWvwfQo2fnw3vWalKRWcTOT
         qv34UYdJ8ct4omWgkCqitrRXk0S+72OkEETLXNFrjgoHgFlvvDvRnHyMEalsozm3Aiz4
         9a/5zK1ytIHqGxzaiTcIEq4i8jPF/MT5OsVihETfAvR9e+Xo5439oH3GSXFm9bawOixI
         9tPDFuzBibiFQUs2i4r/VA3y5OuP3vbykzwDVZFTYW6IwdkWl0hQlj1J0W2x0A+kYv4M
         HNY/W9OnOb022xtuEdGjXTHiszVA/BN4SNNVRVuv0RjYnd2L/cFw2rzk1JDrYeM9ujBL
         JFkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=MmnmmjS/U+RWNF/Hr0scTDk3DkBZp7sbjnxe0L1QEMc=;
        b=U+PW+BVyLvlJ2eXeujRt1jJwXcDrqzVen62jZM/p6e9T+pb6fyQAJijuyWoCYuhVNp
         DJsQybbs9ITRPR8+j2yUPHScfFql7HxpA5ctiBvjbt2y4i2Gh56LJGZIGXFIjHoBWgEN
         HhunG41J9D4jBig2fzute9cky1+HCWWesc17Q/ZqDHiHWAUUrmesJkseLCJl2QoTpkSt
         AaSPnhxUR/WD2rJO92QPJqkQeJr+iJsf9BQA0GBRHg5MmiOcS4s2/R0BjVNixnJE5mWf
         vgXdHJ8BQbyhYmNN36YKh/+us/qGDcv1QEXxTMxIcfDfqYi+YbyOFq747nL13g1M3I7/
         b9LA==
X-Gm-Message-State: APjAAAVS59bQDtKjnqzviiaFn/N9YqHacHnbCGQCb7jZHLRf46ay8wHn
        0GYU+Md10pDbgOUo5cseBxd9hVUb+1qfOUx8GUg=
X-Google-Smtp-Source: APXvYqx8Iswg2TaiWeC96V9UXaWt0tjBUtBZSyfsRsuSyAxo9dXuCv1EUDxCL5uyMDqPFcyK/qdDa1jzX5U5AQm/8KE=
X-Received: by 2002:a81:997:: with SMTP id 145mr13076277ywj.457.1559060490188;
 Tue, 28 May 2019 09:21:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190526222536.10917-1-peron.clem@gmail.com> <20190527134805.j7t4ffstrnhdml47@core.my.home>
 <CAJiuCcdnQa0TArduT4yBbUyd+dOaM0cQ1JcRUQLXLR6s_5e8sA@mail.gmail.com>
 <20190527163117.hpealt6cttqzqdxz@core.my.home> <20190527172337.5qxh5qeqnul55gsb@core.my.home>
 <CAJiuCccnRCqez2uG-pU8XY4Z=5S8rDwFB3rgsBovPHY1Uxyazw@mail.gmail.com>
 <20190527193016.yxngu5grsqnctx3z@core.my.home> <20190527195330.pugb7ypvnyv32fug@core.my.home>
In-Reply-To: <20190527195330.pugb7ypvnyv32fug@core.my.home>
From:   =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date:   Tue, 28 May 2019 18:21:19 +0200
Message-ID: <CAJiuCccpnEqw_tGXST+WtGmZLbE+=wN1Hn9HKrk1+4WsW-abiA@mail.gmail.com>
Subject: Re: [linux-sunxi] Re: [PATCH v2 00/10] Allwinner A64/H6 IR support
To:     megous@megous.com,
        =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ond=C5=99ej,

On Mon, 27 May 2019 at 21:53, 'Ond=C5=99ej Jirman' via linux-sunxi
<linux-sunxi@googlegroups.com> wrote:
>
> Hi Cl=C3=A9ment,
>
> On Mon, May 27, 2019 at 09:30:16PM +0200, verejna wrote:
> > Hi Cl=C3=A9ment,
> >
> > On Mon, May 27, 2019 at 08:49:59PM +0200, Cl=C3=A9ment P=C3=A9ron wrote=
:
> > > Hi Ondrej,
> > >
> > > >
> > > > I'm testing on Orange Pi 3.
> > > >
> > > > With your patches, I get kernel lockup after ~1 minute of use (ssh =
stops
> > > > responding/serial console stops responding). I don't have RC contro=
ller to test
> > > > the CIR. But just enabling the CIR causes kernel to hang shortly af=
ter boot.
> > > >
> > > > I tried booting multiple times. Other results:
> > > >
> > > > boot 2:
> > > >
> > > > - ssh hangs even before connecting (ethernet crashes/is reset)
> > > >
> > > > INFO: rcu_sched detected stalls on CPUs/tasks:
> > > > rcu:    0-....: (1 GPs behind) idle=3D64a/0/0x3 softirq=3D4091/4091=
 fqs=3D2437
> > > > dwmac-sun8i 5020000.ethernet eth0: Reset adapter.
> > > > rcu: INFO: rcu_sched detected expedited stalls on CPUs/tasks: { 0-.=
.. } 5696 jiffies s: 81 root: 0x1/.
> > > > rcu: blocking rcu_node structures:
> > > >  rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> > > > rcu:    0-....: (1 GPs behind) idle=3D64a/0/0x3 softirq=3D4091/4091=
 fqs=3D9714
> > > > rcu: INFO: rcu_sched detected expedited stalls on CPUs/tasks: { 0-.=
.. } 21568 jiffies s: 81 root: 0x1/.
> > > > rcu: blocking rcu_node structures:
> > > > rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> > > > rcu:    0-....: (1 GPs behind) idle=3D64a/0/0x3 softirq=3D4091/4091=
 fqs=3D17203
> > > >
> > > > above messages appear regularly.
> > > >
> > > > boot 3:
> > > >
> > > > rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> > > > rcu:    0-....: (9 GPs behind) idle=3D992/0/0x3 softirq=3D6123/6123=
 fqs=3D2600
> > > >
> > > >
> > > > Sometimes serial console keeps working. Sometimes it locks up too (=
but not
> > > > frequently). Storage locks up always (any program that was not run =
before
> > > > the crash can't be started and lock up the kernel hard, programs th=
at
> > > > were executed prior, can be run again).
> > > >
> > > >
> > > > Exactly the same kernel build on H5 seems to work (or at least I wa=
s not able to
> > > > trigger the crash). So this seems to be limited to H6 for now.
> > > >
> > > > I suspect that the crash occurs sooner if I vary the light (turn on=
/off the table
> > > > lamp light).
> > > >
> > > > Without your patches, everything works fine on H6, and I never see
> > > > crashes/lockups.
> > > >
> > > > I tired physically covering the IR receiver, and that helps prevent=
ing the
> > > > crash. As soon as I uncover it, the crash happens again in 1s or so=
:
> > > >
> > > > rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> > > > rcu:    0-....: (1 GPs behind) idle=3D4ea/0/0x3 softirq=3D4483/4484=
 fqs=3D2444
> > > > rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> > > > rcu:    0-....: (1 GPs behind) idle=3D4ea/0/0x3 softirq=3D4483/4484=
 fqs=3D9777
> > > >
> > > > This time I got the hung task and reboot: (probably not directly re=
lated)
> > > >
> > > > INFO: task find:560 blocked for more than 120 seconds.
> > > >       Not tainted 5.2.0-rc2+ #7
> > > > "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this me=
ssage.
> > > > find            D    0   560    551 0x00000000
> > > > Call trace:
> > > >  __switch_to+0x6c/0x90
> > > >  __schedule+0x1f4/0x578
> > > >  schedule+0x28/0xa8
> > > >  io_schedule+0x18/0x38
> > > >  __lock_page+0x12c/0x208
> > > >  pagecache_get_page+0x238/0x2e8
> > > >  __get_node_page+0x6c/0x310
> > > >  f2fs_get_node_page+0x14/0x20
> > > >  f2fs_iget+0x70/0xc60
> > > >  f2fs_lookup+0xcc/0x218
> > > >  __lookup_slow+0x78/0x160
> > > >  lookup_slow+0x3c/0x60
> > > >  walk_component+0x1e4/0x2e0
> > > >  path_lookupat.isra.13+0x5c/0x1e0
> > > >  filename_lookup.part.23+0x6c/0xe8
> > > >  user_path_at_empty+0x4c/0x60
> > > >  vfs_statx+0x78/0xd8
> > > >  __se_sys_newfstatat+0x24/0x48
> > > >  __arm64_sys_newfstatat+0x18/0x20
> > > >  el0_svc_handler+0x9c/0x170
> > > >  el0_svc+0x8/0xc
> > > > Kernel panic - not syncing: hung_task: blocked tasks
> > > > CPU: 1 PID: 34 Comm: khungtaskd Not tainted 5.2.0-rc2+ #7
> > > > Hardware name: OrangePi 3 (DT)
> > > > Call trace:
> > > >  dump_backtrace+0x0/0xf8
> > > >  show_stack+0x14/0x20
> > > >  dump_stack+0xa8/0xcc
> > > >  panic+0x124/0x2dc
> > > >  proc_dohung_task_timeout_secs+0x0/0x40
> > > >  kthread+0x120/0x128
> > > >  ret_from_fork+0x10/0x18
> > > > SMP: stopping secondary CPUs
> > > > Kernel Offset: disabled
> > > > CPU features: 0x0002,20002000
> > > > Memory Limit: none
> > > > Rebooting in 3 seconds..
> > > >
> > > >
> > > > Meanwhile H5 based board now runs for 15 minutes without issues.
> > > >
> > > > So to sum up:
> > > >
> > > > - these crashes are definitely H6 IR related
> > > >   - the same kernel, on H5 works
> > > >   - covering the sensor prevents the crashes on H6
> > > >
> > > > So we should probably hold on with the series, until this is figure=
d out.
> > >
> > > Thanks for testing, but I think it's more hardware related.
> > > It seems that your IR is flooded or misconfigured for your board.
> > > Could you add a simple print in the "sunxi_ir_irq"
> >
> > Yes, I get flood of IRQs with status =3D 0x30. (after I turn on the lam=
p,
> > but it persists even after I turn it off and cover the IR sensor).
>
> Interestingly, status also contains RAC, and it's 0 in this case. So the
> interrupt if firing with "No available data in RX FIFO" repeatedly. Regar=
dless
> of input.
>
> So there's something else up.

Really weird indeed...

I have pushed a new version, where I didn't enabled the support for
others H6 board and the cover letter include a link to this thread.

It would be great if other sunxi users could test this series, to
check if this issue in present in other OPi3 / Pine H64.

Regards,
Cl=C3=A9ment
>
> regards,
>         o.
>
> > That's weird, because on H6 in CIR_RXSTA, bit 5 is undefined but corres=
ponding
> > bit in CIR_RXINT is DRQ_EN (RX FIFO DMA Enable)
> >
> > So I'm not sure what it could be flooded with and why IRQs keep being
> > fired, even with no sensor input after the FIFO is read.
> >
> > regards,
> >       o.
> >
> > > If it's confirmed, maybe tweak the threshold configuration or
> > > implement the new active_threshold will help.
> > >
> > > With my hardware Beelink GS1 and on Jernej's board (A64) there is no =
issue.
> > >
> > > I will disable all the other H6 boards until someone test it.
> > >
> > > Regards,
> > > Cl=C3=A9ment
> >
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
> --
> You received this message because you are subscribed to the Google Groups=
 "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to linux-sunxi+unsubscribe@googlegroups.com.
> To view this discussion on the web, visit https://groups.google.com/d/msg=
id/linux-sunxi/20190527195330.pugb7ypvnyv32fug%40core.my.home.
> For more options, visit https://groups.google.com/d/optout.
