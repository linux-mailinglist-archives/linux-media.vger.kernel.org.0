Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25AAB2DC0B6
	for <lists+linux-media@lfdr.de>; Wed, 16 Dec 2020 14:06:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725913AbgLPNFZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Dec 2020 08:05:25 -0500
Received: from gofer.mess.org ([88.97.38.141]:51303 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725825AbgLPNFY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Dec 2020 08:05:24 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 626A3C6401; Wed, 16 Dec 2020 13:04:43 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1608123883; bh=5TPkvBDAxvDDrdgcVyKWsZ2bpRYLlYXc28ErRSBoXsE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sJJMLnHmGNSlg+NbumOPJdVqfvFSR6lNEJQTW/4sDQqii2ii1yUnYn+D7rP2WDmqq
         xdPlqNn9kS+kXwz2p4PdOg5XZt7l/Tg52vifivCz0F/hTUyJQrmjLS0yfID5+wjDuj
         a4mBXFfDLnFPKY4Y6vj96qNFe43jVB9ZmNGmwTdozLkjU3F1SFJSOtf9vWOwGJusKR
         WYxx0xPyM+CbCl8Ob6T6izOm4V/6c0yht5xhaxslKA1SIrlfRPIX9LL40rllEE/ZFi
         IAJiPXcjp16V07gcK1aVu1/0yOwxsPvwR8t++JnLShQKm6KWFzSXQ43pFJTtMr91kQ
         kjuHUsE2q6ymQ==
Date:   Wed, 16 Dec 2020 13:04:43 +0000
From:   Sean Young <sean@mess.org>
To:     Paul Menzel <pmenzel@molgen.mpg.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2] media: em28xx: Support TerraTec G3
Message-ID: <20201216130443.GA21695@gofer.mess.org>
References: <20200524120745.5867-1-pmenzel@molgen.mpg.de>
 <20200624091338.GA27920@gofer.mess.org>
 <aa7ca0ba-b537-7685-1b8d-3ec6d30ba552@molgen.mpg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aa7ca0ba-b537-7685-1b8d-3ec6d30ba552@molgen.mpg.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

On Fri, Dec 11, 2020 at 09:52:08AM +0100, Paul Menzel wrote:
> Dear Sean,
> 
> 
> I am sorry for the late reply.
> 
> 
> Am 24.06.20 um 11:13 schrieb Sean Young:
> > On Sun, May 24, 2020 at 02:07:46PM +0200, Paul Menzel wrote:
> > > Add the USB vendor and product ID of the TerraTec G3 [1], so Linux
> > > detects the device.
> > 
> > Does the device work, i.e. audio, composite and s-video? Or is it
> > only detected?
> 
> Testing this quickly with a self-built Linux kernel, after plugging it in, I
> couldn’t find a V4L device created for testing.
> 
> > [ 5298.437946] usb 1-3: new high-speed USB device number 4 using xhci_hcd
> > [ 5298.584284] usb 1-3: config 1 interface 0 altsetting 1 endpoint 0x82 has invalid wMaxPacketSize 0
> > [ 5298.584286] usb 1-3: config 1 interface 0 altsetting 1 endpoint 0x84 has invalid wMaxPacketSize 0
> > [ 5298.584288] usb 1-3: config 1 interface 0 altsetting 2 endpoint 0x84 has invalid wMaxPacketSize 0
> > [ 5298.584289] usb 1-3: config 1 interface 0 altsetting 3 endpoint 0x84 has invalid wMaxPacketSize 0
> > [ 5298.584291] usb 1-3: config 1 interface 0 altsetting 4 endpoint 0x84 has invalid wMaxPacketSize 0
> > [ 5298.584292] usb 1-3: config 1 interface 0 altsetting 5 endpoint 0x84 has invalid wMaxPacketSize 0
> > [ 5298.584294] usb 1-3: config 1 interface 0 altsetting 6 endpoint 0x84 has invalid wMaxPacketSize 0
> > [ 5298.584295] usb 1-3: config 1 interface 0 altsetting 7 endpoint 0x84 has invalid wMaxPacketSize 0
> > [ 5298.599286] usb 1-3: New USB device found, idVendor=0ccd, idProduct=10a7, bcdDevice= 1.00
> > [ 5298.599288] usb 1-3: New USB device strings: Mfr=2, Product=1, SerialNumber=0
> > [ 5298.599290] usb 1-3: Product: TerraTec G3
> > [ 5298.599291] usb 1-3: Manufacturer: TerraTec Electronic GmbH
> > [ 5298.620437] mc: Linux media interface: v0.10
> > [ 5298.628547] videodev: Linux video capture interface: v2.00
> > [ 5298.633969] em28xx 1-3:1.0: New device TerraTec Electronic GmbH TerraTec G3 @ 480 Mbps (0ccd:10a7, interface 0, class 0)
> > [ 5298.633971] em28xx 1-3:1.0: Video interface 0 found: isoc
> > [ 5298.693271] em28xx 1-3:1.0: chip ID is em2860
> > [ 5298.855294] em28xx 1-3:1.0: EEPROM ID = 1a eb 67 95, EEPROM hash = 0xd7a2f285
> > [ 5298.855296] em28xx 1-3:1.0: EEPROM info:
> > [ 5298.855297] em28xx 1-3:1.0:  AC97 audio (5 sample rates)
> > [ 5298.855298] em28xx 1-3:1.0:  500mA max power
> > [ 5298.855300] em28xx 1-3:1.0:  Table at offset 0x06, strings=0x1a9e, 0x346a, 0x0000
> > [ 5298.925978] em28xx 1-3:1.0: Identified as Terratec Grabby (card=67)
> > [ 5298.925981] em28xx 1-3:1.0: analog set to isoc mode.
> > [ 5298.926102] em28xx 1-3:1.1: audio device (0ccd:10a7): interface 1, class 1
> > [ 5298.926110] em28xx 1-3:1.2: audio device (0ccd:10a7): interface 2, class 1
> > [ 5298.926122] usbcore: registered new interface driver em28xx
> > [ 5298.939683] em28xx 1-3:1.0: Registering V4L2 extension
> > [ 5298.969288] em28xx 1-3:1.0: Config register raw data: 0x50
> > [ 5298.999281] em28xx 1-3:1.0: AC97 vendor ID = 0x83847650
> > [ 5299.014280] em28xx 1-3:1.0: AC97 features = 0x6a90
> > [ 5299.014281] em28xx 1-3:1.0: Empia 202 AC97 audio processor detected
> > [ 5300.929118] usb 1-3: Decoder not found
> > [ 5300.929121] em28xx 1-3:1.0: failed to create media graph
> > [ 5300.929124] em28xx 1-3:1.0: V4L2 device vbi0 deregistered
> > [ 5300.929204] em28xx 1-3:1.0: V4L2 device video0 deregistered
> > [ 5300.929270] em28xx: Registered (Em28xx v4l2 Extension) extension
> 
> Can you see from the logs, what is missing? Can I force loading em28xx
> without the patch with the standard Debian Linux kernel to rule out it’s
> related to my Linux kernel configuration?

Looks like it can't find the decoder, not sure this is anything to do with
your kernel config. This device probably has a different decoder than the
other Grabby device.

You could try to set the decoder field for the device to EM28XX_TVP5150 and
see what happens, or open the device and see if you can find what decoder
it uses.


Sean
