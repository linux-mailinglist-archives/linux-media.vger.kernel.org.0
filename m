Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E836AD5A12
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2019 05:57:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729776AbfJND5C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Oct 2019 23:57:02 -0400
Received: from mail-io1-f72.google.com ([209.85.166.72]:34619 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729652AbfJND5C (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Oct 2019 23:57:02 -0400
Received: by mail-io1-f72.google.com with SMTP id z10so24833545ioj.1
        for <linux-media@vger.kernel.org>; Sun, 13 Oct 2019 20:57:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=OuWAyTtmm63QQUGDPXR+DkHDOHPMuPnOWQaHNFnyLBY=;
        b=uOoiBqCpa0hbOZWhiAtAAhoEsWoamGIO/J0i9+rAyVQ+Uefph0qHKlMLnx7KmUFFfh
         SH40HcTqG53YOB8UdIEx37zTZxxuOWDDuqMRJqwo0ilvr90kmWzwGSu5I5okg/8bKovB
         AekPm4i2GSg/+7DGRROocuJ2N0QYKIqK0nMWIrd9fvMogxpUfsW/AyadinainfTjaoa+
         9mQwo63Fk2DYVynov80FtXxU1elXhYjD7PYT4FFb5dKzwI//Vm0O2oHuIFkWtWh0gDq/
         a0eotPun2ivpnHqNiHlosC1fT/BXteYksZ+vKC9nwuLr+79p+T9PVQ0TYyb1+1OFevkg
         qXpQ==
X-Gm-Message-State: APjAAAVaTdqYlfx4dESf2DY7YJ7HyhqfwLOlRKdpHJsQXrwOkrKYbDYN
        KQwNCxZD2548eCvcWROw/idHbgGTupW44z8D3xxOUPjFfu1v
X-Google-Smtp-Source: APXvYqwVwyIy9nSYbsyJl/5Ky7DslcWs3entkTykv54QRnqMyvOOoULUzhOD3mtwNZ2fJRFRwM9mAxsY/zpxHu8l3i0Nylw2l3P/
MIME-Version: 1.0
X-Received: by 2002:a5d:93c7:: with SMTP id j7mr6139939ioo.167.1571025421311;
 Sun, 13 Oct 2019 20:57:01 -0700 (PDT)
Date:   Sun, 13 Oct 2019 20:57:01 -0700
In-Reply-To: <00000000000059b6d40594d0f776@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000002ba5570594d6dc99@google.com>
Subject: Re: WARNING in batadv_iv_send_outstanding_bat_ogm_packet
From:   syzbot <syzbot+c0b807de416427ff3dd1@syzkaller.appspotmail.com>
To:     a@unstable.cc, akpm@osdl.org, arvind.yadav.cs@gmail.com,
        b.a.t.m.a.n@lists.open-mesh.org, davem@davemloft.net,
        kgene@kernel.org, krzk@kernel.org, kyungmin.park@samsung.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        mareklindner@neomailbox.ch, mchehab@kernel.org,
        mchehab@s-opensource.com, mingo@kernel.org, netdev@vger.kernel.org,
        oleg@tv-sign.ru, roland@redhat.com, s.nawrocki@samsung.com,
        sven@narfation.org, sw@simonwunderlich.de,
        syzkaller-bugs@googlegroups.com, viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

syzbot has bisected this bug to:

commit 26d051e301f67cdd2ea3404abb43902f13214efa
Author: Arvind Yadav <arvind.yadav.cs@gmail.com>
Date:   Thu Jun 29 08:21:35 2017 +0000

     media: exynos4-is: fimc-is-i2c: constify dev_pm_ops structures

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=10a0aff0e00000
start commit:   da940012 Merge tag 'char-misc-5.4-rc3' of git://git.kernel..
git tree:       upstream
final crash:    https://syzkaller.appspot.com/x/report.txt?x=12a0aff0e00000
console output: https://syzkaller.appspot.com/x/log.txt?x=14a0aff0e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2d2fd92a28d3e50
dashboard link: https://syzkaller.appspot.com/bug?extid=c0b807de416427ff3dd1
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=141ffd77600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11edd580e00000

Reported-by: syzbot+c0b807de416427ff3dd1@syzkaller.appspotmail.com
Fixes: 26d051e301f6 ("media: exynos4-is: fimc-is-i2c: constify dev_pm_ops  
structures")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
