Return-Path: <linux-media+bounces-19405-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C142999EEA
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 10:23:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BEFDBB212D5
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 08:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4B2D20ADE3;
	Fri, 11 Oct 2024 08:22:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88474209F58
	for <linux-media@vger.kernel.org>; Fri, 11 Oct 2024 08:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728634974; cv=none; b=PWw0H1in3JYqJOCIpNiWti2UoDVKvJ4rlQ3F2zuX+9YPViMF9alnIToyfyylSCHzHvEsGxjKeyyaRWo0lkCWTykmkOm65kSemS938nosESk+TttbVzV3CJvZvV2D7jw+avoTKoD4XIQBnZ+Br27SGqkq8Zp3QT6A53gAANqnb7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728634974; c=relaxed/simple;
	bh=xIPmI62mjvIc+yGQ8817ugI3HrzYosNchuoqNYT9gbQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=grZ/d1zo2/i/pzAEX0JzxGXP5pqdqfTuE/65Et+95R/uSj+fMD8syKiRpiaiPk3okChWNTFnuwZhGLSSg/PDRXv1eZRfpIHTHNVp5Ej9qX+UW2qCCEmR6kIXN7+QkTlq50bhHA737QXvl7VfEy/WQHpMISroFa/VrMGkFuCSJPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA741C4CEC3;
	Fri, 11 Oct 2024 08:22:52 +0000 (UTC)
Message-ID: <9099910b-5b9e-4d2d-bb34-41491a361eb8@xs4all.nl>
Date: Fri, 11 Oct 2024 10:22:50 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [drivers/media/dvb-core] WARNING in vb2_core_reqbufs
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Chenyuan Yang <chenyuan0y@gmail.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
 syzkaller@googlegroups.com, Zijie Zhao <zzjas98@gmail.com>
References: <CALGdzuopL9-zNbhsaz71Ndi8WY0HLH+vTHnyJULHRu9mqeXG=Q@mail.gmail.com>
 <20241011062814.50094a03@foz.lan>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20241011062814.50094a03@foz.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/10/2024 06:28, Mauro Carvalho Chehab wrote:
> Em Thu, 10 Oct 2024 11:08:25 -0500
> Chenyuan Yang <chenyuan0y@gmail.com> escreveu:
> 
>> Dear Linux Developers for DVB,
>>
>> We encountered "WARNING in vb2_core_reqbufs" when testing the
>> DVB driver with Syzkaller and our generated specifications.
>>
>> It seems that when invoking `ioctl$DMX_REQBUFS`, it will fail the
>> following WARN_ON in
>> https://elixir.bootlin.com/linux/v6.12-rc2/source/drivers/media/common/videobuf2/videobuf2-core.c#L956
>>
>> ```
>> for (i = 0; i < num_planes; i++)
>> if (WARN_ON(!plane_sizes[i])) {
>> ret = -EINVAL;
>> goto error;
>> }
>> ```
> 
> This is by purpose. This is part of mmap user interface. There is an
> specific sequence for such ioctls to be called, together with the need
> of memory-mapped buffers.

Yes, but this suggest a driver bug, it should never call vb2_core_reqbufs with
such values. This is probably using vidtv.

At line 950 there is the comment: /* Check that driver has set sane values */

So it looks like a vidtv bug, or possibly a bug elsewhere in the DVB core.

Regards,

	Hans

