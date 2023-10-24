Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD1827D5CED
	for <lists+linux-media@lfdr.de>; Tue, 24 Oct 2023 23:11:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344302AbjJXVLn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Oct 2023 17:11:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344160AbjJXVLn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Oct 2023 17:11:43 -0400
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 404A110D4
        for <linux-media@vger.kernel.org>; Tue, 24 Oct 2023 14:11:40 -0700 (PDT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-581e2c9197bso6870265eaf.3
        for <linux-media@vger.kernel.org>; Tue, 24 Oct 2023 14:11:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698181899; x=1698786699;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DZWvcvFWT3P94ESec92OyEYUrt6Ss1wkXtTKq4rDYxM=;
        b=GvLCzSsgapIBghDPZom6Bsxa/AcMaJI0guvg8UAbsftkbO5lrFCXqv/46eLD8vtH6y
         ayWo4JqaHGg9LLJbWr/Yl1+A4E9WXRzZW9WVxnRoPDEML+zHlxiP8pzzZ48jOVbKRCBk
         jxJ+l7cbfBzIDeHH7HXF4cn0npAkbW/9oGIeJkWjZjs0j625zBAYhF1ZJjej5PQGoCHs
         cPsQrXPrA1ZNLDeKZbjviO1vVcoXg72BkFXc1pVqR1+Kv4ehiSP8ZPVayHWmPsMUu5uz
         NaQDEHdq8wdPoQap7NkRZNXazzzyCz7kfleVlRNdl3LjWOHzjlsRL5p291du1WRYIPGC
         tS+Q==
X-Gm-Message-State: AOJu0YzoqfQyg7BVb1maM+gNSH22WL5fWkg6aQT0q9sl+S4NXtkxoDfp
        B3Hq3HPaxC/vtgLo7eZY1Xw6FXfTIKOiAJ7+wYV1t5UbByc9
X-Google-Smtp-Source: AGHT+IFIGdjAGzKoTrnYimPKPHmDG1kjuJTZCw+8fwLQZBt4HO+eQF/KgxqQt+0nli6xsdzu/gL97sZ4XmiD0ErEiKHID+MmReGv
MIME-Version: 1.0
X-Received: by 2002:a4a:350f:0:b0:581:def4:738d with SMTP id
 l15-20020a4a350f000000b00581def4738dmr3989735ooa.0.1698181899638; Tue, 24 Oct
 2023 14:11:39 -0700 (PDT)
Date:   Tue, 24 Oct 2023 14:11:39 -0700
In-Reply-To: <0000000000003ee3610599d20096@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000e45f1006087cc8ea@google.com>
Subject: Re: [syzbot] KASAN: use-after-free Read in __media_entity_remove_links
From:   syzbot <syzbot+0b0095300dfeb8a83dc8@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, laurent.pinchart@ideasonboard.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, mchehab@kernel.org, nogikh@google.com,
        sakari.ailus@linux.intel.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
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
