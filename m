Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0392B3072DE
	for <lists+linux-media@lfdr.de>; Thu, 28 Jan 2021 10:40:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232396AbhA1Jg0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jan 2021 04:36:26 -0500
Received: from mail-oln040092075024.outbound.protection.outlook.com ([40.92.75.24]:49478
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232376AbhA1JeT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jan 2021 04:34:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MU6r/9mZv6wr/II2+uuaM2Wh8YUWcIYncXu4RN4CHDie/VEnergVtm/CvfyeTAUWplYmLwO2s/6JhkKCVs2tmSZ0//Fxg+stg8b2oM0rvFkr1VeeOB7n0wlrsew0lUGBNAFfahjae6yMBCria8T89UJ1+wBmb2xMYOGak7SGLNGGtRh0ax/LEjn4iUpvlMDVWWcBOBECZRwqKt6SH66nkspPl28/toALCRQnXvj9HgWW4hlUr2NVWF058HCmowM0ND0mwUtHIM1z7OheZflyBUkfPck9oLK24lkzGI5Tt9DHmS1svDekMy3x40UDeOw4Mmymm5Ud2wqLwPV1BJ/rMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8VBc0vDoO8lvDUzFrRzeerNyTEhwPZWqxcog2vHC35Y=;
 b=eSqHCM7jeHyyRpNrxJjSatXh2sS0ASkutImD38LUDfQoLzcqBufsq8zE9A6zTruKTZRySfajwbqoxs0KMfEd+neyt7lJQbcdvYgGtzkifpq3BuuAsFoBRq8GK80d9rEbzgwfQxxrBvapBRwFG6Qvml9cWHL/URIYTqRDwSnOQrPC6im2FAik1ChdBqbHYfFDcsQtsOrG6V4B3gZRUodJWnL5rIsJ0Qm67cgKzopt8wBuGgWpR71YNH7bFm0sV+xvGY+KMYpWxfaGOlrYboEEzNahp3hAIqUv6tuIBY9zMYS7vIwyd2ddXK64jxrJMSZ8qJioX6IHgwsCPYYSkUFDkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from HE1EUR04FT054.eop-eur04.prod.protection.outlook.com
 (2a01:111:e400:7e0d::49) by
 HE1EUR04HT125.eop-eur04.prod.protection.outlook.com (2a01:111:e400:7e0d::365)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Thu, 28 Jan
 2021 09:32:58 +0000
Received: from DBAPR01MB6885.eurprd01.prod.exchangelabs.com
 (2a01:111:e400:7e0d::52) by HE1EUR04FT054.mail.protection.outlook.com
 (2a01:111:e400:7e0d::299) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11 via Frontend
 Transport; Thu, 28 Jan 2021 09:32:58 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:3580F6F739F854A5A0F9FD045CED02C844A4CF7D82BB67DD8A3548BBB0E0C836;UpperCasedChecksum:B59C100E3B02049DBF41A045CD6AC642AADFD6D8611C49D6028B7144331C83C2;SizeAsReceived:8417;Count:44
Received: from DBAPR01MB6885.eurprd01.prod.exchangelabs.com
 ([fe80::816c:15b5:6b35:169b]) by DBAPR01MB6885.eurprd01.prod.exchangelabs.com
 ([fe80::816c:15b5:6b35:169b%6]) with mapi id 15.20.3805.017; Thu, 28 Jan 2021
 09:32:57 +0000
Message-ID: <DBAPR01MB6885008D7B1A3518CB83899F9DBA9@DBAPR01MB6885.eurprd01.prod.exchangelabs.com>
Subject: [video4linux] issues with TerraTec G3 and MSI Vox Mini
From:   Erdinc Ay <erdinc.ay@outlook.de>
To:     linux-media@vger.kernel.org
Date:   Thu, 28 Jan 2021 10:32:54 +0100
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
Content-Transfer-Encoding: 7bit
X-TMN:  [tgSupZdttHwLx/sM8ZRXth3M8Y/NMBrV]
X-ClientProxiedBy: ZR0P278CA0089.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::22) To DBAPR01MB6885.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:19e::14)
X-Microsoft-Original-Message-ID: <416822ecbde1f97ef6316c778b056491e95faa62.camel@outlook.de>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pop-os (212.186.25.135) by ZR0P278CA0089.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:22::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17 via Frontend Transport; Thu, 28 Jan 2021 09:32:56 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 44
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 1a5f2508-2027-4b9a-f93f-08d8c36fb1be
X-MS-TrafficTypeDiagnostic: HE1EUR04HT125:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZtfA6QYtMW/HmFUqzGB31sTMXQqbuibIQruvkLLgyvjz+s7+cGezglWZSXcYWSQHbZ+hzq0WFzZPZDDanFfehIhYxUfIkKDyLF2uyKmaPWcDZMAMfrxpLqw2iLA8hok47y2z8bpYF06umqLAQYvkW7/FWBoKpHcvU4h5MHLMSXevAB4bD+OTXckFSSotlEPyn7PAFHAmKoZXcl4wiQKU7uO0Cl1+3TyR1RkBrCL2rdMEpwEXklIAsD83GXnMH5ViuRFF9fOb3v9z7eMABS+/Kstg6q8X+HVwjeJCK03rUn+QnKvyOkcS9GaT+nhEIvEgsfrMO87mP4qHiQLCieVgb4GP8kb8uBPRWkVySv1jeB5w6D9C6r981KQyqmLs2QpnIBA9VMEgdYQHgZGd4rUnhBuYh0vjTs+kSbS92gXsz500IE/H0+Eki56TIfhoke0x
X-MS-Exchange-AntiSpam-MessageData: 9IBscP6wFl5wU3dR4DEGTvAQwuIon0OXMjOXnR+PJH3NQCiQXgv01caOC75S6BIfvca3f1Z/5NewefAsFBVXLElEHgXsjAAVU1jwqd7ym2msEjk2dIRlz78YcIJq01Cplel6yRaDSZDAafr+6rgSdQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a5f2508-2027-4b9a-f93f-08d8c36fb1be
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 09:32:57.8549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR04FT054.eop-eur04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR04HT125
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello, 


two devices (see images) are not working with Video 4 Linux: 

- MSI Vox Mini
- TerraTec G3


My problem is following:

