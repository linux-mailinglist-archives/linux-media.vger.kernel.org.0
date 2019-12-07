Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FBA2115AA6
	for <lists+linux-media@lfdr.de>; Sat,  7 Dec 2019 02:30:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726407AbfLGBaB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Dec 2019 20:30:01 -0500
Received: from mail-il1-f200.google.com ([209.85.166.200]:38680 "EHLO
        mail-il1-f200.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726371AbfLGBaB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Dec 2019 20:30:01 -0500
Received: by mail-il1-f200.google.com with SMTP id o18so6681303ilb.5
        for <linux-media@vger.kernel.org>; Fri, 06 Dec 2019 17:30:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=HNhXiE6HePkhSCnwQ3V/NPWMZ1Hpm58RJpGnE6ed2EU=;
        b=BT6sQirUbg8PGgN8zUFlhHmOOpKaCcJUdl1Ue4xMXkgN9vWkOOkDOzQNoLkh+3lWsg
         Dj3llfu32RB+ImzrBgy4aV+GZ9UtKVgxZnBoiUB9SQ0rGJa/ivm5bf6Ee5Hw/ydV5qBl
         wen0poGN8ZZY48CIiMk6pL9SXhh3kdGjI24tuQB3MAorxzIQTK2lDk2elV23QJBaV0CP
         hGfTbFgx3DGSsUIjh07sLsRmuDWaYZUXfQ0Qg5jTPBq0vy9XZUV996v3dpsfmvbXgi+R
         97xELd6zm/7Pr7RTYvDaauKNVUdfhbyPfHuzzm3ZJaUWPGjtS5fXh9TZhGSS4YI7Y5af
         S04g==
X-Gm-Message-State: APjAAAXAhjHzfDvVNK2jBvOjeT6GTeTVj+jx12Ze0oPBZxA0otS5/Nyu
        fPczdnDKPMe/XPSJOs/BMbgHnjMF+2rVTNALNkB3zBoL+1s/
X-Google-Smtp-Source: APXvYqxz9KBPD51VM3KJ5gnxGMtw4DWz8VDuRdv+40oCBMIhFEk1AOET+26mMuYYk8RExBPPeHQ+h/6hZNb57eiZ5RaZKKFaaCCq
MIME-Version: 1.0
X-Received: by 2002:a92:9f9c:: with SMTP id z28mr17483689ilk.239.1575682200860;
 Fri, 06 Dec 2019 17:30:00 -0800 (PST)
Date:   Fri, 06 Dec 2019 17:30:00 -0800
In-Reply-To: <00000000000057e614057a9abcd3@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000dc7fc70599131995@google.com>
Subject: Re: KASAN: null-ptr-deref Read in refcount_sub_and_test_checked (2)
From:   syzbot <syzbot+0468b73bdbb243217224@syzkaller.appspotmail.com>
To:     hverkuil-cisco@xs4all.nl, kyungmin.park@samsung.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        m.szyprowski@samsung.com, mchehab+samsung@kernel.org,
        mchehab@kernel.org, pawel@osciak.com,
        syzkaller-bugs@googlegroups.com, tfiga@chromium.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

syzbot suspects this bug was fixed by commit:

commit 62dcb4f41836bd3c44b5b651bb6df07ea4cb1551
Author: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Date:   Thu Nov 8 12:23:37 2018 +0000

     media: vb2: check memory model for VIDIOC_CREATE_BUFS

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=14972e41e00000
start commit:   ccda4af0 Linux 4.20-rc2
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=4a0a89f12ca9b0f5
dashboard link: https://syzkaller.appspot.com/bug?extid=0468b73bdbb243217224
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16d20893400000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=118f5a2b400000

If the result looks correct, please mark the bug fixed by replying with:

#syz fix: media: vb2: check memory model for VIDIOC_CREATE_BUFS

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
