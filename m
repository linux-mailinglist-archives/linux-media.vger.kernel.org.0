Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E0DC411E54
	for <lists+linux-media@lfdr.de>; Mon, 20 Sep 2021 19:29:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347453AbhITRaR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Sep 2021 13:30:17 -0400
Received: from mailrelay4-3.pub.mailoutpod1-cph3.one.com ([46.30.212.13]:14433
        "EHLO mailrelay4-3.pub.mailoutpod1-cph3.one.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1347838AbhITR1F (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Sep 2021 13:27:05 -0400
X-Greylist: delayed 967 seconds by postgrey-1.27 at vger.kernel.org; Mon, 20 Sep 2021 13:27:05 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mida.se; s=20191106;
        h=content-transfer-encoding:content-type:mime-version:date:message-id:subject:
         from:to:from;
        bh=98i9Gvf19F2emj1dQOUGty7NP/55MIgyVxtbONjc0yQ=;
        b=L1vPbivCG9uOm0NXHMhm/DayzOhMaDgDOH1GkmHkPVmuLjrH6m06iJzvLBpyFxy0WNQ4FGbQ+Yu1u
         bxWbXfDp7QtNdjzj53YaOrfzp72/wsTdVufjbsI5jXYv4ey39QHHfzLCh4iwOTTIuj3+25hRaDNszh
         OJXuVGMS0/qHQbv1VUOsD0czPT6rejBlyUKeol4D6eWQVPZXCcnE9P/kx7hVrapvVNqixMRMmbDLEr
         vqq+tOgUEH5zHvFHDGIkGOzjytCNgZpqoF7Q0518s5kQTkMVs8mjZL+I2KGXZR/gQWDjuynw1gzniO
         +M+JFoJwA3QDvu63qROkh7Rzt47D3lg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mida.se; s=rsa1;
        h=content-transfer-encoding:content-type:mime-version:date:message-id:subject:
         from:to:from;
        bh=98i9Gvf19F2emj1dQOUGty7NP/55MIgyVxtbONjc0yQ=;
        b=tsznOXqtSXZC2ZOCB0Aqw8h585ktWBvg6VZQJszPHFfw5li/3SLY240g+qSr5x4FxDZn2ue+DVTRr
         3q2+J5Yib4F339aHZLhRGhXIVfaVRfdEW8vt3k9OXdV3G6x0vSVw9CmMD6dlNRDWLLKE8OzbKjJch6
         gUt3lPH7ci+SuuefN+AJBtSkjdrGVA0EFoZXDMFe6T7m/WVgnIEZgONtLt8yNDmJU7UoA3dycTI/1c
         jjk6RaC9dcgyG6xqdavaPene+3McuzF7xBv3e96Wm6y6xS8surZrV7+OpYUEwvci3SRuEkC29YHTm8
         plmvF1+z3dxtv6kIRcKfPSYUIuinjyg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
        d=mida.se; s=ed1;
        h=content-transfer-encoding:content-type:mime-version:date:message-id:subject:
         from:to:from;
        bh=98i9Gvf19F2emj1dQOUGty7NP/55MIgyVxtbONjc0yQ=;
        b=fc1Ri8ZryWXpKBKAx/eCVbBa6JIU+hOwy9N2no8aByqrfRCugvhTc7MRZI0wc1b37iCQ1R0zRHLKm
         TW0G6GDBA==
X-HalOne-Cookie: d78e528704003e539de07bd5ec61c0eed611355d
X-HalOne-ID: 81bcff9f-1a35-11ec-adfc-d0431ea8bb10
Received: from [192.168.1.108] (2.64.99.63.mobile.tre.se [2.64.99.63])
        by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
        id 81bcff9f-1a35-11ec-adfc-d0431ea8bb10;
        Mon, 20 Sep 2021 17:09:26 +0000 (UTC)
To:     linux-media@vger.kernel.org
From:   rkardell <rkardell@mida.se>
Subject: Error dvb-usb: no frontend was attached by 'MSI Mega Sky 580 DVB-T
 USB2.0': mt352, qt1010
Message-ID: <8bd927dd-ba93-0aae-890a-98aa8710a1a3@mida.se>
Date:   Mon, 20 Sep 2021 19:09:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: sv-FI
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

MSI Megasky 580 does not initialize correct on modern pc:s with usb 
using ehci.
This could be traced to the use of read buffer on the stack for control 
messages.
Tested on Thinkpad X131e Ubuntu Mate 21.04 5.11.0-34-generic x86_64
and several other.
I installed mt352 and qt1010 from the latest media source 
linux-media-2021-09-12-
6880fa6c5660.tar.bz2 and modify them the to put the buffer in kernel space.


dmesg before mod
[14703.648173] usb 1-1.2: new high-speed USB device number 8 using ehci-pci
[14703.765788] usb 1-1.2: New USB device found, idVendor=0db0, 
idProduct=5580, bcdDevice= 1.10
[14703.765809] usb 1-1.2: New USB device strings: Mfr=1, Product=2, 
SerialNumber=0
[14703.765818] usb 1-1.2: Product: DTV USB MINI
[14703.765824] usb 1-1.2: Manufacturer: DTV USB MINI
[14703.768016] dvb-usb: found a 'MSI Mega Sky 580 DVB-T USB2.0' in cold 
state, will try to load a firmware
[14703.768146] dvb-usb: downloading firmware from file 
'dvb-usb-megasky-02.fw'
[14704.615878] usb 1-1.2: USB disconnect, device number 8
[14704.840154] usb 1-1.2: new high-speed USB device number 9 using ehci-pci
[14704.960288] usb 1-1.2: New USB device found, idVendor=0db0, 
idProduct=5580, bcdDevice= 0.95
[14704.960306] usb 1-1.2: New USB device strings: Mfr=1, Product=2, 
SerialNumber=0
[14704.960312] usb 1-1.2: Product: DTV USB MINI
[14704.960317] usb 1-1.2: Manufacturer: ULi Electronics
[14704.961096] dvb-usb: found a 'MSI Mega Sky 580 DVB-T USB2.0' in warm 
state.
[14704.961641] dvb-usb: will pass the complete MPEG2 transport stream to 
the software demuxer.
[14704.961786] dvbdev: DVB: registering new adapter (MSI Mega Sky 580 
DVB-T USB2.0)
[14704.961812] usb 1-1.2: media controller created
[14704.962990] dvbdev: dvb_create_media_entity: media entity 'dvb-demux' 
registered.
[14705.017363] m920x_read = error: -11
[14705.017379] mt352_read_register: readreg error (reg=127, ret==-11)
[14705.017396] dvb-usb: no frontend was attached by 'MSI Mega Sky 580 
DVB-T USB2.0'
[14705.017597] input: IR-receiver inside an USB DVB receiver as
/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1.2/input/input23
[14705.017948] dvb-usb: schedule remote query interval to 100 msecs.
[14705.017966] dvb-usb: MSI Mega Sky 580 DVB-T USB2.0 successfully 
initialized and connected.


diff qt1010.c
13a14,15
 > u8 *b1=kmalloc(1,GFP_KERNEL);
 >
18c20
<
.flags = I2C_M_RD, .buf = val, .len = 1 },
---
 >
