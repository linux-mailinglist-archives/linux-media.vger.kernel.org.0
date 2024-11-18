Return-Path: <linux-media+bounces-21520-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A12D9D0ED8
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 11:47:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5704282AEE
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 10:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 461FD17C98;
	Mon, 18 Nov 2024 10:47:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743A219413B
	for <linux-media@vger.kernel.org>; Mon, 18 Nov 2024 10:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731926848; cv=none; b=Too4iP5pkwca6nBYQpTMMd5KAZF8PGY9xlO3M5CRBFe8N4tgY90en3WWo9qZFpxQpRn9RCdkFgt+J1og1mIbr0kVDlIbcOCd5ca3JloSudigosw+6b+aM/kj5ypDDIaU8XJ+90J7sT4sIy84hHUYi9ruJ6FwPzmLFwobx/gU0x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731926848; c=relaxed/simple;
	bh=2ZYJYKTYfovbB4L1kx9gexhKFGA1ZJeKNRys2wgZDFQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=a5O+xmE4t5QiUGsDttPbomPROHkc7weLJoxQOy7Nu6sY/weKH6ME9EfxXGgT+/SKxEn33tz/4S6LTfQaIn0W4v5taLuoFEskhsbCNz9WDg7DEAzELunSlyl+X8O9LpIJBk3eeu/3f+B9/3bUe8cO7Q5LEglaWHMdtwPDPwxlk/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3a3c4554d29so17049045ab.1
        for <linux-media@vger.kernel.org>; Mon, 18 Nov 2024 02:47:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731926846; x=1732531646;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G64vNE+Dz+2awEnSqOeMPFFtWQcwTuaEK3/oD3t9tZo=;
        b=tvsyytusSvGQFoCduuAM+tBHyFWLo8YyIMi8RtW3vOZp/UypfRIUQ39GVwHYJEvv88
         q0YLsz3T3YBLx2kdhMkue11bEbGSSORgjvNaSd4ZUP0zgIgxyRSy079WuO8LX8+OFi/i
         raJz/w9JkDX4qx3+3tWYMFruUTXFxaf/v7R20XJSaNcY19WqSdGSmF36cEKO+J5FXunI
         /g1AstWWwL0GOuOLSSsgJLKRIgFX523fh315eRY3j0p8NTvNNLOGuqs0Ma3rISAMuKhc
         5EIEfUzg+oudmR+LG4eCa2sK2oR5bPKrOjY/OehFarxk06NQ5NHDAeApW981UEGHquxU
         xjJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeTie0Hhggx95UGel9mjL37PFKyMc6y6Ivi1d18q4JH2U5GAiYeb5PHc1cYrdy7ppj6JKJZpVoGwbD8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBJYxn5gVqFcHIigfuW4M5wdCLDabGBAfke+dMLKCiixh1NTcr
	mCsHt8xM7V+rYRN1P1HmS+iM3ZCPUUPFHwqOBepRfkkbqeCtBwLjEwjCYs+i6I1SePWqZuWT0u/
	RzFPsoXeGc1Xv5d9y/MzxyncZdaxvMfeqaxqsmgKDNBHcSksJcShBM0w=
X-Google-Smtp-Source: AGHT+IE0l6RP9Q+OdwdrF3JGFN+MKypDtpe10OL1UVJTIOKf33TQUzoUkGWAIUOepdYBopIhBYQoBvc1ZN/tKCLdA7HbPBNvVJDM
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c23:b0:3a7:6cd8:120c with SMTP id
 e9e14a558f8ab-3a76cd813demr15972255ab.4.1731926846641; Mon, 18 Nov 2024
 02:47:26 -0800 (PST)
Date: Mon, 18 Nov 2024 02:47:26 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <673b1b3e.050a0220.87769.0031.GAE@google.com>
Subject: [syzbot] Monthly media report (Nov 2024)
From: syzbot <syzbot+list5a9a1a81d8075add9094@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello media maintainers/developers,

This is a 31-day syzbot report for the media subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/media

During the period, 0 new issues were detected and 0 were fixed.
In total, 20 issues are still open and 85 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  879     Yes   general protection fault in ir_raw_event_store_with_filter
                   https://syzkaller.appspot.com/bug?extid=34008406ee9a31b13c73
<2>  818     Yes   KASAN: use-after-free Read in em28xx_init_extension (2)
                   https://syzkaller.appspot.com/bug?extid=99d6c66dbbc484f50e1c
<3>  436     Yes   KASAN: use-after-free Read in v4l2_fh_open
                   https://syzkaller.appspot.com/bug?extid=b2391895514ed9ef4a8e
<4>  279     Yes   WARNING in usb_free_urb
                   https://syzkaller.appspot.com/bug?extid=b466336413a1fba398a5
<5>  247     No    INFO: rcu detected stall in dvb_usb_read_remote_control (2)
                   https://syzkaller.appspot.com/bug?extid=01926e7756f51c12b6a3
<6>  118     Yes   WARNING in smsusb_init_device/usb_submit_urb
                   https://syzkaller.appspot.com/bug?extid=85e3ddbf0ddbfbc85f1e
<7>  103     Yes   WARNING in smsusb_start_streaming/usb_submit_urb
                   https://syzkaller.appspot.com/bug?extid=12002a39b8c60510f8fb
<8>  54      No    KASAN: slab-use-after-free Read in em28xx_release_resources
                   https://syzkaller.appspot.com/bug?extid=16062f26c6480975e5ed
<9>  50      No    WARNING in call_s_stream
                   https://syzkaller.appspot.com/bug?extid=5bcd7c809d365e14c4df
<10> 4       Yes   KASAN: use-after-free Read in em28xx_close_extension (2)
                   https://syzkaller.appspot.com/bug?extid=a11c46f37ee083a73deb

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

