Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CAF4E78EAC
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2019 17:05:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387883AbfG2PFB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jul 2019 11:05:01 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:52556 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387861AbfG2PFB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jul 2019 11:05:01 -0400
Received: by mail-io1-f69.google.com with SMTP id p12so67798751iog.19
        for <linux-media@vger.kernel.org>; Mon, 29 Jul 2019 08:05:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=83ogxiWJAcfPlpqDFHyk9MJiHXTGHElwcaQ+ZeWPJvY=;
        b=bWof4sOOlAfsPJsgP932S7t8tlAEfFdUIHq3nG0BXebsdDgnLYjT1l4Wnqrp0ztOiX
         lkzpG5LNPpSQGd5lEnH75PpBGv/whTWI0aqBb+zs5omBvYjQUn7Kgc0fWwgp8x6tL7/C
         0vUlrHhOsf7ei/EaRFXDmADtqd4ua+ICJrl/XvYqEqeKWORtRc5N0ZHJM07r51aGURco
         n3e0DLhmKdQiORAfpY5Jlya8hR67bzo9qsbXEREjPWzwSmS3XyyRU+XMUnc/7LYTnJ6t
         zrkWt0RuBJM/W+KqCm9f0qsyscfJMyndk+plU+5Ryxzt6cG8FdOtxh3cR5DgO1ApNdxZ
         RozQ==
X-Gm-Message-State: APjAAAVsDGM7pe1d7OyDnjg/9bN8t187ZUROJVqa6/nW8hh5IpBjuF+Q
        fnxhEy/99hYU4r2IARlGMqAUszrI1qYyV8cGeZqEXKGtSD4G
X-Google-Smtp-Source: APXvYqzuprNbhcYXnWDZznVvJM8hy7civm1NgXptFAKw1t1/zdh4LNbL91ZtdbTJiYOgfkptxXs1BQq48/Fe4yaKBgO+y9MnqiVg
MIME-Version: 1.0
X-Received: by 2002:a6b:b3c1:: with SMTP id c184mr51761619iof.222.1564412700296;
 Mon, 29 Jul 2019 08:05:00 -0700 (PDT)
Date:   Mon, 29 Jul 2019 08:05:00 -0700
In-Reply-To: <1564410374.25582.15.camel@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000488c6d058ed337b2@google.com>
Subject: Re: general protection fault in flexcop_usb_probe
From:   syzbot <syzbot+d93dff37e6a89431c158@syzkaller.appspotmail.com>
To:     linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        oneukum@suse.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger  
crash:

Reported-and-tested-by:  
syzbot+d93dff37e6a89431c158@syzkaller.appspotmail.com

Tested on:

commit:         6a3599ce usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git  
usb-fuzzer-usb-testing-2019.07.11
kernel config:  https://syzkaller.appspot.com/x/.config?x=662450485a75f217
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1036e80c600000

Note: testing is done by a robot and is best-effort only.
