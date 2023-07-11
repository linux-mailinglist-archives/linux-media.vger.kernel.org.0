Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A4DA74EFC1
	for <lists+linux-media@lfdr.de>; Tue, 11 Jul 2023 15:01:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231190AbjGKNBz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jul 2023 09:01:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229907AbjGKNBy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jul 2023 09:01:54 -0400
Received: from mail-oi1-x247.google.com (mail-oi1-x247.google.com [IPv6:2607:f8b0:4864:20::247])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7695B1720
        for <linux-media@vger.kernel.org>; Tue, 11 Jul 2023 06:01:24 -0700 (PDT)
Received: by mail-oi1-x247.google.com with SMTP id 5614622812f47-3a3b86821fcso4249332b6e.0
        for <linux-media@vger.kernel.org>; Tue, 11 Jul 2023 06:01:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689080409; x=1691672409;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZHO68MXPpG0tvQzxAfkPPUuZs9MEkFTVvcLzHBD3OLA=;
        b=A315ppGj0Yz2LcQllgyFaSFwnALI89tAsXhH5E6jrTqGGubZgIJl/N8REQCFQLiF/l
         B1E60wdUCscS/PraGkcSlhs4eTZtd5dj8ATEVzPG/JGxAZ2rWiqvvMpPUBcxMUHcgGww
         7hI3tTs/eSOKBhASDHhQ8JV8KgmIHfalzGGz7/Lo+peBbf5ojT6p3RzYT4xVAhspQg9K
         bE3/GQQmoEtXlWOltWqViW5nsAxhqCRmQ2hSlP6+OJAinYFiZDFTrl48txxL/4FXgW62
         2QiaDGVrv2XDifdYcly3oBPHPXE6WCzC9si0bltMFAIcthLFav2yNmu3JdYcDM7Macwg
         gLvg==
X-Gm-Message-State: ABy/qLYhJTb2FdS2ZLKNR9m82lu4jKtu1vHxXmzLE8D6d476dQBWmCAG
        BYG4KEF6hluxBGQehIuRRWx2V0tKrLWeSLwZi53VmcQHiySG
X-Google-Smtp-Source: APBJJlEM78f3nwOEwdHgjq9Mi44uFvFxi3Se/Jn99rEUe9f1P8TqteqjzvWe8OaMMfEt089MxeYLbUkwtNmaBVqFxUOiFEarLPfK
MIME-Version: 1.0
X-Received: by 2002:a05:6808:e82:b0:3a3:7eca:3022 with SMTP id
 k2-20020a0568080e8200b003a37eca3022mr2139536oil.2.1689080408726; Tue, 11 Jul
 2023 06:00:08 -0700 (PDT)
Date:   Tue, 11 Jul 2023 06:00:08 -0700
In-Reply-To: <0000000000003ee3610599d20096@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c26a66060035ad18@google.com>
Subject: Re: [syzbot] KASAN: use-after-free Read in __media_entity_remove_links
From:   syzbot <syzbot+0b0095300dfeb8a83dc8@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, laurent.pinchart@ideasonboard.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, mchehab@kernel.org, nogikh@google.com,
        sakari.ailus@linux.intel.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SORTED_RECIPS,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This bug is marked as fixed by commit:
media: uvcvideo: Avoid cyclic entity chains due to malformed

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