.flags = I2C_M_RD, .buf = b1, .len = 1 },
23a26
 >
kfree(b1);
26c29,31
<
return 0;
---
 >
*val=*b1;
 > kfree(b1);
 > return 0;


diff mt352.c72c72
<
u8 b1 [] = { 0 };
---
 > u8 *b1=kmalloc(1,GFP_KERNEL);
84a85
 >
kfree(b1);
87,88c88,90
<
<
return b1[0];
---
 >
ret=*b1;
 > kfree(b1);
 >
return ret;


dmesg after mod
16681.187111] usb 1-1.2: new high-speed USB device number 10 using ehci-pci
[16681.300642] usb 1-1.2: New USB device found, idVendor=0db0, 
idProduct=5580, bcdDevice= 1.10
[16681.300656] usb 1-1.2: New USB device strings: Mfr=1, Product=2, 
SerialNumber=0
[16681.300661] usb 1-1.2: Product: DTV USB MINI
[16681.300665] usb 1-1.2: Manufacturer: DTV USB MINI
[16681.302264] dvb-usb: found a 'MSI Mega Sky 580 DVB-T USB2.0' in cold 
state, will try to load a firmware
[16681.302348] dvb-usb: downloading firmware from file 
'dvb-usb-megasky-02.fw'
[16682.119818] usb 1-1.2: USB disconnect, device number 10
[16682.343171] usb 1-1.2: new high-speed USB device number 11 using ehci-pci
[16682.459126] usb 1-1.2: New USB device found, idVendor=0db0, 
idProduct=5580, bcdDevice= 0.95
[16682.459147] usb 1-1.2: New USB device strings: Mfr=1, Product=2, 
SerialNumber=0
[16682.459155] usb 1-1.2: Product: DTV USB MINI
[16682.459162] usb 1-1.2: Manufacturer: ULi Electronics
[16682.459823] dvb-usb: found a 'MSI Mega Sky 580 DVB-T USB2.0' in warm 
state.
[16682.461268] dvb-usb: will pass the complete MPEG2 transport stream to 
the software demuxer.
[16682.461508] dvbdev: DVB: registering new adapter (MSI Mega Sky 580 
DVB-T USB2.0)
[16682.461524] usb 1-1.2: media controller created
[16682.462359] dvbdev: dvb_create_media_entity: media entity 'dvb-demux' 
registered.
[16682.516447] usb 1-1.2: DVB: registering adapter 0 frontend 0 (Zarlink 
MT352 DVB-T)...
[16682.516478] dvbdev: dvb_create_media_entity: media entity 'Zarlink 
MT352 DVB-T' registered.
[16682.526592] i2c i2c-8: qt1010: Quantek QT1010 successfully identified
[16682.527378] input: IR-receiver inside an USB DVB receiver as
/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1.2/input/input24
[16682.527574] dvb-usb: schedule remote query interval to 100 msecs.
[16682.527590] dvb-usb: MSI Mega Sky 580 DVB-T USB2.0 successfully 
initialized and connected.

Please verify my code, since C is not my primary programming language.

Even if Megasky is an old device, it’s still in the linux distribution 
and I think it should work
properly.
I hope this modification will find its way into linux media.

R Kardell

