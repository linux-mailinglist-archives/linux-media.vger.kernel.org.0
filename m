Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87B2BF3035
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2019 14:43:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389504AbfKGNnX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Nov 2019 08:43:23 -0500
Received: from mail-io1-f70.google.com ([209.85.166.70]:49418 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389036AbfKGNmH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Nov 2019 08:42:07 -0500
Received: by mail-io1-f70.google.com with SMTP id x1so1843977ior.16
        for <linux-media@vger.kernel.org>; Thu, 07 Nov 2019 05:42:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=WTUaaUrmKVHorKvakIXCTTRuudk2YAQScGxgofVTkUI=;
        b=IgyzhoH68+HoxY7VV8FHssNfGmzQ1jOJ5kGF+mNsnJ53QBtnrhnjk/TcUiFkwsbO3+
         uxeSfvuJxo7DNRYG29Mtl1BfctNweNaVPLGB0PUw58hdrJTK7xGkTTweeNYW8Et/VoLe
         YU29ojnjqzIDDq736NV2IekfFROQWxDGVclj8AOamguzD8iYObFRWltsy6/uYhO3GLJP
         xLQCVB1R+BWJH8sbs3nseRjK7puPBN+opZtUG0LJ7YBaBmbIvtbUGI50hHzaPpNLkM69
         fMApIHnU5Q0sjubKJ4Ybq24EuIsD1WW6eZumaPzNVMdVI1DNvNkhCNLPOPRRGVzxQLCe
         AOBQ==
X-Gm-Message-State: APjAAAWAW65eR4iMsetUAah/oIob1JLCEvuQB9Nf5ENeuZJWLfZNaWJj
        Fk1jz0QUnWHi94HYnv8F/k0QcuTcHP4ULpDCurl0wgeHdgSv
X-Google-Smtp-Source: APXvYqzOTbKLWUtJfV+eTnZAGIHCOihW1P53mf2MSnAtW+U2zup71yFaexRFHdR5rbJrPPIrMXY88woVwchxPC8nR165HI7yQ6Is
MIME-Version: 1.0
X-Received: by 2002:a5d:8c94:: with SMTP id g20mr3746490ion.13.1573134126988;
 Thu, 07 Nov 2019 05:42:06 -0800 (PST)
Date:   Thu, 07 Nov 2019 05:42:06 -0800
In-Reply-To: <000000000000aa8703057a7ea0bb@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d2c94e0596c1d47b@google.com>
Subject: Re: WARNING in dma_buf_vunmap
From:   syzbot <syzbot+a9317fe7ad261fc76b88@syzkaller.appspotmail.com>
To:     andy@greyhouse.net, davem@davemloft.net,
        dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
        hverkuil-cisco@xs4all.nl, j.vosburgh@gmail.com,
        kyungmin.park@samsung.com, linaro-mm-sig-owner@lists.linaro.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, m.szyprowski@samsung.com,
        maheshb@google.com, mchehab+samsung@kernel.org, mchehab@kernel.org,
        netdev@vger.kernel.org, pawel@osciak.com, sumit.semwal@linaro.org,
        syzkaller-bugs@googlegroups.com, tfiga@chromium.org,
        vfalico@gmail.com
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

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=116af11c600000
start commit:   d41217aa Merge tag 'pci-v4.20-fixes-1' of git://git.kernel..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=4a0a89f12ca9b0f5
dashboard link: https://syzkaller.appspot.com/bug?extid=a9317fe7ad261fc76b88
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16f7b6f5400000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=105a2783400000

If the result looks correct, please mark the bug fixed by replying with:

#syz fix: media: vb2: check memory model for VIDIOC_CREATE_BUFS

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
