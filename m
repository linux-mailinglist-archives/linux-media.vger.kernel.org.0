Return-Path: <linux-media+bounces-38640-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5317CB151EB
	for <lists+linux-media@lfdr.de>; Tue, 29 Jul 2025 19:14:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 890C13BDA56
	for <lists+linux-media@lfdr.de>; Tue, 29 Jul 2025 17:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3567D29898D;
	Tue, 29 Jul 2025 17:14:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from plesk.hostmyservers.fr (plesk.hostmyservers.fr [45.145.164.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F382220F4C;
	Tue, 29 Jul 2025 17:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.145.164.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753809290; cv=none; b=FKMbaw3u37QcRRGrWGHN8dafo2abuMHdRgjCq2/2AxmlyVxnOcZP3/aRXbq+LfPeUNWvlxlVEHHD/50ch0kKvYrGysURFf8KgiH4BvH9/zGlL+cXypcS5qv74piG2SDpacO5U/SRKniwlYc8GfPm8EOaOWwlWRsX602U1NpiXQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753809290; c=relaxed/simple;
	bh=q5iOuIlBn4HB82Eph6+iP3/0eqWim6QWG2OmOiLsrzc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZkEQiEzu5IfdcdRIXeypXjvpyZ0QUKiorQchMY47tz8Fiua2KegNgbAnIG6pBjnphn7fKDQFthJLCuLSdsjMSPWxMrNpMIdMIdvb49wC3yU5VGyqqPcjU2h70H+4tXraC6icLbdJjipymZURjqKkpXjfSqqlfRM1SPklgdK4rek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com; spf=pass smtp.mailfrom=arnaud-lcm.com; arc=none smtp.client-ip=45.145.164.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arnaud-lcm.com
Received: from [IPV6:2a02:8084:255b:aa00:d071:2bab:ab9:4510] (unknown [IPv6:2a02:8084:255b:aa00:d071:2bab:ab9:4510])
	by plesk.hostmyservers.fr (Postfix) with ESMTPSA id D002F404CB;
	Tue, 29 Jul 2025 17:14:46 +0000 (UTC)
Authentication-Results: Plesk;
        spf=pass (sender IP is 2a02:8084:255b:aa00:d071:2bab:ab9:4510) smtp.mailfrom=contact@arnaud-lcm.com smtp.helo=[IPV6:2a02:8084:255b:aa00:d071:2bab:ab9:4510]
Received-SPF: pass (Plesk: connection is authenticated)
Message-ID: <c1666572-7a9b-4f25-a61a-08c96fad7a58@arnaud-lcm.com>
Date: Tue, 29 Jul 2025 18:14:44 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: dvb-usbv2: ensure safe USB transfers on
 disconnect in i2c_xfer
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzbot+0192952caa411a3be209@syzkaller.appspotmail.com,
 skhan@linuxfoundation.org
References: <20250421-ubsan-out-of-sub-v1-0-4fdeca76b906@arnaud-lcm.com>
 <20250421-ubsan-out-of-sub-v1-2-4fdeca76b906@arnaud-lcm.com>
Content-Language: en-US
From: Arnaud Lecomte <contact@arnaud-lcm.com>
In-Reply-To: <20250421-ubsan-out-of-sub-v1-2-4fdeca76b906@arnaud-lcm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <175380928730.26848.8544235230592985163@Plesk>
X-PPP-Vhost: arnaud-lcm.com

Hi Mauro, I am bumping this as you may didn't had the chance to have a look.
Cheers,
Arnaud

On 21/04/2025 17:31, Arnaud Lecomte wrote:
> Previously, there was a potential race condition where a USB transfer could
> access inconsistent data if a disconnect occurred mid-transfer.
> When this scenario happens (i.e when there is an USB disconnect during
> the transfer), we would encounter an error related to the corruption of
> st:
> [   66.967387][T10787]  slab kmalloc-8k start ffff88804f5b4000 pointer offset 80 size 8192
> [   66.968252][T10787] list_del corruption. prev->next should be ffffc9000d18f7e0, but was ffff88804f5b4050. (prev=ffff88804f5b4050)
> [   66.969443][T10787] ------------[ cut here ]------------
> [   66.969973][T10787] kernel BUG at lib/list_debug.c:64!
> [   66.970491][T10787] Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
> [   66.971104][T10787] CPU: 0 UID: 0 PID: 10787 Comm: repro Not tainted 6.15.0-rc3-00004-gcd75cc176092-dirty #28 PREEMPT(full)
> [   66.972204][T10787] Hardware name: QEMU Ubuntu 24.04 PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> [   66.973236][T10787] RIP: 0010:__list_del_entry_valid_or_report+0x15c/0x190
> [   66.973896][T10787] Code: ca da fb fc 42 80 3c 2b 00 74 08 4c 89 e7 e8 fb 29 1f fd 49 8b 14 24 48 c7 c7 a0 09 a2 8c 4c 89 fe 4c 89 e1 e8 55 43 18 fc 90 <0f> 0b 4c 89 f7 e8 9a da fb fc 42 80 3c 2b 00 74 08 4c 89 e7 e8 cb
>
> Signed-off-by: Arnaud Lecomte <contact@arnaud-lcm.com>
> ---
>   drivers/media/usb/dvb-usb-v2/az6007.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/usb/dvb-usb-v2/az6007.c b/drivers/media/usb/dvb-usb-v2/az6007.c
> index e8ee18010346..f6b8e29d19de 100644
> --- a/drivers/media/usb/dvb-usb-v2/az6007.c
> +++ b/drivers/media/usb/dvb-usb-v2/az6007.c
> @@ -752,8 +752,13 @@ static int az6007_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
>   	int length;
>   	u8 req, addr;
>   
> -	if (mutex_lock_interruptible(&st->mutex) < 0)
> +	if (!usb_trylock_device(d->udev))
> +		return -EBUSY;
> +
> +	if (mutex_lock_interruptible(&st->mutex) < 0) {
> +		usb_unlock_device(d->udev);
>   		return -EAGAIN;
> +	}
>   
>   	for (i = 0; i < num; i++) {
>   		addr = msgs[i].addr << 1;
> @@ -821,6 +826,7 @@ static int az6007_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
>   	}
>   err:
>   	mutex_unlock(&st->mutex);
> +	usb_unlock_device(d->udev);
>   	if (ret < 0) {
>   		pr_info("%s ERROR: %i\n", __func__, ret);
>   		return ret;
>

