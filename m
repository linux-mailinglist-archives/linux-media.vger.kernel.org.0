Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A90F7D8209
	for <lists+linux-media@lfdr.de>; Thu, 26 Oct 2023 13:53:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344833AbjJZLxM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Oct 2023 07:53:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230321AbjJZLxL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Oct 2023 07:53:11 -0400
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D62C1A7
        for <linux-media@vger.kernel.org>; Thu, 26 Oct 2023 04:53:08 -0700 (PDT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-3b3fb625e3bso933104b6e.3
        for <linux-media@vger.kernel.org>; Thu, 26 Oct 2023 04:53:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698321188; x=1698925988;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cuGIGPijPrgaBQJGLRU+uHqNxMgfOKS3BMUr9lUJhx0=;
        b=O/vRg8QaP+Wa0o9ITakh62zGY8cWNxV0/PA0eMwO7TCZMjd6gYX3eTYd+9G5XmJCaL
         b5LSN3QJTkNrZFY4HF5TDeXZ3NM4mK7NoVX3Hw/Lhguhq8vxQrVUF7PUjzM14WtR5lpM
         5C9PMtBUkCM1Nv6kOI10LY2Q48IdRkcHtLqQcuILBHDF0yQ+aJyjWBZRqsKeIwuvKuKC
         oi5Gix4G4ZZnBiVerTIfCzZmVzVfu5jLJzZJQiiMCJrtZ4exc2DMAudqZylIQAVmLYak
         pBgUroW93B2PbSbetR+QktnCmkDSMcdbTBy1yfArtEiziKRvfi7T9H5e9xPWFp84RsaP
         Y7+A==
X-Gm-Message-State: AOJu0Yz44rC8eiYBj2nY/sAhAsE1jmvNjPY966EOqtmF8mpivmLcc5GX
        ETFLOXiOGvfCwcw+KZ26zTTAXM8h+ntJkBqr61lmrEjFBOpG
X-Google-Smtp-Source: AGHT+IFmz41KBLkoWEbzAiuglztiW8vk0L4Jik6Xzp+mEiD/ouseO4CgSvXC4cd0Gkl5baT2gZU5UyNUOKnmRFdmpGwN+u1evZ0v
MIME-Version: 1.0
X-Received: by 2002:a05:6808:90:b0:3b2:df42:589f with SMTP id
 s16-20020a056808009000b003b2df42589fmr6525784oic.7.1698321187991; Thu, 26 Oct
 2023 04:53:07 -0700 (PDT)
Date:   Thu, 26 Oct 2023 04:53:07 -0700
In-Reply-To: <0000000000003a5c4905ef1044d6@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001ff5ed06089d37f1@google.com>
Subject: Re: [syzbot] [media?] WARNING in get_vaddr_frames
From:   syzbot <syzbot+59a71007ccac79e8bb69@syzkaller.appspotmail.com>
To:     david@redhat.com, hverkuil-cisco@xs4all.nl, hverkuil@xs4all.nl,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        m.szyprowski@samsung.com, mchehab@kernel.org,
        syzkaller-bugs@googlegroups.com, tfiga@chromium.org,
        torvalds@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

syzbot suspects this issue was fixed by commit:

commit 735de5caf79e06cc9fb96b1b4f4974674ae3e917
Author: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Date:   Thu Aug 17 10:41:32 2023 +0000

    media: vb2: frame_vector.c: replace WARN_ONCE with a comment

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=16c7ad5d680000
start commit:   53663f4103ff Merge tag 'nfs-for-6.5-2' of git://git.linux-..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=1b32f62c755c3a9c
dashboard link: https://syzkaller.appspot.com/bug?extid=59a71007ccac79e8bb69
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=178be4b7a80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=107609a7a80000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: media: vb2: frame_vector.c: replace WARN_ONCE with a comment

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
