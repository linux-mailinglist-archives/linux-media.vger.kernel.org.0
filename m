Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 882F146D8E1
	for <lists+linux-media@lfdr.de>; Wed,  8 Dec 2021 17:50:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237307AbhLHQxy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Dec 2021 11:53:54 -0500
Received: from mail-il1-f200.google.com ([209.85.166.200]:42857 "EHLO
        mail-il1-f200.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234667AbhLHQxx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Dec 2021 11:53:53 -0500
Received: by mail-il1-f200.google.com with SMTP id l3-20020a056e021c0300b0029fcec8f2ccso3803302ilh.9
        for <linux-media@vger.kernel.org>; Wed, 08 Dec 2021 08:50:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=Y2MKn0H4DmrM0L6Iz1p6QeMbYkp5ONn3ncEFOG9HuPY=;
        b=sCbQZcEjHqJJ7wSM6Zs/zsxZldTnOZJrEYYFl/HQDDiDGkpgNDm3Js54eC/8ZfooQT
         Sgl5wfVz63t8wFzTzeDz5eZyoizIH4rGOt/7KKb0cKxJMiAhifLfwWrda6GF2yKkv5/z
         cquVn6PqO3iSyMWzQtQwkNTN4ADHOsTw9wdf5FL9c+Xv+7jzovi0GQP6pgOkUDu/bp/F
         B03bxV6sLjJuYtt2QB61cjM3G35mmolkVKl/hiGTN0O09t0uNeD3Pal5OdCEMBSFV2x4
         1qNEy83JxiZYRVIKJa9rp/4lHQNgZ0dwXAbTtmNkl4bEPt/wbu8nbZaJV7MK9zfeDeJ0
         kwhA==
X-Gm-Message-State: AOAM532Gx3DxheH9SqF3/fzYb3aS1R+xvgr0IElTT8dNAjV7GA8Sp79L
        BoFOO/So0tFxaa7dgQDRNCU56zAuLukuIf0rMtM51QmZvmy9
X-Google-Smtp-Source: ABdhPJyc/riIjsNBQquRKBx3zhx7T0mOnltc1lRv7qgl6QjY5+31fT0TFfCdocEuGFSE/lTjXS8RldIflBOMK6IqQjFPpAs7TNHi
MIME-Version: 1.0
X-Received: by 2002:a92:d8cf:: with SMTP id l15mr8724262ilo.59.1638982221538;
 Wed, 08 Dec 2021 08:50:21 -0800 (PST)
Date:   Wed, 08 Dec 2021 08:50:21 -0800
In-Reply-To: <000000000000b5e7f105d0d2d165@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001bab9705d2a549cb@google.com>
Subject: Re: [syzbot] WARNING in __i2c_transfer (2)
From:   syzbot <syzbot+e417648b303855b91d8a@syzkaller.appspotmail.com>
To:     dwlsalmeida@gmail.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab+huawei@kernel.org, mchehab@kernel.org,
        syzkaller-bugs@googlegroups.com, wsa@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

syzbot has bisected this issue to:

commit f90cf6079bf67988f8b1ad1ade70fc89d0080905
Author: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
Date:   Fri Aug 21 12:58:47 2020 +0000

    media: vidtv: add a bridge driver

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=152b58b1b00000
start commit:   cd8c917a56f2 Makefile: Do not quote value for CONFIG_CC_IM..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=172b58b1b00000
console output: https://syzkaller.appspot.com/x/log.txt?x=132b58b1b00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=221ffc09e39ebbd1
dashboard link: https://syzkaller.appspot.com/bug?extid=e417648b303855b91d8a
userspace arch: i386
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17a68531b00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16b91d89b00000

Reported-by: syzbot+e417648b303855b91d8a@syzkaller.appspotmail.com
Fixes: f90cf6079bf6 ("media: vidtv: add a bridge driver")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
