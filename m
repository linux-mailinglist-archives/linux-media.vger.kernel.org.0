Return-Path: <linux-media+bounces-15743-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE0B9468F1
	for <lists+linux-media@lfdr.de>; Sat,  3 Aug 2024 11:54:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83D661F219E1
	for <lists+linux-media@lfdr.de>; Sat,  3 Aug 2024 09:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E62014D6F7;
	Sat,  3 Aug 2024 09:53:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABFC67A0D;
	Sat,  3 Aug 2024 09:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722678831; cv=none; b=SLOCTc0rUSpst92oqHaRQdaTg4r1AtHSS5zNIlsmj0QsvxRkDIPk5yQ8PVJHNP5+OralEoEC7xfTKJzzRV8OagKsHbQESXjxBVa6suuDlb63Rzij4bV0ZZlpzC0MkjbxPXbdwmdxSRWJqRdqqfygYLAgRTWNjeY5s9zbrm6si5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722678831; c=relaxed/simple;
	bh=SqrCXWCGbUc6Cmu821Y4rxWQSeXhTwfiQwPgxeSrzCg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lL+GabQhraGjolcFRfAU7kxMU5vQlDNcBtTOViZ5Ugi5/39U4kG6YYbzify5l9xjmkvnYSVAWpDWvPMNXZPgpwExdujHYRoqrfVAyDJgqn89uNunNyVAN6KkXV42lLrtsoKElD0xs3bLepFieY9r0jEt0kgpEkCyfFY7uCrBKpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4WbdLd5kbKz4f3jMG;
	Sat,  3 Aug 2024 17:53:29 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id E276B1A0359;
	Sat,  3 Aug 2024 17:53:43 +0800 (CST)
Received: from [10.67.111.172] (unknown [10.67.111.172])
	by APP4 (Coremail) with SMTP id gCh0CgBXzIIl_q1mRy2UAg--.18048S3;
	Sat, 03 Aug 2024 17:53:42 +0800 (CST)
Message-ID: <d57c7647-9557-7b70-9f5c-3615a210e4ab@huaweicloud.com>
Date: Sat, 3 Aug 2024 17:53:41 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 6.10 288/809] media: dvb-usb: Fix unexpected infinite loop
 in dvb_usb_read_remote_control()
Content-Language: en-US
To: Stefan Lippers-Hollmann <s.l-h@gmx.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Sean Young <sean@mess.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev,
 Sasha Levin <sashal@kernel.org>,
 "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
References: <20240730151724.637682316@linuxfoundation.org>
 <20240730151735.968317438@linuxfoundation.org> <20240801165146.38991f60@mir>
From: Zheng Yejian <zhengyejian@huaweicloud.com>
In-Reply-To: <20240801165146.38991f60@mir>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:gCh0CgBXzIIl_q1mRy2UAg--.18048S3
X-Coremail-Antispam: 1UD129KBjvAXoW3CFWUWFy7WFy5tFW3Xw4xZwb_yoW8AF1DAo
	Z2kw4fW3W8tw1j9r1rtr47GFn5Gayqkw4rWrnrKr1qkw48JFZY9ryrJFs0vr1rAFs0kFZr
	Gr1Dt3s5KrW0qF4fn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UjIYCTnIWjp_UUUYw7kC6x804xWl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK
	8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4
	AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF
	7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AF
	wI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43
	MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
	0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWU
	JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07UAwI
	DUUUUU=
X-CM-SenderInfo: x2kh0w51hmxt3q6k3tpzhluzxrxghudrp/

