Return-Path: <linux-media+bounces-19384-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DF3999BA3
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 06:28:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73AF71F24056
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 04:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61B6E1F472C;
	Fri, 11 Oct 2024 04:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uyeInPa3"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42721A0704
	for <linux-media@vger.kernel.org>; Fri, 11 Oct 2024 04:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728620914; cv=none; b=bHDv01o9I5GeRg1RASjS+VsoZelvq6mbz4Verd0/qhY2GHvA4MFbmd5Y8ooO/JxHPmHDN7zjNEZHnwkWsnbg/LPEQnJipcIhr9YmY1MLN0etOqWMMl7pOxAzNRPvu64qFZdOJy3NJpC4xAplDpWM0KjhAI03yWko7HHnFwFh+Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728620914; c=relaxed/simple;
	bh=CEMTTPbNJIwtk3QdU2Ih2e2FkEg+rJ5KIq+7w0rO7LM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o2AFl9KdlCae84pcCMgh2+AJWnTB3RSP9oBKyQ+VEGz5awDl/H0xc/D44gRob4Arkhbqk12tjgfYYm8t7Gc3jRiTw3JbDugbWQAj8fGL4o5w1do1OrBgqUh8oPOKyEjUeB/AvfU63c4dNnt7TjrI55HU7+jU8EO+NapBChzWlWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uyeInPa3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DD74C4CEC3;
	Fri, 11 Oct 2024 04:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728620914;
	bh=CEMTTPbNJIwtk3QdU2Ih2e2FkEg+rJ5KIq+7w0rO7LM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=uyeInPa30123EY6KqplStYUxU7y6a2T6/duyq/IFRJDQ2s4ydgatnGmftDQP3lDqu
	 LhDMdKDbSNwaxy//OdZmXeAkZVPLDJQ1Pu9Bp/IcHbr/eArCoNVMtT3L5HZb+D5Dvc
	 9vHHuEr/+CMACWfo0xWI6W11dOedm03JJRdq12ELwBvYB3NwlPvdp+aQR2Wm3fAcSj
	 i+BjMYsyIoLXewBZKxkY5CP1QxMHJcF6J969BhARYyFK9pbVsnk4Ee1gxeJpKkftOm
	 n+O9t43toAjOubS84Ea/Gaw85IT/lBz0/HvuYxqd3rWNXy6aTgbLTuNuXLUgemU10i
	 tqsFYIZutjtNQ==
Date: Fri, 11 Oct 2024 06:28:29 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Chenyuan Yang <chenyuan0y@gmail.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
 syzkaller@googlegroups.com, Zijie Zhao <zzjas98@gmail.com>
Subject: Re: [drivers/media/dvb-core] WARNING in vb2_core_reqbufs
Message-ID: <20241011062814.50094a03@foz.lan>
In-Reply-To: <CALGdzuopL9-zNbhsaz71Ndi8WY0HLH+vTHnyJULHRu9mqeXG=Q@mail.gmail.com>
References: <CALGdzuopL9-zNbhsaz71Ndi8WY0HLH+vTHnyJULHRu9mqeXG=Q@mail.gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 10 Oct 2024 11:08:25 -0500
Chenyuan Yang <chenyuan0y@gmail.com> escreveu:

> Dear Linux Developers for DVB,
> 
> We encountered "WARNING in vb2_core_reqbufs" when testing the
> DVB driver with Syzkaller and our generated specifications.
> 
> It seems that when invoking `ioctl$DMX_REQBUFS`, it will fail the
> following WARN_ON in
> https://elixir.bootlin.com/linux/v6.12-rc2/source/drivers/media/common/videobuf2/videobuf2-core.c#L956
> 
> ```
> for (i = 0; i < num_planes; i++)
> if (WARN_ON(!plane_sizes[i])) {
> ret = -EINVAL;
> goto error;
> }
> ```

This is by purpose. This is part of mmap user interface. There is an
specific sequence for such ioctls to be called, together with the need
of memory-mapped buffers.

