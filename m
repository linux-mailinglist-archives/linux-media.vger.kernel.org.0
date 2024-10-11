Return-Path: <linux-media+bounces-19385-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5264F999BEA
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 06:57:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 67B6BB223C8
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 04:57:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD5E71F706D;
	Fri, 11 Oct 2024 04:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RZbNbNPP"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D4E1C7B6A;
	Fri, 11 Oct 2024 04:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728622660; cv=none; b=VJ4c3oTWdvFM2m9DA0vrXJWiLLnQ24IXJWE0hd/sL/uCAzTlWfnNV1h3P518cudlY5i0K7ZbABPKmJzK2zmqF1vv30lJmrzzchBzlzKOAYJ/aY65lE2/CFo/NXyBZ0OO7RkG0HdprXUmg9op9XOJ/M9iBpqC9xWxtaAvFyAUnt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728622660; c=relaxed/simple;
	bh=wU9z6zG8MJ4bNscO9Zr9B6be3qjNhU53wWPhZe3xAx4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lkeqno5xB7b0ZGXY4I195A238hY4J6bAztF9AoIyv4In5PNQtOTAjqQtLsqtOOJsXWFiuHcq6QFEmuH79w5bIPUG/nM/54spSPtvYZ1gihlgeHr8cLMYf38PE0JGuyYtGK+OlhEKE226qqXCN52v4SklYNckvy6YvlvsQBiHmQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RZbNbNPP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24516C4CEC3;
	Fri, 11 Oct 2024 04:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728622659;
	bh=wU9z6zG8MJ4bNscO9Zr9B6be3qjNhU53wWPhZe3xAx4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RZbNbNPP4uADn1ohcBi+TmIpNXpiJv7zG9kBt7v7pkhULOieADggi9tvmfKbNFcIz
	 tOtC7EjsQYSj9COzwPKOQbzcjFHV8F7p4y/EZHIBZOlEQ5hoKfRLT8zrMKNMsGNwD2
	 NupT66dE/Vg4g8AN0VI8N5rdL38kupNcJF64sNLJwFI+xD1i579xqJrcnuXjq4E/z9
	 WMx5kmCdt7aVdMRPuavctfXoaMXJhE/lxGl4dWzShRAvXpX7I+VfoJHEC+BdnEJg6b
	 QujdslgczNf+cxjfW/zQ+87KJLcN3gTfnMGYbXQHFhrSmf3wAOsB5m7xnJe6/JSrnj
	 rp1yaN8/NVKhw==
Date: Fri, 11 Oct 2024 06:57:34 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Chenyuan Yang <chenyuan0y@gmail.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, syzkaller@googlegroups.com, Zijie Zhao
 <zzjas98@gmail.com>
Subject: Re: [Linux Kernel Bug] memory leak in dvb_dmxdev_add_pid
Message-ID: <20241011065734.471f3774@foz.lan>
In-Reply-To: <CALGdzur5uoqM-8H_MfPJNdPNL1nMhRbttN95kNWi2q-p3-n9hg@mail.gmail.com>
References: <CALGdzuqAiWA4zEqUEiTMLRjrhCyh+EL311Gen16YnyNSk75Yaw@mail.gmail.com>
	<CALGdzur5uoqM-8H_MfPJNdPNL1nMhRbttN95kNWi2q-p3-n9hg@mail.gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Thu, 10 Oct 2024 20:06:29 -0500
Chenyuan Yang <chenyuan0y@gmail.com> escreveu:

> Dear Linux Developers for DVB,
>=20
> I am writing to inquire if there have been any updates regarding the
> memory leak issue. The issue remains reproducible on the latest stable
> Linux version (6.12-rc2, commit
> 8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b).

The DVB demux has internally a state machine to filter MPEG-TS streams. It
needs to allocate data and buffers when setting such filters. So, the ioctls
described at https://www.kernel.org/doc/html/v4.10/media/uapi/dvb/dmx_fcall=
s.html
work together.

Having a report that calling DMX functions on a fuzz testing result on
memory keeping allocated sounds a normal behavior to me, as such filters
are meant to be persistent.=20

I need to double-check, but I'm almost sure this is persistent even after
device close(). So, de-allocation should happen when the device driver is
removed or when a new set of filters is set. In the last case, the old=20
buffers will be freed and a new set of buffers will be allocated.

