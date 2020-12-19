Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7E172DECC5
	for <lists+linux-media@lfdr.de>; Sat, 19 Dec 2020 03:51:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726254AbgLSCuo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Dec 2020 21:50:44 -0500
Received: from mail-il1-f199.google.com ([209.85.166.199]:53712 "EHLO
        mail-il1-f199.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726177AbgLSCuo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Dec 2020 21:50:44 -0500
Received: by mail-il1-f199.google.com with SMTP id q2so3939163ilt.20
        for <linux-media@vger.kernel.org>; Fri, 18 Dec 2020 18:50:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=WRrWdLXnVhXMEnkyXGJyYpT7gv4ZpleApkGyNqnGXBQ=;
        b=ifbWlOxUUs4yHO2efL3sixdomWuTj5NboT/yDU8STIQo18c95GCI1gcOCgxAHMf+9j
         yWQsTIxEihpF556MGSK+vZ+BZJBZoJ0c1qtT+XeCgTW3TRsZ1uw69lfuqhINe4RPC3Tt
         IjFWJeMYzxJ+47Lven6jrteFwZ896ODiXT4gmVtvOMeYIOtryR9dEi6s2A2mU7TULoE3
         JDlXoa/MXrt3LR28AkVgvUeR4x4+cCgke2ThdmsBnK+PHN/ANuznZ0OKhyE/WYuDeSIm
         eGthRFN/w3yDT2yFqXCumBotT4jXTIv2DHf8Cy1Eq3rMYHjDwN+qNHhoAJGrq6euXxuz
         NGXw==
X-Gm-Message-State: AOAM5302V6oPpsLTLF+yBUWBzPnypr+kBGUfp7gcjgOGs59xD57yhbyb
        t2qgCwHRernp2sykPzbiBIMggoL8UZJRU6zlVsNOjAr1hWMX
X-Google-Smtp-Source: ABdhPJyqSpVlgYZ7Kv69L7Yr5/7ngYre/wE2XMXivojNJWXyCwLM/npg30emmg9eBU/wh6FL2jvrnSjjBcsAiYvIXyHicYnMMf/J
MIME-Version: 1.0
X-Received: by 2002:a02:9107:: with SMTP id a7mr6642547jag.12.1608346203224;
 Fri, 18 Dec 2020 18:50:03 -0800 (PST)
Date:   Fri, 18 Dec 2020 18:50:03 -0800
In-Reply-To: <000000000000f415bd05a047548f@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001e7f4605b6c84833@google.com>
Subject: Re: kernel BUG at drivers/dma-buf/dma-buf.c:LINE!
From:   syzbot <syzbot+d6734079f30f7fc39021@syzkaller.appspotmail.com>
To:     akpm@linux-foundation.org, arve@android.com,
        christian.koenig@amd.com, christian@brauner.io,
        colin.king@canonical.com, devel@driverdev.osuosl.org,
        dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
        hridya@google.com, jbwyatt4@gmail.com, joel@joelfernandes.org,
        linaro-mm-sig-owner@lists.linaro.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org,
        m.szyprowski@samsung.com, maco@android.com, masahiroy@kernel.org,
        peterz@infradead.org, shuah@kernel.org, skhan@linuxfoundation.org,
        sumit.semwal@linaro.org, surenb@google.com,
        syzkaller-bugs@googlegroups.com, tkjos@android.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

syzbot suspects this issue was fixed by commit:

commit e722a295cf493388dae474745d30e91e1a2ec549
Author: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date:   Thu Aug 27 12:36:27 2020 +0000

    staging: ion: remove from the tree

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17d4f137500000
start commit:   abb3438d Merge tag 'm68knommu-for-v5.9-rc3' of git://git.k..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=978db74cb30aa994
dashboard link: https://syzkaller.appspot.com/bug?extid=d6734079f30f7fc39021
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17428596900000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: staging: ion: remove from the tree

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
