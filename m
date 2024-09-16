Return-Path: <linux-media+bounces-18313-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8431397A251
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2024 14:28:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B8D9B2269B
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2024 12:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33906157469;
	Mon, 16 Sep 2024 12:28:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B51F1553B7
	for <linux-media@vger.kernel.org>; Mon, 16 Sep 2024 12:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726489711; cv=none; b=TqQYNzJoFc+mkacYUuTYwtAqcpbnR1/RDtz9Jyk0n4CEn045Mv+xaeZRQRQsS04j2oEEHb49Ksqe5Y/GFIS0o66sLMCCh+y3A/hAU14BUI9XM6px6MC41ZMSJNn7sZCwuzZnQw4WEvCSvRReB7FOkq23gpZSpyHK4/z7bY3M2y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726489711; c=relaxed/simple;
	bh=HUQ/oaooT1uutHmy2PBayAzikmIrgs3Dh6odPcWpgV0=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=koDBDHkV+jqGQ9Ixnq0YOKXSGOxqrDTO+4ikgi8dVAYxzVFW3Y2+C0XbW38moKzXwdy+jUfhg+pr05e6dmdE/qp5Cpc/JgHZcTUchobqxl2ONhSfR0n6sKs3GzIKE6MdgjpX5NoycSRr6CWxgbUFYkgv42C204YicF1AyC5QGlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-39f6f16ed00so73023065ab.0
        for <linux-media@vger.kernel.org>; Mon, 16 Sep 2024 05:28:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726489709; x=1727094509;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ud8circs9NHEw7Sd104SuPa7vZkeJylkTkKnEC5Z6rA=;
        b=EUSjO1CM7BbHhCuiPKu64iYMZr2uXvkZcfHXa1vsF63/qUAWgzZD9rHt48Y+EaPf9h
         KAWcu3hrpwsackH52Qsq7F9ysvaK5r/7Kw0U6WZo3daAzxJWY2eyMxwfo4zQQcdHrsv7
         8SzuTArhKgGg6pvRCHKSlvNcYCzJQ7YMWjq1kIta+HJZt9c6OJMylCUQEY9Fo4akUc9+
         wQ76LuaalTv6yrYrr6l9YtcnwUPVgG+m5f0EDgtLYgDcB5QzPYjEAunSdp2my751sXUw
         oMAahZVB0fMu/hz9Gd1MbLJzgAb+7liDal6EnZRJgRrM10a+FwaMTyG40VJ+UGYQV7SM
         iDVQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5DH09TX7dzQKBwZw6Q+XLCayzV3BhwpRm/OQa8LyHBFnLWzBdLwIbti0bOl66vqdV3crxErRBTlBrNA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4up2bqfj+X2nYK5ZejyKQ+xPfr0CQ9Xt/t3CIGYBW4xY9k2bl
	zdPIDVCNGcisvLsSE9HLgmm+zdbUfnMdqy3LRsWX++e6yJmdlmfOu0frmO7LL8CEDh4CnOA22eV
	A4i/IReub5rbifrPVpn1YK4yjGnLC8+GnXqlCat+Hvv1nkuqgU74Fdz8=
X-Google-Smtp-Source: AGHT+IGA5tV7O+DipJTb6tgN4VX6mK8hIi2m7drczS0Bx/JR7m2jb4qjrrI9smnv3RTNMFZDAsFghI2h391CWMYZRm2zVzyjxwFL
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:12e7:b0:3a0:8eb3:5160 with SMTP id
 e9e14a558f8ab-3a08eb35230mr74124375ab.11.1726489709658; Mon, 16 Sep 2024
 05:28:29 -0700 (PDT)
Date: Mon, 16 Sep 2024 05:28:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000da65ef06223bb50b@google.com>
Subject: [syzbot] Monthly media report (Sep 2024)
From: syzbot <syzbot+list30593f6a47f0ceae7cd4@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello media maintainers/developers,

This is a 31-day syzbot report for the media subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/media

During the period, 2 new issues were detected and 0 were fixed.
In total, 17 issues are still open and 85 have been fixed so far.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  874     Yes   general protection fault in ir_raw_event_store_with_filter
                   https://syzkaller.appspot.com/bug?extid=34008406ee9a31b13c73
<2>  435     Yes   KASAN: use-after-free Read in v4l2_fh_init
                   https://syzkaller.appspot.com/bug?extid=c025d34b8eaa54c571b8
<3>  168     Yes   KASAN: use-after-free Read in v4l2_fh_open
                   https://syzkaller.appspot.com/bug?extid=b2391895514ed9ef4a8e
<4>  116     Yes   WARNING in usb_free_urb
                   https://syzkaller.appspot.com/bug?extid=b466336413a1fba398a5
<5>  114     No    INFO: rcu detected stall in dvb_usb_read_remote_control (2)
                   https://syzkaller.appspot.com/bug?extid=01926e7756f51c12b6a3
<6>  94      Yes   WARNING in smsusb_start_streaming/usb_submit_urb
                   https://syzkaller.appspot.com/bug?extid=12002a39b8c60510f8fb
<7>  51      Yes   KASAN: use-after-free Read in em28xx_init_extension (2)
                   https://syzkaller.appspot.com/bug?extid=99d6c66dbbc484f50e1c
<8>  47      Yes   WARNING in smsusb_init_device/usb_submit_urb
                   https://syzkaller.appspot.com/bug?extid=85e3ddbf0ddbfbc85f1e
<9>  30      No    WARNING in call_s_stream
                   https://syzkaller.appspot.com/bug?extid=5bcd7c809d365e14c4df
<10> 4       No    KASAN: slab-use-after-free Read in em28xx_release_resources
                   https://syzkaller.appspot.com/bug?extid=16062f26c6480975e5ed

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