>=20
> Thank you for your attention to this matter.
>=20
> Best,
> Chenyuan
>=20
> On Sat, Mar 2, 2024 at 3:12=E2=80=AFPM Chenyuan Yang <chenyuan0y@gmail.co=
m> wrote:
> >
> > Dear Linux Developers for DVB,
> >
> > We encountered "memory leak in dvb_dmxdev_add_pid" when testing the
> > DVB driver with Syzkaller and our generated specifications.
> >
> > The C reproducer and the config for the kernel are attached.
> >
> > The memory leak originates from the allocated dmxdev_feed structure,
> > as referenced in the code at
> > [https://elixir.bootlin.com/linux/latest/source/drivers/media/dvb-core/=
dmxdev.c#L881].
> > This structure fails to be freed upon entering the code branch found
> > at [https://elixir.bootlin.com/linux/latest/source/drivers/media/dvb-co=
re/dmxdev.c#L891].
> >
> > ```
> > ioctl$KGPT_DMX_START(r0, 0x6f29, 0x0)
> > BUG: memory leak
> > unreferenced object 0xffff88802e9ae7e0 (size 32):
> >   comm "syz-executor.0", pid 27777, jiffies 4295115050 (age 15.550s)
> >   hex dump (first 32 bytes):
> >     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> >     08 c0 6a 05 00 c9 ff ff 08 c0 6a 05 00 c9 ff ff  ..j.......j.....
> >   backtrace:
> >     [<ffffffff8169126f>] kmemleak_alloc_recursive
> > scratch/zijie-data/LLM-Kernel/spec-eval/shared_linux_builds/syzbot-leak=
-more_631373bc9e824969/./include/linux/kmemleak.h:42
> > [inline]
> >     [<ffffffff8169126f>] slab_post_alloc_hook
> > scratch/zijie-data/LLM-Kernel/spec-eval/shared_linux_builds/syzbot-leak=
-more_631373bc9e824969/mm/slab.h:766
> > [inline]
> >     [<ffffffff8169126f>] slab_alloc_node
> > scratch/zijie-data/LLM-Kernel/spec-eval/shared_linux_builds/syzbot-leak=
-more_631373bc9e824969/mm/slub.c:3478
> > [inline]
> >     [<ffffffff8169126f>] __kmem_cache_alloc_node+0x2ff/0x3e0
> > scratch/zijie-data/LLM-Kernel/spec-eval/shared_linux_builds/syzbot-leak=
-more_631373bc9e824969/mm/slub.c:3517
> >     [<ffffffff815d9da9>] kmalloc_trace+0x29/0x90
> > scratch/zijie-data/LLM-Kernel/spec-eval/shared_linux_builds/syzbot-leak=
-more_631373bc9e824969/mm/slab_common.c:1098
> >     [<ffffffff83db2e09>] kmalloc
> > scratch/zijie-data/LLM-Kernel/spec-eval/shared_linux_builds/syzbot-leak=
-more_631373bc9e824969/./include/linux/slab.h:600
> > [inline]
> >     [<ffffffff83db2e09>] kzalloc
> > scratch/zijie-data/LLM-Kernel/spec-eval/shared_linux_builds/syzbot-leak=
-more_631373bc9e824969/./include/linux/slab.h:721
> > [inline]
> >     [<ffffffff83db2e09>] dvb_dmxdev_add_pid+0xa9/0x160
> > scratch/zijie-data/LLM-Kernel/spec-eval/shared_linux_builds/syzbot-leak=
-more_631373bc9e824969/drivers/media/dvb-core/dmxdev.c:881
> >     [<ffffffff83db48de>] dvb_dmxdev_pes_filter_set
> > scratch/zijie-data/LLM-Kernel/spec-eval/shared_linux_builds/syzbot-leak=
-more_631373bc9e824969/drivers/media/dvb-core/dmxdev.c:956
> > [inline]
> >     [<ffffffff83db48de>] dvb_demux_do_ioctl+0x67e/0xa80
> > scratch/zijie-data/LLM-Kernel/spec-eval/shared_linux_builds/syzbot-leak=
-more_631373bc9e824969/drivers/media/dvb-core/dmxdev.c:1076
> >     [<ffffffff83db1252>] dvb_usercopy+0x82/0x220
> > scratch/zijie-data/LLM-Kernel/spec-eval/shared_linux_builds/syzbot-leak=
-more_631373bc9e824969/drivers/media/dvb-core/dvbdev.c:986
> >     [<ffffffff83db1b51>] dvb_demux_ioctl+0x31/0x40
> > scratch/zijie-data/LLM-Kernel/spec-eval/shared_linux_builds/syzbot-leak=
-more_631373bc9e824969/drivers/media/dvb-core/dmxdev.c:1185
> >     [<ffffffff8171ca88>] vfs_ioctl
> > scratch/zijie-data/LLM-Kernel/spec-eval/shared_linux_builds/syzbot-leak=
-more_631373bc9e824969/fs/ioctl.c:51
> > [inline]
> >     [<ffffffff8171ca88>] __do_sys_ioctl
> > scratch/zijie-data/LLM-Kernel/spec-eval/shared_linux_builds/syzbot-leak=
-more_631373bc9e824969/fs/ioctl.c:871
> > [inline]
> >     [<ffffffff8171ca88>] __se_sys_ioctl
> > scratch/zijie-data/LLM-Kernel/spec-eval/shared_linux_builds/syzbot-leak=
-more_631373bc9e824969/fs/ioctl.c:857
> > [inline]
> >     [<ffffffff8171ca88>] __x64_sys_ioctl+0x108/0x150
> > scratch/zijie-data/LLM-Kernel/spec-eval/shared_linux_builds/syzbot-leak=
-more_631373bc9e824969/fs/ioctl.c:857
> >     [<ffffffff8540b150>] do_syscall_x64
> > scratch/zijie-data/LLM-Kernel/spec-eval/shared_linux_builds/syzbot-leak=
-more_631373bc9e824969/arch/x86/entry/common.c:51
> > [inline]
> >     [<ffffffff8540b150>] do_syscall_64+0x40/0x110
> > scratch/zijie-data/LLM-Kernel/spec-eval/shared_linux_builds/syzbot-leak=
-more_631373bc9e824969/arch/x86/entry/common.c:82
> >     [<ffffffff8560008b>] entry_SYSCALL_64_after_hwframe+0x63/0x6b
> > ```
> >
> > If you have any questions or require more information, please feel
> > free to contact us.
> >
> > Reported-by: Chenyuan Yang <chenyuan0y@gmail.com>
> >
> > Best,
> > Chenyuan =20



Thanks,
Mauro

