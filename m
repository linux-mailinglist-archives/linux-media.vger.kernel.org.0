Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C85C6BC58
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2019 14:30:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727013AbfGQM3C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jul 2019 08:29:02 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:52037 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727063AbfGQM3B (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jul 2019 08:29:01 -0400
Received: by mail-io1-f71.google.com with SMTP id c5so26763314iom.18
        for <linux-media@vger.kernel.org>; Wed, 17 Jul 2019 05:29:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=AByShyV8MxugdrVAP52bTC11/zp2agBi1wk+fUcF/g8=;
        b=McaL+dWsB25Mlbn3ZpOS5WUwUPXvWSDjrOitcDy7B0ud0KQE1Yw7uNIRwPxnEGjNWi
         JMp3zvjs9Lh9kabDMQrajCboVnwfOV4bNcOkP9wF5euxRjESRdyfb2L3z3Ugf5ACoHP7
         N52AvoX99dnqVPa1dE+9z3FQO8RXbH/eWLvRBUDpO0zQdb6l6vXriLWdOsvnEzyEdgKK
         O52c1np9+w6c4u6CKX6FhH12s6WDzS98cNQRAFAD8ulSCvFYCHq+2EuzWyxqP5Aed3PA
         tdHNMnrnU7aSktuctUBY31g+fZQwIzEWkKpvQ3Oeza7Apao0r+l80q39xk426C9J4Ga/
         eKLg==
X-Gm-Message-State: APjAAAXkNhgCNrkvZ2Ku4/ZLK9tex1gJ6DWOY4TzYjR3cpYUoiOxOk5h
        nfBVDzM4R/V/GklS3lX61qCP2mJX2SR765WV0odNxIotNAbq
X-Google-Smtp-Source: APXvYqxoVSLYclq8vROH6mYIXxVdmTx0TM+Zs7tz/C19ac1rQJfL74aTHycQ78ufw/LQNLLowRXhr3VuOu/dGV+La6CLKhQSGzQp
MIME-Version: 1.0
X-Received: by 2002:a6b:90c1:: with SMTP id s184mr1909577iod.244.1563366541028;
 Wed, 17 Jul 2019 05:29:01 -0700 (PDT)
Date:   Wed, 17 Jul 2019 05:29:01 -0700
In-Reply-To: <CAAeHK+zPDgvDr_Bao9dz_7hGEg+Ud6-tj7pZaihKeYHJ8M386Q@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000054f8bd058ddfa341@google.com>
Subject: Re: KASAN: global-out-of-bounds Read in dvb_pll_attach
From:   syzbot <syzbot+8a8f48672560c8ca59dd@syzkaller.appspotmail.com>
To:     allison@lohutok.net, andreyknvl@google.com, bnvandana@gmail.com,
        hverkuil-cisco@xs4all.nl, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        mchehab@kernel.org, rfontana@redhat.com,
        syzkaller-bugs@googlegroups.com, tglx@linutronix.de,
        tskd08@gmail.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger  
crash:

Reported-and-tested-by:  
syzbot+8a8f48672560c8ca59dd@syzkaller.appspotmail.com

Tested on:

commit:         6a3599ce usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
kernel config:  https://syzkaller.appspot.com/x/.config?x=d90745bdf884fc0a
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1454f4d0600000

Note: testing is done by a robot and is best-effort only.
