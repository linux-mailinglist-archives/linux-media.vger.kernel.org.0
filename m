Return-Path: <linux-media+bounces-38866-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E14B1A67C
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 17:50:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D4A662488D
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 15:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E4A2277C81;
	Mon,  4 Aug 2025 15:46:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from plesk.hostmyservers.fr (plesk.hostmyservers.fr [45.145.164.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6DA277020;
	Mon,  4 Aug 2025 15:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.145.164.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754322392; cv=none; b=Ss0yxB2xgpXFJ2ci5R3CZWAn0lMvtPP3PkE6mfC6DqiOoTBA7vCIe7uehTKOC/0Yt14OSSgT9vKd+T2NdYUmDxt+KtcRhGckds4pAZ/VqSaxobjvPh9mP2YuFyU4Pnuo2cmypaQ+NFIeMsuVPGdHA/oBQGNQrsfXluxrtXbyC+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754322392; c=relaxed/simple;
	bh=dVzN75QKDlsF7eCY1XR+PTiDmqIMlJB7su1UVUOLEMk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=tJJqafjpSMNwNEwetmKzsp6Gi0IbKZkEF+sN4l0vlBP1JLLP5aljJ7elvcR14HxYkza2JPDTU/d7U/tL6dhNpebaUPIYa/p55YduqJh4kEmkXYWH+T9D32RfQqWrAFKDMm1ltmETEAxKxrGNvt2C2M4Upy1pbw0M4XXoA8SObuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com; spf=pass smtp.mailfrom=arnaud-lcm.com; arc=none smtp.client-ip=45.145.164.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arnaud-lcm.com
Received: from [IPV6:2a02:8084:255b:aa00:8620:1316:5a17:1036] (unknown [IPv6:2a02:8084:255b:aa00:8620:1316:5a17:1036])
	by plesk.hostmyservers.fr (Postfix) with ESMTPSA id E167040ABA;
	Mon,  4 Aug 2025 15:46:21 +0000 (UTC)
Authentication-Results: Plesk;
        spf=pass (sender IP is 2a02:8084:255b:aa00:8620:1316:5a17:1036) smtp.mailfrom=contact@arnaud-lcm.com smtp.helo=[IPV6:2a02:8084:255b:aa00:8620:1316:5a17:1036]
Received-SPF: pass (Plesk: connection is authenticated)
Message-ID: <921523bd-da2e-4ca6-b207-59668985657b@arnaud-lcm.com>
Date: Mon, 4 Aug 2025 16:46:20 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: dvb-usbv2: ensure safe USB transfers on
 disconnect in i2c_xfer
From: Arnaud Lecomte <contact@arnaud-lcm.com>
To: mchehab+huawei@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzbot+0192952caa411a3be209@syzkaller.appspotmail.com,
 skhan@linuxfoundation.org
References: <20250421-ubsan-out-of-sub-v1-0-4fdeca76b906@arnaud-lcm.com>
 <20250421-ubsan-out-of-sub-v1-2-4fdeca76b906@arnaud-lcm.com>
 <c1666572-7a9b-4f25-a61a-08c96fad7a58@arnaud-lcm.com>
Content-Language: en-US
In-Reply-To: <c1666572-7a9b-4f25-a61a-08c96fad7a58@arnaud-lcm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <175432238238.25538.3774062881455175270@Plesk>
X-PPP-Vhost: arnaud-lcm.com

I am forwarding this as I believe this is your correct new mail address.
Please let me know if this is incorrect, apologies in advance for any 
inconvenience.
Arnaud

On 29/07/2025 18:14, Arnaud Lecomte wrote:
> Hi Mauro, I am bumping this as you may didn't had the chance to have a 
> look.
> Cheers,
> Arnaud
>
> On 21/04/2025 17:31, Arnaud Lecomte wrote:
>> Previously, there was a potential race condition where a USB transfer 
>> could
>> access inconsistent data if a disconnect occurred mid-transfer.
>> When this scenario happens (i.e when there is an USB disconnect during
>> the transfer), we would encounter an error related to the corruption of
>> st:
>> [   66.967387][T10787]  slab kmalloc-8k start ffff88804f5b4000 
>> pointer offset 80 size 8192
>> [   66.968252][T10787] list_del corruption. prev->next should be 
>> ffffc9000d18f7e0, but was ffff88804f5b4050. (prev=ffff88804f5b4050)
>> [   66.969443][T10787] ------------[ cut here ]------------
>> [   66.969973][T10787] kernel BUG at lib/list_debug.c:64!
>> [   66.970491][T10787] Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
>> [   66.971104][T10787] CPU: 0 UID: 0 PID: 10787 Comm: repro Not 
>> tainted 6.15.0-rc3-00004-gcd75cc176092-dirty #28 PREEMPT(full)
>> [   66.972204][T10787] Hardware name: QEMU Ubuntu 24.04 PC (i440FX + 
>> PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
>> [   66.973236][T10787] RIP: 
>> 0010:__list_del_entry_valid_or_report+0x15c/0x190
>> [   66.973896][T10787] Code: ca da fb fc 42 80 3c 2b 00 74 08 4c 89 
>> e7 e8 fb 29 1f fd 49 8b 14 24 48 c7 c7 a0 09 a2 8c 4c 89 fe 4c 89 e1 
>> e8 55 43 18 fc 90 <0f> 0b 4c 89 f7 e8 9a da fb fc 42 80 3c 2b 00 74 
>> 08 4c 89 e7 e8 cb
>>
>> Signed-off-by: Arnaud Lecomte <contact@arnaud-lcm.com>
>> ---
>>   drivers/media/usb/dvb-usb-v2/az6007.c | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/usb/dvb-usb-v2/az6007.c 
>> b/drivers/media/usb/dvb-usb-v2/az6007.c
>> index e8ee18010346..f6b8e29d19de 100644
>> --- a/drivers/media/usb/dvb-usb-v2/az6007.c
>> +++ b/drivers/media/usb/dvb-usb-v2/az6007.c
>> @@ -752,8 +752,13 @@ static int az6007_i2c_xfer(struct i2c_adapter 
>> *adap, struct i2c_msg msgs[],
>>       int length;
>>       u8 req, addr;
>>   -    if (mutex_lock_interruptible(&st->mutex) < 0)
>> +    if (!usb_trylock_device(d->udev))
>> +        return -EBUSY;
>> +
>> +    if (mutex_lock_interruptible(&st->mutex) < 0) {
>> +        usb_unlock_device(d->udev);
>>           return -EAGAIN;
>> +    }
>>         for (i = 0; i < num; i++) {
>>           addr = msgs[i].addr << 1;
>> @@ -821,6 +826,7 @@ static int az6007_i2c_xfer(struct i2c_adapter 
>> *adap, struct i2c_msg msgs[],
>>       }
>>   err:
>>       mutex_unlock(&st->mutex);
>> +    usb_unlock_device(d->udev);
>>       if (ret < 0) {
>>           pr_info("%s ERROR: %i\n", __func__, ret);
>>           return ret;
>>

