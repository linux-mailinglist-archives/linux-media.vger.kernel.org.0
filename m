Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3154E4F5C1
	for <lists+linux-media@lfdr.de>; Sat, 22 Jun 2019 14:35:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726289AbfFVMfW convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Sat, 22 Jun 2019 08:35:22 -0400
Received: from smtp4.rug.nl ([129.125.60.4]:50806 "EHLO smtp4.rug.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726112AbfFVMfW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 22 Jun 2019 08:35:22 -0400
Received: from mail-ed1-f69.google.com ([172.23.16.207])
        by smtp4.rug.nl (8.14.9/8.14.9) with ESMTP id x5MCZJ21014717
        for <linux-media@vger.kernel.org>; Sat, 22 Jun 2019 14:35:19 +0200
Received: by mail-ed1-f69.google.com with SMTP id c27so13132046edn.8
        for <linux-media@vger.kernel.org>; Sat, 22 Jun 2019 05:35:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=Jj+6EMlHwfRrQN1+Y4Gzg73d+9RW9GCKvN2i4cLc/0M=;
        b=rVeE170pwYExCu6nIAVHTYxaCIXxlMO/puxEyhEe5s7RjKcO1s98H7zb2M0/zHiPAx
         2muKdWZ1SGb+xNrqjUYztB12A1u1N+rWrlChJHLzS81iUVbBdLGkSteA/EmA2QOVI2f8
         C8RtTSdC9AKjXYDj7G6dvOj7FRuaez41rrvctuskEKIxWA1Nx2dNUVRCzW0Sk/nczq+G
         m0PVhwIyjgFhLITyGvFgAJ2io3Ahcv+Xaoff02VGLGjkgVBLBhkuLIXUSiw39vptheo5
         9Akctqw1lL7PlQYzt9KB8BlOeMRQQtx8EGyW8LyxH4thQN9VLbExX4nBeySks6eYc2eT
         lHPg==
X-Gm-Message-State: APjAAAWif6XHVxlGLipsBPIvKWk5UhmxzyY9oinzn01tiIm5+xd74QxT
        Y/4xVxuzVzpiomHwPp+FI0jEw5YjB8hdKdqGpRAhtDGWJW7lUbllelonEI2dGX1rG4gV+wDQtBD
        mU+hgd8ewL/sOO8imxFgSsz0=
X-Received: by 2002:aa7:c754:: with SMTP id c20mr109621691eds.265.1561206918947;
        Sat, 22 Jun 2019 05:35:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx6rNWUvNUC4FRWNgiw8DoB6oOe5CmIMlsDO3v4DNiQeFBfBXtFk5M0jeExF8fItGDiXJDfDw==
X-Received: by 2002:aa7:c754:: with SMTP id c20mr109621676eds.265.1561206918692;
        Sat, 22 Jun 2019 05:35:18 -0700 (PDT)
Received: from wytses-mbp.lucaswolde.veehouderijtalsma.nl (ip565fd429.direct-adsl.nl. [86.95.212.41])
        by smtp.gmail.com with ESMTPSA id j30sm1757049edb.8.2019.06.22.05.35.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 22 Jun 2019 05:35:18 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: Unsupported Anysee version
From:   "W. Talsma" <w.talsma@rug.nl>
In-Reply-To: <581928ad-560f-34ef-1341-6c014203777b@jpvw.nl>
Date:   Sat, 22 Jun 2019 14:35:15 +0200
Cc:     linux-media@vger.kernel.org, Antti Palosaari <crope@iki.fi>
Content-Transfer-Encoding: 8BIT
Message-Id: <BA6BCEAD-424F-4D51-B082-C405A26E55FB@rug.nl>
References: <71F3EE65-F9DA-4F8B-BC83-1AE483F2F655@rug.nl>
 <581928ad-560f-34ef-1341-6c014203777b@jpvw.nl>
To:     JP <jp@jpvw.nl>
X-Mailer: Apple Mail (2.3445.104.11)
X-Virus-Scanned: clamav-milter 0.101.1 at smtp4
X-Virus-Status: Clean
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dear Jan Pieter,

Thanks for your reply.
I see that this has been quite a while ago already.

In that case, I cannot use the hardware in this point of time.
I can think of a few options:
Either I borrow the hardware to someone who can and is willing to write a driver (I’m willing to ship it)
Or I set up an isolated development machine with this hardware attached, with ssh access for someone to develop it remotely.
Or, in a few months, I’ll try to fiddle with the drivers myself.
Or I discard of it.

Kind regards,
Wytse Talsma

> On 12 Jun 2019, at 15:56, JP <jp@jpvw.nl> wrote:
> 
> 
> 
> On 6/8/19 4:03 PM, W. Talsma wrote:
>> Dear,
>> 
>> Today decided to dust off my Anysee E30 S2 Plus, and hope to get it to work with the Debian stretch tvheadend server.
>> Once I plug it in however, I see the following:
>> [27054.699829] usb 1-1.6: new high-speed USB device number 7 using ehci-pci
>> [27055.224303] usb 1-1.6: device descriptor read/all, error -71
>> [27056.187821] usb 1-1.6: new high-speed USB device number 8 using ehci-pci
>> [27057.180465] usb 1-1.6: config 1 interface 0 altsetting 0 bulk endpoint 0x1 has invalid maxpacket 64
>> [27057.180469] usb 1-1.6: config 1 interface 0 altsetting 0 bulk endpoint 0x81 has invalid maxpacket 64
>> [27057.180472] usb 1-1.6: config 1 interface 0 altsetting 1 bulk endpoint 0x1 has invalid maxpacket 64
>> [27057.180474] usb 1-1.6: config 1 interface 0 altsetting 1 bulk endpoint 0x81 has invalid maxpacket 64
>> [27057.180961] usb 1-1.6: New USB device found, idVendor=1c73, idProduct=861f, bcdDevice= 1.00
>> [27057.180964] usb 1-1.6: New USB device strings: Mfr=1, Product=2, SerialNumber=0
>> [27057.180966] usb 1-1.6: Product: anysee-S2(LP)
>> [27057.180967] usb 1-1.6: Manufacturer: AMT.CO.KR
>> [27057.194507] usb 1-1.6: dvb_usb_v2: found a 'Anysee' in warm state
>> [27057.196058] usb 1-1.6: dvb_usb_anysee: firmware version 1.3 hardware id 11
>> [27057.197957] usb 1-1.6: dvb_usb_v2: will pass the complete MPEG2 transport stream to the software demuxer
>> [27057.197974] dvbdev: DVB: registering new adapter (Anysee)
>> [27057.197978] usb 1-1.6: media controller created
>> [27057.198256] dvbdev: dvb_create_media_entity: media entity 'dvb-demux' registered.
>> [27057.204296] Invalid probe, probably not a CX24116 device
>> [27057.204304] usb 1-1.6: dvb_usb_anysee: Unsupported Anysee version. Please report to <linux-media@vger.kernel.org>.
>> [27057.204718] usbcore: registered new interface driver dvb_usb_anysee
>> 
>> lsusb gives me the following:
>> Bus 001 Device 008: ID 1c73:861f AMT Anysee E30 USB 2.0 DVB-T Receiver
>> 
>> uname -a
>> Linux linsrv03 4.19.45 #1 SMP Fri May 24 00:31:25 CEST 2019 x86_64 GNU/Linux
>> 
>> This reminded me that in the past, I never actually got the drivers fully to work under Linux.
>> Since it states: Please report to <linux-media@vger.kernel.org>., here is my report.
>> Is it possible to get it working?
>> 
>> Kind regards,
>> Wytse Talsma
>> 
> This has been on this list before:
> https://www.mail-archive.com/linux-media@vger.kernel.org/msg42569.html
> 
> Jan Pieter

