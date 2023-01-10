Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F244A664249
	for <lists+linux-media@lfdr.de>; Tue, 10 Jan 2023 14:50:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238177AbjAJNud (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Jan 2023 08:50:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231974AbjAJNuc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Jan 2023 08:50:32 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B0D140856
        for <linux-media@vger.kernel.org>; Tue, 10 Jan 2023 05:50:31 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 944384D4;
        Tue, 10 Jan 2023 14:50:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673358629;
        bh=v4QWJCu9d0yqIaFxd4fpSit9Ol676RxrfIMJ8euZj0w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dYbSKoTB7vQDjc/dQJOXgz04+Cp+FyqlCTg5mlQpVTCMZ5sJP4iX48xjQ9LZmyRPd
         xSvkL2dg5/TS7G8wPpVAXkUYwn2xzQkURFmVBGCmMNDOBYxnRXhoqS6XF7FRHwW4bh
         AYvjIGeHPihrlM3gRnut5TYlpZKcRYEl9OleW/3U=
Date:   Tue, 10 Jan 2023 15:50:23 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sophie Friedrich <lkml@flowerpot.me>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org
Subject: Re: Potential integration of thermal cameras into v4l
Message-ID: <Y71tH5ZQT45MhHka@pendragon.ideasonboard.com>
References: <e9da9461-240e-f5b4-089e-378b85734632@flowerpot.me>
 <20230110104626.23f476df@ferris.localdomain>
 <20230110114518.cp3bitj4hketc2ix@uno.localdomain>
 <Y71kh/vo6l54W7xm@pendragon.ideasonboard.com>
 <aa5ee8a1-e6cb-5573-8aa0-f583227cabcf@flowerpot.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aa5ee8a1-e6cb-5573-8aa0-f583227cabcf@flowerpot.me>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sophie,

On Tue, Jan 10, 2023 at 02:33:17PM +0100, Sophie Friedrich wrote:
> Hello,
> 
> Yeah the link was broken before, but I already fixed it. I'm not
> sure if my reply actually reached the mailing list (it accidentally
> mixed up my sending adress). At least from the libcamera I got a
> bounce, as I'm not a member.

I've accepted both e-mails manually, and added the two addresses to the
approved senders.

> On 10/01/2023 14:13, Laurent Pinchart wrote:
> > Sophie, could you please share the `lsusb -v` output for the device (you
> > can limit it to a specific device with `-d VID:PID`), running as root
> > (e.g. with `sudo`) if possible ?
> 
> Note here that the idVendor and iManufacturer do not match. The
> camera uses the same USB VID:PID as the Netchip "Gadget Zero", because
> of course it does…

Of course... Thank you for the descriptors, even if they make me want to
cry...

> $ sudo lsusb -v -d 0525:a4a0
> Bus 001 Device 019: ID 0525:a4a0 Netchip Technology, Inc. Linux-USB 
> "Gadget Zero"
> Device Descriptor:
>    bLength                18
>    bDescriptorType         1
>    bcdUSB               2.01
>    bDeviceClass            0
>    bDeviceSubClass         0
>    bDeviceProtocol         0
>    bMaxPacketSize0        64
>    idVendor           0x0525 Netchip Technology, Inc.
>    idProduct          0xa4a0 Linux-USB "Gadget Zero"
>    bcdDevice            2.00
>    iManufacturer           1 Wuhan Guide Infrared Co., Ltd.
>    iProduct                2 MobIR Air
>    iSerial                 3 ZX01A19
>    bNumConfigurations      1
>    Configuration Descriptor:
>      bLength                 9
>      bDescriptorType         2
>      wTotalLength       0x0040
>      bNumInterfaces          2
>      bConfigurationValue     1
>      iConfiguration          4 MFI Configure
>      bmAttributes         0xc0
>        Self Powered
>      MaxPower              100mA
>      Interface Descriptor:
>        bLength                 9
>        bDescriptorType         4
>        bInterfaceNumber        0
>        bAlternateSetting       0
>        bNumEndpoints           2
>        bInterfaceClass       255 Vendor Specific Class
>        bInterfaceSubClass    240
>        bInterfaceProtocol      0
>        iInterface              5 iAP Interface
>        Endpoint Descriptor:
>          bLength                 7
>          bDescriptorType         5
>          bEndpointAddress     0x82  EP 2 IN
>          bmAttributes            2
>            Transfer Type            Bulk
>            Synch Type               None
>            Usage Type               Data
>          wMaxPacketSize     0x0040  1x 64 bytes
>          bInterval               0
>        Endpoint Descriptor:
>          bLength                 7
>          bDescriptorType         5
>          bEndpointAddress     0x02  EP 2 OUT
>          bmAttributes            2
>            Transfer Type            Bulk
>            Synch Type               None
>            Usage Type               Data
>          wMaxPacketSize     0x0040  1x 64 bytes
>          bInterval               0
>      Interface Descriptor:
>        bLength                 9
>        bDescriptorType         4
>        bInterfaceNumber        1
>        bAlternateSetting       0
>        bNumEndpoints           0
>        bInterfaceClass       255 Vendor Specific Class
>        bInterfaceSubClass    240
>        bInterfaceProtocol      1
>        iInterface              6 com.guidesensmart.mobir-air
>      Interface Descriptor:
>        bLength                 9
>        bDescriptorType         4
>        bInterfaceNumber        1
>        bAlternateSetting       1
>        bNumEndpoints           2
>        bInterfaceClass       255 Vendor Specific Class
>        bInterfaceSubClass    240
>        bInterfaceProtocol      1
>        iInterface              6 com.guidesensmart.mobir-air
>        Endpoint Descriptor:
>          bLength                 7
>          bDescriptorType         5
>          bEndpointAddress     0x81  EP 1 IN
>          bmAttributes            2
>            Transfer Type            Bulk
>            Synch Type               None
>            Usage Type               Data
>          wMaxPacketSize     0x0040  1x 64 bytes
>          bInterval               0
>        Endpoint Descriptor:
>          bLength                 7
>          bDescriptorType         5
>          bEndpointAddress     0x01  EP 1 OUT
>          bmAttributes            2
>            Transfer Type            Bulk
>            Synch Type               None
>            Usage Type               Data
>          wMaxPacketSize     0x0040  1x 64 bytes
>          bInterval               0
> Binary Object Store Descriptor:
>    bLength                 5
>    bDescriptorType        15
>    wTotalLength       0x000c
>    bNumDeviceCaps          1
>    USB 2.0 Extension Device Capability:
>      bLength                 7
>      bDescriptorType        16
>      bDevCapabilityType      2
>      bmAttributes   0x00000002
>        HIRD Link Power Management (LPM) Supported
> Device Status:     0x0001
>    Self Powered
> 

-- 
Regards,

Laurent Pinchart
