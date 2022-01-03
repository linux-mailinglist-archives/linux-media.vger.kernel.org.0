Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5968482F57
	for <lists+linux-media@lfdr.de>; Mon,  3 Jan 2022 10:21:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231158AbiACJV1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jan 2022 04:21:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232340AbiACJV0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jan 2022 04:21:26 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72C8AC061784
        for <linux-media@vger.kernel.org>; Mon,  3 Jan 2022 01:21:26 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 7A883C63A4; Mon,  3 Jan 2022 09:21:23 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1641201683; bh=etlZLlKUwzHKw74TwmS1VtHq8ZM1Qhw+lErAU8UhDm4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ue97ACZU/C8t9p0giHZjKuuzVRWj8xsVqUdob/7GjcSAWGMTRkweIi2mBYAZ3w8JP
         CWODhQ4vnxi4I0RbYH/bmH6SWxFhkp18i+CFGpwIwv3h5Nal3mIdk9w+y2kXVLczwD
         aNUyjWoqgEj4FYOjpfcBwj8N+0MGe4ASHhhlCgwKDXVHeu4ut8k8tt227naliYQFGJ
         fio8N40MnychPR+gFtXecRQepeUKZgACiJao9VzCG8vNc5SSA2w/FJ7bxoDlN8MNb4
         kaDn7HnjSNgiiZGzvRiWkmoRarrS7/CWsyzBftfS5gL6RH1xlgsXTQrU9/I4pydvET
         obTpY3BzkeMTQ==
Date:   Mon, 3 Jan 2022 09:21:23 +0000
From:   Sean Young <sean@mess.org>
To:     Marko =?iso-8859-1?B?TeRrZWzk?= <marko.makela@iki.fi>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: Inconsistent RC5 ir-keytable events
Message-ID: <20220103092123.GA21115@gofer.mess.org>
References: <YdKdPosyzj2urFpS@jyty>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YdKdPosyzj2urFpS@jyty>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marko,

Please send questions/responses to the linux-media list in future.

On Mon, Jan 03, 2022 at 08:52:46AM +0200, Marko Mäkelä wrote:
> Hi,
> 
> Years ago, I was using the Hauppauge Nova-T PCI 90002 card that bundles a
> remote control unit that uses RC5 codes.

Would you mind sending the lspci output for this device? Then we know exactly
how the driver is handling this.

> I had patched the 2.6.15 kernel to
> make the usage experience smoother. I am attaching the two patches from
> https://www.iki.fi/~msmakela/software/vdr/ for reference.

That patches does some hacks which are just plain wrong.

> The problem that I am trying to solve is that when I press a button on the
> remote control unit (RCU), often two events will be generated in the
> software (Video Disk Recorder).
> 
> I found an old note that the RCU sends bursts of signals roughly once every
> 110 milliseconds. Ideally, I would like the driver to generate key-down or
> key-repeat events at the same rate as the RC5 signals arrive.

That's not the way things should work. The speed at which the IR message gets
repeated depends on the IR protocol. You don't want a key down/up event for
each of those.

> Even with
> ir-keytable --period=0 --delay=0 that does not seem to happen.

You've turned off autorepeat with those options, so that's not going to
change anything. If you press a key, hold it for some time, and then release
you should get one key down, one key up and a few autorepeats depending on
the --delay/--period settings.

> On a 5.15.5 kernel, I installed ir-keytable and added the line
> * * hauppauge.toml
> to the start of the file /etc/rc_maps.cfg. This allows me to use that RCU
> with dvb_usb_rtl28xxu (Astrometa DVB-T2) instead of the default keymap
> rc-astrometa-t2hybrid.
> 
> Here is some sample output to demonstrate the problem. I am pressing KEY_OK
> twice, and this is with --period=0 --repeat=0:
> 
> sudo ir-keytable -t|grep rc5
> 4733.882120: lirc protocol(rc5): scancode = 0x1e25 toggle=1
> 4734.094127: lirc protocol(rc5): scancode = 0x1e25 toggle=1
> 4734.306107: lirc protocol(rc5): scancode = 0x1e25 toggle=1
> 4734.942117: lirc protocol(rc5): scancode = 0x1e25 toggle=1
> 4735.154093: lirc protocol(rc5): scancode = 0x1e25 toggle=1
> 4735.366104: lirc protocol(rc5): scancode = 0x1e25 toggle=1
> 4735.578100: lirc protocol(rc5): scancode = 0x1e25 toggle=1
> 4735.790090: lirc protocol(rc5): scancode = 0x1e25 toggle=1
> 4736.818108: lirc protocol(rc5): scancode = 0x1e25
> 4737.030114: lirc protocol(rc5): scancode = 0x1e25
> 4737.242087: lirc protocol(rc5): scancode = 0x1e25
> 4737.454088: lirc protocol(rc5): scancode = 0x1e25
> 4737.666120: lirc protocol(rc5): scancode = 0x1e25
> 
> As you can see, the messages arrive at somewhat intermittent intervals.

I think this is the issue you are having. Somehow there are gaps in reading
the IR, which are long enough to cause key up/down events.

> Most of the time, the interval is 212 milliseconds (so, apparently every
> second RC5 message is discarded, if my assumption about 110 ms interval is
> correct). But, between the 3rd and 4th line in the above output, there is a
> delay of 636 milliseconds (212*3). And after the last toggle=1 line there is
> a delay of 1 second, even though I probably released the button for at most
> half a second.
> 
> Another problem is that I am seeing both key_down and key_up events for
> every key_down event. Here is an unfiltered sample to demonstrate it:
> 
> 2928.450104: lirc protocol(rc5): scancode = 0x1e25 toggle=1
> 2928.450113: event type EV_MSC(0x04): scancode = 0x1e25
> 2928.450113: event type EV_KEY(0x01) key_down: KEY_OK(0x0160)
> 2928.450113: event type EV_SYN(0x00).
> 2928.580060: event type EV_KEY(0x01) key_up: KEY_OK(0x0160)
> 2928.580060: event type EV_SYN(0x00).

Each rc device has a timeout which determines how long after keydown event,
a key up event is sent as long as the same IR is not received again. This is
usually IR_DEFAULT_TIMEOUT (125ms). You can see the value with
`ir-ctl -f -d /dev/lirc0`

I think the problem is that the gaps in your IR is greater than this timeout.


Sean
