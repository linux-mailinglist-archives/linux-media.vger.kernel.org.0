Return-Path: <linux-media+bounces-26180-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7036A3707F
	for <lists+linux-media@lfdr.de>; Sat, 15 Feb 2025 20:59:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 778D017002A
	for <lists+linux-media@lfdr.de>; Sat, 15 Feb 2025 19:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 631861FC112;
	Sat, 15 Feb 2025 19:59:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764F61EA7E1
	for <linux-media@vger.kernel.org>; Sat, 15 Feb 2025 19:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739649545; cv=none; b=Ca+hWqxGLRMv25pJafaBtBLkO2wb5eCnq4qmaVr+WySN5MZoGlkSK2WuEr45Zhw8+55HG+J2uqo9bcil3nVx9cF7eG2f2kQ5iEQPDcjWqnY76Uoj/IROUs9iIgmra1CKD7L0v5FEGQicWGZ6Z8NsLtkbYyGxkTXUnODSuw73V5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739649545; c=relaxed/simple;
	bh=cjmLZcRAlefbwU0nv/Qg2Y9Rr8pWmnHARLkL+GFHg9Q=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=tq3Uf3GwxfTQs7xl2ddunC+DgxoTJcbtHi2aCTaQBAVcFelt7kJGNAt5gjw8A8KWCWl+XFwFreI1NVE21GG4Gcdph7La2nOB/JmHIqAtaFmsAj3ifBgcWANy8C7Fcz197LrFXY54Qs2/3rJ6G4oqJj6izL+2b/D5H3iwnFHdBTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3cfba354f79so62836325ab.1
        for <linux-media@vger.kernel.org>; Sat, 15 Feb 2025 11:59:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739649542; x=1740254342;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vsSGdGLxp83+EP5yVNQjXJBE2N1zKb2aPVpOLY4p7Xo=;
        b=RbwgKHaLmkkHSeuyhTctI8lupDst4qM0aJ3DWAHCh0RNau32l2/jhDrvl7jNkmLQpY
         efHKP5on6Tswgx3VZ4Wzx3MCUnB8HqklGt5RRjgHbw/sTuRyJolWFppnt/5NpA0u7TNx
         aQnfUJCg5xJSuGhILBy5FZWjlmE16NgtmsuDaNg+kwnoYEQMXBcYnKlXgza+IT95qqs3
         IewepQqqeDhViJh6HfLODQxLqlgFKoVwcudBu3oc1gaMPONOZjpqp9eyZ6di4uTlb5Ap
         sNXsIgk+2AaGK3gIPWEGNI7akw3LF0hzpZN/VVRGcikPABtfIxrd7hcfMkNn/rdYh+0G
         wtMw==
X-Forwarded-Encrypted: i=1; AJvYcCXVJ9Uffdnr7piqkP+s6pwCnY165fPEw2l5rWC9MDYi5Zv4aY0rR4ImU23yHEUCwSEyhKd0bTV6u1SZNg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw36CpNUTatV/7/041DcJC2kAP9RcrwyMAnnZEaYjkvjVFgkVDK
	Pbz3XwJ6foBuAnBkoDSp0Kpp4mg3y7w7E4zUsBKcWWc6NuUf0AL90eug7E1spCCjYvKrXWulE8d
	8XrnhLlc+dyUkDyTLo6p2vpddN4O7jyg/NBthKPj1v7L7fnb170F9UQQ=
X-Google-Smtp-Source: AGHT+IGED8qB1mXWmmt+c7K6nBjduh4vT+n1AH1rSM0vh+OCwjQiG/6k5zmPAwYHWeUR2vWHB4xIUymZW+id/66hrnU6uPwYIiVw
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:240b:b0:3d0:e52:7d33 with SMTP id
 e9e14a558f8ab-3d2809d114bmr38457015ab.22.1739649542676; Sat, 15 Feb 2025
 11:59:02 -0800 (PST)
Date: Sat, 15 Feb 2025 11:59:02 -0800
In-Reply-To: <673de7f9.050a0220.363a1b.0011.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67b0f206.050a0220.6f0b7.001c.GAE@google.com>
Subject: Re: [syzbot] [media?] WARNING in iguanair_get_features/usb_submit_urb
From: syzbot <syzbot+e3ae1e7f4b88f3e696f5@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-usb@vger.kernel.org, 
	mchehab+huawei@kernel.org, mchehab@kernel.org, oneukum@suse.com, 
	sean@mess.org, stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit b98d5000c50544f14bacb248c34e5219fbe81287
Author: Oliver Neukum <oneukum@suse.com>
Date:   Tue Nov 26 13:17:22 2024 +0000

    media: rc: iguanair: handle timeouts

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1007f098580000
start commit:   f868cd251776 Merge tag 'drm-fixes-2024-11-16' of https://g..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=d2aeec8c0b2e420c
dashboard link: https://syzkaller.appspot.com/bug?extid=e3ae1e7f4b88f3e696f5
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10edf1a7980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10d892c0580000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: media: rc: iguanair: handle timeouts

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

