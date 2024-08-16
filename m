Return-Path: <linux-media+bounces-16399-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DCE9551AC
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2024 21:57:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFC321F22600
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2024 19:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30F351C4630;
	Fri, 16 Aug 2024 19:57:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716B01BE861
	for <linux-media@vger.kernel.org>; Fri, 16 Aug 2024 19:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723838246; cv=none; b=iVlPEFE6CMAjbfuxAEx5c/NzuYrDWsz8N0808sJSMWNnp+qKJEgGFxhCE6ExLWXSwoOrpYnDATq0ZOdoHMUYbxTFWMwVNKtvLzazh2DYs+acQFdGvORXQym/S9WmfjgQbWm1+tx7is0m7Z/eN2cVbadFBGFv54219sEeF6DKzV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723838246; c=relaxed/simple;
	bh=EFYQwCeDGHtxmSutB9dT36o6ha9RtgGQNUsH53Alp2E=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=UuHPHvOmAJjR1Kxt81rLDPHgebc76Re8tEgmtLM9SylSgmYhbf8pBEOt7Yc0lR0rvGFO2K8MyJb39p/bUqn5uvBSn0pf2st/ik3YTLBw28tFuJ2g11mbve8NS7aHoHskyauekPX1+KaSiBsN9fWlo47vA3IM8cN3eMqoXdVJgGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-39b3cd180ffso24211455ab.1
        for <linux-media@vger.kernel.org>; Fri, 16 Aug 2024 12:57:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723838244; x=1724443044;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mcJtJditcw5nwwmT7y+sj2nSLn2k1fZnH0hEdSmmLbo=;
        b=lzJzYv7nVOnjezp7J7Do6EcLwSt92mmfjbORXdArrqwcq50oXRbVYnbv6j2/3c3An0
         WoQ3A7u4IznQ6kh0CiXcu2o3QrOQ3bmJv+NGjHt090ArP5oHx5IPByLIpezpJMGGdmKl
         BlI196/geQH32pOHVd22R/j/2fvPKw58Tk/G35r3F/6iEekY+cs+uNcHxptMJ+Cmm9E8
         R4JVVQ7NQOD0izNzn9jtrIuJeH2Oig201cBpy4rRSMx7ag5MPr7OAM62ufMoyrXL7dMC
         iXQOvbMoLR9xT44K5QqCJZ7JitfUdw1CrTgY3haGD0KP94o7nsu6PtTGgEkBtlaj70ED
         xTzQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/gKjFgY2FIw+F2mXjSwfnt9IPt8+ruT2N0MH9Ovj02L7BHUs83JITyI19P5b/4EY+Of7nlhdA1LZphLzJUiwgsYB2GGSJlrB88to=
X-Gm-Message-State: AOJu0Yy15D16+mTdYLwLMyS3RaSvNAeHymtVpJhtvor7aj5wvTYlKV32
	etGnJwIod/rxHiR07l9GrtXfJU5T0f1sGZicMxxcOFiCAuWAy4OpPZOFxRok/7tSjV6a8aPMLkC
	2HsAVRCXckyUOwjolWS/zNfcGiMdpwaFUNdh/dGibbprVwmKeY4cX/1o=
X-Google-Smtp-Source: AGHT+IG0Afql9gOaEwoGo5Nq3I3hIFtbmAC6jHzB9fj/MUby+jEnjCv42glaLToFrI2+R6S2zq5fnj55k1rfuKaQHuOb3lAuQM9E
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2207:b0:39d:300f:e91c with SMTP id
 e9e14a558f8ab-39d300fecefmr1023585ab.5.1723838243959; Fri, 16 Aug 2024
 12:57:23 -0700 (PDT)
Date: Fri, 16 Aug 2024 12:57:23 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000002e8950061fd25ec6@google.com>
Subject: [syzbot] Monthly media report (Aug 2024)
From: syzbot <syzbot+list00070df854e8a60874f7@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello media maintainers/developers,

This is a 31-day syzbot report for the media subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/media

During the period, 3 new issues were detected and 0 were fixed.
In total, 18 issues are still open and 85 have been fixed so far.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  3590    Yes   KMSAN: uninit-value in dib3000mb_attach (2)
                   https://syzkaller.appspot.com/bug?extid=c88fc0ebe0d5935c70da
<2>  874     Yes   general protection fault in ir_raw_event_store_with_filter
                   https://syzkaller.appspot.com/bug?extid=34008406ee9a31b13c73
<3>  354     Yes   KASAN: use-after-free Read in v4l2_fh_init
                   https://syzkaller.appspot.com/bug?extid=c025d34b8eaa54c571b8
<4>  101     Yes   WARNING in media_create_pad_link
                   https://syzkaller.appspot.com/bug?extid=dd320d114deb3f5bb79b
<5>  80      No    INFO: rcu detected stall in dvb_usb_read_remote_control (2)
                   https://syzkaller.appspot.com/bug?extid=01926e7756f51c12b6a3
<6>  69      Yes   KASAN: use-after-free Read in v4l2_fh_open
                   https://syzkaller.appspot.com/bug?extid=b2391895514ed9ef4a8e
<7>  28      No    WARNING in call_s_stream
                   https://syzkaller.appspot.com/bug?extid=5bcd7c809d365e14c4df
<8>  5       Yes   WARNING in usb_free_urb
                   https://syzkaller.appspot.com/bug?extid=b466336413a1fba398a5
<9>  3       Yes   KASAN: use-after-free Read in em28xx_init_extension (2)
                   https://syzkaller.appspot.com/bug?extid=99d6c66dbbc484f50e1c
<10> 3       Yes   WARNING in smsusb_init_device/usb_submit_urb
                   https://syzkaller.appspot.com/bug?extid=85e3ddbf0ddbfbc85f1e

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

