Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E5351A47B8
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2020 17:00:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726177AbgDJPAL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Apr 2020 11:00:11 -0400
Received: from mail.zaclys.net ([178.33.93.72]:43557 "EHLO mail.zaclys.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726049AbgDJPAK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Apr 2020 11:00:10 -0400
X-Greylist: delayed 3051 seconds by postgrey-1.27 at vger.kernel.org; Fri, 10 Apr 2020 11:00:09 EDT
Received: from [192.168.1.12] (esc31-1-78-245-94-189.fbx.proxad.net [78.245.94.189])
        (authenticated bits=0)
        by mail.zaclys.net (8.14.7/8.14.7) with ESMTP id 03AE9H6x038879
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO)
        for <linux-media@vger.kernel.org>; Fri, 10 Apr 2020 16:09:17 +0200
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.zaclys.net 03AE9H6x038879
Authentication-Results: mail.zaclys.net; dmarc=fail (p=reject dis=none) header.from=zaclys.net
Authentication-Results: mail.zaclys.net; spf=fail smtp.mailfrom=nicolas.sangouard@zaclys.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zaclys.net;
        s=default; t=1586527757;
        bh=poMf0kXTb9Bkfi5z1G3pjhpGxJFho1kBIB0NIgUEz7s=;
        h=To:From:Subject:Date:From;
        b=ri6a0SiNxXMUnzJYn8CUcZfPpsWFcVRIEOCQRgaBok8iy78z7y2Nbclb4oQIT1/YE
         6pn6/WjZEnC4/Ad1XAp6i65jJPoOue8m8cdYNk5xZ1832/SGuLdV8VwBGqD86T3edY
         OQ0TQYaI0/sBOKeV6Xj7+Qv5GfJ3+Gy609Xm6qYc=
To:     linux-media@vger.kernel.org
From:   Nicolas Sangouard <nicolas.sangouard@zaclys.net>
Subject: eb1a:5043 eMPIA device driver
Message-ID: <ce048b0e-d63e-d0c2-e15d-e90dbeee4da0@zaclys.net>
Date:   Fri, 10 Apr 2020 16:09:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: fr-FR
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi linux-media contributors,

Can someone help me making my video capture device (Masster AVCap) work 
on my linux ? I've never done something like a driver before but I'd 
like to try it now and contribute if it works.

When I plug the device, lsusb says eb1a:5043 eMPIA Technology, Inc.  
which is not on the EM28xx linuxtv.org page.

For information, dmesg says :

[345689.777546] usb 3-1: new high-speed USB device number 11 using xhci_hcd
[345689.926015] usb 3-1: config 1 interface 0 altsetting 0 endpoint 0x82 
has wMaxPacketSize 0, skipping
[345689.926022] usb 3-1: config 1 interface 0 altsetting 0 endpoint 0x84 
has wMaxPacketSize 0, skipping
[345689.926027] usb 3-1: config 1 interface 0 altsetting 1 endpoint 0x82 
has wMaxPacketSize 0, skipping
[345689.926031] usb 3-1: config 1 interface 0 altsetting 1 endpoint 0x84 
has wMaxPacketSize 0, skipping
[345689.926035] usb 3-1: config 1 interface 0 altsetting 2 endpoint 0x84 
has wMaxPacketSize 0, skipping
[345689.926038] usb 3-1: config 1 interface 0 altsetting 3 endpoint 0x84 
has wMaxPacketSize 0, skipping
[345689.926042] usb 3-1: config 1 interface 0 altsetting 4 endpoint 0x84 
has wMaxPacketSize 0, skipping
[345689.926046] usb 3-1: config 1 interface 0 altsetting 5 endpoint 0x84 
has wMaxPacketSize 0, skipping
[345689.926049] usb 3-1: config 1 interface 0 altsetting 6 endpoint 0x84 
has wMaxPacketSize 0, skipping
[345689.926053] usb 3-1: config 1 interface 0 altsetting 7 endpoint 0x84 
has wMaxPacketSize 0, skipping
[345689.926057] usb 3-1: config 1 interface 2 altsetting 0 endpoint 0x83 
has wMaxPacketSize 0, skipping
[345689.928712] usb 3-1: New USB device found, idVendor=eb1a, 
idProduct=5043, bcdDevice= 1.00
[345689.928719] usb 3-1: New USB device strings: Mfr=0, Product=1, 
SerialNumber=0
[345689.928722] usb 3-1: Product: Masster AVCap
[345689.935439] usb 3-1: can't set config #1, error -71

Thanks a lot

