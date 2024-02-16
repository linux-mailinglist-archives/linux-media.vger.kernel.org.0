Return-Path: <linux-media+bounces-5236-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4869F8575BA
	for <lists+linux-media@lfdr.de>; Fri, 16 Feb 2024 06:46:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B91B1C22356
	for <lists+linux-media@lfdr.de>; Fri, 16 Feb 2024 05:46:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FBE6134CC;
	Fri, 16 Feb 2024 05:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VikvTVZ4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A461426E
	for <linux-media@vger.kernel.org>; Fri, 16 Feb 2024 05:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708062371; cv=none; b=iaxeCNE7SlbY7DbcNPKkpAAYiiukcH6WTGvwlQ8CmRHgin99SyrzfgaSEkjIlHCTVMt3Hout04qIGOuFMfLXDMacH+l2ML/1JKRncWDoJT6JfR+UnBfD8SXGNYZYs1PZ/R2glnYyWIQWlgYfib4jmHaI0VReXyVQz3JWtcej7eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708062371; c=relaxed/simple;
	bh=R0KCav4SBl9GvGgw+8QcoFmIYdIjb1VCg/aRrAEv/Xg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IUwDqNeoSUK/xslIbTXTXmW1N3RRLzRczZqKdzGrIG+msaBXOzdkY1+Ekpb0N/nOAj5eGBknRWrKTnFUPjlzqQk4A1oLDQaq8dwoKox8cOWDqmCFxEb2VGJzMl8SYQn7MyZ0yX2+Ct9qoRsuAD8xEetXGxCfYEFzirSeK800Ih0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VikvTVZ4; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-55ee686b5d5so415108a12.0
        for <linux-media@vger.kernel.org>; Thu, 15 Feb 2024 21:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708062366; x=1708667166; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OkqqhJ7YhNw/r5K4OKJ0M5Gv5GBbPK3jd5hErO5/nXs=;
        b=VikvTVZ4tiAB2XSnTmh9GOP6Mk6drmf5DfxpJVhC1HAWz0cHDNmPlJWtCI+DXCfFkc
         9WZ0PQAlVpqEe3+sLRzvC1nhuBhcE1H+x0FVDr9uhDEL+ft+SbQ55l8FH98oiM4RJNUp
         gqRk/ktsjGRybF4PtF4QqXGcvMe7JGHCktFNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708062366; x=1708667166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OkqqhJ7YhNw/r5K4OKJ0M5Gv5GBbPK3jd5hErO5/nXs=;
        b=Sy0hrrLg0yLcuxOGA7TGusAHDHnJoqa3zao7OzTwxgOeT0cjYAVR1hfrGQb2mx7hKf
         LyoQPMT3FL7vdlLZe1v3zAEJNEVD7oPd/AdQ6DtY1JMKw62gwNqmm6aqqZQDx4MKTGfe
         rw/7tSOWanewgjyEH85Dm4xjaKsx35OIYbckneFMujxhWHaJ4r4l9efj86HkGvflKg+O
         /C08vSrzsTVoPMf2OQJ9d+wEdPTpE4FFvngpO9T4Ry/T+4JVsv0YPPHA+Bu6C7nk77kU
         SI3wkUu5eRMAKi7BIkCAJpXiTiukH2Mrko/INZ2p2fMwMfcTSBZ1Scl3pdJA9SIcKhZR
         HccA==
X-Forwarded-Encrypted: i=1; AJvYcCUTo3krXF2x72undKeMEKv6splYFViM7TRwcHs8cY4fsBYXmjHEX+8HbQuopOIDfhsf0iWNZNHP4tRGBtxJiN1I9qiNhHzDTU//upg=
X-Gm-Message-State: AOJu0YyxriovTlO7RSt0uA86P+WPLFNeWQDuQI7jB6dY0YTtMUxu5JZC
	ZnOqIPB3t/lP/0Ipyg/p7SAR8a7FMO2TNUoQhL38K++Id4BBnfkDt2b/oyIuG4UMot/X3hr+Ouo
	ZSw==
X-Google-Smtp-Source: AGHT+IEOoFLRET4g86c8Ya4zYZBkg+rCFCvBEKF4MDMlONoKYp5LBpORXVXSTzbVg+bcmDz7evDEKA==
X-Received: by 2002:a17:906:298c:b0:a3c:59c2:305a with SMTP id x12-20020a170906298c00b00a3c59c2305amr2611940eje.5.1708062366618;
        Thu, 15 Feb 2024 21:46:06 -0800 (PST)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id um10-20020a170906cf8a00b00a3d599f47c2sm1238460ejb.18.2024.02.15.21.46.05
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Feb 2024 21:46:05 -0800 (PST)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-41242d2f73cso1724855e9.0
        for <linux-media@vger.kernel.org>; Thu, 15 Feb 2024 21:46:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUX5wyR4VrdR5k2cDpw2jNWHEhEmyG8tLzfADhvDzZW1876KSfd0J0drxAGE6iBipLavCxsfLQRA6ez4y02qlktufqouXOprG68g/0=