i am connecting some video A2C converter devices that should be usable
with ShotCut and selecting the video input via the video4linux API, but
the issue is that my devices are not discovered and not listed within
/dev/video0 or /dev/video1

So I wanted to build the drivers myself based on 
https://www.linuxtv.org/wiki/index.php/How_to_Obtain,_Build_and_Install_V4L-DVB_Device_Drivers
, but I do not want to destroy my system.


Images: https://imgur.com/a/GDcA1VD (The images are from me personally,
and can be used on the LinuxTV pages without credits.)


[List of Content] 
HERE IS A BUNCH OF DEBUG DATA THAT MIGHT BE HELPFUL: 

- all devices via lsusb
- target devices via lsusb
- details of lsusb -v 
- and kernel output via dmesg (2x)



All Devices listed from lsusb:

Bus 006 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub

Bus 005 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub

Bus 004 Device 005: ID 2109:8110 VIA Labs, Inc. Hub

Bus 004 Device 004: ID 05e3:0612 Genesys Logic, Inc. Hub

Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub

Bus 003 Device 013: ID 046d:c52b Logitech, Inc. Unifying Receiver

Bus 003 Device 011: ID 2109:2811 VIA Labs, Inc. Hub

Bus 003 Device 010: ID 1532:021e Razer USA, Ltd

Bus 003 Device 009: ID 05e3:0610 Genesys Logic, Inc. 4-port hub

Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub

Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub

Bus 001 Device 036: ID 0ccd:10a7 TerraTec Electronic GmbH TerraTec G3

Bus 001 Device 035: ID eb1a:2861 eMPIA Technology, Inc.

Bus 001 Device 003: ID 8087:0025 Intel Corp.

Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub




This are the two devices (lsusb):

Bus 001 Device 032: ID 0ccd:10a7 TerraTec Electronic GmbH TerraTec G3

Bus 001 Device 033: ID eb1a:2861 eMPIA Technology, Inc.



This are the details I acquire (lsusb -v):

Bus 001 Device 032: ID 0ccd:10a7 TerraTec Electronic GmbH TerraTec G3
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            0 
  bDeviceSubClass         0 
  bDeviceProtocol         0 
  bMaxPacketSize0        64
  idVendor           0x0ccd TerraTec Electronic GmbH
  idProduct          0x10a7 TerraTec G3
  bcdDevice            1.00
  iManufacturer           2 TerraTec Electronic GmbH
  iProduct                1 TerraTec G3
  iSerial                 0 
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x022b
    bNumInterfaces          3
    bConfigurationValue     1
    iConfiguration          0 
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              500mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           3
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      0 
      bInterfaceProtocol    255 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0001  1x 1 bytes
        bInterval              11
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0000  1x 0 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0000  1x 0 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       1
      bNumEndpoints           3
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      0 
      bInterfaceProtocol    255 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0001  1x 1 bytes
        bInterval              11
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0000  1x 0 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0000  1x 0 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       2
      bNumEndpoints           3
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      0 
      bInterfaceProtocol    255 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0001  1x 1 bytes
        bInterval              11
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0ad4  2x 724 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0000  1x 0 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       3
      bNumEndpoints           3
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      0 
      bInterfaceProtocol    255 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0001  1x 1 bytes
        bInterval              11
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0c00  2x 1024 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0000  1x 0 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       4
      bNumEndpoints           3
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      0 
      bInterfaceProtocol    255 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0001  1x 1 bytes
        bInterval              11
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x1300  3x 768 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0000  1x 0 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       5
      bNumEndpoints           3
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      0 
      bInterfaceProtocol    255 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0001  1x 1 bytes
        bInterval              11
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x135c  3x 860 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0000  1x 0 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       6
      bNumEndpoints           3
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      0 
      bInterfaceProtocol    255 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0001  1x 1 bytes
        bInterval              11
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x13c4  3x 964 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0000  1x 0 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       7
      bNumEndpoints           3
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      0 
      bInterfaceProtocol    255 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0001  1x 1 bytes
        bInterval              11
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x1400  3x 1024 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0000  1x 0 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      1 Control Device
      bInterfaceProtocol      0 
      iInterface              0 
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdADC               1.00
        wTotalLength       0x0027
        bInCollection           1
        baInterfaceNr(0)        2
      AudioControl Interface Descriptor:
        bLength                12
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID             1
        wTerminalType      0x0603 Line Connector
        bAssocTerminal          0
        bNrChannels             2
        wChannelConfig     0x0003
          Left Front (L)
          Right Front (R)
        iChannelNames           0 
        iTerminal               0 
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      6 (FEATURE_UNIT)
        bUnitID                 2
        bSourceID               1
        bControlSize            1
        bmaControls(0)       0x03
          Mute Control
          Volume Control
        bmaControls(1)       0x00
        iFeature                0 
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             3
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bSourceID               2
        iTerminal               0 
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0 
      iInterface              0 
      AudioStreaming Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink           3
        bDelay                  1 frames
        wFormatTag         0x0001 PCM
      AudioStreaming Interface Descriptor:
        bLength                11
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bNrChannels             2
        bSubframeSize           2
        bBitResolution         16
        bSamFreqType            1 Discrete
        tSamFreq[ 0]            0
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0000  1x 0 bytes
        bInterval               4
        bRefresh                0
        bSynchAddress           0
        AudioStreaming Endpoint Descriptor:
          bLength                 7
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x00
          bLockDelayUnits         0 Undefined
          wLockDelay         0x0000
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       1
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0 
      iInterface              0 
      AudioStreaming Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink           3
        bDelay                  1 frames
        wFormatTag         0x0001 PCM
      AudioStreaming Interface Descriptor:
        bLength                11
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bNrChannels             2
        bSubframeSize           2
        bBitResolution         16
        bSamFreqType            1 Discrete
        tSamFreq[ 0]        48000
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x00c4  1x 196 bytes
        bInterval               4
        bRefresh                0
        bSynchAddress           0
        AudioStreaming Endpoint Descriptor:
          bLength                 7
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x00
          bLockDelayUnits         0 Undefined
          wLockDelay         0x0000
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       2
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0 
      iInterface              0 
      AudioStreaming Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink           3
        bDelay                  1 frames
        wFormatTag         0x0001 PCM
      AudioStreaming Interface Descriptor:
        bLength                11
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bNrChannels             2
        bSubframeSize           2
        bBitResolution         16
        bSamFreqType            1 Discrete
        tSamFreq[ 0]        44100
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x00b4  1x 180 bytes
        bInterval               4
        bRefresh                0
        bSynchAddress           0
        AudioStreaming Endpoint Descriptor:
          bLength                 7
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x00
          bLockDelayUnits         0 Undefined
          wLockDelay         0x0000
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       3
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0 
      iInterface              0 
      AudioStreaming Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink           3
        bDelay                  1 frames
        wFormatTag         0x0001 PCM
      AudioStreaming Interface Descriptor:
        bLength                11
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bNrChannels             2
        bSubframeSize           2
        bBitResolution         16
        bSamFreqType            1 Discrete
        tSamFreq[ 0]        32000
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0084  1x 132 bytes
        bInterval               4
        bRefresh                0
        bSynchAddress           0
        AudioStreaming Endpoint Descriptor:
          bLength                 7
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x00
          bLockDelayUnits         0 Undefined
          wLockDelay         0x0000
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       4
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0 
      iInterface              0 
      AudioStreaming Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink           3
        bDelay                  1 frames
        wFormatTag         0x0001 PCM
      AudioStreaming Interface Descriptor:
        bLength                11
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bNrChannels             2
        bSubframeSize           2
        bBitResolution         16
        bSamFreqType            1 Discrete
        tSamFreq[ 0]        16000
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0044  1x 68 bytes
        bInterval               4
        bRefresh                0
        bSynchAddress           0
        AudioStreaming Endpoint Descriptor:
          bLength                 7
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x00
          bLockDelayUnits         0 Undefined
          wLockDelay         0x0000
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       5
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0 
      iInterface              0 
      AudioStreaming Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink           3
        bDelay                  1 frames
        wFormatTag         0x0001 PCM
      AudioStreaming Interface Descriptor:
        bLength                11
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bNrChannels             2
        bSubframeSize           2
        bBitResolution         16
        bSamFreqType            1 Discrete
        tSamFreq[ 0]         8000
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0024  1x 36 bytes
        bInterval               4
        bRefresh                0
        bSynchAddress           0
        AudioStreaming Endpoint Descriptor:
          bLength                 7
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x00
          bLockDelayUnits         0 Undefined
          wLockDelay         0x0000
