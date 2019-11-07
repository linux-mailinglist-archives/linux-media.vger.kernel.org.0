Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9B27F3032
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2019 14:43:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389498AbfKGNnU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Nov 2019 08:43:20 -0500
Received: from mail-il1-f200.google.com ([209.85.166.200]:38091 "EHLO
        mail-il1-f200.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389045AbfKGNmH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Nov 2019 08:42:07 -0500
Received: by mail-il1-f200.google.com with SMTP id f6so2669738ilg.5
        for <linux-media@vger.kernel.org>; Thu, 07 Nov 2019 05:42:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=faF2E7beRwWoi3uIIILRzqXOv61MWqBCOVzVfmKvnUo=;
        b=ZrUNP6pA7Qn2crtlU+TuqG0fttiupANR47gcGRHiAV9BE54oHULBBk4TQFw9ZERPp/
         38TpzU/uPU1uAZ+OTsOmY/ylWxWZlhm6DUlT3V5aCqGLeU3Oq/BAgcovJbMqDaknV4j2
         qdzTxAYaO2qB8YbhwPg0eZOM3MePqjI27IITG6uT4+z+Z/kHSLuNuwjYnN67qvtiT/zD
         bwmD9QV/wXM1XoAPNpahU7AVo5nkraTB3GfMp20CVGoSZPXL3khzAgoR7lcV3CLC+6Uz
         Qp4Z8xOKj2F2gH/1fPeaqZn+E5YpNz0G79PA4F6dH3vIfItT51Fv+rmm90im2ihYaPk5
         Yq7A==
X-Gm-Message-State: APjAAAVS1QTsslK3oNBAZpavTcAr9/kNQxS1L33XLa0h1jkCx9BqQTIQ
        riMFaTQe86XNY+cLx6IISDRb9dnq7BeJdXZW1kOwNKXxG5qN
X-Google-Smtp-Source: APXvYqzVYKWM2YDzF62mA7+9NC0nUV+ZtoPDNThvpzi9h0wK92j8hN87irxPomSaO4dsmofOF+c0rPnm4WVvuK8z7Omam0qTsX8s
MIME-Version: 1.0
X-Received: by 2002:a5e:d716:: with SMTP id v22mr3377836iom.152.1573134127190;
 Thu, 07 Nov 2019 05:42:07 -0800 (PST)
Date:   Thu, 07 Nov 2019 05:42:07 -0800
In-Reply-To: <00000000000014008b057a598671@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d5dacd0596c1d41e@google.com>
Subject: Re: general protection fault in vb2_mmap
From:   syzbot <syzbot+52e5bf0ebfa66092937a@syzkaller.appspotmail.com>
To:     hansverk@cisco.com, hverkuil@xs4all.nl, kyungmin.park@samsung.com,
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

commit cd26d1c4d1bc947b56ae404998ae2276df7b39b7
Author: Hans Verkuil <hverkuil@xs4all.nl>
Date:   Tue Nov 13 14:06:46 2018 +0000

     media: vb2: vb2_mmap: move lock up

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=101a70e2600000
start commit:   e12e00e3 Merge tag 'kbuild-fixes-v4.20' of git://git.kerne..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=8f215f21f041a0d7
dashboard link: https://syzkaller.appspot.com/bug?extid=52e5bf0ebfa66092937a
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14c61b0b400000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=109d545d400000

If the result looks correct, please mark the bug fixed by replying with:

#syz fix: media: vb2: vb2_mmap: move lock up

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
