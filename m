Return-Path: <linux-media+bounces-43232-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED894BA26BF
	for <lists+linux-media@lfdr.de>; Fri, 26 Sep 2025 07:15:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 004D44C85FB
	for <lists+linux-media@lfdr.de>; Fri, 26 Sep 2025 05:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B300278754;
	Fri, 26 Sep 2025 05:14:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DD2267714
	for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 05:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758863673; cv=none; b=qjnKvq9tS9ZgcPHNvdQv1//mOPwTnTaPKsm9wJtTUMsPBfhStXOLB5Rm1kQIyJ6sENc8Z2/Dz2RVL7lPfC8tGjJjqfkfg5jJSdPsOE9XrLrxNhb1Ou7DovBFPyA8ucIi0FzobsJJprRc8Pgl/uvemW77Mw/WkEE4jeEpZaKVP/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758863673; c=relaxed/simple;
	bh=Gshtz2z/i2bw1Yn3ONgiWOGEKP1MNvMtgcrJyMd4ASg=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=d6RURasTxheS37LXkgJkLTsy0bKDl5LvTzlXr02kUOumpKZkw2oEbDnwlMaqPUQPgXBipbxmmmR87H3EtBhr0LRltajmd8IHWzdijzIAXM1LK350pI8I00JJ35HM58YthhJVkThnbcbj7bSc0pzNNCCDY67wp1TFxMdYvrJ266c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-427811cad57so5342245ab.1
        for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 22:14:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758863671; x=1759468471;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NSoLIgg7SAsrrlCvI57+luems2jbp4nBxEIh+V8FP+I=;
        b=wS2/I9XZdN5o5Y1WCLNvNeYNRfYIPMwCeM6/s/S+GijM1Y4nFqpshhz0cI+0+oOwC7
         fnRHM8QlX5b2/WfWlYgmySF701UbykDRlX9HCVb5PZIBYrl6w32+mJd3BslY+q/wTpdT
         ML1qt82EF/ZPFJpYARA/PLMt4lxKJD3CYg5PIQLML9bya4izU5a9reKwNw/eoWqFSqxq
         g8uJlbrRWm/hbo8hl/zOYPu/AG32WZpPfT0O7wy4YFjrRyLzAo3eW+HENAp0bf0HnAYc
         L0+xxXVUD7dOtjCQQz9wZ8X6A+rbTV6tYmJZpKXW2vTUsbH8kMBGkopBMm0ltHm4mvoJ
         iCZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjkKmQr8L3OyX2lPzPYhtJipbV12hpXz1LMI65v/sV4qrSqApDfL/yRZvgOaS/2H2Jxchh5iFADZGuRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCbkn2GN7VebLklVijYkC+zqQXR+hs6aOnHy1GEZvFGgMGZoEi
	qdlRrvm/uCR9A7/3gQDVw0rTQ50qKB4ZIE4pRznIas+Y6kEkRyqB34HRrDMr/m4Q+1K648xrqoJ
	KSRztYklBMId2QdjGicB7e11rvD9/rVv7HZS5ge7EyNNxJm4jLMzga7hLv38=
X-Google-Smtp-Source: AGHT+IE+Mo0FloODfxgHOeGuVY0QdOCNBOiik8UZK5PmujDAiVVLnq9gwm0hwzhAUwWCyR0j6wNvmwMS2LeGOSw63zdQ1rCxmQvm
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:480b:b0:40d:e50a:35b0 with SMTP id
 e9e14a558f8ab-42595657a25mr96375145ab.32.1758863671354; Thu, 25 Sep 2025
 22:14:31 -0700 (PDT)
Date: Thu, 25 Sep 2025 22:14:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68d62137.050a0220.3390a8.0008.GAE@google.com>
Subject: [syzbot] Monthly media report (Sep 2025)
From: syzbot <syzbot+listc48ef16dfbc6e2df724e@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello media maintainers/developers,

This is a 31-day syzbot report for the media subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/media

During the period, 1 new issues were detected and 0 were fixed.
In total, 22 issues are still open and 96 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 381     No    KASAN: slab-use-after-free Read in em28xx_release_resources
                  https://syzkaller.appspot.com/bug?extid=16062f26c6480975e5ed
<2> 349     Yes   KASAN: slab-use-after-free Read in dvb_device_open
                  https://syzkaller.appspot.com/bug?extid=1eb177ecc3943b883f0a
<3> 59      Yes   general protection fault in su3000_i2c_transfer
                  https://syzkaller.appspot.com/bug?extid=d99f3a288cc7d8ef60fb
<4> 48      No    KASAN: slab-use-after-free Write in as102_release (2)
                  https://syzkaller.appspot.com/bug?extid=47321e8fd5a4c84088db
<5> 34      No    KASAN: vmalloc-out-of-bounds Write in tpg_fill_plane_buffer (4)
                  https://syzkaller.appspot.com/bug?extid=dac8f5eaa46837e97b89
<6> 11      Yes   WARNING in media_create_pad_link (2)
                  https://syzkaller.appspot.com/bug?extid=701fc9cc0cb44e2b0fe9
<7> 9       Yes   KASAN: use-after-free Read in em28xx_close_extension (2)
                  https://syzkaller.appspot.com/bug?extid=a11c46f37ee083a73deb
<8> 5       No    WARNING in az6007_i2c_xfer
                  https://syzkaller.appspot.com/bug?extid=a43c95e5c2c9ed88e966
<9> 1       No    KASAN: slab-use-after-free Write in dvb_device_put
                  https://syzkaller.appspot.com/bug?extid=d445a71e1c011b592c16

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

