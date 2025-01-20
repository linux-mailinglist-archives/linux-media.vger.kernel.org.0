Return-Path: <linux-media+bounces-24926-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A774A16808
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 09:15:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5C493AB215
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 08:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6299619342F;
	Mon, 20 Jan 2025 08:15:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A5918FC83
	for <linux-media@vger.kernel.org>; Mon, 20 Jan 2025 08:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737360927; cv=none; b=cTLyjXNS2LQkFWm9vlzfsKhV2mXY0GXXhNJ3KKUTAAUW3EitPn/0synXVgbmNpPuX+TUrbWFhSYEnQpMQNdZUeqcLV4KRzjfP3NmNfQhQAc0oGGa7HzydVt0v/hkEzY5sljKN9iYks3DZWsx/knph8hn35pnK6kkNWdnz5T9djk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737360927; c=relaxed/simple;
	bh=VCdzkUFu4KMEwjB9W8sUfd5X/v4Ls9VxviyODZYdvhA=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=L4/codgdO1okNjO4x104LQhDBjgtDFkRRoPCPj7OJe0R8BHutSFeztA6qABRvDSXVxfLPLunMAv7qAnQWObIy0D8icPeOYWj0OnX5g9PnPzwyvbHtIohdptYf2yJAjlJ5qar1j6CH0Q7B9Ycq4HeggEffU76dREfzEZwvYh9tq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3ce7a0ec1easo30270745ab.0
        for <linux-media@vger.kernel.org>; Mon, 20 Jan 2025 00:15:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737360924; x=1737965724;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NDY9Acz7nqjG8AvnbzyqY/RiRLRFW3a9dAKx0u8MBJQ=;
        b=XiSWHeevB5XUJmjOPp1thcjCUCuLFBLcGuqmg2g+gGIEVAwjb+WQ/+TXuD7QfmMUUU
         9694g0yy8VHewoDlZQ8eKBJSDhYooe/bdHln7O29Sd9EysJ2cn4dolF7s2zOCUJT1VyT
         JIgud/vzzozCbgQ2x2AlqPJAkqhsl8pg7FXoc/nhMrIYZa11ATlTtX292yy+kcXA+K8t
         ODGLJF58sj82L6h1brST9OeeEPLK6Jr49OSop+NrTTdTfvpwQIXgmDz2GOlVc3UC3yYh
         iq8bxx6HnvKGBkEul2KeOeWBdLXgXj+tFyGA9Xf8+cECqmprzkYrkUh/xSe/Vcl5QG8E
         Zamg==
X-Forwarded-Encrypted: i=1; AJvYcCW6xvrQef9zla84twhyjF/YeMfwX1xgNHGZDEgnpwxqgaI66Rq8CTZnwVO32UuFtyLwQMk1QN/h7ZM+Bg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5+J6Yo/9RH33M5PX1Q8hEEiisQQcOw/liIzwqD/QzD08LeKLr
	yIsJLxqw0a/hAmkNQqWfwG7jS5L/hVcfCW1ybt5v6S8aQ3PXXGbgUIH/enZAA96ijJ2Guh3IB9e
	g/Gcrw0x7ekSd52nBtytCHtUdDi85iyTuFqrPu7N3cwvtaEvabDbnzrg=
X-Google-Smtp-Source: AGHT+IEJE9JqxZHntqDhOmyGe7PlLkdrqh9+GI8ne0rf5vEjoNCY8asrKqf1Rps5t/dAxYC3y8q8xtrDCbmmIdpeAdTWcjEBJTPd
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:c242:0:b0:3ce:8065:e421 with SMTP id
 e9e14a558f8ab-3cf74494df3mr86100655ab.21.1737360924555; Mon, 20 Jan 2025
 00:15:24 -0800 (PST)
Date: Mon, 20 Jan 2025 00:15:24 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <678e061c.050a0220.303755.0072.GAE@google.com>
Subject: [syzbot] Monthly media report (Jan 2025)
From: syzbot <syzbot+lista060b35c9c3f465936d4@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello media maintainers/developers,

This is a 31-day syzbot report for the media subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/media

During the period, 2 new issues were detected and 0 were fixed.
In total, 24 issues are still open and 88 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  450     Yes   WARNING in usb_free_urb
                   https://syzkaller.appspot.com/bug?extid=b466336413a1fba398a5
<2>  250     No    INFO: rcu detected stall in dvb_usb_read_remote_control (2)
                   https://syzkaller.appspot.com/bug?extid=01926e7756f51c12b6a3
<3>  169     Yes   WARNING in smsusb_init_device/usb_submit_urb
                   https://syzkaller.appspot.com/bug?extid=85e3ddbf0ddbfbc85f1e
<4>  158     No    KASAN: slab-use-after-free Read in em28xx_release_resources
                   https://syzkaller.appspot.com/bug?extid=16062f26c6480975e5ed
<5>  121     Yes   WARNING in smsusb_start_streaming/usb_submit_urb
                   https://syzkaller.appspot.com/bug?extid=12002a39b8c60510f8fb
<6>  71      Yes   WARNING in call_s_stream
                   https://syzkaller.appspot.com/bug?extid=5bcd7c809d365e14c4df
<7>  42      No    KASAN: vmalloc-out-of-bounds Write in tpg_fill_plane_buffer (3)
                   https://syzkaller.appspot.com/bug?extid=365005005522b70a36f2
<8>  12      Yes   WARNING in iguanair_get_features/usb_submit_urb
                   https://syzkaller.appspot.com/bug?extid=e3ae1e7f4b88f3e696f5
<9>  7       Yes   general protection fault in vidtv_mux_stop_thread
                   https://syzkaller.appspot.com/bug?extid=5e248227c80a3be8e96a
<10> 5       No    BUG: workqueue leaked atomic, lock or RCU: kworker/NUM:NUM[NUM]
                   https://syzkaller.appspot.com/bug?extid=21814e89fd126bbfb79c

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

