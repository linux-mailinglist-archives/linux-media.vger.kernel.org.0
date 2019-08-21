Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61A479750C
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2019 10:34:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727481AbfHUIdF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Aug 2019 04:33:05 -0400
Received: from mx2.suse.de ([195.135.220.15]:50264 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727409AbfHUIdF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Aug 2019 04:33:05 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 2A4E3AFB7;
        Wed, 21 Aug 2019 08:33:04 +0000 (UTC)
Message-ID: <1566375500.2611.6.camel@suse.com>
Subject: Re: [PATCH] dvb: usb: fix use after free in dvb_usb_device_exit
From:   Oliver Neukum <oneukum@suse.com>
To:     Ben Hutchings <ben@decadent.org.uk>, mchehab@kernel.org
Cc:     Anton Vasilyev <vasilyev@ispras.ru>, linux-media@vger.kernel.org
Date:   Wed, 21 Aug 2019 10:18:20 +0200
In-Reply-To: <fe983331d14442a96db3f71066ca0488a8921840.camel@decadent.org.uk>
References: <20190430130736.9191-1-oneukum@suse.com>
         <fe983331d14442a96db3f71066ca0488a8921840.camel@decadent.org.uk>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Dienstag, den 20.08.2019, 19:55 +0100 schrieb Ben Hutchings:
> On Tue, 2019-04-30 at 15:07 +0200, Oliver Neukum wrote:
> > dvb_usb_device_exit() frees and uses the device name in that order
> > Fix by storing the name in a buffer before freeing it
> > 
> > v2: fixed style issues
> > v3: strscpy used and variable names changed
> > v4: really use strscpy everywhere
> > 
> > Signed-off-by: Oliver Neukum <oneukum@suse.com>
> > Reported-by: syzbot+26ec41e9f788b3eba396@syzkaller.appspotmail.com
> 
> This doesn't fix that bug (and I don't think it fixes a bug at all). 
> The name string is static and doesn't get freed until the module it's
> in is freed.

I see.

> Look again at the stack traces in
> <https://syzkaller.appspot.com/bug?extid=26ec41e9f788b3eba396>:
> 
> > Allocated by task 21:
> 
> [...]
> >  kmemdup+0x23/0x50 mm/util.c:118
> > 
> 
>  kmemdup include/linux/string.h:428 [inline]
> >  dw2102_probe+0x62c/0xc50
> 
> drivers/media/usb/dvb-usb/dw2102.c:2375
> [...]
> > Freed by task 21:
> 
> [...]
> > 
> 
>  kfree+0xce/0x290 mm/slub.c:3958
> >  dw2102_probe+0x876/0xc50
> 
> drivers/media/usb/dvb-usb/dw2102.c:2409
> 
> So, d->desc was freed during probe, and is a dangling pointer before
> dvb_usb_device_exit() runs at all.

In that case KASAN would have reported a double free in testing, which
it did not.

> The bug seems to have been introduced by:
> 
> commit 299c7007e93645067e1d2743f4e50156de78c4ff
> Author: Anton Vasilyev <vasilyev@ispras.ru>
> Date:   Mon Jul 23 13:04:54 2018 -0400
> 
>     media: dw2102: Fix memleak on sequence of probes

AFAICT this patch only does anything if probe() succeeds, which it does
not. Something is strange.

	Regards
		Oliver

