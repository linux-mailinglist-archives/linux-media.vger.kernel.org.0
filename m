Return-Path: <linux-media+bounces-21868-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C60E9D6CC6
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 07:15:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B83BEB2123B
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 06:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 888D2188724;
	Sun, 24 Nov 2024 06:15:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53B7187550
	for <linux-media@vger.kernel.org>; Sun, 24 Nov 2024 06:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732428905; cv=none; b=n/5JIw5dKHaLhE89kcdZzKGWwLZEGjVXFWjGFvum8LFQ26lyPWehWtiT3AMFCja0ei6NoaGfWPwJ1LDv7FOZ3TPHwJ/QzN0sIJBCVugGUg4FQfpcjXQy9i++Kzsob54hiF6/jVyaCSJH4A+Y7ARZsZki9BzPajeTqYDirLIWpBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732428905; c=relaxed/simple;
	bh=yeNCFnf7JLEG+Txx7kfYTh9rCxVCgbbE10o8+WBLx8w=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=WmbjUCfX0ViURDg74FG937eJ4YsI3xoqG6p8aLylrjvw8cwBNh+OplufAgVv35a4oTNlla2ytCKcVZYvhlRrTxkDkvm2tJ6WhdwCpZMppLjD+iDweKIEB08ks2EhKZeOwUX46q+Y7T9gxFXObMkijvgzCyC2GnBVQnOctv1f/nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-83ab434c629so353813439f.1
        for <linux-media@vger.kernel.org>; Sat, 23 Nov 2024 22:15:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732428902; x=1733033702;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=37DcHQSnQqigjF3B9FsTGkJi7xMOT+nc2TbxsA+afeU=;
        b=HQ3Xc4rAeGzIe6284QKQe+S4Zybxti6rtrnf0vntibkyeSdZKbFQj3cKlhF5389op8
         2Nr8rYIjmzn0yfslcryKKaBRmuMSS8agM321iWKTr0k78V38PMApj/XM1USg3992vuou
         FVOVwt6PiDkaIsf5BkIn7jyp2nz7iqcrQi+nzAJi5PcYrMgnwBguoe8zR2tUSoaPfNtR
         JEnaCErP9koZw4YaS+/iNMi3YcJDxPlAsDD+sZxZ19b/GRP5IMmqVtIDvIZP3vk6DarP
         zM8WDGfLik8QCY71vKemHnQafR9FEjTKrWXG5jRGark/9m0lDsh/7OjdnIw0Zlt0oCKZ
         3hjw==
X-Forwarded-Encrypted: i=1; AJvYcCXKY4sX5n0TpORW2GBq/Doq/1IJ9XuSesgkKH2ADn7UahLt3zW2HRuV/FQVY3/Niltv2VWuLwp2hIiM4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKImci+/ESus19hR3ACqjOoJ287CFU5R8Gch7MXnNQKpQ3xEnR
	P1NzY0z0QXS9avhfFYuRy4Y6BXiIOgOa2z7J3Rjy0auUPkhJaWAcZfmqQ52odp9wbnzXWvjGNjX
	wfH44lde8XrXb47JPVwL4owNysu3Rukwa5RPehcqqwtiRdC1rcXjsVRo=
X-Google-Smtp-Source: AGHT+IHDP9UJh3rqI8nZi1MSqLFUDpvVT0wVt5S1MLnMyJKsK9GRuY2H5qd8nRzXlcfdutVRyKeYTPxJifHIQ5RI3PvhoWGNt+4g
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:12cc:b0:3a7:7f30:18e1 with SMTP id
 e9e14a558f8ab-3a79aeacd61mr71302945ab.17.1732428902704; Sat, 23 Nov 2024
 22:15:02 -0800 (PST)
Date: Sat, 23 Nov 2024 22:15:02 -0800
In-Reply-To: <66f5cc9a.050a0220.46d20.0004.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6742c466.050a0220.1cc393.0035.GAE@google.com>
Subject: Re: [syzbot] [media?] WARNING in iguanair_probe/usb_submit_urb (2)
From: syzbot <syzbot+ffba8e636870dac0e0c0@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-usb@vger.kernel.org, mchehab@kernel.org, 
	oneukum@suse.com, sean@mess.org, stern@rowland.harvard.edu, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit b3e40fc85735b787ce65909619fcd173107113c2
Author: Oliver Neukum <oneukum@suse.com>
Date:   Thu May 2 11:51:40 2024 +0000

    USB: usb_parse_endpoint: ignore reserved bits

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=135d0530580000
start commit:   43fb83c17ba2 Merge tag 'soc-arm-6.13' of git://git.kernel...
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=10dd0530580000
console output: https://syzkaller.appspot.com/x/log.txt?x=175d0530580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=58b000b917043826
dashboard link: https://syzkaller.appspot.com/bug?extid=ffba8e636870dac0e0c0
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12515930580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11ca8ec0580000

Reported-by: syzbot+ffba8e636870dac0e0c0@syzkaller.appspotmail.com
Fixes: b3e40fc85735 ("USB: usb_parse_endpoint: ignore reserved bits")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

