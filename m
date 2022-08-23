Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B2A559D25E
	for <lists+linux-media@lfdr.de>; Tue, 23 Aug 2022 09:39:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240274AbiHWHir (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Aug 2022 03:38:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240545AbiHWHip (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Aug 2022 03:38:45 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57A551EAC0
        for <linux-media@vger.kernel.org>; Tue, 23 Aug 2022 00:38:43 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 02CD22B3;
        Tue, 23 Aug 2022 09:38:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661240320;
        bh=hokrIfw9v+DR90/ov9yU7jeNcfgdr2d/vcSV4bLbpBY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PYQPiyJu/I8OpnO8DgF0bdp9fnFt607WImld+k+1zYIzVZ7+KoSUn3LYMAbYD/nuX
         ym9LQTLLyQvv3ANtHVlRjkDPyOOphWm1uPpiZyJRj3yCW6vXrCLsSk4IwpzuVEnUdw
         Bn9S/4y49vnD1ajkbHIVEmCpuvV4C9MAKPpmKSXM=
Date:   Tue, 23 Aug 2022 10:38:35 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     "Massimo B." <massimo.b@gmx.net>
Cc:     linux-media@vger.kernel.org
Subject: Re: Quanta Computer Inc. Astro HD Cam, not initializing
Message-ID: <YwSD+68XuLk1zU7v@pendragon.ideasonboard.com>
References: <1e3fff6f44830e910261bfb7629247cd89bf615a.camel@gmx.net>
 <YkGMSaAyUVNWMOsq@pendragon.ideasonboard.com>
 <771493a1110cacd87c42e66eea84c962be789532.camel@gmx.net>
 <YkxLR4Xqsxzu0hh2@pendragon.ideasonboard.com>
 <129a1a8cad21c569e67897ac303cf4ca9d9bca99.camel@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <129a1a8cad21c569e67897ac303cf4ca9d9bca99.camel@gmx.net>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Massimo,

On Tue, Aug 23, 2022 at 08:47:14AM +0200, Massimo B. wrote:
> On Tue, 2022-04-05 at 16:59 +0300, Laurent Pinchart wrote:
> 
> > > > The audio interface causes issues, it seems it crashed the webcam
> > > > firmware. Could you try blacklisting the snd-usb-audio module and see if
> > > > video then works ?
> 
> > > Yes, that makes the video part work again.
> 
> > So this confirms it's a USB audio issue. It may be possible to work
> > around it in the snd-usb-audio driver, but that's beyond my area of
> > expertise. You may want to contact the alsa-devel mailing list.
> 
> Currently I have again the situation that nothing works. Audio is blacklisted:
> 
> # cat /etc/udev/rules.d/50-camera.rules 
> ACTION=="add", SUBSYSTEMS=="usb", ATTRS{idVendor}=="0408", ATTRS{idProduct}=="2090", ATTR{bInterfaceClass}=="01", ATTR{authorized}="0"
> 
> Re-plugging doesn't make it work again.
> 
> From syslog:
> Aug 22 10:28:46 [kernel] usb 3-11.2: new high-speed USB device number 21 using xhci_hcd
> Aug 22 10:28:46 [kernel] usb 3-11.2: New USB device found, idVendor=0408, idProduct=2090, bcdDevice=21.17
> Aug 22 10:28:46 [kernel] usb 3-11.2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> Aug 22 10:28:46 [kernel] usb 3-11.2: Product: Astro HD Camera
> Aug 22 10:28:46 [kernel] usb 3-11.2: Manufacturer: QCM
> Aug 22 10:28:46 [kernel] usb 3-11.2: Found UVC 1.00 device Astro HD Camera (0408:2090)
> Aug 22 10:28:46 [kernel] usb 3-11.2: No streaming interface found for terminal 9.
> Aug 22 10:28:46 [kernel] input: Astro HD Camera: Astro HD Camer as /devices/pci0000:00/0000:00:14.0/usb3/3-11/3-11.2/3-11.2:1.0/input/input41
> Aug 22 10:28:51 [kernel] usb 3-11.2: 4:1: cannot set freq 48000 to ep 0x84
> Aug 22 10:28:56 [kernel] usb 3-11.2: 10:3: cannot get min/max values for control 2 (id 10)

These messages come from the snd-usb-audio module as far as I can tell.

> Aug 22 10:28:56 [mtp-probe] checking bus 3, device 21: "/sys/devices/pci0000:00/0000:00:14.0/usb3/3-11/3-11.2"_
> Aug 22 10:28:56 [mtp-probe] bus: 3, device: 21 was not an MTP device_
> Aug 22 10:28:56 [laptop-mode] Laptop Mode Tools disabled in config file\n
>                 - Last output repeated 5 times -
> Aug 22 10:28:56 [mtp-probe] checking bus 3, device 21: "/sys/devices/pci0000:00/0000:00:14.0/usb3/3-11/3-11.2"_
> Aug 22 10:28:56 [mtp-probe] bus: 3, device: 21 was not an MTP device_
> Aug 22 10:29:02 [kernel] usb 3-11.2: Failed to query (GET_DEF) UVC control 13 on unit 1: -110 (exp. 8).
>                 - Last output repeated twice -
> Aug 22 10:29:12 [kernel] usb 3-11.2: Failed to query (GET_DEF) UVC control 2 on unit 2: -110 (exp. 2).
> Aug 22 10:29:17 [kernel] usb 3-11.2: Failed to query (GET_DEF) UVC control 11 on unit 1: -110 (exp. 2).
> Aug 22 10:29:22 [kernel] usb 3-11.2: Failed to query (GET_DEF) UVC control 2 on unit 2: -110 (exp. 2).

-- 
Regards,

Laurent Pinchart
