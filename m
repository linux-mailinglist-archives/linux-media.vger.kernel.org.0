Return-Path: <linux-media+bounces-38504-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BCBB12C55
	for <lists+linux-media@lfdr.de>; Sat, 26 Jul 2025 22:43:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A51613A4114
	for <lists+linux-media@lfdr.de>; Sat, 26 Jul 2025 20:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1B1B288CB2;
	Sat, 26 Jul 2025 20:43:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC49D1DE8A3
	for <linux-media@vger.kernel.org>; Sat, 26 Jul 2025 20:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753562614; cv=none; b=S3YxriWokKbUM0Wevq4SOX3vqXMXDFwN2o6Q/yIteJNfpvSBng8yrTaVDsE9zyatXbfCBjPU8zg0K2bgSP0hgZOEbZvEeQPRcrr0NrSMY8rZnWYdMWgHc4EzQk666YoWncLFJ7/KPHFh23yEsgTIJrQCNRo1oZClKpX5sAU5Upk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753562614; c=relaxed/simple;
	bh=LZkIAmmjLxUThoW04ojalphEQmGoVlpH8nY6KbqpnpM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=MMiAFzsEQWx2M76yeDTpnibRPTwt+WhLZ1360Ol5ZBlH+ww9NQB9INYNQiEqXwwvu6beibfPYUWDAMcARtjGgGkrpyjz+v3FIdSCN0A5JQzBEP4NR4xMi2e/RbK6zdKttJs092VXVtwyNrff1JMaPZwL3v1+veYOFUWK6xfESZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3e05997f731so68035275ab.3
        for <linux-media@vger.kernel.org>; Sat, 26 Jul 2025 13:43:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753562612; x=1754167412;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FxVhg158BqRzuZVreFzlZ1lgzEYUTZ4+Sn4ePts3vms=;
        b=lu3lrHzl5wksgRWQF7uj7IbWIIVQfmdoHHD4qRiW2bMZXYJ7bgfvw66cB540Mgzj1w
         AuH5gnHUJJAZ6b+DOjl/NQSUy/Ea4kiUdLn4WYn5kOrcWQLHh7CKA/dAwAE0q1P/T2CQ
         ebHK3HuVN0lKNU9MO0stuSNnlsbH7/WcpUNF6+s00ZyM+RDeLfSxdXHQsCMKw5Quc02S
         VCdcDgA/q6NTRX3diho0TQc625UkU0pElJ5lH32hHdyeE4FgfVMsPJAjqT++Wk9HZWNd
         ePMcTsj/fzcuQGaOmQMbw3eD2zHQv2pToSCVCL9KtRQ6bzExV69e++rqEk0U9chUg3KC
         ddFg==
X-Forwarded-Encrypted: i=1; AJvYcCWWy2xhPy/BGIl/EQaPVIn0WSEsokDnzXncfZqbydt/SHFrrT8XmW1yzFvOHTOTEh8hRGlasKbaGS8BdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAkSGO2daKJvvh/ZPt6VMvDx0wToXoMxMUC6pSZ1rl1LCVawvr
	Ou7UtvS5NUM0g6StmQoiav0HVWWDZ9+zBr3pUvPjjcekb/CCw3WvZ3nh8nW/q9h/J2Cc9xHzBjC
	DF4S32WOUOqO2+sfLiK6W21FPLbD3w1wGKlJKjq9eMg6k16CmfM5WcgYt39g=
X-Google-Smtp-Source: AGHT+IFN+SLT/uO2DcHLtEfXkzJOLsSz/+L9C/BTDkqNmFPE8jsAnPBi0Vj57TtqRddW5lz/ZRQQUn1W9MnqZF/1xTiAqwXjFPue
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:180b:b0:3e3:d2d2:354e with SMTP id
 e9e14a558f8ab-3e3d2d2658fmr22006355ab.17.1753562612094; Sat, 26 Jul 2025
 13:43:32 -0700 (PDT)
Date: Sat, 26 Jul 2025 13:43:32 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68853df4.a00a0220.b12ec.0030.GAE@google.com>
Subject: [syzbot] Monthly media report (Jul 2025)
From: syzbot <syzbot+list9abb6cddef6c590ca302@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello media maintainers/developers,

This is a 31-day syzbot report for the media subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/media

During the period, 1 new issues were detected and 0 were fixed.
In total, 20 issues are still open and 96 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 423     Yes   WARNING in smsusb_init_device/usb_submit_urb
                  https://syzkaller.appspot.com/bug?extid=85e3ddbf0ddbfbc85f1e
<2> 339     No    KASAN: slab-use-after-free Read in em28xx_release_resources
                  https://syzkaller.appspot.com/bug?extid=16062f26c6480975e5ed
<3> 171     Yes   WARNING in smsusb_start_streaming/usb_submit_urb
                  https://syzkaller.appspot.com/bug?extid=12002a39b8c60510f8fb
<4> 169     Yes   KASAN: slab-use-after-free Read in dvb_device_open
                  https://syzkaller.appspot.com/bug?extid=1eb177ecc3943b883f0a
<5> 45      Yes   general protection fault in dvb_usbv2_generic_write
                  https://syzkaller.appspot.com/bug?extid=f9f5333782a854509322
<6> 35      No    KASAN: slab-use-after-free Write in as102_release (2)
                  https://syzkaller.appspot.com/bug?extid=47321e8fd5a4c84088db
<7> 8       Yes   WARNING in media_create_pad_link (2)
                  https://syzkaller.appspot.com/bug?extid=701fc9cc0cb44e2b0fe9
<8> 6       No    KASAN: vmalloc-out-of-bounds Write in tpg_fill_plane_buffer (4)
                  https://syzkaller.appspot.com/bug?extid=dac8f5eaa46837e97b89
<9> 5       Yes   BUG: corrupted list in az6007_i2c_xfer
                  https://syzkaller.appspot.com/bug?extid=0192952caa411a3be209

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

