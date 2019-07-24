Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C82FA732DE
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2019 17:36:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387652AbfGXPgQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jul 2019 11:36:16 -0400
Received: from 233-64-107-242.static.try.wideopenwest.com ([64.233.242.107]:55044
        "EHLO mail.nordicboycomputing.com" rhost-flags-OK-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S2387650AbfGXPgQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jul 2019 11:36:16 -0400
X-Greylist: delayed 590 seconds by postgrey-1.27 at vger.kernel.org; Wed, 24 Jul 2019 11:36:15 EDT
Received: from nordicboycomputing.com (gateway.appalachian.home [192.168.4.1])
        by mail.nordicboycomputing.com (Postfix) with ESMTPSA id 569A93402FE
        for <linux-media@vger.kernel.org>; Wed, 24 Jul 2019 11:26:24 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
        d=nordicboycomputing.com; s=YYYYMM; t=1563981984;
        bh=amRN4UtBmS/ytE1EkWYjJ6NHmBHH77++ZQ3Pi8VikrE=;
        h=Date:From:To:Subject:From;
        b=Sxujx9eXxDbr9msaawpCJgExbfYnbpW7exesYiZBC8wSUnOo2SGtEk1PSXhUeuka2
         b4YQIMP6mNh4dAj00/P0HEeXNNS/GRAHZKRXdMFNRsFgWAkOda/HJ4SfUY8nYA4zE8
         cQzvUbBiUZu9Iw1IePSU2nlEGFbj6tYGAwBLp2N7gj7Gyx4eDWSlIt0tnXEdtend7H
         af6ja+/61WsdqD1Keu9FD0co6FLBFHXaaCflaKCFa3Vsrcb2aUvbNz8jSP8xv5c6O4
         FazvoqNPndJh5XVd8yXV+c6brDYLyhhFsZJooEpTMurRwL/XEsxiBUnZvXwpkeRSGT
         NTBAp5xbYJltot2USfuk6LW65v3G5P9wgJp0dP6x41L1QBdnF1voWMb5MDm068Q2An
         UGHOeYFmwN5v2WY1mINMfkogoFDLshiFpxffXml3z+J//eGhncW3kRZk/7mDjSTZui
         Un8RiAi7dRpLzsmeRZWwAelVXIIbhP2usvLOZjfep7Xl2XOxyHgZan8u73VYE91hgA
         IFw2AjQTtMk8srOrBrcSwjEP9tLOQIkNW/daIBimOMuWxL6UV1JFbeKslhrkmrvsnR
         MGMWwRW+4XJtS7LgJ9r1fN5h1/XC0Wafvt1LQ5eDQwRG4beaQ4NNO7HUTEI51mdrJC
         wBsnE+Pu+Goar243r12gqSQ4=
Date:   Wed, 24 Jul 2019 11:26:24 -0400 (EDT)
From:   jklaas@nordicboycomputing.com
To:     linux-media@vger.kernel.org
Subject: radio-si470x and gnomeradio
Message-ID: <alpine.DEB.2.20.1907241121080.19014@shenandoah.nordicboycomputing.com>
User-Agent: Alpine 2.20 (DEB 67 2015-01-07)
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I found my old FM Radio stick last night and decided to see if it still worked.

On insertion of my USB Radio stick, I get the following message:

178145.786842] radio-si470x 1-1.2:1.2: non-zero urb status (-71)
[178145.810838] radio-si470x 1-1.2:1.2: non-zero urb status (-71)
[178145.813827] usb 1-1.2: USB disconnect, device number 8
[178148.084395] usb 1-1.2: new full-speed USB device number 10 using ehci-pci
[178148.194702] usb 1-1.2: New USB device found, idVendor=10c4, idProduct=818a
[178148.194705] usb 1-1.2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[178148.194708] usb 1-1.2: Product: FM Radio
[178148.194710] usb 1-1.2: Manufacturer: SILICON LABORATORIES INC.
[178148.197655] radio-si470x 1-1.2:1.2: DeviceID=0x1242 ChipID=0x0409
[178148.197660] radio-si470x 1-1.2:1.2: This driver is known to work with firmware version 12,
[178148.197663] radio-si470x 1-1.2:1.2: but the device has firmware version 9.
[178148.198151] radio-si470x 1-1.2:1.2: software version 0, hardware version 6
[178148.198154] radio-si470x 1-1.2:1.2: If you have some trouble using this driver,
[178148.198156] radio-si470x 1-1.2:1.2: please report to V4L ML at linux-media@vger.kernel.org

I read somewhere that running a newer version of the USBRadio.exe file should update the firmware. I can't seem to get the latest usbradio.zip from SiLabs to see if that will update the firmware. SiLabs makes you sign up for an account and I've not yet received a confirmation of my account yet.

When I try to use gnomeradio I get many of the following messages:

ALSA lib pcm.c:7843:(snd_pcm_recover) overrun occurred
ALSA lib pcm.c:7843:(snd_pcm_recover) underrun occurred
ALSA lib pcm.c:7843:(snd_pcm_recover) overrun occurred
ALSA lib pcm.c:7843:(snd_pcm_recover) underrun occurred
ALSA lib pcm.c:7843:(snd_pcm_recover) overrun occurred
ALSA lib pcm.c:7843:(snd_pcm_recover) underrun occurred
ALSA lib pcm.c:7843:(snd_pcm_recover) underrun occurred

I can mitigate this by increasing the (I think) alsa buffers, but it never really goes away.

-- 
                         James Klaas

