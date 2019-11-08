Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D32A3F5226
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2019 18:05:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729164AbfKHREU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Nov 2019 12:04:20 -0500
Received: from mail-il1-f199.google.com ([209.85.166.199]:55239 "EHLO
        mail-il1-f199.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728412AbfKHREN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Nov 2019 12:04:13 -0500
Received: by mail-il1-f199.google.com with SMTP id t67so7464319ill.21
        for <linux-media@vger.kernel.org>; Fri, 08 Nov 2019 09:04:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=fTH3wke3SUWD+KbdNuoh7OfY2dQXat+nLBYGUBMdbaU=;
        b=XUxM6yk33XMbt2is3O0oBqsyeXLkc6nvRPPRXwjr3DYM3gSgYpwkKtR3og7lrp644F
         Hy6xHSadql8cTT2txHOyFViocwHR4U80p4crEnxHUckHg8ttfqLHUdnderI18/OStNas
         aA0QuLGFoasB/3J4NDs7fibKZSkNfWWR3//grJ6c+7gjK/Bi/R05ffqhgABi3mu4FYxw
         YOb6cTC1Vf3NztOqdOmEF63PZk6uWhzR3579GMq8RhHMtpSGtgfKf7mQWiczSr++Wip7
         /H3AAYyDG8t3WcJTfg+4Dp5K/GoQvwKf/wkvB+XFtu+PjYjEDrgjR6kaW3w9XFHIepnH
         TlKQ==
X-Gm-Message-State: APjAAAUl+xnFA6IS9AgPch7SPQljrRJzOjVY6KaoSBScIen7S7BUcKJS
        PsWxK93y7C0eOLsJeeKiWPZbaqiQCG+lhX5NIVjXjBcD55cN
X-Google-Smtp-Source: APXvYqyO/1fM9FwvUsNBAdyyysHvJoiIBXREkWYTIkJi0hcr+2f1QziBzmK5bPqiaK3viqb9n95xokid5VJiBWcBysIkvN2qTsBg
MIME-Version: 1.0
X-Received: by 2002:a92:d64d:: with SMTP id x13mr13363985ilp.54.1573232650955;
 Fri, 08 Nov 2019 09:04:10 -0800 (PST)
Date:   Fri, 08 Nov 2019 09:04:10 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000004f3d820596d8c51c@google.com>
Subject: KMSAN: uninit-value in digitv_rc_query
From:   syzbot <syzbot+6bf9606ee955b646c0e1@syzkaller.appspotmail.com>
To:     glider@google.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    1e76a3e5 kmsan: replace __GFP_NO_KMSAN_SHADOW with kmsan_i..
git tree:       https://github.com/google/kmsan.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=16860a63600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f03c659d0830ab8d
dashboard link: https://syzkaller.appspot.com/bug?extid=6bf9606ee955b646c0e1
compiler:       clang version 9.0.0 (/home/glider/llvm/clang  
80fee25776c2fb61e74c1ecb1a523375c2500b69)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12c1101b600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15db3cfd600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+6bf9606ee955b646c0e1@syzkaller.appspotmail.com

dvb-usb: schedule remote query interval to 1000 msecs.
dvb-usb: Nebula Electronics uDigiTV DVB-T USB2.0) successfully initialized  
and connected.
dvb-usb: bulk message failed: -22 (7/0)
dvb-usb: bulk message failed: -22 (7/0)
dvb-usb: bulk message failed: -22 (7/-30591)
dvb-usb: bulk message failed: -22 (7/0)
=====================================================
BUG: KMSAN: uninit-value in legacy_dvb_usb_read_remote_control+0x106/0x790  
drivers/media/usb/dvb-usb/dvb-usb-remote.c:123
CPU: 1 PID: 3844 Comm: kworker/1:2 Not tainted 5.3.0-rc7+ #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: events legacy_dvb_usb_read_remote_control
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0x191/0x1f0 lib/dump_stack.c:113
  kmsan_report+0x13a/0x2b0 mm/kmsan/kmsan_report.c:108
  __msan_warning+0x73/0xe0 mm/kmsan/kmsan_instr.c:250
  digitv_rc_query+0x76a/0x890 drivers/media/usb/dvb-usb/digitv.c:259
  legacy_dvb_usb_read_remote_control+0x106/0x790  
drivers/media/usb/dvb-usb/dvb-usb-remote.c:123
  process_one_work+0x1572/0x1ef0 kernel/workqueue.c:2269
  worker_thread+0x111b/0x2460 kernel/workqueue.c:2415
  kthread+0x4b5/0x4f0 kernel/kthread.c:256
  ret_from_fork+0x35/0x40 arch/x86/entry/entry_64.S:355

Local variable description: ----key@digitv_rc_query
Variable was created at:
  digitv_rc_query+0x78/0x890 drivers/media/usb/dvb-usb/digitv.c:234
  legacy_dvb_usb_read_remote_control+0x106/0x790  
drivers/media/usb/dvb-usb/dvb-usb-remote.c:123
=====================================================
Kernel panic - not syncing: panic_on_warn set ...
CPU: 1 PID: 3844 Comm: kworker/1:2 Tainted: G    B             5.3.0-rc7+ #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: events legacy_dvb_usb_read_remote_control
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0x191/0x1f0 lib/dump_stack.c:113
  panic+0x3c9/0xc1e kernel/panic.c:219
  kmsan_report+0x2a2/0x2b0 mm/kmsan/kmsan_report.c:131
  __msan_warning+0x73/0xe0 mm/kmsan/kmsan_instr.c:250
  digitv_rc_query+0x76a/0x890 drivers/media/usb/dvb-usb/digitv.c:259
  legacy_dvb_usb_read_remote_control+0x106/0x790  
drivers/media/usb/dvb-usb/dvb-usb-remote.c:123
  process_one_work+0x1572/0x1ef0 kernel/workqueue.c:2269
  worker_thread+0x111b/0x2460 kernel/workqueue.c:2415
  kthread+0x4b5/0x4f0 kernel/kthread.c:256
  ret_from_fork+0x35/0x40 arch/x86/entry/entry_64.S:355
Kernel Offset: disabled
Rebooting in 86400 seconds..


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
