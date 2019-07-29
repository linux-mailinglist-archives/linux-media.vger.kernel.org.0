Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B602C7923B
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2019 19:34:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728996AbfG2ReB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jul 2019 13:34:01 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:33964 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726709AbfG2ReB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jul 2019 13:34:01 -0400
Received: by mail-io1-f70.google.com with SMTP id u84so68394875iod.1
        for <linux-media@vger.kernel.org>; Mon, 29 Jul 2019 10:34:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=syvtJEG7USwiD/3Hl7rGPBe7rMf4IwYj1Akgur62+14=;
        b=E6Crng0eJCOneTrDXXiCAGSyXx+krSSSIOLvUjsGlrn6yCiMwww3fTTe/u68ISLWvh
         RNeV9Y+h5ruwkc1cnKxwwlgVMgpqgKUuZpAYDwPVuwzb4xRiTtGiFiQ4qL8rPwo8lr/6
         8vb6MzUgD3M9brwqafR8R4sU07y2c2246wEN5zAxMayAgumB7Om0Ol6/S8SbeORY2BNp
         RbWth5xOdv6P2CDEXqAXzGwR/UJB5IKrCnLA05GHf3ziPoassbgAZdTiLHiPJgdTwvJR
         pNXBtXFG0nMOZDMmqKzKBSNayXY1DiXyhm4lS8tc6ot8RwCngyaXfUOvZOYvKMAbyvHj
         /B/A==
X-Gm-Message-State: APjAAAUyAbzlFvhZilv1focpHWqYNh+h2MVZ/q1OVwXSK/s82VoVnrDY
        c0N3RzqpHUvomb82cpxN8fJH5ywlkORoSiQhfqmkAp2tEZUB
X-Google-Smtp-Source: APXvYqzBpic4jveIaJHaymS7PGeJjXNGUXe/2V3f3+gCrnwDqmqFEB8RN3soewFR+0pvvH6Hm6Us3vIRWDdXigm2rmw3KmoU542w
MIME-Version: 1.0
X-Received: by 2002:a02:90c8:: with SMTP id c8mr20066537jag.22.1564421640620;
 Mon, 29 Jul 2019 10:34:00 -0700 (PDT)
Date:   Mon, 29 Jul 2019 10:34:00 -0700
In-Reply-To: <CAAeHK+yY3JWAj+EZ5wzqUOMbN+cdddCoRn7Nxn759-7zR-J7BQ@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000002b0f41058ed54cf4@google.com>
Subject: Re: general protection fault in flexcop_usb_probe
From:   syzbot <syzbot+d93dff37e6a89431c158@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, oneukum@suse.com,
        syzkaller-bugs@googlegroups.com
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

commit:         9a33b369 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=23e37f59d94ddd15
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11cc12d8600000

Note: testing is done by a robot and is best-effort only.
