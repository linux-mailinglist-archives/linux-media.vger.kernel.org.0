Return-Path: <linux-media+bounces-11735-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1E88CC233
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 15:34:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B57E2284A3D
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 13:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 679C81411DA;
	Wed, 22 May 2024 13:34:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from exchange.fintech.ru (exchange.fintech.ru [195.54.195.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C63140E2E;
	Wed, 22 May 2024 13:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.54.195.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716384850; cv=none; b=h8KAo9NAF6WRNGGFHxA3RH275rq0sF3faEFPG73qrulqcVH7FxblksG7Cm+iNnCjnM8tn4xRELFB/FruU7ZPax8ItKrkCIGKhN1GNF6uSfSQrXRQwJBokwIU53B4idLgBT0ON6vftrxMDxJubY/wz9GDhugPxkLUcBn+8SnLwco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716384850; c=relaxed/simple;
	bh=TZP5dNki7jTzKxJ4a7RW9CQQzhAHTIb0RYx5kkokGQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=VYJYiz5NkZp/RTChfXzpyXK6dVuPjFetpbolxnMsbXvTObRjcEDitkFlqgNVx8cXJMWK3h547K8jDIkLjWcsxEoggMgG1TBkn/nqP3I/sz/Qp8dOLPk64JOrh5zcFo8hGlfzD17ilwNspqaZ2MUuVdrmxSqp9R9eB4TNa913FyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru; spf=pass smtp.mailfrom=fintech.ru; arc=none smtp.client-ip=195.54.195.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fintech.ru
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.169) with Microsoft SMTP Server (TLS) id 14.3.498.0; Wed, 22 May
 2024 16:33:57 +0300
Received: from [192.168.211.130] (10.0.253.138) by Ex16-01.fintech.ru
 (10.0.10.18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 22 May
 2024 16:33:57 +0300
Message-ID: <5b351cfa-6537-4e3d-9d5b-0435e4eceef9@fintech.ru>
Date: Wed, 22 May 2024 06:33:57 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [staging?] [usb?] memory leak in _r8712_init_xmit_priv
 (2)
Content-Language: en-US
To: Nam Cao <namcao@linutronix.de>
CC: syzbot <syzbot+83763e624cfec6b462cb@syzkaller.appspotmail.com>,
	<Larry.Finger@lwfinger.net>, <florian.c.schilhabel@googlemail.com>,
	<gregkh@linuxfoundation.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-staging@lists.linux.dev>,
	<linux-usb@vger.kernel.org>, <syzkaller-bugs@googlegroups.com>
References: <000000000000809328060a8a4c1c@google.com>
 <20240520144641.17643-1-n.zhandarovich@fintech.ru>
 <20240520171848.60Nzvv8y@linutronix.de>
From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
In-Reply-To: <20240520171848.60Nzvv8y@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: Ex16-02.fintech.ru (10.0.10.19) To Ex16-01.fintech.ru
 (10.0.10.18)

Hi,

On 5/20/24 10:18, Nam Cao wrote:
> On Mon, May 20, 2024 at 07:46:41AM -0700, Nikita Zhandarovich wrote:
>> Hi,
>>
>>> BUG: memory leak
>>> unreferenced object 0xffff888107a5c000 (size 4096):
>>>   comm "kworker/1:0", pid 22, jiffies 4294943134 (age 18.720s)
>>>   hex dump (first 32 bytes):
>>>     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>>>     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>>>   backtrace:
>>>     [<ffffffff816337cd>] kmemleak_alloc_recursive include/linux/kmemleak.h:42 [inline]
>>>     [<ffffffff816337cd>] slab_post_alloc_hook mm/slab.h:766 [inline]
>>>     [<ffffffff816337cd>] slab_alloc_node mm/slub.c:3478 [inline]
>>>     [<ffffffff816337cd>] __kmem_cache_alloc_node+0x2dd/0x3f0 mm/slub.c:3517
>>>     [<ffffffff8157e625>] kmalloc_trace+0x25/0x90 mm/slab_common.c:1098
>>>     [<ffffffff83cee442>] kmalloc include/linux/slab.h:600 [inline]
>>>     [<ffffffff83cee442>] _r8712_init_xmit_priv+0x2b2/0x6e0 drivers/staging/rtl8712/rtl871x_xmit.c:130
>>>     [<ffffffff83ce9033>] r8712_init_drv_sw+0xc3/0x290 drivers/staging/rtl8712/os_intfs.c:311
>>>     [<ffffffff83ce7ce6>] r871xu_drv_init+0x1c6/0x920 drivers/staging/rtl8712/usb_intf.c:386
>>>     [<ffffffff832d0f0b>] usb_probe_interface+0x16b/0x3a0 drivers/usb/core/driver.c:396
>>>     [<ffffffff82c3bb06>] call_driver_probe drivers/base/dd.c:579 [inline]
>>
>> I am inclined to think that this issue might be false positive. During
>> repro the device is initialized correctly, does some work and then
>> exits, calling all required functions to clean things up
>> (i.e. _free_xmit_priv()), including pxmitbuf->pallocated_buf.
>> Kmemleak triggers disappear if you set longer intervals between
>> scannning for them (obviously). And if all the things get cleared up
>> when the device disconnects, isn't that correct and expected
>> behaviour? Could the scanner just "lose track" of some of the objects
>> here?
>>
>> Or am I missing something?
> 
> Possibly this is because the driver's probe function doesn't clean up
> itself properly if it fails in the middle (e.g. due to the system running
> out of memory and kmalloc() fails). These aren't easy to reproduce, because
> you would need to make probing fails somehow.
> 
> Example fix: ac83631230f7 ("staging: r8712: Fix memory leak in
> _r8712_init_xmit_priv()")
> 
> Best regards,
> Nam

I did some more testing with the help of reproducer from [1].
The way I see it, during repro leaks supposedly occur this way:

r871xu_drv_init() // probe starts
	...
	r8712_init_drv_sw() // success at init
	...
	/* this takes around 20-30 secs during which LEAKS appear.
	They only appear if repro tries to connect another similar
	device in a loop. With only a single iteration no leaks are
	present. */
	for (i = 0, offset = 0; i < 128; i += 8, offset++)
		r8712_efuse_pg_packet_read(padapter, offset,
				   &pdata[i]);
	...
	return 0; // probe succeeds
...
...
r871xu_dev_remove() // device starts disconnecting
	...	
	r8712_free_drv_sw()
		...
		*/ clean up all the stuff that 'leaks'
		_free_xmit_priv(&padapter->xmitpriv);
		...
	...
...

In short, I think that probe finishes fine (compared to an example you
brought up). But it is the interference from an attempt to connect a
similar device that throws off KMEMLEAK and triggers leaks. Currently I
can't figure out what exactly occurs to confuse the sanitizer.

P.S.
Test log during repro execution looks like this (please excuse some
crude and lazy debug printing on my part) with some added comments:

syz: main: finished sleeping, starting repro

// first process spawns, starts connecting device

syz: loop: pid 8532 			
[ 7420.475276][ T8518] usb 1-1: new high-speed USB device number 8 using
dummy_hcd
[ 7421.060451][ T8518] usb 1-1: New USB device found, idVendor=083a,
idProduct=c512, bcdDevice=cf.c8
[ 7421.064860][ T8518] usb 1-1: New USB device strings: Mfr=1,
Product=2, SerialNumber=3
[ 7421.068964][ T8518] usb 1-1: Product: syz
[ 7421.069828][ T8518] usb 1-1: Manufacturer: syz
[ 7421.070776][ T8518] usb 1-1: SerialNumber: syz
[ 7421.073606][ T8518] usb 1-1: config 0 descriptor??
[ 7421.109353][ T8518] r8712u: register rtl8712_netdev_ops to netdev_ops
[ 7421.110706][ T8518] usb 1-1: r8712u: USB_SPEED_HIGH with 0 endpoints
[ 7421.112160][ T8518] usb 1-1: r8712u: starting step 4 init_drv_sw
[ 7421.325368][ T8518] usb 1-1: r8712u: starting step 5 (efuze/eeprom etc)
[ 7421.545164][ T8518] usb 1-1: r8712u: Boot from EEPROM: Autoload OK
[ 7421.895138][ T8518] usb 1-1: r8712u: start read 128 efuse pg packets

// !!! syzbot repro spawns second process that tries to connect again
// while r8712_efuse_pg_packet_read() in probe() is run in a loop.

syz: loop: pid 8545

// !!! now KMEMLEAK messages appear

[ 7433.115796][ T8531] kmemleak: 12 new suspected memory leaks (see
/sys/kernel/debug/kmemleak)
BUG: memory leak
unreferenced object 0xffff88814a019000 (size 4096):
  comm "kworker/0:0", pid 8518, jiffies 4295679317
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc 0):
    [<ffffffff81687c97>] kmalloc_trace+0x297/0x310
    [<ffffffff83f45fb7>] _r8712_init_xmit_priv+0x2b7/0x700
    [<ffffffff83f40608>] r8712_init_drv_sw+0xc8/0x280
    [<ffffffff83f3f15f>] r871xu_drv_init+0x20f/0xa80
    [<ffffffff834c5a5e>] usb_probe_interface+0x16e/0x420
    [<ffffffff82dd0168>] really_probe+0x138/0x3e0
    [<ffffffff82dd04ee>] __driver_probe_device+0xce/0x1a0
    [<ffffffff82dd05ff>] driver_probe_device+0x2f/0x130
    [<ffffffff82dd0824>] __device_attach_driver+0x114/0x170
    [<ffffffff82dccdb4>] bus_for_each_drv+0xc4/0x120
    [<ffffffff82dcfef5>] __device_attach+0x165/0x260
    [<ffffffff82dce617>] bus_probe_device+0xd7/0xe0
    [<ffffffff82dcaef5>] device_add+0x935/0xc00
    [<ffffffff834c23fc>] usb_set_configuration+0x81c/0xcd0
    [<ffffffff834d64e7>] usb_generic_driver_probe+0x87/0xe0
    [<ffffffff834c37c1>] usb_probe_device+0x81/0x220

...

// but 1st process is still going, finishing probe

[ 7455.585251][ T8518] usb 1-1: r8712u: finished reading 128 packets
[ 7455.588869][ T8518] usb 1-1: r8712u: CustomerID = 0x0000
[ 7455.589726][ T8518] usb 1-1: r8712u: MAC Address from efuse =
00:e0:4c:87:00:00
[ 7455.591080][ T8518] usb 1-1: r8712u: starting to load fw
[ 7455.591994][ T8518] usb 1-1: r8712u: Loading firmware from
"rtlwifi/rtl8712u.bin"
[ 7455.594094][ T8518] usb 1-1: r8712u: r871xu_drv_init ended well as probe

// probe succeeds, device disconnects and frees all necessary objects
// the very objects at risk as KMEMLEAK sees it.

[ 7455.603027][ T8518] usb 1-1: USB disconnect, device number 8
[ 7455.604359][ T8518] r871xu_dev_remove
[ 7455.655251][ T8518] r8712_free_drv_sw
[ 7455.655910][ T8518] _free_xmit_priv

[1]
Syzbot link: https://syzkaller.appspot.com/bug?extid=83763e624cfec6b462cb
Original repro link:
https://syzkaller.appspot.com/text?tag=ReproC&x=17a7c024e80000

Best regards,
Nikita

