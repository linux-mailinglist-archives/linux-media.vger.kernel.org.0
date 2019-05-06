Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4351E1555C
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2019 23:21:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726046AbfEFVVB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 May 2019 17:21:01 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:43285 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726118AbfEFVVA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 May 2019 17:21:00 -0400
Received: by mail-io1-f69.google.com with SMTP id y15so4074032iod.10
        for <linux-media@vger.kernel.org>; Mon, 06 May 2019 14:21:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=3WXXuM4jc1H6fTU0L4fqfM+2De6q8C/mSZo5MFiBbqA=;
        b=ljI28YUipcuB14rIIvVhe7n7CKbdPpSurtCVLmuxi5nFiKlvwsYX+e/Ic8u5VZhtYI
         57cbuUWb+5PFlvOctfvG6J+tA1hLb9MuQ1mpc0n3yM9nW7eonvuGYltiNKuCcwHT905s
         Q56G8Y4EWzhQ+B2EZ17kMMEt73u6OtxFifejOV4KY0S0oJN2O7PasEpBAPVtl+NzpWEk
         +GgYRaVGJW8dTO3LMb7S1D/bw0tfKB9wMY02gOzxKKVDAWAlkQ4l42ehSuowufg5gxkR
         k1WCQXKuMykG1BZaGudhqk/zC7Q5VGwVbuZuSOJ0rfXDFF5xKZPqbnX6r418QrouPRYS
         1Idw==
X-Gm-Message-State: APjAAAVz7jTweWwbHZBU6QZHlA1tuWgsbQa7ArAbSW1AQrFoTkag5zYX
        wR/aMykFy56zOTlEmz9VV9N/GDkGzptYZu56tU30Yc1fN9vf
X-Google-Smtp-Source: APXvYqznI2fnTDVloYMj/zQyCyUvoYQHrX8gdFMohsJBIw//BIN2L+HbvAMaPk6Zg0MMg16PBeg2Lyhg/NYzxVv35PxgqwHFjqAP
MIME-Version: 1.0
X-Received: by 2002:a6b:f701:: with SMTP id k1mr18203142iog.240.1557177660211;
 Mon, 06 May 2019 14:21:00 -0700 (PDT)
Date:   Mon, 06 May 2019 14:21:00 -0700
In-Reply-To: <Pine.LNX.4.44L0.1905061638380.1585-100000@iolanthe.rowland.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000004a08f805883ead54@google.com>
Subject: Re: general protection fault in smsusb_init_device
From:   syzbot <syzbot+53f029db71c19a47325a@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        mchehab@kernel.org, stern@rowland.harvard.edu,
        syzkaller-bugs@googlegroups.com, wen.yang99@zte.com.cn
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger  
crash:

Reported-and-tested-by:  
syzbot+53f029db71c19a47325a@syzkaller.appspotmail.com

Tested on:

commit:         43151d6c usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
kernel config:  https://syzkaller.appspot.com/x/.config?x=274aad0cf966c3bc
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12c3fda4a00000

Note: testing is done by a robot and is best-effort only.
