Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0EA03F2FE6
	for <lists+linux-media@lfdr.de>; Fri, 20 Aug 2021 17:45:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241141AbhHTPpr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Aug 2021 11:45:47 -0400
Received: from mail-il1-f197.google.com ([209.85.166.197]:43539 "EHLO
        mail-il1-f197.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241187AbhHTPpp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Aug 2021 11:45:45 -0400
Received: by mail-il1-f197.google.com with SMTP id v5-20020a92ab050000b02902223cc2accaso5595967ilh.10
        for <linux-media@vger.kernel.org>; Fri, 20 Aug 2021 08:45:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=C/764d47f9BqIhAgXfMN7s6wRczQbgVQBUoxA/nuXAk=;
        b=uNKfzDTq/MsdUHWO+KAGDtr2TBtBLuqSwtldqAiQ7xl55xmsgqhd5LO7sq2BUajHJw
         CEQNFJfX77lfGRSuQ1Y7RzrWL791n8ws/jq49jSe/GYp7hsFqJVvUnZHT39lJxeIOLFa
         yIoaLUUMB+71dE3khWyLyaXaIZ0AvocRD4FTiDQBM73BWt5QRBi8od0ddhNFk1qu506a
         6oYfFD0NLbWboXW16Yi6LnecPAYtrt3SvbGoIUcCndMBCXdofmv9LnZwYxXUiEHsOM1Y
         S/I03H+RzoRJqHti4/dFYbzhB03lVy8sySdF3Et0yucpIcCXIJ8SzfkIHBC7LliZLPXq
         JJHQ==
X-Gm-Message-State: AOAM5304MYj9Sc6oiej611CuOjMQ3JGKe430DXaPLLrGSdp/TbBanqyf
        CekuW831HFc/JYfHGcqAF//1gbGrArMCXIbUdU1xrW2yWUMV
X-Google-Smtp-Source: ABdhPJyIdR2IpSoaS+ZJXlVx5Fzsmf7Slk+cMg4U2DAEwIy+JEtW6jamlvFI5GIp6I8WEWSshVAwBFPRLSFLcMM3VHUgcDZ7hNq0
MIME-Version: 1.0
X-Received: by 2002:a92:dd82:: with SMTP id g2mr14479298iln.279.1629474307681;
 Fri, 20 Aug 2021 08:45:07 -0700 (PDT)
Date:   Fri, 20 Aug 2021 08:45:07 -0700
In-Reply-To: <0000000000008a7a1c05c9e53c87@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000047b52b05c9ff8d0b@google.com>
Subject: Re: [syzbot] WARNING in drm_gem_shmem_vm_open
From:   syzbot <syzbot+91525b2bd4b5dff71619@syzkaller.appspotmail.com>
To:     airlied@linux.ie, christian.koenig@amd.com, daniel.vetter@ffwll.ch,
        daniel.vetter@intel.com, daniel@ffwll.ch,
        dri-devel@lists.freedesktop.org,
        linaro-mm-sig-owner@lists.linaro.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, maarten.lankhorst@linux.intel.com,
        melissa.srw@gmail.com, mripard@kernel.org, sumit.semwal@linaro.org,
        syzkaller-bugs@googlegroups.com, tzimmermann@suse.de
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

syzbot has bisected this issue to:

commit ea40d7857d5250e5400f38c69ef9e17321e9c4a2
Author: Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Fri Oct 9 23:21:56 2020 +0000

    drm/vkms: fbdev emulation support

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11c31d55300000
start commit:   614cb2751d31 Merge tag 'trace-v5.14-rc6' of git://git.kern..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=13c31d55300000
console output: https://syzkaller.appspot.com/x/log.txt?x=15c31d55300000
kernel config:  https://syzkaller.appspot.com/x/.config?x=96f0602203250753
dashboard link: https://syzkaller.appspot.com/bug?extid=91525b2bd4b5dff71619
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=122bce0e300000

Reported-by: syzbot+91525b2bd4b5dff71619@syzkaller.appspotmail.com
Fixes: ea40d7857d52 ("drm/vkms: fbdev emulation support")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
