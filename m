Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FBD411B89A
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2019 17:23:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730595AbfLKQXA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Dec 2019 11:23:00 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:55628 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1729118AbfLKQW7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Dec 2019 11:22:59 -0500
Received: (qmail 4502 invoked by uid 2102); 11 Dec 2019 11:22:58 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 11 Dec 2019 11:22:58 -0500
Date:   Wed, 11 Dec 2019 11:22:58 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Dmitry Vyukov <dvyukov@google.com>
cc:     Andrey Konovalov <andreyknvl@google.com>,
        syzbot <syzbot+c7b0ec009a216143df30@syzkaller.appspotmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Souptick Joarder <jrdr.linux@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Richard Fontana <rfontana@redhat.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: KASAN: use-after-free Read in usbvision_v4l2_open
In-Reply-To: <CACT4Y+ZSmwr4y2VrUxZSvFCL0Ws4cp6T5FwyVRg_CqhCf354HQ@mail.gmail.com>
Message-ID: <Pine.LNX.4.44L0.1912111111510.1549-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 11 Dec 2019, Dmitry Vyukov wrote:

> > > By the way, do you know why syzbot sent _two_ reply messages?  One with
> > > message ID <00000000000031a0af05995eca0b@google.com> and the other with
> > > message ID <000000000000441a4205995eca11@google.com>?  It seems like
> > > overkill.
> >
> > Hm, I'm not sure. Dmitry?
> 
> I would assume it received 2 emails (second from syzkaller-bugs@
> mailing list) and deduplication logic did not work somehow. So it
> replied to both.

Does that mean when I send in a test request, it's better to omit 
syzkaller-bugs from the CC: list?

Also, whatever did happen to the most recent test request (the one sent 
to syzbot+7fa38a608b1075dfd634 even though it was meant to test the 
bug reported by syzbot+c7b0ec009a216143df30)?  Did it truly fail to 
build?  I can't find anything about it in the dashboard link for either 
bug report, and I haven't gotten a reply from syzbot.

Alan Stern

