Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42FC242825
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 15:56:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409229AbfFLN4k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jun 2019 09:56:40 -0400
Received: from jp.dhs.org ([62.251.46.73]:45224 "EHLO jpvw.nl"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2408676AbfFLN4k (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 09:56:40 -0400
Received: from localhost ([127.0.0.1] helo=jpvw.nl)
        by jpvw.nl with esmtp (Exim 4.92)
        (envelope-from <jp@jpvw.nl>)
        id 1hb3jv-0000tD-Fd; Wed, 12 Jun 2019 15:56:35 +0200
Subject: Re: Unsupported Anysee version
To:     "W. Talsma" <w.talsma@rug.nl>, linux-media@vger.kernel.org
References: <71F3EE65-F9DA-4F8B-BC83-1AE483F2F655@rug.nl>
Cc:     Antti Palosaari <crope@iki.fi>
From:   JP <jp@jpvw.nl>
Message-ID: <581928ad-560f-34ef-1341-6c014203777b@jpvw.nl>
Date:   Wed, 12 Jun 2019 15:56:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <71F3EE65-F9DA-4F8B-BC83-1AE483F2F655@rug.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 6/8/19 4:03 PM, W. Talsma wrote:
> Dear,
>
> Today decided to dust off my Anysee E30 S2 Plus, and hope to get it to work with the Debian stretch tvheadend server.
> Once I plug it in however, I see the following:
> [27054.699829] usb 1-1.6: new high-speed USB device number 7 using ehci-pci
> [27055.224303] usb 1-1.6: device descriptor read/all, error -71
> [27056.187821] usb 1-1.6: new high-speed USB device number 8 using ehci-pci
> [27057.180465] usb 1-1.6: config 1 interface 0 altsetting 0 bulk endpoint 0x1 has invalid maxpacket 64
> [27057.180469] usb 1-1.6: config 1 interface 0 altsetting 0 bulk endpoint 0x81 has invalid maxpacket 64
> [27057.180472] usb 1-1.6: config 1 interface 0 altsetting 1 bulk endpoint 0x1 has invalid maxpacket 64
> [27057.180474] usb 1-1.6: config 1 interface 0 altsetting 1 bulk endpoint 0x81 has invalid maxpacket 64
> [27057.180961] usb 1-1.6: New USB device found, idVendor=1c73, idProduct=861f, bcdDevice= 1.00
> [27057.180964] usb 1-1.6: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> [27057.180966] usb 1-1.6: Product: anysee-S2(LP)
> [27057.180967] usb 1-1.6: Manufacturer: AMT.CO.KR
> [27057.194507] usb 1-1.6: dvb_usb_v2: found a 'Anysee' in warm state
> [27057.196058] usb 1-1.6: dvb_usb_anysee: firmware version 1.3 hardware id 11
> [27057.197957] usb 1-1.6: dvb_usb_v2: will pass the complete MPEG2 transport stream to the software demuxer
> [27057.197974] dvbdev: DVB: registering new adapter (Anysee)
> [27057.197978] usb 1-1.6: media controller created
> [27057.198256] dvbdev: dvb_create_media_entity: media entity 'dvb-demux' registered.
> [27057.204296] Invalid probe, probably not a CX24116 device
> [27057.204304] usb 1-1.6: dvb_usb_anysee: Unsupported Anysee version. Please report to <linux-media@vger.kernel.org>.
> [27057.204718] usbcore: registered new interface driver dvb_usb_anysee
>
> lsusb gives me the following:
> Bus 001 Device 008: ID 1c73:861f AMT Anysee E30 USB 2.0 DVB-T Receiver
>
> uname -a
> Linux linsrv03 4.19.45 #1 SMP Fri May 24 00:31:25 CEST 2019 x86_64 GNU/Linux
>
> This reminded me that in the past, I never actually got the drivers fully to work under Linux.
> Since it states: Please report to <linux-media@vger.kernel.org>., here is my report.
> Is it possible to get it working?
>
> Kind regards,
> Wytse Talsma
>
This has been on this list before:
https://www.mail-archive.com/linux-media@vger.kernel.org/msg42569.html

Jan Pieter
