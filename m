Return-Path: <linux-media+bounces-11456-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BEE8C5C7C
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2024 22:49:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BEF31C21C49
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2024 20:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7374181BA6;
	Tue, 14 May 2024 20:49:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21959339A0
	for <linux-media@vger.kernel.org>; Tue, 14 May 2024 20:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715719776; cv=none; b=Hyvfbey1QzKmoU94mjI6Wrw0SSx1MsCbpTjDBfg6UJd/S5ZMcm2SFAMsjtpVOXqDrnQBPrPvYhZFORfOx65t2e1uPthhQmqKpI/xyepS+TJx/79GX7iFvqXRf+NJplWTWBw+M2LrV382fl6WQy5vnRVtREIpHuxGncUzu9D68xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715719776; c=relaxed/simple;
	bh=sb/w448t3QvOx7CHELU+4qJO8sYWAr1XIU8OnIwbVKM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=MgwanoPvtcl9Xbeur5yCsIV3EiNNaxvovbOON+MogzzagqIFcfkUZMFGpdj9wvD+FP4U/35gQGnogXBsXRXhe02Kx9tRUzVACHaiuuW3edkQ0rAQkB9OiuyH3lWiLtQ0AF/N7a5+tPZhrpfIAS8gLWcGAg438pk7z0eOnyq5jm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-7e1d7031f4aso401408239f.1
        for <linux-media@vger.kernel.org>; Tue, 14 May 2024 13:49:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715719774; x=1716324574;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0fhOpcMa+IfAfyYysD+8xhMJZLJtycpGTWFWPc7vCQ0=;
        b=Ab1GuTeik6aGR5uNFycXBmC9lUxI7I3VYGLbDLU3zW+aY/QtmeCFovv3nLEWB38VcH
         iLzbqkDzqRi+NEA0w2dk3WDJf/N89oMAf9EhC7kUHUGXzg6sq1ppVbRaJxPBe55lxY8Z
         NUwXYY1D0YjgAa9HpXkj9Zig3BzL957YllrwJALIBV1tEo+XjuG8E4NZPzrhHW5oUQzq
         SGtNGHoRfxVkDXX7Z6+bHz4xtZi3iIGdRQGdUGCC97KG3+yNoUypdBoepmt+77tg3nh2
         AZiyv0+M7hAqvbNsfIe5OYpuMqiIogKajhexYbDZHZXfBs29yEbtyq4W/1TXMBn6GPlA
         Vk9A==
X-Forwarded-Encrypted: i=1; AJvYcCWBKDJCk+6ksYmxcGD0o68jl05Ept3cGVNHLpsX5g/XDaVwuBWCtU4FG8guxzXkdmPrj0pssa1tnCYOvxglU6VaO9/fs4Q10lH+C3Q=
X-Gm-Message-State: AOJu0YxrD6WRIgg+UigwzET+1L+jkogu7fE5khD4aTzt0yhJXCkeZcnv
	w6Dh/bHO5BXzm3h5GT7wSUK9mlO7G1fo/G1jCuv3a4XXkKQRnY3s4NeAl2qfDvO/sZBdoawaoEx
	IF6wsMthbsRhbDIvXP9UsKvJAflKqWLO2ql5Km/8rpNf2DYV9traG9WI=
X-Google-Smtp-Source: AGHT+IHPKp8m0TA28157LGSAcJemp5rUEohRkaNJngQr/WoEHAmX1xvJFDH0HcVKBOJGJuLjJ3dzXsH/XUqJTFAFcdHEX+reERQk
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:2728:b0:48a:37e1:a553 with SMTP id
 8926c6da1cb9f-48a37e1a71fmr59794173.0.1715719774395; Tue, 14 May 2024
 13:49:34 -0700 (PDT)
Date: Tue, 14 May 2024 13:49:34 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000afec080618702339@google.com>
Subject: [syzbot] Monthly media report (May 2024)
From: syzbot <syzbot+listf54da26a126f0ba232c7@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello media maintainers/developers,

This is a 31-day syzbot report for the media subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/media

During the period, 0 new issues were detected and 0 were fixed.
In total, 18 issues are still open and 85 have been fixed so far.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 13266   Yes   possible deadlock in v4l2_ctrl_handler_log_status
                  https://syzkaller.appspot.com/bug?extid=9948f8e188482c5d1a3e
<2> 870     Yes   general protection fault in ir_raw_event_store_with_filter
                  https://syzkaller.appspot.com/bug?extid=34008406ee9a31b13c73
<3> 289     Yes   inconsistent lock state in sync_timeline_debug_remove
                  https://syzkaller.appspot.com/bug?extid=7dcd254b8987a29f6450
<4> 101     Yes   WARNING in media_create_pad_link
                  https://syzkaller.appspot.com/bug?extid=dd320d114deb3f5bb79b
<5> 11      No    WARNING in call_s_stream
                  https://syzkaller.appspot.com/bug?extid=5bcd7c809d365e14c4df

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