> 
>>
>> Linux version: Linux 6.12-rc2 (8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b)
>> Configuration is attached (with `CONFIG_DVB_MMAP=y`)
>> Syz and C reproducers are as below:
>>
>> ```
>> Syzkaller hit 'WARNING in vb2_core_reqbufs' bug.
>>
>> ------------[ cut here ]------------
>> WARNING: CPU: 0 PID: 10407 at
>> drivers/media/common/videobuf2/videobuf2-core.c:957
>> vb2_core_reqbufs+0x128d/0x17a0
>> drivers/media/common/videobuf2/videobuf2-core.c:957
>> Modules linked in:
>> CPU: 0 UID: 0 PID: 10407 Comm: syz-executor171 Not tainted
>> 6.12.0-rc2-g8cf0b93919e1 #2
>> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.15.0-1 04/01/2014
>> RIP: 0010:vb2_core_reqbufs+0x128d/0x17a0
>> drivers/media/common/videobuf2/videobuf2-core.c:957
>> Code: 49 8d b6 28 02 00 00 48 c7 c7 a0 5a 04 8e 48 c7 c2 9d 12 4d 8f
>> e8 03 81 d7 03 4c 8b 7c 24 28 e9 02 f5 ff ff e8 b4 87 db f8 90 <0f> 0b
>> 90 41 bd ea ff ff ff 49 bc 00 00 00 00 00 fc ff df 4c 8b 7c
>> RSP: 0018:ffffc9000e7f7b40 EFLAGS: 00010293
>> RAX: ffffffff88bedbbc RBX: 0000000000000000 RCX: ffff8880463d0000
>> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
>> RBP: ffffc9000e7f7ce8 R08: ffffffff88bed5e0 R09: 1ffff92001cfef58
>> R10: dffffc0000000000 R11: ffffffff88b4fd00 R12: 0000000000000000
>> R13: ffffc9000e7f7c20 R14: ffffc9000652c260 R15: ffffc9000e7f7c40
>> FS:  0000555565e823c0(0000) GS:ffff88802c200000(0000) knlGS:0000000000000000
>> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> CR2: 0000000020000098 CR3: 0000000020696000 CR4: 0000000000752ef0
>> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>> DR3: 0000000000000000 DR6: 00000000fffe07f0 DR7: 0000000000000400
>> PKRU: 55555554
>> Call Trace:
>>  <TASK>
>>  dvb_vb2_reqbufs+0xfe/0x3c0 drivers/media/dvb-core/dvb_vb2.c:338
>>  dvb_demux_do_ioctl+0x5f9/0x760 drivers/media/dvb-core/dmxdev.c:1132
>>  dvb_usercopy+0x170/0x270 drivers/media/dvb-core/dvbdev.c:993
>>  dvb_demux_ioctl+0x2e/0x40 drivers/media/dvb-core/dmxdev.c:1185
>>  vfs_ioctl fs/ioctl.c:51 [inline]
>>  __do_sys_ioctl fs/ioctl.c:907 [inline]
>>  __se_sys_ioctl+0xfa/0x170 fs/ioctl.c:893
>>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>>  do_syscall_64+0xf9/0x280 arch/x86/entry/common.c:83
>>  entry_SYSCALL_64_after_hwframe+0x67/0x6f
>> RIP: 0033:0x7f54a9a8ba8d
>> Code: 28 c3 e8 46 1e 00 00 66 0f 1f 44 00 00 f3 0f 1e fa 48 89 f8 48
>> 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d
>> 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
>> RSP: 002b:00007ffd57732608 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
>> RAX: ffffffffffffffda RBX: 00007ffd57732808 RCX: 00007f54a9a8ba8d
>> RDX: 0000000020000280 RSI: 00000000c0086f3c RDI: 0000000000000003
>> RBP: 0000000000000001 R08: 0000000000000000 R09: 00007ffd57732808
>> R10: 000000000000000f R11: 0000000000000246 R12: 0000000000000001
>> R13: 00007ffd577327f8 R14: 00007f54a9b09530 R15: 0000000000000001
>>  </TASK>
>>
>>
>> Syzkaller reproducer:
>> # {Threaded:false Repeat:false RepeatTimes:0 Procs:1 Slowdown:1
>> Sandbox: SandboxArg:0 Leak:false NetInjection:false NetDevices:false
>> NetReset:false Cgroups:false BinfmtMisc:false CloseFDs:false
>> KCSAN:false DevlinkPCI:false NicVF:false USB:false VhciInjection:false
>> Wifi:false IEEE802154:false Sysctl:false Swap:false UseTmpDir:false
>> HandleSegv:false Repro:false Trace:false LegacyOptions:{Collide:false
>> Fault:false FaultCall:0 FaultNth:0}}
>> r0 = syz_open_dev$KGPT_dvb_demux_syzkalm(&(0x7f0000000080), 0x0, 0x60200)
>> ioctl$KGPT_DMX_REQBUFS_0_dup(r0, 0xc0086f3c, &(0x7f0000000280)={0x1ff})
>>
>>
>> C reproducer:
>> // autogenerated by syzkaller (https://github.com/google/syzkaller)
>>
>> #define _GNU_SOURCE
>>
>> #include <endian.h>
>> #include <fcntl.h>
>> #include <stdint.h>
>> #include <stdio.h>
>> #include <stdlib.h>
>> #include <string.h>
>> #include <sys/stat.h>
>> #include <sys/syscall.h>
>> #include <sys/types.h>
>> #include <unistd.h>
>>
>> static long syz_open_dev(volatile long a0, volatile long a1, volatile long a2)
>> {
>>   if (a0 == 0xc || a0 == 0xb) {
>>     char buf[128];
>>     sprintf(buf, "/dev/%s/%d:%d", a0 == 0xc ? "char" : "block", (uint8_t)a1,
>>             (uint8_t)a2);
>>     return open(buf, O_RDWR, 0);
>>   } else {
>>     char buf[1024];
>>     char* hash;
>>     strncpy(buf, (char*)a0, sizeof(buf) - 1);
>>     buf[sizeof(buf) - 1] = 0;
>>     while ((hash = strchr(buf, '#'))) {
>>       *hash = '0' + (char)(a1 % 10);
>>       a1 /= 10;
>>     }
>>     return open(buf, a2, 0);
>>   }
>> }
>>
>> uint64_t r[1] = {0xffffffffffffffff};
>>
>> int main(void)
>> {
>>   syscall(__NR_mmap, /*addr=*/0x1ffff000ul, /*len=*/0x1000ul, /*prot=*/0ul,
>>           /*flags=*/0x32ul, /*fd=*/-1, /*offset=*/0ul);
>>   syscall(__NR_mmap, /*addr=*/0x20000000ul, /*len=*/0x1000000ul, /*prot=*/7ul,
>>           /*flags=*/0x32ul, /*fd=*/-1, /*offset=*/0ul);
>>   syscall(__NR_mmap, /*addr=*/0x21000000ul, /*len=*/0x1000ul, /*prot=*/0ul,
>>           /*flags=*/0x32ul, /*fd=*/-1, /*offset=*/0ul);
>>   intptr_t res = 0;
>>   memcpy((void*)0x20000080, "/dev/dvb/adapter#/demux#\000", 25);
>>   res = -1;
>>   res = syz_open_dev(/*dev=*/0x20000080, /*id=*/0, /*flags=*/0x60200);
>>   if (res != -1)
>>     r[0] = res;
>>   *(uint32_t*)0x20000280 = 0x1ff;
>>   *(uint32_t*)0x20000284 = 0;
>>   syscall(__NR_ioctl, /*fd=*/r[0], /*cmd=*/0xc0086f3c, /*arg=*/0x20000280ul);
>>   return 0;
>> }
>> ```
>>
>> If you have any questions or require more information, please feel
>> free to contact us.
>>
>> Reported-by: Chenyuan Yang <chenyuan0y@gmail.com>
>>
>> Best,
>> Chenyuan
> 
> 
> 
> Thanks,
> Mauro
> 


