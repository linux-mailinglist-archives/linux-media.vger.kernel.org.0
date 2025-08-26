Return-Path: <linux-media+bounces-41059-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE73B35511
	for <lists+linux-media@lfdr.de>; Tue, 26 Aug 2025 09:14:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F802177046
	for <lists+linux-media@lfdr.de>; Tue, 26 Aug 2025 07:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1177B2F659C;
	Tue, 26 Aug 2025 07:14:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CB1155322
	for <linux-media@vger.kernel.org>; Tue, 26 Aug 2025 07:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756192474; cv=none; b=nkfjyy3aURTyNWBFymLxKiNJ4AXKGh9SVpEgkocGSg2cJovz323fPBwrJEtegpzxsV17pGrMTInImeKOe5b5rCe2Nk9hZfITgbBddFOJzDPzl5hRjTw02gqiadleyznC8QBNDm30pmz720XvjXurKGE5fMJntzwUWzOiD67KVm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756192474; c=relaxed/simple;
	bh=GEs+opGn8331c4PiPhRHAxrBOtHlP3VG45cSNShKl5k=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=bA5P+YKixZOWav9zIX/+Z4BmggtZHcTcQtE3O9rD94M6AGwRLkaYHb0sT5iIMUmpAdcmqd/xrr8yKmrVYmMTOOb5WIp+x4tJQvcB35sdVLYMiL8YJaHEsxmRjn94nZeZ52wuWfsKkYjBAKMBa1/ZR9yPIsXp1OOCwnG9fKB7DKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-88432d8ddb1so513510639f.1
        for <linux-media@vger.kernel.org>; Tue, 26 Aug 2025 00:14:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756192472; x=1756797272;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EIS3KzpbB5EOefn6RkDMRGNPbYPh9SwSUhXZC4mDvPI=;
        b=vFrSwyzZ+KuFImC+4dPj3h1a8zLfYPv4BxT3h3mFiYFB8UO+pV4tuiaf54iK5gXs40
         ucEXjlKBxAXRiDcCBfMoUNr5YjI1eWQ7DkbLyMu6PYSw4IY2hPw1ZpZyScSb3hCwuGir
         k+0VX1FVLULPhGzM+AQA1FZFyLTYaW+Wr+h2xbhz7N650gwsNsoaJLM0w4xuyNEwgowh
         fipW5WXpC7KD/rp5ZYWKXi48n/NnQ6sEmFkxIaHz3hM21Og5c1rqi1SDe1+6mT4f0gZD
         +iGYTONwR0QQRmDdFX2wgTYDvT5umsYTisfr3LAhqR3YD2uIzk9U1TRuvoZxDzOKUtjM
         ktrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEOsmVKvuVqWv1jNzRXRIvSmt1eEcn6YFMv/dZGrHZuZ0aiAEC4Cx6mNKiNC34Rkrn23l8X3ljOgudUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyUSbMQMTsEvYOCUcjfO0Of0O+AUnJXMLOmUSWri2ceQXpLrBT
	eSZfqx0/QGkZ01zipcdT8DquAIkbov8HfeGil60zRpG999lxn777a/IlBjpzW+y3aJ4HJGNfjNM
	7fk70RK+w4qhVsydsCP+AKxeuxe431GJ0XCR0gFM/ViSmPK0vXt8QPlHFY2Q=
X-Google-Smtp-Source: AGHT+IG+XkNNvl86GIWEOFvAl1lvuX+rDfOCQ4m47CfItuZ4mdORa8C2RBY9A3rg8zSUYWyX9CuM5zeIYpWINw/J1qbutGSVHu3P
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2142:b0:3ea:b64e:6da0 with SMTP id
 e9e14a558f8ab-3eab64e6fd6mr134647085ab.23.1756192472536; Tue, 26 Aug 2025
 00:14:32 -0700 (PDT)
Date: Tue, 26 Aug 2025 00:14:32 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68ad5ed8.050a0220.37038e.00b1.GAE@google.com>
Subject: [syzbot] Monthly media report (Aug 2025)
From: syzbot <syzbot+list1b1949acf52edc8a00fb@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello media maintainers/developers,

This is a 31-day syzbot report for the media subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/media

During the period, 2 new issues were detected and 0 were fixed.
In total, 21 issues are still open and 96 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 360     No    KASAN: slab-use-after-free Read in em28xx_release_resources
                  https://syzkaller.appspot.com/bug?extid=16062f26c6480975e5ed
<2> 237     Yes   KASAN: slab-use-after-free Read in dvb_device_open
                  https://syzkaller.appspot.com/bug?extid=1eb177ecc3943b883f0a
<3> 173     Yes   WARNING in smsusb_start_streaming/usb_submit_urb
                  https://syzkaller.appspot.com/bug?extid=12002a39b8c60510f8fb
<4> 48      Yes   general protection fault in dvb_usbv2_generic_write
                  https://syzkaller.appspot.com/bug?extid=f9f5333782a854509322
<5> 17      No    KASAN: vmalloc-out-of-bounds Write in tpg_fill_plane_buffer (4)
                  https://syzkaller.appspot.com/bug?extid=dac8f5eaa46837e97b89
<6> 9       Yes   WARNING in media_create_pad_link (2)
                  https://syzkaller.appspot.com/bug?extid=701fc9cc0cb44e2b0fe9
<7> 5       Yes   BUG: corrupted list in az6007_i2c_xfer
                  https://syzkaller.appspot.com/bug?extid=0192952caa411a3be209

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