Device Qualifier (for other device speed):
  bLength                10
  bDescriptorType         6
  bcdUSB               2.00
  bDeviceClass            0 
  bDeviceSubClass         0 
  bDeviceProtocol         0 
  bMaxPacketSize0        64
  bNumConfigurations      1
Device Status:     0x0000
  (Bus Powered)

Bus 001 Device 033: ID eb1a:2861 eMPIA Technology, Inc. 
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            0 
  bDeviceSubClass         0 
  bDeviceProtocol         0 
  bMaxPacketSize0        64
  idVendor           0xeb1a eMPIA Technology, Inc.
  idProduct          0x2861 
  bcdDevice            1.00
  iManufacturer           0 
  iProduct                0 
  iSerial                 0 
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x022b
    bNumInterfaces          3
    bConfigurationValue     1
    iConfiguration          0 
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              500mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           3
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      0 
      bInterfaceProtocol    255 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0001  1x 1 bytes
        bInterval              11
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0000  1x 0 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0000  1x 0 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       1
      bNumEndpoints           3
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      0 
      bInterfaceProtocol    255 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0001  1x 1 bytes
        bInterval              11
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0000  1x 0 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0000  1x 0 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       2
      bNumEndpoints           3
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      0 
      bInterfaceProtocol    255 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0001  1x 1 bytes
        bInterval              11
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0ad4  2x 724 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0000  1x 0 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       3
      bNumEndpoints           3
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      0 
      bInterfaceProtocol    255 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0001  1x 1 bytes
        bInterval              11
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0c00  2x 1024 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0000  1x 0 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       4
      bNumEndpoints           3
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      0 
      bInterfaceProtocol    255 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0001  1x 1 bytes
        bInterval              11
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x1300  3x 768 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0000  1x 0 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       5
      bNumEndpoints           3
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      0 
      bInterfaceProtocol    255 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0001  1x 1 bytes
        bInterval              11
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x135c  3x 860 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0000  1x 0 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       6
      bNumEndpoints           3
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      0 
      bInterfaceProtocol    255 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0001  1x 1 bytes
        bInterval              11
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x13c4  3x 964 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0000  1x 0 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       7
      bNumEndpoints           3
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      0 
      bInterfaceProtocol    255 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0001  1x 1 bytes
        bInterval              11
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x1400  3x 1024 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0000  1x 0 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      1 Control Device
      bInterfaceProtocol      0 
      iInterface              0 
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdADC               1.00
        wTotalLength       0x0027
        bInCollection           1
        baInterfaceNr(0)        2
      AudioControl Interface Descriptor:
        bLength                12
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID             1
        wTerminalType      0x0603 Line Connector
        bAssocTerminal          0
        bNrChannels             2
        wChannelConfig     0x0003
          Left Front (L)
          Right Front (R)
        iChannelNames           0 
        iTerminal               0 
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      6 (FEATURE_UNIT)
        bUnitID                 2
        bSourceID               1
        bControlSize            1
        bmaControls(0)       0x03
          Mute Control
          Volume Control
        bmaControls(1)       0x00
        iFeature                0 
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             3
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bSourceID               2
        iTerminal               0 
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0 
      iInterface              0 
      AudioStreaming Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink           3
        bDelay                  1 frames
        wFormatTag         0x0001 PCM
      AudioStreaming Interface Descriptor:
        bLength                11
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bNrChannels             2
        bSubframeSize           2
        bBitResolution         16
        bSamFreqType            1 Discrete
        tSamFreq[ 0]            0
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0000  1x 0 bytes
        bInterval               4
        bRefresh                0
        bSynchAddress           0
        AudioStreaming Endpoint Descriptor:
          bLength                 7
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x00
          bLockDelayUnits         0 Undefined
          wLockDelay         0x0000
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       1
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0 
      iInterface              0 
      AudioStreaming Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink           3
        bDelay                  1 frames
        wFormatTag         0x0001 PCM
      AudioStreaming Interface Descriptor:
        bLength                11
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bNrChannels             2
        bSubframeSize           2
        bBitResolution         16
        bSamFreqType            1 Discrete
        tSamFreq[ 0]        48000
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x00c4  1x 196 bytes
        bInterval               4
        bRefresh                0
        bSynchAddress           0
        AudioStreaming Endpoint Descriptor:
          bLength                 7
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x00
          bLockDelayUnits         0 Undefined
          wLockDelay         0x0000
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       2
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0 
      iInterface              0 
      AudioStreaming Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink           3
        bDelay                  1 frames
        wFormatTag         0x0001 PCM
      AudioStreaming Interface Descriptor:
        bLength                11
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bNrChannels             2
        bSubframeSize           2
        bBitResolution         16
        bSamFreqType            1 Discrete
        tSamFreq[ 0]        44100
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x00b4  1x 180 bytes
        bInterval               4
        bRefresh                0
        bSynchAddress           0
        AudioStreaming Endpoint Descriptor:
          bLength                 7
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x00
          bLockDelayUnits         0 Undefined
          wLockDelay         0x0000
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       3
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0 
      iInterface              0 
      AudioStreaming Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink           3
        bDelay                  1 frames
        wFormatTag         0x0001 PCM
      AudioStreaming Interface Descriptor:
        bLength                11
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bNrChannels             2
        bSubframeSize           2
        bBitResolution         16
        bSamFreqType            1 Discrete
        tSamFreq[ 0]        32000
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0084  1x 132 bytes
        bInterval               4
        bRefresh                0
        bSynchAddress           0
        AudioStreaming Endpoint Descriptor:
          bLength                 7
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x00
          bLockDelayUnits         0 Undefined
          wLockDelay         0x0000
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       4
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0 
      iInterface              0 
      AudioStreaming Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink           3
        bDelay                  1 frames
        wFormatTag         0x0001 PCM
      AudioStreaming Interface Descriptor:
        bLength                11
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bNrChannels             2
        bSubframeSize           2
        bBitResolution         16
        bSamFreqType            1 Discrete
        tSamFreq[ 0]        16000
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0044  1x 68 bytes
        bInterval               4
        bRefresh                0
        bSynchAddress           0
        AudioStreaming Endpoint Descriptor:
          bLength                 7
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x00
          bLockDelayUnits         0 Undefined
          wLockDelay         0x0000
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       5
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0 
      iInterface              0 
      AudioStreaming Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink           3
        bDelay                  1 frames
        wFormatTag         0x0001 PCM
      AudioStreaming Interface Descriptor:
        bLength                11
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bNrChannels             2
        bSubframeSize           2
        bBitResolution         16
        bSamFreqType            1 Discrete
        tSamFreq[ 0]         8000
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0024  1x 36 bytes
        bInterval               4
        bRefresh                0
        bSynchAddress           0
        AudioStreaming Endpoint Descriptor:
          bLength                 7
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x00
          bLockDelayUnits         0 Undefined
          wLockDelay         0x0000