> 
> Linux version: Linux 6.12-rc2 (8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b)
> Configuration is attached (with `CONFIG_DVB_MMAP=y`)
> Syz and C reproducers are as below:
> 
> ```
> Syzkaller hit 'WARNING in vb2_core_reqbufs' bug.
> 
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 10407 at
> drivers/media/common/videobuf2/videobuf2-core.c:957
> vb2_core_reqbufs+0x128d/0x17a0
> drivers/media/common/videobuf2/videobuf2-core.c:957
> Modules linked in:
> CPU: 0 UID: 0 PID: 10407 Comm: syz-executor171 Not tainted
> 6.12.0-rc2-g8cf0b93919e1 #2
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.15.0-1 04/01/2014
> RIP: 0010:vb2_core_reqbufs+0x128d/0x17a0
> drivers/media/common/videobuf2/videobuf2-core.c:957
> Code: 49 8d b6 28 02 00 00 48 c7 c7 a0 5a 04 8e 48 c7 c2 9d 12 4d 8f
> e8 03 81 d7 03 4c 8b 7c 24 28 e9 02 f5 ff ff e8 b4 87 db f8 90 <0f> 0b
> 90 41 bd ea ff ff ff 49 bc 00 00 00 00 00 fc ff df 4c 8b 7c
> RSP: 0018:ffffc9000e7f7b40 EFLAGS: 00010293
> RAX: ffffffff88bedbbc RBX: 0000000000000000 RCX: ffff8880463d0000
> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> RBP: ffffc9000e7f7ce8 R08: ffffffff88bed5e0 R09: 1ffff92001cfef58
> R10: dffffc0000000000 R11: ffffffff88b4fd00 R12: 0000000000000000
> R13: ffffc9000e7f7c20 R14: ffffc9000652c260 R15: ffffc9000e7f7c40
> FS:  0000555565e823c0(0000) GS:ffff88802c200000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000020000098 CR3: 0000000020696000 CR4: 0000000000752ef0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe07f0 DR7: 0000000000000400
> PKRU: 55555554
> Call Trace:
>  <TASK>
>  dvb_vb2_reqbufs+0xfe/0x3c0 drivers/media/dvb-core/dvb_vb2.c:338
>  dvb_demux_do_ioctl+0x5f9/0x760 drivers/media/dvb-core/dmxdev.c:1132
>  dvb_usercopy+0x170/0x270 drivers/media/dvb-core/dvbdev.c:993
>  dvb_demux_ioctl+0x2e/0x40 drivers/media/dvb-core/dmxdev.c:1185
>  vfs_ioctl fs/ioctl.c:51 [inline]
>  __do_sys_ioctl fs/ioctl.c:907 [inline]
>  __se_sys_ioctl+0xfa/0x170 fs/ioctl.c:893
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xf9/0x280 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x67/0x6f
> RIP: 0033:0x7f54a9a8ba8d
> Code: 28 c3 e8 46 1e 00 00 66 0f 1f 44 00 00 f3 0f 1e fa 48 89 f8 48
> 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d
> 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007ffd57732608 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 00007ffd57732808 RCX: 00007f54a9a8ba8d
> RDX: 0000000020000280 RSI: 00000000c0086f3c RDI: 0000000000000003
> RBP: 0000000000000001 R08: 0000000000000000 R09: 00007ffd57732808
> R10: 000000000000000f R11: 0000000000000246 R12: 0000000000000001
> R13: 00007ffd577327f8 R14: 00007f54a9b09530 R15: 0000000000000001
>  </TASK>
> 
> 
> Syzkaller reproducer:
> # {Threaded:false Repeat:false RepeatTimes:0 Procs:1 Slowdown:1
> Sandbox: SandboxArg:0 Leak:false NetInjection:false NetDevices:false
> NetReset:false Cgroups:false BinfmtMisc:false CloseFDs:false
> KCSAN:false DevlinkPCI:false NicVF:false USB:false VhciInjection:false
> Wifi:false IEEE802154:false Sysctl:false Swap:false UseTmpDir:false
> HandleSegv:false Repro:false Trace:false LegacyOptions:{Collide:false
> Fault:false FaultCall:0 FaultNth:0}}
> r0 = syz_open_dev$KGPT_dvb_demux_syzkalm(&(0x7f0000000080), 0x0, 0x60200)
> ioctl$KGPT_DMX_REQBUFS_0_dup(r0, 0xc0086f3c, &(0x7f0000000280)={0x1ff})
> 
> 
> C reproducer:
> // autogenerated by syzkaller (https://github.com/google/syzkaller)
> 
> #define _GNU_SOURCE
> 
> #include <endian.h>
> #include <fcntl.h>
> #include <stdint.h>
> #include <stdio.h>
> #include <stdlib.h>
> #include <string.h>
> #include <sys/stat.h>
> #include <sys/syscall.h>
> #include <sys/types.h>
> #include <unistd.h>
> 
> static long syz_open_dev(volatile long a0, volatile long a1, volatile long a2)
> {
>   if (a0 == 0xc || a0 == 0xb) {
>     char buf[128];
>     sprintf(buf, "/dev/%s/%d:%d", a0 == 0xc ? "char" : "block", (uint8_t)a1,
>             (uint8_t)a2);
>     return open(buf, O_RDWR, 0);
>   } else {
>     char buf[1024];
>     char* hash;
>     strncpy(buf, (char*)a0, sizeof(buf) - 1);
>     buf[sizeof(buf) - 1] = 0;
>     while ((hash = strchr(buf, '#'))) {
>       *hash = '0' + (char)(a1 % 10);
>       a1 /= 10;
>     }
>     return open(buf, a2, 0);
>   }
> }
> 
> uint64_t r[1] = {0xffffffffffffffff};
> 
> int main(void)
> {
>   syscall(__NR_mmap, /*addr=*/0x1ffff000ul, /*len=*/0x1000ul, /*prot=*/0ul,
>           /*flags=*/0x32ul, /*fd=*/-1, /*offset=*/0ul);
>   syscall(__NR_mmap, /*addr=*/0x20000000ul, /*len=*/0x1000000ul, /*prot=*/7ul,
>           /*flags=*/0x32ul, /*fd=*/-1, /*offset=*/0ul);
>   syscall(__NR_mmap, /*addr=*/0x21000000ul, /*len=*/0x1000ul, /*prot=*/0ul,
>           /*flags=*/0x32ul, /*fd=*/-1, /*offset=*/0ul);
>   intptr_t res = 0;
>   memcpy((void*)0x20000080, "/dev/dvb/adapter#/demux#\000", 25);
>   res = -1;
>   res = syz_open_dev(/*dev=*/0x20000080, /*id=*/0, /*flags=*/0x60200);
>   if (res != -1)
>     r[0] = res;
>   *(uint32_t*)0x20000280 = 0x1ff;
>   *(uint32_t*)0x20000284 = 0;
>   syscall(__NR_ioctl, /*fd=*/r[0], /*cmd=*/0xc0086f3c, /*arg=*/0x20000280ul);
>   return 0;
> }
> ```
> 
> If you have any questions or require more information, please feel
> free to contact us.
> 
> Reported-by: Chenyuan Yang <chenyuan0y@gmail.com>
> 
> Best,
> Chenyuan



Thanks,
Mauro

