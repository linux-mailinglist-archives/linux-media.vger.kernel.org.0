Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74F6A34800A
	for <lists+linux-media@lfdr.de>; Wed, 24 Mar 2021 19:09:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237269AbhCXSIe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Mar 2021 14:08:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237390AbhCXSIB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Mar 2021 14:08:01 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59B76C061763;
        Wed, 24 Mar 2021 11:08:01 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id y6so28727536eds.1;
        Wed, 24 Mar 2021 11:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=i6Nd1C9K3ZraC2/KtD2Rji9JytGeIDO3RPQibjjH3KY=;
        b=czOt+2PIPQJVMPtYEWiwYuV5Dx2aEzpj+vkZZ/H82wcGE0PGXCddsSXzHpC5R3Ke+s
         wZqiSYRIgHXspyeIGk5rqsWQnio7AEKxh1zrLgFAAQxhmzsblyhsc0tpGly6TYkRtU8U
         kpINGKHCMr8aNehUwGCvHCGheUmdLhmkfaNVwQJKEXE4NDu6P4SpUPsVBy/LcN8/zUXu
         S0D7WE2lppRjzoka+RYRdetDBkMZUvGST7TxfjkduHJTov2C1pO7z3/iBGjrI9S9sB/D
         GUe9eHBklWEiy4q4aupLXcl1mQwNEwVPA3DIeXZpscwXdnwrcqSkqs3kc4reiog6hYul
         9pwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=i6Nd1C9K3ZraC2/KtD2Rji9JytGeIDO3RPQibjjH3KY=;
        b=rg0DyRsMqzUPE2rQWc/xeD/BcjZo+rz1MYPxaOqTGHjCob67foEM5I1CdywOKIdSLw
         0mmlxAjpFWgFhHiEDPgp6khu4fopOaokMPMNnMvb30YLFEMDmvKusmTppT/HFhh9Dfp8
         CJxJETxjMfJwYBElot0EL7nlce1VYnd6UmsB9OHxahxF+/2sROnQOuj31n0E/PZ3wC7Z
         YElGrYLthrsimNIaQVqmbO/qO7TNnjWjffD+kl9buDkWGd11EvehLMijv9VgfqQacNiy
         wTi2rZfGud3S6sd6fRgkANmtEXsmkTCCEN6DJtO1UfXQQyeSOKf2PvyDvRn/FPPhZbFk
         JzDQ==
X-Gm-Message-State: AOAM530CCrPTEGA8LmBsHjHq9a9sKagwMwHPOqi/hxHstoqqd+kol/u3
        OU548Ork3HMxF1UKOIv8sdtJ7G1oKNQz5w==
X-Google-Smtp-Source: ABdhPJypkFPURoaW9FT3EuqK1fTNhl71D/FDAEiBXgnhBtr8dShMtXlMtAgHnS0mOezuAYGV6jurUg==
X-Received: by 2002:aa7:c3c4:: with SMTP id l4mr4768865edr.335.1616609279776;
        Wed, 24 Mar 2021 11:07:59 -0700 (PDT)
Received: from LEGION ([111.119.187.57])
        by smtp.gmail.com with ESMTPSA id r24sm1470489edw.11.2021.03.24.11.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 11:07:59 -0700 (PDT)
Date:   Wed, 24 Mar 2021 23:07:53 +0500
From:   Muhammad Usama Anjum <musamaanjum@gmail.com>
To:     linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "open list:EM28XX VIDEO4LINUX DRIVER" <linux-media@vger.kernel.org>
Cc:     musamaanjum@gmail.com, syzkaller-bugs@googlegroups.com,
        dvyukov@google.com
Subject: [PATCH] media: em28xx: fix memory leak
Message-ID: <20210324180753.GA410359@LEGION>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If some error occurs, URB buffers should also be freed. If they aren't
freed with the dvb here, the em28xx_dvb_fini call doesn't frees the URB
buffers as dvb is set to NULL. The function in which error occurs should
do all the cleanup for the allocations it had done.

Tested the patch with the reproducer provided by syzbot. This patch
fixes the memleak.

Reported-by: syzbot+889397c820fa56adf25d@syzkaller.appspotmail.com
Signed-off-by: Muhammad Usama Anjum <musamaanjum@gmail.com>
---
Resending the same path as some email addresses were missing from the
earlier email.

syzbot found the following issue on:

HEAD commit:    1a4431a5 Merge tag 'afs-fixes-20210315' of git://git.kerne..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11013a7cd00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ff6b8b2e9d5a1227
dashboard link: https://syzkaller.appspot.com/bug?extid=889397c820fa56adf25d
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1559ae3ad00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=176985c6d00000

 drivers/media/usb/em28xx/em28xx-dvb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/usb/em28xx/em28xx-dvb.c b/drivers/media/usb/em28xx/em28xx-dvb.c
index 526424279637..471bd74667e3 100644
--- a/drivers/media/usb/em28xx/em28xx-dvb.c
+++ b/drivers/media/usb/em28xx/em28xx-dvb.c
@@ -2010,6 +2010,7 @@ static int em28xx_dvb_init(struct em28xx *dev)
 	return result;
 
 out_free:
+	em28xx_uninit_usb_xfer(dev, EM28XX_DIGITAL_MODE);
 	kfree(dvb);
 	dev->dvb = NULL;
 	goto ret;
-- 
2.25.1