Device Qualifier (for other device speed):
  bLength                10
  bDescriptorType         6
  bcdUSB               2.00
  bDeviceClass            0 
  bDeviceSubClass         0 
  bDeviceProtocol         0 
  bMaxPacketSize0        64
  bNumConfigurations      1
Device Status:     0x0000
  (Bus Powered)


Kernel output via dmesg is following:


UNPLUGGING and REPLUGGING the "Bus 001 Device 033: ID eb1a:2861 eMPIA
Technology, Inc."


[254761.818252] em28xx 1-11:1.1: audio device (eb1a:2861): interface 1,
class 1

[255035.063214] usb 1-14: USB disconnect, device number 32

[255042.469713] usb 1-14: new high-speed USB device number 36 using
xhci_hcd

[255042.638126] usb 1-14: config 1 interface 0 altsetting 1 endpoint
0x82 has invalid wMaxPacketSize 0

[255042.638130] usb 1-14: config 1 interface 0 altsetting 1 endpoint
0x84 has invalid wMaxPacketSize 0

[255042.638133] usb 1-14: config 1 interface 0 altsetting 2 endpoint
0x84 has invalid wMaxPacketSize 0

[255042.638136] usb 1-14: config 1 interface 0 altsetting 3 endpoint
0x84 has invalid wMaxPacketSize 0

[255042.638139] usb 1-14: config 1 interface 0 altsetting 4 endpoint
0x84 has invalid wMaxPacketSize 0

[255042.638141] usb 1-14: config 1 interface 0 altsetting 5 endpoint
0x84 has invalid wMaxPacketSize 0

[255042.638144] usb 1-14: config 1 interface 0 altsetting 6 endpoint
0x84 has invalid wMaxPacketSize 0

[255042.638147] usb 1-14: config 1 interface 0 altsetting 7 endpoint
0x84 has invalid wMaxPacketSize 0

[255042.653117] usb 1-14: New USB device found, idVendor=0ccd,
idProduct=10a7, bcdDevice= 1.00

[255042.653121] usb 1-14: New USB device strings: Mfr=2, Product=1,
SerialNumber=0

[255042.653123] usb 1-14: Product: TerraTec G3

[255042.653125] usb 1-14: Manufacturer: TerraTec Electronic GmbH



UNPLUGGING and REPLUGGING the "Bus 001 Device 033: ID eb1a:2861 eMPIA
Technology, Inc."[254757.638664] usb 1-11: USB disconnect, device
number 34[254757.638766] em28xx 1-11:1.0: Disconnecting
em28xx[254757.638664] usb 1-11: USB disconnect, device number 34

