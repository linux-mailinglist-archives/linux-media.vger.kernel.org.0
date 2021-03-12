Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 101173389B3
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 11:10:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233089AbhCLKJo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 05:09:44 -0500
Received: from mail-il1-f200.google.com ([209.85.166.200]:51325 "EHLO
        mail-il1-f200.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233015AbhCLKJI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 05:09:08 -0500
Received: by mail-il1-f200.google.com with SMTP id y11so17744332ilc.18
        for <linux-media@vger.kernel.org>; Fri, 12 Mar 2021 02:09:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=lKThWuc7qC86NDL1LGTLTEircD8IYx5tDZmW2NYoAPQ=;
        b=OkpsvwbJNGSVJrAsOoVcJVRVXypyivznthTJC+botGRLJKyD7t0QjfdMldIYQwYicJ
         a3y5ucoOIvXN+konz9YINAw2lpZh/mGh+vGY1E2VgK8sVjIO60Cav74roXv4IKZvsQMa
         0IxulfKtwzZ082LMmBmj85HDXfX/NEG7cBesPsF57nEXyjOsAgw0v5lPWcVmZwAazQui
         B4qMVZHTpZGE4o1fXWpU04A26TXk5pAglxAXZH68xbFRSlEBKD2qPNlsC/4XH65pZx6Q
         7NFWcNBgoOOfkt76UWdKou9/yuTIRpUdV8NkLY09nLnxY36UzlX6p7exD+oJnPmN78zb
         lnTw==
X-Gm-Message-State: AOAM533S4WV23rxMdazB7T6QGgoJ3Jh3P5z3fH0HHHUKGYEQYe2tlbzc
        qmortfDnv/yNFmmbuaRIPJUNBQHFtQznECP6HykGLqW824Lt
X-Google-Smtp-Source: ABdhPJwG5itXiqfDnTi/TZbE0aT6gOxFGU1RS7ST9duejkRx/I/NM4alNVa/rJlEO2lbnfJIp19jduw25XzVpFxlWv2T5w5p5kcS
MIME-Version: 1.0
X-Received: by 2002:a05:6638:91:: with SMTP id v17mr7609110jao.69.1615543748322;
 Fri, 12 Mar 2021 02:09:08 -0800 (PST)
Date:   Fri, 12 Mar 2021 02:09:08 -0800
In-Reply-To: <000000000000f564d305bd521b83@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003ceac005bd541781@google.com>
Subject: Re: [syzbot] WARNING in __i2c_transfer
From:   syzbot <syzbot+ffb0b3ffa6cfbc7d7b3f@syzkaller.appspotmail.com>
To:     dwlsalmeida@gmail.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab+huawei@kernel.org, mchehab@kernel.org,
        paskripkin@gmail.com, syzkaller-bugs@googlegroups.com,
        wsa@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

syzbot has bisected this issue to:

commit f90cf6079bf67988f8b1ad1ade70fc89d0080905
Author: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
Date:   Fri Aug 21 12:58:47 2020 +0000

    media: vidtv: add a bridge driver

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1136cf66d00000
start commit:   28806e4d Merge tag 'media/v5.12-2' of git://git.kernel.org..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1336cf66d00000
console output: https://syzkaller.appspot.com/x/log.txt?x=1536cf66d00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6bcf96204c1b8e77
dashboard link: https://syzkaller.appspot.com/bug?extid=ffb0b3ffa6cfbc7d7b3f
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1083223ad00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14345f0ad00000

Reported-by: syzbot+ffb0b3ffa6cfbc7d7b3f@syzkaller.appspotmail.com
Fixes: f90cf6079bf6 ("media: vidtv: add a bridge driver")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
