Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A350E4E928F
	for <lists+linux-media@lfdr.de>; Mon, 28 Mar 2022 12:34:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240274AbiC1Kg3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Mar 2022 06:36:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233245AbiC1Kg2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Mar 2022 06:36:28 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D0B015A2D
        for <linux-media@vger.kernel.org>; Mon, 28 Mar 2022 03:34:47 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D8EB4B9C;
        Mon, 28 Mar 2022 12:34:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1648463686;
        bh=EPhzXukUGue6C6hjLtMvv4wnAMVHgJRUdB+7kgtwd98=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cUJNtVDkvL5GEAVEbiV8jwkRmuKNkciHtKLmm1cmdrgc0fyS3R38nuDevvv8l4sZl
         OVmoD10gzhJmjnOXIOoA8XzyJWbHbRNNGxVUP3oibn7SPeswxaPOBSipksnksLXTp7
         KajrFVeWdTI3DZ4wOkPfVvTALXTlYfzZMEiAyUJM=
Date:   Mon, 28 Mar 2022 13:34:44 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     "Massimo B." <massimo.b@gmx.net>
Cc:     linux-media@vger.kernel.org
Subject: Re: Quanta Computer Inc. Astro HD Cam, not initializing
Message-ID: <YkGMSaAyUVNWMOsq@pendragon.ideasonboard.com>
References: <1e3fff6f44830e910261bfb7629247cd89bf615a.camel@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1e3fff6f44830e910261bfb7629247cd89bf615a.camel@gmx.net>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Massimo,

On Fri, Mar 25, 2022 at 07:41:55AM +0100, Massimo B. wrote:
> Coming from
> https://sourceforge.net/p/linux-uvc/mailman/message/37622481/
> without getting any response...
> 
> I have a combined USB Camera with microphone:
> Bus 003 Device 004: ID 0408:2090 Quanta Computer, Inc. Astro HD Camera
> 
> Some while ago I had the camera working, just needed to disable the microphone
> because if issues with pulseaudio. Now with 5.15.23-gentoo, nothing works
> anymore with that camera, no video and no audio input:
> 
> https://forums.gentoo.org/viewtopic-p-8693533.html
> 
> Is this the right place to discuss this hardware?

Yes, this is the right place.

Could you send the output of `lsusb -v -d 0408:2090` (if possible
running as root) ?

> I'm testing with guvcview, and it does not start anymore:
> 
> Mar 02 10:41:49 [kernel] usb 3-12.2: USB disconnect, device number 12
> Mar 02 10:41:57 [kernel] usb 3-12.2: new high-speed USB device number 14 using xhci_hcd
> Mar 02 10:41:57 [kernel] usb 3-12.2: New USB device found, idVendor=0408, idProduct=2090, bcdDevice=21.17
> Mar 02 10:41:57 [kernel] usb 3-12.2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> Mar 02 10:41:57 [kernel] usb 3-12.2: Product: Astro HD Camera
> Mar 02 10:41:57 [kernel] usb 3-12.2: Manufacturer: QCM
> Mar 02 10:41:57 [kernel] usb 3-12.2: Found UVC 1.00 device Astro HD Camera (0408:2090)
> Mar 02 10:41:57 [kernel] usb 3-12.2: No streaming interface found for terminal 9.
> Mar 02 10:41:57 [kernel] input: Astro HD Camera: Astro HD Camer as /devices/pci0000:00/0000:00:14.0/usb3/3-12/3-12.2/3-12.2:1.0/input/input22
> Mar 02 10:42:02 [kernel] usb 3-12.2: 4:1: cannot set freq 48000 to ep 0x84
> Mar 02 10:42:08 [kernel] usb 3-12.2: 10:3: cannot get min/max values for control 2 (id 10)

The audio interface causes issues, it seems it crashed the webcam
firmware. Could you try blacklisting the snd-usb-audio module and see if
video then works ?

> Mar 02 10:42:08 [mtp-probe] checking bus 3, device 14: "/sys/devices/pci0000:00/0000:00:14.0/usb3/3-12/3-12.2"_
> Mar 02 10:42:08 [mtp-probe] bus: 3, device: 14 was not an MTP device_
> Mar 02 10:42:08 [mtp-probe] checking bus 3, device 14: "/sys/devices/pci0000:00/0000:00:14.0/usb3/3-12/3-12.2"_
> Mar 02 10:42:08 [mtp-probe] bus: 3, device: 14 was not an MTP device_
> Mar 02 10:42:13 [kernel] usb 3-12.2: Failed to query (GET_DEF) UVC control 13 on unit 1: -110 (exp. 8).
> Mar 02 10:42:18 [kernel] usb 3-12.2: Failed to query (GET_DEF) UVC control 2 on unit 2: -110 (exp. 2).
> Mar 02 10:42:23 [kernel] usb 3-12.2: Failed to query (GET_DEF) UVC control 13 on unit 1: -110 (exp. 8).
> Mar 02 10:42:28 [kernel] usb 3-12.2: Failed to query (GET_DEF) UVC control 2 on unit 2: -110 (exp. 2).
> Mar 02 10:42:33 [kernel] usb 3-12.2: Failed to query (GET_DEF) UVC control 11 on unit 1: -110 (exp. 2).
> Mar 02 10:42:38 [kernel] usb 3-12.2: Failed to query (GET_DEF) UVC control 13 on unit 1: -110 (exp. 8).
>                 - Last output repeated twice -
> Mar 02 10:42:49 [kernel] usb 3-12.2: Failed to query (GET_DEF) UVC control 11 on unit 1: -110 (exp. 2).
> Mar 02 10:42:54 [kernel] usb 3-12.2: Failed to query (GET_DEF) UVC control 13 on unit 1: -110 (exp. 8).
>                 - Last output repeated twice -
> Mar 02 10:43:04 [kernel] usb 3-12.2: Failed to query (GET_DEF) UVC control 11 on unit 1: -110 (exp. 2).
> 
> Booting the machine with the device connected I see many repeating lines like
> this in the log until unplugging the device:
> 
> Mar 08 10:44:59 [kernel] usb 3-12.2: 4:1: usb_set_interface failed (-71)
> Mar 08 10:44:59 [kernel] usb 3-12.2: 4:0: usb_set_interface failed (-71)
>                 - Last output repeated twice -
> Mar 08 10:44:59 [kernel] usb 3-12.2: 4:1: usb_set_interface failed (-71)
> Mar 08 10:44:59 [kernel] usb 3-12.2: 4:0: usb_set_interface failed (-71)

-- 
Regards,

Laurent Pinchart
