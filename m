Return-Path: <linux-media+bounces-16258-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9783795110C
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 02:32:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFD121C22B34
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 00:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E2864411;
	Wed, 14 Aug 2024 00:32:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1753469D
	for <linux-media@vger.kernel.org>; Wed, 14 Aug 2024 00:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723595526; cv=none; b=RLkHAIua8AUiK3FwlBI+NpjR02LFpOG1mLgiBag5zfPgIS5qmUyJJh1M8yXiWb3jO8z6PLs5veOn4qFg3nvHwUOOT9DUDO4aD/artlb9FqD55jXQrEpoNoNIuKbRCQSc1BndIsa/IMZvF8MpAhjYRJFUAibIZLKvYUaaVQNPi0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723595526; c=relaxed/simple;
	bh=0AJ0HRNyjUJdZzMl0FTmNH4D7MeA9pIfXvP+Njv1Cew=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=CpcUOZv6RS95a6pPFASZ9wmgXz2sZ0c+n0QtnAREoXcTzRsUdvddlW91eYlnIWqUS0umaNxk31HUW15jDJ/fTuBm8C1AIZMxdoyWe2fbovJcl2uOKtM0GxMBVI8EK2WfMEIGcGCta8rhKDhSOqZ1vF6bNMgc4nr06pHUUc0Yk9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-821dabd4625so777258039f.0
        for <linux-media@vger.kernel.org>; Tue, 13 Aug 2024 17:32:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723595524; x=1724200324;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KN5LyX62t8kajm/Aoto7iYQTQrVYYSEk/pn2RlwMI5k=;
        b=grAdc5pktdYHu+HinJVtTQRe+D43w8ZMXVR5/kdHtLJmI7bwikb0TLBPI6BwSgCboo
         F+DhIS9QgrgC3ULZft1rYOyPIq1uKB2sidQJuTO7EPzRHeFKoTRq2uSi6g8RJK5AVezy
         jWEYkYUPQTLdHIYxjK6Tf3Ejmb76WS7xvsyzg9C3T+r30Gnt8Jmf9rNIZYwKlis2tLjL
         ex29eul3Vp3Eow6b8XF6BzNWIa7w41GMnAXpem/0v9qXB9KlKpxg7uVEKW+6gh1jaS+K
         LX6WEuWR6GXLVlRQj7wOZ/mPrrddJnH1rHPclPcyD73s4VdHV9QIqYTd0hofsZSghUFl
         dFpw==
X-Forwarded-Encrypted: i=1; AJvYcCXtMxcWbvWMY1PoEwh/omIs8GAikJ+ffsfLe5VhmKr6dRI9azqnmAkGI+SbjVSbxj9U/aDRy/lz2+9p1LKYXslvRX0xWlotbc/75Q8=
X-Gm-Message-State: AOJu0Yy4idmDtbDHd45FE0qQLNeiX5BMZOy/VsjOMTjZ5eZ9C/CZNVNW
	D4ueoZ6ebrD5l1XBDlElkuM/uSEe6B2N9OIXT+28IsW2LcWAcLz6+XXDw1oMnfmiCCR9CvBF+sD
	8dxOzZQpu1RlnYkoGS/S38FgjxD26UtoauHxI3V/hYbdy7vl9LdJFHZM=
X-Google-Smtp-Source: AGHT+IH/g8aCJGElQ8/VklE5ry7A0gnFjQgBbmtCcpZz0jkOADdHDRelv0/VaixlspNKb+4RvqquWD/KTAwBB1bAKcnlGLxEbNk8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c49:b0:374:9a34:a0a with SMTP id
 e9e14a558f8ab-39d12505416mr900485ab.6.1723595523843; Tue, 13 Aug 2024
 17:32:03 -0700 (PDT)
Date: Tue, 13 Aug 2024 17:32:03 -0700
In-Reply-To: <000000000000be3c1a0604b53a1c@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ef7be4061f99da2f@google.com>
Subject: Re: [syzbot] [mm?] kernel BUG in filemap_unaccount_folio
From: syzbot <syzbot+17a207d226b8a5fb0fd9@syzkaller.appspotmail.com>
To: airlied@redhat.com, akpm@linux-foundation.org, christian.koenig@amd.com, 
	daniel@ffwll.ch, david@redhat.com, dri-devel@lists.freedesktop.org, 
	fengwei.yin@intel.com, gurchetansingh@chromium.org, hughd@google.com, 
	kraxel@redhat.com, linaro-mm-sig-bounces@lists.linaro.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mm@kvack.org, sumit.semwal@linaro.org, 
	syzkaller-bugs@googlegroups.com, vivek.kasireddy@intel.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 7d79cd784470395539bda91bf0b3505ff5b2ab6d
Author: Vivek Kasireddy <vivek.kasireddy@intel.com>
Date:   Mon Jun 24 06:36:13 2024 +0000

    udmabuf: use vmf_insert_pfn and VM_PFNMAP for handling mmap

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17dad691980000
start commit:   9b6de136b5f0 Merge tag 'loongarch-fixes-6.7-1' of git://gi..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=6ae1a4ee971a7305
dashboard link: https://syzkaller.appspot.com/bug?extid=17a207d226b8a5fb0fd9
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15f58d67680000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10a78c62e80000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: udmabuf: use vmf_insert_pfn and VM_PFNMAP for handling mmap

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

