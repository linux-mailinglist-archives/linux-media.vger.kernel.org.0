Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AE0813B4B
	for <lists+linux-media@lfdr.de>; Sat,  4 May 2019 19:15:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726768AbfEDRPN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 4 May 2019 13:15:13 -0400
Received: from 76.pool90-74-80.dynamic.orange.es ([90.74.80.76]:43716 "EHLO
        tedecea.pedroreina.name" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726320AbfEDRPN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 4 May 2019 13:15:13 -0400
X-Greylist: delayed 2489 seconds by postgrey-1.27 at vger.kernel.org; Sat, 04 May 2019 13:15:12 EDT
Received: from [192.168.0.11]
        by tedecea.pedroreina.name with esmtp (Exim 4.80)
        (envelope-from <pedro@pedroreina.net>)
        id 1hMxbZ-0002Ci-Te
        for linux-media@vger.kernel.org; Sat, 04 May 2019 18:33:41 +0200
Message-ID: <5CCDBEE5.6000702@pedroreina.net>
Date:   Sat, 04 May 2019 18:33:41 +0200
From:   Pedro Reina <pedro@pedroreina.net>
User-Agent: Thunderbird 2.0.0.9 (X11/20071031)
MIME-Version: 1.0
To:     linux-media@vger.kernel.org
Subject: Conexant CX23418 on Toshiba Qosmio G30
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi everyone.

I only find this ML to report my problem. If I'm wrong, please tell me 
the right place.

I'm trying to get working the Conexant CX23418 DVB-T tuner found in my 
Toshiba Qosmio G30 computer.

I followed instruccions on 
https://www.linuxtv.org/wiki/index.php/Xceive_XC3028/XC2028

I got and install firmware file xc3028-v27.fw and v4l-cx23418-cpu.fw, 
v4l-cx23418-apu.fw, v4l-cx23418-dig.fw.

But I don't have the directory /dev/dvb/ created. So, any further test 
with Kaffeine or similar failed.

I used two Linux distros with the same result: Devuan 2 with kernel 
4.9.0 and xubuntu-18.04.2-desktop-i386 with kernel 4.15.0.

I've read in the wiki page that: "extracts the firmware from the 
specific hcw85bda.sys", but I dont have such file in the original OS 
install of this computer; I have these files: apu400x.rom, colorcvt.ax, 
cpnotify.ax, cxraptor.ax, cxTVRate.dll, makoaudB400x.rom, 
makoaudC400x.rom, /reg_files/Nur20MCE.reg, ttv400x.cat, ttv400x.inf, 
ttv400x.sys, ttv400x_a.rom, ttv400x_d.rom, TVersion.xml under the "TV 
Tuner Driver" folder.

------------------------------------------
Output of lspci -vv:
06:09.0 Multimedia video controller: Conexant Systems, Inc. CX23418 
Single-Chip MPEG-2 Encoder with Integrated Analog Video/Broadcast Audio 
Decoder
	Subsystem: Toshiba America Info Systems CX23418 Single-Chip MPEG-2 
Encoder with Integrated Analog Video/Broadcast Audio Decoder
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- 
Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 64 (500ns min, 50000ns max), Cache Line Size: 32 bytes
	Interrupt: pin A routed to IRQ 19
	Region 0: Memory at f4000000 (32-bit, non-prefetchable) [size=64M]
	Capabilities: <access denied>
	Kernel driver in use: cx18
	Kernel modules: cx18
------------------------------------------
Output of dmesg | grep "cx18\|xc2028"
[    2.806433] cx18:  Start initialization, version 1.5.1
[    3.015404] cx18-0: Initializing card 0
[    3.015461] cx18-0: Autodetected Toshiba Qosmio DVB-T/Analog card
[    3.015646] cx18-0: cx23418 revision 01010000 (B)
[    3.215701] cx18-0: Experimenters and photos needed for device to 
work well.
[    3.352511] xc2028 4-0060: creating new instance
[    3.352513] xc2028 4-0060: type set to XCeive xc2028/xc3028 tuner
[    3.353044] cx18-0: Registered device video0 for encoder MPEG (64 x 
32.00 kB)
[    3.353161] cx18-0: Registered device video32 for encoder YUV (20 x 
101.25 kB)
[    3.353324] cx18-0: Registered device vbi0 for encoder VBI (20 x 
51984 bytes)
[    3.353422] cx18-0: Registered device video24 for encoder PCM audio 
(256 x 4.00 kB)
[    3.353424] cx18-0: Initialized card: Toshiba Qosmio DVB-T/Analog
[    3.353453] cx18:  End initialization
[    3.355613] cx18 0000:06:09.0: firmware: direct-loading firmware 
xc3028-v27.fw
[    3.355619] xc2028 4-0060: Loading 80 firmware images from 
xc3028-v27.fw, type: xc2028 firmware, ver 2.7
[    3.360534] cx18-alsa: module loading...
[    3.365744] cx18 0000:06:09.0: firmware: direct-loading firmware 
v4l-cx23418-cpu.fw
[    3.477870] cx18-0: loaded v4l-cx23418-cpu.fw firmware (158332 bytes)
[    3.505987] cx18 0000:06:09.0: firmware: direct-loading firmware 
v4l-cx23418-apu.fw
[    3.606282] cx18-0: loaded v4l-cx23418-apu.fw firmware V00120000 
(141200 bytes)
[    3.612391] cx18-0: FW version: 0.0.74.0 (Release 2007/03/12)
[    3.832250] cx18 0000:06:09.0: firmware: direct-loading firmware 
v4l-cx23418-cpu.fw
[    3.975957] cx18 0000:06:09.0: firmware: direct-loading firmware 
v4l-cx23418-apu.fw
[    4.298236] cx18 0000:06:09.0: firmware: direct-loading firmware 
v4l-cx23418-dig.fw
[    4.564513] cx18-0 843: loaded v4l-cx23418-dig.fw firmware (16382 bytes)
[    4.587159] cx18-0 843: verified load of v4l-cx23418-dig.fw firmware 
(16382 bytes)
[    4.604039] xc2028 4-0060: Loading firmware for type=
[    6.165368] xc2028 4-0060: Loading firmware for type=
[    6.192842] xc2028 4-0060: Loading SCODE for type=
[    6.201782] xc2028 4-0060: Incorrect readback of firmware version.
[    6.276039] xc2028 4-0060: Error! firmware not loaded
[    6.277937] xc2028 4-0060: Error -22 while loading base firmware
[    6.352036] xc2028 4-0060: Error! firmware not loaded
[    6.353906] xc2028 4-0060: Error -22 while loading base firmware
[    6.428038] xc2028 4-0060: Error! firmware not loaded
[    6.429925] xc2028 4-0060: Error -22 while loading base firmware
[    6.504036] xc2028 4-0060: Error! firmware not loaded
[    6.505983] xc2028 4-0060: Error -22 while loading base firmware
[    6.580037] xc2028 4-0060: Error! firmware not loaded
[    6.582019] xc2028 4-0060: Error -22 while loading base firmware
[    6.656036] xc2028 4-0060: Error! firmware not loaded
[    6.657988] xc2028 4-0060: Error -22 while loading base firmware
[    6.732039] xc2028 4-0060: Error! firmware not loaded
[    6.733962] xc2028 4-0060: Error -22 while loading base firmware
[    6.808042] xc2028 4-0060: Error! firmware not loaded
[    6.809938] xc2028 4-0060: Error -22 while loading base firmware
------------------------------------------

I've a full review of this computer (in Spanish) in my site:
http://pedroreina.net/hardware/qosmio/

If you need more info, just ask.

Thank you very much for your time and work.

Sincerely.
Pedro Reina
