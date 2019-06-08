Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB8093A026
	for <lists+linux-media@lfdr.de>; Sat,  8 Jun 2019 16:03:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726984AbfFHODl convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Sat, 8 Jun 2019 10:03:41 -0400
Received: from smtp5.rug.nl ([129.125.60.5]:59083 "EHLO smtp5.rug.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726227AbfFHODl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 8 Jun 2019 10:03:41 -0400
Received: from mail-ed1-f72.google.com ([172.23.16.207])
        by smtp5.rug.nl (8.14.9/8.14.9) with ESMTP id x58E3ex6012492
        for <linux-media@vger.kernel.org>; Sat, 8 Jun 2019 16:03:40 +0200
Received: by mail-ed1-f72.google.com with SMTP id a21so6941036edt.23
        for <linux-media@vger.kernel.org>; Sat, 08 Jun 2019 07:03:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:content-transfer-encoding:mime-version
         :subject:message-id:date:to;
        bh=giVUqx5EMS40nGBbLiHgo0shyW8PHduuF9+2x3MC1JA=;
        b=GZKYDLdxzQPnzVV057PvILPns+s09v2FUQMgJ0jEbLm6RJphvgE8rECjB8rSVwlsCf
         M9CPsHWXXWp2x7rPkudD68vDwvq1N7v4iO9Ba0ITUPKSGyA7qFGHfsLdIsxH+OpqEDnI
         G+WQAXjngthXKh510mOrt3maRZi6DVMlQi5eWxe/brZMBT5aU3Pj5je/9S86DFIIVfeT
         uNXEiUcmrjdHDjxtjRrGBqI4mfjFG/Sw2tP2T7QcWt10VnVYWe5P6KeLI6PXgCHJrwFc
         qfxOvPL/jwuT5CldTdk3NXb0QoTP3tpXh9eZs20zSjvsGnct/YgUl5EAX81GvxsEchM5
         dMLA==
X-Gm-Message-State: APjAAAU6rHIJVY6Rf2F7WvzQGFDKTW6ychBP32vT3lCcz2t+0KuDTKqv
        1716PZGJlk7AbmhFHpOooYIIkqDwgfbbSuwWMq4BouamueKTEiX1d1ldBrLlFMbA0wTlGDkIeel
        gmq6USV1rSMoaBivqQnv2FcQ=
X-Received: by 2002:aa7:d617:: with SMTP id c23mr62602241edr.74.1560002619602;
        Sat, 08 Jun 2019 07:03:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwEpscVPa7K/yYtON1AZDRfnS762dgSELL9NpnYOA0s2zY5cFCTWkSpA5OwRKRKB8yt2vpEhw==
X-Received: by 2002:aa7:d617:: with SMTP id c23mr62602211edr.74.1560002619382;
        Sat, 08 Jun 2019 07:03:39 -0700 (PDT)
Received: from [10.120.130.111] (82-73-193-150.cable.dynamic.v4.ziggo.nl. [82.73.193.150])
        by smtp.gmail.com with ESMTPSA id u9sm388074edo.76.2019.06.08.07.03.38
        for <linux-media@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 08 Jun 2019 07:03:38 -0700 (PDT)
From:   "W. Talsma" <w.talsma@rug.nl>
Content-Type: text/plain;
        charset=us-ascii
Content-Transfer-Encoding: 8BIT
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Unsupported Anysee version
Message-Id: <71F3EE65-F9DA-4F8B-BC83-1AE483F2F655@rug.nl>
Date:   Sat, 8 Jun 2019 16:03:36 +0200
To:     linux-media@vger.kernel.org
X-Mailer: Apple Mail (2.3445.104.11)
X-Virus-Scanned: clamav-milter 0.101.1 at smtp5
X-Virus-Status: Clean
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dear,

Today decided to dust off my Anysee E30 S2 Plus, and hope to get it to work with the Debian stretch tvheadend server.
Once I plug it in however, I see the following:
[27054.699829] usb 1-1.6: new high-speed USB device number 7 using ehci-pci
[27055.224303] usb 1-1.6: device descriptor read/all, error -71
[27056.187821] usb 1-1.6: new high-speed USB device number 8 using ehci-pci
[27057.180465] usb 1-1.6: config 1 interface 0 altsetting 0 bulk endpoint 0x1 has invalid maxpacket 64
[27057.180469] usb 1-1.6: config 1 interface 0 altsetting 0 bulk endpoint 0x81 has invalid maxpacket 64
[27057.180472] usb 1-1.6: config 1 interface 0 altsetting 1 bulk endpoint 0x1 has invalid maxpacket 64
[27057.180474] usb 1-1.6: config 1 interface 0 altsetting 1 bulk endpoint 0x81 has invalid maxpacket 64
[27057.180961] usb 1-1.6: New USB device found, idVendor=1c73, idProduct=861f, bcdDevice= 1.00
[27057.180964] usb 1-1.6: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[27057.180966] usb 1-1.6: Product: anysee-S2(LP)
[27057.180967] usb 1-1.6: Manufacturer: AMT.CO.KR
[27057.194507] usb 1-1.6: dvb_usb_v2: found a 'Anysee' in warm state
[27057.196058] usb 1-1.6: dvb_usb_anysee: firmware version 1.3 hardware id 11
[27057.197957] usb 1-1.6: dvb_usb_v2: will pass the complete MPEG2 transport stream to the software demuxer
[27057.197974] dvbdev: DVB: registering new adapter (Anysee)
[27057.197978] usb 1-1.6: media controller created
[27057.198256] dvbdev: dvb_create_media_entity: media entity 'dvb-demux' registered.
[27057.204296] Invalid probe, probably not a CX24116 device
[27057.204304] usb 1-1.6: dvb_usb_anysee: Unsupported Anysee version. Please report to <linux-media@vger.kernel.org>.
[27057.204718] usbcore: registered new interface driver dvb_usb_anysee

lsusb gives me the following:
Bus 001 Device 008: ID 1c73:861f AMT Anysee E30 USB 2.0 DVB-T Receiver

uname -a 
Linux linsrv03 4.19.45 #1 SMP Fri May 24 00:31:25 CEST 2019 x86_64 GNU/Linux

This reminded me that in the past, I never actually got the drivers fully to work under Linux.
Since it states: Please report to <linux-media@vger.kernel.org>., here is my report.
Is it possible to get it working?

Kind regards,
Wytse Talsma
