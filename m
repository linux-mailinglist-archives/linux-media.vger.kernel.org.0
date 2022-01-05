Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7289848506D
	for <lists+linux-media@lfdr.de>; Wed,  5 Jan 2022 10:54:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234225AbiAEJx7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jan 2022 04:53:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239098AbiAEJx6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jan 2022 04:53:58 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43069C061761
        for <linux-media@vger.kernel.org>; Wed,  5 Jan 2022 01:53:58 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 60331C638B; Wed,  5 Jan 2022 09:53:55 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1641376435; bh=AdblGjE6gVcfena4KZrr4i38CGfmLB6gAT5i6FGtUnI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ydi73ylefFWtOsAwtfY33t2PTkMaBqDZopsWGBxzhdthwL0XDUkWHtKxUc0Neimuq
         ewCW9aORuTrFHccxXE5pfEyN9wbXthyHIxVPCCbwSADYfStU5ZZy2xxKdxXJKBOodu
         BeocLI/vjl3m1fYKPEhRsSBF1cs4sEzJIgM0QRoK/J5yLZD7njk/upTSY74P29O/9n
         nF2WDpkrKgd/86AGyq4xnY0H4cRQorGf410FD3zpNTKQ45TolZbIjDdTzpjYmLXkvO
         dtEx4A32PuzZxFQfzcSOBL3lbfMToq92lRHkfsv8IdeWB6eKkC2DNaCuFjcQzH6hMo
         oUW9kQ21JrVRQ==
Date:   Wed, 5 Jan 2022 09:53:55 +0000
From:   Sean Young <sean@mess.org>
To:     Marko =?iso-8859-1?B?TeRrZWzk?= <marko.makela@iki.fi>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: Inconsistent RC5 ir-keytable events
Message-ID: <20220105095355.GA6428@gofer.mess.org>
References: <YdKdPosyzj2urFpS@jyty>
 <20220103092123.GA21115@gofer.mess.org>
 <YdLRa86ddm2T4xew@jyty>
 <20220103110743.GA22001@gofer.mess.org>
 <YdLqL2ViSwWzS/Ig@jyty>
 <YdRwqt1pwb8osT6V@jyty>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YdRwqt1pwb8osT6V@jyty>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jan 04, 2022 at 06:07:06PM +0200, Marko Mäkelä wrote:
> Mon, Jan 03, 2022 at 02:21:05PM +0200, Marko Mäkelä wrote:
> > If the correct threshold is 106ms and your suggestion of 100 does not
> > work, I will try a lower value, such as 94 or 95, to get 94+9.741 < 106.
> 
> With the value 100, I got rather nice output from ir-keytable -t. Here is a
> short press of OK followed by a long press:
> 
> Testing events. Please, press CTRL-C to abort.
> 85.406113: lirc protocol(rc5): scancode = 0x1e25
> 85.406129: event type EV_MSC(0x04): scancode = 0x1e25
> 85.406129: event type EV_KEY(0x01) key_down: KEY_OK(0x0160)
> 85.406129: event type EV_SYN(0x00).
> 85.536094: event type EV_KEY(0x01) key_up: KEY_OK(0x0160)
> 85.536094: event type EV_SYN(0x00).
> 87.286097: lirc protocol(rc5): scancode = 0x1e25 toggle=1
> 87.286108: event type EV_MSC(0x04): scancode = 0x1e25
> 87.286108: event type EV_KEY(0x01) key_down: KEY_OK(0x0160)
> 87.286108: event type EV_SYN(0x00).
> 87.398095: lirc protocol(rc5): scancode = 0x1e25 toggle=1
> 87.398103: event type EV_MSC(0x04): scancode = 0x1e25
> 87.398103: event type EV_SYN(0x00).
> 87.510073: lirc protocol(rc5): scancode = 0x1e25 toggle=1
> 87.510081: event type EV_MSC(0x04): scancode = 0x1e25
> 87.510081: event type EV_SYN(0x00).
> 87.622079: lirc protocol(rc5): scancode = 0x1e25 toggle=1
> 87.622088: event type EV_MSC(0x04): scancode = 0x1e25
> 87.622088: event type EV_SYN(0x00).
> 87.734090: lirc protocol(rc5): scancode = 0x1e25 toggle=1
> 87.734099: event type EV_MSC(0x04): scancode = 0x1e25
> 87.734099: event type EV_SYN(0x00).
> 87.804051: event type EV_KEY(0x01) key_down: KEY_OK(0x0160)
> 87.804051: event type EV_SYN(0x00).
> [snip]
> 88.854090: lirc protocol(rc5): scancode = 0x1e25 toggle=1
> 88.854098: event type EV_MSC(0x04): scancode = 0x1e25
> 88.854098: event type EV_SYN(0x00).
> 88.860050: event type EV_KEY(0x01) key_down: KEY_OK(0x0160)
> 88.860050: event type EV_SYN(0x00).
> 88.860050: event type EV_KEY(0x01) key_up: KEY_OK(0x0160)
> 88.860050: event type EV_SYN(0x00).
> 
> There was no unexpected key_up during the long press.

This looks good.

