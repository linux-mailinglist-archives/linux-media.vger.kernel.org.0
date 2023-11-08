Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1EB27E596E
	for <lists+linux-media@lfdr.de>; Wed,  8 Nov 2023 15:46:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234739AbjKHOqJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Nov 2023 09:46:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234485AbjKHOqH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Nov 2023 09:46:07 -0500
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 078FE1FC3
        for <linux-media@vger.kernel.org>; Wed,  8 Nov 2023 06:46:05 -0800 (PST)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-3b2f3015ce6so10058810b6e.3
        for <linux-media@vger.kernel.org>; Wed, 08 Nov 2023 06:46:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699454764; x=1700059564;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eyg+x1sdBdUCTK9dEOdpm/i8Z98iZDIp/TYoaCFtNfI=;
        b=UJSC74cx7zsEeY8DK65HhmJ4HmDgGc2J9XcfrCNAfRnDUANrcAcjwW2TKCdWEFm9qC
         Kd30dRkynm5HFmNaLRLiHa7Ii/awNELedEkJ08T4TvpiXPEL9l/PGxg12LZG0+th1p9u
         oOgTDFFUQRrTHzMSTHUSQ/4gKg30uyJrN0e0WnZaY7aly1HFOOS4fVqEksaX0LaroO1M
         pAbdOylAG/PHIcx06XCHCqm7bpEoxTb32NxIG58stkhFNfQUVD0ria/i3JdFDe4s+30x
         2Y9iCNUhWPwXqdiOR9KuekhK6dHdFYh3jhWxnmKyLHER3t9qzv65r0BYSc67ZQCLmFfx
         bAjA==
X-Gm-Message-State: AOJu0YxoCfxNHurTMgvh9a1R/rCWBedA7umieV4pLFmPms/twXeCFKlW
        unwSinOt4Vkg/JUGNwwSzjdiYYnKxyagtoq4pPFaHMGYyesD
X-Google-Smtp-Source: AGHT+IHYVbPqVKNGXu+BvwkE/pRq1+khXE9q8J8tLhTwkKxlwRoFhUls2Br/4J25UUlY0OHXWCPFT/tsDkP8SnIUAsiU7jVq8Mz6
MIME-Version: 1.0
X-Received: by 2002:a05:6808:138d:b0:3a7:86b2:1950 with SMTP id
 c13-20020a056808138d00b003a786b21950mr789798oiw.0.1699454764313; Wed, 08 Nov
 2023 06:46:04 -0800 (PST)
Date:   Wed, 08 Nov 2023 06:46:04 -0800
In-Reply-To: <0000000000002a4da90603a5cbbf@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000089f4110609a525b2@google.com>
Subject: Re: [syzbot] [dri?] kernel BUG in vmf_insert_pfn_prot (2)
From:   syzbot <syzbot+398e17b61dab22cc56bc@syzkaller.appspotmail.com>
To:     airlied@gmail.com, airlied@linux.ie, christian.koenig@amd.com,
        daniel.vetter@ffwll.ch, daniel.vetter@intel.com, daniel@ffwll.ch,
        dri-devel@lists.freedesktop.org, hdanton@sina.com,
        linaro-mm-sig-bounces@lists.linaro.org,
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

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=126094df680000
start commit:   d2f51b3516da Merge tag 'rtc-6.7' of git://git.kernel.org/p..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=116094df680000
console output: https://syzkaller.appspot.com/x/log.txt?x=166094df680000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1ffa1cec3b40f3ce
dashboard link: https://syzkaller.appspot.com/bug?extid=398e17b61dab22cc56bc
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16344918e80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=156bb2c0e80000

Reported-by: syzbot+398e17b61dab22cc56bc@syzkaller.appspotmail.com
Fixes: 45d9c8dde4cd ("drm/vgem: use shmem helpers")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
