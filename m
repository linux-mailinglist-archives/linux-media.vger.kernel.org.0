Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5FE11FFAA3
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2020 19:56:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728283AbgFRR4F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Jun 2020 13:56:05 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:44068 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727019AbgFRR4F (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Jun 2020 13:56:05 -0400
Received: by mail-io1-f70.google.com with SMTP id v14so4752647iob.11
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2020 10:56:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=EFtXSNMLUGInsLNSBypEMpMMFyFYOsaqbMXTYo9acWE=;
        b=YVRiS+g8byXGwKv+Uacabb+gI0CqIL9tJZrd/zqS0UZ5qIFBXbHhUgQXpS1KxsLy9Q
         oYHgfw5APJRL6lfi0Aur9pCAv8XV+g4PEm/79Y1kuqG4gKvkc7AQ/9WzdgSLyPCoAsSP
         9OSc7dEyxgOt1OSkaQNd+Db47eAxF1j+/SUouieelc+LC1j5fFxdKV2UzZckcgKRnJsm
         6LUgZiKQjrOLKmUdQqWD0OhOz7CL0z47cyVGDwDxe5xE9A68KtTT1TW1AQ88dieP+sq3
         oMzBVPXskSdqla4SKvXfC8TJpoKa+Rxn4QtQhTYdFOePpOUIcyGN8bGRh5bFdWeTyAlK
         1fAA==
X-Gm-Message-State: AOAM532TnVvDUi4x/iS6fh1F+WTmBIDiXpzolW7mb+QM9OE7DGjlXdDn
        UIMYQkP3R7OGqA3W0CCGHgYoRUdV3DHJh1v313wI62krM0/U
X-Google-Smtp-Source: ABdhPJxyaSvc8IYhW8iRskEa+5nwLcHwdzT7YI+Bk1XFGFOcjid5bO4Xf5g7G5xn+B2xZguzw1cT2eOse36ijX8XtbSjosI9JjkB
MIME-Version: 1.0
X-Received: by 2002:a6b:1785:: with SMTP id 127mr6231079iox.136.1592502964342;
 Thu, 18 Jun 2020 10:56:04 -0700 (PDT)
Date:   Thu, 18 Jun 2020 10:56:04 -0700
In-Reply-To: <000000000000aa674005a845bbc5@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000007e5a7305a85f7dbd@google.com>
Subject: Re: KASAN: null-ptr-deref Write in media_request_close
From:   syzbot <syzbot+6bed2d543cf7e48b822b@syzkaller.appspotmail.com>
To:     ezequiel@collabora.com, laurent.pinchart@ideasonboard.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab+huawei@kernel.org, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

syzbot has bisected this bug to:

commit 016baa59bf9f6c2550480b73f18100285e3a4fd2
Author: Ezequiel Garcia <ezequiel@collabora.com>
Date:   Tue Apr 14 22:06:24 2020 +0000

    media: Kconfig: Don't expose the Request API option

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=108d7149100000
start commit:   7ae77150 Merge tag 'powerpc-5.8-1' of git://git.kernel.org..
git tree:       upstream
final crash:    https://syzkaller.appspot.com/x/report.txt?x=128d7149100000
console output: https://syzkaller.appspot.com/x/log.txt?x=148d7149100000
kernel config:  https://syzkaller.appspot.com/x/.config?x=be4578b3f1083656
dashboard link: https://syzkaller.appspot.com/bug?extid=6bed2d543cf7e48b822b
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17b3fc35100000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12fbb6f1100000

Reported-by: syzbot+6bed2d543cf7e48b822b@syzkaller.appspotmail.com
Fixes: 016baa59bf9f ("media: Kconfig: Don't expose the Request API option")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
