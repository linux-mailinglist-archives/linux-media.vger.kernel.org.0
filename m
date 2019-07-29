Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05B6379189
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2019 18:55:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387500AbfG2QzG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jul 2019 12:55:06 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:46096 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387476AbfG2QzF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jul 2019 12:55:05 -0400
Received: by mail-pl1-f196.google.com with SMTP id c2so27712421plz.13
        for <linux-media@vger.kernel.org>; Mon, 29 Jul 2019 09:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6TLt8tonvJoZZysUQOtplrQz5SXXq81A/8sUR2cjqCQ=;
        b=hjeuwLek2Mr8pD+eGSXyu+lndx7hjIScD3RgOJ06mL75WNSp+zlOMwtZ48E6Q0omWH
         vhPjHYR+fHmWWkhqoLOnaSPLEgEAAlUaae7DltJG3MNtYoVg7WH45fSogKU1XQPrTpbJ
         UM+ATYx+WtVeC1Myu9Hskzm0dyQwpLR3GhWcHh5U6QlvV+7pP9r35ygIA7neJrD0GqyB
         jpZzLAKdr2vysKNCmFxXzJg5gDU/4usm9mwByCDT+GyxarwxeHGJMdiPfcmrjRBnhwv6
         4XGeQa//qHetQ3im5FUgzg9O0J2KWk/jCsBnvZB5qEv5kzQIa0OOTczMYi5duhDg8cGs
         OiQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6TLt8tonvJoZZysUQOtplrQz5SXXq81A/8sUR2cjqCQ=;
        b=VWp1kDd4yKB0kSjW5JNxuXqdwDMBWhrfGaEnn8gNjA4GoEpvtsgWy7jamtM0eodGTe
         N5QLCziV6x+42+XejTaVCODM9G+Wu1BqXO8QcaDL+FoJUQr1NGw9eI2zkcohlj67i8ZU
         5Mh8vkkp6v1HuBkDEQUtIx5We4zdplihBFtcgSlp2yIhQGRSl5fVO3QhkZCDGw1ZBfAC
         BYzr4oKpHmr+8ronrG+/RZMROSMmCBeBcU+xzd223athQnxIaifOskjdMiyGUZUXDn4v
         AgY7fCRGkzo0YF0H/36SN9JCmirJTvSsQuXh7kSeY1vH9YAIzYM5trqso9cZ9whHIsQf
         eATA==
X-Gm-Message-State: APjAAAV0/+4rRcG6Uvp+VKkvvKNJXpttLKcILtn4SM1hfhAXYfuFwyrv
        +PVtT1eYAyfBSOsAYIGUegeulk8MUOHr2EDBAxHcJg==
X-Google-Smtp-Source: APXvYqw26xEeNpL4i8BxqeKJoGMAwqFpC54ci6OcdJNahjqSRekD8A14aGLzeYiVuv4+su0mbCHEEfrNRP0osqmKcqQ=
X-Received: by 2002:a17:902:6a87:: with SMTP id n7mr109264939plk.336.1564419304320;
 Mon, 29 Jul 2019 09:55:04 -0700 (PDT)
MIME-Version: 1.0
References: <1564410374.25582.15.camel@suse.com> <000000000000488c6d058ed337b2@google.com>
In-Reply-To: <000000000000488c6d058ed337b2@google.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Mon, 29 Jul 2019 18:54:53 +0200
Message-ID: <CAAeHK+yY3JWAj+EZ5wzqUOMbN+cdddCoRn7Nxn759-7zR-J7BQ@mail.gmail.com>
Subject: Re: general protection fault in flexcop_usb_probe
To:     Oliver Neukum <oneukum@suse.com>,
        syzbot <syzbot+d93dff37e6a89431c158@syzkaller.appspotmail.com>
Cc:     linux-media@vger.kernel.org, USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: multipart/mixed; boundary="000000000000ea7d07058ed4c0e8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--000000000000ea7d07058ed4c0e8
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 29, 2019 at 5:05 PM syzbot
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
> commit:         6a3599ce usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git
> usb-fuzzer-usb-testing-2019.07.11
> kernel config:  https://syzkaller.appspot.com/x/.config?x=662450485a75f217
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> patch:          https://syzkaller.appspot.com/x/patch.diff?x=1036e80c600000
>
> Note: testing is done by a robot and is best-effort only.

Hi Oliver,

Thanks a lot for fixing all of these USB bugs!

The usb-fuzzer branch is working again, so it should be possible to
use it for testing. But, I've actually just realized, that the proper
way to test fixes for USB bugs is to use the exact commit hash that is
provided in each bug report (the kernel interface for emulating USB
device is not stable yet, and has significantly changed at least
once). I've updated syzbot documentation to reflect this.

Let's try to retest this one with the right kernel commit id:

#syz test: https://github.com/google/kasan.git 9a33b369

Thanks!




>
> --
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/000000000000488c6d058ed337b2%40google.com.

--000000000000ea7d07058ed4c0e8
Content-Type: text/plain; charset="US-ASCII"; name="flexcop.txt"
Content-Disposition: attachment; filename="flexcop.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_jyomq61v0>
X-Attachment-Id: f_jyomq61v0

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvdXNiL2IyYzIvZmxleGNvcC11c2IuYyBiL2RyaXZl
cnMvbWVkaWEvdXNiL2IyYzIvZmxleGNvcC11c2IuYwppbmRleCAxODI2ZmY4MjVjMmUuLjFhODAx
ZGMyODZmOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9tZWRpYS91c2IvYjJjMi9mbGV4Y29wLXVzYi5j
CisrKyBiL2RyaXZlcnMvbWVkaWEvdXNiL2IyYzIvZmxleGNvcC11c2IuYwpAQCAtNTM4LDYgKzUz
OCw5IEBAIHN0YXRpYyBpbnQgZmxleGNvcF91c2JfcHJvYmUoc3RydWN0IHVzYl9pbnRlcmZhY2Ug
KmludGYsCiAJc3RydWN0IGZsZXhjb3BfZGV2aWNlICpmYyA9IE5VTEw7CiAJaW50IHJldDsKIAor
CWlmIChpbnRmLT5jdXJfYWx0c2V0dGluZy0+ZGVzYy5iTnVtRW5kcG9pbnRzIDwgMSkKKwkJcmV0
dXJuIC1FTk9ERVY7CisKIAlpZiAoKGZjID0gZmxleGNvcF9kZXZpY2Vfa21hbGxvYyhzaXplb2Yo
c3RydWN0IGZsZXhjb3BfdXNiKSkpID09IE5VTEwpIHsKIAkJZXJyKCJvdXQgb2YgbWVtb3J5XG4i
KTsKIAkJcmV0dXJuIC1FTk9NRU07Cg==
--000000000000ea7d07058ed4c0e8--
