Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5358B23D1E6
	for <lists+linux-media@lfdr.de>; Wed,  5 Aug 2020 22:07:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729822AbgHEUHY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Aug 2020 16:07:24 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:55845 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726910AbgHEQdI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Aug 2020 12:33:08 -0400
Received: by mail-io1-f69.google.com with SMTP id k10so32068127ioh.22
        for <linux-media@vger.kernel.org>; Wed, 05 Aug 2020 09:33:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=xdDF8KAwPeDbsdN5hACSBVSNt3eeL93Vn3ZE06PW0ws=;
        b=KtX5L4Q/Oxic5A+2HWkCk67WK5+Mp8gkq8BpNHd+dYBNLadW2sYQIfEzLbRZyC1344
         t1PXEBApCOw3c5Il8Gxw2GTaIzJ6i0KS7fhC+JWYemVw3E0U0woKLtA9ktip0xpZUkEh
         5mSYD1zA0NmmQ8F1hqpa8kj+lKNHfcxlSIKo0BpRdKRUpp0EPltfM6UQBaxfnPkTGVgd
         EP/lLG3HQDGdJIgQOJvm+85ntBSAAmEBMTW0vp3KXfrVoVIIQryaaL+w83/DF+XW7gED
         U4Kod3rh2AS6dIx8sq8sO19v4PMABsZN7KIRUdkHLPWvGmIs9nrZQtSFAUx8wbDWhGVM
         juoQ==
X-Gm-Message-State: AOAM532FaWVif42iiq4/kdzgHy/IF+idr/MIVFCD81nycGtL3Vp5LUWE
        OiX0IXgbCSEGtamR+S39Wy7Om8t9HkZc8wtwmIkN9skOvrV1
X-Google-Smtp-Source: ABdhPJx1bzir56joK2ABAxtH0sKqUYFQk87L5ebinbPqcd6dHIycZoH3GBn4mZAYZSuRbVEjVUHzKuZ7t4g9wSnDVEVr5CKihhk0
MIME-Version: 1.0
X-Received: by 2002:a6b:ba06:: with SMTP id k6mr4243404iof.101.1596645187111;
 Wed, 05 Aug 2020 09:33:07 -0700 (PDT)
Date:   Wed, 05 Aug 2020 09:33:07 -0700
In-Reply-To: <00000000000023efa305ac1b5309@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000035d35105ac23ed6d@google.com>
Subject: Re: WARNING: refcount bug in l2cap_global_chan_by_psm
From:   syzbot <syzbot+39ad9f042519082fcec9@syzkaller.appspotmail.com>
To:     coreteam@netfilter.org, davem@davemloft.net, edubezval@gmail.com,
        johan.hedberg@gmail.com, kaber@trash.net, kadlec@blackhole.kfki.hu,
        kuba@kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        marcel@holtmann.org, mchehab@kernel.org, mchehab@s-opensource.com,
        netdev@vger.kernel.org, netfilter-devel@vger.kernel.org,
        pablo@netfilter.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

syzbot has bisected this issue to:

commit 3c1e300966d7edc380e405b3ab70b6e3c813a121
Author: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Date:   Tue Oct 18 19:44:12 2016 +0000

    [media] si4713: don't break long lines

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=108f4002900000
start commit:   c0842fbc random32: move the pseudo-random 32-bit definitio..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=128f4002900000
console output: https://syzkaller.appspot.com/x/log.txt?x=148f4002900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=76cacb0fe58c4a1e
dashboard link: https://syzkaller.appspot.com/bug?extid=39ad9f042519082fcec9
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14491b04900000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1188e392900000

Reported-by: syzbot+39ad9f042519082fcec9@syzkaller.appspotmail.com
Fixes: 3c1e300966d7 ("[media] si4713: don't break long lines")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
