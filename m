Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCE5367650B
	for <lists+linux-media@lfdr.de>; Sat, 21 Jan 2023 09:03:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbjAUIDf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 21 Jan 2023 03:03:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjAUIDe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 21 Jan 2023 03:03:34 -0500
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13324589AC
        for <linux-media@vger.kernel.org>; Sat, 21 Jan 2023 00:03:31 -0800 (PST)
Received: by mail-io1-f71.google.com with SMTP id y3-20020a5e8343000000b00704dc16167cso4154640iom.5
        for <linux-media@vger.kernel.org>; Sat, 21 Jan 2023 00:03:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9YJrK3JuBtS2QgULoPaUqzJ5BAj9a0fMy2abEiu2YnE=;
        b=L49uhh4yMkbrRcRJVOLR/HUsEM4j6lljX7GGfjWwAoYQZc6Bhz0hqzQdFXySgbXNDN
         o37gA92Lwz1UzYxDJ7GW7rS2yWF3a8GWgFVSfW23k0uU/IylQbbpY4jLcu9qaTaTyhYX
         weQzAPidLkMTOEpfy63FZsQNURZxVqkCVSBCOcYmQ6CM8MrQjM9uDMFIrfZEY64dnqUL
         LQ5fxoqmMOeXSoNinFDDgd3EpdXLdXdSQhDYIXHztJZTnlMpHQ2bMi1jII8tWp/bCaYS
         BzETrBZGZH4OAHqAem0TBtsSwYRqIIZEd/b0/5q9BMoBQLXBGRsNQrDcmy7x/PsHP9/Q
         AdhQ==
X-Gm-Message-State: AFqh2kpu2jEkSRSeSOdXy8Qdhrmw21YtS2vUt0isAYGH83K6XMMQpz2U
        6t7WS3EiU8gqZc5zrza7QkijH/uq+0BCC2bjDh3Y8hmuTBvt
X-Google-Smtp-Source: AMrXdXtPqnQD24z4QHzns98msXfMxweBfuSES5tn2xHrqj/aTn5dDoWGXHrTuSXBwVSqBBsabEwnei4Qg/cuYibJpTSGNeCzVJQr
MIME-Version: 1.0
X-Received: by 2002:a05:6638:41a4:b0:38a:3770:2fa2 with SMTP id
 az36-20020a05663841a400b0038a37702fa2mr1739324jab.208.1674288210933; Sat, 21
 Jan 2023 00:03:30 -0800 (PST)
Date:   Sat, 21 Jan 2023 00:03:30 -0800
In-Reply-To: <0000000000003a5c4905ef1044d6@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000107e1b05f2c19aa5@google.com>
Subject: Re: [syzbot] WARNING in get_vaddr_frames
From:   syzbot <syzbot+59a71007ccac79e8bb69@syzkaller.appspotmail.com>
To:     hverkuil@xs4all.nl, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, m.szyprowski@samsung.com,
        mchehab@kernel.org, syzkaller-bugs@googlegroups.com,
        tfiga@chromium.org, torvalds@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

syzbot has bisected this issue to:

commit 6647e76ab623b2b3fb2efe03a86e9c9046c52c33
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu Dec 1 00:10:52 2022 +0000

    v4l2: don't fall back to follow_pfn() if pin_user_pages_fast() fails

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=115987c5480000
start commit:   e4cf7c25bae5 Merge tag 'kbuild-fixes-v6.2' of git://git.ke..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=135987c5480000
console output: https://syzkaller.appspot.com/x/log.txt?x=155987c5480000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2651619a26b4d687
dashboard link: https://syzkaller.appspot.com/bug?extid=59a71007ccac79e8bb69
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16ee1934480000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=101b997c480000

Reported-by: syzbot+59a71007ccac79e8bb69@syzkaller.appspotmail.com
Fixes: 6647e76ab623 ("v4l2: don't fall back to follow_pfn() if pin_user_pages_fast() fails")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