[254757.638766] em28xx 1-11:1.0: Disconnecting em28xx
[254757.638973] em28xx 1-11:1.0: Freeing device
[254760.503094] usb 1-11: new high-speed USB device number 35 using
xhci_hcd
[254760.675316] usb 1-11: config 1 interface 0 altsetting 1 endpoint
0x82 has invalid wMaxPacketSize 0
[254760.675319] usb 1-11: config 1 interface 0 altsetting 1 endpoint
0x84 has invalid wMaxPacketSize 0
[254760.675321] usb 1-11: config 1 interface 0 altsetting 2 endpoint
0x84 has invalid wMaxPacketSize 0
[254760.675323] usb 1-11: config 1 interface 0 altsetting 3 endpoint
0x84 has invalid wMaxPacketSize 0
[254760.675324] usb 1-11: config 1 interface 0 altsetting 4 endpoint
0x84 has invalid wMaxPacketSize 0
[254760.675326] usb 1-11: config 1 interface 0 altsetting 5 endpoint
0x84 has invalid wMaxPacketSize 0
[254760.675327] usb 1-11: config 1 interface 0 altsetting 6 endpoint
0x84 has invalid wMaxPacketSize 0
[254760.675329] usb 1-11: config 1 interface 0 altsetting 7 endpoint
0x84 has invalid wMaxPacketSize 0
[254760.675335] usb 1-11: New USB device found, idVendor=eb1a,
idProduct=2861, bcdDevice= 1.00
[254760.675336] usb 1-11: New USB device strings: Mfr=0, Product=0,
SerialNumber=0
[254760.683356] em28xx 1-11:1.0: New device   @ 480 Mbps (eb1a:2861,
interface 0, class 0)
[254760.683358] em28xx 1-11:1.0: Video interface 0 found: isoc
[254760.749311] em28xx 1-11:1.0: chip ID is em2860
[254760.913343] em28xx 1-11:1.0: unknown eeprom format or eeprom
corrupted !
[254761.049362] em28xx 1-11:1.0: No sensor detected
[254761.535439] em28xx 1-11:1.0: found i2c device @ 0xa0 on bus 0
[eeprom]
[254761.607457] em28xx 1-11:1.0: found i2c device @ 0xb8 on bus 0
[tvp5150a]
[254761.817499] em28xx 1-11:1.0: Your board has no unique USB ID and
thus need a hint to be detected.
                You may try to use card=<n> insmod option to workaround
that.
                Please send an email with this log to:
                	V4L Mailing List <linux-media@vger.kernel.org>
                Board eeprom hash is 0x00000000
                Board i2c devicelist hash is 0x27800080
