Return-Path: <linux-media+bounces-1750-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BFED1806E39
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 12:40:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79B7B281D16
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 11:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E876A34553;
	Wed,  6 Dec 2023 11:40:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41E2C112
	for <linux-media@vger.kernel.org>; Wed,  6 Dec 2023 03:40:17 -0800 (PST)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-3b8b8562577so6001584b6e.1
        for <linux-media@vger.kernel.org>; Wed, 06 Dec 2023 03:40:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701862816; x=1702467616;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DZWvcvFWT3P94ESec92OyEYUrt6Ss1wkXtTKq4rDYxM=;
        b=gxYQyhqgiVKii058aGOG8EBMfw3/ZmMXZIKacgKoLQNxkPBZlYKYMkNPqe3Z2tGfIR
         dMfiDMTMl6+jKBEaBETII+WooDNRAlf6iPzohxJHlWKMcze/WVQhYMphEdsGgNhmJrip
         csI8Af9yPa+IFX+FawR5azYABzBeG+bM/T+AGagk8CX0v3FN93wPRmY4nAieaUVnTNY7
         gQ9gIH1fuzVd7AyuR7CxXmIIQ7NsL0rhLE7EYtVLsHAvtLt6WG+i3xoua/kj2K7YQNNM
         WXdZ+aF9fmmq4PtZfLIdL8LBtMUiamqkhMn/WRrskzVXMh0mzGw5DZP2G1ueOJpMgDzP
         5GMg==
X-Gm-Message-State: AOJu0YyErVJvd8aWRIfvXeywPi4HWYRNPslLNtMeypojjMG/bDB5AM14
	bzvX1x1Bvu78wiaIA8NOuO2d82rOq81iekNgoFRwDF/BzfgA
X-Google-Smtp-Source: AGHT+IF30lSMDndHoVg2hQdtUmnxotgzo3as2Lm5GYCQztnzYfAogJgPNYAHJk6lB9qUllZmbMV+u1ITI60NV8NBZ7PXTC2KMXoQ
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:158e:b0:3b5:6a59:abb7 with SMTP id
 t14-20020a056808158e00b003b56a59abb7mr793260oiw.6.1701862816633; Wed, 06 Dec
 2023 03:40:16 -0800 (PST)
Date: Wed, 06 Dec 2023 03:40:16 -0800
In-Reply-To: <0000000000003ee3610599d20096@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a45bc3060bd5d08f@google.com>
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

