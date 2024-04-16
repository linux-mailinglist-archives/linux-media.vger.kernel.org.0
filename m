Return-Path: <linux-media+bounces-9472-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A93F78A6365
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 08:01:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 608342822D0
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 06:01:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE3D140850;
	Tue, 16 Apr 2024 06:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SvuusmyL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7F23CF63
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 06:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713247245; cv=none; b=NZmSzUNFyXRfvYpslYAnWgk5UQhk3S0+02qOppvoO8VMWKm9u5QQT4FOD21WKfuN2ZBh/PbGqiZ4MwKl2RsZFNp+t0MZv9E+kDDtekCjikKCuBCsJqYGAIG2m0upwSUeldX+l2a8FImSzM0/efyuCI9Q7B9hT055DOr7ZSHj69k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713247245; c=relaxed/simple;
	bh=6Q4Mc4UUTY+XifprZ9RBogRi1h4HC0xjt7twoObP0/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tjmpoO2PgRu/aD34dnUG7L6oMWscGDBVfjHV7XAsFoaOkpuNooXn9YdzxmXit/I48K5/r1u9wbvq3RwBfJTZQ5rHWzzFo5TRsI9dLte8xj21QVrpsWZlKyaVPOiM84AAmH91dvqlFZfbFsSjf2YKS5QPypywgDgLetfxUc715mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SvuusmyL; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a51a7dc45easo441117766b.2
        for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 23:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713247240; x=1713852040; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AWmw02HrhtTxxSIbZqDzniTkSV4RbVhyH4qzSQfjqLg=;
        b=SvuusmyLwQpCm9wLdTDez6QOcZn6RN34CP9l4f4cu7yn33d5TWDbXVNac5jpqMVg/A
         ExstYLvo1Y1KqJkXHPd+lmU//fgrJtJb/bV/d8D3PBaOCh2soqc7rdloKHt66g+eyErf
         enL5GdCkly2HSBCYBPBM/zaJuifGEOut6xwrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713247240; x=1713852040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AWmw02HrhtTxxSIbZqDzniTkSV4RbVhyH4qzSQfjqLg=;
        b=GR21niObnWy6D3L/4pOxObzZXyu7dtktIIEfO+JHOUZG1JFIrRKz6U9sZaAgJ9UsiN
         2EuMc/s0XcXKho4vxg1/IjbrByg1W7uufMyqHhGvtwyssZiw7wOcTqHkYuCUZowJyl6E
         hbZML4+d/pJzm8KSznfnGoBvy4K4tDHAAl1Vs54NfFF3DkdB7P0jWD+lEXKoeEFqNi2B
         Nqa6fOF2X78ApJJBIf8/rVyZ3hOa1ZFy2194tP7fPhV5ydTI7hpE9exfWSKNTBedR2dR
         W08/qmzCSpwMyevJ79AIvjQNYPsKrkDx8x6GTpIp6q5d0+rKAuDnzRaJXvNiSTT8vOub
         U2kw==
X-Forwarded-Encrypted: i=1; AJvYcCUfYotfvI76N+EtlTXBWBU+ufegdH9+vHSGuSkFVqJn4h1RXPpGfCm2v1KW862KNGo6JyryM4udsR6hmLfpbmIRnT8n5DVghPzOAiQ=
X-Gm-Message-State: AOJu0YzhG281+wM6brp9PzT8JMS6kv9GQw6hPUOh3PlsgM9p7nSH4Aq7
	FlNcCOSO7D9F5NW2rjEB112d9lfk9WYXS4dOzliaby4zcrbJt3WUucsDX9+CRtmFL3GwUtqe8Zr
	5AQ==
X-Google-Smtp-Source: AGHT+IFZB8ov5VAT9Ihx4BnBbqdUuU2a+K5aCb8rszZuVmLGPKcAQhEnKa/r+79ufI4qLy3eH3QtBA==
X-Received: by 2002:a17:906:134f:b0:a51:d742:b390 with SMTP id x15-20020a170906134f00b00a51d742b390mr7875743ejb.30.1713247239795;
        Mon, 15 Apr 2024 23:00:39 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id ne12-20020a1709077b8c00b00a51c5c76023sm6328922ejc.194.2024.04.15.23.00.38
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 23:00:38 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-343e46ec237so3205716f8f.2
        for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 23:00:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX2fv4/PtfGKcYwl1+16ybHgHYOf53Y+U3Nk83b4YCsr1sCj3r8kxDxNWgbVG0XGzLoCohoO6ZcKSshWf1eUxalzFi1wXlHyrEUZ6E=
X-Received: by 2002:a5d:6049:0:b0:347:5386:e051 with SMTP id
 j9-20020a5d6049000000b003475386e051mr4992831wrt.35.1713247238064; Mon, 15 Apr
 2024 23:00:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0000000000008cabee0614a97e81@google.com>
