Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDB7D72EBDC
	for <lists+linux-media@lfdr.de>; Tue, 13 Jun 2023 21:24:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240710AbjFMTXw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Jun 2023 15:23:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240618AbjFMTXm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Jun 2023 15:23:42 -0400
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B54FD1BEC
        for <linux-media@vger.kernel.org>; Tue, 13 Jun 2023 12:23:34 -0700 (PDT)
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-33b59d59193so65097535ab.0
        for <linux-media@vger.kernel.org>; Tue, 13 Jun 2023 12:23:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686684214; x=1689276214;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EWR0nHL39obXZ4tJlQ5WVdz7nMKP7k+coo8SdN3K02E=;
        b=CKX87I/MzhSlA7IDF/pkUQ92xF62C0Rd9mDpcmV3aIfJDNj5p9udLvLaBYwVVVQeYM
         GcPmC2PfD0HEhMW5yrGZmt2yPVCV++MBrH/qKkXWnGZftWzaR3giQ0rXF3Cy34oNdDDs
         IwAWIM1ztb87zYtlITzn087xRZmh8Z6ZIouRSdd25L7wqhnn6WBdNbSFGeksikJTnXge
         xJZHUjbbXNa3fxnGsE8B5U1KLE3QLFgRfWim5sltxhSdYiLs+nlcSJ4uiFuoGdhvibef
         elpCkVTsv4AZemPsjKveIUo1fcXRZ0IlXtfJiyuYpYoT8mKnCswo5o3Os2NcIKQv//ND
         TADw==
X-Gm-Message-State: AC+VfDwvkB6VJn1ozToNsfK9QsaFbFMa95iYovlh9KiWQdthlFaT16rj
        8EydDyCrNL4e6dlk7J+1aTV4GGu6oqog8vG2A3wgPKLGlsE1
X-Google-Smtp-Source: ACHHUZ5mm+7XBQyFXmAboSSa7oz3FdFPxuwVp/0Ka1gF66Q3bahA2vN1w+3xFfJxjFNUEWcjVOreDOitShpXj9ttEQQ5k5mP9vg1
MIME-Version: 1.0
X-Received: by 2002:a92:c948:0:b0:33e:7b40:18bd with SMTP id
 i8-20020a92c948000000b0033e7b4018bdmr5844858ilq.5.1686684214063; Tue, 13 Jun
 2023 12:23:34 -0700 (PDT)
Date:   Tue, 13 Jun 2023 12:23:34 -0700
In-Reply-To: <000000000000fe7dd005cc2d77c0@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000006d819905fe07c52f@google.com>
Subject: Re: [syzbot] kernel BUG in vmf_insert_pfn_prot
From:   syzbot <syzbot+2d4f8693f438d2bd4bdb@syzkaller.appspotmail.com>
To:     airlied@gmail.com, airlied@linux.ie, christian.koenig@amd.com,
        daniel.vetter@ffwll.ch, daniel.vetter@intel.com, daniel@ffwll.ch,
        dri-devel@lists.freedesktop.org, javierm@redhat.com,
        linaro-mm-sig-owner@lists.linaro.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, suijingfeng@loongson.cn,
        sumit.semwal@linaro.org, syzkaller-bugs@googlegroups.com,
        tzimmermann@suse.de, zackr@vmware.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

syzbot suspects this issue was fixed by commit:

commit a5b44c4adb1699661d22e5152fb26885f30a2e4c
Author: Thomas Zimmermann <tzimmermann@suse.de>
Date:   Mon Mar 20 15:07:44 2023 +0000

    drm/fbdev-generic: Always use shadow buffering

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1025ee07280000
start commit:   0326074ff465 Merge tag 'net-next-6.1' of git://git.kernel...
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=d323d85b1f8a4ed7
dashboard link: https://syzkaller.appspot.com/bug?extid=2d4f8693f438d2bd4bdb
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14fd1182880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17567514880000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: drm/fbdev-generic: Always use shadow buffering

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
