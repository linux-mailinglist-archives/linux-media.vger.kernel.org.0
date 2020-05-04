Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C5A91C3CF1
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 16:27:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728847AbgEDO1F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 10:27:05 -0400
Received: from mail-il1-f198.google.com ([209.85.166.198]:41837 "EHLO
        mail-il1-f198.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728695AbgEDO1F (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 May 2020 10:27:05 -0400
Received: by mail-il1-f198.google.com with SMTP id y2so13847056ilm.8
        for <linux-media@vger.kernel.org>; Mon, 04 May 2020 07:27:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=tPiCWo5vZt6eRDO7BBRPOa0yuIhUrB+l131rOX9s6CY=;
        b=qhp0r8ZYdKz9U0f3lqQlhywurS7WdtYaalSy7VEbpvduRFqMNwoDy3tXmJzvQ4xR3I
         8S07ZBht5pYvSROhDjeh03sL9oRIvNwre6Qo04d+7sFNNq9HqIBxgs234nU5+SMtJJnm
         qPCShPqqxGPH8moDkQtY87ViqZ2R/UBf1I8ORPxUtSZ2NlWeZyQgjsZy7gSiyQY3KUWU
         TQKPJomqXzSNzYmfYUy0T2bQGoJWVTW/QRI/rGz4R2JNYwoTubDiTBpmYDMZt1CT63fX
         rdGHOM+q4WVZFQS02CA3BgRklQOgkeQ1w8b4F9PqStkBxBmET5FLbeSaSQU4ENflr/zD
         RJqQ==
X-Gm-Message-State: AGi0Pua7PYwORllxvjbjSxQVjAHJoZRrtOxPOBry2uS4F9FEsSo3AtP7
        RhNZJXxR6qKQJpZB+rS9lszX4yHu+M4Q93X+4I7k3ATVRTIJ
X-Google-Smtp-Source: APiQypJ8harZ8NMOPBBI5viNbcdAe/HO5mOVtP+fh48bD5vjQGEpp9ITY+DyKOTs273WuBIXSFmjQ9qZWsR+xnFn/H5HXBGE1lGL
MIME-Version: 1.0
X-Received: by 2002:a92:5aca:: with SMTP id b71mr16544469ilg.56.1588602424468;
 Mon, 04 May 2020 07:27:04 -0700 (PDT)
Date:   Mon, 04 May 2020 07:27:04 -0700
In-Reply-To: <1588601290.13662.6.camel@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003329dd05a4d353d5@google.com>
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
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17327ea8100000

Note: testing is done by a robot and is best-effort only.
