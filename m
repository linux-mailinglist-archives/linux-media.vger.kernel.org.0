Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36127BB148
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2019 11:21:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406701AbfIWJV3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Sep 2019 05:21:29 -0400
Received: from mx2.suse.de ([195.135.220.15]:39852 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2406104AbfIWJV3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Sep 2019 05:21:29 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id E51AFAE6F;
        Mon, 23 Sep 2019 09:21:27 +0000 (UTC)
Message-ID: <1569229570.7831.3.camel@suse.com>
Subject: Re: general protection fault in flexcop_usb_probe
From:   Oliver Neukum <oneukum@suse.com>
To:     Andrey Konovalov <andreyknvl@google.com>,
        syzbot <syzbot+d93dff37e6a89431c158@syzkaller.appspotmail.com>
Cc:     syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        linux-media@vger.kernel.org, USB list <linux-usb@vger.kernel.org>
Date:   Mon, 23 Sep 2019 11:06:10 +0200
In-Reply-To: <CAAeHK+w0vKt94g-h+NOqW-GJKyqikbAfU4sTBeKeJS-sUkZ69g@mail.gmail.com>
References: <1564472907.25582.16.camel@suse.com>
         <00000000000081a9c1058ee1d06a@google.com>
         <CAAeHK+w0vKt94g-h+NOqW-GJKyqikbAfU4sTBeKeJS-sUkZ69g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Freitag, den 20.09.2019, 18:01 +0200 schrieb Andrey Konovalov:

> > Reported-and-tested-by:
> > syzbot+d93dff37e6a89431c158@syzkaller.appspotmail.com

[..]
> Hi Oliver,
> 
> I was wondering if you've submitted this patch anywhere? The bug is
> still happening.
> 
> https://syzkaller.appspot.com/bug?id=c0203bd72037d07493f4b7562411e4f5f4553a8f

Hi,

I definitely did submit it:
https://www.mail-archive.com/linux-media@vger.kernel.org/msg148850.html

	Regards
		Oliver

