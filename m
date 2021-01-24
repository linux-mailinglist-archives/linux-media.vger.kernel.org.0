Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A07C301F29
	for <lists+linux-media@lfdr.de>; Sun, 24 Jan 2021 23:19:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbhAXWSR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Jan 2021 17:18:17 -0500
Received: from latitanza.investici.org ([82.94.249.234]:29481 "EHLO
        latitanza.investici.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726627AbhAXWSN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Jan 2021 17:18:13 -0500
X-Greylist: delayed 466 seconds by postgrey-1.27 at vger.kernel.org; Sun, 24 Jan 2021 17:18:11 EST
Received: from mx3.investici.org (unknown [127.0.0.1])
        by latitanza.investici.org (Postfix) with ESMTP id 4DP6c35ptdz8sjX;
        Sun, 24 Jan 2021 22:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=privacyrequired.com;
        s=stigmate; t=1611526179;
        bh=5OVoJhUY4tcoUETJG2FYW3/gkszVfEVklx9aoVzXf8w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fm9wOqYbDkGJ+YmNfwa+2nvUs4Ykxew8lsTBlCdL9WlzBCa56d3uJ8Usc9kmjJfPq
         CiSCDXAsr8dkOfAGZ6lWCKu5AC/UfshJcys8yMS98elyjK6JRChprZ4rpIXD14bZPZ
         GncOckaSPfV9cTq+6yx1Ghi3ufkTp/Fg0JtTUJUE=
Received: from [82.94.249.234] (mx3.investici.org [82.94.249.234]) (Authenticated sender: laniel_francis@privacyrequired.com) by localhost (Postfix) with ESMTPSA id 4DP6c30R8Lz8shx;
        Sun, 24 Jan 2021 22:09:38 +0000 (UTC)
From:   Francis Laniel <laniel_francis@privacyrequired.com>
To:     linux-kernel@vger.kernel.org
Cc:     syzbot <syzbot+42d8c7c3d3e594b34346@syzkaller.appspotmail.com>,
        ezequiel@collabora.com, hverkuil-cisco@xs4all.nl,
        jacopo@jmondi.org, linux-media@vger.kernel.org, mchehab@kernel.org,
        syzkaller-bugs@googlegroups.com
Subject: Re: UBSAN: shift-out-of-bounds in std_validate
Date:   Sun, 24 Jan 2021 23:09:21 +0100
Message-ID: <2986427.cCGCOdEktJ@machine>
In-Reply-To: <000000000000f1136d05b9452773@google.com>
References: <000000000000f1136d05b9452773@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mardi 19 janvier 2021, 19:39:17 CET syzbot a =E9crit :
> Hello,
>=20
> syzbot found the following issue on:
>=20
> HEAD commit:    1e2a199f Merge tag 'spi-fix-v5.11-rc4' of git://git.kerne=
l..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D146e0c94d00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D41e68e7e8a23a=
d09
> dashboard link: https://syzkaller.appspot.com/bug?extid=3D42d8c7c3d3e594b=
34346
> compiler:       gcc (GCC) 10.1.0-syz 20200507
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D12166d58d00=
000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D14dfc294d00000
>=20
> IMPORTANT: if you fix the issue, please add the following tag to the comm=
it:
> Reported-by: syzbot+42d8c7c3d3e594b34346@syzkaller.appspotmail.com
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> =3D=3D=3D=3D UBSAN: shift-out-of-bounds in
> drivers/media/v4l2-core/v4l2-ctrls.c:2168:36 shift exponent 100 is too
> large for 64-bit type 'long long unsigned int' CPU: 0 PID: 8469 Comm:
> syz-executor534 Not tainted 5.11.0-rc4-syzkaller #0 Hardware name: Google
> Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011 Call
> Trace:
>  __dump_stack lib/dump_stack.c:79 [inline]
>  dump_stack+0x107/0x163 lib/dump_stack.c:120
>  ubsan_epilogue+0xb/0x5a lib/ubsan.c:148
>  __ubsan_handle_shift_out_of_bounds.cold+0xb1/0x181 lib/ubsan.c:395
>  std_validate.cold+0x19/0x1e drivers/media/v4l2-core/v4l2-ctrls.c:2168
>  validate_new drivers/media/v4l2-core/v4l2-ctrls.c:2477 [inline]
>  set_ctrl+0x207/0x4a0 drivers/media/v4l2-core/v4l2-ctrls.c:4425
>  set_ctrl_lock drivers/media/v4l2-core/v4l2-ctrls.c:4448 [inline]
>  v4l2_s_ctrl+0x2fd/0x4f0 drivers/media/v4l2-core/v4l2-ctrls.c:4469
>  v4l_s_ctrl+0x324/0x390 drivers/media/v4l2-core/v4l2-ioctl.c:2253
>  __video_do_ioctl+0xb94/0xe20 drivers/media/v4l2-core/v4l2-ioctl.c:2993
>  video_usercopy+0x23d/0x12d0 drivers/media/v4l2-core/v4l2-ioctl.c:3345
>  v4l2_ioctl+0x1b3/0x250 drivers/media/v4l2-core/v4l2-dev.c:360
>  vfs_ioctl fs/ioctl.c:48 [inline]
>  __do_sys_ioctl fs/ioctl.c:753 [inline]
>  __se_sys_ioctl fs/ioctl.c:739 [inline]
>  __x64_sys_ioctl+0x193/0x200 fs/ioctl.c:739
>  do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
>  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> RIP: 0033:0x443ee9
> Code: 18 89 d0 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 48 89 f8 48 89 f7
> 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff
> ff 0f 83 fb d7 fb ff c3 66 2e 0f 1f 84 00 00 00 00 RSP:
> 002b:00007ffe02e7df08 EFLAGS: 00000246 ORIG_RAX: 0000000000000010 RAX:
> ffffffffffffffda RBX: 00000000004002e0 RCX: 0000000000443ee9
> RDX: 0000000020000140 RSI: 00000000c008561c RDI: 0000000000000003
> RBP: 00000000006ce018 R08: 0000000000000000 R09: 00000000004002e0
> R10: 000000000000000f R11: 0000000000000246 R12: 0000000000401b70
> R13: 0000000000401c00 R14: 0000000000000000 R15: 0000000000000000
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> =3D=3D=3D=3D
>=20
>=20
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>=20
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> syzbot can test patches for this issue, for details see:
> https://goo.gl/tpsmEJ#testing-patches

Hi everyone.


=46irst, I hope you are fine and the same for your relative.

I took a look at this bug, unfortunately I do not come with a solution as I=
=20
lack some background on V4L2.

=46irst, I successfully reproduced the bug with the given test and configur=
ation=20
inside a virtual machine.
=46rom my understanding, the test do an ioctl with the flag VIDIOC_S_CTRL a=
nd the=20
value 100 as argument.
Inside the std_validate() function, ctrl->maximum is 110 as it corresponds =
to=20
this line inside the vivid_create_controls() function:
vivid_ctrl_dv_timings.max =3D dev->query_dv_timings_size - 1;
dev->query_dv_timings_size is set inside vivid_init_dv_timings() based on t=
he=20
v4l2_dv_timings_presets[] which contains 110 values.

As a solution, I suggest to change the type of menu_skip_mask inside the=20
struct v4l2_ctrl and replacing it with a bitmap.
Indeed, the above value has 110 "menus", so the 64 bits inside menu_skip_ma=
sk=20
are too few.
This change needs a bit of work as all the usage of menu_skip_mask will nee=
d=20
to be adapted to the bitmap API.
Unfortunately, I am not sure this solution is the good one so this I why I =
did=20
not implement it.

If someone also looked at this bug and has some feedback I will be happy to=
=20
hear from it.


Best regards.


