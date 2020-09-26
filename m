Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B2A52799B1
	for <lists+linux-media@lfdr.de>; Sat, 26 Sep 2020 15:29:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729291AbgIZN3k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 26 Sep 2020 09:29:40 -0400
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com ([46.30.210.184]:62906
        "EHLO mailrelay3-1.pub.mailoutpod1-cph3.one.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725208AbgIZN3k (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 26 Sep 2020 09:29:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wedl.one; s=20191106;
        h=content-transfer-encoding:content-type:mime-version:date:message-id:subject:
         from:to:from;
        bh=L1mmUkgohACO5pHr1t7XhI2QAqOEXcOeJM73aWkNvy8=;
        b=M8GmVV3bplPxDaoDJFu2q9j9vnQsk7IMXm2QzTLBaEz1bG61S8e/kLn+exDvxITh0OsIBc2jiMSZU
         yTR4khF4lR/mZc15D+5AIe0G3yvLm1TyrrQRGgDMr/i1yuUm9X4Vkj9J8F2FtnP+ZTQ4Cyokqb+/VD
         b+Xeg6urpLCI40asbFxtMY2S+MdWxvnLolqNoYCT6RzqAAkD2xqVkTw9fn91tS0Jvd1EpQ+gAG99hD
         ysxYX7eJGiP7idnaN4BeKFeyePFzwBDgVIoFq3T81X61u+MOaLoaQUTHzLlon617wSCKJF/VdaxfH7
         cKpWk4Tj8HsIurZhqeHNj+irXcGG3sQ==
X-HalOne-Cookie: ad699c2d8772009731865c71730e81db09610673
X-HalOne-ID: 51fcef27-fffc-11ea-a7fd-d0431ea8bb03
Received: from [172.16.1.8] (dyndsl-091-248-120-146.ewe-ip-backbone.de [91.248.120.146])
        by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
        id 51fcef27-fffc-11ea-a7fd-d0431ea8bb03;
        Sat, 26 Sep 2020 13:29:36 +0000 (UTC)
To:     linux-media@vger.kernel.org
From:   Webmaster <webmaster@wedl.one>
Subject: Terratec CINERGY T/C Stick
Message-ID: <eddb42fa-889c-6653-3db3-113d05350c28@wedl.one>
Date:   Sat, 26 Sep 2020 15:29:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: de-DE
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

https://www.spinics.net/lists/linux-media/msg97580.html

is there any news for the Terratec CINERGY T/C Stick?

Is there a chance it will work on Linux?


Linux acer-p256-m 5.4.0-48-generic #52-Ubuntu SMP Thu Sep 10 10:58:49 
UTC 2020 x86_64 x86_64 x86_64 GNU/Linux

dmesg
[ 1997.939659] usb 2-1: new high-speed USB device number 7 using xhci_hcd
[ 1998.099840] usb 2-1: New USB device found, idVendor=0ccd, 
idProduct=5103, bcdDevice= 1.00
[ 1998.099846] usb 2-1: New USB device strings: Mfr=1, Product=2, 
SerialNumber=3
[ 1998.099850] usb 2-1: Product: RTL2841UHIDIR
[ 1998.099853] usb 2-1: Manufacturer: Realtek
[ 1998.099856] usb 2-1: SerialNumber: 00000173

lsusb -vvv
Bus 002 Device 007: ID 0ccd:5103 TerraTec Electronic GmbH RTL2841UHIDIR
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.00
   bDeviceClass            0
   bDeviceSubClass         0
   bDeviceProtocol         0
   bMaxPacketSize0        64
   idVendor           0x0ccd TerraTec Electronic GmbH
   idProduct          0x5103
   bcdDevice            1.00
   iManufacturer           1 Realtek
   iProduct                2 RTL2841UHIDIR
   iSerial                 3 00000173
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x0022
     bNumInterfaces          2
     bConfigurationValue     1
     iConfiguration          4 USB2.0-Bulk&Iso
     bmAttributes         0x80
       (Bus Powered)
     MaxPower              500mA
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           1
       bInterfaceClass       255 Vendor Specific Class
       bInterfaceSubClass    255 Vendor Specific Subclass
       bInterfaceProtocol    255 Vendor Specific Protocol
       iInterface              5 Bulk-In, Interface
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0200  1x 512 bytes
         bInterval               0
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       0
       bNumEndpoints           0
       bInterfaceClass       255 Vendor Specific Class
       bInterfaceSubClass    255 Vendor Specific Subclass
       bInterfaceProtocol    255 Vendor Specific Protocol
       iInterface              5 Bulk-In, Interface
Device Qualifier (for other device speed):
   bLength                10
   bDescriptorType         6
   bcdUSB               2.00
   bDeviceClass            0
   bDeviceSubClass         0
   bDeviceProtocol         0
   bMaxPacketSize0        64
   bNumConfigurations      2
can't get debug descriptor: Resource temporarily unavailable
Device Status:     0x0000
   (Bus Powered)

RTL2840 CCH78S1 GC52
RTL2832P A6G72S1 GA250

What can I do to help
Thank you
Ingo