X-Received: by 2002:a05:600c:1da6:b0:411:c45a:38fc with SMTP id
 p38-20020a05600c1da600b00411c45a38fcmr3258760wms.3.1708062364654; Thu, 15 Feb
 2024 21:46:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0000000000008b96230610c6b3fe@google.com>
In-Reply-To: <0000000000008b96230610c6b3fe@google.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Fri, 16 Feb 2024 14:45:44 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Afg2=8wfcQt_+rqJdSEOuWZXfjNE0bzcVN+AnN5EGYng@mail.gmail.com>
Message-ID: <CAAFQd5Afg2=8wfcQt_+rqJdSEOuWZXfjNE0bzcVN+AnN5EGYng@mail.gmail.com>
Subject: Re: [syzbot] [usb?] [media?] possible deadlock in vb2_video_unregister_device
To: syzbot <syzbot+3b1d4b3d5f7a358bf9a9@syzkaller.appspotmail.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	mchehab@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, m.szyprowski@samsung.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 7, 2024 at 5:44=E2=80=AFPM syzbot
<syzbot+3b1d4b3d5f7a358bf9a9@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    ed5551279c91 Merge 6.8-rc3 into usb-next
> git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/us=
b.git usb-testing
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D16940d7be8000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D28a3704ea90ef=
255
> dashboard link: https://syzkaller.appspot.com/bug?extid=3D3b1d4b3d5f7a358=
bf9a9
> compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for D=
ebian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D14450a38180=
000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D1603629fe8000=
0
>
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/10b543a7171a/dis=
k-ed555127.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/dc10f27643e8/vmlinu=
x-ed555127.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/bb6389e754b9/b=
zImage-ed555127.xz
>
> IMPORTANT: if you fix the issue, please add the following tag to the comm=
it:
> Reported-by: syzbot+3b1d4b3d5f7a358bf9a9@syzkaller.appspotmail.com
>
> usb 1-1: SerialNumber: syz
> usb 1-1: config 0 descriptor??
> usbtv 1-1:0.0: Fushicai USBTV007 Audio-Video Grabber
> usb 1-1: USB disconnect, device number 2
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> WARNING: possible recursive locking detected
> 6.8.0-rc3-syzkaller-00047-ged5551279c91 #0 Not tainted
> --------------------------------------------
> kworker/0:2/694 is trying to acquire lock:
> ffff888109f20b70 (&usbtv->vb2q_lock){+.+.}-{3:3}, at: vb2_video_unregiste=
r_device drivers/media/common/videobuf2/videobuf2-v4l2.c:1269 [inline]
> ffff888109f20b70 (&usbtv->vb2q_lock){+.+.}-{3:3}, at: vb2_video_unregiste=
r_device+0x12b/0x2d0 drivers/media/common/videobuf2/videobuf2-v4l2.c:1245
>
> but task is already holding lock:
> ffff888109f20b70 (&usbtv->vb2q_lock){+.+.}-{3:3}, at: usbtv_video_free+0x=
28/0x70 drivers/media/usb/usbtv/usbtv-video.c:966
>

Looking at usbtv_video_free [1], it calls
vb2_video_unregister_device() with the queue mutex locked, which is
just wrong. I wonder how (and if) it even worked before. Laurent,
Hans, Mauro, any idea who is maintaining this driver? I don't see a
matching entry in the MAINTAINERS file.

[1] https://elixir.bootlin.com/linux/v6.8-rc4/source/drivers/media/usb/usbt=
v/usbtv-video.c#L964

Best regards,
Tomasz

