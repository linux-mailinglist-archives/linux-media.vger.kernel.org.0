Return-Path: <linux-media+bounces-36971-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AC7AFAFBC
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 11:30:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A263D4A128A
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 09:30:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B6F1293C58;
	Mon,  7 Jul 2025 09:30:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8363A292B2E
	for <linux-media@vger.kernel.org>; Mon,  7 Jul 2025 09:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751880605; cv=none; b=HHi15CYYVZjlf/UHCGYsnVSDGdQ0O4AGyQnStdjFfm40ZYv957bWhd5aZQPy8mXObVzbNCnwRID9mN4i07i40Zy0EmV2ogZKnQhuQGR2wT1X+aTb95pwfcr+hJvFTHnEPKmDq/dwK7ZqsmjCKVSBA0oZt37ULVVOIFHakF38gTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751880605; c=relaxed/simple;
	bh=pMhlVEkUFYx16frqYD2ys/zp4Vacync+fTFQLO8Y7j8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=msfdcxmLNtcvn8WhllRCToQU/eQhYmV5HRNUG8og2cAKHkEuilPXxtDcVTB+lsjrl9wxFAGe8ZStCLKMbTQ3u+TxFGNc45ysOgHfgs6gU/RztHPgmK0ivP9Xq8y5i6/MPyFGKcNM0Kxl3v4cESFTVyzPmtnKWKZDDl0TxR1Wg1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3df33827a8cso71868395ab.1
        for <linux-media@vger.kernel.org>; Mon, 07 Jul 2025 02:30:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751880603; x=1752485403;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i3FrwSzkZRQpjEv5ax7x7GcgrRUZI1/BeJkblnIIDas=;
        b=LrzSQcWbHht8KHcz2n12gjhuQi3xWDp2bfzasJufo+o+rLa2YiTzOqVEx4GH+z7HAz
         a7Tow9zEVBVmYHD5ldQytgNsckKU6+VMDb9EojrlfzQ0cm7t5Wvy8A/jmClHpm081lyv
         fGYlk1WyEeLtmc1CpaoZIKL+qC+8+uwy4UyVmDgZPPe8XTI1BqRePwCtMU4i08IhMorx
         LVBeot+X9pBBbT/K9vuDhkP4WWzXJehh+kgw1edUekJvJ3a5MV6LTqw3wZ1I+9HFaIQ0
         zafm9KOhYgcqJ389gVllRhU9Claa02tnvRlGGeiyNTERVeU9k5PO2LGp1VZjpboFJMTE
         yXxw==
X-Forwarded-Encrypted: i=1; AJvYcCU0j4LXgLtTriyUXvCWX2JNyfn51eYuG6OyJ0AGQm96m0LacrJv9A5FdUamnqS72cs2+34/xvxrKrWCKA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb74vRnGvL4LC9W/+4Fl+IKvAL1tSXioktmaalOKA9LzKcSAVx
	47QdWQwhz+CGe3O+mEdTSmBw0nn+KLMJwRS+5u7pXiG2k2CwfQrPGt6E6TiLRE7S77snrMJj1wz
	SV/069Pd1iP1oDOF3rdtS4NkFfCsa480klZ4RW//Tqbm+netFWjkbUn9HM5w=
X-Google-Smtp-Source: AGHT+IH5hJ99iBdAZ2eUEYhkALrqUM1smJuemUwvFzbEb4CHV+YszENd6TVowh9yRirN1q24ejmtOnIeaAYKcZbBaU/7HfoXhukt
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:216b:b0:3df:4738:977e with SMTP id
 e9e14a558f8ab-3e1371d527fmr93550285ab.10.1751880602735; Mon, 07 Jul 2025
 02:30:02 -0700 (PDT)
Date: Mon, 07 Jul 2025 02:30:02 -0700
In-Reply-To: <67917ed8.050a0220.15cac.02eb.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <686b939a.a00a0220.c7b3.007e.GAE@google.com>
Subject: Re: [syzbot] [fs?] BUG: corrupted list in remove_wait_queue (2)
From: syzbot <syzbot+4e21d5f67b886a692b55@syzkaller.appspotmail.com>
To: brauner@kernel.org, gregkh@linuxfoundation.org, jack@suse.cz, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, lizhi.xu@windriver.com, mchehab@kernel.org, 
	standback@126.com, superman.xpt@gmail.com, syzkaller-bugs@googlegroups.com, 
	viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 8ffdff6a8cfbdc174a3a390b6f825a277b5bb895
Author: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date:   Wed Apr 14 08:58:10 2021 +0000

    staging: comedi: move out of staging directory

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=13009f70580000
start commit:   05df91921da6 Merge tag 'v6.16-rc4-smb3-client-fixes' of gi..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=10809f70580000
console output: https://syzkaller.appspot.com/x/log.txt?x=17009f70580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=45bd916a213c79bb
dashboard link: https://syzkaller.appspot.com/bug?extid=4e21d5f67b886a692b55
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=161cdc8c580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14d1a582580000

Reported-by: syzbot+4e21d5f67b886a692b55@syzkaller.appspotmail.com
Fixes: 8ffdff6a8cfb ("staging: comedi: move out of staging directory")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

