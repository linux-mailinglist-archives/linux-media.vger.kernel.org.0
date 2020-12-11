Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BA512D724E
	for <lists+linux-media@lfdr.de>; Fri, 11 Dec 2020 09:54:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392928AbgLKIxU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Dec 2020 03:53:20 -0500
Received: from mx3.molgen.mpg.de ([141.14.17.11]:37633 "EHLO mx1.molgen.mpg.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2403782AbgLKIww (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Dec 2020 03:52:52 -0500
Received: from [192.168.0.2] (ip5f5af423.dynamic.kabel-deutschland.de [95.90.244.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pmenzel)
        by mx.molgen.mpg.de (Postfix) with ESMTPSA id 2B61220647B77;
        Fri, 11 Dec 2020 09:52:09 +0100 (CET)
Subject: Re: [PATCH v2] media: em28xx: Support TerraTec G3
To:     Sean Young <sean@mess.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
References: <20200524120745.5867-1-pmenzel@molgen.mpg.de>
 <20200624091338.GA27920@gofer.mess.org>
From:   Paul Menzel <pmenzel@molgen.mpg.de>
Message-ID: <aa7ca0ba-b537-7685-1b8d-3ec6d30ba552@molgen.mpg.de>
Date:   Fri, 11 Dec 2020 09:52:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20200624091338.GA27920@gofer.mess.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dear Sean,


I am sorry for the late reply.


Am 24.06.20 um 11:13 schrieb Sean Young:
> On Sun, May 24, 2020 at 02:07:46PM +0200, Paul Menzel wrote:
>> Add the USB vendor and product ID of the TerraTec G3 [1], so Linux
>> detects the device.
> 
> Does the device work, i.e. audio, composite and s-video? Or is it
> only detected?

Testing this quickly with a self-built Linux kernel, after plugging it 
in, I couldn’t find a V4L device created for testing.

> [ 5298.437946] usb 1-3: new high-speed USB device number 4 using xhci_hcd
> [ 5298.584284] usb 1-3: config 1 interface 0 altsetting 1 endpoint 0x82 has invalid wMaxPacketSize 0
> [ 5298.584286] usb 1-3: config 1 interface 0 altsetting 1 endpoint 0x84 has invalid wMaxPacketSize 0
> [ 5298.584288] usb 1-3: config 1 interface 0 altsetting 2 endpoint 0x84 has invalid wMaxPacketSize 0
> [ 5298.584289] usb 1-3: config 1 interface 0 altsetting 3 endpoint 0x84 has invalid wMaxPacketSize 0
> [ 5298.584291] usb 1-3: config 1 interface 0 altsetting 4 endpoint 0x84 has invalid wMaxPacketSize 0
> [ 5298.584292] usb 1-3: config 1 interface 0 altsetting 5 endpoint 0x84 has invalid wMaxPacketSize 0
> [ 5298.584294] usb 1-3: config 1 interface 0 altsetting 6 endpoint 0x84 has invalid wMaxPacketSize 0
> [ 5298.584295] usb 1-3: config 1 interface 0 altsetting 7 endpoint 0x84 has invalid wMaxPacketSize 0
> [ 5298.599286] usb 1-3: New USB device found, idVendor=0ccd, idProduct=10a7, bcdDevice= 1.00
> [ 5298.599288] usb 1-3: New USB device strings: Mfr=2, Product=1, SerialNumber=0
> [ 5298.599290] usb 1-3: Product: TerraTec G3
> [ 5298.599291] usb 1-3: Manufacturer: TerraTec Electronic GmbH
> [ 5298.620437] mc: Linux media interface: v0.10
> [ 5298.628547] videodev: Linux video capture interface: v2.00
> [ 5298.633969] em28xx 1-3:1.0: New device TerraTec Electronic GmbH TerraTec G3 @ 480 Mbps (0ccd:10a7, interface 0, class 0)
> [ 5298.633971] em28xx 1-3:1.0: Video interface 0 found: isoc
> [ 5298.693271] em28xx 1-3:1.0: chip ID is em2860
> [ 5298.855294] em28xx 1-3:1.0: EEPROM ID = 1a eb 67 95, EEPROM hash = 0xd7a2f285
> [ 5298.855296] em28xx 1-3:1.0: EEPROM info:
> [ 5298.855297] em28xx 1-3:1.0:  AC97 audio (5 sample rates)
> [ 5298.855298] em28xx 1-3:1.0:  500mA max power
> [ 5298.855300] em28xx 1-3:1.0:  Table at offset 0x06, strings=0x1a9e, 0x346a, 0x0000
> [ 5298.925978] em28xx 1-3:1.0: Identified as Terratec Grabby (card=67)
> [ 5298.925981] em28xx 1-3:1.0: analog set to isoc mode.
> [ 5298.926102] em28xx 1-3:1.1: audio device (0ccd:10a7): interface 1, class 1
> [ 5298.926110] em28xx 1-3:1.2: audio device (0ccd:10a7): interface 2, class 1
> [ 5298.926122] usbcore: registered new interface driver em28xx
> [ 5298.939683] em28xx 1-3:1.0: Registering V4L2 extension
> [ 5298.969288] em28xx 1-3:1.0: Config register raw data: 0x50
> [ 5298.999281] em28xx 1-3:1.0: AC97 vendor ID = 0x83847650
> [ 5299.014280] em28xx 1-3:1.0: AC97 features = 0x6a90
> [ 5299.014281] em28xx 1-3:1.0: Empia 202 AC97 audio processor detected
> [ 5300.929118] usb 1-3: Decoder not found
> [ 5300.929121] em28xx 1-3:1.0: failed to create media graph
> [ 5300.929124] em28xx 1-3:1.0: V4L2 device vbi0 deregistered
> [ 5300.929204] em28xx 1-3:1.0: V4L2 device video0 deregistered
> [ 5300.929270] em28xx: Registered (Em28xx v4l2 Extension) extension

Can you see from the logs, what is missing? Can I force loading em28xx 
without the patch with the standard Debian Linux kernel to rule out it’s 
related to my Linux kernel configuration?


Kind regards,

Paul
