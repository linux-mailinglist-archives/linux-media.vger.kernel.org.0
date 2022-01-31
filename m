Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9E334A3E59
	for <lists+linux-media@lfdr.de>; Mon, 31 Jan 2022 08:50:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238778AbiAaHuM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Jan 2022 02:50:12 -0500
Received: from mail-io1-f70.google.com ([209.85.166.70]:37425 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237945AbiAaHuJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Jan 2022 02:50:09 -0500
Received: by mail-io1-f70.google.com with SMTP id q7-20020a6bf207000000b006129589cb60so9429662ioh.4
        for <linux-media@vger.kernel.org>; Sun, 30 Jan 2022 23:50:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=mUUhKABASSDYvCUsc04M7XBtQBbnsrCUfjP/FgUZhxY=;
        b=dopu9bREAQsmG6kde303M9p/o0g29P9bd0yoofcIztOFhage1XCu940GO9IOig7dnV
         RMKPtOiq+WR3WQm0ad1sTgQYf8F+MFAZ09iF44kM0jfHZ4lVkGqOVs/ToDDobsqDbw1+
         heQwLVBFpLvXvFKro0L3NJ0bCCEZh3grQ6gg6mztxRshE0VlaqjLvje7xvwxASED5dfH
         gEsu+P4Wk4p+Dl5HwF8fNNnBvclYzjWoaBEL4uIgQ6KXTQaWxkI0L5gtt/V5yeA9c1Ay
         czcse0znR70QK+Nc3hBVqQv66q7ZKKnrcyu++sUUDTgSAXQTyeiINNuuCDsw8BSNfBOf
         K2Kg==
X-Gm-Message-State: AOAM531EP2E0tuMsmzUeYKR9w9Do4fbbL0hPQJL1C0xa+fWPTS+B7ts5
        ZNPOxa++H9360jucePRxZ0NjB+vDtC4CZgl2tII7+GvcLNq/
X-Google-Smtp-Source: ABdhPJymwJlS8JsUdlrCW9lOYpIn2UaIQaZW0hA0lpGtEyFOwecg2a8tRTfuM68f+RfkiiN+E5hX3nWx76izWqmI0UiryQoaAMBM
MIME-Version: 1.0
X-Received: by 2002:a6b:d90c:: with SMTP id r12mr10512979ioc.99.1643615408629;
 Sun, 30 Jan 2022 23:50:08 -0800 (PST)
Date:   Sun, 30 Jan 2022 23:50:08 -0800
In-Reply-To: <0000000000008a7a1c05c9e53c87@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000942c2205d6dc0896@google.com>
Subject: Re: [syzbot] WARNING in drm_gem_shmem_vm_open
From:   syzbot <syzbot+91525b2bd4b5dff71619@syzkaller.appspotmail.com>
To:     airlied@linux.ie, bugs-a21@moonlit-rail.com,
        christian.koenig@amd.com, daniel.vetter@ffwll.ch,
        daniel.vetter@intel.com, daniel@ffwll.ch,
        dri-devel@lists.freedesktop.org, javierm@redhat.com,
        linaro-mm-sig-owner@lists.linaro.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, maarten.lankhorst@linux.intel.com,
        maxime@cerno.tech, melissa.srw@gmail.com, mripard@kernel.org,
        sumit.semwal@linaro.org, syzkaller-bugs@googlegroups.com,
        tzimmermann@suse.de
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

syzbot suspects this issue was fixed by commit:

commit 0499f419b76f94ede08304aad5851144813ac55c
Author: Javier Martinez Canillas <javierm@redhat.com>
Date:   Mon Jan 10 09:56:25 2022 +0000

    video: vga16fb: Only probe for EGA and VGA 16 color graphic cards

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=126571e0700000
start commit:   5d6ab0bb408f Merge tag 'xtensa-20211008' of git://github.c..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=32e6048063923b7b
dashboard link: https://syzkaller.appspot.com/bug?extid=91525b2bd4b5dff71619
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11073300b00000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: video: vga16fb: Only probe for EGA and VGA 16 color graphic cards

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
