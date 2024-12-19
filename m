Return-Path: <linux-media+bounces-23830-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D4ED79F8373
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 19:41:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2EA847A2A58
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 18:41:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C7451AA1CB;
	Thu, 19 Dec 2024 18:40:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0101D1A4F09
	for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 18:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734633623; cv=none; b=q0XCjcFHLltsrFmVw7wB3K8RD/A3LSfxvTVD1oLq7KyhysRBLR5boPC3CNf4Xvup5L5w5/gVD+f1hE7BimTIAcNpbuchVyASsCjh51SpCnvOIMySwtoYMSVwJ6K5bxfSmlAJ1yEliE7RkP1cqaJFdCFvTfs3gsCh3EPhWyO71qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734633623; c=relaxed/simple;
	bh=Au3GYydDjwdnm2qC53ZM2ZR5/dtw2rRIWuOjs4smmqk=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=YxCIg9BFBD5utcVc6GoYAN5PCaJVyCxvZKHPvzM08CGO+W4/Oz6EXxNaQSKrVVjt2QrB8FEvbFYoEywZnlcT6QiSLkogZ5Bz/21Dt1Hpg7K6WkRLV27pXEhj18CirIstjILTgRaL6gyYDN7bfPgbkUAJZin37w3rKWewaI1nWY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-844d2a7ef6dso183368339f.0
        for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 10:40:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734633621; x=1735238421;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6bEl9uZfHjAOtE1qsS1QfjVtDO+8gzSFagXHOHxJH+A=;
        b=e4JuljfRAl9BInZW9Wgq1Hc14GZx9X/P4CCjtmGzowYWctQqOwXJemAfxIuJezQqRv
         tXY5h0oaIoBO1RPK0NSoKLyLtv/sFjP1aVfoNA/DDdQoTWmf4rn3UMja23QArfSdoR0m
         mK2N2/F617e6F4VR5X8sR7pCMVWSL90gnDGImaSbGCbNzMGBcBWd7m9lHdp7Ei+XsCZw
         7tVswYGd5YHBS7XF5ruF07emvR9EATQRKbQBdFo6+jQe8rTY3VU7njR3/WkiT2nN/P+2
         ryAQp4jM1rxOeTlVe+yjSO2meUQ2kbpWW9E2yPcZEqbcMUBz3tWzV6AW1n1hSAw/5iw1
         Xu0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWQQv6VaBrIj8pN5jVmZzRo+2+Otuyc98VLZKmroVUQhmir2C9to5Lr+e2hPU9oRanUk0p8MZF5zMjHmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGUu8k1TajzFVZG0yQVadlfYE9H3f/6TEPrbu0SB8lNnr9mZvU
	Ahsh05LhYuKaxkfgBI2a/kwLM0HA9NrVq3JS7XXuzSXHpL5X489cqjOvw8kFyC802mrg4gCy4fD
	h+sn3KA+VPbNiboCDseOBI+22DWvHAklcULqMaX+S8rQ7lMgZfCgiRoA=
X-Google-Smtp-Source: AGHT+IFr6kzQL/weql3rtLMKCOJPb1uWFgZB4kUDlcbLZVDBy8sPHFHN2+luLSLQ7J8LQkUsDWRhq9NAPkZvNzGLZ5NbSHSFxhEK
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:6d05:b0:83b:2b89:a14e with SMTP id
 ca18e2360f4ac-847586090ddmr787215939f.13.1734633621193; Thu, 19 Dec 2024
 10:40:21 -0800 (PST)
Date: Thu, 19 Dec 2024 10:40:21 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67646895.050a0220.1dcc64.0022.GAE@google.com>
Subject: [syzbot] Monthly media report (Dec 2024)
From: syzbot <syzbot+list0320ed60c34cf769be3e@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello media maintainers/developers,

This is a 31-day syzbot report for the media subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/media

During the period, 0 new issues were detected and 0 were fixed.
In total, 20 issues are still open and 87 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  879     Yes   general protection fault in ir_raw_event_store_with_filter
                   https://syzkaller.appspot.com/bug?extid=34008406ee9a31b13c73
<2>  636     Yes   KASAN: use-after-free Read in v4l2_fh_open
                   https://syzkaller.appspot.com/bug?extid=b2391895514ed9ef4a8e
<3>  336     Yes   WARNING in usb_free_urb
                   https://syzkaller.appspot.com/bug?extid=b466336413a1fba398a5
<4>  136     Yes   WARNING in smsusb_init_device/usb_submit_urb
                   https://syzkaller.appspot.com/bug?extid=85e3ddbf0ddbfbc85f1e
<5>  112     No    KASAN: slab-use-after-free Read in em28xx_release_resources
                   https://syzkaller.appspot.com/bug?extid=16062f26c6480975e5ed
<6>  106     Yes   WARNING in smsusb_start_streaming/usb_submit_urb
                   https://syzkaller.appspot.com/bug?extid=12002a39b8c60510f8fb
<7>  30      No    KASAN: vmalloc-out-of-bounds Write in tpg_fill_plane_buffer (3)
                   https://syzkaller.appspot.com/bug?extid=365005005522b70a36f2
<8>  6       Yes   WARNING in iguanair_get_features/usb_submit_urb
                   https://syzkaller.appspot.com/bug?extid=e3ae1e7f4b88f3e696f5
<9>  4       Yes   KASAN: use-after-free Read in em28xx_close_extension (2)
                   https://syzkaller.appspot.com/bug?extid=a11c46f37ee083a73deb
<10> 1       Yes   KASAN: slab-use-after-free Read in v4l2_release
                   https://syzkaller.appspot.com/bug?extid=6b52c2b24e341804a58c

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

