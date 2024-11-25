Return-Path: <linux-media+bounces-22026-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A6E9D89D6
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 17:00:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77893280F13
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 16:00:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AEEA1B412E;
	Mon, 25 Nov 2024 16:00:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D087D7485
	for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 16:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732550406; cv=none; b=RFeHtSXr+Bka3nxAa/UmsERvyOEl1ZX+OeBjt68HrklD6xIDBCNe8LXHSqJUmSRPck/7yK0uDTKWdGrQkKSI5YtygmOMoEv64vyyXXpIx31Ew7WKuAHTGZKR1zszPm7yDTQTlIEyvG95KTBLoS/vP69fQ+4eeszM2PPo8DcvdqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732550406; c=relaxed/simple;
	bh=rCA7tN77oSxn4nSUCyaEPhyJDQp/cbJyX3dpxCtfg0s=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=AxQgJEfeHRnQlyn9CLLO0srbViQ8gUA8U+lebZ6vxVaITuuKhxMq+j/LnC3veLOl7I3QyADdc4UVcuF764pCH8n2/V+8EN66P1jApHbq3XCz2EreJLnIgZ7y0+nDBAS104NzmzWh7eUHEY6/R0HbJ9WOU324RLOBSrmY7LCfhec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3a77085a3d7so43178605ab.1
        for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 08:00:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732550404; x=1733155204;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LQ5HUgOXbILcqXU+BL8itF7OQWQ7AptcHc14ASFyUaA=;
        b=oJwQIKcC1oRdJHDspEX50A3jCkjkFUANlPIYEEYP0XVrdpwocywwOldXST5J8RQSxS
         r1LG07r/k5Ob07PsV2E3emNAympGHkCA2chFcBY8+XIE6s+cyEKV4VwaE++PiJFVMG4u
         /mySbGriMztbKFKxSdMwL2vM9Jf2GOgN+RnslyBIhb4ka3rlCFbF0UWbZJ3zOWojKRjx
         llrHZPyWpbd0Gb5lQVnGZeUgL/T2wzPERSGIFew7v/EjZXF2cy+dDmP0nuO8m5AHq6Bl
         293V6XoTIfW/nVkUTOxYitQ5NGWhz8xQsp8Xmzlyzj1fuvmG/JhsyjcOBjgt2u5XM03k
         r4eA==
X-Forwarded-Encrypted: i=1; AJvYcCU8tf8Nfu9TWVCs6wDODR+e6B6ks5fARNOBzSwJxZQqf151fzjBsP1iab14QtyHi1rrMcMKj/uoWnFeAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWVqpzElC/93GXIBQjCanDjs62yu+CdYfLNv+4r8kk7NXUajTe
	IcvTZTKNnMgOpmgEQq7o/U8MUIyvxDLXmz7D+q8nCOLlN6MSrTumL8UQy12IzCMXFzNj5yM6MFl
	qEkkvosYbrL9TF6O2XNX/3nd5esi/JTCvPywkJZAVA6hmoXrb8N6Uj2w=
X-Google-Smtp-Source: AGHT+IHIb7s4QFOpJPxES8aDXyROD7H+PYUYM8HigaeeIl4gnxog0frKtM68oofnuvMKeonDgmxZEazp5VfDO3rF+al4zfPEfHan
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a8f:b0:3a7:a58b:557e with SMTP id
 e9e14a558f8ab-3a7a58b693bmr73872635ab.12.1732550404057; Mon, 25 Nov 2024
 08:00:04 -0800 (PST)
Date: Mon, 25 Nov 2024 08:00:04 -0800
In-Reply-To: <21c2fc3f-e55a-47bb-a51b-b53e5cab1e67@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67449f04.050a0220.1286eb.0003.GAE@google.com>
Subject: Re: [syzbot] [media?] WARNING in iguanair_probe/usb_submit_urb (2)
From: syzbot <syzbot+ffba8e636870dac0e0c0@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, mchehab@kernel.org, oneukum@suse.com, 
	sean@mess.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+ffba8e636870dac0e0c0@syzkaller.appspotmail.com
Tested-by: syzbot+ffba8e636870dac0e0c0@syzkaller.appspotmail.com

Tested on:

commit:         43fb83c1 Merge tag 'soc-arm-6.13' of git://git.kernel...
git tree:       https://github.com/google/kasan.git
console output: https://syzkaller.appspot.com/x/log.txt?x=12b56530580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=58b000b917043826
dashboard link: https://syzkaller.appspot.com/bug?extid=ffba8e636870dac0e0c0
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11d465c0580000

Note: testing is done by a robot and is best-effort only.

