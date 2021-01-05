Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EAC12EADE3
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:04:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727328AbhAEPDo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:03:44 -0500
Received: from mga02.intel.com ([134.134.136.20]:41911 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726652AbhAEPDn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 Jan 2021 10:03:43 -0500
IronPort-SDR: hRa12InfB/OTHyqbpKkSYHpo/wLdIcWF7o9yN58YKeeIRCpRGmlsc9Z26p9AV1vleBoKV/pW5Q
 cktqJtW33mhg==
X-IronPort-AV: E=McAfee;i="6000,8403,9854"; a="164189911"
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; 
   d="scan'208";a="164189911"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2021 07:01:57 -0800
IronPort-SDR: Oa0Y0EL8fCWv42Gi3WOGSu1cHtMZ/nzOpsp94cGFZCLuJieQfBEkqTa3YviFOSYGrCD5WCk/T9
 eIdTlmqpfwSQ==
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; 
   d="scan'208";a="496805998"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2021 07:01:55 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kwnrN-002DB3-Ai; Tue, 05 Jan 2021 17:02:57 +0200
Date:   Tue, 5 Jan 2021 17:02:57 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     syzbot <syzbot+b4d54814b339b5c6bbd4@syzkaller.appspotmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        royale@zerezo.com, syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Subject: Re: memory leak in zr364xx_probe
Message-ID: <20210105150257.GP4077@smile.fi.intel.com>
References: <0000000000006b86be05b7234cc1@google.com>
 <CAAEAJfADBQpyfgBjWtnnF-y0g_jRryrcHQd_J-123KxSrid5=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAEAJfADBQpyfgBjWtnnF-y0g_jRryrcHQd_J-123KxSrid5=Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Dec 31, 2020 at 05:47:20PM -0300, Ezequiel Garcia wrote:
> Let's see if this works:
> 
> #syz test: https://gitlab.collabora.com/linux/0day.git
> a1714d224e516b579d09cc1b4c3d85042e42f14c

Thanks for the hint!

> On Wed, 23 Dec 2020 at 12:27, syzbot
> <syzbot+b4d54814b339b5c6bbd4@syzkaller.appspotmail.com> wrote:
> >
> > Hello,
> >
> > syzbot found the following issue on:
> >
> > HEAD commit:    3644e2d2 mm/filemap: fix infinite loop in generic_file_buf..
> > git tree:       upstream
> > console output: https://syzkaller.appspot.com/x/log.txt?x=16f80eff500000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=37c889fb8b2761af
> > dashboard link: https://syzkaller.appspot.com/bug?extid=b4d54814b339b5c6bbd4
> > compiler:       gcc (GCC) 10.1.0-syz 20200507
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1089df07500000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1671c77f500000
> >
> > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > Reported-by: syzbot+b4d54814b339b5c6bbd4@syzkaller.appspotmail.com
> >
> > BUG: memory leak
> > unreferenced object 0xffffc90000e71000 (size 200704):
> >   comm "kworker/0:2", pid 3653, jiffies 4294942426 (age 13.820s)
> >   hex dump (first 32 bytes):
> >     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> >     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> >   backtrace:
> >     [<00000000110a155e>] __vmalloc_node_range+0x3a5/0x410 mm/vmalloc.c:2585
> >     [<000000008a1ee970>] __vmalloc_node mm/vmalloc.c:2617 [inline]
> >     [<000000008a1ee970>] vmalloc+0x49/0x50 mm/vmalloc.c:2650
> >     [<00000000a6a3abfa>] zr364xx_board_init drivers/media/usb/zr364xx/zr364xx.c:1348 [inline]
> >     [<00000000a6a3abfa>] zr364xx_probe+0x60b/0x833 drivers/media/usb/zr364xx/zr364xx.c:1509
> >     [<0000000014a572f5>] usb_probe_interface+0x177/0x370 drivers/usb/core/driver.c:396
> >     [<00000000f30ee977>] really_probe+0x159/0x480 drivers/base/dd.c:561
> >     [<00000000ddb29374>] driver_probe_device+0x84/0x100 drivers/base/dd.c:745
> >     [<0000000073c89cb9>] __device_attach_driver+0xee/0x110 drivers/base/dd.c:851
> >     [<000000009f56a99c>] bus_for_each_drv+0xb7/0x100 drivers/base/bus.c:431
> >     [<00000000848d591a>] __device_attach+0x122/0x250 drivers/base/dd.c:919
> >     [<00000000168be5bb>] bus_probe_device+0xc6/0xe0 drivers/base/bus.c:491
> >     [<00000000464f40a6>] device_add+0x5be/0xc30 drivers/base/core.c:3091
> >     [<000000008c75a2b5>] usb_set_configuration+0x9d9/0xb90 drivers/usb/core/message.c:2164
> >     [<00000000071d14a5>] usb_generic_driver_probe+0x8c/0xc0 drivers/usb/core/generic.c:238
> >     [<00000000f325b973>] usb_probe_device+0x5c/0x140 drivers/usb/core/driver.c:293
> >     [<00000000f30ee977>] really_probe+0x159/0x480 drivers/base/dd.c:561
> >     [<00000000ddb29374>] driver_probe_device+0x84/0x100 drivers/base/dd.c:745
> >
> >
> >
> > ---
> > This report is generated by a bot. It may contain errors.
> > See https://goo.gl/tpsmEJ for more information about syzbot.
> > syzbot engineers can be reached at syzkaller@googlegroups.com.
> >
> > syzbot will keep track of this issue. See:
> > https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> > syzbot can test patches for this issue, for details see:
> > https://goo.gl/tpsmEJ#testing-patches

-- 
With Best Regards,
Andy Shevchenko


