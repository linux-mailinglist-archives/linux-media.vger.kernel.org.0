Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1779A6641F6
	for <lists+linux-media@lfdr.de>; Tue, 10 Jan 2023 14:34:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238497AbjAJNdl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Jan 2023 08:33:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238741AbjAJNd2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Jan 2023 08:33:28 -0500
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E74724FD59
        for <linux-media@vger.kernel.org>; Tue, 10 Jan 2023 05:33:26 -0800 (PST)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4NrsFr51Bxz9sb5;
        Tue, 10 Jan 2023 14:33:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flowerpot.me;
        s=MBO0001; t=1673357600;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iAGOx+RMy5NzZzMG3rKhinOsMbEyBawtY46L7J0TjL4=;
        b=rhM0XHV39A9A5NIbobRo1H0xVIcM0gw3R845YnNn7jtDFxpUAJzO0/LFg4wVQriOQiZEkK
        kbgxCje7UbvFWdlsdK87GhXM7hPjuxiZAW3WSByHVzwdDH7fFhVx7eHM3jLy/Fc9CG5HYa
        BYG/1XVErUkVkIWI4WlrgxYeNQ9Drr8LwIaosE6qkuyu2jf+ymn2ZZ4cJuGCBV9usaBv9o
        hl6zFDxqlJ5877B8kNIrjaGtMu6wIe3Jqm4XyuJsIpf0VDxmYFqraPDN/hi7sM6joey8CA
        ctJoSmij3JF49QZSwT4n/LN9hoMzxpvJo7RO2Cn+QsUfloTClOQU6Od9a4Z/YQ==
Message-ID: <aa5ee8a1-e6cb-5573-8aa0-f583227cabcf@flowerpot.me>
Date:   Tue, 10 Jan 2023 14:33:17 +0100
MIME-Version: 1.0
From:   Sophie Friedrich <lkml@flowerpot.me>
Subject: Re: Potential integration of thermal cameras into v4l
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>
Cc:     Pekka Paalanen <ppaalanen@gmail.com>, linux-media@vger.kernel.org,
        libcamera-devel@lists.libcamera.org
References: <e9da9461-240e-f5b4-089e-378b85734632@flowerpot.me>
 <20230110104626.23f476df@ferris.localdomain>
 <20230110114518.cp3bitj4hketc2ix@uno.localdomain>
 <Y71kh/vo6l54W7xm@pendragon.ideasonboard.com>
In-Reply-To: <Y71kh/vo6l54W7xm@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

Yeah the link was broken before, but I already fixed it. I'm not
sure if my reply actually reached the mailing list (it accidentally
mixed up my sending adress). At least from the libcamera I got a
bounce, as I'm not a member.

On 10/01/2023 14:13, Laurent Pinchart wrote:
> Sophie, could you please share the `lsusb -v` output for the device (you
> can limit it to a specific device with `-d VID:PID`), running as root
> (e.g. with `sudo`) if possible ?

Note here that the idVendor and iManufacturer do not match. The
camera uses the same USB VID:PID as the Netchip "Gadget Zero", because
of course it does…

$ sudo lsusb -v -d 0525:a4a0
Bus 001 Device 019: ID 0525:a4a0 Netchip Technology, Inc. Linux-USB 
"Gadget Zero"
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.01
   bDeviceClass            0
   bDeviceSubClass         0
   bDeviceProtocol         0
   bMaxPacketSize0        64
   idVendor           0x0525 Netchip Technology, Inc.
   idProduct          0xa4a0 Linux-USB "Gadget Zero"
   bcdDevice            2.00
   iManufacturer           1 Wuhan Guide Infrared Co., Ltd.
   iProduct                2 MobIR Air
   iSerial                 3 ZX01A19
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x0040
     bNumInterfaces          2
     bConfigurationValue     1
     iConfiguration          4 MFI Configure
     bmAttributes         0xc0
       Self Powered
     MaxPower              100mA
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           2
       bInterfaceClass       255 Vendor Specific Class
       bInterfaceSubClass    240
       bInterfaceProtocol      0
       iInterface              5 iAP Interface
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x82  EP 2 IN
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0040  1x 64 bytes
         bInterval               0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x02  EP 2 OUT
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0040  1x 64 bytes
         bInterval               0
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       0
       bNumEndpoints           0
       bInterfaceClass       255 Vendor Specific Class
       bInterfaceSubClass    240
       bInterfaceProtocol      1
       iInterface              6 com.guidesensmart.mobir-air
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       1
       bNumEndpoints           2
       bInterfaceClass       255 Vendor Specific Class
       bInterfaceSubClass    240
       bInterfaceProtocol      1
       iInterface              6 com.guidesensmart.mobir-air
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0040  1x 64 bytes
         bInterval               0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x01  EP 1 OUT
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0040  1x 64 bytes
         bInterval               0
Binary Object Store Descriptor:
   bLength                 5
   bDescriptorType        15
   wTotalLength       0x000c
   bNumDeviceCaps          1
   USB 2.0 Extension Device Capability:
     bLength                 7
     bDescriptorType        16
     bDevCapabilityType      2
     bmAttributes   0x00000002
       HIRD Link Power Management (LPM) Supported
Device Status:     0x0001
   Self Powered

