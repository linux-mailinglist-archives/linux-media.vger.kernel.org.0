Return-Path: <linux-media+bounces-19362-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A939998A6
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 03:06:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 96CDFB224EA
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 01:06:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE02A79E1;
	Fri, 11 Oct 2024 01:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f+AOcqlN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C164D567D;
	Fri, 11 Oct 2024 01:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728608803; cv=none; b=pMkbVA2TX9Inw4LdiA9cwlYcMRsVRoi79DUgTctUJFiHRA4CXKUqTNeDQe+7uaYKDrU4GfrIgHmu3XOafu1Rd6fD38nxY9QtKQl0hU/0PGhEYIemysWbGbaBteOJ26KvvuWnw2dMHybsp2ke/MiTJ8xnyGNvAERbtKq8Z8mhsxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728608803; c=relaxed/simple;
	bh=0OrRZ4Ne/RvM5b+8UZK0vjpzQixf2lWQQ/0cTesSo7w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NZmtqv4w5YBryw/utfFX7zFr5rhp3A7Avk83cicjGtGf0p5LXxRwLJFpL0Yn4PFpHgQ1AN51TEt5xkhpso53xnfv/+bKc/MVfZVMS3vhwoolETi16/hFZL/4pRQlEQg6rO5Rer/gu/3nx0FBgsKEwyCw1ezFfUvEt05eWmC/Nq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f+AOcqlN; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2e2c2a17aa4so251595a91.0;
        Thu, 10 Oct 2024 18:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728608801; x=1729213601; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MWhYerDoM3YcIxXDtCBC3z6azD6jU2Iu0orCSkhVXnQ=;
        b=f+AOcqlNhilXolyBWkpYOWdX16PQ2xhU2/nwNNp8WKJfezipfQO4ebA8ruVyYo+3eG
         pcsQSagvOjZQrRpWycP0Y6XAdXie+HPzL1cCyIcTpd14Cfa0KqYXMm5ktFSOqIPF/zc1
         7lJ+sptmyCYUUsPfjs8QWmt15AXxZws8eYd74ZzbTbxYRqlA2d8Idk/oPlMrk3Q1qmdF
         DN4BrcBHaEauu2GvYsvxHJrobrBfEmGSmGgaXryjM/iBYcrioVuZIv5pcG3hkfnGuE6s
         tt7+6YR/Yq6Nj0hqUSF5flyO22h4pgqygh5VGpS1GNhf9YKv0Z7N/+OKPS2t9S7JKfEC
         uViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728608801; x=1729213601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MWhYerDoM3YcIxXDtCBC3z6azD6jU2Iu0orCSkhVXnQ=;
        b=bYW9mWNjAgtQBf3AQmcw4EG2++aeBiMpkuQ6Lvfpd0NfnmmDdFikyER0UHB9wxv/g4
         BIND51YB2ozXstlqPdw6LYcFLyFNpCIO8SZal5HgT+KWjO0nNchB3a5OFowd2V45jUbL
         yWsdiNWb+3VcEM5NnsqemC+kvQY6IUMDdg6CoYMCGoxqu1evcd9GKzX8J547cCuLPJ5f
         kXAyw0GaIhZOpY3JRW6UYrFfUhJ9skfr34EtMfgk60R5dy4TSpjgN1I2j59Shsih7bdz
         9dxgu8TMzxxp7TCFiBxyLvUgCL2FNCv/dY6JweCeSIPv5opM4o1ovLg0JQB7uU+7whbY
         toWg==
X-Forwarded-Encrypted: i=1; AJvYcCUSuM0qAaCXRf+nbYGhOtdxa342DVlTmlmTLReQeQ0sAhdtsW1XZoQXBIq00NLPKChHndtrUZ46ftn4+Ak=@vger.kernel.org, AJvYcCVVtil0+W6lW9dweY9G4vhM8pnHnKxHq0u1sGwz/MuskKXOYgiug7qeeCa4r+J+CbxjK9caCnZP6YY1/MY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiilDpAsCRUmCMmjiSASXCrHN582K/7yMKlGSe+ueijRTbDyHs
	1UKxlW8PnvaY6lzxdD4TdVyRbxFNiUHJb9Qx7DMk+yWWHiCFSfwTBfPjIeE+DOWpKt2hf33hvQJ
	rpJAATD7pW3K7Xhqe2TrbbznphA==
