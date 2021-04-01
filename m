Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55E73350D38
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 05:40:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232789AbhDADjj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Mar 2021 23:39:39 -0400
Received: from mail-il1-f197.google.com ([209.85.166.197]:47903 "EHLO
        mail-il1-f197.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232902AbhDADjG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Mar 2021 23:39:06 -0400
Received: by mail-il1-f197.google.com with SMTP id h21so2971145ila.14
        for <linux-media@vger.kernel.org>; Wed, 31 Mar 2021 20:39:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=y0jAq5S9GiYMY36r36rGvrhgs2PgZlLJSzcOUpx10aI=;
        b=JhbSbeWarH3PNL0p7QVbsv9NmQgp5ySZYYT972QXYU/DKj9g+7aHsT6nhmFAuw7ory
         oB+xzUc9Vb8zKFh0kCZYhA0goaD2X0H9oRMdnQijvcOmVhmEdxia48sqTmutWu9S8V5x
         QsaCIccK+GSMjl3FdAjOuCuUm1702Uswtik7XDl/bYu5LWgEPbOR6tqrRA7H9gKNy4Dp
         QM8m/IhXGKLUDniQhiQphaXLzdyHYGyVl1PgNoDEeF7G7ibHJ3Hyuwb1jMk8+9rjPIgN
         y0KDuTmQ/E4gugwal7RCEnS8ZXXSBCUPYG/zMUoO+yJTHZmrEW6s812sDpYFtDFxzQsv
         WQUw==
X-Gm-Message-State: AOAM533XT9LJQqVLiVb0J2DwqZByo9uTBAzu1DiVN9abwCBWDmOvZIwN
        ccyHmfapRKCp1g+NvXrrynuS9EiPA/Z4SdjALsiHFcDbQyjF
X-Google-Smtp-Source: ABdhPJwzE7eMfw19r1VuuSvTtkhe67TPWs/rerGhe9Jm/clMO1VZfFxpEvlHGpoSYRqwFXicx9bTkonPXQ0pNzLMdY1wAwRSdeeF
MIME-Version: 1.0
X-Received: by 2002:a05:6638:2603:: with SMTP id m3mr5782480jat.64.1617248345919;
 Wed, 31 Mar 2021 20:39:05 -0700 (PDT)
Date:   Wed, 31 Mar 2021 20:39:05 -0700
In-Reply-To: <00000000000046e0e905afcff205@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000002c193805bee0f97c@google.com>
Subject: Re: [syzbot] KASAN: vmalloc-out-of-bounds Read in bpf_trace_run2
From:   syzbot <syzbot+845923d2172947529b58@syzkaller.appspotmail.com>
To:     andrii@kernel.org, andriin@fb.com, ast@kernel.org,
        bpf@vger.kernel.org, coreteam@netfilter.org, daniel@iogearbox.net,
        davem@davemloft.net, hawk@kernel.org, john.fastabend@gmail.com,
        kaber@trash.net, kadlec@blackhole.kfki.hu, kafai@fb.com,
        kpsingh@chromium.org, kpsingh@kernel.org, kuba@kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        mathieu.desnoyers@efficios.com, mchehab@kernel.org,
        mchehab@s-opensource.com, mingo@kernel.org, mingo@redhat.com,
        mmullins@mmlx.us, netdev@vger.kernel.org,
        netfilter-devel@vger.kernel.org, pablo@netfilter.org,
        peterz@infradead.org, rostedt@goodmis.org, songliubraving@fb.com,
        syzkaller-bugs@googlegroups.com, yhs@fb.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

syzbot suspects this issue was fixed by commit:

commit befe6d946551d65cddbd32b9cb0170b0249fd5ed
Author: Steven Rostedt (VMware) <rostedt@goodmis.org>
Date:   Wed Nov 18 14:34:05 2020 +0000

    tracepoint: Do not fail unregistering a probe due to memory failure

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=123358a1d00000
start commit:   70b97111 bpf: Use hlist_add_head_rcu when linking to local..
git tree:       bpf-next
kernel config:  https://syzkaller.appspot.com/x/.config?x=7e0ca96a9b6ee858
dashboard link: https://syzkaller.appspot.com/bug?extid=845923d2172947529b58
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10193f3b900000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=168c729b900000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: tracepoint: Do not fail unregistering a probe due to memory failure

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
