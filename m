Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 078E343D93E
	for <lists+linux-media@lfdr.de>; Thu, 28 Oct 2021 04:16:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbhJ1CRd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Oct 2021 22:17:33 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:56850 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbhJ1CRc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Oct 2021 22:17:32 -0400
Received: by mail-io1-f70.google.com with SMTP id e21-20020a056602159500b005e14c45db21so2365391iow.23
        for <linux-media@vger.kernel.org>; Wed, 27 Oct 2021 19:15:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=6yG8pcJo54/vxDX6p7Xpz0mDhkbXcuuHhQ0tF2/zx5g=;
        b=u8jZJ9uAhf/Ey4ESEAawX4PRyS5YINhSWKjUnP1g16efMFX9iJK1j+JPgzS+Jdq9qF
         lDP2FnC7QVSXH8gt4o7/8L0HoErdOmJZNn8M5ITH0TvdCEegEfiv/PNWahoJxheTEEFv
         l72li+h2fSPVB1qiRTNtPC5168YObTgjR/qlA3AlSNNdVJk4JycAxX2uwvRq9PFZow5e
         zW05ZlHjTFBuRgoTEwyv0cwt5mmQ1+FfdAak7f3BbqYcIbuYTEYpHOJ+SjwQVf0zUHss
         3cqKXF0bADprJe+dcut8Ko26nqTgtlZQkPchRfvmdGfB+xJX/jgTz76WoHncc5nayYSe
         PXJQ==
X-Gm-Message-State: AOAM5338k5jTUgJwZrAQclPR2NnG1bBMVB/phBGmxjxqoGPDN0MUrW7g
        sxG31OTHQZqX6zPN/wORh8OxIU8aE/vbJ+h463yCMk6f1ZbC
X-Google-Smtp-Source: ABdhPJzcSorb1KARbjJuazLmAfL+5SdTTWdZypcGX+Si7N9T1NNDXJ4DOpUfV3/jg9EUyHmPOXTHGnfR0KVgoFgwpLcLEWUEbWTC
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c4d:: with SMTP id d13mr1095444ilg.120.1635387306485;
 Wed, 27 Oct 2021 19:15:06 -0700 (PDT)
Date:   Wed, 27 Oct 2021 19:15:06 -0700
In-Reply-To: <0000000000000f73a805afeb9be8@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000792dda05cf604775@google.com>
Subject: Re: [syzbot] BUG: spinlock bad magic in synchronize_srcu
From:   syzbot <syzbot+05017ad275a64a3246f8@syzkaller.appspotmail.com>
To:     bcm-kernel-feedback-list@broadcom.com, bhelgaas@google.com,
        bp@alien8.de, dave.hansen@linux.intel.com,
        devel@driverdev.osuosl.org, f.fainelli@gmail.com,
        gregkh@linuxfoundation.org, hpa@zytor.com,
        info@cestasdeplastico.com, jmattson@google.com, joro@8bytes.org,
        kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-pci@vger.kernel.org,
        linux-rpi-kernel-owner@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org, lorenzo.pieralisi@arm.com,
        mchehab@kernel.org, mingo@redhat.com, nsaenzjulienne@suse.de,
        pbonzini@redhat.com, robh@kernel.org,
        sean.j.christopherson@intel.com, seanjc@google.com,
        sfr@canb.auug.org.au, syzkaller-bugs@googlegroups.com,
        tcs_kernel@tencent.com, tglx@linutronix.de, vkuznets@redhat.com,
        wanpengli@tencent.com, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

syzbot suspects this issue was fixed by commit:

commit eb7511bf9182292ef1df1082d23039e856d1ddfb
Author: Haimin Zhang <tcs_kernel@tencent.com>
Date:   Fri Sep 3 02:37:06 2021 +0000

    KVM: x86: Handle SRCU initialization failure during page track init

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=143e2b02b00000
start commit:   78e709522d2c Merge tag 'for_linus' of git://git.kernel.org..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=2150ebd7e72fa695
dashboard link: https://syzkaller.appspot.com/bug?extid=05017ad275a64a3246f8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10b72895300000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14c42853300000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: KVM: x86: Handle SRCU initialization failure during page track init

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