On 2024/8/1 22:51, Stefan Lippers-Hollmann wrote:
> Hi
> 
> On 2024-07-30, Greg Kroah-Hartman wrote:
>> 6.10-stable review patch.  If anyone has any objections, please let me know.
>>
>> ------------------
>>
>> From: Zheng Yejian <zhengyejian1@huawei.com>
>>
>> [ Upstream commit 2052138b7da52ad5ccaf74f736d00f39a1c9198c ]
>>
>> Infinite log printing occurs during fuzz test:
>>
>>    rc rc1: DViCO FusionHDTV DVB-T USB (LGZ201) as ...
>>    ...
>>    dvb-usb: schedule remote query interval to 100 msecs.
>>    dvb-usb: DViCO FusionHDTV DVB-T USB (LGZ201) successfully initialized ...
>>    dvb-usb: bulk message failed: -22 (1/0)
>>    dvb-usb: bulk message failed: -22 (1/0)
>>    dvb-usb: bulk message failed: -22 (1/0)
>>    ...
>>    dvb-usb: bulk message failed: -22 (1/0)
>>
>> Looking into the codes, there is a loop in dvb_usb_read_remote_control(),
>> that is in rc_core_dvb_usb_remote_init() create a work that will call
>> dvb_usb_read_remote_control(), and this work will reschedule itself at
>> 'rc_interval' intervals to recursively call dvb_usb_read_remote_control(),
>> see following code snippet:
> [...]
> 
> This patch, as part of v6.10.3-rc3 breaks my TeVii s480 dual DVB-S2
> card, reverting just this patch from v6.10-rc3 fixes the situation
> again (a co-installed Microsoft Xbox One Digital TV DVB-T2 Tuner
> keeps working).
> 
> broken, v6.10.3-rc3:
> 
> $ dmesg | grep -i -e dvb -e dw21 -e usb\ 4
> [    0.999122] usb 1-1: new high-speed USB device number 2 using ehci-pci
> [    1.023123] usb 4-1: new high-speed USB device number 2 using ehci-pci
> [    1.130247] usb 1-1: New USB device found, idVendor=9022, idProduct=d482, bcdDevice= 0.01
> [    1.130257] usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
> [    1.152323] usb 4-1: New USB device found, idVendor=9022, idProduct=d481, bcdDevice= 0.01
> [    1.152329] usb 4-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
> [    6.701033] dvb-usb: found a 'TeVii S480.2 USB' in cold state, will try to load a firmware
> [    6.701178] dvb-usb: downloading firmware from file 'dvb-usb-s660.fw'
> [    6.701179] dw2102: start downloading DW210X firmware
> [    6.703715] dvb-usb: found a 'Microsoft Xbox One Digital TV Tuner' in cold state, will try to load a firmware
> [    6.703974] dvb-usb: downloading firmware from file 'dvb-usb-dib0700-1.20.fw'
> [    6.756432] usb 1-1: USB disconnect, device number 2
> [    6.862119] dvb-usb: found a 'TeVii S480.2 USB' in warm state.
> [    6.862194] dvb-usb: TeVii S480.2 USB error while loading driver (-22)
> [    6.862209] dvb-usb: found a 'TeVii S480.1 USB' in cold state, will try to load a firmware
> [    6.862244] dvb-usb: downloading firmware from file 'dvb-usb-s660.fw'
> [    6.862245] dw2102: start downloading DW210X firmware
> [    6.914811] usb 4-1: USB disconnect, device number 2
> [    7.014131] dvb-usb: found a 'TeVii S480.1 USB' in warm state.
> [    7.014487] dvb-usb: TeVii S480.1 USB error while loading driver (-22)
Hi, Sean and Hans!

The device properties of TeVii S480.1 that fail to be loaded should be 's660_properties'
in drivers/media/usb/dvb-usb/dw2102.c:

   static struct dvb_usb_device_properties s660_properties = {
     ...
     .generic_bulk_ctrl_endpoint = 0x81,
     ...
     .devices = {
       {"TeVii S660 USB",
         {&dw2102_table[TEVII_S660], NULL},
         {NULL},
        },
       {"TeVii S480.1 USB",
         {&dw2102_table[TEVII_S480_1], NULL},
         {NULL},
        },
       {"TeVii S480.2 USB",
          &dw2102_table[TEVII_S480_2], NULL},
         {NULL},
        },
     ...
   }

The 'generic_bulk_ctrl_endpoint' is 0x81, so it should be caused by the failure
after run:

    ret = dvb_usb_check_bulk_endpoint(d, d->props.generic_bulk_ctrl_endpoint);

Refer to the comment in drivers/media/usb/dvb-usb/dvb-usb.h:
   * @generic_bulk_ctrl_endpoint: most of the DVB USB devices have a generic
   *  endpoint which received control messages with bulk transfers. When this
   *  is non-zero, one can use dvb_usb_generic_rw and dvb_usb_generic_write-
   *  helper functions.