> other info that might help us debug this:
>  Possible unsafe locking scenario:
>
>        CPU0
>        ----
>   lock(&usbtv->vb2q_lock);
>   lock(&usbtv->vb2q_lock);
>
>  *** DEADLOCK ***
>
>  May be due to missing lock nesting notation
>
> 7 locks held by kworker/0:2/694:
>  #0: ffff888106ad2138 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: proces=
s_one_work+0x789/0x15d0 kernel/workqueue.c:2608
>  #1: ffffc90001c0fd80 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: =
process_one_work+0x7eb/0x15d0 kernel/workqueue.c:2609
>  #2: ffff88810af2f190 (&dev->mutex){....}-{3:3}, at: device_lock include/=
linux/device.h:990 [inline]
>  #2: ffff88810af2f190 (&dev->mutex){....}-{3:3}, at: hub_event+0x1be/0x4f=
40 drivers/usb/core/hub.c:5840
>  #3: ffff888107799190 (&dev->mutex){....}-{3:3}, at: device_lock include/=
linux/device.h:990 [inline]
>  #3: ffff888107799190 (&dev->mutex){....}-{3:3}, at: usb_disconnect+0x10a=
/0x910 drivers/usb/core/hub.c:2287
>  #4: ffff88810779a160 (&dev->mutex){....}-{3:3}, at: device_lock include/=
linux/device.h:990 [inline]
>  #4: ffff88810779a160 (&dev->mutex){....}-{3:3}, at: __device_driver_lock=
 drivers/base/dd.c:1095 [inline]
>  #4: ffff88810779a160 (&dev->mutex){....}-{3:3}, at: device_release_drive=
r_internal+0xa4/0x610 drivers/base/dd.c:1292
>  #5: ffff888109f20b70 (&usbtv->vb2q_lock){+.+.}-{3:3}, at: usbtv_video_fr=
ee+0x28/0x70 drivers/media/usb/usbtv/usbtv-video.c:966
>  #6: ffff888109f20ae0 (&usbtv->v4l2_lock){+.+.}-{3:3}, at: usbtv_video_fr=
ee+0x32/0x70 drivers/media/usb/usbtv/usbtv-video.c:967
>
> stack backtrace:
> CPU: 0 PID: 694 Comm: kworker/0:2 Not tainted 6.8.0-rc3-syzkaller-00047-g=
ed5551279c91 #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS G=
oogle 01/25/2024
> Workqueue: usb_hub_wq hub_event
> Call Trace:
>  <TASK>
>  __dump_stack lib/dump_stack.c:88 [inline]
>  dump_stack_lvl+0xd9/0x1b0 lib/dump_stack.c:106
>  check_deadlock kernel/locking/lockdep.c:3062 [inline]
>  validate_chain kernel/locking/lockdep.c:3856 [inline]
>  __lock_acquire+0x210a/0x3b30 kernel/locking/lockdep.c:5137
>  lock_acquire kernel/locking/lockdep.c:5754 [inline]
>  lock_acquire+0x1ae/0x520 kernel/locking/lockdep.c:5719
>  __mutex_lock_common kernel/locking/mutex.c:608 [inline]
>  __mutex_lock+0x175/0x9d0 kernel/locking/mutex.c:752
>  vb2_video_unregister_device drivers/media/common/videobuf2/videobuf2-v4l=
2.c:1269 [inline]
>  vb2_video_unregister_device+0x12b/0x2d0 drivers/media/common/videobuf2/v=
ideobuf2-v4l2.c:1245
>  usbtv_video_free+0x4a/0x70 drivers/media/usb/usbtv/usbtv-video.c:970
>  usbtv_disconnect+0x5c/0xd0 drivers/media/usb/usbtv/usbtv-core.c:138
>  usb_unbind_interface+0x1e5/0x960 drivers/usb/core/driver.c:461
>  device_remove drivers/base/dd.c:569 [inline]
>  device_remove+0x11f/0x170 drivers/base/dd.c:561
>  __device_release_driver drivers/base/dd.c:1272 [inline]
>  device_release_driver_internal+0x44a/0x610 drivers/base/dd.c:1295
>  bus_remove_device+0x22c/0x420 drivers/base/bus.c:574
>  device_del+0x39a/0xa50 drivers/base/core.c:3814
>  usb_disable_device+0x36c/0x7f0 drivers/usb/core/message.c:1416
>  usb_disconnect+0x2e1/0x910 drivers/usb/core/hub.c:2296
>  hub_port_connect drivers/usb/core/hub.c:5352 [inline]
>  hub_port_connect_change drivers/usb/core/hub.c:5652 [inline]
>  port_event drivers/usb/core/hub.c:5812 [inline]
>  hub_event+0x1be0/0x4f40 drivers/usb/core/hub.c:5894
>  process_one_work+0x886/0x15d0 kernel/workqueue.c:2633
>  process_scheduled_works kernel/workqueue.c:2706 [inline]
>  worker_thread+0x8b9/0x1290 kernel/workqueue.c:2787
>  kthread+0x2c6/0x3a0 kernel/kthread.c:388
>  ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
>  ret_from_fork_asm+0x11/0x20 arch/x86/entry/entry_64.S:242
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
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.
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

