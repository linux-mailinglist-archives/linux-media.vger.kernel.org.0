Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C66B31DF7BD
	for <lists+linux-media@lfdr.de>; Sat, 23 May 2020 16:04:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387815AbgEWODB convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Sat, 23 May 2020 10:03:01 -0400
Received: from mx001.dclux.xion.oxcs.net ([185.27.181.16]:52997 "EHLO
        mx001.dclux.xion.oxcs.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387529AbgEWODA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 May 2020 10:03:00 -0400
X-Greylist: delayed 581 seconds by postgrey-1.27 at vger.kernel.org; Sat, 23 May 2020 10:02:58 EDT
Received: from mail.frimfram.ch (unknown [84.254.109.191])
        by mta-1-out.mta.xion.oxcs.net (Postfix) with ESMTPA id 1A99859A35B
        for <linux-media@vger.kernel.org>; Sat, 23 May 2020 13:53:15 +0000 (UTC)
Received: from nuc2 (localhost [IPv6:::1])
        by mail.frimfram.ch (Postfix) with ESMTP id 76E0B2E0489
        for <linux-media@vger.kernel.org>; Sat, 23 May 2020 15:53:14 +0200 (CEST)
Received: by nuc2 (kopano-spooler) with MAPI; Sat, 23 May 2020 15:53:14 +0200
Subject: em28xx (card=68), tvp5150: S-Video not working
From:   =?utf-8?Q?Thomas_G=2E_Schiele?= <schiele@frimfram.ch>
To:     =?utf-8?Q?linux-media=40vger=2Ekernel=2Eorg?= 
        <linux-media@vger.kernel.org>
Date:   Sat, 23 May 2020 13:53:14 +0000
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
X-Priority: 3 (Normal)
X-Mailer: Kopano 8.7.80
Message-Id: <kcis.0622EB4351AB40399987737B98D00397@nuc2>
X-VADE-STATUS: LEGIT
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

To whom it may concern


I am a first time poster to linux-media. I have read about mailing to this list in the wiki of linuxtv.org. Please excuse me if this post is inappropriate.

This is about the USB device that I recently bought new:
  - Model: TerraTec Grabster AV 350 MX
  - Vendor Id/Product Id: 0ccd:0084
  
Tests made:
  - Composite: working (using the composite connector on the device)
  - S-Video: not working (using the S-Video connector on the device)
  - Audio: working (using the two audio connectors on the device)

I am using Linux 5.4.0-31-generic #35-Ubuntu SMP. The program qv4l2 (Qt V4L2 Test Bench) can capture a composite source with Input=Composite (under "Input Settings" in tab "General Settings"), but it can not capture a source with Input=S-Video. I made sure that both the composite and S-Video sources and the device are working using a different operating system and different software.

I opened the device and found the following major components on the PCB (labeled "AV350 V04"):
  - eMPIA EM2860 (USB Video Capture Device)
  - 24C02 (256 X 8 BIT EEPROM)
  - TI TVP5150 (Ultralow-Power NTSC/PAL Video Decoder)
  - eMPIA EMP202 (Single-Chip Dual-Channel AC’97 Audio Codec)
  - 2 times HC4052 (Dual 4-Channel Analog Multiplexer)
  - SKC 14.318
  - SKC 12.000

Below you can find output from dmesg.

I don't know the cause of the above descibed behaviour. Is S-Video functionality not yet implemented or tested? Do I do something wrong? The device has quality chips in comparison to cheaper solutions. So it makes sense to support such a device.

I would like to help, specially with testing. Please advice. 

Thank you.


Regards,
Thomas


---
output from dmesg:
[150869.973867] usb 1-2: new high-speed USB device number 15 using xhci_hcd
[150869.994295] usb 1-2: config 1 interface 0 altsetting 1 endpoint 0x82 has invalid wMaxPacketSize 0
[150869.994298] usb 1-2: config 1 interface 0 altsetting 1 endpoint 0x84 has invalid wMaxPacketSize 0
[150869.994301] usb 1-2: config 1 interface 0 altsetting 2 endpoint 0x84 has invalid wMaxPacketSize 0
[150869.994303] usb 1-2: config 1 interface 0 altsetting 3 endpoint 0x84 has invalid wMaxPacketSize 0
[150869.994305] usb 1-2: config 1 interface 0 altsetting 4 endpoint 0x84 has invalid wMaxPacketSize 0
[150869.994307] usb 1-2: config 1 interface 0 altsetting 5 endpoint 0x84 has invalid wMaxPacketSize 0
[150869.994309] usb 1-2: config 1 interface 0 altsetting 6 endpoint 0x84 has invalid wMaxPacketSize 0
[150869.994311] usb 1-2: config 1 interface 0 altsetting 7 endpoint 0x84 has invalid wMaxPacketSize 0
[150869.997314] usb 1-2: New USB device found, idVendor=0ccd, idProduct=0084, bcdDevice= 1.00
[150869.997317] usb 1-2: New USB device strings: Mfr=0, Product=1, SerialNumber=0
[150869.997319] usb 1-2: Product: Grabster AV 350
[150869.999059] em28xx 1-2:1.0: New device  Grabster AV 350 @ 480 Mbps (0ccd:0084, interface 0, class 0)
[150869.999061] em28xx 1-2:1.0: Video interface 0 found: isoc
[150870.058119] em28xx 1-2:1.0: chip ID is em2860
[150870.267223] em28xx 1-2:1.0: EEPROM ID = 1a eb 67 95, EEPROM hash = 0x618085a2
[150870.267227] em28xx 1-2:1.0: EEPROM info:
[150870.267230] em28xx 1-2:1.0: AC97 audio (5 sample rates)
[150870.267232] em28xx 1-2:1.0: 500mA max power
[150870.267236] em28xx 1-2:1.0: Table at offset 0x04, strings=0x226a, 0x0000, 0x0000
[150870.358004] em28xx 1-2:1.0: Identified as Terratec AV350 (card=68)
[150870.358010] em28xx 1-2:1.0: analog set to isoc mode.
[150870.358077] em28xx 1-2:1.0: Registering V4L2 extension
[150870.358486] em28xx 1-2:1.1: audio device (0ccd:0084): interface 1, class 1
[150870.430298] tvp5150 7-005c: tvp5150 (4.0) chip found @ 0xb8 (1-2:1.0)
[150870.430300] tvp5150 7-005c: tvp5150am1 detected.
[150873.238176] em28xx 1-2:1.0: Config register raw data: 0x50
[150873.273859] em28xx 1-2:1.0: AC97 vendor ID = 0xffffffff
[150873.289840] em28xx 1-2:1.0: AC97 features = 0x6a90
[150873.289844] em28xx 1-2:1.0: Empia 202 AC97 audio processor detected

