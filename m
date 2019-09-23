Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B514BB418
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2019 14:46:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439571AbfIWMqQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Sep 2019 08:46:16 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:37332 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439568AbfIWMqP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Sep 2019 08:46:15 -0400
Received: by mail-pg1-f196.google.com with SMTP id c17so7971529pgg.4
        for <linux-media@vger.kernel.org>; Mon, 23 Sep 2019 05:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F+HQfuBxfvIu7W6ZgciNovtXVVjwRh4rUaRkloSdUms=;
        b=YnbEX9YrzVd4HKmWNNyz0MX6pw5AGyMgC/HIETbbV5vg0ouq25l5SBJx348GY6J3Bm
         WLlUMBbKFIz56RNRZ08uPtqOa4KHpLwm10P3W9JII27LwnVOhqZnusLkwK2DN6DFo0Uu
         OKk9c1mQdSwo4yejP5ufeO4gpEWU9GL/lwqQKhI5dvi8bDS5CWalrfP/RaPwA7MH5YSY
         9Bg0VmwiXsTT4W5SUOwR5W5bk36psss+YB5kOzbcEG/iYFAsAzno5su2vUDzBrquV3Oq
         hp0aEYMEatB8HwgJdjobBhQ1HE7tDKZLUSACUNAR4rG+5U2WTSk+LFCw8q27uFlAoZJ1
         y6qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F+HQfuBxfvIu7W6ZgciNovtXVVjwRh4rUaRkloSdUms=;
        b=qvd6e5WtR1hKa/qMxYgXMyijaxm8xyHmAjgMrVz7dO+8HZ9lEmCJgR0aUt3t/14AoC
         ed+jNhtZUi/tTVtWfSsNKDr4MBjeLqUEBXC78xvYPWl6NX6onGb3gCF9e6OC3pBoqKNK
         d+YkQMzEorjKgrMg7th85czSVRElO3QuaDA7Q2CBj5BxXytui5hoJx5iv1wPj1YL7Fmc
         4A5LbLm2Po4YJqKvD5U5kI5MKjG4ODLEmgI8uBOGx+JZoR8M15HXMyvIcFXWeLBxNqpV
         u/n3hyYzb9QBi2GGKvoFlxJbLy+RuOy82TnY6zcewc0RM+Fj2GEb/E/z1xo/A8+hpTPz
         3YRg==
X-Gm-Message-State: APjAAAW8MZiL9NRZlMDXrKf68qxRdauz5+kIq/gJlULxuZ3sxKBkNPgk
        qvMaqaItOsP6u/TJsCWzasEkv1tFKr11rEX/Vc2mQA==
X-Google-Smtp-Source: APXvYqxBkpxfuwbV+o3etfbSciPN7x1xJ74p7y0vhwIXrPA29r9v/4Lcgtxvu9BzfA8gtYCOvG9hQERKzDO0NmIpaBQ=
X-Received: by 2002:a63:d1a:: with SMTP id c26mr1165797pgl.286.1569242773370;
 Mon, 23 Sep 2019 05:46:13 -0700 (PDT)
MIME-Version: 1.0
References: <1564472907.25582.16.camel@suse.com> <00000000000081a9c1058ee1d06a@google.com>
 <CAAeHK+w0vKt94g-h+NOqW-GJKyqikbAfU4sTBeKeJS-sUkZ69g@mail.gmail.com> <1569229570.7831.3.camel@suse.com>
In-Reply-To: <1569229570.7831.3.camel@suse.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Mon, 23 Sep 2019 14:46:01 +0200
Message-ID: <CAAeHK+xspiZSWzzVYbMoAV21T0jFX8g+7D8fwkv413ezNWwT_g@mail.gmail.com>
Subject: Re: general protection fault in flexcop_usb_probe
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     syzbot <syzbot+d93dff37e6a89431c158@syzkaller.appspotmail.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        linux-media@vger.kernel.org, USB list <linux-usb@vger.kernel.org>,
        Oliver Neukum <oneukum@suse.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Sep 23, 2019 at 11:21 AM Oliver Neukum <oneukum@suse.com> wrote:
>
> Am Freitag, den 20.09.2019, 18:01 +0200 schrieb Andrey Konovalov:
>
> > > Reported-and-tested-by:
> > > syzbot+d93dff37e6a89431c158@syzkaller.appspotmail.com
>
> [..]
> > Hi Oliver,
> >
> > I was wondering if you've submitted this patch anywhere? The bug is
> > still happening.
> >
> > https://syzkaller.appspot.com/bug?id=c0203bd72037d07493f4b7562411e4f5f4553a8f
>
> Hi,
>
> I definitely did submit it:
> https://www.mail-archive.com/linux-media@vger.kernel.org/msg148850.html

Hi Mauro,

Do you know what happened to this patch? Did it get lost?

Thanks!
