Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8BBC2FC24D
	for <lists+linux-media@lfdr.de>; Tue, 19 Jan 2021 22:30:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728031AbhASSoh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Jan 2021 13:44:37 -0500
Received: from mail-io1-f70.google.com ([209.85.166.70]:34323 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391595AbhASSj6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Jan 2021 13:39:58 -0500
Received: by mail-io1-f70.google.com with SMTP id r16so37119583ioa.1
        for <linux-media@vger.kernel.org>; Tue, 19 Jan 2021 10:39:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=WdkBn9riwIbRJJ+uSYY9Jvm7Ton9pmCnypyx0bUimvQ=;
        b=kKglrpjdhNP23q+gerk/RXAFy/tmb4NwKMI8Jvva86tljIgljjtgkuftu1xneQvXMv
         eix+TfhexK33jgJ4iaOseg8lzv+Bvm5AgVJEu/YHzhoFzHdF89vM+ywwX5jTmOYFjCVM
         nxDnjsbqr529kar/KloKMmCS2bXCq5bG8S0dTszVmhvH5Smfb3I1sdZIQs5HHwtpnB23
         T/jDb89fofZfn1M0v/H53NF/kdezdGEMAj2i0A3n5pvrmaU9eFNCYG5OhlN+YX9hO124
         AKf+u2quyRy+sGGtWUgs9Zm489u4YvO9sy9mpYv+fWQU0p3buaEoVWj1yBF3YIT3N1S0
         Fcnw==
X-Gm-Message-State: AOAM532Gk7sYEVVpuL5RDALedLOfH0lRTNJ+zjxZNBMddVJOQtt6WixW
        bEZWYwnC+OzfIcgvb4TPPvq2+GQ/uUOr5hVoq9ePyJ0ngzz2
X-Google-Smtp-Source: ABdhPJxa3gLsf9Z4xg5RCxUHvK2/e6vpqujSQ54YT4qMV/IbyZxynsLQLJvLPM2M4NB1H6/PP91l9uoSyXLCWU+FlQFgn+AstOTy
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:c25:: with SMTP id q5mr4535832ilg.286.1611081557543;
 Tue, 19 Jan 2021 10:39:17 -0800 (PST)
Date:   Tue, 19 Jan 2021 10:39:17 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f1136d05b9452773@google.com>
Subject: UBSAN: shift-out-of-bounds in std_validate
From:   syzbot <syzbot+42d8c7c3d3e594b34346@syzkaller.appspotmail.com>
To:     ezequiel@collabora.com, hverkuil-cisco@xs4all.nl,
        jacopo@jmondi.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    1e2a199f Merge tag 'spi-fix-v5.11-rc4' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=146e0c94d00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=41e68e7e8a23ad09
dashboard link: https://syzkaller.appspot.com/bug?extid=42d8c7c3d3e594b34346
compiler:       gcc (GCC) 10.1.0-syz 20200507
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12166d58d00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14dfc294d00000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+42d8c7c3d3e594b34346@syzkaller.appspotmail.com

================================================================================
UBSAN: shift-out-of-bounds in drivers/media/v4l2-core/v4l2-ctrls.c:2168:36
shift exponent 100 is too large for 64-bit type 'long long unsigned int'
CPU: 0 PID: 8469 Comm: syz-executor534 Not tainted 5.11.0-rc4-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:79 [inline]
 dump_stack+0x107/0x163 lib/dump_stack.c:120
 ubsan_epilogue+0xb/0x5a lib/ubsan.c:148
 __ubsan_handle_shift_out_of_bounds.cold+0xb1/0x181 lib/ubsan.c:395
 std_validate.cold+0x19/0x1e drivers/media/v4l2-core/v4l2-ctrls.c:2168
 validate_new drivers/media/v4l2-core/v4l2-ctrls.c:2477 [inline]
 set_ctrl+0x207/0x4a0 drivers/media/v4l2-core/v4l2-ctrls.c:4425
 set_ctrl_lock drivers/media/v4l2-core/v4l2-ctrls.c:4448 [inline]
 v4l2_s_ctrl+0x2fd/0x4f0 drivers/media/v4l2-core/v4l2-ctrls.c:4469
 v4l_s_ctrl+0x324/0x390 drivers/media/v4l2-core/v4l2-ioctl.c:2253
 __video_do_ioctl+0xb94/0xe20 drivers/media/v4l2-core/v4l2-ioctl.c:2993
 video_usercopy+0x23d/0x12d0 drivers/media/v4l2-core/v4l2-ioctl.c:3345
 v4l2_ioctl+0x1b3/0x250 drivers/media/v4l2-core/v4l2-dev.c:360
 vfs_ioctl fs/ioctl.c:48 [inline]
 __do_sys_ioctl fs/ioctl.c:753 [inline]
 __se_sys_ioctl fs/ioctl.c:739 [inline]
 __x64_sys_ioctl+0x193/0x200 fs/ioctl.c:739
 do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x443ee9
Code: 18 89 d0 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 0f 83 fb d7 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007ffe02e7df08 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00000000004002e0 RCX: 0000000000443ee9
RDX: 0000000020000140 RSI: 00000000c008561c RDI: 0000000000000003
RBP: 00000000006ce018 R08: 0000000000000000 R09: 00000000004002e0
R10: 000000000000000f R11: 0000000000000246 R12: 0000000000401b70
R13: 0000000000401c00 R14: 0000000000000000 R15: 0000000000000000
================================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
