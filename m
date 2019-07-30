Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5155E7A28B
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2019 09:51:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730674AbfG3Hve (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jul 2019 03:51:34 -0400
Received: from mx2.suse.de ([195.135.220.15]:59346 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726953AbfG3Hve (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jul 2019 03:51:34 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 10778AE8B;
        Tue, 30 Jul 2019 07:51:33 +0000 (UTC)
Message-ID: <1564473085.25582.19.camel@suse.com>
Subject: Re: general protection fault in flexcop_usb_probe
From:   Oliver Neukum <oneukum@suse.com>
To:     Andrey Konovalov <andreyknvl@google.com>,
        syzbot <syzbot+d93dff37e6a89431c158@syzkaller.appspotmail.com>
Cc:     syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        linux-media@vger.kernel.org, USB list <linux-usb@vger.kernel.org>
Date:   Tue, 30 Jul 2019 09:51:25 +0200
In-Reply-To: <CAAeHK+yY3JWAj+EZ5wzqUOMbN+cdddCoRn7Nxn759-7zR-J7BQ@mail.gmail.com>
References: <1564410374.25582.15.camel@suse.com>
         <000000000000488c6d058ed337b2@google.com>
         <CAAeHK+yY3JWAj+EZ5wzqUOMbN+cdddCoRn7Nxn759-7zR-J7BQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Montag, den 29.07.2019, 18:54 +0200 schrieb Andrey Konovalov:

Hi,

> Thanks a lot for fixing all of these USB bugs!

I fear the day we get serious about MA USB.
All these issues will turn into security issues.

> The usb-fuzzer branch is working again, so it should be possible to
> use it for testing. But, I've actually just realized, that the proper
> way to test fixes for USB bugs is to use the exact commit hash that is
> provided in each bug report (the kernel interface for emulating USB
> device is not stable yet, and has significantly changed at least
> once). I've updated syzbot documentation to reflect this.

Where is taht documentation?

> Let's try to retest this one with the right kernel commit id:
> 
> #syz test: https://github.com/google/kasan.git 9a33b369

Retesting.

	Regards
		Oliver

