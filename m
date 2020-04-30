Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64EAE1BF982
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 15:29:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727118AbgD3N3G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Apr 2020 09:29:06 -0400
Received: from mail-il1-f197.google.com ([209.85.166.197]:55432 "EHLO
        mail-il1-f197.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727113AbgD3N3F (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Apr 2020 09:29:05 -0400
Received: by mail-il1-f197.google.com with SMTP id l6so1203110ils.22
        for <linux-media@vger.kernel.org>; Thu, 30 Apr 2020 06:29:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=1CoMm2Azd5e1nYZiwwTlCj2XcjRhvuc5WQvJ2+Ve3k8=;
        b=hyne/6NPq/t75K4lyNpxWM+MW6R/6lVnSatD8HPH9A0Jl4pyraUCLVCxoHqhVsE5fG
         DJ+ZR3Z77SkqYY4k96x2Fb3albMLwtR5Z4RQdlv5SiP8kvEfRNT80q7Ak/m8+X+jJMCJ
         ycAgh6PPI2696MNktyC2XBXj/zcX+GWGQRj8Qlovp4FL21OfVthBom7iDSL2XFw89p8u
         21H4b9q7iNBtTJzA+QOmL1v/bkIEHpBsz5ZSLHl8r9cG8piZo6KFL+kjNI8ZyjRt9Dr5
         IEtrpE7X5hD/SmD4GZjhpnjEaVYQV0VnrJSg1w0qw4hvG1o7X74MOINLtjDWEdUXKLKz
         7YJg==
X-Gm-Message-State: AGi0Pub2tySNdoXIMozl0nEn++MXuaKq93xWqSs/UaKFKP0Uyf8MkGDM
        dVCgQC5CBwmaNFo4Fc2HdN4RuFya6nbW6C8lbxzUCZzhLWZe
X-Google-Smtp-Source: APiQypLBM1FBRIDe5Ddt7k1hoFXEzo7fAJ9y7lQ8WxdoltukqZx96b9QYJoo9m9XKYr8BYFj93eIJfa114DWKGjW1x0aFC5eU46O
MIME-Version: 1.0
X-Received: by 2002:a92:aac7:: with SMTP id p68mr1770364ill.62.1588253343506;
 Thu, 30 Apr 2020 06:29:03 -0700 (PDT)
Date:   Thu, 30 Apr 2020 06:29:03 -0700
In-Reply-To: <1588252185.16510.12.camel@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000005a826305a4820c1e@google.com>
Subject: Re: general protection fault in go7007_usb_probe
From:   syzbot <syzbot+cabfa4b5b05ff6be4ef0@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, hverkuil-cisco@xs4all.nl,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, mchehab@kernel.org, oneukum@suse.com,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger crash:

Reported-and-tested-by: syzbot+cabfa4b5b05ff6be4ef0@syzkaller.appspotmail.com

Tested on:

commit:         e9010320 usb: cdns3: gadget: make a bunch of functions sta..
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=bd14feb44652cfaf
dashboard link: https://syzkaller.appspot.com/bug?extid=cabfa4b5b05ff6be4ef0
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=163fcf90100000

Note: testing is done by a robot and is best-effort only.
