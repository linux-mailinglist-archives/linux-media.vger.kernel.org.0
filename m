Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0643648302F
	for <lists+linux-media@lfdr.de>; Mon,  3 Jan 2022 12:07:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232825AbiACLHr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jan 2022 06:07:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbiACLHq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jan 2022 06:07:46 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED1B4C061761
        for <linux-media@vger.kernel.org>; Mon,  3 Jan 2022 03:07:45 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id DA582C63A4; Mon,  3 Jan 2022 11:07:43 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1641208063; bh=iBz8s19Cfhi5t4ggJk/6ReAvvgJhmCteQAXZAcLb1VE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JJfm2H1IPeNd6SQ4Hjqp0e8gCE/RWea0OKosZwDRpebpDkiy0Kh5V90PxkZjIMNoa
         DQymIjLxtHiAv1wNPjof2RqwFDKD2GoVPLFIA/6tcD33bgRiUNWRguMSoFUwp/+Kdx
         QLr24FwwC8Yk9B0rupsZb/9W+BW0EkqeW6u5X3hpRtChnZQJYK8LwYXNI/hst0UXTY
         le8sbaoYW4aAT24sjNucpqexo8qd88FPM7uJezK8t//bTtvsT5DQg0l4GFaUkuP9nq
         KSCAjb15QFcQJ1KXcdYr6NhtP4bsQz3MOGVnDUzOUSU2icgpNrKuh8kn2wqocrwvKE
         JmBAk7xLrmYLg==
Date:   Mon, 3 Jan 2022 11:07:43 +0000
From:   Sean Young <sean@mess.org>
To:     Marko =?iso-8859-1?B?TeRrZWzk?= <marko.makela@iki.fi>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: Inconsistent RC5 ir-keytable events
Message-ID: <20220103110743.GA22001@gofer.mess.org>
References: <YdKdPosyzj2urFpS@jyty>
 <20220103092123.GA21115@gofer.mess.org>
 <YdLRa86ddm2T4xew@jyty>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YdLRa86ddm2T4xew@jyty>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marko,

On Mon, Jan 03, 2022 at 12:35:23PM +0200, Marko Mäkelä wrote:
> Hi Sean,
> 
> Thank you for your prompt and helpful reply.
> 
> Mon, Jan 03, 2022 at 09:21:23AM +0000, Sean Young wrote:
> > On Mon, Jan 03, 2022 at 08:52:46AM +0200, Marko Mäkelä wrote:
> > > Hi,
> > > 
> > > Years ago, I was using the Hauppauge Nova-T PCI 90002 card that bundles a
> > > remote control unit that uses RC5 codes.
> > 
> > Would you mind sending the lspci output for this device? Then we know
> > exactly how the driver is handling this.
> 
> I am no longer using the PCI (not PCIe) card, but only the remote control
> unit. I still have the hardware sitting unused, but I do not think that it
> is relevant to the problem when attempting to use the remote control unit
> with the Astrometa DVB-T2 USB adapter.

Ah yes.

> > That's not the way things should work. The speed at which the IR message
> > gets repeated depends on the IR protocol. You don't want a key down/up
> > event for each of those.
> 
> There is a use case where I actually want that. When I press and hold the
> volume-up button, or a button to scroll a list in a menu, I would the user
> interface to update as frequently as possible.

There is a balance to be struck here. If the button gets repeated too
quickly, it becomes impossible to go up/down one item, for example.

The way to do this, is to set the autorepeat period/delay to settings to
what suits your likes/dislikes; it should not depend on the lower-level
IR message.

