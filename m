Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 004591B5C1A
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2020 15:05:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728539AbgDWNFI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 09:05:08 -0400
Received: from mail-il1-f197.google.com ([209.85.166.197]:43481 "EHLO
        mail-il1-f197.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728367AbgDWNFH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 09:05:07 -0400
Received: by mail-il1-f197.google.com with SMTP id c15so4586863ilj.10
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2020 06:05:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=mDeCiJymVJtdQweAH4ZMSfwDQZ44U0uHTCRHrn44daU=;
        b=oWiy1bddUerU/GG4JzB+NRGJwuLsn3WPreST2hCZfADReFxcViYkceSGae1MrUZ/I/
         pbk1rwXqY4xAJjCu0Idur4hDgy8jc36kCht+I9MsGj/PmZp8Q06Q8fSyTsR+qzMu2RD2
         bdgLrCweJHnhHHfHUido1Ibq1T4QYMilwXSUi6M8N/izIZnvSoU1u6Y04Wj+7OtInBWG
         DtCRQc78ATml1gh6tE4tKaWISbuS+q3B90CY6vhchLIUYFtGJRh2jAvdLjAs96DcMA2G
         /vPn9LaCVbKkUhj0qjr6ZPA7C3fv4+f2bY89F5Pg7KlnkVDV/zAN8bIB++Yv8xpry4VU
         gpCQ==
X-Gm-Message-State: AGi0PuZ7I3EVj/37IJVDhWQQehMwGiBXDAMu4d0MFPtZhgES+Gc5kgGQ
        MYQqeV0i+llS2/N9uoSo6hJt4TrLqr3ZPdK7/lnrMkrp8B5q
X-Google-Smtp-Source: APiQypKXyqz/JlzpTAggRql5Ts4MQd1Yv7aMiN6XtgTUti0YG9yIBcvxI2iQdzYPdf5loOr0vwEuoAe/wokm4kEL4FbCdg+q2dxO
MIME-Version: 1.0
X-Received: by 2002:a5d:9354:: with SMTP id i20mr3491302ioo.207.1587647105465;
 Thu, 23 Apr 2020 06:05:05 -0700 (PDT)
Date:   Thu, 23 Apr 2020 06:05:05 -0700
In-Reply-To: <1587645997.23108.9.camel@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c0064305a3f4e57b@google.com>
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
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1396d5bfe00000

Note: testing is done by a robot and is best-effort only.
