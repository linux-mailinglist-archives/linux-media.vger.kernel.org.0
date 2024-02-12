Return-Path: <linux-media+bounces-4970-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BACD8510AD
	for <lists+linux-media@lfdr.de>; Mon, 12 Feb 2024 11:24:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C51E01F22575
	for <lists+linux-media@lfdr.de>; Mon, 12 Feb 2024 10:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67584182A1;
	Mon, 12 Feb 2024 10:24:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F7118AEA
	for <linux-media@vger.kernel.org>; Mon, 12 Feb 2024 10:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707733462; cv=none; b=J0P96KvGEwceH4huHWuFfJ/zeUqUiptnMWuBwMvYj+ppuSJbVnhY1LMwa+iOde0k/budtbaUBCW7flumzfbN+s/NxMu21lCfSz0pQJ8UsFVjMwiJEk++2zl+dGxyVHa84iuG0cxOiCTjdpxY/S7Ec6Nj7pxfkzZZ3/HUSSC0KqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707733462; c=relaxed/simple;
	bh=BXo6EaA/HxDCl11YRQdW0f2qZos9jkOR0O7aqPAqQak=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=NRNLz9eqkrfAJYa7Uthtvw++ypU1ye1+ZN2Y5Euv82VEcF5m9zRLAA5sXYrXRShCCIqbddVtej6pk30hEySFhM3BQiTA5kajSrnRNRE/57ameM6p8Hkx6PXWpceXX2dq4hzRhs6FdONs+9Sw+mxogJWeD9tfcUaCQz+MQhEJxrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-363c88eff5aso26474395ab.1
        for <linux-media@vger.kernel.org>; Mon, 12 Feb 2024 02:24:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707733459; x=1708338259;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qmU/SGWkogq9oK1nP7heae05OFn/vB1cTpUNhNmJ5Ck=;
        b=vG7Laqh1l/sEKth5V28e7JQWYgF8uArAdXrudU+oZQoLemX0RBkdJ6Sk6l2hbqLaJt
         kOKjaCROqsZUYxDGs96R10aY6KmIYc+oMfiDroMJ1YbtZKx957IWfQvBZX1P6skDoqrZ
         QThFBG7NknowM2Wbz5ee2PexTym9XuggJiPmVwkv7+Bnb+aloc5KXScQjBmXfGzaYwUY
         hV4+Zp0OPURSqWw6faEU5utJPXNfJX4tmX+t8yx/PLQ3A3yYI27J2YQPy0Ifhz+2Sc9N
         YJC/tIY1+lKYGIhAGSV26CevhHWFmBfCqEYDzluSwX40h7ElQagNnAG8MNQse9UPSb2U
         xXKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDh+yVcKpCT3IXYhDGHpTIFnHYd5D9fbfc8+0H4+ygeF4xQ7fkUsotGG8BweCN/ajmnHSCUXUt91HGr2AVaC1S3QcenzTvTmBq3mM=
X-Gm-Message-State: AOJu0YyKuhiVaF2RImOuT0cWekxE6A+4GTS2QQL+NE5SUiSyx0hFheE2
	9xUELi82V1v08WZOolQ1fKvoPIv4mCkcfrpuREOF2hEdNMl8uSbseVJY5LcqdJjotL6G/PNH/9m
	LDZwRgWeO1WWyCfQe8rl8tvo+ZcaAAS3phvbTNdcSc24lNcYNyUqkKl4=
X-Google-Smtp-Source: AGHT+IGGNVeNpkQF2hAM4NlGHWWGNCkJjSw3YI4prsACWuGliVzlwLYQLCe7eqv9nPZruDQqjKJIWTPdnG/vV1GCm62zPm+naUCp
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:c24a:0:b0:363:c25b:75e7 with SMTP id
 k10-20020a92c24a000000b00363c25b75e7mr478883ilo.3.1707733459680; Mon, 12 Feb
 2024 02:24:19 -0800 (PST)
Date: Mon, 12 Feb 2024 02:24:19 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003c49c206112cae25@google.com>
Subject: [syzbot] Monthly media report (Feb 2024)
From: syzbot <syzbot+list4854992ca3cdf939a1f3@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello media maintainers/developers,

This is a 31-day syzbot report for the media subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/media

During the period, 3 new issues were detected and 0 were fixed.
In total, 16 issues are still open and 85 have been fixed so far.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 864     Yes   general protection fault in ir_raw_event_store_with_filter
                  https://syzkaller.appspot.com/bug?extid=34008406ee9a31b13c73
<2> 132     Yes   inconsistent lock state in sync_timeline_debug_remove
                  https://syzkaller.appspot.com/bug?extid=7dcd254b8987a29f6450
<3> 100     Yes   WARNING in media_create_pad_link
                  https://syzkaller.appspot.com/bug?extid=dd320d114deb3f5bb79b
<4> 87      Yes   WARNING in smsusb_start_streaming/usb_submit_urb
                  https://syzkaller.appspot.com/bug?extid=12002a39b8c60510f8fb
<5> 24      No    inconsistent lock state in valid_state (2)
                  https://syzkaller.appspot.com/bug?extid=a225ee3df7e7f9372dbe
<6> 3       Yes   KASAN: use-after-free Read in em28xx_init_extension (2)
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

