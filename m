Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6690F11B15F
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2019 16:30:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731533AbfLKPaZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Dec 2019 10:30:25 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:45535 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387461AbfLKPaU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Dec 2019 10:30:20 -0500
Received: by mail-qk1-f195.google.com with SMTP id x1so19891861qkl.12
        for <linux-media@vger.kernel.org>; Wed, 11 Dec 2019 07:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7gIWTbNCIzJwL9xUV5DD3mPfI7Jx6t2VjpSZrx1r784=;
        b=vYZAFWNOCXrTdUXacREX512Q1z9yDyARAcKw3YXP92ObelIWEgxEkn2uK5+eYh6Xll
         5azZ2vZrN0W7AYcHJ5PPZ5Y16505hme4EKPIlf3c9Mb+FYPl4tYcg1rClPgoUB4Sn8DA
         BG97fdDQW5BxlUQHf387cnIkiA0Miyi7c6ikFC7G/OQhXZP6AH6GzUd2nn0UTEapB5nU
         7TTE+fCOftymUTuxRpLo5zDOFBu3hgMlWq+ScX8SMfmlJz63wIVNzw5ZjqI6zhbHFUbW
         itdKSZzBzk3AvaRQc7NKT9Cjmu13FDnMEO2pnzNiEOztmPMOObrIJkKtkacVTrL/eJJR
         p+pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7gIWTbNCIzJwL9xUV5DD3mPfI7Jx6t2VjpSZrx1r784=;
        b=bHTXb9otBp0bvDGQ/xZ/UugRYO8d31JV50916A6u+9TSYLkmz5MJuLmeAjdIuKggMR
         0vrTNH6TrEYbsfgtUrmOXw3J4csfnK0Rlh38VYbE8K7s5X/GdMaE1KxrAUILfDvNSVtM
         VTLawx7u449ZeIICzI90VfR7IhkdEKEP/ZH66YenZ5S+VTBSEL6ntwltXxcYp/guLWvi
         GsF083oLzBhZpWM1e/Aj7shivgseFzDCPFZh5x8l2b7txBsqpqlueXbYWnBgrTYiylBk
         WkxBzm+hD+qadLytkkQI7POZ0QevCNU8CYgYGpM+DhKeKoy77LKWPC41WB7v1ETZANxh
         CC3g==
X-Gm-Message-State: APjAAAX/yVPXBNGYL7evD/ZHclAO6utnvt4YtDvZWUO6+HRFesAkJ39X
        BdNW6IiThsapLNfh2+zrSp5rc1ZqlGNBUpWEnju9Tw==
X-Google-Smtp-Source: APXvYqzKhG7/NQuJEPIGWplJ6Qbn0BjctBewhELQS7qEq/VHgtqAruzctcA9KxpZaclkS1lWbstLjUi/z9EMJAeU+LA=
X-Received: by 2002:ae9:eb48:: with SMTP id b69mr3401822qkg.43.1576078219045;
 Wed, 11 Dec 2019 07:30:19 -0800 (PST)
MIME-Version: 1.0
References: <CAAeHK+wY+35uBvr0=FnKsWOj91QhXuVE++V7frn5AihAPLvo5Q@mail.gmail.com>
 <Pine.LNX.4.44L0.1912101508470.1647-100000@iolanthe.rowland.org> <CAAeHK+xTjUdP5D+DzRD-ZBd-8MmhWxT5n=CqO5u37FrEy6T-8Q@mail.gmail.com>
In-Reply-To: <CAAeHK+xTjUdP5D+DzRD-ZBd-8MmhWxT5n=CqO5u37FrEy6T-8Q@mail.gmail.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Wed, 11 Dec 2019 16:30:06 +0100
Message-ID: <CACT4Y+ZSmwr4y2VrUxZSvFCL0Ws4cp6T5FwyVRg_CqhCf354HQ@mail.gmail.com>
Subject: Re: KASAN: use-after-free Read in usbvision_v4l2_open
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        syzbot <syzbot+c7b0ec009a216143df30@syzkaller.appspotmail.com>,
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

On Wed, Dec 11, 2019 at 3:23 PM Andrey Konovalov <andreyknvl@google.com> wrote:
>
> On Tue, Dec 10, 2019 at 9:13 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > On Tue, 10 Dec 2019, Andrey Konovalov wrote:
> >
> > > On Tue, Dec 10, 2019 at 8:48 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > > > This looks like a race in v4l2_open(): The function drops the
> > > > videodev_lock mutex before calling the video driver's open routine, and
> > > > the device can be unregistered during the short time between.
> > > >
> > > > This patch tries to make the race much more likely to happen, for
> > > > testing and verification.
> > > >
> > > > Andrey, will syzbot run the same test with this patch, even though it
> > > > says it doesn't have a reproducer?
> > >
> > > Hi Alan,
> > >
> > > No, unfortunately there's nothing to run if there's no reproducer.
> > > It's technically possible to run the same program log that triggered
> > > the bug initially, but since the bug wasn't reproduced with this log
> > > even without the patch, there isn't much sense in running it with the
> > > patch applied.
> >
> > Actually it does make sense.  That bug was caused by a race, and the
> > patch tries to make the race much more likely to happen, so the same
> > test should fail again.
> >
> > But never mind; I'll try a different approach.  There's another syzbot
> > bug report, one with a reproducer, and with this patch in place it
> > should trigger the same race.  I'll try submitting it that way.
> >
> > By the way, do you know why syzbot sent _two_ reply messages?  One with
> > message ID <00000000000031a0af05995eca0b@google.com> and the other with
> > message ID <000000000000441a4205995eca11@google.com>?  It seems like
> > overkill.
>
> Hm, I'm not sure. Dmitry?

I would assume it received 2 emails (second from syzkaller-bugs@
mailing list) and deduplication logic did not work somehow. So it
replied to both.