In-Reply-To: <0000000000008cabee0614a97e81@google.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Tue, 16 Apr 2024 15:00:21 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DVR8=_W2Lq4bnCoKTOU+JDoB+49ExcCNmNucZTQsJ4yA@mail.gmail.com>
Message-ID: <CAAFQd5DVR8=_W2Lq4bnCoKTOU+JDoB+49ExcCNmNucZTQsJ4yA@mail.gmail.com>
Subject: Re: [syzbot] [media?] WARNING in call_s_stream
To: syzbot <syzbot+5bcd7c809d365e14c4df@syzkaller.appspotmail.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	mchehab@kernel.org, syzkaller-bugs@googlegroups.com, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 28, 2024 at 4:34=E2=80=AFAM syzbot
<syzbot+5bcd7c809d365e14c4df@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    480e035fc4c7 Merge tag 'drm-next-2024-03-13' of https://g=
i..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D141370b118000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D1e5b814e91787=
669
> dashboard link: https://syzkaller.appspot.com/bug?extid=3D5bcd7c809d365e1=
4c4df
> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Deb=
ian) 2.40
>
> Unfortunately, I don't have any reproducer for this issue yet.
>
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/5f73b6ef963d/dis=
k-480e035f.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/46c949396aad/vmlinu=
x-480e035f.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/e3b4d0f5a5f8/b=
zImage-480e035f.xz
>
> IMPORTANT: if you fix the issue, please add the following tag to the comm=
it:
> Reported-by: syzbot+5bcd7c809d365e14c4df@syzkaller.appspotmail.com
>
> vimc vimc.0: subdev_call error Scaler
> ------------[ cut here ]------------
> WARNING: CPU: 1 PID: 7323 at drivers/media/v4l2-core/v4l2-subdev.c:412 ca=
ll_s_stream+0x1f5/0x220 drivers/media/v4l2-core/v4l2-subdev.c:412


Looks like vimc is trying to stop an already stopped subdev and a
warning was added by commit 009905ec50433 ("media: v4l2-subdev:
Document and enforce .s_stream() requirements") to catch it.
Shuah, Kieran, could you help with this?

Also CC Laurent, Sakari and Hans who added the warning.

Best regards,
Tomasz

>
> Modules linked in:
> CPU: 1 PID: 7323 Comm: syz-executor.4 Not tainted 6.8.0-syzkaller-08073-g=
480e035fc4c7 #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS G=
oogle 02/29/2024
> RIP: 0010:call_s_stream+0x1f5/0x220 drivers/media/v4l2-core/v4l2-subdev.c=
:412
> Code: c1 e8 03 80 3c 28 00 74 08 4c 89 ff e8 a4 79 4c fa 49 8b 3f 48 c7 c=
6 a0 5a 64 8c 89 da e8 03 d0 c7 03 eb 9e e8 6c 2a e9 f9 90 <0f> 0b 90 eb b0=
 44 89 e1 80 e1 07 80 c1 03 38 c1 0f 8c ca fe ff ff
> RSP: 0018:ffffc9000939f880 EFLAGS: 00010293
> RAX: ffffffff87abcae4 RBX: 0000000000000000 RCX: ffff88801ee13c00
> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> RBP: 0000000000000001 R08: ffffffff87abc951 R09: 1ffff92001273e78
> R10: dffffc0000000000 R11: ffffffff87abc8f0 R12: ffff888024a6c190
> R13: 0000000000000000 R14: 1ffff1100494d832 R15: ffff888024a6c020
> FS:  00007ff8da9646c0(0000) GS:ffff8880b9500000(0000) knlGS:0000000000000=
000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f3e3ed79198 CR3: 0000000049c48000 CR4: 00000000003506f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  <TASK>
>  vimc_streamer_pipeline_terminate+0x219/0x360 drivers/media/test-drivers/=
vimc/vimc-streamer.c:62
>  vimc_streamer_s_stream+0x69f/0x800 drivers/media/test-drivers/vimc/vimc-=
streamer.c:203
>  vimc_capture_start_streaming+0x230/0x440 drivers/media/test-drivers/vimc=
/vimc-capture.c:255
>  vb2_start_streaming+0x12e/0x510 drivers/media/common/videobuf2/videobuf2=
-core.c:1676
>  vb2_core_qbuf+0x87d/0x13b0 drivers/media/common/videobuf2/videobuf2-core=
.c:1850
>  vb2_qbuf+0x31b/0x3b0 drivers/media/common/videobuf2/videobuf2-v4l2.c:827
>  __video_do_ioctl+0xc26/0xde0 drivers/media/v4l2-core/v4l2-ioctl.c:3049
>  video_usercopy+0x899/0x1180 drivers/media/v4l2-core/v4l2-ioctl.c:3390
>  v4l2_ioctl+0x18c/0x1e0 drivers/media/v4l2-core/v4l2-dev.c:364
>  vfs_ioctl fs/ioctl.c:51 [inline]
>  __do_sys_ioctl fs/ioctl.c:904 [inline]
>  __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:890
>  do_syscall_64+0xfb/0x240
>  entry_SYSCALL_64_after_hwframe+0x6d/0x75
> RIP: 0033:0x7ff8d9c7dda9
> Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 e1 20 00 00 90 48 89 f8 48 89 f=
7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff=
 ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007ff8da9640c8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 00007ff8d9dac050 RCX: 00007ff8d9c7dda9
> RDX: 00000000200000c0 RSI: 00000000c058560f RDI: 0000000000000003
> RBP: 00007ff8d9cca47a R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> R13: 000000000000006e R14: 00007ff8d9dac050 R15: 00007ff8d9ecfa48
>  </TASK>
>
>
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
>
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
>
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
>
> If you want to undo deduplication, reply with:
> #syz undup
>