[254761.817506] em28xx 1-11:1.0: Here is a list of valid choices for
the card=<n> insmod option:
[254761.817510] em28xx 1-11:1.0:     card=0 -> Unknown EM2800 video
grabber
[254761.817513] em28xx 1-11:1.0:     card=1 -> Unknown EM2750/28xx
video grabber
[254761.817516] em28xx 1-11:1.0:     card=2 -> Terratec Cinergy 250 USB
[254761.817519] em28xx 1-11:1.0:     card=3 -> Pinnacle PCTV USB 2
[254761.817521] em28xx 1-11:1.0:     card=4 -> Hauppauge WinTV USB 2
[254761.817524] em28xx 1-11:1.0:     card=5 -> MSI VOX USB 2.0
[254761.817526] em28xx 1-11:1.0:     card=6 -> Terratec Cinergy 200 USB
[254761.817529] em28xx 1-11:1.0:     card=7 -> Leadtek Winfast USB II
[254761.817531] em28xx 1-11:1.0:     card=8 -> Kworld USB2800
[254761.817534] em28xx 1-11:1.0:     card=9 -> Pinnacle Dazzle DVC
90/100/101/107 / Kaiser Baas Video to DVD maker / Kworld DVD Maker 2 /
Plextor ConvertX PX-AV100U
[254761.817537] em28xx 1-11:1.0:     card=10 -> Hauppauge WinTV HVR 900
[254761.817539] em28xx 1-11:1.0:     card=11 -> Terratec Hybrid XS
[254761.817542] em28xx 1-11:1.0:     card=12 -> Kworld PVR TV 2800 RF
[254761.817544] em28xx 1-11:1.0:     card=13 -> Terratec Prodigy XS
[254761.817546] em28xx 1-11:1.0:     card=14 -> SIIG AVTuner-PVR /
Pixelview Prolink PlayTV USB 2.0
[254761.817549] em28xx 1-11:1.0:     card=15 -> V-Gear PocketTV
[254761.817551] em28xx 1-11:1.0:     card=16 -> Hauppauge WinTV HVR 950
[254761.817553] em28xx 1-11:1.0:     card=17 -> Pinnacle PCTV HD Pro
Stick
[254761.817556] em28xx 1-11:1.0:     card=18 -> Hauppauge WinTV HVR 900
(R2)
[254761.817558] em28xx 1-11:1.0:     card=19 -> EM2860/SAA711X
Reference Design
[254761.817560] em28xx 1-11:1.0:     card=20 -> AMD ATI TV Wonder HD
600
[254761.817563] em28xx 1-11:1.0:     card=21 -> eMPIA Technology, Inc.
GrabBeeX+ Video Encoder
[254761.817565] em28xx 1-11:1.0:     card=22 -> EM2710/EM2750/EM2751
webcam grabber
[254761.817567] em28xx 1-11:1.0:     card=23 -> Huaqi DLCW-130
[254761.817570] em28xx 1-11:1.0:     card=24 -> D-Link DUB-T210 TV
Tuner
[254761.817572] em28xx 1-11:1.0:     card=25 -> Gadmei UTV310
[254761.817574] em28xx 1-11:1.0:     card=26 -> Hercules Smart TV USB
2.0
[254761.817577] em28xx 1-11:1.0:     card=27 -> Pinnacle PCTV USB 2
(Philips FM1216ME)
[254761.817579] em28xx 1-11:1.0:     card=28 -> Leadtek Winfast USB II
Deluxe
[254761.817581] em28xx 1-11:1.0:     card=29 -> EM2860/TVP5150
Reference Design
[254761.817584] em28xx 1-11:1.0:     card=30 -> Videology 20K14XUSB
USB2.0
[254761.817586] em28xx 1-11:1.0:     card=31 -> Usbgear VD204v9
[254761.817588] em28xx 1-11:1.0:     card=32 -> Supercomp USB 2.0 TV
[254761.817590] em28xx 1-11:1.0:     card=33 -> Elgato Video Capture
[254761.817593] em28xx 1-11:1.0:     card=34 -> Terratec Cinergy A
Hybrid XS
[254761.817595] em28xx 1-11:1.0:     card=35 -> Typhoon DVD Maker
[254761.817597] em28xx 1-11:1.0:     card=36 -> NetGMBH Cam
[254761.817600] em28xx 1-11:1.0:     card=37 -> Gadmei UTV330
[254761.817602] em28xx 1-11:1.0:     card=38 -> Yakumo MovieMixer
[254761.817604] em28xx 1-11:1.0:     card=39 -> KWorld PVRTV 300U
[254761.817606] em28xx 1-11:1.0:     card=40 -> Plextor ConvertX PX-
TV100U
[254761.817609] em28xx 1-11:1.0:     card=41 -> Kworld 350 U DVB-T
[254761.817611] em28xx 1-11:1.0:     card=42 -> Kworld 355 U DVB-T
[254761.817613] em28xx 1-11:1.0:     card=43 -> Terratec Cinergy T XS
[254761.817616] em28xx 1-11:1.0:     card=44 -> Terratec Cinergy T XS
(MT2060)
[254761.817618] em28xx 1-11:1.0:     card=45 -> Pinnacle PCTV DVB-T
[254761.817620] em28xx 1-11:1.0:     card=46 -> Compro, VideoMate U3
[254761.817622] em28xx 1-11:1.0:     card=47 -> KWorld DVB-T 305U
[254761.817625] em28xx 1-11:1.0:     card=48 -> KWorld DVB-T 310U
[254761.817627] em28xx 1-11:1.0:     card=49 -> MSI DigiVox A/D
[254761.817629] em28xx 1-11:1.0:     card=50 -> MSI DigiVox A/D II
[254761.817632] em28xx 1-11:1.0:     card=51 -> Terratec Hybrid XS
Secam
[254761.817634] em28xx 1-11:1.0:     card=52 -> DNT DA2 Hybrid
[254761.817636] em28xx 1-11:1.0:     card=53 -> Pinnacle Hybrid Pro
[254761.817638] em28xx 1-11:1.0:     card=54 -> Kworld VS-DVB-T 323UR
[254761.817641] em28xx 1-11:1.0:     card=55 -> Terratec Cinergy Hybrid
T USB XS (em2882)
[254761.817643] em28xx 1-11:1.0:     card=56 -> Pinnacle Hybrid Pro
(330e)
[254761.817645] em28xx 1-11:1.0:     card=57 -> Kworld PlusTV HD Hybrid
330
[254761.817648] em28xx 1-11:1.0:     card=58 -> Compro VideoMate
ForYou/Stereo
[254761.817650] em28xx 1-11:1.0:     card=59 -> Pinnacle PCTV HD Mini
[254761.817652] em28xx 1-11:1.0:     card=60 -> Hauppauge WinTV HVR 850
[254761.817655] em28xx 1-11:1.0:     card=61 -> Pixelview PlayTV Box 4
USB 2.0
[254761.817657] em28xx 1-11:1.0:     card=62 -> Gadmei TVR200
[254761.817659] em28xx 1-11:1.0:     card=63 -> Kaiomy TVnPC U2
[254761.817661] em28xx 1-11:1.0:     card=64 -> Easy Cap Capture DC-60
[254761.817664] em28xx 1-11:1.0:     card=65 -> IO-DATA GV-MVP/SZ
[254761.817666] em28xx 1-11:1.0:     card=66 -> Empire dual TV
[254761.817668] em28xx 1-11:1.0:     card=67 -> Terratec Grabby
[254761.817670] em28xx 1-11:1.0:     card=68 -> Terratec AV350
[254761.817673] em28xx 1-11:1.0:     card=69 -> KWorld ATSC 315U HDTV
TV Box
[254761.817675] em28xx 1-11:1.0:     card=70 -> Evga inDtube
[254761.817677] em28xx 1-11:1.0:     card=71 -> Silvercrest Webcam
1.3mpix
[254761.817680] em28xx 1-11:1.0:     card=72 -> Gadmei UTV330+
[254761.817682] em28xx 1-11:1.0:     card=73 -> Reddo DVB-C USB TV Box
[254761.817684] em28xx 1-11:1.0:     card=74 ->
Actionmaster/LinXcel/Digitus VC211A
[254761.817686] em28xx 1-11:1.0:     card=75 -> Dikom DK300
[254761.817689] em28xx 1-11:1.0:     card=76 -> KWorld PlusTV 340U or
UB435-Q (ATSC)
[254761.817691] em28xx 1-11:1.0:     card=77 -> EM2874 Leadership ISDBT
[254761.817693] em28xx 1-11:1.0:     card=78 -> PCTV nanoStick T2 290e
[254761.817696] em28xx 1-11:1.0:     card=79 -> Terratec Cinergy H5
[254761.817698] em28xx 1-11:1.0:     card=80 -> PCTV DVB-S2 Stick
(460e)
[254761.817700] em28xx 1-11:1.0:     card=81 -> Hauppauge WinTV HVR
930C
[254761.817702] em28xx 1-11:1.0:     card=82 -> Terratec Cinergy HTC
Stick
[254761.817705] em28xx 1-11:1.0:     card=83 -> Honestech Vidbox NW03
[254761.817707] em28xx 1-11:1.0:     card=84 -> MaxMedia UB425-TC
[254761.817709] em28xx 1-11:1.0:     card=85 -> PCTV QuatroStick (510e)
[254761.817712] em28xx 1-11:1.0:     card=86 -> PCTV QuatroStick nano
(520e)
[254761.817714] em28xx 1-11:1.0:     card=87 -> Terratec Cinergy HTC
USB XS
[254761.817716] em28xx 1-11:1.0:     card=88 -> C3 Tech Digital Duo
HDTV/SDTV USB
[254761.817719] em28xx 1-11:1.0:     card=89 -> Delock 61959
[254761.817721] em28xx 1-11:1.0:     card=90 -> KWorld USB ATSC TV
Stick UB435-Q V2
[254761.817723] em28xx 1-11:1.0:     card=91 -> SpeedLink Vicious And
Devine Laplace webcam
[254761.817726] em28xx 1-11:1.0:     card=92 -> PCTV DVB-S2 Stick
(461e)
[254761.817728] em28xx 1-11:1.0:     card=93 -> KWorld USB ATSC TV
Stick UB435-Q V3
[254761.817730] em28xx 1-11:1.0:     card=94 -> PCTV tripleStick (292e)
[254761.817732] em28xx 1-11:1.0:     card=95 -> Leadtek VC100
[254761.817735] em28xx 1-11:1.0:     card=96 -> Terratec Cinergy T2
Stick HD
[254761.817737] em28xx 1-11:1.0:     card=97 -> Elgato EyeTV Hybrid
2008 INT
[254761.817739] em28xx 1-11:1.0:     card=98 -> PLEX PX-BCUD
[254761.817742] em28xx 1-11:1.0:     card=99 -> Hauppauge WinTV-dualHD
DVB
[254761.817744] em28xx 1-11:1.0:     card=100 -> Hauppauge WinTV-dualHD 
01595 ATSC/QAM
[254761.817747] em28xx 1-11:1.0:     card=101 -> Terratec Cinergy H6
rev. 2
[254761.817749] em28xx 1-11:1.0:     card=102 -> :ZOLID HYBRID TV STICK
[254761.817751] em28xx 1-11:1.0:     card=103 -> Magix USB
Videowandler-2
[254761.817754] em28xx 1-11:1.0:     card=104 -> PCTV DVB-S2 Stick
(461e v2)
[254761.817756] em28xx 1-11:1.0: Board not discovered
[254761.817759] em28xx 1-11:1.0: Identified as Unknown EM2750/28xx
video grabber (card=1)
[254761.817762] em28xx 1-11:1.0: Your board has no unique USB ID and
thus need a hint to be detected.
                You may try to use card=<n> insmod option to workaround
