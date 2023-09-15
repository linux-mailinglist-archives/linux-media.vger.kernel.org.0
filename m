Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE7AD7A2577
	for <lists+linux-media@lfdr.de>; Fri, 15 Sep 2023 20:19:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234857AbjIOSTC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Sep 2023 14:19:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233822AbjIOSSc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Sep 2023 14:18:32 -0400
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AADD1FD6
        for <linux-media@vger.kernel.org>; Fri, 15 Sep 2023 11:18:27 -0700 (PDT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-1d6659a4207so1327468fac.0
        for <linux-media@vger.kernel.org>; Fri, 15 Sep 2023 11:18:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694801907; x=1695406707;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2VqufmfxjSUb4XqKQu2eQXU3QONq2sl0HERC26tPXI0=;
        b=fqOEilfXzHN/Gj5ibf0vZ8qrPYRK/6DZ8Bvc54ly8CITMKYIEKhjssotMDRWW6gygD
         vaXbPzPGdEm3itkWULQ8bC4uSdTEyer0Dx0YzyzBLXasBZ4ny6wRXuGU6rvhDqvtFjxq
         wuIhhC7/TI9a49gXBRg0+s51LeRILFq2H6JrGosrVxv8ZQt8MQLSEsTbD71BRhxSGL4H
         TCM2O/uYao4kQ+I5GnL8zkHkFK2BVeKXQh49o5VhRbra0vRbMenqMFZf1WTzxPvsPYnT
         wVk59AnkK/YLDtw/WvtHYZX72akLNQhinRrpoOKCJ4UGCCSEQYJ+7gjkpl/hY/ciQKcR
         vbOQ==
X-Gm-Message-State: AOJu0Yw3xvF7sDVCYCSqc7b2ZDcYkXuF0ZU0VYTu1GXO51ifdtuRYgSv
        fTcWsbFKs9m8rsL4DokI1xM4HljKP+PFmz3AiQVaHf1NoYrD
X-Google-Smtp-Source: AGHT+IHJk3PMmbnZmZM8RAAdi9QO4c+58BuymeUxaU3YwVtig0M8O4dFyhBNpBSzru7Dewszo4NjkQUbjE39n+z4Yr9WF1ychMzG
MIME-Version: 1.0
X-Received: by 2002:a05:6870:c789:b0:1d1:3ad6:bb99 with SMTP id
 dy9-20020a056870c78900b001d13ad6bb99mr738883oab.2.1694801906800; Fri, 15 Sep
 2023 11:18:26 -0700 (PDT)
Date:   Fri, 15 Sep 2023 11:18:26 -0700
In-Reply-To: <000000000000be3c1a0604b53a1c@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000009e9e1b060569d17c@google.com>
Subject: Re: [syzbot] [mm?] kernel BUG in filemap_unaccount_folio
From:   syzbot <syzbot+17a207d226b8a5fb0fd9@syzkaller.appspotmail.com>
To:     akpm@linux-foundation.org, christian.koenig@amd.com,
        daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        fengwei.yin@intel.com, gurchetansingh@chromium.org,
        hughd@google.com, kraxel@redhat.com,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mm@kvack.org,
        sumit.semwal@linaro.org, syzkaller-bugs@googlegroups.com,
        vivek.kasireddy@intel.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

syzbot has bisected this issue to:

commit 5c074eeabbd332b11559f7fc1e89d456f94801fb
Author: Gerd Hoffmann <kraxel@redhat.com>
Date:   Wed Nov 14 12:20:29 2018 +0000

    udmabuf: set read/write flag when exporting

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12b21bbfa80000
start commit:   db906f0ca6bb Merge tag 'phy-for-6.6' of git://git.kernel.o..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=11b21bbfa80000
console output: https://syzkaller.appspot.com/x/log.txt?x=16b21bbfa80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3bd57a1ac08277b0
dashboard link: https://syzkaller.appspot.com/bug?extid=17a207d226b8a5fb0fd9
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11609f38680000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14c1fc00680000

Reported-by: syzbot+17a207d226b8a5fb0fd9@syzkaller.appspotmail.com
Fixes: 5c074eeabbd3 ("udmabuf: set read/write flag when exporting")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
