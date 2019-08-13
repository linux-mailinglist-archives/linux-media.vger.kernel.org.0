Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8E1F8B9FC
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2019 15:23:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729029AbfHMNXC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Aug 2019 09:23:02 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:43794 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728933AbfHMNXB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Aug 2019 09:23:01 -0400
Received: by mail-pf1-f194.google.com with SMTP id v12so3824662pfn.10
        for <linux-media@vger.kernel.org>; Tue, 13 Aug 2019 06:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5OimHuLZ+hHOhfUejEMlGFM0cbw0bW0viYw6V8eRjvg=;
        b=jl3oAbI8nXaJN8u9zrckaYcQN83teECbAHKgeFCY7YXAbWo5QSGAmC7AX83Kg81jrR
         wHIfECyD17DuOQN1q+8WpBA0Y7Azud+nPsri/AfhlU88cVcwXD0i8Lv6x8UFbF/l/ro4
         jIcYE6GK8r0fh6Du7FtRXatWz0q5hIF91UiKU6t+CQOI0AjDBqmWZgDB+/wH8LmmU1Rn
         LJ0z2UW5KbZrsxYA0r/Ujs4nyuUB9h4MLLYGZecGHgF4443X9mNo0fvVPaYLZuSOQPKd
         RRRHtjIdfKwqBDwiOeS9PtHuw1eYRhIgU2u8dFfFYg7ZmCq+FQnO1XAX+mrZJIUHS8H6
         cSQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5OimHuLZ+hHOhfUejEMlGFM0cbw0bW0viYw6V8eRjvg=;
        b=NYTrAfAK9jeedzY01kCICzlCJMQGPo1KgXj1uRdNMveHOMYEqOkpEp1CWi0IfBDXQT
         UbFNFSBc5SnrFVjqePpfPb/dqBdrhSPipgC102aj59He2/ngcDgCgqctkVj4QTg7VEk6
         CNkg4pZYHkB0cAMqDVIngwlsTGJT3xt/aoqgJTL7yB37Q1sviaKuAHikQ7QlohIPIIxt
         1bYAxPs9VMIHQk7+oPxlXxe/7gW0gPsLckN91bT8enu6dKbm52QwvSfS6ftMswI9wxwv
         hyxj4cfNmxJftEFhyYEu5uoyeFkYtcqCKDlXrW9fRb2aine9P7bvrWoIcV46JTla9E3G
         TwDw==
X-Gm-Message-State: APjAAAXXoCiHA4NBp4LMsPL9o8nZIHRAtIK1D4Efhrb8xJvFzL6TGYaH
        FQg/C3ruggYpf8xOQWznyPr9kwDtyWPlWbRfXXFyWg==
X-Google-Smtp-Source: APXvYqwpT7K5eeL/AsaPFi5DSDv8bbucf1KzbZhnGHmNuw6OMjnJDLCL+9deXz0+3L8EuMYCkEMcejLnCOAp6T2m+zs=
X-Received: by 2002:a63:c442:: with SMTP id m2mr35234947pgg.286.1565702580714;
 Tue, 13 Aug 2019 06:23:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAAeHK+zPDgvDr_Bao9dz_7hGEg+Ud6-tj7pZaihKeYHJ8M386Q@mail.gmail.com>
 <00000000000054f8bd058ddfa341@google.com>
In-Reply-To: <00000000000054f8bd058ddfa341@google.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 13 Aug 2019 15:22:49 +0200
Message-ID: <CAAeHK+xZRH9-ue0QyEdiWmbFJF6P3RXMud+tE6t3x6Orcxnbkg@mail.gmail.com>
Subject: Re: KASAN: global-out-of-bounds Read in dvb_pll_attach
To:     syzbot <syzbot+8a8f48672560c8ca59dd@syzkaller.appspotmail.com>,
        bnvandana@gmail.com
Cc:     allison@lohutok.net, hverkuil-cisco@xs4all.nl,
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

On Wed, Jul 17, 2019 at 2:29 PM syzbot
<syzbot+8a8f48672560c8ca59dd@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot has tested the proposed patch and the reproducer did not trigger
> crash:
>
> Reported-and-tested-by:
> syzbot+8a8f48672560c8ca59dd@syzkaller.appspotmail.com
>
> Tested on:
>
> commit:         6a3599ce usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> kernel config:  https://syzkaller.appspot.com/x/.config?x=d90745bdf884fc0a
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> patch:          https://syzkaller.appspot.com/x/patch.diff?x=1454f4d0600000
>
> Note: testing is done by a robot and is best-effort only.

Hi bnvandana,

Could you submit this patch? Syzbot testing shows that is fixes the issue.

Thanks!
