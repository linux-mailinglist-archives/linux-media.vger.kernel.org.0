Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20107F32C3
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2019 16:18:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388596AbfKGPSM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Nov 2019 10:18:12 -0500
Received: from mx2.suse.de ([195.135.220.15]:60752 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729873AbfKGPSM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 Nov 2019 10:18:12 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 1F58BB0BA;
        Thu,  7 Nov 2019 15:18:11 +0000 (UTC)
Message-ID: <1573138928.3024.6.camel@suse.com>
Subject: Re: general protection fault in flexcop_usb_probe
From:   Oliver Neukum <oneukum@suse.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Andrey Konovalov <andreyknvl@google.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        syzbot <syzbot+d93dff37e6a89431c158@syzkaller.appspotmail.com>,
        linux-media@vger.kernel.org, USB list <linux-usb@vger.kernel.org>
Date:   Thu, 07 Nov 2019 16:02:08 +0100
In-Reply-To: <315c5ac2-c979-e194-0c79-d8704ff7f66a@xs4all.nl>
References: <1564472907.25582.16.camel@suse.com>
         <00000000000081a9c1058ee1d06a@google.com>
         <CAAeHK+w0vKt94g-h+NOqW-GJKyqikbAfU4sTBeKeJS-sUkZ69g@mail.gmail.com>
         <1569229570.7831.3.camel@suse.com>
         <CAAeHK+xspiZSWzzVYbMoAV21T0jFX8g+7D8fwkv413ezNWwT_g@mail.gmail.com>
         <315c5ac2-c979-e194-0c79-d8704ff7f66a@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Montag, den 23.09.2019, 14:51 +0200 schrieb Hans Verkuil:
> On 9/23/19 2:46 PM, Andrey Konovalov wrote:
> > On Mon, Sep 23, 2019 at 11:21 AM Oliver Neukum <oneukum@suse.com> wrote:
> > > 
> > > Am Freitag, den 20.09.2019, 18:01 +0200 schrieb Andrey Konovalov:
> > > 
> > > > > Reported-and-tested-by:
> > > > > syzbot+d93dff37e6a89431c158@syzkaller.appspotmail.com
> > > 
> > > [..]
> > > > Hi Oliver,
> > > > 
> > > > I was wondering if you've submitted this patch anywhere? The bug is
> > > > still happening.
> > > > 
> > > > https://syzkaller.appspot.com/bug?id=c0203bd72037d07493f4b7562411e4f5f4553a8f
> > > 
> > > Hi,
> > > 
> > > I definitely did submit it:
> > > https://www.mail-archive.com/linux-media@vger.kernel.org/msg148850.html
> > 
> > Hi Mauro,
> > 
> > Do you know what happened to this patch? Did it get lost?
> > 
> > Thanks!
> > 
> 
> Still sitting unreviewed in patchwork: https://patchwork.linuxtv.org/patch/57785/
> 
> Not sure why this wasn't picked up.

Hi,

AFAICT it is still in the state new. What should I do?

	Regards
		Oliver

