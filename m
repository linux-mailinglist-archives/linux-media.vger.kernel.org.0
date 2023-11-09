Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DF567E7480
	for <lists+linux-media@lfdr.de>; Thu,  9 Nov 2023 23:45:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232589AbjKIWp2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Nov 2023 17:45:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230339AbjKIWp1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Nov 2023 17:45:27 -0500
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 730243C2F
        for <linux-media@vger.kernel.org>; Thu,  9 Nov 2023 14:45:25 -0800 (PST)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-6c337818f4cso1554105b3a.1
        for <linux-media@vger.kernel.org>; Thu, 09 Nov 2023 14:45:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699569925; x=1700174725;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7xezopyy8MxVgNtshsqSuylmJc2IDcIylCxLiCRGiAc=;
        b=E/wrmV70QtyOMa+FsuYOWOtR/O+aw4Sf4ehoTNTkN1vPGmVznQLpoUNYZkTucy2KQE
         8cdl7JWTKH78DHKVCuY2qicqYH0GuBf+t9VpAC/ktu5NXF0sYy6rD8brYB3aJNuXRO+8
         lH6bG+6G5S6qxEj2c429wSmbGNKXCzImMD92AQZO/0zGZVYnUjCH75IAxGZ7qd4nKG7n
         XVuIcym/JW1W9PUr2qCmtJd73MizqJRh8jPr8Mgu4QOxmztgELKOxJG1AzVZYLRgCzGo
         TGkRCEPaKvQNyd2ktDDZa/H72v5UnuNK9dZfcgb6kzlRAjPV7F1YEyeBREkIKfM+2aOo
         oc/A==
X-Gm-Message-State: AOJu0Yx/Xyv7H69yqdsAZA+sIo72widr26TLgmjjhQdZd03jN/NRheZL
        Prwdof3jGnb+GqA2O6U/VWiBkQdiUXM954REOeZbMa+Swzqo
X-Google-Smtp-Source: AGHT+IGE5IGuvgPabWf7DMfFSpMaXLgcCLsZ53HnjBBnhr/lkKMqc0gLLCFMbCmno8ePUXqiFRc5T0yCCiVvsuZoR/5YLddzAOrC
MIME-Version: 1.0
X-Received: by 2002:a05:6a00:d5e:b0:690:2ecd:a5a1 with SMTP id
 n30-20020a056a000d5e00b006902ecda5a1mr775330pfv.5.1699569924945; Thu, 09 Nov
 2023 14:45:24 -0800 (PST)
Date:   Thu, 09 Nov 2023 14:45:24 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a5bec30609bff5d1@google.com>
Subject: [syzbot] Monthly media report (Nov 2023)
From:   syzbot <syzbot+list8d07219aa07359fcd9e4@syzkaller.appspotmail.com>
To:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello media maintainers/developers,

This is a 31-day syzbot report for the media subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/media

During the period, 0 new issues were detected and 0 were fixed.
In total, 12 issues are still open and 85 have been fixed so far.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 820     Yes   general protection fault in ir_raw_event_store_with_filter
                  https://syzkaller.appspot.com/bug?extid=34008406ee9a31b13c73
<2> 96      Yes   WARNING in media_create_pad_link
                  https://syzkaller.appspot.com/bug?extid=dd320d114deb3f5bb79b
<3> 83      Yes   WARNING in smsusb_start_streaming/usb_submit_urb
                  https://syzkaller.appspot.com/bug?extid=12002a39b8c60510f8fb
<4> 51      Yes   KASAN: use-after-free Read in send_packet
                  https://syzkaller.appspot.com/bug?extid=f1a69784f6efe748c3bf
<5> 3       Yes   KASAN: use-after-free Read in em28xx_init_extension (2)
                  https://syzkaller.appspot.com/bug?extid=99d6c66dbbc484f50e1c

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