X-Google-Smtp-Source: AGHT+IHWV9C6w3wyoL5g5OUO6LhKynh/2dAFH0uMCbACfF5WLDVSV7POokIW1Xv4oPX8l2qJ0wU0XIdkBDVWc0Y53tg=
X-Received: by 2002:a17:90b:1056:b0:2e2:c423:8e16 with SMTP id
 98e67ed59e1d1-2e2f0a2fb66mr564458a91.1.1728608800897; Thu, 10 Oct 2024
 18:06:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALGdzuqAiWA4zEqUEiTMLRjrhCyh+EL311Gen16YnyNSk75Yaw@mail.gmail.com>
In-Reply-To: <CALGdzuqAiWA4zEqUEiTMLRjrhCyh+EL311Gen16YnyNSk75Yaw@mail.gmail.com>
From: Chenyuan Yang <chenyuan0y@gmail.com>
Date: Thu, 10 Oct 2024 20:06:29 -0500
Message-ID: <CALGdzur5uoqM-8H_MfPJNdPNL1nMhRbttN95kNWi2q-p3-n9hg@mail.gmail.com>
Subject: Re: [Linux Kernel Bug] memory leak in dvb_dmxdev_add_pid
To: mchehab@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: syzkaller@googlegroups.com, Zijie Zhao <zzjas98@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Linux Developers for DVB,

I am writing to inquire if there have been any updates regarding the
memory leak issue. The issue remains reproducible on the latest stable
Linux version (6.12-rc2, commit
8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b).

Thank you for your attention to this matter.

Best,
Chenyuan

On Sat, Mar 2, 2024 at 3:12=E2=80=AFPM Chenyuan Yang <chenyuan0y@gmail.com>=
 wrote:
