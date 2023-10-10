Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C09017C4215
	for <lists+linux-media@lfdr.de>; Tue, 10 Oct 2023 23:11:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231749AbjJJVLi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Oct 2023 17:11:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231376AbjJJVLh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Oct 2023 17:11:37 -0400
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 021DF9B
        for <linux-media@vger.kernel.org>; Tue, 10 Oct 2023 14:11:36 -0700 (PDT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-1e132944da9so374636fac.0
        for <linux-media@vger.kernel.org>; Tue, 10 Oct 2023 14:11:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696972295; x=1697577095;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DZWvcvFWT3P94ESec92OyEYUrt6Ss1wkXtTKq4rDYxM=;
        b=TEBXaPT7hXZx1sqCck3VTU41ONXkmKRFwFeszlsZgcTr6Yx9ghApOABxAWrBQuQR06
         vq0j8aRT1SRG6UDXvWIqlN9n7xwGgW/74svNKeLqZSqfXNpCah5dFagnpZJFXixyVOw6
         iYtUcOoFLQa4jAAsizsg/XvySAiWjZwhb6jTVRizrSYqZTKxpC1Az6Lmdqdcyq3zKBtY
         oDtVaQUZ8oqfrYe1p1fgikCgTv+2GDg+e1JqSXbmf/XlsBNCvYasmktSEZ1IU/hNDBjx
         wTxsP7ajY1wqbM5GLEGJ2mxc9XWtBlY3HT/BwHgQMhmu6D+qpjKKfm0KymVbs46T0Jfc
         b+Ig==
X-Gm-Message-State: AOJu0YxH9ts9lqcNM7+nY4IDahz2kUdOIkXb05Rq3RXwxF400zwEBora
        MwusPN+LCDRr89hRAoGyOoJrfIfk4XFdsdj7vAoGrVw04KiZ
X-Google-Smtp-Source: AGHT+IEip8/WB1KxD/i7SHZr01hyD5rCMbCsYc9ryFGNuYKojxiyUdRD1sIhFjIPArPGKDz+S+ZWIZzEf6rVWxHmkHDUZdRTKIGt
MIME-Version: 1.0
X-Received: by 2002:a05:6870:b79c:b0:1e9:6d19:935b with SMTP id
 ed28-20020a056870b79c00b001e96d19935bmr1140796oab.5.1696972295375; Tue, 10
 Oct 2023 14:11:35 -0700 (PDT)
Date:   Tue, 10 Oct 2023 14:11:35 -0700
In-Reply-To: <0000000000003ee3610599d20096@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000dc11d106076326fe@google.com>
Subject: Re: [syzbot] KASAN: use-after-free Read in __media_entity_remove_links
From:   syzbot <syzbot+0b0095300dfeb8a83dc8@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, laurent.pinchart@ideasonboard.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, mchehab@kernel.org, nogikh@google.com,
        sakari.ailus@linux.intel.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

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
