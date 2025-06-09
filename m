Return-Path: <linux-media+bounces-34342-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D751AD1BB0
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 12:39:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F31D8188A212
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 10:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43C3A254B09;
	Mon,  9 Jun 2025 10:39:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from exchange.fintech.ru (exchange.fintech.ru [195.54.195.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D5825394C;
	Mon,  9 Jun 2025 10:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.54.195.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749465546; cv=none; b=Us2Iy3iO6SvpIPQUaMNbitOGhlhK3unaseklaPHw3IbM3wbfRS3vzj3gC0Qe2U2yZsSNkEPvnZJ931JlOfMpoHX7KUETaGn2gN8xJmhzBcNmxvBVPnPkHvByMlWKMpl7PM9NjFfgIZ6nRPVHSNZug1ITpSiDcHFxX+HTttDXGxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749465546; c=relaxed/simple;
	bh=uk1ztORRaX957Y6EZnNd9PadZAhc9xnuQ4ISbLWhOcY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=pLIMqy9f9D8cs0jqqMMz1+e1GYNru0HT2nPQuzXFMcLlobbs4NlHfv6ThzSBNkbbrmcvEasDMEWl00YbJNpTlfwtZ15InoYjmFlasO/j4YI1tST0/HDv7fC9fp81g5c52sB4jSkw9cIccFQSc/pqTvGKtmBREx0rJE4/2RHQP+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru; spf=pass smtp.mailfrom=fintech.ru; arc=none smtp.client-ip=195.54.195.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fintech.ru
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.159) with Microsoft SMTP Server (TLS) id 14.3.498.0; Mon, 9 Jun
 2025 13:38:56 +0300
Received: from [192.168.211.132] (10.0.253.138) by Ex16-01.fintech.ru
 (10.0.10.18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 9 Jun 2025
 13:38:56 +0300
Message-ID: <67ad28ff-ac6c-4a77-a507-465824312825@fintech.ru>
Date: Mon, 9 Jun 2025 13:38:56 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] media: dvb-usb-v2: disallow 0-length I2C reads
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	<syzbot+721071c10f3c7e4e5dcb@syzkaller.appspotmail.com>,
	<lvc-project@linuxtesting.org>, Alan Stern <stern@rowland.harvard.edu>,
	<gregkh@linuxfoundation.org>
References: <20250521131752.2566007-1-n.zhandarovich@fintech.ru>
 <aC3WzokLRhxJ1t9M@shikoro>
From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
Content-Language: en-US
In-Reply-To: <aC3WzokLRhxJ1t9M@shikoro>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: Ex16-02.fintech.ru (10.0.10.19) To Ex16-01.fintech.ru
 (10.0.10.18)



On 5/21/25 16:36, Wolfram Sang wrote:
> On Wed, May 21, 2025 at 04:17:49PM +0300, Nikita Zhandarovich wrote:
>> Syzkaller reported via syzbot a warning (see [1]) that occurs
>> when the fuzzer manages to craft a I2C transfer with a 0-length read
>> request. This in turn leads to an attempt at execution of a
>> USB 0-length read (which is forbidden by USB protocol) leading to
>> it being interpreted as a write.
>>
>> Enable I2C_AQ_NO_ZERO_LEN_READ adapter quirk for all devices
>> managed by dvb-usb-v2 thus forbidding 0-length read messages
>> altogether.
>>
>> [1] Syzbot report
>> usb 2-1: BOGUS control dir, pipe 80000280 doesn't match bRequestType c0
>> WARNING: CPU: 0 PID: 5845 at drivers/usb/core/urb.c:413 usb_submit_urb+0x11dd/0x18c0 drivers/usb/core/urb.c:411
>> ...
>> Call Trace:
>>  <TASK>
>>  usb_start_wait_urb+0x11a/0x530 drivers/usb/core/message.c:59
>>  usb_internal_control_msg drivers/usb/core/message.c:103 [inline]
>>  usb_control_msg+0x2b3/0x4c0 drivers/usb/core/message.c:154
>>  gl861_ctrl_msg+0x332/0x6f0 drivers/media/usb/dvb-usb-v2/gl861.c:58
>>  gl861_i2c_master_xfer+0x3b4/0x650 drivers/media/usb/dvb-usb-v2/gl861.c:144
>>  __i2c_transfer+0x859/0x2250 drivers/i2c/i2c-core-base.c:-1
>>  i2c_transfer+0x2c2/0x430 drivers/i2c/i2c-core-base.c:2315
>>  i2cdev_ioctl_rdwr+0x488/0x780 drivers/i2c/i2c-dev.c:306
>>  i2cdev_ioctl+0x78a/0xa20 drivers/i2c/i2c-dev.c:467
>>  vfs_ioctl fs/ioctl.c:51 [inline]
>>  __do_sys_ioctl fs/ioctl.c:906 [inline]
>>  __se_sys_ioctl+0xf1/0x160 fs/ioctl.c:892
>>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>>  do_syscall_64+0xf3/0x210 arch/x86/entry/syscall_64.c:94
>>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
>> ...
>>
>> Reported-by: syzbot+721071c10f3c7e4e5dcb@syzkaller.appspotmail.com
>> Closes: https://syzkaller.appspot.com/bug?extid=721071c10f3c7e4e5dcb
>> Tested-by: syzbot+721071c10f3c7e4e5dcb@syzkaller.appspotmail.com
>> Fixes: 776338e121b9 ("[PATCH] dvb: Add generalized dvb-usb driver")
>> Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
> 
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 

Gentle ping...