>
> Dear Linux Developers for DVB,
>
> We encountered "memory leak in dvb_dmxdev_add_pid" when testing the
> DVB driver with Syzkaller and our generated specifications.
>
> The C reproducer and the config for the kernel are attached.
>
> The memory leak originates from the allocated dmxdev_feed structure,
> as referenced in the code at
> [https://elixir.bootlin.com/linux/latest/source/drivers/media/dvb-core/dm=
xdev.c#L881].
> This structure fails to be freed upon entering the code branch found
> at [https://elixir.bootlin.com/linux/latest/source/drivers/media/dvb-core=
/dmxdev.c#L891].
>
> ```
> ioctl$KGPT_DMX_START(r0, 0x6f29, 0x0)
> BUG: memory leak
> unreferenced object 0xffff88802e9ae7e0 (size 32):
>   comm "syz-executor.0", pid 27777, jiffies 4295115050 (age 15.550s)
>   hex dump (first 32 bytes):
>     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>     08 c0 6a 05 00 c9 ff ff 08 c0 6a 05 00 c9 ff ff  ..j.......j.....
>   backtrace:
>     [<ffffffff8169126f>] kmemleak_alloc_recursive
> scratch/zijie-data/LLM-Kernel/spec-eval/shared_linux_builds/syzbot-leak-m=
ore_631373bc9e824969/./include/linux/kmemleak.h:42
> [inline]
>     [<ffffffff8169126f>] slab_post_alloc_hook
> scratch/zijie-data/LLM-Kernel/spec-eval/shared_linux_builds/syzbot-leak-m=
ore_631373bc9e824969/mm/slab.h:766
> [inline]
>     [<ffffffff8169126f>] slab_alloc_node
> scratch/zijie-data/LLM-Kernel/spec-eval/shared_linux_builds/syzbot-leak-m=
ore_631373bc9e824969/mm/slub.c:3478
> [inline]
>     [<ffffffff8169126f>] __kmem_cache_alloc_node+0x2ff/0x3e0
> scratch/zijie-data/LLM-Kernel/spec-eval/shared_linux_builds/syzbot-leak-m=
ore_631373bc9e824969/mm/slub.c:3517
>     [<ffffffff815d9da9>] kmalloc_trace+0x29/0x90
> scratch/zijie-data/LLM-Kernel/spec-eval/shared_linux_builds/syzbot-leak-m=
ore_631373bc9e824969/mm/slab_common.c:1098
>     [<ffffffff83db2e09>] kmalloc
> scratch/zijie-data/LLM-Kernel/spec-eval/shared_linux_builds/syzbot-leak-m=
ore_631373bc9e824969/./include/linux/slab.h:600
> [inline]
>     [<ffffffff83db2e09>] kzalloc
> scratch/zijie-data/LLM-Kernel/spec-eval/shared_linux_builds/syzbot-leak-m=
ore_631373bc9e824969/./include/linux/slab.h:721
> [inline]
>     [<ffffffff83db2e09>] dvb_dmxdev_add_pid+0xa9/0x160
> scratch/zijie-data/LLM-Kernel/spec-eval/shared_linux_builds/syzbot-leak-m=
ore_631373bc9e824969/drivers/media/dvb-core/dmxdev.c:881
>     [<ffffffff83db48de>] dvb_dmxdev_pes_filter_set
> scratch/zijie-data/LLM-Kernel/spec-eval/shared_linux_builds/syzbot-leak-m=
ore_631373bc9e824969/drivers/media/dvb-core/dmxdev.c:956
> [inline]
>     [<ffffffff83db48de>] dvb_demux_do_ioctl+0x67e/0xa80
> scratch/zijie-data/LLM-Kernel/spec-eval/shared_linux_builds/syzbot-leak-m=
ore_631373bc9e824969/drivers/media/dvb-core/dmxdev.c:1076
>     [<ffffffff83db1252>] dvb_usercopy+0x82/0x220
> scratch/zijie-data/LLM-Kernel/spec-eval/shared_linux_builds/syzbot-leak-m=
ore_631373bc9e824969/drivers/media/dvb-core/dvbdev.c:986
>     [<ffffffff83db1b51>] dvb_demux_ioctl+0x31/0x40
> scratch/zijie-data/LLM-Kernel/spec-eval/shared_linux_builds/syzbot-leak-m=
ore_631373bc9e824969/drivers/media/dvb-core/dmxdev.c:1185
>     [<ffffffff8171ca88>] vfs_ioctl
> scratch/zijie-data/LLM-Kernel/spec-eval/shared_linux_builds/syzbot-leak-m=
ore_631373bc9e824969/fs/ioctl.c:51
> [inline]
>     [<ffffffff8171ca88>] __do_sys_ioctl
> scratch/zijie-data/LLM-Kernel/spec-eval/shared_linux_builds/syzbot-leak-m=
ore_631373bc9e824969/fs/ioctl.c:871
> [inline]
>     [<ffffffff8171ca88>] __se_sys_ioctl
> scratch/zijie-data/LLM-Kernel/spec-eval/shared_linux_builds/syzbot-leak-m=
ore_631373bc9e824969/fs/ioctl.c:857
> [inline]
>     [<ffffffff8171ca88>] __x64_sys_ioctl+0x108/0x150
> scratch/zijie-data/LLM-Kernel/spec-eval/shared_linux_builds/syzbot-leak-m=
ore_631373bc9e824969/fs/ioctl.c:857
>     [<ffffffff8540b150>] do_syscall_x64
> scratch/zijie-data/LLM-Kernel/spec-eval/shared_linux_builds/syzbot-leak-m=
ore_631373bc9e824969/arch/x86/entry/common.c:51
> [inline]
>     [<ffffffff8540b150>] do_syscall_64+0x40/0x110
> scratch/zijie-data/LLM-Kernel/spec-eval/shared_linux_builds/syzbot-leak-m=
ore_631373bc9e824969/arch/x86/entry/common.c:82
>     [<ffffffff8560008b>] entry_SYSCALL_64_after_hwframe+0x63/0x6b
> ```
>
> If you have any questions or require more information, please feel
> free to contact us.
>
> Reported-by: Chenyuan Yang <chenyuan0y@gmail.com>
>
> Best,
> Chenyuan

