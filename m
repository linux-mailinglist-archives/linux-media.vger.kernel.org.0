Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD40411AD4C
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2019 15:23:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729856AbfLKOXJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Dec 2019 09:23:09 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:35040 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729763AbfLKOXI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Dec 2019 09:23:08 -0500
Received: by mail-pf1-f193.google.com with SMTP id b19so1900582pfo.2
        for <linux-media@vger.kernel.org>; Wed, 11 Dec 2019 06:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/QWzNDzzrfxQTmZnQXAnuGOpRW2t5ObwF4zriIuU40Y=;
        b=X+BARLPnnb5Z0xTDzxhmbC3H9nKkYVim4Rh4phE9EBm7qNO7aIUaJGuD1TC9KIUIzm
         XTbb0b69nRjKZAUnvb2lPL1NgxsVRCsWAxY9+bewiEBcSjDmyYURfskgytpo9lkqF9UI
         ewq0eeSIIBhDWGuDL9ls7sulVX7i3SCfU1FuIXgdC+kTP2QNU0X8P6HI59thze0Fw5Z1
         CC7Vi5z5iDvdTn4YUjm6IJ3jx3eDpb9J2NjXaLgGdvFOzunh1x56XR0vK0OkO3M4FlaO
         fmo1UspdQF/4Z1pua/UZ0ObIWIOjHLCgQ2dngWCIr+z958SLHosToJDAGJXqhpWimXwh
         6hWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/QWzNDzzrfxQTmZnQXAnuGOpRW2t5ObwF4zriIuU40Y=;
        b=o5awb2xAymkKusuvnABeJ+dx289/ajbf/uDJCvfArVIxrcuS8iJqvaUVz6u2rggb5L
         UK64DaPNvKwalY8nntYPRJiJ5S94CjowVSJH5mPv7P+HHKrn+bPqDetbxPksi45qNKhI
         Z546GVLwpSW/Kl3N9bdC023u3gVEYAYqy4Czrn2wSABi9YXCLncKmW5yhyRHjYHJpWEK
         RaI/h0/VP2bU1O1/FEY6cRs9lE+t49dM4ZVMxwgfoQgzZeb8mJxPsjdrTi+4mK4xBL6p
         VmvlIrkNb2Pxs8nzXUXfyRzPL2hIC4Lr/slIWwzcG+I0UwSTpCTK268Q1csE58tkFQmg
         L1Hg==
X-Gm-Message-State: APjAAAVCcS2VoTBebGpHT0ctR1ocPlnv7l9+FGfXZWVGtF3mUb0yWJUN
        jlKLEjK6LYmcm+ZpoW3LucfuvDkPCz8l2gvoXdRfAQ==
X-Google-Smtp-Source: APXvYqyC3Yj5w8PRUHoADlHDrvA7T1UCFsuw0q62MHrJCRrNQF+pmIjqG0dinlqqjVMygtBbuXda+56UkHWlZ16Mb2M=
X-Received: by 2002:a65:678f:: with SMTP id e15mr4437984pgr.130.1576074187917;
 Wed, 11 Dec 2019 06:23:07 -0800 (PST)
MIME-Version: 1.0
References: <CAAeHK+wY+35uBvr0=FnKsWOj91QhXuVE++V7frn5AihAPLvo5Q@mail.gmail.com>
 <Pine.LNX.4.44L0.1912101508470.1647-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1912101508470.1647-100000@iolanthe.rowland.org>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 11 Dec 2019 15:22:56 +0100
Message-ID: <CAAeHK+xTjUdP5D+DzRD-ZBd-8MmhWxT5n=CqO5u37FrEy6T-8Q@mail.gmail.com>
Subject: Re: KASAN: use-after-free Read in usbvision_v4l2_open
To:     Alan Stern <stern@rowland.harvard.edu>,
        Dmitry Vyukov <dvyukov@google.com>
Cc:     syzbot <syzbot+c7b0ec009a216143df30@syzkaller.appspotmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Souptick Joarder <jrdr.linux@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>, linux-media@vger.kernel.org,
        USB list <linux-usb@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Richard Fontana <rfontana@redhat.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Dec 10, 2019 at 9:13 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Tue, 10 Dec 2019, Andrey Konovalov wrote:
>
> > On Tue, Dec 10, 2019 at 8:48 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> > > This looks like a race in v4l2_open(): The function drops the
> > > videodev_lock mutex before calling the video driver's open routine, and
> > > the device can be unregistered during the short time between.
> > >
> > > This patch tries to make the race much more likely to happen, for
> > > testing and verification.
> > >
> > > Andrey, will syzbot run the same test with this patch, even though it
> > > says it doesn't have a reproducer?
> >
> > Hi Alan,
> >
> > No, unfortunately there's nothing to run if there's no reproducer.
> > It's technically possible to run the same program log that triggered
> > the bug initially, but since the bug wasn't reproduced with this log
> > even without the patch, there isn't much sense in running it with the
> > patch applied.
>
> Actually it does make sense.  That bug was caused by a race, and the
> patch tries to make the race much more likely to happen, so the same
> test should fail again.
>
> But never mind; I'll try a different approach.  There's another syzbot
> bug report, one with a reproducer, and with this patch in place it
> should trigger the same race.  I'll try submitting it that way.
>
> By the way, do you know why syzbot sent _two_ reply messages?  One with
> message ID <00000000000031a0af05995eca0b@google.com> and the other with
> message ID <000000000000441a4205995eca11@google.com>?  It seems like
> overkill.

Hm, I'm not sure. Dmitry?
