Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E1A264A20B
	for <lists+linux-media@lfdr.de>; Mon, 12 Dec 2022 14:49:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232728AbiLLNtQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Dec 2022 08:49:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233147AbiLLNss (ORCPT
        <rfc822;groupwise-linux-media@vger.kernel.org:1:1>);
        Mon, 12 Dec 2022 08:48:48 -0500
X-Greylist: delayed 320 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 12 Dec 2022 05:48:16 PST
Received: from pamir.pedago.fi (pamir.pedago.fi [194.112.9.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0A751581D
        for <linux-media@vger.kernel.org>; Mon, 12 Dec 2022 05:48:16 -0800 (PST)
Received: from GW6DOM-MTA by pamir.pedago.fi
        with Novell_GroupWise; Mon, 12 Dec 2022 15:42:43 +0200
Message-Id: <63972FC90200002800123ADC@pamir.pedago.fi>
X-Mailer: Novell GroupWise Internet Agent 18.2.1 
Date:   Mon, 12 Dec 2022 15:42:33 +0200
From:   "Anders Gustafsson" <Anders.Gustafsson@pedago.fi>
To:     <linux-media@vger.kernel.org>
Subject: Developing a driver for the Terratec Cinergy T/A USB stick?
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi!

Note that this stick is NOT identical to the old Cinergy T

Dec 07 16:21:24 tvburk kernel: usb 2-2.3: SerialNumber: CNXT000000000001
Dec 07 16:21:24 tvburk kernel: usb 2-2.3: Manufacturer: Conexant Systems Inc.
Dec 07 16:21:24 tvburk kernel: usb 2-2.3: Product: Polaris AV Capture
Dec 07 16:21:24 tvburk kernel: usb 2-2.3: New USB device strings: Mfr=1, Product=2, SerialNumber=3
Dec 07 16:21:24 tvburk kernel: usb 2-2.3: New USB device found, idVendor=0ccd, idProduct=5509,
bcdDevice=40.01
Dec 07 16:21:24 tvburk kernel: usb 2-2.3: new high-speed USB device number 7 using xhci_hcd

Chips:
RTL2832
TDA18273 - A tuner from NXP
CX23102 - USB video and broadcast-audio decoder family from Conexant.

Naturally have I tried myself, before asking here. I had to hack dvb drivers in the past, but not as complex
as this.

The firmware is shipped with the windows software. Neatly hidden inside a Windows installer :) The file there
ie merlind.rom, but it is identical to the fw file that linuxtv has v4l-cx231xx-avcore-01.fw

I found a driver for 18273 by CrazyCat, but it is for an older version of Linux, so what I have done so far
is to take all the files from the TDA18271 driver and renamed them to 18273. I will then use the docs for the
two tuners and the code from CrazyCat to make a new driver. I have gotten as far as the driver loading, but I
need to figure out whether the tuner is on address C0 (or 60 if you shift out the write bit) or C6. The 18273
address can be selected through a voltage on a pin.

So this is how far I have gotten:
2022-12-11T19:06:39.492051+02:00 localhost kernel: [ 1005.466637] cx231xx 6-2:1.1: XX Identified as Terratec
TA (card=28)
2022-12-11T19:06:39.492054+02:00 localhost kernel: [ 1005.467195] i2c i2c-11: Added multiplexed i2c bus 13
2022-12-11T19:06:39.492062+02:00 localhost kernel: [ 1005.467235] i2c i2c-11: Added multiplexed i2c bus 14
2022-12-11T19:06:39.620074+02:00 localhost kernel: [ 1005.593790] cx25840 10-0044: cx23102 A/V decoder found
@ 0x88 (cx231xx #0-0)
2022-12-11T19:06:41.692044+02:00 localhost kernel: [ 1007.666691] cx25840 10-0044: loaded
v4l-cx231xx-avcore-01.fw firmware (16382 bytes)
2022-12-11T19:06:41.736033+02:00 localhost kernel: [ 1007.709539] tea5767: Chip ID is not zero. It is not a
TEA5767
2022-12-11T19:06:41.736061+02:00 localhost kernel: [ 1007.709554] tuner: 10-0060: Tuner -1 found with type(s)
Radio TV.
2022-12-11T19:06:41.748042+02:00 localhost kernel: [ 1007.721833] tda18273 10-0060: creating new instance
2022-12-11T19:06:41.752072+02:00 localhost kernel: [ 1007.723810] tda18273: Unknown device (255) detected @
10-0060, device not supported.
2022-12-11T19:06:41.752088+02:00 localhost kernel: [ 1007.723814] tda18273_attach: [10-0060|M] error -22 on
line 1272

I am asking here in case anyone else har battled with TDA18273. Right now I am getting 255 when I try to
read, which I assume is because I am reading the wrong adress?

-- 
Med vänlig hälsning

Anders Gustafsson, ingenjör
anders.gustafsson@pedago.fi  |  Support +358 18 12060  |  Direkt +358 9 315 45 121  |  Mobil +358 40506 7099

Pedago interaktiv ab, Nygatan 7 B , AX-22100 MARIEHAMN, ÅLAND, FINLAND


