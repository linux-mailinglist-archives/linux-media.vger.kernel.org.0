Return-Path: <linux-media+bounces-682-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 704E07F37E6
	for <lists+linux-media@lfdr.de>; Tue, 21 Nov 2023 22:13:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7BF66B21ACE
	for <lists+linux-media@lfdr.de>; Tue, 21 Nov 2023 21:13:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B1325466F;
	Tue, 21 Nov 2023 21:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F05D01BB
	for <linux-media@vger.kernel.org>; Tue, 21 Nov 2023 13:13:15 -0800 (PST)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-1ce66b44deaso56108355ad.1
        for <linux-media@vger.kernel.org>; Tue, 21 Nov 2023 13:13:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700601195; x=1701205995;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DZWvcvFWT3P94ESec92OyEYUrt6Ss1wkXtTKq4rDYxM=;
        b=GmjZABInG2MHrsy8FFJME0eFxQ3n7cEwjyh97IUVyxI2SbNo6ZJcIEFMm130pj0Nbe
         qkeW8vfEQWNVcOQtOF7w4fC+P1MZ7NCxD56EUNS3JTapFkDWWS2BGtFlIArheqsqx4wU
         HbecuPK2Vdpxs5KgT/xTPlwpzf8sNkHEXM4C8RD/oSiFCYlPZMzUyiCoRzgD6mNBWiQj
         ZVOEoyLzdZIce5Ta3+LccDimX+Cvab3nRDo6ps7n7xwf8fi/AiHOZq5iM98XBFK8DjyH
         JaOdvNfAKuyv44/SCB//y3nevTUIfprwA7BMYHKbhz2RKH/vtfbofHErxJEQ+z936Vc5
         a0+w==
X-Gm-Message-State: AOJu0YwNjO3EPGM2dR1vh4ZH+0lZBQevhJwKao0wzrT2KNS/OGCLOZ72
	KHQmXfH0YcqFWimcXmKfHEXrpg0VQnY8rq9VDX/Dk9veAb3t
X-Google-Smtp-Source: AGHT+IHM9W+C7Oq0Uv4PwRYXwS33JJ9uK/HjdaAoEujXz7jU6ukhsoO+N83LgpXYrU44Q8AnLhnEdLDIby2oGWjGRHsGykut9M7s
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a17:902:f688:b0:1cc:fd93:ab34 with SMTP id
 l8-20020a170902f68800b001ccfd93ab34mr79222plg.1.1700601195534; Tue, 21 Nov
 2023 13:13:15 -0800 (PST)
Date: Tue, 21 Nov 2023 13:13:15 -0800
In-Reply-To: <0000000000003ee3610599d20096@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000002a1fec060ab0120c@google.com>
Subject: Re: [syzbot] KASAN: use-after-free Read in __media_entity_remove_links
From: syzbot <syzbot+0b0095300dfeb8a83dc8@syzkaller.appspotmail.com>
To: andreyknvl@google.com, laurent.pinchart@ideasonboard.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, mchehab@kernel.org, nogikh@google.com, 
	sakari.ailus@linux.intel.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Level: **

This bug is marked as fixed by commit:
media: uvcvideo: Avoid cyclic entity chains due to malformed USB descriptors

But I can't find it in the tested trees[1] for more than 90 days.
Is it a correct commit? Please update it by replying:

#syz fix: exact-commit-title

Until then the bug is still considered open and new crashes with
the same signature are ignored.

Kernel: Linux
Dashboard link: https://syzkaller.appspot.com/bug?extid=0b0095300dfeb8a83dc8

---
[1] I expect the commit to be present in:

1. for-kernelci branch of
git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git

2. master branch of
git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git

3. master branch of
git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git

4. main branch of
git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git

The full list of 9 trees can be found at
https://syzkaller.appspot.com/upstream/repos