> I suppose that the key_down events are for the repeated keypresses. This was
> with the default settings for the repeat.
> 
> Based on the timestamps, the RC5 messages would seem to arrive at
> 112-millisecond intervals.
> 
> I also tried smaller values (94, 90, 70), and it got worse. With 94, it
> worked most of the time, but there were occasional glitches (key_up events
> while the RC5 messages kept arriving) like this:
> 
> 292.842137: lirc protocol(rc5): scancode = 0x1e25
> 292.776051: event type EV_MSC(0x04): scancode = 0x1e25
> 292.776051: event type EV_SYN(0x00).
> 292.908053: event type EV_KEY(0x01) key_down: KEY_OK(0x0160)
> 292.908053: event type EV_SYN(0x00).
> 292.954082: lirc protocol(rc5): scancode = 0x1e25
> 292.908053: event type EV_MSC(0x04): scancode = 0x1e25
> 292.908053: event type EV_SYN(0x00).
> 293.040051: event type EV_KEY(0x01) key_down: KEY_OK(0x0160)
> 293.040051: event type EV_SYN(0x00).
> 293.040051: event type EV_KEY(0x01) key_up: KEY_OK(0x0160)
> 293.040051: event type EV_SYN(0x00).
> 293.162075: lirc protocol(rc5): scancode = 0x1e25
> 293.162085: event type EV_MSC(0x04): scancode = 0x1e25
> 293.162085: event type EV_KEY(0x01) key_down: KEY_OK(0x0160)
> 293.162085: event type EV_SYN(0x00).
> 293.292069: event type EV_KEY(0x01) key_up: KEY_OK(0x0160)
> 293.292069: event type EV_SYN(0x00).
> 
> With the value 70, every single RC5 message would result in both key_down
> and key_up events:
> 
> 497.970089: lirc protocol(rc5): scancode = 0x1e0d
> 497.970104: event type EV_MSC(0x04): scancode = 0x1e0d
> 497.970104: event type EV_KEY(0x01) key_down: KEY_MENU(0x008b)
> 497.970104: event type EV_SYN(0x00).
> 498.100064: event type EV_KEY(0x01) key_up: KEY_MENU(0x008b)
> 498.100064: event type EV_SYN(0x00).
> 498.138082: lirc protocol(rc5): scancode = 0x1e0d
> 498.138096: event type EV_MSC(0x04): scancode = 0x1e0d
> 498.138096: event type EV_KEY(0x01) key_down: KEY_MENU(0x008b)
> 498.138096: event type EV_SYN(0x00).
> 498.268059: event type EV_KEY(0x01) key_up: KEY_MENU(0x008b)
> 498.268059: event type EV_SYN(0x00).
> 
> I got rather good volume+/volume- response in GNOME desktop when I used the
> value 100 (as in the attached patch) and set the following:
> ir-keytable --period=111 --delay=111
> 
> I tested once more without the patch (using the value 200), both with the
> defaults (--period=125 --delay=500) and the 111ms values, and the experience
> was bad (about half the speed, and frequent intermittent pauses).
> 
> However, the patch breaks the NEC protocol. With the bundled remote control
> unit of the adapter, I initially get some key_down and key_up, but then I
> only get 'repeat' events if I hit the same (or even different) button again.
> Here is a sample with almost 8 seconds of pause in between:
> 
> 2035.461973: lirc protocol(nec): scancode = 0x1e repeat
> 2035.461981: event type EV_MSC(0x04): scancode = 0x1e
> 2035.461981: event type EV_SYN(0x00).
> 2035.573955: lirc protocol(nec): scancode = 0x1e repeat
> 2035.573963: event type EV_MSC(0x04): scancode = 0x1e
> 2035.573963: event type EV_SYN(0x00).
> 2043.425920: lirc protocol(nec): scancode = 0x1e repeat
> 2043.425932: event type EV_MSC(0x04): scancode = 0x1e
> 2043.425932: event type EV_SYN(0x00).
> 
> I tested once more the stock driver (value=200) with the NEC protocol.  The
> GNOME volume control would only react to the initial press of the button,
> not on the repeats. Also in ir-keytable -t, I only see one key_down/key_up
> followed by LIRC-only messages:
> 
> 2776.698529: lirc protocol(nec): scancode = 0x1e
> 2776.698539: event type EV_MSC(0x04): scancode = 0x1e
> 2776.698539: event type EV_KEY(0x01) key_down: KEY_VOLUMEUP(0x0073)
> 2776.698539: event type EV_SYN(0x00).
> 2776.824077: event type EV_KEY(0x01) key_up: KEY_VOLUMEUP(0x0073)
> 2776.824077: event type EV_SYN(0x00).
> 2776.909965: lirc protocol(nec): scancode = 0x1e repeat
> 2776.909973: event type EV_MSC(0x04): scancode = 0x1e
> 2776.909973: event type EV_SYN(0x00).
> 2777.121976: lirc protocol(nec): scancode = 0x1e repeat
> 2777.121983: event type EV_MSC(0x04): scancode = 0x1e
> 2777.121983: event type EV_SYN(0x00).

Here the is such a delay between the the first message and the repeat,
that rc-core does not honour the repeat any more.

> I am happy to test any patches, now that I have a compiled kernel where I
> can easily rmmod and insmod the module.

I don't quite understand why but clearly IR is being dropped.

So I suspect there is an issue with reading out the IR from the device. The
routine reads the IR buffer, and then sends commands, probably to clear
the IR buffer. It would be interesting to see the output of usbmon while
IR is being received when IR is being dropped, and also see if experimenting
with removing some entries from refresh_tab makes any difference (just a
guess).


Sean

> diff --git a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
> index 795a012d4020..9504d6f94a58 100644
> --- a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
> +++ b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
> @@ -1807,7 +1807,7 @@ static int rtl2832u_get_rc_config(struct dvb_usb_device *d,
>  	rc->allowed_protos = RC_PROTO_BIT_ALL_IR_DECODER;
>  	rc->driver_type = RC_DRIVER_IR_RAW;
>  	rc->query = rtl2832u_rc_query;
> -	rc->interval = 200;
> +	rc->interval = 100;
>  	/* we program idle len to 0xc0, set timeout to one less */
>  	rc->timeout = 0xbf * 51;
>  

