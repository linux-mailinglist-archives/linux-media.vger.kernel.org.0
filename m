Return-Path: <linux-media+bounces-19780-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6DA9A1BD9
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2024 09:41:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A31E1B22305
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2024 07:41:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7270D1D07B0;
	Thu, 17 Oct 2024 07:41:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF3D1C1ADA
	for <linux-media@vger.kernel.org>; Thu, 17 Oct 2024 07:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729150887; cv=none; b=sboIRxvHBlMmD2OFdXaDhQrv3MmNkLYCNEbfzb8jgYdcS9LBaKd+v8gglCKMvX8yZso6P7nus15MkajH2MPaiVmW6MTcmziVjLL5291tvN3i6MGoJyIBSZ2mIMVmFzXKhkGa4TjYyXaDUG59LtxXpjs13wQe9eJBdk1uCbtrI6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729150887; c=relaxed/simple;
	bh=vfx4/HAzvUz+bd6CCHfuiF+FNeKLK/7spJgmBVkfSGQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=l9wg+WT2dZtkQd2wyiNhoyMwYXybhZCfxm/m9xfI7quvzGpu1rIc9G83fb85p+ybgapBb/PmTeoVKz0J1NfLcUbaNzUAwRQnDJTUperGzTsB9Ej04fc6kcpBceCtKQusE/d1uILIN9XlMnA0/+QU+AlEetKdSP2bcY6bSK6PLuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-83aaca0efc6so72616739f.0
        for <linux-media@vger.kernel.org>; Thu, 17 Oct 2024 00:41:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729150883; x=1729755683;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JZylQjTiOxGDwIxztHGJIN7yk4iil+pEqDzlvCCLlco=;
        b=gO0xD2jOh/BbcPd7EvJooDzWt9S93NNdXDV9KwWcoZ4EDcb0RpkbudTa5DD3lcO465
         3l1avP8KAedi7oRmMvEHqHEGuIKdDfVaRwIa70DI2MuCeZpZ9agv6a2p1STXxx0PgmvL
         cCRCkp5F9Z8OUfynZEv9WwIv0PaFMsrtpMwF+TqSqy2JtI78zeNiU3zBao8T9SkrA5zS
         y7eVMZ060CKVuKgeymmp6bzbMZYkkaA9dkBKIZiWVHu2VVXrv0TFyBdocZcy04D8UIZD
         STqSWrXHDsJ+mlXztk9sclrPsGdOe5HQ3wFaAoyJpNWvYbvEdsxhR2L9H61uAnbd+boB
         HJvA==
X-Forwarded-Encrypted: i=1; AJvYcCWRgGuV04OUj7wRITdeabZGwQjxKXqi1E5H25QQQ2dFQjLcy2Wp0HMMVWsxnt3372RabAqqtKc4ZQ7HXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxusatJXZlDnWzNMTOY2dL2ceRW2SeMJp+JgdsfhuVOxW5WclR+
	4/p7Hel1ry7Yoqdy2KSB6ONZs7zLAIQejkdr/9bfhSy75cACJ7OmRGPIIHE7N4N1ailbKPzmpbK
	SrSb7sMiOcwJ0/3HBhozVuPjdphMRPP4KKe6l4px8BvG85tHncHe8vCw=
X-Google-Smtp-Source: AGHT+IGuuixLw2y2VwGx9is8GPOWOJklws8URI8WqBJFfw2w66j/TfXDjFE2msQwfSuagZpIX2e1tJKCg3jzLuA4Jg+JFHP6VGRu
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:13cf:b0:835:3884:77a3 with SMTP id
 ca18e2360f4ac-83a947117d5mr796531539f.13.1729150883437; Thu, 17 Oct 2024
 00:41:23 -0700 (PDT)
Date: Thu, 17 Oct 2024 00:41:23 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6710bfa3.050a0220.d9b66.0185.GAE@google.com>
Subject: [syzbot] Monthly media report (Oct 2024)
From: syzbot <syzbot+list354438eb692b8a2f8c97@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello media maintainers/developers,

This is a 31-day syzbot report for the media subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/media

During the period, 2 new issues were detected and 0 were fixed.
In total, 19 issues are still open and 85 have been fixed so far.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  874     Yes   general protection fault in ir_raw_event_store_with_filter
                   https://syzkaller.appspot.com/bug?extid=34008406ee9a31b13c73
<2>  663     Yes   KASAN: use-after-free Read in v4l2_fh_init
                   https://syzkaller.appspot.com/bug?extid=c025d34b8eaa54c571b8
<3>  287     Yes   KASAN: use-after-free Read in v4l2_fh_open
                   https://syzkaller.appspot.com/bug?extid=b2391895514ed9ef4a8e
<4>  236     Yes   WARNING in usb_free_urb
                   https://syzkaller.appspot.com/bug?extid=b466336413a1fba398a5
<5>  225     No    INFO: rcu detected stall in dvb_usb_read_remote_control (2)
                   https://syzkaller.appspot.com/bug?extid=01926e7756f51c12b6a3
<6>  105     Yes   WARNING in smsusb_init_device/usb_submit_urb
                   https://syzkaller.appspot.com/bug?extid=85e3ddbf0ddbfbc85f1e
<7>  101     Yes   WARNING in smsusb_start_streaming/usb_submit_urb
                   https://syzkaller.appspot.com/bug?extid=12002a39b8c60510f8fb
<8>  68      Yes   KASAN: use-after-free Read in em28xx_init_extension (2)
                   https://syzkaller.appspot.com/bug?extid=99d6c66dbbc484f50e1c
<9>  31      No    WARNING in call_s_stream
                   https://syzkaller.appspot.com/bug?extid=5bcd7c809d365e14c4df
<10> 23      No    KASAN: slab-use-after-free Read in em28xx_release_resources
                   https://syzkaller.appspot.com/bug?extid=16062f26c6480975e5ed

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

