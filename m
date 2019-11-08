Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 958E9F42D9
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2019 10:07:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730069AbfKHJHD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Nov 2019 04:07:03 -0500
Received: from gofer.mess.org ([88.97.38.141]:34633 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726072AbfKHJHD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 Nov 2019 04:07:03 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id C19E8C6437; Fri,  8 Nov 2019 09:07:00 +0000 (GMT)
Date:   Fri, 8 Nov 2019 09:07:00 +0000
From:   Sean Young <sean@mess.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Oliver Neukum <oneukum@suse.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        syzbot <syzbot+d93dff37e6a89431c158@syzkaller.appspotmail.com>,
        linux-media@vger.kernel.org, USB list <linux-usb@vger.kernel.org>
Subject: Re: general protection fault in flexcop_usb_probe
Message-ID: <20191108090700.GA12637@gofer.mess.org>
References: <1564472907.25582.16.camel@suse.com>
 <00000000000081a9c1058ee1d06a@google.com>
 <CAAeHK+w0vKt94g-h+NOqW-GJKyqikbAfU4sTBeKeJS-sUkZ69g@mail.gmail.com>
 <1569229570.7831.3.camel@suse.com>
 <CAAeHK+xspiZSWzzVYbMoAV21T0jFX8g+7D8fwkv413ezNWwT_g@mail.gmail.com>
 <315c5ac2-c979-e194-0c79-d8704ff7f66a@xs4all.nl>
 <1573138928.3024.6.camel@suse.com>
 <af0d67e6-7978-c4cc-0be3-40b7865d0016@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af0d67e6-7978-c4cc-0be3-40b7865d0016@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans, Oliver,

My bad, it slipped between the cracks. I am preparing a pull request now.

Sorry about this.

Sean

On Thu, Nov 07, 2019 at 04:47:50PM +0100, Hans Verkuil wrote:
> Hi Sean,
> 
> Mauro is very busy, so can you pick this up? And perhaps check patchwork for more
> trivial DVB patches that can be included in a pull request?
> 
> Regards,
> 
> 	Hans
> 
> On 11/7/19 4:02 PM, Oliver Neukum wrote:
> > Am Montag, den 23.09.2019, 14:51 +0200 schrieb Hans Verkuil:
> >> On 9/23/19 2:46 PM, Andrey Konovalov wrote:
> >>> On Mon, Sep 23, 2019 at 11:21 AM Oliver Neukum <oneukum@suse.com> wrote:
> >>>>
> >>>> Am Freitag, den 20.09.2019, 18:01 +0200 schrieb Andrey Konovalov:
> >>>>
> >>>>>> Reported-and-tested-by:
> >>>>>> syzbot+d93dff37e6a89431c158@syzkaller.appspotmail.com
> >>>>
> >>>> [..]
> >>>>> Hi Oliver,
> >>>>>
> >>>>> I was wondering if you've submitted this patch anywhere? The bug is
> >>>>> still happening.
> >>>>>
> >>>>> https://syzkaller.appspot.com/bug?id=c0203bd72037d07493f4b7562411e4f5f4553a8f
> >>>>
> >>>> Hi,
> >>>>
> >>>> I definitely did submit it:
> >>>> https://www.mail-archive.com/linux-media@vger.kernel.org/msg148850.html
> >>>
> >>> Hi Mauro,
> >>>
> >>> Do you know what happened to this patch? Did it get lost?
> >>>
> >>> Thanks!
> >>>
> >>
> >> Still sitting unreviewed in patchwork: https://patchwork.linuxtv.org/patch/57785/
> >>
> >> Not sure why this wasn't picked up.
> > 
> > Hi,
> > 
> > AFAICT it is still in the state new. What should I do?
> > 
> > 	Regards
> > 		Oliver
> > 
