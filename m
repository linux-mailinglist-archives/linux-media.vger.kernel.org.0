Return-Path: <linux-media+bounces-21703-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C829D460A
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 04:06:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20D0D1F21B4C
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 03:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7881415539F;
	Thu, 21 Nov 2024 03:06:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A124A7083A
	for <linux-media@vger.kernel.org>; Thu, 21 Nov 2024 03:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732158366; cv=none; b=fXJH/U3cqaYDC6fTE/YPtbdbhDoBOcMO+dXUFkAaFJbiyApUO2Tp6UNnQXtKCKu+3hyrgJd4YhQMEYgSE00DnGpaamYuVpH1T3+QWrmtFPJvGBNi/k9+CR2P2JwKhU2SWEwjmhjThJC0DwjospXz+HYzu0meXLwW1aXzYLm4t5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732158366; c=relaxed/simple;
	bh=19lMze4FBt9ZcAS9KWRp6i8uOH9mPAA59vjy+SmM7MU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=eLmMZbUrrizSGc8uzYlB4JEl5EzTBhMHpJ/s51nWS9Ds5IPbw/kBzgGbpws5qL3ZWnHlbn1Pk+gt75v34n8yda2B2D4iOcTf07WmG/jGN3u/zgWFwa0eIJKyH8P6edHVuPMqzkVZ0jV74RN+srGEiW91weiVHvc2LeKIpNbkcF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-83ac79525b8so56325539f.3
        for <linux-media@vger.kernel.org>; Wed, 20 Nov 2024 19:06:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732158362; x=1732763162;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iT+tkk0XtBVTI1mvaBLoNdXL417sN5a09utqyP6Jzj8=;
        b=PITY6gzLojl2VvyQXuwOilLFSq4VrAEO1HRxHiurgwUW7eoqzOH5HiW9qPq2neIAmH
         8bakJg43bWECVB2RhRBSEYNLWTvz54E6nHl6VkgWAoadXIK2I4GIuI/98R7fAGvfo0is
         xWLs04bCOia/gOXcMw7oZoAzhaMRb2P19T6gzdAuswVzuQhg8qy9NMVHUqLYrTnCv9qz
         WC3sVFlr/GAK8unE/6MEarCAM8GYKajWIagUWK0HJtzHSVy3UlftMDj4zfGYHQngZ03p
         JHV9SyLXDsg67WoRqa3j+Ec6fwKv0EX7GZxDncxogr7ZHEt2UvsYZnimNZDU2x9D/E9V
         Kpbg==
X-Forwarded-Encrypted: i=1; AJvYcCXXfE7leF5xIdimK0lLpNnQh7DU9yExJLuH3vDgt+rsTYtkuR/sqp5rXXiy6BJig3x+7y8J6Osb91hYaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVgxKrlP4/p1ZJPBI37b21UKcfZZwNk326kviP7SiVNEkvifG5
	yquJq78sixR/DT3I74F+bifWBzMYrLL2f9ki7WJalD5NvhAIHgbLh2ZJH9x7cLooO938MtiD+79
	sE/fSQJ36Eir6Hus1bfDKxdxmC+XC9bnxdoM0Lm6E6AHanPsug+0tZLA=
X-Google-Smtp-Source: AGHT+IFECs3xXLfzjty274CbuoSdxurVt/fnTybIl9OmWuhos3xSfe2yEatqrch5aDBMJHYLJNfKVj2in1cYGsxmcp6oDAg9FTWC
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3b87:b0:3a7:87f2:b010 with SMTP id
 e9e14a558f8ab-3a787f2b18fmr50885135ab.5.1732158362777; Wed, 20 Nov 2024
 19:06:02 -0800 (PST)
Date: Wed, 20 Nov 2024 19:06:02 -0800
In-Reply-To: <673de7f9.050a0220.363a1b.0011.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <673ea39a.050a0220.363a1b.0083.GAE@google.com>
Subject: Re: [syzbot] [media?] [usb?] WARNING in iguanair_get_features/usb_submit_urb
From: syzbot <syzbot+e3ae1e7f4b88f3e696f5@syzkaller.appspotmail.com>
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

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=13907ae8580000
start commit:   f868cd251776 Merge tag 'drm-fixes-2024-11-16' of https://g..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=10507ae8580000
console output: https://syzkaller.appspot.com/x/log.txt?x=17907ae8580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d2aeec8c0b2e420c
dashboard link: https://syzkaller.appspot.com/bug?extid=e3ae1e7f4b88f3e696f5
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10edf1a7980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10d892c0580000

Reported-by: syzbot+e3ae1e7f4b88f3e696f5@syzkaller.appspotmail.com
Fixes: b3e40fc85735 ("USB: usb_parse_endpoint: ignore reserved bits")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

