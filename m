Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F7678C254
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2019 22:51:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbfHMUvI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Aug 2019 16:51:08 -0400
Received: from gofer.mess.org ([88.97.38.141]:33375 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726074AbfHMUvI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Aug 2019 16:51:08 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 6D880603E8; Tue, 13 Aug 2019 21:51:05 +0100 (BST)
Date:   Tue, 13 Aug 2019 21:51:05 +0100
From:   Sean Young <sean@mess.org>
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     syzbot <syzbot+8a8f48672560c8ca59dd@syzkaller.appspotmail.com>,
        bnvandana@gmail.com, allison@lohutok.net, hverkuil-cisco@xs4all.nl,
        LKML <linux-kernel@vger.kernel.org>, linux-media@vger.kernel.org,
        USB list <linux-usb@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        rfontana@redhat.com,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Thomas Gleixner <tglx@linutronix.de>, tskd08@gmail.com
Subject: Re: KASAN: global-out-of-bounds Read in dvb_pll_attach
Message-ID: <20190813205104.pnyan3kafz26wsse@gofer.mess.org>
References: <CAAeHK+zPDgvDr_Bao9dz_7hGEg+Ud6-tj7pZaihKeYHJ8M386Q@mail.gmail.com>
 <00000000000054f8bd058ddfa341@google.com>
 <CAAeHK+xZRH9-ue0QyEdiWmbFJF6P3RXMud+tE6t3x6Orcxnbkg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAeHK+xZRH9-ue0QyEdiWmbFJF6P3RXMud+tE6t3x6Orcxnbkg@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Aug 13, 2019 at 03:22:49PM +0200, Andrey Konovalov wrote:
> On Wed, Jul 17, 2019 at 2:29 PM syzbot
> <syzbot+8a8f48672560c8ca59dd@syzkaller.appspotmail.com> wrote:
> >
> > Hello,
> >
> > syzbot has tested the proposed patch and the reproducer did not trigger
> > crash:
> >
> > Reported-and-tested-by:
> > syzbot+8a8f48672560c8ca59dd@syzkaller.appspotmail.com
> >
> > Tested on:
> >
> > commit:         6a3599ce usb-fuzzer: main usb gadget fuzzer driver
> > git tree:       https://github.com/google/kasan.git usb-fuzzer
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=d90745bdf884fc0a
> > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > patch:          https://syzkaller.appspot.com/x/patch.diff?x=1454f4d0600000
> >
> > Note: testing is done by a robot and is best-effort only.
> 
> Hi bnvandana,
> 
> Could you submit this patch? Syzbot testing shows that is fixes the issue.

The patch had issues (see discussion in the thread). I created this patch
but I see now I did not include the correct Reported-by: tag. 

https://www.mail-archive.com/linux-media@vger.kernel.org/msg148889.html

Thanks

Sean
