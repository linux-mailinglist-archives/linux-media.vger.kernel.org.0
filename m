Return-Path: <linux-media+bounces-17426-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6549691B3
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 05:18:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D2C9284258
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 03:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E491A1CDFA2;
	Tue,  3 Sep 2024 03:18:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280121A264F
	for <linux-media@vger.kernel.org>; Tue,  3 Sep 2024 03:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725333484; cv=none; b=PPDto5rhL3ABiNb7FkcQ/nVnKSW3KrbYNJgk/hwUUyejqnvnUSomBVR+XV+5LcA1nRtN8PleyH/ovVvv6a4aKn5vs0zQuzTH9ig7yT1oS77D6ZD1mzTiw2VDyNDXswygHd1kxrlvAk1VIZYnu6hsH0sZ7jVfoWndrUOWK1LofwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725333484; c=relaxed/simple;
	bh=UKsafaKOpTutBvBKN9RjSvOLoEECFLlcAw8a8v5Ys9c=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=IcidKn5rdRsnCIyA6SkeV27XncFzs7FGbvGUEN71DGR369Ji2cs5DhfV4jiGoUsQF6eDgVLcRhKNNLuWcGZX0n86+KFA34ByOmby/ozNwpwvY+L1Ln5CWOGYxw8DlLosmQ04M+nAzGLm+qz46mhO1YgSLSJ8aw1jYPM11N1BPQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-82a124bc41aso585068139f.2
        for <linux-media@vger.kernel.org>; Mon, 02 Sep 2024 20:18:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725333482; x=1725938282;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GIY3qxhs+YBnko6fNMwuLTrNPy2grAd1WtMWfLFkFJI=;
        b=WCBcAEaCipbVKo9Ns0JwrEuXk1A/Kh/ai61zU7eCIDuhKifpQwXfX/jGlSsGC+PmWC
         fP8KShxBPxfJPlb+gqur8hQX43AR7tkv8mShsFQHnxeSN/3O5e7w0AizfsiyAzKs56Ns
         LU3U6C/p6/25erlWlFFTXNymBm7HCVW7ZEeNW8BzuoN8BsNt/0WK8doeWBCfwiSy1NEu
         XKZN7NTYtpoYSrQ3g5ayKTmG2v/Vp5e28NmJyg3I93Rms42VWudO2p+dKVNAz0zUXt7K
         HUhg8rIu6WK45OuhWqnYmUkLi8WR6GA0HmKnyteRWxakngyyQxqqNxmsu9jzg8XEfesW
         p6Gw==
X-Forwarded-Encrypted: i=1; AJvYcCVGLaES5taqFoPkpvXbh+NkovqKUGS6U6gtlIQhYm4axrxWAQpncoLuLoHfmr3rd9+ABXWIGkFSbFir1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1p0kFvTHekxaFtL6cjn8xI9oU8ZoeD7CDGCDzVxwwIPfe92it
	ofSnKZZOFREBF96cOn5WEqFsWu6m8RE+aau+x8qhhOoPJhAEiK4B8mBgi22QujCNQRTlREL0r75
	maNsVDOas/lhp/Pd8lA7SO8gHVeddm/qbKKAKy34GVHqs3L81jG2tvnY=
X-Google-Smtp-Source: AGHT+IFBMybLBaTqLgdWh7TJcaJZmtU5urQQ0tUdUlaaZlUimQoe76aQQTRgUjuWFNqjN5iwq8C6BagGTlxKEWjfCUs7Kgr/GiO0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a6c:b0:381:c14:70cf with SMTP id
 e9e14a558f8ab-39f40f06998mr7888575ab.1.1725333482204; Mon, 02 Sep 2024
 20:18:02 -0700 (PDT)
Date: Mon, 02 Sep 2024 20:18:02 -0700
In-Reply-To: <tencent_A536BA4B40741D769567D23CF5373096CA09@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000053836306212e81a7@google.com>
Subject: Re: [syzbot] [media?] WARNING in __v4l2_ctrl_modify_dimensions
From: syzbot <syzbot+a828133770f62293563e@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+a828133770f62293563e@syzkaller.appspotmail.com
Tested-by: syzbot+a828133770f62293563e@syzkaller.appspotmail.com

Tested on:

commit:         67784a74 Merge tag 'ata-6.11-rc7' of git://git.kernel...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11b49929980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=660f6eb11f9c7dc5
dashboard link: https://syzkaller.appspot.com/bug?extid=a828133770f62293563e
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=143f0f33980000

Note: testing is done by a robot and is best-effort only.

