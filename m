Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 057BB75D09
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2019 04:34:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726109AbfGZCeC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jul 2019 22:34:02 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:36652 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725854AbfGZCeB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jul 2019 22:34:01 -0400
Received: by mail-io1-f71.google.com with SMTP id k21so57097054ioj.3
        for <linux-media@vger.kernel.org>; Thu, 25 Jul 2019 19:34:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=7CpkHsdwXfZwBwrO6vlf0OIv7joJOo5Z6wYVwguiJ04=;
        b=ZTtSW6N5dFSRj1bPWBVb/tnzmMutabVtpTZEFA4YJLa5IO5z2bntmMcko1A5a69KNU
         9NLAA1Oj0384G+9Xh/DqEDbQ5DHsZXYyZsCJKalzl916NqtvLOvjt9Eks6gbFg4Zk5T9
         S8yizdl8TXOW6tX6bzYWAQf+MqIShxDt98RCgbDmxeVDUyVyAdVax1Gc8NT0G6ySj5UY
         HFX0Q1TvLUkF+xzU9hhzyob1i6WbIW/+onAwewFz8StYRfBr3MNR1cWwSeXdTo9r+cPm
         vhShgER411QQ952cT8WLDimvbogPcK4Gu86RD+urS7LxIo7kTI0oqlUMokQX7TPdf06e
         +YTw==
X-Gm-Message-State: APjAAAXwqhboebFwg9sIzCG9bYXLmMY/642V34HX57SWSP1xzkOHyoK/
        PgD5MN1j4p6hDSIIBzdRWubb8Sw3RlHXOmyZwswMXmzncYu0
X-Google-Smtp-Source: APXvYqwFoHU762iKdsVHVX6yTlu7QfEbGsNdjn/z0ANksU56Shk8WreV3mmUqSXqtLdMgVlprsuuj4lm54a3cf1C9DCqoj4pnlX3
MIME-Version: 1.0
X-Received: by 2002:a02:b90e:: with SMTP id v14mr56641596jan.122.1564108441113;
 Thu, 25 Jul 2019 19:34:01 -0700 (PDT)
Date:   Thu, 25 Jul 2019 19:34:01 -0700
In-Reply-To: <000000000000b68e04058e6a3421@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000005dbbc058e8c608d@google.com>
Subject: Re: memory leak in dma_buf_ioctl
From:   syzbot <syzbot+b2098bc44728a4efb3e9@syzkaller.appspotmail.com>
To:     bsingharora@gmail.com, coreteam@netfilter.org, davem@davemloft.net,
        dri-devel@lists.freedesktop.org, duwe@suse.de, dvyukov@google.com,
        kaber@trash.net, kadlec@blackhole.kfki.hu,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, mingo@redhat.com, mpe@ellerman.id.au,
        netdev@vger.kernel.org, netfilter-devel@vger.kernel.org,
        pablo@netfilter.org, rostedt@goodmis.org, sumit.semwal@linaro.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

syzbot has bisected this bug to:

commit 04cf31a759ef575f750a63777cee95500e410994
Author: Michael Ellerman <mpe@ellerman.id.au>
Date:   Thu Mar 24 11:04:01 2016 +0000

     ftrace: Make ftrace_location_range() global

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=154293f4600000
start commit:   abdfd52a Merge tag 'armsoc-defconfig' of git://git.kernel...
git tree:       upstream
final crash:    https://syzkaller.appspot.com/x/report.txt?x=174293f4600000
console output: https://syzkaller.appspot.com/x/log.txt?x=134293f4600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d31de3d88059b7fa
dashboard link: https://syzkaller.appspot.com/bug?extid=b2098bc44728a4efb3e9
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12526e58600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=161784f0600000

Reported-by: syzbot+b2098bc44728a4efb3e9@syzkaller.appspotmail.com
Fixes: 04cf31a759ef ("ftrace: Make ftrace_location_range() global")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
