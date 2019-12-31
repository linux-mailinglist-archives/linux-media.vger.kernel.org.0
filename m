Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18CE812D838
	for <lists+linux-media@lfdr.de>; Tue, 31 Dec 2019 12:27:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726658AbfLaL05 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Dec 2019 06:26:57 -0500
Received: from gofer.mess.org ([88.97.38.141]:57223 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726643AbfLaL05 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Dec 2019 06:26:57 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id DD10D11A001; Tue, 31 Dec 2019 11:26:55 +0000 (GMT)
Date:   Tue, 31 Dec 2019 11:26:55 +0000
From:   Sean Young <sean@mess.org>
To:     "Andreas W. Wieland" <awwieland@gmx.de>
Cc:     linux-media@vger.kernel.org
Subject: Re: ir-ctl: invalid scancode '0x857a3a45' for protocol 'nec32'
Message-ID: <20191231112655.GA8659@gofer.mess.org>
References: <9ea5a12d-b981-2289-3f0a-b614378a4bda@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ea5a12d-b981-2289-3f0a-b614378a4bda@gmx.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andreas,

On Sun, Dec 01, 2019 at 06:15:56PM +0100, Andreas W. Wieland wrote:
> Dear Developers!
> 
> I think I have discovered a bug in ir-ctl. My application is pretty
> simple: I want to change certain settings on my Yamaha surround receiver
> via a Raspberry Pi. For this, I have to transmit keycodes with ir-ctl to
> the Yamaha. While this works fine for most keycodes, for some keycodes
> errors are thrown.
> 
> Basically, I record the scancodes of all functions that I need with
> ir-keytable, and later use the recorded scancodes for transmitting, for
> example:
> 
> root@raspberrypi:~# ir-keytable -v -t
> Found device /sys/class/rc/rc1/
> Found device /sys/class/rc/rc0/
> Parsing uevent /sys/class/rc/rc0/lirc0/uevent
> /sys/class/rc/rc0/lirc0/uevent uevent MAJOR=252
> /sys/class/rc/rc0/lirc0/uevent uevent MINOR=0
> /sys/class/rc/rc0/lirc0/uevent uevent DEVNAME=lirc0
> Input sysfs node is /sys/class/rc/rc0/input0/
> Event sysfs node is /sys/class/rc/rc0/input0/event0/
> Parsing uevent /sys/class/rc/rc0/input0/event0/uevent
> /sys/class/rc/rc0/input0/event0/uevent uevent MAJOR=13
> /sys/class/rc/rc0/input0/event0/uevent uevent MINOR=64
> /sys/class/rc/rc0/input0/event0/uevent uevent DEVNAME=input/event0
> Parsing uevent /sys/class/rc/rc0/uevent
> /sys/class/rc/rc0/uevent uevent NAME=rc-rc6-mce
> /sys/class/rc/rc0/uevent uevent DRV_NAME=gpio_ir_recv
> /sys/class/rc/rc0/uevent uevent DEV_NAME=gpio_ir_recv
> input device is /dev/input/event0
> /sys/class/rc/rc0/protocols protocol rc-5 (enabled)
> /sys/class/rc/rc0/protocols protocol nec (enabled)
> /sys/class/rc/rc0/protocols protocol rc-6 (enabled)
> /sys/class/rc/rc0/protocols protocol jvc (enabled)
> /sys/class/rc/rc0/protocols protocol sony (enabled)
> /sys/class/rc/rc0/protocols protocol rc-5-sz (enabled)
> /sys/class/rc/rc0/protocols protocol sanyo (enabled)
> /sys/class/rc/rc0/protocols protocol sharp (enabled)
> /sys/class/rc/rc0/protocols protocol mce_kbd (enabled)
> /sys/class/rc/rc0/protocols protocol xmp (enabled)
> /sys/class/rc/rc0/protocols protocol imon (enabled)
> /sys/class/rc/rc0/protocols protocol lirc (enabled)
> Opening /dev/input/event0
> Input Protocol version: 0x00010001
> Testing events. Please, press CTRL-C to abort.
> 30063.090086: lirc protocol(nec32): scancode = 0x857a3a45
> 30063.140081: lirc protocol(nec32): scancode = 0x857a3a45 repeat
> 30063.250082: lirc protocol(nec32): scancode = 0x857a3a45 repeat
> 
> I now try to transmit exactly that keycode via ir-ctl and get an error
> message. Nothing is transmitted:
> 
> root@raspberrypi:~# ir-ctl -d /dev/lirc1 -S nec32:0x857a3a45
> error: invalid scancode '0x857a3a45' for protocol 'nec32'

ir-ctl is doing a test to see if the scancode can be represented as 
nec-x, the 24 bit nec variant. This test is broken.

The test was fixed in v4l-utils 1.18.0, the exact commit was:

https://git.linuxtv.org/v4l-utils.git/commit/?id=be940713a6e29652d4440cebc78e8381606646bd

Possibly we should push this to the 1.16 branch. Before we do this, it would
be great if you could verify that things now work as you would expect. There
is a lot of bit fiddling in this commit which can easily be wrong.

Thank you in advance!

Best,

Sean

> 
> As I said, this works fine for most of the keycodes I need, only some
> cause this error message. All of the key codes that cause the error are
> protocol nec32 and start with 0x8.
> 
> My hardware is a Raspberry Pi Zero (latest Raspbian Buster, freshly
> updated this morning), a homebrew ir receiver with gpio_ir, a homebrew
> transmitter with pwm-ir-tx and the Yamaha Remote is an RAV423 (shipped
> with my RX-A3030). IR keytable and ir-ctl both have version number 1.16.3.
> 
> If you need further information, please let me know.
> 
> I'd like to thank you already in advance for your efforts, and I wish you
> Good Luck in finding the problem!
> 
> Best Regards,
> 
> Andreas