The user can configure a non-zero 'generic_bulk_ctrl_endpoint', but not use it
to do bulk transfers, is it right? If that's the case, does that mean that it
can't compulsorily check bulk endpoint?  Or, is it possible that the bulk endpoint
check is in the wrong place?

I'm a complete newbie for dvb_usb and don't have a dvb device :(

> [    7.014538] usbcore: registered new interface driver dw2102
> [    7.278244] dvb-usb: found a 'Microsoft Xbox One Digital TV Tuner' in warm state.
> [    7.278403] dvb-usb: will pass the complete MPEG2 transport stream to the software demuxer.
> [    7.278915] dvbdev: DVB: registering new adapter (Microsoft Xbox One Digital TV Tuner)
> [    7.279137] dvbdev: dvb_create_media_entity: media entity 'dvb-demux' registered.
> [    7.460377] usb 6-5: DVB: registering adapter 0 frontend 0 (Panasonic MN88472)...
> [    7.460389] dvbdev: dvb_create_media_entity: media entity 'Panasonic MN88472' registered.
> [    7.460822] dvb-usb: Microsoft Xbox One Digital TV Tuner successfully initialized and connected.
> [    7.460998] usbcore: registered new interface driver dvb_usb_dib0700
> [    8.496278] usb 1-1: new high-speed USB device number 3 using ehci-pci
> [    8.625238] usb 1-1: config 1 interface 0 altsetting 0 bulk endpoint 0x81 has invalid maxpacket 2
> [    8.626608] usb 1-1: New USB device found, idVendor=9022, idProduct=d660, bcdDevice= 0.00
> [    8.626613] usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> [    8.626616] usb 1-1: Product: DVBS2BOX
> [    8.626618] usb 1-1: Manufacturer: TBS-Tech
> [    8.627027] dvb-usb: found a 'TeVii S660 USB' in cold state, will try to load a firmware
> [    8.627079] dvb-usb: downloading firmware from file 'dvb-usb-s660.fw'
> [    8.627081] dw2102: start downloading DW210X firmware
> [    8.655186] usb 4-1: new high-speed USB device number 3 using ehci-pci
> [    8.781321] dvb-usb: found a 'TeVii S660 USB' in warm state.
> [    8.781775] dvb-usb: TeVii S660 USB error while loading driver (-22)
> [    8.784340] usb 4-1: config 1 interface 0 altsetting 0 bulk endpoint 0x81 has invalid maxpacket 2
> [    8.785705] usb 4-1: New USB device found, idVendor=9022, idProduct=d660, bcdDevice= 0.00
> [    8.785714] usb 4-1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> [    8.785718] usb 4-1: Product: DVBS2BOX
> [    8.785721] usb 4-1: Manufacturer: TBS-Tech
> [    8.786247] dvb-usb: found a 'TeVii S660 USB' in cold state, will try to load a firmware
> [    8.786299] dvb-usb: downloading firmware from file 'dvb-usb-s660.fw'
> [    8.786301] dw2102: start downloading DW210X firmware
> [    8.941215] dvb-usb: found a 'TeVii S660 USB' in warm state.
> [    8.941532] dvb-usb: TeVii S660 USB error while loading driver (-22)
> [   16.107993] mn88472 12-0018: downloading firmware from file 'dvb-demod-mn88472-02.fw'
> 
> working, v6.10.3-rc3 with this patch reverted:
> 
> $ dmesg | grep -i -e dvb -e dw21 -e usb\ 4
> [    1.136231] usb 1-1: new high-speed USB device number 2 using ehci-pci
> [    1.161156] usb 4-1: new high-speed USB device number 2 using ehci-pci
> [    1.267579] usb 1-1: New USB device found, idVendor=9022, idProduct=d482, bcdDevice= 0.01
> [    1.267588] usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
> [    1.291329] usb 4-1: New USB device found, idVendor=9022, idProduct=d481, bcdDevice= 0.01
> [    1.291338] usb 4-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
> [    3.135217] dvb-usb: found a 'TeVii S480.2 USB' in cold state, will try to load a firmware
> [    3.135430] dvb-usb: downloading firmware from file 'dvb-usb-s660.fw'
> [    3.135432] dw2102: start downloading DW210X firmware
> [    3.166588] dvb-usb: found a 'Microsoft Xbox One Digital TV Tuner' in cold state, will try to load a firmware
> [    3.167079] dvb-usb: downloading firmware from file 'dvb-usb-dib0700-1.20.fw'
> [    3.188357] usb 1-1: USB disconnect, device number 2
> [    3.287145] dvb-usb: found a 'TeVii S480.2 USB' in warm state.
> [    3.287222] dvb-usb: will pass the complete MPEG2 transport stream to the software demuxer.
> [    3.287254] dvbdev: DVB: registering new adapter (TeVii S480.2 USB)
> [    3.287258] usb 1-1: media controller created
> [    3.287355] dvb-usb: MAC address: 01:01:01:01:01:01
> [    3.287499] dvbdev: dvb_create_media_entity: media entity 'dvb-demux' registered.
> [    3.290759] dvb-usb: no frontend was attached by 'TeVii S480.2 USB'
> [    3.315441] rc rc0: lirc_dev: driver dw2102 registered at minor = 0, scancode receiver, no transmitter
> [    3.315640] dvb-usb: schedule remote query interval to 150 msecs.
> [    3.315646] dvb-usb: TeVii S480.2 USB successfully initialized and connected.
> [    3.315730] dvb-usb: found a 'TeVii S480.1 USB' in cold state, will try to load a firmware
> [    3.315786] dvb-usb: downloading firmware from file 'dvb-usb-s660.fw'
> [    3.315790] dw2102: start downloading DW210X firmware
> [    3.340783] dvb-usb: TeVii S480.2 USB successfully deinitialized and disconnected.
> [    3.369557] usb 4-1: USB disconnect, device number 2
> [    3.470172] dvb-usb: found a 'TeVii S480.1 USB' in warm state.
> [    3.470320] dvb-usb: will pass the complete MPEG2 transport stream to the software demuxer.
> [    3.470371] dvbdev: DVB: registering new adapter (TeVii S480.1 USB)
> [    3.470377] usb 4-1: media controller created
> [    3.470516] dvb-usb: MAC address: a1:a1:a1:a1:a1:a1
> [    3.470724] dvbdev: dvb_create_media_entity: media entity 'dvb-demux' registered.
> [    3.472540] dvb-usb: no frontend was attached by 'TeVii S480.1 USB'
> [    3.474008] rc rc1: lirc_dev: driver dw2102 registered at minor = 0, scancode receiver, no transmitter
> [    3.474268] dvb-usb: schedule remote query interval to 150 msecs.
> [    3.474274] dvb-usb: TeVii S480.1 USB successfully initialized and connected.
> [    3.474331] usbcore: registered new interface driver dw2102
> [    3.511730] dvb-usb: TeVii S480.1 USB successfully deinitialized and disconnected.
> [    3.743260] dvb-usb: found a 'Microsoft Xbox One Digital TV Tuner' in warm state.
> [    3.743496] dvb-usb: will pass the complete MPEG2 transport stream to the software demuxer.
> [    3.744132] dvbdev: DVB: registering new adapter (Microsoft Xbox One Digital TV Tuner)
> [    3.744363] dvbdev: dvb_create_media_entity: media entity 'dvb-demux' registered.
> [    3.924797] usb 6-5: DVB: registering adapter 0 frontend 0 (Panasonic MN88472)...
> [    3.924805] dvbdev: dvb_create_media_entity: media entity 'Panasonic MN88472' registered.
> [    3.925073] dvb-usb: Microsoft Xbox One Digital TV Tuner successfully initialized and connected.
> [    3.925220] usbcore: registered new interface driver dvb_usb_dib0700
> [    4.928291] usb 1-1: new high-speed USB device number 3 using ehci-pci
> [    5.057227] usb 1-1: config 1 interface 0 altsetting 0 bulk endpoint 0x81 has invalid maxpacket 2
> [    5.060100] usb 1-1: New USB device found, idVendor=9022, idProduct=d660, bcdDevice= 0.00
> [    5.060106] usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> [    5.060109] usb 1-1: Product: DVBS2BOX
> [    5.060112] usb 1-1: Manufacturer: TBS-Tech
> [    5.060517] dvb-usb: found a 'TeVii S660 USB' in cold state, will try to load a firmware
> [    5.060560] dvb-usb: downloading firmware from file 'dvb-usb-s660.fw'
> [    5.060562] dw2102: start downloading DW210X firmware
> [    5.105152] usb 4-1: new high-speed USB device number 3 using ehci-pci
> [    5.214345] dvb-usb: found a 'TeVii S660 USB' in warm state.
> [    5.214663] dvb-usb: will pass the complete MPEG2 transport stream to the software demuxer.
> [    5.215024] dvbdev: DVB: registering new adapter (TeVii S660 USB)
> [    5.215031] usb 1-1: media controller created
> [    5.234371] usb 4-1: config 1 interface 0 altsetting 0 bulk endpoint 0x81 has invalid maxpacket 2
> [    5.235622] usb 4-1: New USB device found, idVendor=9022, idProduct=d660, bcdDevice= 0.00
> [    5.235632] usb 4-1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> [    5.235635] usb 4-1: Product: DVBS2BOX
> [    5.235638] usb 4-1: Manufacturer: TBS-Tech
> [    5.236096] dvb-usb: found a 'TeVii S660 USB' in cold state, will try to load a firmware
> [    5.236154] dvb-usb: downloading firmware from file 'dvb-usb-s660.fw'
> [    5.236157] dw2102: start downloading DW210X firmware
> [    5.390220] dvb-usb: found a 'TeVii S660 USB' in warm state.
> [    5.390437] dvb-usb: will pass the complete MPEG2 transport stream to the software demuxer.
> [    5.390831] dvbdev: DVB: registering new adapter (TeVii S660 USB)
> [    5.390837] usb 4-1: media controller created
> [    5.457940] dvb-usb: MAC address: 00:18:bd:XX:XX:XX
> [    5.458189] dvbdev: dvb_create_media_entity: media entity 'dvb-demux' registered.
> [    5.559308] dw2102: Attached ds3000+ts2020!
> [    5.559318] usb 1-1: DVB: registering adapter 1 frontend 0 (Montage Technology DS3000)...
> [    5.559327] dvbdev: dvb_create_media_entity: media entity 'Montage Technology DS3000' registered.
> [    5.560578] rc rc1: lirc_dev: driver dw2102 registered at minor = 1, scancode receiver, no transmitter
> [    5.560745] dvb-usb: schedule remote query interval to 150 msecs.
> [    5.560748] dvb-usb: TeVii S660 USB successfully initialized and connected.
> [    5.643009] dvb-usb: MAC address: 00:18:bd:XX:XX:XX
> [    5.643244] dvbdev: dvb_create_media_entity: media entity 'dvb-demux' registered.
> [    5.756627] dw2102: Attached ds3000+ts2020!
> [    5.756632] usb 4-1: DVB: registering adapter 2 frontend 0 (Montage Technology DS3000)...
> [    5.756641] dvbdev: dvb_create_media_entity: media entity 'Montage Technology DS3000' registered.
> [    5.758025] rc rc2: lirc_dev: driver dw2102 registered at minor = 2, scancode receiver, no transmitter
> [    5.758194] dvb-usb: schedule remote query interval to 150 msecs.
> [    5.758197] dvb-usb: TeVii S660 USB successfully initialized and connected.
> [   12.578584] mn88472 12-0018: downloading firmware from file 'dvb-demod-mn88472-02.fw'
> [   12.732107] ds3000_firmware_ondemand: Waiting for firmware upload (dvb-fe-ds3000.fw)...
> [   13.338071] ds3000_firmware_ondemand: Waiting for firmware upload (dvb-fe-ds3000.fw)...
> [   13.339290] ds3000_firmware_ondemand: Waiting for firmware upload (dvb-fe-ds3000.fw)...
> [   13.970274] ds3000_firmware_ondemand: Waiting for firmware upload (dvb-fe-ds3000.fw)...
> 
> The https://www.linuxtv.org/wiki/index.php/TeVii_S480 is a PCIe card
> which combines a USB host controller with two onboard TeVii s660 USB
> DVB-S2 cards.
> 
> 07:00.0 USB controller [0c03]: MosChip Semiconductor Technology Ltd. MCS9990 PCIe to 4-Port USB 2.0 Host Controller [9710:9990]
>          Subsystem: Asix Electronics Corporation (Wrong ID) Device [a000:4000]
>          Kernel driver in use: ohci-pci
>          Kernel modules: ohci_pci
> 07:00.1 USB controller [0c03]: MosChip Semiconductor Technology Ltd. MCS9990 PCIe to 4-Port USB 2.0 Host Controller [9710:9990]
>          Subsystem: Asix Electronics Corporation (Wrong ID) Device [a000:4000]
>          Kernel driver in use: ehci-pci
>          Kernel modules: ehci_pci
> 07:00.2 USB controller [0c03]: MosChip Semiconductor Technology Ltd. MCS9990 PCIe to 4-Port USB 2.0 Host Controller [9710:9990]
>          Subsystem: Asix Electronics Corporation (Wrong ID) Device [a000:4000]
>          Kernel driver in use: ohci-pci
>          Kernel modules: ohci_pci
> 07:00.3 USB controller [0c03]: MosChip Semiconductor Technology Ltd. MCS9990 PCIe to 4-Port USB 2.0 Host Controller [9710:9990]
>          Subsystem: Asix Electronics Corporation (Wrong ID) Device [a000:4000]
>          Kernel driver in use: ehci-pci
>          Kernel modules: ehci_pci
> 07:00.4 USB controller [0c03]: MosChip Semiconductor Technology Ltd. MCS9990 PCIe to 4-Port USB 2.0 Host Controller [9710:9990]
>          Subsystem: Asix Electronics Corporation (Wrong ID) Device [a000:4000]
>          Kernel driver in use: ohci-pci
>          Kernel modules: ohci_pci
> 07:00.5 USB controller [0c03]: MosChip Semiconductor Technology Ltd. MCS9990 PCIe to 4-Port USB 2.0 Host Controller [9710:9990]
>          Subsystem: Asix Electronics Corporation (Wrong ID) Device [a000:4000]
>          Kernel driver in use: ehci-pci
>          Kernel modules: ehci_pci
> 07:00.6 USB controller [0c03]: MosChip Semiconductor Technology Ltd. MCS9990 PCIe to 4-Port USB 2.0 Host Controller [9710:9990]
>          Subsystem: Asix Electronics Corporation (Wrong ID) Device [a000:4000]
>          Kernel driver in use: ohci-pci
>          Kernel modules: ohci_pci
> 07:00.7 USB controller [0c03]: MosChip Semiconductor Technology Ltd. MCS9990 PCIe to 4-Port USB 2.0 Host Controller [9710:9990]
>          Subsystem: Asix Electronics Corporation (Wrong ID) Device [a000:4000]
>          Kernel driver in use: ehci-pci
>          Kernel modules: ehci_pci
> 
> :  Bus 001.Port 001: Dev 001, Class=root_hub, Driver=ehci-pci/1p, 480M
>      |__ Port 001: Dev 003, If 0, Class=Vendor Specific Class, Driver=dw2102, 480M
> /:  Bus 002.Port 001: Dev 001, Class=root_hub, Driver=ehci-pci/1p, 480M
> /:  Bus 003.Port 001: Dev 001, Class=root_hub, Driver=ehci-pci/1p, 480M
> /:  Bus 004.Port 001: Dev 001, Class=root_hub, Driver=ehci-pci/1p, 480M
>      |__ Port 001: Dev 003, If 0, Class=Vendor Specific Class, Driver=dw2102, 480M
> 
> Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> Bus 001 Device 003: ID 9022:d660 TeVii Technology Ltd. DVB-S2 S660
> Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> Bus 004 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> Bus 004 Device 003: ID 9022:d660 TeVii Technology Ltd. DVB-S2 S660
> 
> Regards
> 	Stefan Lippers-Hollmann
> 

-- 
Thanks,
Zheng Yejian


