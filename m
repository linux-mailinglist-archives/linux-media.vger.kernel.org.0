Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6090D133EAC
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2020 10:55:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727112AbgAHJz1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jan 2020 04:55:27 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:49271 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726368AbgAHJz0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jan 2020 04:55:26 -0500
Received: from mail-qt1-f182.google.com ([209.85.160.182]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MXY2T-1jCYVO0vVP-00YxTQ; Wed, 08 Jan 2020 10:55:25 +0100
Received: by mail-qt1-f182.google.com with SMTP id d18so2264848qtj.10;
        Wed, 08 Jan 2020 01:55:24 -0800 (PST)
X-Gm-Message-State: APjAAAXjPV+LuMXKZJVgbbu5n3uSpVnja2xh0QJwT/RnspWETK+nO4FB
        ydo4zqCUDsayO1w/6X4Xq8I8b+HHJk1TbSylM28=
X-Google-Smtp-Source: APXvYqzZ4E/Mxtrm/qyVNONW/bkGOAcWySLIXMftV/alStlaSwl/182mhgMCjp3pcciUUdD1F+IDP5XDWrZ9nLueZQQ=
X-Received: by 2002:ac8:709a:: with SMTP id y26mr2757041qto.304.1578477324043;
 Wed, 08 Jan 2020 01:55:24 -0800 (PST)
MIME-Version: 1.0
References: <000000000000a185d8059b9d94be@google.com>
In-Reply-To: <000000000000a185d8059b9d94be@google.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 8 Jan 2020 10:55:07 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1TJ7g-He8R8sm_y_SJTfG_mT1tCHPtAOE-=KmMNgcB1A@mail.gmail.com>
Message-ID: <CAK8P3a1TJ7g-He8R8sm_y_SJTfG_mT1tCHPtAOE-=KmMNgcB1A@mail.gmail.com>
Subject: Re: KASAN: user-memory-access Write in video_usercopy
To:     syzbot <syzbot+54fd8cca4b7226c94b8e@syzkaller.appspotmail.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:7wtSXGztQ3d6CBG97tJCDEpCdJcFWGd9eb2ESe62TTGjIV3Yy07
 Od8+XTkC4F1ya4oXiJHmi+nCU0fGDXRAJu1FfQTjVgec2azX/1z7qqBcT5TX7L7S4wuO26m
 Br7GUn3WFVmdcZp0SuD8zqq4z1Xr37BWaISl5CRDTG2vTY+dWrLm88MyQuks3+ibhp//zV/
 TNXSA6FDbn486tV/FrZ9g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:7xk7CMgmFOw=:wH3XYOnGl8hjUaInW7qzsT
 bcySqZJ1NKauAUbFKsDlyA28IikVoXD7JVanjVymVgj3yf8djmYkspn/40bivfJXzGyu++NBv
 WkiH7b6e426TDzTXr4D/7dm3iTajMY6O5V3mGXCAE4Ttlru4qPlTE9qKkFFZR6As9PrIv6IeA
 K3knMn1v0hbxheXQ4+6r/0Ytf+R5D+XKoTb+xA9gTmt7GYBtdiA1S8cuuVww0GieYL+uvecET
 eqGlOCNh1zrDHnpAdgSEjL0zxZfbFENcgWqZY5up4h+wU6J/mw0gkZRY9ts+MvYrRFjv63oE6
 y+wxyuwvcUqYQvWiBRXg05I1tnOpOnr2ff1U2E91nhDlbXs0jM3bNQcKcDakL+eDbhsMyT/eA
 z9VWniZVgJkpU6P4Ujmdh/jq0qcQLkQT5eN5wfCmojGDbXjXkyd/m8L6IaHqeyw92US7k0iEr
 x8MAkKuuO+ClNvEVtZ6NH6lEiNWc9tCIYQA6HbMqMRLQizU65YphQNS4l/mr6zJRTeCZEklNS
 KVva+yp/YjXgd+q/nUESgved3zHKzBI7vC55juKVxoKU6OrW4+A8JYW43cmsz6R/R5u9YDLTs
 M8XneiDkDcpwzgGJwSPuTvuklz51sYzbnJe9nNfWLp60MkNeevIcHp4OWvydHiWoB+R9JEVSJ
 UB82Ug1d7ffISHfUCXXc8tu51cMrlfP52/5KmZDxkO+rRFhl8/Watot3KHkSyOAmbDCv05Fkk
 OElmncuyJLQSG7ae3eZBmtXKDFtYEn8/eeJvr6HXsJd3Ds42ePz8EPse75JSKLkcX5E6fGuDx
 9ubCYCjGjdNVAgEijlt2ZRFW83TLfqORY2wHiinLbHlrfred+CTO1wfmK7K6ylVL++DHOVqVU
 854W3pl839/veyIFumkQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 8, 2020 at 10:33 AM syzbot
<syzbot+54fd8cca4b7226c94b8e@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following crash on:
>
> HEAD commit:    26467385 Add linux-next specific files for 20200107
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=10d44076e00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=2265a716722be976
> dashboard link: https://syzkaller.appspot.com/bug?extid=54fd8cca4b7226c94b8e
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
>
> Unfortunately, I don't have any reproducer for this crash yet.
>
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+54fd8cca4b7226c94b8e@syzkaller.appspotmail.com
>
> ==================================================================
> BUG: KASAN: user-memory-access in memset include/linux/string.h:411 [inline]
> BUG: KASAN: user-memory-access in video_get_user+0x67f/0x890
> drivers/media/v4l2-core/v4l2-ioctl.c:3053
> Write of size 512 at addr 00000000200001c0 by task syz-executor.2/1523

Confirmed and prepared a patch. Great find, this was a really nasty bug.

      Arnd

> CPU: 1 PID: 1523 Comm: syz-executor.2 Not tainted
> 5.5.0-rc5-next-20200107-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
> Google 01/01/2011
> Call Trace:
>   __dump_stack lib/dump_stack.c:77 [inline]
>   dump_stack+0x197/0x210 lib/dump_stack.c:118
>   __kasan_report.cold+0x5/0x32 mm/kasan/report.c:510
>   kasan_report+0x12/0x20 mm/kasan/common.c:641
>   check_memory_region_inline mm/kasan/generic.c:185 [inline]
>   check_memory_region+0x134/0x1a0 mm/kasan/generic.c:192
>   memset+0x24/0x40 mm/kasan/common.c:108
>   memset include/linux/string.h:411 [inline]
>   video_get_user+0x67f/0x890 drivers/media/v4l2-core/v4l2-ioctl.c:3053
>   video_usercopy+0x21f/0x10b0 drivers/media/v4l2-core/v4l2-ioctl.c:3210
>   video_ioctl2+0x2d/0x35 drivers/media/v4l2-core/v4l2-ioctl.c:3274
>   v4l2_ioctl+0x1ac/0x230 drivers/media/v4l2-core/v4l2-dev.c:360
>   vfs_ioctl fs/ioctl.c:47 [inline]
>   ksys_ioctl+0x123/0x180 fs/ioctl.c:747
>   __do_sys_ioctl fs/ioctl.c:756 [inline]
>   __se_sys_ioctl fs/ioctl.c:754 [inline]
>   __x64_sys_ioctl+0x73/0xb0 fs/ioctl.c:754
>   do_syscall_64+0xfa/0x790 arch/x86/entry/common.c:294
>   entry_SYSCALL_64_after_hwframe+0x49/0xbe
> RIP: 0033:0x45af49
> Code: ad b6 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7
> 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff
> ff 0f 83 7b b6 fb ff c3 66 2e 0f 1f 84 00 00 00 00
> RSP: 002b:00007f5917b07c78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 000000000045af49
> RDX: 00000000200001c0 RSI: 0000001002008914 RDI: 0000000000000006
> RBP: 000000000075bf20 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 00007f5917b086d4
> R13: 00000000004c2837 R14: 00000000004d8b30 R15: 00000000ffffffff
> ==================================================================
>
>
> ---
> This bug is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this bug report. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
