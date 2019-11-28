Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E70D610CDD7
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2019 18:25:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727171AbfK1RZK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Nov 2019 12:25:10 -0500
Received: from netrider.rowland.org ([192.131.102.5]:54661 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727133AbfK1RZH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Nov 2019 12:25:07 -0500
Received: (qmail 20647 invoked by uid 500); 28 Nov 2019 12:25:05 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 28 Nov 2019 12:25:05 -0500
Date:   Thu, 28 Nov 2019 12:25:05 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Oliver Neukum <oneukum@suse.com>
cc:     syzbot <syzbot+9ca7a12fd736d93e0232@syzkaller.appspotmail.com>,
        <andreyknvl@google.com>, <hverkuil@xs4all.nl>,
        Kernel development list <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>, <mchehab@kernel.org>,
        <syzkaller-bugs@googlegroups.com>
Subject: Re: KASAN: use-after-free Read in si470x_int_in_callback (2)
In-Reply-To: <1574954383.21204.11.camel@suse.com>
Message-ID: <Pine.LNX.4.44L0.1911281214050.19734-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 28 Nov 2019, Oliver Neukum wrote:

> Am Mittwoch, den 27.11.2019, 16:11 -0500 schrieb Alan Stern:
> > Oliver:
> > 
> > Make of this what you will...
> 
> Hi,
> 
> first, thank you. Second, this is teaching me to question my
> assumptions. There is no disconnect at all. We are busy looping
> in the error handler as we have virtual hardware in this test,
> which can execute an URB without waiting for hardware.
> 
> So should we kill error handling for this case?

Okay.  First of all, we must recognize that these syzbot tests have
encountered two separate bugs.  The first is the one fixed in your
original patches (the use-after-free).  This bug needs no discussion;
it looks like your patch fixes it.

The second bug is the CPU starvation caused by the tight resubmit loop
in the completion handler.  It is the reason why you kept getting
failure reports back from syzbot.  It is to some extent a misleading
result, related to the fact that dummy-hcd doesn't use real hardware,
as you noted.

Nevertheless, the fix I posted is appropriate.  I posed this question
to Greg KH some weeks ago, and he pointed out that after some
discussion on the mailing list, people had generally agreed that
drivers should not blindly resubmit URBs when they get an unrecognized
error status.  In this situation, error recovery has to occur at a
higher level (for example, the user could unplug the device and then
plug it in again).

So even though with real hardware this tight resubmit loop might not
end up using all the available CPU time, not resubmitting is still the
right approach.

Alan Stern

