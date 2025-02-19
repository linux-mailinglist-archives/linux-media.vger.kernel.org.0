Return-Path: <linux-media+bounces-26365-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB0AA3BE3A
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 13:35:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95FC51890FCA
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 12:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E9941E25E7;
	Wed, 19 Feb 2025 12:35:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12391DF26A
	for <linux-media@vger.kernel.org>; Wed, 19 Feb 2025 12:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739968524; cv=none; b=R+z5y0127wOOLa3EuN/BqahWHXUy7x+zCRpoJZmiYisBuDuy1uf2CDEfCMJaTxFOK3lXHvaph/WR/dgQ1kpwlLsBPc71SQLejWm/8zqyXpw6pcITSj7cMzy9SHkfp1u5hWd/GqYDYJNIKDncA2B0TKQZ7yf5M/C2YZQ/pgbKUrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739968524; c=relaxed/simple;
	bh=uNBj/ImDnKTGA+wH35E3FFPPbuFi6CN+GuHENEoMLAs=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=nKSI8R8I+EYNRyfMyw5wyhai3ORASpD6N6W/YAjWwpM4BURXXGc4FSZ5lJaNK/Y65VGUHvV2Cnrk+vyF3OPRFct8/uI4CHI9eiT8uSZzRi+aE8yGfGUxV4cieyHo56map4XQPIUmVOD5gyO4LTLwYyzVxvm4mHfNf0fOIc+yHwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3ce8dadfb67so47924905ab.1
        for <linux-media@vger.kernel.org>; Wed, 19 Feb 2025 04:35:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739968522; x=1740573322;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vA7AEMtbZSMQceuCW4kpr3lEV6x/Aal06ousZtj0ONE=;
        b=oeHpfbZ6fXjRbG1bMT1f8TxOznc850FhUs87kuZfT+J5WwNKimlmUz39KlYk0vyLz6
         kAIhBuQKDgyC2xAR4qQFaQ0OthmFmArf9uFmi35CK1jLFMRenmECvV9fwKuDu3mN2/xN
         FXS7hht3kXOw5v3ybuXIRucIJ+hdcz6J4O7ibgBzHTiX82TQJ2+QOocgin6yD/0w9AR/
         io8xwbHy3esO7z0GIK1B3A57NKJCt6fyfF1HauhfoIQrnBskKWzkI58/KpCaEtYvU0FV
         jEj3bkwJCo4QiQ9Q95wAO5F50lZgcKuNVtPm/Lv+pdIT4nS0PNOWpUFgxWZCOvbLr65J
         UfJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKDF/HuWW+pH5wFdFtZ/K2RqoLTslkf/URMCtY/C5Zi67UrBVuUa09yvh6jAGUmNE736/T8EAtkKzknA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfN3bQQzUBzsfTPXf7RuZCPXAvJTgZ3Rkj3eSgtW25gZ5pyEQk
	qRMhlIJkY55rraqP9h+0KHDySAnPLHFiJH8VzTIBesN+mTfXkI93bYF3CGcFmAKugi2sMLDKepW
	XPVI1oMl0PBj9pjD1+168IB29ETdWsc11DsL0PJq2Jy6bJc+sGekgh08=
X-Google-Smtp-Source: AGHT+IFRw8HELeRQsGdtJWhrL/jACe5r45N5MLtwpFk+FM2CQp5miKbmS+CJbnprHkpkj7RGeEMq3RFIdD/yigbXG6uxM+lFpy3Q
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1aaf:b0:3d2:a5a0:8afa with SMTP id
 e9e14a558f8ab-3d2b5296431mr33082065ab.6.1739968521806; Wed, 19 Feb 2025
 04:35:21 -0800 (PST)
Date: Wed, 19 Feb 2025 04:35:21 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67b5d009.050a0220.14d86d.00e4.GAE@google.com>
Subject: [syzbot] Monthly media report (Feb 2025)
From: syzbot <syzbot+listc61c465ecde303186fd7@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello media maintainers/developers,

This is a 31-day syzbot report for the media subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/media

During the period, 0 new issues were detected and 0 were fixed.
In total, 21 issues are still open and 91 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 544     Yes   WARNING in usb_free_urb
                  https://syzkaller.appspot.com/bug?extid=b466336413a1fba398a5
<2> 209     No    KASAN: slab-use-after-free Read in em28xx_release_resources
                  https://syzkaller.appspot.com/bug?extid=16062f26c6480975e5ed
<3> 193     Yes   WARNING in smsusb_init_device/usb_submit_urb
                  https://syzkaller.appspot.com/bug?extid=85e3ddbf0ddbfbc85f1e
<4> 126     Yes   WARNING in smsusb_start_streaming/usb_submit_urb
                  https://syzkaller.appspot.com/bug?extid=12002a39b8c60510f8fb
<5> 77      Yes   WARNING in call_s_stream
                  https://syzkaller.appspot.com/bug?extid=5bcd7c809d365e14c4df
<6> 62      Yes   KASAN: vmalloc-out-of-bounds Write in tpg_fill_plane_buffer (3)
                  https://syzkaller.appspot.com/bug?extid=365005005522b70a36f2
<7> 17      Yes   KASAN: slab-use-after-free Read in dvb_device_open
                  https://syzkaller.appspot.com/bug?extid=1eb177ecc3943b883f0a
<8> 4       Yes   KASAN: use-after-free Read in em28xx_close_extension (2)
                  https://syzkaller.appspot.com/bug?extid=a11c46f37ee083a73deb
<9> 3       No    general protection fault in dvb_usbv2_generic_write
                  https://syzkaller.appspot.com/bug?extid=f9f5333782a854509322

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

