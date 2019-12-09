Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E05B2116DED
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2019 14:28:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727502AbfLIN2x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Dec 2019 08:28:53 -0500
Received: from mail-qk1-f193.google.com ([209.85.222.193]:35152 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727200AbfLIN2x (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Dec 2019 08:28:53 -0500
Received: by mail-qk1-f193.google.com with SMTP id v23so13021994qkg.2
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2019 05:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mC6dwDgkbul0tC4W3oYHo0MUwTVlgHpSFyYWvGZWy04=;
        b=N1mzvRHof22zXGuK3MIAUfFxdkYuctiHnxB3Y2Rm/JnwD2RKte8a1MdhwaY3Xv+ctQ
         jk+upea9/BF7RSkgeJLddkcjgV7yZashiKd23SVNx+n1zps6Y3JO+Ng+sAS9etoSmg1K
         1hdG0dCngPMSFVPYMIQwiwI00n2ZYGVUnzDAcLW8e7XNBhBpH2n+azm1j0xQnIzpPcAL
         vBghGmfMgkV56SwYKpcyfTos7NNgKO7LSSfY7HlZOLVeUq2yruN0TgQSaDp9tLNQ3W55
         i3Waukz5MbNN+GWeSav+7bcR+QEnw13OF7dI8ECisajS0FxVutXrNSZTw8aNBouIYms3
         EjfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mC6dwDgkbul0tC4W3oYHo0MUwTVlgHpSFyYWvGZWy04=;
        b=J9qjtdgHJHzotAbExruu1OqvK+vKHMkAcHPLvyIvC27PxbaeoJfWlYOVrw717eBgzU
         WKe6KoztYPnH3PTJPNV5eJwkl5VDAjyiwT5Mn9CwQStFpLCy8gAL9SpjVc5JoNpj2u+A
         DYf/zck89HhTJSxxd/+J+zZv2WlCqPsU7RvhskSGEriFBjrB5nEAKA713kPtp6KEIPOI
         OQPO6ebsXgAr5x3WlcEHh3TtKX7UaNdAOVWD8fo5cMNmNl34i2fQ8kVcWTisslvNMBG1
         mUsz4Yi27M0KRsjDKojVgIMkiJpPr9MSIwXb6ZuPLy3mzRzfamXJbTco7L5YgORquqqR
         nQQQ==
X-Gm-Message-State: APjAAAWBxZtUKxchIiED1lhtMHOukbcAmHjSFw8AzcNjh0+NvRPlFF6c
        sjmVoodU261xpT3ghli7lHR3SWeJE7mp9waK9NjwWQ==
X-Google-Smtp-Source: APXvYqzH0Y8On7tJb5v/ufXT6FjZXEJDhs1YZV7EcVwaOIORHRukhbnPNwcL4VQWMWkgQhS7JRhd12/E5FzRgAp2RmM=
X-Received: by 2002:a37:76c5:: with SMTP id r188mr26750469qkc.256.1575898132089;
 Mon, 09 Dec 2019 05:28:52 -0800 (PST)
MIME-Version: 1.0
References: <35ac3fe74b30f6ac2ba9bd1f0a9acb7184c1c6b9.camel@collabora.com>
In-Reply-To: <35ac3fe74b30f6ac2ba9bd1f0a9acb7184c1c6b9.camel@collabora.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Mon, 9 Dec 2019 14:28:41 +0100
Message-ID: <CACT4Y+YpWu6gm7qrZWQ3VOe0WKPmNoPfy5dPfmJXSq8XrWpeCA@mail.gmail.com>
Subject: Re: Fuzzing media before changes hit upstream
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     syzkaller <syzkaller@googlegroups.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, mchehab@kernel.org,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Dec 5, 2019 at 11:31 AM Ezequiel Garcia <ezequiel@collabora.com> wrote:
>
> Hi Dmitry,
>
> My name is Ezequiel Garcia, I work for Collabora
> as a Kernel developer. Currently, we are helping the
> ChromeOS team with media subsystem driver
> upstreaming and other upstream core changes.
>
> I've been following syzkaller media fuzzing
> progress on vivid, vimc and other drivers, and I'd
> like to thank you for your hard work. It's very
> impressive.
>
> I'm currently exploring the possibility of using
> syzkaller as part of our development process,
> fuzzing core changes, new ioctls, etc.
>
> The configuration allows to restrict the syscalls
> used, but I fail to see if there is a way to
> restrict the devices nodes syzkaller will use.
>
> Also, someone mentioned that it was possible
> to "train" the system, so subsequent runs
> would be shorter. Is that the case or maybe
> I got the wrong idea?
>
> Ideally, if we can have something that can
> run on a developer's laptop for just a few hours
> (say 6, 8 or even 24 hours) then we could run
> this before submitting patches, and somehow
> increase the level of confidence on the changes.
>
> Thanks,
> Ezequiel

+syzkaller, linux-media mailing list

Hi Ezequiel,

Great to hear! Thanks.

Re restricting device nodes. The set of device nodes accessed is
dictated by the set of enabled syscalls.
Say, if you enable only "openat$vim2m" and "ioctl*", then syzkaller
will only access /dev/video35 and ioctls applicable to it. So
restricting set of syscalls should do what you want.

Re training. Generally every syzkaller run is infinite, so there is no
shorter or longer :)
But, yes, while it runs it collects corpus of interesting inputs and
persistent them. Then, on the subsequent  runs it will use the
collected corpus to more-or-less "continue" from where it stopped. If
you will get this automatically provided you have code coverage
enabled (which you should for efficiency anyway). A 6-24h run should
be good enough (esp provided you already accumulated some corpus).
Corpus is a single local file, so it can be copied across machines.
But also we have the syz-hub thing, that may allow a team to connect
all their local instances together and always reuse each other
progress:
https://github.com/google/syzkaller/blob/master/docs/hub.md

But note that syzkaller will not auto-magically test just every piece
of kernel code. It needs descriptions of the tested interfaces and
some special setup for some subsystems, e.g. dev nodes present and
arranged in some particular way. Have you looked at the current syzbot
coverage on the media subsystem by any chance? That's coverage links
on the dashboard:
https://syzkaller.appspot.com/upstream
Have you checked the existing syzkaller descriptions?
https://github.com/google/syzkaller/blob/master/sys/linux/dev_video4linux.txt
I can't guarantee any completeness nor quality of media coverage and
as far as I know none of kernel developers looked at the
coverage/descriptions.

If you run syzkaller locally to test a particular piece of kernel
code, it always helps to check coverage report to assess achieved
coverage.

This may be useful for configuring kernel:
https://github.com/google/syzkaller/blob/master/docs/linux/kernel_configs.md
