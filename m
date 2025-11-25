Return-Path: <linux-media+bounces-47722-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C2AEAC873AE
	for <lists+linux-media@lfdr.de>; Tue, 25 Nov 2025 22:29:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8DEC94E36F2
	for <lists+linux-media@lfdr.de>; Tue, 25 Nov 2025 21:29:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00A7D2FD67B;
	Tue, 25 Nov 2025 21:29:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562AE2264A9
	for <linux-media@vger.kernel.org>; Tue, 25 Nov 2025 21:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764106149; cv=none; b=LmmpskkGEIrPnTPfX5jiz4hEBWzjA0erTt7tzNzHnhFIXox3/V+4GmNhhU53Rv3MPblbekMiLsuetKVRrgxxX77IBUKn33AHpFZnMfG2XQ1Um5doJ49gYVgK4Eqn5O4s7SyuFXvKC2FOBMPspRR0BHLlV0/jEyCeDgVq3aWnPWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764106149; c=relaxed/simple;
	bh=Zdpii0LSGFDbxKbo7AhO4oOhZM3qOinDvvZATCa/Sow=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=EIHitWALl18lgB3wNduGxvDp8jmUoxwlAogUcoZrHQNVjQfq3SnRznIs6r+d3VOxOj6CJn1YOKyXRvHOEvix9Z0G2JAmRoDURVNt4QjzfJiVWdTsmQOAFOFS52OjTkILJmYXuDwqikapDn5TSFdrttWGlceO2l5Wvi1KpR5/bPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-4330ead8432so53780455ab.0
        for <linux-media@vger.kernel.org>; Tue, 25 Nov 2025 13:29:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764106146; x=1764710946;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dHAA01S5qV0ahBi2iQTagcMAT0dAavilbuefhw3nVeE=;
        b=dHgliixK5KvaeNrXhlwFWxQjLTwLRH2fgD5M+st+Cufn5AkEPUW/nfrd6ILDAJun09
         jbPOlAvM3UpCx/dsq44+NUyDhuKwcas0OnguySANe7X/hb65K4HvH7ZqZ0G1UHZOCDSF
         qRsRIylz9wYsAkxG85vVlZIxa5L4bfXT5xb1v6dmprPuxW9nrTp610LK0oU/ClGWMNGV
         8AaYVU7vH2+xzT8hlH2BxMuwoYbdvDi/ahQhQxeH8jgepAsNyotmk+W7R42IFq+Y3uQU
         MhCYA5JfUAI2bZRIYHJ0yJQ65/7kul19YmhQwJnVC7Q3hCbtTpqzKwdRVPAlgMKlbVAI
         Lsfg==
X-Forwarded-Encrypted: i=1; AJvYcCWx2K/OBKSap4POYZD+gfYnmFDdE5nD4hMwlDi9jlq0GZejNIwqKhen2WRAUnSl31Yrx84LOxME6lL/og==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDGs3/Jr+fDXW8ndX27ILt2U+6sknfFZItJHYNsXnPjXPpGgRD
	8XgVd/vZSqn5Y6apGpTDn+Q8r1qXPk4WqEXEhupqaLVnwO9Blmac6zMEk8K0oSZfvSJFwOo7ojR
	bddhd3vtm4b49UTxqjzeE99SP3GlRHzZ8kwnQUGlDSJwnXdVWxfBs9mTcCBA=
X-Google-Smtp-Source: AGHT+IEi9qrOcWMQCAiUQzBf4+A5vGHRO1b2ucfssRVjfdWi9zJVJjB4av6fs55BrITFZw6Lh6vw2CNLFtVAwSAiUL6CLrVek4P8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1561:b0:434:96ea:ff59 with SMTP id
 e9e14a558f8ab-435dd1254d7mr36666915ab.34.1764106146615; Tue, 25 Nov 2025
 13:29:06 -0800 (PST)
Date: Tue, 25 Nov 2025 13:29:06 -0800
In-Reply-To: <50389e6f-a379-44cd-a18b-ded86d0b9f7e@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69261fa2.a70a0220.d98e3.00be.GAE@google.com>
Subject: Re: [syzbot] [media?] [usb?] memory leak in v4l2_ctrl_handler_init_class
 (2)
From: syzbot <syzbot+a41b73dce23962a74c72@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, ssranevjti@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+a41b73dce23962a74c72@syzkaller.appspotmail.com
Tested-by: syzbot+a41b73dce23962a74c72@syzkaller.appspotmail.com

Tested on:

commit:         30f09200 Merge tag 'arm64-fixes' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16d25612580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f30cc590c4f6da44
dashboard link: https://syzkaller.appspot.com/bug?extid=a41b73dce23962a74c72
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1099cf42580000

Note: testing is done by a robot and is best-effort only.