> > You've turned off autorepeat with those options, so that's not going to
> > change anything. If you press a key, hold it for some time, and then
> > release you should get one key down, one key up and a few autorepeats
> > depending on the --delay/--period settings.
> 
> You are right. I tested the bundled RCU of the adapter, and I am indeed
> seeing such output. Here is the dmesg from 5.15.5:
> 
> [17984.345840] usb 2-6: Manufacturer: astrometadvbt2
> [17984.352731] usb 2-6: dvb_usb_v2: found a 'Astrometa DVB-T2' in warm state
> [17984.514105] dvbdev: DVB: registering new adapter (Astrometa DVB-T2)
> [17984.545328] Registered IR keymap rc-astrometa-t2hybrid
> 
> And here is the ir-keymap -t output. It looks like what I would expect
> (except maybe the key_up event should be sent after the sequence of repeat
> events, not before them).
> 
> 18022.134140: lirc protocol(nec): scancode = 0x40
> 18022.134157: event type EV_MSC(0x04): scancode = 0x40
> 18022.134157: event type EV_KEY(0x01) key_down: KEY_FULL_SCREEN(0x0174)
> 18022.134157: event type EV_SYN(0x00).
> 18022.260014: event type EV_KEY(0x01) key_up: KEY_FULL_SCREEN(0x0174)
> 18022.260014: event type EV_SYN(0x00).

So the delay for the keyup is 125857us or about 125ms.

> 18022.345513: lirc protocol(nec): scancode = 0x40 repeat
> 18022.345524: event type EV_MSC(0x04): scancode = 0x40
> 18022.345524: event type EV_SYN(0x00).

However here the repeat gets reported too late. It gets reported 211373us
after the first scancode (about 211ms).

> 18022.561538: lirc protocol(nec): scancode = 0x40 repeat
> 18022.561549: event type EV_MSC(0x04): scancode = 0x40
> 18022.561549: event type EV_SYN(0x00).
> ...
> 18024.057680: lirc protocol(nec): scancode = 0x40 repeat
> 18024.057694: event type EV_MSC(0x04): scancode = 0x40
> 18024.057694: event type EV_SYN(0x00).
> ^C
> 
> > I think this is the issue you are having. Somehow there are gaps in
> > reading the IR, which are long enough to cause key up/down events.
> 
> I watched the IR LED in the live viewfinder of a digital camera while
> pressing a button, and you may be right: instead of seeing a constant stream
> of pulses, I saw a few pulses followed by a pause, then again a few pulses.
> After I replaced the batteries, I only saw a short pause every couple of
> seconds, which probably was a sampling artifact of the camera. But, this did
> not improve the situation on Linux yet.

I am not sure if the naked eye can observe a delay of 200ms rather than 100ms.

> > Each rc device has a timeout which determines how long after keydown
> > event, a key up event is sent as long as the same IR is not received
> > again. This is usually IR_DEFAULT_TIMEOUT (125ms). You can see the value
> > with
> > `ir-ctl -f -d /dev/lirc0`
> > 
> > I think the problem is that the gaps in your IR is greater than this timeout.
> 
> Again, you seem to be right:
> 
> sudo apt install v4l-utils
> ir-ctl -f -d /dev/lirc0 Receive features /dev/lirc0:
>  - Device can receive raw IR
>  - Can report decoded scancodes and protocol
>  - Receiving timeout 9741 microseconds
> Send features /dev/lirc0:
>  - Device cannot send
> 
> How to increase the timeout from this less than 10ms to something closer to
> 125ms?

This is the timeout field on rcdev. I think it is set here:

https://git.linuxtv.org/media_tree.git/tree/drivers/media/usb/dvb-usb-v2/rtl28xxu.c#n1810

I think the interval is to set to value which is much to high; I think the
211 ms comes from this 200 value here. So, I think if you lower this to
100 then your problems might go away.

I had forgotten that that for the delay between key down and key up, this
also adds the repeat period for the protocol, see
https://git.linuxtv.org/media_tree.git/tree/drivers/media/rc/rc-main.c#n857

So actually that is 110ms + 9741us ≈ 119m, which is near enough the values seen
above. I suspect the issue is the interval but please experiment.


Sean
