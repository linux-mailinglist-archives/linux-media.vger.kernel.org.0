Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55AD4B94CE
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2019 18:02:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729305AbfITQCG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Sep 2019 12:02:06 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:42346 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727529AbfITQCG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Sep 2019 12:02:06 -0400
Received: by mail-pg1-f195.google.com with SMTP id z12so4064180pgp.9
        for <linux-media@vger.kernel.org>; Fri, 20 Sep 2019 09:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6+YyKQua4fqTZkpIWd0bVw1nHXY16Gz7L9AacObwXjo=;
        b=qGfBcWvy5grf3UCx1/w/1xnq2HANUqfq7X+egW6ZmCkH4RXEShVW46xF0xNcgrs1g0
         dAZQBOzV3gHSQS3l63ku98vKJNDL8r6kIIQJGOnxhJnR/OGD+HZcMaWHS/mCBrgfv2oq
         mWUnw5bJoBuDOS0YvyvbR6tccOb2NeXoYPbDcdgqMhAXiBa03JAKanulHWbNLbryj5es
         VGAQ0/VBb/3lJGT/FFp61t5tCPz9EHG7TFLcBW0RhQKpzoqyuhtUSrJd3OJmt4lD7OEj
         PFQYW2z/Eifz1sHByaXGckDsG5JIzF8gEMMq+zwj9odqDoIzI3Z+epfsXXToAC3bAqu+
         ljcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6+YyKQua4fqTZkpIWd0bVw1nHXY16Gz7L9AacObwXjo=;
        b=IsdRjLQQWv8/Cr4UF/o+OWq9KLiE6uUr39rmE4/8yVXVSF/1rQ2Z3g5Bc5iJ+RGdeU
         iQqAcytUjJiH17xhamCpXRZ7gbl4bNQu0kacMu2oSelGYXmuZVqzVmb08+P23CMVv3B3
         c94PhF53fG7rg8zUtaUgoVIcpgpjPkGbHai9n0+PlN24D93hvT9zCyW14jbZ+cEYlFnK
         /qe5pIBPHZ3m6aGvox1qPhOh71QwOXqv66VPsaK03CjO+p4rJIgSUTe2EdS63S/oBUI+
         b4uADvYscz7WZHW7Is2fpxqJ1KlHsh2PlsMST7KbcV9Yt10V66BOvMiLixgl6S4w8gfr
         5MNA==
X-Gm-Message-State: APjAAAVc0Hh4fAq05rjberFyh5riu1l2jV9qJ3dxqZK8veusMg9qgLoM
        oT3U1xtZfEJ9vbeO5hlDR9MFhv9TCf/OqS6eSdcf1Q==
X-Google-Smtp-Source: APXvYqw0gFXtTXiIb5CkyEPb4SrzK51XIoT8YPylm3xd0XxlxUWWLE4VSzU8DqxYNdMw6+E36mtwh/hMwDdAesuUZFI=
X-Received: by 2002:a17:90a:ff18:: with SMTP id ce24mr5446973pjb.123.1568995322671;
 Fri, 20 Sep 2019 09:02:02 -0700 (PDT)
MIME-Version: 1.0
References: <1564472907.25582.16.camel@suse.com> <00000000000081a9c1058ee1d06a@google.com>
In-Reply-To: <00000000000081a9c1058ee1d06a@google.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Fri, 20 Sep 2019 18:01:51 +0200
Message-ID: <CAAeHK+w0vKt94g-h+NOqW-GJKyqikbAfU4sTBeKeJS-sUkZ69g@mail.gmail.com>
Subject: Re: general protection fault in flexcop_usb_probe
To:     syzbot <syzbot+d93dff37e6a89431c158@syzkaller.appspotmail.com>
Cc:     linux-media@vger.kernel.org, USB list <linux-usb@vger.kernel.org>,
        Oliver Neukum <oneukum@suse.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 30, 2019 at 10:30 AM syzbot
<syzbot+d93dff37e6a89431c158@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot has tested the proposed patch and the reproducer did not trigger
> crash:
>
> Reported-and-tested-by:
> syzbot+d93dff37e6a89431c158@syzkaller.appspotmail.com
>
> Tested on:
>
> commit:         9a33b369 usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git
> kernel config:  https://syzkaller.appspot.com/x/.config?x=23e37f59d94ddd15
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> patch:          https://syzkaller.appspot.com/x/patch.diff?x=1226c2d8600000
>
> Note: testing is done by a robot and is best-effort only.
>
> --
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/00000000000081a9c1058ee1d06a%40google.com.

Hi Oliver,

I was wondering if you've submitted this patch anywhere? The bug is
still happening.

https://syzkaller.appspot.com/bug?id=c0203bd72037d07493f4b7562411e4f5f4553a8f

Thanks!