that.
                Please send an email with this log to:
                	V4L Mailing List <linux-media@vger.kernel.org>
                Board eeprom hash is 0x00000000
                Board i2c devicelist hash is 0x27800080
[254761.817765] em28xx 1-11:1.0: Here is a list of valid choices for
the card=<n> insmod option:
[254761.817768] em28xx 1-11:1.0:     card=0 -> Unknown EM2800 video
grabber
[254761.817770] em28xx 1-11:1.0:     card=1 -> Unknown EM2750/28xx
video grabber
[254761.817773] em28xx 1-11:1.0:     card=2 -> Terratec Cinergy 250 USB
[254761.817775] em28xx 1-11:1.0:     card=3 -> Pinnacle PCTV USB 2
[254761.817777] em28xx 1-11:1.0:     card=4 -> Hauppauge WinTV USB 2
[254761.817779] em28xx 1-11:1.0:     card=5 -> MSI VOX USB 2.0
[254761.817782] em28xx 1-11:1.0:     card=6 -> Terratec Cinergy 200 USB
[254761.817784] em28xx 1-11:1.0:     card=7 -> Leadtek Winfast USB II
[254761.817786] em28xx 1-11:1.0:     card=8 -> Kworld USB2800
[254761.817789] em28xx 1-11:1.0:     card=9 -> Pinnacle Dazzle DVC
90/100/101/107 / Kaiser Baas Video to DVD maker / Kworld DVD Maker 2 /
Plextor ConvertX PX-AV100U
[254761.817791] em28xx 1-11:1.0:     card=10 -> Hauppauge WinTV HVR 900
[254761.817794] em28xx 1-11:1.0:     card=11 -> Terratec Hybrid XS
[254761.817796] em28xx 1-11:1.0:     card=12 -> Kworld PVR TV 2800 RF
[254761.817798] em28xx 1-11:1.0:     card=13 -> Terratec Prodigy XS
[254761.817801] em28xx 1-11:1.0:     card=14 -> SIIG AVTuner-PVR /
Pixelview Prolink PlayTV USB 2.0
[254761.817803] em28xx 1-11:1.0:     card=15 -> V-Gear PocketTV
[254761.817805] em28xx 1-11:1.0:     card=16 -> Hauppauge WinTV HVR 950
[254761.817807] em28xx 1-11:1.0:     card=17 -> Pinnacle PCTV HD Pro
Stick
[254761.817810] em28xx 1-11:1.0:     card=18 -> Hauppauge WinTV HVR 900
(R2)
[254761.817812] em28xx 1-11:1.0:     card=19 -> EM2860/SAA711X
Reference Design
[254761.817814] em28xx 1-11:1.0:     card=20 -> AMD ATI TV Wonder HD
600
[254761.817817] em28xx 1-11:1.0:     card=21 -> eMPIA Technology, Inc.
GrabBeeX+ Video Encoder
[254761.817819] em28xx 1-11:1.0:     card=22 -> EM2710/EM2750/EM2751
webcam grabber
[254761.817821] em28xx 1-11:1.0:     card=23 -> Huaqi DLCW-130
[254761.817824] em28xx 1-11:1.0:     card=24 -> D-Link DUB-T210 TV
Tuner
[254761.817826] em28xx 1-11:1.0:     card=25 -> Gadmei UTV310
[254761.817828] em28xx 1-11:1.0:     card=26 -> Hercules Smart TV USB
2.0
[254761.817831] em28xx 1-11:1.0:     card=27 -> Pinnacle PCTV USB 2
(Philips FM1216ME)
[254761.817833] em28xx 1-11:1.0:     card=28 -> Leadtek Winfast USB II
Deluxe
[254761.817835] em28xx 1-11:1.0:     card=29 -> EM2860/TVP5150
Reference Design
[254761.817838] em28xx 1-11:1.0:     card=30 -> Videology 20K14XUSB
USB2.0
[254761.817840] em28xx 1-11:1.0:     card=31 -> Usbgear VD204v9
[254761.817842] em28xx 1-11:1.0:     card=32 -> Supercomp USB 2.0 TV
[254761.817844] em28xx 1-11:1.0:     card=33 -> Elgato Video Capture
[254761.817847] em28xx 1-11:1.0:     card=34 -> Terratec Cinergy A
Hybrid XS
[254761.817849] em28xx 1-11:1.0:     card=35 -> Typhoon DVD Maker
[254761.817851] em28xx 1-11:1.0:     card=36 -> NetGMBH Cam
[254761.817853] em28xx 1-11:1.0:     card=37 -> Gadmei UTV330
[254761.817856] em28xx 1-11:1.0:     card=38 -> Yakumo MovieMixer
[254761.817858] em28xx 1-11:1.0:     card=39 -> KWorld PVRTV 300U
[254761.817860] em28xx 1-11:1.0:     card=40 -> Plextor ConvertX PX-
TV100U
[254761.817863] em28xx 1-11:1.0:     card=41 -> Kworld 350 U DVB-T
[254761.817865] em28xx 1-11:1.0:     card=42 -> Kworld 355 U DVB-T
[254761.817867] em28xx 1-11:1.0:     card=43 -> Terratec Cinergy T XS
[254761.817870] em28xx 1-11:1.0:     card=44 -> Terratec Cinergy T XS
(MT2060)
[254761.817872] em28xx 1-11:1.0:     card=45 -> Pinnacle PCTV DVB-T
[254761.817874] em28xx 1-11:1.0:     card=46 -> Compro, VideoMate U3
[254761.817876] em28xx 1-11:1.0:     card=47 -> KWorld DVB-T 305U
[254761.817879] em28xx 1-11:1.0:     card=48 -> KWorld DVB-T 310U
[254761.817881] em28xx 1-11:1.0:     card=49 -> MSI DigiVox A/D
[254761.817883] em28xx 1-11:1.0:     card=50 -> MSI DigiVox A/D II
[254761.817886] em28xx 1-11:1.0:     card=51 -> Terratec Hybrid XS
Secam
[254761.817888] em28xx 1-11:1.0:     card=52 -> DNT DA2 Hybrid
[254761.817890] em28xx 1-11:1.0:     card=53 -> Pinnacle Hybrid Pro
[254761.817893] em28xx 1-11:1.0:     card=54 -> Kworld VS-DVB-T 323UR
[254761.817895] em28xx 1-11:1.0:     card=55 -> Terratec Cinergy Hybrid
T USB XS (em2882)
[254761.817897] em28xx 1-11:1.0:     card=56 -> Pinnacle Hybrid Pro
(330e)
[254761.817900] em28xx 1-11:1.0:     card=57 -> Kworld PlusTV HD Hybrid
330
[254761.817902] em28xx 1-11:1.0:     card=58 -> Compro VideoMate
ForYou/Stereo
[254761.817904] em28xx 1-11:1.0:     card=59 -> Pinnacle PCTV HD Mini
[254761.817906] em28xx 1-11:1.0:     card=60 -> Hauppauge WinTV HVR 850
[254761.817909] em28xx 1-11:1.0:     card=61 -> Pixelview PlayTV Box 4
USB 2.0
[254761.817911] em28xx 1-11:1.0:     card=62 -> Gadmei TVR200
[254761.817913] em28xx 1-11:1.0:     card=63 -> Kaiomy TVnPC U2
[254761.817916] em28xx 1-11:1.0:     card=64 -> Easy Cap Capture DC-60
[254761.817918] em28xx 1-11:1.0:     card=65 -> IO-DATA GV-MVP/SZ
[254761.817920] em28xx 1-11:1.0:     card=66 -> Empire dual TV
[254761.817922] em28xx 1-11:1.0:     card=67 -> Terratec Grabby
[254761.817925] em28xx 1-11:1.0:     card=68 -> Terratec AV350
[254761.817927] em28xx 1-11:1.0:     card=69 -> KWorld ATSC 315U HDTV
TV Box
[254761.817929] em28xx 1-11:1.0:     card=70 -> Evga inDtube
[254761.817932] em28xx 1-11:1.0:     card=71 -> Silvercrest Webcam
1.3mpix
[254761.817934] em28xx 1-11:1.0:     card=72 -> Gadmei UTV330+
[254761.817936] em28xx 1-11:1.0:     card=73 -> Reddo DVB-C USB TV Box
[254761.817938] em28xx 1-11:1.0:     card=74 ->
Actionmaster/LinXcel/Digitus VC211A
[254761.817941] em28xx 1-11:1.0:     card=75 -> Dikom DK300
[254761.817943] em28xx 1-11:1.0:     card=76 -> KWorld PlusTV 340U or
UB435-Q (ATSC)
[254761.817945] em28xx 1-11:1.0:     card=77 -> EM2874 Leadership ISDBT
[254761.817948] em28xx 1-11:1.0:     card=78 -> PCTV nanoStick T2 290e
[254761.817950] em28xx 1-11:1.0:     card=79 -> Terratec Cinergy H5
[254761.817952] em28xx 1-11:1.0:     card=80 -> PCTV DVB-S2 Stick
(460e)
[254761.817954] em28xx 1-11:1.0:     card=81 -> Hauppauge WinTV HVR
930C
[254761.817957] em28xx 1-11:1.0:     card=82 -> Terratec Cinergy HTC
Stick
[254761.817959] em28xx 1-11:1.0:     card=83 -> Honestech Vidbox NW03
[254761.817961] em28xx 1-11:1.0:     card=84 -> MaxMedia UB425-TC
[254761.817964] em28xx 1-11:1.0:     card=85 -> PCTV QuatroStick (510e)
[254761.817966] em28xx 1-11:1.0:     card=86 -> PCTV QuatroStick nano
(520e)
[254761.817968] em28xx 1-11:1.0:     card=87 -> Terratec Cinergy HTC
USB XS
[254761.817971] em28xx 1-11:1.0:     card=88 -> C3 Tech Digital Duo
HDTV/SDTV USB
[254761.817973] em28xx 1-11:1.0:     card=89 -> Delock 61959
[254761.817975] em28xx 1-11:1.0:     card=90 -> KWorld USB ATSC TV
Stick UB435-Q V2
[254761.817977] em28xx 1-11:1.0:     card=91 -> SpeedLink Vicious And
Devine Laplace webcam
[254761.817980] em28xx 1-11:1.0:     card=92 -> PCTV DVB-S2 Stick
(461e)
[254761.817982] em28xx 1-11:1.0:     card=93 -> KWorld USB ATSC TV
Stick UB435-Q V3
[254761.817984] em28xx 1-11:1.0:     card=94 -> PCTV tripleStick (292e)
[254761.817987] em28xx 1-11:1.0:     card=95 -> Leadtek VC100
[254761.817989] em28xx 1-11:1.0:     card=96 -> Terratec Cinergy T2
Stick HD
[254761.817991] em28xx 1-11:1.0:     card=97 -> Elgato EyeTV Hybrid
2008 INT
[254761.817993] em28xx 1-11:1.0:     card=98 -> PLEX PX-BCUD
[254761.817996] em28xx 1-11:1.0:     card=99 -> Hauppauge WinTV-dualHD
DVB
[254761.817998] em28xx 1-11:1.0:     card=100 -> Hauppauge WinTV-dualHD 
01595 ATSC/QAM
[254761.818001] em28xx 1-11:1.0:     card=101 -> Terratec Cinergy H6
rev. 2
[254761.818003] em28xx 1-11:1.0:     card=102 -> :ZOLID HYBRID TV STICK
[254761.818005] em28xx 1-11:1.0:     card=103 -> Magix USB
Videowandler-2
[254761.818007] em28xx 1-11:1.0:     card=104 -> PCTV DVB-S2 Stick
(461e v2)
[254761.818010] em28xx 1-11:1.0: Currently, V4L2 is not supported on
this model

BEST REGARDS, 
ERDINC

