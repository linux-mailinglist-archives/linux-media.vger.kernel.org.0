Return-Path: <linux-media+bounces-49635-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C6832CE6628
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 11:38:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5209A30081AD
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 10:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91EA92E8B78;
	Mon, 29 Dec 2025 10:38:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFBB19D065
	for <linux-media@vger.kernel.org>; Mon, 29 Dec 2025 10:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767004700; cv=none; b=aFnrKqT8mwDVrmiYcipQBYecZSNxt5HtRAxjMn+unHLum9Z8KG0nW6Jxd17XPx+iWA3pWP+n/NigmWs2Agmb5o9i1x9X26sOj4JUIvQn6XR92SS4TWkCW/52fqKtTKfph4cjgEpLwVSSVO8ZlwNA36LSOJBOTuFrItCXORYsimA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767004700; c=relaxed/simple;
	bh=OgDvWJUyRSHealpz/ILsC/iyq8o3PFbvbn5NHr1C4hU=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=QW4nbVfVfSTV3neSbj52w6Yb45zuNxWZZ9op54utVqrDLAp48tbum1dvSuzxdCxwpuk3d8uUeXMi58ryJujPKbSDL7C636shPteR1e5mMEvGLpuinCxlgjQvmr5AgO3qHm/imYqLXX8KADZIT/SEoLqmvwPgHe8XHuXtc8EF+Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6597c514eddso4247226eaf.1
        for <linux-media@vger.kernel.org>; Mon, 29 Dec 2025 02:38:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767004697; x=1767609497;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qtyVq84hrINOFMrQUY/6Ez1VWPYnjr6Z+3WuyIg3rJU=;
        b=gy4i9bPBPg8VJiZD6XdqPXe/MzXosWyfNFa07E5ePcyQHHyzlaMnoP1MgnPAEU80wY
         aNKntg3F/9G8pC2ZWX48rHVQ4n9YDNCL4tKeRRq4Gz7mZ6/sg5hd6hpI+LKON63g6AKV
         xMogfrV2aph/X/F780lBrZ3iRS36SlIAyaNfB0r+8W2GloWNczr982bK0ttBxZ0HM1sG
         U07vuyBCpF69plhibGCJl9FvsefRejV4EUodGCA+dpttNi2jHSSHnr92Jz2ymmof1RsK
         fiX1Iik2jn5xgaQpWQdzNmj64z+KpxFH01OpXxm+F0XFtu6KMn7FUZC2uYZAh5CAUE3C
         lO9w==
X-Forwarded-Encrypted: i=1; AJvYcCXnObsoXcWxKklCpwTOkXwRe5pn4+Cgds2mXvy3b+ax8wI19ejCWToxK5owGBfbxbTbQgn3l6SlaEyMXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzN7CHxhVuIvEDNYQ6P6N0qsiXYoVobs5cFzftB48zvN7kmIkU4
	vzMr5LvzMZglfoD8HPpS6uLUVxMLG/FQJ6AhKQn4QPBHDHl8Unc9Aa5BrSnPbUN9ypKTyb7fnKB
	mkXSiKTMwuDM2S6RTCi41569l2f090XIlubcHWBx2sR7dttUzwMm7d/dO+7E=
X-Google-Smtp-Source: AGHT+IEmsI1W3ELZTUoyXjiSkZ4U9OscESBOVw04JYrHpSnLNn1k0QBaJdZcJnzz5K4HLy7842PvFxadqVRc0mcu4A01i0+gPQqp
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:812:b0:65b:8574:2e86 with SMTP id
 006d021491bc7-65d0e99a5dfmr11747075eaf.31.1767004697761; Mon, 29 Dec 2025
 02:38:17 -0800 (PST)
Date: Mon, 29 Dec 2025 02:38:17 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69525a19.a70a0220.90d62.003c.GAE@google.com>
Subject: [syzbot] Monthly media report (Dec 2025)
From: syzbot <syzbot+list1c947c73c65d637445fa@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello media maintainers/developers,

This is a 31-day syzbot report for the media subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/media

During the period, 1 new issues were detected and 0 were fixed.
In total, 22 issues are still open and 100 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  6726    Yes   KASAN: use-after-free Read in v4l2_fh_init
                   https://syzkaller.appspot.com/bug?extid=c025d34b8eaa54c571b8
<2>  4189    Yes   WARNING in usb_free_urb
                   https://syzkaller.appspot.com/bug?extid=b466336413a1fba398a5
<3>  3196    Yes   KASAN: use-after-free Read in v4l2_fh_open
                   https://syzkaller.appspot.com/bug?extid=b2391895514ed9ef4a8e
<4>  1413    Yes   KASAN: use-after-free Read in em28xx_init_extension (2)
                   https://syzkaller.appspot.com/bug?extid=99d6c66dbbc484f50e1c
<5>  519     Yes   KASAN: slab-use-after-free Read in dvb_device_open
                   https://syzkaller.appspot.com/bug?extid=1eb177ecc3943b883f0a
<6>  438     No    KASAN: slab-use-after-free Read in em28xx_release_resources
                   https://syzkaller.appspot.com/bug?extid=16062f26c6480975e5ed
<7>  423     Yes   WARNING in smsusb_init_device/usb_submit_urb
                   https://syzkaller.appspot.com/bug?extid=85e3ddbf0ddbfbc85f1e
<8>  140     Yes   general protection fault in su3000_i2c_transfer
                   https://syzkaller.appspot.com/bug?extid=d99f3a288cc7d8ef60fb
<9>  94      Yes   general protection fault in dvb_usbv2_generic_write
                   https://syzkaller.appspot.com/bug?extid=f9f5333782a854509322
<10> 93      No    KASAN: vmalloc-out-of-bounds Write in tpg_fill_plane_buffer (4)
                   https://syzkaller.appspot.com/bug?extid=dac8f5eaa46837e97b89

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

