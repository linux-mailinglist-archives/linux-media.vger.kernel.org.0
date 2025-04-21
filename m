Return-Path: <linux-media+bounces-30631-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DA9A953D7
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 18:12:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2AF001894BEF
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 16:12:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 514511DF74F;
	Mon, 21 Apr 2025 16:12:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAAAC2ED
	for <linux-media@vger.kernel.org>; Mon, 21 Apr 2025 16:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745251927; cv=none; b=q2ykS4nCMJA/qruOYtVe+wMGLnGOo3BUCZrC5E3oPBxlGXD3GQnSzErlidl+s3LxcNLUUUg/QXnwVnGPfnxIk0VsWRLqP03AO2Rp2fNlbQi0FdkUGYzZVNEzyHOF/rSXtjMbys0aGz3WpbPS994+U/lubXAVNYlC+13xbo1ITzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745251927; c=relaxed/simple;
	bh=I+UkApbBJ3Rc8fFtXoB9gb1h3X0typlNP2qp/aoUiY8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=GC4u6t9yJiSgVVIHpgAru0/o5cgkdBvaLcSXAiFia9NYEs/JT8pd8BY8uONjzvgLcgoh2nlTmokWY0zxTYIgYc07d+d1G//BjbENQUVk7xNIMaDI8Sw3mXGufgsFb8ADx8fushtLYJzTrj4kqG1B9iD8hzVonx/6jAtkDDuqzGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-85e318dc464so765679839f.1
        for <linux-media@vger.kernel.org>; Mon, 21 Apr 2025 09:12:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745251924; x=1745856724;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=10P1iGVClG58MJD0gtqV8hkpemEew9Qv7aKNGdYvFHU=;
        b=A/qtSMFkMAu6I7SZKKVFxwVuwz27LgFLLsmd39ZAgMDctm1S4o/Dt729xL/n2Ie/B6
         m9pnY48AAG+j4NtPzOeugLdQKWoc73GvGHuwYKjtf9RA+AjRq7HTF6/zBkF6WVd1Enjs
         Jk8Onbyscg6MjRwR+gn4z3U/HQF/FUrGTDaI9+BzjBCOPL0yDXYVfCNaQKAXElL8SlVB
         9V9pTADwg1+h2RlgqEDJifMgu+V0di7VdD3vPArNuCMDgY7XYFpONYvyPhl3Vy1+A/ox
         Wzf0RnqPwxS6ptKlTTz5lRgm0eIa/TtlgLebPz4HyXlLFYB6zmJho4m4EJsH00Yy5BgI
         suqA==
X-Forwarded-Encrypted: i=1; AJvYcCWADxQz4Ahbt3G6O2XbOrufIl9yG02zjbF46dlSF/BEdc+JjqEjQRNWPgIf2hU0bSiENpXvL9ufZ2Gq/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrL5HSppeU1ydxZfXxgclYN+OeDCyAYWlSDVgRGyS3+XSFos4S
	N787UcmKE/dPxPMmtv9dZBWacW7WsGMxJ/gv+OJvMujC3L7Q0BddGbRxk++tD5JM4afmN0z0YGA
	u/Km+ViVWW8pEgFNPE79h9hWCN4KN7/kizF5oDCGoHEvKkn4Ym6BfQa0=
X-Google-Smtp-Source: AGHT+IHqn+9lS97pG7VeJ0sQ/GKSXbeT91UxGhefgcXVybtb7h4tuLHblkJb+03x/HDZGybbfDBAAdo57uWY6WAOyycmMY/Xg+yO
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:240a:b0:3d3:d00c:3602 with SMTP id
 e9e14a558f8ab-3d88edfb6e6mr128197815ab.10.1745251924739; Mon, 21 Apr 2025
 09:12:04 -0700 (PDT)
Date: Mon, 21 Apr 2025 09:12:04 -0700
In-Reply-To: <20250421142219.158593-1-contact@arnaud-lcm.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68066e54.050a0220.243d89.0041.GAE@google.com>
Subject: Re: [syzbot] [media?] BUG: corrupted list in az6007_i2c_xfer
From: syzbot <syzbot+0192952caa411a3be209@syzkaller.appspotmail.com>
To: contact@arnaud-lcm.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mchehab@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+0192952caa411a3be209@syzkaller.appspotmail.com
Tested-by: syzbot+0192952caa411a3be209@syzkaller.appspotmail.com

Tested on:

commit:         9d7a0577 gcc-15: disable '-Wunterminated-string-initia..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14604fcf980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=efa83f9a6dd67d67
dashboard link: https://syzkaller.appspot.com/bug?extid=0192952caa411a3be209
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10f3ac70580000

Note: testing is done by a robot and is best-effort only.

