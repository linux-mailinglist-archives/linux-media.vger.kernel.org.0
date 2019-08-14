Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AACC8D235
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2019 13:32:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727736AbfHNLcm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Aug 2019 07:32:42 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:46554 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726265AbfHNLcf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Aug 2019 07:32:35 -0400
Received: by mail-pf1-f196.google.com with SMTP id q139so5120348pfc.13
        for <linux-media@vger.kernel.org>; Wed, 14 Aug 2019 04:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MF7jMNepz1wdVPgQ1SCooo7k7btOrltx/wKQg+y/GsA=;
        b=cUSmaBFdYOwqXrkSpi2SHCWiWNzTtlXihjcmXOVqkDl+X3n5d6peoCGvuYwgX64MqL
         3w2UzzDyfZu0hfAU0lFABuw+Jx2QQySxZ8wFRwIlGIY7OxsvXkuM24aClrgd5BDVkt3S
         WZWQjzicuFTY2WaLJVE4TowEXGrnoyST9NVe8UpN5Hq+5g9Y7NTDxGNJ9pj82Xev2xou
         ImULti9r2uMXMeGwdPlBd119/jITjOHMHvdG6iACS1VVifw2mwiInWCMfp4BhMf/hxoH
         fysDbWyizAW+Mp9h1asFijLvf66MdVAAiwQXyIBRQB6ViWm+rix8TlfWqFOBiu6f24pG
         vriw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MF7jMNepz1wdVPgQ1SCooo7k7btOrltx/wKQg+y/GsA=;
        b=dqOy0O8FANIsA2nCtJ+GgDOjhWptk+wc5Ik4SkgxL1YK3r+LCnLY9EkVkSZlRg5RyE
         +lG6Zow74GOBetZRysTFRb9CEQLw5gldAbI/JtyVthZLsTr+sy3DAvlqyhHWfLLIYxba
         RRGEgl93SYzvsbcOUYbcMpGp8z/E33oPzPW9cwLlu9Fzs604Go1q2N+5QmFaIM0XITM9
         tDOfrrsg629rCY7H1e2Lwdfh0Ej41zpTLqIZ627VMgUzX+J3deLJc2rsvJkhzbCZnX4F
         oUxljOuANRSVdc5R90lp8dwiW0aztKgnlwP45dzHDCrsyjCULPcvLQQExxTuNMw7Yf4T
         mPjg==
X-Gm-Message-State: APjAAAWb7a9XSc2NZTG3OCHtTbtOJPe/bim8Jpkt8ArzBvi77ARIK1w5
        A/6qjVIvJu7gNPewdB/rQyQqnTan2o9lvJAd4aEIKA==
X-Google-Smtp-Source: APXvYqxa1i+/yJ7X44W26il0CSBQveyXOF7jDDdUxdID5l1/hjOMDzF9/5eHbAzZ0E9FEdefJrW5A8OnVzmLhKHHRo4=
X-Received: by 2002:a17:90a:858c:: with SMTP id m12mr6772187pjn.129.1565782353721;
 Wed, 14 Aug 2019 04:32:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAAeHK+zPDgvDr_Bao9dz_7hGEg+Ud6-tj7pZaihKeYHJ8M386Q@mail.gmail.com>
 <00000000000054f8bd058ddfa341@google.com> <CAAeHK+xZRH9-ue0QyEdiWmbFJF6P3RXMud+tE6t3x6Orcxnbkg@mail.gmail.com>
 <20190813205104.pnyan3kafz26wsse@gofer.mess.org>
In-Reply-To: <20190813205104.pnyan3kafz26wsse@gofer.mess.org>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 14 Aug 2019 13:32:22 +0200
Message-ID: <CAAeHK+y3MHoeAgOtAW0pTaTBFeVzXmNpCnazsYT0wJMqhmzd0w@mail.gmail.com>
Subject: Re: KASAN: global-out-of-bounds Read in dvb_pll_attach
To:     Sean Young <sean@mess.org>
Cc:     syzbot <syzbot+8a8f48672560c8ca59dd@syzkaller.appspotmail.com>,
        bnvandana@gmail.com, allison@lohutok.net, hverkuil-cisco@xs4all.nl,
        LKML <linux-kernel@vger.kernel.org>, linux-media@vger.kernel.org,
        USB list <linux-usb@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        rfontana@redhat.com,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Thomas Gleixner <tglx@linutronix.de>, tskd08@gmail.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Aug 13, 2019 at 10:51 PM Sean Young <sean@mess.org> wrote:
>
> On Tue, Aug 13, 2019 at 03:22:49PM +0200, Andrey Konovalov wrote:
> > On Wed, Jul 17, 2019 at 2:29 PM syzbot
> > <syzbot+8a8f48672560c8ca59dd@syzkaller.appspotmail.com> wrote:
> > >
> > > Hello,
> > >
> > > syzbot has tested the proposed patch and the reproducer did not trigger
> > > crash:
> > >
> > > Reported-and-tested-by:
> > > syzbot+8a8f48672560c8ca59dd@syzkaller.appspotmail.com
> > >
> > > Tested on:
> > >
> > > commit:         6a3599ce usb-fuzzer: main usb gadget fuzzer driver
> > > git tree:       https://github.com/google/kasan.git usb-fuzzer
> > > kernel config:  https://syzkaller.appspot.com/x/.config?x=d90745bdf884fc0a
> > > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > > patch:          https://syzkaller.appspot.com/x/patch.diff?x=1454f4d0600000
> > >
> > > Note: testing is done by a robot and is best-effort only.
> >
> > Hi bnvandana,
> >
> > Could you submit this patch? Syzbot testing shows that is fixes the issue.
>
> The patch had issues (see discussion in the thread). I created this patch
> but I see now I did not include the correct Reported-by: tag.
>
> https://www.mail-archive.com/linux-media@vger.kernel.org/msg148889.html

No problem, we can mark the fix manually:

#syz fix: media: dvb-frontends: use ida for pll number

Thanks!
