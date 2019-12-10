Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F5A21191A2
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2019 21:13:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726913AbfLJUN3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Dec 2019 15:13:29 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:51766 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726901AbfLJUN3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Dec 2019 15:13:29 -0500
Received: (qmail 6889 invoked by uid 2102); 10 Dec 2019 15:13:28 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 10 Dec 2019 15:13:28 -0500
Date:   Tue, 10 Dec 2019 15:13:28 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Andrey Konovalov <andreyknvl@google.com>
cc:     syzbot <syzbot+c7b0ec009a216143df30@syzkaller.appspotmail.com>,
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
In-Reply-To: <CAAeHK+wY+35uBvr0=FnKsWOj91QhXuVE++V7frn5AihAPLvo5Q@mail.gmail.com>
Message-ID: <Pine.LNX.4.44L0.1912101508470.1647-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 10 Dec 2019, Andrey Konovalov wrote:

> On Tue, Dec 10, 2019 at 8:48 PM Alan Stern <stern@rowland.harvard.edu> wrote:

> > This looks like a race in v4l2_open(): The function drops the
> > videodev_lock mutex before calling the video driver's open routine, and
> > the device can be unregistered during the short time between.
> >
> > This patch tries to make the race much more likely to happen, for
> > testing and verification.
> >
> > Andrey, will syzbot run the same test with this patch, even though it
> > says it doesn't have a reproducer?
> 
> Hi Alan,
> 
> No, unfortunately there's nothing to run if there's no reproducer.
> It's technically possible to run the same program log that triggered
> the bug initially, but since the bug wasn't reproduced with this log
> even without the patch, there isn't much sense in running it with the
> patch applied.

Actually it does make sense.  That bug was caused by a race, and the 
patch tries to make the race much more likely to happen, so the same 
test should fail again.

But never mind; I'll try a different approach.  There's another syzbot
bug report, one with a reproducer, and with this patch in place it
should trigger the same race.  I'll try submitting it that way.

By the way, do you know why syzbot sent _two_ reply messages?  One with 
message ID <00000000000031a0af05995eca0b@google.com> and the other with 
message ID <000000000000441a4205995eca11@google.com>?  It seems like 
overkill.

Alan Stern



