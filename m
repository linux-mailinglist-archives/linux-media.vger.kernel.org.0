Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E67F123DB8
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2019 04:11:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726623AbfLRDLC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Dec 2019 22:11:02 -0500
Received: from mail-il1-f198.google.com ([209.85.166.198]:56358 "EHLO
        mail-il1-f198.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726512AbfLRDLC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Dec 2019 22:11:02 -0500
Received: by mail-il1-f198.google.com with SMTP id 12so612861iln.23
        for <linux-media@vger.kernel.org>; Tue, 17 Dec 2019 19:11:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=B/UHccQy2GUPLjKClLjPB9mKSYRSTTFVhiFG9ktmLyQ=;
        b=XHKwHwHi4hflBceENMro7OJykqZFqDWIeKGFDJ6kYhSpuWwEZQbUWcFoaMiTSeVL6U
         elsVu5NbR3DZawSsvu3q3CnSvOVRUqN0xGLXzelg9kP4cb8V4/f5xdts/55wbLrvPm6V
         r3y0Fv0NQwnQGYbHbR+jRE7QEFlM3iECwMY42ufpORs14Zd/Qpasn8ZDJfwytvfR8sU/
         WG0F+WXXCmQPgxuy1lnleE2MQsSuWgEeVkE8/Kt90VS+60WTJb1RjbgARNf2h9Axc0O6
         QOv9SmL+mkI7xXyELqmUZZiWJ4DBtpSsW4snSo11O4caCy1H1MKaqJUlJCeLJOPoog4Q
         Z7CA==
X-Gm-Message-State: APjAAAXiAACdguy54OZyywLKFUAkDpjKM6EhYqS8OYrxXkpMXutUuPjQ
        A3qkhrMnxc3hXA2wv0uuN0MMIcqrOkZ4mkkf520m1R5tzkRG
X-Google-Smtp-Source: APXvYqyMCK4p3QJRNreOaLBgYJejAM1cYoWdGoPJ26FTPuaQyelg3Sjap478JDrBsEezCSHSp7yUtmv244NHO0fzr3UX5/+ddebT
MIME-Version: 1.0
X-Received: by 2002:a02:cdcb:: with SMTP id m11mr361306jap.125.1576638661887;
 Tue, 17 Dec 2019 19:11:01 -0800 (PST)
Date:   Tue, 17 Dec 2019 19:11:01 -0800
In-Reply-To: <000000000000b6b450059870d703@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000618d6a0599f1cb49@google.com>
Subject: Re: KASAN: global-out-of-bounds Read in precalculate_color
From:   syzbot <syzbot+02d9172bf4c43104cd70@syzkaller.appspotmail.com>
To:     davem@davemloft.net, ericvh@gmail.com, hverkuil-cisco@xs4all.nl,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        lucho@ionkov.net, mchehab@kernel.org, netdev@vger.kernel.org,
        rminnich@sandia.gov, syzkaller-bugs@googlegroups.com,
        v9fs-developer@lists.sourceforge.net, viro@zeniv.linux.org.uk,
        vivek.kasireddy@intel.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

syzbot has bisected this bug to:

commit 7594bf37ae9ffc434da425120c576909eb33b0bc
Author: Al Viro <viro@zeniv.linux.org.uk>
Date:   Mon Jul 17 02:53:08 2017 +0000

     9p: untangle ->poll() mess

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=15e323a6e00000
start commit:   d7688697 Merge tag 'for-linus' of git://git.kernel.org/pub..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13e323a6e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=121b4285bac421fe
dashboard link: https://syzkaller.appspot.com/bug?extid=02d9172bf4c43104cd70
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=119c517ae00000

Reported-by: syzbot+02d9172bf4c43104cd70@syzkaller.appspotmail.com
Fixes: 7594bf37ae9f ("9p: untangle ->poll() mess")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
