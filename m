Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A70B5EA21
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2019 19:10:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726821AbfGCRKM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jul 2019 13:10:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:34404 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726430AbfGCRKM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Jul 2019 13:10:12 -0400
Received: from gmail.com (unknown [104.132.1.77])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F16D62187F;
        Wed,  3 Jul 2019 17:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562173811;
        bh=hNvlqa9Fb/vTevUDg9J9JPrZV+5aYMRCnTxukE4NKzw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Qh+S3jsa9i3jCqMHbgkplmRLB+c/yfi0XwOn9QqX+JgIIeMTyYtCYuF7A3XPBoiW7
         XYsjRECGVVe5LkwQCWEnWTLsC8CgInDgkI4YJc9ewrhvD2xa+dLiPOfF8GUMAGbM7j
         beFJxHYk/5JPzw8cELeKcdQTO4HAXMWYPcwbzjAA=
Date:   Wed, 3 Jul 2019 10:10:09 -0700
From:   Eric Biggers <ebiggers@kernel.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     syzbot <syzbot+0c90fc937c84f97d0aa6@syzkaller.appspotmail.com>,
        keescook@chromium.org, andreyknvl@google.com,
        syzkaller-bugs@googlegroups.com, mchehab@kernel.org,
        tglx@linutronix.de, sakari.ailus@linux.intel.com,
        kstewart@linuxfoundation.org, allison@lohutok.net,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, hverkuil-cisco@xs4all.nl
Subject: Re: KASAN: use-after-free Read in cpia2_usb_disconnect
Message-ID: <20190703171008.GA10080@gmail.com>
References: <0000000000006d7e14058cbc6545@google.com>
 <1562139729.5819.28.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1562139729.5819.28.camel@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jul 03, 2019 at 09:42:09AM +0200, Oliver Neukum wrote:
> Am Dienstag, den 02.07.2019, 18:01 -0700 schrieb syzbot:
> > syzbot has found a reproducer for the following crash on:
> > 
> > HEAD commit:    7829a896 usb-fuzzer: main usb gadget fuzzer driver
> > git tree:       https://github.com/google/kasan.git usb-fuzzer
> > console output: https://syzkaller.appspot.com/x/log.txt?x=11e19043a00000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=f6d4561982f71f63
> > dashboard link: https://syzkaller.appspot.com/bug?extid=0c90fc937c84f97d0aa6
> > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=147d42eda00000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=104c268ba00000
> > 
> > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > Reported-by: syzbot+0c90fc937c84f97d0aa6@syzkaller.appspotmail.com
> > 
> > cpia2: Message: count = 1, register[0] = 0x0
> > cpia2: Unexpected error: -19
> > ==================================================================
> > BUG: KASAN: use-after-free in cpia2_usb_disconnect+0x1a4/0x1c0  
> > drivers/media/usb/cpia2/cpia2_usb.c:898
> > Read of size 8 at addr ffff8881cf6c4e50 by task kworker/1:1/22
> 
> Please try this:
> 
> From a0a73298fc23acb95e7b6487e960be707563eb34 Mon Sep 17 00:00:00 2001
> From: Oliver Neukum <oneukum@suse.com>
> Date: Wed, 8 May 2019 12:36:40 +0200
> Subject: [PATCH] cpia2_usb: first wake up, then free in disconnect
> 

Who are you talking to?  If you want syzbot to test your patch, follow the
directions at https://github.com/google/syzkaller/blob/master/docs/syzbot.md#testing-patches

- Eric
