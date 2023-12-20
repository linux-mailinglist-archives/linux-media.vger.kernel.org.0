Return-Path: <linux-media+bounces-2795-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D18819E46
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 12:41:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3E851F239E6
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 11:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEB5321A02;
	Wed, 20 Dec 2023 11:41:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632E2219EA
	for <linux-media@vger.kernel.org>; Wed, 20 Dec 2023 11:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-35d65c9dea3so56079385ab.3
        for <linux-media@vger.kernel.org>; Wed, 20 Dec 2023 03:41:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703072471; x=1703677271;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DZWvcvFWT3P94ESec92OyEYUrt6Ss1wkXtTKq4rDYxM=;
        b=xTPfPKD9kjrjjYf9N2YIswTLeThFZmcpN7U9+/cJL30SeONKz8Il5jEzQWq5coliB7
         YZiZmsSYabv/fZwTNV7+yy/ZaBdr4zFejNMC410u+iDYUZUda/hvNHhK0/AvK/RXqNuG
         PfY4h6oQ1eS50aWXY+iqeVvWfIx0je7mevdNjYBMYDiQoUtYWZFCwoTfwxMYanANttL9
         YLs2OGbLiPhH950jX5U2Bzj5KtjF6rv8Ehv51zGeJspcNJqAaAzMwWGAtZOHbWUYo4Ix
         jPbNHsrwFnfYxuCGPS9x6HeuiwgCNh1vlEVsc6KYSwDr4HNNGqpmf/LUOhiTTNimsnhb
         DfJQ==
X-Gm-Message-State: AOJu0YygGq1JQRySBqt/fXi3CeMGfRLCqFqjKl4FtrYy4QUBCSpXGdrf
	+bYSKRUPUgdWpeM4r4Z1nITBo15D9dIf3KQDHuuBdrC7qzoi
X-Google-Smtp-Source: AGHT+IE19RIDA8rceZNYE3OLPKGLd85fED/iwIB9sfne/rp8fCvDjEJpyKLGSD0MG8Ds1QeX4ZBjL/dllhWrP8WcEKStgSvPvqXO
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1bab:b0:35f:ce83:9590 with SMTP id
 n11-20020a056e021bab00b0035fce839590mr27397ili.1.1703072471625; Wed, 20 Dec
 2023 03:41:11 -0800 (PST)
Date: Wed, 20 Dec 2023 03:41:11 -0800
In-Reply-To: <0000000000003ee3610599d20096@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b2bbd0060cef75c4@google.com>
Subject: Re: [syzbot] KASAN: use-after-free Read in __media_entity_remove_links
From: syzbot <syzbot+0b0095300dfeb8a83dc8@syzkaller.appspotmail.com>
To: andreyknvl@google.com, laurent.pinchart@ideasonboard.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, mchehab@kernel.org, nogikh@google.com, 
	sakari.ailus@linux.intel.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

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

