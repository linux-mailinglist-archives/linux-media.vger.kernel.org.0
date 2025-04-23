Return-Path: <linux-media+bounces-30783-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B1BA9819C
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 09:52:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DDB13AE8CD
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 07:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 769E026B966;
	Wed, 23 Apr 2025 07:50:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF3026FA59
	for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 07:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745394641; cv=none; b=n8zK+vXde9r3FemEwxxS1mIAEy6irrKbewkJgENawiaqIqTULZbkLbUQftg1XjmlqDc9rIAT5xFwGgzzuYfhlJ8Y+jlc2fTRTpYyPVEMI2ACtvYrvklQqQrESE0slDtiW3rzLQ1doT+iw/WV58ROnKeaxYuIUdi+jTov/Wr2laM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745394641; c=relaxed/simple;
	bh=rwpEWS63AFwlpu7elQM5P7k9ArNex6ebfUTJSGjs0Gw=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=KQ9DPBkZfmLP+1i+XYb0UPcqulNYj+ykUQ8H1EN8Nmyab3ly2XLmImO73LvQePhmRedWJadOzY2KrqZTEWlN4otrJas4pn6Md862kUoJ4IsdMJ+U7+ytCMtzIX0qcsdvc+XzXs40lM9TKQNd/dQA8BSo23I03HeOmpTsO9/rPlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-85b3b781313so1309077739f.1
        for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 00:50:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745394639; x=1745999439;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cHLxcamDXyYaUYY7JGdV9UqauzJLZV0mvhEN7b+HB1E=;
        b=YVpMASxsoYl6aVpIqCStKnI+Jko51oFdlVLdnJe0UOrhBEV6gJHU/nRYumDox3OL/q
         l4vo8OdZBbfuIgTQGyuIYWx/0LZb1igp/sHBB1yXsHKhcRRmvjVM7vCxbHpoBQcYt64c
         rEJI5YhQEzqVj8MAOlgbJ17lZMm9++SUznR9VrJEJ0N+rUkY0Yq7/gr0PY0mq0rbZaNp
         /v+yWWyISiM4tQCuLU4ug7dwpvEqujD2D6PO4/Ud4RRisUOPkwBSWt92GynIhZiLD+NL
         F9SU9TW0bmvciLmTryBLfoYVhK+m/lvTmvjdGKvAeAq7Hkcrc8CzJJlvFSl87N/Rw/2P
         mV+A==
X-Forwarded-Encrypted: i=1; AJvYcCX9gUWMCukPKY5b2RIjD6Yqs94SEqm7Z5tYgmqmxZAkc75PpTQPm3DfLEYTmiLQW5gG3rPsTyezuOXUcg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPVdM97Nv5GDOrO/GQz+GaYR6QWhj0Oshc8vuZO7jQW3TsF1Ru
	UlnKI2lgw2cGavhgqXREaRSps7JxWacTq16XnRVjpjPri9SWovPlTYftTS63zs3QLcI2wijLBmj
	uQdz+7y3+ICjof7mYxhZZaVuxwoQ8kjQ53wnGP6HPLX8Ou8SNGEt1DPY=
X-Google-Smtp-Source: AGHT+IHroda0y9pWYhCGw1aVhn+1ZRwJAJ5KySSVpAEG5tuvduyxOrmRKiKgmr9BN1xp7LCuc3IwKzgM8VXL8Uf5csgKsdZSsAut
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:16ca:b0:3d8:1ef0:4921 with SMTP id
 e9e14a558f8ab-3d894180afamr177149985ab.17.1745394639672; Wed, 23 Apr 2025
 00:50:39 -0700 (PDT)
Date: Wed, 23 Apr 2025 00:50:39 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68089bcf.050a0220.36a438.000d.GAE@google.com>
Subject: [syzbot] Monthly media report (Apr 2025)
From: syzbot <syzbot+list27f1b5d6c52666832e5c@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello media maintainers/developers,

This is a 31-day syzbot report for the media subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/media

During the period, 4 new issues were detected and 0 were fixed.
In total, 25 issues are still open and 93 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 272     No    KASAN: slab-use-after-free Read in em28xx_release_resources
                  https://syzkaller.appspot.com/bug?extid=16062f26c6480975e5ed
<2> 245     Yes   WARNING in smsusb_init_device/usb_submit_urb
                  https://syzkaller.appspot.com/bug?extid=85e3ddbf0ddbfbc85f1e
<3> 226     Yes   KMSAN: uninit-value in cxusb_i2c_xfer
                  https://syzkaller.appspot.com/bug?extid=526bd95c0ec629993bf3
<4> 128     Yes   WARNING in smsusb_start_streaming/usb_submit_urb
                  https://syzkaller.appspot.com/bug?extid=12002a39b8c60510f8fb
<5> 94      Yes   KASAN: slab-use-after-free Read in dvb_device_open
                  https://syzkaller.appspot.com/bug?extid=1eb177ecc3943b883f0a
<6> 18      Yes   general protection fault in dvb_usbv2_generic_write
                  https://syzkaller.appspot.com/bug?extid=f9f5333782a854509322
<7> 14      Yes   WARNING in dib0700_rc_setup/usb_submit_urb
                  https://syzkaller.appspot.com/bug?extid=e0d5af779eabb323f695
<8> 5       Yes   KASAN: slab-use-after-free Read in vidtv_mux_init
                  https://syzkaller.appspot.com/bug?extid=0d33ab192bd50b6c91e6
<9> 1       No    WARNING: refcount bug in dvb_device_open
                  https://syzkaller.appspot.com/bug?extid=0aea3ca127fe06c384f7

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

