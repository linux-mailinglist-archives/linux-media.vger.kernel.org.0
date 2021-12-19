Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDBFD47A138
	for <lists+linux-media@lfdr.de>; Sun, 19 Dec 2021 16:57:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235953AbhLSP5I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Dec 2021 10:57:08 -0500
Received: from mail-io1-f72.google.com ([209.85.166.72]:54032 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231843AbhLSP5I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Dec 2021 10:57:08 -0500
Received: by mail-io1-f72.google.com with SMTP id a12-20020a056602148c00b005e7052734adso5525932iow.20
        for <linux-media@vger.kernel.org>; Sun, 19 Dec 2021 07:57:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=J1Z0E8FYOyeGYmMCih47JGz9INwvVqcSBEE3r+oJjRA=;
        b=vRZI4Ghtq2g1QX6WM9TCojKgCOWXMjxFKK2XrexjgSiubGcA5Lq0BXd1RfckfLB2M1
         gqg81phsCWH1OhbuuQkl919uIyln8gpAQ25yqGazOTHsJyNlkYpK7a3rcUW6LqlTAzp6
         MyqmWT+VzBapFRCSf6LGaxGlYwuDZqZKW/nQCrWISxwt4pEbAnnajtB8V3GKZE3taR9L
         pJzbLSpE2XAfq81AStFekG7v8iTTGrNQdLfkikINwOpZewz9/Ie1VXOV8Bb80YLcaQ6j
         PJwgCaypSbpYugO/NeAArDmn6JTHHMrdAaLKNu2sCXb5LRUwBXRIkR2dpI6PClp6+Esi
         /+OA==
X-Gm-Message-State: AOAM531UnpMeX3sqeG9z1JF0OzD1JFzPIJUZ6Y1MYmjh86llMniJvrw6
        jeqmnbCXl8NpgAedBFeFOhb2iyUkwpRW8htO1r2P8YmvxAKa
X-Google-Smtp-Source: ABdhPJzibjb8GU6GjM7AflOG1x8TLswRn7G6hxR5g2tBuxN6SrcEX/7NjUMQhAmD4CNcXRBnPUoAQBEM5E0iq4KRPSEZAzxtSFzJ
MIME-Version: 1.0
X-Received: by 2002:a6b:2cc1:: with SMTP id s184mr6122309ios.63.1639929427727;
 Sun, 19 Dec 2021 07:57:07 -0800 (PST)
Date:   Sun, 19 Dec 2021 07:57:07 -0800
In-Reply-To: <000000000000685c4605d0e47dad@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ff1c4105d381d24f@google.com>
Subject: Re: [syzbot] KASAN: use-after-free Read in drm_gem_object_release_handle
From:   syzbot <syzbot+c8ae65286134dd1b800d@syzkaller.appspotmail.com>
To:     airlied@linux.ie, christian.koenig@amd.com, daniel.vetter@ffwll.ch,
        daniel.vetter@intel.com, daniel@ffwll.ch,
        dri-devel@lists.freedesktop.org,
        linaro-mm-sig-owner@lists.linaro.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, sumit.semwal@linaro.org,
        syzkaller-bugs@googlegroups.com, tzimmermann@suse.de
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

syzbot has bisected this issue to:

commit 45d9c8dde4cd8589f9180309ec60f0da2ce486e4
Author: Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Thu Aug 12 13:14:12 2021 +0000

    drm/vgem: use shmem helpers

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=147953cbb00000
start commit:   3f667b5d4053 Merge tag 'tty-5.16-rc6' of git://git.kernel...
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=167953cbb00000
console output: https://syzkaller.appspot.com/x/log.txt?x=127953cbb00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=fa556098924b78f0
dashboard link: https://syzkaller.appspot.com/bug?extid=c8ae65286134dd1b800d
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16fd41ebb00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1483c7d5b00000

Reported-by: syzbot+c8ae65286134dd1b800d@syzkaller.appspotmail.com
Fixes: 45d9c8dde4cd ("drm/vgem: use shmem helpers")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
