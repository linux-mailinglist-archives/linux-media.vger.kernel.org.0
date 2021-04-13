Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2174835E4EB
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 19:22:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347146AbhDMRW3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 13:22:29 -0400
Received: from mail-qk1-f172.google.com ([209.85.222.172]:44884 "EHLO
        mail-qk1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347127AbhDMRW2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 13:22:28 -0400
Received: by mail-qk1-f172.google.com with SMTP id x11so18586306qkp.11
        for <linux-media@vger.kernel.org>; Tue, 13 Apr 2021 10:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wI/+rBX/o3gQX8aK29t+8LwdIgeCADt3sq9jxR4OClw=;
        b=Euze0Rhb4eDKc/5PfqRI4ogHfbAKtUhknYBijKfYV6DqoytRP03mRWxrQOavsxux45
         teM04XL+atDreXk4G0QQBNhjDHsgHKsOCLkLqWQdxMzdmWBOcfN1cdhX6zaWAuj/L96u
         eXngGpW0aKNbTqLVxqjHTaqj4t5Ir+aSRwAexiVOge/JYlV0QcXnbN7x19tcfCDMtha0
         BmE7UUsrbjhhbBfat5Q2IUKe2Cbr9zOno1ngs5Ljrm0Af0yqLrcywkt5HXeaEULL7ttb
         IkEXCMuTP25S4OJCcfXgvnp6glYn+bDDrCSxpp1zt4HsaUNbpFy8AODL4KNnBEO6YAHi
         QVwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wI/+rBX/o3gQX8aK29t+8LwdIgeCADt3sq9jxR4OClw=;
        b=iCADEY9MxO+TIZtaF9TdP/YG5upoCJhO6Kc5CQ4Zsrr5XclpDkYB9sVFiNkGuS9wCM
         dcONG6fwmE4zoWdBGoyMbn7Ea33f+Zt+x5xunq83e2HKkGD0NXfSxk/CDaWXoEPSt9dl
         5S4i70uHvDpDtrvCHswVUrUM+002nSsNjPnE4jjYPtjbh3ShAW4gQX/Zf16iN5k8nO6n
         L7WYbPPkiOmH+/Hv54LPDahhWRfa+Lh7AkESeDXUif0Lk3VUqSMzNce1kNFiUO6mli7T
         e9L5KwblT74dPz+bBxmD34a/6JN6lBhXW54AiywTtb3Jy0DrDe1iYddt5l7ZHOzEnKsP
         KQNw==
X-Gm-Message-State: AOAM531PoIuYglXiLfmbnQgOKVY0CvPoi9gnUcQJWtCVO/tNy3X0Yoly
        DKQSrpt71nymYhwfS79dQZ9hx6RHze/ajw2d2x1goA==
X-Google-Smtp-Source: ABdhPJxbrMdSh8La1h3woquZfue6Wq28zDi4SAsvfCQvM+Qp1voGLuv3L16pfp30x1Jwvdt1vUihBNaWUDibbqomwQI=
X-Received: by 2002:a05:620a:146e:: with SMTP id j14mr10089456qkl.424.1618334468448;
 Tue, 13 Apr 2021 10:21:08 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000046e0e905afcff205@google.com> <0000000000002c193805bee0f97c@google.com>
In-Reply-To: <0000000000002c193805bee0f97c@google.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Tue, 13 Apr 2021 19:20:57 +0200
Message-ID: <CACT4Y+bEt4rPp-WdDe5gs89bNBjwMe0OSuwCyOT1eioKPjXYyA@mail.gmail.com>
Subject: Re: [syzbot] KASAN: vmalloc-out-of-bounds Read in bpf_trace_run2
To:     syzbot <syzbot+845923d2172947529b58@syzkaller.appspotmail.com>
Cc:     andrii@kernel.org, Andrii Nakryiko <andriin@fb.com>,
        Alexei Starovoitov <ast@kernel.org>, bpf <bpf@vger.kernel.org>,
        coreteam@netfilter.org, Daniel Borkmann <daniel@iogearbox.net>,
        David Miller <davem@davemloft.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Patrick McHardy <kaber@trash.net>,
        Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>,
        Martin KaFai Lau <kafai@fb.com>,
        KP Singh <kpsingh@chromium.org>, kpsingh@kernel.org,
        Jakub Kicinski <kuba@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        mchehab@s-opensource.com, Ingo Molnar <mingo@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, mmullins@mmlx.us,
        netdev <netdev@vger.kernel.org>,
        NetFilter <netfilter-devel@vger.kernel.org>,
        Pablo Neira Ayuso <pablo@netfilter.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Song Liu <songliubraving@fb.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>, yhs@fb.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Apr 1, 2021 at 5:39 AM syzbot
<syzbot+845923d2172947529b58@syzkaller.appspotmail.com> wrote:
>
> syzbot suspects this issue was fixed by commit:
>
> commit befe6d946551d65cddbd32b9cb0170b0249fd5ed
> Author: Steven Rostedt (VMware) <rostedt@goodmis.org>
> Date:   Wed Nov 18 14:34:05 2020 +0000
>
>     tracepoint: Do not fail unregistering a probe due to memory failure
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=123358a1d00000
> start commit:   70b97111 bpf: Use hlist_add_head_rcu when linking to local..
> git tree:       bpf-next
> kernel config:  https://syzkaller.appspot.com/x/.config?x=7e0ca96a9b6ee858
> dashboard link: https://syzkaller.appspot.com/bug?extid=845923d2172947529b58
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10193f3b900000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=168c729b900000
>
> If the result looks correct, please mark the issue as fixed by replying with:
>
> #syz fix: tracepoint: Do not fail unregistering a probe due to memory failure
>
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection

Looks reasonable:

#syz fix:
tracepoint: Do not fail unregistering a probe due to memory failure
